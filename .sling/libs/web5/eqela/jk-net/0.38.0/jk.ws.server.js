let JkWsServerWSServerConnectionHandler = function() {
	this.connection = null;
	this.logContext = null;
	this.connectionIndex = JkWsServerWSServerConnectionHandler.connectionIndexCounter++;
	this.connectionId = null;
	this.protocol = null;
};

JkWsServerWSServerConnectionHandler.prototype._t = {
	"JkWsServerWSServerConnectionHandler" : true,
	"JkWsWSProtocolSource" : true
};
JkWsServerWSServerConnectionHandler.prototype._tobj = JkWsServerWSServerConnectionHandler;

JkWsServerWSServerConnectionHandler.NEW = function() {
	var v = new JkWsServerWSServerConnectionHandler;
	return v.CTOR_JkWsServerWSServerConnectionHandler();
};

JkWsServerWSServerConnectionHandler.prototype.CTOR_JkWsServerWSServerConnectionHandler = function() {
	this.protocol = null;
	this.connectionId = null;
	this.connectionIndex = JkWsServerWSServerConnectionHandler.connectionIndexCounter++;
	this.logContext = null;
	this.connection = null;
	return this;
};

JkWsServerWSServerConnectionHandler.prototype.setProtocol = function(protocol) {
	if(this.protocol != null) {
		this.protocol.setSource(null);
	}
	this.protocol = protocol;
	if(protocol != null) {
		protocol.setSource(this);
	}
	return this;
};

JkWsServerWSServerConnectionHandler.prototype.getProtocol = function() {
	return this.protocol;
};

JkWsServerWSServerConnectionHandler.prototype.getConnectionIdString = function() {
	if(JkLangString.isEmpty(this.connectionId)) {
		return JkLangString.forInteger(this.connectionIndex);
	}
	return (JkLangString.safeString((JkLangString.forInteger(this.connectionIndex)))) + (":") + (JkLangString.safeString(this.connectionId));
};

JkWsServerWSServerConnectionHandler.prototype.logDebug = function(text) {
	JkLogLog.debug(this.logContext, "(ws=" + (JkLangString.safeString((this.getConnectionIdString()))) + (") ") + (JkLangString.safeString(text)));
};

JkWsServerWSServerConnectionHandler.prototype.logInfo = function(text) {
	JkLogLog.info(this.logContext, "(ws=" + (JkLangString.safeString((this.getConnectionIdString()))) + (") ") + (JkLangString.safeString(text)));
};

JkWsServerWSServerConnectionHandler.prototype.logWarning = function(text) {
	JkLogLog.warning(this.logContext, "(ws=" + (JkLangString.safeString((this.getConnectionIdString()))) + (") ") + (JkLangString.safeString(text)));
};

JkWsServerWSServerConnectionHandler.prototype.logError = function(text) {
	JkLogLog.error(this.logContext, "(ws=" + (JkLangString.safeString((this.getConnectionIdString()))) + (") ") + (JkLangString.safeString(text)));
};

JkWsServerWSServerConnectionHandler.prototype.setConnection = function(conn) {
	this.connection = conn;
	return this;
};

JkWsServerWSServerConnectionHandler.prototype.getConnection = function() {
	return this.connection;
};

JkWsServerWSServerConnectionHandler.prototype.setLogContext = function(ctx) {
	this.logContext = ctx;
	return this;
};

JkWsServerWSServerConnectionHandler.prototype.getLogContext = function() {
	return this.logContext;
};

JkWsServerWSServerConnectionHandler.prototype.sendString = function(data) {
	this.sendResponse((JkWsServerWSServerMessage.forText(data)));
};

JkWsServerWSServerConnectionHandler.prototype.sendBuffer = function(data) {
	this.sendResponse((JkWsServerWSServerMessage.forBinary(data)));
};

JkWsServerWSServerConnectionHandler.prototype.sendResponse = function(message) {
	if(this.connection == null) {
		return -1;
	}
	return this.connection.sendResponse(message);
};

JkWsServerWSServerConnectionHandler.prototype.onMaintenance = function() {
};

JkWsServerWSServerConnectionHandler.prototype.onOpened = function() {
	if(this.protocol != null) {
		this.protocol.onConnectionOpened();
	}
};

JkWsServerWSServerConnectionHandler.prototype.onClosed = function() {
	if(this.protocol != null) {
		this.protocol.onConnectionClosed();
	}
};

