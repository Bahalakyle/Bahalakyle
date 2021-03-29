let JkUrlQueryString = function() {};

JkUrlQueryString.prototype._t = { "JkUrlQueryString" : true };
JkUrlQueryString.prototype._tobj = JkUrlQueryString;

JkUrlQueryString.NEW = function() {
	var v = new JkUrlQueryString;
	return v.CTOR_JkUrlQueryString();
};

JkUrlQueryString.prototype.CTOR_JkUrlQueryString = function() {
	return this;
};

JkUrlQueryString.parse = function(queryString) {
	var v = new Map;
	if(JkLangString.isEmpty(queryString)) {
		return v;
	}
	var array = JkLangString.split(queryString, '&'.charCodeAt(), 0);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var qs = array[n];
			if(qs != null) {
				if(JkLangString.isEmpty(qs)) {
					continue;
				}
				if(JkLangString.getIndexOfCharacter(qs, '='.charCodeAt(), 0) < 0) {
					JkLangMap.set(v, qs, null);
					continue;
				}
				var qsps = JkLangString.split(qs, '='.charCodeAt(), 2);
				var key = qsps[0];
				var val = qsps[1];
				if(val == null) {
					val = "";
				}
				if(JkLangString.isEmpty(key) == false) {
					JkLangMap.set(v, (JkUrlURLDecoder.decode(key)), (JkUrlURLDecoder.decode(val)));
				}
			}
		}
	}
	return v;
};

JkUrlQueryString.encode = function(queryString) {
	var str = JkLangStringBuilder.NEW();
	var first = true;
	var keys = JkLangMap.getKeys(queryString);
	if(keys != null) {
		var n = 0;
		var m = keys.length;
		for(n = 0 ; n < m ; n++) {
			var key = keys[n];
			if(key != null) {
				if(JkLangString.isEmpty(key)) {
					continue;
				}
				var val = JkLangMap.getValue(queryString, key);
				if(!first) {
					str.appendString("&");
				}
				str.appendString((JkUrlURLEncoder.encode(key, false, true)));
				str.appendCharacter('='.charCodeAt());
				str.appendString((JkUrlURLEncoder.encode(val, false, true)));
				first = false;
			}
		}
	}
	return str.toString();
};

JkUrlQueryString.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUrlQueryString"] === true;
};

let JkUrlURLDecoder = function() {};

JkUrlURLDecoder.prototype._t = { "JkUrlURLDecoder" : true };
JkUrlURLDecoder.prototype._tobj = JkUrlURLDecoder;

JkUrlURLDecoder.NEW = function() {
	var v = new JkUrlURLDecoder;
	return v.CTOR_JkUrlURLDecoder();
};

JkUrlURLDecoder.prototype.CTOR_JkUrlURLDecoder = function() {
	return this;
};

JkUrlURLDecoder.xcharToInteger = function(c) {
	if(c >= '0'.charCodeAt() && c <= '9'.charCodeAt()) {
		var ci = ~(~c);
		return ci - '0'.charCodeAt();
	}
	else if(c >= 'a'.charCodeAt() && c <= 'f'.charCodeAt()) {
		return 10 + c - 'a'.charCodeAt();
	}
	else if(c >= 'A'.charCodeAt() && c <= 'F'.charCodeAt()) {
		return 10 + c - 'A'.charCodeAt();
	}
	return 0;
};

JkUrlURLDecoder.decode = function(astr) {
	if(!(astr != null)) {
		return null;
	}
	var sb = JkLangStringBuilder.NEW();
	var str = JkLangString.strip(astr);
	var it = JkLangString.iterate(str);
	while(it != null){
		var x = it.getNextChar();
		if(x < 1) {
			break;
		}
		if(x == '%'.charCodeAt()) {
			var x1 = it.getNextChar();
			var x2 = it.getNextChar();
			if(x1 > 0 && x2 > 0) {
				sb.appendCharacter((JkUrlURLDecoder.xcharToInteger(x1) * 16 + JkUrlURLDecoder.xcharToInteger(x2)));
			}
			else {
				break;
			}
		}
		else if(x == '+'.charCodeAt()) {
			sb.appendCharacter(' '.charCodeAt());
		}
		else {
			sb.appendCharacter(x);
		}
	}
	return sb.toString();
};

JkUrlURLDecoder.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUrlURLDecoder"] === true;
};

let JkUrlURL = function() {
	this.scheme = null;
	this.username = null;
	this.password = null;
	this.host = null;
	this.port = null;
	this.path = null;
	this.fragment = null;
	this.rawQueryParameters = null;
	this.queryParameters = null;
	this.original = null;
	this.percentOnly = false;
	this.encodeUnreservedChars = true;
};

