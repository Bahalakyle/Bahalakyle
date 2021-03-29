let JkWebWebClient = function() {
	this.followRedirects = true;
	this.credentialsEnabled = false;
};

JkWebWebClient.prototype._t = { "JkWebWebClient" : true };
JkWebWebClient.prototype._tobj = JkWebWebClient;

JkWebWebClient.NEW = function() {
	var v = new JkWebWebClient;
	return v.CTOR_JkWebWebClient();
};

JkWebWebClient.prototype.CTOR_JkWebWebClient = function() {
	this.credentialsEnabled = false;
	this.followRedirects = true;
	return this;
};

JkWebWebClient.prototype.query = function(method, url, headers, body, callback) {};

JkWebWebClient.prototype.getFollowRedirects = function() {
	return this.followRedirects;
};

JkWebWebClient.prototype.setFollowRedirects = function(v) {
	this.followRedirects = v;
	return this;
};

JkWebWebClient.prototype.getCredentialsEnabled = function() {
	return this.credentialsEnabled;
};

JkWebWebClient.prototype.setCredentialsEnabled = function(v) {
	this.credentialsEnabled = v;
	return this;
};

JkWebWebClient.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWebWebClient"] === true;
};

let JkWebWebClientForJavaScript = function() {
	JkWebWebClient.call(this);
};

JkWebWebClientForJavaScript.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWebWebClient.prototype);
JkWebWebClientForJavaScript.prototype.constructor = JkWebWebClientForJavaScript;
JkWebWebClientForJavaScript.prototype._t = {
	"JkWebWebClientForJavaScript" : true,
	"JkWebWebClient" : true
};
JkWebWebClientForJavaScript.prototype._tobj = JkWebWebClientForJavaScript;

JkWebWebClientForJavaScript.NEW = function() {
	var v = new JkWebWebClientForJavaScript;
	return v.CTOR_JkWebWebClientForJavaScript();
};

JkWebWebClientForJavaScript.prototype.CTOR_JkWebWebClientForJavaScript = function() {
	if(JkWebWebClient.prototype.CTOR_JkWebWebClient.call(this) == null) {
		return null;
	}
	return this;
};

JkWebWebClientForJavaScript.prototype.query = function(method, url, requestHeaders, body, callback) {
	if(JkLangString.isEmpty(method) || JkLangString.isEmpty(url)) {
		callback(null, null, null);
		return;
	}
	if(JkLangString.startsWith(url, "/", 0) == false && JkLangString.startsWith(url, "http://", 0) == false && JkLangString.startsWith(url, "https://", 0) == false) {
		callback(null, null, null);
		return;
	}
	this.send(method, url, requestHeaders, body, callback);
};

JkWebWebClientForJavaScript.prototype.getXMLHttpRequestObject = function() {
	var xhr = null;
	if(typeof XMLHttpRequest === "undefined") {
		XMLHttpRequest = function() {
			try {
				return new ActiveXObject('Msxml2.XMLHTTP.6.0');
			}
			catch(e) {}
		try {
			return new ActiveXObject('Msxml2.XMLHTTP.3.0');
		}
		catch(e) {}
	try {
		return new ActiveXObject('Microsoft.XMLHTTP');
	}
	catch(e) {}
throw new Error('This browser does not support XMLHttpRequest.');
}
}
xhr = new XMLHttpRequest();
;
return xhr;
};

JkWebWebClientForJavaScript.prototype.onResponseReceived = function(status, responseHeaders, body, callback) {
var nhdrs = JkLangKeyValueList.NEW();
var siter = JkLangString.iterate(responseHeaders);
var sbldr = JkLangStringBuilder.NEW();
while(true){
var c = siter.getNextChar();
if(c < 1) {
	break;
}
if(c == '\r'.charCodeAt()) {
	continue;
}
if(c == '\n'.charCodeAt()) {
	var str = sbldr.toString();
	sbldr.clear();
	var spt = JkLangString.split(str, ':'.charCodeAt(), 2);
	var key = JkLangVector.get(spt, 0);
	var val = JkLangVector.get(spt, 1);
	if(JkLangString.isNotEmpty(key) && JkLangString.isNotEmpty(val)) {
		nhdrs.add(key, (JkLangString.strip(val)));
	}
	continue;
}
sbldr.appendCharacter(c);
}
callback(status, nhdrs, body);
};

