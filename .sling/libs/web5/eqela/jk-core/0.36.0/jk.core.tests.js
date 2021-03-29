let JkCoreTestsFileSystemTests = function() {
	JkTestUnitTest.call(this);
};

JkCoreTestsFileSystemTests.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTestUnitTest.prototype);
JkCoreTestsFileSystemTests.prototype.constructor = JkCoreTestsFileSystemTests;
JkCoreTestsFileSystemTests.prototype._t = {
	"JkCoreTestsFileSystemTests" : true,
	"JkTestUnitTest" : true
};
JkCoreTestsFileSystemTests.prototype._tobj = JkCoreTestsFileSystemTests;

JkCoreTestsFileSystemTests.NEW = function() {
	var v = new JkCoreTestsFileSystemTests;
	return v.CTOR_JkCoreTestsFileSystemTests();
};

JkCoreTestsFileSystemTests.prototype.CTOR_JkCoreTestsFileSystemTests = function() {
	if(JkTestUnitTest.prototype.CTOR_JkTestUnitTest.call(this) == null) {
		return null;
	}
	return this;
};

JkCoreTestsFileSystemTests.prototype.testMoveFile = function() {
	var tf1 = JkEnvTemporaryFile.create(null);
	var tf2 = JkEnvTemporaryFile.create(null);
	if(!(tf1 != null && tf1.isFile())) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "35", "2", null);
	}
	if(!(tf2 != null && tf2.isFile())) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "36", "2", null);
	}
	if(!(tf1.move(tf2, false) == false)) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "37", "2", null);
	}
	if(!(tf1.move(tf2, true) == true)) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "38", "2", null);
	}
	if(!(tf1.isFile() == false)) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "39", "2", null);
	}
	if(!(tf2.isFile() == true)) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "40", "2", null);
	}
	tf2.remove();
	if(!(tf2.isFile() == false)) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "42", "2", null);
	}
};

JkCoreTestsFileSystemTests.prototype.testRenameFile = function() {
	var td = JkEnvTemporaryDirectory.create();
	if(!(td.isDirectory() == true)) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "48", "2", null);
	}
	var tf1 = td.entry("file1");
	var tf2 = td.entry("file2");
	var tf3 = td.entry("file3");
	tf1.setContentsUTF8("data");
	if(!(tf1.getContentsUTF8() == "data")) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "53", "2", null);
	}
	if(!(tf1.rename("file2", false) == true)) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "54", "2", null);
	}
	if(!(tf1.isFile() == false)) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "55", "2", null);
	}
	if(!(tf2.isFile() == true)) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "56", "2", null);
	}
	if(!(tf2.getContentsUTF8() == "data")) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "57", "2", null);
	}
	tf3.touch();
	if(!(tf3.isFile() == true)) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "59", "2", null);
	}
	if(!(tf3.getContentsUTF8() == "")) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "60", "2", null);
	}
	if(!(tf2.rename("file3", false) == false)) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "61", "2", null);
	}
	if(!(tf2.isFile() == true)) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "62", "2", null);
	}
	if(!(tf3.isFile() == true)) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "63", "2", null);
	}
	if(!(tf3.getContentsUTF8() == "")) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "64", "2", null);
	}
	if(!(tf2.rename("file3", true) == true)) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "65", "2", null);
	}
	if(!(tf2.isFile() == false)) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "66", "2", null);
	}
	if(!(tf3.isFile() == true)) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "67", "2", null);
	}
	if(!(tf3.getContentsUTF8() == "data")) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "68", "2", null);
	}
	td.removeRecursive();
	if(!(tf3.isFile() == false)) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "70", "2", null);
	}
	if(!(td.isDirectory() == false)) {
		throw JkTestFailedAssertionException.instance("FileSystemTests.sling", "71", "2", null);
	}
};

