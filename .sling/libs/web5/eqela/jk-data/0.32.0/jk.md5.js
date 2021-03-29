let JkMd5MD5EncoderForJavaScript = function() {};

JkMd5MD5EncoderForJavaScript.prototype._t = { "JkMd5MD5EncoderForJavaScript" : true };
JkMd5MD5EncoderForJavaScript.prototype._tobj = JkMd5MD5EncoderForJavaScript;

JkMd5MD5EncoderForJavaScript.NEW = function() {
	var v = new JkMd5MD5EncoderForJavaScript;
	return v.CTOR_JkMd5MD5EncoderForJavaScript();
};

JkMd5MD5EncoderForJavaScript.prototype.CTOR_JkMd5MD5EncoderForJavaScript = function() {
	return this;
};

JkMd5MD5EncoderForJavaScript.encode = function(buffer) {
	return JkMd5MD5EncoderForJavaScript.md5((JkLangString.forUTF8Buffer(buffer)));
};

JkMd5MD5EncoderForJavaScript.md5 = function(o) {
	if(o == null) {
		return null;
	}
	var x = JkMd5MD5EncoderForJavaScript.getWordArray(o);
	var a = 0x67452301;
	var b = 0xefcdab89;
	var c = 0x98badcfe;
	var d = 0x10325476;
	var s11 = 7;
	var s12 = 12;
	var s13 = 17;
	var s14 = 22;
	var s21 = 5;
	var s22 = 9;
	var s23 = 14;
	var s24 = 20;
	var s31 = 4;
	var s32 = 11;
	var s33 = 16;
	var s34 = 23;
	var s41 = 6;
	var s42 = 10;
	var s43 = 15;
	var s44 = 21;
	var k = 0;
	var aa = 0;
	var bb = 0;
	var cc = 0;
	var dd = 0;
	for(k = 0 ; k < x.length ; k += 16) {
		aa = a;
		bb = b;
		cc = c;
		dd = d;
		a = JkMd5MD5EncoderForJavaScript.ff(a, b, c, d, x[k + 0], s11, 0xd76aa478);
		d = JkMd5MD5EncoderForJavaScript.ff(d, a, b, c, x[k + 1], s12, 0xe8c7b756);
		c = JkMd5MD5EncoderForJavaScript.ff(c, d, a, b, x[k + 2], s13, 0x242070db);
		b = JkMd5MD5EncoderForJavaScript.ff(b, c, d, a, x[k + 3], s14, 0xc1bdceee);
		a = JkMd5MD5EncoderForJavaScript.ff(a, b, c, d, x[k + 4], s11, 0xf57c0faf);
		d = JkMd5MD5EncoderForJavaScript.ff(d, a, b, c, x[k + 5], s12, 0x4787c62a);
		c = JkMd5MD5EncoderForJavaScript.ff(c, d, a, b, x[k + 6], s13, 0xa8304613);
		b = JkMd5MD5EncoderForJavaScript.ff(b, c, d, a, x[k + 7], s14, 0xfd469501);
		a = JkMd5MD5EncoderForJavaScript.ff(a, b, c, d, x[k + 8], s11, 0x698098d8);
		d = JkMd5MD5EncoderForJavaScript.ff(d, a, b, c, x[k + 9], s12, 0x8b44f7af);
		c = JkMd5MD5EncoderForJavaScript.ff(c, d, a, b, x[k + 10], s13, 0xffff5bb1);
		b = JkMd5MD5EncoderForJavaScript.ff(b, c, d, a, x[k + 11], s14, 0x895cd7be);
		a = JkMd5MD5EncoderForJavaScript.ff(a, b, c, d, x[k + 12], s11, 0x6b901122);
		d = JkMd5MD5EncoderForJavaScript.ff(d, a, b, c, x[k + 13], s12, 0xfd987193);
		c = JkMd5MD5EncoderForJavaScript.ff(c, d, a, b, x[k + 14], s13, 0xa679438e);
		b = JkMd5MD5EncoderForJavaScript.ff(b, c, d, a, x[k + 15], s14, 0x49b40821);
		a = JkMd5MD5EncoderForJavaScript.gg(a, b, c, d, x[k + 1], s21, 0xf61e2562);
		d = JkMd5MD5EncoderForJavaScript.gg(d, a, b, c, x[k + 6], s22, 0xc040b340);
		c = JkMd5MD5EncoderForJavaScript.gg(c, d, a, b, x[k + 11], s23, 0x265e5a51);
		b = JkMd5MD5EncoderForJavaScript.gg(b, c, d, a, x[k + 0], s24, 0xe9b6c7aa);
		a = JkMd5MD5EncoderForJavaScript.gg(a, b, c, d, x[k + 5], s21, 0xd62f105d);
		d = JkMd5MD5EncoderForJavaScript.gg(d, a, b, c, x[k + 10], s22, 0x2441453);
		c = JkMd5MD5EncoderForJavaScript.gg(c, d, a, b, x[k + 15], s23, 0xd8a1e681);
		b = JkMd5MD5EncoderForJavaScript.gg(b, c, d, a, x[k + 4], s24, 0xe7d3fbc8);
		a = JkMd5MD5EncoderForJavaScript.gg(a, b, c, d, x[k + 9], s21, 0x21e1cde6);
		d = JkMd5MD5EncoderForJavaScript.gg(d, a, b, c, x[k + 14], s22, 0xc33707d6);
		c = JkMd5MD5EncoderForJavaScript.gg(c, d, a, b, x[k + 3], s23, 0xf4d50d87);
		b = JkMd5MD5EncoderForJavaScript.gg(b, c, d, a, x[k + 8], s24, 0x455a14ed);
		a = JkMd5MD5EncoderForJavaScript.gg(a, b, c, d, x[k + 13], s21, 0xa9e3e905);
		d = JkMd5MD5EncoderForJavaScript.gg(d, a, b, c, x[k + 2], s22, 0xfcefa3f8);
		c = JkMd5MD5EncoderForJavaScript.gg(c, d, a, b, x[k + 7], s23, 0x676f02d9);
		b = JkMd5MD5EncoderForJavaScript.gg(b, c, d, a, x[k + 12], s24, 0x8d2a4c8a);
		a = JkMd5MD5EncoderForJavaScript.hh(a, b, c, d, x[k + 5], s31, 0xfffa3942);
		d = JkMd5MD5EncoderForJavaScript.hh(d, a, b, c, x[k + 8], s32, 0x8771f681);
		c = JkMd5MD5EncoderForJavaScript.hh(c, d, a, b, x[k + 11], s33, 0x6d9d6122);
		b = JkMd5MD5EncoderForJavaScript.hh(b, c, d, a, x[k + 14], s34, 0xfde5380c);
		a = JkMd5MD5EncoderForJavaScript.hh(a, b, c, d, x[k + 1], s31, 0xa4beea44);
		d = JkMd5MD5EncoderForJavaScript.hh(d, a, b, c, x[k + 4], s32, 0x4bdecfa9);
		c = JkMd5MD5EncoderForJavaScript.hh(c, d, a, b, x[k + 7], s33, 0xf6bb4b60);
		b = JkMd5MD5EncoderForJavaScript.hh(b, c, d, a, x[k + 10], s34, 0xbebfbc70);
		a = JkMd5MD5EncoderForJavaScript.hh(a, b, c, d, x[k + 13], s31, 0x289b7ec6);
		d = JkMd5MD5EncoderForJavaScript.hh(d, a, b, c, x[k + 0], s32, 0xeaa127fa);
		c = JkMd5MD5EncoderForJavaScript.hh(c, d, a, b, x[k + 3], s33, 0xd4ef3085);
		b = JkMd5MD5EncoderForJavaScript.hh(b, c, d, a, x[k + 6], s34, 0x4881d05);
		a = JkMd5MD5EncoderForJavaScript.hh(a, b, c, d, x[k + 9], s31, 0xd9d4d039);
		d = JkMd5MD5EncoderForJavaScript.hh(d, a, b, c, x[k + 12], s32, 0xe6db99e5);
		c = JkMd5MD5EncoderForJavaScript.hh(c, d, a, b, x[k + 15], s33, 0x1fa27cf8);
		b = JkMd5MD5EncoderForJavaScript.hh(b, c, d, a, x[k + 2], s34, 0xc4ac5665);
		a = JkMd5MD5EncoderForJavaScript.ii(a, b, c, d, x[k + 0], s41, 0xf4292244);
		d = JkMd5MD5EncoderForJavaScript.ii(d, a, b, c, x[k + 7], s42, 0x432aff97);
		c = JkMd5MD5EncoderForJavaScript.ii(c, d, a, b, x[k + 14], s43, 0xab9423a7);
		b = JkMd5MD5EncoderForJavaScript.ii(b, c, d, a, x[k + 5], s44, 0xfc93a039);
		a = JkMd5MD5EncoderForJavaScript.ii(a, b, c, d, x[k + 12], s41, 0x655b59c3);
		d = JkMd5MD5EncoderForJavaScript.ii(d, a, b, c, x[k + 3], s42, 0x8f0ccc92);
		c = JkMd5MD5EncoderForJavaScript.ii(c, d, a, b, x[k + 10], s43, 0xffeff47d);
		b = JkMd5MD5EncoderForJavaScript.ii(b, c, d, a, x[k + 1], s44, 0x85845dd1);
		a = JkMd5MD5EncoderForJavaScript.ii(a, b, c, d, x[k + 8], s41, 0x6fa87e4f);
		d = JkMd5MD5EncoderForJavaScript.ii(d, a, b, c, x[k + 15], s42, 0xfe2ce6e0);
		c = JkMd5MD5EncoderForJavaScript.ii(c, d, a, b, x[k + 6], s43, 0xa3014314);
		b = JkMd5MD5EncoderForJavaScript.ii(b, c, d, a, x[k + 13], s44, 0x4e0811a1);
		a = JkMd5MD5EncoderForJavaScript.ii(a, b, c, d, x[k + 4], s41, 0xf7537e82);
		d = JkMd5MD5EncoderForJavaScript.ii(d, a, b, c, x[k + 11], s42, 0xbd3af235);
		c = JkMd5MD5EncoderForJavaScript.ii(c, d, a, b, x[k + 2], s43, 0x2ad7d2bb);
		b = JkMd5MD5EncoderForJavaScript.ii(b, c, d, a, x[k + 9], s44, 0xeb86d391);
		a = JkMd5MD5EncoderForJavaScript.addUnsigned(a, aa);
		b = JkMd5MD5EncoderForJavaScript.addUnsigned(b, bb);
		c = JkMd5MD5EncoderForJavaScript.addUnsigned(c, cc);
		d = JkMd5MD5EncoderForJavaScript.addUnsigned(d, dd);
	}
	var temp = (JkLangString.safeString((JkMd5MD5EncoderForJavaScript.toStringHex(a)))) + (JkLangString.safeString((JkMd5MD5EncoderForJavaScript.toStringHex(b)))) + (JkLangString.safeString((JkMd5MD5EncoderForJavaScript.toStringHex(c)))) + (JkLangString.safeString((JkMd5MD5EncoderForJavaScript.toStringHex(d))));
	return JkLangString.toLowerCase(temp);
};

