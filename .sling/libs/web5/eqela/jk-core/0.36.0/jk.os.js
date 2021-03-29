let JkOsOS = function() {};

JkOsOS.prototype._t = { "JkOsOS" : true };
JkOsOS.prototype._tobj = JkOsOS;

JkOsOS.NEW = function() {
	var v = new JkOsOS;
	return v.CTOR_JkOsOS();
};

JkOsOS.prototype.CTOR_JkOsOS = function() {
	return this;
};

JkOsOS.getCurrentPlatformName = function() {
	return "Web5";
};

JkOsOS.is32Bit = function() {
	var cpu = JkOsOS.getProcessorType();
	if(cpu == "x86" || cpu == "arm") {
		return true;
	}
	return false;
};

JkOsOS.is64Bit = function() {
	var cpu = JkOsOS.getProcessorType();
	if(cpu == "x64" || cpu == "arm64") {
		return true;
	}
	return false;
};

JkOsOS.getProcessorType = function() {
	return null;
};

JkOsOS.isWindows = function() {
	return false;
};

JkOsOS.isLinux = function() {
	return false;
};

JkOsOS.isMacOS = function() {
	return false;
};

JkOsOS.isOSX = function() {
	return JkOsOS.isMacOS();
};

JkOsOS.isAndroid = function() {
	return false;
};

JkOsOS.isIOS = function() {
	return false;
};

JkOsOS.isSystemType = function(ida) {
	var id = ida;
	if(id == "osx") {
		id = "macos";
	}
	return false;
};

JkOsOS.isDirectory = function(path) {
	if(!JkLangString.isNotEmpty(path)) {
		return false;
	}
	console.log("[jk.os.OS.isDirectory] (OS.sling:385:3): Not implemented");
	return false;
};

JkOsOS.isFile = function(path) {
	if(!JkLangString.isNotEmpty(path)) {
		return false;
	}
	console.log("[jk.os.OS.isFile] (OS.sling:423:3): Not implemented");
	return false;
};

JkOsOS.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkOsOS"] === true;
};
