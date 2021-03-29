let JkJwtRS256 = function() {
	this.lastErrorDescription = null;
};

JkJwtRS256.prototype._t = { "JkJwtRS256" : true };
JkJwtRS256.prototype._tobj = JkJwtRS256;

JkJwtRS256.NEW = function() {
	var v = new JkJwtRS256;
	return v.CTOR_JkJwtRS256();
};

JkJwtRS256.prototype.CTOR_JkJwtRS256 = function() {
	this.lastErrorDescription = null;
	return this;
};

JkJwtRS256.instance = function() {
	console.log("[jk.jwt.RS256.instance] (RS256.sling:36:3): Not implemented");
	return null;
};

JkJwtRS256.prototype.generate = function(data, privateKey) {};

JkJwtRS256.prototype.validate = function(data, signature, publicKey) {};

JkJwtRS256.prototype.getLastErrorDescription = function() {
	return this.lastErrorDescription;
};

JkJwtRS256.prototype.setLastErrorDescription = function(v) {
	this.lastErrorDescription = v;
	return this;
};

JkJwtRS256.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkJwtRS256"] === true;
};

let JkJwtJWT = function() {
	this.claims = JkLangDynamicMap.NEW();
};

JkJwtJWT.prototype._t = { "JkJwtJWT" : true };
JkJwtJWT.prototype._tobj = JkJwtJWT;

JkJwtJWT.NEW = function() {
	var v = new JkJwtJWT;
	return v.CTOR_JkJwtJWT();
};

JkJwtJWT.prototype.CTOR_JkJwtJWT = function() {
	this.claims = JkLangDynamicMap.NEW();
	return this;
};

JkJwtJWT.decode = function(token, keys) {
	if(!(token != null)) {
		return null;
	}
	var comps = JkLangString.split(token, '.'.charCodeAt(), 3);
	if(!(JkLangVector.getSize(comps) == 3)) {
		return null;
	}
	var headerBuffer = JkBase64Base64Decoder.decode((JkBase64Base64Decoder.fromUrlSafeFormat((JkLangVector.get(comps, 0)))));
	if(!(headerBuffer != null)) {
		return null;
	}
	var headerJson = JkLangString.forUTF8Buffer(headerBuffer);
	if(!(headerJson != null)) {
		return null;
	}
	var header = (function(o) {
		if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((JkJsonJSONParser.parseString(headerJson)));
	if(!(header != null)) {
		return null;
	}
	var claimsBuffer = JkBase64Base64Decoder.decode((JkBase64Base64Decoder.fromUrlSafeFormat((JkLangVector.get(comps, 1)))));
	if(!(claimsBuffer != null)) {
		return null;
	}
	var claimsJson = JkLangString.forUTF8Buffer(claimsBuffer);
	if(!(claimsJson != null)) {
		return null;
	}
	var claims = (function(o1) {
		if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o1)) {
			return o1;
		}
		return null;
	}.bind(this))((JkJsonJSONParser.parseString(claimsJson)));
	if(!(claims != null)) {
		return null;
	}
	var signature = JkBase64Base64Decoder.decode((JkBase64Base64Decoder.fromUrlSafeFormat((JkLangVector.get(comps, 2)))));
	var alg = header.getString("alg", null);
	if(JkLangString.isEmpty(alg) || JkLangString.equalsIgnoreCase(alg, "none")) {
		;
	}
	else if(keys != null) {
		if(JkLangString.equalsIgnoreCase(alg, "HS256")) {
			var key = JkLangString.asString((JkLangMap.get(keys, "hs256")));
			if(!(key != null)) {
				return null;
			}
			return null;
		}
		else if(JkLangString.equalsIgnoreCase(alg, "RS256")) {
			var rsa = JkJwtRS256.instance();
			if(!(rsa != null)) {
				return null;
			}
			var key1 = JkLangString.asString((JkLangMap.get(keys, "rs256")));
			if(!(key1 != null)) {
				return null;
			}
			var data = (JkLangString.safeString((JkLangVector.get(comps, 0)))) + (".") + (JkLangString.safeString((JkLangVector.get(comps, 1))));
			if(!rsa.validate((JkLangString.toUTF8Buffer(data)), signature, key1)) {
				return null;
			}
		}
		else {
			return null;
		}
	}
	else {
		;
	}
	var v = JkJwtJWT.NEW();
	v.setClaims(claims);
	return v;
};

JkJwtJWT.prototype.setClaims = function(v) {
	if(!(v != null)) {
		this.claims = JkLangDynamicMap.NEW();
	}
	else {
		this.claims = v;
	}
};

JkJwtJWT.prototype.getClaims = function() {
	return this.claims;
};

JkJwtJWT.prototype.setIssuer = function(v) {
	this.claims.setString("iss", v);
};

JkJwtJWT.prototype.getIssuer = function() {
	return this.claims.getString("iss", null);
};

JkJwtJWT.prototype.setSubject = function(v) {
	this.claims.setString("sub", v);
};

JkJwtJWT.prototype.getSubject = function() {
	return this.claims.getString("sub", null);
};

JkJwtJWT.prototype.setAudience = function(v) {
	this.claims.setString("aud", v);
};

JkJwtJWT.prototype.getAudience = function() {
	return this.claims.getString("aud", null);
};

