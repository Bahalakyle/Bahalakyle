let JkHttpServerCookieHTTPServerCookie = function() {
	this.key = null;
	this.value = null;
	this.maxAge = -1;
	this.expires = null;
	this.path = null;
	this.domain = null;
	this.secure = false;
	this.httpOnly = false;
	this.sameSite = null;
};

JkHttpServerCookieHTTPServerCookie.prototype._t = {
	"JkHttpServerCookieHTTPServerCookie" : true,
	"JkLangStringObject" : true
};
JkHttpServerCookieHTTPServerCookie.prototype._tobj = JkHttpServerCookieHTTPServerCookie;

JkHttpServerCookieHTTPServerCookie.NEW_StringString = function(key, value) {
	var v = new JkHttpServerCookieHTTPServerCookie;
	return v.CTOR_JkHttpServerCookieHTTPServerCookie_StringString(key, value);
};

JkHttpServerCookieHTTPServerCookie.prototype.CTOR_JkHttpServerCookieHTTPServerCookie_StringString = function(key, value) {
	this.sameSite = null;
	this.httpOnly = false;
	this.secure = false;
	this.domain = null;
	this.path = null;
	this.expires = null;
	this.maxAge = -1;
	this.value = null;
	this.key = null;
	this.key = key;
	this.value = value;
	return this;
};

JkHttpServerCookieHTTPServerCookie.NEW = function() {
	var v = new JkHttpServerCookieHTTPServerCookie;
	return v.CTOR_JkHttpServerCookieHTTPServerCookie();
};

JkHttpServerCookieHTTPServerCookie.prototype.CTOR_JkHttpServerCookieHTTPServerCookie = function() {
	this.sameSite = null;
	this.httpOnly = false;
	this.secure = false;
	this.domain = null;
	this.path = null;
	this.expires = null;
	this.maxAge = -1;
	this.value = null;
	this.key = null;
	;
	return this;
};

JkHttpServerCookieHTTPServerCookie.forKeyValue = function(key, value) {
	var v = JkHttpServerCookieHTTPServerCookie.NEW();
	v.setKey(key);
	v.setValue(value);
	return v;
};

JkHttpServerCookieHTTPServerCookie.forDeleteKey = function(key) {
	var v = JkHttpServerCookieHTTPServerCookie.NEW();
	v.setKey(key);
	v.setExpires("Thu, 01 Jan 1970 00:00:00 GMT");
	return v;
};

JkHttpServerCookieHTTPServerCookie.prototype.toString = function() {
	var sb = JkLangStringBuilder.NEW();
	sb.appendString(this.key);
	sb.appendCharacter('='.charCodeAt());
	if(this.value != null) {
		sb.appendString(this.value);
	}
	if(this.maxAge >= 0) {
		sb.appendString("; Max-Age=");
		sb.appendString((JkLangString.forInteger(this.maxAge)));
	}
	if(JkLangString.isNotEmpty(this.expires)) {
		sb.appendString("; Expires=");
		sb.appendString(this.expires);
	}
	if(JkLangString.isNotEmpty(this.path)) {
		sb.appendString("; Path=");
		sb.appendString(this.path);
	}
	if(JkLangString.isNotEmpty(this.domain)) {
		sb.appendString("; Domain=");
		sb.appendString(this.domain);
	}
	if(this.secure) {
		sb.appendString("; Secure");
	}
	if(this.httpOnly) {
		sb.appendString("; HttpOnly");
	}
	if(JkLangString.isNotEmpty(this.sameSite)) {
		sb.appendString("; SameSite=");
		sb.appendString(this.sameSite);
	}
	return sb.toString();
};

JkHttpServerCookieHTTPServerCookie.prototype.getKey = function() {
	return this.key;
};

JkHttpServerCookieHTTPServerCookie.prototype.setKey = function(v) {
	this.key = v;
	return this;
};

JkHttpServerCookieHTTPServerCookie.prototype.getValue = function() {
	return this.value;
};

JkHttpServerCookieHTTPServerCookie.prototype.setValue = function(v) {
	this.value = v;
	return this;
};

JkHttpServerCookieHTTPServerCookie.prototype.getMaxAge = function() {
	return this.maxAge;
};

JkHttpServerCookieHTTPServerCookie.prototype.setMaxAge = function(v) {
	this.maxAge = v;
	return this;
};

JkHttpServerCookieHTTPServerCookie.prototype.getExpires = function() {
	return this.expires;
};

JkHttpServerCookieHTTPServerCookie.prototype.setExpires = function(v) {
	this.expires = v;
	return this;
};

JkHttpServerCookieHTTPServerCookie.prototype.getPath = function() {
	return this.path;
};

JkHttpServerCookieHTTPServerCookie.prototype.setPath = function(v) {
	this.path = v;
	return this;
};

JkHttpServerCookieHTTPServerCookie.prototype.getDomain = function() {
	return this.domain;
};

JkHttpServerCookieHTTPServerCookie.prototype.setDomain = function(v) {
	this.domain = v;
	return this;
};

JkHttpServerCookieHTTPServerCookie.prototype.getSecure = function() {
	return this.secure;
};

JkHttpServerCookieHTTPServerCookie.prototype.setSecure = function(v) {
	this.secure = v;
	return this;
};

JkHttpServerCookieHTTPServerCookie.prototype.getHttpOnly = function() {
	return this.httpOnly;
};

JkHttpServerCookieHTTPServerCookie.prototype.setHttpOnly = function(v) {
	this.httpOnly = v;
	return this;
};

JkHttpServerCookieHTTPServerCookie.prototype.getSameSite = function() {
	return this.sameSite;
};

JkHttpServerCookieHTTPServerCookie.prototype.setSameSite = function(v) {
	this.sameSite = v;
	return this;
};

JkHttpServerCookieHTTPServerCookie.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkHttpServerCookieHTTPServerCookie"] === true;
};
