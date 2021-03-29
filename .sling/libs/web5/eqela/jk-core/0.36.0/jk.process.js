let JkProcessCurrentProcess = function() {};

JkProcessCurrentProcess.prototype._t = { "JkProcessCurrentProcess" : true };
JkProcessCurrentProcess.prototype._tobj = JkProcessCurrentProcess;

JkProcessCurrentProcess.NEW = function() {
	var v = new JkProcessCurrentProcess;
	return v.CTOR_JkProcessCurrentProcess();
};

JkProcessCurrentProcess.prototype.CTOR_JkProcessCurrentProcess = function() {
	return this;
};

JkProcessCurrentProcess.terminate = function(value) {
	console.log("[jk.process.CurrentProcess.terminate] (CurrentProcess.sling:52:3): Not implemented");
};

JkProcessCurrentProcess.getExecutableFile = function() {
	return null;
};

JkProcessCurrentProcess.getProcessName = function() {
	var v = null;
	var exe = JkProcessCurrentProcess.getExecutableFile();
	if(exe != null) {
		v = exe.getBasenameWithoutExtension();
	}
	return v;
};

JkProcessCurrentProcess.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkProcessCurrentProcess"] === true;
};

let JkProcessProcessKit = function() {
	this.ctx = null;
};

JkProcessProcessKit.prototype._t = { "JkProcessProcessKit" : true };
JkProcessProcessKit.prototype._tobj = JkProcessProcessKit;

JkProcessProcessKit.NEW_JkLogLoggingContext = function(ctx) {
	var v = new JkProcessProcessKit;
	return v.CTOR_JkProcessProcessKit_JkLogLoggingContext(ctx);
};

JkProcessProcessKit.prototype.CTOR_JkProcessProcessKit_JkLogLoggingContext = function(ctx) {
	this.ctx = null;
	this.ctx = ctx;
	return this;
};

JkProcessProcessKit.prototype.execute = function(command) {
	var pl = JkProcessProcessLauncher.asProcessLauncher(command);
	if(!(pl != null)) {
		JkLangError._throw("invalidParameter", (JkLangString.asString(command)));
	}
	var cmd = pl.toString();
	JkLogLog.debug(this.ctx, "Executing command: `" + (JkLangString.safeString(cmd)) + ("'"));
	var r = pl.execute();
	if(r != 0) {
		JkLangError._throw("errorStatus", (JkLangString.forInteger(r)));
	}
};

JkProcessProcessKit.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkProcessProcessKit"] === true;
};

let JkProcessProcess = {};

JkProcessProcess.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkProcessProcess"] === true;
};

let JkProcessProcessLauncherQuietPipeHandler = function() {};

JkProcessProcessLauncherQuietPipeHandler.prototype._t = {
	"JkLangBufferDataReceiver" : true,
	"JkProcessProcessLauncherQuietPipeHandler" : true
};
JkProcessProcessLauncherQuietPipeHandler.prototype._tobj = JkProcessProcessLauncherQuietPipeHandler;

JkProcessProcessLauncherQuietPipeHandler.NEW = function() {
	var v = new JkProcessProcessLauncherQuietPipeHandler;
	return v.CTOR_JkProcessProcessLauncherQuietPipeHandler();
};

JkProcessProcessLauncherQuietPipeHandler.prototype.CTOR_JkProcessProcessLauncherQuietPipeHandler = function() {
	return this;
};

JkProcessProcessLauncherQuietPipeHandler.prototype.onBufferData = function(data, size) {
	return true;
};

JkProcessProcessLauncherQuietPipeHandler.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkProcessProcessLauncherQuietPipeHandler"] === true;
};

let JkProcessProcessLauncherMyBufferPipeHandler = function() {
	this.data = null;
};

JkProcessProcessLauncherMyBufferPipeHandler.prototype._t = {
	"JkLangBufferDataReceiver" : true,
	"JkProcessProcessLauncherMyBufferPipeHandler" : true
};
JkProcessProcessLauncherMyBufferPipeHandler.prototype._tobj = JkProcessProcessLauncherMyBufferPipeHandler;

