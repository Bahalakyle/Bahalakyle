let JkArchiveZipWriter = function() {};

JkArchiveZipWriter.prototype._t = { "JkArchiveZipWriter" : true };
JkArchiveZipWriter.prototype._tobj = JkArchiveZipWriter;

JkArchiveZipWriter.NEW = function() {
	var v = new JkArchiveZipWriter;
	return v.CTOR_JkArchiveZipWriter();
};

JkArchiveZipWriter.prototype.CTOR_JkArchiveZipWriter = function() {
	return this;
};

JkArchiveZipWriter.forOutputFile = function(file) {
	return null;
};

JkArchiveZipWriter.writeToZipRecursive = function(ctx, dest, source, truncateDirectoryName) {
	if(!(dest != null)) {
		JkLogLog.error(ctx, "No destination file specified for ZIP writer");
		return false;
	}
	if(!(source != null)) {
		JkLogLog.error(ctx, "No source file specified for ZIP writer");
		return false;
	}
	var zip = JkArchiveZipWriter.forOutputFile(dest);
	if(!(zip != null)) {
		JkLogLog.error(ctx, "Failed to create ZIP writer for file: `" + (JkLangString.safeString((dest.getPath()))) + ("'"));
		return false;
	}
	var pd = source.getParent();
	if(!(pd != null)) {
		JkLogLog.error(ctx, "Directory has no parent: `" + (JkLangString.safeString((source.getPath()))) + ("'"));
		return false;
	}
	var parentPath = pd.getPath();
	if(!JkLangString.isNotEmpty(parentPath)) {
		JkLogLog.error(ctx, "Parent path is empty: `" + (JkLangString.safeString((source.getPath()))) + ("'"));
		return false;
	}
	var parentPathLength = JkLangString.getLength(parentPath);
	if(truncateDirectoryName) {
		parentPathLength = JkLangString.getLength((source.getPath()));
	}
	if(source.isFile()) {
		if(!zip.addFile(source, (source.getBasename()))) {
			JkLogLog.error(ctx, "Failed to add to ZIP file: `" + (JkLangString.safeString((source.getPath()))) + ("'"));
			zip.close();
			dest.remove();
			return false;
		}
		zip.close();
		return true;
	}
	var root = source;
	if(truncateDirectoryName) {
		root = null;
	}
	var ff = JkFsFileFinder.forRoot(source);
	ff.setIncludeDirectories(true);
	while(true){
		var file = null;
		if(root != null) {
			file = root;
			root = null;
		}
		else {
			file = ff.next();
		}
		if(!(file != null)) {
			break;
		}
		var isFile = file.isFile();
		var isDirectory = file.isDirectory();
		if(isFile == false && isDirectory == false) {
			continue;
		}
		var fpath = file.getPath();
		if(JkLangString.isEmpty(fpath)) {
			continue;
		}
		var partialPath = JkLangString.getEndOfString(fpath, (parentPathLength + 1));
		if(JkLangString.isEmpty(partialPath)) {
			continue;
		}
		partialPath = JkLangString.replaceCharacter(partialPath, '\\'.charCodeAt(), '/'.charCodeAt());
		if(isDirectory) {
			partialPath = (JkLangString.safeString(partialPath)) + ("/");
		}
		if(!zip.addFile(file, partialPath)) {
			JkLogLog.error(ctx, "Failed to add to ZIP file: `" + (JkLangString.safeString((file.getPath()))) + ("'"));
			zip.close();
			dest.remove();
			return false;
		}
	}
	zip.close();
	return true;
};

JkArchiveZipWriter.prototype.addFile = function(file, filename) {};

JkArchiveZipWriter.prototype.close = function() {};

JkArchiveZipWriter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkArchiveZipWriter"] === true;
};

let JkArchiveTarGZipWriter = function() {};

JkArchiveTarGZipWriter.prototype._t = { "JkArchiveTarGZipWriter" : true };
JkArchiveTarGZipWriter.prototype._tobj = JkArchiveTarGZipWriter;

JkArchiveTarGZipWriter.NEW = function() {
	var v = new JkArchiveTarGZipWriter;
	return v.CTOR_JkArchiveTarGZipWriter();
};

JkArchiveTarGZipWriter.prototype.CTOR_JkArchiveTarGZipWriter = function() {
	return this;
};

