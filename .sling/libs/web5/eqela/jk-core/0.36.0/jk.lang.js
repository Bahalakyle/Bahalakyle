let JkLangLongIntegerIterator = {};

JkLangLongIntegerIterator.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangLongIntegerIterator"] === true;
};

let JkLangString = function() {};

JkLangString.prototype._t = { "JkLangString" : true };
JkLangString.prototype._tobj = JkLangString;

JkLangString.NEW = function() {
	var v = new JkLangString;
	return v.CTOR_JkLangString();
};

JkLangString.prototype.CTOR_JkLangString = function() {
	return this;
};

JkLangString.asString = function(obj) {
	if(!(obj != null)) {
		return null;
	}
	if(typeof(obj) === 'string') {
		return obj;
	}
	if(JkLangStringObject.IS_INSTANCE && JkLangStringObject.IS_INSTANCE(obj)) {
		var os = obj;
		return os.toString();
	}
	if(typeof(obj) === 'number') {
		return JkLangString.forInteger((~(~obj)));
	}
	if(JkLangIntegerObject.IS_INSTANCE && JkLangIntegerObject.IS_INSTANCE(obj)) {
		return JkLangString.forInteger((obj.toInteger()));
	}
	if(typeof(obj) === 'number') {
		return JkLangString.forLongInteger((~(~obj)));
	}
	if(JkLangLongIntegerObject.IS_INSTANCE && JkLangLongIntegerObject.IS_INSTANCE(obj)) {
		return JkLangString.forLongInteger((obj.toLong()));
	}
	if(typeof(obj) === 'number') {
		return JkLangString.forDouble(obj);
	}
	if(JkLangDoubleObject.IS_INSTANCE && JkLangDoubleObject.IS_INSTANCE(obj)) {
		return JkLangString.forDouble((obj.toDouble()));
	}
	if(typeof(obj) === 'boolean') {
		return JkLangString.forBoolean(obj);
	}
	if(JkLangBooleanObject.IS_INSTANCE && JkLangBooleanObject.IS_INSTANCE(obj)) {
		return JkLangString.forBoolean((obj.toBoolean()));
	}
	if(typeof(obj) === 'string') {
		return JkLangString.forCharacter(obj);
	}
	if(JkLangCharacterObject.IS_INSTANCE && JkLangCharacterObject.IS_INSTANCE(obj)) {
		return JkLangString.forCharacter((obj.toCharacter()));
	}
	if(obj instanceof ArrayBuffer) {
		return JkLangString.forBufferHex(obj);
	}
	if(JkLangBufferObject.IS_INSTANCE && JkLangBufferObject.IS_INSTANCE(obj)) {
		var v = obj.toBuffer();
		if(!(v != null)) {
			return "";
		}
		return JkLangString.forBufferHex(v);
	}
	return null;
};

JkLangString.forObject = function(obj) {
	return JkLangString.asString(obj);
};

JkLangString.safeString = function(str) {
	if(!(str != null)) {
		return "";
	}
	return str;
};

JkLangString.isEmpty = function(str) {
	if(!(str != null)) {
		return true;
	}
	if(JkLangString.getLength(str) < 1) {
		return true;
	}
	return false;
};

JkLangString.isNotEmpty = function(str) {
	return !JkLangString.isEmpty(str);
};

JkLangString.forBuffer = function(data, encoding) {
	if(!(data != null)) {
		return null;
	}
	if(JkLangString.equalsIgnoreCase("UTF8", encoding) || JkLangString.equalsIgnoreCase("UTF-8", encoding)) {
		return JkLangString.forUTF8Buffer(data);
	}
	if(JkLangString.equalsIgnoreCase("UCS2", encoding) || JkLangString.equalsIgnoreCase("UCS-2", encoding)) {
		return JkLangString.forUCS2Buffer(data);
	}
	if(JkLangString.equalsIgnoreCase("ASCII", encoding)) {
		return JkLangString.forASCIIBuffer(data);
	}
	return null;
};

JkLangString.forASCIIBuffer = function(data) {
	if(!(data != null)) {
		return null;
	}
	var sb = JkLangStringBuilder.NEW();
	var uintArray = null;
	uintArray = new Uint8Array(data);
	;
	for(var i = 0 ; i < uintArray.length ; i++) {
		sb.appendString(String.fromCharCode(uintArray[i]));
	}
	return sb.toString();
};

JkLangString.forUTF8Buffer = function(data) {
	if(!(data != null)) {
		return null;
	}
	return new TextDecoder().decode(data);
};

JkLangString.forUCS2Buffer = function(data) {
	if(data == null) {
		return null;
	}
	if(data == null) {
		return null;
	}
	return data.toString("ucs2");
};

JkLangString.forCharArray = function(chars, offset, count) {
	if(!(chars != null)) {
		return null;
	}
	var str = null;
	if(offset < chars.length && count <= chars.length && offset < count) {
		str = "";
		for(var ind = offset; ind < count; ind++) {
			str += chars[ind];
		}
	}
	;
	return str;
};

JkLangString.forBoolean = function(vv) {
	if(vv == true) {
		return "true";
	}
	return "false";
};

JkLangString.forInteger = function(vv) {
	return (~~vv).toString();
};

JkLangString.forLongInteger = function(vv) {
	return parseInt(vv).toString();
};

JkLangString.forIntegerWithPadding = function(vv, _length, paddingString) {
	var r = JkLangString.forInteger(vv);
	if(!(r != null)) {
		return null;
	}
	var ll = JkLangString.getLength(r);
	if(ll >= _length) {
		return r;
	}
	var ps = paddingString;
	if(ps == null) {
		ps = "0";
	}
	var sb = JkLangStringBuilder.NEW();
	var n = 0;
	for(n = 0 ; n < _length - ll ; n++) {
		sb.appendString(ps);
	}
	sb.appendString(r);
	return sb.toString();
};

JkLangString.forIntegerHex = function(vv, minlength) {
	var v = null;
	v = (~~vv).toString(16);
	if(!(v != null)) {
		return null;
	}
	if(minlength > 0) {
		while(JkLangString.getLength(v) < minlength){
			v = "0" + (JkLangString.safeString(v));
		}
	}
	return v;
};

JkLangString.forLongIntegerHex = function(vv, minlength) {
	var v = null;
	v = (~~vv).toString(16);
	if(!(v != null)) {
		return null;
	}
	if(minlength > 0) {
		while(JkLangString.getLength(v) < minlength){
			v = "0" + (JkLangString.safeString(v));
		}
	}
	return v;
};

JkLangString.forIntegerOctal = function(vv) {
	var v = null;
	v = (~~vv).toString(8);
	return v;
};

JkLangString.forIntegerBinary = function(vv) {
	var v = null;
	v = (~~vv).toString(2);
	return v;
};

JkLangString.forBufferHex = function(buffer) {
	var size = JkLangBuffer.getSize(buffer);
	if(!(size != 0)) {
		return null;
	}
	var sb = JkLangStringBuilder.NEW();
	var p = 0;
	while(p < size){
		var s = JkLangString.forIntegerHex((JkLangBuffer.getByte(buffer, p)), 0);
		if(JkLangString.getLength(s) < 2) {
			sb.appendCharacter('0'.charCodeAt());
		}
		sb.appendString(s);
		p++;
	}
	return sb.toString();
};

JkLangString.forCharacter = function(vv) {
	return String.fromCharCode(vv);
};

JkLangString.forFloat = function(vv) {
	return vv.toString();
};

JkLangString.forDouble = function(vv) {
	return vv.toString();
};

JkLangString.toUTF8Buffer = function(str) {
	if(!(str != null)) {
		return null;
	}
	var bytes = JkLangString.getBytesUnsigned(str, "UTF-8");
	if(!(bytes != null)) {
		return null;
	}
	var c = bytes.length;
	var bb = new ArrayBuffer(c);
	var n = 0;
	for(n = 0 ; n < c ; n++) {
		JkLangBuffer.setByte(bb, n, bytes[n]);
	}
	return bb;
};

JkLangString.toBuffer = function(str, charset) {
	if(!(str != null)) {
		return null;
	}
	if(!(charset != null)) {
		return null;
	}
	if(JkLangString.equalsIgnoreCase("UTF8", charset) || JkLangString.equalsIgnoreCase("UTF-8", charset)) {
		return JkLangString.toUTF8Buffer(str);
	}
	var bytes = JkLangString.getBytesUnsigned(str, charset);
	if(!(bytes != null)) {
		return null;
	}
	var c = bytes.length;
	var bb = new ArrayBuffer(c);
	var n = 0;
	for(n = 0 ; n < c ; n++) {
		JkLangBuffer.setByte(bb, n, bytes[n]);
	}
	return bb;
};

JkLangString.getBytesUnsignedUTF8 = function(str) {
	return JkLangString.getBytesUnsigned(str, "UTF-8");
};

JkLangString.getBytesUnsigned = function(str, charset) {
	if(!(str != null)) {
		return null;
	}
	if(!(charset != null)) {
		return null;
	}
	var uintArray = null;
	if(JkLangString.equalsIgnoreCase(charset, "UTF-8") || JkLangString.equalsIgnoreCase(charset, "UTF8")) {
		uintArray = [];
		for(var i = 0; i < str.length; i++) {
			var cc = str.charCodeAt(i);
			if(cc < 0x80) {
				uintArray.push(cc);
			}
			else if(cc < 0x800) {
				uintArray.push(0xc0 | (cc >> 6));
				uintArray.push(0x80 | (cc & 0x3f));
			}
			else if(cc < 0xd800 || cc >= 0xe000) {
				uintArray.push(0xe0 | (cc >> 12));
				uintArray.push(0x80 | ((cc >> 6) & 0x3f));
				uintArray.push(0x80 | (cc & 0x3f));
			}
			else {
				i++;
				cc = (((cc & 0x3ff) << 10) | (str.charCodeAt(i) & 0x3ff)) + 0x10000;
				uintArray.push(0xf0 | (cc >> 18));
				uintArray.push(0x80 | ((cc >> 12) & 0x3f));
				uintArray.push(0x80 | ((cc >> 6) & 0x3f));
				uintArray.push(0x80 | (cc & 0x3f));
			}
		}
		;
	}
	else if(JkLangString.equalsIgnoreCase(charset, "UTF-16") || JkLangString.equalsIgnoreCase(charset, "UTF16")) {
		uintArray = new Uint8Array(str.length);
		for(var c = 0; c < str.length; c++) {
			uintArray[c] = str.charCodeAt(c);
		}
		;
	}
	return uintArray;
};

JkLangString.getBytesSignedUTF8 = function(str) {
	return JkLangString.getBytesSigned(str, "UTF-8");
};

JkLangString.getBytesSigned = function(str, charset) {
	if(str == null || charset == null) {
		return null;
	}
	var intArray = null;
	intArray = new Int8Array(str.length);
	for(var c = 0; c < str.length; c++) {
		intArray[c] = str.charCodeAt(c);
	}
	;
	return intArray;
};

JkLangString.getLength = function(str) {
	if(str == null) {
		return 0;
	}
	return str.length;
};

JkLangString.appendString = function(str1, str2) {
	if(str1 == null) {
		return str2;
	}
	if(str2 == null) {
		return str1;
	}
	return str1.concat(str2);
};

JkLangString.appendInteger = function(str, intvalue) {
	return JkLangString.appendString(str, (JkLangString.forInteger(intvalue)));
};

JkLangString.appendCharacter = function(str, charvalue) {
	return JkLangString.appendString(str, (JkLangString.forCharacter(charvalue)));
};

JkLangString.appendFloat = function(str, floatvalue) {
	return JkLangString.appendString(str, (JkLangString.forFloat(floatvalue)));
};

JkLangString.appendDouble = function(str, doublevalue) {
	return JkLangString.appendString(str, (JkLangString.forDouble(doublevalue)));
};

JkLangString.appendBoolean = function(str, boolvalue) {
	return JkLangString.appendString(str, (JkLangString.forBoolean(boolvalue)));
};

JkLangString.toLowerCase = function(str) {
	if(!(str != null)) {
		return null;
	}
	return str.toLowerCase();
};

JkLangString.toUpperCase = function(str) {
	if(!(str != null)) {
		return null;
	}
	return str.toUpperCase();
};

JkLangString.capitalize = function(str) {
	if(!(str != null)) {
		return null;
	}
	var c = JkLangString.getChar(str, 0);
	if(JkLangCharacter.isLowercaseAlpha(c) == false) {
		return str;
	}
	return (JkLangString.safeString((JkLangString.forCharacter((JkLangCharacter.toUppercase(c)))))) + (JkLangString.safeString((JkLangString.getEndOfString(str, 1))));
};

JkLangString.getChar = function(str, index) {
	if(str == null || index < 0) {
		return 0;
	}
	return str == null || index < 0 || index >= str.length ? 0 : str.charCodeAt(index);
};

JkLangString.equals = function(str1, str2) {
	if(str1 == null && str2 == null) {
		return true;
	}
	if(!(str1 != null && str2 != null)) {
		return false;
	}
	return str1 === str2;
};

JkLangString.isNotEqual = function(str1, str2) {
	return !JkLangString.equals(str1, str2);
};

JkLangString.equalsIgnoreCase = function(str1, str2) {
	if(str1 == null && str2 == null) {
		return true;
	}
	if(!(str1 != null && str2 != null)) {
		return false;
	}
	return str1.toLowerCase() === str2.toLowerCase();
};

JkLangString.compare = function(str1, str2) {
	if(str1 == null || str2 == null) {
		return 0;
	}
	return str1.localeCompare(str2);
};

JkLangString.compareToIgnoreCase = function(str1, str2) {
	if(str1 == null || str2 == null) {
		return 0;
	}
	return str1.toLowerCase().localeCompare(str2.toLowerCase());
};

JkLangString.getHashCode = function(str) {
	if(str == null) {
		return 0;
	}
	var hash = 0;
	var it = JkLangString.iterate(str);
	while(it != null){
		var ch = it.getNextChar();
		if(JkLangCharacter.isEOF(ch)) {
			break;
		}
		hash = (hash << 5) - hash + ch;
		hash = hash & hash;
	}
	return hash;
};

JkLangString.getIndexOfCharacter = function(str, c, start) {
	if(str == null || c == 0) {
		return -1;
	}
	return str.indexOf(String.fromCharCode(c), start);
};

JkLangString.getIndexOfString = function(str, s, start) {
	if(str == null || s == null) {
		return -1;
	}
	if(JkLangString.isEmpty(s)) {
		return 0;
	}
	return str.indexOf(s, start);
};

JkLangString.getLastIndexOfCharacter = function(str, c, start) {
	if(str == null) {
		return -1;
	}
	if(start <= 0) {
		return str.lastIndexOf(String.fromCharCode(c));
	}
	return str.lastIndexOf(String.fromCharCode(c), start);
};

JkLangString.getLastIndexOfString = function(str, s, start) {
	if(str == null) {
		return -1;
	}
	if(start <= 0) {
		return str.lastIndexOf(s);
	}
	return str.lastIndexOf(s, start);
};

JkLangString.getEndOfString = function(str, start) {
	if(!(str != null)) {
		return null;
	}
	var ss = start;
	if(ss < 0) {
		ss = 0;
	}
	return str.substring(ss);
};

JkLangString.getSubString = function(str, start, _length) {
	if(!(str != null)) {
		return null;
	}
	var ss = start;
	if(ss < 0) {
		ss = 0;
	}
	return str.substring(ss, ss+_length);
};

JkLangString.contains = function(str1, str2) {
	if(!(str1 != null)) {
		return false;
	}
	if(!(str2 != null)) {
		return false;
	}
	var x = false;
	if(!str1.includes) {
		x = str1.indexOf(str2) !== -1;
	}
	else {
		x = str1.includes(str2);
	}
	;
	return x;
};

JkLangString.startsWith = function(str1, str2, offset) {
	if(!(str1 != null)) {
		return false;
	}
	if(!(str2 != null)) {
		return false;
	}
	var nstr = null;
	if(offset > 0) {
		nstr = JkLangString.getEndOfString(str1, offset);
	}
	else {
		nstr = str1;
	}
	var x = false;
	if(!nstr.startsWith) {
		x = nstr.indexOf(str2) === 0;
	}
	else {
		x = nstr.startsWith(str2);
	}
	;
	return x;
};

JkLangString.startsWithAny = function(str, strings) {
	if(strings != null) {
		var n = 0;
		var m = strings.length;
		for(n = 0 ; n < m ; n++) {
			var str2 = (function(o) {
				if(typeof(o) === 'string') {
					return o;
				}
				return null;
			}.bind(this))(strings[n]);
			if(str2 != null) {
				if(JkLangString.startsWith(str, str2, 0)) {
					return str2;
				}
			}
		}
	}
	return null;
};

JkLangString.startsWithIgnoreCase = function(str1, str2, offset) {
	return JkLangString.startsWith((JkLangString.toLowerCase(str1)), (JkLangString.toLowerCase(str2)), offset);
};

JkLangString.startsWithAnyIgnoreCase = function(str, strings) {
	var ostr = JkLangString.toLowerCase(str);
	if(strings != null) {
		var n = 0;
		var m = strings.length;
		for(n = 0 ; n < m ; n++) {
			var str2 = (function(o) {
				if(typeof(o) === 'string') {
					return o;
				}
				return null;
			}.bind(this))(strings[n]);
			if(str2 != null) {
				if(JkLangString.startsWith(ostr, (JkLangString.toLowerCase(str2)), 0)) {
					return str2;
				}
			}
		}
	}
	return null;
};

JkLangString.endsWith = function(str1, str2) {
	if(!(str1 != null)) {
		return false;
	}
	if(!(str2 != null)) {
		return false;
	}
	var x = false;
	if(!str1.endsWith) {
		x = str1.indexOf(str2) === str1.length - str2.length;
	}
	else {
		x = str1.endsWith(str2);
	}
	;
	return x;
};

JkLangString.endsWithAny = function(str, strings) {
	if(strings != null) {
		var n = 0;
		var m = strings.length;
		for(n = 0 ; n < m ; n++) {
			var str2 = (function(o) {
				if(typeof(o) === 'string') {
					return o;
				}
				return null;
			}.bind(this))(strings[n]);
			if(str2 != null) {
				if(JkLangString.endsWith(str, str2)) {
					return str2;
				}
			}
		}
	}
	return null;
};

JkLangString.endsWithIgnoreCase = function(str1, str2) {
	return JkLangString.endsWith((JkLangString.toLowerCase(str1)), (JkLangString.toLowerCase(str2)));
};

JkLangString.endsWithAnyIgnoreCase = function(str, strings) {
	var ostr = JkLangString.toLowerCase(str);
	if(strings != null) {
		var n = 0;
		var m = strings.length;
		for(n = 0 ; n < m ; n++) {
			var str2 = (function(o) {
				if(typeof(o) === 'string') {
					return o;
				}
				return null;
			}.bind(this))(strings[n]);
			if(str2 != null) {
				if(JkLangString.endsWith(ostr, (JkLangString.toLowerCase(str2)))) {
					return str2;
				}
			}
		}
	}
	return null;
};

JkLangString.strip = function(str) {
	if(!(str != null)) {
		return null;
	}
	return str.trim();
};

JkLangString.stripFromEnd = function(str) {
	if(!(str != null)) {
		return null;
	}
	var ll = JkLangString.getLength(str);
	if(ll < 1) {
		return str;
	}
	var n = 0;
	while(true){
		var c = JkLangString.getChar(str, (ll - 1 - n));
		if(c == ' '.charCodeAt() || c == '\t'.charCodeAt() || c == '\r'.charCodeAt() || c == '\n'.charCodeAt()) {
			n++;
		}
		else {
			break;
		}
	}
	if(n < 1) {
		return str;
	}
	return JkLangString.getSubString(str, 0, (ll - n));
};

JkLangString.stripFromStart = function(str) {
	if(!(str != null)) {
		return null;
	}
	var n = 0;
	while(true){
		var c = JkLangString.getChar(str, n);
		if(c == ' '.charCodeAt() || c == '\t'.charCodeAt() || c == '\r'.charCodeAt() || c == '\n'.charCodeAt()) {
			n++;
		}
		else {
			break;
		}
	}
	if(n < 1) {
		return str;
	}
	return JkLangString.getEndOfString(str, n);
};

JkLangString.replaceCharacter = function(str, oldChar, newChar) {
	if(!(str != null)) {
		return null;
	}
	return str.replace(oldChar, newChar);
};

JkLangString.replaceString = function(str, target, replacement) {
	if(!(str != null)) {
		return null;
	}
	if(JkLangString.isEmpty(target)) {
		return str;
	}
	var rr = replacement;
	if(!(rr != null)) {
		rr = "";
	}
	return str.replace(target, rr);
};

