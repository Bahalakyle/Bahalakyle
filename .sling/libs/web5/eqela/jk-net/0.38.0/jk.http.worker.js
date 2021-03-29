let JkHttpWorkerHTTPWorkerRequest = function() {
	this.method = null;
	this.path = null;
	this.body = null;
	this.session = null;
	this.rawHeaders = null;
	this.headers = null;
	this.url = null;
	this.cookies = null;
};

JkHttpWorkerHTTPWorkerRequest.prototype._t = {
	"JkHttpWorkerHTTPWorkerRequest" : true,
	"JkLangStringObject" : true
};
JkHttpWorkerHTTPWorkerRequest.prototype._tobj = JkHttpWorkerHTTPWorkerRequest;

JkHttpWorkerHTTPWorkerRequest.NEW = function() {
	var v = new JkHttpWorkerHTTPWorkerRequest;
	return v.CTOR_JkHttpWorkerHTTPWorkerRequest();
};

JkHttpWorkerHTTPWorkerRequest.prototype.CTOR_JkHttpWorkerHTTPWorkerRequest = function() {
	this.cookies = null;
	this.url = null;
	this.headers = null;
	this.rawHeaders = null;
	this.session = null;
	this.body = null;
	this.path = null;
	this.method = null;
	return this;
};

JkHttpWorkerHTTPWorkerRequest.instance = function() {
	var v = JkHttpWorkerHTTPWorkerRequest.NEW();
	v.parseWorkerInput();
	return v;
};

JkHttpWorkerHTTPWorkerRequest.prototype.parseWorkerInput = function() {
	var parser = JkMypacketMyPacketParser.forBuffer((JkWorkerWorker.getInputBuffer()));
	this.setMethod((parser.getLengthEncodedString()));
	this.setPath((parser.getLengthEncodedString()));
	var nheaders = parser.getLengthEncodedInteger();
	for(var n = 0 ; n < nheaders ; n++) {
		var key = parser.getLengthEncodedString();
		var val = parser.getLengthEncodedString();
		if(key != null) {
			this.addToHeaders(key, val);
		}
	}
	this.setBody((parser.getLengthEncodedBuffer()));
};

JkHttpWorkerHTTPWorkerRequest.prototype.getBodyString = function() {
	return JkLangString.forUTF8Buffer(this.body);
};

JkHttpWorkerHTTPWorkerRequest.prototype.getBodyJSONObject = function() {
	return JkJsonJSONParser.parseBuffer(this.body);
};