JkMd5MD5EncoderForJavaScript.getWordArray = function(str) {
	var strlength = JkLangString.getLength(str);
	var n = (strlength + 8 - (strlength + 8) % 64) / 64;
	var numWords = (n + 1) * 16;
	var array = [];
	var wordCount = 0;
	var byteCount = 0;
	var bytePos = 0;
	while(byteCount < strlength){
		wordCount = (byteCount - byteCount % 4) / 4;
		bytePos = byteCount % 4 * 8;
		var temps = 0;
		var o = array[wordCount];
		if(o != 0) {
			temps = o;
		}
		var xs = temps | JkLangString.getChar(str, byteCount) << bytePos;
		array[wordCount] = xs;
		byteCount++;
	}
	wordCount = (byteCount - byteCount % 4) / 4;
	bytePos = byteCount % 4 * 8;
	var xx = 0;
	var xxo = array[wordCount];
	if(xxo != 0) {
		xx = xxo;
	}
	var vs = xx | 0x80 << bytePos;
	array[wordCount] = vs;
	array[numWords - 2] = ~(~strlength) << 3;
	var r = 0;
	r = strlength >>> 29;
	;
	array[numWords - 1] = r;
	return array;
};

JkMd5MD5EncoderForJavaScript.rotateLeft = function(val, bits) {
	var vr = 0;
	vr = (val << bits) | (val >>> (32 - bits));
	;
	return vr;
};

