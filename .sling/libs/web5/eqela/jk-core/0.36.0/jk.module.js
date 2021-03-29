let JkModuleDynamicModule = function() {};

JkModuleDynamicModule.prototype._t = { "JkModuleDynamicModule" : true };
JkModuleDynamicModule.prototype._tobj = JkModuleDynamicModule;

JkModuleDynamicModule.NEW = function() {
	var v = new JkModuleDynamicModule;
	return v.CTOR_JkModuleDynamicModule();
};

JkModuleDynamicModule.prototype.CTOR_JkModuleDynamicModule = function() {
	return this;
};

JkModuleDynamicModule.forFile = function(ctx, file) {
	var v = JkModuleDynamicModule.NEW();
	if(v.loadFile(ctx, file) == false) {
		v = null;
	}
	return v;
};

JkModuleDynamicModule.forObject = function(ctx, oo) {
	if(!(oo != null)) {
		return null;
	}
	console.log("[jk.module.DynamicModule.forObject] (DynamicModule.sling:71:3): Not implemented.");
	return null;
};

JkModuleDynamicModule.isModuleFile = function(ctx, file) {
	if(!(file != null)) {
		return false;
	}
	return false;
};

JkModuleDynamicModule.prototype.getModuleDescription = function() {
	return "builtin";
};

JkModuleDynamicModule.prototype.loadFile = function(ctx, file) {
	if(!(file != null)) {
		ctx.logError("DynamicModule" + (": Null file"));
		return false;
	}
	if(!file.isFile()) {
		ctx.logError("DynamicModule" + (": Not a file: `") + (JkLangString.safeString((file.getPath()))) + ("'"));
		return false;
	}
	ctx.logDebug("Loading dynamic module: `" + (JkLangString.safeString((file.getPath()))) + ("'"));
	console.log("[jk.module.DynamicModule.loadFile] (DynamicModule.sling:162:3): Not implemented.");
	return false;
};

JkModuleDynamicModule.prototype.executeStaticMethod = function(ctx, entityName, methodName, parameters) {
	console.log("[jk.module.DynamicModule.executeStaticMethod] (DynamicModule.sling:245:3): Not implemented.");
	return false;
};

JkModuleDynamicModule.prototype.createObject = function(ctx, className) {
	console.log("[jk.module.DynamicModule.createObject] (DynamicModule.sling:318:3): Not implemented.");
	return null;
};

JkModuleDynamicModule.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkModuleDynamicModule"] === true;
};
