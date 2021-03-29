let JkHttpClientHTTPClientListener = function() {
	this.completed = false;
};

JkHttpClientHTTPClientListener.prototype._t = { "JkHttpClientHTTPClientListener" : true };
JkHttpClientHTTPClientListener.prototype._tobj = JkHttpClientHTTPClientListener;

JkHttpClientHTTPClientListener.NEW = function() {
	var v = new JkHttpClientHTTPClientListener;
	return v.CTOR_JkHttpClientHTTPClientListener();
};

JkHttpClientHTTPClientListener.prototype.CTOR_JkHttpClientHTTPClientListener = function() {
	this.completed = false;
	return this;
};

JkHttpClientHTTPClientListener.prototype.onError = function(message) {
};

JkHttpClientHTTPClientListener.prototype.onStatus = function(message) {
};

JkHttpClientHTTPClientListener.prototype.onStartRequest = function(request) {
	return true;
};

JkHttpClientHTTPClientListener.prototype.onEndRequest = function() {
	return true;
};

JkHttpClientHTTPClientListener.prototype.onResponseReceived = function(response) {
	return true;
};

JkHttpClientHTTPClientListener.prototype.onDataReceived = function(buffer) {
	return true;
};

JkHttpClientHTTPClientListener.prototype.onAborted = function() {
};

JkHttpClientHTTPClientListener.prototype.onResponseCompleted = function() {
	this.completed = true;
};

JkHttpClientHTTPClientListener.prototype.getCompleted = function() {
	return this.completed;
};

JkHttpClientHTTPClientListener.prototype.setCompleted = function(v) {
	this.completed = v;
	return this;
};

JkHttpClientHTTPClientListener.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpClientHTTPClientListener"] === true;
};

let JkHttpClientCustomWebClient = function() {
	JkWebWebClient.call(this);
};

JkHttpClientCustomWebClient.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWebWebClient.prototype);
JkHttpClientCustomWebClient.prototype.constructor = JkHttpClientCustomWebClient;
JkHttpClientCustomWebClient.prototype._t = {
	"JkHttpClientCustomWebClient" : true,
	"JkWebWebClient" : true
};
JkHttpClientCustomWebClient.prototype._tobj = JkHttpClientCustomWebClient;

JkHttpClientCustomWebClient.NEW = function() {
	var v = new JkHttpClientCustomWebClient;
	return v.CTOR_JkHttpClientCustomWebClient();
};

JkHttpClientCustomWebClient.prototype.CTOR_JkHttpClientCustomWebClient = function() {
	if(JkWebWebClient.prototype.CTOR_JkWebWebClient.call(this) == null) {
		return null;
	}
	return this;
};

JkHttpClientCustomWebClient.prototype.query = function(method, url, headers, body, callback) {
	var contentType = null;
	if(headers != null) {
		var array = headers.asVector();
		if(array != null) {
			var n = 0;
			var m = array.length;
			for(n = 0 ; n < m ; n++) {
				var kvp = array[n];
				if(kvp != null) {
					if(JkLangString.equalsIgnoreCase(kvp.key, "Content-Type")) {
						contentType = kvp.value;
						break;
					}
				}
			}
		}
	}
	var req = null;
	if(JkLangString.equalsIgnoreCase(method, "GET")) {
		req = JkHttpClientHTTPClientRequest.forGET(url);
	}
	else if(JkLangString.equalsIgnoreCase(method, "POST")) {
		req = JkHttpClientHTTPClientRequest.forPOST3(url, contentType, body);
	}
	else if(JkLangString.equalsIgnoreCase(method, "PUT")) {
		req = JkHttpClientHTTPClientRequest.forPUT3(url, contentType, body);
	}
	else if(JkLangString.equalsIgnoreCase(method, "DELETE")) {
		req = JkHttpClientHTTPClientRequest.forDELETE(url);
	}
	else {
		callback(null, null, null);
		return;
	}
	if(headers != null) {
		var array2 = headers.asVector();
		if(array2 != null) {
			var n2 = 0;
			var m2 = array2.length;
			for(n2 = 0 ; n2 < m2 ; n2++) {
				var kvp1 = array2[n2];
				if(kvp1 != null) {
					if(JkLangString.equals(kvp1.key, "Content-Type") && JkLangString.isNotEmpty((req.getHeader("content-type")))) {
						continue;
					}
					req.addHeader(kvp1.key, kvp1.value);
				}
			}
		}
	}
	var op = JkHttpClientHTTPClientOperation.NEW();
	op.setAcceptInvalidCertificate(true);
	op.executeRequest(req, (JkHttpClientCustomWebClientMyHTTPClientListener.NEW().setListener(callback)));
	op.closeConnection(null);
};

JkHttpClientCustomWebClient.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpClientCustomWebClient"] === true;
};

let JkHttpClientHTTPClientResponse = function() {
	this.httpVersion = null;
	this.httpStatus = null;
	this.httpStatusDescription = null;
	this.rawHeaders = null;
	this.headers = null;
};

JkHttpClientHTTPClientResponse.prototype._t = {
	"JkHttpClientHTTPClientResponse" : true,
	"JkLangStringObject" : true
};
JkHttpClientHTTPClientResponse.prototype._tobj = JkHttpClientHTTPClientResponse;

JkHttpClientHTTPClientResponse.NEW = function() {
	var v = new JkHttpClientHTTPClientResponse;
	return v.CTOR_JkHttpClientHTTPClientResponse();
};

JkHttpClientHTTPClientResponse.prototype.CTOR_JkHttpClientHTTPClientResponse = function() {
	this.headers = null;
	this.rawHeaders = null;
	this.httpStatusDescription = null;
	this.httpStatus = null;
	this.httpVersion = null;
	return this;
};

JkHttpClientHTTPClientResponse.prototype.addHeader = function(key, value) {
	if(this.rawHeaders == null) {
		this.rawHeaders = JkLangKeyValueListForStrings.NEW();
	}
	if(this.headers == null) {
		this.headers = new Map;
	}
	this.rawHeaders.add(key, value);
	this.headers.set((JkLangString.toLowerCase(key)), value);
};

JkHttpClientHTTPClientResponse.prototype.getHeader = function(key) {
	if(!(this.headers != null)) {
		return null;
	}
	return JkLangMap.get(this.headers, key);
};

JkHttpClientHTTPClientResponse.prototype.toString = function() {
	return JkLangString.asString(this.rawHeaders);
};

JkHttpClientHTTPClientResponse.prototype.getHttpVersion = function() {
	return this.httpVersion;
};

JkHttpClientHTTPClientResponse.prototype.setHttpVersion = function(v) {
	this.httpVersion = v;
	return this;
};

JkHttpClientHTTPClientResponse.prototype.getHttpStatus = function() {
	return this.httpStatus;
};

JkHttpClientHTTPClientResponse.prototype.setHttpStatus = function(v) {
	this.httpStatus = v;
	return this;
};

JkHttpClientHTTPClientResponse.prototype.getHttpStatusDescription = function() {
	return this.httpStatusDescription;
};

