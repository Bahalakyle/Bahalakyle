let JkWsWSProtocolSource = {};

JkWsWSProtocolSource.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsWSProtocolSource"] === true;
};

let JkWsWSProtocol = function() {
	this.source = null;
};

JkWsWSProtocol.prototype._t = { "JkWsWSProtocol" : true };
JkWsWSProtocol.prototype._tobj = JkWsWSProtocol;

JkWsWSProtocol.NEW = function() {
	var v = new JkWsWSProtocol;
	return v.CTOR_JkWsWSProtocol();
};

JkWsWSProtocol.prototype.CTOR_JkWsWSProtocol = function() {
	this.source = null;
	return this;
};

JkWsWSProtocol.prototype.onConnectionOpened = function() {
};

JkWsWSProtocol.prototype.onConnectionClosed = function() {
};

JkWsWSProtocol.prototype.onConnectionError = function(error) {
};

JkWsWSProtocol.prototype.onStringMessage = function(message) {
};

JkWsWSProtocol.prototype.onBinaryMessage = function(message) {
};

JkWsWSProtocol.prototype.sendString = function(data) {
	if(this.source != null) {
		this.source.sendString(data);
	}
};

JkWsWSProtocol.prototype.sendBuffer = function(data) {
	if(this.source != null) {
		this.source.sendBuffer(data);
	}
};

JkWsWSProtocol.prototype.closeConnection = function() {
	if(this.source != null) {
		this.source.closeConnection();
	}
};

JkWsWSProtocol.prototype.getSource = function() {
	return this.source;
};

JkWsWSProtocol.prototype.setSource = function(v) {
	this.source = v;
	return this;
};

JkWsWSProtocol.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsWSProtocol"] === true;
};
