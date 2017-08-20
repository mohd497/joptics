$(document).ready(function () {

  $.ajax({
    type: "GET",
    url: "/products/3/reviews",
    dataType: "json",
    success: function(data){
      $("#input-id").attr({value: data.rating || '0'});
      $("#input-id").rating({ size: 'xs', step: 1, showClear: false});
      $('#input-id').on('rating.change', function(event, value, caption) {
        console.log(value);
        console.log(caption);
        var product_id = $('#input-id').attr('data-product-id');
        $('#input-id').rating('refresh', {displayOnly: true, showClear: false, showCaption: true});
        $.post( `/products/${product_id}/reviews`, { rating: value })
        .done(function( data ) {
          console.log(JSON.stringify(data));
          // alert( "Data Loaded: " + data.rating );
        })
        .fail(function(xhr, status, error) {
          alert(xhr.responseText);
        });
      });
    }
  });

});
