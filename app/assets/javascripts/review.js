$(document).ready(function () {

  $.ajax({
    type: "GET",
    url: "/products/5/reviews",
    dataType: "json",
    success: function(data){
      $("#input-id").attr({value: data.rating || '0'});
      $("#input-id").rating({ size: 'xs', step: 1, showClear: false});
      $('#input-id').on('rating.change', function(event, value, caption) {
        console.log(value);
        console.log(caption);
        var product_id = $('#input-id').attr('data-product-id');
        $('#input-id').rating('refresh', {displayOnly: true, showClear: false, showCaption: true});
        $.post( `/products/${product_id}/reviews`, { rating: 5 })
        .done(function( data ) {
          alert( "Data Loaded: " + data.msg );
        });
      });
    }
  });

});
