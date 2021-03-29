let JkSlonSLONParserParseError = function() {
	JkLangException.call(this);
	this._iterator = null;
	this._expected = null;
	this.lineNumber = 0;
	this.columnNumber = 0;
	this.lineString = null;
};

JkSlonSLONParserParseError.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkLangException.prototype);
JkSlonSLONParserParseError.prototype.constructor = JkSlonSLONParserParseError;
JkSlonSLONParserParseError.prototype._t = {
	"JkSlonSLONParserParseError" : true,
	"JkLangException" : true,
	"JkLangStringObject" : true
};
JkSlonSLONParserParseError.prototype._tobj = JkSlonSLONParserParseError;

JkSlonSLONParserParseError.NEW = function() {
	var v = new JkSlonSLONParserParseError;
	return v.CTOR_JkSlonSLONParserParseError();
};

JkSlonSLONParserParseError.prototype.CTOR_JkSlonSLONParserParseError = function() {
	this.lineString = null;
	this.columnNumber = 0;
	this.lineNumber = 0;
	this._expected = null;
	this._iterator = null;
	if(JkLangException.prototype.CTOR_JkLangException.call(this) == null) {
		return null;
	}
	return this;
};

JkSlonSLONParserParseError.prototype.computeData = function() {
	var opos = this.getIterator().getCurrentPosition();
	this.lineNumber = 0;
	this.columnNumber = 0;
	this.getIterator().setCurrentPosition(0);
	while(true){
		if(this.getIterator().getCurrentPosition() >= opos) {
			break;
		}
		if(this.getIterator().getCurrentChar() == '\n'.charCodeAt()) {
			this.lineNumber++;
			this.columnNumber = 0;
		}
		else {
			this.columnNumber++;
		}
		this.getIterator().moveToNextChar();
	}
	this.getIterator().setCurrentPosition(opos);
	while(true){
		if(this.getIterator().getCurrentPosition() < 1) {
			break;
		}
		this.getIterator().moveToPreviousChar();
		if(this.getIterator().getCurrentChar() == '\n'.charCodeAt()) {
			this.getIterator().moveToNextChar();
			break;
		}
	}
	var sb = JkLangStringBuilder.NEW();
	while(true){
		var c = this.getIterator().getCurrentChar();
		if(JkLangCharacter.isEOF(c)) {
			break;
		}
		if(c == '\n'.charCodeAt()) {
			break;
		}
		if(c == '\t'.charCodeAt()) {
			sb.appendCharacter(' '.charCodeAt());
		}
		else {
			sb.appendCharacter(c);
		}
		this.getIterator().moveToNextChar();
	}
	this.lineString = sb.toString();
	this.getIterator().setCurrentPosition(opos);
};

JkSlonSLONParserParseError.prototype.toString = function() {
	if(!(this.lineString != null)) {
		this.computeData();
	}
	var sb = JkLangStringBuilder.NEW();
	for(var n = 0 ; n < this.columnNumber ; n++) {
		sb.appendCharacter(' '.charCodeAt());
	}
	sb.appendCharacter('^'.charCodeAt());
	return "line=" + (JkLangString.safeString((JkLangString.safeString((JkLangString.forInteger((this.lineNumber + 1))))))) + (", col=") + (JkLangString.safeString((JkLangString.safeString((JkLangString.forInteger((this.columnNumber + 1))))))) + (", expected=`") + (JkLangString.safeString((JkLangString.safeString((this.getExpected()))))) + ("'\n") + (JkLangString.safeString((JkLangString.safeString(this.lineString)))) + ("\n") + (JkLangString.safeString((JkLangString.safeString((sb.toString())))));
};

JkSlonSLONParserParseError.prototype.getIterator = function() {
	return this._iterator;
};

JkSlonSLONParserParseError.prototype.doSetIterator = function(value) {
	this._iterator = value;
};

JkSlonSLONParserParseError.prototype.setIterator = function(v) {
	this.doSetIterator(v);
	return v;
};

JkSlonSLONParserParseError.prototype.getExpected = function() {
	return this._expected;
};

JkSlonSLONParserParseError.prototype.doSetExpected = function(value) {
	this._expected = value;
};

JkSlonSLONParserParseError.prototype.setExpected = function(v) {
	this.doSetExpected(v);
	return v;
};

JkSlonSLONParserParseError.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSlonSLONParserParseError"] === true;
};

let JkSlonSLONParserNullObject = function() {};

JkSlonSLONParserNullObject.prototype._t = { "JkSlonSLONParserNullObject" : true };
JkSlonSLONParserNullObject.prototype._tobj = JkSlonSLONParserNullObject;

JkSlonSLONParserNullObject.NEW = function() {
	var v = new JkSlonSLONParserNullObject;
	return v.CTOR_JkSlonSLONParserNullObject();
};

JkSlonSLONParserNullObject.prototype.CTOR_JkSlonSLONParserNullObject = function() {
	return this;
};

JkSlonSLONParserNullObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSlonSLONParserNullObject"] === true;
};

