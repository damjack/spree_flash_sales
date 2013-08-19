$('#cancel_link').click(function (event) {
  event.preventDefault();
  $('#new_flash_sale_link').show();
  $('#flash_sales').html('');
});