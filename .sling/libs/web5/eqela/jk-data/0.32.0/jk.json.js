let JkJsonJSONObject = {};

JkJsonJSONObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkJsonJSONObject"] === true;
};

let JkJsonJSONObjectAdapterExplicit = function() {};

JkJsonJSONObjectAdapterExplicit.prototype._t = {
	"JkJsonJSONObject" : true,
	"JkJsonJSONObjectAdapterExplicit" : true
};
JkJsonJSONObjectAdapterExplicit.prototype._tobj = JkJsonJSONObjectAdapterExplicit;

JkJsonJSONObjectAdapterExplicit.NEW = function() {
	var v = new JkJsonJSONObjectAdapterExplicit;
	return v.CTOR_JkJsonJSONObjectAdapterExplicit();
};

JkJsonJSONObjectAdapterExplicit.prototype.CTOR_JkJsonJSONObjectAdapterExplicit = function() {
	return this;
};

JkJsonJSONObjectAdapterExplicit.prototype.asJsonValue = function(value) {
	if(!(value != null)) {
		return null;
	}
	if(JkJsonJSONObject.IS_INSTANCE && JkJsonJSONObject.IS_INSTANCE(value)) {
		var oj = value;
		return oj.toJsonObject();
	}
	return value;
};

JkJsonJSONObjectAdapterExplicit.prototype.toDynamicMap = function() {
	return (function(o) {
		if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((this.toJsonObject()));
};

JkJsonJSONObjectAdapterExplicit.prototype.toObjectMap = function() {
	var dm = this.toDynamicMap();
	if(!(dm != null)) {
		return null;
	}
	return dm.toObjectMap();
};

JkJsonJSONObjectAdapterExplicit.prototype.toJsonObject = function() {};

JkJsonJSONObjectAdapterExplicit.prototype.fromJsonObject = function(o) {};

JkJsonJSONObjectAdapterExplicit.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkJsonJSONObjectAdapterExplicit"] === true;
};

let JkJsonJSONEncoder = function() {
	this.niceFormatting = true;
	this.stringFormattedBoolean = false;
	this.stringFormattedNumber = false;
	this.newJSONFormat = true;
	this.encodeNullAsNull = false;
	this.isNewLine = true;
	this.mysb = null;
};

JkJsonJSONEncoder.prototype._t = { "JkJsonJSONEncoder" : true };
JkJsonJSONEncoder.prototype._tobj = JkJsonJSONEncoder;

JkJsonJSONEncoder.NEW = function() {
	var v = new JkJsonJSONEncoder;
	return v.CTOR_JkJsonJSONEncoder();
};

JkJsonJSONEncoder.prototype.CTOR_JkJsonJSONEncoder = function() {
	this.mysb = null;
	this.isNewLine = true;
	this.encodeNullAsNull = false;
	this.newJSONFormat = true;
	this.stringFormattedNumber = false;
	this.stringFormattedBoolean = false;
	this.niceFormatting = true;
	return this;
};

JkJsonJSONEncoder.prototype.print = function(line, indent, startline, endline, sb) {
	if(startline && this.isNewLine == false) {
		if(this.niceFormatting) {
			sb.appendCharacter('\n'.charCodeAt());
		}
		this.isNewLine = true;
	}
	if(this.isNewLine && this.niceFormatting) {
		for(var n = 0 ; n < indent ; n++) {
			sb.appendCharacter('\t'.charCodeAt());
		}
	}
	sb.appendString(line);
	if(endline) {
		if(this.niceFormatting) {
			sb.appendCharacter('\n'.charCodeAt());
		}
		this.isNewLine = true;
	}
	else {
		this.isNewLine = false;
	}
};

JkJsonJSONEncoder.prototype.encodeArray = function(cc, indent, sb) {
	this.print("[", indent, false, true, sb);
	var first = true;
	if(cc != null) {
		var n = 0;
		var m = cc.length;
		for(n = 0 ; n < m ; n++) {
			var o = cc[n];
			if(o != null) {
				if(first == false) {
					this.print(",", indent, false, true, sb);
				}
				this.encodeObject(o, (indent + 1), sb);
				first = false;
			}
		}
	}
	this.print("]", indent, true, false, sb);
};

JkJsonJSONEncoder.prototype.encodeDynamicVector = function(cc, indent, sb) {
	this.print("[", indent, false, true, sb);
	var first = true;
	var array = cc.toVector();
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var o = array[n];
			if(o != null) {
				if(first == false) {
					this.print(",", indent, false, true, sb);
				}
				this.encodeObject(o, (indent + 1), sb);
				first = false;
			}
		}
	}
	this.print("]", indent, true, false, sb);
};

