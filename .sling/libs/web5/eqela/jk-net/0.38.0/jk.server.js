let JkServerCommonServer = function() {
	this.listenPort = 0;
	this.loggingDirectory = null;
	this.configFile = null;
	this.enableDebugMessages = false;
	this.duplicateLoggingOnConsole = false;
	this.ctx = null;
	this.configuration = new Map;
};

JkServerCommonServer.prototype._t = { "JkServerCommonServer" : true };
JkServerCommonServer.prototype._tobj = JkServerCommonServer;

JkServerCommonServer.NEW = function() {
	var v = new JkServerCommonServer;
	return v.CTOR_JkServerCommonServer();
};

JkServerCommonServer.prototype.CTOR_JkServerCommonServer = function() {
	this.configuration = new Map;
	this.ctx = null;
	this.duplicateLoggingOnConsole = false;
	this.enableDebugMessages = false;
	this.configFile = null;
	this.loggingDirectory = null;
	this.listenPort = 0;
	this.ctx = JkConsoleConsoleApplicationContext.NEW();
	this.initConfigValue("LISTEN_PORT", "8080");
	this.initConfigValue("LOGGING_DIRECTORY", null);
	this.initConfigValue("ENABLE_DEBUG_MESSAGES", "false");
	this.initConfigValue("DUPLICATE_LOGGING_ON_CONSOLE", "false");
	return this;
};

JkServerCommonServer.prototype.getCtx = function() {
	return this.ctx;
};

JkServerCommonServer.prototype.getLoggingDirectory = function() {
	return this.loggingDirectory;
};

JkServerCommonServer.prototype.getListenPort = function() {
	return this.listenPort;
};

JkServerCommonServer.prototype.getConfigfromEnvironment = function(name) {
	if(!(name != null)) {
		return null;
	}
	var depvar = "SYMPATHY_" + (JkLangString.safeString(name));
	var v = JkEnvEnvironmentVariable.get(depvar);
	if(v != null) {
		JkLogLog.warning(this.ctx, "Accepting deprecated configuration variable `" + (JkLangString.safeString(depvar)) + ("'. Use `") + (JkLangString.safeString(name)) + ("' instead."));
		return v;
	}
	return JkEnvEnvironmentVariable.get(name);
};

JkServerCommonServer.prototype.getConfigFileDirectory = function() {
	if(this.configFile == null) {
		return null;
	}
	return this.configFile.getParent();
};

JkServerCommonServer.prototype.onMaintenance = function() {
};

JkServerCommonServer.prototype.initConfigValue = function(key, value) {
	if(!(key != null)) {
		return;
	}
	var vv = this.getConfigfromEnvironment(key);
	if(!(vv != null)) {
		vv = value;
	}
	this.doConfigure(key, vv, null);
};

JkServerCommonServer.prototype.setConfigValue = function(key, value) {
	this.doConfigure(key, value, null);
	return this;
};

JkServerCommonServer.prototype.configure = function(key, value, relativeTo, error) {
	if(key == "LISTEN_PORT" || key == "listenPort") {
		this.listenPort = JkLangInteger.asInteger(value);
		return true;
	}
	if(key == "LOGGING_DIRECTORY" || key == "loggingDirectory") {
		if(JkLangString.isNotEmpty(value)) {
			this.loggingDirectory = JkFsFile.forRelativePath(value, relativeTo, false);
		}
		else {
			this.loggingDirectory = null;
		}
		return true;
	}
	if(key == "ENABLE_DEBUG_MESSAGES" || key == "enableDebugMessages") {
		this.enableDebugMessages = JkLangBoolean.asBoolean(value, false);
		return true;
	}
	if(key == "DUPLICATE_LOGGING_ON_CONSOLE" || key == "duplicateLoggingOnConsole") {
		this.duplicateLoggingOnConsole = JkLangBoolean.asBoolean(value, false);
		return true;
	}
	return false;
};

JkServerCommonServer.prototype.doConfigure = function(key, value, relativeTo) {
	var error = JkLangError.NEW();
	var vv = value;
	if(!(vv != null)) {
		vv = "";
	}
	if(this.configure(key, vv, relativeTo, error) == false) {
		if(JkLangString.isEmpty((error.getCode()))) {
			error.setCode("unsupportedConfigurationOption");
			error.setDetail(key);
		}
		JkLogLog.error(this.ctx, (JkLogLog.asString(this.ctx, error)));
		return false;
	}
	JkLangMap.set(this.configuration, key, vv);
	return true;
};

JkServerCommonServer.prototype.printUsage = function(stdout) {
	var flags = [["debug", "Enable debug messages in logging"], ["v|version|vv", "Display version information"], ["h|help", "Usage information"]];
	var options = [["config", "Specify a configuration file to use"], ["listen", "Specify the TCP port to listen to"], ["O<option>", "Manually specify configuration parameters (key/value pairs)"]];
	JkConsoleConsoleApplicationUtil.printUsage(stdout, null, null, flags, options);
};

JkServerCommonServer.prototype.printHeader = function(stdout) {
};

JkServerCommonServer.prototype.printVersion = function(stdout, longFormat) {
};

JkServerCommonServer.prototype.logServerConfiguration = function() {
	var sb = JkLangStringBuilder.NEW();
	sb.appendString("Server configuration:");
	var keys = JkLangMap.getKeys(this.configuration);
	JkLangVector.sortAsStrings(keys);
	if(keys != null) {
		var n = 0;
		var m = keys.length;
		for(n = 0 ; n < m ; n++) {
			var key = keys[n];
			if(key != null) {
				sb.appendString("\n  ");
				sb.appendString(key);
				sb.appendString(": ");
				sb.appendString((JkLangMap.get(this.configuration, key)));
			}
		}
	}
	JkLogLog.info(this.ctx, (sb.toString()));
};

JkServerCommonServer.prototype.acceptCommandLineArgument = function(arg) {
	return false;
};