JkLangString.toCharArray = function(str) {
	if(!(str != null)) {
		return null;
	}
	var v = null;
	v = []
for (var i = 0; i < str.length; i++) {
	v[i] = str.charAt(i).charCodeAt();
}
;
return v;
};

JkLangString.split = function(str, delim, max) {
	var v = new Array;
	if(str == null) {
		return v;
	}
	var n = 0;
	while(true){
		if(max > 0 && JkLangVector.getSize(v) >= max - 1) {
			JkLangVector.append(v, (JkLangString.getEndOfString(str, n)));
			break;
		}
		var x = JkLangString.getIndexOfCharacter(str, delim, n);
		if(x < 0) {
			JkLangVector.append(v, (JkLangString.getEndOfString(str, n)));
			break;
		}
		JkLangVector.append(v, (JkLangString.getSubString(str, n, (x - n))));
		n = x + 1;
	}
	return v;
};

JkLangString.isInteger = function(str) {
	if(!(str != null)) {
		return false;
	}
	var it = JkLangString.iterate(str);
	if(!(it != null)) {
		return false;
	}
	while(true){
		var c = it.getNextChar();
		if(c < 1) {
			break;
		}
		if(c < '0'.charCodeAt() || c > '9'.charCodeAt()) {
			return false;
		}
	}
	return true;
};

JkLangString.toInteger = function(str) {
	if(JkLangString.isEmpty(str)) {
		return 0;
	}
	var iter = JkLangString.iterate(str);
	if(!(iter != null)) {
		return 0;
	}
	var v = 0;
	var first = true;
	var negative = false;
	while(true){
		var c = iter.getNextChar();
		if(first && c == '-'.charCodeAt()) {
			negative = true;
			first = false;
			continue;
		}
		if(c >= '0'.charCodeAt() && c <= '9'.charCodeAt()) {
			v = v * 10;
			v += ~(~(c - '0'.charCodeAt()));
		}
		else {
			break;
		}
		first = false;
	}
	if(negative) {
		v *= -1;
	}
	return v;
};

JkLangString.toLong = function(str) {
	if(JkLangString.isEmpty(str)) {
		return 0;
	}
	var iter = JkLangString.iterate(str);
	if(!(iter != null)) {
		return ~(~0);
	}
	var v = ~(~0);
	var first = true;
	var negative = false;
	while(true){
		var c = iter.getNextChar();
		if(first && c == '-'.charCodeAt()) {
			negative = true;
			first = false;
			continue;
		}
		if(c >= '0'.charCodeAt() && c <= '9'.charCodeAt()) {
			v = v * 10;
			v += ~(~(c - '0'.charCodeAt()));
		}
		else {
			break;
		}
		first = false;
	}
	if(negative) {
		v *= -1;
	}
	return v;
};

JkLangString.toIntegerFromHex = function(str) {
	if(JkLangString.isEmpty(str)) {
		return 0;
	}
	var iter = JkLangString.iterate(str);
	if(!(iter != null)) {
		return 0;
	}
	var v = 0;
	while(true){
		var c = iter.getNextChar();
		if(c >= '0'.charCodeAt() && c <= '9'.charCodeAt()) {
			v = v * 16;
			v += ~(~(c - '0'.charCodeAt()));
		}
		else if(c >= 'a'.charCodeAt() && c <= 'f'.charCodeAt()) {
			v = v * 16;
			v += ~(~(10 + c - 'a'.charCodeAt()));
		}
		else if(c >= 'A'.charCodeAt() && c <= 'F'.charCodeAt()) {
			v = v * 16;
			v += ~(~(10 + c - 'A'.charCodeAt()));
		}
		else {
			break;
		}
	}
	return v;
};

JkLangString.toLongIntegerFromHex = function(str) {
	if(JkLangString.isEmpty(str)) {
		return 0;
	}
	var iter = JkLangString.iterate(str);
	if(!(iter != null)) {
		return ~(~0);
	}
	var v = 0;
	while(true){
		var c = iter.getNextChar();
		if(c >= '0'.charCodeAt() && c <= '9'.charCodeAt()) {
			v = v * 16;
			v += ~(~(c - '0'.charCodeAt()));
		}
		else if(c >= 'a'.charCodeAt() && c <= 'f'.charCodeAt()) {
			v = v * 16;
			v += ~(~(10 + c - 'a'.charCodeAt()));
		}
		else if(c >= 'A'.charCodeAt() && c <= 'F'.charCodeAt()) {
			v = v * 16;
			v += ~(~(10 + c - 'A'.charCodeAt()));
		}
		else {
			break;
		}
	}
	return v;
};

JkLangString.toIntegerFromOctal = function(str) {
	if(JkLangString.isEmpty(str)) {
		return 0;
	}
	var iter = JkLangString.iterate(str);
	if(!(iter != null)) {
		return 0;
	}
	var v = 0;
	while(true){
		var c = iter.getNextChar();
		if(c >= '0'.charCodeAt() && c <= '7'.charCodeAt()) {
			v = v * 8;
			v += ~(~(c - '0'.charCodeAt()));
		}
		else {
			break;
		}
	}
	return v;
};

JkLangString.toIntegerFromBinary = function(str) {
	if(JkLangString.isEmpty(str)) {
		return 0;
	}
	var iter = JkLangString.iterate(str);
	if(!(iter != null)) {
		return 0;
	}
	var v = 0;
	while(true){
		var c = iter.getNextChar();
		if(c >= '0'.charCodeAt() && c <= '1'.charCodeAt()) {
			v = v * 2;
			v += ~(~(c - '0'.charCodeAt()));
		}
		else {
			break;
		}
	}
	return v;
};

JkLangString.toDouble = function(str) {
	if(str == null) {
		return 0.0;
	}
	var v = 0.0;
	v = parseFloat(str);
	if (isNaN(v)) {
		v =  0.0;
	}
	;
	return v;
};

JkLangString.iterate = function(value) {
	return JkLangCharacterIteratorForString.forString(value);
};

JkLangString.reverse = function(value) {
	if(!(value != null)) {
		return null;
	}
	var sb = JkLangStringBuilder.NEW();
	var it = JkLangString.iterate(value);
	var c = '\0'.charCodeAt();
	while((c = it.getNextChar()) > 0){
		sb.insertCharacter(0, c);
	}
	return sb.toString();
};

JkLangString.iterateReverse = function(value) {
	return JkLangString.iterate((JkLangString.reverse(value)));
};

JkLangString.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangString"] === true;
};

let JkLangCharacterIterator = {};

JkLangCharacterIterator.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangCharacterIterator"] === true;
};

let JkLangBooleanObject = {};

JkLangBooleanObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangBooleanObject"] === true;
};

let JkLangMatrix = function() {
	this.vector = null;
	this.columnCount = 0;
};

JkLangMatrix.prototype._t = { "JkLangMatrix" : true };
JkLangMatrix.prototype._tobj = JkLangMatrix;

JkLangMatrix.NEW_IntegerInteger = function(rowSize, columnSize) {
	var v = new JkLangMatrix;
	return v.CTOR_JkLangMatrix_IntegerInteger(rowSize, columnSize);
};

JkLangMatrix.prototype.CTOR_JkLangMatrix_IntegerInteger = function(rowSize, columnSize) {
	this.columnCount = 0;
	this.vector = null;
	this.vector = new Array;
	this.setSize(rowSize, columnSize);
	return this;
};

JkLangMatrix.prototype.set = function(row, column, val) {
	if(!(this.vector != null)) {
		return;
	}
	if(!(row >= 0 || column >= 0)) {
		return;
	}
	var size = row * this.columnCount + column;
	if(!(JkLangVector.getSize(this.vector) > size)) {
		return;
	}
	JkLangVector.set(this.vector, size, val);
};

JkLangMatrix.prototype.get = function(row, column) {
	if(!(this.vector != null)) {
		return null;
	}
	if(!(row >= 0 || column >= 0)) {
		return null;
	}
	var size = row * this.columnCount + column;
	if(!(JkLangVector.getSize(this.vector) > size)) {
		return null;
	}
	return JkLangVector.get(this.vector, size);
};

JkLangMatrix.prototype.setSize = function(rowSize, colSize) {
	if(!(this.vector != null)) {
		return null;
	}
	this.columnCount = colSize;
	JkLangVector.setSize(this.vector, (rowSize * colSize));
	return this;
};

JkLangMatrix.prototype.getRowCount = function() {
	if(!(this.vector != null)) {
		return 0;
	}
	return this.vector.length / this.columnCount;
};

JkLangMatrix.prototype.getColumnCount = function() {
	if(!(this.vector != null)) {
		return 0;
	}
	return this.columnCount;
};

JkLangMatrix.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangMatrix"] === true;
};

let JkLangObjectWithSize = {};

JkLangObjectWithSize.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangObjectWithSize"] === true;
};

let JkLangArray = function() {};

JkLangArray.prototype._t = { "JkLangArray" : true };
JkLangArray.prototype._tobj = JkLangArray;

JkLangArray.NEW = function() {
	var v = new JkLangArray;
	return v.CTOR_JkLangArray();
};

JkLangArray.prototype.CTOR_JkLangArray = function() {
	return this;
};

JkLangArray.asObject = function(array) {
	var v = JkLangArrayMyArrayObject.NEW();
	v.setArray(array);
	return v;
};

JkLangArray.isEmpty = function(array) {
	if(array == null) {
		return true;
	}
	if(array.length < 1) {
		return true;
	}
	return false;
};

JkLangArray.isNotEmpty = function(array) {
	return !JkLangArray.isEmpty(array);
};

JkLangArray.contains = function(array, element) {
	if(!(array != null)) {
		return false;
	}
	return array.includes(element);
};

JkLangArray.toVector = function(array) {
	return JkLangVector.forArray(array);
};

JkLangArray.copyFrom = function(array, src, soffset, doffset, size) {
	if(!(array != null)) {
		return;
	}
	if(!(src != null)) {
		return;
	}
	for(var n = 0 ; n < size ; n++) {
		array[doffset + n] = src[soffset + n];
	}
};

JkLangArray.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangArray"] === true;
};

let JkLangDoubleObject = {};

JkLangDoubleObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangDoubleObject"] === true;
};

let JkLangKeyValueList = function() {
	this.values = null;
};

JkLangKeyValueList.prototype._t = { "JkLangKeyValueList" : true };
JkLangKeyValueList.prototype._tobj = JkLangKeyValueList;

JkLangKeyValueList.NEW = function() {
	var v = new JkLangKeyValueList;
	return v.CTOR_JkLangKeyValueList();
};

JkLangKeyValueList.prototype.CTOR_JkLangKeyValueList = function() {
	this.values = null;
	return this;
};

JkLangKeyValueList.prototype.add = function(key, val) {
	if(this.values == null) {
		this.values = new Array;
	}
	var kvp = JkLangKeyValuePair.NEW();
	kvp.key = key;
	kvp.value = val;
	this.values.push(kvp);
};

JkLangKeyValueList.prototype.addPair = function(pair) {
	if(this.values == null) {
		this.values = new Array;
	}
	this.values.push(pair);
};

JkLangKeyValueList.prototype.prepend = function(key, val) {
	if(this.values == null) {
		this.values = new Array;
	}
	var kvp = JkLangKeyValuePair.NEW();
	kvp.key = key;
	kvp.value = val;
	JkLangVector.prepend(this.values, kvp);
};

JkLangKeyValueList.prototype.prependPair = function(pair) {
	if(this.values == null) {
		this.values = new Array;
	}
	JkLangVector.prepend(this.values, pair);
};

JkLangKeyValueList.prototype.iterate = function() {
	var v = JkLangVector.iterate(this.values);
	return v;
};

JkLangKeyValueList.prototype.asVector = function() {
	return this.values;
};

JkLangKeyValueList.prototype.dup = function() {
	var v = JkLangKeyValueList.NEW();
	var it = this.iterate();
	while(true){
		var kvp = it.next();
		if(kvp == null) {
			break;
		}
		v.add(kvp.key, kvp.value);
	}
	return v;
};

JkLangKeyValueList.prototype.getKey = function(index) {
	if(this.values == null) {
		return null;
	}
	var kvp = JkLangVector.get(this.values, index);
	if(kvp == null) {
		return null;
	}
	return kvp.key;
};

JkLangKeyValueList.prototype.getValue = function(index) {
	if(this.values == null) {
		return null;
	}
	var kvp = JkLangVector.get(this.values, index);
	if(kvp == null) {
		return null;
	}
	return kvp.value;
};

JkLangKeyValueList.prototype.count = function() {
	if(this.values == null) {
		return 0;
	}
	return JkLangVector.getSize(this.values);
};

JkLangKeyValueList.prototype.remove = function(index) {
	JkLangVector.remove(this.values, index);
};

JkLangKeyValueList.prototype.clear = function() {
	this.values = null;
};

JkLangKeyValueList.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangKeyValueList"] === true;
};

let JkLangBooleanIterator = {};

JkLangBooleanIterator.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangBooleanIterator"] === true;
};

let JkLangIterator = {};

JkLangIterator.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangIterator"] === true;
};

let JkLangVector = function() {};

JkLangVector.prototype._t = { "JkLangVector" : true };
JkLangVector.prototype._tobj = JkLangVector;

JkLangVector.NEW = function() {
	var v = new JkLangVector;
	return v.CTOR_JkLangVector();
};

JkLangVector.prototype.CTOR_JkLangVector = function() {
	return this;
};

JkLangVector.asVector = function(obj) {
	var vo = (function(o) {
		if(JkLangVectorObject.IS_INSTANCE && JkLangVectorObject.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(obj);
	if(!(vo != null)) {
		return null;
	}
	return vo.toVector();
};

JkLangVector.asObjectVector = function(o) {
	var it = JkLangDynamicObject.iterate(o);
	if(!(it != null)) {
		return null;
	}
	var v = new Array;
	while(true){
		var oo = it.next();
		if(!(oo != null)) {
			break;
		}
		v.push(oo);
	}
	return v;
};

JkLangVector.forIterator = function(iterator) {
	if(!(iterator != null)) {
		return null;
	}
	var v = new Array;
	while(true){
		var o = iterator.next();
		if(o == null) {
			break;
		}
		v.push(o);
	}
	return v;
};

JkLangVector.forArray = function(array) {
	if(!(array != null)) {
		return null;
	}
	var v = new Array;
	for(var n = 0 ; n < array.length ; n++) {
		v.push(array[n]);
	}
	return v;
};

JkLangVector.toVectorOfObject = function(collection) {
	if(!(collection != null)) {
		return null;
	}
	var nvec = new Array;
	if(collection != null) {
		var n = 0;
		var m = collection.length;
		for(n = 0 ; n < m ; n++) {
			var item = collection[n];
			if(item != null) {
				nvec.push(item);
			}
		}
	}
	return nvec;
};

JkLangVector.dupObjectVector = function(vector) {
	if(!(vector != null)) {
		return null;
	}
	var v = new Array;
	if(vector != null) {
		var n = 0;
		var m = vector.length;
		for(n = 0 ; n < m ; n++) {
			var o = vector[n];
			if(o != null) {
				v.push(o);
			}
		}
	}
	return v;
};

JkLangVector.contains = function(vector, item) {
	if(!(vector != null)) {
		return false;
	}
	return vector.includes(item);
};

JkLangVector.append = function(vector, item) {
	vector.push(item);
	;
};

JkLangVector.prepend = function(vector, item) {
	JkLangVector.insert(vector, item, 0);
};

JkLangVector.insert = function(vector, item, index) {
	vector.splice(index, 0, item);
	;
};

JkLangVector.setCapacity = function(vector, capacity) {
	if(!(vector != null)) {
		return;
	}
};

JkLangVector.setSize = function(vector, newSize) {
	if(!(vector != null)) {
		return null;
	}
	var sz = newSize;
	if(sz < 0) {
		sz = 0;
	}
	var osz = JkLangVector.getSize(vector);
	if(sz == osz) {
		return vector;
	}
	if(sz < osz) {
		for(var n = osz - 1 ; n >= sz ; n--) {
			JkLangVector.remove(vector, n);
		}
	}
	else {
		for(var n1 = osz ; n1 < sz ; n1++) {
			vector.push(null);
		}
	}
	return vector;
};

JkLangVector.getSize = function(vector) {
	if(vector == null) {
		return 0;
	}
	return vector.length;
};

JkLangVector.getAt = function(vector, index) {
	return JkLangVector.get(vector, index);
};

JkLangVector.get = function(vector, index) {
	if(index < 0 || index >= JkLangVector.getSize(vector)) {
		return null;
	}
	return vector[index];
};

JkLangVector.getFirst = function(vector) {
	return JkLangVector.get(vector, 0);
};

JkLangVector.getLast = function(vector) {
	return JkLangVector.get(vector, (JkLangVector.getSize(vector) - 1));
};

JkLangVector.set = function(vector, index, val) {
	if(index < 0 || index >= JkLangVector.getSize(vector)) {
		return;
	}
	vector.splice(index, 1, val);
	;
};

JkLangVector.remove = function(vector, index) {
	var sz = JkLangVector.getSize(vector);
	if(index < 0 || index >= sz) {
		return null;
	}
	return vector.splice(index, 1);
};

JkLangVector.popFirst = function(vector) {
	if(vector == null || JkLangVector.getSize(vector) < 1) {
		return null;
	}
	var v = JkLangVector.get(vector, 0);
	JkLangVector.removeFirst(vector);
	return v;
};

JkLangVector.removeFirst = function(vector) {
	if(vector == null || JkLangVector.getSize(vector) < 1) {
		return;
	}
	JkLangVector.remove(vector, 0);
};

JkLangVector.popLast = function(vector) {
	var sz = JkLangVector.getSize(vector);
	if(vector == null || sz < 1) {
		return null;
	}
	var v = JkLangVector.get(vector, (sz - 1));
	JkLangVector.removeLast(vector);
	return v;
};

JkLangVector.removeLast = function(vector) {
	if(vector == null) {
		return;
	}
	var sz = JkLangVector.getSize(vector);
	if(sz < 1) {
		return;
	}
	JkLangVector.remove(vector, (sz - 1));
};

JkLangVector.removeValue = function(vector, value) {
	var n = 0;
	for(n = 0 ; n < vector.length ; n++) {
		if (!Object.is) {
			if(vector[n] === value) {
				this.remove(vector, n);
				return(n);
			}
		}
		else {
			if(Object.is(vector[n], value)) {
				this.remove(vector, n);
				return(n);
			}
		}
		;
	}
	return -1;
};

JkLangVector.clear = function(vector) {
	vector.splice(0, vector.length);
	;
};

JkLangVector.isEmpty = function(vector) {
	return JkLangVector.getSize(vector) < 1;
};

JkLangVector.isNotEmpty = function(vector) {
	return !JkLangVector.isEmpty(vector);
};

JkLangVector.removeRange = function(vector, index, count) {
	vector.splice(index, count);
	;
};

JkLangVector.iterate = function(vector) {
	return JkLangVectorVectorIterator.NEW_VectorInteger(vector, 1);
};

JkLangVector.iterateReverse = function(vector) {
	return JkLangVectorVectorIterator.NEW_VectorInteger(vector, (-1));
};

JkLangVector.sort = function(vector, comparer) {
	if(!(vector != null)) {
		return;
	}
	vector.sort(function(a, b) {
		return(comparer(a, b));
	});
	;
};

JkLangVector.sortReverse = function(vector, comparer) {
	var cc = comparer;
	JkLangVector.sort(vector, (function(a1, b1) {
		return -cc(a1, b1);
	}.bind(this)));
};

JkLangVector.sortAsStrings = function(vector) {
	JkLangVector.sort(vector, (function(a1, b1) {
		return JkLangString.compare((JkLangString.asString(a1)), (JkLangString.asString(b1)));
	}.bind(this)));
};

JkLangVector.sortAsStringsReverse = function(vector) {
	JkLangVector.sortReverse(vector, (function(a1, b1) {
		return JkLangString.compare((JkLangString.asString(a1)), (JkLangString.asString(b1)));
	}.bind(this)));
};

JkLangVector.reverse = function(vector) {
	if(!(vector != null)) {
		return;
	}
	var a = 0;
	var b = JkLangVector.getSize(vector) - 1;
	while(a < b){
		var t = JkLangVector.getAt(vector, b);
		JkLangVector.set(vector, b, (JkLangVector.getAt(vector, a)));
		JkLangVector.set(vector, a, t);
		a++;
		b--;
	}
};

JkLangVector.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangVector"] === true;
};

let JkLangBoolean = function() {
	this.value = false;
};

JkLangBoolean.prototype._t = {
	"JkLangBoolean" : true,
	"JkLangBooleanObject" : true
};
JkLangBoolean.prototype._tobj = JkLangBoolean;

JkLangBoolean.NEW = function() {
	var v = new JkLangBoolean;
	return v.CTOR_JkLangBoolean();
};

JkLangBoolean.prototype.CTOR_JkLangBoolean = function() {
	this.value = false;
	return this;
};

JkLangBoolean.asObject = function(value) {
	var v = JkLangBoolean.NEW();
	v.setValue(value);
	return v;
};

JkLangBoolean.asBoolean = function(obj, defaultValue) {
	if(obj == null) {
		return false;
	}
	if(typeof(obj) === 'boolean') {
		return obj;
	}
	if(JkLangBooleanObject.IS_INSTANCE && JkLangBooleanObject.IS_INSTANCE(obj)) {
		var bo = obj;
		return bo.toBoolean();
	}
	if(typeof(obj) === 'number') {
		if(~(~obj) == 0) {
			return false;
		}
		return true;
	}
	if(JkLangIntegerObject.IS_INSTANCE && JkLangIntegerObject.IS_INSTANCE(obj)) {
		if(obj.toInteger() == 0) {
			return false;
		}
		return true;
	}
	if(typeof(obj) === 'number') {
		if(~(~obj) == 0) {
			return false;
		}
		return true;
	}
	if(JkLangLongIntegerObject.IS_INSTANCE && JkLangLongIntegerObject.IS_INSTANCE(obj)) {
		if(obj.toLong() == 0) {
			return false;
		}
		return true;
	}
	if(typeof(obj) === 'string') {
		var str = JkLangString.toLowerCase(obj);
		if(str == "yes" || str == "true" || str == "1") {
			return true;
		}
		if(str == "no" || str == "false" || str == "0") {
			return false;
		}
		return defaultValue;
	}
	if(JkLangStringObject.IS_INSTANCE && JkLangStringObject.IS_INSTANCE(obj)) {
		var str1 = obj.toString();
		if(str1 != null) {
			str1 = JkLangString.toLowerCase(str1);
			if(str1 == "yes" || str1 == "true" || str1 == "1") {
				return true;
			}
			if(str1 == "no" || str1 == "false" || str1 == "0") {
				return false;
			}
		}
		return defaultValue;
	}
	if(typeof(obj) === 'number') {
		if(obj == 0.0) {
			return false;
		}
		return true;
	}
	if(JkLangDoubleObject.IS_INSTANCE && JkLangDoubleObject.IS_INSTANCE(obj)) {
		if(obj.toDouble() == 0.0) {
			return false;
		}
		return true;
	}
	if(typeof(obj) === 'string') {
		if(~(~obj) == 0) {
			return false;
		}
		return true;
	}
	if(JkLangCharacterObject.IS_INSTANCE && JkLangCharacterObject.IS_INSTANCE(obj)) {
		if(~(~obj.toCharacter()) == 0) {
			return false;
		}
		return true;
	}
	if(JkLangObjectWithSize.IS_INSTANCE && JkLangObjectWithSize.IS_INSTANCE(obj)) {
		var sz = obj.getSize();
		if(sz == 0) {
			return false;
		}
		return true;
	}
	return defaultValue;
};

JkLangBoolean.prototype.toBoolean = function() {
	return this.value;
};

JkLangBoolean.prototype.getValue = function() {
	return this.value;
};

JkLangBoolean.prototype.setValue = function(v) {
	this.value = v;
	return this;
};

JkLangBoolean.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangBoolean"] === true;
};

let JkLangClosable = {};

JkLangClosable.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangClosable"] === true;
};

