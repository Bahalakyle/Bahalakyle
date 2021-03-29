let JkTextStringUtil = function() {};

JkTextStringUtil.prototype._t = { "JkTextStringUtil" : true };
JkTextStringUtil.prototype._tobj = JkTextStringUtil;

JkTextStringUtil.NEW = function() {
	var v = new JkTextStringUtil;
	return v.CTOR_JkTextStringUtil();
};

JkTextStringUtil.prototype.CTOR_JkTextStringUtil = function() {
	return this;
};

JkTextStringUtil.padToLength = function(value, _length, align, paddingCharacter) {
	var ll = 0;
	if(value == null) {
		ll = 0;
	}
	else {
		ll = JkLangString.getLength(value);
	}
	if(ll >= _length) {
		return value;
	}
	var add = _length - ll;
	var n = 0;
	var sb = JkLangStringBuilder.NEW();
	if(align < 0) {
		sb.appendString(value);
		for(n = 0 ; n < add ; n++) {
			sb.appendCharacter(paddingCharacter);
		}
	}
	else if(align == 0) {
		var ff = add / 2;
		var ss = add - ff;
		for(n = 0 ; n < ff ; n++) {
			sb.appendCharacter(paddingCharacter);
		}
		sb.appendString(value);
		for(n = 0 ; n < ss ; n++) {
			sb.appendCharacter(paddingCharacter);
		}
	}
	else {
		for(n = 0 ; n < add ; n++) {
			sb.appendCharacter(paddingCharacter);
		}
		sb.appendString(value);
	}
	return sb.toString();
};

JkTextStringUtil.quotedStringToVector = function(str, delim, ignoreRepeatedDelimiters, escapeCharacter) {
	var v = new Array;
	if(str == null) {
		return v;
	}
	var dquote = false;
	var quote = false;
	var sb = null;
	var it = JkLangString.iterate(str);
	while(true){
		var c = it.getNextChar();
		if(JkLangCharacter.isEOF(c)) {
			break;
		}
		if(c == '\"'.charCodeAt() && quote == false) {
			dquote = !dquote;
		}
		else if(c == '\''.charCodeAt() && dquote == false) {
			quote = !quote;
		}
		else if(quote == false && dquote == false && c == delim) {
			if(sb != null) {
				var r = sb.toString();
				if(r == null) {
					r = "";
				}
				v.push(r);
			}
			else if(ignoreRepeatedDelimiters == false) {
				v.push("");
			}
			sb = null;
		}
		else {
			if(escapeCharacter > 0 && c == escapeCharacter) {
				c = it.getNextChar();
				if(JkLangCharacter.isEOF(c)) {
					break;
				}
			}
			if(sb == null) {
				sb = JkLangStringBuilder.NEW();
			}
			sb.appendCharacter(c);
		}
		if((quote == true || dquote == true) && sb == null) {
			sb = JkLangStringBuilder.NEW();
		}
	}
	if(sb != null) {
		var r1 = sb.toString();
		if(r1 == null) {
			r1 = "";
		}
		v.push(r1);
	}
	return v;
};

JkTextStringUtil.quotedStringToMap = function(str, delim) {
	var v = new Map;
	var vector = JkTextStringUtil.quotedStringToVector(str, delim, true, '\\'.charCodeAt());
	if(vector != null) {
		var n = 0;
		var m = vector.length;
		for(n = 0 ; n < m ; n++) {
			var c = vector[n];
			if(c != null) {
				var sp = JkLangString.split(c, '='.charCodeAt(), 2);
				var key = sp[0];
				var val = sp[1];
				if(JkLangString.isEmpty(key) == false) {
					v.set(key, val);
				}
			}
		}
	}
	return v;
};

JkTextStringUtil.combine = function(strings, delim, unique, index) {
	var sb = JkLangStringBuilder.NEW();
	var flags = null;
	if(unique) {
		flags = new Map;
	}
	var i = index;
	while(i < strings.length){
		var o = strings[i];
		i++;
		if(o == null) {
			continue;
		}
		if(flags != null) {
			if(JkLangMap.get(flags, o) != null) {
				continue;
			}
			JkLangMap.set(flags, o, "true");
		}
		if(delim > 0 && sb.count() > 0) {
			sb.appendCharacter(delim);
		}
		sb.appendString(o);
	}
	return sb.toString();
};