JkHttpWorkerHTTPWorkerRequest.prototype.getBodyJSONMap = function() {
	return (function(o) {
		if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((this.getBodyJSONObject()));
};

JkHttpWorkerHTTPWorkerRequest.prototype.addToHeaders = function(key, value) {
	if(!(key != null)) {
		return;
	}
	var vv = value;
	if(!(vv != null)) {
		vv = "";
	}
	if(!(this.rawHeaders != null)) {
		this.rawHeaders = JkLangKeyValueList.NEW();
	}
	if(!(this.headers != null)) {
		this.headers = new Map;
	}
	this.rawHeaders.add(key, vv);
	this.headers.set((JkLangString.toLowerCase(key)), value);
};

JkHttpWorkerHTTPWorkerRequest.prototype.getRawHeaders = function() {
	return this.rawHeaders;
};

JkHttpWorkerHTTPWorkerRequest.prototype.getHeaders = function() {
	return this.headers;
};

JkHttpWorkerHTTPWorkerRequest.prototype.removeFromHeaders = function(key) {
	if(!(this.rawHeaders != null)) {
		return;
	}
	if(!(key != null)) {
		return;
	}
	var n = 0;
	var klow = JkLangString.toLowerCase(key);
	while(n < this.rawHeaders.count()){
		var kk = JkLangString.toLowerCase((this.rawHeaders.getKey(n)));
		if(kk != null && kk == klow) {
			this.rawHeaders.remove(n);
		}
		else {
			n++;
		}
	}
	if(this.headers != null) {
		JkLangMap.remove(this.headers, key);
	}
};

JkHttpWorkerHTTPWorkerRequest.prototype.getHeaderValue = function(name) {
	if(!JkLangString.isNotEmpty(name)) {
		return null;
	}
	if(!(this.headers != null)) {
		return null;
	}
	return JkLangMap.get(this.headers, name);
};

JkHttpWorkerHTTPWorkerRequest.prototype.getURL = function() {
	if(!(this.url != null)) {
		this.url = JkUrlURL.forString(this.path, true);
	}
	return this.url;
};

JkHttpWorkerHTTPWorkerRequest.prototype.getQueryParameters = function() {
	var url = this.getURL();
	if(!(url != null)) {
		return null;
	}
	return url.getQueryParameters();
};

JkHttpWorkerHTTPWorkerRequest.prototype.getQueryParameter = function(key) {
	var url = this.getURL();
	if(!(url != null)) {
		return null;
	}
	return url.getQueryParameter(key);
};

JkHttpWorkerHTTPWorkerRequest.prototype.getURLPath = function() {
	var url = this.getURL();
	if(!(url != null)) {
		return null;
	}
	return url.getPath();
};

JkHttpWorkerHTTPWorkerRequest.prototype.getCookieValues = function() {
	if(!(this.cookies != null)) {
		var v = new Map;
		var cvals = this.getHeaderValue("cookie");
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

JkHttpWorkerHTTPWorkerRequest.prototype.getCookieValue = function(name) {
	var c = this.getCookieValues();
	if(!(c != null)) {
		return null;
	}
	return JkLangMap.get(c, name);
};

JkHttpWorkerHTTPWorkerRequest.prototype.toString = function() {
	var sb = JkLangStringBuilder.NEW();
	if(this.method != null) {
		sb.appendString(this.method);
	}
	else {
		sb.appendString("NOMETHOD");
	}
	sb.appendCharacter(' '.charCodeAt());
	if(this.path != null) {
		sb.appendString(this.path);
	}
	else {
		sb.appendString("NOPATH");
	}
	sb.appendString(" HTTP/1.1\n");
	if(this.rawHeaders != null) {
		var it = this.rawHeaders.iterate();
		while(it != null){
			var pair = it.next();
			if(!(pair != null)) {
				break;
			}
			sb.appendString(pair.key);
			sb.appendString(": ");
			sb.appendString(pair.value);
			sb.appendCharacter('\n'.charCodeAt());
		}
	}
	sb.appendCharacter('\n'.charCodeAt());
	sb.appendString((this.getBodyString()));
	return sb.toString();
};

JkHttpWorkerHTTPWorkerRequest.prototype.getMethod = function() {
	return this.method;
};

JkHttpWorkerHTTPWorkerRequest.prototype.setMethod = function(v) {
	this.method = v;
	return this;
};

JkHttpWorkerHTTPWorkerRequest.prototype.getPath = function() {
	return this.path;
};

JkHttpWorkerHTTPWorkerRequest.prototype.setPath = function(v) {
	this.path = v;
	return this;
};

JkHttpWorkerHTTPWorkerRequest.prototype.getBody = function() {
	return this.body;
};

JkHttpWorkerHTTPWorkerRequest.prototype.setBody = function(v) {
	this.body = v;
	return this;
};

JkHttpWorkerHTTPWorkerRequest.prototype.getSession = function() {
	return this.session;
};

JkHttpWorkerHTTPWorkerRequest.prototype.setSession = function(v) {
	this.session = v;
	return this;
};

JkHttpWorkerHTTPWorkerRequest.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpWorkerHTTPWorkerRequest"] === true;
};

let JkHttpWorkerHTTPWorkerHandler = function() {
	this.ctx = null;
};

JkHttpWorkerHTTPWorkerHandler.prototype._t = {
	"JkHttpWorkerHTTPWorkerHandler" : true,
	"JkLangRunnable" : true
};
JkHttpWorkerHTTPWorkerHandler.prototype._tobj = JkHttpWorkerHTTPWorkerHandler;

JkHttpWorkerHTTPWorkerHandler.NEW = function() {
	var v = new JkHttpWorkerHTTPWorkerHandler;
	return v.CTOR_JkHttpWorkerHTTPWorkerHandler();
};

JkHttpWorkerHTTPWorkerHandler.prototype.CTOR_JkHttpWorkerHTTPWorkerHandler = function() {
	this.ctx = null;
	this.ctx = JkConsoleConsoleApplicationContext.NEW();
	return this;
};

JkHttpWorkerHTTPWorkerHandler.prototype.handleRequest = function(req, resp) {};

JkHttpWorkerHTTPWorkerHandler.prototype.onStartRequest = function() {
	;
};

JkHttpWorkerHTTPWorkerHandler.prototype.onEndRequest = function() {
	;
};

JkHttpWorkerHTTPWorkerHandler.prototype.preProcess = function(req, resp) {
	;
};

JkHttpWorkerHTTPWorkerHandler.prototype.postProcess = function(req, resp) {
	;
};

JkHttpWorkerHTTPWorkerHandler.prototype.generateNotFound = function(resp) {
	resp.setStatus("404");
	resp.setHeaders(null);
	resp.setContentType("text/plain");
	resp.setBody((JkLangString.toUTF8Buffer("Not found")));
};

JkHttpWorkerHTTPWorkerHandler.prototype.generateInternalServerError = function(resp) {
	resp.setStatus("500");
	resp.setHeaders(null);
	resp.setContentType("text/plain");
	resp.setBody((JkLangString.toUTF8Buffer("Internal server error")));
};

JkHttpWorkerHTTPWorkerHandler.prototype.run = function() {
	this.onStartRequest();
	var req = JkHttpWorkerHTTPWorkerRequest.instance();
	var resp = JkHttpWorkerHTTPWorkerResponse.NEW();
	try {
		this.preProcess(req, resp);
		if(JkLangString.isEmpty((resp.getStatus()))) {
			this.handleRequest(req, resp);
		}
	}
	catch(e) {
		JkLogLog.error(this.ctx, "Exception while processing request: " + (JkLangString.safeString((JkLogLog.asString(this.ctx, e)))));
		this.generateInternalServerError(resp);
	}
	if(JkLangString.isEmpty((resp.getStatus()))) {
		this.generateNotFound(resp);
	}
	this.postProcess(req, resp);
	resp.send();
	this.onEndRequest();
};

JkHttpWorkerHTTPWorkerHandler.prototype.getCtx = function() {
	return this.ctx;
};

JkHttpWorkerHTTPWorkerHandler.prototype.setCtx = function(v) {
	this.ctx = v;
	return this;
};

JkHttpWorkerHTTPWorkerHandler.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpWorkerHTTPWorkerHandler"] === true;
};

let JkHttpWorkerHTTPWorkerRouter = function() {
	JkHttpWorkerHTTPWorkerHandler.call(this);
	this.routes = new Map;
};

JkHttpWorkerHTTPWorkerRouter.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkHttpWorkerHTTPWorkerHandler.prototype);
JkHttpWorkerHTTPWorkerRouter.prototype.constructor = JkHttpWorkerHTTPWorkerRouter;
JkHttpWorkerHTTPWorkerRouter.prototype._t = {
	"JkHttpWorkerHTTPWorkerHandler" : true,
	"JkHttpWorkerHTTPWorkerRouter" : true,
	"JkLangRunnable" : true
};
JkHttpWorkerHTTPWorkerRouter.prototype._tobj = JkHttpWorkerHTTPWorkerRouter;

JkHttpWorkerHTTPWorkerRouter.NEW = function() {
	var v = new JkHttpWorkerHTTPWorkerRouter;
	return v.CTOR_JkHttpWorkerHTTPWorkerRouter();
};

JkHttpWorkerHTTPWorkerRouter.prototype.CTOR_JkHttpWorkerHTTPWorkerRouter = function() {
	if(JkHttpWorkerHTTPWorkerHandler.prototype.CTOR_JkHttpWorkerHTTPWorkerHandler.call(this) == null) {
		return null;
	}
	this.routes = new Map;
	this.initRoutes();
	return this;
};

JkHttpWorkerHTTPWorkerRouter.prototype.initRoutes = function() {
	;
};

JkHttpWorkerHTTPWorkerRouter.prototype.addRoute = function(method, pattern, handler) {
	if(!JkLangString.isNotEmpty(method)) {
		return;
	}
	if(!JkLangString.isNotEmpty(pattern)) {
		return;
	}
	var id = (JkLangString.safeString((JkLangString.toUpperCase(method)))) + (JkLangString.safeString(pattern));
	this.routes.set(id, handler);
};

JkHttpWorkerHTTPWorkerRouter.prototype.handleRequest = function(req, resp) {
	var match = null;
	var matchVars = null;
	var method = JkLangString.toUpperCase((req.getMethod()));
	if(JkLangString.isEmpty(method)) {
		method = "GET";
	}
	var path = req.getURLPath();
	if(JkLangString.isEmpty(path)) {
		path = "/";
	}
	var comps = JkLangString.split(path, '/'.charCodeAt(), 0);
	var ccount = JkLangVector.getSize(comps);
	var array = JkLangMap.getKeys(this.routes);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var route = array[n];
			if(route != null) {
				if(!JkLangString.startsWith(route, method, 0)) {
					continue;
				}
				var vars = null;
				var pattern = JkLangString.getEndOfString(route, (JkLangString.getLength(method)));
				var pcomps = JkLangString.split(pattern, '/'.charCodeAt(), 0);
				var plen = JkLangVector.getSize(pcomps);
				var n1 = 0;
				var n2 = 0;
				while(true){
					var s1 = null;
					var s2 = null;
					while(JkLangString.isEmpty(s1) && n1 < ccount){
						s1 = JkLangVector.get(comps, (n1++));
					}
					while(JkLangString.isEmpty(s2) && n2 < plen){
						s2 = JkLangVector.get(pcomps, (n2++));
					}
					if(JkLangString.isEmpty(s1)) {
						s1 = null;
					}
					if(JkLangString.isEmpty(s2)) {
						s2 = null;
					}
					if(s1 == null && s2 == null) {
						match = route;
						matchVars = vars;
						break;
					}
					if(s1 != null && JkLangString.startsWith(s2, ":", 0)) {
						if(!(vars != null)) {
							vars = JkLangDynamicMap.NEW();
						}
						vars.setString((JkLangString.getEndOfString(s2, 1)), s1);
						continue;
					}
					if(s1 == s2) {
						continue;
					}
					break;
				}
				if(match != null) {
					break;
				}
			}
		}
	}
	if(match != null) {
		var handler = JkLangMap.get(this.routes, match);
		if(handler != null) {
			if(!(matchVars != null)) {
				matchVars = JkLangDynamicMap.NEW();
			}
			resp.setStatus("200");
			handler(req, resp, matchVars);
		}
	}
};

