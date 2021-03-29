let JkIoReader = {};

JkIoReader.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoReader"] === true;
};

let JkIoSizedReader = {};

JkIoSizedReader.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoSizedReader"] === true;
};

let JkIoFileDescriptor = {};

JkIoFileDescriptor.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoFileDescriptor"] === true;
};

let JkIoLineReader = {};

JkIoLineReader.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoLineReader"] === true;
};

let JkIoWriter = {};

JkIoWriter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoWriter"] === true;
};

let JkIoDataStream = {};

JkIoDataStream.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoDataStream"] === true;
};

let JkIoFileDescriptorReader = function() {
	this.fd = -1;
};

JkIoFileDescriptorReader.prototype._t = {
	"JkIoFileDescriptorReader" : true,
	"JkIoFileDescriptor" : true,
	"JkIoReader" : true,
	"JkLangClosable" : true
};
JkIoFileDescriptorReader.prototype._tobj = JkIoFileDescriptorReader;

JkIoFileDescriptorReader.NEW = function() {
	var v = new JkIoFileDescriptorReader;
	return v.CTOR_JkIoFileDescriptorReader();
};

JkIoFileDescriptorReader.prototype.CTOR_JkIoFileDescriptorReader = function() {
	this.fd = -1;
	return this;
};

JkIoFileDescriptorReader.forFileDescriptor = function(fd) {
	var v = JkIoFileDescriptorReader.NEW();
	v.setFd(fd);
	return v;
};

JkIoFileDescriptorReader.prototype.getFileDescriptor = function() {
	return this.fd;
};

JkIoFileDescriptorReader.prototype.read = function(buffer) {
	var v = -1;
	console.log("[jk.io.FileDescriptorReader.read] (FileDescriptorReader.sling:57:3): Not implemented");
	return v;
};

JkIoFileDescriptorReader.prototype.close = function() {
	console.log("[jk.io.FileDescriptorReader.close] (FileDescriptorReader.sling:74:3): Not implemented");
};

JkIoFileDescriptorReader.prototype.getFd = function() {
	return this.fd;
};

JkIoFileDescriptorReader.prototype.setFd = function(v) {
	this.fd = v;
	return this;
};

JkIoFileDescriptorReader.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoFileDescriptorReader"] === true;
};

let JkIoBinaryReader = function() {
	this.reader = null;
	this.buffer1 = null;
	this.buffer2 = null;
	this.buffer4 = null;
};

JkIoBinaryReader.prototype._t = {
	"JkLangClosable" : true,
	"JkIoBinaryReader" : true
};
JkIoBinaryReader.prototype._tobj = JkIoBinaryReader;

JkIoBinaryReader.NEW = function() {
	var v = new JkIoBinaryReader;
	return v.CTOR_JkIoBinaryReader();
};

JkIoBinaryReader.prototype.CTOR_JkIoBinaryReader = function() {
	this.buffer4 = null;
	this.buffer2 = null;
	this.buffer1 = null;
	this.reader = null;
	return this;
};

JkIoBinaryReader.forReader = function(reader) {
	var v = JkIoBinaryReader.NEW();
	v.setReader(reader);
	return v;
};

JkIoBinaryReader.prototype.isOK = function() {
	if(!(this.reader != null)) {
		return false;
	}
	return true;
};

