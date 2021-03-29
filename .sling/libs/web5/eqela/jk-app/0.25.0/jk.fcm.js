let JkFcmFCMTokenManager = function() {};

JkFcmFCMTokenManager.prototype._t = { "JkFcmFCMTokenManager" : true };
JkFcmFCMTokenManager.prototype._tobj = JkFcmFCMTokenManager;

JkFcmFCMTokenManager.NEW = function() {
	var v = new JkFcmFCMTokenManager;
	return v.CTOR_JkFcmFCMTokenManager();
};

JkFcmFCMTokenManager.prototype.CTOR_JkFcmFCMTokenManager = function() {
	return this;
};

JkFcmFCMTokenManager.onNewFCMToken = function(newToken) {
	JkFcmFCMTokenManager.token = newToken;
};

JkFcmFCMTokenManager.checkForToken = function() {
	console.log("[jk.fcm.FCMTokenManager.checkForToken] (FCMTokenManager.sling:104:3): Not yet implemented.");
	return JkFcmFCMTokenManager.token;
};

JkFcmFCMTokenManager.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkFcmFCMTokenManager"] === true;
};

JkFcmFCMTokenManager.token = null;

let JkFcmFCMWebPush = function() {};

JkFcmFCMWebPush.prototype._t = { "JkFcmFCMWebPush" : true };
JkFcmFCMWebPush.prototype._tobj = JkFcmFCMWebPush;

JkFcmFCMWebPush.NEW = function() {
	var v = new JkFcmFCMWebPush;
	return v.CTOR_JkFcmFCMWebPush();
};

JkFcmFCMWebPush.prototype.CTOR_JkFcmFCMWebPush = function() {
	return this;
};

JkFcmFCMWebPush.onMessage = function(data) {
	if(!(JkFcmFCMWebPush.screen != null)) {
		return;
	}
	JkFcmFCMWebPush.screen.onStartScreenWithData(((function(o) {
		if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((JkJsonJSONParser.parseString(data)))));
};

JkFcmFCMWebPush.onFCMTokenReceived = function(newToken) {
	JkFcmFCMTokenManager.onNewFCMToken(newToken);
	if(JkFcmFCMWebPush.listener != null) {
		JkFcmFCMWebPush.listener.onFCMTokenReceived(newToken);
	}
};

JkFcmFCMWebPush.getFcmPublicVapidKey = function() {
	return JkFcmFCMWebPush.fcmPublicVapidKey;
};

JkFcmFCMWebPush.initialize = function(key, sc, l) {
	JkFcmFCMWebPush.fcmPublicVapidKey = key;
	JkFcmFCMWebPush.screen = sc;
	JkFcmFCMWebPush.listener = l;
	const messaging = firebase.messaging();
	messaging.usePublicVapidKey(JkUtilFcmFCMWebPush.getFcmPublicVapidKey());
	messaging.requestPermission()
	.then(function() {
		return messaging.getToken();
	})
	.then(function(token) {
		JkUtilFcmFCMWebPush.onFCMTokenReceived(token);
	})
	.catch(function(error) {
		console.log(error);
	});
	messaging.onTokenRefresh(function() {
		messaging.getToken().then(function(refreshedToken) {
			JkUtilFcmFCMWebPush.onFCMTokenReceived(refreshedToken);
		}).catch(function(err) {
			console.log(error);
		});
	});
	messaging.onMessage(function(payload) {
		JkUtilFcmFCMWebPush.onMessage(JSON.stringify(payload));
	});
	if('serviceWorker' in navigator) {
		navigator.serviceWorker.onmessage = function(evt) {
			try {
				JkUtilFcmFCMWebPush.onMessage(JSON.stringify(evt.data.FCM_MSG));
			}
			catch(e) {
			}
		};
	}
	;
};

JkFcmFCMWebPush.isBrowserSupported = function() {
	if(JkUiHTMLDOM.isSafari() || JkUiHTMLDOM.isInternetExplorer()) {
		return false;
	}
	return true;
};

JkFcmFCMWebPush.isNotificationPermissionAllowed = function() {
	if ("Notification" in window) {
		if (Notification.permission === "granted" && firebase.messaging.isSupported()) {
			return true
		}
	}
	;
	return false;
};

JkFcmFCMWebPush.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkFcmFCMWebPush"] === true;
};

JkFcmFCMWebPush.fcmPublicVapidKey = null;
JkFcmFCMWebPush.listener = null;
JkFcmFCMWebPush.screen = null;
let JkFcmFCMWebPushListener = {};

JkFcmFCMWebPushListener.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkFcmFCMWebPushListener"] === true;
};
