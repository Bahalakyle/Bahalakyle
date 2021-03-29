let JkWsClientWSSocketGenericHTTPResponseParserChunk = function() {
	this.data = null;
	this.completed = true;
};

JkWsClientWSSocketGenericHTTPResponseParserChunk.prototype._t = { "JkWsClientWSSocketGenericHTTPResponseParserChunk" : true };
JkWsClientWSSocketGenericHTTPResponseParserChunk.prototype._tobj = JkWsClientWSSocketGenericHTTPResponseParserChunk;

JkWsClientWSSocketGenericHTTPResponseParserChunk.NEW = function() {
	var v = new JkWsClientWSSocketGenericHTTPResponseParserChunk;
	return v.CTOR_JkWsClientWSSocketGenericHTTPResponseParserChunk();
};

JkWsClientWSSocketGenericHTTPResponseParserChunk.prototype.CTOR_JkWsClientWSSocketGenericHTTPResponseParserChunk = function() {
	this.completed = true;
	this.data = null;
	return this;
};

JkWsClientWSSocketGenericHTTPResponseParserChunk.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsClientWSSocketGenericHTTPResponseParserChunk"] === true;
};

let JkWsClientWSSocketGenericHTTPResponseParser = function() {
	this.receivedData = null;
	this.headers = null;
	this.bodyData = null;
	this.isChunked = false;
	this.contentLength = 0;
	this.dataCounter = 0;
	this.endOfResponse = false;
	this.aborted = false;
};

JkWsClientWSSocketGenericHTTPResponseParser.prototype._t = { "JkWsClientWSSocketGenericHTTPResponseParser" : true };
JkWsClientWSSocketGenericHTTPResponseParser.prototype._tobj = JkWsClientWSSocketGenericHTTPResponseParser;

JkWsClientWSSocketGenericHTTPResponseParser.NEW = function() {
	var v = new JkWsClientWSSocketGenericHTTPResponseParser;
	return v.CTOR_JkWsClientWSSocketGenericHTTPResponseParser();
};

JkWsClientWSSocketGenericHTTPResponseParser.prototype.CTOR_JkWsClientWSSocketGenericHTTPResponseParser = function() {
	this.aborted = false;
	this.endOfResponse = false;
	this.dataCounter = 0;
	this.contentLength = 0;
	this.isChunked = false;
	this.bodyData = null;
	this.headers = null;
	this.receivedData = null;
	return this;
};

JkWsClientWSSocketGenericHTTPResponseParser.prototype.reset = function() {
	this.isChunked = false;
	this.headers = null;
	this.bodyData = null;
	this.contentLength = 0;
	this.dataCounter = 0;
	this.endOfResponse = false;
	this.aborted = false;
};

JkWsClientWSSocketGenericHTTPResponseParser.prototype.hasEndOfHeaders = function(buf, size) {
	var n = 0;
	var v = false;
	while(n <= size - 4){
		if(JkLangBuffer.getByte(buf, n) == '\r'.charCodeAt() && JkLangBuffer.getByte(buf, (n + 1)) == '\n'.charCodeAt() && JkLangBuffer.getByte(buf, (n + 2)) == '\r'.charCodeAt() && JkLangBuffer.getByte(buf, (n + 3)) == '\n'.charCodeAt()) {
			v = true;
			break;
		}
		n++;
	}
	return v;
};

JkWsClientWSSocketGenericHTTPResponseParser.prototype.parseResponseHeader = function(buf) {
	var i = 0;
	var p = ~(~'0'.charCodeAt());
	var v = null;
	var first = true;
	var isChunked = false;
	while(true){
		var sb = JkLangStringBuilder.NEW();
		while((p = JkLangBuffer.getByte(buf, i)) != 0){
			if(p == '\r'.charCodeAt()) {
				;
			}
			else if(p == '\n'.charCodeAt()) {
				i++;
				break;
			}
			else {
				sb.appendCharacter(p);
			}
			i++;
		}
		var t = sb.toString();
		if(JkLangString.isEmpty(t)) {
			break;
		}
		if(first) {
			var comps = JkLangString.split(t, ' '.charCodeAt(), 3);
			v = JkWsClientWSSocketGenericHTTPClientResponse.NEW();
			v.setHttpVersion((JkLangVector.get(comps, 0)));
			v.setHttpStatus((JkLangVector.get(comps, 1)));
			v.setHttpStatusDescription((JkLangVector.get(comps, 2)));
		}
		else {
			var comps1 = JkLangString.split(t, ':'.charCodeAt(), 2);
			var key = JkLangVector.get(comps1, 0);
			if(JkLangString.isEmpty(key) == false) {
				var val = JkLangString.strip((JkLangVector.get(comps1, 1)));
				v.addHeader(key, val);
				if(isChunked == false && JkLangString.equalsIgnoreCase(key, "transfer-encoding")) {
					if(val == "chunked") {
						isChunked = true;
					}
				}
				else if(this.contentLength < 1 && JkLangString.equalsIgnoreCase(key, "content-length")) {
					this.contentLength = JkLangString.toInteger(val);
				}
			}
		}
		first = false;
	}
	var l = JkLangBuffer.getSize(buf) - ~(~i);
	if(l > 0) {
		this.receivedData = JkLangBuffer.getSubBuffer(buf, i, l, false);
	}
	else {
		this.receivedData = null;
	}
	this.isChunked = isChunked;
	return v;
};

JkWsClientWSSocketGenericHTTPResponseParser.prototype.getChunk = function() {
	if(this.receivedData == null) {
		return null;
	}
	var i = 0;
	var sb = JkLangStringBuilder.NEW();
	while(true){
		var p = JkLangBuffer.getByte(this.receivedData, i);
		if(p == '\r'.charCodeAt()) {
			;
		}
		else if(p == '\n'.charCodeAt()) {
			i++;
			break;
		}
		else {
			sb.appendCharacter(p);
		}
		i++;
		if(sb.count() >= 16) {
			return null;
		}
	}
	var cl = -1;
	var t = JkLangString.strip((sb.toString()));
	if(JkLangString.isEmpty(t) == false) {
		cl = JkLangString.toIntegerFromHex(t);
	}
	var chunk = JkWsClientWSSocketGenericHTTPResponseParserChunk.NEW();
	if(cl > 0) {
		if(JkLangBuffer.getSize(this.receivedData) - i < cl + 2) {
			chunk.completed = false;
			return chunk;
		}
		chunk.data = new ArrayBuffer(cl);
		JkLangBuffer.copyFrom(chunk.data, this.receivedData, i, 0, cl);
		i += cl;
	}
	while(i < JkLangBuffer.getSize(this.receivedData) && (JkLangBuffer.getByte(this.receivedData, i) == '\r'.charCodeAt() || JkLangBuffer.getByte(this.receivedData, i) == '\n'.charCodeAt())){
		i++;
	}
	var rem = JkLangBuffer.getSize(this.receivedData) - ~(~i);
	if(rem > 0) {
		var tmp = this.receivedData;
		this.receivedData = new ArrayBuffer(rem);
		JkLangBuffer.copyFrom(this.receivedData, tmp, i, 0, rem);
	}
	else {
		this.receivedData = null;
	}
	return chunk;
};

