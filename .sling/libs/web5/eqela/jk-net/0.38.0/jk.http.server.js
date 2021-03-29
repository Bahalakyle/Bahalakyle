let JkHttpServerHTTPServerRequestHandler = {};

JkHttpServerHTTPServerRequestHandler.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerRequestHandler"] === true;
};

let JkHttpServerHTTPServerConnectionParserState = function() {
	this.method = null;
	this.uri = null;
	this.version = null;
	this.key = null;
	this.headers = null;
	this.headersDone = false;
	this.bodyDone = false;
	this.hdr = null;
	this.contentLength = 0;
	this.bodyIsChunked = false;
	this.dataCounter = 0;
	this.bodyStream = null;
	this.savedBodyChunk = null;
	this.bodyBuffer = null;
};

JkHttpServerHTTPServerConnectionParserState.prototype._t = { "JkHttpServerHTTPServerConnectionParserState" : true };
JkHttpServerHTTPServerConnectionParserState.prototype._tobj = JkHttpServerHTTPServerConnectionParserState;

JkHttpServerHTTPServerConnectionParserState.NEW = function() {
	var v = new JkHttpServerHTTPServerConnectionParserState;
	return v.CTOR_JkHttpServerHTTPServerConnectionParserState();
};

JkHttpServerHTTPServerConnectionParserState.prototype.CTOR_JkHttpServerHTTPServerConnectionParserState = function() {
	this.bodyBuffer = null;
	this.savedBodyChunk = null;
	this.bodyStream = null;
	this.dataCounter = 0;
	this.bodyIsChunked = false;
	this.contentLength = 0;
	this.hdr = null;
	this.bodyDone = false;
	this.headersDone = false;
	this.headers = null;
	this.key = null;
	this.version = null;
	this.uri = null;
	this.method = null;
	return this;
};

JkHttpServerHTTPServerConnectionParserState.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerConnectionParserState"] === true;
};

let JkHttpServerHTTPServerConnection = function() {
	JkServerNetworkConnection.call(this);
	this.requests = 0;
	this.responses = 0;
	this.parser = null;
	this.currentRequest = null;
	this.closeAfterSend = false;
	this.sendWritten = 0;
	this.sendBodyBuffer = null;
	this.sendBody = null;
	this.sendBuffer = null;
	this.responseToSend = null;
	this.requestQueue = null;
	this.isWaitingForBodyReceiver = false;
};

JkHttpServerHTTPServerConnection.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkServerNetworkConnection.prototype);
JkHttpServerHTTPServerConnection.prototype.constructor = JkHttpServerHTTPServerConnection;
JkHttpServerHTTPServerConnection.prototype._t = {
	"JkHttpServerHTTPServerConnection" : true,
	"JkServerNetworkConnection" : true
};
JkHttpServerHTTPServerConnection.prototype._tobj = JkHttpServerHTTPServerConnection;

JkHttpServerHTTPServerConnection.NEW = function() {
	var v = new JkHttpServerHTTPServerConnection;
	return v.CTOR_JkHttpServerHTTPServerConnection();
};

JkHttpServerHTTPServerConnection.prototype.CTOR_JkHttpServerHTTPServerConnection = function() {
	if(JkServerNetworkConnection.prototype.CTOR_JkServerNetworkConnection.call(this) == null) {
		return null;
	}
	this.isWaitingForBodyReceiver = false;
	this.requestQueue = null;
	this.responseToSend = null;
	this.sendBuffer = null;
	this.sendBody = null;
	this.sendBodyBuffer = null;
	this.sendWritten = 0;
	this.closeAfterSend = false;
	this.currentRequest = null;
	this.parser = null;
	this.responses = 0;
	this.requests = 0;
	this.parser = JkHttpServerHTTPServerConnectionParserState.NEW();
	return this;
};

JkHttpServerHTTPServerConnection.prototype.getIsWaitingForBodyReceiver = function() {
	return this.isWaitingForBodyReceiver;
};