JkIoBinaryReader.prototype.close = function() {
	var rc = (function(o) {
		if(JkLangClosable.IS_INSTANCE && JkLangClosable.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(this.reader);
	if(rc != null) {
		rc.close();
	}
	this.reader = null;
};

JkIoBinaryReader.prototype.seek = function(position) {
	var sr = (function(o) {
		if(JkIoSeekableReader.IS_INSTANCE && JkIoSeekableReader.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(this.reader);
	if(!(sr != null)) {
		return false;
	}
	return sr.setCurrentPosition(position);
};

JkIoBinaryReader.prototype.read1 = function() {
	if(!(this.reader != null)) {
		return null;
	}
	if(!(this.buffer1 != null)) {
		this.buffer1 = new ArrayBuffer(1);
	}
	var r = this.reader.read(this.buffer1);
	if(!(r == 1)) {
		this.close();
		return null;
	}
	return this.buffer1;
};

JkIoBinaryReader.prototype.read2 = function() {
	if(!(this.reader != null)) {
		return null;
	}
	if(!(this.buffer2 != null)) {
		this.buffer2 = new ArrayBuffer(2);
	}
	var r = this.reader.read(this.buffer2);
	if(!(r == 2)) {
		this.close();
		return null;
	}
	return this.buffer2;
};

JkIoBinaryReader.prototype.read4 = function() {
	if(!(this.reader != null)) {
		return null;
	}
	if(!(this.buffer4 != null)) {
		this.buffer4 = new ArrayBuffer(4);
	}
	var r = this.reader.read(this.buffer4);
	if(!(r == 4)) {
		this.close();
		return null;
	}
	return this.buffer4;
};

JkIoBinaryReader.prototype.readBuffer = function(size) {
	if(!(this.reader != null)) {
		return null;
	}
	if(!(size > 0)) {
		return null;
	}
	var b = new ArrayBuffer(size);
	var r = this.reader.read(b);
	if(!(r == size)) {
		this.close();
		return null;
	}
	return b;
};

JkIoBinaryReader.prototype.readInt8 = function() {
	var b = this.read1();
	if(!(b != null)) {
		return ~(~0);
	}
	return JkLangBuffer.getInt8(b, 0);
};

JkIoBinaryReader.prototype.readInt16LE = function() {
	var b = this.read2();
	if(!(b != null)) {
		return ~(~0);
	}
	return JkLangBuffer.getInt16LE(b, 0);
};

JkIoBinaryReader.prototype.readInt16BE = function() {
	var b = this.read2();
	if(!(b != null)) {
		return ~(~0);
	}
	return JkLangBuffer.getInt16BE(b, 0);
};

JkIoBinaryReader.prototype.readInt32LE = function() {
	var b = this.read4();
	if(!(b != null)) {
		return ~(~0);
	}
	return JkLangBuffer.getInt32LE(b, 0);
};

JkIoBinaryReader.prototype.readInt32BE = function() {
	var b = this.read4();
	if(!(b != null)) {
		return ~(~0);
	}
	return JkLangBuffer.getInt32BE(b, 0);
};

JkIoBinaryReader.prototype.getReader = function() {
	return this.reader;
};

JkIoBinaryReader.prototype.setReader = function(v) {
	this.reader = v;
	return this;
};

JkIoBinaryReader.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoBinaryReader"] === true;
};

let JkIoBufferWriter = function() {
	this.buffer = null;
	this.pos = 0;
};

JkIoBufferWriter.prototype._t = {
	"JkIoBufferWriter" : true,
	"JkIoWriter" : true
};
JkIoBufferWriter.prototype._tobj = JkIoBufferWriter;

JkIoBufferWriter.NEW = function() {
	var v = new JkIoBufferWriter;
	return v.CTOR_JkIoBufferWriter();
};

JkIoBufferWriter.prototype.CTOR_JkIoBufferWriter = function() {
	this.pos = 0;
	this.buffer = null;
	return this;
};

JkIoBufferWriter.forBuffer = function(buf) {
	var v = JkIoBufferWriter.NEW();
	v.buffer = buf;
	return v;
};

JkIoBufferWriter.prototype.getBufferSize = function() {
	return ~(~JkLangBuffer.getSize(this.buffer));
};

JkIoBufferWriter.prototype.getBufferPos = function() {
	return 0;
};

JkIoBufferWriter.prototype.getBuffer = function() {
	return this.buffer;
};

JkIoBufferWriter.prototype.write = function(src, ssize) {
	if(src == null) {
		return 0;
	}
	var size = ssize;
	if(size < 0) {
		size = ~(~JkLangBuffer.getSize(src));
	}
	if(size < 1) {
		return 0;
	}
	if(this.buffer == null) {
		this.buffer = new ArrayBuffer(size);
		if(this.buffer == null) {
			return 0;
		}
		JkLangBuffer.copyFrom(this.buffer, src, 0, 0, size);
		this.pos = size;
	}
	else if(this.pos + size <= JkLangBuffer.getSize(this.buffer)) {
		JkLangBuffer.copyFrom(this.buffer, src, 0, this.pos, size);
		this.pos += size;
	}
	else {
		var nb = JkLangBuffer.resize(this.buffer, (this.pos + size));
		if(nb == null) {
			return 0;
		}
		this.buffer = nb;
		JkLangBuffer.copyFrom(this.buffer, src, 0, this.pos, size);
		this.pos += size;
	}
	return size;
};

JkIoBufferWriter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoBufferWriter"] === true;
};

let JkIoCharacterIteratorForReader = function() {
	JkLangCharacterDecoder.call(this);
	this.reader = null;
	this.buffer = null;
	this.bufferStart = -1;
	this.bufferSize = 0;
	this.bufferDataSize = 0;
	this.currentPos = -1;
	this.readPos = 0;
};

JkIoCharacterIteratorForReader.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkLangCharacterDecoder.prototype);
JkIoCharacterIteratorForReader.prototype.constructor = JkIoCharacterIteratorForReader;
JkIoCharacterIteratorForReader.prototype._t = {
	"JkLangCharacterIterator" : true,
	"JkLangCharacterDecoder" : true,
	"JkIoCharacterIteratorForReader" : true
};
JkIoCharacterIteratorForReader.prototype._tobj = JkIoCharacterIteratorForReader;

JkIoCharacterIteratorForReader.NEW_JkIoReaderInteger = function(reader, bufferSize) {
	var v = new JkIoCharacterIteratorForReader;
	return v.CTOR_JkIoCharacterIteratorForReader_JkIoReaderInteger(reader, bufferSize);
};

JkIoCharacterIteratorForReader.prototype.CTOR_JkIoCharacterIteratorForReader_JkIoReaderInteger = function(reader, bufferSize) {
	if(JkLangCharacterDecoder.prototype.CTOR_JkLangCharacterDecoder.call(this) == null) {
		return null;
	}
	this.readPos = 0;
	this.currentPos = -1;
	this.bufferDataSize = 0;
	this.bufferSize = 0;
	this.bufferStart = -1;
	this.buffer = null;
	this.reader = null;
	this.reader = reader;
	this.buffer = new ArrayBuffer(bufferSize);
	this.bufferSize = bufferSize;
	return this;
};

JkIoCharacterIteratorForReader.NEW_JkIoReader = function(reader) {
	var v = new JkIoCharacterIteratorForReader;
	return v.CTOR_JkIoCharacterIteratorForReader_JkIoReader(reader);
};

JkIoCharacterIteratorForReader.prototype.CTOR_JkIoCharacterIteratorForReader_JkIoReader = function(reader) {
	if(JkLangCharacterDecoder.prototype.CTOR_JkLangCharacterDecoder.call(this) == null) {
		return null;
	}
	this.readPos = 0;
	this.currentPos = -1;
	this.bufferDataSize = 0;
	this.bufferSize = 0;
	this.bufferStart = -1;
	this.buffer = null;
	this.reader = null;
	this.reader = reader;
	this.buffer = new ArrayBuffer(1024);
	this.bufferSize = 1024;
	return this;
};

JkIoCharacterIteratorForReader.forReader = function(reader) {
	return JkIoCharacterIteratorForReader.NEW_JkIoReader(reader);
};

JkIoCharacterIteratorForReader.forReaderWithBufferSize = function(reader, bufferSize) {
	return JkIoCharacterIteratorForReader.NEW_JkIoReaderInteger(reader, bufferSize);
};

JkIoCharacterIteratorForReader.prototype.makeDataAvailable = function(n) {
	if(n >= this.bufferStart && n < this.bufferStart + this.bufferDataSize) {
		return true;
	}
	if(JkIoSeekableReader.IS_INSTANCE && JkIoSeekableReader.IS_INSTANCE(this.reader)) {
		var rs = this.reader;
		var block = n / this.bufferSize;
		var blockPos = block * this.bufferSize;
		if(this.readPos != blockPos) {
			if(!rs.setCurrentPosition(blockPos)) {
				return false;
			}
			this.readPos = blockPos;
		}
	}
	this.bufferDataSize = this.reader.read(this.buffer);
	this.bufferStart = this.readPos;
	this.readPos += this.bufferDataSize;
	if(n >= this.bufferStart && n < this.bufferStart + this.bufferDataSize) {
		return true;
	}
	return false;
};

JkIoCharacterIteratorForReader.prototype.moveToPreviousByte = function() {
	if(!this.makeDataAvailable((this.currentPos - 1))) {
		return false;
	}
	this.currentPos--;
	return true;
};

JkIoCharacterIteratorForReader.prototype.moveToNextByte = function() {
	if(!this.makeDataAvailable((this.currentPos + 1))) {
		return false;
	}
	this.currentPos++;
	return true;
};

JkIoCharacterIteratorForReader.prototype.getCurrentByte = function() {
	return JkLangBuffer.getByte(this.buffer, (this.currentPos - this.bufferStart));
};

JkIoCharacterIteratorForReader.prototype.getCurrentPosition = function() {
	return ~(~this.currentPos);
};

JkIoCharacterIteratorForReader.prototype.setCurrentPosition = function(position) {
	this.currentPos = position;
};

JkIoCharacterIteratorForReader.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoCharacterIteratorForReader"] === true;
};

let JkIoPrintWriter = {};

JkIoPrintWriter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoPrintWriter"] === true;
};

let JkIoFlushableWriter = {};

JkIoFlushableWriter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoFlushableWriter"] === true;
};