JkWsClientWSSocketGenericHTTPResponseParser.prototype.onDataReceived = function(buf, size) {
	if(size > 0) {
		this.receivedData = JkLangBuffer.append(this.receivedData, buf, size);
	}
	if(this.headers == null) {
		if(this.hasEndOfHeaders(this.receivedData, (JkLangBuffer.getSize(this.receivedData)))) {
			this.headers = this.parseResponseHeader(this.receivedData);
		}
	}
	if(this.isChunked) {
		while(true){
			var r = this.getChunk();
			if(r != null) {
				if(!r.completed) {
					break;
				}
				var sz = JkLangBuffer.getSize(r.data);
				this.dataCounter += ~(~sz);
				this.onBodyDataReceived(r.data, sz);
			}
			else {
				this.onEndOfResponse();
				break;
			}
			if(!(this.receivedData != null)) {
				break;
			}
		}
	}
	else if(this.contentLength > 0) {
		var rsz = ~(~JkLangBuffer.getSize(this.receivedData));
		if(rsz > 0) {
			if(this.contentLength <= 0 || this.dataCounter + rsz <= this.contentLength) {
				var v = this.receivedData;
				this.receivedData = null;
				this.dataCounter += rsz;
				this.onBodyDataReceived(v, rsz);
			}
			else {
				var vsz = this.contentLength - this.dataCounter;
				var v1 = JkLangBuffer.getSubBuffer(this.receivedData, 0, vsz, false);
				this.receivedData = JkLangBuffer.getSubBuffer(this.receivedData, vsz, (rsz - vsz), false);
				this.dataCounter += vsz;
				this.onBodyDataReceived(v1, vsz);
			}
		}
		if(this.dataCounter >= this.contentLength) {
			this.onEndOfResponse();
		}
	}
	else {
		this.onEndOfResponse();
	}
};

JkWsClientWSSocketGenericHTTPResponseParser.prototype.onBodyDataReceived = function(buffer, size) {
	this.bodyData = JkLangBuffer.append(this.bodyData, buffer, (-1));
};

JkWsClientWSSocketGenericHTTPResponseParser.prototype.onEndOfResponse = function() {
	this.endOfResponse = true;
};

JkWsClientWSSocketGenericHTTPResponseParser.prototype.getEndOfResponse = function() {
	return this.endOfResponse;
};

JkWsClientWSSocketGenericHTTPResponseParser.prototype.setEndOfResponse = function(v) {
	this.endOfResponse = v;
	return this;
};

JkWsClientWSSocketGenericHTTPResponseParser.prototype.getAborted = function() {
	return this.aborted;
};

JkWsClientWSSocketGenericHTTPResponseParser.prototype.setAborted = function(v) {
	this.aborted = v;
	return this;
};

JkWsClientWSSocketGenericHTTPResponseParser.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsClientWSSocketGenericHTTPResponseParser"] === true;
};

let JkWsClientWSSocketGenericHTTPClientResponse = function() {
	this.httpVersion = null;
	this.httpStatus = null;
	this.httpStatusDescription = null;
	this.rawHeaders = null;
	this.headers = null;
};

JkWsClientWSSocketGenericHTTPClientResponse.prototype._t = {
	"JkWsClientWSSocketGenericHTTPClientResponse" : true,
	"JkLangStringObject" : true
};
JkWsClientWSSocketGenericHTTPClientResponse.prototype._tobj = JkWsClientWSSocketGenericHTTPClientResponse;

JkWsClientWSSocketGenericHTTPClientResponse.NEW = function() {
	var v = new JkWsClientWSSocketGenericHTTPClientResponse;
	return v.CTOR_JkWsClientWSSocketGenericHTTPClientResponse();
};

JkWsClientWSSocketGenericHTTPClientResponse.prototype.CTOR_JkWsClientWSSocketGenericHTTPClientResponse = function() {
	this.headers = null;
	this.rawHeaders = null;
	this.httpStatusDescription = null;
	this.httpStatus = null;
	this.httpVersion = null;
	return this;
};

JkWsClientWSSocketGenericHTTPClientResponse.prototype.addHeader = function(key, value) {
	if(!(this.rawHeaders != null)) {
		this.rawHeaders = JkLangKeyValueListForStrings.NEW();
	}
	if(!(this.headers != null)) {
		this.headers = new Map;
	}
	this.rawHeaders.add(key, value);
	this.headers.set((JkLangString.toLowerCase(key)), value);
};

JkWsClientWSSocketGenericHTTPClientResponse.prototype.getHeader = function(key) {
	if(!(this.headers != null)) {
		return null;
	}
	return JkLangMap.get(this.headers, key);
};

JkWsClientWSSocketGenericHTTPClientResponse.prototype.toString = function() {
	return JkLangString.asString(this.rawHeaders);
};

JkWsClientWSSocketGenericHTTPClientResponse.prototype.getHttpVersion = function() {
	return this.httpVersion;
};

JkWsClientWSSocketGenericHTTPClientResponse.prototype.setHttpVersion = function(v) {
	this.httpVersion = v;
	return this;
};

JkWsClientWSSocketGenericHTTPClientResponse.prototype.getHttpStatus = function() {
	return this.httpStatus;
};

JkWsClientWSSocketGenericHTTPClientResponse.prototype.setHttpStatus = function(v) {
	this.httpStatus = v;
	return this;
};

JkWsClientWSSocketGenericHTTPClientResponse.prototype.getHttpStatusDescription = function() {
	return this.httpStatusDescription;
};

JkWsClientWSSocketGenericHTTPClientResponse.prototype.setHttpStatusDescription = function(v) {
	this.httpStatusDescription = v;
	return this;
};

JkWsClientWSSocketGenericHTTPClientResponse.prototype.getRawHeaders = function() {
	return this.rawHeaders;
};

JkWsClientWSSocketGenericHTTPClientResponse.prototype.setRawHeaders = function(v) {
	this.rawHeaders = v;
	return this;
};

JkWsClientWSSocketGenericHTTPClientResponse.prototype.getHeaders = function() {
	return this.headers;
};

JkWsClientWSSocketGenericHTTPClientResponse.prototype.setHeaders = function(v) {
	this.headers = v;
	return this;
};

JkWsClientWSSocketGenericHTTPClientResponse.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsClientWSSocketGenericHTTPClientResponse"] === true;
};

let JkWsClientWSCloseEvent = function() {};

JkWsClientWSCloseEvent.prototype._t = { "JkWsClientWSCloseEvent" : true };
JkWsClientWSCloseEvent.prototype._tobj = JkWsClientWSCloseEvent;

JkWsClientWSCloseEvent.NEW = function() {
	var v = new JkWsClientWSCloseEvent;
	return v.CTOR_JkWsClientWSCloseEvent();
};

JkWsClientWSCloseEvent.prototype.CTOR_JkWsClientWSCloseEvent = function() {
	return this;
};

JkWsClientWSCloseEvent.prototype.getStatusCode = function() {};

JkWsClientWSCloseEvent.prototype.getReason = function() {};

JkWsClientWSCloseEvent.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsClientWSCloseEvent"] === true;
};