let JkLangDuplicateable = {};

JkLangDuplicateable.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangDuplicateable"] === true;
};

let JkLangSet = function() {};

JkLangSet.prototype._t = { "JkLangSet" : true };
JkLangSet.prototype._tobj = JkLangSet;

JkLangSet.NEW = function() {
	var v = new JkLangSet;
	return v.CTOR_JkLangSet();
};

JkLangSet.prototype.CTOR_JkLangSet = function() {
	return this;
};

JkLangSet.add = function(set, value) {
	if(!(set != null)) {
		return;
	}
	set.add(value)
	;
};

JkLangSet.remove = function(set, value) {
	if(!(set != null)) {
		return;
	}
	set.delete(value)
	;
};

JkLangSet.clear = function(set) {
	if(!(set != null)) {
		return;
	}
	set.clear()
	;
};

JkLangSet.getSize = function(set) {
	if(!(set != null)) {
		return 0;
	}
	return set.size;
};

JkLangSet.contains = function(set, value) {
	if(!(set != null)) {
		return false;
	}
	return set.has(value);
};

JkLangSet.getValues = function(set) {
	if(!(set != null)) {
		return null;
	}
	var v = new Array;
	data.forEach(function(value, key, oset) {
		this.push(value);
	}, v);
	;
	return v;
};

JkLangSet.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangSet"] === true;
};

let JkLangStringObject = {};

JkLangStringObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangStringObject"] === true;
};

let JkLangIntegerIterator = {};

JkLangIntegerIterator.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangIntegerIterator"] === true;
};

let JkLangDynamicMapObject = {};

JkLangDynamicMapObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangDynamicMapObject"] === true;
};

let JkLangIterateable = {};

JkLangIterateable.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangIterateable"] === true;
};

let JkLangLongIntegerObject = {};

JkLangLongIntegerObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangLongIntegerObject"] === true;
};

let JkLangStringIterator = {};

JkLangStringIterator.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangStringIterator"] === true;
};

let JkLangDoubleIterator = {};

JkLangDoubleIterator.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangDoubleIterator"] === true;
};

let JkLangArrayObject = {};

JkLangArrayObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangArrayObject"] === true;
};

let JkLangRunnable = {};

JkLangRunnable.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangRunnable"] === true;
};

let JkLangIntegerObject = {};

JkLangIntegerObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangIntegerObject"] === true;
};

let JkLangCharacterDecoder = function() {
	this.encoding = 0;
	this.current = 0;
	this.surrogatePair = null;
	this.counter = 0;
	this.currentSize = 0;
	this.ended = false;
};

JkLangCharacterDecoder.prototype._t = {
	"JkLangCharacterIterator" : true,
	"JkLangCharacterDecoder" : true
};
JkLangCharacterDecoder.prototype._tobj = JkLangCharacterDecoder;

JkLangCharacterDecoder.NEW = function() {
	var v = new JkLangCharacterDecoder;
	return v.CTOR_JkLangCharacterDecoder();
};

JkLangCharacterDecoder.prototype.CTOR_JkLangCharacterDecoder = function() {
	this.ended = false;
	this.currentSize = 0;
	this.counter = 0;
	this.surrogatePair = null;
	this.current = 0;
	this.encoding = 0;
	return this;
};

JkLangCharacterDecoder.prototype.resetDecoder = function() {
	this.current = 0;
	this.surrogatePair = null;
	this.counter = 0;
	this.currentSize = 0;
	this.ended = false;
};

JkLangCharacterDecoder.prototype.copyTo = function(o) {
	o.encoding = this.encoding;
	o.current = this.current;
	o.currentSize = this.currentSize;
	o.ended = this.ended;
};

JkLangCharacterDecoder.prototype.moveToPreviousByte = function() {
	return false;
};

JkLangCharacterDecoder.prototype.moveToNextByte = function() {
	return false;
};

JkLangCharacterDecoder.prototype.getCurrentByte = function() {
	return 0;
};

JkLangCharacterDecoder.prototype.setEncoding = function(ee) {
	if(JkLangString.equalsIgnoreCase(ee, "UTF8") || JkLangString.equalsIgnoreCase(ee, "UTF-8")) {
		this.encoding = JkLangCharacterDecoder.UTF8;
		this.currentSize = 1;
		return this;
	}
	if(JkLangString.equalsIgnoreCase(ee, "ASCII")) {
		this.encoding = JkLangCharacterDecoder.ASCII;
		this.currentSize = 1;
		return this;
	}
	if(JkLangString.equalsIgnoreCase(ee, "UCS2") || JkLangString.equalsIgnoreCase(ee, "UCS-2")) {
		this.encoding = JkLangCharacterDecoder.UCS2;
		this.currentSize = 2;
		return this;
	}
	return null;
};

JkLangCharacterDecoder.prototype.getEncoding = function() {
	return this.encoding;
};

JkLangCharacterDecoder.prototype.moveToPreviousChar = function() {
	var op = this.getCurrentPosition();
	var cs = this.currentSize;
	if(cs > 1) {
		var n = 0;
		for(n = 0 ; n < cs - 1 ; n++) {
			if(!this.moveToPreviousByte()) {
				return false;
			}
		}
	}
	var v = this.doMoveToPreviousChar();
	if(!v) {
		this.setCurrentPosition(op);
	}
	if(v && this.ended) {
		this.ended = false;
	}
	return v;
};

JkLangCharacterDecoder.prototype.convertToChar = function(v) {
	var rr = '\0'.charCodeAt();
	if(!String.fromCodePoint) {
		var fromCodePoint = function(_) {
			var codeUnits = [];
			var index = -1;
			var result = "";
			var lengthOfArgs = arguments.length;
			while(++index < lengthOfArgs) {
				var codePoint = Number(arguments[index]);
				if(!isFinite(codePoint) || codePoint < 0 || codePoint > 0x10FFFF || Math.floor(codePoint) != codePoint) {
					console.log("Invalid code point");
				}
				if(codePoint <= 0xFFFF) {
					codeUnits.push(codePoint);
				}
				else {
					codePoint -= 0x10000;
					codeUnits.push((codePoint >> 10) + 0xD800, (codePoint % 0x400) + 0xDC00);
				}
				if(index + 1 == lengthOfArgs || codeUnits.length > 0x4000) {
					result += String.fromCharCode.apply(null, codeUnits);
					codeUnits.length = 0;
				}
			}
			return result;
		};
		String.fromCodePoint = fromCodePoint;
	};
	rr = String.fromCodePoint(v);
	;
	return rr;
};

JkLangCharacterDecoder.prototype.getSurrogatePair = function() {
	if(!(this.surrogatePair != null)) {
		return '\0'.charCodeAt();
	}
	var c = this.surrogatePair[this.counter];
	this.counter++;
	if(this.counter == 2) {
		this.counter = 0;
		this.surrogatePair = null;
	}
	return c;
};

JkLangCharacterDecoder.prototype.doMoveToPreviousChar = function() {
	if(this.encoding == JkLangCharacterDecoder.UTF8) {
		if(!this.moveToPreviousByte()) {
			return false;
		}
		var c2 = ~(~this.getCurrentByte());
		if(c2 <= 0x7f) {
			this.current = c2;
			this.currentSize = 1;
			return true;
		}
		if(!this.moveToPreviousByte()) {
			return false;
		}
		var c1 = ~(~this.getCurrentByte());
		if((c1 & 0xc0) == 0xc0) {
			if(!this.moveToNextByte()) {
				return false;
			}
			var v = ~(~((c1 & 0x1f) << 6));
			v += ~(~(c2 & 0x3f));
			this.current = this.convertToChar(v);
			this.currentSize = 2;
			return true;
		}
		if(!this.moveToPreviousByte()) {
			return false;
		}
		var c0 = ~(~this.getCurrentByte());
		if((c0 & 0xe0) == 0xe0) {
			if(!this.moveToNextByte()) {
				return false;
			}
			if(!this.moveToNextByte()) {
				return false;
			}
			var v1 = ~(~((c0 & 0xf) << 12));
			v1 += ~(~((c1 & 0x3f) << 6));
			v1 += ~(~(c2 & 0x3f));
			this.current = this.convertToChar(v1);
			this.currentSize = 3;
			return true;
		}
		if(!this.moveToPreviousByte()) {
			return false;
		}
		var cm1 = ~(~this.getCurrentByte());
		if((cm1 & 0xf0) == 0xf0) {
			if(!this.moveToNextByte()) {
				return false;
			}
			if(!this.moveToNextByte()) {
				return false;
			}
			if(!this.moveToNextByte()) {
				return false;
			}
			var v2 = ~(~((cm1 & 0x7) << 18));
			v2 += ~(~((c0 & 0x3f) << 12));
			v2 += ~(~((c1 & 0x3f) << 6));
			v2 += ~(~(c2 & 0x3f));
			this.current = this.convertToChar(v2);
			this.currentSize = 4;
			return true;
		}
		this.moveToNextByte();
		this.moveToNextByte();
		this.moveToNextByte();
		this.current = '?'.charCodeAt();
		this.currentSize = 1;
		return true;
	}
	if(this.encoding == JkLangCharacterDecoder.ASCII) {
		if(!this.moveToPreviousByte()) {
			return false;
		}
		this.current = this.getCurrentByte();
		return true;
	}
	if(this.encoding == JkLangCharacterDecoder.UCS2) {
		if(!this.moveToPreviousByte()) {
			return false;
		}
		var c11 = ~(~this.getCurrentByte());
		if(!this.moveToPreviousByte()) {
			return false;
		}
		var c01 = ~(~this.getCurrentByte());
		if(!this.moveToNextByte()) {
			return false;
		}
		this.current = c01 << 8 & c11;
		return true;
	}
	console.log("Unsupported encoding in CharacterDecoder: " + (JkLangString.safeString((JkLangString.forInteger(this.encoding)))));
	return false;
};

JkLangCharacterDecoder.prototype.moveToNextChar = function() {
	var v = this.doMoveToNextChar();
	if(v == false) {
		this.current = 0;
		this.ended = true;
	}
	return v;
};

JkLangCharacterDecoder.prototype.doMoveToNextChar = function() {
	if(this.encoding == JkLangCharacterDecoder.UTF8) {
		if(this.surrogatePair != null) {
			this.current = this.getSurrogatePair();
			return true;
		}
		if(!this.moveToNextByte()) {
			return false;
		}
		var b1 = this.getCurrentByte();
		var v = -1;
		if(b1 <= 0x7f) {
			v = ~(~b1);
			this.currentSize = 1;
		}
		else if(b1 >= 0xf0) {
			v = ~(~((b1 & 0x7) << 18));
			if(!this.moveToNextByte()) {
				return false;
			}
			var b2 = this.getCurrentByte();
			v += ~(~((b2 & 0x3f) << 12));
			if(!this.moveToNextByte()) {
				return false;
			}
			var b3 = this.getCurrentByte();
			v += ~(~((b3 & 0x3f) << 6));
			if(!this.moveToNextByte()) {
				return false;
			}
			var b4 = this.getCurrentByte();
			v += ~(~(b4 & 0x3f));
			this.currentSize = 4;
		}
		else if(b1 >= 0xe0) {
			v = ~(~((b1 & 0xf) << 12));
			if(!this.moveToNextByte()) {
				return false;
			}
			var b21 = this.getCurrentByte();
			v += ~(~((b21 & 0x3f) << 6));
			if(!this.moveToNextByte()) {
				return false;
			}
			var b31 = this.getCurrentByte();
			v += ~(~(b31 & 0x3f));
			this.currentSize = 3;
		}
		else if(b1 >= 0xc0) {
			v = ~(~((b1 & 0x1f) << 6));
			if(!this.moveToNextByte()) {
				return false;
			}
			var b22 = this.getCurrentByte();
			v += ~(~(b22 & 0x3f));
			this.currentSize = 2;
		}
		else {
			v = ~(~'?'.charCodeAt());
			this.currentSize = 1;
		}
		this.current = this.convertToChar(v);
		return true;
	}
	if(this.encoding == JkLangCharacterDecoder.ASCII) {
		if(!this.moveToNextByte()) {
			return false;
		}
		this.current = this.getCurrentByte();
		return true;
	}
	if(this.encoding == JkLangCharacterDecoder.UCS2) {
		if(!this.moveToNextByte()) {
			return false;
		}
		var c0 = ~(~this.getCurrentByte());
		if(!this.moveToNextByte()) {
			return false;
		}
		var c1 = ~(~this.getCurrentByte());
		this.current = c0 << 8 & c1;
		return true;
	}
	console.log("Unsupported encoding in CharacterDecoder: " + (JkLangString.safeString((JkLangString.forInteger(this.encoding)))));
	return false;
};

JkLangCharacterDecoder.prototype.getCurrentChar = function() {
	return this.current;
};

JkLangCharacterDecoder.prototype.getNextChar = function() {
	if(this.moveToNextChar() == false) {
		return 0;
	}
	return this.current;
};

JkLangCharacterDecoder.prototype.hasEnded = function() {
	return this.ended;
};

JkLangCharacterDecoder.prototype.getCurrentPosition = function() {};

JkLangCharacterDecoder.prototype.setCurrentPosition = function(position) {};

JkLangCharacterDecoder.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangCharacterDecoder"] === true;
};

JkLangCharacterDecoder.UTF8 = 0;
JkLangCharacterDecoder.ASCII = 1;
JkLangCharacterDecoder.UCS2 = 2;

let JkLangLogicOp = function() {};

JkLangLogicOp.prototype._t = { "JkLangLogicOp" : true };
JkLangLogicOp.prototype._tobj = JkLangLogicOp;

JkLangLogicOp.NEW = function() {
	var v = new JkLangLogicOp;
	return v.CTOR_JkLangLogicOp();
};

JkLangLogicOp.prototype.CTOR_JkLangLogicOp = function() {
	return this;
};

JkLangLogicOp.prototype.or = function(v1, v2) {
	return v1 || v2;
};

JkLangLogicOp.prototype.and = function(v1, v2) {
	return v1 && v2;
};

JkLangLogicOp.prototype.not = function(v) {
	return !v;
};

JkLangLogicOp.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangLogicOp"] === true;
};

let JkLangException = function() {};

JkLangException.prototype._t = { "JkLangException" : true };
JkLangException.prototype._tobj = JkLangException;

JkLangException.NEW = function() {
	var v = new JkLangException;
	return v.CTOR_JkLangException();
};

JkLangException.prototype.CTOR_JkLangException = function() {
	;
	return this;
};

JkLangException.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangException"] === true;
};

let JkLangStringBuilder = function() {
	this.builder = null;
};

JkLangStringBuilder.prototype._t = {
	"JkLangStringObject" : true,
	"JkLangStringBuilder" : true
};
JkLangStringBuilder.prototype._tobj = JkLangStringBuilder;

JkLangStringBuilder.NEW = function() {
	var v = new JkLangStringBuilder;
	return v.CTOR_JkLangStringBuilder();
};

JkLangStringBuilder.prototype.CTOR_JkLangStringBuilder = function() {
	this.builder = null;
	this.initialize();
	return this;
};

JkLangStringBuilder.forString = function(initial) {
	var v = JkLangStringBuilder.NEW();
	v.appendString(initial);
	return v;
};

JkLangStringBuilder.dup = function(initial) {
	var v = JkLangStringBuilder.NEW();
	if(initial != null) {
		v.appendString((initial.toString()));
	}
	return v;
};

JkLangStringBuilder.prototype.initialize = function() {
	this.builder = new String();
	;
};

JkLangStringBuilder.prototype.clear = function() {
	this.initialize();
};

JkLangStringBuilder.prototype.count = function() {
	return this.builder.length;
};

JkLangStringBuilder.prototype.appendLong = function(c) {
	return this.appendString((JkLangString.forLongInteger(c)));
};

JkLangStringBuilder.prototype.appendInteger = function(c) {
	return this.appendString((JkLangString.forInteger(c)));
};

JkLangStringBuilder.prototype.appendDouble = function(c) {
	return this.appendString((JkLangString.forDouble(c)));
};

JkLangStringBuilder.prototype.appendFloat = function(c) {
	return this.appendString((JkLangString.forFloat(c)));
};

JkLangStringBuilder.prototype.appendCharacter = function(c) {
	if(c == 0 || c == -1) {
		return this;
	}
	return this.appendString((JkLangString.forCharacter(c)));
};

JkLangStringBuilder.prototype.appendString = function(str) {
	if(str == null) {
		return this;
	}
	this.builder += str;
	;
	return this;
};

JkLangStringBuilder.prototype.insertInteger = function(index, c) {
	return this.insertString(index, (JkLangString.forInteger(c)));
};

JkLangStringBuilder.prototype.insertCharacter = function(index, c) {
	if(c == 0) {
		return this;
	}
	return this.insertString(index, (JkLangString.forCharacter(c)));
};

JkLangStringBuilder.prototype.insertDouble = function(index, c) {
	return this.insertString(index, (JkLangString.forDouble(c)));
};

JkLangStringBuilder.prototype.insertFloat = function(index, c) {
	return this.insertString(index, (JkLangString.forFloat(c)));
};

JkLangStringBuilder.prototype.insertString = function(index, str) {
	if(str == null) {
		return this;
	}
	var fp = null;
	var lp = null;
	fp = this.builder.substring(0, index);
	lp = this.builder.substring(index, this.builder.length);
	this.builder = fp + str + lp;
	;
	return this;
};