JkCoreTestsFileSystemTests.prototype.execute = function() {
	var v = true;
	JkLogLog.debug(this.ctx, "Executing test: " + ("FileSystemTests") + (" / ") + ("Move file"));
	try {
		this.testMoveFile();
	}
	catch(e) {
		JkLogLog.error(this.ctx, (e.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("FileSystemTests") + (" / ") + ("Move file"));
	JkLogLog.debug(this.ctx, "Executing test: " + ("FileSystemTests") + (" / ") + ("Rename file"));
	try {
		this.testRenameFile();
	}
	catch(e1) {
		JkLogLog.error(this.ctx, (e1.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("FileSystemTests") + (" / ") + ("Rename file"));
	return v;
};

JkCoreTestsFileSystemTests.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkCoreTestsFileSystemTests"] === true;
};

let JkCoreTestsVariableReferenceTests = function() {
	JkTestUnitTest.call(this);
};

JkCoreTestsVariableReferenceTests.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTestUnitTest.prototype);
JkCoreTestsVariableReferenceTests.prototype.constructor = JkCoreTestsVariableReferenceTests;
JkCoreTestsVariableReferenceTests.prototype._t = {
	"JkTestUnitTest" : true,
	"JkCoreTestsVariableReferenceTests" : true
};
JkCoreTestsVariableReferenceTests.prototype._tobj = JkCoreTestsVariableReferenceTests;

JkCoreTestsVariableReferenceTests.NEW = function() {
	var v = new JkCoreTestsVariableReferenceTests;
	return v.CTOR_JkCoreTestsVariableReferenceTests();
};

JkCoreTestsVariableReferenceTests.prototype.CTOR_JkCoreTestsVariableReferenceTests = function() {
	if(JkTestUnitTest.prototype.CTOR_JkTestUnitTest.call(this) == null) {
		return null;
	}
	return this;
};

JkCoreTestsVariableReferenceTests.prototype.testVariableReferences = function() {
	var n = 10;
	var setter = function(value1) {
		n = value1;
	}.bind(this);
	var getter = function() {
		return n;
	}.bind(this);
	var vr = JkLangVariableReference.NEW_FunctionFunction(setter, getter);
	if(!(vr.get() == 10)) {
		throw JkTestFailedAssertionException.instance("VariableReferenceTests.sling", "45", "3", null);
	}
	vr.set(999);
	if(!(vr.get() == 999)) {
		throw JkTestFailedAssertionException.instance("VariableReferenceTests.sling", "47", "3", null);
	}
};

JkCoreTestsVariableReferenceTests.prototype.execute = function() {
	var v = true;
	JkLogLog.debug(this.ctx, "Executing test: " + ("VariableReferenceTests") + (" / ") + ("Variable references"));
	try {
		this.testVariableReferences();
	}
	catch(e) {
		JkLogLog.error(this.ctx, (e.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("VariableReferenceTests") + (" / ") + ("Variable references"));
	return v;
};

JkCoreTestsVariableReferenceTests.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkCoreTestsVariableReferenceTests"] === true;
};

let JkCoreTestsSystemClockTests = function() {
	JkTestUnitTest.call(this);
};

JkCoreTestsSystemClockTests.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTestUnitTest.prototype);
JkCoreTestsSystemClockTests.prototype.constructor = JkCoreTestsSystemClockTests;
JkCoreTestsSystemClockTests.prototype._t = {
	"JkCoreTestsSystemClockTests" : true,
	"JkTestUnitTest" : true
};
JkCoreTestsSystemClockTests.prototype._tobj = JkCoreTestsSystemClockTests;

JkCoreTestsSystemClockTests.NEW = function() {
	var v = new JkCoreTestsSystemClockTests;
	return v.CTOR_JkCoreTestsSystemClockTests();
};

JkCoreTestsSystemClockTests.prototype.CTOR_JkCoreTestsSystemClockTests = function() {
	if(JkTestUnitTest.prototype.CTOR_JkTestUnitTest.call(this) == null) {
		return null;
	}
	return this;
};

JkCoreTestsSystemClockTests.prototype.testSystemClockMethods = function() {
	if(!(JkTimeSystemClock.asSeconds() > 0)) {
		throw JkTestFailedAssertionException.instance("SystemClockTests.sling", "33", "2", null);
	}
	if(!(JkTimeSystemClock.asUTCSeconds() > 0)) {
		throw JkTestFailedAssertionException.instance("SystemClockTests.sling", "34", "2", null);
	}
	if(!(JkTimeSystemClock.asTimeValue() != null)) {
		throw JkTestFailedAssertionException.instance("SystemClockTests.sling", "35", "2", null);
	}
};

JkCoreTestsSystemClockTests.prototype.execute = function() {
	var v = true;
	JkLogLog.debug(this.ctx, "Executing test: " + ("SystemClockTests") + (" / ") + ("SystemClock Methods"));
	try {
		this.testSystemClockMethods();
	}
	catch(e) {
		JkLogLog.error(this.ctx, (e.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("SystemClockTests") + (" / ") + ("SystemClock Methods"));
	return v;
};

JkCoreTestsSystemClockTests.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkCoreTestsSystemClockTests"] === true;
};

let JkCoreTestsStringBuilderTests = function() {
	JkTestUnitTest.call(this);
};

JkCoreTestsStringBuilderTests.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTestUnitTest.prototype);
JkCoreTestsStringBuilderTests.prototype.constructor = JkCoreTestsStringBuilderTests;
JkCoreTestsStringBuilderTests.prototype._t = {
	"JkTestUnitTest" : true,
	"JkCoreTestsStringBuilderTests" : true
};
JkCoreTestsStringBuilderTests.prototype._tobj = JkCoreTestsStringBuilderTests;

JkCoreTestsStringBuilderTests.NEW = function() {
	var v = new JkCoreTestsStringBuilderTests;
	return v.CTOR_JkCoreTestsStringBuilderTests();
};

JkCoreTestsStringBuilderTests.prototype.CTOR_JkCoreTestsStringBuilderTests = function() {
	if(JkTestUnitTest.prototype.CTOR_JkTestUnitTest.call(this) == null) {
		return null;
	}
	return this;
};

JkCoreTestsStringBuilderTests.prototype.testStringBuilderMethods = function() {
	var sb = JkLangStringBuilder.NEW();
	sb.appendInteger(1);
	sb.appendCharacter('a'.charCodeAt());
	sb.appendDouble(1.01);
	sb.appendFloat(1.01);
	sb.clear();
	if(!(sb.count() == 0)) {
		throw JkTestFailedAssertionException.instance("StringBuilderTests.sling", "38", "2", null);
	}
	sb.appendString("My Test String");
	if(!(sb.count() == 14)) {
		throw JkTestFailedAssertionException.instance("StringBuilderTests.sling", "40", "2", null);
	}
	sb.remove(0, 3);
	if(!(sb.toString() == "Test String")) {
		throw JkTestFailedAssertionException.instance("StringBuilderTests.sling", "42", "2", null);
	}
	if(!(sb.count() == 11)) {
		throw JkTestFailedAssertionException.instance("StringBuilderTests.sling", "43", "2", null);
	}
	sb.remove(11, 4);
	if(!(sb.count() == 11)) {
		throw JkTestFailedAssertionException.instance("StringBuilderTests.sling", "45", "2", null);
	}
	sb.remove(1, 2);
	if(!(sb.toString() == "Tt String")) {
		throw JkTestFailedAssertionException.instance("StringBuilderTests.sling", "47", "2", null);
	}
	if(!(sb.count() == 9)) {
		throw JkTestFailedAssertionException.instance("StringBuilderTests.sling", "48", "2", null);
	}
	sb.removeLastCharacter();
	if(!(sb.toString() == "Tt Strin")) {
		throw JkTestFailedAssertionException.instance("StringBuilderTests.sling", "50", "2", null);
	}
	if(!(sb.count() == 8)) {
		throw JkTestFailedAssertionException.instance("StringBuilderTests.sling", "51", "2", null);
	}
	sb.insertString(0, "A ");
	if(!(sb.toString() == "A Tt Strin")) {
		throw JkTestFailedAssertionException.instance("StringBuilderTests.sling", "53", "2", null);
	}
	sb.insertString(1, "b");
	if(!(sb.toString() == "Ab Tt Strin")) {
		throw JkTestFailedAssertionException.instance("StringBuilderTests.sling", "55", "2", null);
	}
};

JkCoreTestsStringBuilderTests.prototype.execute = function() {
	var v = true;
	JkLogLog.debug(this.ctx, "Executing test: " + ("StringBuilderTests") + (" / ") + ("StringBuilder Methods"));
	try {
		this.testStringBuilderMethods();
	}
	catch(e) {
		JkLogLog.error(this.ctx, (e.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("StringBuilderTests") + (" / ") + ("StringBuilder Methods"));
	return v;
};

JkCoreTestsStringBuilderTests.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkCoreTestsStringBuilderTests"] === true;
};

let JkCoreTestsStackTraceTestsMyException = function() {
	JkLangException.call(this);
	this.file = null;
	this.line = null;
	this.column = null;
};

JkCoreTestsStackTraceTestsMyException.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkLangException.prototype);
JkCoreTestsStackTraceTestsMyException.prototype.constructor = JkCoreTestsStackTraceTestsMyException;
JkCoreTestsStackTraceTestsMyException.prototype._t = {
	"JkCoreTestsStackTraceTestsMyException" : true,
	"JkLangException" : true,
	"JkLangStringObject" : true
};
JkCoreTestsStackTraceTestsMyException.prototype._tobj = JkCoreTestsStackTraceTestsMyException;

JkCoreTestsStackTraceTestsMyException.NEW = function() {
	var v = new JkCoreTestsStackTraceTestsMyException;
	return v.CTOR_JkCoreTestsStackTraceTestsMyException();
};

JkCoreTestsStackTraceTestsMyException.prototype.CTOR_JkCoreTestsStackTraceTestsMyException = function() {
	this.column = null;
	this.line = null;
	this.file = null;
	if(JkLangException.prototype.CTOR_JkLangException.call(this) == null) {
		return null;
	}
	return this;
};

JkCoreTestsStackTraceTestsMyException.instance = function(file, line, column) {
	var v = JkCoreTestsStackTraceTestsMyException.NEW();
	v.setFile(file);
	v.setLine(line);
	v.setColumn(column);
	return v;
};

JkCoreTestsStackTraceTestsMyException.prototype.toString = function() {
	var sb = (JkLangString.safeString((JkLangString.safeString(this.file)))) + (":") + (JkLangString.safeString((JkLangString.safeString(this.line)))) + (":") + (JkLangString.safeString((JkLangString.safeString(this.column)))) + (": ") + ("MyException");
	return sb;
};

JkCoreTestsStackTraceTestsMyException.prototype.getFile = function() {
	return this.file;
};

JkCoreTestsStackTraceTestsMyException.prototype.setFile = function(v) {
	this.file = v;
	return this;
};

JkCoreTestsStackTraceTestsMyException.prototype.getLine = function() {
	return this.line;
};

JkCoreTestsStackTraceTestsMyException.prototype.setLine = function(v) {
	this.line = v;
	return this;
};

JkCoreTestsStackTraceTestsMyException.prototype.getColumn = function() {
	return this.column;
};

JkCoreTestsStackTraceTestsMyException.prototype.setColumn = function(v) {
	this.column = v;
	return this;
};

JkCoreTestsStackTraceTestsMyException.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkCoreTestsStackTraceTestsMyException"] === true;
};

let JkCoreTestsStackTraceTests = function() {
	JkTestUnitTest.call(this);
};

JkCoreTestsStackTraceTests.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTestUnitTest.prototype);
JkCoreTestsStackTraceTests.prototype.constructor = JkCoreTestsStackTraceTests;
JkCoreTestsStackTraceTests.prototype._t = {
	"JkTestUnitTest" : true,
	"JkCoreTestsStackTraceTests" : true
};
JkCoreTestsStackTraceTests.prototype._tobj = JkCoreTestsStackTraceTests;