JkHttpServerHTTPServerConnection.prototype.getHTTPServer = function() {
	return (function(o) {
		if(JkHttpServerHTTPServerBase.IS_INSTANCE && JkHttpServerHTTPServerBase.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((this.getManager()));
};

JkHttpServerHTTPServerConnection.prototype.getWriteBufferSize = function() {
	var server = this.getHTTPServer();
	if(server == null) {
		return 1024 * 512;
	}
	return server.getWriteBufferSize();
};

JkHttpServerHTTPServerConnection.prototype.getSmallBodyLimit = function() {
	var server = this.getHTTPServer();
	if(server == null) {
		return 1024 * 32;
	}
	return server.getSmallBodyLimit();
};

JkHttpServerHTTPServerConnection.prototype.resetParser = function() {
	this.parser.method = null;
	this.parser.uri = null;
	this.parser.version = null;
	this.parser.key = null;
	this.parser.headers = null;
	this.parser.headersDone = false;
	if(this.parser.bodyStream != null) {
		this.parser.bodyStream.onDataStreamAbort();
	}
	this.parser.bodyStream = null;
	this.parser.bodyDone = false;
	this.parser.hdr = null;
	this.parser.contentLength = 0;
	this.parser.bodyIsChunked = false;
	this.parser.dataCounter = 0;
};

JkHttpServerHTTPServerConnection.prototype.initialize = function() {
	if(!JkServerNetworkConnection.prototype.initialize.call(this)) {
		return false;
	}
	this.updateListeningMode();
	return true;
};

JkHttpServerHTTPServerConnection.prototype.updateListeningMode = function() {
	var writeFlag = false;
	var readFlag = true;
	if(this.responseToSend != null) {
		writeFlag = true;
	}
	if(this.isWaitingForBodyReceiver || this.closeAfterSend) {
		readFlag = false;
	}
	var v = true;
	if(readFlag && writeFlag) {
		v = this.enableReadWriteMode();
	}
	else if(readFlag) {
		v = this.enableReadMode();
	}
	else if(writeFlag) {
		v = this.enableWriteMode();
	}
	else {
		v = this.enableIdleMode();
	}
	if(!v) {
		JkLogLog.error(this.logContext, "HTTPServerConnection updateListeningMode failed. Disconnecting client.");
		this.close();
	}
};

JkHttpServerHTTPServerConnection.prototype.setBodyReceiver = function(stream) {
	if(this.isWaitingForBodyReceiver == false) {
		if(stream != null) {
			if(stream.onDataStreamStart(0)) {
				stream.onDataStreamEnd();
			}
		}
		return;
	}
	this.parser.bodyStream = stream;
	if(stream != null) {
		this.isWaitingForBodyReceiver = false;
		this.updateListeningMode();
		var ll = this.parser.contentLength;
		if(this.parser.bodyIsChunked) {
			ll = -1;
		}
		if(stream.onDataStreamStart(ll) == false) {
			this.parser.bodyStream = null;
			this.sendErrorResponse((JkHttpServerHTTPServerResponse.forHTTPInternalError(null)));
			this.resetParser();
			return;
		}
		var sbc = this.parser.savedBodyChunk;
		this.parser.savedBodyChunk = null;
		if(sbc != null) {
			this.onBodyData(sbc, 0, sbc.byteLength);
		}
	}
};

JkHttpServerHTTPServerConnection.prototype.isExpectingBody = function() {
	if(this.parser.method == "POST" || this.parser.method == "PUT" || this.parser.method == "PATCH" || this.parser.contentLength > 0 || this.parser.bodyIsChunked) {
		return true;
	}
	return false;
};

JkHttpServerHTTPServerConnection.prototype.onHeadersDone = function() {
	var hasBody = this.isExpectingBody();
	if(hasBody) {
		var sbl = this.getSmallBodyLimit();
		if(sbl > 0 && this.parser.contentLength > 0 && this.parser.contentLength < sbl) {
			this.parser.bodyBuffer = new ArrayBuffer(this.parser.contentLength);
			return;
		}
		this.isWaitingForBodyReceiver = true;
	}
	var req = JkHttpServerHTTPServerRequest.forDetails(this.parser.method, this.parser.uri, this.parser.version, this.parser.headers);
	this.onCompleteRequest(req);
	if(hasBody == false) {
		this.resetParser();
	}
	this.updateListeningMode();
};

JkHttpServerHTTPServerConnection.prototype.onHeaderData = function(inputBuffer, offset, sz) {
	if(!(inputBuffer != null)) {
		return;
	}
	var p = 0;
	while(p < sz){
		var c = inputBuffer[p + offset];
		p++;
		if(c == '\r'.charCodeAt()) {
			continue;
		}
		if(this.parser.method == null) {
			if(c == '\n'.charCodeAt()) {
				continue;
			}
			if(c == ' '.charCodeAt()) {
				if(this.parser.hdr != null) {
					this.parser.method = this.parser.hdr.toString();
					this.parser.hdr = null;
				}
				continue;
			}
		}
		else if(this.parser.uri == null) {
			if(c == ' '.charCodeAt()) {
				if(this.parser.hdr != null) {
					this.parser.uri = this.parser.hdr.toString();
					this.parser.hdr = null;
				}
				continue;
			}
			else if(c == '\n'.charCodeAt()) {
				if(this.parser.hdr != null) {
					this.parser.uri = this.parser.hdr.toString();
					this.parser.hdr = null;
				}
				this.parser.version = "HTTP/0.9";
				this.parser.headersDone = true;
				this.onHeadersDone();
				if(p < sz) {
					this.onData(inputBuffer, (offset + p), (sz - p));
				}
				return;
			}
		}
		else if(this.parser.version == null) {
			if(c == '\n'.charCodeAt()) {
				if(this.parser.hdr != null) {
					this.parser.version = this.parser.hdr.toString();
					this.parser.hdr = null;
				}
				continue;
			}
		}
		else if(this.parser.key == null) {
			if(c == ':'.charCodeAt()) {
				if(this.parser.hdr != null) {
					this.parser.key = this.parser.hdr.toString();
					this.parser.hdr = null;
				}
				continue;
			}
			else if(c == '\n'.charCodeAt()) {
				if(this.parser.hdr != null) {
					this.sendErrorResponse((JkHttpServerHTTPServerResponse.forHTTPInvalidRequest(null)));
					this.resetParser();
					return;
				}
				this.parser.headersDone = true;
				this.onHeadersDone();
				if(p < sz) {
					this.onData(inputBuffer, (offset + p), (sz - p));
				}
				return;
			}
			if(c >= 'A'.charCodeAt() && c <= 'Z'.charCodeAt()) {
				c = 'a'.charCodeAt() + c - 'A'.charCodeAt();
			}
		}
		else if(c == ' '.charCodeAt() && this.parser.hdr == null) {
			continue;
		}
		else if(c == '\n'.charCodeAt()) {
			var value = null;
			if(this.parser.hdr != null) {
				value = this.parser.hdr.toString();
				this.parser.hdr = null;
			}
			if(this.parser.headers == null) {
				this.parser.headers = JkLangKeyValueList.NEW();
			}
			this.parser.headers.add(this.parser.key, value);
			if(JkLangString.equalsIgnoreCase(this.parser.key, "content-length") && value != null) {
				this.parser.contentLength = JkLangString.toInteger(value);
			}
			else if(JkLangString.equalsIgnoreCase(this.parser.key, "transfer-encoding") && value != null && JkLangString.contains(value, "chunked")) {
				this.parser.bodyIsChunked = true;
			}
			this.parser.key = null;
			continue;
		}
		if(this.parser.hdr == null) {
			this.parser.hdr = JkLangStringBuilder.NEW();
		}
		this.parser.hdr.appendCharacter(c);
		if(this.parser.hdr.count() > 32 * 1024) {
			this.sendErrorResponse((JkHttpServerHTTPServerResponse.forHTTPInvalidRequest(null)));
			this.resetParser();
			return;
		}
	}
};

JkHttpServerHTTPServerConnection.prototype.onBodyData = function(inputBuffer, offset, sz) {
	if(!(inputBuffer != null)) {
		return;
	}
	if(!(sz > 0)) {
		return;
	}
	if(this.parser.bodyBuffer == null && this.parser.bodyStream == null) {
		this.sendErrorResponse((JkHttpServerHTTPServerResponse.forHTTPInvalidRequest(null)));
		this.resetParser();
		return;
	}
	if(this.parser.contentLength > 0) {
		var p = 0;
		if(this.parser.dataCounter + sz <= this.parser.contentLength) {
			p = sz;
		}
		else {
			p = this.parser.contentLength - this.parser.dataCounter;
		}
		if(this.parser.bodyBuffer != null) {
			JkLangBuffer.copyFrom(this.parser.bodyBuffer, inputBuffer, offset, this.parser.dataCounter, p);
		}
		else if(this.parser.bodyStream.onDataStreamContent((JkLangBuffer.getSubBuffer(inputBuffer, offset, p, false)), p) == false) {
			this.sendErrorResponse((JkHttpServerHTTPServerResponse.forHTTPInternalError(null)));
			this.parser.bodyStream = null;
			this.resetParser();
			return;
		}
		this.parser.dataCounter += p;
		if(this.parser.dataCounter >= this.parser.contentLength) {
			this.parser.bodyDone = true;
			if(this.parser.bodyBuffer != null) {
				var req = JkHttpServerHTTPServerRequest.forDetails(this.parser.method, this.parser.uri, this.parser.version, this.parser.headers);
				req.setBodyBuffer(this.parser.bodyBuffer);
				this.parser.bodyBuffer = null;
				this.onCompleteRequest(req);
				this.resetParser();
			}
			else {
				if(this.parser.bodyStream.onDataStreamEnd() == false) {
					this.sendErrorResponse((JkHttpServerHTTPServerResponse.forHTTPInternalError(null)));
					this.parser.bodyStream = null;
					this.resetParser();
					return;
				}
				this.parser.bodyStream = null;
			}
			if(p < sz) {
				this.onData(inputBuffer, (offset + p), (sz - p));
			}
		}
		return;
	}
	else if(this.parser.bodyIsChunked) {
		this.sendErrorResponse((JkHttpServerHTTPServerResponse.forHTTPInvalidRequest("Chunked content body is not supported.")));
		this.resetParser();
		return;
	}
	else {
		this.sendErrorResponse((JkHttpServerHTTPServerResponse.forHTTPInvalidRequest(null)));
		this.resetParser();
	}
};

JkHttpServerHTTPServerConnection.prototype.onData = function(buffer, offset, asz) {
	if(!(buffer != null)) {
		return;
	}
	var sz = asz;
	if(sz < 0) {
		sz = ~(~JkLangBuffer.getSize(buffer)) - offset;
	}
	if(this.isWaitingForBodyReceiver) {
		this.parser.savedBodyChunk = JkLangBuffer.getSubBuffer(buffer, offset, sz, false);
		return;
	}
	if(this.parser.headersDone && this.parser.bodyDone) {
		this.resetParser();
	}
	if(this.parser.headersDone == false) {
		this.onHeaderData(buffer, offset, sz);
	}
	else if(this.parser.bodyDone == false) {
		this.onBodyData(buffer, offset, sz);
	}
};

JkHttpServerHTTPServerConnection.prototype.onOpened = function() {
};

JkHttpServerHTTPServerConnection.prototype.onClosed = function() {
	this.resetParser();
};

JkHttpServerHTTPServerConnection.prototype.onError = function(message) {
	JkLogLog.error(this.logContext, message);
};

JkHttpServerHTTPServerConnection.prototype.onDataReceived = function(data, size) {
	this.onData(data, 0, size);
};

JkHttpServerHTTPServerConnection.prototype.onWriteReady = function() {
	this.sendData1();
};

JkHttpServerHTTPServerConnection.prototype.onCompleteRequest = function(req) {
	if(!(req != null)) {
		return;
	}
	this.requests++;
	req.setServer((this.getHTTPServer()));
	req.setConnection(this);
	if(this.currentRequest == null) {
		this.currentRequest = req;
		this.handleCurrentRequest();
	}
	else {
		if(this.requestQueue == null) {
			this.requestQueue = JkLangQueue.NEW();
		}
		this.requestQueue.push(req);
	}
};

JkHttpServerHTTPServerConnection.prototype.handleNextRequest = function() {
	if(!(this.currentRequest == null)) {
		return;
	}
	if(!(this.requestQueue != null)) {
		return;
	}
	var req = (function(o) {
		if(JkHttpServerHTTPServerRequest.IS_INSTANCE && JkHttpServerHTTPServerRequest.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((this.requestQueue.pop()));
	if(!(req != null)) {
		return;
	}
	this.currentRequest = req;
	this.handleCurrentRequest();
};

JkHttpServerHTTPServerConnection.prototype.sendErrorResponse = function(response) {
	this.closeAfterSend = true;
	this.sendResponse(null, response);
};

JkHttpServerHTTPServerConnection.prototype.handleCurrentRequest = function() {
	if(!(this.currentRequest != null)) {
		return;
	}
	var server = this.getHTTPServer();
	if(!(server != null)) {
		return;
	}
	var method = this.currentRequest.getMethod();
	var url = this.currentRequest.getUrlString();
	if(JkLangString.isEmpty(method) || JkLangString.isEmpty(url)) {
		this.closeAfterSend = true;
		this.sendResponse(this.currentRequest, (JkHttpServerHTTPServerResponse.forHTTPInvalidRequest(null)));
		return;
	}
	if(this.currentRequest.getVersion() == "HTTP/0.9" && !(method == "GET")) {
		this.closeAfterSend = true;
		this.sendResponse(this.currentRequest, (JkHttpServerHTTPServerResponse.forHTTPInvalidRequest(null)));
		return;
	}
	server.handleIncomingRequest(this.currentRequest);
};

JkHttpServerHTTPServerConnection.getStatusCode = function(status) {
	if(!(status != null)) {
		return null;
	}
	var comps = JkLangVector.iterate((JkLangString.split(status, ' '.charCodeAt(), 0)));
	if(comps != null) {
		return (function(o) {
			if(typeof(o) === 'string') {
				return o;
			}
			return null;
		}.bind(this))((comps.next()));
	}
	return null;
};

JkHttpServerHTTPServerConnection.prototype.validateCurrentRequest = function(req) {
	if(!(req != null)) {
		return false;
	}
	if(this.currentRequest == null) {
		JkLogLog.error(this.logContext, "Sending a response, but no current request!");
		JkLogLog.error(this.logContext, (JkLangStackTrace.generate()));
		this.close();
		return false;
	}
	if(this.currentRequest != req) {
		JkLogLog.error(this.logContext, "Sending a response for an incorrect request");
		this.close();
		return false;
	}
	return true;
};

JkHttpServerHTTPServerConnection.prototype.startResponse = function(req, resp) {
	if(!(this.socket != null)) {
		return null;
	}
	if(req != null) {
		if(!this.validateCurrentRequest(req)) {
			return null;
		}
	}
	var server = this.getHTTPServer();
	if(server != null) {
		server.onRequestComplete(req, resp, 0, (this.getRemoteAddress()));
	}
	var v = JkHttpServerHTTPServerResponseSession.NEW();
	v.setSocket((this.exportSocket()));
	v.setRequest(req);
	v.setResponse(resp);
	v.setServer(server);
	this.currentRequest = null;
	this.close();
	return v;
};

JkHttpServerHTTPServerConnection.prototype.sendResponse = function(req, aresp) {
	if(!(this.socket != null)) {
		return;
	}
	if(req != null) {
		if(!this.validateCurrentRequest(req)) {
			return;
		}
	}
	if(this.isWaitingForBodyReceiver) {
		this.closeAfterSend = true;
	}
	this.responses++;
	var resp = aresp;
	if(resp == null) {
		resp = JkHttpServerHTTPServerResponse.forTextString("");
	}
	var inm = null;
	if(req != null) {
		inm = req.getETag();
	}
	if(inm != null) {
		if(JkLangString.equals(inm, (resp.getETag()))) {
			resp = JkHttpServerHTTPServerResponse.NEW();
			resp.setStatus("304");
			resp.setETag((aresp.getETag()));
		}
	}
	var status = resp.getStatus();
	var bod = resp.getBody();
	var ver = null;
	var met = null;
	if(req != null) {
		ver = req.getVersion();
		met = req.getMethod();
	}
	var headers = resp.getHeaders();
	var server = this.getHTTPServer();
	if(JkLangString.equals("HTTP/0.9", ver)) {
		this.closeAfterSend = true;
	}
	else {
		if(status == null || JkLangString.getLength(status) < 1) {
			status = "200";
			resp.setStatus(status);
		}
		if(req != null && req.getConnectionClose()) {
			this.closeAfterSend = true;
		}
		var fs = JkHttpServerHTTPServerResponse.getFullStatus(status);
		{
			var reply = JkLangStringBuilder.NEW();
			if(ver == null || JkLangString.getLength(ver) < 1) {
				reply.appendString("HTTP/1.1");
			}
			else {
				reply.appendString(ver);
			}
			reply.appendCharacter(' '.charCodeAt());
			reply.appendString(fs);
			reply.appendCharacter('\r'.charCodeAt());
			reply.appendCharacter('\n'.charCodeAt());
			if(JkLangString.startsWith(fs, "400 ", 0)) {
				this.closeAfterSend = true;
			}
			if(headers != null) {
				var it = headers.iterate();
				while(it != null){
					var kvp = it.next();
					if(kvp == null) {
						break;
					}
					reply.appendString(kvp.key);
					reply.appendCharacter(':'.charCodeAt());
					reply.appendCharacter(' '.charCodeAt());
					reply.appendString(kvp.value);
					reply.appendCharacter('\r'.charCodeAt());
					reply.appendCharacter('\n'.charCodeAt());
				}
			}
			if(this.closeAfterSend) {
				reply.appendString("Connection: close\r\n");
			}
			if(server != null) {
				var name = server.getServerName();
				if(JkLangString.isNotEmpty(name)) {
					reply.appendString("Server: ");
					reply.appendString(name);
					reply.appendCharacter('\r'.charCodeAt());
					reply.appendCharacter('\n'.charCodeAt());
				}
			}
			reply.appendString("Date: ");
			reply.appendString((JkTimeFormatVerboseDateTimeString.forUTCNow()));
			reply.appendCharacter('\r'.charCodeAt());
			reply.appendCharacter('\n'.charCodeAt());
			reply.appendCharacter('\r'.charCodeAt());
			reply.appendCharacter('\n'.charCodeAt());
			this.sendBuffer = JkLangString.toUTF8Buffer((reply.toString()));
		}
	}
	this.sendWritten = 0;
	if(bod != null) {
		if(JkLangString.equals("HEAD", met) == false) {
			this.sendBody = bod;
		}
	}
	this.responseToSend = resp;
	this.updateListeningMode();
};

JkHttpServerHTTPServerConnection.prototype.sendData1 = function() {
	if(!(this.socket != null)) {
		return;
	}
	var remoteAddress = this.getRemoteAddress();
	if(JkLangBuffer.getSize(this.sendBuffer) == 0) {
		if(this.sendBody != null) {
			if(JkIoBufferReader.IS_INSTANCE && JkIoBufferReader.IS_INSTANCE(this.sendBody)) {
				this.sendBuffer = this.sendBody.getBuffer();
				this.sendBody = null;
			}
			else {
				if(this.sendBodyBuffer == null) {
					this.sendBodyBuffer = new ArrayBuffer(this.getWriteBufferSize());
				}
				var n = this.sendBody.read(this.sendBodyBuffer);
				if(n < 1) {
					this.sendBody = null;
				}
				else if(n == this.sendBodyBuffer.byteLength) {
					this.sendBuffer = this.sendBodyBuffer;
				}
				else {
					this.sendBuffer = JkLangBuffer.getSubBuffer(this.sendBodyBuffer, 0, n, false);
				}
			}
		}
	}
	if(JkLangBuffer.getSize(this.sendBuffer) > 0) {
		var socket = this.socket;
		var r = socket.write(this.sendBuffer, (~(~JkLangBuffer.getSize(this.sendBuffer))));
		if(r < 0) {
			this.sendBuffer = null;
			this.sendBody = null;
			this.close();
			return;
		}
		else if(r == 0) {
			;
		}
		else {
			this.sendWritten += r;
			var osz = JkLangBuffer.getSize(this.sendBuffer);
			if(r < osz) {
				this.sendBuffer = JkLangBuffer.getSubBuffer(this.sendBuffer, r, (osz - r), false);
			}
			else {
				this.sendBuffer = null;
			}
		}
	}
	if(JkLangBuffer.getSize(this.sendBuffer) == 0 && this.sendBody == null) {
		var server = this.getHTTPServer();
		if(server != null) {
			server.onRequestComplete(this.currentRequest, this.responseToSend, this.sendWritten, remoteAddress);
		}
		this.currentRequest = null;
		this.responseToSend = null;
		if(this.closeAfterSend) {
			this.close();
		}
		else {
			this.updateListeningMode();
			this.handleNextRequest();
		}
	}
	this.lastActivity = JkTimeSystemClock.asSeconds();
};

JkHttpServerHTTPServerConnection.prototype.getRequests = function() {
	return this.requests;
};

JkHttpServerHTTPServerConnection.prototype.setRequests = function(v) {
	this.requests = v;
	return this;
};

JkHttpServerHTTPServerConnection.prototype.getResponses = function() {
	return this.responses;
};

JkHttpServerHTTPServerConnection.prototype.setResponses = function(v) {
	this.responses = v;
	return this;
};

JkHttpServerHTTPServerConnection.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerConnection"] === true;
};

let JkHttpServerHTTPServerResponseWorker = function() {
	this.context = null;
	this.session = null;
	this.startTime = null;
};

JkHttpServerHTTPServerResponseWorker.prototype._t = { "JkHttpServerHTTPServerResponseWorker" : true };
JkHttpServerHTTPServerResponseWorker.prototype._tobj = JkHttpServerHTTPServerResponseWorker;

JkHttpServerHTTPServerResponseWorker.NEW = function() {
	var v = new JkHttpServerHTTPServerResponseWorker;
	return v.CTOR_JkHttpServerHTTPServerResponseWorker();
};

JkHttpServerHTTPServerResponseWorker.prototype.CTOR_JkHttpServerHTTPServerResponseWorker = function() {
	this.startTime = null;
	this.session = null;
	this.context = null;
	return this;
};

JkHttpServerHTTPServerResponseWorker.prototype.setContext = function(v) {
	this.context = v;
	return this;
};

JkHttpServerHTTPServerResponseWorker.prototype.getContext = function() {
	return this.context;
};

JkHttpServerHTTPServerResponseWorker.prototype.setSession = function(v) {
	this.session = v;
	return this;
};

JkHttpServerHTTPServerResponseWorker.prototype.getSession = function() {
	return this.session;
};

JkHttpServerHTTPServerResponseWorker.prototype.getMimeType = function() {};

JkHttpServerHTTPServerResponseWorker.prototype.getWorkerDescription = function() {};

JkHttpServerHTTPServerResponseWorker.prototype.onStart = function() {
	this.startTime = JkTimeSystemClock.asTimeValue();
	JkLogLog.debug(this.context, "Response worker `" + (JkLangString.safeString((this.getWorkerDescription()))) + ("' started."));
	this.session.writeHeader();
};

JkHttpServerHTTPServerResponseWorker.prototype.tick = function() {
	this.execute();
	return false;
};

JkHttpServerHTTPServerResponseWorker.prototype.execute = function() {
};

JkHttpServerHTTPServerResponseWorker.prototype.onEnd = function() {
	this.session.end();
	var diff = JkTextStringUtil.formatLongInteger((JkLangTimeValue.diff((JkTimeSystemClock.asTimeValue()), this.startTime)), ','.charCodeAt());
	JkLogLog.debug(this.context, "Response worker `" + (JkLangString.safeString((this.getWorkerDescription()))) + ("' ended. Wrote ") + (JkLangString.safeString((JkTextStringUtil.formatInteger((this.session.getTotalBytes()), ','.charCodeAt())))) + (" bytes. Duration=") + (JkLangString.safeString(diff)) + (" us"));
};

JkHttpServerHTTPServerResponseWorker.prototype.abort = function() {
	if(this.session != null) {
		this.session.end();
	}
};

JkHttpServerHTTPServerResponseWorker.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerResponseWorker"] === true;
};

let JkHttpServerHTTPServerComponent = {};

JkHttpServerHTTPServerComponent.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerComponent"] === true;
};

let JkHttpServerHTTPServerExternalCommandResponseWorkerMyDataReceiver = function() {
	this.session = null;
};

JkHttpServerHTTPServerExternalCommandResponseWorkerMyDataReceiver.prototype._t = {
	"JkHttpServerHTTPServerExternalCommandResponseWorkerMyDataReceiver" : true,
	"JkLangBufferDataReceiver" : true
};
JkHttpServerHTTPServerExternalCommandResponseWorkerMyDataReceiver.prototype._tobj = JkHttpServerHTTPServerExternalCommandResponseWorkerMyDataReceiver;

JkHttpServerHTTPServerExternalCommandResponseWorkerMyDataReceiver.NEW = function() {
	var v = new JkHttpServerHTTPServerExternalCommandResponseWorkerMyDataReceiver;
	return v.CTOR_JkHttpServerHTTPServerExternalCommandResponseWorkerMyDataReceiver();
};

JkHttpServerHTTPServerExternalCommandResponseWorkerMyDataReceiver.prototype.CTOR_JkHttpServerHTTPServerExternalCommandResponseWorkerMyDataReceiver = function() {
	this.session = null;
	return this;
};

JkHttpServerHTTPServerExternalCommandResponseWorkerMyDataReceiver.prototype.onBufferData = function(data, size) {
	if(!this.session.writeData(data, (~(~size)))) {
		return false;
	}
	return true;
};

JkHttpServerHTTPServerExternalCommandResponseWorkerMyDataReceiver.prototype.getSession = function() {
	return this.session;
};

JkHttpServerHTTPServerExternalCommandResponseWorkerMyDataReceiver.prototype.setSession = function(v) {
	this.session = v;
	return this;
};

JkHttpServerHTTPServerExternalCommandResponseWorkerMyDataReceiver.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerExternalCommandResponseWorkerMyDataReceiver"] === true;
};

let JkHttpServerHTTPServerExternalCommandResponseWorker = function() {
	JkHttpServerHTTPServerResponseWorker.call(this);
	this.launcher = null;
	this.mimeType = null;
};

JkHttpServerHTTPServerExternalCommandResponseWorker.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkHttpServerHTTPServerResponseWorker.prototype);
JkHttpServerHTTPServerExternalCommandResponseWorker.prototype.constructor = JkHttpServerHTTPServerExternalCommandResponseWorker;
JkHttpServerHTTPServerExternalCommandResponseWorker.prototype._t = {
	"JkHttpServerHTTPServerResponseWorker" : true,
	"JkHttpServerHTTPServerExternalCommandResponseWorker" : true
};
JkHttpServerHTTPServerExternalCommandResponseWorker.prototype._tobj = JkHttpServerHTTPServerExternalCommandResponseWorker;

JkHttpServerHTTPServerExternalCommandResponseWorker.NEW = function() {
	var v = new JkHttpServerHTTPServerExternalCommandResponseWorker;
	return v.CTOR_JkHttpServerHTTPServerExternalCommandResponseWorker();
};

JkHttpServerHTTPServerExternalCommandResponseWorker.prototype.CTOR_JkHttpServerHTTPServerExternalCommandResponseWorker = function() {
	if(JkHttpServerHTTPServerResponseWorker.prototype.CTOR_JkHttpServerHTTPServerResponseWorker.call(this) == null) {
		return null;
	}
	this.mimeType = null;
	this.launcher = null;
	this.mimeType = "text/plain";
	return this;
};

JkHttpServerHTTPServerExternalCommandResponseWorker.forProcessLauncher = function(launcher) {
	var v = JkHttpServerHTTPServerExternalCommandResponseWorker.NEW();
	v.setLauncher(launcher);
	return v;
};

JkHttpServerHTTPServerExternalCommandResponseWorker.forFile = function(file) {
	return JkHttpServerHTTPServerExternalCommandResponseWorker.forProcessLauncher((JkProcessProcessLauncher.forFile(file, null)));
};

JkHttpServerHTTPServerExternalCommandResponseWorker.forCommand = function(command) {
	return JkHttpServerHTTPServerExternalCommandResponseWorker.forProcessLauncher((JkProcessProcessLauncher.forCommand(command, null)));
};

JkHttpServerHTTPServerExternalCommandResponseWorker.prototype.setMimeType = function(value) {
	this.mimeType = value;
};

JkHttpServerHTTPServerExternalCommandResponseWorker.prototype.getMimeType = function() {
	return this.mimeType;
};

JkHttpServerHTTPServerExternalCommandResponseWorker.prototype.getWorkerDescription = function() {
	return "HTTPServerExternalCommandResponseWorker";
};

JkHttpServerHTTPServerExternalCommandResponseWorker.prototype.execute = function() {
	if(!(this.launcher != null)) {
		return;
	}
	var md = JkHttpServerHTTPServerExternalCommandResponseWorkerMyDataReceiver.NEW();
	md.setSession(this.session);
	this.launcher.executeToPipe(md);
};

JkHttpServerHTTPServerExternalCommandResponseWorker.prototype.getLauncher = function() {
	return this.launcher;
};

JkHttpServerHTTPServerExternalCommandResponseWorker.prototype.setLauncher = function(v) {
	this.launcher = v;
	return this;
};

JkHttpServerHTTPServerExternalCommandResponseWorker.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerExternalCommandResponseWorker"] === true;
};

let JkHttpServerHTTPServerRequestHandlerAdapter = function() {
	this.server = null;
	this.logContext = null;
};

JkHttpServerHTTPServerRequestHandlerAdapter.prototype._t = {
	"JkHttpServerHTTPServerRequestHandlerAdapter" : true,
	"JkHttpServerHTTPServerComponent" : true,
	"JkHttpServerHTTPServerRequestHandler" : true
};
JkHttpServerHTTPServerRequestHandlerAdapter.prototype._tobj = JkHttpServerHTTPServerRequestHandlerAdapter;

JkHttpServerHTTPServerRequestHandlerAdapter.NEW = function() {
	var v = new JkHttpServerHTTPServerRequestHandlerAdapter;
	return v.CTOR_JkHttpServerHTTPServerRequestHandlerAdapter();
};

JkHttpServerHTTPServerRequestHandlerAdapter.prototype.CTOR_JkHttpServerHTTPServerRequestHandlerAdapter = function() {
	this.logContext = null;
	this.server = null;
	return this;
};

JkHttpServerHTTPServerRequestHandlerAdapter.prototype.getServer = function() {
	return this.server;
};

JkHttpServerHTTPServerRequestHandlerAdapter.prototype.isInitialized = function() {
	if(this.server == null) {
		return false;
	}
	return true;
};

JkHttpServerHTTPServerRequestHandlerAdapter.prototype.initialize = function(server) {
	this.server = server;
	if(server != null) {
		this.logContext = server.getLogContext();
	}
	else {
		this.logContext = null;
	}
};

JkHttpServerHTTPServerRequestHandlerAdapter.prototype.onMaintenance = function() {
};

JkHttpServerHTTPServerRequestHandlerAdapter.prototype.onRefresh = function() {
};

JkHttpServerHTTPServerRequestHandlerAdapter.prototype.cleanup = function() {
	this.server = null;
};

JkHttpServerHTTPServerRequestHandlerAdapter.prototype.onGET1 = function(req) {
	return false;
};

JkHttpServerHTTPServerRequestHandlerAdapter.prototype.onGET2 = function(req, next) {
	if(this.onGET1(req) == false) {
		next();
	}
};