JkLangStringBuilder.prototype.remove = function(index, _length) {
	if(_length < 1) {
		return this;
	}
	var fp = null;
	var lp = null;
	fp = this.builder.substring(0, index);
	lp = this.builder.substring(index+length, this.builder.length);
	this.builder = fp + lp;
	;
	return this;
};

JkLangStringBuilder.prototype.removeLastCharacter = function() {
	var c = this.count();
	if(c > 0) {
		this.remove((c - 1), 1);
	}
	return this;
};

JkLangStringBuilder.prototype.toString = function() {
	return this.builder.toString();
};

JkLangStringBuilder.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangStringBuilder"] === true;
};

let JkLangStringObjectWithDebug = {};

JkLangStringObjectWithDebug.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangStringObjectWithDebug"] === true;
};

let JkLangVectorVectorIterator = function() {
	this.vector = null;
	this.index = 0;
	this.increment = 1;
};

JkLangVectorVectorIterator.prototype._t = {
	"JkLangVectorVectorIterator" : true,
	"JkLangIterator" : true
};
JkLangVectorVectorIterator.prototype._tobj = JkLangVectorVectorIterator;

JkLangVectorVectorIterator.NEW_VectorInteger = function(vector, increment) {
	var v = new JkLangVectorVectorIterator;
	return v.CTOR_JkLangVectorVectorIterator_VectorInteger(vector, increment);
};

JkLangVectorVectorIterator.prototype.CTOR_JkLangVectorVectorIterator_VectorInteger = function(vector, increment) {
	this.increment = 1;
	this.index = 0;
	this.vector = null;
	this.vector = vector;
	this.increment = increment;
	if(increment < 0 && vector != null) {
		this.index = vector.length - 1;
	}
	return this;
};

JkLangVectorVectorIterator.prototype.next = function() {
	if(this.vector == null) {
		return null;
	}
	if(this.index < 0 || this.index >= this.vector.length) {
		return null;
	}
	var v = this.vector[this.index];
	this.index += this.increment;
	return v;
};

JkLangVectorVectorIterator.prototype.hasNext = function() {
	if(!(this.vector != null)) {
		return false;
	}
	if(!(this.index < this.vector.length)) {
		return false;
	}
	return true;
};

JkLangVectorVectorIterator.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangVectorVectorIterator"] === true;
};

let JkLangTask = {};

JkLangTask.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangTask"] === true;
};

let JkLangStringSet = function() {
	this.data = null;
};

JkLangStringSet.prototype._t = { "JkLangStringSet" : true };
JkLangStringSet.prototype._tobj = JkLangStringSet;

JkLangStringSet.NEW = function() {
	var v = new JkLangStringSet;
	return v.CTOR_JkLangStringSet();
};

JkLangStringSet.prototype.CTOR_JkLangStringSet = function() {
	this.data = null;
	this.data = new Map;
	return this;
};

JkLangStringSet.prototype.add = function(value) {
	JkLangMap.setValue(this.data, value, (JkLangBoolean.asObject(true)));
};

JkLangStringSet.prototype.remove = function(value) {
	JkLangMap.remove(this.data, value);
};

JkLangStringSet.prototype.count = function() {
	return JkLangMap.count(this.data);
};

JkLangStringSet.prototype.contains = function(value) {
	if(JkLangMap.getValue(this.data, value) != null) {
		return true;
	}
	return false;
};

JkLangStringSet.prototype.getAll = function() {
	var v = JkLangMap.getKeys(this.data);
	return v;
};

JkLangStringSet.prototype.clear = function() {
	JkLangMap.clear(this.data);
};

JkLangStringSet.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangStringSet"] === true;
};

let JkLangLongInteger = function() {
	this.value = 0;
};

JkLangLongInteger.prototype._t = {
	"JkLangLongIntegerObject" : true,
	"JkLangLongInteger" : true
};
JkLangLongInteger.prototype._tobj = JkLangLongInteger;

JkLangLongInteger.NEW = function() {
	var v = new JkLangLongInteger;
	return v.CTOR_JkLangLongInteger();
};

JkLangLongInteger.prototype.CTOR_JkLangLongInteger = function() {
	this.value = 0;
	return this;
};

JkLangLongInteger.forValue = function(value) {
	return JkLangLongInteger.asObject(value);
};

JkLangLongInteger.asObject = function(value) {
	var v = JkLangLongInteger.NEW();
	v.setValue(value);
	return v;
};

JkLangLongInteger.asLong = function(obj) {
	if(!(obj != null)) {
		return 0;
	}
	if(typeof(obj) === 'number') {
		return ~(~obj);
	}
	if(JkLangLongIntegerObject.IS_INSTANCE && JkLangLongIntegerObject.IS_INSTANCE(obj)) {
		var oi = obj;
		return oi.toLong();
	}
	if(typeof(obj) === 'number') {
		var v = ~(~obj);
		return ~(~v);
	}
	if(JkLangIntegerObject.IS_INSTANCE && JkLangIntegerObject.IS_INSTANCE(obj)) {
		var oi1 = obj;
		return ~(~oi1.toInteger());
	}
	if(typeof(obj) === 'string') {
		return JkLangString.toLong(obj);
	}
	if(JkLangStringObject.IS_INSTANCE && JkLangStringObject.IS_INSTANCE(obj)) {
		return JkLangString.toLong((obj.toString()));
	}
	if(typeof(obj) === 'number') {
		var v1 = obj;
		return ~(~v1);
	}
	if(JkLangDoubleObject.IS_INSTANCE && JkLangDoubleObject.IS_INSTANCE(obj)) {
		var od = obj;
		return ~(~od.toDouble());
	}
	if(typeof(obj) === 'boolean') {
		if(obj == true) {
			return 1;
		}
		return 0;
	}
	if(JkLangBooleanObject.IS_INSTANCE && JkLangBooleanObject.IS_INSTANCE(obj)) {
		if(obj.toBoolean()) {
			return 1;
		}
		return 0;
	}
	if(typeof(obj) === 'string') {
		var v2 = obj;
		return ~(~v2);
	}
	if(JkLangCharacterObject.IS_INSTANCE && JkLangCharacterObject.IS_INSTANCE(obj)) {
		var oc = obj;
		return ~(~oc.toCharacter());
	}
	return 0;
};

JkLangLongInteger.prototype.add = function(amount) {
	this.value += amount;
};

JkLangLongInteger.prototype.toLong = function() {
	return this.value;
};

JkLangLongInteger.prototype.getValue = function() {
	return this.value;
};

JkLangLongInteger.prototype.setValue = function(v) {
	this.value = v;
	return this;
};

JkLangLongInteger.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangLongInteger"] === true;
};

let JkLangStringDataReceiver = {};

JkLangStringDataReceiver.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangStringDataReceiver"] === true;
};

let JkLangBufferObject = {};

JkLangBufferObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangBufferObject"] === true;
};

let JkLangBufferBuilder = function() {
	this.buffer = null;
	this.pointer = 0;
};

JkLangBufferBuilder.prototype._t = { "JkLangBufferBuilder" : true };
JkLangBufferBuilder.prototype._tobj = JkLangBufferBuilder;

JkLangBufferBuilder.NEW = function() {
	var v = new JkLangBufferBuilder;
	return v.CTOR_JkLangBufferBuilder();
};

JkLangBufferBuilder.prototype.CTOR_JkLangBufferBuilder = function() {
	this.pointer = 0;
	this.buffer = null;
	return this;
};

JkLangBufferBuilder.prototype.allocate = function(sz) {
	if(this.buffer == null) {
		this.buffer = new ArrayBuffer(8192);
		return;
	}
	var needed = this.pointer + sz;
	var csz = JkLangBuffer.getSize(this.buffer);
	if(csz >= needed) {
		return;
	}
	var nsz = csz;
	while(nsz < needed){
		nsz += 1024;
	}
	this.buffer = JkLangBuffer.resize(this.buffer, nsz);
};

JkLangBufferBuilder.prototype.getSize = function() {
	return ~(~this.pointer);
};

JkLangBufferBuilder.prototype.appendInteger = function(value) {
	this.allocate((this.pointer + 1));
	JkLangBuffer.setByte(this.buffer, this.pointer, (~(~value)));
	this.pointer++;
};

JkLangBufferBuilder.prototype.appendBuffer = function(sbuffer) {
	this.appendSubBuffer(sbuffer, 0, (JkLangBuffer.getSize(sbuffer)));
};

JkLangBufferBuilder.prototype.appendSubBuffer = function(sbuffer, offset, size) {
	if(!(sbuffer != null)) {
		return;
	}
	if(!(offset >= 0)) {
		return;
	}
	if(!(size >= 0)) {
		return;
	}
	this.allocate((this.pointer + size));
	JkLangBuffer.copyFrom(this.buffer, sbuffer, offset, this.pointer, size);
	this.pointer += size;
};

JkLangBufferBuilder.prototype.toBuffer = function() {
	return JkLangBuffer.getSubBuffer(this.buffer, 0, this.pointer, false);
};

JkLangBufferBuilder.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangBufferBuilder"] === true;
};

let JkLangSerializer = function() {};

JkLangSerializer.prototype._t = { "JkLangSerializer" : true };
JkLangSerializer.prototype._tobj = JkLangSerializer;

JkLangSerializer.NEW = function() {
	var v = new JkLangSerializer;
	return v.CTOR_JkLangSerializer();
};

JkLangSerializer.prototype.CTOR_JkLangSerializer = function() {
	return this;
};

JkLangSerializer.toBuffer = function(value) {
	if(!(value != null)) {
		return null;
	}
	console.log("[jk.lang.Serializer.toBuffer] (Serializer.sling:34:3): Not implemented.");
	return null;
};

JkLangSerializer.fromBuffer = function(buffer) {
	if(!(buffer != null)) {
		return null;
	}
	console.log("[jk.lang.Serializer.fromBuffer] (Serializer.sling:54:3): Not implemented.");
	return null;
};

JkLangSerializer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangSerializer"] === true;
};

let JkLangVectorObject = {};

JkLangVectorObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangVectorObject"] === true;
};

let JkLangMapObject = {};

JkLangMapObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangMapObject"] === true;
};

let JkLangMap = function() {};

JkLangMap.prototype._t = { "JkLangMap" : true };
JkLangMap.prototype._tobj = JkLangMap;

JkLangMap.NEW = function() {
	var v = new JkLangMap;
	return v.CTOR_JkLangMap();
};

JkLangMap.prototype.CTOR_JkLangMap = function() {
	return this;
};

JkLangMap.asObject = function(map) {
	if(!(map != null)) {
		return null;
	}
	var v = JkLangMapMyMapObject.NEW();
	v.setMap(map);
	return v;
};

JkLangMap.asMap = function(o) {
	if(!(o != null)) {
		return null;
	}
	var v = new Map;
	for(var k in o) {
		if(o.hasOwnProperty(k)) {
			v.set(k, o[k]);
		}
	}
	;
	return v;
};

JkLangMap.getWithDefault = function(map, key, ddf) {
	if(map == null || key == null) {
		return ddf;
	}
	if(JkLangMap.containsKey(map, key) == false) {
		return ddf;
	}
	return JkLangMap.getValue(map, key);
};

JkLangMap.get = function(map, key) {
	return JkLangMap.getValue(map, key);
};

JkLangMap.getValue = function(map, key) {
	if(map == null || key == null) {
		return null;
	}
	return map.get(key);
};

JkLangMap.set = function(data, key, val) {
	if(!(data != null)) {
		return false;
	}
	if(!(key != null)) {
		return false;
	}
	data.set(key, val);
	;
	return true;
};

JkLangMap.setValue = function(data, key, val) {
	return JkLangMap.set(data, key, val);
};

JkLangMap.remove = function(data, key) {
	if(!(data != null)) {
		return;
	}
	if(!(key != null)) {
		return;
	}
	data.delete(key);
	;
};

JkLangMap.count = function(data) {
	if(data == null) {
		return 0;
	}
	return data.size;
};

JkLangMap.containsKey = function(data, key) {
	if(!(data != null)) {
		return false;
	}
	if(!(key != null)) {
		return false;
	}
	return data.has(key);
};

JkLangMap.containsValue = function(data, val) {
	if(!(data != null)) {
		return false;
	}
	if(!(val != null)) {
		return false;
	}
	var vals = JkLangMap.getValues(data);
	return vals.includes(val);
};

JkLangMap.clear = function(data) {
	if(!(data != null)) {
		return;
	}
	data.clear();
	;
};

JkLangMap.dup = function(data) {
	if(!(data != null)) {
		return null;
	}
	return new Map(data);
};

JkLangMap.getKeys = function(data) {
	if(!(data != null)) {
		return null;
	}
	var v = new Array;
	data.forEach(function(value, key) {
		this.push(key)
	}, v);
	;
	return v;
};

JkLangMap.getValues = function(data) {
	if(!(data != null)) {
		return null;
	}
	var v = new Array;
	data.forEach(function(value, keys) {
		this.push(value)
	}, v);
	;
	return v;
};

JkLangMap.iterateKeys = function(data) {
	return JkLangVector.iterate((JkLangMap.getKeys(data)));
};

JkLangMap.iterateValues = function(data) {
	return JkLangVector.iterate((JkLangMap.getValues(data)));
};

JkLangMap.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangMap"] === true;
};

let JkLangCharacterIteratorForString = function() {
	this.characters = null;
	this.currentIndex = -1;
};

JkLangCharacterIteratorForString.prototype._t = {
	"JkLangCharacterIterator" : true,
	"JkLangCharacterIteratorForString" : true,
	"JkLangDuplicateable" : true
};
JkLangCharacterIteratorForString.prototype._tobj = JkLangCharacterIteratorForString;

JkLangCharacterIteratorForString.NEW = function() {
	var v = new JkLangCharacterIteratorForString;
	return v.CTOR_JkLangCharacterIteratorForString();
};

JkLangCharacterIteratorForString.prototype.CTOR_JkLangCharacterIteratorForString = function() {
	this.currentIndex = -1;
	this.characters = null;
	return this;
};

JkLangCharacterIteratorForString.forString = function(value) {
	var v = JkLangCharacterIteratorForString.NEW();
	v.setString(value);
	return v;
};

JkLangCharacterIteratorForString.prototype.duplicate = function() {
	var v = JkLangCharacterIteratorForString.NEW();
	v.characters = this.characters;
	v.currentIndex = this.currentIndex;
	return v;
};

JkLangCharacterIteratorForString.prototype.getCurrentChar = function() {
	if(this.currentIndex < 0 || this.currentIndex >= this.characters.length) {
		return 0;
	}
	return this.characters[this.currentIndex];
};

JkLangCharacterIteratorForString.prototype.getNextChar = function() {
	this.moveToNextChar();
	return this.getCurrentChar();
};

JkLangCharacterIteratorForString.prototype.moveToNextChar = function() {
	var sc = this.characters.length;
	if(this.currentIndex + 1 <= sc) {
		this.currentIndex++;
	}
	if(this.currentIndex >= sc) {
		return false;
	}
	return true;
};

JkLangCharacterIteratorForString.prototype.moveToPreviousChar = function() {
	if(this.currentIndex < 1) {
		return false;
	}
	this.currentIndex--;
	return true;
};

JkLangCharacterIteratorForString.prototype.hasEnded = function() {
	if(this.currentIndex >= this.characters.length) {
		return true;
	}
	return false;
};

JkLangCharacterIteratorForString.prototype.getCurrentPosition = function() {
	return this.currentIndex;
};

JkLangCharacterIteratorForString.prototype.setCurrentPosition = function(position) {
	this.currentIndex = position;
};

JkLangCharacterIteratorForString.prototype.setString = function(value) {
	this.characters = JkLangString.toCharArray(value);
	this.currentIndex = -1;
};

JkLangCharacterIteratorForString.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangCharacterIteratorForString"] === true;
};

let JkLangKeyValueListForStrings = function() {
	JkLangKeyValueList.call(this);
};

JkLangKeyValueListForStrings.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkLangKeyValueList.prototype);
JkLangKeyValueListForStrings.prototype.constructor = JkLangKeyValueListForStrings;
JkLangKeyValueListForStrings.prototype._t = {
	"JkLangKeyValueListForStrings" : true,
	"JkLangKeyValueList" : true
};
JkLangKeyValueListForStrings.prototype._tobj = JkLangKeyValueListForStrings;

JkLangKeyValueListForStrings.NEW = function() {
	var v = new JkLangKeyValueListForStrings;
	return v.CTOR_JkLangKeyValueListForStrings();
};

JkLangKeyValueListForStrings.prototype.CTOR_JkLangKeyValueListForStrings = function() {
	if(JkLangKeyValueList.prototype.CTOR_JkLangKeyValueList.call(this) == null) {
		return null;
	}
	return this;
};

JkLangKeyValueListForStrings.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangKeyValueListForStrings"] === true;
};

let JkLangObjectWrapper = function() {
	this.value = null;
};

JkLangObjectWrapper.prototype._t = { "JkLangObjectWrapper" : true };
JkLangObjectWrapper.prototype._tobj = JkLangObjectWrapper;

JkLangObjectWrapper.NEW = function() {
	var v = new JkLangObjectWrapper;
	return v.CTOR_JkLangObjectWrapper();
};

JkLangObjectWrapper.prototype.CTOR_JkLangObjectWrapper = function() {
	this.value = null;
	return this;
};

JkLangObjectWrapper.prototype.getValue = function() {
	return this.value;
};

JkLangObjectWrapper.prototype.setValue = function(v) {
	this.value = v;
	return this;
};

JkLangObjectWrapper.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangObjectWrapper"] === true;
};

let JkLangDateTime = function() {
	this.timezoneOffset = 0;
	this.weekDay = 0;
	this.dayOfMonth = 0;
	this.month = 0;
	this.year = 0;
	this.hours = 0;
	this.minutes = 0;
	this.seconds = 0;
};

JkLangDateTime.prototype._t = {
	"JkLangDateTime" : true,
	"JkLangStringObject" : true
};
JkLangDateTime.prototype._tobj = JkLangDateTime;

JkLangDateTime.NEW = function() {
	var v = new JkLangDateTime;
	return v.CTOR_JkLangDateTime();
};

JkLangDateTime.prototype.CTOR_JkLangDateTime = function() {
	this.seconds = 0;
	this.minutes = 0;
	this.hours = 0;
	this.year = 0;
	this.month = 0;
	this.dayOfMonth = 0;
	this.weekDay = 0;
	this.timezoneOffset = 0;
	return this;
};

JkLangDateTime.forSeconds = function(seconds) {
	var v = JkLangDateTime.NEW();
	v.updateFromTimestamp(seconds);
	return v;
};

JkLangDateTime.forTimeValue = function(tv) {
	if(!(tv != null)) {
		return null;
	}
	var v = JkLangDateTime.NEW();
	v.updateFromTimestamp((tv.getSeconds()));
	return v;
};

JkLangDateTime.forString = function(value) {
	if(!(value != null)) {
		return null;
	}
	var comps = JkLangString.split(value, ' '.charCodeAt(), 2);
	if(!(comps != null)) {
		return null;
	}
	var c0 = JkLangVector.get(comps, 0);
	var c1 = JkLangVector.get(comps, 1);
	if(!JkLangString.isNotEmpty(c0)) {
		return null;
	}
	var comps2 = JkLangString.split(c0, '-'.charCodeAt(), 3);
	if(!(comps2 != null)) {
		return null;
	}
	if(!(JkLangVector.getSize(comps2) == 3)) {
		return null;
	}
	var v = JkLangDateTime.NEW();
	v.setYear((JkLangString.toInteger((JkLangVector.get(comps2, 0)))));
	v.setMonth((JkLangString.toInteger((JkLangVector.get(comps2, 1)))));
	v.setDayOfMonth((JkLangString.toInteger((JkLangVector.get(comps2, 2)))));
	if(JkLangString.isNotEmpty(c1)) {
		var tcs = JkLangString.split(c1, ':'.charCodeAt(), 3);
		if(JkLangVector.getSize(tcs) == 3) {
			v.setHours((JkLangString.toInteger((JkLangVector.get(tcs, 0)))));
			v.setMinutes((JkLangString.toInteger((JkLangVector.get(tcs, 1)))));
			v.setSeconds((JkLangString.toInteger((JkLangVector.get(tcs, 2)))));
		}
	}
	return v;
};

JkLangDateTime.prototype.updateFromTimestamp = function(seconds) {
	var date = new Date(seconds * 1000);
	this.year = date.getFullYear();
	this.month = date.getMonth() + 1;
	this.dayOfMonth = date.getDate();
	this.weekDay = date.getDay() + 1;
	this.hours = date.getHours();
	this.minutes = date.getMinutes();
	this.seconds = date.getSeconds();
	;
};