JkHttpClientHTTPClientResponse.prototype.setHttpStatusDescription = function(v) {
	this.httpStatusDescription = v;
	return this;
};

JkHttpClientHTTPClientResponse.prototype.getRawHeaders = function() {
	return this.rawHeaders;
};

JkHttpClientHTTPClientResponse.prototype.setRawHeaders = function(v) {
	this.rawHeaders = v;
	return this;
};

JkHttpClientHTTPClientResponse.prototype.getHeaders = function() {
	return this.headers;
};

JkHttpClientHTTPClientResponse.prototype.setHeaders = function(v) {
	this.headers = v;
	return this;
};

JkHttpClientHTTPClientResponse.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpClientHTTPClientResponse"] === true;
};

let JkHttpClientHTTPClientRequest = function() {
	this.method = null;
	this.protocol = null;
	this.username = null;
	this.password = null;
	this.serverAddress = null;
	this.serverPort = 0;
	this.requestPath = null;
	this.body = null;
	this.queryParams = null;
	this.rawHeaders = null;
	this.headers = null;
};

JkHttpClientHTTPClientRequest.prototype._t = {
	"JkLangStringObject" : true,
	"JkHttpClientHTTPClientRequest" : true
};
JkHttpClientHTTPClientRequest.prototype._tobj = JkHttpClientHTTPClientRequest;

JkHttpClientHTTPClientRequest.NEW = function() {
	var v = new JkHttpClientHTTPClientRequest;
	return v.CTOR_JkHttpClientHTTPClientRequest();
};

JkHttpClientHTTPClientRequest.prototype.CTOR_JkHttpClientHTTPClientRequest = function() {
	this.headers = null;
	this.rawHeaders = null;
	this.queryParams = null;
	this.body = null;
	this.requestPath = null;
	this.serverPort = 0;
	this.serverAddress = null;
	this.password = null;
	this.username = null;
	this.protocol = null;
	this.method = null;
	this.protocol = "http";
	this.serverPort = 80;
	this.requestPath = "/";
	this.method = "GET";
	return this;
};

JkHttpClientHTTPClientRequest.forGET = function(url) {
	var v = JkHttpClientHTTPClientRequest.NEW();
	v.setMethod("GET");
	v.setUrl(url);
	return v;
};

JkHttpClientHTTPClientRequest.forPOST1 = function(url, mimeType, data) {
	var v = JkHttpClientHTTPClientRequest.NEW();
	v.setMethod("POST");
	v.setUrl(url);
	if(JkLangString.isEmpty(mimeType) == false) {
		v.addHeader("Content-Type", mimeType);
	}
	if(data != null) {
		v.setBody(data);
	}
	return v;
};

JkHttpClientHTTPClientRequest.forPOST2 = function(url, file) {
	if(!(url != null)) {
		return null;
	}
	if(!(file != null)) {
		return null;
	}
	var reader = file.read();
	if(!(reader != null)) {
		return null;
	}
	return JkHttpClientHTTPClientRequest.forPOST1(url, (JkMimeMimeTypeRegistry.getSharedInstance().getTypeForFile(file)), reader);
};

JkHttpClientHTTPClientRequest.forPOST3 = function(url, mimeType, data) {
	var v = JkHttpClientHTTPClientRequest.NEW();
	v.setMethod("POST");
	v.setUrl(url);
	if(JkLangString.isEmpty(mimeType) == false) {
		v.addHeader("Content-Type", mimeType);
	}
	if(data != null) {
		v.setBody((JkIoBufferReader.forBuffer(data)));
	}
	return v;
};

JkHttpClientHTTPClientRequest.forPUT1 = function(url, mimeType, data) {
	var v = JkHttpClientHTTPClientRequest.NEW();
	v.setMethod("PUT");
	v.setUrl(url);
	if(JkLangString.isEmpty(mimeType) == false) {
		v.addHeader("Content-Type", mimeType);
	}
	if(data != null) {
		v.setBody(data);
	}
	return v;
};

JkHttpClientHTTPClientRequest.forPUT2 = function(url, file) {
	if(!(url != null)) {
		return null;
	}
	if(!(file != null)) {
		return null;
	}
	var reader = file.read();
	if(!(reader != null)) {
		return null;
	}
	return JkHttpClientHTTPClientRequest.forPUT1(url, (JkMimeMimeTypeRegistry.getSharedInstance().getTypeForFile(file)), reader);
};

JkHttpClientHTTPClientRequest.forPUT3 = function(url, mimeType, data) {
	var v = JkHttpClientHTTPClientRequest.NEW();
	v.setMethod("PUT");
	v.setUrl(url);
	if(JkLangString.isEmpty(mimeType) == false) {
		v.addHeader("Content-Type", mimeType);
	}
	if(data != null) {
		v.setBody((JkIoBufferReader.forBuffer(data)));
	}
	return v;
};

JkHttpClientHTTPClientRequest.forDELETE = function(url) {
	var v = JkHttpClientHTTPClientRequest.NEW();
	v.setMethod("DELETE");
	v.setUrl(url);
	return v;
};

JkHttpClientHTTPClientRequest.prototype.setUrl = function(url) {
	var uu = JkUrlURL.forString(url, false);
	this.setProtocol((uu.getScheme()));
	this.setUsername((uu.getUsername()));
	this.setPassword((uu.getPassword()));
	this.setServerAddress((uu.getHost()));
	var pp = JkLangString.toInteger((uu.getPort()));
	if(pp < 1) {
		if(this.protocol == "https") {
			pp = 443;
		}
		else if(this.protocol == "http") {
			pp = 80;
		}
	}
	this.setServerPort(pp);
	this.setRequestPath((uu.getPath()));
	this.queryParams = uu.getRawQueryParameters();
};

JkHttpClientHTTPClientRequest.prototype.addHeader = function(key, value) {
	if(this.rawHeaders == null) {
		this.rawHeaders = JkLangKeyValueListForStrings.NEW();
	}
	if(this.headers == null) {
		this.headers = new Map;
	}
	this.rawHeaders.add(key, value);
	this.headers.set((JkLangString.toLowerCase(key)), value);
};

JkHttpClientHTTPClientRequest.prototype.addQueryParameter = function(key, value) {
	if(this.queryParams == null) {
		this.queryParams = JkLangKeyValueList.NEW();
	}
	this.queryParams.add(key, value);
};

JkHttpClientHTTPClientRequest.prototype.getHeader = function(key) {
	if(!(this.headers != null)) {
		return null;
	}
	return JkLangMap.get(this.headers, key);
};

JkHttpClientHTTPClientRequest.prototype.setUserAgent = function(agent) {
	this.addHeader("User-Agent", agent);
};

JkHttpClientHTTPClientRequest.prototype.getUrl = function() {
	var sb = JkLangStringBuilder.NEW();
	sb.appendString(this.protocol);
	sb.appendString("://");
	sb.appendString(this.serverAddress);
	if(this.serverPort == 80 && this.protocol == "http") {
		;
	}
	else if(this.serverPort == 443 && this.protocol == "https") {
		;
	}
	else {
		sb.appendCharacter(':'.charCodeAt());
		sb.appendString((JkLangString.forInteger(this.serverPort)));
	}
	var path = this.getRequestPath();
	if(JkLangString.isEmpty(path)) {
		path = "/";
	}
	sb.appendString(path);
	return sb.toString();
};