JkProcessProcessLauncherMyBufferPipeHandler.NEW = function() {
	var v = new JkProcessProcessLauncherMyBufferPipeHandler;
	return v.CTOR_JkProcessProcessLauncherMyBufferPipeHandler();
};

JkProcessProcessLauncherMyBufferPipeHandler.prototype.CTOR_JkProcessProcessLauncherMyBufferPipeHandler = function() {
	this.data = null;
	return this;
};

JkProcessProcessLauncherMyBufferPipeHandler.prototype.onBufferData = function(newData, size) {
	this.data = JkLangBuffer.append(this.data, newData, size);
	return true;
};

JkProcessProcessLauncherMyBufferPipeHandler.prototype.getData = function() {
	return this.data;
};

JkProcessProcessLauncherMyBufferPipeHandler.prototype.setData = function(v) {
	this.data = v;
	return this;
};

JkProcessProcessLauncherMyBufferPipeHandler.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkProcessProcessLauncherMyBufferPipeHandler"] === true;
};

let JkProcessProcessLauncherMyStringPipeHandler = function() {
	this.builder = null;
	this.encoding = null;
};

JkProcessProcessLauncherMyStringPipeHandler.prototype._t = {
	"JkLangBufferDataReceiver" : true,
	"JkProcessProcessLauncherMyStringPipeHandler" : true
};
JkProcessProcessLauncherMyStringPipeHandler.prototype._tobj = JkProcessProcessLauncherMyStringPipeHandler;

JkProcessProcessLauncherMyStringPipeHandler.NEW = function() {
	var v = new JkProcessProcessLauncherMyStringPipeHandler;
	return v.CTOR_JkProcessProcessLauncherMyStringPipeHandler();
};

JkProcessProcessLauncherMyStringPipeHandler.prototype.CTOR_JkProcessProcessLauncherMyStringPipeHandler = function() {
	this.encoding = null;
	this.builder = null;
	this.encoding = "UTF-8";
	return this;
};

JkProcessProcessLauncherMyStringPipeHandler.prototype.onBufferData = function(data, size) {
	if(this.builder == null || data == null || size < 1) {
		return false;
	}
	var str = JkLangString.forBuffer((JkLangBuffer.getSubBuffer(data, 0, size, false)), this.encoding);
	if(!(str != null)) {
		return false;
	}
	this.builder.appendString(str);
	return true;
};

JkProcessProcessLauncherMyStringPipeHandler.prototype.getBuilder = function() {
	return this.builder;
};

JkProcessProcessLauncherMyStringPipeHandler.prototype.setBuilder = function(v) {
	this.builder = v;
	return this;
};

JkProcessProcessLauncherMyStringPipeHandler.prototype.getEncoding = function() {
	return this.encoding;
};

JkProcessProcessLauncherMyStringPipeHandler.prototype.setEncoding = function(v) {
	this.encoding = v;
	return this;
};

JkProcessProcessLauncherMyStringPipeHandler.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkProcessProcessLauncherMyStringPipeHandler"] === true;
};

let JkProcessProcessLauncher = function() {
	this.file = null;
	this.params = null;
	this.env = null;
	this.cwd = null;
	this.uid = -1;
	this.gid = -1;
	this.trapSigint = true;
	this.replaceSelf = false;
	this.pipePty = false;
	this.startGroup = false;
	this.noCmdWindow = false;
	this.errorBuffer = null;
	this.detachFromTerminal = false;
};

JkProcessProcessLauncher.prototype._t = {
	"JkLangStringObject" : true,
	"JkProcessProcessLauncher" : true
};
JkProcessProcessLauncher.prototype._tobj = JkProcessProcessLauncher;

JkProcessProcessLauncher.NEW = function() {
	var v = new JkProcessProcessLauncher;
	return v.CTOR_JkProcessProcessLauncher();
};

