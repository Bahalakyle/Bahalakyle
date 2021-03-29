let JkSocketAsyncTCPClientForIOManagerMyBuffer = function() {
	this.data = null;
	this.size = 0;
	this.callback = null;
};

JkSocketAsyncTCPClientForIOManagerMyBuffer.prototype._t = { "JkSocketAsyncTCPClientForIOManagerMyBuffer" : true };
JkSocketAsyncTCPClientForIOManagerMyBuffer.prototype._tobj = JkSocketAsyncTCPClientForIOManagerMyBuffer;

JkSocketAsyncTCPClientForIOManagerMyBuffer.NEW = function() {
	var v = new JkSocketAsyncTCPClientForIOManagerMyBuffer;
	return v.CTOR_JkSocketAsyncTCPClientForIOManagerMyBuffer();
};

JkSocketAsyncTCPClientForIOManagerMyBuffer.prototype.CTOR_JkSocketAsyncTCPClientForIOManagerMyBuffer = function() {
	this.callback = null;
	this.size = 0;
	this.data = null;
	return this;
};

JkSocketAsyncTCPClientForIOManagerMyBuffer.prototype.getData = function() {
	return this.data;
};

JkSocketAsyncTCPClientForIOManagerMyBuffer.prototype.setData = function(v) {
	this.data = v;
	return this;
};

JkSocketAsyncTCPClientForIOManagerMyBuffer.prototype.getSize = function() {
	return this.size;
};

JkSocketAsyncTCPClientForIOManagerMyBuffer.prototype.setSize = function(v) {
	this.size = v;
	return this;
};

JkSocketAsyncTCPClientForIOManagerMyBuffer.prototype.getCallback = function() {
	return this.callback;
};

JkSocketAsyncTCPClientForIOManagerMyBuffer.prototype.setCallback = function(v) {
	this.callback = v;
	return this;
};

JkSocketAsyncTCPClientForIOManagerMyBuffer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSocketAsyncTCPClientForIOManagerMyBuffer"] === true;
};

let JkSocketAsyncTCPClient = function() {};

JkSocketAsyncTCPClient.prototype._t = { "JkSocketAsyncTCPClient" : true };
JkSocketAsyncTCPClient.prototype._tobj = JkSocketAsyncTCPClient;

JkSocketAsyncTCPClient.NEW = function() {
	var v = new JkSocketAsyncTCPClient;
	return v.CTOR_JkSocketAsyncTCPClient();
};

JkSocketAsyncTCPClient.prototype.CTOR_JkSocketAsyncTCPClient = function() {
	return this;
};

JkSocketAsyncTCPClient.instance = function() {
	return JkSocketAsyncTCPClientForIOManager.forCurrentIOManager();
};

JkSocketAsyncTCPClient.prototype.connectSSL = function(address, port, callback) {};

JkSocketAsyncTCPClient.prototype.connect = function(address, port, callback) {};

JkSocketAsyncTCPClient.prototype.receive = function(callback) {};

JkSocketAsyncTCPClient.prototype.send = function(data, size, callback) {};

JkSocketAsyncTCPClient.prototype.disconnect = function(callback) {};

JkSocketAsyncTCPClient.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSocketAsyncTCPClient"] === true;
};

let JkSocketAsyncTCPClientForIOManager = function() {
	JkSocketAsyncTCPClient.call(this);
	this.tcpsocket = null;
	this.sslsocket = null;
	this.rcvbuffer = null;
	this.iomanager = null;
	this.toWrite = JkLangQueue.NEW();
	this.writeScheduled = false;
};

JkSocketAsyncTCPClientForIOManager.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkSocketAsyncTCPClient.prototype);
JkSocketAsyncTCPClientForIOManager.prototype.constructor = JkSocketAsyncTCPClientForIOManager;
JkSocketAsyncTCPClientForIOManager.prototype._t = {
	"JkSocketAsyncTCPClientForIOManager" : true,
	"JkSocketAsyncTCPClient" : true
};
JkSocketAsyncTCPClientForIOManager.prototype._tobj = JkSocketAsyncTCPClientForIOManager;

JkSocketAsyncTCPClientForIOManager.NEW = function() {
	var v = new JkSocketAsyncTCPClientForIOManager;
	return v.CTOR_JkSocketAsyncTCPClientForIOManager();
};

JkSocketAsyncTCPClientForIOManager.prototype.CTOR_JkSocketAsyncTCPClientForIOManager = function() {
	if(JkSocketAsyncTCPClient.prototype.CTOR_JkSocketAsyncTCPClient.call(this) == null) {
		return null;
	}
	this.writeScheduled = false;
	this.toWrite = JkLangQueue.NEW();
	this.iomanager = null;
	this.rcvbuffer = null;
	this.sslsocket = null;
	this.tcpsocket = null;
	this.rcvbuffer = new ArrayBuffer(64 * 1024);
	return this;
};