JkWsServerWSServerConnectionHandler.prototype.closeConnection = function() {
	this.close();
};

JkWsServerWSServerConnectionHandler.prototype.close = function() {
	if(!(this.connection != null)) {
		this.onClosed();
		return;
	}
	this.connection.close();
	this.setProtocol(null);
};

JkWsServerWSServerConnectionHandler.prototype.onCloseMessage = function(message) {
};

JkWsServerWSServerConnectionHandler.prototype.onPingMessage = function(message) {
	return false;
};

JkWsServerWSServerConnectionHandler.prototype.onPongMessage = function(message) {
};

JkWsServerWSServerConnectionHandler.prototype.onDataMessage = function(message) {
	if(this.protocol != null && message != null) {
		if(message.isDataText()) {
			this.protocol.onStringMessage((message.getPayloadBufferString()));
		}
		else {
			this.protocol.onBinaryMessage((message.getPayloadBuffer()));
		}
	}
};

JkWsServerWSServerConnectionHandler.prototype.getConnectionId = function() {
	return this.connectionId;
};

JkWsServerWSServerConnectionHandler.prototype.setConnectionId = function(v) {
	this.connectionId = v;
	return this;
};

JkWsServerWSServerConnectionHandler.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsServerWSServerConnectionHandler"] === true;
};

JkWsServerWSServerConnectionHandler.connectionIndexCounter = 0;

let JkWsServerWSStatusCode = function() {};

JkWsServerWSStatusCode.prototype._t = { "JkWsServerWSStatusCode" : true };
JkWsServerWSStatusCode.prototype._tobj = JkWsServerWSStatusCode;

JkWsServerWSStatusCode.NEW = function() {
	var v = new JkWsServerWSStatusCode;
	return v.CTOR_JkWsServerWSStatusCode();
};

JkWsServerWSStatusCode.prototype.CTOR_JkWsServerWSStatusCode = function() {
	return this;
};

JkWsServerWSStatusCode.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsServerWSStatusCode"] === true;
};

JkWsServerWSStatusCode.CLOSE_NORMAL = 1000;
JkWsServerWSStatusCode.CLOSE_GOING_AWAY = 1001;
JkWsServerWSStatusCode.CLOSE_PROTOCOL_ERROR = 1002;
JkWsServerWSStatusCode.CLOSE_UNSUPPORTED = 1003;
JkWsServerWSStatusCode.CLOSE_NO_STATUS = 1005;
JkWsServerWSStatusCode.CLOSE_ABNORMAL = 1006;
JkWsServerWSStatusCode.UNSUPPORTED_DATA = 1007;
JkWsServerWSStatusCode.POLICY_VIOLATION = 1008;
JkWsServerWSStatusCode.CLOSE_TOO_LARGE = 1009;
JkWsServerWSStatusCode.MISSING_EXTENSION = 1010;
JkWsServerWSStatusCode.INTERNAL_ERROR = 1011;
JkWsServerWSStatusCode.SERVICE_RESTART = 1012;
JkWsServerWSStatusCode.TRY_AGAIN_LATER = 1013;
JkWsServerWSStatusCode.TLS_HANDSHAKE = 1015;

let JkWsServerWSServerMessage = function() {
	this.fin = 0;
	this.rsv1 = 0;
	this.rsv2 = 0;
	this.rsv3 = 0;
	this.opcode = 0;
	this.maskingBuffer = null;
	this.payloadBuffer = null;
	this.messageBuffer = null;
};

JkWsServerWSServerMessage.prototype._t = { "JkWsServerWSServerMessage" : true };
JkWsServerWSServerMessage.prototype._tobj = JkWsServerWSServerMessage;

JkWsServerWSServerMessage.NEW = function() {
	var v = new JkWsServerWSServerMessage;
	return v.CTOR_JkWsServerWSServerMessage();
};

JkWsServerWSServerMessage.prototype.CTOR_JkWsServerWSServerMessage = function() {
	this.messageBuffer = null;
	this.payloadBuffer = null;
	this.maskingBuffer = null;
	this.opcode = 0;
	this.rsv3 = 0;
	this.rsv2 = 0;
	this.rsv1 = 0;
	this.fin = 0;
	return this;
};

JkWsServerWSServerMessage.forText = function(text) {
	return JkWsServerWSServerMessage.create(1, 0, 0, 0, 1, null, (JkLangString.toUTF8Buffer(text)));
};