JkWebWebClientForJavaScript.prototype.send = function(method, url, requestHeaders, body, callback) {
	var withCredentials = this.getCredentialsEnabled();
	var xhr = this.getXMLHttpRequestObject();
	xhr.open(method, url, true);
	xhr.timeout = 30000;
	xhr.responseType = "arraybuffer";
	xhr.withCredentials = withCredentials;
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4) {
			this.onResponseReceived(""+xhr.status, xhr.getAllResponseHeaders(), xhr.response, callback);
		}
	}.bind(this);
	;
	if(requestHeaders != null) {
		var iter = requestHeaders.iterate();
		while(true){
			var kv = (function(o) {
				if(JkLangKeyValuePair.IS_INSTANCE && JkLangKeyValuePair.IS_INSTANCE(o)) {
					return o;
				}
				return null;
			}.bind(this))((iter.next()));
			if(kv == null) {
				break;
			}
			var k = kv.key;
			var v = kv.value;
			xhr.setRequestHeader(k, v);
			;
		}
	}
	if(body != null) {
		xhr.send(new Uint8Array(body));
		;
	}
	else {
		xhr.send();
		;
	}
};

JkWebWebClientForJavaScript.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWebWebClientForJavaScript"] === true;
};

let JkWebNativeWebClient = function() {};

JkWebNativeWebClient.prototype._t = { "JkWebNativeWebClient" : true };
JkWebNativeWebClient.prototype._tobj = JkWebNativeWebClient;

JkWebNativeWebClient.NEW = function() {
	var v = new JkWebNativeWebClient;
	return v.CTOR_JkWebNativeWebClient();
};

JkWebNativeWebClient.prototype.CTOR_JkWebNativeWebClient = function() {
	return this;
};

JkWebNativeWebClient.instance = function() {
	return JkWebWebClientForJavaScript.NEW();
};

JkWebNativeWebClient.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWebNativeWebClient"] === true;
};

let JkWebWebClientAsyncForJavaScriptResponse = function() {
	this.httpStatus = null;
	this.httpStatusDescription = null;
	this.headers = null;
	this.body = null;
	this.bodyAsString = null;
	this.bodyAsDynamicMap = null;
};

JkWebWebClientAsyncForJavaScriptResponse.prototype._t = { "JkWebWebClientAsyncForJavaScriptResponse" : true };
JkWebWebClientAsyncForJavaScriptResponse.prototype._tobj = JkWebWebClientAsyncForJavaScriptResponse;

JkWebWebClientAsyncForJavaScriptResponse.NEW = function() {
	var v = new JkWebWebClientAsyncForJavaScriptResponse;
	return v.CTOR_JkWebWebClientAsyncForJavaScriptResponse();
};

JkWebWebClientAsyncForJavaScriptResponse.prototype.CTOR_JkWebWebClientAsyncForJavaScriptResponse = function() {
	this.bodyAsDynamicMap = null;
	this.bodyAsString = null;
	this.body = null;
	this.headers = null;
	this.httpStatusDescription = null;
	this.httpStatus = null;
	return this;
};

JkWebWebClientAsyncForJavaScriptResponse.prototype.getBodyAsBuffer = function() {
	if(!(this.body != null)) {
		JkLangError._throw("httpRequestError", "noBody");
	}
	return this.body;
};