JkHttpWorkerHTTPWorkerRouter.prototype.setErrorResponse = function(resp, errorCode, statusCode) {
	if(!(resp != null)) {
		return;
	}
	resp.setStatus(statusCode);
	resp.setHeaders(null);
	resp.setContentType("application/json");
	var error = JkLangDynamicMap.NEW();
	error.setString("status", "error");
	error.setString("error", errorCode);
	resp.setBody((JkLangString.toUTF8Buffer((JkJsonJSONEncoder.encode(error, true, false)))));
};

JkHttpWorkerHTTPWorkerRouter.prototype.setJsonObjectResponse = function(resp, o, cookie) {
	resp.setStatus("200");
	resp.setHeaders(null);
	resp.setContentType("application/json");
	if(cookie != null) {
		resp.addCookie(cookie);
	}
	resp.setBody((JkLangString.toUTF8Buffer((JkJsonJSONEncoder.encode(o, true, false)))));
};

JkHttpWorkerHTTPWorkerRouter.prototype.setOkResponse = function(resp, data) {
	if(!(resp != null)) {
		return;
	}
	var v = JkLangDynamicMap.NEW();
	v.setString("status", "ok");
	if(data != null) {
		v.setObject("data", data);
	}
	this.setJsonObjectResponse(resp, v, null);
};

