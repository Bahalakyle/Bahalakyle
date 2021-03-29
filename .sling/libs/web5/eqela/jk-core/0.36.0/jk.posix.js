let JkPosixPosixSignal = function() {};

JkPosixPosixSignal.prototype._t = { "JkPosixPosixSignal" : true };
JkPosixPosixSignal.prototype._tobj = JkPosixPosixSignal;

JkPosixPosixSignal.NEW = function() {
	var v = new JkPosixPosixSignal;
	return v.CTOR_JkPosixPosixSignal();
};

JkPosixPosixSignal.prototype.CTOR_JkPosixPosixSignal = function() {
	return this;
};

JkPosixPosixSignal.trapSignal = function(signum, enabled) {
	return false;
};

JkPosixPosixSignal.prototype.checkSignalState = function(signum) {
	return false;
};

JkPosixPosixSignal.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkPosixPosixSignal"] === true;
};

JkPosixPosixSignal.SIGHUP = 1;
JkPosixPosixSignal.SIGINT = 2;
JkPosixPosixSignal.SIGQUIT = 3;
JkPosixPosixSignal.SIGILL = 4;
JkPosixPosixSignal.SIGTRAP = 5;
JkPosixPosixSignal.SIGABRT = 6;
JkPosixPosixSignal.SIGFPE = 8;
JkPosixPosixSignal.SIGKILL = 9;
JkPosixPosixSignal.SIGSEGV = 11;
JkPosixPosixSignal.SIGPIPE = 13;
JkPosixPosixSignal.SIGALRM = 14;
JkPosixPosixSignal.SIGTERM = 15;

let JkPosixPosixEnvironmentPosixUser = function() {
	this.pwName = null;
	this.pwUid = 0;
	this.pwGid = 0;
	this.pwGecos = null;
	this.pwDir = null;
	this.pwShell = null;
};

JkPosixPosixEnvironmentPosixUser.prototype._t = { "JkPosixPosixEnvironmentPosixUser" : true };
JkPosixPosixEnvironmentPosixUser.prototype._tobj = JkPosixPosixEnvironmentPosixUser;

JkPosixPosixEnvironmentPosixUser.NEW = function() {
	var v = new JkPosixPosixEnvironmentPosixUser;
	return v.CTOR_JkPosixPosixEnvironmentPosixUser();
};

JkPosixPosixEnvironmentPosixUser.prototype.CTOR_JkPosixPosixEnvironmentPosixUser = function() {
	this.pwShell = null;
	this.pwDir = null;
	this.pwGecos = null;
	this.pwGid = 0;
	this.pwUid = 0;
	this.pwName = null;
	return this;
};

JkPosixPosixEnvironmentPosixUser.prototype.getPwName = function() {
	return this.pwName;
};

JkPosixPosixEnvironmentPosixUser.prototype.setPwName = function(v) {
	this.pwName = v;
	return this;
};

JkPosixPosixEnvironmentPosixUser.prototype.getPwUid = function() {
	return this.pwUid;
};

JkPosixPosixEnvironmentPosixUser.prototype.setPwUid = function(v) {
	this.pwUid = v;
	return this;
};

JkPosixPosixEnvironmentPosixUser.prototype.getPwGid = function() {
	return this.pwGid;
};

JkPosixPosixEnvironmentPosixUser.prototype.setPwGid = function(v) {
	this.pwGid = v;
	return this;
};

JkPosixPosixEnvironmentPosixUser.prototype.getPwGecos = function() {
	return this.pwGecos;
};

JkPosixPosixEnvironmentPosixUser.prototype.setPwGecos = function(v) {
	this.pwGecos = v;
	return this;
};

JkPosixPosixEnvironmentPosixUser.prototype.getPwDir = function() {
	return this.pwDir;
};

JkPosixPosixEnvironmentPosixUser.prototype.setPwDir = function(v) {
	this.pwDir = v;
	return this;
};

JkPosixPosixEnvironmentPosixUser.prototype.getPwShell = function() {
	return this.pwShell;
};

JkPosixPosixEnvironmentPosixUser.prototype.setPwShell = function(v) {
	this.pwShell = v;
	return this;
};

JkPosixPosixEnvironmentPosixUser.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkPosixPosixEnvironmentPosixUser"] === true;
};

let JkPosixPosixEnvironment = function() {};

JkPosixPosixEnvironment.prototype._t = { "JkPosixPosixEnvironment" : true };
JkPosixPosixEnvironment.prototype._tobj = JkPosixPosixEnvironment;

JkPosixPosixEnvironment.NEW = function() {
	var v = new JkPosixPosixEnvironment;
	return v.CTOR_JkPosixPosixEnvironment();
};

JkPosixPosixEnvironment.prototype.CTOR_JkPosixPosixEnvironment = function() {
	return this;
};

JkPosixPosixEnvironment.getpwnam = function(username) {
	return null;
};

JkPosixPosixEnvironment.getpwuid = function(uid) {
	return null;
};

JkPosixPosixEnvironment.setuid = function(gid) {
	return false;
};

JkPosixPosixEnvironment.setgid = function(gid) {
	return false;
};

JkPosixPosixEnvironment.seteuid = function(uid) {
	return false;
};

JkPosixPosixEnvironment.setegid = function(gid) {
	return false;
};

JkPosixPosixEnvironment.getuid = function() {
	return -1;
};

JkPosixPosixEnvironment.geteuid = function() {
	return -1;
};

JkPosixPosixEnvironment.getgid = function() {
	return -1;
};

JkPosixPosixEnvironment.getegid = function() {
	return -1;
};

JkPosixPosixEnvironment.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkPosixPosixEnvironment"] === true;
};