JkHttpServerHTTPServerRequestHandlerAdapter.prototype.onPOST1 = function(req) {
	return false;
};

JkHttpServerHTTPServerRequestHandlerAdapter.prototype.onPOST2 = function(req, next) {
	if(this.onPOST1(req) == false) {
		next();
	}
};

JkHttpServerHTTPServerRequestHandlerAdapter.prototype.onPUT1 = function(req) {
	return false;
};

JkHttpServerHTTPServerRequestHandlerAdapter.prototype.onPUT2 = function(req, next) {
	if(this.onPUT1(req) == false) {
		next();
	}
};

JkHttpServerHTTPServerRequestHandlerAdapter.prototype.onDELETE1 = function(req) {
	return false;
};

JkHttpServerHTTPServerRequestHandlerAdapter.prototype.onDELETE2 = function(req, next) {
	if(this.onDELETE1(req) == false) {
		next();
	}
};

JkHttpServerHTTPServerRequestHandlerAdapter.prototype.onPATCH1 = function(req) {
	return false;
};

JkHttpServerHTTPServerRequestHandlerAdapter.prototype.onPATCH2 = function(req, next) {
	if(this.onPATCH1(req) == false) {
		next();
	}
};

JkHttpServerHTTPServerRequestHandlerAdapter.prototype.handleRequest = function(req, next) {
	if(req == null) {
		next();
	}
	else if(req.isGET()) {
		this.onGET2(req, next);
	}
	else if(req.isPOST()) {
		this.onPOST2(req, next);
	}
	else if(req.isPUT()) {
		this.onPUT2(req, next);
	}
	else if(req.isDELETE()) {
		this.onDELETE2(req, next);
	}
	else if(req.isPATCH()) {
		this.onPATCH2(req, next);
	}
	else {
		next();
	}
};

JkHttpServerHTTPServerRequestHandlerAdapter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerRequestHandlerAdapter"] === true;
};

let JkHttpServerHTTPServerRequestHandlerStackRequestProcessor = function() {
	this.requestHandlers = null;
	this.request = null;
	this.last = null;
	this.current = 0;
};

JkHttpServerHTTPServerRequestHandlerStackRequestProcessor.prototype._t = { "JkHttpServerHTTPServerRequestHandlerStackRequestProcessor" : true };
JkHttpServerHTTPServerRequestHandlerStackRequestProcessor.prototype._tobj = JkHttpServerHTTPServerRequestHandlerStackRequestProcessor;

JkHttpServerHTTPServerRequestHandlerStackRequestProcessor.NEW = function() {
	var v = new JkHttpServerHTTPServerRequestHandlerStackRequestProcessor;
	return v.CTOR_JkHttpServerHTTPServerRequestHandlerStackRequestProcessor();
};

JkHttpServerHTTPServerRequestHandlerStackRequestProcessor.prototype.CTOR_JkHttpServerHTTPServerRequestHandlerStackRequestProcessor = function() {
	this.current = 0;
	this.last = null;
	this.request = null;
	this.requestHandlers = null;
	return this;
};

JkHttpServerHTTPServerRequestHandlerStackRequestProcessor.prototype.start = function() {
	this.current = -1;
	this.next();
};

JkHttpServerHTTPServerRequestHandlerStackRequestProcessor.prototype.next = function() {
	this.current++;
	var handler = JkLangVector.get(this.requestHandlers, this.current);
	if(handler == null) {
		if(this.last == null) {
			this.defaultLast();
		}
		else {
			this.last();
		}
		return;
	}
	handler.handleRequest(this.request, (function() {
		this.next();
	}.bind(this)));
	this.request.resetResources();
};

JkHttpServerHTTPServerRequestHandlerStackRequestProcessor.prototype.defaultLast = function() {
	this.request.sendResponse((JkHttpServerHTTPServerResponse.forHTTPNotFound(null)));
};

JkHttpServerHTTPServerRequestHandlerStackRequestProcessor.prototype.getRequestHandlers = function() {
	return this.requestHandlers;
};

JkHttpServerHTTPServerRequestHandlerStackRequestProcessor.prototype.setRequestHandlers = function(v) {
	this.requestHandlers = v;
	return this;
};

JkHttpServerHTTPServerRequestHandlerStackRequestProcessor.prototype.getRequest = function() {
	return this.request;
};

JkHttpServerHTTPServerRequestHandlerStackRequestProcessor.prototype.setRequest = function(v) {
	this.request = v;
	return this;
};

JkHttpServerHTTPServerRequestHandlerStackRequestProcessor.prototype.getLast = function() {
	return this.last;
};

JkHttpServerHTTPServerRequestHandlerStackRequestProcessor.prototype.setLast = function(v) {
	this.last = v;
	return this;
};

JkHttpServerHTTPServerRequestHandlerStackRequestProcessor.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerRequestHandlerStackRequestProcessor"] === true;
};

let JkHttpServerHTTPServerRequestHandlerStackFunctionRequestHandler = function() {
	this.handler = null;
};

JkHttpServerHTTPServerRequestHandlerStackFunctionRequestHandler.prototype._t = {
	"JkHttpServerHTTPServerRequestHandlerStackFunctionRequestHandler" : true,
	"JkHttpServerHTTPServerRequestHandler" : true
};
JkHttpServerHTTPServerRequestHandlerStackFunctionRequestHandler.prototype._tobj = JkHttpServerHTTPServerRequestHandlerStackFunctionRequestHandler;

JkHttpServerHTTPServerRequestHandlerStackFunctionRequestHandler.NEW = function() {
	var v = new JkHttpServerHTTPServerRequestHandlerStackFunctionRequestHandler;
	return v.CTOR_JkHttpServerHTTPServerRequestHandlerStackFunctionRequestHandler();
};

JkHttpServerHTTPServerRequestHandlerStackFunctionRequestHandler.prototype.CTOR_JkHttpServerHTTPServerRequestHandlerStackFunctionRequestHandler = function() {
	this.handler = null;
	return this;
};

JkHttpServerHTTPServerRequestHandlerStackFunctionRequestHandler.prototype.handleRequest = function(req, next) {
	this.handler(req, next);
};

JkHttpServerHTTPServerRequestHandlerStackFunctionRequestHandler.prototype.getHandler = function() {
	return this.handler;
};

JkHttpServerHTTPServerRequestHandlerStackFunctionRequestHandler.prototype.setHandler = function(v) {
	this.handler = v;
	return this;
};

JkHttpServerHTTPServerRequestHandlerStackFunctionRequestHandler.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerRequestHandlerStackFunctionRequestHandler"] === true;
};

let JkHttpServerHTTPServerRequestHandlerContainer = function() {
	JkHttpServerHTTPServerRequestHandlerAdapter.call(this);
};

JkHttpServerHTTPServerRequestHandlerContainer.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkHttpServerHTTPServerRequestHandlerAdapter.prototype);
JkHttpServerHTTPServerRequestHandlerContainer.prototype.constructor = JkHttpServerHTTPServerRequestHandlerContainer;
JkHttpServerHTTPServerRequestHandlerContainer.prototype._t = {
	"JkHttpServerHTTPServerRequestHandlerAdapter" : true,
	"JkHttpServerHTTPServerComponent" : true,
	"JkHttpServerHTTPServerRequestHandler" : true,
	"JkHttpServerHTTPServerRequestHandlerContainer" : true
};
JkHttpServerHTTPServerRequestHandlerContainer.prototype._tobj = JkHttpServerHTTPServerRequestHandlerContainer;

JkHttpServerHTTPServerRequestHandlerContainer.NEW = function() {
	var v = new JkHttpServerHTTPServerRequestHandlerContainer;
	return v.CTOR_JkHttpServerHTTPServerRequestHandlerContainer();
};

JkHttpServerHTTPServerRequestHandlerContainer.prototype.CTOR_JkHttpServerHTTPServerRequestHandlerContainer = function() {
	if(JkHttpServerHTTPServerRequestHandlerAdapter.prototype.CTOR_JkHttpServerHTTPServerRequestHandlerAdapter.call(this) == null) {
		return null;
	}
	return this;
};

JkHttpServerHTTPServerRequestHandlerContainer.prototype.iterateRequestHandlers = function() {};

JkHttpServerHTTPServerRequestHandlerContainer.prototype.initialize = function(server) {
	JkHttpServerHTTPServerRequestHandlerAdapter.prototype.initialize.call(this, server);
	var it = this.iterateRequestHandlers();
	while(it != null){
		var handler = it.next();
		if(handler == null) {
			break;
		}
		if(JkHttpServerHTTPServerComponent.IS_INSTANCE && JkHttpServerHTTPServerComponent.IS_INSTANCE(handler)) {
			handler.initialize(server);
		}
	}
};

JkHttpServerHTTPServerRequestHandlerContainer.prototype.onRefresh = function() {
	JkHttpServerHTTPServerRequestHandlerAdapter.prototype.onRefresh.call(this);
	var it = this.iterateRequestHandlers();
	while(it != null){
		var handler = it.next();
		if(handler == null) {
			break;
		}
		if(JkHttpServerHTTPServerComponent.IS_INSTANCE && JkHttpServerHTTPServerComponent.IS_INSTANCE(handler)) {
			handler.onRefresh();
		}
	}
};

JkHttpServerHTTPServerRequestHandlerContainer.prototype.onMaintenance = function() {
	JkHttpServerHTTPServerRequestHandlerAdapter.prototype.onMaintenance.call(this);
	var it = this.iterateRequestHandlers();
	while(it != null){
		var handler = it.next();
		if(handler == null) {
			break;
		}
		if(JkHttpServerHTTPServerComponent.IS_INSTANCE && JkHttpServerHTTPServerComponent.IS_INSTANCE(handler)) {
			handler.onMaintenance();
		}
	}
};

JkHttpServerHTTPServerRequestHandlerContainer.prototype.cleanup = function() {
	JkHttpServerHTTPServerRequestHandlerAdapter.prototype.cleanup.call(this);
	var it = this.iterateRequestHandlers();
	while(it != null){
		var handler = it.next();
		if(handler == null) {
			break;
		}
		if(JkHttpServerHTTPServerComponent.IS_INSTANCE && JkHttpServerHTTPServerComponent.IS_INSTANCE(handler)) {
			handler.cleanup();
		}
	}
};

JkHttpServerHTTPServerRequestHandlerContainer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerRequestHandlerContainer"] === true;
};

let JkHttpServerHTTPServerRequestHandlerMap = function() {
	JkHttpServerHTTPServerRequestHandlerAdapter.call(this);
	this.getHandlerFunctions = null;
	this.postHandlerFunctions = null;
	this.putHandlerFunctions = null;
	this.deleteHandlerFunctions = null;
	this.patchHandlerFunctions = null;
	this.childObjects = null;
};

JkHttpServerHTTPServerRequestHandlerMap.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkHttpServerHTTPServerRequestHandlerAdapter.prototype);
JkHttpServerHTTPServerRequestHandlerMap.prototype.constructor = JkHttpServerHTTPServerRequestHandlerMap;
JkHttpServerHTTPServerRequestHandlerMap.prototype._t = {
	"JkHttpServerHTTPServerRequestHandlerMap" : true,
	"JkHttpServerHTTPServerComponent" : true,
	"JkHttpServerHTTPServerRequestHandlerAdapter" : true,
	"JkHttpServerHTTPServerRequestHandler" : true
};
JkHttpServerHTTPServerRequestHandlerMap.prototype._tobj = JkHttpServerHTTPServerRequestHandlerMap;

JkHttpServerHTTPServerRequestHandlerMap.NEW = function() {
	var v = new JkHttpServerHTTPServerRequestHandlerMap;
	return v.CTOR_JkHttpServerHTTPServerRequestHandlerMap();
};

JkHttpServerHTTPServerRequestHandlerMap.prototype.CTOR_JkHttpServerHTTPServerRequestHandlerMap = function() {
	this.childObjects = null;
	this.patchHandlerFunctions = null;
	this.deleteHandlerFunctions = null;
	this.putHandlerFunctions = null;
	this.postHandlerFunctions = null;
	this.getHandlerFunctions = null;
	if(JkHttpServerHTTPServerRequestHandlerAdapter.prototype.CTOR_JkHttpServerHTTPServerRequestHandlerAdapter.call(this) == null) {
		return null;
	}
	return this;
};

JkHttpServerHTTPServerRequestHandlerMap.prototype.initialize = function(server) {
	JkHttpServerHTTPServerRequestHandlerAdapter.prototype.initialize.call(this, server);
	var it = JkLangMap.iterateValues(this.childObjects);
	while(true){
		var child = it.next();
		if(child == null) {
			break;
		}
		if(JkHttpServerHTTPServerComponent.IS_INSTANCE && JkHttpServerHTTPServerComponent.IS_INSTANCE(child)) {
			child.initialize(server);
		}
	}
};

JkHttpServerHTTPServerRequestHandlerMap.prototype.onMaintenance = function() {
	JkHttpServerHTTPServerRequestHandlerAdapter.prototype.onMaintenance.call(this);
	var it = JkLangMap.iterateValues(this.childObjects);
	while(true){
		var child = it.next();
		if(child == null) {
			break;
		}
		if(JkHttpServerHTTPServerComponent.IS_INSTANCE && JkHttpServerHTTPServerComponent.IS_INSTANCE(child)) {
			child.onMaintenance();
		}
	}
};

JkHttpServerHTTPServerRequestHandlerMap.prototype.onRefresh = function() {
	JkHttpServerHTTPServerRequestHandlerAdapter.prototype.onRefresh.call(this);
	var it = JkLangMap.iterateValues(this.childObjects);
	while(true){
		var child = it.next();
		if(child == null) {
			break;
		}
		if(JkHttpServerHTTPServerComponent.IS_INSTANCE && JkHttpServerHTTPServerComponent.IS_INSTANCE(child)) {
			child.onRefresh();
		}
	}
};

JkHttpServerHTTPServerRequestHandlerMap.prototype.cleanup = function() {
	JkHttpServerHTTPServerRequestHandlerAdapter.prototype.cleanup.call(this);
	var it = JkLangMap.iterateValues(this.childObjects);
	while(true){
		var child = it.next();
		if(child == null) {
			break;
		}
		if(JkHttpServerHTTPServerComponent.IS_INSTANCE && JkHttpServerHTTPServerComponent.IS_INSTANCE(child)) {
			child.cleanup();
		}
	}
};

JkHttpServerHTTPServerRequestHandlerMap.prototype.onHTTPMethod = function(req, functions) {
	var rsc = req.peekResource();
	if(!(rsc != null)) {
		rsc = "";
	}
	var handler = null;
	var rsccount = req.getRemainingResourceCount();
	var pop = true;
	if(rsccount < 1) {
		handler = JkLangMap.get(functions, rsc);
		if(!(handler != null)) {
			handler = JkLangMap.get(functions, "*");
			if(handler != null) {
				pop = false;
			}
		}
	}
	else if(rsccount == 1) {
		handler = JkLangMap.get(functions, (JkLangString.safeString(rsc)) + ("/*"));
		if(!(handler != null)) {
			handler = JkLangMap.get(functions, (JkLangString.safeString(rsc)) + ("/**"));
		}
	}
	else {
		handler = JkLangMap.get(functions, (JkLangString.safeString(rsc)) + ("/**"));
	}
	if(handler != null) {
		if(pop) {
			req.popResource();
		}
		handler(req);
		return true;
	}
	return false;
};

JkHttpServerHTTPServerRequestHandlerMap.prototype.onGET1 = function(req) {
	return this.onHTTPMethod(req, this.getHandlerFunctions);
};

JkHttpServerHTTPServerRequestHandlerMap.prototype.onPOST1 = function(req) {
	return this.onHTTPMethod(req, this.postHandlerFunctions);
};

JkHttpServerHTTPServerRequestHandlerMap.prototype.onPUT1 = function(req) {
	return this.onHTTPMethod(req, this.putHandlerFunctions);
};

JkHttpServerHTTPServerRequestHandlerMap.prototype.onDELETE1 = function(req) {
	return this.onHTTPMethod(req, this.deleteHandlerFunctions);
};

JkHttpServerHTTPServerRequestHandlerMap.prototype.onPATCH1 = function(req) {
	return this.onHTTPMethod(req, this.patchHandlerFunctions);
};

JkHttpServerHTTPServerRequestHandlerMap.prototype.tryHandleRequest = function(req) {
	var v = false;
	if(!(req != null)) {
		;
	}
	else if(req.isGET()) {
		v = this.onGET1(req);
	}
	else if(req.isPOST()) {
		v = this.onPOST1(req);
	}
	else if(req.isPUT()) {
		v = this.onPUT1(req);
	}
	else if(req.isDELETE()) {
		v = this.onDELETE1(req);
	}
	else if(req.isPATCH()) {
		v = this.onPATCH1(req);
	}
	return v;
};

JkHttpServerHTTPServerRequestHandlerMap.prototype.handleRequest = function(req, next) {
	if(this.tryHandleRequest(req)) {
		return;
	}
	var rsc = req.peekResource();
	if(!(rsc != null)) {
		rsc = "";
	}
	var sub = JkLangMap.get(this.childObjects, rsc);
	if(!(sub != null)) {
		sub = JkLangMap.get(this.childObjects, "*");
	}
	if(!(sub != null)) {
		sub = JkLangMap.get(this.childObjects, (JkLangString.safeString(rsc)) + ("/**"));
	}
	if(sub != null) {
		req.popResource();
		sub.handleRequest(req, next);
		return;
	}
	next();
	return;
};

JkHttpServerHTTPServerRequestHandlerMap.prototype.child = function(path, handler) {
	if(path != null) {
		if(!(this.childObjects != null)) {
			this.childObjects = new Map;
		}
		this.childObjects.set(path, handler);
		if(handler != null && (JkHttpServerHTTPServerComponent.IS_INSTANCE && JkHttpServerHTTPServerComponent.IS_INSTANCE(handler)) && this.isInitialized()) {
			handler.initialize((this.getServer()));
		}
	}
	return this;
};