JkMd5MD5EncoderForJavaScript.addUnsigned = function(x, y) {
	var x4 = x & 0x40000000;
	var y4 = y & 0x40000000;
	var x8 = x & 0x80000000;
	var y8 = y & 0x80000000;
	var result = (x & 0x3fffffff) + (y & 0x3fffffff);
	if((x4 & y4) != 0) {
		return result ^ 0x80000000 ^ x8 ^ y8;
	}
	if((x4 | y4) != 0) {
		if((result & 0x40000000) != 0) {
			return result ^ 0xc0000000 ^ x8 ^ y8;
		}
		else {
			return result ^ 0x40000000 ^ x8 ^ y8;
		}
	}
	else {
		return result ^ x8 ^ y8;
	}
	return 0;
};

JkMd5MD5EncoderForJavaScript.f = function(x, y, z) {
	var w = ~x;
	var v = x & y | w & z;
	return v;
};

JkMd5MD5EncoderForJavaScript.g = function(x, y, z) {
	var w = ~z;
	var v = x & z | y & w;
	return v;
};

JkMd5MD5EncoderForJavaScript.h = function(x, y, z) {
	return x ^ y ^ z;
};

JkMd5MD5EncoderForJavaScript.i = function(x, y, z) {
	var w = ~z;
	return y ^ (x | w);
};

