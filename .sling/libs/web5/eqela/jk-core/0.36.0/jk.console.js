let JkConsoleStdoutForBrowser = function() {};

JkConsoleStdoutForBrowser.prototype._t = {
	"JkIoWriter" : true,
	"JkConsoleStdoutForBrowser" : true,
	"JkIoPrintWriter" : true
};
JkConsoleStdoutForBrowser.prototype._tobj = JkConsoleStdoutForBrowser;

JkConsoleStdoutForBrowser.NEW = function() {
	var v = new JkConsoleStdoutForBrowser;
	return v.CTOR_JkConsoleStdoutForBrowser();
};

JkConsoleStdoutForBrowser.prototype.CTOR_JkConsoleStdoutForBrowser = function() {
	return this;
};

JkConsoleStdoutForBrowser.prototype.write = function(buf, size) {
	console.log("--- stub --- jk.console.StdoutForBrowser :: write");
	return 0;
};

JkConsoleStdoutForBrowser.prototype.print = function(str) {
	console.log(str);
	;
	return true;
};

JkConsoleStdoutForBrowser.prototype.println = function(str) {
	console.log(str + "\n");
	;
	return true;
};

JkConsoleStdoutForBrowser.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkConsoleStdoutForBrowser"] === true;
};

let JkConsoleConsoleApplicationMain = function() {
	this.stdout = null;
	this.stdin = null;
	this.ctx = null;
	this.args = null;
	this.verbosityLevel = 3;
	this.terminal = null;
};

JkConsoleConsoleApplicationMain.prototype._t = { "JkConsoleConsoleApplicationMain" : true };
JkConsoleConsoleApplicationMain.prototype._tobj = JkConsoleConsoleApplicationMain;

JkConsoleConsoleApplicationMain.NEW = function() {
	var v = new JkConsoleConsoleApplicationMain;
	return v.CTOR_JkConsoleConsoleApplicationMain();
};

JkConsoleConsoleApplicationMain.prototype.CTOR_JkConsoleConsoleApplicationMain = function() {
	this.terminal = null;
	this.verbosityLevel = 3;
	this.args = null;
	this.ctx = null;
	this.stdin = null;
	this.stdout = null;
	this.stdin = JkConsoleStdin.instance();
	this.stdout = JkConsoleStdout.instance();
	this.ctx = JkConsoleConsoleApplicationContext.NEW();
	return this;
};

JkConsoleConsoleApplicationMain.executeMain = function(app, args) {
	if(!(app != null)) {
		return -1;
	}
	return app.executeWithArgumentArray(args);
};

JkConsoleConsoleApplicationMain.prototype.setCtx = function(v) {
	this.ctx = v;
	return this;
};

JkConsoleConsoleApplicationMain.prototype.getTerminal = function() {
	if(!(this.terminal != null)) {
		this.terminal = JkConsoleTerminal.forCurrent();
	}
	return this.terminal;
};

JkConsoleConsoleApplicationMain.prototype.print = function(value) {
	if(this.stdout != null) {
		this.stdout.print(value);
	}
};

JkConsoleConsoleApplicationMain.prototype.println = function(value) {
	if(this.stdout != null) {
		this.stdout.println(value);
	}
};

JkConsoleConsoleApplicationMain.prototype.readLine = function() {
	var tt = this.getTerminal();
	if(tt != null) {
		return tt.readLine();
	}
	if(this.stdin != null) {
		return this.stdin.readLine();
	}
	return null;
};

JkConsoleConsoleApplicationMain.prototype.readLineWithoutEcho = function() {
	var tt = this.getTerminal();
	if(tt != null) {
		return tt.readLineWithoutEcho();
	}
	return this.readLine();
};

JkConsoleConsoleApplicationMain.prototype.initialize = function() {
	return true;
};

JkConsoleConsoleApplicationMain.prototype.getVerbosityLevel = function() {
	return this.verbosityLevel;
};

JkConsoleConsoleApplicationMain.prototype.setVerbosityLevel = function(level) {
	this.verbosityLevel = level;
	if(this.verbosityLevel <= 0) {
		this.ctx.setEnableOutput(false);
	}
	else if(this.verbosityLevel == 1) {
		this.ctx.setEnableOutput(true);
		this.ctx.setShowError(true);
		this.ctx.setShowWarning(false);
		this.ctx.setShowInfo(false);
		this.ctx.setShowDebug(false);
	}
	else if(this.verbosityLevel == 2) {
		this.ctx.setEnableOutput(true);
		this.ctx.setShowError(true);
		this.ctx.setShowWarning(true);
		this.ctx.setShowInfo(false);
		this.ctx.setShowDebug(false);
	}
	else if(this.verbosityLevel == 3) {
		this.ctx.setEnableOutput(true);
		this.ctx.setShowError(true);
		this.ctx.setShowWarning(true);
		this.ctx.setShowInfo(true);
		this.ctx.setShowDebug(false);
	}
	else {
		this.ctx.setEnableOutput(true);
		this.ctx.setShowError(true);
		this.ctx.setShowWarning(true);
		this.ctx.setShowInfo(true);
		this.ctx.setShowDebug(true);
	}
};

JkConsoleConsoleApplicationMain.prototype.handleVerbosityParams = function() {
	var nargs = new Array;
	var vl = this.verbosityLevel;
	if(this.args != null) {
		var n = 0;
		var m = this.args.length;
		for(n = 0 ; n < m ; n++) {
			var arg = this.args[n];
			if(arg != null) {
				if(arg.isFlag("v0")) {
					vl = 0;
				}
				else if(arg.isFlag("v1")) {
					vl = 1;
				}
				else if(arg.isFlag("v2")) {
					vl = 2;
				}
				else if(arg.isFlag("v3")) {
					vl = 3;
				}
				else if(arg.isFlag("v4") || arg.isFlag("vv") || arg.isFlag("debug")) {
					vl = 4;
				}
				else {
					nargs.push(arg);
				}
			}
		}
	}
	this.args = nargs;
	if(vl != this.verbosityLevel) {
		this.setVerbosityLevel(vl);
	}
};

