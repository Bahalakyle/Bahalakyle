let JkMypacketMyPacketParser = function() {
	this.buffer = null;
	this.position = 0;
};

JkMypacketMyPacketParser.prototype._t = { "JkMypacketMyPacketParser" : true };
JkMypacketMyPacketParser.prototype._tobj = JkMypacketMyPacketParser;

JkMypacketMyPacketParser.NEW = function() {
	var v = new JkMypacketMyPacketParser;
	return v.CTOR_JkMypacketMyPacketParser();
};

JkMypacketMyPacketParser.prototype.CTOR_JkMypacketMyPacketParser = function() {
	this.position = 0;
	this.buffer = null;
	return this;
};

JkMypacketMyPacketParser.forBuffer = function(buffer) {
	var v = JkMypacketMyPacketParser.NEW();
	v.setBuffer(buffer);
	return v;
};

JkMypacketMyPacketParser.prototype.isValid = function(_length) {
	if(!(this.buffer != null)) {
		return false;
	}
	var sz = this.buffer.byteLength;
	if(!(this.position + _length <= sz)) {
		return false;
	}
	return true;
};

JkMypacketMyPacketParser.prototype.skipBytes = function(count) {
	this.position += count;
};

JkMypacketMyPacketParser.prototype.getInt8 = function() {
	if(!this.isValid(1)) {
		return 0;
	}
	return ~(~this.buffer[this.position++]);
};

JkMypacketMyPacketParser.prototype.getFloat = function() {
	if(!this.isValid(4)) {
		return 0.0;
	}
	var bb = new ArrayBuffer(4);
	bb[0] = this.buffer[this.position++];
	bb[1] = this.buffer[this.position++];
	bb[2] = this.buffer[this.position++];
	bb[3] = this.buffer[this.position++];
	return JkLangBuffer.getFloatLE(bb, 0);
};

JkMypacketMyPacketParser.prototype.getDouble = function() {
	if(!this.isValid(8)) {
		return 0.0;
	}
	var bb = new ArrayBuffer(8);
	bb[0] = this.buffer[this.position++];
	bb[1] = this.buffer[this.position++];
	bb[2] = this.buffer[this.position++];
	bb[3] = this.buffer[this.position++];
	bb[4] = this.buffer[this.position++];
	bb[5] = this.buffer[this.position++];
	bb[6] = this.buffer[this.position++];
	bb[7] = this.buffer[this.position++];
	return JkLangBuffer.getDoubleLE(bb, 0);
};

JkMypacketMyPacketParser.prototype.getInt16 = function() {
	if(!this.isValid(2)) {
		return 0;
	}
	var bb = new ArrayBuffer(2);
	bb[0] = this.buffer[this.position++];
	bb[1] = this.buffer[this.position++];
	return JkLangBuffer.getInt16LE(bb, 0);
};

JkMypacketMyPacketParser.prototype.getInt24 = function() {
	if(!this.isValid(3)) {
		return 0;
	}
	var bb = new ArrayBuffer(4);
	bb[0] = this.buffer[this.position++];
	bb[1] = this.buffer[this.position++];
	bb[2] = this.buffer[this.position++];
	bb[3] = ~(~0);
	return ~(~JkLangBuffer.getInt32LE(bb, 0));
};

JkMypacketMyPacketParser.prototype.getInt32 = function() {
	if(!this.isValid(4)) {
		return 0;
	}
	var bb = new ArrayBuffer(4);
	bb[0] = this.buffer[this.position++];
	bb[1] = this.buffer[this.position++];
	bb[2] = this.buffer[this.position++];
	bb[3] = this.buffer[this.position++];
	return ~(~JkLangBuffer.getInt32LE(bb, 0));
};

JkMypacketMyPacketParser.prototype.getInt64 = function() {
	if(!this.isValid(8)) {
		return ~(~0);
	}
	var bb = new ArrayBuffer(8);
	bb[0] = this.buffer[this.position++];
	bb[1] = this.buffer[this.position++];
	bb[2] = this.buffer[this.position++];
	bb[3] = this.buffer[this.position++];
	bb[4] = this.buffer[this.position++];
	bb[5] = this.buffer[this.position++];
	bb[6] = this.buffer[this.position++];
	bb[7] = this.buffer[this.position++];
	return ~(~JkLangBuffer.getInt64LE(bb, 0));
};

