let JkWebJsonJSONAPIClient = function() {
	this.credentialsEnabled = false;
	this.redirectionEnabled = false;
	this.redirectionLimit = 5;
	this.apiUrl = null;
	this.webClient = null;
	this.debugCallback = null;
};

JkWebJsonJSONAPIClient.prototype._t = { "JkWebJsonJSONAPIClient" : true };
JkWebJsonJSONAPIClient.prototype._tobj = JkWebJsonJSONAPIClient;

JkWebJsonJSONAPIClient.NEW = function() {
	var v = new JkWebJsonJSONAPIClient;
	return v.CTOR_JkWebJsonJSONAPIClient();
};

JkWebJsonJSONAPIClient.prototype.CTOR_JkWebJsonJSONAPIClient = function() {
	this.debugCallback = null;
	this.webClient = null;
	this.apiUrl = null;
	this.redirectionLimit = 5;
	this.redirectionEnabled = false;
	this.credentialsEnabled = false;
	return this;
};

JkWebJsonJSONAPIClient.prototype.getFullURL = function(api) {
	var url = this.apiUrl;
	if(JkLangString.isEmpty(url)) {
		url = "/";
	}
	if(url == "/") {
		if(JkLangString.startsWith(api, "/", 0)) {
			return api;
		}
		return (JkLangString.safeString(url)) + (JkLangString.safeString(api));
	}
	if(JkLangString.endsWith(url, "/")) {
		if(JkLangString.startsWith(api, "/", 0)) {
			return (JkLangString.safeString(url)) + (JkLangString.safeString((JkLangString.getEndOfString(api, 1))));
		}
		return (JkLangString.safeString(url)) + (JkLangString.safeString(api));
	}
	if(JkLangString.startsWith(api, "/", 0)) {
		return (JkLangString.safeString(url)) + (JkLangString.safeString(api));
	}
	return (JkLangString.safeString(url)) + ("/") + (JkLangString.safeString(api));
};

JkWebJsonJSONAPIClient.prototype.toUTF8Buffer = function(data) {
	if(!(data != null)) {
		return null;
	}
	return JkLangString.toUTF8Buffer((JkJsonJSONEncoder.encode(data, true, false)));
};

JkWebJsonJSONAPIClient.prototype.customizeRequestHeaders = function(headers) {
};

JkWebJsonJSONAPIClient.prototype.onStartSendRequest = function() {
};

JkWebJsonJSONAPIClient.prototype.onEndSendRequest = function() {
};

JkWebJsonJSONAPIClient.prototype.onDefaultErrorHandler = function(error) {
};

JkWebJsonJSONAPIClient.prototype.handleAsError = function(response, callback) {
	var error = this.toError(response);
	if(error != null) {
		this.onError1(error, callback);
		return true;
	}
	return false;
};

JkWebJsonJSONAPIClient.prototype.toError = function(response) {
	if(!(response != null)) {
		return JkLangError.forCode("noServerResponse", null);
	}
	if(response.getString("status", null) == "error") {
		var v = JkLangError.NEW();
		var code = response.getString("code", null);
		if(JkLangString.isEmpty(code)) {
			code = response.getString("error", null);
		}
		v.setCode(code);
		var detail = response.getString("detail", null);
		if(JkLangString.isEmpty(detail)) {
			detail = response.getString("message", null);
		}
		v.setDetail(detail);
		return v;
	}
	return null;
};

JkWebJsonJSONAPIClient.prototype.onError1 = function(error, callback) {
	if(!(callback != null)) {
		this.onDefaultErrorHandler(error);
		return;
	}
	callback(error);
};

JkWebJsonJSONAPIClient.prototype.onError2 = function(error) {
	this.onError1(error, null);
};