JkTextStringUtil.validateCharacters = function(str, validator) {
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
		if(validator(c) == false) {
			return false;
		}
	}
	return true;
};

JkTextStringUtil.toStringVector = function(vector, allowConversion) {
	var v = new Array;
	if(vector != null) {
		var n = 0;
		var m = vector.length;
		for(n = 0 ; n < m ; n++) {
			var o = vector[n];
			if(o != null) {
				if(allowConversion) {
					var s = JkLangString.asString(o);
					if(s != null) {
						v.push(s);
					}
				}
				else if(typeof(o) === 'string') {
					v.push(o);
				}
			}
		}
	}
	return v;
};

JkTextStringUtil.toObjectVector = function(vector) {
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

JkTextStringUtil.wrapToLines = function(text, charactersPerLine) {
	if(!(text != null)) {
		return null;
	}
	var v = new Array;
	var it = JkLangString.iterate(text);
	var lineBuilder = null;
	var wordBuilder = null;
	while(it != null){
		var c = it.getNextChar();
		if(c == ' '.charCodeAt() || c == '\t'.charCodeAt() || c == '\n'.charCodeAt() || c < 1) {
			if(wordBuilder != null) {
				var word = wordBuilder.toString();
				wordBuilder = null;
				if(lineBuilder == null) {
					lineBuilder = JkLangStringBuilder.NEW();
				}
				var cc = lineBuilder.count();
				if(cc > 0) {
					cc++;
				}
				cc += JkLangString.getLength(word);
				if(cc > charactersPerLine) {
					v.push(lineBuilder.toString());
					lineBuilder = JkLangStringBuilder.NEW();
				}
				if(lineBuilder.count() > 0) {
					lineBuilder.appendCharacter(' '.charCodeAt());
				}
				lineBuilder.appendString(word);
			}
			if(c < 1) {
				break;
			}
			continue;
		}
		if(wordBuilder == null) {
			wordBuilder = JkLangStringBuilder.NEW();
		}
		wordBuilder.appendCharacter(c);
	}
	if(lineBuilder != null) {
		v.push(lineBuilder.toString());
	}
	return v;
};

JkTextStringUtil.stripLeadingZeros = function(str) {
	if(JkLangString.getChar(str, 0) == '0'.charCodeAt()) {
		var iter = JkLangString.iterate(str);
		if(!(iter != null)) {
			return null;
		}
		var i = 0;
		while(true){
			var c = iter.getNextChar();
			if(JkLangCharacter.isEOF(c)) {
				break;
			}
			if(c != '0'.charCodeAt()) {
				return JkLangString.getEndOfString(str, i);
			}
			i++;
		}
		return "";
	}
	return str;
};

JkTextStringUtil.formatNumberString = function(vv, delimiter) {
	if(!(vv != null)) {
		return null;
	}
	var it = JkLangString.iterate(vv);
	if(!(it != null)) {
		return null;
	}
	var rr = JkLangString.getLength(vv);
	var sb = JkLangStringBuilder.NEW();
	while(true){
		var c = it.getNextChar();
		if(c < 1) {
			break;
		}
		sb.appendCharacter(c);
		rr--;
		if(rr < 1) {
			break;
		}
		if(rr % 3 == 0) {
			sb.appendCharacter(delimiter);
		}
	}
	return sb.toString();
};

JkTextStringUtil.formatInteger = function(vv, delimiter) {
	return JkTextStringUtil.formatNumberString((JkLangString.forInteger(vv)), delimiter);
};

JkTextStringUtil.formatLongInteger = function(vv, delimiter) {
	return JkTextStringUtil.formatNumberString((JkLangString.forLongInteger(vv)), delimiter);
};

JkTextStringUtil.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTextStringUtil"] === true;
};

let JkTextStringBufferDecoder = function() {};

JkTextStringBufferDecoder.prototype._t = { "JkTextStringBufferDecoder" : true };
JkTextStringBufferDecoder.prototype._tobj = JkTextStringBufferDecoder;

JkTextStringBufferDecoder.NEW = function() {
	var v = new JkTextStringBufferDecoder;
	return v.CTOR_JkTextStringBufferDecoder();
};

JkTextStringBufferDecoder.prototype.CTOR_JkTextStringBufferDecoder = function() {
	return this;
};