JkLangDateTime.prototype.toStringDate = function(delim) {
	var sb = JkLangStringBuilder.NEW();
	sb.appendString((JkLangString.forIntegerWithPadding((this.getYear()), 4, null)));
	if(delim > 0) {
		sb.appendCharacter(delim);
	}
	sb.appendString((JkLangString.forIntegerWithPadding((this.getMonth()), 2, null)));
	if(delim > 0) {
		sb.appendCharacter(delim);
	}
	sb.appendString((JkLangString.forIntegerWithPadding((this.getDayOfMonth()), 2, null)));
	return sb.toString();
};

JkLangDateTime.prototype.toStringTime = function(delim) {
	var sb = JkLangStringBuilder.NEW();
	sb.appendString((JkLangString.forIntegerWithPadding((this.getHours()), 2, null)));
	if(delim > 0) {
		sb.appendCharacter(delim);
	}
	sb.appendString((JkLangString.forIntegerWithPadding((this.getMinutes()), 2, null)));
	if(delim > 0) {
		sb.appendCharacter(delim);
	}
	sb.appendString((JkLangString.forIntegerWithPadding((this.getSeconds()), 2, null)));
	return sb.toString();
};

JkLangDateTime.prototype.toStringDateTime = function() {
	var sb = JkLangStringBuilder.NEW();
	sb.appendString((this.toStringDate('-'.charCodeAt())));
	sb.appendString(" ");
	sb.appendString((this.toStringTime(':'.charCodeAt())));
	return sb.toString();
};

JkLangDateTime.prototype.toString = function() {
	return this.toStringDateTime();
};

JkLangDateTime.prototype.getTimezoneOffset = function() {
	return this.timezoneOffset;
};

JkLangDateTime.prototype.setTimezoneOffset = function(v) {
	this.timezoneOffset = v;
	return this;
};

JkLangDateTime.prototype.getWeekDay = function() {
	return this.weekDay;
};

JkLangDateTime.prototype.setWeekDay = function(v) {
	this.weekDay = v;
	return this;
};

JkLangDateTime.prototype.getDayOfMonth = function() {
	return this.dayOfMonth;
};

JkLangDateTime.prototype.setDayOfMonth = function(v) {
	this.dayOfMonth = v;
	return this;
};

JkLangDateTime.prototype.getMonth = function() {
	return this.month;
};

JkLangDateTime.prototype.setMonth = function(v) {
	this.month = v;
	return this;
};

JkLangDateTime.prototype.getYear = function() {
	return this.year;
};

JkLangDateTime.prototype.setYear = function(v) {
	this.year = v;
	return this;
};

JkLangDateTime.prototype.getHours = function() {
	return this.hours;
};

JkLangDateTime.prototype.setHours = function(v) {
	this.hours = v;
	return this;
};

JkLangDateTime.prototype.getMinutes = function() {
	return this.minutes;
};

JkLangDateTime.prototype.setMinutes = function(v) {
	this.minutes = v;
	return this;
};

JkLangDateTime.prototype.getSeconds = function() {
	return this.seconds;
};

JkLangDateTime.prototype.setSeconds = function(v) {
	this.seconds = v;
	return this;
};

JkLangDateTime.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangDateTime"] === true;
};

let JkLangDynamicVector = function() {
	this.vector = null;
};

JkLangDynamicVector.prototype._t = {
	"JkLangDuplicateable" : true,
	"JkLangDynamicVector" : true,
	"JkLangObjectWithSize" : true,
	"JkLangIterateable" : true,
	"JkLangVectorObject" : true
};
JkLangDynamicVector.prototype._tobj = JkLangDynamicVector;

JkLangDynamicVector.NEW = function() {
	var v = new JkLangDynamicVector;
	return v.CTOR_JkLangDynamicVector();
};

JkLangDynamicVector.prototype.CTOR_JkLangDynamicVector = function() {
	this.vector = null;
	this.vector = new Array;
	return this;
};

JkLangDynamicVector.asDynamicVector = function(value) {
	if(!(value != null)) {
		return null;
	}
	if(JkLangDynamicVector.IS_INSTANCE && JkLangDynamicVector.IS_INSTANCE(value)) {
		return value;
	}
	if(value instanceof Array) {
		return JkLangDynamicVector.forArray(value);
	}
	if(value instanceof Array) {
		return JkLangDynamicVector.forObjectVector(value);
	}
	return null;
};

JkLangDynamicVector.forStringVector = function(vector) {
	var v = JkLangDynamicVector.NEW();
	if(vector != null) {
		var n = 0;
		var m = vector.length;
		for(n = 0 ; n < m ; n++) {
			var item = vector[n];
			if(item != null) {
				v.appendObject(item);
			}
		}
	}
	return v;
};

JkLangDynamicVector.forObjectVector = function(vector) {
	var v = JkLangDynamicVector.NEW();
	if(vector != null) {
		var n = 0;
		var m = vector.length;
		for(n = 0 ; n < m ; n++) {
			var item = vector[n];
			if(item != null) {
				v.appendObject(item);
			}
		}
	}
	return v;
};

JkLangDynamicVector.forArray = function(array) {
	var v = JkLangDynamicVector.NEW();
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var item = array[n];
			if(item != null) {
				v.appendObject(item);
			}
		}
	}
	return v;
};

JkLangDynamicVector.prototype.toVector = function() {
	return this.vector;
};

JkLangDynamicVector.prototype.toVectorOfStrings = function() {
	var v = new Array;
	if(this.vector != null) {
		var n = 0;
		var m = this.vector.length;
		for(n = 0 ; n < m ; n++) {
			var o = this.vector[n];
			if(o != null) {
				var s = JkLangString.asString(o);
				if(s != null) {
					v.push(s);
				}
			}
		}
	}
	return v;
};

JkLangDynamicVector.prototype.toVectorOfDynamicMaps = function() {
	var v = new Array;
	if(this.vector != null) {
		var n = 0;
		var m = this.vector.length;
		for(n = 0 ; n < m ; n++) {
			var o = (function(o1) {
				if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o1)) {
					return o1;
				}
				return null;
			}.bind(this))(this.vector[n]);
			if(o != null) {
				v.push(o);
			}
		}
	}
	return v;
};

JkLangDynamicVector.prototype.duplicate = function() {
	var v = JkLangDynamicVector.NEW();
	var it = this.iterate();
	while(it != null){
		var o = it.next();
		if(o == null) {
			break;
		}
		v.appendObject(o);
	}
	return v;
};

JkLangDynamicVector.prototype.mergeDynamicVector = function(dynamicVector) {
	if(!(dynamicVector != null) || dynamicVector.getSize() < 1) {
		return this;
	}
	return this.mergeVector((dynamicVector.toVector()));
};

JkLangDynamicVector.prototype.mergeVector = function(vector) {
	if(vector != null) {
		var n = 0;
		var m = vector.length;
		for(n = 0 ; n < m ; n++) {
			var item = vector[n];
			if(item != null) {
				this.appendObject(item);
			}
		}
	}
	return this;
};

JkLangDynamicVector.prototype.appendObject = function(value) {
	this.vector.push(value);
	return this;
};

JkLangDynamicVector.prototype.appendString = function(value) {
	this.vector.push(value);
	return this;
};

JkLangDynamicVector.prototype.appendInteger = function(value) {
	this.vector.push(JkLangInteger.asObject(value));
	return this;
};

JkLangDynamicVector.prototype.appendLong = function(value) {
	this.vector.push(JkLangLongInteger.asObject(value));
	return this;
};

JkLangDynamicVector.prototype.appendBoolean = function(value) {
	this.vector.push(JkLangBoolean.asObject(value));
	return this;
};

JkLangDynamicVector.prototype.appendDouble = function(value) {
	this.vector.push(JkLangDouble.asObject(value));
	return this;
};

JkLangDynamicVector.prototype.setObject = function(index, value) {
	JkLangVector.set(this.vector, index, value);
	return this;
};

JkLangDynamicVector.prototype.setInteger = function(index, value) {
	JkLangVector.set(this.vector, index, (JkLangInteger.asObject(value)));
	return this;
};

JkLangDynamicVector.prototype.setLong = function(index, value) {
	JkLangVector.set(this.vector, index, (JkLangLongInteger.asObject(value)));
	return this;
};

JkLangDynamicVector.prototype.setBoolean = function(index, value) {
	JkLangVector.set(this.vector, index, (JkLangBoolean.asObject(value)));
	return this;
};

JkLangDynamicVector.prototype.setDouble = function(index, value) {
	JkLangVector.set(this.vector, index, (JkLangDouble.asObject(value)));
	return this;
};

JkLangDynamicVector.prototype.get = function(index) {
	return JkLangVector.getAt(this.vector, index);
};

JkLangDynamicVector.prototype.getString = function(index, defval) {
	var v = JkLangString.asString((this.get(index)));
	if(v == null) {
		return defval;
	}
	return v;
};

JkLangDynamicVector.prototype.getInteger = function(index, defval) {
	var vv = this.get(index);
	if(vv == null) {
		return defval;
	}
	return JkLangInteger.asInteger(vv);
};

JkLangDynamicVector.prototype.getLongInteger = function(index, defval) {
	var vv = this.get(index);
	if(vv == null) {
		return defval;
	}
	return JkLangLongInteger.asLong(vv);
};

JkLangDynamicVector.prototype.getBoolean = function(index, defval) {
	var vv = this.get(index);
	if(vv == null) {
		return defval;
	}
	return JkLangBoolean.asBoolean(vv, false);
};

JkLangDynamicVector.prototype.getDouble = function(index, defval) {
	var vv = this.get(index);
	if(vv == null) {
		return defval;
	}
	return JkLangDouble.asDouble(vv);
};

JkLangDynamicVector.prototype.getMap = function(index) {
	return (function(o) {
		if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((this.get(index)));
};

JkLangDynamicVector.prototype.getVector = function(index) {
	return (function(o) {
		if(JkLangDynamicVector.IS_INSTANCE && JkLangDynamicVector.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((this.get(index)));
};

JkLangDynamicVector.prototype.iterate = function() {
	var v = JkLangVector.iterate(this.vector);
	return v;
};

JkLangDynamicVector.prototype.iterateReverse = function() {
	var v = JkLangVector.iterateReverse(this.vector);
	return v;
};

JkLangDynamicVector.prototype.remove = function(index) {
	JkLangVector.remove(this.vector, index);
};

JkLangDynamicVector.prototype.removeValue = function(value) {
	JkLangVector.removeValue(this.vector, value);
};

JkLangDynamicVector.prototype.clear = function() {
	JkLangVector.clear(this.vector);
};

JkLangDynamicVector.prototype.contains = function(value) {
	return JkLangVector.contains(this.vector, value);
};

JkLangDynamicVector.prototype.getSize = function() {
	return JkLangVector.getSize(this.vector);
};

JkLangDynamicVector.prototype.setCapacity = function(capacity) {
	JkLangVector.setCapacity(this.vector, capacity);
};

JkLangDynamicVector.prototype.sort = function() {
	JkLangVector.sort(this.vector, (function(a1, b1) {
		return JkLangString.compare((JkLangString.asString(a1)), (JkLangString.asString(b1)));
	}.bind(this)));
};

JkLangDynamicVector.prototype.sortWithComparer = function(comparer) {
	if(comparer == null) {
		this.sort();
		return;
	}
	JkLangVector.sort(this.vector, comparer);
};

JkLangDynamicVector.prototype.sortReverse = function() {
	JkLangVector.sortReverse(this.vector, (function(a1, b1) {
		return JkLangString.compare((JkLangString.asString(a1)), (JkLangString.asString(b1)));
	}.bind(this)));
};

JkLangDynamicVector.prototype.sortReverseWithComparer = function(comparer) {
	if(comparer == null) {
		this.sortReverse();
		return;
	}
	JkLangVector.sortReverse(this.vector, comparer);
};

JkLangDynamicVector.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangDynamicVector"] === true;
};

let JkLangError = function() {
	this.code = null;
	this.detail = null;
};

JkLangError.prototype._t = {
	"JkLangStringObjectWithDebug" : true,
	"JkLangError" : true,
	"JkLangStringObject" : true
};
JkLangError.prototype._tobj = JkLangError;

JkLangError.NEW = function() {
	var v = new JkLangError;
	return v.CTOR_JkLangError();
};

JkLangError.prototype.CTOR_JkLangError = function() {
	this.detail = null;
	this.code = null;
	return this;
};

JkLangError._throw = function(code, detail) {
	throw JkLangExceptionWithError.forError((JkLangError.forCode(code, detail)));
};

JkLangError.forCode = function(code, detail) {
	return JkLangError.NEW().setCode(code).setDetail(detail);
};

JkLangError.asString = function(error) {
	if(!(error != null)) {
		return "error";
	}
	return error.toString();
};

JkLangError.set = function(error, code, detail) {
	if(!(error != null)) {
		return null;
	}
	error.setCode(code);
	error.setDetail(detail);
	return error;
};

JkLangError.setErrorCode = function(error, code) {
	return JkLangError.set(error, code, null);
};

JkLangError.setErrorDetail = function(error, detail) {
	return JkLangError.set(error, null, detail);
};

JkLangError.isError = function(o) {
	if(!(o != null)) {
		return false;
	}
	if(!(JkLangError.IS_INSTANCE && JkLangError.IS_INSTANCE(o))) {
		return false;
	}
	var e = o;
	if(JkLangString.isEmpty((e.getCode()))) {
		return false;
	}
	return true;
};

JkLangError.prototype.clear = function() {
	this.code = null;
	this.detail = null;
	return this;
};

JkLangError.prototype.toStringWithDefault = function(debug, defaultError) {
	var details = null;
	if(JkLangStringObjectWithDebug.IS_INSTANCE && JkLangStringObjectWithDebug.IS_INSTANCE(this.detail)) {
		details = this.detail.toStringWithDebug(debug);
	}
	else {
		details = JkLangString.asString(this.detail);
	}
	if(JkLangString.isEmpty(this.code) == false) {
		if(JkLangString.isEmpty(details) == false) {
			return (JkLangString.safeString(this.code)) + (":") + (JkLangString.safeString(details));
		}
		return this.code;
	}
	if(JkLangString.isEmpty(details) == false) {
		return "errorWithDetail:" + (JkLangString.safeString(details));
	}
	return defaultError;
};

JkLangError.prototype.toStringWithDebug = function(debug) {
	return this.toStringWithDefault(debug, "unknownError");
};

JkLangError.prototype.toString = function() {
	return this.toStringWithDebug(false);
};

JkLangError.prototype.getCode = function() {
	return this.code;
};

JkLangError.prototype.setCode = function(v) {
	this.code = v;
	return this;
};

JkLangError.prototype.getDetail = function() {
	return this.detail;
};

JkLangError.prototype.setDetail = function(v) {
	this.detail = v;
	return this;
};

JkLangError.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangError"] === true;
};

let JkLangRangeRangeIterator = function() {
	this.lowerBound = 0;
	this.upperBound = 0;
	this.increment = 0;
	this.current = null;
};

JkLangRangeRangeIterator.prototype._t = {
	"JkLangIterator" : true,
	"JkLangRangeRangeIterator" : true
};
JkLangRangeRangeIterator.prototype._tobj = JkLangRangeRangeIterator;

JkLangRangeRangeIterator.NEW_IntegerInteger = function(lowerBound, upperBound) {
	var v = new JkLangRangeRangeIterator;
	return v.CTOR_JkLangRangeRangeIterator_IntegerInteger(lowerBound, upperBound);
};

JkLangRangeRangeIterator.prototype.CTOR_JkLangRangeRangeIterator_IntegerInteger = function(lowerBound, upperBound) {
	this.current = null;
	this.increment = 0;
	this.upperBound = 0;
	this.lowerBound = 0;
	this.lowerBound = lowerBound;
	this.upperBound = upperBound;
	if(lowerBound <= upperBound) {
		this.increment = 1;
	}
	else {
		this.increment = -1;
	}
	return this;
};

JkLangRangeRangeIterator.prototype.next = function() {
	if(!(this.current != null)) {
		this.current = JkLangInteger.forValue(this.lowerBound);
	}
	else {
		this.current.add(this.increment);
	}
	return this.current.getValue();
};

JkLangRangeRangeIterator.prototype.hasNext = function() {
	if(!(this.current != null)) {
		return true;
	}
	if(this.increment > 0) {
		return this.current.getValue() < this.upperBound;
	}
	return this.current.getValue() > this.upperBound;
};

JkLangRangeRangeIterator.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangRangeRangeIterator"] === true;
};

let JkLangRange = function() {
	this.lowerBound = 0.0;
	this.upperBound = 0.0;
	this.exclusionType = 0;
};

JkLangRange.prototype._t = {
	"JkLangIterateable" : true,
	"JkLangRange" : true
};
JkLangRange.prototype._tobj = JkLangRange;

JkLangRange.NEW = function() {
	var v = new JkLangRange;
	return v.CTOR_JkLangRange();
};

JkLangRange.prototype.CTOR_JkLangRange = function() {
	this.exclusionType = 0;
	this.upperBound = 0.0;
	this.lowerBound = 0.0;
	;
	return this;
};

JkLangRange.forIntegerValues = function(lowerBound, upperBound, exclusionType) {
	var v = JkLangRange.NEW();
	v.setLowerBound(lowerBound);
	v.setUpperBound(upperBound);
	v.setExclusionType(exclusionType);
	return v;
};

JkLangRange.forDoubleValues = function(lowerBound, upperBound, exclusionType) {
	var v = JkLangRange.NEW();
	v.setLowerBound(lowerBound);
	v.setUpperBound(upperBound);
	v.setExclusionType(exclusionType);
	return v;
};

JkLangRange.forValues = function(lowerBound, upperBound, exclusionType) {
	if(typeof(lowerBound) === 'number' && typeof(upperBound) === 'number') {
		return JkLangRange.forDoubleValues(lowerBound, upperBound, exclusionType);
	}
	if(typeof(lowerBound) === 'number' && typeof(upperBound) === 'number') {
		return JkLangRange.forIntegerValues((~(~lowerBound)), (~(~upperBound)), exclusionType);
	}
	return null;
};

JkLangRange.prototype.setLowerBound = function(lowerBound) {
	this.lowerBound = lowerBound;
};

JkLangRange.prototype.setUpperBound = function(upperBound) {
	this.upperBound = upperBound;
};

JkLangRange.prototype.setExclusionType = function(exclusionType) {
	this.exclusionType = exclusionType;
};

JkLangRange.prototype.getLowerBoundAsInteger = function() {
	return ~(~this.lowerBound);
};

JkLangRange.prototype.getLowerBoundAsDouble = function() {
	return this.lowerBound;
};

JkLangRange.prototype.getUpperBoundAsInteger = function() {
	return ~(~this.upperBound);
};

JkLangRange.prototype.getUpperBoundAsDouble = function() {
	return this.upperBound;
};

JkLangRange.prototype.containsIntegerValue = function(value) {
	return this.containsDoubleValue(value);
};

JkLangRange.prototype.containsDoubleValue = function(value) {
	if(this.exclusionType == JkLangRange.TYPE_NONE) {
		return value >= this.lowerBound && value <= this.upperBound;
	}
	else if(this.exclusionType == JkLangRange.TYPE_EXCLUDE_UPPER_BOUND) {
		return value >= this.lowerBound && value < this.upperBound;
	}
	else if(this.exclusionType == JkLangRange.TYPE_EXCLUDE_LOWER_BOUND) {
		return value > this.lowerBound && value <= this.upperBound;
	}
	else if(this.exclusionType == JkLangRange.TYPE_EXCLUDE_BOTH_BOUNDS) {
		return value > this.lowerBound && value < this.upperBound;
	}
	return false;
};

JkLangRange.prototype.iterate = function() {
	var lv = ~(~this.lowerBound);
	var uv = ~(~this.upperBound);
	if(this.exclusionType == JkLangRange.TYPE_NONE) {
		;
	}
	if(this.exclusionType == JkLangRange.TYPE_EXCLUDE_UPPER_BOUND) {
		uv = uv - 1;
	}
	else if(this.exclusionType == JkLangRange.TYPE_EXCLUDE_LOWER_BOUND) {
		lv = lv + 1;
	}
	else if(this.exclusionType == JkLangRange.TYPE_EXCLUDE_BOTH_BOUNDS) {
		uv = uv - 1;
		lv = lv + 1;
	}
	return JkLangRangeRangeIterator.NEW_IntegerInteger(lv, uv);
};

JkLangRange.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangRange"] === true;
};

JkLangRange.TYPE_NONE = 0;
JkLangRange.TYPE_EXCLUDE_UPPER_BOUND = 1;
JkLangRange.TYPE_EXCLUDE_LOWER_BOUND = 2;
JkLangRange.TYPE_EXCLUDE_BOTH_BOUNDS = 3;

let JkLangStackTrace = function() {};

JkLangStackTrace.prototype._t = { "JkLangStackTrace" : true };
JkLangStackTrace.prototype._tobj = JkLangStackTrace;

JkLangStackTrace.NEW = function() {
	var v = new JkLangStackTrace;
	return v.CTOR_JkLangStackTrace();
};

JkLangStackTrace.prototype.CTOR_JkLangStackTrace = function() {
	return this;
};

JkLangStackTrace.generate = function() {
	console.log("[jk.lang.StackTrace.generate] (StackTrace.sling:60:3): Not implemented");
	return null;
};

JkLangStackTrace.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangStackTrace"] === true;
};

