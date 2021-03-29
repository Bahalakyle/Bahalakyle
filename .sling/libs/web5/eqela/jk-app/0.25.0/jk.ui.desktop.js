let JkUiDesktopDesktopEnvironment = function() {};

JkUiDesktopDesktopEnvironment.prototype._t = { "JkUiDesktopDesktopEnvironment" : true };
JkUiDesktopDesktopEnvironment.prototype._tobj = JkUiDesktopDesktopEnvironment;

JkUiDesktopDesktopEnvironment.NEW = function() {
	var v = new JkUiDesktopDesktopEnvironment;
	return v.CTOR_JkUiDesktopDesktopEnvironment();
};

JkUiDesktopDesktopEnvironment.prototype.CTOR_JkUiDesktopDesktopEnvironment = function() {
	return this;
};

JkUiDesktopDesktopEnvironment.openFile = function(file) {
	return false;
};

JkUiDesktopDesktopEnvironment.openURL = function(url) {
	if(!(url != null)) {
		return false;
	}
	return false;
};

JkUiDesktopDesktopEnvironment.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiDesktopDesktopEnvironment"] === true;
};