JkTextStringBufferDecoder.decodeUTF8Buffer = function(buf) {
	return JkLangString.forUTF8Buffer(buf);
};

JkTextStringBufferDecoder.decodeUTF16LEBuffer = function(buf) {
	var sb = JkLangStringBuilder.NEW();
	var n = 0;
	var m = JkLangBuffer.getSize(buf);
	while(n < m){
		sb.appendCharacter((JkLangBuffer.getInt16LE(buf, n)));
		n += 2;
	}
	return sb.toString();
};

JkTextStringBufferDecoder.decodeUTF16BEBuffer = function(buf) {
	var sb = JkLangStringBuilder.NEW();
	var n = 0;
	var m = JkLangBuffer.getSize(buf);
	while(n < m){
		var c = JkLangBuffer.getInt16BE(buf, n);
		sb.appendCharacter(c);
		n += 2;
	}
	return sb.toString();
};

JkTextStringBufferDecoder.decodeUTF32LEBuffer = function(buf) {
	var sb = JkLangStringBuilder.NEW();
	var n = 0;
	var m = JkLangBuffer.getSize(buf);
	while(n < m){
		sb.appendCharacter((JkLangBuffer.getInt32LE(buf, n)));
		n += 4;
	}
	return sb.toString();
};

JkTextStringBufferDecoder.decodeUTF32BEBuffer = function(buf) {
	var sb = JkLangStringBuilder.NEW();
	var n = 0;
	var m = JkLangBuffer.getSize(buf);
	while(n < m){
		sb.appendCharacter((JkLangBuffer.getInt32BE(buf, n)));
		n += 4;
	}
	return sb.toString();
};

JkTextStringBufferDecoder.decodeBufferWithBOM = function(buf, keepBomCharacter) {
	if(!(buf != null)) {
		return null;
	}
	if(JkLangBuffer.getByte(buf, 0) == 0xef && JkLangBuffer.getByte(buf, 1) == 0xbb && JkLangBuffer.getByte(buf, 2) == 0xbf) {
		if(keepBomCharacter) {
			return JkTextStringBufferDecoder.decodeUTF8Buffer(buf);
		}
		return JkTextStringBufferDecoder.decodeUTF8Buffer((JkLangBuffer.getSubBuffer(buf, 3, (JkLangBuffer.getSize(buf) - 3), false)));
	}
	if(JkLangBuffer.getByte(buf, 0) == 0xff && JkLangBuffer.getByte(buf, 1) == 0xfe) {
		if(JkLangBuffer.getByte(buf, 2) == 0x0 && JkLangBuffer.getByte(buf, 3) == 0x0) {
			if(keepBomCharacter) {
				return JkTextStringBufferDecoder.decodeUTF32LEBuffer(buf);
			}
			return JkTextStringBufferDecoder.decodeUTF32LEBuffer((JkLangBuffer.getSubBuffer(buf, 4, (JkLangBuffer.getSize(buf) - 4), false)));
		}
		if(keepBomCharacter) {
			return JkTextStringBufferDecoder.decodeUTF16LEBuffer(buf);
		}
		return JkTextStringBufferDecoder.decodeUTF16LEBuffer((JkLangBuffer.getSubBuffer(buf, 2, (JkLangBuffer.getSize(buf) - 2), false)));
	}
	if(JkLangBuffer.getByte(buf, 0) == 0xfe && JkLangBuffer.getByte(buf, 1) == 0xff) {
		if(JkLangBuffer.getByte(buf, 2) == 0x0 && JkLangBuffer.getByte(buf, 3) == 0x0) {
			if(keepBomCharacter) {
				return JkTextStringBufferDecoder.decodeUTF32BEBuffer(buf);
			}
			return JkTextStringBufferDecoder.decodeUTF32BEBuffer((JkLangBuffer.getSubBuffer(buf, 4, (JkLangBuffer.getSize(buf) - 4), false)));
		}
		if(keepBomCharacter) {
			return JkTextStringBufferDecoder.decodeUTF16BEBuffer(buf);
		}
		return JkTextStringBufferDecoder.decodeUTF16BEBuffer((JkLangBuffer.getSubBuffer(buf, 2, (JkLangBuffer.getSize(buf) - 2), false)));
	}
	return JkLangString.forUTF8Buffer(buf);
};

JkTextStringBufferDecoder.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTextStringBufferDecoder"] === true;
};