JkProcessProcessLauncher.prototype.CTOR_JkProcessProcessLauncher = function() {
	this.detachFromTerminal = false;
	this.errorBuffer = null;
	this.noCmdWindow = false;
	this.startGroup = false;
	this.pipePty = false;
	this.replaceSelf = false;
	this.trapSigint = true;
	this.gid = -1;
	this.uid = -1;
	this.cwd = null;
	this.env = null;
	this.params = null;
	this.file = null;
	this.params = new Array;
	this.env = new Map;
	return this;
};

JkProcessProcessLauncher.asProcessLauncher = function(o) {
	if(!(o != null)) {
		return null;
	}
	if(typeof(o) === 'string') {
		return JkProcessProcessLauncher.forString(o);
	}
	var vector = JkLangVector.asObjectVector(o);
	if(vector != null) {
		var vsz = JkLangVector.getSize(vector);
		if(vsz > 0) {
			var pl = JkProcessProcessLauncher.forCommand((JkLangString.asString((JkLangVector.get(vector, 0)))), null);
			if(!(pl != null)) {
				return null;
			}
			for(var n = 1 ; n < vsz ; n++) {
				pl.addToParams((JkLangString.asString((JkLangVector.get(vector, n)))));
			}
			return pl;
		}
	}
	return null;
};

JkProcessProcessLauncher.forSelf = function() {
	var exe = JkProcessCurrentProcess.getExecutableFile();
	if(!(exe != null)) {
		return null;
	}
	var v = JkProcessProcessLauncher.NEW();
	v.setFile(exe);
	return v;
};

JkProcessProcessLauncher.forFile = function(file, parameters) {
	if(file == null || file.isFile() == false) {
		return null;
	}
	var v = JkProcessProcessLauncher.NEW();
	v.setFile(file);
	if(parameters != null) {
		var n = 0;
		var m = parameters.length;
		for(n = 0 ; n < m ; n++) {
			var param = (function(o) {
				if(typeof(o) === 'string') {
					return o;
				}
				return null;
			}.bind(this))(parameters[n]);
			if(param != null) {
				v.addToParams(param);
			}
		}
	}
	return v;
};

JkProcessProcessLauncher.forCommand = function(command, parameters) {
	if(JkLangString.isEmpty(command)) {
		return null;
	}
	var file = null;
	var delim = JkFsPathInfo.getPathSeparator();
	if(JkLangString.getIndexOfCharacter(command, delim, 0) >= 0) {
		file = JkFsFile.forPath(command);
	}
	else if(delim != '/'.charCodeAt() && JkLangString.getIndexOfCharacter(command, '/'.charCodeAt(), 0) >= 0) {
		file = JkFsFile.forPath(command);
	}
	else {
		file = JkEnvExternalCommand.findInPath(command);
	}
	return JkProcessProcessLauncher.forFile(file, parameters);
};

JkProcessProcessLauncher.forString = function(str) {
	if(JkLangString.isEmpty(str)) {
		return null;
	}
	var arr = JkTextStringUtil.quotedStringToVector(str, ' '.charCodeAt(), true, '\\'.charCodeAt());
	if(arr == null || JkLangVector.getSize(arr) < 1) {
		return null;
	}
	var vsz = JkLangVector.getSize(arr);
	var cmd = arr[0];
	var parameters = null;
	var paramCount = vsz - 1;
	if(paramCount > 0) {
		parameters = [];
		for(var n = 1 ; n < vsz ; n++) {
			parameters[n - 1] = arr[n];
		}
	}
	return JkProcessProcessLauncher.forCommand(cmd, parameters);
};

JkProcessProcessLauncher.prototype.appendProperParam = function(sb, p) {
	if(!JkLangString.isNotEmpty(p)) {
		return;
	}
	sb.appendCharacter(' '.charCodeAt());
	sb.appendCharacter('\"'.charCodeAt());
	this.escapeQuotesAndBackSlashes(sb, p);
	sb.appendCharacter('\"'.charCodeAt());
};

