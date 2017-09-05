$(document).ready(function () {
  $(".custum-star-rating").rating({ size: 'xs', step: 1, showClear: false, showCaption: false});
  $('.custum-star-rating').on('rating.change', function(event, value, caption) {
    console.log(value);
    console.log(caption);
    var product_id = $(this).attr('id');
    $(this).rating('refresh', {displayOnly: true, showClear: false, showCaption: false});
    $.post( `/products/${product_id}/reviews`, { rating: value })
    .done(function( data ) {
      console.log(JSON.stringify(data));
    })
    .fail(function(xhr, status, error) {
      alert(xhr.responseText);
    });
  });

  $('.socialWrap a[data-remote="true"]').on('click', function(event) {
    $(this).addClass('favorite-disabled');
  });

  var productDescription = $('.descProd').contents().get(0).nodeValue;
  $("#share").jsSocials({
    shares: ["twitter", "facebook"],
    text: productDescription
  });
});
