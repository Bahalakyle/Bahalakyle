let JkFsFileReader = {};

JkFsFileReader.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkFsFileReader"] === true;
};

let JkFsPathInfo = function() {};

JkFsPathInfo.prototype._t = { "JkFsPathInfo" : true };
JkFsPathInfo.prototype._tobj = JkFsPathInfo;

JkFsPathInfo.NEW = function() {
	var v = new JkFsPathInfo;
	return v.CTOR_JkFsPathInfo();
};

JkFsPathInfo.prototype.CTOR_JkFsPathInfo = function() {
	return this;
};

JkFsPathInfo.getPathSeparator = function() {
	return '/'.charCodeAt();
};

JkFsPathInfo.isAbsolutePath = function(path) {
	if(!(path != null)) {
		return false;
	}
	return JkLangString.startsWith(path, "/", 0);
};

JkFsPathInfo.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkFsPathInfo"] === true;
};

let JkFsFileInfo = function() {
	this.file = null;
	this.size = 0;
	this.createTime = 0;
	this.accessTime = 0;
	this.modifyTime = 0;
	this.ownerUser = 0;
	this.ownerGroup = 0;
	this.mode = 0;
	this.executable = false;
	this.type = 0;
	this.link = false;
};

JkFsFileInfo.prototype._t = { "JkFsFileInfo" : true };
JkFsFileInfo.prototype._tobj = JkFsFileInfo;

JkFsFileInfo.NEW = function() {
	var v = new JkFsFileInfo;
	return v.CTOR_JkFsFileInfo();
};

JkFsFileInfo.prototype.CTOR_JkFsFileInfo = function() {
	this.link = false;
	this.type = 0;
	this.executable = false;
	this.mode = 0;
	this.ownerGroup = 0;
	this.ownerUser = 0;
	this.modifyTime = 0;
	this.accessTime = 0;
	this.createTime = 0;
	this.size = 0;
	this.file = null;
	return this;
};

JkFsFileInfo.forFile = function(file) {
	if(file == null) {
		return JkFsFileInfo.NEW();
	}
	return file.stat();
};

JkFsFileInfo.prototype.setFile = function(v) {
	this.file = v;
};

JkFsFileInfo.prototype.setSize = function(v) {
	this.size = v;
};

JkFsFileInfo.prototype.setCreateTime = function(v) {
	this.createTime = v;
};

JkFsFileInfo.prototype.setAccessTime = function(v) {
	this.accessTime = v;
};

JkFsFileInfo.prototype.setModifyTime = function(v) {
	this.modifyTime = v;
};

JkFsFileInfo.prototype.setOwnerUser = function(v) {
	this.ownerUser = v;
};

JkFsFileInfo.prototype.setOwnerGroup = function(v) {
	this.ownerGroup = v;
};

JkFsFileInfo.prototype.setMode = function(v) {
	this.mode = v;
};

JkFsFileInfo.prototype.setExecutable = function(v) {
	this.executable = v;
};

JkFsFileInfo.prototype.setType = function(v) {
	this.type = v;
};

JkFsFileInfo.prototype.setLink = function(v) {
	this.link = v;
};

JkFsFileInfo.prototype.getFile = function() {
	return this.file;
};

JkFsFileInfo.prototype.getSize = function() {
	return this.size;
};

JkFsFileInfo.prototype.getCreateTime = function() {
	return this.createTime;
};

JkFsFileInfo.prototype.getCreateTimeUTC = function() {
	return this.createTime + JkTimeSystemClock.getTimezoneOffsetAsSeconds();
};

JkFsFileInfo.prototype.getAccessTime = function() {
	return this.accessTime;
};

JkFsFileInfo.prototype.getAccessTimeUTC = function() {
	return this.accessTime + JkTimeSystemClock.getTimezoneOffsetAsSeconds();
};

JkFsFileInfo.prototype.getModifyTime = function() {
	return this.modifyTime;
};

JkFsFileInfo.prototype.getModifyTimeUTC = function() {
	return this.modifyTime + JkTimeSystemClock.getTimezoneOffsetAsSeconds();
};

JkFsFileInfo.prototype.getOwnerUser = function() {
	return this.ownerUser;
};

JkFsFileInfo.prototype.getOwnerGroup = function() {
	return this.ownerGroup;
};

JkFsFileInfo.prototype.getMode = function() {
	return this.mode;
};

JkFsFileInfo.prototype.getExecutable = function() {
	return this.executable;
};

JkFsFileInfo.prototype.getType = function() {
	return this.type;
};

JkFsFileInfo.prototype.getLink = function() {
	return this.link;
};

JkFsFileInfo.prototype.isFile = function() {
	if(this.type == JkFsFileInfo.FILE_TYPE_FILE) {
		return true;
	}
	return false;
};

JkFsFileInfo.prototype.isLink = function() {
	return this.link;
};

JkFsFileInfo.prototype.isDirectory = function() {
	if(this.type == JkFsFileInfo.FILE_TYPE_DIR) {
		return true;
	}
	return false;
};

JkFsFileInfo.prototype.exists = function() {
	return this.isFile() || this.isDirectory() || this.isLink();
};

JkFsFileInfo.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkFsFileInfo"] === true;
};

JkFsFileInfo.FILE_TYPE_UNKNOWN = 0;
JkFsFileInfo.FILE_TYPE_FILE = 1;
JkFsFileInfo.FILE_TYPE_DIR = 2;
let JkFsFileWriter = {};