JkCoreTestsStackTraceTests.NEW = function() {
	var v = new JkCoreTestsStackTraceTests;
	return v.CTOR_JkCoreTestsStackTraceTests();
};

JkCoreTestsStackTraceTests.prototype.CTOR_JkCoreTestsStackTraceTests = function() {
	if(JkTestUnitTest.prototype.CTOR_JkTestUnitTest.call(this) == null) {
		return null;
	}
	return this;
};

JkCoreTestsStackTraceTests.prototype.testStackTrace = function() {
	try {
		JkCoreTestsStackTraceTests.process("bb");
	}
	catch(e) {
		var str = e.toString();
		if(!(!(str == null))) {
			throw JkTestFailedAssertionException.instance("StackTraceTests.sling", "37", "3", null);
		}
	}
};

JkCoreTestsStackTraceTests.process = function(str) {
	if(!(str == "AA")) {
		var excp = JkCoreTestsStackTraceTestsMyException.instance("StackTraceTests.sling", "44", "71");
		if(excp != null) {
			throw excp;
		}
	}
};

JkCoreTestsStackTraceTests.prototype.execute = function() {
	var v = true;
	JkLogLog.debug(this.ctx, "Executing test: " + ("StackTraceTests") + (" / ") + ("StackTrace Tests"));
	try {
		this.testStackTrace();
	}
	catch(e) {
		JkLogLog.error(this.ctx, (e.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("StackTraceTests") + (" / ") + ("StackTrace Tests"));
	return v;
};

JkCoreTestsStackTraceTests.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkCoreTestsStackTraceTests"] === true;
};

let JkCoreTestsBufferTests = function() {
	JkTestUnitTest.call(this);
};

JkCoreTestsBufferTests.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTestUnitTest.prototype);
JkCoreTestsBufferTests.prototype.constructor = JkCoreTestsBufferTests;
JkCoreTestsBufferTests.prototype._t = {
	"JkCoreTestsBufferTests" : true,
	"JkTestUnitTest" : true
};
JkCoreTestsBufferTests.prototype._tobj = JkCoreTestsBufferTests;

JkCoreTestsBufferTests.NEW = function() {
	var v = new JkCoreTestsBufferTests;
	return v.CTOR_JkCoreTestsBufferTests();
};

JkCoreTestsBufferTests.prototype.CTOR_JkCoreTestsBufferTests = function() {
	if(JkTestUnitTest.prototype.CTOR_JkTestUnitTest.call(this) == null) {
		return null;
	}
	return this;
};

JkCoreTestsBufferTests.prototype.testGettingOfBufferSize = function() {
	var str = "Hello World";
	var buff = JkLangString.toUTF8Buffer(str);
	if(!(JkLangBuffer.getSize(buff) == 11)) {
		throw JkTestFailedAssertionException.instance("BufferTests.sling", "34", "2", null);
	}
};

JkCoreTestsBufferTests.prototype.testGettingOfInt8OnBuffer = function() {
	var str = "Hello World";
	var buff = JkLangString.toUTF8Buffer(str);
	if(!(JkLangBuffer.getInt8(buff, 2) == 108)) {
		throw JkTestFailedAssertionException.instance("BufferTests.sling", "41", "2", null);
	}
};

JkCoreTestsBufferTests.prototype.testSettingOfByteOnBuffer = function() {
	var str = "Hello World";
	var buff = JkLangString.toUTF8Buffer(str);
	var byteOn4thIndexBefore = JkLangBuffer.getInt8(buff, 4);
	JkLangBuffer.setByte(buff, 4, (~(~100)));
	var byteOn4thIndexAfter = JkLangBuffer.getInt8(buff, 4);
	if(!(byteOn4thIndexBefore == 111 && byteOn4thIndexAfter == 100)) {
		throw JkTestFailedAssertionException.instance("BufferTests.sling", "51", "2", null);
	}
};