JkUrlURL.prototype._t = {
	"JkUrlURL" : true,
	"JkLangStringObject" : true
};
JkUrlURL.prototype._tobj = JkUrlURL;

JkUrlURL.NEW = function() {
	var v = new JkUrlURL;
	return v.CTOR_JkUrlURL();
};

JkUrlURL.prototype.CTOR_JkUrlURL = function() {
	this.encodeUnreservedChars = true;
	this.percentOnly = false;
	this.original = null;
	this.queryParameters = null;
	this.rawQueryParameters = null;
	this.fragment = null;
	this.path = null;
	this.port = null;
	this.host = null;
	this.password = null;
	this.username = null;
	this.scheme = null;
	return this;
};

JkUrlURL.forString = function(str, normalizePath) {
	var v = JkUrlURL.NEW();
	v.parse(str, normalizePath);
	return v;
};

JkUrlURL.prototype.dup = function() {
	var v = JkUrlURL.NEW();
	v.setScheme(this.scheme);
	v.setUsername(this.username);
	v.setPassword(this.password);
	v.setHost(this.host);
	v.setPort(this.port);
	v.setPath(this.path);
	v.setFragment(this.fragment);
	if(this.rawQueryParameters != null) {
		v.setRawQueryParameters((this.rawQueryParameters.dup()));
	}
	if(this.queryParameters != null) {
		v.setQueryParameters((JkLangMap.dup(this.queryParameters)));
	}
	return v;
};

JkUrlURL.prototype.toString = function() {
	return this.toStringDo(true);
};

JkUrlURL.prototype.toStringNohost = function() {
	return this.toStringDo(false);
};

JkUrlURL.prototype.toStringDo = function(userhost) {
	var sb = JkLangStringBuilder.NEW();
	if(userhost) {
		if(this.scheme != null) {
			sb.appendString(this.scheme);
			sb.appendString("://");
		}
		if(this.username != null) {
			sb.appendString((JkUrlURLEncoder.encode(this.username, false, true)));
			if(this.password != null) {
				sb.appendCharacter(':'.charCodeAt());
				sb.appendString((JkUrlURLEncoder.encode(this.password, false, true)));
			}
			sb.appendCharacter('@'.charCodeAt());
		}
		if(this.host != null) {
			sb.appendString(this.host);
			if(this.port != null) {
				sb.appendCharacter(':'.charCodeAt());
				sb.appendString(this.port);
			}
		}
	}
	if(this.path != null) {
		sb.appendString((JkLangString.replaceCharacter(this.path, ' '.charCodeAt(), '+'.charCodeAt())));
	}
	if(this.rawQueryParameters != null && this.rawQueryParameters.count() > 0) {
		var first = true;
		var it = JkLangMap.iterateKeys(this.queryParameters);
		while(it != null){
			var key = (function(o) {
				if(typeof(o) === 'string') {
					return o;
				}
				return null;
			}.bind(this))((it.next()));
			if(key == null) {
				break;
			}
			if(first) {
				sb.appendCharacter('?'.charCodeAt());
				first = false;
			}
			else {
				sb.appendCharacter('&'.charCodeAt());
			}
			sb.appendString(key);
			var val = JkLangMap.get(this.queryParameters, key);
			if(val != null) {
				sb.appendCharacter('='.charCodeAt());
				sb.appendString((JkUrlURLEncoder.encode(val, this.percentOnly, this.encodeUnreservedChars)));
			}
		}
	}
	if(this.fragment != null) {
		sb.appendCharacter('#'.charCodeAt());
		sb.appendString(this.fragment);
	}
	return sb.toString();
};

JkUrlURL.prototype.clearQueryParameters = function() {
	this.rawQueryParameters = null;
	this.queryParameters = null;
};

JkUrlURL.prototype.normalizePath = function(path) {
	if(!(path != null)) {
		return null;
	}
	var v = JkLangStringBuilder.NEW();
	var comps = JkLangString.split(path, '/'.charCodeAt(), 0);
	if(comps != null) {
		var n = 0;
		var m = comps.length;
		for(n = 0 ; n < m ; n++) {
			var comp = comps[n];
			if(comp != null) {
				if(JkLangString.isEmpty(comp)) {
					;
				}
				else if(comp == ".") {
					;
				}
				else if(comp == "..") {
					var str = v.toString();
					v.clear();
					if(str != null) {
						var slash = JkLangString.getLastIndexOfCharacter(str, '/'.charCodeAt(), (-1));
						if(slash > 0) {
							v.appendString((JkLangString.getSubString(str, 0, slash)));
						}
					}
				}
				else {
					v.appendCharacter('/'.charCodeAt());
					v.appendString(comp);
				}
			}
		}
	}
	if(v.count() < 2) {
		return "/";
	}
	if(JkLangString.endsWith(path, "/")) {
		v.appendCharacter('/'.charCodeAt());
	}
	return v.toString();
};