JkFsFileWriter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkFsFileWriter"] === true;
};

let JkFsCurrentDirectory = function() {};

JkFsCurrentDirectory.prototype._t = { "JkFsCurrentDirectory" : true };
JkFsCurrentDirectory.prototype._tobj = JkFsCurrentDirectory;

JkFsCurrentDirectory.NEW = function() {
	var v = new JkFsCurrentDirectory;
	return v.CTOR_JkFsCurrentDirectory();
};

JkFsCurrentDirectory.prototype.CTOR_JkFsCurrentDirectory = function() {
	return this;
};

JkFsCurrentDirectory.set = function(dir) {
	if(!(dir != null)) {
		return;
	}
	console.log("[jk.fs.CurrentDirectory.set] (CurrentDirectory.sling:36:3): Not implemented");
};

JkFsCurrentDirectory.get = function() {
	console.log("[jk.fs.CurrentDirectory.get] (CurrentDirectory.sling:49:3): Not implemented");
	return JkFsFileInvalid.NEW();
};

JkFsCurrentDirectory.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkFsCurrentDirectory"] === true;
};

let JkFsFileForBrowserMyFileWriter = function() {
	this.key = null;
	this.isAppend = false;
	this.buffWriter = null;
};

JkFsFileForBrowserMyFileWriter.prototype._t = {
	"JkIoWriter" : true,
	"JkIoSeekableWriter" : true,
	"JkFsFileWriter" : true,
	"JkFsFileForBrowserMyFileWriter" : true,
	"JkLangClosable" : true
};
JkFsFileForBrowserMyFileWriter.prototype._tobj = JkFsFileForBrowserMyFileWriter;

JkFsFileForBrowserMyFileWriter.NEW = function() {
	var v = new JkFsFileForBrowserMyFileWriter;
	return v.CTOR_JkFsFileForBrowserMyFileWriter();
};

JkFsFileForBrowserMyFileWriter.prototype.CTOR_JkFsFileForBrowserMyFileWriter = function() {
	this.buffWriter = null;
	this.isAppend = false;
	this.key = null;
	return this;
};

JkFsFileForBrowserMyFileWriter.prototype.write = function(buf, size) {
	if(!(this.buffWriter != null)) {
		this.buffWriter = JkIoBufferWriter.NEW();
	}
	return this.buffWriter.write(buf, size);
};

JkFsFileForBrowserMyFileWriter.prototype.close = function() {
	if(!(this.buffWriter != null)) {
		return;
	}
	if(this.isAppend == true) {
		var data = window.localStorage.getItem(this.key);
		var buffer = JkLangBuffer.append(JkLangString.toUTF8Buffer(data), this.buffWriter.getBuffer());
		window.localStorage.setItem(this.key, JkLangString.forUTF8Buffer(buffer));
	}
	else {
		window.localStorage.setItem(this.key, this.buffWriter.getBuffer());
	}
	;
};

JkFsFileForBrowserMyFileWriter.prototype.getKey = function() {
	return this.key;
};

JkFsFileForBrowserMyFileWriter.prototype.setKey = function(v) {
	this.key = v;
	return this;
};

JkFsFileForBrowserMyFileWriter.prototype.getIsAppend = function() {
	return this.isAppend;
};

JkFsFileForBrowserMyFileWriter.prototype.setIsAppend = function(v) {
	this.isAppend = v;
	return this;
};

JkFsFileForBrowserMyFileWriter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkFsFileForBrowserMyFileWriter"] === true;
};

let JkFsFileForBrowserMyFileReader = function() {
	this.key = null;
	this.buffReader = null;
};

JkFsFileForBrowserMyFileReader.prototype._t = {
	"JkLangClosable" : true,
	"JkIoReader" : true,
	"JkFsFileForBrowserMyFileReader" : true,
	"JkIoSizedReader" : true,
	"JkIoSeekableReader" : true,
	"JkFsFileReader" : true
};
JkFsFileForBrowserMyFileReader.prototype._tobj = JkFsFileForBrowserMyFileReader;

JkFsFileForBrowserMyFileReader.NEW = function() {
	var v = new JkFsFileForBrowserMyFileReader;
	return v.CTOR_JkFsFileForBrowserMyFileReader();
};

JkFsFileForBrowserMyFileReader.prototype.CTOR_JkFsFileForBrowserMyFileReader = function() {
	this.buffReader = null;
	this.key = null;
	return this;
};

JkFsFileForBrowserMyFileReader.prototype.read = function(buffer) {
	var data = null;
	if(!(this.buffReader != null)) {
		data = window.localStorage.getItem(this.key);
		;
		var buf = JkLangString.toUTF8Buffer(data);
		this.buffReader = JkIoBufferReader.forBuffer(buf);
	}
	return this.buffReader.read(buffer);
};

JkFsFileForBrowserMyFileReader.prototype.getKey = function() {
	return this.key;
};

JkFsFileForBrowserMyFileReader.prototype.setKey = function(v) {
	this.key = v;
	return this;
};

JkFsFileForBrowserMyFileReader.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkFsFileForBrowserMyFileReader"] === true;
};

let JkFsFile = function() {
	this.lastErrorDescription = null;
};

JkFsFile.prototype._t = {
	"JkLangStringObject" : true,
	"JkFsFile" : true
};
JkFsFile.prototype._tobj = JkFsFile;

JkFsFile.NEW = function() {
	var v = new JkFsFile;
	return v.CTOR_JkFsFile();
};

