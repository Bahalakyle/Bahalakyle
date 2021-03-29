let JkHttpServerServiceHTTPServerService = function() {};

JkHttpServerServiceHTTPServerService.prototype._t = { "JkHttpServerServiceHTTPServerService" : true };
JkHttpServerServiceHTTPServerService.prototype._tobj = JkHttpServerServiceHTTPServerService;

JkHttpServerServiceHTTPServerService.NEW = function() {
	var v = new JkHttpServerServiceHTTPServerService;
	return v.CTOR_JkHttpServerServiceHTTPServerService();
};

JkHttpServerServiceHTTPServerService.prototype.CTOR_JkHttpServerServiceHTTPServerService = function() {
	return this;
};

JkHttpServerServiceHTTPServerService.execute = function(ctx, rootHandler) {
	var ioManager = JkSocketIoIOManager.createDefault();
	if(!(ioManager != null)) {
		JkLogLog.error(ctx, "Failed to create IO manager");
		return false;
	}
	var server = JkHttpServerHTTPServer.NEW();
	var port = JkEnvEnvironmentVariable.get("PORT");
	if(port != null) {
		server.setPort((JkLangString.toInteger(port)));
	}
	if(rootHandler != null) {
		server.pushRequestHandler2(rootHandler);
	}
	if(!server.initialize1(ioManager, ctx)) {
		JkLogLog.error(ctx, "Failed to initialize HTTP server.");
		return false;
	}
	if(!ioManager.execute(ctx)) {
		JkLogLog.error(ctx, "Failed to execute IO manager");
		return false;
	}
	JkLogLog.info(ctx, "Successfully completed.");
	return true;
};

JkHttpServerServiceHTTPServerService.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerServiceHTTPServerService"] === true;
};