JkHttpClientHTTPClientRequest.prototype.toString1 = function(defaultUserAgent) {
	var rq = JkLangStringBuilder.NEW();
	var body = this.getBody();
	var path = this.getRequestPath();
	if(JkLangString.isEmpty(path)) {
		path = "/";
	}
	rq.appendString((this.getMethod()));
	rq.appendCharacter(' '.charCodeAt());
	rq.appendString(path);
	var first = true;
	if(this.queryParams != null) {
		var it = this.queryParams.iterate();
		while(it != null){
			var kv = it.next();
			if(kv == null) {
				break;
			}
			if(first) {
				rq.appendCharacter('?'.charCodeAt());
				first = false;
			}
			else {
				rq.appendCharacter('&'.charCodeAt());
			}
			rq.appendString(kv.key);
			var val = kv.value;
			if(val != null) {
				rq.appendCharacter('='.charCodeAt());
				rq.appendString((JkUrlURLEncoder.encode(val, false, false)));
			}
		}
	}
	rq.appendCharacter(' '.charCodeAt());
	rq.appendString("HTTP/1.1\r\n");
	var hasUserAgent = false;
	var hasHost = false;
	var hasContentLength = false;
	if(this.rawHeaders != null) {
		var it1 = this.rawHeaders.iterate();
		while(true){
			var kvp = it1.next();
			if(kvp == null) {
				break;
			}
			var key = kvp.key;
			if(JkLangString.equalsIgnoreCase(key, "user-agent")) {
				hasUserAgent = true;
			}
			else if(JkLangString.equalsIgnoreCase(key, "host")) {
				hasHost = true;
			}
			else if(JkLangString.equalsIgnoreCase(key, "content-length")) {
				hasContentLength = true;
			}
			rq.appendString(key);
			rq.appendString(": ");
			rq.appendString(kvp.value);
			rq.appendString("\r\n");
		}
	}
	if(hasUserAgent == false && defaultUserAgent != null) {
		rq.appendString("User-Agent: ");
		rq.appendString(defaultUserAgent);
		rq.appendString("\r\n");
	}
	if(hasHost == false) {
		rq.appendString("Host: " + (JkLangString.safeString((this.getServerAddress()))) + ("\r\n"));
	}
	if(body != null && hasContentLength == false) {
		var bs = body.getSize();
		var bss = JkLangString.forInteger(bs);
		rq.appendString("Content-Length: " + (JkLangString.safeString(bss)) + ("\r\n"));
	}
	rq.appendString("\r\n");
	return rq.toString();
};

JkHttpClientHTTPClientRequest.prototype.toString = function() {
	return this.toString1(null);
};

JkHttpClientHTTPClientRequest.prototype.getMethod = function() {
	return this.method;
};

JkHttpClientHTTPClientRequest.prototype.setMethod = function(v) {
	this.method = v;
	return this;
};

JkHttpClientHTTPClientRequest.prototype.getProtocol = function() {
	return this.protocol;
};

JkHttpClientHTTPClientRequest.prototype.setProtocol = function(v) {
	this.protocol = v;
	return this;
};

JkHttpClientHTTPClientRequest.prototype.getUsername = function() {
	return this.username;
};

JkHttpClientHTTPClientRequest.prototype.setUsername = function(v) {
	this.username = v;
	return this;
};

JkHttpClientHTTPClientRequest.prototype.getPassword = function() {
	return this.password;
};

JkHttpClientHTTPClientRequest.prototype.setPassword = function(v) {
	this.password = v;
	return this;
};

JkHttpClientHTTPClientRequest.prototype.getServerAddress = function() {
	return this.serverAddress;
};

JkHttpClientHTTPClientRequest.prototype.setServerAddress = function(v) {
	this.serverAddress = v;
	return this;
};

JkHttpClientHTTPClientRequest.prototype.getServerPort = function() {
	return this.serverPort;
};

JkHttpClientHTTPClientRequest.prototype.setServerPort = function(v) {
	this.serverPort = v;
	return this;
};

JkHttpClientHTTPClientRequest.prototype.getRequestPath = function() {
	return this.requestPath;
};

JkHttpClientHTTPClientRequest.prototype.setRequestPath = function(v) {
	this.requestPath = v;
	return this;
};

JkHttpClientHTTPClientRequest.prototype.getBody = function() {
	return this.body;
};

JkHttpClientHTTPClientRequest.prototype.setBody = function(v) {
	this.body = v;
	return this;
};

JkHttpClientHTTPClientRequest.prototype.getRawHeaders = function() {
	return this.rawHeaders;
};

JkHttpClientHTTPClientRequest.prototype.setRawHeaders = function(v) {
	this.rawHeaders = v;
	return this;
};

JkHttpClientHTTPClientRequest.prototype.getHeaders = function() {
	return this.headers;
};

JkHttpClientHTTPClientRequest.prototype.setHeaders = function(v) {
	this.headers = v;
	return this;
};

JkHttpClientHTTPClientRequest.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpClientHTTPClientRequest"] === true;
};

let JkHttpClientWebRequestMyHTTPClientListener = function() {
	JkHttpClientHTTPClientListener.call(this);
	this.response = null;
	this.body = null;
};

JkHttpClientWebRequestMyHTTPClientListener.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkHttpClientHTTPClientListener.prototype);
JkHttpClientWebRequestMyHTTPClientListener.prototype.constructor = JkHttpClientWebRequestMyHTTPClientListener;
JkHttpClientWebRequestMyHTTPClientListener.prototype._t = {
	"JkHttpClientWebRequestMyHTTPClientListener" : true,
	"JkHttpClientHTTPClientListener" : true
};
JkHttpClientWebRequestMyHTTPClientListener.prototype._tobj = JkHttpClientWebRequestMyHTTPClientListener;

JkHttpClientWebRequestMyHTTPClientListener.NEW = function() {
	var v = new JkHttpClientWebRequestMyHTTPClientListener;
	return v.CTOR_JkHttpClientWebRequestMyHTTPClientListener();
};

JkHttpClientWebRequestMyHTTPClientListener.prototype.CTOR_JkHttpClientWebRequestMyHTTPClientListener = function() {
	this.body = null;
	this.response = null;
	if(JkHttpClientHTTPClientListener.prototype.CTOR_JkHttpClientHTTPClientListener.call(this) == null) {
		return null;
	}
	return this;
};

JkHttpClientWebRequestMyHTTPClientListener.prototype.onError = function(message) {
	JkLangError._throw("httpRequestError", message);
};

JkHttpClientWebRequestMyHTTPClientListener.prototype.onAborted = function() {
	JkLangError._throw("httpRequestError", "aborted");
};

JkHttpClientWebRequestMyHTTPClientListener.prototype.onDataReceived = function(buffer) {
	this.body = JkLangBuffer.append(this.body, buffer, (-1));
	return true;
};