JkFsFile.prototype.CTOR_JkFsFile = function() {
	this.lastErrorDescription = null;
	return this;
};

JkFsFile.asFile = function(o) {
	if(!(o != null)) {
		return null;
	}
	if(JkFsFile.IS_INSTANCE && JkFsFile.IS_INSTANCE(o)) {
		return o;
	}
	var ss = JkLangString.asString(o);
	if(ss != null) {
		return JkFsFile.forPath(ss);
	}
	return null;
};

JkFsFile.asFileVector = function(o) {
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
		var ff = JkFsFile.asFile(oo);
		if(ff != null) {
			v.push(ff);
		}
	}
	return v;
};

JkFsFile.forPath = function(path) {
	if(path == null || JkLangString.getLength(path) < 1) {
		return JkFsFileInvalid.NEW();
	}
	return JkFsFileForBrowser.forPath(path);
};

JkFsFile.forRawPath = function(path) {
	return JkFsFile.forPath(path);
};

JkFsFile.forRelativePath = function(path, relativeTo, alwaysSupportWindowsPathnames) {
	if(relativeTo == null) {
		return JkFsFile.forPath(path);
	}
	if(path == null) {
		return JkFsFileInvalid.NEW();
	}
	if(JkFsPathInfo.isAbsolutePath(path)) {
		return JkFsFile.forPath(path);
	}
	var sep = JkFsPathInfo.getPathSeparator();
	if(sep != '/'.charCodeAt()) {
		if(JkLangString.getIndexOfCharacter(path, sep, 0) < 0 && JkLangString.getIndexOfCharacter(path, '/'.charCodeAt(), 0) >= 0) {
			sep = '/'.charCodeAt();
		}
	}
	else if(alwaysSupportWindowsPathnames) {
		if(JkLangString.getIndexOfCharacter(path, sep, 0) < 0 && JkLangString.getIndexOfCharacter(path, '\\'.charCodeAt(), 0) >= 0) {
			sep = '\\'.charCodeAt();
		}
	}
	var f = relativeTo;
	var comps = JkLangString.split(path, sep, 0);
	if(comps != null) {
		var n = 0;
		var m = comps.length;
		for(n = 0 ; n < m ; n++) {
			var comp = comps[n];
			if(comp != null) {
				if(JkLangString.isEmpty(comp)) {
					continue;
				}
				f = f.entry(comp);
			}
		}
	}
	return f;
};

JkFsFile.prototype.entry = function(name) {};

JkFsFile.prototype.rawEntry = function(name) {
	return this.entry(name);
};

JkFsFile.prototype.entries = function() {};

JkFsFile.prototype.move = function(dest, replace) {};

JkFsFile.prototype.touch = function() {};

JkFsFile.prototype.read = function() {};

JkFsFile.prototype.write = function() {};

JkFsFile.prototype.append = function() {};

JkFsFile.prototype.stat = function() {};

JkFsFile.prototype.createDirectory = function() {};

JkFsFile.prototype.createDirectoryRecursive = function() {};

JkFsFile.prototype.removeDirectory = function() {};

JkFsFile.prototype.getPath = function() {};

JkFsFile.prototype.remove = function() {};

JkFsFile.prototype.makeExecutable = function() {};

JkFsFile.prototype.getRelativePath = function(baseFile, prefix) {
	if(!(baseFile != null)) {
		return null;
	}
	var vp = this.getPath();
	var bp = baseFile.getPath();
	while(JkLangString.endsWith(bp, "/") || JkLangString.endsWith(bp, "\\")){
		bp = JkLangString.getSubString(bp, 0, (JkLangString.getLength(bp) - 1));
	}
	if(JkLangString.startsWith(vp, (JkLangString.safeString(bp)) + ("/"), 0) || JkLangString.startsWith(vp, (JkLangString.safeString(bp)) + ("\\"), 0)) {
		if(prefix != null) {
			return (JkLangString.safeString(prefix)) + (JkLangString.safeString((JkLangString.getEndOfString(vp, (JkLangString.getLength(bp))))));
		}
		return JkLangString.getEndOfString(vp, (JkLangString.getLength(bp) + 1));
	}
	return null;
};

JkFsFile.prototype.getRelativePathOrBasename = function(baseFile, prefix) {
	var v = this.getRelativePath(baseFile, prefix);
	if(v != null) {
		return v;
	}
	return this.getBasename();
};

JkFsFile.prototype.rename = function(newname, replace) {
	return this.move((JkFsFile.forRelativePath(newname, (this.getParent()), false)), replace);
};

JkFsFile.prototype.writeFromReader = function(reader, doAppend) {
	this.onError(null);
	if(!(reader != null)) {
		return false;
	}
	var buffer = new ArrayBuffer(1024);
	if(!(buffer != null)) {
		return false;
	}
	var writer = null;
	if(doAppend) {
		writer = this.append();
	}
	else {
		writer = this.write();
	}
	if(!(writer != null)) {
		return false;
	}
	var v = true;
	while(true){
		var r = reader.read(buffer);
		if(r < 1) {
			break;
		}
		var w = writer.write(buffer, r);
		if(w < r) {
			v = false;
			break;
		}
	}
	writer.close();
	return v;
};

JkFsFile.prototype.createFifo = function() {
	this.onError("Not supported");
	return false;
};

JkFsFile.prototype.isExecutable = function() {
	return false;
};