JkUrlURL.prototype.parse = function(astr, doNormalizePath) {
	this.setOriginal(astr);
	if(!(astr != null)) {
		return;
	}
	var fsp = JkLangString.split(astr, '#'.charCodeAt(), 2);
	var str = JkLangVector.get(fsp, 0);
	this.fragment = JkLangVector.get(fsp, 1);
	var qsplit = JkLangString.split(str, '?'.charCodeAt(), 2);
	str = JkLangVector.get(qsplit, 0);
	var queryString = JkLangVector.get(qsplit, 1);
	if(JkLangString.isEmpty(queryString) == false) {
		var qss = JkLangString.split(queryString, '&'.charCodeAt(), 0);
		if(qss != null) {
			var n = 0;
			var m = qss.length;
			for(n = 0 ; n < m ; n++) {
				var qs = qss[n];
				if(qs != null) {
					if(!(this.rawQueryParameters != null)) {
						this.rawQueryParameters = JkLangKeyValueList.NEW();
					}
					if(!(this.queryParameters != null)) {
						this.queryParameters = new Map;
					}
					if(JkLangString.getIndexOfCharacter(qs, '='.charCodeAt(), 0) < 0) {
						JkLangMap.set(this.queryParameters, qs, null);
						this.rawQueryParameters.add(qs, null);
						continue;
					}
					var qsps = JkLangString.split(qs, '='.charCodeAt(), 2);
					var key = JkLangVector.get(qsps, 0);
					var val = JkLangVector.get(qsps, 1);
					if(JkLangString.isEmpty(key) == false) {
						if(!(val != null)) {
							val = "";
						}
						var udv = JkUrlURLDecoder.decode(val);
						JkLangMap.set(this.queryParameters, key, udv);
						this.rawQueryParameters.add(key, udv);
					}
				}
			}
		}
	}
	var css = JkLangString.getIndexOfString(str, "://", 0);
	if(css >= 0) {
		this.scheme = JkLangString.getSubString(str, 0, css);
		if(JkLangString.getIndexOfCharacter(this.scheme, ':'.charCodeAt(), 0) >= 0 || JkLangString.getIndexOfCharacter(this.scheme, '/'.charCodeAt(), 0) >= 0) {
			this.scheme = null;
		}
		else {
			str = JkLangString.getEndOfString(str, (css + 3));
		}
	}
	var pp = null;
	if(JkLangString.getChar(str, 0) == '/'.charCodeAt()) {
		pp = str;
	}
	else {
		if(JkLangString.getIndexOfCharacter(str, '/'.charCodeAt(), 0) >= 0) {
			var sssplit = JkLangString.split(str, '/'.charCodeAt(), 2);
			str = JkLangVector.get(sssplit, 0);
			pp = JkLangVector.get(sssplit, 1);
			if(!(pp != null)) {
				pp = "";
			}
			if(JkLangString.getChar(pp, 0) != '/'.charCodeAt()) {
				pp = JkLangString.appendString("/", pp);
			}
		}
		if(JkLangString.getIndexOfCharacter(str, '@'.charCodeAt(), 0) >= 0) {
			var asplit = JkLangString.split(str, '@'.charCodeAt(), 2);
			var auth = JkLangVector.get(asplit, 0);
			str = JkLangVector.get(asplit, 1);
			if(JkLangString.getIndexOfCharacter(auth, ':'.charCodeAt(), 0) >= 0) {
				var acsplit = JkLangString.split(auth, ':'.charCodeAt(), 2);
				this.username = JkUrlURLDecoder.decode((JkLangVector.get(acsplit, 0)));
				this.password = JkUrlURLDecoder.decode((JkLangVector.get(acsplit, 1)));
			}
			else {
				this.username = auth;
			}
		}
		if(JkLangString.getIndexOfCharacter(str, ':'.charCodeAt(), 0) >= 0) {
			var hcsplit = JkLangString.split(str, ':'.charCodeAt(), 2);
			str = JkLangVector.get(hcsplit, 0);
			this.port = JkLangVector.get(hcsplit, 1);
		}
		this.host = str;
	}
	if(doNormalizePath) {
		this.path = this.normalizePath(pp);
	}
	else {
		this.path = pp;
	}
	if(!(this.port != null) && JkLangString.equals("https", this.scheme) || JkLangString.equals("wss", this.scheme)) {
		this.port = "443";
	}
};

JkUrlURL.prototype.getPortInt = function() {
	if(!(this.port != null)) {
		return 0;
	}
	return JkLangString.toInteger(this.port);
};