JkJsonJSONEncoder.prototype.encodeVector = function(cc, indent, sb) {
	this.print("[", indent, false, true, sb);
	var first = true;
	if(cc != null) {
		var n = 0;
		var m = cc.length;
		for(n = 0 ; n < m ; n++) {
			var o = cc[n];
			if(o != null) {
				if(first == false) {
					this.print(",", indent, false, true, sb);
				}
				this.encodeObject(o, (indent + 1), sb);
				first = false;
			}
		}
	}
	this.print("]", indent, true, false, sb);
};

JkJsonJSONEncoder.prototype.encodeMap = function(map, indent, sb) {
	this.print("{", indent, false, true, sb);
	var first = true;
	var it = JkLangMap.iterateKeys(map);
	while(it != null){
		var keyo = it.next();
		if(!(keyo != null)) {
			break;
		}
		var key = JkLangString.asString(keyo);
		if(!(key != null)) {
			continue;
		}
		if(!first) {
			this.print(",", indent, false, true, sb);
		}
		this.encodeString(key, (indent + 1), sb);
		if(this.niceFormatting) {
			sb.appendString(" : ");
		}
		else {
			sb.appendCharacter(':'.charCodeAt());
		}
		this.encodeObject((map.get(keyo)), (indent + 1), sb);
		first = false;
	}
	this.print("}", indent, true, false, sb);
};

JkJsonJSONEncoder.prototype.encodeDynamicMap = function(map, indent, sb) {
	this.print("{", indent, false, true, sb);
	var first = true;
	var it = map.iterateKeys();
	while(it != null){
		var key = it.next();
		if(!(key != null)) {
			break;
		}
		if(first == false) {
			this.print(",", indent, false, true, sb);
		}
		this.encodeString(key, (indent + 1), sb);
		if(this.niceFormatting) {
			sb.appendString(" : ");
		}
		else {
			sb.appendCharacter(':'.charCodeAt());
		}
		this.encodeObject((map.get(key)), (indent + 1), sb);
		first = false;
	}
	this.print("}", indent, true, false, sb);
};

JkJsonJSONEncoder.prototype.encodeKeyValueList = function(list, indent, sb) {
	this.print("{", indent, false, true, sb);
	var first = true;
	var it = list.iterate();
	while(it != null){
		var pair = it.next();
		if(pair == null) {
			break;
		}
		if(first == false) {
			this.print(",", indent, false, true, sb);
		}
		this.encodeString(pair.key, (indent + 1), sb);
		if(this.niceFormatting) {
			sb.appendString(" : ");
		}
		else {
			sb.appendCharacter(':'.charCodeAt());
		}
		this.encodeString(pair.value, (indent + 1), sb);
		first = false;
	}
	this.print("}", indent, true, false, sb);
};

JkJsonJSONEncoder.prototype.encodeString = function(s, indent, sb) {
	if(this.mysb == null) {
		this.mysb = JkLangStringBuilder.NEW();
	}
	else {
		this.mysb.clear();
	}
	this.mysb.appendCharacter('\"'.charCodeAt());
	var it = JkLangString.iterate(s);
	while(true){
		var c = it.getNextChar();
		if(JkLangCharacter.isEOF(c)) {
			break;
		}
		if(this.newJSONFormat) {
			if(c == '\t'.charCodeAt()) {
				this.mysb.appendString("\\t");
				continue;
			}
			if(c == '\n'.charCodeAt()) {
				this.mysb.appendString("\\n");
				continue;
			}
			if(c == '\r'.charCodeAt()) {
				this.mysb.appendString("\\r");
				continue;
			}
			if(c == '\b'.charCodeAt()) {
				this.mysb.appendString("\\b");
				continue;
			}
			if(c == '\f'.charCodeAt()) {
				this.mysb.appendString("\\f");
				continue;
			}
		}
		if(c == '\"'.charCodeAt()) {
			this.mysb.appendCharacter('\\'.charCodeAt());
		}
		else if(c == '\\'.charCodeAt()) {
			this.mysb.appendCharacter('\\'.charCodeAt());
		}
		this.mysb.appendCharacter(c);
	}
	this.mysb.appendCharacter('\"'.charCodeAt());
	this.print((this.mysb.toString()), indent, false, false, sb);
};