JkFsFile.prototype.exists = function() {
	this.onError(null);
	var fi = this.stat();
	return fi.getType() != JkFsFileInfo.FILE_TYPE_UNKNOWN;
};

JkFsFile.prototype.isIdentical = function(file) {
	if(!(file != null)) {
		return false;
	}
	var myrd = this.read();
	if(!(myrd != null)) {
		return false;
	}
	var oord = file.read();
	if(!(oord != null)) {
		return false;
	}
	var mybuf = new ArrayBuffer(1024);
	if(!(mybuf != null)) {
		return false;
	}
	var oobuf = new ArrayBuffer(1024);
	if(!(oobuf != null)) {
		return false;
	}
	var v = true;
	while(v){
		var myr = myrd.read(mybuf);
		var oor = oord.read(oobuf);
		if(myr != oor) {
			v = false;
		}
		else {
			if(myr < 1) {
				break;
			}
			for(var n = 0 ; n < myr ; n++) {
				if(mybuf[n] != oobuf[n]) {
					v = false;
				}
			}
		}
	}
	myrd.close();
	oord.close();
	return v;
};

JkFsFile.prototype.getLastErrorDescription = function() {
	return this.lastErrorDescription;
};

JkFsFile.prototype.onError = function(v) {
	var pp = this.getPath();
	if(!(v != null)) {
		this.lastErrorDescription = null;
	}
	else if(pp != null) {
		this.lastErrorDescription = (JkLangString.safeString(pp)) + (": ") + (JkLangString.safeString(v));
	}
	else {
		this.lastErrorDescription = v;
	}
};

JkFsFile.prototype.readLines = function() {
	var rd = JkIoPrintReader.forReader((this.read()));
	if(!(rd != null)) {
		return null;
	}
	return JkFsFileReadLineIterator.NEW().setReader(rd);
};

JkFsFile.prototype.readLinesVector = function() {
	var it = this.readLines();
	if(!(it != null)) {
		return null;
	}
	var v = new Array;
	while(true){
		var line = it.next();
		if(!(line != null)) {
			break;
		}
		v.push(line);
	}
	return v;
};

JkFsFile.prototype.hasChangedSince = function(originalTimeStamp) {
	var nts = this.getLastModifiedTimeStamp();
	if(nts > originalTimeStamp) {
		return true;
	}
	return false;
};

JkFsFile.prototype.getLastModifiedTimeStamp = function() {
	if(this.isFile() == false) {
		return 0;
	}
	var st = this.stat();
	if(st == null) {
		return 0;
	}
	return ~(~st.getModifyTime());
};

JkFsFile.prototype.compareModificationTime = function(bf) {
	if(bf == null) {
		return 1;
	}
	var myts = this.getLastModifiedTimeStamp();
	var bfts = bf.getLastModifiedTimeStamp();
	if(myts < bfts) {
		return -1;
	}
	if(myts > bfts) {
		return 1;
	}
	return 0;
};

JkFsFile.prototype.isNewerThan = function(bf) {
	return this.compareModificationTime(bf) > 0;
};

JkFsFile.prototype.isOlderThan = function(bf) {
	return this.compareModificationTime(bf) < 0;
};

JkFsFile.prototype.isSame = function(file) {
	this.onError(null);
	if(!(file != null)) {
		return false;
	}
	var path = this.getPath();
	if(path != null && path == file.getPath()) {
		return true;
	}
	return false;
};

JkFsFile.prototype.removeRecursive = function() {
	this.onError(null);
	var finfo = this.stat();
	if(!(finfo != null)) {
		return true;
	}
	if(finfo.isDirectory() == false || finfo.isLink() == true) {
		return this.remove();
	}
	var it = this.entries();
	if(!(it != null)) {
		return false;
	}
	while(it != null){
		var f = it.next();
		if(!(f != null)) {
			break;
		}
		if(!f.removeRecursive()) {
			this.onError((f.getLastErrorDescription()));
			return false;
		}
	}
	return this.removeDirectory();
};

JkFsFile.prototype.isFile = function() {
	var st = this.stat();
	if(!(st != null)) {
		return false;
	}
	return st.isFile();
};

JkFsFile.prototype.isDirectory = function() {
	var st = this.stat();
	if(!(st != null)) {
		return false;
	}
	return st.isDirectory();
};

JkFsFile.prototype.isLink = function() {
	var st = this.stat();
	if(!(st != null)) {
		return false;
	}
	return st.isLink();
};

JkFsFile.prototype.getSize = function() {
	var st = this.stat();
	if(st == null) {
		return 0;
	}
	return st.getSize();
};

JkFsFile.prototype.setMode = function(mode) {
	this.onError("Not supported");
	return false;
};

JkFsFile.prototype.setOwnerUser = function(uid) {
	this.onError("Not supported");
	return false;
};

JkFsFile.prototype.setOwnerGroup = function(gid) {
	this.onError("Not supported");
	return false;
};

JkFsFile.prototype.withExtension = function(ext) {
	if(!(ext != null)) {
		return this;
	}
	var bn = this.getBasename();
	return this.getSibling((JkLangString.safeString(bn)) + (".") + (JkLangString.safeString(ext)));
};

JkFsFile.prototype.asExecutable = function() {
	return this;
};

JkFsFile.prototype.getParent = function() {
	this.onError(null);
	var path = this.directoryName();
	if(path == null) {
		return JkFsFileInvalid.NEW();
	}
	return JkFsFile.forPath(path);
};