let JkLangVariableReference = function() {
	this.setter = null;
	this.getter = null;
};

JkLangVariableReference.prototype._t = { "JkLangVariableReference" : true };
JkLangVariableReference.prototype._tobj = JkLangVariableReference;

JkLangVariableReference.NEW_FunctionFunction = function(setter, getter) {
	var v = new JkLangVariableReference;
	return v.CTOR_JkLangVariableReference_FunctionFunction(setter, getter);
};

JkLangVariableReference.prototype.CTOR_JkLangVariableReference_FunctionFunction = function(setter, getter) {
	this.getter = null;
	this.setter = null;
	this.setter = setter;
	this.getter = getter;
	return this;
};

JkLangVariableReference.prototype.set = function(value) {
	this.setter(value);
	return this;
};

JkLangVariableReference.prototype.get = function() {
	return this.getter();
};

JkLangVariableReference.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangVariableReference"] === true;
};

let JkLangQueue = function() {
	this.data = null;
};

JkLangQueue.prototype._t = { "JkLangQueue" : true };
JkLangQueue.prototype._tobj = JkLangQueue;

JkLangQueue.NEW = function() {
	var v = new JkLangQueue;
	return v.CTOR_JkLangQueue();
};

JkLangQueue.prototype.CTOR_JkLangQueue = function() {
	this.data = null;
	this.data = new Array;
	return this;
};

JkLangQueue.prototype.clear = function() {
	this.data = new Array;
};

JkLangQueue.prototype.push = function(o) {
	JkLangVector.append(this.data, o);
};

JkLangQueue.prototype.pop = function() {
	var sz = JkLangVector.getSize(this.data);
	if(sz < 1) {
		return null;
	}
	var v = JkLangVector.getAt(this.data, 0);
	JkLangVector.remove(this.data, 0);
	return v;
};

JkLangQueue.prototype.peek = function() {
	var sz = JkLangVector.getSize(this.data);
	if(sz < 1) {
		return null;
	}
	return JkLangVector.getAt(this.data, 0);
};

JkLangQueue.prototype.isEmpty = function() {
	return this.getSize() < 1;
};

JkLangQueue.prototype.getSize = function() {
	return JkLangVector.getSize(this.data);
};

JkLangQueue.prototype.getData = function() {
	return this.data;
};

JkLangQueue.prototype.setData = function(v) {
	this.data = v;
	return this;
};

JkLangQueue.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangQueue"] === true;
};

let JkLangEventLoop = {};

JkLangEventLoop.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangEventLoop"] === true;
};

let JkLangInteger = function() {
	this.value = 0;
};

JkLangInteger.prototype._t = {
	"JkLangIntegerObject" : true,
	"JkLangInteger" : true
};
JkLangInteger.prototype._tobj = JkLangInteger;

JkLangInteger.NEW = function() {
	var v = new JkLangInteger;
	return v.CTOR_JkLangInteger();
};

JkLangInteger.prototype.CTOR_JkLangInteger = function() {
	this.value = 0;
	return this;
};

JkLangInteger.forValue = function(value) {
	return JkLangInteger.asObject(value);
};

JkLangInteger.asObject = function(integer) {
	var v = JkLangInteger.NEW();
	v.setValue(integer);
	return v;
};

JkLangInteger.asInteger = function(obj) {
	if(!(obj != null)) {
		return 0;
	}
	if(typeof(obj) === 'number') {
		return ~(~obj);
	}
	if(JkLangIntegerObject.IS_INSTANCE && JkLangIntegerObject.IS_INSTANCE(obj)) {
		var oi = obj;
		return oi.toInteger();
	}
	if(typeof(obj) === 'number') {
		var v = ~(~obj);
		return ~(~v);
	}
	if(JkLangLongIntegerObject.IS_INSTANCE && JkLangLongIntegerObject.IS_INSTANCE(obj)) {
		var oi1 = obj;
		return ~(~oi1.toLong());
	}
	if(typeof(obj) === 'string') {
		return JkLangString.toInteger(obj);
	}
	if(JkLangStringObject.IS_INSTANCE && JkLangStringObject.IS_INSTANCE(obj)) {
		return JkLangString.toInteger((obj.toString()));
	}
	if(typeof(obj) === 'number') {
		var v1 = obj;
		return ~(~v1);
	}
	if(JkLangDoubleObject.IS_INSTANCE && JkLangDoubleObject.IS_INSTANCE(obj)) {
		var od = obj;
		return ~(~od.toDouble());
	}
	if(typeof(obj) === 'boolean') {
		if(obj == true) {
			return 1;
		}
		return 0;
	}
	if(JkLangBooleanObject.IS_INSTANCE && JkLangBooleanObject.IS_INSTANCE(obj)) {
		if(obj.toBoolean()) {
			return 1;
		}
		return 0;
	}
	if(typeof(obj) === 'string') {
		var v2 = obj;
		return ~(~v2);
	}
	if(JkLangCharacterObject.IS_INSTANCE && JkLangCharacterObject.IS_INSTANCE(obj)) {
		var oc = obj;
		return ~(~oc.toCharacter());
	}
	return 0;
};

JkLangInteger.prototype.add = function(amount) {
	this.value += amount;
};

JkLangInteger.prototype.toInteger = function() {
	return this.value;
};

JkLangInteger.prototype.getValue = function() {
	return this.value;
};

JkLangInteger.prototype.setValue = function(v) {
	this.value = v;
	return this;
};

JkLangInteger.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangInteger"] === true;
};

let JkLangMapMyMapObject = function() {
	this.map = null;
};

JkLangMapMyMapObject.prototype._t = {
	"JkLangMapObject" : true,
	"JkLangMapMyMapObject" : true
};
JkLangMapMyMapObject.prototype._tobj = JkLangMapMyMapObject;

JkLangMapMyMapObject.NEW = function() {
	var v = new JkLangMapMyMapObject;
	return v.CTOR_JkLangMapMyMapObject();
};

JkLangMapMyMapObject.prototype.CTOR_JkLangMapMyMapObject = function() {
	this.map = null;
	return this;
};

JkLangMapMyMapObject.prototype.toMap = function() {
	return this.map;
};

JkLangMapMyMapObject.prototype.getMap = function() {
	return this.map;
};

JkLangMapMyMapObject.prototype.setMap = function(v) {
	this.map = v;
	return this;
};

JkLangMapMyMapObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangMapMyMapObject"] === true;
};

let JkLangCharacterIteratorForBuffer = function() {
	JkLangCharacterDecoder.call(this);
	this.buffer = null;
	this.bufferSize = 0;
	this.currentPosition = -1;
};

JkLangCharacterIteratorForBuffer.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkLangCharacterDecoder.prototype);
JkLangCharacterIteratorForBuffer.prototype.constructor = JkLangCharacterIteratorForBuffer;
JkLangCharacterIteratorForBuffer.prototype._t = {
	"JkLangCharacterIterator" : true,
	"JkLangCharacterDecoder" : true,
	"JkLangDuplicateable" : true,
	"JkLangCharacterIteratorForBuffer" : true
};
JkLangCharacterIteratorForBuffer.prototype._tobj = JkLangCharacterIteratorForBuffer;

JkLangCharacterIteratorForBuffer.NEW = function() {
	var v = new JkLangCharacterIteratorForBuffer;
	return v.CTOR_JkLangCharacterIteratorForBuffer();
};

JkLangCharacterIteratorForBuffer.prototype.CTOR_JkLangCharacterIteratorForBuffer = function() {
	this.currentPosition = -1;
	this.bufferSize = 0;
	this.buffer = null;
	if(JkLangCharacterDecoder.prototype.CTOR_JkLangCharacterDecoder.call(this) == null) {
		return null;
	}
	return this;
};

JkLangCharacterIteratorForBuffer.forBuffer = function(buffer) {
	var v = JkLangCharacterIteratorForBuffer.NEW();
	v.setBuffer(buffer);
	return v;
};

JkLangCharacterIteratorForBuffer.prototype.setBuffer = function(buffer) {
	this.resetDecoder();
	this.buffer = buffer;
	this.bufferSize = JkLangBuffer.getSize(buffer);
	this.currentPosition = -1;
};

JkLangCharacterIteratorForBuffer.prototype.moveToPreviousByte = function() {
	if(this.currentPosition < 1) {
		return false;
	}
	this.currentPosition--;
	return true;
};

JkLangCharacterIteratorForBuffer.prototype.moveToNextByte = function() {
	var n = this.currentPosition + 1;
	if(n >= this.bufferSize) {
		return false;
	}
	this.currentPosition = n;
	return true;
};

JkLangCharacterIteratorForBuffer.prototype.getCurrentByte = function() {
	var v = ~(~(this.buffer[this.currentPosition] & 0xff));
	return v;
};

JkLangCharacterIteratorForBuffer.prototype.getCurrentPosition = function() {
	return this.currentPosition;
};

JkLangCharacterIteratorForBuffer.prototype.setCurrentPosition = function(position) {
	if(position < 0) {
		this.current = 0;
		this.currentPosition = -1;
	}
	else {
		this.currentPosition = position + 1;
		this.doMoveToPreviousChar();
	}
};

JkLangCharacterIteratorForBuffer.prototype.duplicate = function() {
	var v = JkLangCharacterIteratorForBuffer.NEW();
	JkLangCharacterDecoder.prototype.copyTo.call(this, v);
	v.buffer = this.buffer;
	v.bufferSize = this.bufferSize;
	v.currentPosition = this.currentPosition;
	return v;
};

JkLangCharacterIteratorForBuffer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangCharacterIteratorForBuffer"] === true;
};

let JkLangRunnableFunction = function() {
	this._function = null;
};

JkLangRunnableFunction.prototype._t = {
	"JkLangRunnable" : true,
	"JkLangRunnableFunction" : true
};
JkLangRunnableFunction.prototype._tobj = JkLangRunnableFunction;

JkLangRunnableFunction.NEW = function() {
	var v = new JkLangRunnableFunction;
	return v.CTOR_JkLangRunnableFunction();
};

JkLangRunnableFunction.prototype.CTOR_JkLangRunnableFunction = function() {
	this._function = null;
	return this;
};

JkLangRunnableFunction.forFunction = function(_function) {
	var v = JkLangRunnableFunction.NEW();
	v.setFunction(_function);
	return v;
};

JkLangRunnableFunction.prototype.run = function() {
	if(this._function != null) {
		this._function();
	}
};

JkLangRunnableFunction.prototype.getFunction = function() {
	return this._function;
};

JkLangRunnableFunction.prototype.setFunction = function(v) {
	this._function = v;
	return this;
};

JkLangRunnableFunction.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangRunnableFunction"] === true;
};

let JkLangDynamicObjectVectorIteratorWrapper = function() {
	this.vector = null;
	this.size = 0;
	this.position = 0;
};

JkLangDynamicObjectVectorIteratorWrapper.prototype._t = {
	"JkLangDynamicObjectVectorIteratorWrapper" : true,
	"JkLangIterator" : true
};
JkLangDynamicObjectVectorIteratorWrapper.prototype._tobj = JkLangDynamicObjectVectorIteratorWrapper;

JkLangDynamicObjectVectorIteratorWrapper.NEW = function() {
	var v = new JkLangDynamicObjectVectorIteratorWrapper;
	return v.CTOR_JkLangDynamicObjectVectorIteratorWrapper();
};

JkLangDynamicObjectVectorIteratorWrapper.prototype.CTOR_JkLangDynamicObjectVectorIteratorWrapper = function() {
	this.position = 0;
	this.size = 0;
	this.vector = null;
	return this;
};

JkLangDynamicObjectVectorIteratorWrapper.prototype.next = function() {
	if(!(this.vector != null)) {
		return null;
	}
	if(this.position >= this.size) {
		return null;
	}
	var v = this.vector[this.position];
	this.position++;
	return v;
};

JkLangDynamicObjectVectorIteratorWrapper.prototype.hasNext = function() {
	if(!(this.vector != null)) {
		return false;
	}
	if(!(this.position < this.size - 1)) {
		return false;
	}
	return true;
};

JkLangDynamicObjectVectorIteratorWrapper.prototype.getVector = function() {
	return this.vector;
};

JkLangDynamicObjectVectorIteratorWrapper.prototype.setVector = function(v) {
	this.vector = v;
	return this;
};

JkLangDynamicObjectVectorIteratorWrapper.prototype.getSize = function() {
	return this.size;
};

JkLangDynamicObjectVectorIteratorWrapper.prototype.setSize = function(v) {
	this.size = v;
	return this;
};

JkLangDynamicObjectVectorIteratorWrapper.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangDynamicObjectVectorIteratorWrapper"] === true;
};

let JkLangDynamicObjectArrayIteratorWrapper = function() {
	this.array = null;
	this.size = 0;
	this.position = 0;
};

JkLangDynamicObjectArrayIteratorWrapper.prototype._t = {
	"JkLangDynamicObjectArrayIteratorWrapper" : true,
	"JkLangIterator" : true
};
JkLangDynamicObjectArrayIteratorWrapper.prototype._tobj = JkLangDynamicObjectArrayIteratorWrapper;

JkLangDynamicObjectArrayIteratorWrapper.NEW = function() {
	var v = new JkLangDynamicObjectArrayIteratorWrapper;
	return v.CTOR_JkLangDynamicObjectArrayIteratorWrapper();
};

JkLangDynamicObjectArrayIteratorWrapper.prototype.CTOR_JkLangDynamicObjectArrayIteratorWrapper = function() {
	this.position = 0;
	this.size = 0;
	this.array = null;
	return this;
};

JkLangDynamicObjectArrayIteratorWrapper.prototype.next = function() {
	if(!(this.array != null)) {
		return null;
	}
	if(this.position >= this.size) {
		return null;
	}
	var v = this.array[this.position];
	this.position++;
	return v;
};

JkLangDynamicObjectArrayIteratorWrapper.prototype.hasNext = function() {
	if(!(this.array != null)) {
		return false;
	}
	if(!(this.position < this.size - 1)) {
		return false;
	}
	return true;
};

JkLangDynamicObjectArrayIteratorWrapper.prototype.getArray = function() {
	return this.array;
};

JkLangDynamicObjectArrayIteratorWrapper.prototype.setArray = function(v) {
	this.array = v;
	return this;
};

JkLangDynamicObjectArrayIteratorWrapper.prototype.getSize = function() {
	return this.size;
};

JkLangDynamicObjectArrayIteratorWrapper.prototype.setSize = function(v) {
	this.size = v;
	return this;
};

JkLangDynamicObjectArrayIteratorWrapper.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangDynamicObjectArrayIteratorWrapper"] === true;
};

let JkLangDynamicObjectBufferIteratorWrapper = function() {
	this.buffer = null;
	this.size = 0;
	this.position = 0;
};

JkLangDynamicObjectBufferIteratorWrapper.prototype._t = {
	"JkLangDynamicObjectBufferIteratorWrapper" : true,
	"JkLangIterator" : true
};
JkLangDynamicObjectBufferIteratorWrapper.prototype._tobj = JkLangDynamicObjectBufferIteratorWrapper;

JkLangDynamicObjectBufferIteratorWrapper.NEW = function() {
	var v = new JkLangDynamicObjectBufferIteratorWrapper;
	return v.CTOR_JkLangDynamicObjectBufferIteratorWrapper();
};

JkLangDynamicObjectBufferIteratorWrapper.prototype.CTOR_JkLangDynamicObjectBufferIteratorWrapper = function() {
	this.position = 0;
	this.size = 0;
	this.buffer = null;
	return this;
};

JkLangDynamicObjectBufferIteratorWrapper.prototype.next = function() {
	if(!(this.buffer != null)) {
		return null;
	}
	if(this.position >= this.size) {
		return null;
	}
	var v = this.buffer[this.position];
	this.position++;
	return v;
};

JkLangDynamicObjectBufferIteratorWrapper.prototype.hasNext = function() {
	if(!(this.buffer != null)) {
		return false;
	}
	if(!(this.position < this.size - 1)) {
		return false;
	}
	return true;
};

JkLangDynamicObjectBufferIteratorWrapper.prototype.getBuffer = function() {
	return this.buffer;
};

JkLangDynamicObjectBufferIteratorWrapper.prototype.setBuffer = function(v) {
	this.buffer = v;
	return this;
};

JkLangDynamicObjectBufferIteratorWrapper.prototype.getSize = function() {
	return this.size;
};

JkLangDynamicObjectBufferIteratorWrapper.prototype.setSize = function(v) {
	this.size = v;
	return this;
};

JkLangDynamicObjectBufferIteratorWrapper.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangDynamicObjectBufferIteratorWrapper"] === true;
};

let JkLangDynamicObjectStringIteratorWrapper = function() {
	this.iterator = null;
};

JkLangDynamicObjectStringIteratorWrapper.prototype._t = {
	"JkLangIterator" : true,
	"JkLangDynamicObjectStringIteratorWrapper" : true
};
JkLangDynamicObjectStringIteratorWrapper.prototype._tobj = JkLangDynamicObjectStringIteratorWrapper;

JkLangDynamicObjectStringIteratorWrapper.NEW = function() {
	var v = new JkLangDynamicObjectStringIteratorWrapper;
	return v.CTOR_JkLangDynamicObjectStringIteratorWrapper();
};

JkLangDynamicObjectStringIteratorWrapper.prototype.CTOR_JkLangDynamicObjectStringIteratorWrapper = function() {
	this.iterator = null;
	return this;
};

JkLangDynamicObjectStringIteratorWrapper.prototype.next = function() {
	if(!(this.iterator != null)) {
		return null;
	}
	var c = this.iterator.getNextChar();
	if(JkLangCharacter.isEOF(c)) {
		this.iterator = null;
		return null;
	}
	return c;
};

JkLangDynamicObjectStringIteratorWrapper.prototype.hasNext = function() {
	if(!(this.iterator != null)) {
		return false;
	}
	return !this.iterator.hasEnded();
};

JkLangDynamicObjectStringIteratorWrapper.prototype.getIterator = function() {
	return this.iterator;
};

JkLangDynamicObjectStringIteratorWrapper.prototype.setIterator = function(v) {
	this.iterator = v;
	return this;
};

JkLangDynamicObjectStringIteratorWrapper.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangDynamicObjectStringIteratorWrapper"] === true;
};

let JkLangDynamicObject = function() {};

JkLangDynamicObject.prototype._t = { "JkLangDynamicObject" : true };
JkLangDynamicObject.prototype._tobj = JkLangDynamicObject;

JkLangDynamicObject.NEW = function() {
	var v = new JkLangDynamicObject;
	return v.CTOR_JkLangDynamicObject();
};

JkLangDynamicObject.prototype.CTOR_JkLangDynamicObject = function() {
	return this;
};

JkLangDynamicObject.iterate = function(value) {
	if(typeof(value) === 'string') {
		var v = JkLangDynamicObjectStringIteratorWrapper.NEW();
		v.setIterator((JkLangString.iterate(value)));
		return v;
	}
	if(value instanceof ArrayBuffer) {
		var v1 = JkLangDynamicObjectBufferIteratorWrapper.NEW();
		v1.setBuffer(value);
		v1.setSize(value.byteLength);
		return v1;
	}
	if(value instanceof Array) {
		var v2 = JkLangDynamicObjectArrayIteratorWrapper.NEW();
		v2.setArray(value);
		v2.setSize(value.length);
		return v2;
	}
	if(value instanceof Array) {
		var v3 = JkLangDynamicObjectVectorIteratorWrapper.NEW();
		v3.setVector(value);
		v3.setSize(value.length);
		return v3;
	}
	if(value instanceof Map) {
		return JkLangDynamicObject.iterate((JkLangMap.getValues(value)));
	}
	return null;
};

JkLangDynamicObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangDynamicObject"] === true;
};

let JkLangStack = function() {
	this.data = null;
};

JkLangStack.prototype._t = { "JkLangStack" : true };
JkLangStack.prototype._tobj = JkLangStack;