JkHttpServerHTTPServerRequestHandlerMap.prototype.get = function(path, handler) {
	if(path != null) {
		if(!(this.getHandlerFunctions != null)) {
			this.getHandlerFunctions = new Map;
		}
		this.getHandlerFunctions.set(path, handler);
	}
	return this;
};

JkHttpServerHTTPServerRequestHandlerMap.prototype.post = function(path, handler) {
	if(path != null) {
		if(!(this.postHandlerFunctions != null)) {
			this.postHandlerFunctions = new Map;
		}
		this.postHandlerFunctions.set(path, handler);
	}
	return this;
};

JkHttpServerHTTPServerRequestHandlerMap.prototype.put = function(path, handler) {
	if(path != null) {
		if(!(this.putHandlerFunctions != null)) {
			this.putHandlerFunctions = new Map;
		}
		this.putHandlerFunctions.set(path, handler);
	}
	return this;
};

JkHttpServerHTTPServerRequestHandlerMap.prototype._delete = function(path, handler) {
	if(path != null) {
		if(!(this.deleteHandlerFunctions != null)) {
			this.deleteHandlerFunctions = new Map;
		}
		this.deleteHandlerFunctions.set(path, handler);
	}
	return this;
};

JkHttpServerHTTPServerRequestHandlerMap.prototype.patch = function(path, handler) {
	if(path != null) {
		if(!(this.patchHandlerFunctions != null)) {
			this.patchHandlerFunctions = new Map;
		}
		this.patchHandlerFunctions.set(path, handler);
	}
	return this;
};

JkHttpServerHTTPServerRequestHandlerMap.prototype.getOrPost = function(path, handler) {
	this.get(path, handler);
	this.post(path, handler);
	return this;
};

JkHttpServerHTTPServerRequestHandlerMap.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerRequestHandlerMap"] === true;
};

let JkHttpServerHTTPServerRequestHandlerListener = {};

JkHttpServerHTTPServerRequestHandlerListener.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerRequestHandlerListener"] === true;
};

let JkHttpServerHTTPServerBinaryReaderResponseWorker = function() {
	JkHttpServerHTTPServerResponseWorker.call(this);
	this.reader = null;
	this.packetSize = 8192 * 2;
	this.mimeType = null;
	this.workBuffer = null;
};

JkHttpServerHTTPServerBinaryReaderResponseWorker.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkHttpServerHTTPServerResponseWorker.prototype);
JkHttpServerHTTPServerBinaryReaderResponseWorker.prototype.constructor = JkHttpServerHTTPServerBinaryReaderResponseWorker;
JkHttpServerHTTPServerBinaryReaderResponseWorker.prototype._t = {
	"JkHttpServerHTTPServerBinaryReaderResponseWorker" : true,
	"JkHttpServerHTTPServerResponseWorker" : true
};
JkHttpServerHTTPServerBinaryReaderResponseWorker.prototype._tobj = JkHttpServerHTTPServerBinaryReaderResponseWorker;

JkHttpServerHTTPServerBinaryReaderResponseWorker.NEW = function() {
	var v = new JkHttpServerHTTPServerBinaryReaderResponseWorker;
	return v.CTOR_JkHttpServerHTTPServerBinaryReaderResponseWorker();
};

JkHttpServerHTTPServerBinaryReaderResponseWorker.prototype.CTOR_JkHttpServerHTTPServerBinaryReaderResponseWorker = function() {
	if(JkHttpServerHTTPServerResponseWorker.prototype.CTOR_JkHttpServerHTTPServerResponseWorker.call(this) == null) {
		return null;
	}
	this.workBuffer = null;
	this.mimeType = null;
	this.packetSize = 8192 * 2;
	this.reader = null;
	this.mimeType = "application/octet-stream";
	return this;
};

JkHttpServerHTTPServerBinaryReaderResponseWorker.forReader = function(reader) {
	var v = JkHttpServerHTTPServerBinaryReaderResponseWorker.NEW();
	v.setReader(reader);
	return v;
};

JkHttpServerHTTPServerBinaryReaderResponseWorker.prototype.setMimeType = function(value) {
	this.mimeType = value;
};

JkHttpServerHTTPServerBinaryReaderResponseWorker.prototype.getMimeType = function() {
	return this.mimeType;
};

JkHttpServerHTTPServerBinaryReaderResponseWorker.prototype.getWorkerDescription = function() {
	return "HTTPServerBinaryReaderResponseWorker";
};

JkHttpServerHTTPServerBinaryReaderResponseWorker.prototype.onStart = function() {
	JkHttpServerHTTPServerResponseWorker.prototype.onStart.call(this);
	this.workBuffer = new ArrayBuffer(this.packetSize);
};

JkHttpServerHTTPServerBinaryReaderResponseWorker.prototype.tick = function() {
	if(!(this.workBuffer != null)) {
		return false;
	}
	if(!(this.reader != null)) {
		return false;
	}
	var r = this.reader.read(this.workBuffer);
	if(r < 1) {
		return false;
	}
	if(!this.session.writeData(this.workBuffer, r)) {
		JkLogLog.debug(this.context, "Remote connection closed. " + ("HTTPServerBinaryReaderResponseWorker") + (" aborted."));
		return false;
	}
	return true;
};

JkHttpServerHTTPServerBinaryReaderResponseWorker.prototype.getReader = function() {
	return this.reader;
};

JkHttpServerHTTPServerBinaryReaderResponseWorker.prototype.setReader = function(v) {
	this.reader = v;
	return this;
};

JkHttpServerHTTPServerBinaryReaderResponseWorker.prototype.getPacketSize = function() {
	return this.packetSize;
};

JkHttpServerHTTPServerBinaryReaderResponseWorker.prototype.setPacketSize = function(v) {
	this.packetSize = v;
	return this;
};

JkHttpServerHTTPServerBinaryReaderResponseWorker.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerBinaryReaderResponseWorker"] === true;
};

let JkHttpServerHTTPServerResponseSession = function() {
	this.socket = null;
	this.server = null;
	this.request = null;
	this.response = null;
	this.totalBytes = 0;
};

JkHttpServerHTTPServerResponseSession.prototype._t = { "JkHttpServerHTTPServerResponseSession" : true };
JkHttpServerHTTPServerResponseSession.prototype._tobj = JkHttpServerHTTPServerResponseSession;

JkHttpServerHTTPServerResponseSession.NEW = function() {
	var v = new JkHttpServerHTTPServerResponseSession;
	return v.CTOR_JkHttpServerHTTPServerResponseSession();
};

JkHttpServerHTTPServerResponseSession.prototype.CTOR_JkHttpServerHTTPServerResponseSession = function() {
	this.totalBytes = 0;
	this.response = null;
	this.request = null;
	this.server = null;
	this.socket = null;
	return this;
};

JkHttpServerHTTPServerResponseSession.prototype.createHeaderBuffer = function() {
	var ver = null;
	var met = null;
	if(this.request != null) {
		ver = this.request.getVersion();
		met = this.request.getMethod();
	}
	if(ver == "HTTP/0.9") {
		return null;
	}
	var resp = this.response;
	if(resp == null) {
		resp = JkHttpServerHTTPServerResponse.forTextString("");
	}
	var status = resp.getStatus();
	var headers = resp.getHeaders();
	if(status == null || JkLangString.getLength(status) < 1) {
		status = "200";
		resp.setStatus(status);
	}
	var fs = JkHttpServerHTTPServerResponse.getFullStatus(status);
	var reply = JkLangStringBuilder.NEW();
	if(ver == null || JkLangString.getLength(ver) < 1) {
		reply.appendString("HTTP/1.1");
	}
	else {
		reply.appendString(ver);
	}
	reply.appendCharacter(' '.charCodeAt());
	reply.appendString(fs);
	reply.appendCharacter('\r'.charCodeAt());
	reply.appendCharacter('\n'.charCodeAt());
	if(headers != null) {
		var it = headers.iterate();
		while(it != null){
			var kvp = it.next();
			if(kvp == null) {
				break;
			}
			reply.appendString(kvp.key);
			reply.appendCharacter(':'.charCodeAt());
			reply.appendCharacter(' '.charCodeAt());
			reply.appendString(kvp.value);
			reply.appendCharacter('\r'.charCodeAt());
			reply.appendCharacter('\n'.charCodeAt());
		}
	}
	reply.appendString("Connection: close\r\n");
	reply.appendString("Cache-Control: no-store\r\n");
	if(this.server != null) {
		var name = this.server.getServerName();
		if(JkLangString.isNotEmpty(name)) {
			reply.appendString("Server: ");
			reply.appendString(name);
			reply.appendCharacter('\r'.charCodeAt());
			reply.appendCharacter('\n'.charCodeAt());
		}
	}
	reply.appendString("Date: ");
	reply.appendString((JkTimeFormatVerboseDateTimeString.forUTCNow()));
	reply.appendCharacter('\r'.charCodeAt());
	reply.appendCharacter('\n'.charCodeAt());
	reply.appendCharacter('\r'.charCodeAt());
	reply.appendCharacter('\n'.charCodeAt());
	return JkLangString.toUTF8Buffer((reply.toString()));
};

JkHttpServerHTTPServerResponseSession.prototype.writeHeader = function() {
	var bb = this.createHeaderBuffer();
	if(!(bb != null)) {
		return true;
	}
	return this.writeData(bb, (-1));
};

JkHttpServerHTTPServerResponseSession.prototype.writeData = function(data, size) {
	if(!(this.socket != null)) {
		return false;
	}
	if(!(data != null)) {
		return true;
	}
	var sz = size;
	if(sz < 0) {
		sz = data.byteLength;
	}
	var r = this.socket.write(data, sz);
	if(r > 0) {
		this.totalBytes += r;
	}
	if(r < sz) {
		return false;
	}
	return true;
};

JkHttpServerHTTPServerResponseSession.prototype.end = function() {
	if(!(this.socket != null)) {
		return;
	}
	this.socket.close();
	this.socket = null;
};

JkHttpServerHTTPServerResponseSession.prototype.getSocket = function() {
	return this.socket;
};

JkHttpServerHTTPServerResponseSession.prototype.setSocket = function(v) {
	this.socket = v;
	return this;
};

JkHttpServerHTTPServerResponseSession.prototype.getServer = function() {
	return this.server;
};

JkHttpServerHTTPServerResponseSession.prototype.setServer = function(v) {
	this.server = v;
	return this;
};

JkHttpServerHTTPServerResponseSession.prototype.getRequest = function() {
	return this.request;
};

JkHttpServerHTTPServerResponseSession.prototype.setRequest = function(v) {
	this.request = v;
	return this;
};

JkHttpServerHTTPServerResponseSession.prototype.getResponse = function() {
	return this.response;
};

JkHttpServerHTTPServerResponseSession.prototype.setResponse = function(v) {
	this.response = v;
	return this;
};

JkHttpServerHTTPServerResponseSession.prototype.getTotalBytes = function() {
	return this.totalBytes;
};

JkHttpServerHTTPServerResponseSession.prototype.setTotalBytes = function(v) {
	this.totalBytes = v;
	return this;
};

JkHttpServerHTTPServerResponseSession.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerResponseSession"] === true;
};

let JkHttpServerHTTPServerRequest = function() {
	this.method = null;
	this.urlString = null;
	this.version = null;
	this.rawHeaders = null;
	this.headers = null;
	this.url = null;
	this.connection = null;
	this.server = null;
	this.data = null;
	this.session = null;
	this.cookies = null;
	this.bodyBuffer = null;
	this.bodyString = null;
	this.postParameters = null;
	this.resources = null;
	this.currentResource = 0;
	this.relativeResourcePath = null;
	this.responseSent = false;
	this.responseCookies = null;
};

JkHttpServerHTTPServerRequest.prototype._t = {
	"JkHttpServerHTTPServerRequest" : true,
	"JkIoDataStreamSource" : true
};
JkHttpServerHTTPServerRequest.prototype._tobj = JkHttpServerHTTPServerRequest;

JkHttpServerHTTPServerRequest.NEW = function() {
	var v = new JkHttpServerHTTPServerRequest;
	return v.CTOR_JkHttpServerHTTPServerRequest();
};

JkHttpServerHTTPServerRequest.prototype.CTOR_JkHttpServerHTTPServerRequest = function() {
	this.responseCookies = null;
	this.responseSent = false;
	this.relativeResourcePath = null;
	this.currentResource = 0;
	this.resources = null;
	this.postParameters = null;
	this.bodyString = null;
	this.bodyBuffer = null;
	this.cookies = null;
	this.session = null;
	this.data = null;
	this.server = null;
	this.connection = null;
	this.url = null;
	this.headers = null;
	this.rawHeaders = null;
	this.version = null;
	this.urlString = null;
	this.method = null;
	return this;
};

JkHttpServerHTTPServerRequest.forDetails = function(method, url, version, headers) {
	var v = JkHttpServerHTTPServerRequest.NEW();
	v.method = method;
	v.urlString = url;
	v.version = version;
	v.setHeaders(headers);
	return v;
};