JkJwtJWT.prototype.setExpirationTime = function(v) {
	this.claims.setString("exp", (JkLangString.forLongInteger(v)));
};

JkJwtJWT.prototype.getExpirationTime = function() {
	return this.claims.getLongInteger("exp", 0);
};

JkJwtJWT.prototype.setNotBefore = function(v) {
	this.claims.setString("nbf", (JkLangString.forLongInteger(v)));
};

JkJwtJWT.prototype.getNotBefore = function() {
	return this.claims.getLongInteger("nbf", 0);
};

JkJwtJWT.prototype.setIssuedAt = function(v) {
	this.claims.setString("iat", (JkLangString.forLongInteger(v)));
};

JkJwtJWT.prototype.getIssuedAt = function() {
	return this.claims.getLongInteger("iat", 0);
};

JkJwtJWT.prototype.setJwtId = function(v) {
	this.claims.setString("jti", v);
};

JkJwtJWT.prototype.getJwtId = function() {
	return this.claims.getString("jti", null);
};

JkJwtJWT.prototype.setClaim = function(key, value) {
	this.claims.setString(key, value);
};

JkJwtJWT.prototype.getClaim = function(key) {
	return this.claims.getString(key, null);
};

JkJwtJWT.prototype.validate = function(issuer, audience) {
	if(!this.isActive()) {
		return false;
	}
	if(issuer != null) {
		if(!this.isIssuer(issuer)) {
			return false;
		}
	}
	if(audience != null) {
		if(!this.isAudience(audience)) {
			return false;
		}
	}
	return true;
};

JkJwtJWT.prototype.isIssuer = function(value) {
	return JkLangString.equals((this.claims.getString("iss", null)), value);
};

JkJwtJWT.prototype.isAudience = function(value) {
	return JkLangString.equals((this.claims.getString("aud", null)), value);
};

JkJwtJWT.prototype.isActive = function() {
	if(!(this.isExpired() == false)) {
		return false;
	}
	var nbf = this.claims.getLongInteger("nbf", 0);
	if(nbf < 1) {
		return true;
	}
	if(JkTimeSystemClock.asUTCSeconds() < nbf) {
		return false;
	}
	return true;
};

JkJwtJWT.prototype.isExpired = function() {
	var exp = this.claims.getLongInteger("exp", 0);
	if(exp < 1) {
		return false;
	}
	if(JkTimeSystemClock.asUTCSeconds() < exp) {
		return false;
	}
	return true;
};

JkJwtJWT.prototype.encodeUrlSafe = function(buff) {
	if(!(buff != null)) {
		return null;
	}
	return JkBase64Base64Encoder.toUrlSafeFormat((JkBase64Base64Encoder.encode(buff)));
};

JkJwtJWT.prototype.generateHeaderContent = function(alg) {
	var v = JkLangDynamicMap.NEW();
	v.setString("alg", alg);
	v.setString("typ", "JWT");
	return JkJsonJSONEncoder.encode(v, false, false);
};

JkJwtJWT.prototype.generateClaimsContent = function() {
	return JkJsonJSONEncoder.encode(this.claims, false, false);
};

JkJwtJWT.prototype.generateTokenWithRS256 = function(privateKey) {
	var rsa = JkJwtRS256.instance();
	if(!(rsa != null)) {
		return null;
	}
	var sb = JkLangStringBuilder.NEW();
	sb.appendString((this.encodeUrlSafe((JkLangString.toUTF8Buffer((this.generateHeaderContent("RS256")))))));
	sb.appendCharacter('.'.charCodeAt());
	sb.appendString((this.encodeUrlSafe((JkLangString.toUTF8Buffer((this.generateClaimsContent()))))));
	var data = sb.toString();
	var sigdata = rsa.generate((JkLangString.toUTF8Buffer(data)), privateKey);
	var sb2 = JkLangStringBuilder.NEW();
	sb2.appendString(data);
	sb2.appendCharacter('.'.charCodeAt());
	sb2.appendString((this.encodeUrlSafe(sigdata)));
	return sb2.toString();
};

JkJwtJWT.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkJwtJWT"] === true;
};

let JkJwtJWKToPEMConverter = function() {};

JkJwtJWKToPEMConverter.prototype._t = { "JkJwtJWKToPEMConverter" : true };
JkJwtJWKToPEMConverter.prototype._tobj = JkJwtJWKToPEMConverter;

JkJwtJWKToPEMConverter.NEW = function() {
	var v = new JkJwtJWKToPEMConverter;
	return v.CTOR_JkJwtJWKToPEMConverter();
};

JkJwtJWKToPEMConverter.prototype.CTOR_JkJwtJWKToPEMConverter = function() {
	return this;
};

JkJwtJWKToPEMConverter.convertString = function(data) {
	if(!(data != null)) {
		return null;
	}
	return JkJwtJWKToPEMConverter.convertMap(((function(o) {
		if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((JkJsonJSONParser.parseString(data)))));
};

JkJwtJWKToPEMConverter.convertMap = function(dm) {
	if(!(dm != null)) {
		return null;
	}
	var str = null;
	var n = JkBase64Base64Decoder.fromUrlSafeFormat((dm.getString("n", null)));
	var e = JkBase64Base64Decoder.fromUrlSafeFormat((dm.getString("e", null)));
	return str;
};

JkJwtJWKToPEMConverter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkJwtJWKToPEMConverter"] === true;
};
