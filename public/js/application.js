$(document).ready(function(){

  $('.postform').submit(function(e) {
    e.preventDefault();
    
    var send_data = $(this).serialize();
    
    /* ajaxify */
    $.post('/urls', send_data).done(function(returned_data) {
      returned_data = JSON.parse(returned_data);
      $(".popdown h1").html('<a href="' + returned_data["original_url"] + '">' + returned_data["original_url"] + '</a>');
      
      $('.input-url').val("http://long.er/" + returned_data["short_url"]);
      $('.popdown').effect("slide",{ direction: "up"}, 1000);
      
     });
  });
});