JkMd5MD5EncoderForJavaScript.ff = function(a, b, c, d, o, s, ac) {
	var x = 0;
	if(o != null) {
		x = o;
	}
	var v = JkMd5MD5EncoderForJavaScript.addUnsigned(a, (JkMd5MD5EncoderForJavaScript.addUnsigned((JkMd5MD5EncoderForJavaScript.addUnsigned((JkMd5MD5EncoderForJavaScript.f(b, c, d)), x)), ac)));
	return JkMd5MD5EncoderForJavaScript.addUnsigned((JkMd5MD5EncoderForJavaScript.rotateLeft(v, s)), b);
};

JkMd5MD5EncoderForJavaScript.gg = function(a, b, c, d, o, s, ac) {
	var x = 0;
	if(o != null) {
		x = o;
	}
	var v = JkMd5MD5EncoderForJavaScript.addUnsigned(a, (JkMd5MD5EncoderForJavaScript.addUnsigned((JkMd5MD5EncoderForJavaScript.addUnsigned((JkMd5MD5EncoderForJavaScript.g(b, c, d)), x)), ac)));
	return JkMd5MD5EncoderForJavaScript.addUnsigned((JkMd5MD5EncoderForJavaScript.rotateLeft(v, s)), b);
};

JkMd5MD5EncoderForJavaScript.hh = function(a, b, c, d, o, s, ac) {
	var x = 0;
	if(o != null) {
		x = o;
	}
	var v = JkMd5MD5EncoderForJavaScript.addUnsigned(a, (JkMd5MD5EncoderForJavaScript.addUnsigned((JkMd5MD5EncoderForJavaScript.addUnsigned((JkMd5MD5EncoderForJavaScript.h(b, c, d)), x)), ac)));
	return JkMd5MD5EncoderForJavaScript.addUnsigned((JkMd5MD5EncoderForJavaScript.rotateLeft(v, s)), b);
};

