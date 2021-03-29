let JkEnvEnvironmentVariable = function() {};

JkEnvEnvironmentVariable.prototype._t = { "JkEnvEnvironmentVariable" : true };
JkEnvEnvironmentVariable.prototype._tobj = JkEnvEnvironmentVariable;

JkEnvEnvironmentVariable.NEW = function() {
	var v = new JkEnvEnvironmentVariable;
	return v.CTOR_JkEnvEnvironmentVariable();
};

JkEnvEnvironmentVariable.prototype.CTOR_JkEnvEnvironmentVariable = function() {
	return this;
};

JkEnvEnvironmentVariable.getAll = function() {
	console.log("[jk.env.EnvironmentVariable.getAll] (EnvironmentVariable.sling:55:3): Not implemented");
	return null;
};

JkEnvEnvironmentVariable.get = function(key) {
	if(!(key != null)) {
		return null;
	}
	var vars = JkEnvEnvironmentVariable.getAll();
	if(!(vars != null)) {
		return null;
	}
	return JkLangMap.get(vars, key);
};

JkEnvEnvironmentVariable.set = function(key, val) {
	if(!(key != null)) {
		return;
	}
	console.log("[jk.env.EnvironmentVariable.set] (EnvironmentVariable.sling:139:3): Not implemented");
};

JkEnvEnvironmentVariable.unset = function(key) {
	console.log("[jk.env.EnvironmentVariable.unset] (EnvironmentVariable.sling:145:2): Not implemented");
};

JkEnvEnvironmentVariable.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkEnvEnvironmentVariable"] === true;
};

let JkEnvTemporaryDirectory = function() {};

JkEnvTemporaryDirectory.prototype._t = { "JkEnvTemporaryDirectory" : true };
JkEnvTemporaryDirectory.prototype._tobj = JkEnvTemporaryDirectory;

JkEnvTemporaryDirectory.NEW = function() {
	var v = new JkEnvTemporaryDirectory;
	return v.CTOR_JkEnvTemporaryDirectory();
};

JkEnvTemporaryDirectory.prototype.CTOR_JkEnvTemporaryDirectory = function() {
	return this;
};

JkEnvTemporaryDirectory.create = function() {
	return JkEnvTemporaryDirectory.forDirectory(null);
};

JkEnvTemporaryDirectory.forDirectory = function(dir) {
	var ff = JkEnvTemporaryFile.forDirectory(dir, null);
	if(!(ff != null)) {
		return null;
	}
	ff.remove();
	ff.createDirectoryRecursive();
	if(!ff.isDirectory()) {
		return null;
	}
	return ff;
};

JkEnvTemporaryDirectory.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkEnvTemporaryDirectory"] === true;
};

let JkEnvCommonPath = function() {};

JkEnvCommonPath.prototype._t = { "JkEnvCommonPath" : true };
JkEnvCommonPath.prototype._tobj = JkEnvCommonPath;

JkEnvCommonPath.NEW = function() {
	var v = new JkEnvCommonPath;
	return v.CTOR_JkEnvCommonPath();
};

JkEnvCommonPath.prototype.CTOR_JkEnvCommonPath = function() {
	return this;
};

JkEnvCommonPath.getTemporaryDirectory = function() {
	if(JkOsOS.isLinux() || JkOsOS.isMacOS()) {
		return JkFsFile.forPath("/tmp");
	}
	console.log("[jk.env.CommonPath.getTemporaryDirectory] (CommonPath.sling:44:3): Not implemented");
	return JkFsFileInvalid.NEW();
};

JkEnvCommonPath.getHomeDirectory = function() {
	var dirname = JkEnvEnvironmentVariable.get("HOME");
	if(JkLangString.isNotEmpty(dirname)) {
		return JkFsFile.forPath(dirname);
	}
	return null;
};

