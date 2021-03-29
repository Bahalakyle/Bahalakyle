let JkScriptScript = function() {
	this.entryPoints = null;
	this.ctx = null;
};

JkScriptScript.prototype._t = { "JkScriptScript" : true };
JkScriptScript.prototype._tobj = JkScriptScript;

JkScriptScript.NEW = function() {
	var v = new JkScriptScript;
	return v.CTOR_JkScriptScript();
};

JkScriptScript.prototype.CTOR_JkScriptScript = function() {
	this.ctx = null;
	this.entryPoints = null;
	JkFsCurrentDirectory.set((JkEnvCommonPath.getAppDirectory()));
	this.ctx = JkConsoleConsoleApplicationContext.NEW();
	return this;
};

JkScriptScript.prototype.print = function(message) {
	console.log(JkLangString.asString(message));
};

JkScriptScript.prototype.status = function(message) {
	JkLogLog.status(this.ctx, (JkLangString.asString(message)));
};

JkScriptScript.prototype.debug = function(message) {
	JkLogLog.debug(this.ctx, (JkLangString.asString(message)));
};

JkScriptScript.prototype.info = function(message) {
	JkLogLog.info(this.ctx, (JkLangString.asString(message)));
};

JkScriptScript.prototype.warning = function(message) {
	JkLogLog.warning(this.ctx, (JkLangString.asString(message)));
};

JkScriptScript.prototype.error = function(message) {
	throw JkLangExceptionWithString.forString((JkLangString.asString(message)), false);
};

JkScriptScript.prototype.initialize = function() {
	;
};

JkScriptScript.prototype.requireParameter = function(args, index, name) {
	var v = null;
	if(args != null && index < args.length) {
		v = args[index];
	}
	if(JkLangString.isEmpty(v)) {
		this.error("Missing parameter: <" + (JkLangString.safeString(name)) + (">"));
	}
	return v;
};

JkScriptScript.prototype.executeFunction = function(script) {
	if(!(script != null)) {
		return 0;
	}
	this.initialize();
	try {
		script();
	}
	catch(e) {
		JkLogLog.error(this.ctx, (JkLogLog.asString(this.ctx, e)));
		return 1;
	}
	return 0;
};

JkScriptScript.prototype.command = function(name, handler) {
	var sname = JkLangString.asString(name);
	if(!(sname != null)) {
		return;
	}
	if(!(this.entryPoints != null)) {
		this.entryPoints = new Map;
	}
	this.entryPoints.set(sname, handler);
};

JkScriptScript.prototype.main = function(args) {
	this.initialize();
	var cmd = null;
	if(args != null && args.length > 0) {
		cmd = args[0];
	}
	if(JkLangString.isEmpty(cmd)) {
		var sb = JkLangStringBuilder.NEW();
		sb.appendString("Missing command parameter: <");
		var first = true;
		var array = JkLangMap.getKeys(this.entryPoints);
		if(array != null) {
			var n2 = 0;
			var m = array.length;
			for(n2 = 0 ; n2 < m ; n2++) {
				var cc = array[n2];
				if(cc != null) {
					if(!first) {
						sb.appendCharacter('|'.charCodeAt());
					}
					sb.appendString(cc);
					first = false;
				}
			}
		}
		sb.appendCharacter('>'.charCodeAt());
		JkLogLog.error(this.ctx, (sb.toString()));
		return -1;
	}
	if(this.entryPoints != null) {
		var handler = JkLangMap.get(this.entryPoints, cmd);
		if(handler != null) {
			var v = new Array;
			var nargs = args.length;
			for(var n = 1 ; n < nargs ; n++) {
				v.push(args[n]);
			}
			var r = -1;
			try {
				r = handler(v);
			}
			catch(e) {
				JkLogLog.error(this.ctx, (JkLogLog.asString(this.ctx, e)));
				r = -1;
			}
			return r;
		}
	}
	JkLogLog.error(this.ctx, "Unsupported command: `" + (JkLangString.safeString(cmd)) + ("'"));
	return -1;
};

JkScriptScript.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkScriptScript"] === true;
};