JkHttpWorkerHTTPWorkerRouter.prototype.setNotAuthenticated = function(resp) {
	this.setErrorResponse(resp, "invalidRequest", "401");
};

JkHttpWorkerHTTPWorkerRouter.prototype.setInvalidRequest = function(resp) {
	this.setErrorResponse(resp, "invalidRequest", "400");
};

JkHttpWorkerHTTPWorkerRouter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpWorkerHTTPWorkerRouter"] === true;
};

let JkHttpWorkerHTTPWorkerResponse = function() {
	this.status = null;
	this.headers = null;
	this.body = null;
};

JkHttpWorkerHTTPWorkerResponse.prototype._t = { "JkHttpWorkerHTTPWorkerResponse" : true };
JkHttpWorkerHTTPWorkerResponse.prototype._tobj = JkHttpWorkerHTTPWorkerResponse;

JkHttpWorkerHTTPWorkerResponse.NEW = function() {
	var v = new JkHttpWorkerHTTPWorkerResponse;
	return v.CTOR_JkHttpWorkerHTTPWorkerResponse();
};

JkHttpWorkerHTTPWorkerResponse.prototype.CTOR_JkHttpWorkerHTTPWorkerResponse = function() {
	this.body = null;
	this.headers = null;
	this.status = null;
	this.setStatus(null);
	this.setHeaders(null);
	this.setBody(null);
	return this;
};