JkSocketAsyncTCPClientForIOManager.forCurrentIOManager = function() {
	var mgr = JkSocketIoIOManager.getCurrent();
	if(!(mgr != null)) {
		return null;
	}
	var v = JkSocketAsyncTCPClientForIOManager.NEW();
	v.setIomanager(mgr);
	return v;
};

JkSocketAsyncTCPClientForIOManager.forIOManager = function(mgr) {
	var v = JkSocketAsyncTCPClientForIOManager.NEW();
	v.setIomanager(mgr);
	return v;
};

JkSocketAsyncTCPClientForIOManager.prototype.getSocket = function() {
	if(this.sslsocket != null) {
		return this.sslsocket;
	}
	return this.tcpsocket;
};

JkSocketAsyncTCPClientForIOManager.prototype.doConnectSocket = function(address, port) {
	return JkSocketTCPSocket.createAndConnect(address, port);
};

JkSocketAsyncTCPClientForIOManager.prototype.connectSSL = function(address, port, callback) {
	if(!((this.tcpsocket = this.doConnectSocket(address, port)) != null)) {
		if(callback != null) {
			callback((JkLangError.forCode("failedToConnect", null)));
		}
		return;
	}
	if(!((this.sslsocket = JkSocketSslSSLSocket.forClient(this.tcpsocket, address, null, false, null)) != null)) {
		if(callback != null) {
			callback((JkLangError.forCode("sslHandshakeFailed", null)));
		}
		return;
	}
	if(callback != null) {
		callback(null);
	}
};

JkSocketAsyncTCPClientForIOManager.prototype.connect = function(address, port, callback) {
	if(!((this.tcpsocket = this.doConnectSocket(address, port)) != null)) {
		if(callback != null) {
			callback((JkLangError.forCode("failedToConnect", null)));
		}
		return;
	}
	this.sslsocket = null;
	if(callback != null) {
		callback(null);
	}
};

JkSocketAsyncTCPClientForIOManager.prototype.receive = function(callback) {
	if(!(this.tcpsocket != null)) {
		if(callback != null) {
			callback(null, 0);
		}
		return;
	}
	var ee = this.iomanager.add(this.tcpsocket);
	var cc = callback;
	ee.setReadListener((function() {
		ee.setReadListener(null);
		var ss = this.getSocket();
		var bb = this.rcvbuffer;
		var v = 0;
		if(ss != null) {
			v = ss.read(bb);
		}
		if(cc != null) {
			cc(bb, v);
		}
	}.bind(this)));
};

JkSocketAsyncTCPClientForIOManager.prototype.send = function(data, size, callback) {
	if(!(this.tcpsocket != null)) {
		if(callback != null) {
			callback((JkLangError.forCode("notConnected", null)));
		}
		return;
	}
	var mb = JkSocketAsyncTCPClientForIOManagerMyBuffer.NEW();
	mb.setData(data);
	mb.setSize(size);
	mb.setCallback(callback);
	this.toWrite.push(mb);
	this.scheduleWrite();
};

JkSocketAsyncTCPClientForIOManager.prototype.scheduleWrite = function() {
	if(this.writeScheduled) {
		return;
	}
	if(this.toWrite.getSize() < 1) {
		return;
	}
	var ee = this.iomanager.add(this.tcpsocket);
	ee.setWriteListener((function() {
		ee.setWriteListener(null);
		this.writeScheduled = false;
		var mb = this.toWrite.pop();
		if(mb != null) {
			var data = mb.getData();
			var size = mb.getSize();
			var callback = mb.getCallback();
			var ss = this.getSocket();
			var n = 0;
			if(ss != null) {
				n = ss.write(data, size);
			}
			if(callback != null) {
				if(n < size) {
					callback((JkLangError.forCode("failedToWrite", null)));
				}
				else {
					callback(null);
				}
			}
		}
		this.scheduleWrite();
	}.bind(this)));
	this.writeScheduled = true;
};

JkSocketAsyncTCPClientForIOManager.prototype.disconnect = function(callback) {
	this.toWrite.clear();
	this.writeScheduled = false;
	if(this.sslsocket != null) {
		this.sslsocket.close();
		this.sslsocket = null;
	}
	if(this.tcpsocket != null) {
		this.tcpsocket.close();
		this.tcpsocket = null;
	}
	if(callback != null) {
		callback(null);
	}
};

JkSocketAsyncTCPClientForIOManager.prototype.getIomanager = function() {
	return this.iomanager;
};

JkSocketAsyncTCPClientForIOManager.prototype.setIomanager = function(v) {
	this.iomanager = v;
	return this;
};

JkSocketAsyncTCPClientForIOManager.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSocketAsyncTCPClientForIOManager"] === true;
};