JkConsoleConsoleApplicationMain.prototype.executeWithArgumentArray = function(args) {
	if(args != null) {
		this.args = JkConsoleConsoleApplicationUtil.parseCommandLineArguments(args);
	}
	if(!this.initialize()) {
		return 1;
	}
	var r = this.execute();
	JkLogLog.status(this.ctx, null);
	if(r) {
		return 0;
	}
	return 1;
};

JkConsoleConsoleApplicationMain.prototype.executeWithArgumentVector = function(args) {
	var arga = null;
	if(args != null) {
		arga = [];
		var n = 0;
		if(args != null) {
			var n2 = 0;
			var m = args.length;
			for(n2 = 0 ; n2 < m ; n2++) {
				var arg = args[n2];
				if(arg != null) {
					arga[n++] = arg;
				}
			}
		}
	}
	return this.executeWithArgumentArray(arga);
};

JkConsoleConsoleApplicationMain.prototype.executeWithParsedArguments = function(args) {
	this.args = args;
	if(!this.initialize()) {
		return false;
	}
	var r = this.execute();
	JkLogLog.status(this.ctx, null);
	return r;
};

JkConsoleConsoleApplicationMain.prototype.execute = function() {};

JkConsoleConsoleApplicationMain.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkConsoleConsoleApplicationMain"] === true;
};

let JkConsoleStdin = function() {};

JkConsoleStdin.prototype._t = { "JkConsoleStdin" : true };
JkConsoleStdin.prototype._tobj = JkConsoleStdin;

JkConsoleStdin.NEW = function() {
	var v = new JkConsoleStdin;
	return v.CTOR_JkConsoleStdin();
};

JkConsoleStdin.prototype.CTOR_JkConsoleStdin = function() {
	return this;
};

JkConsoleStdin.instance = function() {
	var reader = null;
	if(!(reader != null)) {
		return null;
	}
	return JkIoPrintReader.forReader(reader);
};

JkConsoleStdin.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkConsoleStdin"] === true;
};

let JkConsoleUsageInfoOption = function() {
	this.name = null;
	this.value = null;
	this.description = null;
};

JkConsoleUsageInfoOption.prototype._t = { "JkConsoleUsageInfoOption" : true };
JkConsoleUsageInfoOption.prototype._tobj = JkConsoleUsageInfoOption;

JkConsoleUsageInfoOption.NEW = function() {
	var v = new JkConsoleUsageInfoOption;
	return v.CTOR_JkConsoleUsageInfoOption();
};

JkConsoleUsageInfoOption.prototype.CTOR_JkConsoleUsageInfoOption = function() {
	this.description = null;
	this.value = null;
	this.name = null;
	return this;
};

JkConsoleUsageInfoOption.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkConsoleUsageInfoOption"] === true;
};

let JkConsoleUsageInfoFlag = function() {
	this.flag = null;
	this.description = null;
};

JkConsoleUsageInfoFlag.prototype._t = { "JkConsoleUsageInfoFlag" : true };
JkConsoleUsageInfoFlag.prototype._tobj = JkConsoleUsageInfoFlag;

JkConsoleUsageInfoFlag.NEW = function() {
	var v = new JkConsoleUsageInfoFlag;
	return v.CTOR_JkConsoleUsageInfoFlag();
};

JkConsoleUsageInfoFlag.prototype.CTOR_JkConsoleUsageInfoFlag = function() {
	this.description = null;
	this.flag = null;
	return this;
};

JkConsoleUsageInfoFlag.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkConsoleUsageInfoFlag"] === true;
};

let JkConsoleUsageInfoParameter = function() {
	this.name = null;
	this.description = null;
};

JkConsoleUsageInfoParameter.prototype._t = { "JkConsoleUsageInfoParameter" : true };
JkConsoleUsageInfoParameter.prototype._tobj = JkConsoleUsageInfoParameter;

JkConsoleUsageInfoParameter.NEW = function() {
	var v = new JkConsoleUsageInfoParameter;
	return v.CTOR_JkConsoleUsageInfoParameter();
};

JkConsoleUsageInfoParameter.prototype.CTOR_JkConsoleUsageInfoParameter = function() {
	this.description = null;
	this.name = null;
	return this;
};

JkConsoleUsageInfoParameter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkConsoleUsageInfoParameter"] === true;
};

let JkConsoleUsageInfo = function() {
	this.command = null;
	this.description = null;
	this.paramDesc = null;
	this.data = null;
};

JkConsoleUsageInfo.prototype._t = { "JkConsoleUsageInfo" : true };
JkConsoleUsageInfo.prototype._tobj = JkConsoleUsageInfo;

JkConsoleUsageInfo.NEW = function() {
	var v = new JkConsoleUsageInfo;
	return v.CTOR_JkConsoleUsageInfo();
};

JkConsoleUsageInfo.prototype.CTOR_JkConsoleUsageInfo = function() {
	this.data = null;
	this.paramDesc = null;
	this.description = null;
	this.command = null;
	this.data = new Array;
	this.paramDesc = "[parameters]";
	this.command = JkProcessCurrentProcess.getProcessName();
	if(JkLangString.isEmpty(this.command)) {
		this.command = "(command)";
	}
	return this;
};

JkConsoleUsageInfo.forCommand = function(command) {
	var v = JkConsoleUsageInfo.NEW();
	v.setCommand(command);
	return v;
};

JkConsoleUsageInfo.prototype.ensureSection = function() {
	if(JkLangVector.getSize(this.data) < 1) {
		this.addSection("Available parameters");
	}
};