JkHttpWorkerHTTPWorkerResponse.prototype.setContentType = function(type) {
	this.addHeader("Content-Type", type);
};

JkHttpWorkerHTTPWorkerResponse.prototype.setResponseBuffer = function(type, buffer) {
	this.setContentType(type);
	this.setBody(buffer);
};

JkHttpWorkerHTTPWorkerResponse.prototype.setResponseString = function(type, resp) {
	this.setContentType(type);
	this.setBody((JkLangString.toUTF8Buffer(resp)));
};

JkHttpWorkerHTTPWorkerResponse.prototype.setResponseHtml = function(html) {
	this.setResponseString("text/html", html);
};

JkHttpWorkerHTTPWorkerResponse.prototype.setResponseText = function(text) {
	this.setResponseString("text/plain", text);
};

JkHttpWorkerHTTPWorkerResponse.prototype.setResponseJson = function(text) {
	this.setResponseString("application/json", text);
};

JkHttpWorkerHTTPWorkerResponse.prototype.setResponseBinary = function(data) {
	this.setResponseBuffer("application/octet-stream", data);
};

JkHttpWorkerHTTPWorkerResponse.prototype.addHeader = function(key, value) {
	if(!(key != null)) {
		return;
	}
	if(!(this.headers != null)) {
		this.headers = JkLangKeyValueList.NEW();
	}
	this.headers.add(key, value);
};

JkHttpWorkerHTTPWorkerResponse.prototype.getHeaderValue = function(name) {
	if(!(name != null)) {
		return null;
	}
	if(!(this.headers != null)) {
		return null;
	}
	var it = this.headers.iterate();
	while(it != null){
		var vv = it.next();
		if(!(vv != null)) {
			break;
		}
		if(name == JkLangString.toLowerCase(vv.key)) {
			return vv.value;
		}
	}
	return null;
};

JkHttpWorkerHTTPWorkerResponse.prototype.addCookie = function(cookie) {
	if(!(cookie != null)) {
		return;
	}
	this.addHeader("Set-Cookie", (cookie.toString()));
};

JkHttpWorkerHTTPWorkerResponse.prototype.send = function() {
	var writer = JkWorkerWorker.getOutputWriter();
	var builder = JkMypacketMyPacketBuilder.NEW();
	builder.appendLengthEncodedString(this.status);
	if(this.headers != null) {
		var count = this.headers.count();
		builder.appendLengthEncodedInteger(count);
		for(var n = 0 ; n < count ; n++) {
			var key = this.headers.getKey(n);
			var val = this.headers.getValue(n);
			if(!(key != null)) {
				key = "";
			}
			if(!(val != null)) {
				val = "";
			}
			builder.appendLengthEncodedString(key);
			builder.appendLengthEncodedString(val);
		}
	}
	else {
		builder.appendLengthEncodedInteger(0);
	}
	builder.appendLengthEncodedBuffer(this.body);
	writer.write((builder.finalize()), (-1));
};

JkHttpWorkerHTTPWorkerResponse.prototype.getStatus = function() {
	return this.status;
};