JkFsFile.prototype.getSibling = function(name) {
	var pp = this.getParent();
	if(!(pp != null)) {
		return null;
	}
	if(name == null) {
		return pp;
	}
	return pp.entry(name);
};

JkFsFile.prototype.hasExtension = function(ext) {
	var xx = this.extension();
	if(!(xx != null)) {
		return false;
	}
	return JkLangString.equalsIgnoreCase(xx, ext);
};

JkFsFile.prototype.extension = function() {
	var bn = this.getBasename();
	if(!(bn != null)) {
		return null;
	}
	var dot = JkLangString.getLastIndexOfCharacter(bn, '.'.charCodeAt(), (-1));
	if(dot < 0) {
		return null;
	}
	return JkLangString.getEndOfString(bn, (dot + 1));
};

JkFsFile.prototype.directoryName = function() {
	var path = this.getPath();
	if(!(path != null)) {
		return null;
	}
	var delim = JkFsPathInfo.getPathSeparator();
	var dp = JkLangString.getLastIndexOfCharacter(path, delim, (-1));
	if(delim != '/'.charCodeAt()) {
		var sdp = JkLangString.getLastIndexOfCharacter(path, '/'.charCodeAt(), (-1));
		if(sdp > dp) {
			dp = sdp;
		}
	}
	if(dp < 0) {
		return ".";
	}
	return JkLangString.getSubString(path, 0, dp);
};

JkFsFile.prototype.getBasename = function() {
	var path = this.getPath();
	if(!(path != null)) {
		return null;
	}
	var delim = JkFsPathInfo.getPathSeparator();
	if(JkLangString.endsWith(path, (JkLangString.forCharacter(delim)))) {
		path = JkLangString.getSubString(path, 0, (JkLangString.getLength(path) - 1));
	}
	if(delim != '/'.charCodeAt() && JkLangString.endsWith(path, "/")) {
		path = JkLangString.getSubString(path, 0, (JkLangString.getLength(path) - 1));
	}
	var dp = JkLangString.getLastIndexOfCharacter(path, delim, (-1));
	if(delim != '/'.charCodeAt()) {
		var sdp = JkLangString.getLastIndexOfCharacter(path, '/'.charCodeAt(), (-1));
		if(sdp > dp) {
			dp = sdp;
		}
	}
	if(dp < 0) {
		return path;
	}
	return JkLangString.getEndOfString(path, (dp + 1));
};

JkFsFile.prototype.getBasenameWithoutExtension = function() {
	var bn = this.getBasename();
	if(!(bn != null)) {
		return null;
	}
	var dot = JkLangString.getLastIndexOfCharacter(bn, '.'.charCodeAt(), (-1));
	if(dot < 0) {
		return bn;
	}
	return JkLangString.getSubString(bn, 0, dot);
};

JkFsFile.prototype.baseName = function() {
	return this.getBasename();
};

JkFsFile.prototype.baseNameWithoutExtension = function() {
	return this.getBasenameWithoutExtension();
};

JkFsFile.prototype.copyFileTo = function(dest) {
	this.onError(null);
	if(!(dest != null)) {
		return false;
	}
	if(this.isSame(dest)) {
		return true;
	}
	var buf = new ArrayBuffer(4096 * 4);
	if(!(buf != null)) {
		return false;
	}
	var reader = this.read();
	if(!(reader != null)) {
		return false;
	}
	var writer = dest.write();
	if(!(writer != null)) {
		if(JkLangClosable.IS_INSTANCE && JkLangClosable.IS_INSTANCE(reader)) {
			reader.close();
		}
		this.onError((dest.getLastErrorDescription()));
		return false;
	}
	var v = true;
	var n = 0;
	while((n = reader.read(buf)) > 0){
		var nr = writer.write(buf, n);
		if(nr != n) {
			v = false;
			break;
		}
	}
	if(v) {
		var fi = this.stat();
		if(fi != null) {
			var mode = fi.getMode();
			if(mode != 0) {
				dest.setMode(mode);
			}
		}
	}
	else {
		dest.remove();
	}
	if(reader != null && (JkLangClosable.IS_INSTANCE && JkLangClosable.IS_INSTANCE(reader))) {
		reader.close();
	}
	if(writer != null && (JkLangClosable.IS_INSTANCE && JkLangClosable.IS_INSTANCE(writer))) {
		writer.close();
	}
	return v;
};

JkFsFile.prototype.copyFileOrDirectoryTo = function(dest) {
	if(!(dest != null)) {
		return false;
	}
	if(this.isFile()) {
		return this.copyFileTo(dest);
	}
	if(!this.isDirectory()) {
		return false;
	}
	if(!dest.createDirectoryRecursive()) {
		return false;
	}
	var it = this.entries();
	if(!(it != null)) {
		return false;
	}
	while(true){
		var nsrc = it.next();
		if(!(nsrc != null)) {
			break;
		}
		var ndest = dest.entry((nsrc.getBasename()));
		if(!nsrc.copyFileOrDirectoryTo(ndest)) {
			return false;
		}
	}
	return true;
};

JkFsFile.prototype.setContentsString = function(str, encoding) {
	if(JkLangString.isEmpty(encoding)) {
		return false;
	}
	return this.setContentsBuffer((JkLangString.toBuffer(str, encoding)));
};

JkFsFile.prototype.setContentsUTF8 = function(str) {
	return this.setContentsBuffer((JkLangString.toUTF8Buffer(str)));
};

