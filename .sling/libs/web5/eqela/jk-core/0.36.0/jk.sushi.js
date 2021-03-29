let JkSushiSushiCode = function() {
	this.code = null;
	this.name = null;
};

JkSushiSushiCode.prototype._t = { "JkSushiSushiCode" : true };
JkSushiSushiCode.prototype._tobj = JkSushiSushiCode;

JkSushiSushiCode.NEW = function() {
	var v = new JkSushiSushiCode;
	return v.CTOR_JkSushiSushiCode();
};

JkSushiSushiCode.prototype.CTOR_JkSushiSushiCode = function() {
	this.name = null;
	this.code = null;
	return this;
};

JkSushiSushiCode.forBuffer = function(code) {
	var v = JkSushiSushiCode.NEW();
	v.setCode(code);
	v.setName("code");
	return v;
};

JkSushiSushiCode.forFile = function(file) {
	if(!(file != null)) {
		return null;
	}
	var code = file.getContentsBuffer();
	if(!(code != null)) {
		return null;
	}
	var v = JkSushiSushiCode.NEW();
	v.setCode(code);
	v.setName((file.getBasename()));
	return v;
};

JkSushiSushiCode.prototype.execute = function(args) {
	return -1;
};

JkSushiSushiCode.prototype.getCode = function() {
	return this.code;
};

JkSushiSushiCode.prototype.setCode = function(v) {
	this.code = v;
	return this;
};

JkSushiSushiCode.prototype.getName = function() {
	return this.name;
};

JkSushiSushiCode.prototype.setName = function(v) {
	this.name = v;
	return this;
};

JkSushiSushiCode.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSushiSushiCode"] === true;
};

let JkSushiSushiKit = function() {
	this.ctx = null;
};

JkSushiSushiKit.prototype._t = { "JkSushiSushiKit" : true };
JkSushiSushiKit.prototype._tobj = JkSushiSushiKit;

JkSushiSushiKit.NEW_JkLogLoggingContext = function(ctx) {
	var v = new JkSushiSushiKit;
	return v.CTOR_JkSushiSushiKit_JkLogLoggingContext(ctx);
};

JkSushiSushiKit.prototype.CTOR_JkSushiSushiKit_JkLogLoggingContext = function(ctx) {
	this.ctx = null;
	this.ctx = ctx;
	return this;
};

JkSushiSushiKit.prototype.asStringVector = function(o) {
	var it = JkLangDynamicObject.iterate(o);
	if(!(it != null)) {
		return null;
	}
	var v = new Array;
	while(true){
		var oo = it.next();
		if(!(oo != null)) {
			break;
		}
		var s = JkLangString.asString(oo);
		if(s != null) {
			v.push(s);
		}
	}
	return v;
};

JkSushiSushiKit.prototype.executeBuffer = function(code, args) {
	var cc = JkSushiSushiCode.forBuffer(code);
	if(!(cc != null)) {
		JkLangError._throw("failedToInitialize", "SushiCode");
	}
	return cc.execute((this.asStringVector(args)));
};

JkSushiSushiKit.prototype.executeFile = function(file, args) {
	var ff = JkFsFileKit.NEW_JkLogLoggingContext(this.ctx).asFile(file);
	var code = JkSushiSushiCode.forFile(ff);
	if(!(code != null)) {
		JkLangError._throw("failedToRead", (ff.getPath()));
	}
	return code.execute((this.asStringVector(args)));
};

JkSushiSushiKit.prototype.executeFileProcess = function(file, args) {
	var ff = JkFsFileKit.NEW_JkLogLoggingContext(this.ctx).asFile(file);
	var pl = null;
	if(!(pl != null)) {
		pl = JkProcessProcessLauncher.forCommand("eqela", null);
	}
	if(!(pl != null)) {
		pl = JkProcessProcessLauncher.forCommand("sushi", null);
	}
	if(!(pl != null)) {
		JkLangError._throw("failedToFindSushiVm", null);
	}
	pl.addToParams((ff.getPath()));
	var array = this.asStringVector(args);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var arg = array[n];
			if(arg != null) {
				pl.addToParams(arg);
			}
		}
	}
	return pl.execute();
};

JkSushiSushiKit.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSushiSushiKit"] === true;
};