JkHttpClientWebRequestMyHTTPClientListener.prototype.onResponseReceived = function(response) {
	if(!(response != null)) {
		return false;
	}
	this.response = response;
	return true;
};

JkHttpClientWebRequestMyHTTPClientListener.prototype.getResponse = function() {
	return this.response;
};

JkHttpClientWebRequestMyHTTPClientListener.prototype.setResponse = function(v) {
	this.response = v;
	return this;
};

JkHttpClientWebRequestMyHTTPClientListener.prototype.getBody = function() {
	return this.body;
};

JkHttpClientWebRequestMyHTTPClientListener.prototype.setBody = function(v) {
	this.body = v;
	return this;
};

JkHttpClientWebRequestMyHTTPClientListener.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpClientWebRequestMyHTTPClientListener"] === true;
};

let JkHttpClientWebRequestResponse = function() {
	this.httpStatus = null;
	this.httpStatusDescription = null;
	this.headers = null;
	this.body = null;
	this.bodyAsString = null;
	this.bodyAsDynamicMap = null;
};

JkHttpClientWebRequestResponse.prototype._t = { "JkHttpClientWebRequestResponse" : true };
JkHttpClientWebRequestResponse.prototype._tobj = JkHttpClientWebRequestResponse;

JkHttpClientWebRequestResponse.NEW = function() {
	var v = new JkHttpClientWebRequestResponse;
	return v.CTOR_JkHttpClientWebRequestResponse();
};

JkHttpClientWebRequestResponse.prototype.CTOR_JkHttpClientWebRequestResponse = function() {
	this.bodyAsDynamicMap = null;
	this.bodyAsString = null;
	this.body = null;
	this.headers = null;
	this.httpStatusDescription = null;
	this.httpStatus = null;
	return this;
};

JkHttpClientWebRequestResponse.prototype.getHeaderValue = function(key) {
	if(!(this.headers != null)) {
		return null;
	}
	if(!(key != null)) {
		return null;
	}
	var it = this.headers.iterate();
	while(it != null){
		var ee = it.next();
		if(!(ee != null)) {
			break;
		}
		if(JkLangString.equalsIgnoreCase(ee.key, key)) {
			return ee.value;
		}
	}
	return null;
};

JkHttpClientWebRequestResponse.prototype.getBodyAsBuffer = function() {
	if(!(this.body != null)) {
		JkLangError._throw("httpRequestError", "noBody");
	}
	return this.body;
};

JkHttpClientWebRequestResponse.prototype.getBodyAsString = function() {
	if(this.bodyAsString != null) {
		return this.bodyAsString;
	}
	var v = JkLangString.forUTF8Buffer((this.getBodyAsBuffer()));
	if(!(v != null)) {
		JkLangError._throw("httpRequestError", "notString");
	}
	this.bodyAsString = v;
	return v;
};

JkHttpClientWebRequestResponse.prototype.getBodyAsDynamicMap = function() {
	if(this.bodyAsDynamicMap != null) {
		return this.bodyAsDynamicMap;
	}
	var v = (function(o) {
		if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((JkJsonJSONParser.parseBuffer((this.getBodyAsBuffer()))));
	if(!(v != null)) {
		JkLangError._throw("httpRequestError", "notJsonMap");
	}
	this.bodyAsDynamicMap = v;
	return v;
};

JkHttpClientWebRequestResponse.prototype.getHttpStatus = function() {
	return this.httpStatus;
};

JkHttpClientWebRequestResponse.prototype.setHttpStatus = function(v) {
	this.httpStatus = v;
	return this;
};

JkHttpClientWebRequestResponse.prototype.getHttpStatusDescription = function() {
	return this.httpStatusDescription;
};

JkHttpClientWebRequestResponse.prototype.setHttpStatusDescription = function(v) {
	this.httpStatusDescription = v;
	return this;
};

JkHttpClientWebRequestResponse.prototype.getHeaders = function() {
	return this.headers;
};

JkHttpClientWebRequestResponse.prototype.setHeaders = function(v) {
	this.headers = v;
	return this;
};

JkHttpClientWebRequestResponse.prototype.getBody = function() {
	return this.body;
};

JkHttpClientWebRequestResponse.prototype.setBody = function(v) {
	this.body = v;
	return this;
};

JkHttpClientWebRequestResponse.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpClientWebRequestResponse"] === true;
};

let JkHttpClientWebRequest = function() {};

JkHttpClientWebRequest.prototype._t = { "JkHttpClientWebRequest" : true };
JkHttpClientWebRequest.prototype._tobj = JkHttpClientWebRequest;

JkHttpClientWebRequest.NEW = function() {
	var v = new JkHttpClientWebRequest;
	return v.CTOR_JkHttpClientWebRequest();
};

JkHttpClientWebRequest.prototype.CTOR_JkHttpClientWebRequest = function() {
	return this;
};

JkHttpClientWebRequest.execute = function(method, url, headers, body) {
	var req = JkHttpClientHTTPClientRequest.NEW();
	req.setMethod(method);
	req.setUrl(url);
	if(headers != null) {
		var it = headers.iterate();
		while(it != null){
			var pair = it.next();
			if(!(pair != null)) {
				break;
			}
			req.addHeader(pair.key, pair.value);
		}
	}
	req.setBody((JkIoBufferReader.forBuffer(body)));
	var op = JkHttpClientHTTPClientOperation.NEW();
	var listener = JkHttpClientWebRequestMyHTTPClientListener.NEW();
	op.executeRequest(req, listener);
	op.closeConnection(null);
	var hresp = listener.getResponse();
	if(!(hresp != null)) {
		JkLangError._throw("httpRequestError", "noResponse");
	}
	var b = listener.getBody();
	var v = JkHttpClientWebRequestResponse.NEW();
	v.setHttpStatus((hresp.getHttpStatus()));
	v.setHttpStatusDescription((hresp.getHttpStatusDescription()));
	v.setHeaders((hresp.getRawHeaders()));
	v.setBody(b);
	return v;
};

JkHttpClientWebRequest.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpClientWebRequest"] === true;
};

let JkHttpClientCustomWebClientMyHTTPClientListener = function() {
	JkHttpClientHTTPClientListener.call(this);
	this.listener = null;
	this.response = null;
	this.body = null;
};

JkHttpClientCustomWebClientMyHTTPClientListener.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkHttpClientHTTPClientListener.prototype);
JkHttpClientCustomWebClientMyHTTPClientListener.prototype.constructor = JkHttpClientCustomWebClientMyHTTPClientListener;
JkHttpClientCustomWebClientMyHTTPClientListener.prototype._t = {
	"JkHttpClientCustomWebClientMyHTTPClientListener" : true,
	"JkHttpClientHTTPClientListener" : true
};
JkHttpClientCustomWebClientMyHTTPClientListener.prototype._tobj = JkHttpClientCustomWebClientMyHTTPClientListener;

JkHttpClientCustomWebClientMyHTTPClientListener.NEW = function() {
	var v = new JkHttpClientCustomWebClientMyHTTPClientListener;
	return v.CTOR_JkHttpClientCustomWebClientMyHTTPClientListener();
};