JkHttpServerHTTPServerRequest.prototype.asBuffer = function() {
	if(JkLangString.isEmpty(this.method) || JkLangString.isEmpty(this.urlString) || JkLangString.isEmpty(this.version) || this.rawHeaders == null) {
		return null;
	}
	var hdr = JkLangStringBuilder.NEW();
	hdr.appendString(this.method);
	hdr.appendCharacter(' '.charCodeAt());
	hdr.appendString(this.urlString);
	hdr.appendCharacter(' '.charCodeAt());
	hdr.appendString(this.version);
	hdr.appendCharacter('\r'.charCodeAt());
	hdr.appendCharacter('\n'.charCodeAt());
	var itr = this.iterateHeaders();
	if(!(itr != null)) {
		return null;
	}
	while(true){
		var kvp = (function(o) {
			if(JkLangKeyValuePair.IS_INSTANCE && JkLangKeyValuePair.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))((itr.next()));
		if(kvp == null) {
			break;
		}
		hdr.appendString(kvp.key);
		hdr.appendCharacter(':'.charCodeAt());
		hdr.appendCharacter(' '.charCodeAt());
		hdr.appendString(kvp.value);
		hdr.appendCharacter('\r'.charCodeAt());
		hdr.appendCharacter('\n'.charCodeAt());
	}
	hdr.appendCharacter('\r'.charCodeAt());
	hdr.appendCharacter('\n'.charCodeAt());
	var v = JkLangString.toUTF8Buffer((hdr.toString()));
	if(!(v != null)) {
		return null;
	}
	if(this.bodyBuffer != null) {
		v = JkLangBuffer.append(v, this.bodyBuffer, (-1));
	}
	return v;
};

JkHttpServerHTTPServerRequest.prototype.setReceiverDataStream = function(stream) {
	this.setBodyReceiver(stream);
};

JkHttpServerHTTPServerRequest.prototype.setBodyReceiver = function(receiver) {
	if(!(receiver != null)) {
		return;
	}
	if(this.bodyBuffer != null) {
		var sz = this.bodyBuffer.byteLength;
		if(!receiver.onDataStreamStart(sz)) {
			return;
		}
		if(!receiver.onDataStreamContent(this.bodyBuffer, sz)) {
			return;
		}
		receiver.onDataStreamEnd();
		return;
	}
	if(!(this.connection != null)) {
		return;
	}
	this.connection.setBodyReceiver(receiver);
};

JkHttpServerHTTPServerRequest.prototype.clearHeaders = function() {
	this.rawHeaders = null;
	this.headers = null;
};

JkHttpServerHTTPServerRequest.prototype.addHeader = function(key, value) {
	if(!(key != null)) {
		return;
	}
	if(!(this.rawHeaders != null)) {
		this.rawHeaders = JkLangKeyValueList.NEW();
	}
	if(!(this.headers != null)) {
		this.headers = new Map;
	}
	this.rawHeaders.add(key, value);
	this.headers.set((JkLangString.toLowerCase(key)), value);
};

JkHttpServerHTTPServerRequest.prototype.setHeaders = function(headers) {
	this.clearHeaders();
	if(!(headers != null)) {
		return;
	}
	var it = headers.iterate();
	if(!(it != null)) {
		return;
	}
	while(true){
		var kvp = it.next();
		if(!(kvp != null)) {
			break;
		}
		this.addHeader(kvp.key, kvp.value);
	}
};

JkHttpServerHTTPServerRequest.prototype.getHeader = function(name) {
	if(!JkLangString.isNotEmpty(name)) {
		return null;
	}
	if(!(this.headers != null)) {
		return null;
	}
	return JkLangMap.get(this.headers, name);
};

JkHttpServerHTTPServerRequest.prototype.iterateHeaders = function() {
	if(!(this.rawHeaders != null)) {
		return null;
	}
	return this.rawHeaders.iterate();
};

JkHttpServerHTTPServerRequest.prototype.getHeaders = function() {
	return this.headers;
};

JkHttpServerHTTPServerRequest.prototype.getURL = function() {
	if(this.url == null) {
		this.url = JkUrlURL.forString(this.urlString, true);
	}
	return this.url;
};

JkHttpServerHTTPServerRequest.prototype.getQueryParameters = function() {
	var url = this.getURL();
	if(!(url != null)) {
		return null;
	}
	return url.getQueryParameters();
};

JkHttpServerHTTPServerRequest.prototype.iterateQueryParameters = function() {
	var url = this.getURL();
	if(!(url != null)) {
		return null;
	}
	var list = url.getRawQueryParameters();
	if(!(list != null)) {
		return null;
	}
	return list.iterate();
};

JkHttpServerHTTPServerRequest.prototype.getQueryParameter = function(key) {
	var url = this.getURL();
	if(!(url != null)) {
		return null;
	}
	return url.getQueryParameter(key);
};

JkHttpServerHTTPServerRequest.prototype.getURLPath = function() {
	var url = this.getURL();
	if(!(url != null)) {
		return null;
	}
	return url.getPath();
};

JkHttpServerHTTPServerRequest.prototype.getRemoteIPAddress = function() {
	var rr = this.getRemoteAddress();
	if(!(rr != null)) {
		return null;
	}
	var colon = JkLangString.getIndexOfCharacter(rr, ':'.charCodeAt(), 0);
	if(colon < 0) {
		return rr;
	}
	return JkLangString.getSubString(rr, 0, colon);
};

JkHttpServerHTTPServerRequest.prototype.getRemoteAddress = function() {
	if(!(this.connection != null)) {
		return null;
	}
	return this.connection.getRemoteAddress();
};

JkHttpServerHTTPServerRequest.prototype.getConnectionClose = function() {
	var hdr = this.getHeader("connection");
	if(this.version == "HTTP/1.0") {
		if(hdr == "keep-alive") {
			return false;
		}
		return true;
	}
	if(hdr == "close") {
		return true;
	}
	return false;
};

JkHttpServerHTTPServerRequest.prototype.getETag = function() {
	return this.getHeader("if-none-match");
};

JkHttpServerHTTPServerRequest.prototype.getCookieValues = function() {
	if(this.cookies == null) {
		var v = new Map;
		var cvals = this.getHeader("cookie");
		if(cvals != null) {
			var sp = JkLangString.split(cvals, ';'.charCodeAt(), 0);
			if(sp != null) {
				var n = 0;
				var m = sp.length;
				for(n = 0 ; n < m ; n++) {
					var ck = sp[n];
					if(ck != null) {
						ck = JkLangString.strip(ck);
						if(JkLangString.isEmpty(ck)) {
							continue;
						}
						var e = JkLangString.getIndexOfCharacter(ck, '='.charCodeAt(), 0);
						if(e < 0) {
							JkLangMap.set(v, ck, "");
						}
						else {
							JkLangMap.set(v, (JkLangString.getSubString(ck, 0, e)), (JkLangString.getEndOfString(ck, (e + 1))));
						}
					}
				}
			}
		}
		this.cookies = v;
	}
	return this.cookies;
};

JkHttpServerHTTPServerRequest.prototype.getCookieValue = function(name) {
	var c = this.getCookieValues();
	if(!(c != null)) {
		return null;
	}
	return JkLangMap.get(c, name);
};

JkHttpServerHTTPServerRequest.prototype.getBodyString = function() {
	if(this.bodyString == null) {
		var buffer = this.getBodyBuffer();
		if(buffer != null) {
			this.bodyString = JkLangString.forUTF8Buffer(buffer);
		}
		this.bodyBuffer = null;
	}
	return this.bodyString;
};

JkHttpServerHTTPServerRequest.prototype.getBodyJSONObject = function() {
	return JkJsonJSONParser.parseString((this.getBodyString()));
};

JkHttpServerHTTPServerRequest.prototype.getBodyJSONVector = function() {
	return (function(o) {
		if(JkLangDynamicVector.IS_INSTANCE && JkLangDynamicVector.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((this.getBodyJSONObject()));
};

JkHttpServerHTTPServerRequest.prototype.getBodyJSONMap = function() {
	return (function(o) {
		if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((this.getBodyJSONObject()));
};

JkHttpServerHTTPServerRequest.prototype.getBodyJSONMapValue = function(key) {
	var map = this.getBodyJSONMap();
	if(!(map != null)) {
		return null;
	}
	return map.getString(key, null);
};

JkHttpServerHTTPServerRequest.prototype.getPostParameters = function() {
	if(this.postParameters == null) {
		var bs = this.getBodyString();
		if(JkLangString.isEmpty(bs)) {
			return null;
		}
		this.postParameters = JkUrlQueryString.parse(bs);
	}
	return this.postParameters;
};

JkHttpServerHTTPServerRequest.prototype.getPostParameter = function(key) {
	var pps = this.getPostParameters();
	if(!(pps != null)) {
		return null;
	}
	return JkLangMap.get(pps, key);
};

JkHttpServerHTTPServerRequest.prototype.getParameterAsString = function(key) {
	var qp = this.getQueryParameter(key);
	if(qp != null) {
		return qp;
	}
	var pp = this.getPostParameter(key);
	if(pp != null) {
		return pp;
	}
	var mv = this.getBodyJSONMapValue(key);
	if(mv != null) {
		return mv;
	}
	return null;
};

JkHttpServerHTTPServerRequest.prototype.getParameterAsDynamicMap = function(key) {
	var mm = this.getBodyJSONMap();
	if(mm != null) {
		return mm.getDynamicMap(key);
	}
	return null;
};

JkHttpServerHTTPServerRequest.prototype.getParameterAsDynamicVector = function(key) {
	var mm = this.getBodyJSONMap();
	if(mm != null) {
		return mm.getDynamicVector(key);
	}
	var pp = this.getParameterAsString(key);
	if(pp != null) {
		var v = JkLangDynamicVector.NEW();
		var array = JkLangString.split(pp, ','.charCodeAt(), 0);
		if(array != null) {
			var n = 0;
			var m = array.length;
			for(n = 0 ; n < m ; n++) {
				var comp = array[n];
				if(comp != null) {
					v.appendObject(comp);
				}
			}
		}
		return v;
	}
	return null;
};

JkHttpServerHTTPServerRequest.prototype.getParameterAsVector = function(key) {
	var dv = this.getParameterAsDynamicVector(key);
	if(!(dv != null)) {
		return null;
	}
	return dv.toVector();
};

JkHttpServerHTTPServerRequest.prototype.getRelativeRequestPath = function(relativeTo) {
	var path = this.getURLPath();
	if(!(path != null)) {
		return null;
	}
	if(relativeTo != null && JkLangString.startsWith(path, relativeTo, 0)) {
		path = JkLangString.getEndOfString(path, (JkLangString.getLength(relativeTo)));
	}
	else {
		return null;
	}
	if(JkLangString.isEmpty(path)) {
		path = "/";
	}
	return path;
};

JkHttpServerHTTPServerRequest.prototype.initResources = function() {
	var path = this.getURLPath();
	if(!(path != null)) {
		return;
	}
	this.resources = JkLangString.split(path, '/'.charCodeAt(), 0);
	JkLangVector.removeFirst(this.resources);
	var vsz = JkLangVector.getSize(this.resources);
	if(vsz > 0) {
		var last = JkLangVector.get(this.resources, (vsz - 1));
		if(JkLangString.isEmpty(last)) {
			JkLangVector.removeLast(this.resources);
		}
	}
	this.currentResource = 0;
};

JkHttpServerHTTPServerRequest.prototype.hasMoreResources = function() {
	if(!(this.resources != null)) {
		this.initResources();
	}
	if(!(this.resources != null)) {
		return false;
	}
	if(this.currentResource < JkLangVector.getSize(this.resources)) {
		return true;
	}
	return false;
};

JkHttpServerHTTPServerRequest.prototype.getRemainingResourceCount = function() {
	if(!(this.resources != null)) {
		this.initResources();
	}
	if(!(this.resources != null)) {
		return 0;
	}
	return JkLangVector.getSize(this.resources) - this.currentResource - 1;
};

JkHttpServerHTTPServerRequest.prototype.acceptMethodAndResource = function(methodToAccept, resource, mustBeLastResource) {
	if(!(resource != null)) {
		return false;
	}
	if(methodToAccept == null || this.method == methodToAccept) {
		var cc = this.peekResource();
		if(!(cc != null)) {
			return false;
		}
		if(!(cc == resource)) {
			return false;
		}
		this.popResource();
		if(mustBeLastResource && this.hasMoreResources()) {
			this.unpopResource();
			return false;
		}
		return true;
	}
	return false;
};

JkHttpServerHTTPServerRequest.prototype.acceptResource = function(resource, mustBeLastResource) {
	if(!(resource != null)) {
		return false;
	}
	var cc = this.peekResource();
	if(!(cc != null)) {
		return false;
	}
	if(!(cc == resource)) {
		return false;
	}
	this.popResource();
	if(mustBeLastResource && this.hasMoreResources()) {
		this.unpopResource();
		return false;
	}
	return true;
};

JkHttpServerHTTPServerRequest.prototype.peekResource = function() {
	if(this.resources == null) {
		this.initResources();
	}
	if(!(this.resources != null)) {
		return null;
	}
	if(this.currentResource < JkLangVector.getSize(this.resources)) {
		return this.resources[this.currentResource];
	}
	return null;
};

JkHttpServerHTTPServerRequest.prototype.getCurrentResource = function() {
	return this.currentResource;
};

JkHttpServerHTTPServerRequest.prototype.setCurrentResource = function(value) {
	this.currentResource = value;
	this.relativeResourcePath = null;
};

JkHttpServerHTTPServerRequest.prototype.popResource = function() {
	if(this.resources == null) {
		this.initResources();
	}
	var v = this.peekResource();
	if(v != null) {
		this.currentResource++;
		this.relativeResourcePath = null;
	}
	return v;
};

JkHttpServerHTTPServerRequest.prototype.unpopResource = function() {
	if(this.currentResource > 0) {
		this.currentResource--;
		this.relativeResourcePath = null;
	}
};

JkHttpServerHTTPServerRequest.prototype.resetResources = function() {
	this.resources = null;
	this.currentResource = 0;
	this.relativeResourcePath = null;
};

JkHttpServerHTTPServerRequest.prototype.getRelativeResources = function() {
	if(!(this.resources != null)) {
		this.initResources();
	}
	if(!(this.resources != null)) {
		return null;
	}
	if(this.currentResource < 1) {
		return this.resources;
	}
	var v = new Array;
	var cr = this.currentResource;
	while(cr < JkLangVector.getSize(this.resources)){
		v.push(this.resources[cr]);
		cr++;
	}
	return v;
};

JkHttpServerHTTPServerRequest.prototype.getResourcePathComponent = function(index, nTrailingComponents) {
	if(index < 0) {
		return null;
	}
	if(!(this.resources != null)) {
		this.initResources();
	}
	if(!(this.resources != null)) {
		return null;
	}
	var max = nTrailingComponents;
	var vsz = JkLangVector.getSize(this.resources);
	if(max < 0) {
		max = vsz;
	}
	if(max > vsz) {
		max = vsz;
	}
	if(index >= max) {
		return null;
	}
	if(max < vsz) {
		return JkLangVector.get(this.resources, (index + vsz - max));
	}
	return JkLangVector.get(this.resources, index);
};

JkHttpServerHTTPServerRequest.prototype.getRelativeResourcePath = function() {
	if(this.resources == null) {
		return this.getURLPath();
	}
	if(this.relativeResourcePath == null) {
		var rrs = this.getRelativeResources();
		if(rrs != null) {
			var sb = JkLangStringBuilder.NEW();
			if(rrs != null) {
				var n = 0;
				var m = rrs.length;
				for(n = 0 ; n < m ; n++) {
					var rr = rrs[n];
					if(rr != null) {
						if(JkLangString.isEmpty(rr) == false) {
							sb.appendCharacter('/'.charCodeAt());
							sb.appendString(rr);
						}
					}
				}
			}
			if(sb.count() < 1) {
				sb.appendCharacter('/'.charCodeAt());
			}
			this.relativeResourcePath = sb.toString();
		}
	}
	return this.relativeResourcePath;
};

JkHttpServerHTTPServerRequest.prototype.isForResource = function(res) {
	if(!(res != null)) {
		return false;
	}
	var rrp = this.getRelativeResourcePath();
	if(!(rrp != null)) {
		return false;
	}
	if(rrp == res) {
		return true;
	}
	return false;
};

JkHttpServerHTTPServerRequest.prototype.isForDirectory = function() {
	var path = this.getURLPath();
	if(path != null && JkLangString.endsWith(path, "/")) {
		return true;
	}
	return false;
};

JkHttpServerHTTPServerRequest.prototype.isForPrefix = function(res) {
	if(!(res != null)) {
		return false;
	}
	var rr = this.getRelativeResourcePath();
	if(rr != null && JkLangString.startsWith(rr, res, 0)) {
		return true;
	}
	return false;
};

JkHttpServerHTTPServerRequest.prototype.isForMethod = function(mm) {
	if(!(mm != null)) {
		return false;
	}
	if(mm == this.method) {
		return true;
	}
	return false;
};

JkHttpServerHTTPServerRequest.prototype.isGET = function() {
	return this.method == "GET";
};

JkHttpServerHTTPServerRequest.prototype.isPOST = function() {
	return this.method == "POST";
};

JkHttpServerHTTPServerRequest.prototype.isDELETE = function() {
	return this.method == "DELETE";
};

JkHttpServerHTTPServerRequest.prototype.isPUT = function() {
	return this.method == "PUT";
};

JkHttpServerHTTPServerRequest.prototype.isPATCH = function() {
	return this.method == "PATCH";
};

JkHttpServerHTTPServerRequest.prototype.sendJSONObject = function(o) {
	this.sendResponse((JkHttpServerHTTPServerResponse.forJSONString((JkJsonJSONEncoder.encode(o, true, false)))));
};

JkHttpServerHTTPServerRequest.prototype.sendJSONString = function(json) {
	this.sendResponse((JkHttpServerHTTPServerResponse.forJSONString(json)));
};

JkHttpServerHTTPServerRequest.prototype.sendJSONError = function(error) {
	this.sendResponse((JkHttpServerHTTPServerResponse.forJSONString((JkJsonJSONEncoder.encode((JkHttpServerHTTPServerJSONResponse.forError(error)), true, false)))));
};

JkHttpServerHTTPServerRequest.prototype.sendJSONOK = function(data) {
	this.sendResponse((JkHttpServerHTTPServerResponse.forJSONString((JkJsonJSONEncoder.encode((JkHttpServerHTTPServerJSONResponse.forOk(data)), true, false)))));
};

JkHttpServerHTTPServerRequest.prototype.sendInternalError = function(text) {
	this.sendResponse((JkHttpServerHTTPServerResponse.forHTTPInternalError(text)));
};

JkHttpServerHTTPServerRequest.prototype.sendNotAllowed = function() {
	this.sendResponse((JkHttpServerHTTPServerResponse.forHTTPNotAllowed(null)));
};

JkHttpServerHTTPServerRequest.prototype.sendNotFound = function() {
	this.sendResponse((JkHttpServerHTTPServerResponse.forHTTPNotFound(null)));
};

JkHttpServerHTTPServerRequest.prototype.sendInvalidRequest = function(text) {
	this.sendResponse((JkHttpServerHTTPServerResponse.forHTTPInvalidRequest(text)));
};

JkHttpServerHTTPServerRequest.prototype.sendTextString = function(text) {
	this.sendResponse((JkHttpServerHTTPServerResponse.forTextString(text)));
};

JkHttpServerHTTPServerRequest.prototype.sendHTMLString = function(html) {
	this.sendResponse((JkHttpServerHTTPServerResponse.forHTMLString(html)));
};

JkHttpServerHTTPServerRequest.prototype.sendXMLString = function(xml) {
	this.sendResponse((JkHttpServerHTTPServerResponse.forXMLString(xml)));
};

JkHttpServerHTTPServerRequest.prototype.sendFile = function(file) {
	this.sendResponse((JkHttpServerHTTPServerResponse.forFile(file, (-1))));
};

JkHttpServerHTTPServerRequest.prototype.sendBuffer = function(buffer, mimeType) {
	this.sendResponse((JkHttpServerHTTPServerResponse.forBuffer(buffer, mimeType)));
};

JkHttpServerHTTPServerRequest.prototype.sendRedirect = function(url) {
	this.sendResponse((JkHttpServerHTTPServerResponse.forHTTPMovedTemporarily(url)));
};

JkHttpServerHTTPServerRequest.prototype.sendRedirectAsDirectory = function() {
	var path = this.getURLPath();
	if(path == null) {
		path = "";
	}
	this.sendRedirect((JkLangString.safeString(path)) + ("/"));
};

JkHttpServerHTTPServerRequest.prototype.sendFromDirectory = function(resourceDir) {
	if(!(resourceDir != null && resourceDir.isDirectory())) {
		this.sendNotFound();
		return;
	}
	var name = this.popResource();
	if(!JkLangString.isNotEmpty(name)) {
		this.sendNotFound();
		return;
	}
	var ff = resourceDir.entry(name);
	if(!ff.isFile()) {
		this.sendNotFound();
		return;
	}
	this.sendFile(ff);
};

JkHttpServerHTTPServerRequest.prototype.isResponseSent = function() {
	return this.responseSent;
};

JkHttpServerHTTPServerRequest.prototype.addResponseCookie = function(cookie) {
	if(!(cookie != null)) {
		return;
	}
	if(this.responseCookies == null) {
		this.responseCookies = new Array;
	}
	this.responseCookies.push(cookie);
};

JkHttpServerHTTPServerRequest.prototype.sendResponse = function(resp) {
	if(!(this.server != null)) {
		return;
	}
	if(this.responseSent) {
		return;
	}
	if(this.responseCookies != null) {
		var n = 0;
		var m = this.responseCookies.length;
		for(n = 0 ; n < m ; n++) {
			var cookie = this.responseCookies[n];
			if(cookie != null) {
				resp.addCookie(cookie);
			}
		}
	}
	this.responseCookies = null;
	this.server.sendResponse(this.connection, this, resp);
	this.responseSent = true;
};

JkHttpServerHTTPServerRequest.prototype.startBufferResponseWorker = function(buffer, mimeType) {
	var worker = JkHttpServerHTTPServerBinaryReaderResponseWorker.forReader((JkIoBufferReader.forBuffer(buffer)));
	if(!(worker != null)) {
		return false;
	}
	worker.setMimeType(mimeType);
	return this.startResponseWorker(worker);
};

JkHttpServerHTTPServerRequest.prototype.startResponse = function(resp) {
	if(!(this.server != null)) {
		return null;
	}
	if(!(this.responseSent == false)) {
		return null;
	}
	if(this.responseCookies != null) {
		var n = 0;
		var m = this.responseCookies.length;
		for(n = 0 ; n < m ; n++) {
			var cookie = this.responseCookies[n];
			if(cookie != null) {
				resp.addCookie(cookie);
			}
		}
	}
	this.responseCookies = null;
	this.responseSent = true;
	return this.server.startResponse(this.connection, this, resp);
};

JkHttpServerHTTPServerRequest.prototype.startResponseWorker = function(worker) {
	if(!(worker != null)) {
		return false;
	}
	var rs = this.startResponse((JkHttpServerHTTPServerResponse.forOk((worker.getMimeType()))));
	if(!(rs != null)) {
		return false;
	}
	worker.setSession(rs);
	return this.server.startResponseWorker(worker);
};

JkHttpServerHTTPServerRequest.prototype.toMyPacket = function() {
	var builder = JkMypacketMyPacketBuilder.NEW();
	builder.appendLengthEncodedString((this.getMethod()));
	builder.appendLengthEncodedString((this.getUrlString()));
	var nheaders = 0;
	if(this.rawHeaders != null) {
		nheaders = this.rawHeaders.count();
	}
	builder.appendLengthEncodedInteger(nheaders);
	for(var n = 0 ; n < nheaders ; n++) {
		var key = this.rawHeaders.getKey(n);
		var val = this.rawHeaders.getValue(n);
		if(!(key != null)) {
			key = "";
		}
		if(!(val != null)) {
			val = "";
		}
		builder.appendLengthEncodedString(key);
		builder.appendLengthEncodedString(val);
	}
	builder.appendLengthEncodedBuffer((this.getBodyBuffer()));
	return builder.finalize();
};

JkHttpServerHTTPServerRequest.prototype.getMethod = function() {
	return this.method;
};

JkHttpServerHTTPServerRequest.prototype.setMethod = function(v) {
	this.method = v;
	return this;
};

JkHttpServerHTTPServerRequest.prototype.getUrlString = function() {
	return this.urlString;
};

JkHttpServerHTTPServerRequest.prototype.setUrlString = function(v) {
	this.urlString = v;
	return this;
};

JkHttpServerHTTPServerRequest.prototype.getVersion = function() {
	return this.version;
};

JkHttpServerHTTPServerRequest.prototype.setVersion = function(v) {
	this.version = v;
	return this;
};

JkHttpServerHTTPServerRequest.prototype.getConnection = function() {
	return this.connection;
};

JkHttpServerHTTPServerRequest.prototype.setConnection = function(v) {
	this.connection = v;
	return this;
};

JkHttpServerHTTPServerRequest.prototype.getServer = function() {
	return this.server;
};

JkHttpServerHTTPServerRequest.prototype.setServer = function(v) {
	this.server = v;
	return this;
};

JkHttpServerHTTPServerRequest.prototype.getData = function() {
	return this.data;
};

JkHttpServerHTTPServerRequest.prototype.setData = function(v) {
	this.data = v;
	return this;
};

JkHttpServerHTTPServerRequest.prototype.getSession = function() {
	return this.session;
};

JkHttpServerHTTPServerRequest.prototype.setSession = function(v) {
	this.session = v;
	return this;
};

JkHttpServerHTTPServerRequest.prototype.getBodyBuffer = function() {
	return this.bodyBuffer;
};

JkHttpServerHTTPServerRequest.prototype.setBodyBuffer = function(v) {
	this.bodyBuffer = v;
	return this;
};

JkHttpServerHTTPServerRequest.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerRequest"] === true;
};

let JkHttpServerHTTPServerBase = function() {
	JkServerNetworkServer.call(this);
	this.writeBufferSize = 1024 * 512;
	this.smallBodyLimit = 5 * 1024 * 1024;
	this.timeoutDelay = 30;
	this.maintenanceTimerDelay = 60;
	this.serverName = null;
	this.workerThreadPool = null;
	this.timeoutTimer = null;
	this.maintenanceTimer = null;
};

JkHttpServerHTTPServerBase.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkServerNetworkServer.prototype);
JkHttpServerHTTPServerBase.prototype.constructor = JkHttpServerHTTPServerBase;
JkHttpServerHTTPServerBase.prototype._t = {
	"JkServerNetworkServer" : true,
	"JkHttpServerHTTPServerBase" : true,
	"JkServerNetworkConnectionManager" : true
};
JkHttpServerHTTPServerBase.prototype._tobj = JkHttpServerHTTPServerBase;

JkHttpServerHTTPServerBase.NEW = function() {
	var v = new JkHttpServerHTTPServerBase;
	return v.CTOR_JkHttpServerHTTPServerBase();
};

JkHttpServerHTTPServerBase.prototype.CTOR_JkHttpServerHTTPServerBase = function() {
	if(JkServerNetworkServer.prototype.CTOR_JkServerNetworkServer.call(this) == null) {
		return null;
	}
	this.maintenanceTimer = null;
	this.timeoutTimer = null;
	this.workerThreadPool = null;
	this.serverName = null;
	this.maintenanceTimerDelay = 60;
	this.timeoutDelay = 30;
	this.smallBodyLimit = 5 * 1024 * 1024;
	this.writeBufferSize = 1024 * 512;
	this.setPort(8080);
	return this;
};

JkHttpServerHTTPServerBase.prototype.createConnectionObject = function() {
	return JkHttpServerHTTPServerConnection.NEW();
};

JkHttpServerHTTPServerBase.prototype.onRefresh = function() {
};

JkHttpServerHTTPServerBase.prototype.onTimeoutTimer = function() {
	var cfc = new Array;
	var now = JkTimeSystemClock.asSeconds();
	this.forEachConnection((function(connection1) {
		var httpc = (function(o) {
			if(JkHttpServerHTTPServerConnection.IS_INSTANCE && JkHttpServerHTTPServerConnection.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))(connection1);
		if(httpc == null) {
			return;
		}
		if((httpc.getResponses() >= httpc.getRequests() || httpc.getIsWaitingForBodyReceiver()) && now - httpc.getLastActivity() >= this.timeoutDelay) {
			cfc.push(httpc);
		}
	}.bind(this)));
	if(cfc != null) {
		var n = 0;
		var m = cfc.length;
		for(n = 0 ; n < m ; n++) {
			var wsc = cfc[n];
			if(wsc != null) {
				wsc.close();
			}
		}
	}
	return true;
};

JkHttpServerHTTPServerBase.prototype.onMaintenanceTimer = function() {
	this.onMaintenance();
	return true;
};

JkHttpServerHTTPServerBase.prototype.onMaintenance = function() {
};

JkHttpServerHTTPServerBase.prototype.startTimer = function(delay, handler) {
	if(!(this.ioManager != null)) {
		return null;
	}
	return this.ioManager.startTimer(delay, handler);
};

JkHttpServerHTTPServerBase.prototype.initialize2 = function() {
	if(!JkServerNetworkServer.prototype.initialize2.call(this)) {
		return false;
	}
	if(this.timeoutDelay < 1) {
		JkLogLog.debug(this.logContext, "HTTPServerBase" + (": Timeout timer disabled"));
	}
	else {
		JkLogLog.debug(this.logContext, "HTTPServerBase" + (": Starting a timeout timer with a ") + (JkLangString.safeString((JkLangString.forInteger(this.timeoutDelay)))) + (" second delay."));
		this.timeoutTimer = this.ioManager.startTimer((~(~this.timeoutDelay) * 1000000), (function() {
			return this.onTimeoutTimer();
		}.bind(this)));
		if(this.timeoutTimer == null) {
			JkLogLog.error(this.logContext, "HTTPServerBase" + (": Failed to start timeout timer"));
		}
	}
	if(this.maintenanceTimerDelay < 1) {
		JkLogLog.debug(this.logContext, "Maintenance timer disabled");
	}
	else {
		JkLogLog.debug(this.logContext, "HTTPServerBase" + (": Starting a maintenance timer with a ") + (JkLangString.safeString((JkLangString.forInteger(this.maintenanceTimerDelay)))) + (" second delay."));
		this.maintenanceTimer = this.ioManager.startTimer((~(~this.maintenanceTimerDelay) * 1000000), (function() {
			return this.onMaintenanceTimer();
		}.bind(this)));
		if(this.maintenanceTimer == null) {
			JkLogLog.error(this.logContext, "HTTPServerBase" + (": Failed to start maintenance timer"));
		}
	}
	JkLogLog.info(this.logContext, "HTTPServerBase" + (": server initialized."));
	return true;
};

JkHttpServerHTTPServerBase.prototype.cleanup = function() {
	JkServerNetworkServer.prototype.cleanup.call(this);
	if(this.maintenanceTimer != null) {
		this.maintenanceTimer.stop();
		this.maintenanceTimer = null;
	}
	if(this.timeoutTimer != null) {
		this.timeoutTimer.stop();
		this.timeoutTimer = null;
	}
};

JkHttpServerHTTPServerBase.prototype.createOptionsResponse = function(req) {
	return JkHttpServerHTTPServerResponse.NEW().setStatus("200").addHeader("Content-Length", "0");
};

JkHttpServerHTTPServerBase.prototype.onRequest = function(req) {
	req.sendResponse((JkHttpServerHTTPServerResponse.forHTTPNotFound(null)));
};

JkHttpServerHTTPServerBase.prototype.handleIncomingRequest = function(req) {
	if(!(req != null)) {
		return;
	}
	if(req.getMethod() == "OPTIONS") {
		var resp = this.createOptionsResponse(req);
		if(resp != null) {
			req.sendResponse(resp);
			return;
		}
	}
	this.onRequest(req);
};

JkHttpServerHTTPServerBase.prototype.sendResponse = function(connection, req, resp) {
	if(!(connection != null)) {
		return;
	}
	connection.sendResponse(req, resp);
};

JkHttpServerHTTPServerBase.prototype.startResponse = function(connection, req, resp) {
	if(!(connection != null)) {
		return null;
	}
	return connection.startResponse(req, resp);
};

JkHttpServerHTTPServerBase.prototype.startResponseWorker = function(worker) {
	if(!(worker != null)) {
		return false;
	}
	worker.setContext(this.logContext);
	if(!(this.workerThreadPool != null)) {
		JkLogLog.error(this.logContext, "Trying to start a response worker, but no thread pool has been initialized");
		worker.abort();
		return false;
	}
	this.workerThreadPool.submitTask((JkHttpServerHTTPServerBaseWorkerThread.NEW().setWorker(worker)));
	JkLogLog.debug(this.logContext, "HTTPServerBase" + (": Starting a new worker thread. We now have ") + (JkLangString.safeString((JkLangString.forInteger((this.workerThreadPool.getRunningThreadsCount()))))) + (" thread(s)."));
	return true;
};

JkHttpServerHTTPServerBase.prototype.onRequestComplete = function(request, resp, bytesSent, remoteAddress) {
};

JkHttpServerHTTPServerBase.prototype.getWriteBufferSize = function() {
	return this.writeBufferSize;
};

JkHttpServerHTTPServerBase.prototype.setWriteBufferSize = function(v) {
	this.writeBufferSize = v;
	return this;
};

JkHttpServerHTTPServerBase.prototype.getSmallBodyLimit = function() {
	return this.smallBodyLimit;
};

JkHttpServerHTTPServerBase.prototype.setSmallBodyLimit = function(v) {
	this.smallBodyLimit = v;
	return this;
};

JkHttpServerHTTPServerBase.prototype.getTimeoutDelay = function() {
	return this.timeoutDelay;
};

JkHttpServerHTTPServerBase.prototype.setTimeoutDelay = function(v) {
	this.timeoutDelay = v;
	return this;
};

JkHttpServerHTTPServerBase.prototype.getMaintenanceTimerDelay = function() {
	return this.maintenanceTimerDelay;
};

JkHttpServerHTTPServerBase.prototype.setMaintenanceTimerDelay = function(v) {
	this.maintenanceTimerDelay = v;
	return this;
};

JkHttpServerHTTPServerBase.prototype.getServerName = function() {
	return this.serverName;
};

JkHttpServerHTTPServerBase.prototype.setServerName = function(v) {
	this.serverName = v;
	return this;
};

JkHttpServerHTTPServerBase.prototype.getWorkerThreadPool = function() {
	return this.workerThreadPool;
};

JkHttpServerHTTPServerBase.prototype.setWorkerThreadPool = function(v) {
	this.workerThreadPool = v;
	return this;
};

JkHttpServerHTTPServerBase.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerBase"] === true;
};

let JkHttpServerHTTPServerRequestHandlerStack = function() {
	JkHttpServerHTTPServerRequestHandlerContainer.call(this);
	this.requestHandlers = null;
};

JkHttpServerHTTPServerRequestHandlerStack.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkHttpServerHTTPServerRequestHandlerContainer.prototype);
JkHttpServerHTTPServerRequestHandlerStack.prototype.constructor = JkHttpServerHTTPServerRequestHandlerStack;
JkHttpServerHTTPServerRequestHandlerStack.prototype._t = {
	"JkHttpServerHTTPServerRequestHandlerAdapter" : true,
	"JkHttpServerHTTPServerRequestHandlerStack" : true,
	"JkHttpServerHTTPServerComponent" : true,
	"JkHttpServerHTTPServerRequestHandlerContainer" : true,
	"JkHttpServerHTTPServerRequestHandler" : true
};
JkHttpServerHTTPServerRequestHandlerStack.prototype._tobj = JkHttpServerHTTPServerRequestHandlerStack;

JkHttpServerHTTPServerRequestHandlerStack.NEW = function() {
	var v = new JkHttpServerHTTPServerRequestHandlerStack;
	return v.CTOR_JkHttpServerHTTPServerRequestHandlerStack();
};

JkHttpServerHTTPServerRequestHandlerStack.prototype.CTOR_JkHttpServerHTTPServerRequestHandlerStack = function() {
	this.requestHandlers = null;
	if(JkHttpServerHTTPServerRequestHandlerContainer.prototype.CTOR_JkHttpServerHTTPServerRequestHandlerContainer.call(this) == null) {
		return null;
	}
	return this;
};

JkHttpServerHTTPServerRequestHandlerStack.prototype.iterateRequestHandlers = function() {
	if(!(this.requestHandlers != null)) {
		return null;
	}
	return JkLangVector.iterate(this.requestHandlers);
};

JkHttpServerHTTPServerRequestHandlerStack.prototype.pushRequestHandler1 = function(handler) {
	if(!(handler != null)) {
		return;
	}
	this.pushRequestHandler2((JkHttpServerHTTPServerRequestHandlerStackFunctionRequestHandler.NEW().setHandler(handler)));
};

JkHttpServerHTTPServerRequestHandlerStack.prototype.pushRequestHandler2 = function(handler) {
	if(!(handler != null)) {
		return;
	}
	if(this.requestHandlers == null) {
		this.requestHandlers = new Array;
	}
	this.requestHandlers.push(handler);
	if(JkHttpServerHTTPServerComponent.IS_INSTANCE && JkHttpServerHTTPServerComponent.IS_INSTANCE(handler) && this.isInitialized()) {
		handler.initialize((this.getServer()));
	}
};

JkHttpServerHTTPServerRequestHandlerStack.prototype.handleRequest = function(req, next) {
	var rp = JkHttpServerHTTPServerRequestHandlerStackRequestProcessor.NEW();
	rp.setRequestHandlers(this.requestHandlers);
	rp.setRequest(req);
	rp.setLast(next);
	rp.start();
};

JkHttpServerHTTPServerRequestHandlerStack.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerRequestHandlerStack"] === true;
};

let JkHttpServerHTTPServerStaticContentHandler = function() {
	this.content = null;
	this.mimeType = null;
	this.redirectUrl = null;
};

JkHttpServerHTTPServerStaticContentHandler.prototype._t = {
	"JkHttpServerHTTPServerStaticContentHandler" : true,
	"JkHttpServerHTTPServerRequestHandler" : true
};
JkHttpServerHTTPServerStaticContentHandler.prototype._tobj = JkHttpServerHTTPServerStaticContentHandler;

JkHttpServerHTTPServerStaticContentHandler.NEW = function() {
	var v = new JkHttpServerHTTPServerStaticContentHandler;
	return v.CTOR_JkHttpServerHTTPServerStaticContentHandler();
};

JkHttpServerHTTPServerStaticContentHandler.prototype.CTOR_JkHttpServerHTTPServerStaticContentHandler = function() {
	this.redirectUrl = null;
	this.mimeType = null;
	this.content = null;
	return this;
};

JkHttpServerHTTPServerStaticContentHandler.forContent = function(content, mimeType) {
	var v = JkHttpServerHTTPServerStaticContentHandler.NEW();
	v.setContent(content);
	v.setMimeType(mimeType);
	return v;
};

JkHttpServerHTTPServerStaticContentHandler.forHTMLContent = function(content) {
	var v = JkHttpServerHTTPServerStaticContentHandler.NEW();
	v.setContent(content);
	v.setMimeType("text/html");
	return v;
};

JkHttpServerHTTPServerStaticContentHandler.forJSONContent = function(content) {
	var v = JkHttpServerHTTPServerStaticContentHandler.NEW();
	v.setContent(content);
	v.setMimeType("application/json");
	return v;
};

JkHttpServerHTTPServerStaticContentHandler.forRedirect = function(url) {
	var v = JkHttpServerHTTPServerStaticContentHandler.NEW();
	v.setRedirectUrl(url);
	return v;
};

JkHttpServerHTTPServerStaticContentHandler.prototype.handleRequest = function(req, next) {
	if(this.redirectUrl != null) {
		req.sendResponse((JkHttpServerHTTPServerResponse.forRedirect(this.redirectUrl)));
	}
	else {
		req.sendResponse((JkHttpServerHTTPServerResponse.forString(this.content, this.mimeType)));
	}
};

JkHttpServerHTTPServerStaticContentHandler.prototype.getContent = function() {
	return this.content;
};

JkHttpServerHTTPServerStaticContentHandler.prototype.setContent = function(v) {
	this.content = v;
	return this;
};

JkHttpServerHTTPServerStaticContentHandler.prototype.getMimeType = function() {
	return this.mimeType;
};

JkHttpServerHTTPServerStaticContentHandler.prototype.setMimeType = function(v) {
	this.mimeType = v;
	return this;
};

JkHttpServerHTTPServerStaticContentHandler.prototype.getRedirectUrl = function() {
	return this.redirectUrl;
};

JkHttpServerHTTPServerStaticContentHandler.prototype.setRedirectUrl = function(v) {
	this.redirectUrl = v;
	return this;
};

JkHttpServerHTTPServerStaticContentHandler.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerStaticContentHandler"] === true;
};

let JkHttpServerHTTPServerBaseWorkerThread = function() {
	this.worker = null;
};

JkHttpServerHTTPServerBaseWorkerThread.prototype._t = {
	"JkHttpServerHTTPServerBaseWorkerThread" : true,
	"JkLangRunnable" : true
};
JkHttpServerHTTPServerBaseWorkerThread.prototype._tobj = JkHttpServerHTTPServerBaseWorkerThread;

JkHttpServerHTTPServerBaseWorkerThread.NEW = function() {
	var v = new JkHttpServerHTTPServerBaseWorkerThread;
	return v.CTOR_JkHttpServerHTTPServerBaseWorkerThread();
};

JkHttpServerHTTPServerBaseWorkerThread.prototype.CTOR_JkHttpServerHTTPServerBaseWorkerThread = function() {
	this.worker = null;
	return this;
};

JkHttpServerHTTPServerBaseWorkerThread.prototype.run = function() {
	if(!(this.worker != null)) {
		return;
	}
	this.worker.onStart();
	while(true){
		if(this.worker.tick() == false) {
			break;
		}
	}
	this.worker.onEnd();
};

JkHttpServerHTTPServerBaseWorkerThread.prototype.getWorker = function() {
	return this.worker;
};

JkHttpServerHTTPServerBaseWorkerThread.prototype.setWorker = function(v) {
	this.worker = v;
	return this;
};

JkHttpServerHTTPServerBaseWorkerThread.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerBaseWorkerThread"] === true;
};