JkMypacketMyPacketParser.prototype.getLengthEncodedInteger = function() {
	if(!this.isValid(1)) {
		return ~(~0);
	}
	var first = this.buffer[this.position];
	if(first < 0xfb) {
		this.position++;
		return ~(~first);
	}
	if(first == 0xfc) {
		if(!this.isValid(3)) {
			return ~(~0);
		}
		this.position++;
		var bb = new ArrayBuffer(2);
		bb[0] = this.buffer[this.position++];
		bb[1] = this.buffer[this.position++];
		return JkLangBuffer.getInt16LE(bb, 0);
	}
	if(first == 0xfd) {
		if(!this.isValid(4)) {
			return ~(~0);
		}
		this.position++;
		var bb1 = new ArrayBuffer(4);
		bb1[0] = this.buffer[this.position++];
		bb1[1] = this.buffer[this.position++];
		bb1[2] = this.buffer[this.position++];
		bb1[3] = ~(~0x0);
		return JkLangBuffer.getInt32LE(bb1, 0);
	}
	if(first == 0xfe) {
		if(!this.isValid(9)) {
			return ~(~0);
		}
		this.position++;
		var bb2 = new ArrayBuffer(8);
		bb2[0] = this.buffer[this.position++];
		bb2[1] = this.buffer[this.position++];
		bb2[2] = this.buffer[this.position++];
		bb2[3] = this.buffer[this.position++];
		bb2[4] = this.buffer[this.position++];
		bb2[5] = this.buffer[this.position++];
		bb2[6] = this.buffer[this.position++];
		bb2[7] = this.buffer[this.position++];
		return ~(~JkLangBuffer.getInt64LE(bb2, 0));
	}
	console.log("[jk.mypacket.MyPacketParser.getLengthEncodedInteger] (MyPacketParser.sling:166:2): Invalid byte as first byte of length encoded integer.");
	return 0;
};

JkMypacketMyPacketParser.prototype.getNullTerminatedString = function() {
	if(!(this.buffer != null)) {
		return null;
	}
	var sb = JkLangStringBuilder.NEW();
	var sz = this.buffer.byteLength;
	while(this.position < sz){
		var c = this.buffer[this.position++];
		if(c < 1) {
			break;
		}
		sb.appendCharacter(c);
	}
	return sb.toString();
};

JkMypacketMyPacketParser.prototype.getEofTerminatedString = function() {
	if(!(this.buffer != null)) {
		return null;
	}
	var sb = JkLangStringBuilder.NEW();
	var sz = this.buffer.byteLength;
	while(this.position < sz){
		var c = this.buffer[this.position++];
		sb.appendCharacter(c);
	}
	return sb.toString();
};

JkMypacketMyPacketParser.prototype.getStaticLengthString = function(_length) {
	if(!(_length > 0)) {
		return null;
	}
	if(!this.isValid(_length)) {
		return null;
	}
	var sb = JkLangStringBuilder.NEW();
	for(var n = 0 ; n < _length ; n++) {
		sb.appendCharacter(this.buffer[this.position++]);
	}
	return sb.toString();
};

JkMypacketMyPacketParser.prototype.getLengthEncodedString = function() {
	var _length = this.getLengthEncodedInteger();
	if(_length < 1) {
		return "";
	}
	return this.getStaticLengthString(_length);
};

JkMypacketMyPacketParser.prototype.getLengthEncodedBuffer = function() {
	var _length = this.getLengthEncodedInteger();
	if(_length < 1) {
		return null;
	}
	return this.getBuffer(_length);
};

JkMypacketMyPacketParser.prototype.getBuffer = function(_length) {
	if(!this.isValid(_length)) {
		return null;
	}
	var v = new ArrayBuffer(_length);
	JkLangBuffer.copyFrom(v, this.buffer, this.position, 0, _length);
	this.position += _length;
	return v;
};

JkMypacketMyPacketParser.prototype.setBuffer = function(v) {
	this.buffer = v;
	return this;
};

JkMypacketMyPacketParser.prototype.getPosition = function() {
	return this.position;
};

JkMypacketMyPacketParser.prototype.setPosition = function(v) {
	this.position = v;
	return this;
};

JkMypacketMyPacketParser.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMypacketMyPacketParser"] === true;
};

let JkMypacketMyPacketBuilder = function() {
	this.buffer = null;
	this.position = 0;
};

JkMypacketMyPacketBuilder.prototype._t = { "JkMypacketMyPacketBuilder" : true };
JkMypacketMyPacketBuilder.prototype._tobj = JkMypacketMyPacketBuilder;

JkMypacketMyPacketBuilder.NEW = function() {
	var v = new JkMypacketMyPacketBuilder;
	return v.CTOR_JkMypacketMyPacketBuilder();
};

JkMypacketMyPacketBuilder.prototype.CTOR_JkMypacketMyPacketBuilder = function() {
	this.position = 0;
	this.buffer = null;
	return this;
};

JkMypacketMyPacketBuilder.prototype.ensureAvailablesize = function(count) {
	var sz = 0;
	if(this.buffer != null) {
		sz = this.buffer.byteLength;
	}
	if(sz < this.position + count) {
		var nsz = sz;
		while(nsz < this.position + count){
			nsz += 65536;
		}
		this.buffer = JkLangBuffer.resize(this.buffer, nsz);
	}
};

JkMypacketMyPacketBuilder.prototype.appendByte = function(_byte) {
	this.ensureAvailablesize(1);
	this.buffer[this.position] = ~(~(_byte & 0xff));
	this.position++;
};