JkConsoleUsageInfo.prototype.addSection = function(name) {
	this.data.push(name);
};

JkConsoleUsageInfo.prototype.addParameter = function(name, description) {
	this.ensureSection();
	var p = JkConsoleUsageInfoParameter.NEW();
	p.name = name;
	p.description = description;
	this.data.push(p);
};

JkConsoleUsageInfo.prototype.addFlag = function(flag, description) {
	this.ensureSection();
	var f = JkConsoleUsageInfoFlag.NEW();
	f.flag = flag;
	f.description = description;
	this.data.push(f);
};

JkConsoleUsageInfo.prototype.addOption = function(name, value, description) {
	this.ensureSection();
	var o = JkConsoleUsageInfoOption.NEW();
	o.name = name;
	o.value = value;
	o.description = description;
	this.data.push(o);
};

JkConsoleUsageInfo.prototype.toString = function() {
	var sb = JkLangStringBuilder.NEW();
	sb.appendString("Usage: ");
	sb.appendString(this.command);
	if(JkLangString.isEmpty(this.paramDesc) == false) {
		sb.appendCharacter(' '.charCodeAt());
		sb.appendString(this.paramDesc);
	}
	sb.appendCharacter('\n'.charCodeAt());
	sb.appendCharacter('\n'.charCodeAt());
	if(JkLangString.isEmpty(this.description) == false) {
		sb.appendString(this.description);
		sb.appendCharacter('\n'.charCodeAt());
		sb.appendCharacter('\n'.charCodeAt());
	}
	var longest = 0;
	var db = true;
	if(this.data != null) {
		var n = 0;
		var m = this.data.length;
		for(n = 0 ; n < m ; n++) {
			var o = this.data[n];
			if(o != null) {
				if(JkConsoleUsageInfoParameter.IS_INSTANCE && JkConsoleUsageInfoParameter.IS_INSTANCE(o)) {
					var nn = o.name;
					if(!(nn == null)) {
						var ll = JkLangString.getLength(nn);
						if(ll > longest) {
							longest = ll;
						}
					}
				}
				else if(JkConsoleUsageInfoFlag.IS_INSTANCE && JkConsoleUsageInfoFlag.IS_INSTANCE(o)) {
					var ff = o.flag;
					if(!(ff == null)) {
						var ll1 = JkLangString.getLength(ff) + 1;
						if(ll1 > longest) {
							longest = ll1;
						}
					}
				}
				else if(JkConsoleUsageInfoOption.IS_INSTANCE && JkConsoleUsageInfoOption.IS_INSTANCE(o)) {
					var name = o.name;
					var value = o.value;
					var ll2 = 1 + JkLangString.getLength(name) + 2 + JkLangString.getLength(value) + 1;
					if(ll2 > longest) {
						longest = ll2;
					}
				}
			}
		}
	}
	if(longest < 30) {
		longest = 30;
	}
	if(this.data != null) {
		var n2 = 0;
		var m2 = this.data.length;
		for(n2 = 0 ; n2 < m2 ; n2++) {
			var o1 = this.data[n2];
			if(o1 != null) {
				if(typeof(o1) === 'string' || JkLangStringObject.IS_INSTANCE && JkLangStringObject.IS_INSTANCE(o1)) {
					if(db == false) {
						sb.appendCharacter('\n'.charCodeAt());
					}
					sb.appendString((JkLangString.asString(o1)));
					sb.appendCharacter(':'.charCodeAt());
					sb.appendCharacter('\n'.charCodeAt());
					sb.appendCharacter('\n'.charCodeAt());
					db = true;
				}
				else if(JkConsoleUsageInfoParameter.IS_INSTANCE && JkConsoleUsageInfoParameter.IS_INSTANCE(o1)) {
					var p = o1;
					sb.appendString("  ");
					sb.appendString((JkTextStringUtil.padToLength(p.name, longest, (-1), ' '.charCodeAt())));
					if(JkLangString.isEmpty(p.description) == false) {
						sb.appendString(" - ");
						sb.appendString(p.description);
					}
					sb.appendCharacter('\n'.charCodeAt());
					db = false;
				}
				else if(JkConsoleUsageInfoFlag.IS_INSTANCE && JkConsoleUsageInfoFlag.IS_INSTANCE(o1)) {
					var p1 = o1;
					sb.appendString("  -");
					sb.appendString((JkTextStringUtil.padToLength(p1.flag, (longest - 1), (-1), ' '.charCodeAt())));
					if(JkLangString.isEmpty(p1.description) == false) {
						sb.appendString(" - ");
						sb.appendString(p1.description);
					}
					sb.appendCharacter('\n'.charCodeAt());
					db = false;
				}
				else if(JkConsoleUsageInfoOption.IS_INSTANCE && JkConsoleUsageInfoOption.IS_INSTANCE(o1)) {
					var p2 = o1;
					sb.appendString("  ");
					sb.appendString((JkTextStringUtil.padToLength("-" + (JkLangString.safeString(p2.name)) + ("=[") + (JkLangString.safeString(p2.value)) + ("]"), longest, (-1), ' '.charCodeAt())));
					if(JkLangString.isEmpty(p2.description) == false) {
						sb.appendString(" - ");
						sb.appendString(p2.description);
					}
					sb.appendCharacter('\n'.charCodeAt());
					db = false;
				}
			}
		}
	}
	return sb.toString();
};

JkConsoleUsageInfo.prototype.getCommand = function() {
	return this.command;
};

JkConsoleUsageInfo.prototype.setCommand = function(v) {
	this.command = v;
	return this;
};

JkConsoleUsageInfo.prototype.getDescription = function() {
	return this.description;
};

JkConsoleUsageInfo.prototype.setDescription = function(v) {
	this.description = v;
	return this;
};

JkConsoleUsageInfo.prototype.getParamDesc = function() {
	return this.paramDesc;
};

