let JkWidgetGoogleAccountLogin = function() {
	this.auth2 = null;
	this.loginCallback = null;
	this.context = null;
	this.webAppId = null;
	this.iOSClientId = null;
	this.serverClientId = null;
};

JkWidgetGoogleAccountLogin.prototype._t = { "JkWidgetGoogleAccountLogin" : true };
JkWidgetGoogleAccountLogin.prototype._tobj = JkWidgetGoogleAccountLogin;

JkWidgetGoogleAccountLogin.NEW = function() {
	var v = new JkWidgetGoogleAccountLogin;
	return v.CTOR_JkWidgetGoogleAccountLogin();
};

JkWidgetGoogleAccountLogin.prototype.CTOR_JkWidgetGoogleAccountLogin = function() {
	this.serverClientId = null;
	this.iOSClientId = null;
	this.webAppId = null;
	this.context = null;
	this.loginCallback = null;
	this.auth2 = null;
	return this;
};

JkWidgetGoogleAccountLogin.onGoogleSDKLoaded = function() {
	console.log("Google SDK loaded");
	var myObject = JkWidgetGoogleAccountLogin.loginObjectWaiting;
	gapi.load('auth2', function() {
		var auth2 = gapi.auth2.init({
			client_id: myObject.webAppId,
			cookie_policy: 'none',
			scope: 'profile email'
		});
		var self = myObject;
		auth2.currentUser.listen(function(user) {
			if(self.loginCallback) {
				self.loginCallback(user.w3.U3, user.Zi.id_token, null);
				self.loginCallback = null;
			}
		});
		myObject.auth2 = auth2;
		JkWidgetGoogleAccountLogin.sdkLoaded = true;
	});
	;
	JkWidgetGoogleAccountLogin.loginObjectWaiting = null;
};

JkWidgetGoogleAccountLogin.forApplications = function(context, webAppId, serverClientId, iosClientId) {
	var v = JkWidgetGoogleAccountLogin.NEW();
	v.setContext(context);
	v.setWebAppId(webAppId);
	v.setIOSClientId(iosClientId);
	v.setServerClientId(serverClientId);
	if(JkWidgetGoogleAccountLogin.sdkIncluded == false) {
		JkWidgetGoogleAccountLogin.loginObjectWaiting = v;
		var cc = JkUiHTMLDOM.createElement("script");
		JkUiHTMLDOM.setTextContent(cc, "function onLoadedComplete() { JkWidgetGoogleAccountLogin.onGoogleSDKLoaded(); }");
		JkUiHTMLDOM.appendChild((JkUiHTMLDOM.getDocumentBody()), cc);
		var ss = JkUiHTMLDOM.createElement("script");
		JkUiHTMLDOM.setAttribute(ss, "src", "https://apis.google.com/js/platform.js?onload=onLoadedComplete");
		JkUiHTMLDOM.setAttribute(ss, "async", "");
		JkUiHTMLDOM.setAttribute(ss, "defer", "");
		JkUiHTMLDOM.appendChild((JkUiHTMLDOM.getDocumentBody()), ss);
		JkWidgetGoogleAccountLogin.sdkIncluded = true;
	}
	return v;
};

JkWidgetGoogleAccountLogin.prototype.execute = function(widget, callback) {
	var cb = callback;
	if(JkWidgetGoogleAccountLogin.sdkLoaded == false) {
		if(callback != null) {
			callback(null, null, (JkLangError.forCode("googleError", "Google+ SDK is not yet loaded. Please try again momentarily.")));
		}
		return;
	}
	this.loginCallback = callback;
	this.auth2.signIn();
	;
	return;
};

JkWidgetGoogleAccountLogin.prototype.logout = function() {
	if(JkWidgetGoogleAccountLogin.sdkLoaded) {
		this.auth2.disconnect();
		this.auth2.signOut();
		;
	}
};

JkWidgetGoogleAccountLogin.prototype.getContext = function() {
	return this.context;
};

JkWidgetGoogleAccountLogin.prototype.setContext = function(v) {
	this.context = v;
	return this;
};

JkWidgetGoogleAccountLogin.prototype.getWebAppId = function() {
	return this.webAppId;
};

JkWidgetGoogleAccountLogin.prototype.setWebAppId = function(v) {
	this.webAppId = v;
	return this;
};

JkWidgetGoogleAccountLogin.prototype.getIOSClientId = function() {
	return this.iOSClientId;
};

JkWidgetGoogleAccountLogin.prototype.setIOSClientId = function(v) {
	this.iOSClientId = v;
	return this;
};

JkWidgetGoogleAccountLogin.prototype.getServerClientId = function() {
	return this.serverClientId;
};

JkWidgetGoogleAccountLogin.prototype.setServerClientId = function(v) {
	this.serverClientId = v;
	return this;
};

JkWidgetGoogleAccountLogin.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetGoogleAccountLogin"] === true;
};

JkWidgetGoogleAccountLogin.sdkIncluded = false;
JkWidgetGoogleAccountLogin.sdkLoaded = false;
JkWidgetGoogleAccountLogin.loginObjectWaiting = null;