let JkHttpServerHTTPServer = function() {
	JkHttpServerHTTPServerBase.call(this);
	this.createOptionsResponseHandler = null;
	this.requestHandlerListenerFunctions = null;
	this.requestHandlerListenerObjects = null;
	this.handlerStack = null;
};

JkHttpServerHTTPServer.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkHttpServerHTTPServerBase.prototype);
JkHttpServerHTTPServer.prototype.constructor = JkHttpServerHTTPServer;
JkHttpServerHTTPServer.prototype._t = {
	"JkHttpServerHTTPServer" : true,
	"JkServerNetworkServer" : true,
	"JkHttpServerHTTPServerBase" : true,
	"JkServerNetworkConnectionManager" : true
};
JkHttpServerHTTPServer.prototype._tobj = JkHttpServerHTTPServer;

JkHttpServerHTTPServer.NEW = function() {
	var v = new JkHttpServerHTTPServer;
	return v.CTOR_JkHttpServerHTTPServer();
};

JkHttpServerHTTPServer.prototype.CTOR_JkHttpServerHTTPServer = function() {
	if(JkHttpServerHTTPServerBase.prototype.CTOR_JkHttpServerHTTPServerBase.call(this) == null) {
		return null;
	}
	this.handlerStack = null;
	this.requestHandlerListenerObjects = null;
	this.requestHandlerListenerFunctions = null;
	this.createOptionsResponseHandler = null;
	this.handlerStack = JkHttpServerHTTPServerRequestHandlerStack.NEW();
	return this;
};

