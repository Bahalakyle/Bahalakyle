let JkTextprotocolTextProtocolConnection = function() {
	JkServerNetworkConnection.call(this);
	this.encoding = null;
};

JkTextprotocolTextProtocolConnection.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkServerNetworkConnection.prototype);
JkTextprotocolTextProtocolConnection.prototype.constructor = JkTextprotocolTextProtocolConnection;
JkTextprotocolTextProtocolConnection.prototype._t = {
	"JkServerNetworkConnection" : true,
	"JkTextprotocolTextProtocolConnection" : true
};
JkTextprotocolTextProtocolConnection.prototype._tobj = JkTextprotocolTextProtocolConnection;

JkTextprotocolTextProtocolConnection.NEW = function() {
	var v = new JkTextprotocolTextProtocolConnection;
	return v.CTOR_JkTextprotocolTextProtocolConnection();
};

JkTextprotocolTextProtocolConnection.prototype.CTOR_JkTextprotocolTextProtocolConnection = function() {
	this.encoding = null;
	if(JkServerNetworkConnection.prototype.CTOR_JkServerNetworkConnection.call(this) == null) {
		return null;
	}
	return this;
};

JkTextprotocolTextProtocolConnection.prototype.onDataReceived = function(data, size) {
	if(size < 1) {
		return;
	}
	var sb = JkLangBuffer.getSubBuffer(data, 0, size, false);
	if(!(sb != null)) {
		return;
	}
	var str = null;
	if(this.encoding == null) {
		str = JkLangString.forUTF8Buffer(sb);
	}
	else {
		str = JkLangString.forBuffer(data, this.encoding);
	}
	if(str == null) {
		return;
	}
	this.onTextReceived(str);
};

JkTextprotocolTextProtocolConnection.prototype.sendText = function(text) {
	if(text == null) {
		return;
	}
	this.sendData((JkLangString.toUTF8Buffer(text)), (-1));
};

JkTextprotocolTextProtocolConnection.prototype.onTextReceived = function(data) {};

JkTextprotocolTextProtocolConnection.prototype.getEncoding = function() {
	return this.encoding;
};

JkTextprotocolTextProtocolConnection.prototype.setEncoding = function(v) {
	this.encoding = v;
	return this;
};

JkTextprotocolTextProtocolConnection.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTextprotocolTextProtocolConnection"] === true;
};

let JkTextprotocolTextLineProtocolConnection = function() {
	JkTextprotocolTextProtocolConnection.call(this);
	this.useCRLF = false;
};

JkTextprotocolTextLineProtocolConnection.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTextprotocolTextProtocolConnection.prototype);
JkTextprotocolTextLineProtocolConnection.prototype.constructor = JkTextprotocolTextLineProtocolConnection;
JkTextprotocolTextLineProtocolConnection.prototype._t = {
	"JkTextprotocolTextProtocolConnection" : true,
	"JkServerNetworkConnection" : true,
	"JkTextprotocolTextLineProtocolConnection" : true
};
JkTextprotocolTextLineProtocolConnection.prototype._tobj = JkTextprotocolTextLineProtocolConnection;

JkTextprotocolTextLineProtocolConnection.NEW = function() {
	var v = new JkTextprotocolTextLineProtocolConnection;
	return v.CTOR_JkTextprotocolTextLineProtocolConnection();
};

JkTextprotocolTextLineProtocolConnection.prototype.CTOR_JkTextprotocolTextLineProtocolConnection = function() {
	this.useCRLF = false;
	if(JkTextprotocolTextProtocolConnection.prototype.CTOR_JkTextprotocolTextProtocolConnection.call(this) == null) {
		return null;
	}
	return this;
};

JkTextprotocolTextLineProtocolConnection.prototype.sendLine = function(text) {
	if(this.useCRLF) {
		this.sendText((JkLangString.safeString(text)) + ("\r\n"));
	}
	else {
		this.sendText((JkLangString.safeString(text)) + ("\n"));
	}
};

JkTextprotocolTextLineProtocolConnection.prototype.onTextReceived = function(data) {
	if(data == null) {
		return;
	}
	var str = data;
	if(JkLangString.endsWith(str, "\r\n")) {
		str = JkLangString.getSubString(str, 0, (JkLangString.getLength(str) - 2));
	}
	else if(JkLangString.endsWith(str, "\n")) {
		str = JkLangString.getSubString(str, 0, (JkLangString.getLength(str) - 1));
	}
	var nn = JkLangString.getIndexOfCharacter(str, '\n'.charCodeAt(), 0);
	if(nn < 0) {
		this.onLineReceived(str);
		return;
	}
	var array = JkLangString.split(str, '\n'.charCodeAt(), 0);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var line = array[n];
			if(line != null) {
				if(JkLangString.endsWith(line, "\r")) {
					line = JkLangString.getSubString(line, 0, (JkLangString.getLength(line) - 1));
				}
				this.onLineReceived(line);
			}
		}
	}
};

JkTextprotocolTextLineProtocolConnection.prototype.onLineReceived = function(data) {};

JkTextprotocolTextLineProtocolConnection.prototype.getUseCRLF = function() {
	return this.useCRLF;
};

JkTextprotocolTextLineProtocolConnection.prototype.setUseCRLF = function(v) {
	this.useCRLF = v;
	return this;
};

JkTextprotocolTextLineProtocolConnection.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTextprotocolTextLineProtocolConnection"] === true;
};