JkCoreTestsBufferTests.prototype.testResizingOfBuffer = function() {
	var str = "Hello World";
	var buff = JkLangString.toUTF8Buffer(str);
	var strSizeBefore = JkLangBuffer.getSize(buff);
	var strResized = JkLangBuffer.resize(buff, 5);
	var strSizeAfter = JkLangBuffer.getSize(strResized);
	if(!(strSizeBefore == 11 && strSizeAfter == 5)) {
		throw JkTestFailedAssertionException.instance("BufferTests.sling", "61", "2", null);
	}
};

JkCoreTestsBufferTests.prototype.testCopyingOfBuffer = function() {
	var strA = "Hello World";
	var strABuffer = JkLangString.toUTF8Buffer(strA);
	var byteInIndex1Before = JkLangBuffer.getInt8(strABuffer, 1);
	var strB = "Testing Copy Form Func";
	var strBBuffer = JkLangString.toUTF8Buffer(strB);
	var byteInIndex3 = JkLangBuffer.getInt8(strBBuffer, 3);
	JkLangBuffer.copyFrom(strABuffer, strBBuffer, 3, 1, 1);
	var byteInIndex1After = JkLangBuffer.getInt8(strABuffer, 1);
	if(!(byteInIndex1Before == 101 && byteInIndex3 == 116 && byteInIndex1After == 116)) {
		throw JkTestFailedAssertionException.instance("BufferTests.sling", "74", "2", null);
	}
};

JkCoreTestsBufferTests.prototype.testGettingOfInt16LEOnBuffer = function() {
	var str = "Hello World";
	var buff = JkLangString.toUTF8Buffer(str);
	if(!(JkLangBuffer.getInt16LE(buff, 4) == 8303)) {
		throw JkTestFailedAssertionException.instance("BufferTests.sling", "81", "2", null);
	}
};

JkCoreTestsBufferTests.prototype.testGettingOfInt16BEOnBuffer = function() {
	var str = "Hello World";
	var buff = JkLangString.toUTF8Buffer(str);
	if(!(JkLangBuffer.getInt16BE(buff, 4) == 28448)) {
		throw JkTestFailedAssertionException.instance("BufferTests.sling", "88", "2", null);
	}
};

JkCoreTestsBufferTests.prototype.testGettingOfInt32LEOnBuffer = function() {
	var str = "Hello World";
	var buff = JkLangString.toUTF8Buffer(str);
	if(!(JkLangBuffer.getInt32LE(buff, 4) == 1867980911)) {
		throw JkTestFailedAssertionException.instance("BufferTests.sling", "95", "2", null);
	}
};

JkCoreTestsBufferTests.prototype.testGettingOfInt32BEOnBuffer = function() {
	var str = "Hello World";
	var buff = JkLangString.toUTF8Buffer(str);
	if(!(JkLangBuffer.getInt32BE(buff, 4) == 1864390511)) {
		throw JkTestFailedAssertionException.instance("BufferTests.sling", "102", "2", null);
	}
};

JkCoreTestsBufferTests.prototype.testBufferLiterals = function() {
	var buffer = new Uint8Array([0x00, 0x01, 0x02, 0x03, 0x04]).buffer;
	if(!(JkLangBuffer.getSize(buffer) == 5)) {
		throw JkTestFailedAssertionException.instance("BufferTests.sling", "108", "2", null);
	}
	if(!(JkLangBuffer.getInt8(buffer, 0) == 0x0)) {
		throw JkTestFailedAssertionException.instance("BufferTests.sling", "109", "2", null);
	}
	if(!(JkLangBuffer.getInt8(buffer, 1) == 0x1)) {
		throw JkTestFailedAssertionException.instance("BufferTests.sling", "110", "2", null);
	}
	if(!(JkLangBuffer.getInt8(buffer, 2) == 0x2)) {
		throw JkTestFailedAssertionException.instance("BufferTests.sling", "111", "2", null);
	}
	if(!(buffer[0] == 0x0)) {
		throw JkTestFailedAssertionException.instance("BufferTests.sling", "112", "2", null);
	}
	if(!(buffer[1] == 0x1)) {
		throw JkTestFailedAssertionException.instance("BufferTests.sling", "113", "2", null);
	}
	if(!(buffer[2] == 0x2)) {
		throw JkTestFailedAssertionException.instance("BufferTests.sling", "114", "2", null);
	}
	if(!(buffer[3] == 0x3)) {
		throw JkTestFailedAssertionException.instance("BufferTests.sling", "115", "2", null);
	}
	if(!(buffer[4] == 0x4)) {
		throw JkTestFailedAssertionException.instance("BufferTests.sling", "116", "2", null);
	}
};