JkEnvCommonPath.getAppDirectory = function() {
	console.log("[jk.env.CommonPath.getAppDirectory] (CommonPath.sling:125:3): Not implemented");
	return JkFsFileInvalid.NEW();
};

JkEnvCommonPath.getCodeFileForObject = function(oo) {
	if(!(oo != null)) {
		return null;
	}
	console.log("[jk.env.CommonPath.getCodeFileForObject] (CommonPath.sling:152:3): Not implemented");
	return null;
};

JkEnvCommonPath.getProgramFilesDirectory = function() {
	return null;
};

JkEnvCommonPath.getProgramFilesX86Directory = function() {
	return null;
};

JkEnvCommonPath.getApplicationsDirectory = function() {
	return null;
};

JkEnvCommonPath.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkEnvCommonPath"] === true;
};

let JkEnvExternalCommand = function() {};

JkEnvExternalCommand.prototype._t = { "JkEnvExternalCommand" : true };
JkEnvExternalCommand.prototype._tobj = JkEnvExternalCommand;

JkEnvExternalCommand.NEW = function() {
	var v = new JkEnvExternalCommand;
	return v.CTOR_JkEnvExternalCommand();
};

JkEnvExternalCommand.prototype.CTOR_JkEnvExternalCommand = function() {
	return this;
};

JkEnvExternalCommand.findInPath = function(command) {
	if(!(command != null)) {
		return null;
	}
	return null;
};

JkEnvExternalCommand.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkEnvExternalCommand"] === true;
};

let JkEnvTemporaryFile = function() {};

JkEnvTemporaryFile.prototype._t = { "JkEnvTemporaryFile" : true };
JkEnvTemporaryFile.prototype._tobj = JkEnvTemporaryFile;

JkEnvTemporaryFile.NEW = function() {
	var v = new JkEnvTemporaryFile;
	return v.CTOR_JkEnvTemporaryFile();
};

JkEnvTemporaryFile.prototype.CTOR_JkEnvTemporaryFile = function() {
	return this;
};

JkEnvTemporaryFile.create = function(extension) {
	return JkEnvTemporaryFile.forDirectory(null, extension);
};

JkEnvTemporaryFile.forDirectory = function(dir, extension) {
	var tmpdir = dir;
	if(tmpdir == null) {
		tmpdir = JkEnvCommonPath.getTemporaryDirectory();
	}
	if(tmpdir == null) {
		return null;
	}
	tmpdir.createDirectoryRecursive();
	if(tmpdir.isDirectory() == false) {
		return null;
	}
	var v = null;
	var n = 0;
	var rnd = JkRandomRandom.NEW();
	while(n < 100){
		var id = "_tmp_" + (JkLangString.safeString((JkLangString.forInteger((~(~JkTimeSystemClock.asSeconds())))))) + (JkLangString.safeString((JkLangString.forInteger((rnd.nextInt1() % 1000000)))));
		if(extension == null || JkLangString.getLength(extension) < 1) {
			id = (JkLangString.safeString(id)) + (JkLangString.safeString(extension));
		}
		v = tmpdir.entry(id);
		if(v.exists() == false) {
			v.touch();
			break;
		}
		n++;
	}
	if(v != null && v.isFile() == false) {
		v = null;
	}
	return v;
};

JkEnvTemporaryFile.forString = function(data) {
	if(!(data != null)) {
		return null;
	}
	var v = JkEnvTemporaryFile.create(null);
	if(!(v != null)) {
		return null;
	}
	if(!v.setContentsUTF8(data)) {
		v.remove();
		return null;
	}
	return v;
};

JkEnvTemporaryFile.forBuffer = function(data) {
	if(!(data != null)) {
		return null;
	}
	var v = JkEnvTemporaryFile.create(null);
	if(!(v != null)) {
		return null;
	}
	if(!v.setContentsBuffer(data)) {
		v.remove();
		return null;
	}
	return v;
};

JkEnvTemporaryFile.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkEnvTemporaryFile"] === true;
};