JkHttpWorkerHTTPWorkerResponse.prototype.setStatus = function(v) {
	this.status = v;
	return this;
};

JkHttpWorkerHTTPWorkerResponse.prototype.getHeaders = function() {
	return this.headers;
};

JkHttpWorkerHTTPWorkerResponse.prototype.setHeaders = function(v) {
	this.headers = v;
	return this;
};

JkHttpWorkerHTTPWorkerResponse.prototype.getBody = function() {
	return this.body;
};

JkHttpWorkerHTTPWorkerResponse.prototype.setBody = function(v) {
	this.body = v;
	return this;
};

JkHttpWorkerHTTPWorkerResponse.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpWorkerHTTPWorkerResponse"] === true;
};

let JkHttpWorkerHTTPRPCRouter = function() {
	JkHttpWorkerHTTPWorkerRouter.call(this);
};

JkHttpWorkerHTTPRPCRouter.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkHttpWorkerHTTPWorkerRouter.prototype);
JkHttpWorkerHTTPRPCRouter.prototype.constructor = JkHttpWorkerHTTPRPCRouter;
JkHttpWorkerHTTPRPCRouter.prototype._t = {
	"JkHttpWorkerHTTPWorkerHandler" : true,
	"JkHttpWorkerHTTPWorkerRouter" : true,
	"JkHttpWorkerHTTPRPCRouter" : true,
	"JkLangRunnable" : true
};
JkHttpWorkerHTTPRPCRouter.prototype._tobj = JkHttpWorkerHTTPRPCRouter;

JkHttpWorkerHTTPRPCRouter.NEW = function() {
	var v = new JkHttpWorkerHTTPRPCRouter;
	return v.CTOR_JkHttpWorkerHTTPRPCRouter();
};

JkHttpWorkerHTTPRPCRouter.prototype.CTOR_JkHttpWorkerHTTPRPCRouter = function() {
	if(JkHttpWorkerHTTPWorkerRouter.prototype.CTOR_JkHttpWorkerHTTPWorkerRouter.call(this) == null) {
		return null;
	}
	return this;
};

JkHttpWorkerHTTPRPCRouter.prototype.addFunction = function(name, handler) {
	var h = handler;
	this.addRoute("POST", "/func/" + (JkLangString.safeString(name)), (function(req1, resp1, vars1) {
		try {
			var bodyString = req1.getBodyString();
			var data = (function(o) {
				if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
					return o;
				}
				return null;
			}.bind(this))((JkJsonJSONParser.parseString(bodyString)));
			if(!(data != null)) {
				var ctx = this.getCtx();
				if(ctx != null && ctx.isInDebugMode()) {
					JkLogLog.debug(ctx, "Invalid body: `" + (JkLangString.safeString((JkLangString.asString(req1)))) + ("'"));
				}
				JkLangError._throw("invalidBody", null);
			}
			var v = h(data);
			var r = JkLangDynamicMap.NEW();
			r.setString("status", "ok");
			r.setObject("data", v);
			resp1.setStatus("200");
			resp1.setBody((JkLangString.toUTF8Buffer((JkJsonJSONEncoder.toString(r)))));
		}
		catch(e) {
			JkLogLog.error((this.getCtx()), (JkLangString.asString(e)));
			resp1.setStatus("500");
			var r1 = JkLangDynamicMap.NEW();
			r1.setString("status", "error");
			r1.setString("errorCode", (e.getErrorCode()));
			r1.setString("errorDetail", (JkLangString.asString((e.getErrorDetail()))));
			resp1.setBody((JkLangString.toUTF8Buffer((JkJsonJSONEncoder.toString(r1)))));
		}
		catch(e1) {
			JkLogLog.error((this.getCtx()), (JkLangString.asString(e1)));
			resp1.setStatus("500");
			var r2 = JkLangDynamicMap.NEW();
			r2.setString("status", "error");
			resp1.setBody((JkLangString.toUTF8Buffer((JkJsonJSONEncoder.toString(r2)))));
		}
		resp1.setHeaders(null);
		resp1.setContentType("application/json");
	}.bind(this)));
};

JkHttpWorkerHTTPRPCRouter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpWorkerHTTPRPCRouter"] === true;
};