JkArchiveTarGZipWriter.instance = function() {
	return JkArchiveExternalTarGZipWriter.NEW();
};

JkArchiveTarGZipWriter.writeToTarballRecursive = function(ctx, dest, source, truncateDirectoryName) {
	if(!(dest != null)) {
		JkLogLog.error(ctx, "No destination file specified for tar/gzip writer");
		return false;
	}
	if(!(source != null)) {
		JkLogLog.error(ctx, "No source file specified for tar/gzip writer");
		return false;
	}
	var writer = JkArchiveTarGZipWriter.instance();
	if(!(writer != null)) {
		JkLogLog.error(ctx, "Failed to create tar/gzip writer");
		return false;
	}
	return writer.tarDir(ctx, source, dest, truncateDirectoryName);
};

JkArchiveTarGZipWriter.prototype.tarDir = function(ctx, dir, output, truncateDir) {};

JkArchiveTarGZipWriter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkArchiveTarGZipWriter"] === true;
};

let JkArchiveZipReader = function() {};

JkArchiveZipReader.prototype._t = { "JkArchiveZipReader" : true };
JkArchiveZipReader.prototype._tobj = JkArchiveZipReader;

JkArchiveZipReader.NEW = function() {
	var v = new JkArchiveZipReader;
	return v.CTOR_JkArchiveZipReader();
};

JkArchiveZipReader.prototype.CTOR_JkArchiveZipReader = function() {
	return this;
};

JkArchiveZipReader.forFile = function(file) {
	return null;
};

JkArchiveZipReader.extractZipBufferToDirectory = function(zipBuffer, destDir, listener) {
	if(!(zipBuffer != null)) {
		return false;
	}
	var dd = JkEnvTemporaryDirectory.create();
	if(!(dd != null)) {
		return false;
	}
	var ff = dd.entry("files.zip");
	if(!ff.setContentsBuffer(zipBuffer)) {
		dd.removeRecursive();
		return false;
	}
	var v = JkArchiveZipReader.extractZipFileToDirectory(ff, destDir, listener);
	dd.removeRecursive();
	return v;
};

JkArchiveZipReader.extractZipFileToDirectory = function(zipFile, destDir, listener) {
	if(!(zipFile != null)) {
		return false;
	}
	if(!(destDir != null)) {
		return false;
	}
	var zf = JkArchiveZipReader.forFile(zipFile);
	if(!(zf != null)) {
		return false;
	}
	if(!destDir.isDirectory()) {
		destDir.createDirectoryRecursive();
	}
	if(!destDir.isDirectory()) {
		zf.close();
		return false;
	}
	var array = zf.getEntries();
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var entry = array[n];
			if(entry != null) {
				var ename = entry.getName();
				if(JkLangString.isEmpty(ename)) {
					continue;
				}
				var dd = destDir;
				ename = JkLangString.replaceCharacter(ename, '\\'.charCodeAt(), '/'.charCodeAt());
				var array2 = JkLangString.split(ename, '/'.charCodeAt(), 0);
				if(array2 != null) {
					var n2 = 0;
					var m2 = array2.length;
					for(n2 = 0 ; n2 < m2 ; n2++) {
						var comp = array2[n2];
						if(comp != null) {
							if(comp == "." || comp == "..") {
								continue;
							}
							dd = dd.entry(comp);
						}
					}
				}
				if(listener != null) {
					listener(dd);
				}
				if(!entry.writeToFile(dd)) {
					zf.close();
					return false;
				}
			}
		}
	}
	zf.close();
	return true;
};

JkArchiveZipReader.prototype.getEntries = function() {};

JkArchiveZipReader.prototype.close = function() {};

JkArchiveZipReader.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkArchiveZipReader"] === true;
};

let JkArchiveTarReader = function() {};

JkArchiveTarReader.prototype._t = { "JkArchiveTarReader" : true };
JkArchiveTarReader.prototype._tobj = JkArchiveTarReader;

JkArchiveTarReader.NEW = function() {
	var v = new JkArchiveTarReader;
	return v.CTOR_JkArchiveTarReader();
};

JkArchiveTarReader.prototype.CTOR_JkArchiveTarReader = function() {
	return this;
};

