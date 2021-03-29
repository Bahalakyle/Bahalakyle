let JkSocketConnectedSocket = {};

JkSocketConnectedSocket.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSocketConnectedSocket"] === true;
};

let JkSocketUDPSocket = function() {};

JkSocketUDPSocket.prototype._t = { "JkSocketUDPSocket" : true };
JkSocketUDPSocket.prototype._tobj = JkSocketUDPSocket;

JkSocketUDPSocket.NEW = function() {
	var v = new JkSocketUDPSocket;
	return v.CTOR_JkSocketUDPSocket();
};

JkSocketUDPSocket.prototype.CTOR_JkSocketUDPSocket = function() {
	return this;
};

JkSocketUDPSocket.create = function() {
	console.log("[jk.socket.UDPSocket.create] (UDPSocket.sling:39:3): Not implemented.");
	return null;
};

JkSocketUDPSocket.prototype.send = function(message, address, port) {};

JkSocketUDPSocket.prototype.sendBroadcast = function(message, address, port) {};

JkSocketUDPSocket.prototype.receive = function(message, timeout) {};

JkSocketUDPSocket.prototype.bind = function(port) {};

JkSocketUDPSocket.prototype.close = function() {};

JkSocketUDPSocket.prototype.getLocalAddress = function() {};

JkSocketUDPSocket.prototype.getLocalPort = function() {};

JkSocketUDPSocket.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSocketUDPSocket"] === true;
};

let JkSocketTCPSocket = function() {
	this.lastErrorDescription = null;
};

JkSocketTCPSocket.prototype._t = {
	"JkSocketConnectedSocket" : true,
	"JkIoReader" : true,
	"JkLangClosable" : true,
	"JkIoWriter" : true,
	"JkSocketTCPSocket" : true
};
JkSocketTCPSocket.prototype._tobj = JkSocketTCPSocket;

JkSocketTCPSocket.NEW = function() {
	var v = new JkSocketTCPSocket;
	return v.CTOR_JkSocketTCPSocket();
};

JkSocketTCPSocket.prototype.CTOR_JkSocketTCPSocket = function() {
	this.lastErrorDescription = null;
	return this;
};

JkSocketTCPSocket.create = function() {
	console.log("[jk.socket.TCPSocket.create] (TCPSocket.sling:50:3): Not implemented.");
	return null;
};

JkSocketTCPSocket.createAndConnect = function(address, port) {
	var v = JkSocketTCPSocket.create();
	if(!(v != null)) {
		return null;
	}
	if(v.connect(address, port) == false) {
		v = null;
	}
	return v;
};

JkSocketTCPSocket.createAndListen = function(port) {
	var v = JkSocketTCPSocket.create();
	if(!(v != null)) {
		return null;
	}
	if(v.listen(port) == false) {
		v = null;
	}
	return v;
};

JkSocketTCPSocket.prototype.getRemoteAddress = function() {};

JkSocketTCPSocket.prototype.getRemotePort = function() {};

JkSocketTCPSocket.prototype.getLocalAddress = function() {};

JkSocketTCPSocket.prototype.getLocalPort = function() {};

JkSocketTCPSocket.prototype.connect = function(address, port) {};

JkSocketTCPSocket.prototype.listen = function(port) {};

JkSocketTCPSocket.prototype.accept = function() {};

JkSocketTCPSocket.prototype.setBlocking = function(blocking) {};

JkSocketTCPSocket.prototype.getBlocking = function() {};

JkSocketTCPSocket.prototype.close = function() {};

JkSocketTCPSocket.prototype.read = function(buffer) {};

JkSocketTCPSocket.prototype.readWithTimeout = function(buffer, timeout) {
	return this.read(buffer);
};

JkSocketTCPSocket.prototype.write = function(buffer, size) {};

JkSocketTCPSocket.prototype.getLastErrorDescription = function() {
	return this.lastErrorDescription;
};

JkSocketTCPSocket.prototype.setLastErrorDescription = function(v) {
	this.lastErrorDescription = v;
	return this;
};

JkSocketTCPSocket.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSocketTCPSocket"] === true;
};