JkWsServerWSServerMessage.forBinary = function(binary) {
	return JkWsServerWSServerMessage.create(1, 0, 0, 0, 2, null, binary);
};

JkWsServerWSServerMessage.create = function(fin, rsv1, rsv2, rsv3, opcode, maskingBuffer, payloadBuffer) {
	return JkWsServerWSServerMessage.NEW().setFin(fin).setRsv1(rsv1).setRsv2(rsv2).setRsv3(rsv3).setOpcode(opcode).setMaskingBuffer(maskingBuffer).setPayloadBuffer(payloadBuffer);
};

JkWsServerWSServerMessage.prototype.onChanged = function() {
	this.messageBuffer = null;
};

JkWsServerWSServerMessage.prototype.setFin = function(fin) {
	this.fin = fin;
	this.onChanged();
	return this;
};

JkWsServerWSServerMessage.prototype.getFin = function() {
	return this.fin;
};

JkWsServerWSServerMessage.prototype.setRsv1 = function(rsv1) {
	this.rsv1 = rsv1;
	this.onChanged();
	return this;
};

JkWsServerWSServerMessage.prototype.getRsv1 = function() {
	return this.rsv1;
};

JkWsServerWSServerMessage.prototype.setRsv2 = function(rsv2) {
	this.rsv2 = rsv2;
	this.onChanged();
	return this;
};

JkWsServerWSServerMessage.prototype.getRsv2 = function() {
	return this.rsv2;
};

JkWsServerWSServerMessage.prototype.setRsv3 = function(rsv3) {
	this.rsv3 = rsv3;
	this.onChanged();
	return this;
};

JkWsServerWSServerMessage.prototype.getRsv3 = function() {
	return this.rsv3;
};

JkWsServerWSServerMessage.prototype.setOpcode = function(opcode) {
	this.opcode = opcode;
	this.onChanged();
	return this;
};

JkWsServerWSServerMessage.prototype.getOpcode = function() {
	return this.opcode;
};

JkWsServerWSServerMessage.prototype.setMaskingBuffer = function(maskingBuffer) {
	this.maskingBuffer = maskingBuffer;
	this.onChanged();
	return this;
};

JkWsServerWSServerMessage.prototype.getMaskingBuffer = function() {
	return this.maskingBuffer;
};

JkWsServerWSServerMessage.prototype.setPayloadBuffer = function(payloadBuffer) {
	this.payloadBuffer = payloadBuffer;
	this.onChanged();
	return this;
};

JkWsServerWSServerMessage.prototype.getPayloadBuffer = function() {
	return this.payloadBuffer;
};

JkWsServerWSServerMessage.prototype.getPayloadBufferString = function() {
	return JkLangString.forUTF8Buffer(this.payloadBuffer);
};

JkWsServerWSServerMessage.forCloseControlFrame = function(statusCode, reason) {
	if(statusCode < 65536 && statusCode > -1) {
		if(JkLangString.isEmpty(reason) == false) {
			var rBuffer = JkLangString.toUTF8Buffer(reason);
			var size = rBuffer.byteLength;
			var plBuffer = JkLangBuffer.allocate((size + 2));
			JkLangBuffer.setByte(plBuffer, 0, (~(~(statusCode >> 8 & 0xff))));
			JkLangBuffer.setByte(plBuffer, 1, (~(~(statusCode & 0xff))));
			JkLangBuffer.copyFrom(plBuffer, rBuffer, 0, 2, size);
			return JkWsServerWSServerMessage.NEW().setFin(1).setOpcode(JkWsServerWSServerMessage.CLOSE_FRAME).setPayloadBuffer(plBuffer);
		}
		var plBuffer1 = JkLangBuffer.allocate(2);
		JkLangBuffer.setByte(plBuffer1, 0, (~(~(statusCode >> 8 & 0xff))));
		JkLangBuffer.setByte(plBuffer1, 1, (~(~(statusCode & 0xff))));
		return JkWsServerWSServerMessage.NEW().setFin(1).setOpcode(JkWsServerWSServerMessage.CLOSE_FRAME).setPayloadBuffer(plBuffer1);
	}
	return JkWsServerWSServerMessage.NEW().setFin(1).setOpcode(JkWsServerWSServerMessage.CLOSE_FRAME);
};