JkProcessProcessLauncher.prototype.escapeQuotesAndBackSlashes = function(sb, param) {
	var it = JkLangString.iterate(param);
	while(it != null){
		var c = it.getNextChar();
		if(JkLangCharacter.isEOF(c)) {
			break;
		}
		if(c == '\"'.charCodeAt() || c == '\\'.charCodeAt()) {
			sb.appendCharacter('\\'.charCodeAt());
		}
		sb.appendCharacter(c);
	}
};

JkProcessProcessLauncher.prototype.getFullCommandString = function(includeEnv) {
	var sb = JkLangStringBuilder.NEW();
	if(includeEnv) {
		var keys = JkLangMap.getKeys(this.env);
		if(keys != null) {
			var n = 0;
			var m = keys.length;
			for(n = 0 ; n < m ; n++) {
				var key = keys[n];
				if(key != null) {
					sb.appendString(key);
					sb.appendCharacter('='.charCodeAt());
					sb.appendString((this.env.get(key)));
					sb.appendCharacter(' '.charCodeAt());
				}
			}
		}
	}
	sb.appendCharacter('\"'.charCodeAt());
	if(this.file != null) {
		this.escapeQuotesAndBackSlashes(sb, (this.file.getPath()));
	}
	sb.appendCharacter('\"'.charCodeAt());
	if(this.params != null) {
		var n2 = 0;
		var m2 = this.params.length;
		for(n2 = 0 ; n2 < m2 ; n2++) {
			var p = this.params[n2];
			if(p != null) {
				this.appendProperParam(sb, p);
			}
		}
	}
	return sb.toString();
};

JkProcessProcessLauncher.prototype.toString = function() {
	return this.getFullCommandString(true);
};

JkProcessProcessLauncher.prototype.addToParams = function(arg) {
	if(arg != null) {
		if(this.params == null) {
			this.params = new Array;
		}
		this.params.push(arg);
	}
	return this;
};

JkProcessProcessLauncher.prototype.addFileToParams = function(file) {
	if(file != null) {
		this.addToParams((file.getPath()));
	}
	return this;
};

JkProcessProcessLauncher.prototype.addStringsToParams = function(parameters) {
	if(parameters != null) {
		var n = 0;
		var m = parameters.length;
		for(n = 0 ; n < m ; n++) {
			var s = parameters[n];
			if(s != null) {
				this.addToParams(s);
			}
		}
	}
	return this;
};

JkProcessProcessLauncher.prototype.setEnvVariable = function(key, val) {
	if(key != null) {
		if(this.env == null) {
			this.env = new Map;
		}
		this.env.set(key, val);
	}
};

JkProcessProcessLauncher.prototype.startProcess = function(wait, pipeHandler, withIO) {
	console.log("[jk.process.ProcessLauncher.startProcess] (ProcessLauncher.sling:312:3): Not implemented");
	return null;
};

JkProcessProcessLauncher.prototype.start = function() {
	return this.startProcess(false, null, false);
};