JkWsClientWSCloseEvent.CLOSE_NORMAL = 1000;
JkWsClientWSCloseEvent.CLOSE_GOING_AWAY = 1001;
JkWsClientWSCloseEvent.CLOSE_PROTOCOL_ERROR = 1002;
JkWsClientWSCloseEvent.CLOSE_UNSUPPORTED = 1003;
JkWsClientWSCloseEvent.CLOSE_NO_STATUS = 1005;
JkWsClientWSCloseEvent.CLOSE_ABNORMAL = 1006;
JkWsClientWSCloseEvent.UNSUPPORTED_DATA = 1007;
JkWsClientWSCloseEvent.POLICY_VIOLATION = 1008;
JkWsClientWSCloseEvent.CLOSE_TOO_LARGE = 1009;
JkWsClientWSCloseEvent.MISSING_EXTENSION = 1010;
JkWsClientWSCloseEvent.INTERNAL_ERROR = 1011;
JkWsClientWSCloseEvent.SERVICE_RESTART = 1012;
JkWsClientWSCloseEvent.TRY_AGAIN_LATER = 1013;
JkWsClientWSCloseEvent.TLS_HANDSHAKE = 1015;

let JkWsClientWSSocketGenericMyWSMessage = function() {
	this.fin = 0;
	this.rsv1 = 0;
	this.rsv2 = 0;
	this.rsv3 = 0;
	this.opcode = 0;
	this.maskingBuffer = null;
	this.payloadBuffer = null;
	this.messageBuffer = null;
};

JkWsClientWSSocketGenericMyWSMessage.prototype._t = { "JkWsClientWSSocketGenericMyWSMessage" : true };
JkWsClientWSSocketGenericMyWSMessage.prototype._tobj = JkWsClientWSSocketGenericMyWSMessage;

JkWsClientWSSocketGenericMyWSMessage.NEW = function() {
	var v = new JkWsClientWSSocketGenericMyWSMessage;
	return v.CTOR_JkWsClientWSSocketGenericMyWSMessage();
};

JkWsClientWSSocketGenericMyWSMessage.prototype.CTOR_JkWsClientWSSocketGenericMyWSMessage = function() {
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

JkWsClientWSSocketGenericMyWSMessage.forPingControlFrame = function() {
	return JkWsClientWSSocketGenericMyWSMessage.NEW().setFin(1).setOpcode(JkWsClientWSSocketGenericMyWSMessage.PING_FRAME);
};

JkWsClientWSSocketGenericMyWSMessage.forPongControlFrame = function() {
	return JkWsClientWSSocketGenericMyWSMessage.NEW().setFin(1).setOpcode(JkWsClientWSSocketGenericMyWSMessage.PONG_FRAME);
};

JkWsClientWSSocketGenericMyWSMessage.create = function(fin, rsv1, rsv2, rsv3, opcode, maskingBuffer, payloadBuffer) {
	return JkWsClientWSSocketGenericMyWSMessage.NEW().setFin(fin).setRsv1(rsv1).setRsv2(rsv2).setRsv3(rsv3).setOpcode(opcode).setMaskingBuffer(maskingBuffer).setPayloadBuffer(payloadBuffer);
};

JkWsClientWSSocketGenericMyWSMessage.prototype.onChanged = function() {
	this.messageBuffer = null;
};

JkWsClientWSSocketGenericMyWSMessage.prototype.setFin = function(fin) {
	this.fin = fin;
	this.onChanged();
	return this;
};

JkWsClientWSSocketGenericMyWSMessage.prototype.getFin = function() {
	return this.fin;
};

JkWsClientWSSocketGenericMyWSMessage.prototype.setRsv1 = function(rsv1) {
	this.rsv1 = rsv1;
	this.onChanged();
	return this;
};

JkWsClientWSSocketGenericMyWSMessage.prototype.getRsv1 = function() {
	return this.rsv1;
};

JkWsClientWSSocketGenericMyWSMessage.prototype.setRsv2 = function(rsv2) {
	this.rsv2 = rsv2;
	this.onChanged();
	return this;
};

JkWsClientWSSocketGenericMyWSMessage.prototype.getRsv2 = function() {
	return this.rsv2;
};

JkWsClientWSSocketGenericMyWSMessage.prototype.setRsv3 = function(rsv3) {
	this.rsv3 = rsv3;
	this.onChanged();
	return this;
};

JkWsClientWSSocketGenericMyWSMessage.prototype.getRsv3 = function() {
	return this.rsv3;
};

JkWsClientWSSocketGenericMyWSMessage.prototype.setOpcode = function(opcode) {
	this.opcode = opcode;
	this.onChanged();
	return this;
};

JkWsClientWSSocketGenericMyWSMessage.prototype.getOpcode = function() {
	return this.opcode;
};

JkWsClientWSSocketGenericMyWSMessage.prototype.setMaskingBuffer = function(maskingBuffer) {
	this.maskingBuffer = maskingBuffer;
	this.onChanged();
	return this;
};

JkWsClientWSSocketGenericMyWSMessage.prototype.getMaskingBuffer = function() {
	return this.maskingBuffer;
};

JkWsClientWSSocketGenericMyWSMessage.prototype.setPayloadBuffer = function(payloadBuffer) {
	this.payloadBuffer = payloadBuffer;
	this.onChanged();
	return this;
};

JkWsClientWSSocketGenericMyWSMessage.prototype.getPayloadBuffer = function() {
	return this.payloadBuffer;
};

JkWsClientWSSocketGenericMyWSMessage.forCloseControlFrame = function(statusCode, reason) {
	if(statusCode < 65536 && statusCode > -1 && JkLangString.isNotEmpty(reason)) {
		var rBuffer = JkLangString.toUTF8Buffer(reason);
		var size = rBuffer.byteLength;
		var plBuffer = JkLangBuffer.allocate((size + 2));
		JkLangBuffer.setByte(plBuffer, 0, (~(~(statusCode >> 8 & 0xff))));
		JkLangBuffer.setByte(plBuffer, 1, (~(~(statusCode & 0xff))));
		JkLangBuffer.copyFrom(plBuffer, rBuffer, 0, 2, size);
		return JkWsClientWSSocketGenericMyWSMessage.NEW().setFin(1).setOpcode(JkWsClientWSSocketGenericMyWSMessage.CLOSE_FRAME).setPayloadBuffer(plBuffer);
	}
	return JkWsClientWSSocketGenericMyWSMessage.NEW().setFin(1).setOpcode(JkWsClientWSSocketGenericMyWSMessage.CLOSE_FRAME);
};

JkWsClientWSSocketGenericMyWSMessage.prototype.isDataText = function() {
	return this.opcode == 1;
};

JkWsClientWSSocketGenericMyWSMessage.prototype.isDataBinary = function() {
	return this.opcode == 1;
};

JkWsClientWSSocketGenericMyWSMessage.prototype.isCloseControlFrame = function() {
	return this.opcode == JkWsClientWSSocketGenericMyWSMessage.CLOSE_FRAME;
};

JkWsClientWSSocketGenericMyWSMessage.prototype.isPingControlFrame = function() {
	return this.opcode == JkWsClientWSSocketGenericMyWSMessage.PING_FRAME;
};

JkWsClientWSSocketGenericMyWSMessage.prototype.isPongControlFrame = function() {
	return this.opcode == JkWsClientWSSocketGenericMyWSMessage.PONG_FRAME;
};

JkWsClientWSSocketGenericMyWSMessage.prototype.toBuffer = function() {
	if(this.messageBuffer != null) {
		return this.messageBuffer;
	}
	var size = 2;
	if(this.maskingBuffer != null) {
		size += 4;
	}
	var payloadLength = 0;
	if(this.payloadBuffer != null) {
		payloadLength = this.payloadBuffer.byteLength;
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
	b2 |= 0x80;
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

JkWsClientWSSocketGenericMyWSMessage.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsClientWSSocketGenericMyWSMessage"] === true;
};

JkWsClientWSSocketGenericMyWSMessage.CLOSE_FRAME = 8;
JkWsClientWSSocketGenericMyWSMessage.PING_FRAME = 9;
JkWsClientWSSocketGenericMyWSMessage.PONG_FRAME = 10;

let JkWsClientWSSocket = function() {
	this.onOpenCallback = null;
	this.onCloseCallback = null;
	this.onMessageCallback = null;
	this.onErrorCallback = null;
};

JkWsClientWSSocket.prototype._t = { "JkWsClientWSSocket" : true };
JkWsClientWSSocket.prototype._tobj = JkWsClientWSSocket;

JkWsClientWSSocket.NEW = function() {
	var v = new JkWsClientWSSocket;
	return v.CTOR_JkWsClientWSSocket();
};

JkWsClientWSSocket.prototype.CTOR_JkWsClientWSSocket = function() {
	this.onErrorCallback = null;
	this.onMessageCallback = null;
	this.onCloseCallback = null;
	this.onOpenCallback = null;
	return this;
};

JkWsClientWSSocket.create = function() {
	return JkWsClientWSSocketForBrowser.NEW();
};

JkWsClientWSSocket.prototype.connect = function(url) {};

JkWsClientWSSocket.prototype.send = function(message) {};

JkWsClientWSSocket.prototype.close = function() {};

JkWsClientWSSocket.prototype.closeWithReason = function(statusCode, reason, callback) {};

JkWsClientWSSocket.prototype.getOnOpenCallback = function() {
	return this.onOpenCallback;
};

JkWsClientWSSocket.prototype.setOnOpenCallback = function(v) {
	this.onOpenCallback = v;
	return this;
};

JkWsClientWSSocket.prototype.getOnCloseCallback = function() {
	return this.onCloseCallback;
};

JkWsClientWSSocket.prototype.setOnCloseCallback = function(v) {
	this.onCloseCallback = v;
	return this;
};

JkWsClientWSSocket.prototype.getOnMessageCallback = function() {
	return this.onMessageCallback;
};

JkWsClientWSSocket.prototype.setOnMessageCallback = function(v) {
	this.onMessageCallback = v;
	return this;
};

JkWsClientWSSocket.prototype.getOnErrorCallback = function() {
	return this.onErrorCallback;
};

JkWsClientWSSocket.prototype.setOnErrorCallback = function(v) {
	this.onErrorCallback = v;
	return this;
};

JkWsClientWSSocket.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsClientWSSocket"] === true;
};

let JkWsClientWSSocketForBrowserMyWSCloseEvent = function() {
	JkWsClientWSCloseEvent.call(this);
	this.statusCode = 0;
	this.reason = null;
};

JkWsClientWSSocketForBrowserMyWSCloseEvent.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWsClientWSCloseEvent.prototype);
JkWsClientWSSocketForBrowserMyWSCloseEvent.prototype.constructor = JkWsClientWSSocketForBrowserMyWSCloseEvent;
JkWsClientWSSocketForBrowserMyWSCloseEvent.prototype._t = {
	"JkWsClientWSSocketForBrowserMyWSCloseEvent" : true,
	"JkWsClientWSCloseEvent" : true
};
JkWsClientWSSocketForBrowserMyWSCloseEvent.prototype._tobj = JkWsClientWSSocketForBrowserMyWSCloseEvent;