JkWsServerWSServerMessage.forPingControlFrame = function() {
	return JkWsServerWSServerMessage.NEW().setFin(1).setOpcode(JkWsServerWSServerMessage.PING_FRAME);
};

JkWsServerWSServerMessage.forPongControlFrame = function() {
	return JkWsServerWSServerMessage.NEW().setFin(1).setOpcode(JkWsServerWSServerMessage.PONG_FRAME);
};

JkWsServerWSServerMessage.prototype.isDataText = function() {
	return this.opcode == 1;
};

JkWsServerWSServerMessage.prototype.isDataBinary = function() {
	return this.opcode == 2;
};

JkWsServerWSServerMessage.prototype.isCloseControlFrame = function() {
	return this.opcode == JkWsServerWSServerMessage.CLOSE_FRAME;
};

JkWsServerWSServerMessage.prototype.isPingControlFrame = function() {
	return this.opcode == JkWsServerWSServerMessage.PING_FRAME;
};

JkWsServerWSServerMessage.prototype.isPongControlFrame = function() {
	return this.opcode == JkWsServerWSServerMessage.PONG_FRAME;
};

JkWsServerWSServerMessage.prototype.toBuffer = function() {
	if(this.messageBuffer != null) {
		return this.messageBuffer;
	}
	var size = 2;
	if(this.maskingBuffer != null) {
		size += 4;
	}
	var payloadLength = 0;
	if(this.payloadBuffer != null) {
		payloadLength = JkLangBuffer.getSize(this.payloadBuffer);
	}
	var plb = 0;
	if(payloadLength < 126 && payloadLength >= 0) {
		plb = payloadLength;
	}
	else if(payloadLength < 65536) {
		plb = 126;
		size += 2;
	}
	else if(payloadLength > 65535) {
		plb = 127;
		size += 8;
	}
	else {
		return null;
	}
	size += payloadLength;
	this.messageBuffer = JkLangBuffer.allocate(size);
	var b1 = ~(~this.opcode);
	if(this.fin != 0) {
		b1 |= 0x80;
	}
	if(this.rsv1 != 0) {
		b1 |= 0x40;
	}
	if(this.rsv2 != 0) {
		b1 |= 0x20;
	}
	if(this.rsv3 != 0) {
		b1 |= 0x10;
	}
	JkLangBuffer.setByte(this.messageBuffer, 0, b1);
	var b2 = 0;
	b2 = ~(~plb);
	if(this.maskingBuffer != null) {
		b2 |= 0x80;
	}
	JkLangBuffer.setByte(this.messageBuffer, 1, b2);
	var p = 2;
	var tp = p;
	var n = 0;
	if(plb == 126) {
		n = 8;
		tp += 2;
	}
	else if(plb == 127) {
		n = 56;
		tp += 8;
	}
	while(p < tp){
		if(n != 0) {
			JkLangBuffer.setByte(this.messageBuffer, p, (~(~(payloadLength >> n & 0xff))));
		}
		else {
			JkLangBuffer.setByte(this.messageBuffer, p, (~(~(payloadLength & 0xff))));
		}
		p++;
		n -= 8;
	}
	if(this.maskingBuffer != null) {
		JkLangBuffer.copyFrom(this.messageBuffer, this.maskingBuffer, 0, p, 4);
		p += 4;
		if(this.payloadBuffer != null) {
			var i = 0;
			while(i < payloadLength){
				var b = JkLangBuffer.getByte(this.payloadBuffer, i);
				var ob = ~(~(b ^ JkLangBuffer.getByte(this.maskingBuffer, (i % 4))));
				JkLangBuffer.setByte(this.payloadBuffer, i, ob);
				i++;
			}
		}
	}
	if(this.payloadBuffer != null) {
		JkLangBuffer.copyFrom(this.messageBuffer, this.payloadBuffer, 0, p, payloadLength);
	}
	return this.messageBuffer;
};

JkWsServerWSServerMessage.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsServerWSServerMessage"] === true;
};

JkWsServerWSServerMessage.CLOSE_FRAME = 8;
JkWsServerWSServerMessage.PING_FRAME = 9;
JkWsServerWSServerMessage.PONG_FRAME = 10;