let JkIoStringLineReader = function() {
	this.iterator = null;
};

JkIoStringLineReader.prototype._t = {
	"JkIoStringLineReader" : true,
	"JkIoLineReader" : true
};
JkIoStringLineReader.prototype._tobj = JkIoStringLineReader;

JkIoStringLineReader.NEW_String = function(str) {
	var v = new JkIoStringLineReader;
	return v.CTOR_JkIoStringLineReader_String(str);
};

JkIoStringLineReader.prototype.CTOR_JkIoStringLineReader_String = function(str) {
	this.iterator = null;
	this.iterator = JkLangCharacterIteratorForString.forString(str);
	return this;
};

JkIoStringLineReader.prototype.readLine = function() {
	if(!(this.iterator != null)) {
		return null;
	}
	var sb = JkLangStringBuilder.NEW();
	while(true){
		var c = this.iterator.getNextChar();
		if(c < 1) {
			if(sb.count() < 1) {
				return null;
			}
			break;
		}
		if(c == '\r'.charCodeAt()) {
			continue;
		}
		if(c == '\n'.charCodeAt()) {
			break;
		}
		sb.appendCharacter(c);
	}
	if(sb.count() < 1) {
		return "";
	}
	return sb.toString();
};

JkIoStringLineReader.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoStringLineReader"] === true;
};

