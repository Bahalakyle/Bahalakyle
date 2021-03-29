let JkTestFailedAssertionException = function() {
	JkLangException.call(this);
	this.file = null;
	this.line = null;
	this.column = null;
	this.assertionErrorMessage = null;
};

JkTestFailedAssertionException.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkLangException.prototype);
JkTestFailedAssertionException.prototype.constructor = JkTestFailedAssertionException;
JkTestFailedAssertionException.prototype._t = {
	"JkLangException" : true,
	"JkTestFailedAssertionException" : true,
	"JkLangStringObject" : true
};
JkTestFailedAssertionException.prototype._tobj = JkTestFailedAssertionException;

JkTestFailedAssertionException.NEW = function() {
	var v = new JkTestFailedAssertionException;
	return v.CTOR_JkTestFailedAssertionException();
};

JkTestFailedAssertionException.prototype.CTOR_JkTestFailedAssertionException = function() {
	this.assertionErrorMessage = null;
	this.column = null;
	this.line = null;
	this.file = null;
	if(JkLangException.prototype.CTOR_JkLangException.call(this) == null) {
		return null;
	}
	return this;
};

JkTestFailedAssertionException.instance = function(file, line, column, message) {
	var v = JkTestFailedAssertionException.NEW();
	v.setFile(file);
	v.setLine(line);
	v.setColumn(column);
	v.setAssertionErrorMessage(message);
	return v;
};

JkTestFailedAssertionException.prototype.toString = function() {
	var sb = JkLangStringBuilder.NEW();
	sb.appendString((JkLangString.safeString(this.file)) + (":") + (JkLangString.safeString(this.line)) + (":") + (JkLangString.safeString(this.column)) + (": ") + ("FailedAssertionException"));
	if(this.assertionErrorMessage != null) {
		sb.appendString(": ");
		sb.appendString(this.assertionErrorMessage);
	}
	return sb.toString();
};

JkTestFailedAssertionException.prototype.getFile = function() {
	return this.file;
};

JkTestFailedAssertionException.prototype.setFile = function(v) {
	this.file = v;
	return this;
};

JkTestFailedAssertionException.prototype.getLine = function() {
	return this.line;
};

JkTestFailedAssertionException.prototype.setLine = function(v) {
	this.line = v;
	return this;
};

JkTestFailedAssertionException.prototype.getColumn = function() {
	return this.column;
};

JkTestFailedAssertionException.prototype.setColumn = function(v) {
	this.column = v;
	return this;
};

JkTestFailedAssertionException.prototype.getAssertionErrorMessage = function() {
	return this.assertionErrorMessage;
};

JkTestFailedAssertionException.prototype.setAssertionErrorMessage = function(v) {
	this.assertionErrorMessage = v;
	return this;
};

JkTestFailedAssertionException.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTestFailedAssertionException"] === true;
};

let JkTestUnitTest = function() {
	this.ctx = JkConsoleConsoleApplicationContext.NEW();
};

JkTestUnitTest.prototype._t = { "JkTestUnitTest" : true };
JkTestUnitTest.prototype._tobj = JkTestUnitTest;

JkTestUnitTest.NEW = function() {
	var v = new JkTestUnitTest;
	return v.CTOR_JkTestUnitTest();
};

JkTestUnitTest.prototype.CTOR_JkTestUnitTest = function() {
	this.ctx = JkConsoleConsoleApplicationContext.NEW();
	this.ctx.setEnableDebugMessages(true);
	return this;
};

JkTestUnitTest.prototype.execute = function() {};

JkTestUnitTest.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTestUnitTest"] === true;
};

let JkTestTestSet = function() {
	this.ctx = JkConsoleConsoleApplicationContext.NEW();
	this.total = 0;
	this.failed = 0;
};

JkTestTestSet.prototype._t = { "JkTestTestSet" : true };
JkTestTestSet.prototype._tobj = JkTestTestSet;

JkTestTestSet.NEW = function() {
	var v = new JkTestTestSet;
	return v.CTOR_JkTestTestSet();
};

JkTestTestSet.prototype.CTOR_JkTestTestSet = function() {
	this.failed = 0;
	this.total = 0;
	this.ctx = JkConsoleConsoleApplicationContext.NEW();
	return this;
};

JkTestTestSet.prototype.test = function() {
};

JkTestTestSet.prototype.execute = function() {
	this.test();
	if(this.failed > 0) {
		return 1;
	}
	return 0;
};

JkTestTestSet.prototype.getTotal = function() {
	return this.total;
};

JkTestTestSet.prototype.setTotal = function(v) {
	this.total = v;
	return this;
};

JkTestTestSet.prototype.getFailed = function() {
	return this.failed;
};

JkTestTestSet.prototype.setFailed = function(v) {
	this.failed = v;
	return this;
};

JkTestTestSet.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTestTestSet"] === true;
};