JkWsClientWSSocketForBrowserMyWSCloseEvent.NEW = function() {
	var v = new JkWsClientWSSocketForBrowserMyWSCloseEvent;
	return v.CTOR_JkWsClientWSSocketForBrowserMyWSCloseEvent();
};

JkWsClientWSSocketForBrowserMyWSCloseEvent.prototype.CTOR_JkWsClientWSSocketForBrowserMyWSCloseEvent = function() {
	if(JkWsClientWSCloseEvent.prototype.CTOR_JkWsClientWSCloseEvent.call(this) == null) {
		return null;
	}
	this.reason = null;
	this.statusCode = 0;
	this.statusCode = 0;
	return this;
};

JkWsClientWSSocketForBrowserMyWSCloseEvent.prototype.setStatusCode = function(c) {
	this.statusCode = c;
	return this;
};

JkWsClientWSSocketForBrowserMyWSCloseEvent.prototype.getStatusCode = function() {
	return this.statusCode;
};

JkWsClientWSSocketForBrowserMyWSCloseEvent.prototype.setReason = function(r) {
	this.reason = r;
	return this;
};

JkWsClientWSSocketForBrowserMyWSCloseEvent.prototype.getReason = function() {
	return this.reason;
};

JkWsClientWSSocketForBrowserMyWSCloseEvent.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsClientWSSocketForBrowserMyWSCloseEvent"] === true;
};

let JkWsClientWSSocketForBrowser = function() {
	JkWsClientWSSocket.call(this);
	this.socket = null;
};

JkWsClientWSSocketForBrowser.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWsClientWSSocket.prototype);
JkWsClientWSSocketForBrowser.prototype.constructor = JkWsClientWSSocketForBrowser;
JkWsClientWSSocketForBrowser.prototype._t = {
	"JkWsClientWSSocket" : true,
	"JkWsClientWSSocketForBrowser" : true
};
JkWsClientWSSocketForBrowser.prototype._tobj = JkWsClientWSSocketForBrowser;

JkWsClientWSSocketForBrowser.NEW = function() {
	var v = new JkWsClientWSSocketForBrowser;
	return v.CTOR_JkWsClientWSSocketForBrowser();
};

JkWsClientWSSocketForBrowser.prototype.CTOR_JkWsClientWSSocketForBrowser = function() {
	this.socket = null;
	if(JkWsClientWSSocket.prototype.CTOR_JkWsClientWSSocket.call(this) == null) {
		return null;
	}
	return this;
};

JkWsClientWSSocketForBrowser.prototype.onPrepareCloseEvent = function(e) {
	this.onCloseCallback((JkWsClientWSSocketForBrowserMyWSCloseEvent.NEW().setStatusCode((~(~e.code))).setReason(((function(o) {
		if(typeof(o) === 'string') {
			return o;
		}
		return null;
	}.bind(this))(e.reason)))));
};

JkWsClientWSSocketForBrowser.prototype.onPrepareWSMessageForStringData = function(data) {
	this.onMessageCallback((JkWsClientWSMessage.forStringData(data)));
};

JkWsClientWSSocketForBrowser.prototype.onPrepareWSMessageForData = function(data) {
	this.onMessageCallback((JkWsClientWSMessage.forData(data)));
};