let JkIoFileDescriptorWriter = function() {
	this.fd = -1;
	this.owned = true;
};

JkIoFileDescriptorWriter.prototype._t = {
	"JkIoFileDescriptorWriter" : true,
	"JkIoFileDescriptor" : true,
	"JkLangClosable" : true,
	"JkIoWriter" : true
};
JkIoFileDescriptorWriter.prototype._tobj = JkIoFileDescriptorWriter;

JkIoFileDescriptorWriter.NEW = function() {
	var v = new JkIoFileDescriptorWriter;
	return v.CTOR_JkIoFileDescriptorWriter();
};

JkIoFileDescriptorWriter.prototype.CTOR_JkIoFileDescriptorWriter = function() {
	this.owned = true;
	this.fd = -1;
	return this;
};

JkIoFileDescriptorWriter.forFileDescriptor = function(fd) {
	var v = JkIoFileDescriptorWriter.NEW();
	v.setFd(fd);
	return v;
};

JkIoFileDescriptorWriter.forUnownedFileDescriptor = function(fd) {
	var v = JkIoFileDescriptorWriter.NEW();
	v.setFd(fd);
	v.setOwned(false);
	return v;
};

JkIoFileDescriptorWriter.prototype.getFileDescriptor = function() {
	return this.fd;
};

