$lcp2_price = false;
$lcp3_price = false;
$price_original = 0;
$is_shipping = true;


function openPage(){
    window.open("/","_self")
}

function openPrevProduct(prod){
    window.open("/products/" + prod, "_self")
}

function openPrevPre(prod){
    window.open("/prescription", "_self")
}

function openPage_mens(){
  window.open("/products?utf8=✓&q[category_in][]=men&commit=Search","_self")
}

function openPage_womens(){
    window.open("/products?utf8=✓&q[category_in][]=women&commit=Search","_self")
}

function openPage_kids(){
    window.open("/products?utf8=✓&q[category_in][]=kids&commit=Search","_self")
}

function openPage_mens_eyeglasses(){
    window.open("/products?utf8=✓&q[category_in][]=men&q[subcategory_in][]=eyeglasses&commit=Search","_self")
}

function openPage_mens_preglasses(){
    window.open("/products?utf8=✓&q[category_in][]=men&q[subcategory_in][]=preglasses&commit=Search","_self")
}

function openPage_mens_sunglasses(){
    window.open("/products?utf8=✓&q[category_in][]=men&q[subcategory_in][]=sunglasses&commit=Search","_self")
}

function openPage_mens_powerglasses(){
    window.open("/products?utf8=✓&q[category_in][]=men&q[subcategory_in][]=powerglasses&commit=Search","_self")
}

function openPage_wishlist(){
    window.open("/products/favorites","_self")
}

function openPage_clear(){
    window.open("/products?commit=Search","_self")
}

function openPage_shipping(){
    window.open("/checkouts/new","_self")
}

function openPage_helpcenter(){
    window.open("/help-center","_self")
}

function openPage_return_policy(){
    window.open("/return-policy","_self")
}

function select_prev_check(id) {
    $("#" + id).prev().click();
}



function pres_selection(e){
    if (!$('#lcp3').is(':checked') && !$('#lcp2').is(':checked') && !$('#lcp1').is(':checked')) {

        e.stopImmediatePropagation();
        e.preventDefault();


        swal("", "Please select a lense type", "warning");

    }

}

/*
function warnBeforeRedirect(e) {


    if (do_something === true) {

        e.stopImmediatePropagation();
        e.preventDefault();


        swal({
            title: "Are you sure?",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                do_something = false;
                $(e.target).click();
            }
        }
    );

    }

}
*/

