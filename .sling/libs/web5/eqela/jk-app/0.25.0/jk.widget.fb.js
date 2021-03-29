let JkWidgetFbLogin = function() {
	this.context = null;
	this.webAppId = null;
};

JkWidgetFbLogin.prototype._t = { "JkWidgetFbLogin" : true };
JkWidgetFbLogin.prototype._tobj = JkWidgetFbLogin;

JkWidgetFbLogin.NEW = function() {
	var v = new JkWidgetFbLogin;
	return v.CTOR_JkWidgetFbLogin();
};

JkWidgetFbLogin.prototype.CTOR_JkWidgetFbLogin = function() {
	this.webAppId = null;
	this.context = null;
	return this;
};

JkWidgetFbLogin.forApplications = function(context, webAppId) {
	var v = JkWidgetFbLogin.NEW();
	v.setContext(context);
	v.setWebAppId(webAppId);
	if(!v.initialize()) {
		v = null;
	}
	return v;
};

JkWidgetFbLogin.prototype.initialize = function() {
	if(JkWidgetFbLogin.sdkIncluded == false) {
		var myObject = this;
		window.fbAsyncInit = function() {
			FB.init({
				appId : myObject.webAppId,
				version : "v2.8"
			});
			console.log("On Facebook SDK loaded");
			JkWidgetFbLogin.sdkLoaded = true;
		};
		(function(d, s, id){
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {return;}
		js = d.createElement(s); js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	;
	JkWidgetFbLogin.sdkIncluded = true;
}
return true;
};

JkWidgetFbLogin.prototype.execute = function(widget, callback) {
	var cb = callback;
	if(JkWidgetFbLogin.sdkLoaded == false) {
		if(callback != null) {
			callback(null, null, (JkLangError.forCode("facebookError", "Facebook SDK is not yet loaded. Please try again momentarily.")));
		}
		return;
	}
	FB.login(function(response) {
		if(response.status === 'connected') {
			if(response.authResponse.grantedScopes.indexOf("email") < 0) {
				alert("Email address is required");
			}
			else if(response.authResponse.grantedScopes.indexOf("public_profile") < 0) {
				alert("User profile is required");
			}
			else {
				callback(response.authResponse.userID, response.authResponse.accessToken, null);
			}
		}
	}, {
		scope : 'public_profile,email',
		auth_type : 'rerequest',
		return_scopes : 'true'
	});
	;
	return;
};

JkWidgetFbLogin.prototype.getContext = function() {
	return this.context;
};

JkWidgetFbLogin.prototype.setContext = function(v) {
	this.context = v;
	return this;
};

JkWidgetFbLogin.prototype.getWebAppId = function() {
	return this.webAppId;
};

JkWidgetFbLogin.prototype.setWebAppId = function(v) {
	this.webAppId = v;
	return this;
};

JkWidgetFbLogin.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetFbLogin"] === true;
};

JkWidgetFbLogin.sdkIncluded = false;
JkWidgetFbLogin.sdkLoaded = false;