JkWebWebClientAsyncForJavaScriptResponse.prototype.getBodyAsString = function() {
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

JkWebWebClientAsyncForJavaScriptResponse.prototype.getBodyAsDynamicMap = function() {
	if(this.bodyAsDynamicMap != null) {
		return this.bodyAsDynamicMap;
	}
	var v = (function(o) {
		if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((JkJsonJSONParser.parseString((this.getBodyAsString()))));
	if(!(v != null)) {
		JkLangError._throw("httpRequestError", "notJsonMap");
	}
	this.bodyAsDynamicMap = v;
	return v;
};

JkWebWebClientAsyncForJavaScriptResponse.prototype.getHttpStatus = function() {
	return this.httpStatus;
};

JkWebWebClientAsyncForJavaScriptResponse.prototype.setHttpStatus = function(v) {
	this.httpStatus = v;
	return this;
};

JkWebWebClientAsyncForJavaScriptResponse.prototype.getHttpStatusDescription = function() {
	return this.httpStatusDescription;
};

JkWebWebClientAsyncForJavaScriptResponse.prototype.setHttpStatusDescription = function(v) {
	this.httpStatusDescription = v;
	return this;
};

JkWebWebClientAsyncForJavaScriptResponse.prototype.getHeaders = function() {
	return this.headers;
};

JkWebWebClientAsyncForJavaScriptResponse.prototype.setHeaders = function(v) {
	this.headers = v;
	return this;
};

JkWebWebClientAsyncForJavaScriptResponse.prototype.getBody = function() {
	return this.body;
};

JkWebWebClientAsyncForJavaScriptResponse.prototype.setBody = function(v) {
	this.body = v;
	return this;
};

JkWebWebClientAsyncForJavaScriptResponse.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWebWebClientAsyncForJavaScriptResponse"] === true;
};

let JkWebWebClientAsyncForJavaScript = function() {
	this.followRedirects = true;
	this.credentialsEnabled = false;
};

JkWebWebClientAsyncForJavaScript.prototype._t = { "JkWebWebClientAsyncForJavaScript" : true };
JkWebWebClientAsyncForJavaScript.prototype._tobj = JkWebWebClientAsyncForJavaScript;

JkWebWebClientAsyncForJavaScript.NEW = function() {
	var v = new JkWebWebClientAsyncForJavaScript;
	return v.CTOR_JkWebWebClientAsyncForJavaScript();
};

JkWebWebClientAsyncForJavaScript.prototype.CTOR_JkWebWebClientAsyncForJavaScript = function() {
	this.credentialsEnabled = false;
	this.followRedirects = true;
	return this;
};

JkWebWebClientAsyncForJavaScript.prototype.getXMLHttpRequestObject = function() {
	var xhr = null;
	if(typeof XMLHttpRequest === "undefined") {
		XMLHttpRequest = function() {
			try {
				return new ActiveXObject('Msxml2.XMLHTTP.6.0');
			}
			catch(e) {}
		try {
			return new ActiveXObject('Msxml2.XMLHTTP.3.0');
		}
		catch(e) {}
	try {
		return new ActiveXObject('Microsoft.XMLHTTP');
	}
	catch(e) {}
throw new Error('This browser does not support XMLHttpRequest.');
}
}
xhr = new XMLHttpRequest();
;
return xhr;
};

JkWebWebClientAsyncForJavaScript.prototype.executeRequest = async function(method, url, headers, body) {
var withCredentials = this.credentialsEnabled;
var xhr = this.getXMLHttpRequestObject();
return new Promise((resolve, reject) => {
xhr.open(method, url, true);
xhr.timeout = 30000;
xhr.responseType = "arraybuffer";
xhr.withCredentials = withCredentials;
xhr.onreadystatechange = function() {
	if(xhr.readyState == 4) {
		var rr = new JkWebWebClientAsyncForJavaScriptResponse();
		rr.setHttpStatus(xhr.status);
		rr.setBody(xhr.response);
		resolve(rr);
	}
}.bind(this);
;
if(headers != null) {
	var iter = headers.iterate();
	while(true){
		var kv = (function(o) {
			if(JkLangKeyValuePair.IS_INSTANCE && JkLangKeyValuePair.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))((iter.next()));
		if(kv == null) {
			break;
		}
		var k = kv.key;
		var v = kv.value;
		xhr.setRequestHeader(k, v);
		;
	}
}
if(body != null) {
	xhr.send(new Uint8Array(body));
	;
}
else {
	xhr.send();
	;
}
});
};

JkWebWebClientAsyncForJavaScript.prototype.getFollowRedirects = function() {
	return this.followRedirects;
};

JkWebWebClientAsyncForJavaScript.prototype.setFollowRedirects = function(v) {
	this.followRedirects = v;
	return this;
};

JkWebWebClientAsyncForJavaScript.prototype.getCredentialsEnabled = function() {
	return this.credentialsEnabled;
};

JkWebWebClientAsyncForJavaScript.prototype.setCredentialsEnabled = function(v) {
	this.credentialsEnabled = v;
	return this;
};

JkWebWebClientAsyncForJavaScript.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWebWebClientAsyncForJavaScript"] === true;
};