JkMd5MD5EncoderForJavaScript.ii = function(a, b, c, d, o, s, ac) {
	var x = 0;
	if(o != null) {
		x = o;
	}
	var v = JkMd5MD5EncoderForJavaScript.addUnsigned(a, (JkMd5MD5EncoderForJavaScript.addUnsigned((JkMd5MD5EncoderForJavaScript.addUnsigned((JkMd5MD5EncoderForJavaScript.i(b, c, d)), x)), ac)));
	return JkMd5MD5EncoderForJavaScript.addUnsigned((JkMd5MD5EncoderForJavaScript.rotateLeft(v, s)), b);
};

JkMd5MD5EncoderForJavaScript.toStringHex = function(val) {
	var result = "";
	var temp = "";
	var count = 0;
	var _byte = 0;
	for(count = 0 ; count <= 3 ; count++) {
		var v = 0;
		v = val >>> (count * 8);
		;
		_byte = v & 255;
		temp = "00" + (JkLangString.safeString((JkLangString.forIntegerHex(_byte, 0))));
		result = JkLangString.appendString(result, (JkLangString.getSubString(temp, (JkLangString.getLength(temp)), 2)));
	}
	return result;
};

JkMd5MD5EncoderForJavaScript.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMd5MD5EncoderForJavaScript"] === true;
};

let JkMd5MD5EncoderGeneric = function() {};

JkMd5MD5EncoderGeneric.prototype._t = { "JkMd5MD5EncoderGeneric" : true };
JkMd5MD5EncoderGeneric.prototype._tobj = JkMd5MD5EncoderGeneric;

JkMd5MD5EncoderGeneric.NEW = function() {
	var v = new JkMd5MD5EncoderGeneric;
	return v.CTOR_JkMd5MD5EncoderGeneric();
};

JkMd5MD5EncoderGeneric.prototype.CTOR_JkMd5MD5EncoderGeneric = function() {
	return this;
};

JkMd5MD5EncoderGeneric.prototype.encode = function(buf) {
	return this.stringToHex((this.toMD5(buf)));
};

JkMd5MD5EncoderGeneric.prototype.toMD5 = function(input) {
	return this.binl2rstr((this.md5((this.rstr2binl(input)), (~(~(JkLangBuffer.getSize(input) * 8))))));
};

JkMd5MD5EncoderGeneric.prototype.stringToHex = function(input) {
	var hexTab = ['0'.charCodeAt(), '1'.charCodeAt(), '2'.charCodeAt(), '3'.charCodeAt(), '4'.charCodeAt(), '5'.charCodeAt(), '6'.charCodeAt(), '7'.charCodeAt(), '8'.charCodeAt(), '9'.charCodeAt(), 'A'.charCodeAt(), 'B'.charCodeAt(), 'C'.charCodeAt(), 'D'.charCodeAt(), 'E'.charCodeAt(), 'F'.charCodeAt()];
	var sb = JkLangStringBuilder.NEW();
	for(var i = 0 ; i < JkLangBuffer.getSize(input) ; i++) {
		var x = input[i];
		var value1 = hexTab[~(~(x >> 4 & ~(~0xf)))];
		var value2 = hexTab[~(~(~(~x) & ~(~0xf)))];
		sb.appendCharacter(value1);
		sb.appendCharacter(value2);
	}
	return JkLangString.toLowerCase((sb.toString()));
};