JkIoFileDescriptorWriter.prototype.write = function(buf, size) {
	var v = -1;
	console.log("[jk.io.FileDescriptorWriter.write] (FileDescriptorWriter.sling:66:3): Not implemented");
	return v;
};

JkIoFileDescriptorWriter.prototype.close = function() {
	if(!this.owned) {
		return;
	}
	console.log("[jk.io.FileDescriptorWriter.close] (FileDescriptorWriter.sling:84:3): Not implemented");
};

JkIoFileDescriptorWriter.prototype.getFd = function() {
	return this.fd;
};

JkIoFileDescriptorWriter.prototype.setFd = function(v) {
	this.fd = v;
	return this;
};

JkIoFileDescriptorWriter.prototype.getOwned = function() {
	return this.owned;
};

JkIoFileDescriptorWriter.prototype.setOwned = function(v) {
	this.owned = v;
	return this;
};

JkIoFileDescriptorWriter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoFileDescriptorWriter"] === true;
};

let JkIoSeekableReader = {};

JkIoSeekableReader.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoSeekableReader"] === true;
};

let JkIoPrintReader = function() {
	this.reader = null;
	this.iterator = null;
};

JkIoPrintReader.prototype._t = {
	"JkIoPrintReader" : true,
	"JkLangClosable" : true,
	"JkIoReader" : true,
	"JkIoLineReader" : true
};
JkIoPrintReader.prototype._tobj = JkIoPrintReader;

JkIoPrintReader.NEW = function() {
	var v = new JkIoPrintReader;
	return v.CTOR_JkIoPrintReader();
};

JkIoPrintReader.prototype.CTOR_JkIoPrintReader = function() {
	this.iterator = null;
	this.reader = null;
	return this;
};

JkIoPrintReader.forReader = function(reader) {
	if(!(reader != null)) {
		return null;
	}
	if(JkIoPrintReader.IS_INSTANCE && JkIoPrintReader.IS_INSTANCE(reader)) {
		return reader;
	}
	var v = JkIoPrintReader.NEW();
	v.setReader(reader, null);
	return v;
};

JkIoPrintReader.forReaderAndEncoding = function(reader, encoding) {
	if(!(reader != null)) {
		return null;
	}
	if(JkIoPrintReader.IS_INSTANCE && JkIoPrintReader.IS_INSTANCE(reader)) {
		return reader;
	}
	var v = JkIoPrintReader.NEW();
	v.setReader(reader, encoding);
	return v;
};

JkIoPrintReader.prototype.setReader = function(reader, encoding) {
	this.reader = reader;
	if(reader == null) {
		this.iterator = null;
	}
	else {
		this.iterator = JkIoCharacterIteratorForReader.forReader(reader);
		if(encoding != null) {
			this.iterator.setEncoding(encoding);
		}
	}
};

JkIoPrintReader.prototype.readLine = function() {
	if(!(this.iterator != null)) {
		return null;
	}
	var sb = JkLangStringBuilder.NEW();
	while(true){
		var c = this.iterator.getNextChar();
		if(JkLangCharacter.isEOF(c)) {
			if(sb.count() < 1) {
				return null;
			}
			break;
		}
		if(c == '\r'.charCodeAt()) {
			continue;
		}
		if(c == '\n'.charCodeAt()) {
			break;
		}
		sb.appendCharacter(c);
	}
	if(sb.count() < 1) {
		return "";
	}
	return sb.toString();
};