JkWsClientWSSocketForBrowser.prototype.connect = function(url) {
	this.socket = new WebSocket(url);
	this.socket.addEventListener('open', function(e) {
		this.onOpenCallback();
	}.bind(this));
	this.socket.addEventListener('close', function(e) {
		this.onPrepareCloseEvent(e);
	}.bind(this));
	this.socket.addEventListener('error', function(e) {
		this.onErrorCallback(JkLangError.forCode("unspecifiedError"));
	}.bind(this));
	this.socket.addEventListener('message', function(e) {
		if(e.data instanceof ArrayBuffer) {
			this.onPrepareWSMessageForData(e.data);
		}
		else if(e.data instanceof Blob) {
			var fr = new FileReader();
			fr.onload = function() {
				this.onPrepareWSMessageForData(fr.result);
			}.bind(this);
			fr.readAsArrayBuffer(e.data);
		}
		else if(typeof e.data === "string") {
			this.onPrepareWSMessageForStringData(e.data);
		}
	}.bind(this));
	;
};

JkWsClientWSSocketForBrowser.prototype.send = function(message) {
	if(this.socket == null || message == null) {
		this.onErrorCallback((JkLangError.forCode("noOpenConnection", null)));
		return;
	}
	if(message.getIsPing()) {
		return;
	}
	else if(message.isText()) {
		var m = message.getDataAsString();
		if(this.socket.readyState === this.socket.OPEN) {
			this.socket.send(m);
		}
		else {
			this.onErrorCallback(JkLangError.forCode("failedToSendData"))
		}
		;
	}
	else {
		var m1 = message.getData();
		if(this.socket.readyState === this.socket.OPEN) {
			this.socket.send(m);
		}
		else {
			this.onErrorCallback(JkLangError.forCode("failedToSendData"))
		}
		;
	}
};

JkWsClientWSSocketForBrowser.prototype.closeWithReason = function(statusCode, reason, callback) {
	if(!(this.socket != null)) {
		return;
	}
	this.socket.close(statusCode, reason);
	;
	if(callback != null) {
		callback();
	}
};

JkWsClientWSSocketForBrowser.prototype.close = function() {
	if(!(this.socket != null)) {
		return;
	}
	this.socket.close();
	;
};

JkWsClientWSSocketForBrowser.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsClientWSSocketForBrowser"] === true;
};

let JkWsClientWSSocketGeneric = function() {
	JkWsClientWSSocket.call(this);
	this.client = null;
	this.key = null;
	this.accept = null;
	this.parser = null;
	this.leftOverBuffer = null;
	this.frameNo = 1;
};

JkWsClientWSSocketGeneric.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWsClientWSSocket.prototype);
JkWsClientWSSocketGeneric.prototype.constructor = JkWsClientWSSocketGeneric;
JkWsClientWSSocketGeneric.prototype._t = {
	"JkWsClientWSSocketGeneric" : true,
	"JkWsClientWSSocket" : true
};
JkWsClientWSSocketGeneric.prototype._tobj = JkWsClientWSSocketGeneric;

JkWsClientWSSocketGeneric.NEW = function() {
	var v = new JkWsClientWSSocketGeneric;
	return v.CTOR_JkWsClientWSSocketGeneric();
};

JkWsClientWSSocketGeneric.prototype.CTOR_JkWsClientWSSocketGeneric = function() {
	if(JkWsClientWSSocket.prototype.CTOR_JkWsClientWSSocket.call(this) == null) {
		return null;
	}
	this.frameNo = 1;
	this.leftOverBuffer = null;
	this.parser = null;
	this.accept = null;
	this.key = null;
	this.client = null;
	this.key = JkWsClientWSSocketGeneric.generateKey();
	this.accept = JkWsClientWSSocketGeneric.getAcceptValueForKey(this.key);
	return this;
};

JkWsClientWSSocketGeneric.getAcceptValueForKey = function(key) {
	var shaEncoder = JkShaSHAEncoder.create();
	if(!(shaEncoder != null)) {
		return null;
	}
	return JkBase64Base64Encoder.encode((shaEncoder.encodeAsBuffer((JkLangString.toUTF8Buffer((JkLangString.safeString(key)) + (JkLangString.safeString(JkWsClientWSSocketGeneric.WEBSOCKET_GUID)))), JkShaSHAEncoder.SHA1)));
};

JkWsClientWSSocketGeneric.generateKey = function() {
	return JkBase64Base64Encoder.encode((JkLangString.toUTF8Buffer("EXTREMEPERFORMED")));
};

JkWsClientWSSocketGeneric.createOpenHandshakeHTTPRequest = function(url, key) {
	if(!(url != null && key != null)) {
		return null;
	}
	var sb = JkLangStringBuilder.NEW();
	sb.appendString("GET ");
	var path = url.toStringNohost();
	if(JkLangString.isEmpty(path)) {
		sb.appendCharacter('/'.charCodeAt());
	}
	else {
		if(JkLangString.getIndexOfCharacter(path, '/'.charCodeAt(), 0) != 0) {
			sb.appendCharacter('/'.charCodeAt());
		}
		sb.appendString(path);
	}
	sb.appendString(" HTTP/1.1\r\n");
	sb.appendString("Host: ");
	sb.appendString((url.getHost()));
	var port = url.getPort();
	if(!(port == null)) {
		sb.appendCharacter(':'.charCodeAt());
		sb.appendString(port);
	}
	sb.appendString("\r\n");
	sb.appendString("Upgrade: websocket\r\n");
	sb.appendString("Connection: Upgrade\r\n");
	sb.appendString("Sec-WebSocket-Key: ");
	sb.appendString(key);
	sb.appendString("\r\nSec-WebSocket-Version: 13\r\n\r\n");
	return JkLangString.toUTF8Buffer((sb.toString()));
};

JkWsClientWSSocketGeneric.createOpenHandshakeHTTPResponse = function(key) {
	if(!(key != null)) {
		return null;
	}
	var sb = JkLangStringBuilder.NEW();
	sb.appendString("HTTP/1.1 101 Switching Protocols\r\n");
	sb.appendString("Upgrade: websocket\r\n");
	sb.appendString("Connection: Upgrade\r\n");
	sb.appendString("Sec-WebSocket-Accept: ");
	sb.appendString((JkWsClientWSSocketGeneric.getAcceptValueForKey(key)));
	sb.appendString("\r\n\r\n");
	return JkLangString.toUTF8Buffer((sb.toString()));
};

JkWsClientWSSocketGeneric.generateMaskingKey = function() {
	return JkLangString.toUTF8Buffer("byte");
};

JkWsClientWSSocketGeneric.prototype.processData = function(data, size) {
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
	while(true){
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
					;
				}
				else {
					maskingBuffer = JkLangBuffer.allocate(4);
				}
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
					v |= JkLangBuffer.getByte(nbuffer, (p + 1)) & 0xff << 8;
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
					v1 |= JkLangBuffer.getByte(nbuffer, (p + 1)) & 0x7f << 56;
					v1 |= JkLangBuffer.getByte(nbuffer, (p + 2)) & 0xff << 48;
					v1 |= JkLangBuffer.getByte(nbuffer, (p + 3)) & 0xff << 40;
					v1 |= JkLangBuffer.getByte(nbuffer, (p + 4)) & 0xff << 32;
					v1 |= JkLangBuffer.getByte(nbuffer, (p + 5)) & 0xff << 24;
					v1 |= JkLangBuffer.getByte(nbuffer, (p + 6)) & 0xff << 16;
					v1 |= JkLangBuffer.getByte(nbuffer, (p + 7)) & 0xff << 8;
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
			break;
		}
		payloadBuffer = JkLangBuffer.allocate(payloadLength);
		JkLangBuffer.copyFrom(payloadBuffer, nbuffer, p, 0, payloadLength);
		this.processFrame(fin, rsv1, rsv2, rsv3, opcode, mask, maskingBuffer, payloadLength, payloadBuffer);
		this.frameNo = 1;
		if(nsize > frameLength) {
			var losize1 = nsize - frameLength;
			var nnb = JkLangBuffer.allocate(losize1);
			JkLangBuffer.copyFrom(nnb, nbuffer, frameLength, 0, losize1);
			nbuffer = nnb;
			nsize = losize1;
		}
		else {
			break;
		}
	}
	return true;
};