JkProcessProcessLauncher.prototype.startWithIO = function() {
	return (function(o) {
		if(JkProcessProcessWithIO.IS_INSTANCE && JkProcessProcessWithIO.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((this.startProcess(false, null, true)));
};

JkProcessProcessLauncher.prototype.execute = function() {
	var cp = this.startProcess(true, null, false);
	if(cp == null) {
		return -1;
	}
	return cp.getExitStatus();
};

JkProcessProcessLauncher.prototype.executeSilent = function() {
	var cp = this.startProcess(true, (JkProcessProcessLauncherQuietPipeHandler.NEW()), false);
	if(cp == null) {
		return -1;
	}
	return cp.getExitStatus();
};

JkProcessProcessLauncher.prototype.executeToStringBuilder = function(output) {
	var msp = JkProcessProcessLauncherMyStringPipeHandler.NEW();
	msp.setBuilder(output);
	var cp = this.startProcess(true, msp, false);
	if(cp == null) {
		return -1;
	}
	return cp.getExitStatus();
};

JkProcessProcessLauncher.prototype.executeToString = function() {
	var sb = JkLangStringBuilder.NEW();
	if(this.executeToStringBuilder(sb) < 0) {
		return null;
	}
	return sb.toString();
};

JkProcessProcessLauncher.prototype.executeToBuffer = function() {
	var ph = JkProcessProcessLauncherMyBufferPipeHandler.NEW();
	var cp = this.startProcess(true, ph, false);
	if(cp == null) {
		return null;
	}
	return ph.getData();
};

JkProcessProcessLauncher.prototype.executeToPipe = function(pipeHandler) {
	var cp = this.startProcess(true, pipeHandler, false);
	if(cp == null) {
		return -1;
	}
	return cp.getExitStatus();
};

JkProcessProcessLauncher.prototype.getFile = function() {
	return this.file;
};

JkProcessProcessLauncher.prototype.setFile = function(v) {
	this.file = v;
	return this;
};

JkProcessProcessLauncher.prototype.getParams = function() {
	return this.params;
};

JkProcessProcessLauncher.prototype.setParams = function(v) {
	this.params = v;
	return this;
};

JkProcessProcessLauncher.prototype.getEnv = function() {
	return this.env;
};

JkProcessProcessLauncher.prototype.setEnv = function(v) {
	this.env = v;
	return this;
};

JkProcessProcessLauncher.prototype.getCwd = function() {
	return this.cwd;
};

JkProcessProcessLauncher.prototype.setCwd = function(v) {
	this.cwd = v;
	return this;
};

JkProcessProcessLauncher.prototype.getUid = function() {
	return this.uid;
};

JkProcessProcessLauncher.prototype.setUid = function(v) {
	this.uid = v;
	return this;
};

JkProcessProcessLauncher.prototype.getGid = function() {
	return this.gid;
};

JkProcessProcessLauncher.prototype.setGid = function(v) {
	this.gid = v;
	return this;
};

JkProcessProcessLauncher.prototype.getTrapSigint = function() {
	return this.trapSigint;
};

JkProcessProcessLauncher.prototype.setTrapSigint = function(v) {
	this.trapSigint = v;
	return this;
};

JkProcessProcessLauncher.prototype.getReplaceSelf = function() {
	return this.replaceSelf;
};

JkProcessProcessLauncher.prototype.setReplaceSelf = function(v) {
	this.replaceSelf = v;
	return this;
};

JkProcessProcessLauncher.prototype.getPipePty = function() {
	return this.pipePty;
};

JkProcessProcessLauncher.prototype.setPipePty = function(v) {
	this.pipePty = v;
	return this;
};

JkProcessProcessLauncher.prototype.getStartGroup = function() {
	return this.startGroup;
};

JkProcessProcessLauncher.prototype.setStartGroup = function(v) {
	this.startGroup = v;
	return this;
};

JkProcessProcessLauncher.prototype.getNoCmdWindow = function() {
	return this.noCmdWindow;
};

JkProcessProcessLauncher.prototype.setNoCmdWindow = function(v) {
	this.noCmdWindow = v;
	return this;
};

JkProcessProcessLauncher.prototype.getErrorBuffer = function() {
	return this.errorBuffer;
};

JkProcessProcessLauncher.prototype.setErrorBuffer = function(v) {
	this.errorBuffer = v;
	return this;
};

JkProcessProcessLauncher.prototype.getDetachFromTerminal = function() {
	return this.detachFromTerminal;
};

JkProcessProcessLauncher.prototype.setDetachFromTerminal = function(v) {
	this.detachFromTerminal = v;
	return this;
};

JkProcessProcessLauncher.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkProcessProcessLauncher"] === true;
};

let JkProcessProcessWithIO = {};

JkProcessProcessWithIO.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkProcessProcessWithIO"] === true;
};