JkConsoleUsageInfo.prototype.setParamDesc = function(v) {
	this.paramDesc = v;
	return this;
};

JkConsoleUsageInfo.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkConsoleUsageInfo"] === true;
};

let JkConsoleStdout = function() {};

JkConsoleStdout.prototype._t = { "JkConsoleStdout" : true };
JkConsoleStdout.prototype._tobj = JkConsoleStdout;

JkConsoleStdout.NEW = function() {
	var v = new JkConsoleStdout;
	return v.CTOR_JkConsoleStdout();
};

JkConsoleStdout.prototype.CTOR_JkConsoleStdout = function() {
	return this;
};

JkConsoleStdout.instance = function() {
	return JkConsoleStdoutForBrowser.NEW();
};

JkConsoleStdout.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkConsoleStdout"] === true;
};

let JkConsoleCommandLineArgument = function() {
	this.arg = null;
	this.parameter = null;
	this.flag = null;
	this.key = null;
	this.value = null;
};

JkConsoleCommandLineArgument.prototype._t = { "JkConsoleCommandLineArgument" : true };
JkConsoleCommandLineArgument.prototype._tobj = JkConsoleCommandLineArgument;

JkConsoleCommandLineArgument.NEW_StringStringStringStringString = function(arg, parameter, flag, key, value) {
	var v = new JkConsoleCommandLineArgument;
	return v.CTOR_JkConsoleCommandLineArgument_StringStringStringStringString(arg, parameter, flag, key, value);
};

JkConsoleCommandLineArgument.prototype.CTOR_JkConsoleCommandLineArgument_StringStringStringStringString = function(arg, parameter, flag, key, value) {
	this.value = null;
	this.key = null;
	this.flag = null;
	this.parameter = null;
	this.arg = null;
	this.arg = arg;
	this.parameter = parameter;
	this.flag = flag;
	this.key = key;
	this.value = value;
	return this;
};

JkConsoleCommandLineArgument.prototype.isParameter = function() {
	if(this.parameter != null) {
		return true;
	}
	return false;
};

JkConsoleCommandLineArgument.prototype.isAnyFlag = function() {
	if(this.flag != null) {
		return true;
	}
	return false;
};

JkConsoleCommandLineArgument.prototype.isAnyOption = function() {
	if(this.key != null) {
		return true;
	}
	return false;
};

JkConsoleCommandLineArgument.prototype.isFlag = function(text) {
	if(text != null && JkLangString.equalsIgnoreCase(text, this.flag)) {
		return true;
	}
	return false;
};

JkConsoleCommandLineArgument.prototype.isOption = function(text) {
	if(text != null && JkLangString.equalsIgnoreCase(text, this.key)) {
		return true;
	}
	return false;
};

JkConsoleCommandLineArgument.prototype.hasValue = function() {
	if(this.value != null) {
		return true;
	}
	return false;
};

JkConsoleCommandLineArgument.prototype.getKey = function() {
	return this.key;
};

JkConsoleCommandLineArgument.prototype.getComplete = function() {
	return this.arg;
};

JkConsoleCommandLineArgument.prototype.getStringValue = function() {
	return this.value;
};

JkConsoleCommandLineArgument.prototype.getIntegerValue = function() {
	return JkLangInteger.asInteger(this.value);
};

JkConsoleCommandLineArgument.prototype.getBooleanValue = function() {
	return JkLangBoolean.asBoolean(this.value, false);
};

JkConsoleCommandLineArgument.prototype.reportAsUnsupported = function(ctx) {
	JkLogLog.error(ctx, "Unsupported command line parameter: `" + (JkLangString.safeString(this.arg)) + ("'"));
};

JkConsoleCommandLineArgument.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkConsoleCommandLineArgument"] === true;
};

let JkConsoleConsoleApplicationContext = function() {
	this.applicationName = null;
	this.enableColor = true;
	this.dumbMode = false;
	this.showInfo = true;
	this.showWarning = true;
	this.showError = true;
	this.showDebug = false;
	this.enableStatus = true;
	this.enableOutput = true;
	this.autoClearStatus = true;
	this.currentPrefix = null;
	this.lastStatus = false;
	this.lastStatusLength = 0;
	this.errorCounter = 0;
	this.warningCounter = 0;
	this.infoCounter = 0;
	this.debugCounter = 0;
	this.stdout = null;
};

JkConsoleConsoleApplicationContext.prototype._t = {
	"JkConsoleConsoleApplicationContext" : true,
	"JkLogLoggingContext" : true,
	"JkAppApplicationContext" : true
};
JkConsoleConsoleApplicationContext.prototype._tobj = JkConsoleConsoleApplicationContext;

JkConsoleConsoleApplicationContext.NEW = function() {
	var v = new JkConsoleConsoleApplicationContext;
	return v.CTOR_JkConsoleConsoleApplicationContext();
};

JkConsoleConsoleApplicationContext.prototype.CTOR_JkConsoleConsoleApplicationContext = function() {
	this.stdout = null;
	this.debugCounter = 0;
	this.infoCounter = 0;
	this.warningCounter = 0;
	this.errorCounter = 0;
	this.lastStatusLength = 0;
	this.lastStatus = false;
	this.currentPrefix = null;
	this.autoClearStatus = true;
	this.enableOutput = true;
	this.enableStatus = true;
	this.showDebug = false;
	this.showError = true;
	this.showWarning = true;
	this.showInfo = true;
	this.dumbMode = false;
	this.enableColor = true;
	this.applicationName = null;
	this.stdout = JkConsoleStdout.instance();
	var term = JkEnvEnvironmentVariable.get("TERM");
	if(term == null || term == "cygwin") {
		this.enableColor = false;
	}
	var logColor = JkEnvEnvironmentVariable.get("CONSOLE_LOG_COLOR");
	if(logColor != null) {
		this.enableColor = JkLangBoolean.asBoolean(logColor, false);
	}
	var logDebug = JkEnvEnvironmentVariable.get("CONSOLE_LOG_DEBUG");
	if(!(logDebug != null)) {
		logDebug = JkEnvEnvironmentVariable.get("CONSOLE_DEBUG");
	}
	if(!(logDebug != null)) {
		logDebug = JkEnvEnvironmentVariable.get("EQELA_DEBUG");
	}
	if(logDebug != null) {
		this.setEnableDebugMessages((JkLangBoolean.asBoolean(logDebug, false)));
	}
	return this;
};