JkWebJsonJSONAPIClient.prototype.sendRequest = function(method, url, headers, data, callback, errorCallback) {
	if(!(callback != null)) {
		return;
	}
	var ll = callback;
	var ecb = errorCallback;
	this.doSendRequest(method, url, headers, data, (function(responseHeaders1, body1) {
		if(!(body1 != null && JkLangBuffer.getSize(body1) > 0)) {
			this.onError1((JkLangError.forCode("requestFailed", null)), ecb);
			return;
		}
		var responseString = JkLangString.forUTF8Buffer(body1);
		if(this.debugCallback != null) {
			this.debugCallback("Received response: `" + (JkLangString.safeString(responseString)) + ("'"));
		}
		var jsonResponseBody = (function(o) {
			if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))((JkJsonJSONParser.parseString(responseString)));
		if(!(jsonResponseBody != null)) {
			this.onError1((JkLangError.forCode("invalidServerResponse", null)), ecb);
			return;
		}
		if(!this.handleAsError(jsonResponseBody, ecb)) {
			ll(jsonResponseBody);
		}
	}.bind(this)), ecb, 0);
};

JkWebJsonJSONAPIClient.prototype.doSendRequest = function(method, url, headers, data, callback, errorCallback, redirectCount) {
	if(!(callback != null)) {
		return;
	}
	if(!(redirectCount <= this.redirectionLimit)) {
		this.onError1((JkLangError.forCode("tooManyRedirections", null)), errorCallback);
		return;
	}
	var hrs = headers;
	if(!(hrs != null)) {
		hrs = JkLangKeyValueList.NEW();
		hrs.add("Content-Type", "application/json");
	}
	if(!(this.webClient != null)) {
		this.webClient = JkWebNativeWebClient.instance();
	}
	if(!(this.webClient != null)) {
		this.onError1((JkLangError.forCode("noWebClient", null)), errorCallback);
		return;
	}
	this.webClient.setCredentialsEnabled(this.credentialsEnabled);
	this.customizeRequestHeaders(hrs);
	var hrsf = hrs;
	var cb = callback;
	var ecb = errorCallback;
	var urlf = url;
	var dataf = data;
	var methodf = method;
	this.onStartSendRequest();
	if(this.debugCallback != null) {
		this.debugCallback("Sending request: `" + (JkLangString.safeString((JkLangString.forUTF8Buffer(data)))) + ("'"));
	}
	var rdc = redirectCount;
	this.webClient.query(methodf, urlf, hrsf, dataf, (function(statusCode1, responseHeaders1, body1) {
		this.onEndSendRequest();
		if(this.redirectionEnabled) {
			var code = JkLangString.toInteger(statusCode1);
			if(code >= 300 && code <= 399 && responseHeaders1 != null) {
				var location = null;
				var rhs = responseHeaders1.asVector();
				if(rhs != null) {
					var n2 = 0;
					var m = rhs.length;
					for(n2 = 0 ; n2 < m ; n2++) {
						var kvp = rhs[n2];
						if(kvp != null) {
							if(JkLangString.equalsIgnoreCase(kvp.key, "Location")) {
								location = kvp.value;
								break;
							}
						}
					}
				}
				if(JkLangString.isNotEmpty(location)) {
					if(!JkLangString.startsWith(location, "http", 0)) {
						location = this.getFullURL(location);
					}
					var o = JkUrlURL.forString(urlf, false);
					var n = JkUrlURL.forString(location, false);
					if(o != null && n != null && JkLangString.equalsIgnoreCase((o.getHost()), (n.getHost())) && !(o.getPort() == n.getPort())) {
						n.setPort((o.getPort()));
						location = n.toString();
					}
					this.doSendRequest(methodf, location, hrsf, dataf, cb, ecb, (rdc + 1));
					return;
				}
			}
		}
		if(!(body1 != null && JkLangBuffer.getSize(body1) > 0)) {
			this.onError1((JkLangError.forCode("failedToConnect", null)), ecb);
			return;
		}
		cb(responseHeaders1, body1);
	}.bind(this)));
};

JkWebJsonJSONAPIClient.prototype.doGetFile = function(url, callback, errorCallback) {
	this.doSendRequest("GET", (this.getFullURL(url)), null, null, callback, errorCallback, 0);
};