JkHttpServerHTTPServer.prototype.initialize2 = function() {
	if(!JkHttpServerHTTPServerBase.prototype.initialize2.call(this)) {
		return false;
	}
	this.handlerStack.initialize(this);
	if(this.requestHandlerListenerObjects != null) {
		var n = 0;
		var m = this.requestHandlerListenerObjects.length;
		for(n = 0 ; n < m ; n++) {
			var listener = this.requestHandlerListenerObjects[n];
			if(listener != null) {
				if(JkHttpServerHTTPServerComponent.IS_INSTANCE && JkHttpServerHTTPServerComponent.IS_INSTANCE(listener)) {
					listener.initialize(this);
				}
			}
		}
	}
	return true;
};

JkHttpServerHTTPServer.prototype.onRefresh = function() {
	JkHttpServerHTTPServerBase.prototype.onRefresh.call(this);
	this.handlerStack.onRefresh();
	if(this.requestHandlerListenerObjects != null) {
		var n = 0;
		var m = this.requestHandlerListenerObjects.length;
		for(n = 0 ; n < m ; n++) {
			var listener = this.requestHandlerListenerObjects[n];
			if(listener != null) {
				if(JkHttpServerHTTPServerComponent.IS_INSTANCE && JkHttpServerHTTPServerComponent.IS_INSTANCE(listener)) {
					listener.onRefresh();
				}
			}
		}
	}
};

JkHttpServerHTTPServer.prototype.onMaintenance = function() {
	JkHttpServerHTTPServerBase.prototype.onMaintenance.call(this);
	this.handlerStack.onMaintenance();
	if(this.requestHandlerListenerObjects != null) {
		var n = 0;
		var m = this.requestHandlerListenerObjects.length;
		for(n = 0 ; n < m ; n++) {
			var listener = this.requestHandlerListenerObjects[n];
			if(listener != null) {
				if(JkHttpServerHTTPServerComponent.IS_INSTANCE && JkHttpServerHTTPServerComponent.IS_INSTANCE(listener)) {
					listener.onMaintenance();
				}
			}
		}
	}
};

JkHttpServerHTTPServer.prototype.cleanup = function() {
	JkHttpServerHTTPServerBase.prototype.cleanup.call(this);
	this.handlerStack.cleanup();
	if(this.requestHandlerListenerObjects != null) {
		var n = 0;
		var m = this.requestHandlerListenerObjects.length;
		for(n = 0 ; n < m ; n++) {
			var listener = this.requestHandlerListenerObjects[n];
			if(listener != null) {
				if(JkHttpServerHTTPServerComponent.IS_INSTANCE && JkHttpServerHTTPServerComponent.IS_INSTANCE(listener)) {
					listener.cleanup();
				}
			}
		}
	}
};

JkHttpServerHTTPServer.prototype.pushRequestHandler1 = function(handler) {
	this.handlerStack.pushRequestHandler1(handler);
};

JkHttpServerHTTPServer.prototype.pushRequestHandler2 = function(handler) {
	this.handlerStack.pushRequestHandler2(handler);
};

JkHttpServerHTTPServer.prototype.addRequestHandlerListener1 = function(handler) {
	if(this.requestHandlerListenerFunctions == null) {
		this.requestHandlerListenerFunctions = new Array;
	}
	this.requestHandlerListenerFunctions.push(handler);
};

JkHttpServerHTTPServer.prototype.addRequestHandlerListener2 = function(handler) {
	if(this.requestHandlerListenerObjects == null) {
		this.requestHandlerListenerObjects = new Array;
	}
	this.requestHandlerListenerObjects.push(handler);
	if(JkHttpServerHTTPServerComponent.IS_INSTANCE && JkHttpServerHTTPServerComponent.IS_INSTANCE(handler) && this.isInitialized()) {
		handler.initialize(this);
	}
};

JkHttpServerHTTPServer.prototype.createOptionsResponse = function(req) {
	if(this.createOptionsResponseHandler != null) {
		return this.createOptionsResponseHandler(req);
	}
	return JkHttpServerHTTPServerBase.prototype.createOptionsResponse.call(this, req);
};

JkHttpServerHTTPServer.prototype.onRequest = function(req) {
	var rq = req;
	try {
		this.handlerStack.handleRequest(((function(o) {
			if(JkHttpServerHTTPServerRequest.IS_INSTANCE && JkHttpServerHTTPServerRequest.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))(req)), (function() {
			rq.sendResponse((JkHttpServerHTTPServerResponse.forHTTPNotFound(null)));
		}.bind(this)));
	}
	catch(e) {
		JkLogLog.error(this.logContext, "Exception while processing request: " + (JkLangString.safeString((JkLogLog.asString(this.logContext, e)))));
		rq.sendResponse((JkHttpServerHTTPServerResponse.forHTTPInternalError(null)));
	}
};

JkHttpServerHTTPServer.prototype.onRequestComplete = function(request, resp, bytesSent, remoteAddress) {
	JkHttpServerHTTPServerBase.prototype.onRequestComplete.call(this, request, resp, bytesSent, remoteAddress);
	if(this.requestHandlerListenerFunctions != null) {
		var n = 0;
		var m = this.requestHandlerListenerFunctions.length;
		for(n = 0 ; n < m ; n++) {
			var handler = this.requestHandlerListenerFunctions[n];
			if(handler != null) {
				handler(request, resp, bytesSent, remoteAddress);
			}
		}
	}
	if(this.requestHandlerListenerObjects != null) {
		var n2 = 0;
		var m2 = this.requestHandlerListenerObjects.length;
		for(n2 = 0 ; n2 < m2 ; n2++) {
			var handler1 = this.requestHandlerListenerObjects[n2];
			if(handler1 != null) {
				handler1.onRequestHandled(request, resp, bytesSent, remoteAddress);
			}
		}
	}
};

JkHttpServerHTTPServer.prototype.getCreateOptionsResponseHandler = function() {
	return this.createOptionsResponseHandler;
};

JkHttpServerHTTPServer.prototype.setCreateOptionsResponseHandler = function(v) {
	this.createOptionsResponseHandler = v;
	return this;
};

JkHttpServerHTTPServer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServer"] === true;
};

let JkHttpServerHTTPServerRequestLogger = function() {
	this.logdir = null;
	this.logContext = null;
};

JkHttpServerHTTPServerRequestLogger.prototype._t = {
	"JkHttpServerHTTPServerRequestHandlerListener" : true,
	"JkHttpServerHTTPServerRequestLogger" : true
};
JkHttpServerHTTPServerRequestLogger.prototype._tobj = JkHttpServerHTTPServerRequestLogger;

JkHttpServerHTTPServerRequestLogger.NEW = function() {
	var v = new JkHttpServerHTTPServerRequestLogger;
	return v.CTOR_JkHttpServerHTTPServerRequestLogger();
};

JkHttpServerHTTPServerRequestLogger.prototype.CTOR_JkHttpServerHTTPServerRequestLogger = function() {
	this.logContext = null;
	this.logdir = null;
	return this;
};

JkHttpServerHTTPServerRequestLogger.prototype.onRequestHandled = function(request, resp, written, aremoteAddress) {
	var remoteAddress = aremoteAddress;
	if(JkLangString.isEmpty(remoteAddress)) {
		remoteAddress = "-";
	}
	var username = null;
	if(JkLangString.isEmpty(username)) {
		username = "-";
	}
	var sessionid = null;
	if(JkLangString.isEmpty(sessionid)) {
		sessionid = "-";
	}
	var dt = JkTimeSystemClock.asDateTimeUTC();
	var logTime = null;
	if(dt != null) {
		logTime = (JkLangString.safeString((JkLangString.forInteger((dt.getDayOfMonth()))))) + ("/") + (JkLangString.safeString((JkLangString.forInteger((dt.getMonth()))))) + ("/") + (JkLangString.safeString((JkLangString.forInteger((dt.getYear()))))) + ("/") + (JkLangString.safeString((JkLangString.forInteger((dt.getHours()))))) + ("/") + (JkLangString.safeString((JkLangString.forInteger((dt.getMinutes()))))) + ("/") + (JkLangString.safeString((JkLangString.forInteger((dt.getSeconds()))))) + (" UTC");
	}
	else {
		logTime = "[DATE/TIME]";
	}
	var rf = request.getHeader("referer");
	if(JkLangString.isEmpty(rf)) {
		rf = "-";
	}
	var logLine = (JkLangString.safeString(remoteAddress)) + (" ") + (JkLangString.safeString(username)) + (" ") + (JkLangString.safeString(sessionid)) + (" [") + (JkLangString.safeString(logTime)) + ("] \"") + (JkLangString.safeString((request.getMethod()))) + (" ") + (JkLangString.safeString((request.getURLPath()))) + (" ") + (JkLangString.safeString((request.getVersion()))) + ("\" ") + (JkLangString.safeString((resp.getStatus()))) + (" ") + (JkLangString.safeString((JkLangString.forInteger(written)))) + (" \"") + (JkLangString.safeString(rf)) + ("\" \"") + (JkLangString.safeString((request.getHeader("user-agent")))) + ("\"");
	if(this.logdir != null) {
		var logidname = null;
		if(dt != null) {
			logidname = "accesslog_" + (JkLangString.safeString((JkLangString.forInteger((dt.getYear()))))) + (JkLangString.safeString((JkLangString.forInteger((dt.getMonth()))))) + (JkLangString.safeString((JkLangString.forInteger((dt.getDayOfMonth()))))) + (".log");
		}
		else {
			logidname = "accesslog.log";
		}
		var os = JkIoPrintWriterWrapper.forWriter((this.logdir.entry(logidname).append()));
		if(os == null && this.logdir.isDirectory() == false) {
			this.logdir.createDirectoryRecursive();
			os = JkIoPrintWriterWrapper.forWriter((this.logdir.entry(logidname).append()));
		}
		if(os != null) {
			os.println(logLine);
		}
		JkLogLog.debug(this.logContext, logLine);
	}
	else if(this.logContext != null) {
		JkLogLog.info(this.logContext, logLine);
	}
	else {
		console.log(logLine);
	}
};

JkHttpServerHTTPServerRequestLogger.prototype.getLogdir = function() {
	return this.logdir;
};

JkHttpServerHTTPServerRequestLogger.prototype.setLogdir = function(v) {
	this.logdir = v;
	return this;
};

JkHttpServerHTTPServerRequestLogger.prototype.getLogContext = function() {
	return this.logContext;
};

JkHttpServerHTTPServerRequestLogger.prototype.setLogContext = function(v) {
	this.logContext = v;
	return this;
};

JkHttpServerHTTPServerRequestLogger.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerRequestLogger"] === true;
};

let JkHttpServerHTTPServerJSONResponse = function() {};

JkHttpServerHTTPServerJSONResponse.prototype._t = { "JkHttpServerHTTPServerJSONResponse" : true };
JkHttpServerHTTPServerJSONResponse.prototype._tobj = JkHttpServerHTTPServerJSONResponse;

JkHttpServerHTTPServerJSONResponse.NEW = function() {
	var v = new JkHttpServerHTTPServerJSONResponse;
	return v.CTOR_JkHttpServerHTTPServerJSONResponse();
};

JkHttpServerHTTPServerJSONResponse.prototype.CTOR_JkHttpServerHTTPServerJSONResponse = function() {
	return this;
};

JkHttpServerHTTPServerJSONResponse.forError = function(eo) {
	if(JkLangError.IS_INSTANCE && JkLangError.IS_INSTANCE(eo)) {
		var error = eo;
		var v = JkLangDynamicMap.NEW();
		v.setString("status", "error");
		if(error != null) {
			var code = error.getCode();
			var detail = JkLangString.asString((error.getDetail()));
			if(JkLangString.isNotEmpty(code)) {
				v.setString("code", code);
			}
			if(JkLangString.isNotEmpty(detail)) {
				v.setString("detail", detail);
			}
		}
		return v;
	}
	if(typeof(eo) === 'string') {
		return JkHttpServerHTTPServerJSONResponse.forErrorCode(eo);
	}
	var v1 = JkLangDynamicMap.NEW();
	v1.setString("status", "error");
	return v1;
};

JkHttpServerHTTPServerJSONResponse.forErrorCode = function(code) {
	var v = JkLangDynamicMap.NEW();
	v.setString("status", "error");
	v.setString("code", code);
	return v;
};

JkHttpServerHTTPServerJSONResponse.forErrorMessage = function(message, code) {
	var v = JkLangDynamicMap.NEW();
	v.setString("status", "error");
	if(JkLangString.isNotEmpty(message)) {
		v.setString("message", message);
	}
	if(JkLangString.isNotEmpty(code)) {
		v.setString("code", code);
	}
	return v;
};

JkHttpServerHTTPServerJSONResponse.forOk = function(data) {
	var v = JkLangDynamicMap.NEW();
	v.setString("status", "ok");
	if(data != null) {
		v.setObject("data", data);
	}
	return v;
};

JkHttpServerHTTPServerJSONResponse.forDetails = function(status, code, message) {
	var v = JkLangDynamicMap.NEW();
	if(JkLangString.isNotEmpty(status)) {
		v.setString("status", status);
	}
	if(JkLangString.isNotEmpty(code)) {
		v.setString("code", code);
	}
	if(JkLangString.isNotEmpty(message)) {
		v.setString("message", message);
	}
	return v;
};

JkHttpServerHTTPServerJSONResponse.forMissingData = function(type) {
	if(JkLangString.isNotEmpty(type)) {
		return JkHttpServerHTTPServerJSONResponse.forErrorMessage("Missing data: " + (JkLangString.safeString(type)), "missing_data");
	}
	return JkHttpServerHTTPServerJSONResponse.forErrorMessage("Missing data", "missing_data");
};

JkHttpServerHTTPServerJSONResponse.forInvalidData = function(type) {
	if(JkLangString.isNotEmpty(type)) {
		return JkHttpServerHTTPServerJSONResponse.forErrorMessage("Invalid data: " + (JkLangString.safeString(type)), "invalid_data");
	}
	return JkHttpServerHTTPServerJSONResponse.forErrorMessage("Invalid data", "invalid_data");
};

JkHttpServerHTTPServerJSONResponse.forAlreadyExists = function() {
	return JkHttpServerHTTPServerJSONResponse.forErrorMessage("Already exists", "already_exists");
};