let JkSlonSLONParser = function() {
	this.iterator = null;
};

JkSlonSLONParser.prototype._t = { "JkSlonSLONParser" : true };
JkSlonSLONParser.prototype._tobj = JkSlonSLONParser;

JkSlonSLONParser.NEW = function() {
	var v = new JkSlonSLONParser;
	return v.CTOR_JkSlonSLONParser();
};

JkSlonSLONParser.prototype.CTOR_JkSlonSLONParser = function() {
	this.iterator = null;
	return this;
};

JkSlonSLONParser.parse = function(data) {
	if(!(data != null)) {
		return null;
	}
	if(data instanceof ArrayBuffer) {
		return JkSlonSLONParser.parseBuffer(data);
	}
	if(typeof(data) === 'string') {
		return JkSlonSLONParser.parseString(data);
	}
	if(JkFsFile.IS_INSTANCE && JkFsFile.IS_INSTANCE(data)) {
		return JkSlonSLONParser.parseFile(data);
	}
	return null;
};

JkSlonSLONParser.parseBuffer = function(buffer) {
	if(buffer == null) {
		return null;
	}
	return JkSlonSLONParser.forBuffer(buffer).tryAcceptObject();
};

JkSlonSLONParser.parseString = function(str) {
	if(JkLangString.isEmpty(str)) {
		return null;
	}
	return JkSlonSLONParser.forString(str).tryAcceptObject();
};

JkSlonSLONParser.parseFile = function(file) {
	if(file == null) {
		return null;
	}
	return JkSlonSLONParser.forFile(file).tryAcceptObject();
};

JkSlonSLONParser.forString = function(str) {
	var v = JkSlonSLONParser.NEW();
	v.setDataString(str);
	return v;
};

JkSlonSLONParser.forBuffer = function(buffer) {
	var v = JkSlonSLONParser.NEW();
	v.setDataBuffer(buffer);
	return v;
};

JkSlonSLONParser.forFile = function(file) {
	var v = JkSlonSLONParser.NEW();
	if(file != null) {
		v.setDataString((file.getContentsUTF8()));
	}
	return v;
};

JkSlonSLONParser.prototype.setDataString = function(str) {
	this.iterator = JkLangCharacterIteratorForString.forString(str);
	this.iterator.moveToNextChar();
};

JkSlonSLONParser.prototype.setDataBuffer = function(buffer) {
	this.iterator = JkLangCharacterIteratorForBuffer.forBuffer(buffer);
	this.iterator.moveToNextChar();
};

JkSlonSLONParser.prototype.skipSpaces = function() {
	while(true){
		if(this.iterator.hasEnded()) {
			break;
		}
		var c = this.iterator.getCurrentChar();
		if(c == ' '.charCodeAt() || c == '\t'.charCodeAt() || c == '\r'.charCodeAt() || c == '\n'.charCodeAt()) {
			this.iterator.moveToNextChar();
			continue;
		}
		if(c == '#'.charCodeAt()) {
			this.iterator.moveToNextChar();
			while(true){
				if(this.iterator.hasEnded()) {
					break;
				}
				var cc = this.iterator.getCurrentChar();
				this.iterator.moveToNextChar();
				if(JkLangCharacter.isEOF(cc) || cc == '\n'.charCodeAt()) {
					break;
				}
			}
			continue;
		}
		break;
	}
};

JkSlonSLONParser.prototype.acceptChar = function(c) {
	this.skipSpaces();
	if(this.iterator.getCurrentChar() == c) {
		this.iterator.moveToNextChar();
		return true;
	}
	return false;
};