JkWebJsonJSONAPIClient.prototype.doGet = function(url, callback, errorCallback) {
	this.sendRequest("GET", (this.getFullURL(url)), null, null, callback, errorCallback);
};

JkWebJsonJSONAPIClient.prototype.doPost = function(url, data, callback, errorCallback) {
	this.sendRequest("POST", (this.getFullURL(url)), null, (this.toUTF8Buffer(data)), callback, errorCallback);
};

JkWebJsonJSONAPIClient.prototype.doPut = function(url, data, callback, errorCallback) {
	this.sendRequest("PUT", (this.getFullURL(url)), null, (this.toUTF8Buffer(data)), callback, errorCallback);
};

JkWebJsonJSONAPIClient.prototype.doDelete = function(url, callback, errorCallback) {
	this.sendRequest("DELETE", (this.getFullURL(url)), null, null, callback, errorCallback);
};

JkWebJsonJSONAPIClient.prototype.uploadFile = function(url, data, mimeType, callback, errorCallback) {
	var mt = mimeType;
	if(JkLangString.isEmpty(mt)) {
		mt = "application/octet-stream";
	}
	var hdrs = JkLangKeyValueList.NEW();
	hdrs.add("content-type", mt);
	this.sendRequest("POST", (this.getFullURL(url)), hdrs, data, callback, errorCallback);
};

JkWebJsonJSONAPIClient.prototype.getWithStatus = function(url, callback) {
	var cb = callback;
	var okcb = function(v1) {
		var data = v1.getDynamicMap("data");
		if(data == null) {
			data = JkLangDynamicMap.NEW();
		}
		cb(data, null);
	}.bind(this);
	var errcb = function(err1) {
		cb(null, err1);
	}.bind(this);
	this.sendRequest("GET", (this.getFullURL(url)), null, null, okcb, errcb);
};

JkWebJsonJSONAPIClient.prototype.postWithStatus = function(url, data1, headers, callback) {
	var cb = callback;
	var okcb = function(v1) {
		var data = v1.getDynamicMap("data");
		if(data == null) {
			data = JkLangDynamicMap.NEW();
		}
		cb(data, null);
	}.bind(this);
	var errcb = function(err1) {
		cb(null, err1);
	}.bind(this);
	this.sendRequest("POST", (this.getFullURL(url)), headers, (this.toUTF8Buffer(data1)), okcb, errcb);
};

JkWebJsonJSONAPIClient.prototype.getCredentialsEnabled = function() {
	return this.credentialsEnabled;
};

JkWebJsonJSONAPIClient.prototype.setCredentialsEnabled = function(v) {
	this.credentialsEnabled = v;
	return this;
};

JkWebJsonJSONAPIClient.prototype.getRedirectionEnabled = function() {
	return this.redirectionEnabled;
};

JkWebJsonJSONAPIClient.prototype.setRedirectionEnabled = function(v) {
	this.redirectionEnabled = v;
	return this;
};

JkWebJsonJSONAPIClient.prototype.getRedirectionLimit = function() {
	return this.redirectionLimit;
};

JkWebJsonJSONAPIClient.prototype.setRedirectionLimit = function(v) {
	this.redirectionLimit = v;
	return this;
};

JkWebJsonJSONAPIClient.prototype.getApiUrl = function() {
	return this.apiUrl;
};

JkWebJsonJSONAPIClient.prototype.setApiUrl = function(v) {
	this.apiUrl = v;
	return this;
};

JkWebJsonJSONAPIClient.prototype.getWebClient = function() {
	return this.webClient;
};

JkWebJsonJSONAPIClient.prototype.setWebClient = function(v) {
	this.webClient = v;
	return this;
};

JkWebJsonJSONAPIClient.prototype.getDebugCallback = function() {
	return this.debugCallback;
};

JkWebJsonJSONAPIClient.prototype.setDebugCallback = function(v) {
	this.debugCallback = v;
	return this;
};

JkWebJsonJSONAPIClient.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWebJsonJSONAPIClient"] === true;
};