JkMd5MD5EncoderGeneric.prototype.md5 = function(input, len) {
	if(!(input != null)) {
		return null;
	}
	var x = JkLangDynamicMap.NEW();
	for(var i = 0 ; i < input.length ; i++) {
		x.setInteger((JkLangString.forInteger(i)), input[i]);
	}
	var lenValue = len % 32;
	var n = ~(~0);
	var value = n + (0x80 << lenValue);
	var v = ~(~this.unwrap((~(~x.getInteger((JkLangString.forInteger((len >> 5))), 0))), 0)) | ~(~value);
	x.setInteger((JkLangString.forInteger((~(~(len >> 5))))), v);
	var slen = len + 64 >> 9;
	var index = (slen << 4) + 14;
	x.setInteger((JkLangString.forInteger(index)), (this.unwrap((x.getInteger((JkLangString.forInteger(index)), 0) | len), 0)));
	var a = ~(~1732584193);
	var b = -(~(~271733879));
	var c = -(~(~1732584194));
	var d = ~(~271733878);
	var aa = 0;
	var bb = 0;
	var cc = 0;
	var dd = 0;
	for(var i1 = 0 ; i1 < this.getMaxLength(x) ; i1 += 16) {
		aa = a;
		bb = b;
		cc = c;
		dd = d;
		a = this.ff(a, b, c, d, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 0))), 0))), 0)), 7, (-680876936));
		d = this.ff(d, a, b, c, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 1))), 0))), 0)), 12, (-389564586));
		c = this.ff(c, d, a, b, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 2))), 0))), 0)), 17, 606105819);
		b = this.ff(b, c, d, a, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 3))), 0))), 0)), 22, (-1044525330));
		a = this.ff(a, b, c, d, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 4))), 0))), 0)), 7, (-176418897));
		d = this.ff(d, a, b, c, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 5))), 0))), 0)), 12, 1200080426);
		c = this.ff(c, d, a, b, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 6))), 0))), 0)), 17, (-1473231341));
		b = this.ff(b, c, d, a, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 7))), 0))), 0)), 22, (-45705983));
		a = this.ff(a, b, c, d, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 8))), 0))), 0)), 7, 1770035416);
		d = this.ff(d, a, b, c, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 9))), 0))), 0)), 12, (-1958414417));
		c = this.ff(c, d, a, b, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 10))), 0))), 0)), 17, (-42063));
		b = this.ff(b, c, d, a, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 11))), 0))), 0)), 22, (-1990404162));
		a = this.ff(a, b, c, d, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 12))), 0))), 0)), 7, 1804603682);
		d = this.ff(d, a, b, c, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 13))), 0))), 0)), 12, (-40341101));
		c = this.ff(c, d, a, b, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 14))), 0))), 0)), 17, (-1502002290));
		b = this.ff(b, c, d, a, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 15))), 0))), 0)), 22, 1236535329);
		a = this.gg(a, b, c, d, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 1))), 0))), 0)), 5, (-165796510));
		d = this.gg(d, a, b, c, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 6))), 0))), 0)), 9, (-1069501632));
		c = this.gg(c, d, a, b, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 11))), 0))), 0)), 14, 643717713);
		b = this.gg(b, c, d, a, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 0))), 0))), 0)), 20, (-373897302));
		a = this.gg(a, b, c, d, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 5))), 0))), 0)), 5, (-701558691));
		d = this.gg(d, a, b, c, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 10))), 0))), 0)), 9, 38016083);
		c = this.gg(c, d, a, b, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 15))), 0))), 0)), 14, (-660478335));
		b = this.gg(b, c, d, a, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 4))), 0))), 0)), 20, (-405537848));
		a = this.gg(a, b, c, d, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 9))), 0))), 0)), 5, 568446438);
		d = this.gg(d, a, b, c, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 14))), 0))), 0)), 9, (-1019803690));
		c = this.gg(c, d, a, b, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 3))), 0))), 0)), 14, (-187363961));
		b = this.gg(b, c, d, a, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 8))), 0))), 0)), 20, 1163531501);
		a = this.gg(a, b, c, d, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 13))), 0))), 0)), 5, (-1444681467));
		d = this.gg(d, a, b, c, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 2))), 0))), 0)), 9, (-51403784));
		c = this.gg(c, d, a, b, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 7))), 0))), 0)), 14, 1735328473);
		b = this.gg(b, c, d, a, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 12))), 0))), 0)), 20, (-1926607734));
		a = this.hh(a, b, c, d, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 5))), 0))), 0)), 4, (-378558));
		d = this.hh(d, a, b, c, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 8))), 0))), 0)), 11, (-2022574463));
		c = this.hh(c, d, a, b, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 11))), 0))), 0)), 16, 1839030562);
		b = this.hh(b, c, d, a, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 14))), 0))), 0)), 23, (-35309556));
		a = this.hh(a, b, c, d, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 1))), 0))), 0)), 4, (-1530992060));
		d = this.hh(d, a, b, c, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 4))), 0))), 0)), 11, 1272893353);
		c = this.hh(c, d, a, b, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 7))), 0))), 0)), 16, (-155497632));
		b = this.hh(b, c, d, a, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 10))), 0))), 0)), 23, (-1094730640));
		a = this.hh(a, b, c, d, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 13))), 0))), 0)), 4, 681279174);
		d = this.hh(d, a, b, c, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 0))), 0))), 0)), 11, (-358537222));
		c = this.hh(c, d, a, b, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 3))), 0))), 0)), 16, (-722521979));
		b = this.hh(b, c, d, a, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 6))), 0))), 0)), 23, 76029189);
		a = this.hh(a, b, c, d, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 9))), 0))), 0)), 4, (-640364487));
		d = this.hh(d, a, b, c, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 12))), 0))), 0)), 11, (-421815835));
		c = this.hh(c, d, a, b, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 15))), 0))), 0)), 16, 530742520);
		b = this.hh(b, c, d, a, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 2))), 0))), 0)), 23, (-995338651));
		a = this.ii(a, b, c, d, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 0))), 0))), 0)), 6, (-198630844));
		d = this.ii(d, a, b, c, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 7))), 0))), 0)), 10, 1126891415);
		c = this.ii(c, d, a, b, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 14))), 0))), 0)), 15, (-1416354905));
		b = this.ii(b, c, d, a, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 5))), 0))), 0)), 21, (-57434055));
		a = this.ii(a, b, c, d, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 12))), 0))), 0)), 6, 1700485571);
		d = this.ii(d, a, b, c, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 3))), 0))), 0)), 10, (-1894986606));
		c = this.ii(c, d, a, b, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 10))), 0))), 0)), 15, (-1051523));
		b = this.ii(b, c, d, a, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 1))), 0))), 0)), 21, (-2054922799));
		a = this.ii(a, b, c, d, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 8))), 0))), 0)), 6, 1873313359);
		d = this.ii(d, a, b, c, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 15))), 0))), 0)), 10, (-30611744));
		c = this.ii(c, d, a, b, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 6))), 0))), 0)), 15, (-1560198380));
		b = this.ii(b, c, d, a, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 13))), 0))), 0)), 21, 1309151649);
		a = this.ii(a, b, c, d, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 4))), 0))), 0)), 6, (-145523070));
		d = this.ii(d, a, b, c, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 11))), 0))), 0)), 10, (-1120210379));
		c = this.ii(c, d, a, b, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 2))), 0))), 0)), 15, 718787259);
		b = this.ii(b, c, d, a, (this.unwrap((~(~x.getInteger((JkLangString.forInteger((i1 + 9))), 0))), 0)), 21, (-343485551));
		a = this.addUnsigned(a, aa);
		b = this.addUnsigned(b, bb);
		c = this.addUnsigned(c, cc);
		d = this.addUnsigned(d, dd);
	}
	var ret = [];
	ret[0] = a;
	ret[1] = b;
	ret[2] = c;
	ret[3] = d;
	return ret;
};