JkServerCommonServer.prototype.execute = function(args) {
	var stdout = JkConsoleStdout.instance();
	var _arguments = JkConsoleConsoleApplicationUtil.parseCommandLineArguments(args);
	if(_arguments != null) {
		var n = 0;
		var m = _arguments.length;
		for(n = 0 ; n < m ; n++) {
			var arg = _arguments[n];
			if(arg != null) {
				if(arg.isFlag("v") || arg.isFlag("version")) {
					this.printVersion(stdout, false);
					return true;
				}
				else if(arg.isFlag("vv")) {
					this.printVersion(stdout, true);
					return true;
				}
			}
		}
	}
	this.printHeader(stdout);
	var showHelp = false;
	var options = JkLangKeyValueListForStrings.NEW();
	if(_arguments != null) {
		var n2 = 0;
		var m2 = _arguments.length;
		for(n2 = 0 ; n2 < m2 ; n2++) {
			var arg1 = _arguments[n2];
			if(arg1 != null) {
				if(arg1.isOption("config")) {
					if(this.configFile != null) {
						JkLogLog.error(this.ctx, "Duplicate config file parameter supplied: `" + (JkLangString.safeString((arg1.getComplete()))) + ("'"));
						return false;
					}
					this.configFile = JkFsFile.forPath((arg1.getStringValue()));
				}
				else if(arg1.isFlag("help") || arg1.isFlag("h")) {
					showHelp = true;
				}
				else if(arg1.isFlag("debug")) {
					this.enableDebugMessages = true;
				}
				else if(arg1.isOption("listen")) {
					this.listenPort = arg1.getIntegerValue();
				}
				else if(arg1.key != null && JkLangString.startsWith(arg1.key, "O", 0)) {
					var key = JkLangString.getEndOfString(arg1.key, 1);
					if(JkLangString.isEmpty(key)) {
						JkLogLog.error(this.ctx, "Invalid option parameter: `" + (JkLangString.safeString((arg1.getComplete()))) + ("'"));
						return false;
					}
					options.add(key, (arg1.getStringValue()));
				}
				else if(this.acceptCommandLineArgument(arg1)) {
					;
				}
				else {
					arg1.reportAsUnsupported(this.ctx);
					return false;
				}
			}
		}
	}
	if(showHelp) {
		this.printUsage(stdout);
		return true;
	}
	if(this.configFile != null) {
		var config = JkServerSimpleConfigFile.forFile(this.configFile);
		if(config == null) {
			JkLogLog.error(this.ctx, "Failed to read configuration file: `" + (JkLangString.safeString((this.configFile.getPath()))) + ("'"));
			return false;
		}
		var it = config.iterate();
		while(it != null){
			var kvp = it.next();
			if(kvp == null) {
				break;
			}
			var key1 = kvp.key;
			var value = kvp.value;
			if(this.doConfigure(key1, value, (this.configFile.getParent())) == false) {
				return false;
			}
		}
	}
	var oit = options.iterate();
	while(oit != null){
		var kvp1 = oit.next();
		if(kvp1 == null) {
			break;
		}
		var key2 = kvp1.key;
		var value1 = kvp1.value;
		if(this.doConfigure(key2, value1, null) == false) {
			return false;
		}
	}
	if(this.loggingDirectory != null) {
		JkLogLog.debug(this.ctx, "Configuring logging to directory: `" + (JkLangString.safeString((this.loggingDirectory.getPath()))) + ("'"));
		var dlc = JkServerDirectoryLoggingContext.create(this.loggingDirectory, null, true);
		if(this.enableDebugMessages) {
			dlc.setEnableDebugMessages(true);
		}
		dlc.setAlsoPrintOnConsole(this.duplicateLoggingOnConsole);
		this.ctx = dlc;
	}
	else {
		var cac = (function(o) {
			if(JkConsoleConsoleApplicationContext.IS_INSTANCE && JkConsoleConsoleApplicationContext.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))(this.ctx);
		if(cac != null && this.enableDebugMessages) {
			cac.setEnableDebugMessages(true);
		}
	}
	return this.executeServer();
};

JkServerCommonServer.prototype.executeMain = function(args) {
	return this.execute(args) ? 0 : 1;
};

JkServerCommonServer.prototype.initializeWithIOManager = function(ioManager, ctx) {
	return true;
};

JkServerCommonServer.prototype.initializeNetworkServer = function(server) {
	return true;
};

JkServerCommonServer.prototype.initializeApplication = function() {
	return true;
};

JkServerCommonServer.prototype.createServer = function() {};

JkServerCommonServer.prototype.executeServer = function() {
	this.logServerConfiguration();
	if(!this.initializeApplication()) {
		JkLogLog.error(this.ctx, "Failed to initialize application");
		return false;
	}
	var server = this.createServer();
	if(!(server != null)) {
		JkLogLog.error(this.ctx, "Failed to create server object");
		return false;
	}
	if(!this.initializeNetworkServer(server)) {
		JkLogLog.error(this.ctx, "Failed to configure HTTP server");
		return false;
	}
	var ioManager = JkSocketIoIOManager.createDefault();
	if(!(ioManager != null)) {
		JkLogLog.error(this.ctx, "FAILED to create IO manager");
		return false;
	}
	JkSocketIoIOManager.setCurrent(ioManager);
	if(!server.initialize1(ioManager, this.ctx)) {
		JkLogLog.error(this.ctx, "Failed to initialize HTTP server.");
		return false;
	}
	if(!this.initializeWithIOManager(ioManager, this.ctx)) {
		JkLogLog.error(this.ctx, "Failed to initialize with IOManager");
		return false;
	}
	JkLogLog.info(this.ctx, "Server initialized and ready for connections.");
	if(!ioManager.execute(this.ctx)) {
		JkLogLog.error(this.ctx, "Failed to execute IO manager");
		return false;
	}
	JkLogLog.info(this.ctx, "Server exiting, cleaning up..");
	server.cleanup();
	JkLogLog.info(this.ctx, "Server terminated.");
	return true;
};

JkServerCommonServer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkServerCommonServer"] === true;
};

let JkServerDirectoryLoggingContext = function() {
	this.logDir = null;
	this.logIdPrefix = "messages";
	this.currentLogIdName = null;
	this.os = null;
	this.ctx = null;
	this.enableDebugMessages = true;
	this.alsoPrintOnConsole = false;
	this.errorCount = 0;
	this.warningCount = 0;
	this.infoCount = 0;
	this.debugCount = 0;
};

JkServerDirectoryLoggingContext.prototype._t = {
	"JkLogLoggingContext" : true,
	"JkServerDirectoryLoggingContext" : true
};
JkServerDirectoryLoggingContext.prototype._tobj = JkServerDirectoryLoggingContext;

JkServerDirectoryLoggingContext.NEW = function() {
	var v = new JkServerDirectoryLoggingContext;
	return v.CTOR_JkServerDirectoryLoggingContext();
};