JkCoreTestsBufferTests.prototype.execute = function() {
	var v = true;
	JkLogLog.debug(this.ctx, "Executing test: " + ("BufferTests") + (" / ") + ("get the size of the buffer"));
	try {
		this.testGettingOfBufferSize();
	}
	catch(e) {
		JkLogLog.error(this.ctx, (e.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("BufferTests") + (" / ") + ("get the size of the buffer"));
	JkLogLog.debug(this.ctx, "Executing test: " + ("BufferTests") + (" / ") + ("get Int8 value on the given index"));
	try {
		this.testGettingOfInt8OnBuffer();
	}
	catch(e1) {
		JkLogLog.error(this.ctx, (e1.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("BufferTests") + (" / ") + ("get Int8 value on the given index"));
	JkLogLog.debug(this.ctx, "Executing test: " + ("BufferTests") + (" / ") + ("set value of byte on the give index"));
	try {
		this.testSettingOfByteOnBuffer();
	}
	catch(e2) {
		JkLogLog.error(this.ctx, (e2.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("BufferTests") + (" / ") + ("set value of byte on the give index"));
	JkLogLog.debug(this.ctx, "Executing test: " + ("BufferTests") + (" / ") + ("resize buffer"));
	try {
		this.testResizingOfBuffer();
	}
	catch(e3) {
		JkLogLog.error(this.ctx, (e3.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("BufferTests") + (" / ") + ("resize buffer"));
	JkLogLog.debug(this.ctx, "Executing test: " + ("BufferTests") + (" / ") + ("copy buffer"));
	try {
		this.testCopyingOfBuffer();
	}
	catch(e4) {
		JkLogLog.error(this.ctx, (e4.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("BufferTests") + (" / ") + ("copy buffer"));
	JkLogLog.debug(this.ctx, "Executing test: " + ("BufferTests") + (" / ") + ("get Int16LE value on the given index"));
	try {
		this.testGettingOfInt16LEOnBuffer();
	}
	catch(e5) {
		JkLogLog.error(this.ctx, (e5.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("BufferTests") + (" / ") + ("get Int16LE value on the given index"));
	JkLogLog.debug(this.ctx, "Executing test: " + ("BufferTests") + (" / ") + ("get Int16BE value on the given index"));
	try {
		this.testGettingOfInt16BEOnBuffer();
	}
	catch(e6) {
		JkLogLog.error(this.ctx, (e6.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("BufferTests") + (" / ") + ("get Int16BE value on the given index"));
	JkLogLog.debug(this.ctx, "Executing test: " + ("BufferTests") + (" / ") + ("get Int32LE value on the given index"));
	try {
		this.testGettingOfInt32LEOnBuffer();
	}
	catch(e7) {
		JkLogLog.error(this.ctx, (e7.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("BufferTests") + (" / ") + ("get Int32LE value on the given index"));
	JkLogLog.debug(this.ctx, "Executing test: " + ("BufferTests") + (" / ") + ("get Int32BE value on the given index"));
	try {
		this.testGettingOfInt32BEOnBuffer();
	}
	catch(e8) {
		JkLogLog.error(this.ctx, (e8.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("BufferTests") + (" / ") + ("get Int32BE value on the given index"));
	JkLogLog.debug(this.ctx, "Executing test: " + ("BufferTests") + (" / ") + ("buffer literals"));
	try {
		this.testBufferLiterals();
	}
	catch(e9) {
		JkLogLog.error(this.ctx, (e9.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("BufferTests") + (" / ") + ("buffer literals"));
	return v;
};

JkCoreTestsBufferTests.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkCoreTestsBufferTests"] === true;
};

let JkCoreTestsStringTests = function() {
	JkTestUnitTest.call(this);
};

JkCoreTestsStringTests.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTestUnitTest.prototype);
JkCoreTestsStringTests.prototype.constructor = JkCoreTestsStringTests;
JkCoreTestsStringTests.prototype._t = {
	"JkTestUnitTest" : true,
	"JkCoreTestsStringTests" : true
};
JkCoreTestsStringTests.prototype._tobj = JkCoreTestsStringTests;

JkCoreTestsStringTests.NEW = function() {
	var v = new JkCoreTestsStringTests;
	return v.CTOR_JkCoreTestsStringTests();
};

JkCoreTestsStringTests.prototype.CTOR_JkCoreTestsStringTests = function() {
	if(JkTestUnitTest.prototype.CTOR_JkTestUnitTest.call(this) == null) {
		return null;
	}
	return this;
};

JkCoreTestsStringTests.prototype.testStringOperations = function() {
	var str = "My Test String";
	if(!(JkLangString.forInteger(12345) == "12345")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "33", "2", null);
	}
	if(!(JkLangString.forLongInteger(1550113105) == "1550113105")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "34", "2", null);
	}
	if(!(JkLangString.forIntegerHex(6869, 0) == "1ad5")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "35", "2", null);
	}
	if(!(JkLangString.forIntegerOctal(6869) == "15325")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "36", "2", null);
	}
	if(!(JkLangString.forCharacter('h'.charCodeAt()) == "h")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "37", "2", null);
	}
	if(!(JkLangString.forFloat(3.01) == "3.01")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "38", "2", null);
	}
	if(!(JkLangString.forDouble(3.22) == "3.22")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "39", "2", null);
	}
	if(!(JkLangString.getLength(str) == 14)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "40", "2", null);
	}
	if(!(JkLangString.appendString(str, ": AA") == "My Test String: AA")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "41", "2", null);
	}
	if(!(JkLangString.toUpperCase(str) == "MY TEST STRING")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "42", "2", null);
	}
	if(!(JkLangString.toLowerCase(str) == "my test string")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "43", "2", null);
	}
	if(!(JkLangString.getChar(str, 1) == 'y'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "44", "2", null);
	}
	if(!JkLangString.equals(str, "My Test String")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "45", "2", null);
	}
	if(!JkLangString.equalsIgnoreCase(str, "my test string")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "46", "2", null);
	}
	if(!(JkLangString.compare("aa", "bb") == -1)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "47", "2", null);
	}
	if(!(JkLangString.compare("aaa", "aa") == 1)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "48", "2", null);
	}
	if(!(JkLangString.compareToIgnoreCase("aa", "BB") == -1)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "49", "2", null);
	}
	if(!(JkLangString.getHashCode(str) != 0)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "50", "2", null);
	}
	if(!(JkLangString.getHashCode(str) == JkLangString.getHashCode(str))) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "51", "2", null);
	}
	if(!(JkLangString.getHashCode("aaa") != JkLangString.getHashCode("bbb"))) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "52", "2", null);
	}
	if(!(JkLangString.getIndexOfCharacter(str, 'M'.charCodeAt(), 0) == 0)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "53", "2", null);
	}
	if(!(JkLangString.getIndexOfString(str, "M", 0) == 0)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "54", "2", null);
	}
	if(!(JkLangString.getLastIndexOfCharacter(str, 'T'.charCodeAt(), (-1)) == 3)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "55", "2", null);
	}
	if(!(JkLangString.getLastIndexOfString(str, "g", (-1)) == 13)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "56", "2", null);
	}
	if(!(JkLangString.getEndOfString(str, 3) == "Test String")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "57", "2", null);
	}
	if(!(JkLangString.getSubString(str, 3, 4) == "Test")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "58", "2", null);
	}
	if(!JkLangString.contains(str, "My")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "59", "2", null);
	}
	if(!(JkLangString.contains(str, "MyX") == false)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "60", "2", null);
	}
	if(!JkLangString.startsWith(str, "My", 0)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "61", "2", null);
	}
	if(!JkLangString.endsWith(str, "ing")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "62", "2", null);
	}
	if(!(JkLangString.strip(" A ") == "A")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "63", "2", null);
	}
	if(!(JkLangString.replaceCharacter(str, 'M'.charCodeAt(), 'm'.charCodeAt()) == "my Test String")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "64", "2", null);
	}
	if(!(JkLangString.replaceString(str, "My", "mY") == "mY Test String")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "65", "2", null);
	}
	var chars = JkLangString.toCharArray(str);
	if(!(chars.length == 14)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "67", "2", null);
	}
	if(!(JkLangString.toDouble("4.001") == 4.001)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "68", "2", null);
	}
	if(!(JkLangString.forUTF8Buffer((JkLangString.toUTF8Buffer(str))) == str)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "69", "2", null);
	}
	if(!(JkLangString.forCharArray(chars, 0, 14) == str)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "70", "2", null);
	}
	if(!(JkLangString.forCharArray(chars, 1, 12) == "y Test Strin")) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "71", "2", null);
	}
	if(!(JkLangString.getIndexOfString(null, "Hello World", 0) == -1)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "72", "2", null);
	}
	if(!(JkLangString.getIndexOfString("", "Hello World", 0) == -1)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "73", "2", null);
	}
	if(!(JkLangString.getIndexOfString("Hello World", "Hello World", 0) == 0)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "74", "2", null);
	}
	if(!(JkLangString.getIndexOfString("xHello World", "Hello World", 0) == 1)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "75", "2", null);
	}
	if(!(JkLangString.getIndexOfString("Hello", "", 0) == 0)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "76", "2", null);
	}
	if(!(JkLangString.getIndexOfString("Hello", null, 0) == -1)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "77", "2", null);
	}
	if(!(JkLangString.getIndexOfString("", "", 0) == 0)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "78", "2", null);
	}
	if(!(JkLangString.getIndexOfString(null, "", 0) == -1)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "79", "2", null);
	}
	if(!(JkLangString.getIndexOfCharacter(null, 'c'.charCodeAt(), 0) == -1)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "80", "2", null);
	}
	if(!(JkLangString.getIndexOfCharacter("", 'c'.charCodeAt(), 0) == -1)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "81", "2", null);
	}
	if(!(JkLangString.getIndexOfCharacter("Hello World", 'H'.charCodeAt(), 0) == 0)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "82", "2", null);
	}
	if(!(JkLangString.getIndexOfCharacter("xHello World", 'H'.charCodeAt(), 0) == 1)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "83", "2", null);
	}
	if(!(JkLangString.getIndexOfCharacter("Hello", 0, 0) == -1)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "84", "2", null);
	}
	if(!(JkLangString.getIndexOfCharacter(null, 0, 0) == -1)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "85", "2", null);
	}
};