JkUrlURL.prototype.getQueryParameter = function(key) {
	if(!(this.queryParameters != null)) {
		return null;
	}
	return JkLangMap.get(this.queryParameters, key);
};

JkUrlURL.prototype.addQueryParameter = function(key, value) {
	if(!(this.rawQueryParameters != null)) {
		this.rawQueryParameters = JkLangKeyValueList.NEW();
	}
	if(!(this.queryParameters != null)) {
		this.queryParameters = new Map;
	}
	JkLangMap.set(this.queryParameters, key, value);
	this.rawQueryParameters.add(key, value);
};

JkUrlURL.prototype.getScheme = function() {
	return this.scheme;
};

JkUrlURL.prototype.setScheme = function(v) {
	this.scheme = v;
	return this;
};

JkUrlURL.prototype.getUsername = function() {
	return this.username;
};

JkUrlURL.prototype.setUsername = function(v) {
	this.username = v;
	return this;
};

JkUrlURL.prototype.getPassword = function() {
	return this.password;
};

JkUrlURL.prototype.setPassword = function(v) {
	this.password = v;
	return this;
};

JkUrlURL.prototype.getHost = function() {
	return this.host;
};

JkUrlURL.prototype.setHost = function(v) {
	this.host = v;
	return this;
};

JkUrlURL.prototype.getPort = function() {
	return this.port;
};

JkUrlURL.prototype.setPort = function(v) {
	this.port = v;
	return this;
};

JkUrlURL.prototype.getPath = function() {
	return this.path;
};

JkUrlURL.prototype.setPath = function(v) {
	this.path = v;
	return this;
};

JkUrlURL.prototype.getFragment = function() {
	return this.fragment;
};

JkUrlURL.prototype.setFragment = function(v) {
	this.fragment = v;
	return this;
};

JkUrlURL.prototype.getRawQueryParameters = function() {
	return this.rawQueryParameters;
};

JkUrlURL.prototype.setRawQueryParameters = function(v) {
	this.rawQueryParameters = v;
	return this;
};

JkUrlURL.prototype.getQueryParameters = function() {
	return this.queryParameters;
};

JkUrlURL.prototype.setQueryParameters = function(v) {
	this.queryParameters = v;
	return this;
};

JkUrlURL.prototype.getOriginal = function() {
	return this.original;
};

JkUrlURL.prototype.setOriginal = function(v) {
	this.original = v;
	return this;
};

JkUrlURL.prototype.getPercentOnly = function() {
	return this.percentOnly;
};

JkUrlURL.prototype.setPercentOnly = function(v) {
	this.percentOnly = v;
	return this;
};

JkUrlURL.prototype.getEncodeUnreservedChars = function() {
	return this.encodeUnreservedChars;
};

JkUrlURL.prototype.setEncodeUnreservedChars = function(v) {
	this.encodeUnreservedChars = v;
	return this;
};

JkUrlURL.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUrlURL"] === true;
};

let JkUrlURLEncoder = function() {};

JkUrlURLEncoder.prototype._t = { "JkUrlURLEncoder" : true };
JkUrlURLEncoder.prototype._tobj = JkUrlURLEncoder;

JkUrlURLEncoder.NEW = function() {
	var v = new JkUrlURLEncoder;
	return v.CTOR_JkUrlURLEncoder();
};

JkUrlURLEncoder.prototype.CTOR_JkUrlURLEncoder = function() {
	return this;
};

JkUrlURLEncoder.encode = function(str, percentOnly, encodeUnreservedChars) {
	if(!(str != null)) {
		return null;
	}
	var buffer = JkLangString.toUTF8Buffer(str);
	var sb = JkLangStringBuilder.NEW();
	for(var i = 0 ; i < buffer.byteLength ; i++) {
		var c = JkLangBuffer.getByte(buffer, i);
		if(c < 1) {
			break;
		}
		if(c >= 'a'.charCodeAt() && c <= 'z'.charCodeAt() || c >= 'A'.charCodeAt() && c <= 'Z'.charCodeAt() || c >= '0'.charCodeAt() && c <= '9'.charCodeAt()) {
			sb.appendCharacter(c);
		}
		else if((c == '-'.charCodeAt() || c == '.'.charCodeAt() || c == '_'.charCodeAt() || c == '~'.charCodeAt()) && encodeUnreservedChars == false) {
			sb.appendCharacter(c);
		}
		else if(c == ' '.charCodeAt() && percentOnly == false) {
			sb.appendCharacter('+'.charCodeAt());
		}
		else {
			sb.appendCharacter('%'.charCodeAt());
			sb.appendString((JkLangString.forIntegerHex((~(~c) & 0xff), 0)));
		}
	}
	return sb.toString();
};

JkUrlURLEncoder.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUrlURLEncoder"] === true;
};