JkArchiveTarReader.isTarFile = function(file) {
	if(!(file != null)) {
		return false;
	}
	var bn = JkLangString.toLowerCase((file.getBasename()));
	if(!(bn != null)) {
		return false;
	}
	if(JkLangString.endsWith(bn, ".tar")) {
		return true;
	}
	if(JkLangString.endsWith(bn, ".tar.gz") || JkLangString.endsWith(bn, ".tar.bz2") || JkLangString.endsWith(bn, ".tar.xz")) {
		return true;
	}
	if(JkLangString.endsWith(bn, ".tgz") || JkLangString.endsWith(bn, ".tbz") || JkLangString.endsWith(bn, ".tbz2") || JkLangString.endsWith(bn, ".txz")) {
		return true;
	}
	return false;
};

JkArchiveTarReader.extractTarFileToDirectory = function(tarFile, destDir) {
	if(!(tarFile != null)) {
		return false;
	}
	if(!(destDir != null)) {
		return false;
	}
	var pl = JkProcessProcessLauncher.forCommand("tar", null);
	if(!(pl != null)) {
		return false;
	}
	if(!destDir.isDirectory()) {
		destDir.createDirectoryRecursive();
	}
	if(!destDir.isDirectory()) {
		return false;
	}
	pl.setCwd(destDir);
	pl.addToParams("xf");
	pl.addToParams((tarFile.getPath()));
	if(!(pl.execute() == 0)) {
		return false;
	}
	return true;
};

JkArchiveTarReader.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkArchiveTarReader"] === true;
};

let JkArchiveExternalTarGZipWriter = function() {
	JkArchiveTarGZipWriter.call(this);
};

JkArchiveExternalTarGZipWriter.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkArchiveTarGZipWriter.prototype);
JkArchiveExternalTarGZipWriter.prototype.constructor = JkArchiveExternalTarGZipWriter;
JkArchiveExternalTarGZipWriter.prototype._t = {
	"JkArchiveExternalTarGZipWriter" : true,
	"JkArchiveTarGZipWriter" : true
};
JkArchiveExternalTarGZipWriter.prototype._tobj = JkArchiveExternalTarGZipWriter;

JkArchiveExternalTarGZipWriter.NEW = function() {
	var v = new JkArchiveExternalTarGZipWriter;
	return v.CTOR_JkArchiveExternalTarGZipWriter();
};

JkArchiveExternalTarGZipWriter.prototype.CTOR_JkArchiveExternalTarGZipWriter = function() {
	if(JkArchiveTarGZipWriter.prototype.CTOR_JkArchiveTarGZipWriter.call(this) == null) {
		return null;
	}
	return this;
};

JkArchiveExternalTarGZipWriter.prototype.tarDir = function(ctx, dir, output, truncateDir) {
	if(!(dir != null)) {
		JkLogLog.error(ctx, "No directory provided.");
		return false;
	}
	if(!dir.isDirectory()) {
		JkLogLog.error(ctx, "Not a directory: `" + (JkLangString.safeString((dir.getPath()))) + ("'"));
		return false;
	}
	var bn = dir.baseName();
	if(!(JkLangString.isEmpty(bn) == false)) {
		JkLogLog.error(ctx, "Empty basename: `" + (JkLangString.safeString((dir.getPath()))) + ("'"));
		return false;
	}
	var pd = dir.getParent();
	if(!(pd != null)) {
		JkLogLog.error(ctx, "Directory has no parent: `" + (JkLangString.safeString((dir.getPath()))) + ("'"));
		return false;
	}
	var of = output;
	if(of == null) {
		of = pd.entry((JkLangString.safeString(bn)) + (".tar.gz"));
	}
	var pl = JkProcessProcessLauncher.forCommand("tar", null);
	if(!(pl != null)) {
		JkLogLog.error(ctx, "Failed to create a process launcher for command: `tar'");
		return false;
	}
	pl.addToParams("zcf");
	pl.addToParams((of.getPath()));
	if(truncateDir) {
		pl.setCwd(dir);
		pl.addToParams(".");
	}
	else {
		pl.setCwd(pd);
		pl.addToParams(bn);
	}
	var r = pl.execute();
	if(!(r == 0)) {
		JkLogLog.error(ctx, "Failure in execution of the tar command");
		return false;
	}
	return true;
};

JkArchiveExternalTarGZipWriter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkArchiveExternalTarGZipWriter"] === true;
};

