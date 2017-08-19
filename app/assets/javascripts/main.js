function openPage(){
    window.open("/","_self")
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

    $('#changer').change(function(){
        this_url = window.location.href
        if(this_url.indexOf("sort") > 0){
             this_url = this_url.slice(0,-3)
            window.open(this_url + $(this).val(),"_self");
        }
        else {
            window.open(this_url + "&sort=" + $(this).val(),"_self");
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
    }

    if($.urlParam("sort") == 'dec'){
        document.getElementById("changer").options[1].selected = true;
    } else if($.urlParam("sort") == 'asc') {
        document.getElementById("changer").options[0].selected = true;
    }


    $('#na_men a').click(function (e) {
        e.preventDefault()
        $(this).tab('show')
    })

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
        focusOnSelect: true
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

    $("#input-id").attr({value: '3'});
    $("#input-id").rating({ size: 'xs', step: 1, showClear: false});
    $('#input-id').on('rating.change', function(event, value, caption) {
      console.log(value);
      console.log(caption);
      $('#input-id').rating('refresh', {displayOnly: true, showClear: false, showCaption: true});
    });

});