JkLangStack.NEW = function() {
	var v = new JkLangStack;
	return v.CTOR_JkLangStack();
};

JkLangStack.prototype.CTOR_JkLangStack = function() {
	this.data = null;
	this.data = new Array;
	return this;
};

JkLangStack.prototype.push = function(o) {
	JkLangVector.append(this.data, o);
};

JkLangStack.prototype.pop = function() {
	var sz = JkLangVector.getSize(this.data);
	if(sz < 1) {
		return null;
	}
	var v = JkLangVector.getAt(this.data, (sz - 1));
	JkLangVector.remove(this.data, (sz - 1));
	return v;
};

JkLangStack.prototype.peek = function() {
	var sz = JkLangVector.getSize(this.data);
	if(sz < 1) {
		return null;
	}
	return JkLangVector.getAt(this.data, (sz - 1));
};

JkLangStack.prototype.isEmpty = function() {
	return this.getSize() < 1;
};

JkLangStack.prototype.getSize = function() {
	return JkLangVector.getSize(this.data);
};

JkLangStack.prototype.dupData = function() {
	var v = new Array;
	if(this.data != null) {
		var n = 0;
		var m = this.data.length;
		for(n = 0 ; n < m ; n++) {
			var o = this.data[n];
			if(o != null) {
				v.push(o);
			}
		}
	}
	return v;
};

JkLangStack.prototype.dup = function() {
	var v = JkLangStack.NEW();
	v.setData((this.dupData()));
	return v;
};

JkLangStack.prototype.getData = function() {
	return this.data;
};

JkLangStack.prototype.setData = function(v) {
	this.data = v;
	return this;
};

JkLangStack.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangStack"] === true;
};

let JkLangDynamicIterator = {};

JkLangDynamicIterator.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangDynamicIterator"] === true;
};

let JkLangExceptionWithString = function() {
	JkLangException.call(this);
	this.exceptionMessage = null;
	this.stackTraceString = null;
};

JkLangExceptionWithString.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkLangException.prototype);
JkLangExceptionWithString.prototype.constructor = JkLangExceptionWithString;
JkLangExceptionWithString.prototype._t = {
	"JkLangException" : true,
	"JkLangExceptionWithString" : true,
	"JkLangStringObject" : true
};
JkLangExceptionWithString.prototype._tobj = JkLangExceptionWithString;

JkLangExceptionWithString.NEW = function() {
	var v = new JkLangExceptionWithString;
	return v.CTOR_JkLangExceptionWithString();
};

JkLangExceptionWithString.prototype.CTOR_JkLangExceptionWithString = function() {
	this.stackTraceString = null;
	this.exceptionMessage = null;
	if(JkLangException.prototype.CTOR_JkLangException.call(this) == null) {
		return null;
	}
	return this;
};

JkLangExceptionWithString.forString = function(value, allowStackTrace) {
	var v = JkLangExceptionWithString.NEW();
	v.setExceptionMessage(value);
	if(allowStackTrace) {
		v.updateStackTrace();
	}
	return v;
};

JkLangExceptionWithString.prototype.updateStackTrace = function() {
	this.setStackTraceString((JkLangStackTrace.generate()));
};

JkLangExceptionWithString.prototype.toString = function() {
	if(!(this.stackTraceString != null)) {
		return this.exceptionMessage;
	}
	var v = JkLangStringBuilder.NEW();
	v.appendString(this.exceptionMessage);
	var ss = this.stackTraceString;
	if(JkLangString.getLength(ss) > 0) {
		if(v.count() > 0) {
			v.appendCharacter('\n'.charCodeAt());
		}
		v.appendString(ss);
	}
	return v.toString();
};

JkLangExceptionWithString.prototype.getExceptionMessage = function() {
	return this.exceptionMessage;
};

JkLangExceptionWithString.prototype.setExceptionMessage = function(v) {
	this.exceptionMessage = v;
	return this;
};

JkLangExceptionWithString.prototype.getStackTraceString = function() {
	return this.stackTraceString;
};

JkLangExceptionWithString.prototype.setStackTraceString = function(v) {
	this.stackTraceString = v;
	return this;
};

JkLangExceptionWithString.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangExceptionWithString"] === true;
};

let JkLangBufferMyBufferObject = function() {
	this.buffer = null;
};

JkLangBufferMyBufferObject.prototype._t = {
	"JkLangBufferObject" : true,
	"JkLangBufferMyBufferObject" : true
};
JkLangBufferMyBufferObject.prototype._tobj = JkLangBufferMyBufferObject;

JkLangBufferMyBufferObject.NEW = function() {
	var v = new JkLangBufferMyBufferObject;
	return v.CTOR_JkLangBufferMyBufferObject();
};

JkLangBufferMyBufferObject.prototype.CTOR_JkLangBufferMyBufferObject = function() {
	this.buffer = null;
	return this;
};

JkLangBufferMyBufferObject.prototype.toBuffer = function() {
	return this.buffer;
};

JkLangBufferMyBufferObject.prototype.getBuffer = function() {
	return this.buffer;
};

JkLangBufferMyBufferObject.prototype.setBuffer = function(v) {
	this.buffer = v;
	return this;
};

JkLangBufferMyBufferObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangBufferMyBufferObject"] === true;
};

let JkLangBuffer = function() {};

JkLangBuffer.prototype._t = { "JkLangBuffer" : true };
JkLangBuffer.prototype._tobj = JkLangBuffer;

JkLangBuffer.NEW = function() {
	var v = new JkLangBuffer;
	return v.CTOR_JkLangBuffer();
};

JkLangBuffer.prototype.CTOR_JkLangBuffer = function() {
	return this;
};

JkLangBuffer.asObject = function(buffer) {
	var v = JkLangBufferMyBufferObject.NEW();
	v.setBuffer(buffer);
	return v;
};

JkLangBuffer.asBuffer = function(obj) {
	if(!(obj != null)) {
		return null;
	}
	if(obj instanceof ArrayBuffer) {
		return obj;
	}
	if(JkLangBufferObject.IS_INSTANCE && JkLangBufferObject.IS_INSTANCE(obj)) {
		var bo = obj;
		return bo.toBuffer();
	}
	if(typeof(obj) === 'number') {
		return JkLangBuffer.forInt32BE((~(~obj)));
	}
	if(typeof(obj) === 'number') {
		return JkLangBuffer.forInt64BE((~(~obj)));
	}
	if(typeof(obj) === 'number') {
		return JkLangBuffer.forDouble64BE(obj);
	}
	return null;
};

JkLangBuffer.forInt8Array = function(buf) {
	if(!(buf != null)) {
		return null;
	}
	var sz = buf.length;
	var v = new ArrayBuffer(sz);
	for(var n = 0 ; n < sz ; n++) {
		v[n] = ~(~buf[n]);
	}
	return v;
};

JkLangBuffer.toInt8Array = function(buf) {
	if(!(buf != null)) {
		return null;
	}
	var sz = buf.byteLength;
	var v = [];
	for(var n = 0 ; n < sz ; n++) {
		v[n] = ~(~buf[n]);
	}
	return v;
};

JkLangBuffer.getSubBuffer = function(buffer, offset, size, alwaysNewBuffer) {
	if(alwaysNewBuffer == false && offset == 0 && size < 0) {
		return buffer;
	}
	var bsz = JkLangBuffer.getSize(buffer);
	var sz = size;
	if(sz < 0) {
		sz = bsz - offset;
	}
	if(alwaysNewBuffer == false && offset == 0 && sz == bsz) {
		return buffer;
	}
	if(sz < 1) {
		return null;
	}
	var v = new ArrayBuffer(sz);
	JkLangBuffer.copyFrom(v, buffer, offset, 0, sz);
	return v;
};

JkLangBuffer.getInt8 = function(buffer, offset) {
	if(!(buffer != null)) {
		return ~(~0);
	}
	return new Uint8Array(buffer)[offset];
};

JkLangBuffer.copyFrom = function(array, src, soffset, doffset, size) {
	if(!(array != null)) {
		return;
	}
	if(!(src != null)) {
		return;
	}
	var suint = new Uint8Array(src);
	var sz = size;
	if((soffset + size) > suint.byteLength) {
		sz = suint.byteLength - soffset;
	}
	var arrayToCopy = suint.subarray(soffset, sz);
	var duint = new Uint8Array(array);
	duint.set(arrayToCopy, doffset);
	;
};

JkLangBuffer.getInt16LE = function(buffer, offset) {
	if(!(buffer != null)) {
		return ~(~0);
	}
	console.log("[jk.lang.Buffer.getInt16LE] (Buffer.sling:327:3): Not implemented");
	return ~(~0);
};

JkLangBuffer.getInt16BE = function(buffer, offset) {
	if(!(buffer != null)) {
		return ~(~0);
	}
	console.log("[jk.lang.Buffer.getInt16BE] (Buffer.sling:380:3): Not implemented");
	return ~(~0);
};

JkLangBuffer.getInt32LE = function(buffer, offset) {
	console.log("[jk.lang.Buffer.getInt32LE] (Buffer.sling:433:3): Not implemented");
	return ~(~0);
};

JkLangBuffer.getInt32BE = function(buffer, offset) {
	console.log("[jk.lang.Buffer.getInt32BE] (Buffer.sling:486:3): Not implemented");
	return ~(~0);
};

JkLangBuffer.getInt64LE = function(buffer, offset) {
	console.log("[jk.lang.Buffer.getInt64LE] (Buffer.sling:505:3): Not implemented");
	return 0;
};

JkLangBuffer.getInt64BE = function(buffer, offset) {
	console.log("[jk.lang.Buffer.getInt64BE] (Buffer.sling:513:2): Not implemented");
	return 0;
};

JkLangBuffer.getFloatLE = function(buffer, offset) {
	console.log("[jk.lang.Buffer.getFloatLE] (Buffer.sling:520:2): Not implemented");
	return 0.0;
};

JkLangBuffer.getFloatBE = function(buffer, offset) {
	console.log("[jk.lang.Buffer.getFloatBE] (Buffer.sling:527:2): Not implemented");
	return 0.0;
};

JkLangBuffer.getDoubleLE = function(buffer, offset) {
	console.log("[jk.lang.Buffer.getDoubleLE] (Buffer.sling:534:2): Not implemented");
	return 0.0;
};

JkLangBuffer.getDoubleBE = function(buffer, offset) {
	console.log("[jk.lang.Buffer.getDoubleBE] (Buffer.sling:541:2): Not implemented");
	return 0.0;
};

JkLangBuffer.forInt8 = function(number) {
	var v = new ArrayBuffer(1);
	v[0] = ~(~(number & 0xff));
	return v;
};

JkLangBuffer.forInt16BE = function(number) {
	console.log("[jk.lang.Buffer.forInt16BE] (Buffer.sling:558:3): Not implemented");
	return null;
};

JkLangBuffer.forInt16LE = function(number) {
	console.log("[jk.lang.Buffer.forInt16LE] (Buffer.sling:569:3): Not implemented");
	return null;
};

JkLangBuffer.forInt32BE = function(number) {
	console.log("[jk.lang.Buffer.forInt32BE] (Buffer.sling:580:3): Not implemented");
	return null;
};

JkLangBuffer.forInt32LE = function(number) {
	console.log("[jk.lang.Buffer.forInt32LE] (Buffer.sling:591:3): Not implemented");
	return null;
};

JkLangBuffer.forInt64BE = function(number) {
	console.log("[jk.lang.Buffer.forInt64BE] (Buffer.sling:602:3): Not implemented");
	return null;
};

JkLangBuffer.forInt64LE = function(number) {
	console.log("[jk.lang.Buffer.forInt64LE] (Buffer.sling:613:3): Not implemented");
	return null;
};

JkLangBuffer.forFloat32BE = function(number) {
	console.log("[jk.lang.Buffer.forFloat32BE] (Buffer.sling:624:3): Not implemented");
	return null;
};

JkLangBuffer.forFloat32LE = function(number) {
	console.log("[jk.lang.Buffer.forFloat32LE] (Buffer.sling:635:3): Not implemented");
	return null;
};

JkLangBuffer.forDouble64BE = function(number) {
	console.log("[jk.lang.Buffer.forDouble64BE] (Buffer.sling:646:3): Not implemented");
	return null;
};

JkLangBuffer.forDouble64LE = function(number) {
	console.log("[jk.lang.Buffer.forDouble64LE] (Buffer.sling:657:3): Not implemented");
	return null;
};

JkLangBuffer.getSize = function(buffer) {
	if(buffer == null) {
		return 0;
	}
	return buffer.byteLength;
};

JkLangBuffer.getByte = function(buffer, offset) {
	return JkLangBuffer.getInt8(buffer, offset);
};

JkLangBuffer.setByte = function(buffer, offset, value) {
	if(!(buffer != null)) {
		return;
	}
	new Uint8Array(buffer)[offset] = value;
	;
};

JkLangBuffer.allocate = function(size) {
	return new ArrayBuffer(size);
};

JkLangBuffer.fill = function(buffer, value) {
	var s = JkLangBuffer.getSize(buffer);
	for(var i = 0 ; i < s ; i++) {
		JkLangBuffer.setByte(buffer, i, value);
	}
};

JkLangBuffer.resize = function(buffer, newSize) {
	if(newSize < 1) {
		return null;
	}
	if(!(buffer != null)) {
		return JkLangBuffer.allocate(newSize);
	}
	if(buffer.byteLength == newSize) {
		return buffer;
	}
	var newbuffer = JkLangBuffer.allocate(newSize);
	var uint8 = new Uint8Array(newbuffer);
	uint8.set(new Uint8Array(buffer));
	;
	return newbuffer;
};

JkLangBuffer.append = function(original, toAppend, size) {
	if(toAppend == null || size == 0) {
		return original;
	}
	var sz = size;
	var os = JkLangBuffer.getSize(original);
	var oas = JkLangBuffer.getSize(toAppend);
	if(sz >= 0) {
		oas = sz;
	}
	var nl = os + oas;
	var nb = JkLangBuffer.resize(original, nl);
	JkLangBuffer.copyFrom(nb, toAppend, 0, os, oas);
	return nb;
};

JkLangBuffer.forHexString = function(str) {
	if(str == null || JkLangString.getLength(str) % 2 != 0) {
		return null;
	}
	var sb = null;
	var b = JkLangBuffer.allocate((JkLangString.getLength(str) / 2));
	var n = 0;
	var it = JkLangString.iterate(str);
	while(it != null){
		var c = it.getNextChar();
		if(c < 1) {
			break;
		}
		if(sb == null) {
			sb = JkLangStringBuilder.NEW();
		}
		if(c >= 'a'.charCodeAt() && c <= 'f'.charCodeAt() || c >= 'A'.charCodeAt() && c <= 'F'.charCodeAt() || c >= '0'.charCodeAt() && c <= '9'.charCodeAt()) {
			sb.appendCharacter(c);
			if(sb.count() == 2) {
				JkLangBuffer.setByte(b, (n++), (~(~JkLangString.toIntegerFromHex((sb.toString())))));
				sb.clear();
			}
		}
		else {
			return null;
		}
	}
	return b;
};

JkLangBuffer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangBuffer"] === true;
};

let JkLangCharacterObject = {};

JkLangCharacterObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangCharacterObject"] === true;
};

let JkLangBitOp = function() {};

JkLangBitOp.prototype._t = { "JkLangBitOp" : true };
JkLangBitOp.prototype._tobj = JkLangBitOp;

JkLangBitOp.NEW = function() {
	var v = new JkLangBitOp;
	return v.CTOR_JkLangBitOp();
};

JkLangBitOp.prototype.CTOR_JkLangBitOp = function() {
	return this;
};

JkLangBitOp.prototype.or = function(v1, v2) {
	return v1 | v2;
};

JkLangBitOp.prototype.and = function(v1, v2) {
	return v1 & v2;
};

JkLangBitOp.prototype.xor = function(v1, v2) {
	return v1 ^ v2;
};

JkLangBitOp.prototype.not = function(v) {
	return ~v;
};

JkLangBitOp.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangBitOp"] === true;
};

let JkLangExceptionWithError = function() {
	JkLangException.call(this);
	this.error = null;
};

JkLangExceptionWithError.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkLangException.prototype);
JkLangExceptionWithError.prototype.constructor = JkLangExceptionWithError;
JkLangExceptionWithError.prototype._t = {
	"JkLangException" : true,
	"JkLangExceptionWithError" : true,
	"JkLangStringObject" : true
};
JkLangExceptionWithError.prototype._tobj = JkLangExceptionWithError;

JkLangExceptionWithError.NEW = function() {
	var v = new JkLangExceptionWithError;
	return v.CTOR_JkLangExceptionWithError();
};

JkLangExceptionWithError.prototype.CTOR_JkLangExceptionWithError = function() {
	this.error = null;
	if(JkLangException.prototype.CTOR_JkLangException.call(this) == null) {
		return null;
	}
	return this;
};

JkLangExceptionWithError.forError = function(error) {
	var v = JkLangExceptionWithError.NEW();
	v.setError(error);
	return v;
};

JkLangExceptionWithError.forCode = function(code, detail) {
	return JkLangExceptionWithError.forError((JkLangError.forCode(code, detail)));
};

JkLangExceptionWithError.prototype.getErrorCode = function() {
	if(!(this.error != null)) {
		return null;
	}
	return this.error.getCode();
};

JkLangExceptionWithError.prototype.getErrorDetail = function() {
	if(!(this.error != null)) {
		return null;
	}
	return this.error.getDetail();
};

JkLangExceptionWithError.prototype.toString = function() {
	return JkLangError.asString(this.error);
};

JkLangExceptionWithError.prototype.getError = function() {
	return this.error;
};

JkLangExceptionWithError.prototype.setError = function(v) {
	this.error = v;
	return this;
};

JkLangExceptionWithError.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangExceptionWithError"] === true;
};

let JkLangArrayMyArrayObject = function() {
	this.array = null;
};

JkLangArrayMyArrayObject.prototype._t = {
	"JkLangObjectWithSize" : true,
	"JkLangArrayObject" : true,
	"JkLangArrayMyArrayObject" : true
};
JkLangArrayMyArrayObject.prototype._tobj = JkLangArrayMyArrayObject;

JkLangArrayMyArrayObject.NEW = function() {
	var v = new JkLangArrayMyArrayObject;
	return v.CTOR_JkLangArrayMyArrayObject();
};

JkLangArrayMyArrayObject.prototype.CTOR_JkLangArrayMyArrayObject = function() {
	this.array = null;
	return this;
};

JkLangArrayMyArrayObject.prototype.toArray = function() {
	return this.array;
};

JkLangArrayMyArrayObject.prototype.getSize = function() {
	return this.array.length;
};

JkLangArrayMyArrayObject.prototype.getArray = function() {
	return this.array;
};

JkLangArrayMyArrayObject.prototype.setArray = function(v) {
	this.array = v;
	return this;
};

JkLangArrayMyArrayObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangArrayMyArrayObject"] === true;
};

let JkLangKeyValuePair = function() {
	this.key = null;
	this.value = null;
};

JkLangKeyValuePair.prototype._t = { "JkLangKeyValuePair" : true };
JkLangKeyValuePair.prototype._tobj = JkLangKeyValuePair;

JkLangKeyValuePair.NEW_KV = function(key, value) {
	var v = new JkLangKeyValuePair;
	return v.CTOR_JkLangKeyValuePair_KV(key, value);
};

JkLangKeyValuePair.prototype.CTOR_JkLangKeyValuePair_KV = function(key, value) {
	this.value = null;
	this.key = null;
	this.key = key;
	this.value = value;
	return this;
};

JkLangKeyValuePair.NEW = function() {
	var v = new JkLangKeyValuePair;
	return v.CTOR_JkLangKeyValuePair();
};

JkLangKeyValuePair.prototype.CTOR_JkLangKeyValuePair = function() {
	this.value = null;
	this.key = null;
	return this;
};

JkLangKeyValuePair.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangKeyValuePair"] === true;
};

let JkLangTimeValue = function() {
	this.seconds = 0;
	this.microSeconds = 0;
};

JkLangTimeValue.prototype._t = { "JkLangTimeValue" : true };
JkLangTimeValue.prototype._tobj = JkLangTimeValue;

JkLangTimeValue.NEW = function() {
	var v = new JkLangTimeValue;
	return v.CTOR_JkLangTimeValue();
};

JkLangTimeValue.prototype.CTOR_JkLangTimeValue = function() {
	this.microSeconds = 0;
	this.seconds = 0;
	return this;
};

JkLangTimeValue.forSeconds = function(seconds) {
	var v = JkLangTimeValue.NEW();
	v.seconds = seconds;
	return v;
};