JkIoPrintReader.prototype.readAll = function() {
	if(!(this.iterator != null)) {
		return null;
	}
	var sb = JkLangStringBuilder.NEW();
	while(true){
		var c = this.iterator.getNextChar();
		if(JkLangCharacter.isEOF(c)) {
			break;
		}
		sb.appendCharacter(c);
	}
	if(sb.count() < 1) {
		return null;
	}
	return sb.toString();
};

JkIoPrintReader.prototype.hasEnded = function() {
	if(!(this.iterator != null)) {
		return true;
	}
	return this.iterator.hasEnded();
};

JkIoPrintReader.prototype.read = function(buffer) {
	if(this.reader == null) {
		return -1;
	}
	return this.reader.read(buffer);
};

JkIoPrintReader.prototype.close = function() {
	var rc = (function(o) {
		if(JkLangClosable.IS_INSTANCE && JkLangClosable.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(this.reader);
	if(rc != null) {
		rc.close();
	}
};

JkIoPrintReader.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoPrintReader"] === true;
};

let JkIoDataStreamSource = {};

JkIoDataStreamSource.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoDataStreamSource"] === true;
};

let JkIoStaticFileDescriptor = function() {
	this.fileDescriptor = 0;
};

JkIoStaticFileDescriptor.prototype._t = {
	"JkIoStaticFileDescriptor" : true,
	"JkIoFileDescriptor" : true
};
JkIoStaticFileDescriptor.prototype._tobj = JkIoStaticFileDescriptor;

JkIoStaticFileDescriptor.NEW = function() {
	var v = new JkIoStaticFileDescriptor;
	return v.CTOR_JkIoStaticFileDescriptor();
};

JkIoStaticFileDescriptor.prototype.CTOR_JkIoStaticFileDescriptor = function() {
	this.fileDescriptor = 0;
	return this;
};

JkIoStaticFileDescriptor.forFileDescriptor = function(fd) {
	return JkIoStaticFileDescriptor.NEW().setFileDescriptor(fd);
};

JkIoStaticFileDescriptor.prototype.getFileDescriptor = function() {
	return this.fileDescriptor;
};

JkIoStaticFileDescriptor.prototype.setFileDescriptor = function(v) {
	this.fileDescriptor = v;
	return this;
};

JkIoStaticFileDescriptor.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoStaticFileDescriptor"] === true;
};

let JkIoPrintWriterWrapper = function() {
	this.writer = null;
};

JkIoPrintWriterWrapper.prototype._t = {
	"JkIoWriter" : true,
	"JkIoPrintWriterWrapper" : true,
	"JkIoPrintWriter" : true,
	"JkIoFlushableWriter" : true,
	"JkLangClosable" : true
};
JkIoPrintWriterWrapper.prototype._tobj = JkIoPrintWriterWrapper;

JkIoPrintWriterWrapper.NEW = function() {
	var v = new JkIoPrintWriterWrapper;
	return v.CTOR_JkIoPrintWriterWrapper();
};

JkIoPrintWriterWrapper.prototype.CTOR_JkIoPrintWriterWrapper = function() {
	this.writer = null;
	return this;
};

JkIoPrintWriterWrapper.forWriter = function(writer) {
	if(writer == null) {
		return null;
	}
	if(JkIoPrintWriter.IS_INSTANCE && JkIoPrintWriter.IS_INSTANCE(writer)) {
		return writer;
	}
	var v = JkIoPrintWriterWrapper.NEW();
	v.setWriter(writer);
	return v;
};