JkHttpClientCustomWebClientMyHTTPClientListener.prototype.CTOR_JkHttpClientCustomWebClientMyHTTPClientListener = function() {
	this.body = null;
	this.response = null;
	this.listener = null;
	if(JkHttpClientHTTPClientListener.prototype.CTOR_JkHttpClientHTTPClientListener.call(this) == null) {
		return null;
	}
	return this;
};

JkHttpClientCustomWebClientMyHTTPClientListener.prototype.onError = function(message) {
	if(this.listener != null) {
		this.listener(null, null, (JkLangString.toUTF8Buffer(message)));
	}
};

JkHttpClientCustomWebClientMyHTTPClientListener.prototype.onAborted = function() {
	if(this.listener != null) {
		this.listener(null, null, (JkLangString.toUTF8Buffer("aborted")));
	}
};

JkHttpClientCustomWebClientMyHTTPClientListener.prototype.onDataReceived = function(buffer) {
	this.body = JkLangBuffer.append(this.body, buffer, (-1));
	return true;
};

JkHttpClientCustomWebClientMyHTTPClientListener.prototype.onResponseReceived = function(response) {
	if(!(response != null)) {
		return false;
	}
	this.response = response;
	return true;
};

JkHttpClientCustomWebClientMyHTTPClientListener.prototype.onResponseCompleted = function() {
	JkHttpClientHTTPClientListener.prototype.onResponseCompleted.call(this);
	if(this.listener != null) {
		this.listener((this.response.getHttpStatus()), (this.response.getRawHeaders()), this.body);
	}
};

JkHttpClientCustomWebClientMyHTTPClientListener.prototype.getListener = function() {
	return this.listener;
};

JkHttpClientCustomWebClientMyHTTPClientListener.prototype.setListener = function(v) {
	this.listener = v;
	return this;
};

JkHttpClientCustomWebClientMyHTTPClientListener.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpClientCustomWebClientMyHTTPClientListener"] === true;
};

let JkHttpClientHTTPClientOperationMyResponseParserChunk = function() {
	this.data = null;
	this.completed = true;
};

JkHttpClientHTTPClientOperationMyResponseParserChunk.prototype._t = { "JkHttpClientHTTPClientOperationMyResponseParserChunk" : true };
JkHttpClientHTTPClientOperationMyResponseParserChunk.prototype._tobj = JkHttpClientHTTPClientOperationMyResponseParserChunk;

JkHttpClientHTTPClientOperationMyResponseParserChunk.NEW = function() {
	var v = new JkHttpClientHTTPClientOperationMyResponseParserChunk;
	return v.CTOR_JkHttpClientHTTPClientOperationMyResponseParserChunk();
};

JkHttpClientHTTPClientOperationMyResponseParserChunk.prototype.CTOR_JkHttpClientHTTPClientOperationMyResponseParserChunk = function() {
	this.completed = true;
	this.data = null;
	return this;
};

JkHttpClientHTTPClientOperationMyResponseParserChunk.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpClientHTTPClientOperationMyResponseParserChunk"] === true;
};

let JkHttpClientHTTPClientOperationMyResponseParser = function() {
	this.receivedData = null;
	this.headers = null;
	this.isChunked = false;
	this.isStream = false;
	this.contentLength = 0;
	this.dataCounter = 0;
	this.listener = null;
	this.endOfResponse = false;
	this.aborted = false;
};

JkHttpClientHTTPClientOperationMyResponseParser.prototype._t = { "JkHttpClientHTTPClientOperationMyResponseParser" : true };
JkHttpClientHTTPClientOperationMyResponseParser.prototype._tobj = JkHttpClientHTTPClientOperationMyResponseParser;

JkHttpClientHTTPClientOperationMyResponseParser.NEW = function() {
	var v = new JkHttpClientHTTPClientOperationMyResponseParser;
	return v.CTOR_JkHttpClientHTTPClientOperationMyResponseParser();
};

JkHttpClientHTTPClientOperationMyResponseParser.prototype.CTOR_JkHttpClientHTTPClientOperationMyResponseParser = function() {
	this.aborted = false;
	this.endOfResponse = false;
	this.listener = null;
	this.dataCounter = 0;
	this.contentLength = 0;
	this.isStream = false;
	this.isChunked = false;
	this.headers = null;
	this.receivedData = null;
	return this;
};

JkHttpClientHTTPClientOperationMyResponseParser.prototype.reset = function() {
	this.isChunked = false;
	this.isStream = false;
	this.headers = null;
	this.contentLength = 0;
	this.dataCounter = 0;
	this.endOfResponse = false;
	this.aborted = false;
};