JkConsoleConsoleApplicationContext.forApplicationName = function(name) {
	var v = JkConsoleConsoleApplicationContext.NEW();
	v.setApplicationName(name);
	return v;
};

JkConsoleConsoleApplicationContext.prototype.isInDebugMode = function() {
	return this.showDebug;
};

JkConsoleConsoleApplicationContext.prototype.setEnableDebugMessages = function(v) {
	this.showDebug = v;
	return this;
};

JkConsoleConsoleApplicationContext.prototype.useApplicationNameAsPrefix = function() {
	this.currentPrefix = this.applicationName;
	if(JkLangString.isEmpty(this.currentPrefix)) {
		this.currentPrefix = JkProcessCurrentProcess.getProcessName();
	}
};

JkConsoleConsoleApplicationContext.prototype.resetCounters = function() {
	this.errorCounter = 0;
	this.warningCounter = 0;
	this.infoCounter = 0;
	this.debugCounter = 0;
};

JkConsoleConsoleApplicationContext.prototype.getErrorCount = function() {
	return this.errorCounter;
};

JkConsoleConsoleApplicationContext.prototype.getWarningCount = function() {
	return this.warningCounter;
};

JkConsoleConsoleApplicationContext.prototype.getInfoCount = function() {
	return this.infoCounter;
};

JkConsoleConsoleApplicationContext.prototype.getDebugCount = function() {
	return this.debugCounter;
};

JkConsoleConsoleApplicationContext.prototype.logError = function(message) {
	if(this.showError && this.enableOutput) {
		this.doPrintLine("ERROR", 91, this.currentPrefix, message);
	}
	this.errorCounter++;
};

JkConsoleConsoleApplicationContext.prototype.logWarning = function(message) {
	if(this.showWarning && this.enableOutput) {
		this.doPrintLine("WARNING", 95, this.currentPrefix, message);
	}
	this.warningCounter++;
};

JkConsoleConsoleApplicationContext.prototype.logInfo = function(message) {
	if(this.showInfo && this.enableOutput) {
		this.doPrintLine("INFO", (-1), this.currentPrefix, message);
	}
	this.infoCounter++;
};

JkConsoleConsoleApplicationContext.prototype.logDebug = function(message) {
	if(this.showDebug && this.enableOutput) {
		this.doPrintLine("DEBUG", 96, this.currentPrefix, message);
	}
	this.debugCounter++;
};

JkConsoleConsoleApplicationContext.prototype.logStatus = function(message) {
	if(this.enableOutput && this.enableStatus) {
		if(this.currentPrefix != null && message != null) {
			this.doPrintStatus("[" + (JkLangString.safeString(this.currentPrefix)) + ("] ") + (JkLangString.safeString(message)));
		}
		else {
			this.doPrintStatus(message);
		}
	}
};

JkConsoleConsoleApplicationContext.prototype.getApplicationDataDirectory = function() {
	return this.getApplicationDataDirectoryForAppId(this.applicationName);
};

JkConsoleConsoleApplicationContext.prototype.getApplicationDataDirectoryForAppId = function(appId) {
	var applicationName = appId;
	if(JkLangString.isEmpty(applicationName)) {
		applicationName = JkProcessCurrentProcess.getProcessName();
	}
	if(JkLangString.isEmpty(applicationName)) {
		return null;
	}
	var v = null;
	if(v == null) {
		v = JkFsFile.forRelativePath("." + (JkLangString.safeString(applicationName)), (JkEnvCommonPath.getHomeDirectory()), false);
	}
	return v;
};

JkConsoleConsoleApplicationContext.prototype.doPrintLine = function(type, color, prefix, message) {
	if(this.autoClearStatus) {
		this.doPrintStatus(null);
	}
	var sb = JkLangStringBuilder.NEW();
	if(this.lastStatus) {
		sb.appendCharacter('\n'.charCodeAt());
	}
	if(type != null || prefix != null) {
		sb.appendCharacter('['.charCodeAt());
		if(this.dumbMode == false && this.enableColor && color >= 0) {
			sb.appendCharacter(0x1b);
			sb.appendCharacter('['.charCodeAt());
			sb.appendInteger(color);
			sb.appendCharacter('m'.charCodeAt());
		}
		if(type != null) {
			sb.appendString(type);
			if(prefix != null) {
				sb.appendCharacter(':'.charCodeAt());
			}
		}
		if(prefix != null) {
			sb.appendString(prefix);
		}
		if(this.dumbMode == false && this.enableColor && color >= 0) {
			sb.appendCharacter(0x1b);
			sb.appendString("[39m");
		}
		sb.appendCharacter(']'.charCodeAt());
		sb.appendCharacter(' '.charCodeAt());
	}
	sb.appendString(message);
	sb.appendCharacter('\n'.charCodeAt());
	if(this.stdout != null) {
		this.stdout.print((sb.toString()));
	}
	this.lastStatus = false;
};

