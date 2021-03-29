let JkLogLoggingContext = {};

JkLogLoggingContext.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLogLoggingContext"] === true;
};

let JkLogLog = function() {};

JkLogLog.prototype._t = { "JkLogLog" : true };
JkLogLog.prototype._tobj = JkLogLog;

JkLogLog.NEW = function() {
	var v = new JkLogLog;
	return v.CTOR_JkLogLog();
};

JkLogLog.prototype.CTOR_JkLogLog = function() {
	return this;
};

JkLogLog.asString = function(context, value) {
	if(context != null && (JkLangStringObjectWithDebug.IS_INSTANCE && JkLangStringObjectWithDebug.IS_INSTANCE(value))) {
		return value.toStringWithDebug((context.isInDebugMode()));
	}
	return JkLangString.asString(value);
};

JkLogLog.error = function(context, message) {
	if(context != null) {
		context.logError(message);
	}
};

JkLogLog.warning = function(context, message) {
	if(context != null) {
		context.logWarning(message);
	}
};

JkLogLog.info = function(context, message) {
	if(context != null) {
		context.logInfo(message);
	}
};

JkLogLog.debug = function(context, message) {
	if(context != null) {
		context.logDebug(message);
	}
};

JkLogLog.status = function(context, message) {
	if(context != null) {
		context.logStatus(message);
	}
};

JkLogLog.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLogLog"] === true;
};
