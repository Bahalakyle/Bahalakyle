let JkUiNotificationNotification = function() {
	this.context = null;
};

JkUiNotificationNotification.prototype._t = { "JkUiNotificationNotification" : true };
JkUiNotificationNotification.prototype._tobj = JkUiNotificationNotification;

JkUiNotificationNotification.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkUiNotificationNotification;
	return v.CTOR_JkUiNotificationNotification_JkUiGuiApplicationContext(context);
};

JkUiNotificationNotification.prototype.CTOR_JkUiNotificationNotification_JkUiGuiApplicationContext = function(context) {
	this.context = null;
	this.context = context;
	return this;
};

JkUiNotificationNotification.prototype.show = function(title, message) {
	var t = title;
	if(JkLangString.isEmpty(t)) {
		t = "Notification";
	}
	if(JkLangString.isEmpty(message)) {
		return false;
	}
	console.log("[jk.ui.notification.Notification.show] (Notification.sling:190:3): Not implemented.");
	return false;
};

JkUiNotificationNotification.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiNotificationNotification"] === true;
};