JkHttpClientHTTPClientOperationMyResponseParser.prototype.hasEndOfHeaders = function(buf, size) {
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

JkHttpClientHTTPClientOperationMyResponseParser.prototype.parseResponse = function(buf) {
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
			v = JkHttpClientHTTPClientResponse.NEW();
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
	if(this.contentLength < 1 && (JkLangString.equalsIgnoreCase((v.getHeader("connection")), "close") || JkLangString.equalsIgnoreCase((v.getHttpVersion()), "HTTP/1.0"))) {
		this.isStream = true;
	}
	return v;
};

JkHttpClientHTTPClientOperationMyResponseParser.prototype.getChunk = function() {
	var i = 0;
	var sb = JkLangStringBuilder.NEW();
	while(true){
		if(this.receivedData == null || this.receivedData.byteLength <= i) {
			var chunk = JkHttpClientHTTPClientOperationMyResponseParserChunk.NEW();
			chunk.completed = false;
			return chunk;
		}
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
	var chunk1 = JkHttpClientHTTPClientOperationMyResponseParserChunk.NEW();
	if(cl > 0) {
		if(JkLangBuffer.getSize(this.receivedData) - i < cl + 2) {
			chunk1.completed = false;
			return chunk1;
		}
		chunk1.data = new ArrayBuffer(cl);
		JkLangBuffer.copyFrom(chunk1.data, this.receivedData, i, 0, cl);
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
	return chunk1;
};

JkHttpClientHTTPClientOperationMyResponseParser.prototype.onDataReceived = function(buf, size) {
	if(size > 0) {
		this.receivedData = JkLangBuffer.append(this.receivedData, buf, size);
	}
	if(!(this.headers != null)) {
		if(this.hasEndOfHeaders(this.receivedData, (JkLangBuffer.getSize(this.receivedData)))) {
			this.headers = this.parseResponse(this.receivedData);
			if(this.headers != null) {
				this.onHeadersReceived(this.headers);
			}
		}
		else {
			return;
		}
	}
	if(this.isChunked) {
		while(true){
			var r = this.getChunk();
			if(r != null) {
				if(!r.completed) {
					break;
				}
				if(!(r.data != null)) {
					this.reset();
					this.onEndOfResponse();
					break;
				}
				var sz = ~(~JkLangBuffer.getSize(r.data));
				this.dataCounter += sz;
				this.onBodyDataReceived(r.data, sz);
			}
			else {
				this.reset();
				this.onEndOfResponse();
				break;
			}
			if(this.receivedData == null) {
				break;
			}
		}
	}
	else if(this.isStream) {
		var sz1 = ~(~JkLangBuffer.getSize(this.receivedData));
		if(sz1 > 0) {
			var v = this.receivedData;
			this.receivedData = null;
			this.dataCounter += sz1;
			this.onBodyDataReceived(v, sz1);
		}
	}
	else if(this.contentLength > 0) {
		var rsz = ~(~JkLangBuffer.getSize(this.receivedData));
		if(rsz > 0) {
			if(this.contentLength <= 0 || this.dataCounter + rsz <= this.contentLength) {
				var v1 = this.receivedData;
				this.receivedData = null;
				this.dataCounter += rsz;
				this.onBodyDataReceived(v1, rsz);
			}
			else {
				var vsz = this.contentLength - this.dataCounter;
				var v2 = JkLangBuffer.getSubBuffer(this.receivedData, 0, vsz, false);
				this.receivedData = JkLangBuffer.getSubBuffer(this.receivedData, vsz, (rsz - vsz), false);
				this.dataCounter += vsz;
				this.onBodyDataReceived(v2, vsz);
			}
		}
		if(this.dataCounter >= this.contentLength) {
			this.reset();
			this.onEndOfResponse();
		}
	}
	else {
		this.reset();
		this.onEndOfResponse();
	}
};

JkHttpClientHTTPClientOperationMyResponseParser.prototype.onHeadersReceived = function(headers) {
	if(this.listener != null && this.listener.onResponseReceived(headers) == false) {
		if(this.listener != null) {
			this.listener.onAborted();
		}
		this.aborted = true;
	}
};

JkHttpClientHTTPClientOperationMyResponseParser.prototype.onBodyDataReceived = function(buffer, size) {
	if(this.listener != null && this.listener.onDataReceived(buffer) == false) {
		if(this.listener != null) {
			this.listener.onAborted();
		}
		this.aborted = true;
	}
};

JkHttpClientHTTPClientOperationMyResponseParser.prototype.onEndOfResponse = function() {
	if(this.listener != null) {
		this.listener.onResponseCompleted();
	}
	this.endOfResponse = true;
};

JkHttpClientHTTPClientOperationMyResponseParser.prototype.getListener = function() {
	return this.listener;
};

JkHttpClientHTTPClientOperationMyResponseParser.prototype.setListener = function(v) {
	this.listener = v;
	return this;
};

JkHttpClientHTTPClientOperationMyResponseParser.prototype.getEndOfResponse = function() {
	return this.endOfResponse;
};

JkHttpClientHTTPClientOperationMyResponseParser.prototype.setEndOfResponse = function(v) {
	this.endOfResponse = v;
	return this;
};

JkHttpClientHTTPClientOperationMyResponseParser.prototype.getAborted = function() {
	return this.aborted;
};

JkHttpClientHTTPClientOperationMyResponseParser.prototype.setAborted = function(v) {
	this.aborted = v;
	return this;
};

JkHttpClientHTTPClientOperationMyResponseParser.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpClientHTTPClientOperationMyResponseParser"] === true;
};

let JkHttpClientHTTPClient = function() {};

JkHttpClientHTTPClient.prototype._t = { "JkHttpClientHTTPClient" : true };
JkHttpClientHTTPClient.prototype._tobj = JkHttpClientHTTPClient;

JkHttpClientHTTPClient.NEW = function() {
	var v = new JkHttpClientHTTPClient;
	return v.CTOR_JkHttpClientHTTPClient();
};

JkHttpClientHTTPClient.prototype.CTOR_JkHttpClientHTTPClient = function() {
	return this;
};

JkHttpClientHTTPClient.createDefault = function() {
	return JkHttpClientHTTPClientOperation.NEW();
};

JkHttpClientHTTPClient.execute1 = function(client, request, listener) {
	if(!(client != null)) {
		return;
	}
	client.executeRequest(request, listener);
};

JkHttpClientHTTPClient.execute2 = function(ctx, client, request, listener, errorHandler) {
	var ll = JkHttpClientHTTPClientMyListener.NEW();
	ll.setCtx(ctx);
	ll.setErrorHandler(errorHandler);
	JkHttpClientHTTPClient.execute1(client, request, ll);
	if(listener != null) {
		listener((ll.getResponse()));
	}
};

JkHttpClientHTTPClient.executeForBuffer = function(ctx, client, request, listener, errorHandler) {
	var ll = JkHttpClientHTTPClientMyListener.NEW();
	ll.setCtx(ctx);
	ll.setErrorHandler(errorHandler);
	JkHttpClientHTTPClient.execute1(client, request, ll);
	if(listener != null) {
		listener((ll.getResponse()), (ll.getBuffer()));
	}
};

JkHttpClientHTTPClient.executeForString = function(ctx, client, request, listener, errorHandler) {
	var ll = JkHttpClientHTTPClientMyListener.NEW();
	ll.setCtx(ctx);
	ll.setErrorHandler(errorHandler);
	JkHttpClientHTTPClient.execute1(client, request, ll);
	if(listener != null) {
		listener((ll.getResponse()), (JkLangString.forUTF8Buffer((ll.getBuffer()))));
	}
};

JkHttpClientHTTPClient.prototype.executeRequest = function(request, listener) {};

JkHttpClientHTTPClient.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpClientHTTPClient"] === true;
};

let JkHttpClientHTTPClientMyListener = function() {
	JkHttpClientHTTPClientListener.call(this);
	this.response = null;
	this.buffer = null;
	this.errorHandler = null;
	this.ctx = null;
};

JkHttpClientHTTPClientMyListener.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkHttpClientHTTPClientListener.prototype);
JkHttpClientHTTPClientMyListener.prototype.constructor = JkHttpClientHTTPClientMyListener;
JkHttpClientHTTPClientMyListener.prototype._t = {
	"JkHttpClientHTTPClientMyListener" : true,
	"JkHttpClientHTTPClientListener" : true
};
JkHttpClientHTTPClientMyListener.prototype._tobj = JkHttpClientHTTPClientMyListener;

JkHttpClientHTTPClientMyListener.NEW = function() {
	var v = new JkHttpClientHTTPClientMyListener;
	return v.CTOR_JkHttpClientHTTPClientMyListener();
};

JkHttpClientHTTPClientMyListener.prototype.CTOR_JkHttpClientHTTPClientMyListener = function() {
	this.ctx = null;
	this.errorHandler = null;
	this.buffer = null;
	this.response = null;
	if(JkHttpClientHTTPClientListener.prototype.CTOR_JkHttpClientHTTPClientListener.call(this) == null) {
		return null;
	}
	return this;
};

JkHttpClientHTTPClientMyListener.prototype.onResponseReceived = function(response) {
	this.response = response;
	return true;
};

JkHttpClientHTTPClientMyListener.prototype.onDataReceived = function(buffer) {
	this.buffer = JkLangBuffer.append(this.buffer, buffer, (-1));
	return true;
};