JkConsoleConsoleApplicationContext.prototype.doPrintStatus = function(m) {
	if(this.showDebug && m != null) {
		this.doPrintLine(null, (-1), null, m);
		return;
	}
	if(this.dumbMode) {
		if(m == null) {
			return;
		}
		if(this.stdout != null) {
			this.stdout.print((JkLangString.safeString(m)) + ("\n"));
		}
		return;
	}
	if(this.lastStatusLength < 1 && m == null) {
		return;
	}
	var sb = JkLangStringBuilder.NEW();
	sb.appendCharacter('\r'.charCodeAt());
	for(var n = 0 ; n < this.lastStatusLength ; n++) {
		sb.appendCharacter(' '.charCodeAt());
	}
	sb.appendCharacter('\r'.charCodeAt());
	var rm = m;
	if(rm != null) {
		var width = 0;
		if(width > 0 && JkLangString.getLength(rm) >= width) {
			rm = (JkLangString.safeString((JkLangString.getSubString(rm, 0, (width - 4))))) + (" ..");
		}
		sb.appendString(rm);
	}
	if(this.stdout != null) {
		this.stdout.print((sb.toString()));
	}
	if(m != null) {
		this.lastStatusLength = JkLangString.getLength(rm);
	}
	else {
		this.lastStatusLength = 0;
	}
	if(rm == null) {
		this.lastStatus = false;
	}
	else {
		this.lastStatus = true;
	}
};

JkConsoleConsoleApplicationContext.prototype.getApplicationName = function() {
	return this.applicationName;
};

JkConsoleConsoleApplicationContext.prototype.setApplicationName = function(v) {
	this.applicationName = v;
	return this;
};

JkConsoleConsoleApplicationContext.prototype.getEnableColor = function() {
	return this.enableColor;
};

JkConsoleConsoleApplicationContext.prototype.setEnableColor = function(v) {
	this.enableColor = v;
	return this;
};

JkConsoleConsoleApplicationContext.prototype.getDumbMode = function() {
	return this.dumbMode;
};

JkConsoleConsoleApplicationContext.prototype.setDumbMode = function(v) {
	this.dumbMode = v;
	return this;
};

JkConsoleConsoleApplicationContext.prototype.getShowInfo = function() {
	return this.showInfo;
};

JkConsoleConsoleApplicationContext.prototype.setShowInfo = function(v) {
	this.showInfo = v;
	return this;
};

JkConsoleConsoleApplicationContext.prototype.getShowWarning = function() {
	return this.showWarning;
};

JkConsoleConsoleApplicationContext.prototype.setShowWarning = function(v) {
	this.showWarning = v;
	return this;
};

JkConsoleConsoleApplicationContext.prototype.getShowError = function() {
	return this.showError;
};

JkConsoleConsoleApplicationContext.prototype.setShowError = function(v) {
	this.showError = v;
	return this;
};

JkConsoleConsoleApplicationContext.prototype.getShowDebug = function() {
	return this.showDebug;
};

JkConsoleConsoleApplicationContext.prototype.setShowDebug = function(v) {
	this.showDebug = v;
	return this;
};

JkConsoleConsoleApplicationContext.prototype.getEnableStatus = function() {
	return this.enableStatus;
};

JkConsoleConsoleApplicationContext.prototype.setEnableStatus = function(v) {
	this.enableStatus = v;
	return this;
};

JkConsoleConsoleApplicationContext.prototype.getEnableOutput = function() {
	return this.enableOutput;
};

JkConsoleConsoleApplicationContext.prototype.setEnableOutput = function(v) {
	this.enableOutput = v;
	return this;
};

JkConsoleConsoleApplicationContext.prototype.getAutoClearStatus = function() {
	return this.autoClearStatus;
};

JkConsoleConsoleApplicationContext.prototype.setAutoClearStatus = function(v) {
	this.autoClearStatus = v;
	return this;
};

JkConsoleConsoleApplicationContext.prototype.getCurrentPrefix = function() {
	return this.currentPrefix;
};

JkConsoleConsoleApplicationContext.prototype.setCurrentPrefix = function(v) {
	this.currentPrefix = v;
	return this;
};

JkConsoleConsoleApplicationContext.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkConsoleConsoleApplicationContext"] === true;
};

let JkConsoleConsoleApplicationUtil = function() {};

JkConsoleConsoleApplicationUtil.prototype._t = { "JkConsoleConsoleApplicationUtil" : true };
JkConsoleConsoleApplicationUtil.prototype._tobj = JkConsoleConsoleApplicationUtil;

JkConsoleConsoleApplicationUtil.NEW = function() {
	var v = new JkConsoleConsoleApplicationUtil;
	return v.CTOR_JkConsoleConsoleApplicationUtil();
};

JkConsoleConsoleApplicationUtil.prototype.CTOR_JkConsoleConsoleApplicationUtil = function() {
	return this;
};

JkConsoleConsoleApplicationUtil.printHeader = function(writer, title, version, copyright, license, platform, component) {
	if(!(writer != null)) {
		return;
	}
	var sb = JkLangStringBuilder.NEW();
	if(JkLangString.isEmpty(title)) {
		sb.appendString("Untitled Application");
	}
	else {
		sb.appendString(title);
	}
	if(JkLangString.isNotEmpty(component)) {
		if(sb.count() > 0) {
			sb.appendCharacter(' '.charCodeAt());
		}
		sb.appendString(component);
	}
	if(JkLangString.isNotEmpty(version)) {
		sb.appendString(" / ");
		sb.appendString(version);
	}
	if(JkLangString.isNotEmpty(platform)) {
		sb.appendString(" @ ");
		sb.appendString(platform);
	}
	if(sb.count() > 0) {
		sb.appendCharacter('\n'.charCodeAt());
	}
	if(JkLangString.isNotEmpty(copyright)) {
		sb.appendString(copyright);
		sb.appendCharacter('\n'.charCodeAt());
	}
	if(JkLangString.isNotEmpty(license)) {
		sb.appendString(license);
		sb.appendCharacter('\n'.charCodeAt());
	}
	if(sb.count() > 0) {
		sb.appendCharacter('\n'.charCodeAt());
	}
	if(sb.count() > 0) {
		writer.print((sb.toString()));
	}
};