JkJsonJSONEncoder.prototype.encodeBoolean = function(b, indent, sb) {
	if(this.mysb == null) {
		this.mysb = JkLangStringBuilder.NEW();
	}
	else {
		this.mysb.clear();
	}
	if(this.stringFormattedBoolean) {
		this.mysb.appendCharacter('\"'.charCodeAt());
		this.mysb.appendString((JkLangString.forBoolean(b)));
		this.mysb.appendCharacter('\"'.charCodeAt());
	}
	else {
		this.mysb.appendString((JkLangString.forBoolean(b)));
	}
	this.print((this.mysb.toString()), indent, false, false, sb);
};

JkJsonJSONEncoder.prototype.encodeNumber = function(o2, indent, sb) {
	if(this.mysb == null) {
		this.mysb = JkLangStringBuilder.NEW();
	}
	else {
		this.mysb.clear();
	}
	if(this.stringFormattedNumber) {
		this.mysb.appendCharacter('\"'.charCodeAt());
		this.mysb.appendString((JkLangString.asString(o2)));
		this.mysb.appendCharacter('\"'.charCodeAt());
	}
	else if(JkLangIntegerObject.IS_INSTANCE && JkLangIntegerObject.IS_INSTANCE(o2)) {
		this.mysb.appendInteger((JkLangInteger.asInteger(o2)));
	}
	else if((function(o) {
		if(JkLangLongIntegerObject.IS_INSTANCE && JkLangLongIntegerObject.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(o2) != null) {
		this.mysb.appendLong((JkLangLongInteger.asLong(o2)));
	}
	else if((function(o1) {
		if(JkLangDoubleObject.IS_INSTANCE && JkLangDoubleObject.IS_INSTANCE(o1)) {
			return o1;
		}
		return null;
	}.bind(this))(o2) != null) {
		this.mysb.appendDouble((JkLangDouble.asDouble(o2)));
	}
	else {
		this.mysb.appendString("");
	}
	this.print((this.mysb.toString()), indent, false, false, sb);
};

JkJsonJSONEncoder.prototype.encodeObject = function(o, indent, sb) {
	if(!(o != null)) {
		if(this.encodeNullAsNull) {
			this.print("null", indent, false, false, sb);
		}
		else {
			this.encodeString("", indent, sb);
		}
	}
	else if(JkJsonJSONObject.IS_INSTANCE && JkJsonJSONObject.IS_INSTANCE(o)) {
		this.encodeObject((o.toJsonObject()), indent, sb);
	}
	else if(o instanceof Array) {
		this.encodeArray(o, indent, sb);
	}
	else if(o instanceof Array) {
		this.encodeVector(o, indent, sb);
	}
	else if(o instanceof Map) {
		this.encodeMap(o, indent, sb);
	}
	else if(o instanceof ArrayBuffer) {
		this.encodeString((JkBase64Base64Encoder.encode(o)), indent, sb);
	}
	else if(typeof(o) === 'string') {
		this.encodeString(o, indent, sb);
	}
	else if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
		this.encodeDynamicMap(o, indent, sb);
	}
	else if(JkLangDynamicVector.IS_INSTANCE && JkLangDynamicVector.IS_INSTANCE(o)) {
		this.encodeDynamicVector(o, indent, sb);
	}
	else if(JkLangKeyValueListForStrings.IS_INSTANCE && JkLangKeyValueListForStrings.IS_INSTANCE(o)) {
		this.encodeKeyValueList(o, indent, sb);
	}
	else if(JkLangStringObject.IS_INSTANCE && JkLangStringObject.IS_INSTANCE(o)) {
		this.encodeString((o.toString()), indent, sb);
	}
	else if(JkLangBufferObject.IS_INSTANCE && JkLangBufferObject.IS_INSTANCE(o)) {
		this.encodeString((JkBase64Base64Encoder.encode((o.toBuffer()))), indent, sb);
	}
	else if(JkLangArrayObject.IS_INSTANCE && JkLangArrayObject.IS_INSTANCE(o)) {
		var aa = o.toArray();
		this.encodeArray(aa, indent, sb);
	}
	else if(JkLangVectorObject.IS_INSTANCE && JkLangVectorObject.IS_INSTANCE(o)) {
		var vv = o.toVector();
		this.encodeVector(vv, indent, sb);
	}
	else if(JkLangIntegerObject.IS_INSTANCE && JkLangIntegerObject.IS_INSTANCE(o) || JkLangLongIntegerObject.IS_INSTANCE && JkLangLongIntegerObject.IS_INSTANCE(o) || JkLangDoubleObject.IS_INSTANCE && JkLangDoubleObject.IS_INSTANCE(o)) {
		this.encodeNumber(o, indent, sb);
	}
	else if(JkLangCharacterObject.IS_INSTANCE && JkLangCharacterObject.IS_INSTANCE(o)) {
		this.encodeString((JkLangString.asString(o)), indent, sb);
	}
	else if(JkLangBooleanObject.IS_INSTANCE && JkLangBooleanObject.IS_INSTANCE(o)) {
		this.encodeBoolean((JkLangBoolean.asBoolean(o, false)), indent, sb);
	}
	else {
		this.encodeString("", indent, sb);
	}
};

JkJsonJSONEncoder.encode = function(o, niceFormatting, stringFormattedNumber) {
	var v = JkJsonJSONEncoder.NEW();
	v.setStringFormattedBoolean(true);
	v.setStringFormattedNumber(stringFormattedNumber);
	v.setNiceFormatting(niceFormatting);
	return v.execute(o);
};

JkJsonJSONEncoder.prototype.execute = function(o) {
	var sb = JkLangStringBuilder.NEW();
	this.encodeObject(o, 0, sb);
	return sb.toString();
};

JkJsonJSONEncoder.encodeToBuilder = function(o, sb) {
	if(!(sb != null)) {
		return;
	}
	var str = JkJsonJSONEncoder.NEW().setEncodeNullAsNull(true).execute(o);
	if(str != null) {
		sb.appendString(str);
	}
};

JkJsonJSONEncoder.toString = function(o) {
	var v = JkJsonJSONEncoder.NEW();
	v.setStringFormattedBoolean(false);
	v.setStringFormattedNumber(false);
	v.setNiceFormatting(true);
	v.setEncodeNullAsNull(true);
	return v.execute(o);
};

JkJsonJSONEncoder.toCompactString = function(o) {
	var v = JkJsonJSONEncoder.NEW();
	v.setStringFormattedBoolean(false);
	v.setStringFormattedNumber(false);
	v.setNiceFormatting(false);
	v.setEncodeNullAsNull(true);
	return v.execute(o);
};

JkJsonJSONEncoder.prototype.getNiceFormatting = function() {
	return this.niceFormatting;
};

JkJsonJSONEncoder.prototype.setNiceFormatting = function(v) {
	this.niceFormatting = v;
	return this;
};

JkJsonJSONEncoder.prototype.getStringFormattedBoolean = function() {
	return this.stringFormattedBoolean;
};

JkJsonJSONEncoder.prototype.setStringFormattedBoolean = function(v) {
	this.stringFormattedBoolean = v;
	return this;
};

JkJsonJSONEncoder.prototype.getStringFormattedNumber = function() {
	return this.stringFormattedNumber;
};

JkJsonJSONEncoder.prototype.setStringFormattedNumber = function(v) {
	this.stringFormattedNumber = v;
	return this;
};

JkJsonJSONEncoder.prototype.getNewJSONFormat = function() {
	return this.newJSONFormat;
};

JkJsonJSONEncoder.prototype.setNewJSONFormat = function(v) {
	this.newJSONFormat = v;
	return this;
};

JkJsonJSONEncoder.prototype.getEncodeNullAsNull = function() {
	return this.encodeNullAsNull;
};

JkJsonJSONEncoder.prototype.setEncodeNullAsNull = function(v) {
	this.encodeNullAsNull = v;
	return this;
};

JkJsonJSONEncoder.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkJsonJSONEncoder"] === true;
};

let JkJsonJSONObjectAdapter = function() {};

JkJsonJSONObjectAdapter.prototype._t = {
	"JkJsonJSONObject" : true,
	"JkJsonJSONObjectAdapter" : true
};
JkJsonJSONObjectAdapter.prototype._tobj = JkJsonJSONObjectAdapter;

JkJsonJSONObjectAdapter.NEW = function() {
	var v = new JkJsonJSONObjectAdapter;
	return v.CTOR_JkJsonJSONObjectAdapter();
};

JkJsonJSONObjectAdapter.prototype.CTOR_JkJsonJSONObjectAdapter = function() {
	return this;
};

JkJsonJSONObjectAdapter.prototype.asJsonValue = function(value) {
	if(!(value != null)) {
		return null;
	}
	if(JkJsonJSONObject.IS_INSTANCE && JkJsonJSONObject.IS_INSTANCE(value)) {
		var oj = value;
		return oj.toJsonObject();
	}
	return value;
};

JkJsonJSONObjectAdapter.prototype.toDynamicMap = function() {
	return (function(o) {
		if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((this.toJsonObject()));
};

JkJsonJSONObjectAdapter.prototype.toObjectMap = function() {
	var dm = this.toDynamicMap();
	if(!(dm != null)) {
		return null;
	}
	return dm.toObjectMap();
};

JkJsonJSONObjectAdapter.prototype.toJsonObject = function() {};

JkJsonJSONObjectAdapter.prototype.fromJsonObject = function(o) {};

JkJsonJSONObjectAdapter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkJsonJSONObjectAdapter"] === true;
};

let JkJsonJSONParserNullObject = function() {};

JkJsonJSONParserNullObject.prototype._t = { "JkJsonJSONParserNullObject" : true };
JkJsonJSONParserNullObject.prototype._tobj = JkJsonJSONParserNullObject;

JkJsonJSONParserNullObject.NEW = function() {
	var v = new JkJsonJSONParserNullObject;
	return v.CTOR_JkJsonJSONParserNullObject();
};

JkJsonJSONParserNullObject.prototype.CTOR_JkJsonJSONParserNullObject = function() {
	return this;
};

JkJsonJSONParserNullObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkJsonJSONParserNullObject"] === true;
};

let JkJsonJSONParser = function() {
	this.iterator = null;
};

JkJsonJSONParser.prototype._t = { "JkJsonJSONParser" : true };
JkJsonJSONParser.prototype._tobj = JkJsonJSONParser;

JkJsonJSONParser.NEW = function() {
	var v = new JkJsonJSONParser;
	return v.CTOR_JkJsonJSONParser();
};

JkJsonJSONParser.prototype.CTOR_JkJsonJSONParser = function() {
	this.iterator = null;
	return this;
};

JkJsonJSONParser.parse = function(data) {
	if(!(data != null)) {
		return null;
	}
	if(data instanceof ArrayBuffer) {
		return JkJsonJSONParser.parseBuffer(data);
	}
	if(typeof(data) === 'string') {
		return JkJsonJSONParser.parseString(data);
	}
	if(JkFsFile.IS_INSTANCE && JkFsFile.IS_INSTANCE(data)) {
		return JkJsonJSONParser.parseFile(data);
	}
	return null;
};

JkJsonJSONParser.parseBuffer = function(buffer) {
	if(buffer == null) {
		return null;
	}
	return JkJsonJSONParser.forBuffer(buffer).acceptObject();
};

JkJsonJSONParser.parseString = function(str) {
	if(JkLangString.isEmpty(str)) {
		return null;
	}
	return JkJsonJSONParser.forString(str).acceptObject();
};

JkJsonJSONParser.parseFile = function(file) {
	if(file == null) {
		return null;
	}
	return JkJsonJSONParser.parseString((file.getContentsUTF8()));
};

JkJsonJSONParser.forString = function(str) {
	var v = JkJsonJSONParser.NEW();
	v.setDataString(str);
	return v;
};

JkJsonJSONParser.forBuffer = function(buffer) {
	var v = JkJsonJSONParser.NEW();
	v.setDataBuffer(buffer);
	return v;
};

JkJsonJSONParser.prototype.setDataString = function(str) {
	this.iterator = JkLangCharacterIteratorForString.forString(str);
	this.iterator.moveToNextChar();
};

JkJsonJSONParser.prototype.setDataBuffer = function(buffer) {
	this.iterator = JkLangCharacterIteratorForBuffer.forBuffer(buffer);
	this.iterator.moveToNextChar();
};

JkJsonJSONParser.prototype.skipSpaces = function() {
	while(true){
		if(this.iterator.hasEnded()) {
			break;
		}
		var c = this.iterator.getCurrentChar();
		if(c == ' '.charCodeAt() || c == '\t'.charCodeAt() || c == '\r'.charCodeAt() || c == '\n'.charCodeAt()) {
			this.iterator.moveToNextChar();
			continue;
		}
		break;
	}
};

JkJsonJSONParser.prototype.acceptChar = function(c) {
	this.skipSpaces();
	if(this.iterator.getCurrentChar() == c) {
		this.iterator.moveToNextChar();
		return true;
	}
	return false;
};

JkJsonJSONParser.prototype.acceptString = function() {
	this.skipSpaces();
	var ss = this.iterator.getCurrentChar();
	if(ss != '\''.charCodeAt() && ss != '\"'.charCodeAt()) {
		return null;
	}
	var i = 0;
	var sb = JkLangStringBuilder.NEW();
	while(true){
		var c = this.iterator.getNextChar();
		i++;
		if(JkLangCharacter.isEOF(c)) {
			for(var n = 0 ; n < i ; n++) {
				this.iterator.moveToPreviousChar();
			}
			return null;
		}
		if(c == ss) {
			this.iterator.moveToNextChar();
			break;
		}
		if(c == '\\'.charCodeAt()) {
			c = this.iterator.getNextChar();
			if(c == 'u'.charCodeAt()) {
				var v = JkLangStringBuilder.NEW();
				var x = 0;
				while(x < 4){
					if(this.iterator.hasEnded()) {
						break;
					}
					v.appendCharacter((this.iterator.getNextChar()));
					x++;
				}
				c = JkLangString.toIntegerFromHex((v.toString()));
			}
			else if(c == 't'.charCodeAt()) {
				c = '\t'.charCodeAt();
			}
			else if(c == 'r'.charCodeAt()) {
				c = '\r'.charCodeAt();
			}
			else if(c == 'n'.charCodeAt()) {
				c = '\n'.charCodeAt();
			}
			else if(c == 'b'.charCodeAt()) {
				c = '\b'.charCodeAt();
			}
			else if(c == 'f'.charCodeAt()) {
				c = '\f'.charCodeAt();
			}
		}
		sb.appendCharacter(c);
	}
	return sb.toString();
};

JkJsonJSONParser.prototype.acceptBoolean = function() {
	this.skipSpaces();
	var ss = this.iterator.getCurrentChar();
	if(ss != 't'.charCodeAt() && ss != 'f'.charCodeAt()) {
		return null;
	}
	var sb = JkLangStringBuilder.NEW();
	sb.appendCharacter(ss);
	var li = 5;
	if(ss == 't'.charCodeAt()) {
		li = 4;
	}
	var btc = 0;
	while(true){
		var c = this.iterator.getNextChar();
		btc++;
		if(c != 'a'.charCodeAt() && c != 'l'.charCodeAt() && c != 's'.charCodeAt() && c != 'e'.charCodeAt() && c != 'r'.charCodeAt() && c != 'u'.charCodeAt()) {
			this.iterator.moveToNextChar();
			btc++;
			break;
		}
		sb.appendCharacter(c);
		if(sb.count() == li) {
			this.iterator.moveToNextChar();
			btc++;
			break;
		}
	}
	var v = sb.toString();
	if(li == 4 && "true" == v) {
		return JkLangBoolean.asObject(true);
	}
	if(li == 5 && "false" == v) {
		return JkLangBoolean.asObject(false);
	}
	var i = 0;
	while(i < btc){
		this.iterator.moveToPreviousChar();
		i++;
	}
	return null;
};

JkJsonJSONParser.prototype.acceptNumber = function() {
	this.skipSpaces();
	var ss = this.iterator.getCurrentChar();
	if(ss != '-'.charCodeAt() && ss != '+'.charCodeAt() && ss != '.'.charCodeAt() && (ss < '0'.charCodeAt() || ss > '9'.charCodeAt())) {
		return null;
	}
	var sb = JkLangStringBuilder.NEW();
	sb.appendCharacter(ss);
	while(true){
		var c = this.iterator.getNextChar();
		if(c != '.'.charCodeAt() && c != 'e'.charCodeAt() && c != 'E'.charCodeAt() && c != '-'.charCodeAt() && (c < '0'.charCodeAt() || c > '9'.charCodeAt())) {
			break;
		}
		sb.appendCharacter(c);
	}
	var s = sb.toString();
	if(JkLangString.getIndexOfCharacter(s, '.'.charCodeAt(), 0) > -1) {
		return JkLangDouble.asObject((JkLangDouble.asDouble(s)));
	}
	var value = JkLangString.toLong(s);
	if(value >= -2147483648 && value <= 2147483647) {
		return JkLangInteger.asObject((~(~value)));
	}
	return JkLangLongInteger.asObject(value);
};

JkJsonJSONParser.prototype.acceptNull = function() {
	this.skipSpaces();
	var ss = this.iterator.getCurrentChar();
	if(ss != 'n'.charCodeAt()) {
		return null;
	}
	var sb = JkLangStringBuilder.NEW();
	sb.appendCharacter(ss);
	var btc = 0;
	while(true){
		var c = this.iterator.getNextChar();
		btc++;
		if(c != 'u'.charCodeAt() && c != 'l'.charCodeAt()) {
			this.iterator.moveToNextChar();
			btc++;
			break;
		}
		sb.appendCharacter(c);
		if(sb.count() == 4) {
			this.iterator.moveToNextChar();
			btc++;
			break;
		}
	}
	if("null" == sb.toString()) {
		return JkJsonJSONParserNullObject.NEW();
	}
	var i = 0;
	while(i < btc){
		this.iterator.moveToPreviousChar();
		i++;
	}
	return null;
};

JkJsonJSONParser.prototype.acceptObject = function() {
	if(this.acceptChar('['.charCodeAt())) {
		var v = JkLangDynamicVector.NEW();
		while(true){
			if(this.acceptChar(']'.charCodeAt())) {
				break;
			}
			var o = this.acceptObject();
			if(o == null) {
				return null;
			}
			v.appendObject(o);
			this.acceptChar(','.charCodeAt());
		}
		return v;
	}
	if(this.acceptChar('{'.charCodeAt())) {
		var v1 = JkLangDynamicMap.NEW();
		while(true){
			if(this.acceptChar('}'.charCodeAt())) {
				break;
			}
			var key = this.acceptString();
			if(key == null) {
				return null;
			}
			if(this.acceptChar(':'.charCodeAt()) == false) {
				return null;
			}
			var val = this.acceptObject();
			if(val == null) {
				return null;
			}
			if(JkJsonJSONParserNullObject.IS_INSTANCE && JkJsonJSONParserNullObject.IS_INSTANCE(val)) {
				v1.setObject(key, null);
			}
			else {
				v1.setObject(key, val);
			}
			this.acceptChar(','.charCodeAt());
		}
		return v1;
	}
	var s = this.acceptString();
	if(s != null) {
		return s;
	}
	var b = this.acceptBoolean();
	if(b != null) {
		return b;
	}
	var n = this.acceptNull();
	if(n != null) {
		return n;
	}
	var v2 = this.acceptNumber();
	if(v2 != null) {
		return v2;
	}
	return null;
};

JkJsonJSONParser.prototype.getNextToken = function() {
	if(this.acceptChar('['.charCodeAt())) {
		return "[";
	}
	if(this.acceptChar(']'.charCodeAt())) {
		return "]";
	}
	if(this.acceptChar('{'.charCodeAt())) {
		return "{";
	}
	if(this.acceptChar('}'.charCodeAt())) {
		return "}";
	}
	if(this.acceptChar(','.charCodeAt())) {
		return ",";
	}
	var s = this.acceptString();
	if(s != null) {
		return s;
	}
	var b = this.acceptBoolean();
	if(b != null) {
		return b;
	}
	var n = this.acceptNull();
	if(n != null) {
		return n;
	}
	var v = this.acceptNumber();
	if(v != null) {
		return v;
	}
	return null;
};

JkJsonJSONParser.prototype.pushData = function(string) {
	if(!(string != null)) {
		return;
	}
	if(this.iterator == null) {
		this.setDataString(string);
		return;
	}
	var sb = JkLangStringBuilder.NEW();
	while(true){
		var c = this.iterator.getNextChar();
		if(JkLangCharacter.isEOF(c)) {
			break;
		}
		sb.appendCharacter(c);
	}
	sb.appendString(string);
	this.setDataString((sb.toString()));
};

JkJsonJSONParser.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkJsonJSONParser"] === true;
};
