$(document).ready(function () {
  $(".custum-star-rating").rating({ size: 'xs', step: 1, showClear: false});
  $('.custum-star-rating').on('rating.change', function(event, value, caption) {
    console.log(value);
    console.log(caption);
    var product_id = $(this).attr('id');
    $(this).rating('refresh', {displayOnly: true, showClear: false, showCaption: true});
    $.post( `/products/${product_id}/reviews`, { rating: value })
    .done(function( data ) {
      console.log(JSON.stringify(data));
    })
    .fail(function(xhr, status, error) {
      alert(xhr.responseText);
    });
  });
});