JkServerDirectoryLoggingContext.prototype.CTOR_JkServerDirectoryLoggingContext = function() {
	this.debugCount = 0;
	this.infoCount = 0;
	this.warningCount = 0;
	this.errorCount = 0;
	this.alsoPrintOnConsole = false;
	this.enableDebugMessages = true;
	this.ctx = null;
	this.os = null;
	this.currentLogIdName = null;
	this.logIdPrefix = "messages";
	this.logDir = null;
	return this;
};

JkServerDirectoryLoggingContext.create = function(logDir, logIdPrefix, dbg) {
	var v = JkServerDirectoryLoggingContext.NEW();
	v.setLogDir(logDir);
	v.setEnableDebugMessages(dbg);
	if(JkLangString.isNotEmpty(logIdPrefix)) {
		v.setLogIdPrefix(logIdPrefix);
	}
	return v;
};

JkServerDirectoryLoggingContext.prototype.setEnableDebugMessages = function(value) {
	this.enableDebugMessages = value;
	var cac = (function(o) {
		if(JkConsoleConsoleApplicationContext.IS_INSTANCE && JkConsoleConsoleApplicationContext.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(this.ctx);
	if(cac != null) {
		cac.setEnableDebugMessages(this.enableDebugMessages);
	}
};

JkServerDirectoryLoggingContext.prototype.setAlsoPrintOnConsole = function(value) {
	this.alsoPrintOnConsole = value;
	if(this.alsoPrintOnConsole) {
		this.ctx = JkConsoleConsoleApplicationContext.NEW().setEnableDebugMessages(this.enableDebugMessages);
		return;
	}
	this.ctx = null;
};

JkServerDirectoryLoggingContext.prototype.logError = function(text) {
	this.message("ERROR", text);
	this.errorCount++;
};

JkServerDirectoryLoggingContext.prototype.logWarning = function(text) {
	this.message("WARNING", text);
	this.warningCount++;
};

JkServerDirectoryLoggingContext.prototype.logInfo = function(text) {
	this.message("INFO", text);
	this.infoCount++;
};

JkServerDirectoryLoggingContext.prototype.logDebug = function(text) {
	this.message("DEBUG", text);
	this.debugCount++;
};

JkServerDirectoryLoggingContext.prototype.logStatus = function(text) {
	this.message("STATUS", text);
};

JkServerDirectoryLoggingContext.prototype.message = function(type, text) {
	if(!this.enableDebugMessages && JkLangString.equalsIgnoreCase("debug", type)) {
		return;
	}
	var dt = JkTimeSystemClock.asDateTimeUTC();
	var logTime = null;
	if(dt != null) {
		logTime = (JkLangString.safeString((JkLangString.forInteger((dt.getYear()))))) + ("-") + (JkLangString.safeString((JkLangString.forIntegerWithPadding((dt.getMonth()), 2, null)))) + ("-") + (JkLangString.safeString((JkLangString.forIntegerWithPadding((dt.getDayOfMonth()), 2, null)))) + (" ") + (JkLangString.safeString((JkLangString.forIntegerWithPadding((dt.getHours()), 2, null)))) + (":") + (JkLangString.safeString((JkLangString.forIntegerWithPadding((dt.getMinutes()), 2, null)))) + (":") + (JkLangString.safeString((JkLangString.forIntegerWithPadding((dt.getSeconds()), 2, null)))) + (" UTC");
	}
	else {
		logTime = "DATE/TIME";
	}
	var logLine = "[" + (JkLangString.safeString(logTime)) + ("]: ") + (JkLangString.safeString(text));
	if(this.alsoPrintOnConsole) {
		if("ERROR" == type) {
			JkLogLog.error(this.ctx, logLine);
		}
		else if("WARNING" == type) {
			JkLogLog.warning(this.ctx, logLine);
		}
		else if("INFO" == type) {
			JkLogLog.info(this.ctx, logLine);
		}
		else if("DEBUG" == type) {
			JkLogLog.debug(this.ctx, logLine);
		}
		else if("STATUS" == type) {
			JkLogLog.status(this.ctx, logLine);
		}
	}
	logLine = "[" + (JkLangString.safeString((JkTextStringUtil.padToLength(type, 7, (-1), ' '.charCodeAt())))) + ("] ") + (JkLangString.safeString(logLine));
	if(this.logDir != null) {
		var logIdName = null;
		if(dt != null) {
			logIdName = (JkLangString.safeString(this.logIdPrefix)) + ("_") + (JkLangString.safeString((JkLangString.forInteger((dt.getYear()))))) + (JkLangString.safeString((JkLangString.forIntegerWithPadding((dt.getMonth()), 2, null)))) + (JkLangString.safeString((JkLangString.forIntegerWithPadding((dt.getDayOfMonth()), 2, null)))) + (".log");
		}
		else {
			logIdName = (JkLangString.safeString(this.logIdPrefix)) + (".log");
		}
		if(!(this.os != null) || !(this.currentLogIdName == logIdName)) {
			this.currentLogIdName = logIdName;
			this.os = JkIoPrintWriterWrapper.forWriter((this.logDir.entry(this.currentLogIdName).append()));
			if(!(this.os != null) && !this.logDir.isDirectory()) {
				this.logDir.createDirectoryRecursive();
				this.os = JkIoPrintWriterWrapper.forWriter((this.logDir.entry(this.currentLogIdName).append()));
			}
		}
		if(this.os != null) {
			if(!this.os.println(logLine)) {
				return;
			}
			if(JkIoFlushableWriter.IS_INSTANCE && JkIoFlushableWriter.IS_INSTANCE(this.os)) {
				this.os.flush();
			}
		}
	}
};

JkServerDirectoryLoggingContext.prototype.isInDebugMode = function() {
	return this.enableDebugMessages;
};

JkServerDirectoryLoggingContext.prototype.getErrorCount = function() {
	return this.errorCount;
};

JkServerDirectoryLoggingContext.prototype.getWarningCount = function() {
	return this.warningCount;
};

JkServerDirectoryLoggingContext.prototype.getInfoCount = function() {
	return this.infoCount;
};

JkServerDirectoryLoggingContext.prototype.getDebugCount = function() {
	return this.debugCount;
};

JkServerDirectoryLoggingContext.prototype.resetCounters = function() {
	this.errorCount = 0;
	this.warningCount = 0;
	this.infoCount = 0;
	this.debugCount = 0;
};

JkServerDirectoryLoggingContext.prototype.getLogDir = function() {
	return this.logDir;
};

JkServerDirectoryLoggingContext.prototype.setLogDir = function(v) {
	this.logDir = v;
	return this;
};

JkServerDirectoryLoggingContext.prototype.getLogIdPrefix = function() {
	return this.logIdPrefix;
};

JkServerDirectoryLoggingContext.prototype.setLogIdPrefix = function(v) {
	this.logIdPrefix = v;
	return this;
};

JkServerDirectoryLoggingContext.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkServerDirectoryLoggingContext"] === true;
};

let JkServerNetworkConnection = function() {
	this.storageIndex = 0;
	this.ioEntry = null;
	this.id = 0;
	this.logContext = null;
	this.socket = null;
	this.lastActivity = 0;
	this.remoteAddress = null;
	this.currentListenMode = -1;
	this.manager = null;
	this.defaultListenMode = 1;
};

JkServerNetworkConnection.prototype._t = { "JkServerNetworkConnection" : true };
JkServerNetworkConnection.prototype._tobj = JkServerNetworkConnection;

JkServerNetworkConnection.NEW = function() {
	var v = new JkServerNetworkConnection;
	return v.CTOR_JkServerNetworkConnection();
};

JkServerNetworkConnection.prototype.CTOR_JkServerNetworkConnection = function() {
	this.defaultListenMode = 1;
	this.manager = null;
	this.currentListenMode = -1;
	this.remoteAddress = null;
	this.lastActivity = 0;
	this.socket = null;
	this.logContext = null;
	this.id = 0;
	this.ioEntry = null;
	this.storageIndex = 0;
	this.id = JkServerNetworkConnection.idcounter++;
	return this;
};

JkServerNetworkConnection.prototype.getId = function() {
	return this.id;
};

JkServerNetworkConnection.prototype.exportSocket = function() {
	var v = this.socket;
	this.socket = null;
	return v;
};

JkServerNetworkConnection.prototype.getSocket = function() {
	return this.socket;
};

JkServerNetworkConnection.prototype.getManager = function() {
	return this.manager;
};

JkServerNetworkConnection.prototype.getLastActivity = function() {
	return this.lastActivity;
};

JkServerNetworkConnection.prototype.getRemoteAddress = function() {
	if(this.remoteAddress == null) {
		var ts = (function(o) {
			if(JkSocketTCPSocket.IS_INSTANCE && JkSocketTCPSocket.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))(this.socket);
		if(ts != null) {
			this.remoteAddress = (JkLangString.safeString((ts.getRemoteAddress()))) + (":") + (JkLangString.safeString((JkLangString.forInteger((ts.getRemotePort())))));
		}
	}
	return this.remoteAddress;
};

JkServerNetworkConnection.prototype.logDebug = function(text) {
	JkLogLog.debug(this.logContext, "[Connection:" + (JkLangString.safeString((JkLangString.forLongInteger((this.getId()))))) + ("] ") + (JkLangString.safeString(text)));
};

JkServerNetworkConnection.prototype.logInfo = function(text) {
	JkLogLog.info(this.logContext, "[Connection:" + (JkLangString.safeString((JkLangString.forLongInteger((this.getId()))))) + ("] ") + (JkLangString.safeString(text)));
};

JkServerNetworkConnection.prototype.logWarning = function(text) {
	JkLogLog.warning(this.logContext, "[Connection:" + (JkLangString.safeString((JkLangString.forLongInteger((this.getId()))))) + ("] ") + (JkLangString.safeString(text)));
};

JkServerNetworkConnection.prototype.logError = function(text) {
	JkLogLog.error(this.logContext, "[Connection:" + (JkLangString.safeString((JkLangString.forLongInteger((this.getId()))))) + ("] ") + (JkLangString.safeString(text)));
};

JkServerNetworkConnection.prototype.onActivity = function() {
	this.lastActivity = JkTimeSystemClock.asSeconds();
};

JkServerNetworkConnection.prototype.initialize = function() {
	return true;
};

JkServerNetworkConnection.prototype.cleanup = function() {
};

JkServerNetworkConnection.prototype.doInitialize = function(logContext, socket, manager) {
	this.logContext = logContext;
	this.socket = socket;
	this.manager = manager;
	if(!this.initialize()) {
		return false;
	}
	this.onActivity();
	return true;
};

JkServerNetworkConnection.prototype.getIoEntry = function() {
	return this.ioEntry;
};

JkServerNetworkConnection.prototype.setIoEntry = function(entry) {
	var v = false;
	this.ioEntry = entry;
	this.currentListenMode = -1;
	if(entry != null) {
		v = this.setListenMode((this.getDefaultListenMode()));
	}
	return v;
};

JkServerNetworkConnection.prototype.sendData = function(data, size) {
	if(this.socket == null) {
		return 0;
	}
	var v = this.socket.write(data, size);
	if(v < 0) {
		this.close();
	}
	this.onActivity();
	return v;
};

JkServerNetworkConnection.prototype.close = function() {
	var ss = this.socket;
	this.socket = null;
	if(this.ioEntry != null) {
		this.ioEntry.remove();
		this.ioEntry = null;
	}
	if(ss != null) {
		ss.close();
	}
	if(this.manager != null) {
		this.manager.onConnectionClosed(this);
	}
	this.cleanup();
	this.onClosed();
	this.socket = null;
	this.manager = null;
};

JkServerNetworkConnection.prototype.closeSocket = function() {
	if(this.socket != null) {
		this.socket.close();
	}
};

JkServerNetworkConnection.prototype.onReadReady = function() {
	if(!(this.socket != null)) {
		return;
	}
	var recvBuffer = null;
	if(this.manager != null) {
		recvBuffer = this.manager.getReceiveBuffer();
	}
	if(recvBuffer == null) {
		recvBuffer = new ArrayBuffer(1024);
	}
	var n = this.socket.read(recvBuffer);
	if(n < 0) {
		this.close();
	}
	else {
		this.onDataReceived(recvBuffer, n);
	}
	this.onActivity();
};

JkServerNetworkConnection.prototype.onWriteReady = function() {
};

JkServerNetworkConnection.prototype.enableIdleMode = function() {
	return this.setListenMode(0);
};

JkServerNetworkConnection.prototype.enableReadMode = function() {
	return this.setListenMode(1);
};

JkServerNetworkConnection.prototype.enableWriteMode = function() {
	return this.setListenMode(2);
};

JkServerNetworkConnection.prototype.enableReadWriteMode = function() {
	return this.setListenMode(3);
};

JkServerNetworkConnection.prototype.setListenMode = function(n) {
	if(this.ioEntry == null) {
		this.defaultListenMode = n;
		return true;
	}
	if(n == this.currentListenMode) {
		return true;
	}
	this.currentListenMode = n;
	var v = false;
	if(n == 0) {
		v = this.ioEntry.setListeners(null, null);
	}
	else if(n == 1) {
		v = this.ioEntry.setListeners((function() {
			this.onReadReady();
		}.bind(this)), null);
	}
	else if(n == 2) {
		v = this.ioEntry.setListeners(null, (function() {
			this.onWriteReady();
		}.bind(this)));
	}
	else if(n == 3) {
		v = this.ioEntry.setListeners((function() {
			this.onReadReady();
		}.bind(this)), (function() {
			this.onWriteReady();
		}.bind(this)));
	}
	if(!v) {
		JkLogLog.error(this.logContext, "Failed to set socket listening mode to " + (JkLangString.safeString((JkLangString.forInteger(n)))));
	}
	return v;
};

JkServerNetworkConnection.prototype.onOpened = function() {};

JkServerNetworkConnection.prototype.onDataReceived = function(data, size) {};

JkServerNetworkConnection.prototype.onClosed = function() {};

JkServerNetworkConnection.prototype.onError = function(message) {};

JkServerNetworkConnection.prototype.getStorageIndex = function() {
	return this.storageIndex;
};

JkServerNetworkConnection.prototype.setStorageIndex = function(v) {
	this.storageIndex = v;
	return this;
};

JkServerNetworkConnection.prototype.getDefaultListenMode = function() {
	return this.defaultListenMode;
};

JkServerNetworkConnection.prototype.setDefaultListenMode = function(v) {
	this.defaultListenMode = v;
	return this;
};

JkServerNetworkConnection.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkServerNetworkConnection"] === true;
};

JkServerNetworkConnection.idcounter = 0;

let JkServerNetworkConnectionManager = function() {
	this.logContext = null;
	this.ioManager = null;
	this.maxConnections = 100000;
	this.recvBufferSize = 32768;
	this.keyFile = null;
	this.certFile = null;
	this.acceptInvalidCertificate = false;
	this.passphrase = null;
	this.connections = null;
	this.recvBuffer = null;
};

JkServerNetworkConnectionManager.prototype._t = { "JkServerNetworkConnectionManager" : true };
JkServerNetworkConnectionManager.prototype._tobj = JkServerNetworkConnectionManager;

JkServerNetworkConnectionManager.NEW = function() {
	var v = new JkServerNetworkConnectionManager;
	return v.CTOR_JkServerNetworkConnectionManager();
};

JkServerNetworkConnectionManager.prototype.CTOR_JkServerNetworkConnectionManager = function() {
	this.recvBuffer = null;
	this.connections = null;
	this.passphrase = null;
	this.acceptInvalidCertificate = false;
	this.certFile = null;
	this.keyFile = null;
	this.recvBufferSize = 32768;
	this.maxConnections = 100000;
	this.ioManager = null;
	this.logContext = null;
	return this;
};

JkServerNetworkConnectionManager.prototype.createConnectionObject = function() {};

JkServerNetworkConnectionManager.prototype.setLogContext = function(ctx) {
	this.logContext = ctx;
	return this;
};

JkServerNetworkConnectionManager.prototype.getLogContext = function() {
	return this.logContext;
};

JkServerNetworkConnectionManager.prototype.setIoManager = function(io) {
	this.ioManager = io;
	return this;
};

JkServerNetworkConnectionManager.prototype.getIoManager = function() {
	return this.ioManager;
};

JkServerNetworkConnectionManager.prototype.iterateConnections = function() {
	return JkServerNetworkConnectionManagerConnectionIterator.NEW().setPool(this.connections);
};

JkServerNetworkConnectionManager.prototype.forEachConnection = function(_function) {
	var it = this.iterateConnections();
	if(!(it != null)) {
		return;
	}
	while(true){
		var cc = it.next();
		if(cc == null) {
			break;
		}
		_function(cc);
	}
};

JkServerNetworkConnectionManager.prototype.isInitialized = function() {
	return this.connections != null;
};

JkServerNetworkConnectionManager.prototype.initialize1 = function(ioManager, logContext) {
	if(!(ioManager != null)) {
		return false;
	}
	this.setLogContext(logContext);
	this.setIoManager(ioManager);
	return this.initialize2();
};

JkServerNetworkConnectionManager.prototype.initialize2 = function() {
	if(this.connections != null) {
		JkLogLog.error(this.logContext, "Already initialized");
		return false;
	}
	if(!(this.ioManager != null)) {
		JkLogLog.error(this.logContext, "No IO manager configured for connection server");
		return false;
	}
	this.recvBuffer = new ArrayBuffer(this.recvBufferSize);
	if(!(this.recvBuffer != null)) {
		JkLogLog.error(this.logContext, "Failed to allocate recv buffer");
		return false;
	}
	this.connections = JkServerNetworkConnectionManagerConnectionPool.NEW();
	if(!this.connections.initialize(this.logContext, this.maxConnections)) {
		JkLogLog.error(this.logContext, "Failed to initialize connection pool");
		this.connections = null;
		this.recvBuffer = null;
		return false;
	}
	return true;
};

JkServerNetworkConnectionManager.prototype.cleanup = function() {
	this.connections = null;
};

JkServerNetworkConnectionManager.prototype.onNewSocket = function(socket) {
	var s = socket;
	if(!(s != null)) {
		return;
	}
	if(this.certFile != null) {
		var sslSocket = JkSocketSslSSLSocket.forServer(s, this.certFile, this.keyFile, this.logContext, this.acceptInvalidCertificate, this.passphrase);
		if(!(sslSocket != null)) {
			JkLogLog.error(this.logContext, "Failed to create SSL socket");
			s.close();
			return;
		}
		s = sslSocket;
		JkLogLog.debug(this.logContext, "SSL socket created successfully");
	}
	var connection = this.createConnectionObject();
	if(!(connection != null)) {
		JkLogLog.error(this.logContext, "Failed to create TCP server connection object instance for incoming connection");
		s.close();
		return;
	}
	if(!connection.doInitialize(this.logContext, s, this)) {
		JkLogLog.error(this.logContext, "Failed to initialize the new connection instance. Closing connection.");
		s.close();
		return;
	}
	if(!this.addConnection(connection)) {
		JkLogLog.error(this.logContext, "Failed to add a new connection instance. Closing connection.");
		connection.close();
		return;
	}
	connection.onOpened();
};

JkServerNetworkConnectionManager.prototype.addConnection = function(connection) {
	if(!(connection != null && this.ioManager != null)) {
		return false;
	}
	var es = this.ioManager.add((connection.getSocket()));
	if(!(es != null)) {
		return false;
	}
	if(!connection.setIoEntry(es)) {
		es.remove();
		return false;
	}
	var idx = this.connections.add(this.logContext, connection);
	if(idx < 0) {
		return false;
	}
	connection.setStorageIndex(idx);
	return true;
};

JkServerNetworkConnectionManager.prototype.onConnectionClosed = function(connection) {
	if(!(connection != null)) {
		return;
	}
	connection.closeSocket();
	var es = connection.getIoEntry();
	if(es != null) {
		es.remove();
		connection.setIoEntry(null);
	}
	var si = connection.getStorageIndex();
	if(si >= 0) {
		this.connections.remove(this.logContext, si);
		connection.setStorageIndex((-1));
	}
};

JkServerNetworkConnectionManager.prototype.getReceiveBuffer = function() {
	return this.recvBuffer;
};

JkServerNetworkConnectionManager.prototype.getMaxConnections = function() {
	return this.maxConnections;
};

JkServerNetworkConnectionManager.prototype.setMaxConnections = function(v) {
	this.maxConnections = v;
	return this;
};

JkServerNetworkConnectionManager.prototype.getRecvBufferSize = function() {
	return this.recvBufferSize;
};

JkServerNetworkConnectionManager.prototype.setRecvBufferSize = function(v) {
	this.recvBufferSize = v;
	return this;
};

JkServerNetworkConnectionManager.prototype.getKeyFile = function() {
	return this.keyFile;
};

JkServerNetworkConnectionManager.prototype.setKeyFile = function(v) {
	this.keyFile = v;
	return this;
};

JkServerNetworkConnectionManager.prototype.getCertFile = function() {
	return this.certFile;
};

JkServerNetworkConnectionManager.prototype.setCertFile = function(v) {
	this.certFile = v;
	return this;
};

JkServerNetworkConnectionManager.prototype.getAcceptInvalidCertificate = function() {
	return this.acceptInvalidCertificate;
};

JkServerNetworkConnectionManager.prototype.setAcceptInvalidCertificate = function(v) {
	this.acceptInvalidCertificate = v;
	return this;
};

JkServerNetworkConnectionManager.prototype.getPassphrase = function() {
	return this.passphrase;
};

JkServerNetworkConnectionManager.prototype.setPassphrase = function(v) {
	this.passphrase = v;
	return this;
};

JkServerNetworkConnectionManager.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkServerNetworkConnectionManager"] === true;
};

let JkServerNetworkConnectionManagerConnectionIterator = function() {
	this.pool = null;
	this.current = -1;
};

JkServerNetworkConnectionManagerConnectionIterator.prototype._t = {
	"JkLangIterator" : true,
	"JkServerNetworkConnectionManagerConnectionIterator" : true
};
JkServerNetworkConnectionManagerConnectionIterator.prototype._tobj = JkServerNetworkConnectionManagerConnectionIterator;

JkServerNetworkConnectionManagerConnectionIterator.NEW = function() {
	var v = new JkServerNetworkConnectionManagerConnectionIterator;
	return v.CTOR_JkServerNetworkConnectionManagerConnectionIterator();
};

JkServerNetworkConnectionManagerConnectionIterator.prototype.CTOR_JkServerNetworkConnectionManagerConnectionIterator = function() {
	this.current = -1;
	this.pool = null;
	return this;
};

JkServerNetworkConnectionManagerConnectionIterator.prototype.next = function() {
	if(!(this.pool != null)) {
		return null;
	}
	var nn = this.current + 1;
	if(nn >= this.pool.nConnection) {
		return null;
	}
	var connection = (function(o) {
		if(JkServerNetworkConnection.IS_INSTANCE && JkServerNetworkConnection.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(this.pool.connections[nn]);
	if(!(connection != null)) {
		return null;
	}
	this.current = nn;
	return connection;
};

JkServerNetworkConnectionManagerConnectionIterator.prototype.hasNext = function() {
	if(!(this.pool != null)) {
		return false;
	}
	if(!(this.current + 1 < this.pool.nConnection - 1)) {
		return false;
	}
	return true;
};

JkServerNetworkConnectionManagerConnectionIterator.prototype.getPool = function() {
	return this.pool;
};

JkServerNetworkConnectionManagerConnectionIterator.prototype.setPool = function(v) {
	this.pool = v;
	return this;
};

JkServerNetworkConnectionManagerConnectionIterator.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkServerNetworkConnectionManagerConnectionIterator"] === true;
};

let JkServerNetworkConnectionManagerConnectionPool = function() {
	this.connections = null;
	this.nConnection = 0;
};

JkServerNetworkConnectionManagerConnectionPool.prototype._t = { "JkServerNetworkConnectionManagerConnectionPool" : true };
JkServerNetworkConnectionManagerConnectionPool.prototype._tobj = JkServerNetworkConnectionManagerConnectionPool;

JkServerNetworkConnectionManagerConnectionPool.NEW = function() {
	var v = new JkServerNetworkConnectionManagerConnectionPool;
	return v.CTOR_JkServerNetworkConnectionManagerConnectionPool();
};

JkServerNetworkConnectionManagerConnectionPool.prototype.CTOR_JkServerNetworkConnectionManagerConnectionPool = function() {
	this.nConnection = 0;
	this.connections = null;
	return this;
};

JkServerNetworkConnectionManagerConnectionPool.prototype.initialize = function(logContext, maxConnections) {
	this.connections = [];
	return true;
};

JkServerNetworkConnectionManagerConnectionPool.prototype.add = function(logContext, conn) {
	if(this.nConnection >= this.connections.length) {
		JkLogLog.error(logContext, "Maximum number of connections exceeded.");
		return -1;
	}
	this.connections[this.nConnection] = conn;
	var v = this.nConnection;
	this.nConnection++;
	JkLogLog.debug(logContext, "Added connection to connection pool: Now " + (JkLangString.safeString((JkLangString.safeString((JkLangString.forInteger(this.nConnection)))))) + (" connections"));
	return v;
};

JkServerNetworkConnectionManagerConnectionPool.prototype.remove = function(logContext, index) {
	if(index < 0 || index >= this.nConnection) {
		return false;
	}
	if(!(this.connections[index] != null)) {
		return false;
	}
	var last = this.nConnection - 1;
	if(last == index) {
		this.connections[index] = null;
		this.nConnection--;
	}
	else {
		this.connections[index] = this.connections[last];
		this.connections[last] = null;
		var ci = this.connections[index];
		ci.setStorageIndex(index);
		this.nConnection--;
	}
	JkLogLog.debug(logContext, "Removed connection from connection pool: Now " + (JkLangString.safeString((JkLangString.safeString((JkLangString.forInteger(this.nConnection)))))) + (" connections"));
	return true;
};

JkServerNetworkConnectionManagerConnectionPool.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkServerNetworkConnectionManagerConnectionPool"] === true;
};

let JkServerNetworkServer = function() {
	JkServerNetworkConnectionManager.call(this);
	this.port = 0;
	this.socket = null;
	this.esocket = null;
	this.acceptBatchSize = 0;
};

JkServerNetworkServer.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkServerNetworkConnectionManager.prototype);
JkServerNetworkServer.prototype.constructor = JkServerNetworkServer;
JkServerNetworkServer.prototype._t = {
	"JkServerNetworkConnectionManager" : true,
	"JkServerNetworkServer" : true
};
JkServerNetworkServer.prototype._tobj = JkServerNetworkServer;

JkServerNetworkServer.NEW = function() {
	var v = new JkServerNetworkServer;
	return v.CTOR_JkServerNetworkServer();
};

JkServerNetworkServer.prototype.CTOR_JkServerNetworkServer = function() {
	this.acceptBatchSize = 0;
	this.esocket = null;
	this.socket = null;
	this.port = 0;
	if(JkServerNetworkConnectionManager.prototype.CTOR_JkServerNetworkConnectionManager.call(this) == null) {
		return null;
	}
	return this;
};

JkServerNetworkServer.prototype.initialize2 = function() {
	if(!JkServerNetworkConnectionManager.prototype.initialize2.call(this)) {
		return false;
	}
	if(!((this.socket = JkSocketTCPSocket.createAndListen(this.port)) != null)) {
		JkLogLog.error(this.logContext, "Failed to listen on TCP port " + (JkLangString.safeString((JkLangString.forInteger(this.port)))));
		this.cleanup();
		return false;
	}
	if(this.socket.setBlocking(false) == true) {
		this.acceptBatchSize = 1024;
	}
	else {
		this.acceptBatchSize = 1;
	}
	if(!((this.esocket = this.ioManager.addWithReadListener(this.socket, (function() {
		this.onIncomingConnection();
	}.bind(this)))) != null)) {
		JkLogLog.error(this.logContext, "Failed to register with event loop");
		this.cleanup();
		return false;
	}
	JkLogLog.info(this.logContext, "TCP server initialized, listening on port " + (JkLangString.safeString((JkLangString.forInteger(this.port)))));
	return true;
};

JkServerNetworkServer.prototype.cleanup = function() {
	if(this.esocket != null) {
		this.esocket.remove();
		this.esocket = null;
	}
	if(this.socket != null) {
		this.socket.close();
		this.socket = null;
	}
	JkServerNetworkConnectionManager.prototype.cleanup.call(this);
};

JkServerNetworkServer.prototype.onIncomingConnection = function() {
	try {
		var n = 0;
		while(true){
			if(n >= this.acceptBatchSize) {
				break;
			}
			var nn = this.socket.accept();
			if(!(nn != null)) {
				break;
			}
			this.onNewSocket(nn);
			n++;
		}
	}
	catch(e) {
		JkLogLog.error(this.logContext, "onIncomingConnection: " + (JkLangString.safeString((JkLogLog.asString(this.logContext, e)))));
	}
};

JkServerNetworkServer.prototype.getPort = function() {
	return this.port;
};

JkServerNetworkServer.prototype.setPort = function(v) {
	this.port = v;
	return this;
};

JkServerNetworkServer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkServerNetworkServer"] === true;
};