JkConsoleConsoleApplicationUtil.printVersion = function(writer, version, title) {
	if(!(writer != null)) {
		return;
	}
	if(JkLangString.isNotEmpty(title)) {
		writer.println((JkLangString.safeString(title)) + ("/") + (JkLangString.safeString(version)));
	}
	else {
		writer.println(version);
	}
};

JkConsoleConsoleApplicationUtil.parseCommandLineArguments = function(args) {
	var v = new Array;
	if(args != null) {
		var n = 0;
		var m = args.length;
		for(n = 0 ; n < m ; n++) {
			var arg = args[n];
			if(arg != null) {
				if(JkLangString.startsWith(arg, "-", 0)) {
					if(JkLangString.getIndexOfCharacter(arg, '='.charCodeAt(), 0) > 0) {
						var comps = JkLangString.split(arg, '='.charCodeAt(), 2);
						var key = JkLangString.getEndOfString(comps[0], 1);
						var val = comps[1];
						v.push(JkConsoleCommandLineArgument.NEW_StringStringStringStringString(arg, null, null, key, val));
					}
					else {
						v.push(JkConsoleCommandLineArgument.NEW_StringStringStringStringString(arg, null, (JkLangString.getEndOfString(arg, 1)), null, "true"));
					}
				}
				else {
					v.push(JkConsoleCommandLineArgument.NEW_StringStringStringStringString(arg, arg, null, null, arg));
				}
			}
		}
	}
	return v;
};

JkConsoleConsoleApplicationUtil.getLongestString = function(strings, add, ov) {
	var v = ov;
	if(strings != null) {
		var n = 0;
		var m = strings.length;
		for(n = 0 ; n < m ; n++) {
			var value = (function(o) {
				if(o instanceof Array) {
					return o;
				}
				return null;
			}.bind(this))(strings[n]);
			if(value != null) {
				var ss = JkLangString.getLength((JkLangString.asString(value[0]))) + add;
				if(ss > v) {
					v = ss;
				}
			}
		}
	}
	return v;
};

JkConsoleConsoleApplicationUtil.printUsage = function(stdout, name, parameters, flags, options) {
	var nn = name;
	if(JkLangString.isEmpty(nn)) {
		nn = JkProcessCurrentProcess.getProcessName();
	}
	if(JkLangString.isEmpty(nn)) {
		nn = "(command)";
	}
	var ll = 0;
	ll = JkConsoleConsoleApplicationUtil.getLongestString(parameters, 0, ll);
	ll = JkConsoleConsoleApplicationUtil.getLongestString(flags, 1, ll);
	ll = JkConsoleConsoleApplicationUtil.getLongestString(options, 9, ll);
	stdout.print("Usage: " + (JkLangString.safeString(nn)) + (" [parameters, flags and options]\n"));
	if(JkLangArray.isEmpty(parameters) == false) {
		stdout.print("\n");
		stdout.print("Supported Parameters:\n");
		stdout.print("\n");
		if(parameters != null) {
			var n = 0;
			var m = parameters.length;
			for(n = 0 ; n < m ; n++) {
				var parameter = (function(o) {
					if(o instanceof Array) {
						return o;
					}
					return null;
				}.bind(this))(parameters[n]);
				if(parameter != null) {
					stdout.print("  " + (JkLangString.safeString((JkTextStringUtil.padToLength((JkLangString.asString(parameter[0])), ll, (-1), ' '.charCodeAt())))) + (" - ") + (JkLangString.safeString((JkLangString.asString(parameter[1])))) + ("\n"));
				}
			}
		}
	}
	if(JkLangArray.isEmpty(flags) == false) {
		stdout.print("\n");
		stdout.print("Supported Flags:\n");
		stdout.print("\n");
		if(flags != null) {
			var n2 = 0;
			var m2 = flags.length;
			for(n2 = 0 ; n2 < m2 ; n2++) {
				var flag = (function(o1) {
					if(o1 instanceof Array) {
						return o1;
					}
					return null;
				}.bind(this))(flags[n2]);
				if(flag != null) {
					stdout.print("  -" + (JkLangString.safeString((JkTextStringUtil.padToLength((JkLangString.asString(flag[0])), ll, (-1), ' '.charCodeAt())))) + (" - ") + (JkLangString.safeString((JkLangString.asString(flag[1])))) + ("\n"));
				}
			}
		}
	}
	if(JkLangArray.isEmpty(options) == false) {
		stdout.print("\n");
		stdout.print("Supported Options:\n");
		stdout.print("\n");
		if(options != null) {
			var n3 = 0;
			var m3 = options.length;
			for(n3 = 0 ; n3 < m3 ; n3++) {
				var option = (function(o2) {
					if(o2 instanceof Array) {
						return o2;
					}
					return null;
				}.bind(this))(options[n3]);
				if(option != null) {
					stdout.print("  -" + (JkLangString.safeString((JkTextStringUtil.padToLength((JkLangString.safeString((JkLangString.asString(option[0])))) + ("=<value>"), ll, (-1), ' '.charCodeAt())))) + (" - ") + (JkLangString.safeString((JkLangString.asString(option[1])))) + ("\n"));
				}
			}
		}
	}
	stdout.print("\n");
};

JkConsoleConsoleApplicationUtil.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkConsoleConsoleApplicationUtil"] === true;
};

let JkConsoleTerminal = function() {};

JkConsoleTerminal.prototype._t = { "JkConsoleTerminal" : true };
JkConsoleTerminal.prototype._tobj = JkConsoleTerminal;

JkConsoleTerminal.NEW = function() {
	var v = new JkConsoleTerminal;
	return v.CTOR_JkConsoleTerminal();
};

JkConsoleTerminal.prototype.CTOR_JkConsoleTerminal = function() {
	return this;
};

