let JkBase64Base64Decoder = function() {};

JkBase64Base64Decoder.prototype._t = { "JkBase64Base64Decoder" : true };
JkBase64Base64Decoder.prototype._tobj = JkBase64Base64Decoder;

JkBase64Base64Decoder.NEW = function() {
	var v = new JkBase64Base64Decoder;
	return v.CTOR_JkBase64Base64Decoder();
};

JkBase64Base64Decoder.prototype.CTOR_JkBase64Base64Decoder = function() {
	return this;
};

JkBase64Base64Decoder.fromUrlSafeFormat = function(str) {
	var v = str;
	if(!(v != null)) {
		return null;
	}
	v = JkLangString.replaceCharacter(v, '-'.charCodeAt(), '+'.charCodeAt());
	v = JkLangString.replaceCharacter(v, '_'.charCodeAt(), '/'.charCodeAt());
	var mod = JkLangString.getLength(v) % 4;
	if(mod == 1) {
		v = (JkLangString.safeString(v)) + ("===");
	}
	else if(mod == 2) {
		v = (JkLangString.safeString(v)) + ("==");
	}
	else if(mod == 3) {
		v = (JkLangString.safeString(v)) + ("=");
	}
	return v;
};

JkBase64Base64Decoder.appendByte = function(buffer, _byte) {
	var nbyte = JkLangBuffer.allocate(1);
	JkLangBuffer.setByte(nbyte, 0, _byte);
	return JkLangBuffer.append(buffer, nbyte, (JkLangBuffer.getSize(nbyte)));
};

JkBase64Base64Decoder.fromLookupChar = function(ascii) {
	var c = 0;
	if(ascii == 43) {
		c = 62;
	}
	else if(ascii == 47) {
		c = 63;
	}
	else if(ascii >= 48 && ascii <= 57) {
		c = ascii + ~(~4);
	}
	else if(ascii >= 65 && ascii <= 90) {
		c = ascii - ~(~65);
	}
	else if(ascii >= 97 && ascii <= 122) {
		c = ascii - ~(~71);
	}
	return c;
};

JkBase64Base64Decoder.decode = function(text) {
	if(!(text != null)) {
		return null;
	}
	try {
		var binaryString = window.atob(text);
		var len = binaryString.length;
		var buffer = new ArrayBuffer(len);
		var arr = new Uint8Array(buffer);
		for(var i = 0; i < len; i++) {
			arr[i] = binaryString.charCodeAt(i);
		}
		if(buffer != null) {
			return buffer;
		}
	} catch(e) {
		console.log("Exception: " + e.message);
		return null;
	}
	;
	return null;
};

JkBase64Base64Decoder.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkBase64Base64Decoder"] === true;
};

let JkBase64Base64Encoder = function() {};

JkBase64Base64Encoder.prototype._t = { "JkBase64Base64Encoder" : true };
JkBase64Base64Encoder.prototype._tobj = JkBase64Base64Encoder;

JkBase64Base64Encoder.NEW = function() {
	var v = new JkBase64Base64Encoder;
	return v.CTOR_JkBase64Base64Encoder();
};

JkBase64Base64Encoder.prototype.CTOR_JkBase64Base64Encoder = function() {
	return this;
};

JkBase64Base64Encoder.toUrlSafeFormat = function(str) {
	var v = str;
	if(!(v != null)) {
		return null;
	}
	v = JkLangString.replaceString(v, "=", "");
	v = JkLangString.replaceCharacter(v, '+'.charCodeAt(), '-'.charCodeAt());
	v = JkLangString.replaceCharacter(v, '/'.charCodeAt(), '_'.charCodeAt());
	return v;
};

JkBase64Base64Encoder.encodeString = function(str) {
	if(!(str != null)) {
		return null;
	}
	return JkBase64Base64Encoder.encode((JkLangString.toUTF8Buffer(str)));
};

JkBase64Base64Encoder.encode = function(buffer) {
	if(!(buffer != null)) {
		return null;
	}
	var base64 = null;
	var bin = '';
	var bytes = new Uint8Array( buffer );
	var len = bytes.byteLength;
	for (var i = 0; i < len; i++) {
		bin += String.fromCharCode( bytes[i] );
	}
	base64 = window.btoa(bin);
	;
	return base64;
};

JkBase64Base64Encoder.toASCIIChar = function(lookup) {
	var c = 0;
	if(lookup < 0 || lookup > 63) {
		return c;
	}
	if(lookup <= 25) {
		c = lookup + 65;
	}
	else if(lookup <= 51) {
		c = lookup + 71;
	}
	else if(lookup <= 61) {
		c = lookup - 4;
	}
	else if(lookup == 62) {
		c = ~(~'+'.charCodeAt());
	}
	else if(lookup == 63) {
		c = ~(~'/'.charCodeAt());
	}
	return c;
};

JkBase64Base64Encoder.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkBase64Base64Encoder"] === true;
};