let JkServerSimpleConfigFile = function() {
	this.data = null;
	this.mapData = null;
	this.file = null;
};

JkServerSimpleConfigFile.prototype._t = { "JkServerSimpleConfigFile" : true };
JkServerSimpleConfigFile.prototype._tobj = JkServerSimpleConfigFile;

JkServerSimpleConfigFile.NEW = function() {
	var v = new JkServerSimpleConfigFile;
	return v.CTOR_JkServerSimpleConfigFile();
};

JkServerSimpleConfigFile.prototype.CTOR_JkServerSimpleConfigFile = function() {
	this.file = null;
	this.mapData = null;
	this.data = null;
	this.data = JkLangKeyValueList.NEW();
	return this;
};

JkServerSimpleConfigFile.forFile = function(file) {
	var v = JkServerSimpleConfigFile.NEW();
	if(!v.read(file)) {
		return null;
	}
	return v;
};

JkServerSimpleConfigFile.forMap = function(map) {
	var v = JkServerSimpleConfigFile.NEW();
	v.setDataAsMap(map);
	return v;
};

JkServerSimpleConfigFile.readFileAsMap = function(file) {
	var cf = JkServerSimpleConfigFile.forFile(file);
	if(!(cf != null)) {
		return null;
	}
	return cf.getDataAsMap();
};