JkMd5MD5EncoderGeneric.prototype.getMaxLength = function(dm) {
	var i = 0;
	var keys = dm.getKeys();
	if(keys != null) {
		var n = 0;
		var m = keys.length;
		for(n = 0 ; n < m ; n++) {
			var v = keys[n];
			if(v != null) {
				var key = JkLangString.toInteger(v);
				if(key > i) {
					i = key;
				}
			}
		}
	}
	var v1 = i + 1;
	return v1;
};

JkMd5MD5EncoderGeneric.prototype.rstr2binl = function(input) {
	if(!(input != null)) {
		return null;
	}
	var output = JkLangDynamicMap.NEW();
	for(var i = 0 ; i < JkLangBuffer.getSize(input) * 8 ; i += 8) {
		var value = ~(~(input[i / 8] & 0xff)) << ~(~(i % 32));
		var x = ~(~(i >> 5));
		var y = 0;
		if(output.containsKey((JkLangString.forInteger(x)))) {
			y = output.getInteger((JkLangString.forInteger(x)), 0);
		}
		output.setInteger((JkLangString.forInteger(x)), (this.unwrap(y, 0) | value));
	}
	return this.dictionary2array(output);
};

JkMd5MD5EncoderGeneric.prototype.binl2rstr = function(input) {
	var output = [];
	for(var i = 0 ; i < input.length * 32 ; i += 8) {
		var value = this.zeroFillRightShift(input[i >> 5], (~(~(i % 32)) & 0xff));
		output[i / 8] = ~(~value);
	}
	var ret = new ArrayBuffer(16);
	for(var i1 = 0 ; i1 < output.length ; i1++) {
		ret[i1] = output[i1];
	}
	return ret;
};