let JkWsServerWSServerConnectionParserState = function() {
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

JkWsServerWSServerConnectionParserState.prototype._t = { "JkWsServerWSServerConnectionParserState" : true };
JkWsServerWSServerConnectionParserState.prototype._tobj = JkWsServerWSServerConnectionParserState;

JkWsServerWSServerConnectionParserState.NEW = function() {
	var v = new JkWsServerWSServerConnectionParserState;
	return v.CTOR_JkWsServerWSServerConnectionParserState();
};

JkWsServerWSServerConnectionParserState.prototype.CTOR_JkWsServerWSServerConnectionParserState = function() {
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

JkWsServerWSServerConnectionParserState.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsServerWSServerConnectionParserState"] === true;
};

let JkWsServerWSServerConnection = function() {
	JkServerNetworkConnection.call(this);
	this.connectionHandler = null;
	this.pingInterval = 30;
	this.parser = null;
	this.isWebSocketConnectionOpen = false;
	this.webSocketGuid = null;
	this.leftOverBuffer = null;
	this.frameNo = 1;
};

JkWsServerWSServerConnection.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkServerNetworkConnection.prototype);
JkWsServerWSServerConnection.prototype.constructor = JkWsServerWSServerConnection;
JkWsServerWSServerConnection.prototype._t = {
	"JkServerNetworkConnection" : true,
	"JkWsServerWSServerConnection" : true
};
JkWsServerWSServerConnection.prototype._tobj = JkWsServerWSServerConnection;

JkWsServerWSServerConnection.NEW = function() {
	var v = new JkWsServerWSServerConnection;
	return v.CTOR_JkWsServerWSServerConnection();
};

JkWsServerWSServerConnection.prototype.CTOR_JkWsServerWSServerConnection = function() {
	if(JkServerNetworkConnection.prototype.CTOR_JkServerNetworkConnection.call(this) == null) {
		return null;
	}
	this.frameNo = 1;
	this.leftOverBuffer = null;
	this.webSocketGuid = null;
	this.isWebSocketConnectionOpen = false;
	this.parser = null;
	this.pingInterval = 30;
	this.connectionHandler = null;
	this.webSocketGuid = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11";
	this.parser = JkWsServerWSServerConnectionParserState.NEW();
	return this;
};

JkWsServerWSServerConnection.prototype.onOpened = function() {
	this.connectionHandler.onOpened();
};

JkWsServerWSServerConnection.prototype.onClosed = function() {
	this.connectionHandler.onClosed();
};

JkWsServerWSServerConnection.prototype.onError = function(message) {
	this.logError(message);
};

JkWsServerWSServerConnection.prototype.onHTTPHeaderData = function(inputBuffer, offset, sz) {
	if(!(inputBuffer != null)) {
		return false;
	}
	var p = 0;
	while(p < sz){
		var c = JkLangBuffer.getByte(inputBuffer, (p + offset));
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
				if(p < sz) {
					return false;
				}
				return this.onOpenHandshake();
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
					return false;
				}
				this.parser.headersDone = true;
				if(p < sz) {
					return false;
				}
				return this.onOpenHandshake();
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
			if(JkLangString.equalsIgnoreCase(this.parser.key, "content-length") && !(value == null)) {
				this.parser.contentLength = JkLangString.toInteger(value);
			}
			else if(JkLangString.equalsIgnoreCase(this.parser.key, "transfer-encoding") && !(value == null) && JkLangString.contains(value, "chunked")) {
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
			return false;
		}
	}
	return false;
};

JkWsServerWSServerConnection.prototype.onHTTPError = function() {
	var data = JkLangString.toUTF8Buffer("HTTP/1.1 400 Bad Request\r\nConnection: close\r\n\r\n");
	this.sendData(data, data.byteLength);
	this.close();
};

JkWsServerWSServerConnection.prototype.onWebsocketError = function() {
	this.close();
};

JkWsServerWSServerConnection.prototype.onDataReceived = function(data, size) {
	if(this.isWebSocketConnectionOpen == false) {
		if(this.onHTTPHeaderData(data, 0, size) == false) {
			this.onHTTPError();
		}
		return;
	}
	if(!this.processData(data, size)) {
		this.onWebsocketError();
	}
};