JkIoPrintWriterWrapper.closeWriter = function(writer) {
	var wc = (function(o) {
		if(JkLangClosable.IS_INSTANCE && JkLangClosable.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(writer);
	if(!(wc != null)) {
		return null;
	}
	wc.close();
	return null;
};

JkIoPrintWriterWrapper.prototype.print = function(str) {
	if(str == null) {
		return false;
	}
	var buffer = JkLangString.toUTF8Buffer(str);
	if(buffer == null) {
		return false;
	}
	var sz = ~(~JkLangBuffer.getSize(buffer));
	if(this.writer.write(buffer, (-1)) != sz) {
		return false;
	}
	return true;
};

JkIoPrintWriterWrapper.prototype.println = function(str) {
	return this.print((JkLangString.safeString(str)) + ("\n"));
};

JkIoPrintWriterWrapper.prototype.writeWholeBuffer = function(buf) {
	return this.write(buf, (-1));
};

JkIoPrintWriterWrapper.prototype.write = function(buf, size) {
	if(this.writer == null) {
		return -1;
	}
	return this.writer.write(buf, size);
};

JkIoPrintWriterWrapper.prototype.close = function() {
	var cw = (function(o) {
		if(JkLangClosable.IS_INSTANCE && JkLangClosable.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(this.writer);
	if(cw != null) {
		cw.close();
	}
};

JkIoPrintWriterWrapper.prototype.flush = function() {
	var cw = (function(o) {
		if(JkIoFlushableWriter.IS_INSTANCE && JkIoFlushableWriter.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(this.writer);
	if(cw != null) {
		cw.flush();
	}
};

JkIoPrintWriterWrapper.prototype.getWriter = function() {
	return this.writer;
};

JkIoPrintWriterWrapper.prototype.setWriter = function(v) {
	this.writer = v;
	return this;
};

JkIoPrintWriterWrapper.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoPrintWriterWrapper"] === true;
};

let JkIoByteReader = {};

JkIoByteReader.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoByteReader"] === true;
};

let JkIoSeekableWriter = {};

JkIoSeekableWriter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoSeekableWriter"] === true;
};

let JkIoBufferReader = function() {
	this.buffer = null;
	this.pos = 0;
};

JkIoBufferReader.prototype._t = {
	"JkIoSeekableReader" : true,
	"JkIoSizedReader" : true,
	"JkIoReader" : true,
	"JkIoBufferReader" : true
};
JkIoBufferReader.prototype._tobj = JkIoBufferReader;

JkIoBufferReader.NEW = function() {
	var v = new JkIoBufferReader;
	return v.CTOR_JkIoBufferReader();
};

JkIoBufferReader.prototype.CTOR_JkIoBufferReader = function() {
	this.pos = 0;
	this.buffer = null;
	return this;
};

JkIoBufferReader.readFrom = function(reader) {
	if(!(reader != null)) {
		return null;
	}
	var v = null;
	var tmp = new ArrayBuffer(1024);
	while(true){
		var r = reader.read(tmp);
		if(r < 1) {
			break;
		}
		v = JkLangBuffer.append(v, tmp, r);
		if(v == null) {
			break;
		}
	}
	return v;
};

JkIoBufferReader.forBuffer = function(buf) {
	return JkIoBufferReader.NEW().setBuffer(buf);
};

JkIoBufferReader.prototype.setCurrentPosition = function(n) {
	this.pos = ~(~n);
	return true;
};

JkIoBufferReader.prototype.getCurrentPosition = function() {
	return this.pos;
};

JkIoBufferReader.prototype.getBuffer = function() {
	return this.buffer;
};

JkIoBufferReader.prototype.setBuffer = function(buf) {
	this.buffer = buf;
	this.pos = 0;
	return this;
};

JkIoBufferReader.prototype.rewind = function() {
	this.pos = 0;
};

JkIoBufferReader.prototype.getSize = function() {
	if(this.buffer == null) {
		return 0;
	}
	return this.buffer.byteLength;
};

JkIoBufferReader.prototype.read = function(buf) {
	if(buf == null || this.buffer == null) {
		return 0;
	}
	var buffersz = this.buffer.byteLength;
	if(this.pos >= buffersz) {
		return 0;
	}
	var size = buf.byteLength;
	if(size > buffersz - this.pos) {
		size = buffersz - this.pos;
	}
	JkLangBuffer.copyFrom(buf, this.buffer, this.pos, 0, size);
	this.pos += size;
	return size;
};

JkIoBufferReader.prototype.getPos = function() {
	return this.pos;
};

JkIoBufferReader.prototype.setPos = function(v) {
	this.pos = v;
	return this;
};

JkIoBufferReader.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkIoBufferReader"] === true;
};