JkWsClientWSSocketGeneric.prototype.processFrame = function(fin, rsv1, rsv2, rsv3, opcode, mask, maskingBuffer, payloadLength, payloadBuffer) {
	if(fin == 0) {
		return;
	}
	this.onNewMessage((JkWsClientWSSocketGenericMyWSMessage.create(fin, rsv1, rsv2, rsv3, opcode, maskingBuffer, payloadBuffer)));
};

JkWsClientWSSocketGeneric.prototype.onNewMessage = function(message) {
	if(message.isCloseControlFrame()) {
		this.close();
	}
	else if(message.isPingControlFrame()) {
		this.doSend((JkWsClientWSSocketGenericMyWSMessage.forPongControlFrame()));
	}
	else if(message.isPongControlFrame()) {
		;
	}
	else {
		var cb = this.getOnMessageCallback();
		if(cb != null) {
			if(message.isDataText()) {
				cb((JkWsClientWSMessage.forStringData((JkLangString.forUTF8Buffer((message.getPayloadBuffer()))))));
			}
			else {
				cb((JkWsClientWSMessage.forData((message.getPayloadBuffer()))));
			}
			return;
		}
	}
};

JkWsClientWSSocketGeneric.prototype.connect = function(url) {
	if(this.client != null) {
		this.closeWithError((JkLangError.forCode("alreadyConnected", null)));
	}
	if(!((this.client = JkSocketAsyncTCPClient.instance()) != null)) {
		this.closeWithError((JkLangError.forCode("failedToCreateTcpClient", null)));
		return;
	}
	var u = JkUrlURL.forString(url, false);
	if(!(u != null)) {
		this.closeWithError((JkLangError.forCode("invalidUrl", null)));
		return;
	}
	var port = u.getPortInt();
	if(port < 1) {
		port = 80;
	}
	var scheme = u.getScheme();
	if(JkLangString.equals("https", scheme) || JkLangString.equals("wss", scheme)) {
		this.client.connectSSL((u.getHost()), port, (function(e1) {
			this.handleConnect(u, e1);
		}.bind(this)));
		return;
	}
	this.client.connect((u.getHost()), port, (function(e3) {
		this.handleConnect(u, e3);
	}.bind(this)));
};

JkWsClientWSSocketGeneric.prototype.closeWithError = function(error) {
	var cc = this.client;
	this.client = null;
	if(error != null) {
		var ecb = this.getOnErrorCallback();
		if(ecb != null) {
			ecb(error);
		}
	}
	if(cc != null) {
		var ccb = this.getOnCloseCallback();
		if(ccb != null) {
			ccb((JkWsClientWSSocketGenericMyWSCloseEvent.NEW().setStatusCode(JkWsClientWSCloseEvent.CLOSE_ABNORMAL)));
		}
		cc.disconnect(null);
	}
};

JkWsClientWSSocketGeneric.prototype.closeWithoutError = function() {
	this.closeWithError(null);
};

JkWsClientWSSocketGeneric.prototype.handleConnect = function(u, error) {
	if(error != null) {
		this.closeWithError(error);
		return;
	}
	if(!(this.client != null)) {
		this.closeWithError((JkLangError.forCode("nullClient", null)));
		return;
	}
	this.parser = JkWsClientWSSocketGenericHTTPResponseParser.NEW();
	this.client.receive((function(data1, size1) {
		this.onOpenHandshakeResponse(data1, size1);
	}.bind(this)));
	var v = JkWsClientWSSocketGeneric.createOpenHandshakeHTTPRequest(u, this.key);
	this.client.send(v, v.byteLength, (function(oe1) {
		if(oe1 != null) {
			this.closeWithError(oe1);
		}
	}.bind(this)));
};

JkWsClientWSSocketGeneric.prototype.onOpenHandshakeResponse = function(data, size1) {
	if(!(this.parser != null)) {
		return;
	}
	if(size1 < 1) {
		this.closeWithError((JkLangError.forCode("dataSizeInvalid", null)));
		return;
	}
	this.parser.onDataReceived(data, size1);
	if(!this.parser.getEndOfResponse()) {
		return;
	}
	var headers = this.parser.headers;
	this.parser.reset();
	this.parser = null;
	var statusCode = headers.getHttpStatus();
	if(!(statusCode == "101")) {
		this.closeWithError((JkLangError.forCode("invalidWebsocketHttpStatus", null)));
		return;
	}
	if(JkLangString.equalsIgnoreCase("websocket", (headers.getHeader("upgrade"))) == false) {
		this.closeWithError((JkLangError.forCode("invalidWebsocketHeader1", null)));
		return;
	}
	else if(JkLangString.equalsIgnoreCase("websocket", (headers.getHeader("upgrade"))) == false) {
		this.closeWithError((JkLangError.forCode("invalidWebsocketHeader2", null)));
		return;
	}
	else if(JkLangString.equalsIgnoreCase("upgrade", (headers.getHeader("connection"))) == false) {
		this.closeWithError((JkLangError.forCode("invalidWebsocketHeader3", null)));
		return;
	}
	else if(JkLangString.equals(this.accept, (headers.getHeader("sec-websocket-accept"))) == false) {
		this.closeWithError((JkLangError.forCode("invalidWebsocketHeader4", null)));
		return;
	}
	this.client.receive((function(buffer, size) {
		this.receiveData(buffer, size);
	}.bind(this)));
	var ocb = this.getOnOpenCallback();
	if(ocb != null) {
		ocb();
	}
};

JkWsClientWSSocketGeneric.prototype.receiveData = function(buffer1, size1) {
	if(!(buffer1 != null) || size1 < 1) {
		this.closeWithError((JkLangError.forCode("closedByServer", null)));
		return;
	}
	if(this.processData(buffer1, size1) == false) {
		this.closeWithError((JkLangError.forCode("invalidDataReceived", null)));
		return;
	}
	if(this.client != null) {
		this.client.receive((function(buffer, size) {
			this.receiveData(buffer, size);
		}.bind(this)));
	}
};

JkWsClientWSSocketGeneric.prototype.send = function(message) {
	if(!(message != null)) {
		return;
	}
	if(!(this.client != null)) {
		return;
	}
	var v = null;
	if(message.getIsPing()) {
		v = JkWsClientWSSocketGenericMyWSMessage.forPingControlFrame();
	}
	else if(message.isText()) {
		v = JkWsClientWSSocketGenericMyWSMessage.create(1, 0, 0, 0, 1, (JkWsClientWSSocketGeneric.generateMaskingKey()), (message.getData()));
	}
	else {
		v = JkWsClientWSSocketGenericMyWSMessage.create(1, 0, 0, 0, 2, (JkWsClientWSSocketGeneric.generateMaskingKey()), (message.getData()));
	}
	this.doSend(v);
};