JkHttpServerHTTPServerJSONResponse.forInvalidRequest = function(type) {
	if(JkLangString.isNotEmpty(type)) {
		return JkHttpServerHTTPServerJSONResponse.forErrorMessage("Invalid request: " + (JkLangString.safeString(type)), "invalid_request");
	}
	return JkHttpServerHTTPServerJSONResponse.forErrorMessage("Invalid request", "invalid_request");
};

JkHttpServerHTTPServerJSONResponse.forNotAllowed = function() {
	return JkHttpServerHTTPServerJSONResponse.forErrorMessage("Not allowed", "not_allowed");
};

JkHttpServerHTTPServerJSONResponse.forNotAuthenticated = function() {
	return JkHttpServerHTTPServerJSONResponse.forErrorMessage("Not authenticated", "not_authenticated");
};

JkHttpServerHTTPServerJSONResponse.forFailedToCreate = function() {
	return JkHttpServerHTTPServerJSONResponse.forErrorMessage("Failed to create", "failed_to_create");
};

JkHttpServerHTTPServerJSONResponse.forNotFound = function() {
	return JkHttpServerHTTPServerJSONResponse.forErrorMessage("Not found", "not_found");
};

JkHttpServerHTTPServerJSONResponse.forAuthenticationFailed = function() {
	return JkHttpServerHTTPServerJSONResponse.forErrorMessage("Authentication failed", "authentication_failed");
};

JkHttpServerHTTPServerJSONResponse.forIncorrectUsernamePassword = function() {
	return JkHttpServerHTTPServerJSONResponse.forErrorMessage("Incorrect username and/or password", "authentication_failed");
};

JkHttpServerHTTPServerJSONResponse.forInternalError = function(details) {
	if(JkLangString.isNotEmpty(details)) {
		return JkHttpServerHTTPServerJSONResponse.forErrorMessage("Internal error: " + (JkLangString.safeString(details)), "internal_error");
	}
	return JkHttpServerHTTPServerJSONResponse.forErrorMessage("Internal error", "internal_error");
};

JkHttpServerHTTPServerJSONResponse.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerJSONResponse"] === true;
};

let JkHttpServerHTTPServerResponse = function() {
	this.headers = null;
	this.message = null;
	this.status = null;
	this.statusIsOk = false;
	this.body = null;
	this.eTag = null;
};

JkHttpServerHTTPServerResponse.prototype._t = { "JkHttpServerHTTPServerResponse" : true };
JkHttpServerHTTPServerResponse.prototype._tobj = JkHttpServerHTTPServerResponse;

JkHttpServerHTTPServerResponse.NEW = function() {
	var v = new JkHttpServerHTTPServerResponse;
	return v.CTOR_JkHttpServerHTTPServerResponse();
};

JkHttpServerHTTPServerResponse.prototype.CTOR_JkHttpServerHTTPServerResponse = function() {
	this.eTag = null;
	this.body = null;
	this.statusIsOk = false;
	this.status = null;
	this.message = null;
	this.headers = null;
	return this;
};

JkHttpServerHTTPServerResponse.forMyPacket = function(packet) {
	if(!(packet != null)) {
		return null;
	}
	var parser = JkMypacketMyPacketParser.forBuffer(packet);
	var v = JkHttpServerHTTPServerResponse.NEW();
	v.setStatus((parser.getLengthEncodedString()));
	var nheaders = parser.getLengthEncodedInteger();
	for(var n = 0 ; n < nheaders ; n++) {
		var key = parser.getLengthEncodedString();
		var val = parser.getLengthEncodedString();
		if(!(key != null)) {
			key = "";
		}
		v.addHeader(key, val);
	}
	v.setBody1((parser.getLengthEncodedBuffer()));
	return v;
};

JkHttpServerHTTPServerResponse.parseBuffer = function(data) {
	if(!(data != null)) {
		return null;
	}
	var version = null;
	var statusCode = null;
	var statusMessage = null;
	var key = null;
	var headers = null;
	var hdr = null;
	var contentLength = 0;
	var bodyBuffer = null;
	var sz = JkLangBuffer.getSize(data);
	var p = 0;
	while(p < sz){
		var c = JkLangBuffer.getByte(data, p) & 0xff;
		p++;
		if(c == '\r'.charCodeAt()) {
			continue;
		}
		if(version == null) {
			if(c == ' '.charCodeAt()) {
				if(hdr != null) {
					version = hdr.toString();
					hdr = null;
				}
				continue;
			}
		}
		else if(statusCode == null) {
			if(c == ' '.charCodeAt()) {
				if(hdr != null) {
					statusCode = hdr.toString();
					hdr = null;
				}
				continue;
			}
		}
		else if(statusMessage == null) {
			if(c == '\n'.charCodeAt()) {
				if(hdr != null) {
					statusMessage = hdr.toString();
					hdr = null;
				}
				continue;
			}
		}
		else if(key == null) {
			if(c == ':'.charCodeAt()) {
				if(hdr != null) {
					key = hdr.toString();
					hdr = null;
				}
				continue;
			}
			else if(c == '\n'.charCodeAt()) {
				if(hdr != null) {
					return null;
				}
				break;
			}
		}
		else if(c == ' '.charCodeAt() && hdr == null) {
			continue;
		}
		else if(c == '\n'.charCodeAt()) {
			var value = null;
			if(hdr != null) {
				value = hdr.toString();
				hdr = null;
			}
			if(headers == null) {
				headers = JkLangKeyValueList.NEW();
			}
			headers.add(key, value);
			if(JkLangString.equalsIgnoreCase(key, "content-length") && !(value == null)) {
				contentLength = JkLangInteger.asInteger(value);
			}
			else if(JkLangString.equalsIgnoreCase(key, "transfer-encoding") && !(value == null) && JkLangString.contains(value, "chunked")) {
				return null;
			}
			key = null;
			continue;
		}
		if(hdr == null) {
			hdr = JkLangStringBuilder.NEW();
		}
		hdr.appendCharacter(c);
		if(hdr.count() > 32 * 1024) {
			return null;
		}
	}
	if(contentLength > 0) {
		bodyBuffer = JkLangBuffer.getSubBuffer(data, p, (-1), false);
	}
	var resp = JkHttpServerHTTPServerResponse.NEW();
	resp.setStatus(statusCode);
	resp.setMessage(statusMessage);
	resp.setHeaders(headers);
	resp.setBody1(bodyBuffer);
	return resp;
};

JkHttpServerHTTPServerResponse.forFile = function(file, maxCachedSize) {
	if(file == null || file.isFile() == false) {
		return JkHttpServerHTTPServerResponse.forHTTPNotFound(null);
	}
	var bodyset = false;
	var resp = JkHttpServerHTTPServerResponse.NEW();
	resp.setStatus("200");
	resp.addHeader("Content-Type", (JkMimeMimeTypeRegistry.getSharedInstance().getTypeForFile(file)));
	var st = file.stat();
	if(st != null) {
		var lm = st.getModifyTimeUTC();
		if(lm > 0) {
			var dts = JkTimeFormatVerboseDateTimeString.forDateTime((JkLangDateTime.forSeconds(lm)));
			resp.addHeader("Last-Modified", dts);
			resp.setETag((JkMd5MD5Encoder.encodeString(dts)));
		}
		var mcs = maxCachedSize;
		if(mcs < 0) {
			mcs = 32 * 1024;
		}
		if(st.getSize() < mcs) {
			resp.setBody1((file.getContentsBuffer()));
			bodyset = true;
		}
	}
	if(bodyset == false) {
		resp.setBody3(file);
	}
	return resp;
};

JkHttpServerHTTPServerResponse.forBuffer = function(data, mimetype) {
	var mt = mimetype;
	if(JkLangString.isEmpty(mt)) {
		mt = "application/binary";
	}
	var resp = JkHttpServerHTTPServerResponse.NEW();
	resp.setStatus("200");
	resp.addHeader("Content-Type", mt);
	resp.setBody1(data);
	return resp;
};

JkHttpServerHTTPServerResponse.forOk = function(mimetype) {
	var resp = JkHttpServerHTTPServerResponse.NEW();
	resp.setStatus("200");
	if(JkLangString.isEmpty(mimetype) == false) {
		resp.addHeader("Content-Type", mimetype);
	}
	return resp;
};

JkHttpServerHTTPServerResponse.forString = function(text, mimetype) {
	var resp = JkHttpServerHTTPServerResponse.NEW();
	resp.setStatus("200");
	if(JkLangString.isEmpty(mimetype) == false) {
		resp.addHeader("Content-Type", mimetype);
	}
	resp.setBody2(text);
	return resp;
};

JkHttpServerHTTPServerResponse.forTextString = function(text) {
	var resp = JkHttpServerHTTPServerResponse.NEW();
	resp.setStatus("200");
	resp.addHeader("Content-Type", "text/plain; charset=\"UTF-8\"");
	resp.setBody2(text);
	return resp;
};

JkHttpServerHTTPServerResponse.forHTMLString = function(html) {
	var resp = JkHttpServerHTTPServerResponse.NEW();
	resp.setStatus("200");
	resp.addHeader("Content-Type", "text/html; charset=\"UTF-8\"");
	resp.setBody2(html);
	return resp;
};

JkHttpServerHTTPServerResponse.forXMLString = function(xml) {
	var resp = JkHttpServerHTTPServerResponse.NEW();
	resp.setStatus("200");
	resp.addHeader("Content-Type", "text/xml; charset=\"UTF-8\"");
	resp.setBody2(xml);
	return resp;
};

JkHttpServerHTTPServerResponse.forJSONObject = function(o) {
	return JkHttpServerHTTPServerResponse.forJSONString((JkJsonJSONEncoder.encode(o, true, false)));
};

JkHttpServerHTTPServerResponse.forJSONString = function(json) {
	var resp = JkHttpServerHTTPServerResponse.NEW();
	resp.setStatus("200");
	resp.addHeader("Content-Type", "application/json; charset=\"UTF-8\"");
	resp.setBody2(json);
	return resp;
};

JkHttpServerHTTPServerResponse.stringWithMessage = function(str, message) {
	if(JkLangString.isEmpty(message)) {
		return str;
	}
	return (JkLangString.safeString(str)) + (": ") + (JkLangString.safeString(message));
};

JkHttpServerHTTPServerResponse.forHTTPInvalidRequest = function(message) {
	var resp = JkHttpServerHTTPServerResponse.forTextString((JkHttpServerHTTPServerResponse.stringWithMessage("Invalid request", message)));
	resp.setStatus("400");
	resp.addHeader("Connection", "close");
	resp.setMessage(message);
	return resp;
};

JkHttpServerHTTPServerResponse.forHTTPInternalError = function(message) {
	var resp = JkHttpServerHTTPServerResponse.forTextString((JkHttpServerHTTPServerResponse.stringWithMessage("Internal server error", message)));
	resp.setStatus("500");
	resp.addHeader("Connection", "close");
	resp.setMessage(message);
	return resp;
};

JkHttpServerHTTPServerResponse.forHTTPNotImplemented = function(message) {
	var resp = JkHttpServerHTTPServerResponse.forTextString((JkHttpServerHTTPServerResponse.stringWithMessage("Not implemented", message)));
	resp.setStatus("501");
	resp.addHeader("Connection", "close");
	resp.setMessage(message);
	return resp;
};

JkHttpServerHTTPServerResponse.forHTTPNotAllowed = function(message) {
	var resp = JkHttpServerHTTPServerResponse.forTextString((JkHttpServerHTTPServerResponse.stringWithMessage("Not allowed", message)));
	resp.setStatus("405");
	resp.setMessage(message);
	return resp;
};

JkHttpServerHTTPServerResponse.forHTTPNotFound = function(message) {
	var resp = JkHttpServerHTTPServerResponse.forTextString((JkHttpServerHTTPServerResponse.stringWithMessage("Not found", message)));
	resp.setStatus("404");
	resp.setMessage(message);
	return resp;
};

JkHttpServerHTTPServerResponse.forHTTPForbidden = function(message) {
	var resp = JkHttpServerHTTPServerResponse.forTextString((JkHttpServerHTTPServerResponse.stringWithMessage("Forbidden", message)));
	resp.setStatus("403");
	resp.setMessage(message);
	return resp;
};

JkHttpServerHTTPServerResponse.forRedirect = function(url) {
	return JkHttpServerHTTPServerResponse.forHTTPMovedTemporarily(url);
};

JkHttpServerHTTPServerResponse.forHTTPMovedPermanently = function(url) {
	var resp = JkHttpServerHTTPServerResponse.NEW();
	resp.setStatus("301");
	resp.addHeader("Location", url);
	resp.setBody2(url);
	return resp;
};

JkHttpServerHTTPServerResponse.forHTTPMovedTemporarily = function(url) {
	var resp = JkHttpServerHTTPServerResponse.NEW();
	resp.setStatus("303");
	resp.addHeader("Location", url);
	resp.setBody2(url);
	return resp;
};

JkHttpServerHTTPServerResponse.forHTTPTemporaryRedirect = function(url) {
	var resp = JkHttpServerHTTPServerResponse.NEW();
	resp.setStatus("307");
	resp.addHeader("Location", url);
	resp.setBody2(url);
	return resp;
};

JkHttpServerHTTPServerResponse.getFullStatus = function(status) {
	var v = null;
	if(status != null && JkLangString.getIndexOfString(status, " ", 0) < 1) {
		if(JkLangString.equals("200", status)) {
			v = "200 OK";
		}
		else if(JkLangString.equals("301", status)) {
			v = "301 Moved Permanently";
		}
		else if(JkLangString.equals("303", status)) {
			v = "303 See Other";
		}
		else if(JkLangString.equals("304", status)) {
			v = "304 Not Modified";
		}
		else if(JkLangString.equals("400", status)) {
			v = "400 Bad Request";
		}
		else if(JkLangString.equals("401", status)) {
			v = "401 Unauthorized";
		}
		else if(JkLangString.equals("403", status)) {
			v = "403 Forbidden";
		}
		else if(JkLangString.equals("404", status)) {
			v = "404 Not found";
		}
		else if(JkLangString.equals("405", status)) {
			v = "405 Method not allowed";
		}
		else if(JkLangString.equals("500", status)) {
			v = "500 Internal server error";
		}
		else if(JkLangString.equals("501", status)) {
			v = "501 Not implemented";
		}
		else if(JkLangString.equals("503", status)) {
			v = "503 Service unavailable";
		}
		else {
			v = (JkLangString.safeString(status)) + (" Unknown");
		}
	}
	else {
		v = status;
	}
	return v;
};

JkHttpServerHTTPServerResponse.forException = function(e) {
	var v = JkHttpServerHTTPServerResponse.NEW();
	v.setStatus("500");
	v.setBody2((JkLangString.asString(e)));
	return v;
};

JkHttpServerHTTPServerResponse.prototype.setETag = function(eTag) {
	this.eTag = eTag;
	this.addHeader("ETag", eTag);
	return this;
};

JkHttpServerHTTPServerResponse.prototype.getETag = function() {
	return this.eTag;
};

JkHttpServerHTTPServerResponse.prototype.setStatus = function(status) {
	this.status = status;
	if(status == "200") {
		this.statusIsOk = true;
	}
	return this;
};

JkHttpServerHTTPServerResponse.prototype.getStatus = function() {
	return this.status;
};

JkHttpServerHTTPServerResponse.prototype.addHeader = function(key, value) {
	if(!(this.headers != null)) {
		this.headers = JkLangKeyValueList.NEW();
	}
	this.headers.add(key, value);
	return this;
};

JkHttpServerHTTPServerResponse.prototype.addCookie = function(cookie) {
	if(!(cookie != null)) {
		return;
	}
	this.addHeader("Set-Cookie", (cookie.toString()));
};

JkHttpServerHTTPServerResponse.prototype.setBody1 = function(buf) {
	if(!(buf != null)) {
		this.body = null;
		this.addHeader("Content-Length", "0");
	}
	else {
		this.body = JkIoBufferReader.forBuffer(buf);
		this.addHeader("Content-Length", (JkLangString.forInteger(buf.byteLength)));
	}
	return this;
};

JkHttpServerHTTPServerResponse.prototype.setBody2 = function(str) {
	if(!(str != null)) {
		this.body = null;
		this.addHeader("Content-Length", "0");
	}
	else {
		var buf = JkLangString.toUTF8Buffer(str);
		this.body = JkIoBufferReader.forBuffer(buf);
		this.addHeader("Content-Length", (JkLangString.forLongInteger((JkLangBuffer.getSize(buf)))));
	}
	return this;
};

JkHttpServerHTTPServerResponse.prototype.setBody3 = function(file) {
	if(file == null || file.isFile() == false) {
		this.body = null;
		this.addHeader("Content-Length", "0");
	}
	else {
		this.body = file.read();
		this.addHeader("Content-Length", (JkLangString.forInteger((file.getSize()))));
	}
	return this;
};

JkHttpServerHTTPServerResponse.prototype.setBody4 = function(reader) {
	if(reader == null) {
		this.body = null;
		this.addHeader("Content-Length", "0");
	}
	else {
		this.body = reader;
		this.addHeader("Content-Length", (JkLangString.forInteger((reader.getSize()))));
	}
	return this;
};

JkHttpServerHTTPServerResponse.prototype.getBody = function() {
	return this.body;
};

JkHttpServerHTTPServerResponse.prototype.getHeaders = function() {
	return this.headers;
};

JkHttpServerHTTPServerResponse.prototype.setHeaders = function(v) {
	this.headers = v;
	return this;
};

JkHttpServerHTTPServerResponse.prototype.getMessage = function() {
	return this.message;
};

JkHttpServerHTTPServerResponse.prototype.setMessage = function(v) {
	this.message = v;
	return this;
};

JkHttpServerHTTPServerResponse.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerHTTPServerResponse"] === true;
};
