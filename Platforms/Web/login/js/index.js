$('.message a').click(function(){
   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
});

function authWithCredentials(username, password) {
	Parse.User.logIn(self.username, self.password, {
		success: function(user) {
	    	window.location.replace("https://music.lerigos.co");
	  	},
	  	error: function(user, error) {
	   		// The login failed. Check error to see why.
	  	}
	});
}

function registerWithCredentials() {

}