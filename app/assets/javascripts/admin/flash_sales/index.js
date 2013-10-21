$(document).ready(function(){

  $('#new_flash_sale_link').click(function (event) {
    event.preventDefault();
    $(this).hide();
    $.ajax({type: 'GET', url: this.href, data: ({authenticity_token: AUTH_TOKEN}),
            success: function(r){ $('#flash_sales').html(r);} });
  });
});