JkWsClientWSSocketGeneric.prototype.doSend = function(message) {
	if(!(message != null)) {
		return;
	}
	var data = message.toBuffer();
	this.client.send(data, data.byteLength, (function(error1) {
		if(error1 != null) {
			this.closeWithError(error1);
		}
	}.bind(this)));
};

JkWsClientWSSocketGeneric.prototype.closeWithReason = function(statusCode, reason, callback) {
	if(!(this.client != null)) {
		return;
	}
	var data = JkWsClientWSSocketGenericMyWSMessage.forCloseControlFrame(JkWsClientWSCloseEvent.CLOSE_NORMAL, null).toBuffer();
	var cb = callback;
	this.client.send(data, data.byteLength, (function(error1) {
		if(error1 != null) {
			this.closeWithError(error1);
		}
		else {
			this.closeWithoutError();
		}
		if(cb != null) {
			cb();
		}
	}.bind(this)));
};

JkWsClientWSSocketGeneric.prototype.close = function() {
	this.closeWithoutError();
};

JkWsClientWSSocketGeneric.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsClientWSSocketGeneric"] === true;
};

JkWsClientWSSocketGeneric.WEBSOCKET_GUID = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11";

let JkWsClientWSClient = function() {
	this.url = null;
	this.eventLoop = null;
	this.socket = null;
	this.state = JkWsClientWSClient.STATE_STOPPED;
	this.lastActivity = 0;
	this.reconnectInterval = 5000000;
	this.connectionTimeoutInterval = 30000000;
	this.pingInterval = 30000000;
	this.protocol = null;
	this.stateChangeHandler = null;
	this.nextTick = 0;
};

JkWsClientWSClient.prototype._t = {
	"JkWsClientWSClient" : true,
	"JkWsWSProtocolSource" : true
};
JkWsClientWSClient.prototype._tobj = JkWsClientWSClient;

JkWsClientWSClient.NEW = function() {
	var v = new JkWsClientWSClient;
	return v.CTOR_JkWsClientWSClient();
};

JkWsClientWSClient.prototype.CTOR_JkWsClientWSClient = function() {
	this.nextTick = 0;
	this.stateChangeHandler = null;
	this.protocol = null;
	this.pingInterval = 30000000;
	this.connectionTimeoutInterval = 30000000;
	this.reconnectInterval = 5000000;
	this.lastActivity = 0;
	this.state = JkWsClientWSClient.STATE_STOPPED;
	this.socket = null;
	this.eventLoop = null;
	this.url = null;
	return this;
};

JkWsClientWSClient.prototype.getTickInterval = function() {
	if(this.state == JkWsClientWSClient.STATE_STOPPED) {
		return 0;
	}
	if(this.state == JkWsClientWSClient.STATE_DISCONNECTED) {
		return this.reconnectInterval;
	}
	if(this.state == JkWsClientWSClient.STATE_CONNECTING) {
		return this.connectionTimeoutInterval;
	}
	if(this.state == JkWsClientWSClient.STATE_CONNECTED) {
		return this.pingInterval;
	}
	return 0;
};

JkWsClientWSClient.prototype.start = function(url, eventLoop, protocol) {
	this.url = url;
	this.eventLoop = eventLoop;
	this.protocol = protocol;
	if(protocol != null) {
		protocol.setSource(this);
	}
	this.updateState(JkWsClientWSClient.STATE_DISCONNECTED);
	this.tick(this.nextTick);
};

JkWsClientWSClient.prototype.stop = function() {
	this.closeConnection();
	if(this.protocol != null) {
		this.protocol.setSource(null);
	}
	this.protocol = null;
	this.updateState(JkWsClientWSClient.STATE_STOPPED);
	this.url = null;
	this.eventLoop = null;
};

JkWsClientWSClient.prototype.closeConnection = function() {
	if(this.socket != null) {
		this.socket.close();
	}
	this.socket = null;
	this.updateState(JkWsClientWSClient.STATE_DISCONNECTED);
};

JkWsClientWSClient.prototype.updateState = function(state) {
	if(this.state != state) {
		this.state = state;
		this.onStateChanged(state);
		this.scheduleTick();
	}
};

JkWsClientWSClient.prototype.failConnection = function(error) {
	if(error != null) {
		this.onConnectionError(error);
	}
	this.closeConnection();
};

JkWsClientWSClient.prototype.scheduleTick = function() {
	if(this.eventLoop != null) {
		var ti = this.getTickInterval();
		if(ti > 0) {
			this.nextTick++;
			var tc = this.nextTick;
			this.eventLoop.runScheduled((this.getTickInterval()), (JkLangRunnableFunction.forFunction((function() {
				this.tick(tc);
			}.bind(this)))));
		}
	}
};

JkWsClientWSClient.prototype.tick = function(tickId) {
	if(tickId < this.nextTick) {
		return;
	}
	if(this.state == JkWsClientWSClient.STATE_STOPPED) {
		return;
	}
	this.doTick();
	this.scheduleTick();
};

JkWsClientWSClient.prototype.onActivity = function() {
	this.lastActivity = JkTimeSystemClock.asUTCSeconds();
};

JkWsClientWSClient.prototype.doTick = function() {
	if(this.state == JkWsClientWSClient.STATE_DISCONNECTED) {
		this.socket = JkWsClientWSSocket.create();
		if(!(this.socket != null)) {
			this.failConnection((JkLangError.forCode("failedToCreateWebSocket", null)));
			return;
		}
		this.updateState(JkWsClientWSClient.STATE_CONNECTING);
		this.socket.setOnOpenCallback((function() {
			this.onActivity();
			this.updateState(JkWsClientWSClient.STATE_CONNECTED);
			this.onConnectionOpened();
		}.bind(this)));
		this.socket.setOnCloseCallback((function(event1) {
			this.closeConnection();
			this.onConnectionClosed();
		}.bind(this)));
		this.socket.setOnMessageCallback((function(event3) {
			this.onActivity();
			this.onConnectionMessage(event3);
		}.bind(this)));
		this.socket.setOnErrorCallback((function(error1) {
			this.failConnection(error1);
		}.bind(this)));
		this.socket.connect(this.url);
		return;
	}
	if(this.state == JkWsClientWSClient.STATE_CONNECTING) {
		this.failConnection((JkLangError.forCode("connectionTimeout", null)));
		return;
	}
	if(this.state == JkWsClientWSClient.STATE_CONNECTED) {
		if(JkTimeSystemClock.asUTCSeconds() - this.lastActivity >= this.pingInterval / 1000000) {
			this.sendPing();
		}
		return;
	}
};

JkWsClientWSClient.prototype.sendPing = function() {
	this.sendMessage((JkWsClientWSMessage.forPingMessage()));
};

JkWsClientWSClient.prototype.sendString = function(data) {
	this.sendMessage((JkWsClientWSMessage.forStringData(data)));
};

JkWsClientWSClient.prototype.sendBuffer = function(data) {
	this.sendMessage((JkWsClientWSMessage.forData(data)));
};

JkWsClientWSClient.prototype.sendMessage = function(message) {
	this.onActivity();
	if(this.socket != null) {
		this.socket.send(message);
	}
};