JkLangTimeValue.prototype.toString = function() {
	var sb = JkLangStringBuilder.NEW();
	sb.appendString((JkLangString.forLongInteger(this.seconds)));
	sb.appendCharacter('.'.charCodeAt());
	sb.appendString((JkLangString.forLongInteger(this.microSeconds)));
	return sb.toString();
};

JkLangTimeValue.prototype.dup = function() {
	var v = JkLangTimeValue.NEW();
	v.copyFrom(this);
	return v;
};

JkLangTimeValue.prototype.reset = function() {
	this.seconds = 0;
	this.microSeconds = 0;
};

JkLangTimeValue.prototype.copyFrom = function(tv) {
	this.seconds = tv.seconds;
	this.microSeconds = tv.microSeconds;
};

JkLangTimeValue.prototype.set = function(tv) {
	this.seconds = tv.getSeconds();
	this.microSeconds = tv.getMicroSeconds();
};

JkLangTimeValue.prototype.setSeconds = function(value) {
	this.seconds = value;
};

JkLangTimeValue.prototype.setMilliSeconds = function(value) {
	this.microSeconds = value * 1000;
};

JkLangTimeValue.prototype.setMicroSeconds = function(value) {
	this.microSeconds = value;
};

JkLangTimeValue.prototype.add = function(s, us) {
	var ts = this.getSeconds() + s;
	var tus = this.getMicroSeconds() + us;
	if(tus > 1000000) {
		ts += tus / 1000000;
		tus = tus % 1000000;
	}
	while(tus < 0){
		ts--;
		tus += 1000000;
	}
	var v = JkLangTimeValue.NEW();
	v.seconds = ts;
	v.microSeconds = tus;
	return v;
};

JkLangTimeValue.prototype.addTimeValue = function(tv) {
	if(tv == null) {
		return this;
	}
	return this.add((tv.getSeconds()), (tv.getMicroSeconds()));
};

JkLangTimeValue.prototype.subtract = function(tv) {
	if(tv == null) {
		return this;
	}
	return this.add((-tv.getSeconds()), (-tv.getMicroSeconds()));
};

JkLangTimeValue.prototype.asMicroSeconds = function() {
	return this.getSeconds() * 1000000 + ~(~this.getMicroSeconds());
};

JkLangTimeValue.diff = function(a, b) {
	if(a == null && b == null) {
		return 0;
	}
	if(a == null) {
		return b.asMicroSeconds();
	}
	if(b == null) {
		return a.asMicroSeconds();
	}
	var r = (a.seconds - b.seconds) * 1000000 + (a.microSeconds - b.microSeconds);
	return r;
};

JkLangTimeValue.diffDouble = function(a, b) {
	return JkLangTimeValue.diff(a, b) / 1000000.0;
};

JkLangTimeValue.prototype.getSeconds = function() {
	return this.seconds;
};

JkLangTimeValue.prototype.getMicroSeconds = function() {
	return this.microSeconds;
};

JkLangTimeValue.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangTimeValue"] === true;
};

let JkLangReflection = function() {};

JkLangReflection.prototype._t = { "JkLangReflection" : true };
JkLangReflection.prototype._tobj = JkLangReflection;

JkLangReflection.NEW = function() {
	var v = new JkLangReflection;
	return v.CTOR_JkLangReflection();
};

JkLangReflection.prototype.CTOR_JkLangReflection = function() {
	return this;
};

JkLangReflection.createClassInstanceByName = function(qualifiedName) {
	if(!JkLangString.isNotEmpty(qualifiedName)) {
		return null;
	}
	console.log("[jk.lang.Reflection.createClassInstanceByName] (Reflection.sling:36:3): Not implemented.");
	return null;
};

JkLangReflection.createClassInstanceByTypeinfo = function(type) {
	console.log("[jk.lang.Reflection.createClassInstanceByTypeinfo] (Reflection.sling:50:3): Not implemented.");
	return null;
};

JkLangReflection.callMethod = function(objectInstance, methodName, _arguments) {
	console.log("[jk.lang.Reflection.callMethod] (Reflection.sling:77:3): Not implemented.");
	return null;
};

JkLangReflection.getDataTypeInfo = function(variable) {
	return typeof variable;
};

JkLangReflection.isSameType = function(primary, other) {
	if(primary == null && other == null) {
		return true;
	}
	if(primary == null || other == null) {
		return false;
	}
	var ta = typeof primary;
	var tb = typeof other;
	if(ta == tb) {
		return true;
	}
	return false;
};

JkLangReflection.isInstanceOf = function(objectInstance, type) {
	if(!(objectInstance != null)) {
		return false;
	}
	console.log("[jk.lang.Reflection.isInstanceOf] (Reflection.sling:113:3): Not implemented");
	return false;
};

JkLangReflection.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangReflection"] === true;
};

let JkLangBufferDataReceiver = {};

JkLangBufferDataReceiver.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangBufferDataReceiver"] === true;
};

let JkLangCharacter = function() {
	this.character = '\0'.charCodeAt();
};

JkLangCharacter.prototype._t = {
	"JkLangCharacter" : true,
	"JkLangCharacterObject" : true
};
JkLangCharacter.prototype._tobj = JkLangCharacter;

JkLangCharacter.NEW = function() {
	var v = new JkLangCharacter;
	return v.CTOR_JkLangCharacter();
};

JkLangCharacter.prototype.CTOR_JkLangCharacter = function() {
	this.character = '\0'.charCodeAt();
	return this;
};

JkLangCharacter.asObject = function(character) {
	var v = JkLangCharacter.NEW();
	v.setCharacter(character);
	return v;
};

JkLangCharacter.toUppercase = function(c) {
	if(c >= 'a'.charCodeAt() && c <= 'z'.charCodeAt()) {
		return c - 'a'.charCodeAt() + 'A'.charCodeAt();
	}
	return c;
};

JkLangCharacter.toLowercase = function(c) {
	if(c >= 'A'.charCodeAt() && c <= 'Z'.charCodeAt()) {
		return c - 'A'.charCodeAt() + 'a'.charCodeAt();
	}
	return c;
};

JkLangCharacter.isDigit = function(c) {
	return c >= '0'.charCodeAt() && c <= '9'.charCodeAt();
};

JkLangCharacter.isLowercaseAlpha = function(c) {
	return c >= 'a'.charCodeAt() && c <= 'z'.charCodeAt();
};

JkLangCharacter.isUppercaseAlpha = function(c) {
	return c >= 'A'.charCodeAt() && c <= 'Z'.charCodeAt();
};

JkLangCharacter.isHexDigit = function(c) {
	var v = c >= 'a'.charCodeAt() && c <= 'f'.charCodeAt() || c >= 'A'.charCodeAt() && c <= 'F'.charCodeAt() || c >= '0'.charCodeAt() && c <= '9'.charCodeAt();
	return v;
};

JkLangCharacter.isAlnum = function(c) {
	var v = c >= 'a'.charCodeAt() && c <= 'z'.charCodeAt() || c >= 'A'.charCodeAt() && c <= 'Z'.charCodeAt() || c >= '0'.charCodeAt() && c <= '9'.charCodeAt();
	return v;
};

JkLangCharacter.isAlpha = function(c) {
	var v = c >= 'a'.charCodeAt() && c <= 'z'.charCodeAt() || c >= 'A'.charCodeAt() && c <= 'Z'.charCodeAt();
	return v;
};

JkLangCharacter.isAlphaNumeric = function(c) {
	var v = c >= 'a'.charCodeAt() && c <= 'z'.charCodeAt() || c >= 'A'.charCodeAt() && c <= 'Z'.charCodeAt() || c >= '0'.charCodeAt() && c <= '9'.charCodeAt();
	return v;
};

JkLangCharacter.isLowercaseAlphaNumeric = function(c) {
	var v = c >= 'a'.charCodeAt() && c <= 'z'.charCodeAt() || c >= '0'.charCodeAt() && c <= '9'.charCodeAt();
	return v;
};

JkLangCharacter.isUppercaseAlphaNumeric = function(c) {
	var v = c >= 'A'.charCodeAt() && c <= 'Z'.charCodeAt() || c >= '0'.charCodeAt() && c <= '9'.charCodeAt();
	return v;
};

JkLangCharacter.prototype.toCharacter = function() {
	return this.character;
};

JkLangCharacter.isEOF = function(c) {
	return c == 0 || c == -1;
};

JkLangCharacter.getHexDigit = function(c) {
	var v = 0;
	if(c >= '0'.charCodeAt() && c <= '9'.charCodeAt()) {
		v = ~(~(c - '0'.charCodeAt()));
	}
	else if(c >= 'a'.charCodeAt() && c <= 'f'.charCodeAt()) {
		v = ~(~(10 + c - 'a'.charCodeAt()));
	}
	else if(c >= 'A'.charCodeAt() && c <= 'F'.charCodeAt()) {
		v = ~(~(10 + c - 'A'.charCodeAt()));
	}
	else {
		return 0;
	}
	return v;
};

JkLangCharacter.prototype.getCharacter = function() {
	return this.character;
};

JkLangCharacter.prototype.setCharacter = function(v) {
	this.character = v;
	return this;
};

JkLangCharacter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangCharacter"] === true;
};

let JkLangDouble = function() {
	this.value = 0.0;
};

JkLangDouble.prototype._t = {
	"JkLangDouble" : true,
	"JkLangDoubleObject" : true
};
JkLangDouble.prototype._tobj = JkLangDouble;

JkLangDouble.NEW = function() {
	var v = new JkLangDouble;
	return v.CTOR_JkLangDouble();
};

JkLangDouble.prototype.CTOR_JkLangDouble = function() {
	this.value = 0.0;
	return this;
};

JkLangDouble.forValue = function(value) {
	return JkLangDouble.asObject(value);
};

JkLangDouble.asObject = function(value) {
	var v = JkLangDouble.NEW();
	v.setValue(value);
	return v;
};

JkLangDouble.asDouble = function(obj) {
	if(!(obj != null)) {
		return 0.0;
	}
	if(typeof(obj) === 'number') {
		return obj;
	}
	if(JkLangDoubleObject.IS_INSTANCE && JkLangDoubleObject.IS_INSTANCE(obj)) {
		var od = obj;
		return od.toDouble();
	}
	if(typeof(obj) === 'number') {
		var v = ~(~obj);
		return v;
	}
	if(JkLangIntegerObject.IS_INSTANCE && JkLangIntegerObject.IS_INSTANCE(obj)) {
		var oi = obj;
		return oi.toInteger();
	}
	if(typeof(obj) === 'number') {
		var v1 = ~(~obj);
		return v1;
	}
	if(JkLangLongIntegerObject.IS_INSTANCE && JkLangLongIntegerObject.IS_INSTANCE(obj)) {
		var oi1 = obj;
		return oi1.toLong();
	}
	if(typeof(obj) === 'string') {
		return JkLangString.toDouble(obj);
	}
	if(JkLangStringObject.IS_INSTANCE && JkLangStringObject.IS_INSTANCE(obj)) {
		return JkLangString.toDouble((obj.toString()));
	}
	if(typeof(obj) === 'string') {
		var v2 = obj;
		return v2;
	}
	if(JkLangCharacterObject.IS_INSTANCE && JkLangCharacterObject.IS_INSTANCE(obj)) {
		var oc = obj;
		return oc.toCharacter();
	}
	if(typeof(obj) === 'boolean') {
		if(obj == true) {
			return 1.0;
		}
		return 0.0;
	}
	if(JkLangBooleanObject.IS_INSTANCE && JkLangBooleanObject.IS_INSTANCE(obj)) {
		if(obj.toBoolean()) {
			return 1.0;
		}
		return 0.0;
	}
	return 0.0;
};

JkLangDouble.longBitsToDouble = function(vv) {
	console.log("[jk.lang.Double.longBitsToDouble] (Double.sling:97:3): Not implemented");
	return 0.0;
};

JkLangDouble.doubleToLongBits = function(vv) {
	console.log("[jk.lang.Double.doubleToLongBits] (Double.sling:111:3): Not implemented");
	return 0;
};

JkLangDouble.prototype.add = function(amount) {
	this.value += amount;
};

JkLangDouble.prototype.toDouble = function() {
	return this.value;
};

JkLangDouble.prototype.getValue = function() {
	return this.value;
};

JkLangDouble.prototype.setValue = function(v) {
	this.value = v;
	return this;
};

JkLangDouble.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangDouble"] === true;
};

let JkLangDynamicMap = function() {
	this.map = null;
};

JkLangDynamicMap.prototype._t = {
	"JkLangIterateable" : true,
	"JkLangDynamicMap" : true,
	"JkLangDuplicateable" : true
};
JkLangDynamicMap.prototype._tobj = JkLangDynamicMap;

JkLangDynamicMap.NEW = function() {
	var v = new JkLangDynamicMap;
	return v.CTOR_JkLangDynamicMap();
};

JkLangDynamicMap.prototype.CTOR_JkLangDynamicMap = function() {
	this.map = null;
	this.map = new Map;
	return this;
};

JkLangDynamicMap.asDynamicMap = function(value) {
	if(!(value != null)) {
		return null;
	}
	if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(value)) {
		return value;
	}
	if(value instanceof Map) {
		return JkLangDynamicMap.forObjectMap(value);
	}
	return null;
};

JkLangDynamicMap.forObjectMap = function(map) {
	var v = JkLangDynamicMap.NEW();
	if(map != null) {
		var it = JkLangMap.iterateKeys(map);
		while(it != null){
			var key = it.next();
			if(key == null) {
				break;
			}
			if(typeof(key) === 'string' == false) {
				continue;
			}
			v.setObject(key, (JkLangMap.getValue(map, key)));
		}
	}
	return v;
};

JkLangDynamicMap.forStringMap = function(map) {
	var v = JkLangDynamicMap.NEW();
	if(map != null) {
		var it = JkLangMap.iterateKeys(map);
		while(it != null){
			var key = it.next();
			if(key == null) {
				break;
			}
			v.setString(key, (JkLangMap.getValue(map, key)));
		}
	}
	return v;
};

JkLangDynamicMap.forDynamicMaps = function(map1, map2) {
	var v = JkLangDynamicMap.NEW();
	v.mergeFrom(map1);
	v.mergeFrom(map2);
	return v;
};

JkLangDynamicMap.forDynamicMap = function(map) {
	if(!(map != null)) {
		return null;
	}
	return map.duplicateMap();
};

JkLangDynamicMap.prototype.asMap = function() {
	return this.map;
};

JkLangDynamicMap.prototype.asStringMap = function() {
	return this.toStringMap();
};

JkLangDynamicMap.prototype.toStringMap = function() {
	var v = new Map;
	var it = this.iterateKeys();
	while(it != null){
		var key = it.next();
		if(!(key != null)) {
			break;
		}
		JkLangMap.set(v, key, (this.getString(key, null)));
	}
	return v;
};

JkLangDynamicMap.prototype.toObjectMap = function() {
	var v = new Map;
	var it = this.iterateKeys();
	while(it != null){
		var key = it.next();
		if(!(key != null)) {
			break;
		}
		JkLangMap.set(v, key, (this.getString(key, null)));
	}
	return v;
};

JkLangDynamicMap.prototype.duplicate = function() {
	return this.duplicateMap();
};

JkLangDynamicMap.prototype.duplicateMap = function() {
	var v = JkLangDynamicMap.NEW();
	var it = this.iterateKeys();
	while(it != null){
		var key = it.next();
		if(key == null) {
			break;
		}
		v.setObject(key, (this.get(key)));
	}
	return v;
};

JkLangDynamicMap.prototype.mergeFrom = function(other) {
	if(other == null) {
		return this;
	}
	var it = other.iterateKeys();
	while(it != null){
		var key = it.next();
		if(key == null) {
			break;
		}
		this.setObject(key, (other.get(key)));
	}
	return this;
};

JkLangDynamicMap.prototype.setObject = function(key, value) {
	if(key != null) {
		this.map.set(key, value);
	}
	return this;
};

JkLangDynamicMap.prototype.setString = function(key, value) {
	if(key != null) {
		this.map.set(key, value);
	}
	return this;
};

JkLangDynamicMap.prototype.setBuffer = function(key, value) {
	if(!(key == null) && value == null) {
		this.map.set(key, null);
		return this;
	}
	return this.setObject(key, (JkLangBuffer.asObject(value)));
};

JkLangDynamicMap.prototype.setInteger = function(key, value) {
	return this.setObject(key, (JkLangInteger.asObject(value)));
};

JkLangDynamicMap.prototype.setLong = function(key, value) {
	return this.setObject(key, (JkLangLongInteger.asObject(value)));
};

JkLangDynamicMap.prototype.setLongInteger = function(key, value) {
	return this.setObject(key, (JkLangLongInteger.asObject(value)));
};

JkLangDynamicMap.prototype.setBoolean = function(key, value) {
	return this.setObject(key, (JkLangBoolean.asObject(value)));
};

JkLangDynamicMap.prototype.setDouble = function(key, value) {
	return this.setObject(key, (JkLangDouble.asObject(value)));
};

JkLangDynamicMap.prototype.get = function(key) {
	var v = JkLangMap.getValue(this.map, key);
	return v;
};

JkLangDynamicMap.prototype.getString = function(key, defval) {
	var v = JkLangString.asString((this.get(key)));
	if(v == null) {
		return defval;
	}
	return v;
};

JkLangDynamicMap.prototype.getInteger = function(key, defval) {
	var vv = this.get(key);
	if(vv == null) {
		return defval;
	}
	return JkLangInteger.asInteger(vv);
};

JkLangDynamicMap.prototype.getLongInteger = function(key, defval) {
	var vv = this.get(key);
	if(vv == null) {
		return defval;
	}
	return JkLangLongInteger.asLong(vv);
};

JkLangDynamicMap.prototype.getBoolean = function(key, defval) {
	var vv = this.get(key);
	if(vv == null) {
		return defval;
	}
	return JkLangBoolean.asBoolean(vv, false);
};

JkLangDynamicMap.prototype.getDouble = function(key, defval) {
	var vv = this.get(key);
	if(vv == null) {
		return defval;
	}
	return JkLangDouble.asDouble(vv);
};

JkLangDynamicMap.prototype.getBuffer = function(key) {
	var vv = this.get(key);
	if(!(vv != null)) {
		return null;
	}
	return JkLangBuffer.asBuffer(vv);
};

JkLangDynamicMap.prototype.getDynamicVector = function(key) {
	var vv = (function(o) {
		if(JkLangDynamicVector.IS_INSTANCE && JkLangDynamicVector.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((this.get(key)));
	if(vv != null) {
		return vv;
	}
	var v = this.getVector(key);
	if(v != null) {
		return JkLangDynamicVector.forObjectVector(v);
	}
	return null;
};

JkLangDynamicMap.prototype.getVector = function(key) {
	var val = this.get(key);
	if(!(val != null)) {
		return null;
	}
	if(val instanceof Array) {
		return val;
	}
	if(JkLangVectorObject.IS_INSTANCE && JkLangVectorObject.IS_INSTANCE(val)) {
		var vo = val;
		var vv = vo.toVector();
		return vv;
	}
	return null;
};

JkLangDynamicMap.prototype.getDynamicMap = function(key) {
	return (function(o) {
		if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((this.get(key)));
};

JkLangDynamicMap.prototype.getKeys = function() {
	var v = JkLangMap.getKeys(this.map);
	return v;
};

JkLangDynamicMap.prototype.getValues = function() {
	var v = JkLangMap.getValues(this.map);
	return v;
};

JkLangDynamicMap.prototype.iterate = function() {
	var v = JkLangMap.iterateKeys(this.map);
	return v;
};

JkLangDynamicMap.prototype.iterateKeys = function() {
	var v = JkLangMap.iterateKeys(this.map);
	return v;
};

JkLangDynamicMap.prototype.iterateValues = function() {
	return JkLangVector.iterate((this.getValues()));
};

JkLangDynamicMap.prototype.remove = function(key) {
	JkLangMap.remove(this.map, key);
};

JkLangDynamicMap.prototype.clear = function() {
	JkLangMap.clear(this.map);
};

JkLangDynamicMap.prototype.getCount = function() {
	return JkLangMap.count(this.map);
};

JkLangDynamicMap.prototype.containsKey = function(key) {
	return JkLangMap.containsKey(this.map, key);
};

JkLangDynamicMap.prototype.removeNullValues = function() {
	var keys = this.getKeys();
	if(keys != null) {
		var n = 0;
		var m = keys.length;
		for(n = 0 ; n < m ; n++) {
			var key = keys[n];
			if(key != null) {
				var value = this.get(key);
				if(value == null) {
					this.remove(key);
				}
			}
		}
	}
	return this;
};

JkLangDynamicMap.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkLangDynamicMap"] === true;
};