let JkArchiveArchiveKit = function() {
	this.ctx = null;
};

JkArchiveArchiveKit.prototype._t = { "JkArchiveArchiveKit" : true };
JkArchiveArchiveKit.prototype._tobj = JkArchiveArchiveKit;

JkArchiveArchiveKit.NEW_JkLogLoggingContext = function(ctx) {
	var v = new JkArchiveArchiveKit;
	return v.CTOR_JkArchiveArchiveKit_JkLogLoggingContext(ctx);
};

JkArchiveArchiveKit.prototype.CTOR_JkArchiveArchiveKit_JkLogLoggingContext = function(ctx) {
	this.ctx = null;
	this.ctx = ctx;
	return this;
};

JkArchiveArchiveKit.prototype.compressZip = function(src, output) {
	var srcfile = JkFsFile.asFile(src);
	if(!(srcfile != null)) {
		JkLangError._throw("invalidParameter", (JkLangString.asString(src)));
	}
	var outputfile = JkFsFile.asFile(output);
	if(!(outputfile != null)) {
		outputfile = srcfile.getSibling((JkLangString.safeString((srcfile.getBasename()))) + (".zip"));
	}
	JkLogLog.status(this.ctx, "Compressing files ..");
	if(!JkArchiveZipWriter.writeToZipRecursive(this.ctx, outputfile, srcfile, true)) {
		JkLangError._throw("failedToWrite", (outputfile.getPath()));
	}
	JkLogLog.status(this.ctx, null);
	return outputfile;
};

JkArchiveArchiveKit.prototype.compressTarball = function(src, output) {
	var srcfile = JkFsFile.asFile(src);
	if(!(srcfile != null)) {
		JkLangError._throw("invalidParameter", (JkLangString.asString(src)));
	}
	var outputfile = JkFsFile.asFile(output);
	if(!(outputfile != null)) {
		outputfile = srcfile.getSibling((JkLangString.safeString((srcfile.getBasename()))) + (".tar.gz"));
	}
	JkLogLog.status(this.ctx, "Compressing files ..");
	if(!JkArchiveTarGZipWriter.writeToTarballRecursive(this.ctx, outputfile, srcfile, true)) {
		JkLangError._throw("failedToWrite", (outputfile.getPath()));
	}
	JkLogLog.status(this.ctx, null);
	return outputfile;
};

JkArchiveArchiveKit.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkArchiveArchiveKit"] === true;
};

let JkArchiveZipReaderEntry = function() {
	this.name = null;
	this.compressedSize = 0;
	this.uncompressedSize = 0;
	this.isDirectory = false;
	this.mode = 0;
};

JkArchiveZipReaderEntry.prototype._t = { "JkArchiveZipReaderEntry" : true };
JkArchiveZipReaderEntry.prototype._tobj = JkArchiveZipReaderEntry;

JkArchiveZipReaderEntry.NEW = function() {
	var v = new JkArchiveZipReaderEntry;
	return v.CTOR_JkArchiveZipReaderEntry();
};

JkArchiveZipReaderEntry.prototype.CTOR_JkArchiveZipReaderEntry = function() {
	this.mode = 0;
	this.isDirectory = false;
	this.uncompressedSize = 0;
	this.compressedSize = 0;
	this.name = null;
	return this;
};

JkArchiveZipReaderEntry.prototype.getName = function() {
	return this.name;
};

JkArchiveZipReaderEntry.prototype.setName = function(newName) {
	this.name = JkLangString.replaceCharacter(newName, '\\'.charCodeAt(), '/'.charCodeAt());
	if(JkLangString.endsWith(this.name, "/")) {
		this.isDirectory = true;
		this.name = JkLangString.getSubString(this.name, 0, (JkLangString.getLength(this.name) - 1));
	}
	return this;
};

JkArchiveZipReaderEntry.prototype.getContentReader = function() {
	return null;
};

JkArchiveZipReaderEntry.prototype.getContentsBuffer = function() {
	if(this.getIsDirectory()) {
		return null;
	}
	var reader = this.getContentReader();
	if(!(reader != null)) {
		return null;
	}
	var v = null;
	var buf = new ArrayBuffer(4096 * 4);
	while(true){
		var n = reader.read(buf);
		if(n == 0) {
			break;
		}
		if(n < 0) {
			v = null;
			break;
		}
		v = JkLangBuffer.append(v, buf, n);
	}
	if(JkLangClosable.IS_INSTANCE && JkLangClosable.IS_INSTANCE(reader)) {
		reader.close();
	}
	return v;
};