JkWsClientWSClient.prototype.onConnectionOpened = function() {
	if(this.protocol != null) {
		this.protocol.onConnectionOpened();
	}
};

JkWsClientWSClient.prototype.onConnectionClosed = function() {
	if(this.protocol != null) {
		this.protocol.onConnectionClosed();
	}
};

JkWsClientWSClient.prototype.onConnectionMessage = function(message) {
	if(this.protocol != null && message != null) {
		if(message.isText()) {
			this.protocol.onStringMessage((message.getDataAsString()));
		}
		else {
			this.protocol.onBinaryMessage((message.getData()));
		}
	}
};

JkWsClientWSClient.prototype.onConnectionError = function(error) {
	if(this.protocol != null) {
		this.protocol.onConnectionError(error);
	}
};

JkWsClientWSClient.prototype.onStateChanged = function(newState) {
	if(this.stateChangeHandler != null) {
		this.stateChangeHandler(newState);
	}
};

JkWsClientWSClient.prototype.getReconnectInterval = function() {
	return this.reconnectInterval;
};

JkWsClientWSClient.prototype.setReconnectInterval = function(v) {
	this.reconnectInterval = v;
	return this;
};

JkWsClientWSClient.prototype.getConnectionTimeoutInterval = function() {
	return this.connectionTimeoutInterval;
};

JkWsClientWSClient.prototype.setConnectionTimeoutInterval = function(v) {
	this.connectionTimeoutInterval = v;
	return this;
};

JkWsClientWSClient.prototype.getPingInterval = function() {
	return this.pingInterval;
};

JkWsClientWSClient.prototype.setPingInterval = function(v) {
	this.pingInterval = v;
	return this;
};

JkWsClientWSClient.prototype.getProtocol = function() {
	return this.protocol;
};

JkWsClientWSClient.prototype.setProtocol = function(v) {
	this.protocol = v;
	return this;
};

JkWsClientWSClient.prototype.getStateChangeHandler = function() {
	return this.stateChangeHandler;
};

JkWsClientWSClient.prototype.setStateChangeHandler = function(v) {
	this.stateChangeHandler = v;
	return this;
};

JkWsClientWSClient.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsClientWSClient"] === true;
};

JkWsClientWSClient.STATE_STOPPED = 0;
JkWsClientWSClient.STATE_DISCONNECTED = 1;
JkWsClientWSClient.STATE_CONNECTING = 2;
JkWsClientWSClient.STATE_CONNECTED = 3;

let JkWsClientWSSocketGenericMyWSCloseEvent = function() {
	JkWsClientWSCloseEvent.call(this);
	this.statusCode = 0;
	this.reason = null;
};

JkWsClientWSSocketGenericMyWSCloseEvent.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWsClientWSCloseEvent.prototype);
JkWsClientWSSocketGenericMyWSCloseEvent.prototype.constructor = JkWsClientWSSocketGenericMyWSCloseEvent;
JkWsClientWSSocketGenericMyWSCloseEvent.prototype._t = {
	"JkWsClientWSCloseEvent" : true,
	"JkWsClientWSSocketGenericMyWSCloseEvent" : true
};
JkWsClientWSSocketGenericMyWSCloseEvent.prototype._tobj = JkWsClientWSSocketGenericMyWSCloseEvent;

JkWsClientWSSocketGenericMyWSCloseEvent.NEW = function() {
	var v = new JkWsClientWSSocketGenericMyWSCloseEvent;
	return v.CTOR_JkWsClientWSSocketGenericMyWSCloseEvent();
};

JkWsClientWSSocketGenericMyWSCloseEvent.prototype.CTOR_JkWsClientWSSocketGenericMyWSCloseEvent = function() {
	this.reason = null;
	this.statusCode = 0;
	if(JkWsClientWSCloseEvent.prototype.CTOR_JkWsClientWSCloseEvent.call(this) == null) {
		return null;
	}
	return this;
};

JkWsClientWSSocketGenericMyWSCloseEvent.prototype.setStatusCode = function(v) {
	this.statusCode = v;
	return this;
};

JkWsClientWSSocketGenericMyWSCloseEvent.prototype.setReason = function(v) {
	this.reason = v;
	return this;
};

JkWsClientWSSocketGenericMyWSCloseEvent.prototype.getStatusCode = function() {
	return this.statusCode;
};

JkWsClientWSSocketGenericMyWSCloseEvent.prototype.getReason = function() {
	return this.reason;
};

JkWsClientWSSocketGenericMyWSCloseEvent.forPayloadBuffer = function(payloadBuffer) {
	if(!(payloadBuffer != null)) {
		return null;
	}
	var size = payloadBuffer.byteLength;
	var e = JkWsClientWSSocketGenericMyWSCloseEvent.NEW();
	var v = 0;
	v |= JkLangBuffer.getByte(payloadBuffer, 0) << 8;
	v |= JkLangBuffer.getByte(payloadBuffer, 1);
	e.setStatusCode(v);
	if(size - 2 > 0) {
		e.setReason((JkLangString.forUTF8Buffer((JkLangBuffer.getSubBuffer(payloadBuffer, 2, (size - 2), false)))));
	}
	return e;
};

JkWsClientWSSocketGenericMyWSCloseEvent.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsClientWSSocketGenericMyWSCloseEvent"] === true;
};

let JkWsClientWSMessage = function() {
	this.data = null;
	this.isString = false;
	this.isPing = false;
};

JkWsClientWSMessage.prototype._t = { "JkWsClientWSMessage" : true };
JkWsClientWSMessage.prototype._tobj = JkWsClientWSMessage;

JkWsClientWSMessage.NEW = function() {
	var v = new JkWsClientWSMessage;
	return v.CTOR_JkWsClientWSMessage();
};

JkWsClientWSMessage.prototype.CTOR_JkWsClientWSMessage = function() {
	this.isPing = false;
	this.isString = false;
	this.data = null;
	return this;
};

JkWsClientWSMessage.forStringData = function(data) {
	if(!(data != null)) {
		return null;
	}
	return JkWsClientWSMessage.NEW().setData1(data);
};

JkWsClientWSMessage.forData = function(data) {
	if(!(data != null)) {
		return null;
	}
	return JkWsClientWSMessage.NEW().setData2(data);
};

JkWsClientWSMessage.forPingMessage = function() {
	return JkWsClientWSMessage.NEW().setIsPing(true);
};

JkWsClientWSMessage.prototype.isText = function() {
	return this.isString;
};

JkWsClientWSMessage.prototype.setData1 = function(v) {
	if(JkLangString.isEmpty(v)) {
		return this;
	}
	this.isString = true;
	this.data = JkLangString.toUTF8Buffer(v);
	return this;
};

JkWsClientWSMessage.prototype.setData2 = function(v) {
	this.isString = false;
	this.data = v;
	return this;
};

JkWsClientWSMessage.prototype.getDataAsString = function() {
	if(this.isText() == false) {
		return null;
	}
	return JkLangString.forUTF8Buffer(this.data);
};

JkWsClientWSMessage.prototype.getData = function() {
	return this.data;
};

JkWsClientWSMessage.prototype.getIsPing = function() {
	return this.isPing;
};

JkWsClientWSMessage.prototype.setIsPing = function(v) {
	this.isPing = v;
	return this;
};

JkWsClientWSMessage.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWsClientWSMessage"] === true;
};