JkWsServerWSServerConnection.prototype.onOpenHandshake = function() {
	if(!(this.parser != null)) {
		return false;
	}
	if(!(this.parser.headers != null)) {
		return false;
	}
	var it = this.parser.headers.iterate();
	if(!(it != null)) {
		return false;
	}
	var headers = JkLangDynamicMap.NEW();
	while(true){
		var kvp = it.next();
		if(kvp == null) {
			break;
		}
		headers.setObject(kvp.key, kvp.value);
	}
	var key = headers.getString("sec-websocket-key", null);
	var shaEncoder = JkShaSHAEncoder.create();
	if(!(shaEncoder != null)) {
		return false;
	}
	var accept = JkBase64Base64Encoder.encode((shaEncoder.encodeAsBuffer((JkLangString.toUTF8Buffer((JkLangString.safeString(key)) + (JkLangString.safeString(this.webSocketGuid)))), JkShaSHAEncoder.SHA1)));
	var data = JkLangString.toUTF8Buffer("HTTP/1.1 101 Switching Protocols\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Accept: " + (JkLangString.safeString(accept)) + ("\r\n\r\n"));
	this.sendData(data, data.byteLength);
	this.isWebSocketConnectionOpen = true;
	return true;
};

JkWsServerWSServerConnection.prototype.processData = function(data, size) {
	if(data == null || size < 1) {
		return false;
	}
	var nbuffer = null;
	var nsize = 0;
	if(this.leftOverBuffer != null) {
		var losize = this.leftOverBuffer.byteLength;
		nsize = losize + size;
		nbuffer = JkLangBuffer.allocate(nsize);
		JkLangBuffer.copyFrom(nbuffer, this.leftOverBuffer, 0, 0, losize);
		JkLangBuffer.copyFrom(nbuffer, data, 0, losize, size);
		this.leftOverBuffer = null;
	}
	else {
		nbuffer = data;
		nsize = size;
	}
	var p = 0;
	var fin = 0;
	var rsv1 = 0;
	var rsv2 = 0;
	var rsv3 = 0;
	var opcode = 0;
	var mask = 0;
	var payloadLength = 0;
	var lastMaskingBufferIndex = 0;
	var mi = 0;
	var maskingBuffer = null;
	var payloadBuffer = null;
	while(p < nsize){
		var b = JkLangBuffer.getByte(nbuffer, p);
		if(p == 0) {
			if((b & 0x80) != 0) {
				fin = 1;
			}
			if((b & 0x40) != 0) {
				rsv1 = 1;
			}
			if((b & 0x20) != 0) {
				rsv2 = 1;
			}
			if((b & 0x10) != 0) {
				rsv3 = 1;
			}
			opcode = b & 0xf;
		}
		else if(p == 1) {
			mask = b & 0x80;
			if(mask == 0) {
				return false;
			}
			maskingBuffer = JkLangBuffer.allocate(4);
			payloadLength = b & 0x7f;
			if(payloadLength >= 0 && payloadLength < 126) {
				p++;
				if(maskingBuffer != null) {
					lastMaskingBufferIndex = p + 3;
				}
				continue;
			}
			else if(payloadLength == 126) {
				var v = 0;
				v |= (JkLangBuffer.getByte(nbuffer, (p + 1)) & 0xff) << 8;
				v |= JkLangBuffer.getByte(nbuffer, (p + 2)) & 0xff;
				payloadLength = v;
				p += 3;
				if(maskingBuffer != null) {
					lastMaskingBufferIndex = p + 3;
				}
				continue;
			}
			else if(payloadLength == 127) {
				var v1 = 0;
				v1 |= (JkLangBuffer.getByte(nbuffer, (p + 1)) & 0x7f) << 56;
				v1 |= (JkLangBuffer.getByte(nbuffer, (p + 2)) & 0xff) << 48;
				v1 |= (JkLangBuffer.getByte(nbuffer, (p + 3)) & 0xff) << 40;
				v1 |= (JkLangBuffer.getByte(nbuffer, (p + 4)) & 0xff) << 32;
				v1 |= (JkLangBuffer.getByte(nbuffer, (p + 5)) & 0xff) << 24;
				v1 |= (JkLangBuffer.getByte(nbuffer, (p + 6)) & 0xff) << 16;
				v1 |= (JkLangBuffer.getByte(nbuffer, (p + 7)) & 0xff) << 8;
				v1 |= JkLangBuffer.getByte(nbuffer, (p + 8)) & 0xff;
				payloadLength = v1;
				p += 9;
				if(maskingBuffer != null) {
					lastMaskingBufferIndex = p + 3;
				}
				continue;
			}
			return false;
		}
		else if(p <= lastMaskingBufferIndex) {
			JkLangBuffer.setByte(maskingBuffer, mi, b);
			mi++;
		}
		else {
			break;
		}
		p++;
	}
	var frameLength = p + payloadLength;
	if(nsize < frameLength) {
		this.leftOverBuffer = JkLangBuffer.allocate(nsize);
		JkLangBuffer.copyFrom(this.leftOverBuffer, nbuffer, 0, 0, nsize);
		this.frameNo++;
		return true;
	}
	payloadBuffer = JkLangBuffer.allocate(payloadLength);
	JkLangBuffer.copyFrom(payloadBuffer, nbuffer, p, 0, payloadLength);
	this.processFrame(fin, rsv1, rsv2, rsv3, opcode, mask, maskingBuffer, payloadLength, payloadBuffer);
	this.frameNo = 1;
	if(nsize > frameLength) {
		var losize1 = nsize - frameLength;
		this.leftOverBuffer = JkLangBuffer.allocate(losize1);
		JkLangBuffer.copyFrom(this.leftOverBuffer, nbuffer, frameLength, 0, losize1);
	}
	return true;
};

