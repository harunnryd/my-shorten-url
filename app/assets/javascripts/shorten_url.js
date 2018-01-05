$(document).ready(function() {

  $('#field_custom').hide();

  $("#shorten_url_custom").on("change",function() {
      var status = $(this).prop('checked');
      if (status) {
        $('#field_custom').show();
      } else {
        $('#field_custom').hide();
      }
      $('#shorten_url_shorten').val('')
  });

});
