$(document).ready(function () {


    $('#na_men a').click(function (e) {
        alert("aa");
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


});