JkWsServerWSServerConnection.prototype.processFrame = function(fin, rsv1, rsv2, rsv3, opcode, mask, maskingBuffer, payloadLength, payloadBuffer) {
	if(fin == 0) {
		return;
	}
	if(mask == 0) {
		;
	}
	else {
		this.unmaskPayload(payloadBuffer, (~(~payloadLength)), maskingBuffer);
	}
	this.onNewMessage((JkWsServerWSServerMessage.create(fin, rsv1, rsv2, rsv3, opcode, maskingBuffer, payloadBuffer)));
};

JkWsServerWSServerConnection.prototype.onNewMessage = function(message) {
	if(message.isCloseControlFrame()) {
		if(this.isWebSocketConnectionOpen == true) {
			this.sendResponse((JkWsServerWSServerMessage.forCloseControlFrame(JkWsServerWSStatusCode.CLOSE_NORMAL, null)));
			this.isWebSocketConnectionOpen = false;
		}
		this.close();
		this.connectionHandler.onCloseMessage(message);
	}
	else if(message.isPingControlFrame() && this.connectionHandler.onPingMessage(message) == false) {
		this.sendResponse((JkWsServerWSServerMessage.forPongControlFrame()));
	}
	else if(message.isPongControlFrame()) {
		this.connectionHandler.onPongMessage(message);
	}
	else {
		this.connectionHandler.onDataMessage(message);
	}
};

JkWsServerWSServerConnection.prototype.unmaskPayload = function(maskedPayloadBuffer, payloadLength, maskingBuffer) {
	var i = 0;
	while(i < payloadLength){
		var b = JkLangBuffer.getByte(maskedPayloadBuffer, i);
		var ob = ~(~(b ^ JkLangBuffer.getByte(maskingBuffer, (i % 4))));
		JkLangBuffer.setByte(maskedPayloadBuffer, i, ob);
		i++;
	}
};

JkWsServerWSServerConnection.prototype.onMaintenance = function() {
	if(JkTimeSystemClock.asSeconds() - this.getLastActivity() >= this.pingInterval) {
		this.sendPing();
	}
	this.connectionHandler.onMaintenance();
};

JkWsServerWSServerConnection.prototype.sendPing = function() {
	return this.sendResponse((JkWsServerWSServerMessage.forPingControlFrame()));
};

JkWsServerWSServerConnection.prototype.sendResponse = function(message) {
	if(message == null) {
		return -1;
	}
	if(message.isCloseControlFrame() && this.isWebSocketConnectionOpen == true) {
		this.isWebSocketConnectionOpen = false;
	}
	var buffer = message.toBuffer();
	if(buffer == null) {
		return -1;
	}
	return this.sendData(buffer, buffer.byteLength);
};

JkWsServerWSServerConnection.prototype.getConnectionHandler = function() {
	return this.connectionHandler;
};

JkWsServerWSServerConnection.prototype.setConnectionHandler = function(v) {
	this.connectionHandler = v;
	return this;
};

JkWsServerWSServerConnection.prototype.getPingInterval = function() {
	return this.pingInterval;
};

JkWsServerWSServerConnection.prototype.setPingInterval = function(v) {
	this.pingInterval = v;
	return this;
};

JkWsServerWSServerConnection.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsServerWSServerConnection"] === true;
};

