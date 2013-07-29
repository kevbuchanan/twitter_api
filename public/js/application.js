$(document).ready(function() {
    if ($('#loading_gif').length > 0) {
      var user = $('#user').text();
      var url = "/fetch_tweets/"+ user;
      $.get(url, function(response){
          $('#loading').replaceWith($(response).filter('#tweets'));
      });
    }
});
