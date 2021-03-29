let JkSocketSslSSLSocket = function() {};

JkSocketSslSSLSocket.prototype._t = {
	"JkSocketConnectedSocket" : true,
	"JkIoReader" : true,
	"JkLangClosable" : true,
	"JkSocketSslSSLSocket" : true,
	"JkIoWriter" : true
};
JkSocketSslSSLSocket.prototype._tobj = JkSocketSslSSLSocket;

JkSocketSslSSLSocket.NEW = function() {
	var v = new JkSocketSslSSLSocket;
	return v.CTOR_JkSocketSslSSLSocket();
};

JkSocketSslSSLSocket.prototype.CTOR_JkSocketSslSSLSocket = function() {
	return this;
};

JkSocketSslSSLSocket.createInstance = function(cSocket, serverAddress, ctx, certFile, keyFile, isServer, acceptInvalidCertificate, passphrase) {
	if(!(cSocket != null)) {
		return null;
	}
	var v = null;
	return v;
};

JkSocketSslSSLSocket.forClient = function(cSocket, hostAddress, ctx, acceptInvalidCertificate, passphrase) {
	return JkSocketSslSSLSocket.createInstance(cSocket, hostAddress, ctx, null, null, false, acceptInvalidCertificate, passphrase);
};

JkSocketSslSSLSocket.forServer = function(cSocket, certFile, keyFile, ctx, acceptInvalidCertificate, passphrase) {
	return JkSocketSslSSLSocket.createInstance(cSocket, null, ctx, certFile, keyFile, true, acceptInvalidCertificate, passphrase);
};

JkSocketSslSSLSocket.prototype.setAcceptInvalidCertificate = function(accept) {};

JkSocketSslSSLSocket.prototype.setRequireClientCertificate = function(require) {};

JkSocketSslSSLSocket.prototype.close = function() {};

JkSocketSslSSLSocket.prototype.read = function(buffer) {};

JkSocketSslSSLSocket.prototype.readWithTimeout = function(buffer, timeout) {};

JkSocketSslSSLSocket.prototype.write = function(buffer, size) {};

JkSocketSslSSLSocket.prototype.getSocket = function() {};

JkSocketSslSSLSocket.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSocketSslSSLSocket"] === true;
};