JkMd5MD5EncoderGeneric.prototype.addUnsigned = function(x, y) {
	return x + y;
};

JkMd5MD5EncoderGeneric.prototype.rotateLeft = function(num, cnt) {
	var value = num << cnt & 0xffffffff | this.zeroFillRightShift(num, (~(~32) - cnt));
	return value;
};

JkMd5MD5EncoderGeneric.prototype.cmn = function(q, a, b, x, s, t) {
	return this.addUnsigned((this.rotateLeft((this.addUnsigned((this.addUnsigned(a, q)), (this.addUnsigned(x, t)))), s)), b);
};

JkMd5MD5EncoderGeneric.prototype.ff = function(a, b, c, d, x, s, t) {
	return this.cmn((b & c | ~b & d), a, b, x, s, t);
};

JkMd5MD5EncoderGeneric.prototype.gg = function(a, b, c, d, x, s, t) {
	return this.cmn((b & d | c & ~d), a, b, x, s, t);
};

JkMd5MD5EncoderGeneric.prototype.hh = function(a, b, c, d, x, s, t) {
	return this.cmn((b ^ c ^ d), a, b, x, s, t);
};

JkMd5MD5EncoderGeneric.prototype.ii = function(a, b, c, d, x, s, t) {
	return this.cmn((c ^ (b | ~d)), a, b, x, s, t);
};

JkMd5MD5EncoderGeneric.prototype.dictionary2array = function(dic) {
	var arr = [];
	for(var i = 0 ; i < dic.getCount() ; i++) {
		arr[i] = this.unwrap((dic.getInteger((JkLangString.forInteger(i)), 0)), 0);
	}
	return arr;
};

JkMd5MD5EncoderGeneric.prototype.unwrap = function(value, fallback) {
	if(value != 0) {
		return value;
	}
	return fallback;
};

JkMd5MD5EncoderGeneric.prototype.zeroFillRightShift = function(num, count) {
	var value = ~(~((num & 0xffffffff) >> ~(~count)));
	return ~(~value);
};

JkMd5MD5EncoderGeneric.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMd5MD5EncoderGeneric"] === true;
};

let JkMd5MD5Encoder = function() {};

JkMd5MD5Encoder.prototype._t = { "JkMd5MD5Encoder" : true };
JkMd5MD5Encoder.prototype._tobj = JkMd5MD5Encoder;

JkMd5MD5Encoder.NEW = function() {
	var v = new JkMd5MD5Encoder;
	return v.CTOR_JkMd5MD5Encoder();
};

JkMd5MD5Encoder.prototype.CTOR_JkMd5MD5Encoder = function() {
	return this;
};

JkMd5MD5Encoder.encodeBuffer = function(buffer) {
	if(buffer == null || JkLangBuffer.getSize(buffer) < 1) {
		return null;
	}
	return JkMd5MD5EncoderForJavaScript.encode(buffer);
};

JkMd5MD5Encoder.encodeString = function(string) {
	return JkMd5MD5Encoder.encodeBuffer((JkLangString.toUTF8Buffer(string)));
};

JkMd5MD5Encoder.encodeObject = function(obj) {
	var bb = JkLangBuffer.asBuffer(obj);
	if(bb != null) {
		return JkMd5MD5Encoder.encodeBuffer(bb);
	}
	var ss = JkLangString.asString(obj);
	if(ss != null) {
		return JkMd5MD5Encoder.encodeString(ss);
	}
	return null;
};

JkMd5MD5Encoder.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMd5MD5Encoder"] === true;
};
