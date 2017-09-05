$lcp2_price = false;
$lcp3_price = false;
$price_original = 0;



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

function openPage_clear(){
    window.open("/products?commit=Search","_self")
}

function select_prev_check(id) {
    $("#" + id).prev().click();
}





$(document).ready(function () {

    $price_original = parseFloat($('#price-change').text());

    $('#lcp1').on('click', function(){
        $('#price-change').text($price_original.toFixed(2));
        $lcp2_price = false;
        $lcp3_price = false;
    });

    $('#lcp2').on('click', function(){
        price = parseFloat($('#price-change').text());

        if($lcp3_price == true && $lcp2_price == false){
            price_new = price + 9.95 - 29.95;
            $('#price-change').text(price_new.toFixed(2));
            $lcp2_price = true;
            $lcp3_price = false;
        }

        if($lcp3_price == false && $lcp2_price == false){
            price_new = price + 9.95;
            $('#price-change').text(price_new.toFixed(2));
            $lcp2_price = true;
            $lcp3_price = false;
        }

    });

    $('#lcp3').on('click', function(){
        price = parseFloat($('#price-change').text());

        if($lcp2_price == true && $lcp3_price == false){
            price_new = price + 29.95 - 9.95;
            $('#price-change').text(price_new.toFixed(2));
            $lcp3_price = true;
            $lcp2_price = false;
        }

        if($lcp2_price == false && $lcp3_price == false){
            price_new = price + 29.95;
            $('#price-change').text(price_new.toFixed(2));
            $lcp3_price = true;
            $lcp2_price = false;
        }

    });

    $('#cw1').on('click', function() {

        price = parseFloat($('#price-change').text());

        if ($('#cw1').is(':checked')) {
            price_new = price + 9.95;
            $('#price-change').text(price_new.toFixed(2));
            $price_original = $price_original + 9.95;
        } else {
            price_new = price - 9.95;
            $('#price-change').text(price_new.toFixed(2));
            $price_original = $price_original - 9.95;

        }
    });

    $('#cw2').on('click', function() {

        price = parseFloat($('#price-change').text());

        if ($('#cw2').is(':checked')) {
            price_new = price + 9.95;
            $('#price-change').text(price_new.toFixed(2));
            $price_original = $price_original + 9.95;
        } else {
            price_new = price - 9.95;
            $('#price-change').text(price_new.toFixed(2));
            $price_original = $price_original - 9.95;

        }
    });

    $('#cw3').on('click', function() {

        price = parseFloat($('#price-change').text());

        if ($('#cw3').is(':checked')) {
            price_new = price + 9.95;
            $('#price-change').text(price_new.toFixed(2));
            $price_original = $price_original + 9.95;
        } else {
            price_new = price - 9.95;
            $('#price-change').text(price_new.toFixed(2));
            $price_original = $price_original - 9.95;

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


    $('#na_men a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    });

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
        responsive:[
            {
                breakpoint: 767,
                settings:{
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
        if (clicks) {
            filterMenu.animate({
                height: "-=240",
                padding: 0
            });
        } else {
            filterMenu.animate({
                height: "+=240",
                padding: "15px 0"
            });
        }
        $(this).data("clicks", !clicks);
    });
    $('select').select2({
        minimumResultsForSearch: -1
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
            start: [200, 1300],
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
        } else {
            marginMin.innerHTML = values[handle];
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

    $('[data-toggle="tooltip"]').tooltip();
    $(function () {
        $('[data-toggle="popover"]').popover()
    })
    $(function () {
        $('[data-toggle="popover"]').popover()
    })
});
