let JkHttpServerCorsHTTPServerCORSUtil = function() {
	this.whitelist = null;
};

JkHttpServerCorsHTTPServerCORSUtil.prototype._t = { "JkHttpServerCorsHTTPServerCORSUtil" : true };
JkHttpServerCorsHTTPServerCORSUtil.prototype._tobj = JkHttpServerCorsHTTPServerCORSUtil;

JkHttpServerCorsHTTPServerCORSUtil.NEW = function() {
	var v = new JkHttpServerCorsHTTPServerCORSUtil;
	return v.CTOR_JkHttpServerCorsHTTPServerCORSUtil();
};

JkHttpServerCorsHTTPServerCORSUtil.prototype.CTOR_JkHttpServerCorsHTTPServerCORSUtil = function() {
	this.whitelist = null;
	return this;
};

JkHttpServerCorsHTTPServerCORSUtil.forWhitelist = function(list) {
	var v = JkHttpServerCorsHTTPServerCORSUtil.NEW();
	v.setWhitelist(list);
	return v;
};

JkHttpServerCorsHTTPServerCORSUtil.prototype.handlePreflightRequest = function(req) {
	var origin = req.getHeader("origin");
	var response = JkHttpServerHTTPServerResponse.NEW();
	response.setStatus("200");
	response.addHeader("Content-Length", "0");
	if(!JkLangVector.contains(this.whitelist, origin)) {
		return response;
	}
	var headers = this.createResponseHeaders(origin, (req.getHeaders()));
	if(!(headers != null)) {
		return null;
	}
	var it = headers.iterate();
	while(it != null){
		var vv = it.next();
		if(!(vv != null)) {
			break;
		}
		response.addHeader(vv.key, vv.value);
	}
	return response;
};

JkHttpServerCorsHTTPServerCORSUtil.prototype.handleWorkerRequest = function(req, resp) {
	var origin = req.getHeaderValue("origin");
	if(!JkLangVector.contains(this.whitelist, origin)) {
		return;
	}
	var headers = this.createResponseHeaders(origin, (req.getHeaders()));
	if(!(headers != null)) {
		return;
	}
	var it = headers.iterate();
	while(it != null){
		var vv = it.next();
		if(!(vv != null)) {
			break;
		}
		resp.addHeader(vv.key, vv.value);
	}
};

JkHttpServerCorsHTTPServerCORSUtil.prototype.createResponseHeaders = function(origin, requestHeaders) {
	if(!(requestHeaders != null)) {
		return null;
	}
	var kv = JkLangKeyValueList.NEW();
	kv.add("Access-Control-Allow-Origin", origin);
	kv.add("Access-Control-Allow-Credentials", "true");
	var rqm = JkLangMap.getValue(requestHeaders, "access-control-request-method");
	if(JkLangString.isNotEmpty(rqm)) {
		kv.add("Access-Control-Allow-Methods", rqm);
	}
	var rqh = JkLangMap.getValue(requestHeaders, "access-control-request-headers");
	if(JkLangString.isNotEmpty(rqh)) {
		kv.add("Access-Control-Allow-Headers", rqh);
	}
	return kv;
};

JkHttpServerCorsHTTPServerCORSUtil.prototype.getWhitelist = function() {
	return this.whitelist;
};

JkHttpServerCorsHTTPServerCORSUtil.prototype.setWhitelist = function(v) {
	this.whitelist = v;
	return this;
};

JkHttpServerCorsHTTPServerCORSUtil.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerCorsHTTPServerCORSUtil"] === true;
};