JkMypacketMyPacketBuilder.prototype.appendMultipleBytes = function(_byte, count) {
	if(!(count > 0)) {
		return;
	}
	this.ensureAvailablesize(count);
	for(var n = 0 ; n < count ; n++) {
		this.buffer[this.position++] = ~(~(_byte & 0xff));
	}
};

JkMypacketMyPacketBuilder.prototype.appendBuffer = function(newdata) {
	if(!(newdata != null)) {
		return;
	}
	var nds = newdata.byteLength;
	this.ensureAvailablesize(nds);
	JkLangBuffer.copyFrom(this.buffer, newdata, 0, this.position, nds);
	this.position += nds;
};

JkMypacketMyPacketBuilder.prototype.appendInt16 = function(number) {
	this.ensureAvailablesize(2);
	var bb = JkLangBuffer.forInt16LE((~(~number)));
	JkLangBuffer.copyFrom(this.buffer, bb, 0, this.position, 2);
	this.position += 2;
};

JkMypacketMyPacketBuilder.prototype.appendInt24 = function(number) {
	this.ensureAvailablesize(3);
	var bb = JkLangBuffer.forInt32LE((~(~number)));
	JkLangBuffer.copyFrom(this.buffer, bb, 0, this.position, 3);
	this.position += 3;
};

JkMypacketMyPacketBuilder.prototype.appendInt32 = function(number) {
	this.ensureAvailablesize(4);
	var bb = JkLangBuffer.forInt32LE(number);
	JkLangBuffer.copyFrom(this.buffer, bb, 0, this.position, 4);
	this.position += 4;
};

JkMypacketMyPacketBuilder.prototype.appendInt64 = function(number) {
	this.ensureAvailablesize(8);
	var bb = JkLangBuffer.forInt64LE(number);
	JkLangBuffer.copyFrom(this.buffer, bb, 0, this.position, 8);
	this.position += 8;
};

JkMypacketMyPacketBuilder.prototype.appendDouble = function(number) {
	this.ensureAvailablesize(8);
	var bb = JkLangBuffer.forDouble64LE(number);
	JkLangBuffer.copyFrom(this.buffer, bb, 0, this.position, 8);
	this.position += 8;
};

JkMypacketMyPacketBuilder.prototype.appendNullTerminatedString = function(string) {
	if(!(string != null)) {
		this.appendByte(0);
		return;
	}
	var it = JkLangString.iterate(string);
	while(it != null){
		var c = it.getNextChar();
		if(JkLangCharacter.isEOF(c)) {
			this.appendByte(0);
			break;
		}
		this.appendByte((~(~c)));
	}
};

JkMypacketMyPacketBuilder.prototype.appendFixedLengthString = function(string, _length) {
	if(!(_length > 0)) {
		return;
	}
	var it = JkLangString.iterate(string);
	for(var n = 0 ; n < _length ; n++) {
		var c = it.getNextChar();
		if(JkLangCharacter.isEOF(c)) {
			this.appendByte(0);
		}
		else {
			this.appendByte((~(~c)));
		}
	}
};

JkMypacketMyPacketBuilder.prototype.appendEofTerminatedString = function(string) {
	if(!(string != null)) {
		return;
	}
	var it = JkLangString.iterate(string);
	while(it != null){
		var c = it.getNextChar();
		if(JkLangCharacter.isEOF(c)) {
			break;
		}
		this.appendByte((~(~c)));
	}
};

JkMypacketMyPacketBuilder.prototype.appendLengthEncodedInteger = function(value) {
	if(value < 251) {
		this.appendByte((~(~value)));
	}
	else if(value < 65536) {
		this.appendByte(0xfc);
		this.appendInt16((~(~value)));
	}
	else if(value < 16777216) {
		this.appendByte(0xfd);
		this.appendInt24((~(~value)));
	}
	else {
		this.appendByte(0xfe);
		this.appendInt64((~(~value)));
	}
};

JkMypacketMyPacketBuilder.prototype.appendLengthEncodedString = function(value) {
	if(!(value != null)) {
		this.appendLengthEncodedInteger(0);
		return;
	}
	var bb = JkLangString.toUTF8Buffer(value);
	if(!(bb != null)) {
		this.appendLengthEncodedInteger(0);
		return;
	}
	var sz = bb.byteLength;
	this.appendLengthEncodedInteger(sz);
	if(sz > 0) {
		this.appendBuffer(bb);
	}
};

JkMypacketMyPacketBuilder.prototype.appendLengthEncodedBuffer = function(value) {
	if(!(value != null)) {
		this.appendLengthEncodedInteger(0);
		return;
	}
	var sz = value.byteLength;
	this.appendLengthEncodedInteger(sz);
	if(sz > 0) {
		this.appendBuffer(value);
	}
};

JkMypacketMyPacketBuilder.prototype.finalize = function() {
	if(!(this.buffer != null)) {
		return null;
	}
	return JkLangBuffer.getSubBuffer(this.buffer, 0, this.position, false);
};

JkMypacketMyPacketBuilder.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMypacketMyPacketBuilder"] === true;
};