let JkWsServerWSServer = function() {
	JkServerNetworkServer.call(this);
	this.createConnectionHandlerObject = null;
	this.maintenanceTimerDelay = 7 * 60;
	this.maintenanceTimer = null;
};

JkWsServerWSServer.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkServerNetworkServer.prototype);
JkWsServerWSServer.prototype.constructor = JkWsServerWSServer;
JkWsServerWSServer.prototype._t = {
	"JkServerNetworkServer" : true,
	"JkServerNetworkConnectionManager" : true,
	"JkWsServerWSServer" : true
};
JkWsServerWSServer.prototype._tobj = JkWsServerWSServer;

JkWsServerWSServer.NEW = function() {
	var v = new JkWsServerWSServer;
	return v.CTOR_JkWsServerWSServer();
};

JkWsServerWSServer.prototype.CTOR_JkWsServerWSServer = function() {
	if(JkServerNetworkServer.prototype.CTOR_JkServerNetworkServer.call(this) == null) {
		return null;
	}
	this.maintenanceTimer = null;
	this.maintenanceTimerDelay = 7 * 60;
	this.createConnectionHandlerObject = null;
	this.setPort(8080);
	return this;
};

JkWsServerWSServer.prototype.createConnectionObject = function() {
	if(!(this.createConnectionHandlerObject != null)) {
		this.logError("No 'createConnectionHandlerObject' set. Cannot create connection object handlers!");
		return null;
	}
	var handler = this.createConnectionHandlerObject();
	if(!(handler != null)) {
		this.logError("Failed to create connection object. No connection handler object returned!");
		return null;
	}
	var connection = JkWsServerWSServerConnection.NEW();
	connection.setConnectionHandler(handler);
	handler.setConnection(connection);
	handler.setLogContext(this.logContext);
	return connection;
};

JkWsServerWSServer.prototype.logError = function(message) {
	JkLogLog.error(this.logContext, message);
};

JkWsServerWSServer.prototype.logWarning = function(message) {
	JkLogLog.warning(this.logContext, message);
};

JkWsServerWSServer.prototype.logInfo = function(message) {
	JkLogLog.info(this.logContext, message);
};

JkWsServerWSServer.prototype.logDebug = function(message) {
	JkLogLog.debug(this.logContext, message);
};

JkWsServerWSServer.prototype.onMaintenanceTimer = function() {
	this.onMaintenance();
	return true;
};

JkWsServerWSServer.prototype.onMaintenance = function() {
	this.forEachConnection((function(connection1) {
		var wsConnection = (function(o) {
			if(JkWsServerWSServerConnection.IS_INSTANCE && JkWsServerWSServerConnection.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))(connection1);
		if(!(wsConnection != null)) {
			return;
		}
		wsConnection.onMaintenance();
	}.bind(this)));
};

JkWsServerWSServer.prototype.initialize2 = function() {
	if(!JkServerNetworkServer.prototype.initialize2.call(this)) {
		return false;
	}
	if(this.maintenanceTimerDelay < 1) {
		this.logDebug("Maintenance timer disabled");
	}
	else {
		this.logDebug("Starting a maintenance timer with a " + (JkLangString.safeString((JkLangString.forLongInteger(this.maintenanceTimerDelay)))) + (" second delay."));
		this.maintenanceTimer = this.ioManager.startTimer((this.maintenanceTimerDelay * 1000000), (function() {
			return this.onMaintenanceTimer();
		}.bind(this)));
		if(this.maintenanceTimer == null) {
			this.logError("Failed to start maintenance timer");
		}
	}
	return true;
};

JkWsServerWSServer.prototype.cleanup = function() {
	JkServerNetworkServer.prototype.cleanup.call(this);
};

JkWsServerWSServer.prototype.getCreateConnectionHandlerObject = function() {
	return this.createConnectionHandlerObject;
};

JkWsServerWSServer.prototype.setCreateConnectionHandlerObject = function(v) {
	this.createConnectionHandlerObject = v;
	return this;
};

JkWsServerWSServer.prototype.getMaintenanceTimerDelay = function() {
	return this.maintenanceTimerDelay;
};

JkWsServerWSServer.prototype.setMaintenanceTimerDelay = function(v) {
	this.maintenanceTimerDelay = v;
	return this;
};

JkWsServerWSServer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsServerWSServer"] === true;
};
