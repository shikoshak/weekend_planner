
$(document).ready(function(){
  //this function for facebook send button :
     window.fbAsyncInit = function() {
          FB.init({
            appId      : ENV['FACEBOOKID'],
            xfbml      : true,
            version    : 'v2.0'
          });
        };
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=267503073433757&version=v2.0";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

});