JkHttpClientHTTPClientMyListener.prototype.onAborted = function() {
};

JkHttpClientHTTPClientMyListener.prototype.onStatus = function(message) {
	if(message != null) {
		JkLogLog.debug(this.ctx, message);
	}
};

JkHttpClientHTTPClientMyListener.prototype.onError = function(message) {
	JkLogLog.error(this.ctx, message);
	if(this.errorHandler != null) {
		this.errorHandler(message);
	}
};

JkHttpClientHTTPClientMyListener.prototype.onResponseCompleted = function() {
};

JkHttpClientHTTPClientMyListener.prototype.getResponse = function() {
	return this.response;
};

JkHttpClientHTTPClientMyListener.prototype.setResponse = function(v) {
	this.response = v;
	return this;
};

JkHttpClientHTTPClientMyListener.prototype.getBuffer = function() {
	return this.buffer;
};

JkHttpClientHTTPClientMyListener.prototype.setBuffer = function(v) {
	this.buffer = v;
	return this;
};

JkHttpClientHTTPClientMyListener.prototype.getErrorHandler = function() {
	return this.errorHandler;
};

JkHttpClientHTTPClientMyListener.prototype.setErrorHandler = function(v) {
	this.errorHandler = v;
	return this;
};

JkHttpClientHTTPClientMyListener.prototype.getCtx = function() {
	return this.ctx;
};

JkHttpClientHTTPClientMyListener.prototype.setCtx = function(v) {
	this.ctx = v;
	return this;
};

JkHttpClientHTTPClientMyListener.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpClientHTTPClientMyListener"] === true;
};

let JkHttpClientHTTPClientOperation = function() {
	JkHttpClientHTTPClient.call(this);
	this.openSocket = null;
	this.openSocketProtocol = null;
	this.openSocketAddress = null;
	this.openSocketPort = 0;
	this.defaultUserAgent = null;
	this.parser = null;
	this.receiveBuffer = null;
	this.acceptInvalidCertificate = false;
};

JkHttpClientHTTPClientOperation.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkHttpClientHTTPClient.prototype);
JkHttpClientHTTPClientOperation.prototype.constructor = JkHttpClientHTTPClientOperation;
JkHttpClientHTTPClientOperation.prototype._t = {
	"JkHttpClientHTTPClient" : true,
	"JkHttpClientHTTPClientOperation" : true
};
JkHttpClientHTTPClientOperation.prototype._tobj = JkHttpClientHTTPClientOperation;

JkHttpClientHTTPClientOperation.NEW = function() {
	var v = new JkHttpClientHTTPClientOperation;
	return v.CTOR_JkHttpClientHTTPClientOperation();
};

JkHttpClientHTTPClientOperation.prototype.CTOR_JkHttpClientHTTPClientOperation = function() {
	if(JkHttpClientHTTPClient.prototype.CTOR_JkHttpClientHTTPClient.call(this) == null) {
		return null;
	}
	this.acceptInvalidCertificate = false;
	this.receiveBuffer = null;
	this.parser = null;
	this.defaultUserAgent = null;
	this.openSocketPort = 0;
	this.openSocketAddress = null;
	this.openSocketProtocol = null;
	this.openSocket = null;
	this.receiveBuffer = new ArrayBuffer(64 * 1024);
	return this;
};

JkHttpClientHTTPClientOperation.prototype.openConnection1 = function(protocol, address, aport, listener) {
	this.closeConnection(listener);
	if(JkLangString.isEmpty(address)) {
		if(listener != null) {
			listener.onError("No server address");
		}
		return false;
	}
	if(!(protocol == "http") && !(protocol == "https")) {
		if(listener != null) {
			listener.onError("Protocol is invalid: `" + (JkLangString.safeString(protocol)) + ("'. Must be http or https"));
		}
		return false;
	}
	var port = aport;
	if(port < 1) {
		if(protocol == "https") {
			port = 443;
		}
		else {
			port = 80;
		}
	}
	if(listener != null) {
		listener.onStatus("Connecting to server `" + (JkLangString.safeString(address)) + (":") + (JkLangString.safeString((JkLangString.forInteger(port)))) + ("' .."));
	}
	this.openSocket = JkSocketTCPSocket.createAndConnect(address, port);
	if(listener != null) {
		listener.onStatus(null);
	}
	if(this.openSocket == null) {
		if(listener != null) {
			listener.onError("Connection failed: `" + (JkLangString.safeString(address)) + (":") + (JkLangString.safeString((JkLangString.forInteger(port)))) + ("'"));
		}
		return false;
	}
	if(protocol == "https") {
		this.openSocket = JkSocketSslSSLSocket.forClient(this.openSocket, address, null, this.acceptInvalidCertificate, null);
		if(this.openSocket == null && listener != null) {
			listener.onError("FAILED to create SSL socket for HTTPS");
			this.closeConnection(listener);
			return false;
		}
	}
	this.openSocketProtocol = protocol;
	this.openSocketAddress = address;
	this.openSocketPort = port;
	this.parser = JkHttpClientHTTPClientOperationMyResponseParser.NEW();
	return true;
};

JkHttpClientHTTPClientOperation.prototype.openConnection2 = function(request, listener) {
	if(request == null) {
		if(listener != null) {
			listener.onError("No request");
		}
		return false;
	}
	return this.openConnection1((request.getProtocol()), (request.getServerAddress()), (request.getServerPort()), listener);
};

JkHttpClientHTTPClientOperation.prototype.closeConnection = function(listener) {
	if(!(this.openSocket != null)) {
		return;
	}
	if(listener != null) {
		listener.onStatus("Closing connection");
	}
	this.openSocket.close();
	this.openSocket = null;
	this.openSocketProtocol = null;
	this.openSocketAddress = null;
	this.openSocketPort = 0;
	this.parser = null;
	if(listener != null) {
		listener.onStatus(null);
	}
};

JkHttpClientHTTPClientOperation.prototype.sendRequest = function(request, listener) {
	if(request == null) {
		if(listener != null) {
			listener.onError("No request");
		}
		return false;
	}
	if(listener != null && listener.onStartRequest(request) == false) {
		return false;
	}
	if(this.openSocket != null) {
		if(!(request.getServerAddress() == this.openSocketAddress) || !(request.getProtocol() == this.openSocketProtocol) || request.getServerPort() != this.openSocketPort) {
			this.closeConnection(listener);
		}
	}
	if(this.openSocket == null) {
		this.openConnection2(request, listener);
		if(!(this.openSocket != null)) {
			return false;
		}
	}
	if(listener != null) {
		listener.onStatus("Sending request headers ..");
	}
	var rqs = request.toString1(this.defaultUserAgent);
	var pww = JkIoPrintWriterWrapper.forWriter(this.openSocket);
	var whr = pww.print(rqs);
	if(listener != null) {
		listener.onStatus(null);
	}
	if(whr == false) {
		if(listener != null) {
			listener.onError("Failed to send HTTP request headers");
		}
		this.closeConnection(listener);
		return false;
	}
	var body = request.getBody();
	if(body != null) {
		if(listener != null) {
			listener.onStatus("Sending request body ..");
		}
		var rv = true;
		var bf = new ArrayBuffer(4096 * 4);
		while(true){
			var r = body.read(bf);
			if(r < 1) {
				break;
			}
			var bw = this.openSocket.write(bf, r);
			if(bw < r) {
				if(listener != null) {
					listener.onError("Failed to send request body (wrote " + (JkLangString.safeString((JkLangString.forInteger(bw)))) + (" bytes out of a ") + (JkLangString.safeString((JkLangString.forInteger(r)))) + (" byte packet)"));
				}
				this.closeConnection(listener);
				rv = false;
				break;
			}
		}
		if(JkLangClosable.IS_INSTANCE && JkLangClosable.IS_INSTANCE(body)) {
			body.close();
		}
		if(listener != null) {
			listener.onStatus(null);
		}
		if(rv == false) {
			return false;
		}
	}
	return true;
};