$(document).on('ready', function () {




    $('.pagination').hide();

    var isLoading = false;
        $(window).on('scroll', function() {
            var more_posts_url = $('.pagination a.next_page').attr('href');
            if (!isLoading && more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
                isLoading = true;

                $.ajax({
                    url: more_posts_url,
                    type: 'GET',
                    dataType: 'script',
                    success: function(data){
                        $('footer').hide();
                    },
                    error: function(){
                    }

                });

                //$.getScript(more_posts_url).done(function (data,textStatus,jqxhr) {
                //    isLoading = false;
                //}).fail(function() {
                //    isLoading = false;
                //});
            }
        });


    jQuery.validator.addMethod("cdnPostal", function(postal, element) {
        return this.optional(element) ||
            postal.match(/[a-zA-Z][0-9][a-zA-Z](-| |)[0-9][a-zA-Z][0-9]/);
    }, "Please specify a valid postal code.");



    $('#shipping_address_shipping_province').on('change', function(){
        $.ajax({
            type: "GET",
            url: "/cities",
            data:'country_id='+ $(this).find("option:selected").text(),
            success: function(data){
                $("#shipping_address_shipping_city").empty();
                $.each(data, function(key, value) {
                    var option = $('<option></option>').attr("value", value).text(value);
                    $("#shipping_address_shipping_city").append(option);
                });
            }
        });
    });

    $('#shipping_address_province').on('change', function(){
        $.ajax({
            type: "GET",
            url: "/cities",
            data:'country_id='+ $(this).find("option:selected").text(),
            success: function(data){
                $("#shipping_address_city").empty();
                $.each(data, function(key, value) {
                    var option = $('<option></option>').attr("value", value).text(value);
                    $("#shipping_address_city").append(option);
                });
            }
        });
    });

    $(document).click(function(e) {
        if( e.target.id != 'cartclick'){
            if($('.shopping-cart').css("display") == "block"){
                $(".shopping-cart").fadeToggle( "fast");
            }
        }
    });



    $("#cartclick").on("click", function() {

        if ($(window).width() > 960) {
            $(".shopping-cart").fadeToggle( "fast");
        }
        else {
            window.open("/cart","_self")
        }
    });

    do_something = true;

    $("#nav-logout").click(function(e) {

    });

    jQuery.validator.addMethod('phonePK', function(phone_number, element) {
        phone_number = phone_number.replace(/\s+/g, '');
        return this.optional(element) || phone_number.match(/^(\+?1-?)?(\([2-9]([02-9]\d|1[02-9])\)|[2-9]([02-9]\d|1[02-9]))-?[2-9]([02-9]\d|1[02-9])-?\d{4}$/);
    }, 'Please specify a valid phone number');


    $('#new_shipping_address').validate({
        rules: {
            "shipping_address[first_name]": {
                minlength: 2,
                required: true
            },
            "shipping_address[last_name]": {
                minlength: 2,
                required: true
            },
            "shipping_address[email]": {
                required: true,
                email: true
            },
            "shipping_address[address]": {
                required: true
            },"shipping_address[postal_code]": {
                required: true,
                cdnPostal: true
            },
            "shipping_address[phone_number]": {
                minlength:10,
                phonePK: true
            },
            "shipping_address[shipping_address]": {
                required: $is_shipping
            },
            "shipping_address[shipping_postal_code]": {
                required: $is_shipping
            }

        },highlight: function (element) {
            $(element).addClass('my-error-class')
        },
        submitHandler: function(form) {
            form.submit();
        }
    });

    $('.edit_shipping_address').validate({
        rules: {
            "shipping_address[first_name]": {
                minlength: 2,
                required: true
            },
            "shipping_address[last_name]": {
                minlength: 2,
                required: true
            },
            "shipping_address[email]": {
                required: true,
                email: true
            },
            "shipping_address[address]": {
                required: true
            },"shipping_address[postal_code]": {
                required: true,
                cdnPostal: true
            },
            "shipping_address[phone_number]": {
                required: true,
                minlength:10,
                phonePK: true
            },
            "shipping_address[shipping_address]": {
                required: $is_shipping
            },
            "shipping_address[shipping_postal_code]": {
                required: $is_shipping
            }

        },highlight: function (element) {
            $(element).addClass('my-error-class')
        },
        submitHandler: function(form) {
            form.submit();
        }
    });


    if($('#lcp2').is(':checked')){
        $lcp2_price = true;
    }

    if($('#lcp3').is(':checked')){
        $lcp3_price = true;
    }


    $("#cnf1").on('click', function(){


        $( "#shipping_address_shipping_address" ).prop( "disabled", false );
        $( "#shipping_address_shipping_postal_code" ).prop( "disabled", false );
        $( "#shipping_address_shipping_country" ).prop( "disabled", false );
        $( "#shipping_address_shipping_province" ).prop( "disabled", false );
        $( "#shipping_address_shipping_city" ).prop( "disabled", false );
        $is_shipping = true

        if($('#cnf1').is(':checked')){
            $( "#shipping_address_shipping_address" ).prop( "disabled", true );
            $( "#shipping_address_shipping_postal_code" ).prop( "disabled", true );
            $( "#shipping_address_shipping_country" ).prop( "disabled", true );
            $( "#shipping_address_shipping_province" ).prop( "disabled", true );
            $( "#shipping_address_shipping_city" ).prop( "disabled", true );
            $is_shipping = false
        }


    });



    $price_original = parseFloat($('#price-change').text());


    $('#presciption_total_cost').val($('#price-change').text());

    $('#lcp1').on('click', function(){
        price = parseFloat($('#price-change').text());

        if($lcp3_price == true && $lcp2_price == false){
            price_new = price - 29.95;
            $('#price-change').text(price_new.toFixed(2));
            $lcp2_price = false;
            $lcp3_price = false;
            $('#presciption_total_cost').val($('#price-change').text());
        }

        if($lcp3_price == false && $lcp2_price == true){
            price_new = price - 9.95;
            $('#price-change').text(price_new.toFixed(2));
            $lcp2_price = false;
            $lcp3_price = false;
            $('#presciption_total_cost').val($('#price-change').text());
        }
    });

    $('#lcp2').on('click', function(){
        price = parseFloat($('#price-change').text());

        if($lcp3_price == true && $lcp2_price == false){
            price_new = price + 9.95 - 29.95;
            $('#price-change').text(price_new.toFixed(2));
            $lcp2_price = true;
            $lcp3_price = false;
            $('#presciption_total_cost').val($('#price-change').text());
        }

        if($lcp3_price == false && $lcp2_price == false){
            price_new = price + 9.95;
            $('#price-change').text(price_new.toFixed(2));
            $lcp2_price = true;
            $lcp3_price = false;
            $('#presciption_total_cost').val($('#price-change').text());
        }

    });

    $('#lcp3').on('click', function(){
        price = parseFloat($('#price-change').text());

        if($lcp2_price == true && $lcp3_price == false){
            price_new = price + 29.95 - 9.95;
            $('#price-change').text(price_new.toFixed(2));
            $lcp3_price = true;
            $lcp2_price = false;
            $('#presciption_total_cost').val($('#price-change').text());
        }

        if($lcp2_price == false && $lcp3_price == false){
            price_new = price + 29.95;
            $('#price-change').text(price_new.toFixed(2));
            $lcp3_price = true;
            $lcp2_price = false;
            $('#presciption_total_cost').val($('#price-change').text());
        }

    });

    $('#cw1').on('click', function() {

        price = parseFloat($('#price-change').text());

        if ($('#cw1').is(':checked')) {
            price_new = price + 9.95;
            $('#price-change').text(price_new.toFixed(2));
            $price_original = $price_original + 9.95;
            $('#presciption_total_cost').val($('#price-change').text());
        } else {
            price_new = price - 9.95;
            $('#price-change').text(price_new.toFixed(2));
            $price_original = $price_original - 9.95;
            $('#presciption_total_cost').val($('#price-change').text());

        }
    });

    $('#cw2').on('click', function() {

        price = parseFloat($('#price-change').text());

        if ($('#cw2').is(':checked')) {
            price_new = price + 9.95;
            $('#price-change').text(price_new.toFixed(2));
            $price_original = $price_original + 9.95;
            $('#presciption_total_cost').val($('#price-change').text());
        } else {
            price_new = price - 9.95;
            $('#price-change').text(price_new.toFixed(2));
            $price_original = $price_original - 9.95;
            $('#presciption_total_cost').val($('#price-change').text());

        }
    });

    $('#cw3').on('click', function() {

        price = parseFloat($('#price-change').text());

        if ($('#cw3').is(':checked')) {
            price_new = price + 9.95;
            $('#price-change').text(price_new.toFixed(2));
            $price_original = $price_original + 9.95;
            $('#presciption_total_cost').val($('#price-change').text());
        } else {
            price_new = price - 9.95;
            $('#price-change').text(price_new.toFixed(2));
            $price_original = $price_original - 9.95;
            $('#presciption_total_cost').val($('#price-change').text());

        }
    });



    $('#changer').change(function(){
        this_url = window.location.href;

        if(this_url.indexOf("?") > 0) {

            if (this_url.indexOf("sort") > 0) {
                this_url = this_url.slice(0, -3);
                window.open(this_url + $(this).val(), "_self");
            }
            else {
                window.open(this_url + "&sort=" + $(this).val(), "_self");
            }

        }

        else {
            window.open(this_url + "?sort=" + $(this).val(), "_self");
        }

    });

    $.urlParam = function(name){
        var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
        if (results==null){
            return null;
        }
        else{
            return decodeURI(results[1]) || 0;
        }
    };

    if($.urlParam("sort") == 'dec'){
        document.getElementById("changer").options[1].selected = true;
    } else if($.urlParam("sort") == 'asc') {
        document.getElementById("changer").options[0].selected = true;
    }


    $('#myTab a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    });

    $('.tabbable .tab-pane a').unbind();

    $(".gscSlider").slick({
        dots: false,
        infinite: true,
        speed: 300,
        slidesToShow: 4,
        slidesToScroll: 4,
        responsive: [
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 3
                }
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    });
    $(".productDescWrap").slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        asNavFor: '.slider-nav'
    });
    $('.slider-nav').slick({
        slidesToShow: 6,
        slidesToScroll: 1,
        asNavFor: '.productDescWrap',
        centerMode: true,
        focusOnSelect: true,
        responsive: [
            {
                breakpoint: 767,
                settings: {
                    slidesToShow: 1
                }
            }
        ]
    });
    var $grid = $('.filterByTypeWrapper').isotope({
        // options...
        itemSelector: '.glassesShowCase'
    });
    $('.filterButtons li a').on('click', function () {
        var filterValue = $(this).attr('data-filter');
        $grid.isotope({filter: filterValue});
    });
    var fixedNavBar = $(".navbar");
    jQuery(fixedNavBar).wrap('<div class="placeholder" ></div>');
    jQuery("div.placeholder").height(jQuery(fixedNavBar).outerHeight());
    $('#filterMenuBtn').click(function () {
        var clicks = $(this).data('clicks');
        var filterMenu = $(".filterOptions");
        var winWidth = $(window).width();
        if(winWidth <= 991){
            if (clicks) {
                filterMenu.animate({
                    height: "-=300",
                    padding: 0
                });
            } else {
                filterMenu.animate({
                    height: "+=300",
                    padding: "15px 0"
                });
            }
        }
        else{
            if (clicks) {
                filterMenu.animate({
                    height: "-=250",
                    padding: 0
                });
            } else {
                filterMenu.animate({
                    height: "+=250",
                    padding: "15px 0"
                });
            }
        }
        $(this).data("clicks", !clicks);
    });
    $('select').select2({
        minimumResultsForSearch: -1
    });
    $(".htSearchField .fa-search").click(function() {
        var clicks = $(this).data('clicks');
        if (clicks) {
            // odd clicks
            $(".htSearchField input").animate({
                "width": 0,
                "padding": 0
            });
        } else {
            // even clicks
            $(".htSearchField input").animate({
                "width": 100,
                "padding": 5
            });
        }
        $(this).data("clicks", !clicks);
    });
    jQuery('.panel-heading a').click(function() {
        $('.panel-heading').removeClass('active');
        $(this).parents('.panel-heading').addClass('active');
    });
});
$(function () {
    $(document).scroll(function () {
        if ($(this).scrollTop() >= 31) {
            $(".navbar").addClass("fixedtop");
        } else {
            $(".navbar").removeClass("fixedtop");
        }
    });

    var nonLinearSlider = document.getElementById('nonlinear');

    if(nonLinearSlider != null) {
        noUiSlider.create(nonLinearSlider, {
            connect: true,
            behaviour: 'tap',
            start: [0, 1300],
            range: {
                'min': [0],
                'max': [1500]
            }
        });


    var marginMin = document.getElementById('slider-margin-value-min'),
        marginMax = document.getElementById('slider-margin-value-max');

    nonLinearSlider.noUiSlider.on('update', function (values, handle) {
        if (handle) {
            marginMax.innerHTML = values[handle];
            $('#q_price_lteq').val(marginMax.innerHTML);
        } else {
            marginMin.innerHTML = values[handle];
            $('#q_price_gteq').val(marginMin.innerHTML);
        }
    });
    }

    $(".productDescWrap .glassInfoWrap img").mlens(
        {
            lensShape: "circle",                // shape of the lens (circle/square)
            lensSize: ["200px","200px"],            // lens dimensions (in px or in % with respect to image dimensions)
            borderSize: 4,                  // size of the lens border (in px)
            borderColor: "#fff",            // color of the lens border (#hex)
            borderRadius: 0,                // border radius (optional, only if the shape is square)
            overlayAdapt: true,    // true if the overlay image has to adapt to the lens size (boolean)
            zoomLevel: 1,          // zoom level multiplicator (number)
            responsive: true       // true if mlens has to be responsive (boolean)
        });


});


$(document).ready(function(){

    //Check to see if the window is top if not then display button
    $(window).scroll(function(){
        if ($(this).scrollTop() > 200) {

            $('.scrolltop').fadeIn('slow');
        } else {

            $('.scrolltop').fadeOut('slow');
        }
    });

    //Click event to scroll to top
    $('.scrolltop').click(function(){
        $('html, body').animate({scrollTop : 0},800);
        $('.scrolltop').fadeOut('slow');
    });

});