JkFsFile.prototype.setContentsBuffer = function(buffer) {
	this.onError(null);
	if(!(buffer != null)) {
		return false;
	}
	var writer = this.write();
	if(!(writer != null)) {
		return false;
	}
	if(writer.write(buffer, buffer.byteLength) < 0) {
		return false;
	}
	writer.close();
	return true;
};

JkFsFile.prototype.getContentsString = function(encoding) {
	if(JkLangString.isEmpty(encoding)) {
		return null;
	}
	var b = this.getContentsBuffer();
	if(!(b != null)) {
		if(this.isFile() && this.getSize() == 0) {
			return "";
		}
		return null;
	}
	return JkLangString.forBuffer(b, encoding);
};

JkFsFile.prototype.getContentsUTF8 = function() {
	var b = this.getContentsBuffer();
	if(!(b != null)) {
		if(this.isFile() && this.getSize() == 0) {
			return "";
		}
		return null;
	}
	return JkLangString.forUTF8Buffer(b);
};

JkFsFile.prototype.getContentsBuffer = function() {
	this.onError(null);
	var reader = this.read();
	if(!(reader != null)) {
		return null;
	}
	var sz = reader.getSize();
	if(sz < 1) {
		reader.close();
		return null;
	}
	var b = new ArrayBuffer(sz);
	var rsz = reader.read(b);
	reader.close();
	if(rsz < sz) {
		return null;
	}
	return b;
};

JkFsFile.prototype.toString = function() {
	return this.getPath();
};

JkFsFile.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkFsFile"] === true;
};

let JkFsFileKit = function() {
	this.ctx = null;
};

JkFsFileKit.prototype._t = { "JkFsFileKit" : true };
JkFsFileKit.prototype._tobj = JkFsFileKit;

JkFsFileKit.NEW_JkLogLoggingContext = function(ctx) {
	var v = new JkFsFileKit;
	return v.CTOR_JkFsFileKit_JkLogLoggingContext(ctx);
};

JkFsFileKit.prototype.CTOR_JkFsFileKit_JkLogLoggingContext = function(ctx) {
	this.ctx = null;
	this.ctx = ctx;
	return this;
};

JkFsFileKit.prototype.asFile = function(file) {
	var fo = JkFsFile.asFile(file);
	if(!(fo != null)) {
		JkLangError._throw("invalidParameter", (JkLangString.asString(file)));
	}
	return fo;
};

JkFsFileKit.prototype.copy = function(src, dst) {
	var srcf = this.asFile(src);
	var dstf = this.asFile(dst);
	if(dstf.isDirectory()) {
		dstf = dstf.entry((srcf.getBasename()));
	}
	if(!srcf.copyFileOrDirectoryTo(dstf)) {
		JkLangError._throw("failedToCopy", (srcf.getPath()));
	}
	return dstf;
};

JkFsFileKit.prototype.remove = function(file) {
	var fo = this.asFile(file);
	if(!fo.removeRecursive()) {
		JkLangError._throw("failedToRemove", (fo.getPath()));
	}
};

JkFsFileKit.prototype.readAsBuffer = function(file) {
	var fo = this.asFile(file);
	var v = fo.getContentsBuffer();
	if(!(v != null)) {
		JkLangError._throw("failedToRead", (fo.getPath()));
	}
	return v;
};

JkFsFileKit.prototype.readAsString = function(file) {
	var fo = this.asFile(file);
	var v = fo.getContentsUTF8();
	if(!(v != null)) {
		JkLangError._throw("failedToRead", (fo.getPath()));
	}
	return v;
};

JkFsFileKit.prototype.writeBuffer = function(file, data) {
	var fo = this.asFile(file);
	if(!fo.setContentsBuffer(data)) {
		JkLangError._throw("failedToWrite", (fo.getPath()));
	}
};

JkFsFileKit.prototype.writeString = function(file, data) {
	var fo = this.asFile(file);
	if(!fo.setContentsUTF8((JkLangString.asString(data)))) {
		JkLangError._throw("failedToWrite", (fo.getPath()));
	}
};

JkFsFileKit.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkFsFileKit"] === true;
};

let JkFsFileInvalid = function() {
	JkFsFile.call(this);
};

JkFsFileInvalid.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkFsFile.prototype);
JkFsFileInvalid.prototype.constructor = JkFsFileInvalid;
JkFsFileInvalid.prototype._t = {
	"JkLangStringObject" : true,
	"JkFsFileInvalid" : true,
	"JkFsFile" : true
};
JkFsFileInvalid.prototype._tobj = JkFsFileInvalid;

JkFsFileInvalid.NEW = function() {
	var v = new JkFsFileInvalid;
	return v.CTOR_JkFsFileInvalid();
};

JkFsFileInvalid.prototype.CTOR_JkFsFileInvalid = function() {
	if(JkFsFile.prototype.CTOR_JkFsFile.call(this) == null) {
		return null;
	}
	return this;
};

JkFsFileInvalid.prototype.entry = function(name) {
	return JkFsFileInvalid.NEW();
};

JkFsFileInvalid.prototype.makeExecutable = function() {
	return false;
};

JkFsFileInvalid.prototype.move = function(dest, replace) {
	return false;
};

JkFsFileInvalid.prototype.touch = function() {
	return false;
};

JkFsFileInvalid.prototype.read = function() {
	return null;
};

JkFsFileInvalid.prototype.write = function() {
	return null;
};

JkFsFileInvalid.prototype.append = function() {
	return null;
};