JkCoreTestsStringTests.prototype.testCodeString = function() {
	var str = "\n/* xxx\n * testing\n */\n";
	var it = JkLangString.iterate(str);
	var start = it.getCurrentPosition();
	if(!(it.getCurrentChar() < 1)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "93", "2", null);
	}
	if(!(it.getNextChar() == '\n'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "94", "2", null);
	}
	if(!(it.getCurrentChar() == '\n'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "95", "2", null);
	}
	var pos = it.getCurrentPosition();
	if(!(it.getNextChar() == '/'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "97", "2", null);
	}
	if(!(it.getNextChar() == '*'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "98", "2", null);
	}
	it.setCurrentPosition(pos);
	if(!(it.getCurrentChar() == '\n'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "100", "2", null);
	}
	if(!(it.getNextChar() == '/'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "101", "2", null);
	}
	if(!(it.getNextChar() == '*'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "102", "2", null);
	}
	if(!(it.getNextChar() == ' '.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "103", "2", null);
	}
	if(!(it.getNextChar() == 'x'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "104", "2", null);
	}
	if(!(it.getNextChar() == 'x'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "105", "2", null);
	}
	if(!(it.getNextChar() == 'x'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "106", "2", null);
	}
	if(!(it.getNextChar() == '\n'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "107", "2", null);
	}
	if(!(it.getNextChar() == ' '.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "108", "2", null);
	}
	it.setCurrentPosition(start);
	if(!(it.getCurrentChar() < 1)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "110", "2", null);
	}
	if(!(it.getNextChar() == '\n'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "111", "2", null);
	}
};

JkCoreTestsStringTests.prototype.testSimpleString = function() {
	var str = "Simple Test";
	var it = JkLangString.iterate(str);
	if(!(it.getNextChar() == 'S'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "118", "2", null);
	}
	if(!(it.getNextChar() == 'i'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "119", "2", null);
	}
	if(!(it.getNextChar() == 'm'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "120", "2", null);
	}
	if(!(it.getNextChar() == 'p'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "121", "2", null);
	}
	if(!(it.getCurrentChar() == 'p'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "122", "2", null);
	}
	it.moveToPreviousChar();
	if(!(it.getCurrentChar() == 'm'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "124", "2", null);
	}
	it.moveToPreviousChar();
	if(!(it.getCurrentChar() == 'i'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "126", "2", null);
	}
	if(!(it.getNextChar() == 'm'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "127", "2", null);
	}
	if(!(it.getNextChar() == 'p'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "128", "2", null);
	}
	if(!(it.getNextChar() == 'l'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "129", "2", null);
	}
	if(!(it.getNextChar() == 'e'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "130", "2", null);
	}
	if(!(it.getNextChar() == ' '.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "131", "2", null);
	}
	if(!(it.getNextChar() == 'T'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "132", "2", null);
	}
	if(!(it.getNextChar() == 'e'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "133", "2", null);
	}
	if(!(it.getNextChar() == 's'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "134", "2", null);
	}
	if(!(it.getNextChar() == 't'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "135", "2", null);
	}
	if(!(it.getNextChar() < 1)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "136", "2", null);
	}
};

JkCoreTestsStringTests.prototype.testMultibyteString = function() {
	var str = "Häviääkö?";
	if(!(JkLangString.getLength(str) == 9)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "142", "2", null);
	}
	if(!(JkLangString.getChar(str, 0) == 'H'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "143", "2", null);
	}
	if(!(JkLangString.getChar(str, 1) == 'ä'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "144", "2", null);
	}
	if(!(JkLangString.getChar(str, 2) == 'v'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "145", "2", null);
	}
	var it = JkLangString.iterate(str);
	if(!(it.getNextChar() == 'H'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "147", "2", null);
	}
	if(!(it.getNextChar() == 'ä'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "148", "2", null);
	}
	if(!(it.getNextChar() == 'v'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "149", "2", null);
	}
	if(!(it.getNextChar() == 'i'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "150", "2", null);
	}
	var pos = it.getCurrentPosition();
	if(!(it.getNextChar() == 'ä'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "152", "2", null);
	}
	if(!(it.getNextChar() == 'ä'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "153", "2", null);
	}
	if(!(it.getCurrentChar() == 'ä'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "154", "2", null);
	}
	it.moveToPreviousChar();
	if(!(it.getCurrentChar() == 'ä'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "156", "2", null);
	}
	it.moveToPreviousChar();
	if(!(it.getCurrentChar() == 'i'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "158", "2", null);
	}
	it.moveToPreviousChar();
	if(!(it.getNextChar() == 'i'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "160", "2", null);
	}
	if(!(it.getNextChar() == 'ä'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "161", "2", null);
	}
	if(!(it.getNextChar() == 'ä'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "162", "2", null);
	}
	if(!(it.getNextChar() == 'k'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "163", "2", null);
	}
	if(!(it.getNextChar() == 'ö'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "164", "2", null);
	}
	if(!(it.getNextChar() == '?'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "165", "2", null);
	}
	if(!(it.getNextChar() < 1)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "166", "2", null);
	}
	it.setCurrentPosition(pos);
	if(!(it.getNextChar() == 'ä'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "168", "2", null);
	}
	if(!(it.getNextChar() == 'ä'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "169", "2", null);
	}
	if(!(it.getNextChar() == 'k'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "170", "2", null);
	}
	if(!(it.getNextChar() == 'ö'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "171", "2", null);
	}
	if(!(it.getNextChar() == '?'.charCodeAt())) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "172", "2", null);
	}
	if(!(it.getNextChar() < 1)) {
		throw JkTestFailedAssertionException.instance("StringTests.sling", "173", "2", null);
	}
};