JkHttpClientHTTPClientOperation.prototype.readResponse = function(listener, timeout) {
	if(this.openSocket == null) {
		if(listener != null) {
			listener.onError("No open socket");
		}
		return false;
	}
	if(listener != null) {
		listener.onStatus("Receiving response ..");
	}
	var rv = true;
	this.parser.setListener(listener);
	while(true){
		var r = 0;
		if(JkSocketSslSSLSocket.IS_INSTANCE && JkSocketSslSSLSocket.IS_INSTANCE(this.openSocket)) {
			r = this.openSocket.readWithTimeout(this.receiveBuffer, timeout);
		}
		else {
			r = this.openSocket.readWithTimeout(this.receiveBuffer, timeout);
		}
		if(r == 0) {
			rv = false;
			break;
		}
		if(r < 1) {
			if(this.parser.isStream) {
				this.parser.reset();
				this.parser.onEndOfResponse();
				break;
			}
			this.closeConnection(listener);
			if(listener != null) {
				listener.onAborted();
			}
			rv = false;
			break;
		}
		this.parser.onDataReceived(this.receiveBuffer, r);
		if(this.parser.getAborted()) {
			this.closeConnection(listener);
			rv = false;
			break;
		}
		if(this.parser.getEndOfResponse()) {
			this.parser.reset();
			rv = true;
			break;
		}
	}
	if(this.parser != null) {
		this.parser.setListener(null);
	}
	if(listener != null) {
		listener.onStatus(null);
		if(listener.onEndRequest() == false) {
			rv = false;
		}
	}
	return rv;
};

JkHttpClientHTTPClientOperation.prototype.executeRequest = function(request, listener) {
	if(!this.sendRequest(request, listener)) {
		return;
	}
	if(!this.readResponse(listener, 30000)) {
		return;
	}
	if(JkLangString.equalsIgnoreCase((request.getHeader("connection")), "close")) {
		this.closeConnection(listener);
	}
};

JkHttpClientHTTPClientOperation.prototype.getDefaultUserAgent = function() {
	return this.defaultUserAgent;
};

JkHttpClientHTTPClientOperation.prototype.setDefaultUserAgent = function(v) {
	this.defaultUserAgent = v;
	return this;
};

JkHttpClientHTTPClientOperation.prototype.getAcceptInvalidCertificate = function() {
	return this.acceptInvalidCertificate;
};

JkHttpClientHTTPClientOperation.prototype.setAcceptInvalidCertificate = function(v) {
	this.acceptInvalidCertificate = v;
	return this;
};

JkHttpClientHTTPClientOperation.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpClientHTTPClientOperation"] === true;
};

let JkHttpClientHTTPRPCClient = function() {
	this.baseUrl = null;
};

JkHttpClientHTTPRPCClient.prototype._t = { "JkHttpClientHTTPRPCClient" : true };
JkHttpClientHTTPRPCClient.prototype._tobj = JkHttpClientHTTPRPCClient;

JkHttpClientHTTPRPCClient.NEW = function() {
	var v = new JkHttpClientHTTPRPCClient;
	return v.CTOR_JkHttpClientHTTPRPCClient();
};

JkHttpClientHTTPRPCClient.prototype.CTOR_JkHttpClientHTTPRPCClient = function() {
	this.baseUrl = null;
	return this;
};

JkHttpClientHTTPRPCClient.forBaseUrl = function(url) {
	var v = JkHttpClientHTTPRPCClient.NEW();
	v.setBaseUrl(url);
	return v;
};

JkHttpClientHTTPRPCClient.prototype.callRemoteFunction = function(name, data1) {
	var dd = data1;
	if(!(dd != null)) {
		dd = JkLangDynamicMap.NEW();
	}
	var sdata = JkJsonJSONEncoder.encode(dd, true, false);
	var bdata = JkLangString.toUTF8Buffer(sdata);
	var url = (JkLangString.safeString(this.baseUrl)) + ("/func/") + (JkLangString.safeString(name));
	var rdata = JkLangDynamicMap.NEW();
	var headers = JkLangKeyValueList.NEW();
	headers.add("content-type", "application/json");
	var wc = JkHttpClientCustomWebClient.NEW();
	var u = url;
	wc.query("POST", url, headers, bdata, (function(status1, headers2, body1) {
		if(status1 == null) {
			var detail = JkLangDynamicMap.NEW();
			detail.setString("url", u);
			detail.setString("error", (JkLangString.forUTF8Buffer(body1)));
			JkLangError._throw("failedToCallRemoteFunction", (JkJsonJSONEncoder.toString(detail)));
		}
		var str = JkLangString.forUTF8Buffer(body1);
		var data = (function(o) {
			if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))((JkJsonJSONParser.parseString(str)));
		if(!(data != null)) {
			var detail1 = JkLangDynamicMap.NEW();
			detail1.setString("url", u);
			detail1.setString("responseBody", str);
			JkLangError._throw("failedToCallRemoteFunction", (JkJsonJSONEncoder.toString(detail1)));
		}
		else {
			rdata.mergeFrom(data);
		}
	}.bind(this)));
	if(rdata.getCount() < 1) {
		JkLangError._throw("failedToCallRemoteFunction", url);
	}
	var status2 = rdata.getString("status", null);
	if(JkLangString.equals(status2, "ok")) {
		return rdata.get("data");
	}
	else if(JkLangString.equals(status2, "error")) {
		var error = rdata.getString("errorCode", null);
		var detail2 = rdata.getString("errorDetail", null);
		if(JkLangString.isEmpty(error)) {
			error = "errorStatusFromRemoteFunction";
		}
		if(JkLangString.isEmpty(detail2)) {
			detail2 = name;
		}
		JkLangError._throw(error, detail2);
	}
	else {
		JkLangError._throw("unsupportedRpcStatus", status2);
	}
	return null;
};

JkHttpClientHTTPRPCClient.prototype.getBaseUrl = function() {
	return this.baseUrl;
};

JkHttpClientHTTPRPCClient.prototype.setBaseUrl = function(v) {
	this.baseUrl = v;
	return this;
};

JkHttpClientHTTPRPCClient.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpClientHTTPRPCClient"] === true;
};