JkFsFileInvalid.prototype.stat = function() {
	return null;
};

JkFsFileInvalid.prototype.exists = function() {
	return false;
};

JkFsFileInvalid.prototype.isExecutable = function() {
	return false;
};

JkFsFileInvalid.prototype.createFifo = function() {
	return false;
};

JkFsFileInvalid.prototype.createDirectory = function() {
	return false;
};

JkFsFileInvalid.prototype.createDirectoryRecursive = function() {
	return false;
};

JkFsFileInvalid.prototype.removeDirectory = function() {
	return false;
};

JkFsFileInvalid.prototype.getPath = function() {
	return null;
};

JkFsFileInvalid.prototype.isSame = function(file) {
	return false;
};

JkFsFileInvalid.prototype.remove = function() {
	return false;
};

JkFsFileInvalid.prototype.removeRecursive = function() {
	return false;
};

JkFsFileInvalid.prototype.getBasename = function() {
	return null;
};

JkFsFileInvalid.prototype.isIdentical = function(file) {
	return false;
};

JkFsFileInvalid.prototype.getContentsBuffer = function() {
	return null;
};

JkFsFileInvalid.prototype.getContentsString = function(encoding) {
	return null;
};

JkFsFileInvalid.prototype.setContentsBuffer = function(buffer) {
	return false;
};

JkFsFileInvalid.prototype.setContentsString = function(str, encoding) {
	return false;
};

JkFsFileInvalid.prototype.entries = function() {
	return null;
};

JkFsFileInvalid.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkFsFileInvalid"] === true;
};

let JkFsFileFinderPattern = function() {
	this.pattern = null;
	this.suffix = null;
	this.prefix = null;
};

JkFsFileFinderPattern.prototype._t = { "JkFsFileFinderPattern" : true };
JkFsFileFinderPattern.prototype._tobj = JkFsFileFinderPattern;

JkFsFileFinderPattern.NEW = function() {
	var v = new JkFsFileFinderPattern;
	return v.CTOR_JkFsFileFinderPattern();
};

JkFsFileFinderPattern.prototype.CTOR_JkFsFileFinderPattern = function() {
	this.prefix = null;
	this.suffix = null;
	this.pattern = null;
	return this;
};

JkFsFileFinderPattern.prototype.setPattern = function(pattern) {
	this.pattern = pattern;
	if(pattern != null) {
		if(JkLangString.startsWith(pattern, "*", 0)) {
			this.suffix = JkLangString.getEndOfString(pattern, 1);
		}
		if(JkLangString.endsWith(pattern, "*")) {
			this.prefix = JkLangString.getSubString(pattern, 0, (JkLangString.getLength(pattern) - 1));
		}
	}
	return this;
};

JkFsFileFinderPattern.prototype.match = function(check) {
	if(!(check != null)) {
		return false;
	}
	if(this.pattern == check) {
		return true;
	}
	if(this.suffix != null && JkLangString.endsWith(check, this.suffix)) {
		return true;
	}
	if(this.prefix != null && JkLangString.startsWith(check, this.prefix, 0)) {
		return true;
	}
	return false;
};

JkFsFileFinderPattern.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkFsFileFinderPattern"] === true;
};

let JkFsFileFinder = function() {
	this.root = null;
	this.patterns = null;
	this.excludePatterns = null;
	this.stack = null;
	this.includeMatchingDirectories = false;
	this.includeDirectories = false;
};

JkFsFileFinder.prototype._t = {
	"JkLangIterator" : true,
	"JkFsFileFinder" : true
};
JkFsFileFinder.prototype._tobj = JkFsFileFinder;

JkFsFileFinder.NEW = function() {
	var v = new JkFsFileFinder;
	return v.CTOR_JkFsFileFinder();
};

JkFsFileFinder.prototype.CTOR_JkFsFileFinder = function() {
	this.includeDirectories = false;
	this.includeMatchingDirectories = false;
	this.stack = null;
	this.excludePatterns = null;
	this.patterns = null;
	this.root = null;
	this.patterns = new Array;
	this.excludePatterns = new Array;
	return this;
};

JkFsFileFinder.forRoot = function(root) {
	return JkFsFileFinder.NEW().setRoot(root);
};

JkFsFileFinder.prototype.setRoot = function(root) {
	this.root = root;
	this.stack = null;
	return this;
};

JkFsFileFinder.prototype.addPattern = function(pattern) {
	this.patterns.push(JkFsFileFinderPattern.NEW().setPattern(pattern));
	return this;
};

JkFsFileFinder.prototype.addExcludePattern = function(pattern) {
	this.excludePatterns.push(JkFsFileFinderPattern.NEW().setPattern(pattern));
	return this;
};

JkFsFileFinder.prototype.matchPattern = function(file) {
	if(!(file != null)) {
		return false;
	}
	if(JkLangVector.getSize(this.patterns) < 1) {
		return true;
	}
	var filename = file.getBasename();
	if(this.patterns != null) {
		var n = 0;
		var m = this.patterns.length;
		for(n = 0 ; n < m ; n++) {
			var pattern = this.patterns[n];
			if(pattern != null) {
				if(pattern.match(filename)) {
					return true;
				}
			}
		}
	}
	return false;
};