JkSlonSLONParser.prototype.acceptDoubleQuotedString = function() {
	this.skipSpaces();
	var ss = this.iterator.getCurrentChar();
	if(ss != '\"'.charCodeAt()) {
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

JkSlonSLONParser.prototype.acceptBoolean = function() {
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

JkSlonSLONParser.prototype.acceptNumber = function() {
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

JkSlonSLONParser.prototype.acceptNull = function() {
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
		return JkSlonSLONParserNullObject.NEW();
	}
	var i = 0;
	while(i < btc){
		this.iterator.moveToPreviousChar();
		i++;
	}
	return null;
};

JkSlonSLONParser.prototype.isIdentifierCharacter = function(ss) {
	if(ss == 0 || ss == ' '.charCodeAt() || ss == '\r'.charCodeAt() || ss == '\n'.charCodeAt() || ss == '\t'.charCodeAt()) {
		return false;
	}
	return true;
};

JkSlonSLONParser.prototype.acceptIdentifier = function() {
	this.skipSpaces();
	var ss = this.iterator.getCurrentChar();
	if(ss == '['.charCodeAt()) {
		var sb = JkLangStringBuilder.NEW();
		while(true){
			var c = this.iterator.getNextChar();
			if(JkLangCharacter.isEOF(c) || c == ']'.charCodeAt()) {
				break;
			}
			sb.appendCharacter(c);
		}
		return sb.toString();
	}
	if(this.isIdentifierCharacter(ss)) {
		var sb1 = JkLangStringBuilder.NEW();
		sb1.appendCharacter(ss);
		while(true){
			var c1 = this.iterator.getNextChar();
			if(JkLangCharacter.isEOF(c1) || !this.isIdentifierCharacter(c1)) {
				break;
			}
			sb1.appendCharacter(c1);
		}
		return sb1.toString();
	}
	return null;
};

JkSlonSLONParser.prototype.expectIdentifier = function() {
	var v = this.acceptIdentifier();
	if(!(v != null)) {
		this.throwExpectationError("identifier");
	}
	return v;
};

JkSlonSLONParser.prototype.throwExpectationError = function(expected) {
	var pe = JkSlonSLONParserParseError.NEW();
	pe.setIterator(this.iterator);
	pe.setExpected(expected);
	throw pe;
};

JkSlonSLONParser.prototype.expectObject = function() {
	var v = this.acceptObject();
	if(!(v != null)) {
		this.throwExpectationError("object");
	}
	return v;
};

JkSlonSLONParser.prototype.countIndents = function(str) {
	if(!(str != null)) {
		return 0;
	}
	var it = JkLangString.iterate(str);
	var v = 0;
	while(true){
		var c = it.getNextChar();
		if(c == ' '.charCodeAt() || c == '\t'.charCodeAt()) {
			v++;
		}
		else {
			break;
		}
	}
	return v;
};

JkSlonSLONParser.prototype.stripLongStringIndentation = function(str) {
	if(!(str != null)) {
		return null;
	}
	var commonIndents = -1;
	var lines = JkLangString.split(str, '\n'.charCodeAt(), 0);
	var vsize = JkLangVector.getSize(lines);
	var removedLastLine = false;
	if(vsize > 0) {
		var lastLine = JkLangVector.get(lines, (vsize - 1));
		if(lastLine != null && this.countIndents(lastLine) == JkLangString.getLength(lastLine)) {
			JkLangVector.remove(lines, (vsize - 1));
			removedLastLine = true;
		}
	}
	if(lines != null) {
		var n = 0;
		var m = lines.length;
		for(n = 0 ; n < m ; n++) {
			var line = lines[n];
			if(line != null) {
				var indents = this.countIndents(line);
				if(commonIndents < 0 || indents < commonIndents) {
					commonIndents = indents;
				}
			}
		}
	}
	if(commonIndents < 1) {
		return str;
	}
	var sb = JkLangStringBuilder.NEW();
	if(lines != null) {
		var n2 = 0;
		var m2 = lines.length;
		for(n2 = 0 ; n2 < m2 ; n2++) {
			var line1 = lines[n2];
			if(line1 != null) {
				if(sb.count() > 0) {
					sb.appendCharacter('\n'.charCodeAt());
				}
				sb.appendString((JkLangString.getEndOfString(line1, commonIndents)));
			}
		}
	}
	if(removedLastLine) {
		sb.appendCharacter('\n'.charCodeAt());
	}
	return sb.toString();
};

JkSlonSLONParser.prototype.parseLongString = function() {
	var sb = JkLangStringBuilder.NEW();
	if(this.iterator.getCurrentChar() == '\n'.charCodeAt()) {
		this.iterator.moveToNextChar();
	}
	while(true){
		var c = this.iterator.getCurrentChar();
		this.iterator.moveToNextChar();
		if(JkLangCharacter.isEOF(c)) {
			this.throwExpectationError("]]");
		}
		if(c == ']'.charCodeAt()) {
			c = this.iterator.getCurrentChar();
			if(c == ']'.charCodeAt()) {
				this.iterator.moveToNextChar();
				break;
			}
			sb.appendCharacter(']'.charCodeAt());
			continue;
		}
		sb.appendCharacter(c);
	}
	return this.stripLongStringIndentation((sb.toString()));
};

JkSlonSLONParser.prototype.acceptObject = function() {
	if(this.acceptChar('['.charCodeAt())) {
		if(this.acceptChar('['.charCodeAt())) {
			return this.parseLongString();
		}
		var v = JkLangDynamicVector.NEW();
		while(true){
			if(this.acceptChar(']'.charCodeAt())) {
				break;
			}
			v.appendObject((this.expectObject()));
		}
		return v;
	}
	if(this.acceptChar('{'.charCodeAt())) {
		var v1 = JkLangDynamicMap.NEW();
		while(true){
			if(this.acceptChar('}'.charCodeAt())) {
				break;
			}
			var key = this.expectIdentifier();
			var val = this.expectObject();
			if(JkSlonSLONParserNullObject.IS_INSTANCE && JkSlonSLONParserNullObject.IS_INSTANCE(val)) {
				v1.setObject(key, null);
			}
			else {
				v1.setObject(key, val);
			}
		}
		return v1;
	}
	var s = this.acceptDoubleQuotedString();
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

JkSlonSLONParser.prototype.tryAcceptObject = function() {
	try {
		return this.acceptObject();
	}
	catch {
		;
	}
	return null;
};

JkSlonSLONParser.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSlonSLONParser"] === true;
};