JkServerSimpleConfigFile.prototype.getFile = function() {
	return this.file;
};

JkServerSimpleConfigFile.prototype.getRelativeFile = function(fileName) {
	if(!(this.file != null)) {
		return null;
	}
	if(!(fileName != null)) {
		return null;
	}
	var p = this.file.getParent();
	if(!(p != null)) {
		return null;
	}
	return p.entry(fileName);
};

JkServerSimpleConfigFile.prototype.clear = function() {
	this.data.clear();
	this.mapData = null;
};

JkServerSimpleConfigFile.prototype.setDataAsMap = function(map) {
	this.clear();
	var keys = map.iterateKeys();
	while(keys != null){
		var key = keys.next();
		if(!(key != null)) {
			break;
		}
		this.data.add(key, (map.getString(key, null)));
	}
	return this;
};

JkServerSimpleConfigFile.prototype.getDataAsMap = function() {
	if(!(this.mapData != null)) {
		this.mapData = JkLangDynamicMap.NEW();
		var it = this.data.iterate();
		while(it != null){
			var kvp = it.next();
			if(!(kvp != null)) {
				break;
			}
			this.mapData.setString(kvp.key, kvp.value);
		}
	}
	return this.mapData;
};

JkServerSimpleConfigFile.prototype.getDynamicMapValue = function(key, defval) {
	var str = this.getStringValue(key, null);
	if(!(str != null)) {
		return defval;
	}
	var v = (function(o) {
		if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((JkJsonJSONParser.parseString(str)));
	if(!(v != null)) {
		return defval;
	}
	return v;
};

JkServerSimpleConfigFile.prototype.getDynamicVectorValue = function(key, defval) {
	var str = this.getStringValue(key, null);
	if(!(str != null)) {
		return defval;
	}
	var v = (function(o) {
		if(JkLangDynamicVector.IS_INSTANCE && JkLangDynamicVector.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((JkJsonJSONParser.parseString(str)));
	if(!(v != null)) {
		return defval;
	}
	return v;
};

JkServerSimpleConfigFile.prototype.getStringValue = function(key, defval) {
	var map = this.getDataAsMap();
	if(!(map != null)) {
		return defval;
	}
	var v = map.getString(key, null);
	if(!(v != null)) {
		return defval;
	}
	if(JkLangString.startsWith(v, "\"\"\"\n", 0) && JkLangString.endsWith(v, "\n\"\"\"")) {
		v = JkLangString.getSubString(v, 4, (JkLangString.getLength(v) - 8));
	}
	return v;
};

JkServerSimpleConfigFile.prototype.getIntegerValue = function(key, defval) {
	var map = this.getDataAsMap();
	if(!(map != null)) {
		return defval;
	}
	return map.getInteger(key, defval);
};

JkServerSimpleConfigFile.prototype.getDoubleValue = function(key, defval) {
	var map = this.getDataAsMap();
	if(!(map != null)) {
		return defval;
	}
	return map.getDouble(key, defval);
};

JkServerSimpleConfigFile.prototype.getBooleanValue = function(key, defval) {
	var map = this.getDataAsMap();
	if(!(map != null)) {
		return defval;
	}
	return map.getBoolean(key, defval);
};

JkServerSimpleConfigFile.prototype.getFileValue = function(key, defval) {
	var v = this.getRelativeFile((this.getStringValue(key, null)));
	if(!(v != null)) {
		return defval;
	}
	return v;
};

JkServerSimpleConfigFile.prototype.iterate = function() {
	if(!(this.data != null)) {
		return null;
	}
	return this.data.iterate();
};

JkServerSimpleConfigFile.prototype.read = function(file) {
	if(!(file != null)) {
		return false;
	}
	var reader = file.read();
	if(!(reader != null)) {
		return false;
	}
	var ins = JkIoPrintReader.forReader(reader);
	var line = null;
	var tag = null;
	var lineBuffer = null;
	var terminator = null;
	while((line = ins.readLine()) != null){
		if(lineBuffer != null) {
			lineBuffer.appendString(line);
			if(line == terminator) {
				line = lineBuffer.toString();
				lineBuffer = null;
				terminator = null;
			}
			else {
				lineBuffer.appendCharacter('\n'.charCodeAt());
				continue;
			}
		}
		line = JkLangString.strip(line);
		if(JkLangString.isEmpty(line) || JkLangString.startsWith(line, "#", 0)) {
			continue;
		}
		if(JkLangString.endsWith(line, "{")) {
			if(JkLangString.getIndexOfCharacter(line, ':'.charCodeAt(), 0) < 0) {
				if(!(tag != null)) {
					tag = JkLangString.strip((JkLangString.getSubString(line, 0, (JkLangString.getLength(line) - 1))));
				}
				continue;
			}
			else {
				lineBuffer = JkLangStringBuilder.NEW();
				lineBuffer.appendString(line);
				lineBuffer.appendCharacter('\n'.charCodeAt());
				terminator = "}";
				continue;
			}
		}
		if(JkLangString.endsWith(line, "[")) {
			lineBuffer = JkLangStringBuilder.NEW();
			lineBuffer.appendString(line);
			lineBuffer.appendCharacter('\n'.charCodeAt());
			terminator = "]";
			continue;
		}
		if(JkLangString.endsWith(line, "\"\"\"")) {
			lineBuffer = JkLangStringBuilder.NEW();
			lineBuffer.appendString(line);
			lineBuffer.appendCharacter('\n'.charCodeAt());
			terminator = "\"\"\"";
			continue;
		}
		if(tag != null && line == "}") {
			tag = null;
			continue;
		}
		var sp = JkLangString.split(line, ':'.charCodeAt(), 2);
		if(!(sp != null)) {
			continue;
		}
		var key = JkLangString.strip((JkLangVector.get(sp, 0)));
		var val = JkLangString.strip((JkLangVector.get(sp, 1)));
		if(JkLangString.startsWith(val, "\"", 0) && JkLangString.endsWith(val, "\"")) {
			val = JkLangString.getSubString(val, 1, (JkLangString.getLength(val) - 2));
		}
		if(JkLangString.isEmpty(key)) {
			continue;
		}
		if(tag != null) {
			key = (JkLangString.safeString(key)) + ("[") + (JkLangString.safeString(tag)) + ("]");
		}
		this.data.add(key, val);
	}
	this.file = file;
	reader.close();
	return true;
};

JkServerSimpleConfigFile.prototype.write = function(outfile) {
	if(!(outfile != null)) {
		return false;
	}
	if(!(this.data != null)) {
		return false;
	}
	var wr = outfile.write();
	if(!(wr != null)) {
		return false;
	}
	var os = JkIoPrintWriterWrapper.forWriter(wr);
	if(os != null) {
		var it = this.data.iterate();
		while(it != null){
			var kvp = it.next();
			if(!(kvp != null)) {
				break;
			}
			os.println((JkLangString.safeString(kvp.key)) + (": ") + (JkLangString.safeString(kvp.value)));
		}
	}
	wr.close();
	return true;
};

JkServerSimpleConfigFile.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkServerSimpleConfigFile"] === true;
};