JkFsFileFinder.prototype.matchExcludePattern = function(file) {
	if(!(file != null)) {
		return false;
	}
	if(JkLangVector.getSize(this.excludePatterns) < 1) {
		return false;
	}
	var filename = file.getBasename();
	if(this.excludePatterns != null) {
		var n = 0;
		var m = this.excludePatterns.length;
		for(n = 0 ; n < m ; n++) {
			var pattern = this.excludePatterns[n];
			if(pattern != null) {
				if(pattern.match(filename)) {
					return true;
				}
			}
		}
	}
	return false;
};

JkFsFileFinder.prototype.next = function() {
	while(true){
		if(!(this.stack != null)) {
			if(!(this.root != null)) {
				break;
			}
			var es = this.root.entries();
			this.root = null;
			if(!(es != null)) {
				break;
			}
			this.stack = JkLangStack.NEW();
			this.stack.push(es);
		}
		var entries = this.stack.peek();
		if(!(entries != null)) {
			this.stack = null;
			break;
		}
		var e = entries.next();
		if(!(e != null)) {
			this.stack.pop();
		}
		else if(this.matchExcludePattern(e)) {
			;
		}
		else if(e.isFile()) {
			if(this.matchPattern(e)) {
				return e;
			}
		}
		else if(this.includeMatchingDirectories && e.isDirectory() && this.matchPattern(e)) {
			return e;
		}
		else if(e.isDirectory() && e.isLink() == false) {
			var ees = e.entries();
			if(ees != null) {
				this.stack.push(ees);
			}
			if(this.includeDirectories) {
				return e;
			}
		}
	}
	return null;
};

JkFsFileFinder.prototype.hasNext = function() {
	if(!(this.stack != null)) {
		return false;
	}
	var it = this.stack.peek();
	if(!(it != null)) {
		return false;
	}
	return it.hasNext();
};

JkFsFileFinder.prototype.getIncludeMatchingDirectories = function() {
	return this.includeMatchingDirectories;
};

JkFsFileFinder.prototype.setIncludeMatchingDirectories = function(v) {
	this.includeMatchingDirectories = v;
	return this;
};

JkFsFileFinder.prototype.getIncludeDirectories = function() {
	return this.includeDirectories;
};

JkFsFileFinder.prototype.setIncludeDirectories = function(v) {
	this.includeDirectories = v;
	return this;
};

JkFsFileFinder.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkFsFileFinder"] === true;
};

let JkFsFileReadLineIterator = function() {
	this.reader = null;
};

JkFsFileReadLineIterator.prototype._t = {
	"JkFsFileReadLineIterator" : true,
	"JkLangIterator" : true
};
JkFsFileReadLineIterator.prototype._tobj = JkFsFileReadLineIterator;

JkFsFileReadLineIterator.NEW = function() {
	var v = new JkFsFileReadLineIterator;
	return v.CTOR_JkFsFileReadLineIterator();
};

JkFsFileReadLineIterator.prototype.CTOR_JkFsFileReadLineIterator = function() {
	this.reader = null;
	return this;
};

JkFsFileReadLineIterator.prototype.next = function() {
	if(!(this.reader != null)) {
		return null;
	}
	var v = this.reader.readLine();
	if(v == null) {
		this.reader.close();
		this.reader = null;
	}
	return v;
};

JkFsFileReadLineIterator.prototype.hasNext = function() {
	if(!(this.reader != null)) {
		return false;
	}
	return !this.reader.hasEnded();
};

JkFsFileReadLineIterator.prototype.getReader = function() {
	return this.reader;
};

JkFsFileReadLineIterator.prototype.setReader = function(v) {
	this.reader = v;
	return this;
};

JkFsFileReadLineIterator.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkFsFileReadLineIterator"] === true;
};

let JkFsFileForBrowser = function() {
	JkFsFile.call(this);
	this.key = null;
};

JkFsFileForBrowser.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkFsFile.prototype);
JkFsFileForBrowser.prototype.constructor = JkFsFileForBrowser;
JkFsFileForBrowser.prototype._t = {
	"JkLangStringObject" : true,
	"JkFsFileForBrowser" : true,
	"JkFsFile" : true
};
JkFsFileForBrowser.prototype._tobj = JkFsFileForBrowser;

JkFsFileForBrowser.NEW = function() {
	var v = new JkFsFileForBrowser;
	return v.CTOR_JkFsFileForBrowser();
};

JkFsFileForBrowser.prototype.CTOR_JkFsFileForBrowser = function() {
	this.key = null;
	if(JkFsFile.prototype.CTOR_JkFsFile.call(this) == null) {
		return null;
	}
	return this;
};

JkFsFileForBrowser.forPath = function(path) {
	var v = JkFsFileForBrowser.NEW();
	v.setKey(path);
	if(typeof(Storage) !== "undefined") {
		return(v);
	}
	;
	return null;
};

JkFsFileForBrowser.prototype.read = function() {
	var v = JkFsFileForBrowserMyFileReader.NEW();
	v.setKey(this.key);
	return v;
};

JkFsFileForBrowser.prototype.write = function() {
	var v = JkFsFileForBrowserMyFileWriter.NEW();
	v.setKey(this.key);
	return v;
};

JkFsFileForBrowser.prototype.append = function() {
	var v = JkFsFileForBrowserMyFileWriter.NEW();
	v.setKey(this.key);
	v.setIsAppend(true);
	return v;
};

JkFsFileForBrowser.prototype.getKey = function() {
	return this.key;
};

JkFsFileForBrowser.prototype.setKey = function(v) {
	this.key = v;
	return this;
};

JkFsFileForBrowser.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkFsFileForBrowser"] === true;
};