JkConsoleTerminal.forCurrent = function() {
	return null;
};

JkConsoleTerminal.prototype.clear = function() {};

JkConsoleTerminal.prototype.moveTo = function(x, y) {};

JkConsoleTerminal.prototype.print = function(text) {};

JkConsoleTerminal.prototype.printTo = function(x, y, text) {};

JkConsoleTerminal.prototype.readKey = function() {};

JkConsoleTerminal.prototype.readLine = function() {};

JkConsoleTerminal.prototype.readLineWithoutEcho = function() {};

JkConsoleTerminal.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkConsoleTerminal"] === true;
};

let JkConsoleArgumentVector = function() {
	this.args = null;
	this.position = 0;
	this.optionValue = null;
};

JkConsoleArgumentVector.prototype._t = { "JkConsoleArgumentVector" : true };
JkConsoleArgumentVector.prototype._tobj = JkConsoleArgumentVector;

JkConsoleArgumentVector.NEW = function() {
	var v = new JkConsoleArgumentVector;
	return v.CTOR_JkConsoleArgumentVector();
};

JkConsoleArgumentVector.prototype.CTOR_JkConsoleArgumentVector = function() {
	this.optionValue = null;
	this.position = 0;
	this.args = null;
	return this;
};

JkConsoleArgumentVector.forStringVector = function(args) {
	var v = JkConsoleArgumentVector.NEW();
	v.setArgs(args);
	return v;
};

JkConsoleArgumentVector.forArray = function(args) {
	var v = JkConsoleArgumentVector.NEW();
	var vv = new Array;
	if(args != null) {
		var n = 0;
		var m = args.length;
		for(n = 0 ; n < m ; n++) {
			var arg = args[n];
			if(arg != null) {
				vv.push(arg);
			}
		}
	}
	v.setArgs(vv);
	return v;
};

JkConsoleArgumentVector.prototype.getCurrent = function() {
	if(!(this.args != null)) {
		return null;
	}
	return JkLangVector.get(this.args, this.position);
};

JkConsoleArgumentVector.prototype.moveToNext = function() {
	this.position++;
};

JkConsoleArgumentVector.prototype.hasMore = function() {
	if(!(this.args != null)) {
		return false;
	}
	if(this.position < JkLangVector.getSize(this.args)) {
		return true;
	}
	return false;
};

JkConsoleArgumentVector.prototype.acceptFlag = function(flag) {
	if(!(flag != null)) {
		return false;
	}
	var cc = this.getCurrent();
	if(!(cc != null)) {
		return false;
	}
	if(cc == "-" + (JkLangString.safeString(flag))) {
		this.moveToNext();
		return true;
	}
	if(cc == "--" + (JkLangString.safeString(flag))) {
		this.moveToNext();
		return true;
	}
	return false;
};

JkConsoleArgumentVector.prototype.acceptOption = function(str) {
	if(!JkLangString.isNotEmpty(str)) {
		return false;
	}
	var cc = this.getCurrent();
	if(!(cc != null)) {
		return false;
	}
	var f1 = "-" + (JkLangString.safeString(str));
	var f2 = "--" + (JkLangString.safeString(str));
	if(JkLangString.startsWith(cc, (JkLangString.safeString(f1)) + ("="), 0)) {
		this.moveToNext();
		this.optionValue = JkLangString.getEndOfString(cc, (JkLangString.getLength(f1) + 1));
		return true;
	}
	if(JkLangString.startsWith(cc, (JkLangString.safeString(f2)) + ("="), 0)) {
		this.moveToNext();
		this.optionValue = JkLangString.getEndOfString(cc, (JkLangString.getLength(f2) + 1));
		return true;
	}
	if(cc == f1 || cc == f2) {
		this.moveToNext();
		this.optionValue = this.getCurrent();
		if(!(this.optionValue != null)) {
			this.position--;
		}
		else {
			this.moveToNext();
			return true;
		}
	}
	return false;
};

JkConsoleArgumentVector.prototype.acceptValue = function(value) {
	if(!(value != null)) {
		return false;
	}
	var cc = this.getCurrent();
	if(!(cc != null)) {
		return false;
	}
	if(cc == value) {
		this.moveToNext();
		return true;
	}
	return false;
};

JkConsoleArgumentVector.prototype.acceptAnyValue = function() {
	var cc = this.getCurrent();
	if(!(cc != null)) {
		return null;
	}
	this.moveToNext();
	return cc;
};

JkConsoleArgumentVector.prototype.acceptParameter = function() {
	var cc = this.getCurrent();
	if(!(cc != null)) {
		return null;
	}
	if(JkLangString.startsWith(cc, "-", 0)) {
		return null;
	}
	this.moveToNext();
	return cc;
};

JkConsoleArgumentVector.prototype.requireParameter = function(name) {
	var v = this.acceptParameter();
	if(!(v != null)) {
		JkLangError._throw("missingValue", name);
	}
	return v;
};

JkConsoleArgumentVector.prototype.acceptAllValues = function() {
	var v = new Array;
	while(true){
		var cc = this.acceptAnyValue();
		if(cc != null) {
			v.push(cc);
		}
		else {
			break;
		}
	}
	return v;
};

JkConsoleArgumentVector.prototype.getArgs = function() {
	return this.args;
};

JkConsoleArgumentVector.prototype.setArgs = function(v) {
	this.args = v;
	return this;
};

JkConsoleArgumentVector.prototype.getPosition = function() {
	return this.position;
};

JkConsoleArgumentVector.prototype.setPosition = function(v) {
	this.position = v;
	return this;
};

JkConsoleArgumentVector.prototype.getOptionValue = function() {
	return this.optionValue;
};

JkConsoleArgumentVector.prototype.setOptionValue = function(v) {
	this.optionValue = v;
	return this;
};

JkConsoleArgumentVector.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkConsoleArgumentVector"] === true;
};