JkArchiveZipReaderEntry.prototype.getContentsUTF8 = function() {
	var v = this.getContentsBuffer();
	if(!(v != null)) {
		return null;
	}
	return JkLangString.forUTF8Buffer(v);
};

JkArchiveZipReaderEntry.prototype.writeToFile = function(file) {
	if(!(file != null)) {
		return false;
	}
	var v = false;
	if(this.getIsDirectory()) {
		v = file.createDirectoryRecursive();
	}
	else {
		var reader = this.getContentReader();
		if(!(reader != null)) {
			return false;
		}
		var fp = file.getParent();
		if(fp != null) {
			fp.createDirectoryRecursive();
		}
		var writer = file.write();
		if(!(writer != null)) {
			if(JkLangClosable.IS_INSTANCE && JkLangClosable.IS_INSTANCE(reader)) {
				reader.close();
			}
			return false;
		}
		var buf = new ArrayBuffer(4096 * 4);
		v = true;
		var n = 0;
		while((n = reader.read(buf)) > 0){
			var nr = writer.write(buf, n);
			if(nr != n) {
				v = false;
				break;
			}
		}
		if(reader != null && (JkLangClosable.IS_INSTANCE && JkLangClosable.IS_INSTANCE(reader))) {
			reader.close();
		}
		if(writer != null && (JkLangClosable.IS_INSTANCE && JkLangClosable.IS_INSTANCE(writer))) {
			writer.close();
		}
		if(!v) {
			file.remove();
		}
	}
	if(v && this.mode > 0 && (JkOsOS.isLinux() || JkOsOS.isMacOS())) {
		file.setMode(this.mode);
	}
	return v;
};

JkArchiveZipReaderEntry.prototype.writeToDir = function(dir, fullPath, overwrite) {
	if(!(dir != null)) {
		return null;
	}
	if(!(this.name != null)) {
		return null;
	}
	var path = null;
	if(fullPath == false) {
		var nn = null;
		var r = JkLangString.getLastIndexOfCharacter(this.name, '/'.charCodeAt(), (-1));
		if(r < 1) {
			nn = this.name;
		}
		else {
			nn = JkLangString.getEndOfString(this.name, (r + 1));
		}
		if(nn == null || JkLangString.getLength(nn) < 1) {
			return null;
		}
		path = dir.entry(nn);
	}
	else {
		path = dir;
		var array = JkLangString.split(this.name, '/'.charCodeAt(), 0);
		if(array != null) {
			var n = 0;
			var m = array.length;
			for(n = 0 ; n < m ; n++) {
				var x = array[n];
				if(x != null) {
					if(x != null && JkLangString.getLength(x) > 0) {
						path = path.entry(x);
					}
				}
			}
		}
		var dd = path.getParent();
		if(!dd.isDirectory()) {
			dd.createDirectoryRecursive();
		}
		if(!dd.isDirectory()) {
			return null;
		}
	}
	if(overwrite == false) {
		if(path.exists()) {
			return null;
		}
	}
	if(!this.writeToFile(path)) {
		return null;
	}
	return path;
};

JkArchiveZipReaderEntry.prototype.getCompressedSize = function() {
	return this.compressedSize;
};

JkArchiveZipReaderEntry.prototype.setCompressedSize = function(v) {
	this.compressedSize = v;
	return this;
};

JkArchiveZipReaderEntry.prototype.getUncompressedSize = function() {
	return this.uncompressedSize;
};

JkArchiveZipReaderEntry.prototype.setUncompressedSize = function(v) {
	this.uncompressedSize = v;
	return this;
};

JkArchiveZipReaderEntry.prototype.getIsDirectory = function() {
	return this.isDirectory;
};

JkArchiveZipReaderEntry.prototype.setIsDirectory = function(v) {
	this.isDirectory = v;
	return this;
};

JkArchiveZipReaderEntry.prototype.getMode = function() {
	return this.mode;
};

JkArchiveZipReaderEntry.prototype.setMode = function(v) {
	this.mode = v;
	return this;
};

JkArchiveZipReaderEntry.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkArchiveZipReaderEntry"] === true;
};