JkCoreTestsStringTests.prototype.execute = function() {
	var v = true;
	JkLogLog.debug(this.ctx, "Executing test: " + ("StringTests") + (" / ") + ("string operations"));
	try {
		this.testStringOperations();
	}
	catch(e) {
		JkLogLog.error(this.ctx, (e.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("StringTests") + (" / ") + ("string operations"));
	JkLogLog.debug(this.ctx, "Executing test: " + ("StringTests") + (" / ") + ("code string"));
	try {
		this.testCodeString();
	}
	catch(e1) {
		JkLogLog.error(this.ctx, (e1.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("StringTests") + (" / ") + ("code string"));
	JkLogLog.debug(this.ctx, "Executing test: " + ("StringTests") + (" / ") + ("simple string"));
	try {
		this.testSimpleString();
	}
	catch(e2) {
		JkLogLog.error(this.ctx, (e2.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("StringTests") + (" / ") + ("simple string"));
	JkLogLog.debug(this.ctx, "Executing test: " + ("StringTests") + (" / ") + ("multibyte string"));
	try {
		this.testMultibyteString();
	}
	catch(e3) {
		JkLogLog.error(this.ctx, (e3.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("StringTests") + (" / ") + ("multibyte string"));
	return v;
};

JkCoreTestsStringTests.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkCoreTestsStringTests"] === true;
};

let JkCoreTestsVectorTests = function() {
	JkTestUnitTest.call(this);
};

JkCoreTestsVectorTests.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTestUnitTest.prototype);
JkCoreTestsVectorTests.prototype.constructor = JkCoreTestsVectorTests;
JkCoreTestsVectorTests.prototype._t = {
	"JkTestUnitTest" : true,
	"JkCoreTestsVectorTests" : true
};
JkCoreTestsVectorTests.prototype._tobj = JkCoreTestsVectorTests;

JkCoreTestsVectorTests.NEW = function() {
	var v = new JkCoreTestsVectorTests;
	return v.CTOR_JkCoreTestsVectorTests();
};

JkCoreTestsVectorTests.prototype.CTOR_JkCoreTestsVectorTests = function() {
	if(JkTestUnitTest.prototype.CTOR_JkTestUnitTest.call(this) == null) {
		return null;
	}
	return this;
};

JkCoreTestsVectorTests.prototype.testVectorMethods = function() {
	var vc = new Array;
	var astr = "a";
	JkLangVector.append(vc, astr);
	if(!(JkLangVector.getSize(vc) == 1)) {
		throw JkTestFailedAssertionException.instance("VectorTests.sling", "35", "2", null);
	}
	if(!JkLangVector.contains(vc, astr)) {
		throw JkTestFailedAssertionException.instance("VectorTests.sling", "36", "2", null);
	}
	if(!(JkLangVector.get(vc, 0) == astr)) {
		throw JkTestFailedAssertionException.instance("VectorTests.sling", "37", "2", null);
	}
	JkLangVector.insert(vc, "b", 1);
	if(!(JkLangVector.getSize(vc) == 2)) {
		throw JkTestFailedAssertionException.instance("VectorTests.sling", "39", "2", null);
	}
	if(!(JkLangVector.get(vc, 1) == "b")) {
		throw JkTestFailedAssertionException.instance("VectorTests.sling", "40", "2", null);
	}
	JkLangVector.set(vc, 1, "c");
	if(!(JkLangVector.get(vc, 1) == "c")) {
		throw JkTestFailedAssertionException.instance("VectorTests.sling", "42", "2", null);
	}
	JkLangVector.remove(vc, 0);
	if(!(JkLangVector.getSize(vc) == 1)) {
		throw JkTestFailedAssertionException.instance("VectorTests.sling", "44", "2", null);
	}
	if(!(JkLangVector.get(vc, 0) == "c")) {
		throw JkTestFailedAssertionException.instance("VectorTests.sling", "45", "2", null);
	}
	if(!(JkLangVector.isEmpty(vc) == false)) {
		throw JkTestFailedAssertionException.instance("VectorTests.sling", "46", "2", null);
	}
	JkLangVector.clear(vc);
	if(!JkLangVector.isEmpty(vc)) {
		throw JkTestFailedAssertionException.instance("VectorTests.sling", "48", "2", null);
	}
	JkLangVector.append(vc, "a");
	JkLangVector.append(vc, "b");
	JkLangVector.append(vc, "c");
	JkLangVector.append(vc, "d");
	JkLangVector.removeRange(vc, 1, 2);
	if(!(JkLangVector.getSize(vc) == 2)) {
		throw JkTestFailedAssertionException.instance("VectorTests.sling", "54", "2", null);
	}
	if(!(JkLangVector.get(vc, 0) == "a")) {
		throw JkTestFailedAssertionException.instance("VectorTests.sling", "55", "2", null);
	}
	if(!(JkLangVector.get(vc, 1) == "d")) {
		throw JkTestFailedAssertionException.instance("VectorTests.sling", "56", "2", null);
	}
	JkLangVector.clear(vc);
	JkLangVector.append(vc, "d");
	JkLangVector.append(vc, "a");
	JkLangVector.append(vc, "c");
	JkLangVector.append(vc, "b");
	JkLangVector.sortAsStrings(vc);
	if(!(JkLangVector.get(vc, 0) == "a")) {
		throw JkTestFailedAssertionException.instance("VectorTests.sling", "63", "2", null);
	}
	if(!(JkLangVector.get(vc, 1) == "b")) {
		throw JkTestFailedAssertionException.instance("VectorTests.sling", "64", "2", null);
	}
	if(!(JkLangVector.get(vc, 2) == "c")) {
		throw JkTestFailedAssertionException.instance("VectorTests.sling", "65", "2", null);
	}
	if(!(JkLangVector.get(vc, 3) == "d")) {
		throw JkTestFailedAssertionException.instance("VectorTests.sling", "66", "2", null);
	}
};

JkCoreTestsVectorTests.prototype.execute = function() {
	var v = true;
	JkLogLog.debug(this.ctx, "Executing test: " + ("VectorTests") + (" / ") + ("Vector Methods"));
	try {
		this.testVectorMethods();
	}
	catch(e) {
		JkLogLog.error(this.ctx, (e.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("VectorTests") + (" / ") + ("Vector Methods"));
	return v;
};

JkCoreTestsVectorTests.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkCoreTestsVectorTests"] === true;
};

let JkCoreTestsMapTests = function() {
	JkTestUnitTest.call(this);
};

JkCoreTestsMapTests.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTestUnitTest.prototype);
JkCoreTestsMapTests.prototype.constructor = JkCoreTestsMapTests;
JkCoreTestsMapTests.prototype._t = {
	"JkCoreTestsMapTests" : true,
	"JkTestUnitTest" : true
};
JkCoreTestsMapTests.prototype._tobj = JkCoreTestsMapTests;

JkCoreTestsMapTests.NEW = function() {
	var v = new JkCoreTestsMapTests;
	return v.CTOR_JkCoreTestsMapTests();
};

JkCoreTestsMapTests.prototype.CTOR_JkCoreTestsMapTests = function() {
	if(JkTestUnitTest.prototype.CTOR_JkTestUnitTest.call(this) == null) {
		return null;
	}
	return this;
};

JkCoreTestsMapTests.prototype.testMapMethods = function() {
	var map = new Map;
	JkLangMap.set(map, "key", "value");
	if(!(JkLangMap.count(map) == 1)) {
		throw JkTestFailedAssertionException.instance("MapTests.sling", "34", "2", null);
	}
	JkLangMap.set(map, "secondKey", "secondValue");
	if(!(JkLangMap.count(map) == 2)) {
		throw JkTestFailedAssertionException.instance("MapTests.sling", "36", "2", null);
	}
	if(!JkLangMap.containsKey(map, "key")) {
		throw JkTestFailedAssertionException.instance("MapTests.sling", "37", "2", null);
	}
	if(!JkLangMap.containsKey(map, "secondKey")) {
		throw JkTestFailedAssertionException.instance("MapTests.sling", "38", "2", null);
	}
	if(!(JkLangMap.containsKey(map, "thirdKey") == false)) {
		throw JkTestFailedAssertionException.instance("MapTests.sling", "39", "2", null);
	}
	if(!JkLangMap.containsValue(map, "value")) {
		throw JkTestFailedAssertionException.instance("MapTests.sling", "40", "2", null);
	}
	if(!JkLangMap.containsValue(map, "secondValue")) {
		throw JkTestFailedAssertionException.instance("MapTests.sling", "41", "2", null);
	}
	if(!(JkLangMap.containsValue(map, "thirdValue") == false)) {
		throw JkTestFailedAssertionException.instance("MapTests.sling", "42", "2", null);
	}
	if(!(JkLangMap.getValue(map, "key") == "value")) {
		throw JkTestFailedAssertionException.instance("MapTests.sling", "43", "2", null);
	}
	if(!(JkLangMap.getValue(map, "secondKey") == "secondValue")) {
		throw JkTestFailedAssertionException.instance("MapTests.sling", "44", "2", null);
	}
	JkLangMap.remove(map, "key");
	if(!(JkLangMap.count(map) == 1)) {
		throw JkTestFailedAssertionException.instance("MapTests.sling", "46", "2", null);
	}
	if(!(JkLangMap.containsKey(map, "key") == false)) {
		throw JkTestFailedAssertionException.instance("MapTests.sling", "47", "2", null);
	}
	if(!(JkLangMap.containsValue(map, "value") == false)) {
		throw JkTestFailedAssertionException.instance("MapTests.sling", "48", "2", null);
	}
	if(!(JkLangMap.getValue(map, "key") == null)) {
		throw JkTestFailedAssertionException.instance("MapTests.sling", "49", "2", null);
	}
	JkLangMap.clear(map);
	if(!(JkLangMap.count(map) == 0)) {
		throw JkTestFailedAssertionException.instance("MapTests.sling", "51", "2", null);
	}
};

JkCoreTestsMapTests.prototype.execute = function() {
	var v = true;
	JkLogLog.debug(this.ctx, "Executing test: " + ("MapTests") + (" / ") + ("Map Methods"));
	try {
		this.testMapMethods();
	}
	catch(e) {
		JkLogLog.error(this.ctx, (e.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("MapTests") + (" / ") + ("Map Methods"));
	return v;
};

JkCoreTestsMapTests.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkCoreTestsMapTests"] === true;
};

let JkCoreTestsTestMain = function() {};

JkCoreTestsTestMain.prototype._t = { "JkCoreTestsTestMain" : true };
JkCoreTestsTestMain.prototype._tobj = JkCoreTestsTestMain;

JkCoreTestsTestMain.NEW = function() {
	var v = new JkCoreTestsTestMain;
	return v.CTOR_JkCoreTestsTestMain();
};

JkCoreTestsTestMain.prototype.CTOR_JkCoreTestsTestMain = function() {
	return this;
};

JkCoreTestsTestMain._main = function(args) {
	var v = true;
	v = v && JkCoreTestsStringTests.NEW().execute();
	v = v && JkCoreTestsVectorTests.NEW().execute();
	v = v && JkCoreTestsMapTests.NEW().execute();
	v = v && JkCoreTestsStringBuilderTests.NEW().execute();
	v = v && JkCoreTestsBufferTests.NEW().execute();
	v = v && JkCoreTestsStackTraceTests.NEW().execute();
	v = v && JkCoreTestsSystemClockTests.NEW().execute();
	v = v && JkCoreTestsVariableReferenceTests.NEW().execute();
	v = v && JkCoreTestsFileSystemTests.NEW().execute();
	return v ? 0 : 1;
};

JkCoreTestsTestMain._main();

JkCoreTestsTestMain.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkCoreTestsTestMain"] === true;
};
