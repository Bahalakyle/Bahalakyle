let JkMagicMagicNumberRegistryMagicNumberInfo = function() {
	this.magic = null;
	this.description = null;
	this.mimeType = null;
};

JkMagicMagicNumberRegistryMagicNumberInfo.prototype._t = { "JkMagicMagicNumberRegistryMagicNumberInfo" : true };
JkMagicMagicNumberRegistryMagicNumberInfo.prototype._tobj = JkMagicMagicNumberRegistryMagicNumberInfo;

JkMagicMagicNumberRegistryMagicNumberInfo.NEW = function() {
	var v = new JkMagicMagicNumberRegistryMagicNumberInfo;
	return v.CTOR_JkMagicMagicNumberRegistryMagicNumberInfo();
};

JkMagicMagicNumberRegistryMagicNumberInfo.prototype.CTOR_JkMagicMagicNumberRegistryMagicNumberInfo = function() {
	this.mimeType = null;
	this.description = null;
	this.magic = null;
	return this;
};

JkMagicMagicNumberRegistryMagicNumberInfo.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMagicMagicNumberRegistryMagicNumberInfo"] === true;
};

let JkMagicMagicNumberRegistry = function() {
	this.entries = new Array;
};

JkMagicMagicNumberRegistry.prototype._t = { "JkMagicMagicNumberRegistry" : true };
JkMagicMagicNumberRegistry.prototype._tobj = JkMagicMagicNumberRegistry;

JkMagicMagicNumberRegistry.NEW = function() {
	var v = new JkMagicMagicNumberRegistry;
	return v.CTOR_JkMagicMagicNumberRegistry();
};

JkMagicMagicNumberRegistry.prototype.CTOR_JkMagicMagicNumberRegistry = function() {
	this.entries = new Array;
	this.add("EDABEEDB", "RPM package", null);
	this.add("53503031", "Amazon Kindle Update Package", null);
	this.add("00000100", "ICO icon", "image/vnd.microsoft.icon");
	this.add("667479703367", "3GPP and 3GPP2 multimedia files", "video/3gpp");
	this.add("1F9D", "Compressed file (LZW)", null);
	this.add("1FA0", "Compressed file (LZH)", null);
	this.add("425A68", "Compressed file (bzip2)", "application/bzip2");
	this.add("474946383761", "GIF image", "image/gif");
	this.add("474946383961", "GIF image", "image/gif");
	this.add("49492A00100000004352", "Canon RAW image format version 2", "image/x-canon-cr2");
	this.add("49492A00", "TIFF image (little endian)", "image/tiff");
	this.add("4D4D002A", "TIFF image (big endian)", "image/tiff");
	this.add("802A5FD7", "Kodak Cineon Image", "image/x-kodak-cineon");
	this.add("524E4301", "RNC compressed file", null);
	this.add("524E4302", "RNC compressed file", null);
	this.add("53445058", "SMPTE DPX image (big endian)", "image/x-smpte-dpx");
	this.add("58504453", "SMPTE DPX image (little endian)", "image/x-smpte-dpx");
	this.add("762F3101", "OpenEXR image", "image/x-openexr");
	this.add("425047FB", "Better Portable Graphics format", "image/x-bpg");
	this.add("FFD8FFDB", "JPEG image", "image/jpeg");
	this.add("FFD8FFE0....4A4649460001", "JPEG image", "image/jpeg");
	this.add("FFD8FFE1....457869660000", "JPEG image", "image/jpeg");
	this.add("4C5A4950", "LZIP compressed file", null);
	this.add("4D5A", "EXE executable file", "application/x-exe");
	this.add("504B0304", "ZIP compressed file", "application/zip");
	this.add("504B0506", "ZIP compressed file", "application/zip");
	this.add("504B0708", "ZIP compressed file", "application/zip");
	this.add("526172211A0700", "RAR compressed file (version 1.50 onwards)", "application/x-rar");
	this.add("526172211A070100", "RAR compressed file (version 5.0 onwards)", "application/x-rar");
	this.add("7F454C46", "ELF binary", "application/x-elf");
	this.add("89504E470D0A1A0A", "PNG image", "application/png");
	this.add("CAFEBABE", "Java CLASS file", "application/x-java-class");
	this.add("FEEDFACE", "Mach-O binary (32 bit)", "application/x-mach-o-binary");
	this.add("FEEDFACF", "Mach-O binary (64 bit)", "application/x-mach-o-binary");
	this.add("CEFAEDFE", "Mach-O binary (32 bit)", "application/x-mach-o-binary");
	this.add("CFFAEDFE", "Mach-O binary (64 bit)", "application/x-mach-o-binary");
	this.add("25215053", "Postscript document", "application/postscript");
	this.add("25504446", "PDF document", "application/pdf");
	this.add("3026B2758E66CF11A6D900AA0062CE6C", "Advanced Streaming Format", "video/x-ms-asf");
	this.add("2453444930303031", "System Deployment Image", null);
	this.add("4F676753", "OGG media", "application/ogg");
	this.add("38425053", "Photoshop document (PSD)", "application/psd");
	this.add("52494646........57415645", "Waveform (WAV) audio", "audio/wav");
	this.add("52494646........41564920", "Audio video interleave (AVI) video", "video/avi");
	this.add("FFFB", "MP3 audio", "audio/mp3");
	this.add("494433", "MP3 audio", "audio/mp3");
	this.add("424D", "BMP bitmap", "image/bmp");
	this.add("4344303031", "ISO image", "application/x-iso9660-image");
	this.add("664C6143", "Free Lossless Audio Codec (FLAC)", "audio/flac");
	this.add("4D546864", "MIDI sound", "audio/midi");
	this.add("D0CF11E0A1B11AE1", "Compound file format", null);
	this.add("6465780A30333500", "Dalvix executable (dex)", "application/x-dex");
	this.add("4B444d", "VMDK", "application/x-vmdk");
	this.add("43723234", "Google Chrome extension", "application/x-chrome-extension");
	this.add("41474433", "FreeHand 8 document", "application/x-freehand8");
	this.add("05070000424F424F0507000000000000000000000001", "AppleWorks 5 document", "application/x-appleworks5");
	this.add("0607E100424F424F0607E10000000000000000000001", "AppleWorkd 6 document", "application/x-appleworks6");
	this.add("455202000000", "Roxio Toast disc image or DMG", null);
	this.add("8B455202000000", "Roxio Toast disc image or DMG", null);
	this.add("7801730D626260", "Apple Disk Image (DMG)", "application/x-dmg");
	this.add("78617221", "Extensible Archive Format (XAR)", "application/x-xar");
	this.add("504D4F43434D4F43", "Windows Files and Settings Transfer Repository", null);
	this.add("4E45531A", "Nintendo Entertainment System (NES) ROM", null);
	this.add("7573746172003030", "TAR archive", "application/tar");
	this.add("7573746172202000", "TAR archive", "application/tar");
	this.add("746F7833", "Open source portable voxel file", null);
	this.add("4D4C5649", "Magic Lantern Video", "application/x-mlv");
	this.add("44434D0150413330", "Windows Update Binary Delta Compression", null);
	this.add("377ABCAF271C", "7ZIP archive", "application/7zip");
	this.add("1F8B", "GZIP archive", "application/gzip");
	this.add("FD377A585A0000", "XZ archive", "application/xz");
	this.add("04224D18", "LZ4 Frame Format", null);
	this.add("4D534346", "Microsoft Cabinet (CAB)", "application/cab");
	this.add("535A444488F02733", "Microsoft Quantum Compressed", null);
	this.add("464C4946", "Free Lossless Image Format", "image/flif");
	this.add("1A45DFA3", "Matroska Media Container", "video/mkv");
	this.add("41542654464F524D........444A56", "DjVu Document", "application/djvu");
	this.add("3082", "DER encoded X.509 certificate", null);
	this.add("4449434D", "DICOM Medical File Format", null);
	this.add("774F4646", "WOFF File Format 1.0", "application/x-woff-1");
	this.add("774F4632", "WOFF File Format 2.0", "application/x-woff-2");
	this.add("3C3F786D6C20", "XML", "text/xml");
	this.add("0061736D", "WebAssembly Binary Format", "application/wasm");
	this.add("CF8401", "Lepton Compressed JPEG Image", "image/x-lepton");
	this.add("435753", "Flash SWF", "application/swf");
	this.add("465753", "Flash SWF", "application/swf");
	this.add("213C617263683E", "Linux DEB File", "application/x-deb");
	this.add("52494646........57454250", "Google WebP Image", "image/webp");
	this.add("27051956", "U-Boot uImage", "application/x-uimage");
	this.add("7B5C72746631", "Rich Text Format (RTF)", "text/rtf");
	this.add("54415045", "Microsoft Tape Format", null);
	this.add("47", "MPEG Video", "video/mpeg");
	this.add("000001BA", "MPEG Video", "video/mpeg");
	this.add("000001B3", "MPEG Video", "video/mpeg");
	this.add("7801", "Zlib Compression (low compression)", "application/x-zlib");
	this.add("789C", "Zlib Compression (default compression)", "application/x-zlib");
	this.add("78DA", "Zlib Compression (best compression)", "application/x-zlib");
	return this;
};

JkMagicMagicNumberRegistry.instance = function() {
	if(!(JkMagicMagicNumberRegistry.myInstance != null)) {
		JkMagicMagicNumberRegistry.myInstance = JkMagicMagicNumberRegistry.NEW();
	}
	return JkMagicMagicNumberRegistry.myInstance;
};

JkMagicMagicNumberRegistry.createUnknown = function() {
	var v = JkMagicMagicNumberRegistryMagicNumberInfo.NEW();
	v.magic = "";
	v.description = "Unknown";
	v.mimeType = "application/unknown";
	return v;
};

JkMagicMagicNumberRegistry.determineTypeForFile = function(file) {
	if(!(file != null)) {
		return JkMagicMagicNumberRegistry.createUnknown();
	}
	var reader = file.read();
	if(!(reader != null)) {
		return JkMagicMagicNumberRegistry.createUnknown();
	}
	var buffer = new ArrayBuffer(32);
	var r = reader.read(buffer);
	reader.close();
	if(r < 1) {
		return JkMagicMagicNumberRegistry.createUnknown();
	}
	if(r < 32) {
		buffer = JkLangBuffer.getSubBuffer(buffer, 0, r, false);
	}
	return JkMagicMagicNumberRegistry.determineMimeTypeForBuffer(buffer);
};

JkMagicMagicNumberRegistry.determineMimeTypeForBuffer = function(buffer) {
	if(!(buffer != null)) {
		return JkMagicMagicNumberRegistry.createUnknown();
	}
	var sz = buffer.byteLength;
	if(sz < 1) {
		return JkMagicMagicNumberRegistry.createUnknown();
	}
	var sb = JkLangStringBuilder.NEW();
	if(sz > 32) {
		sz = 32;
	}
	for(var n = 0 ; n < sz ; n++) {
		sb.appendString((JkLangString.forIntegerHex((~(~JkLangBuffer.getByte(buffer, n))), 2)));
	}
	var o = JkMagicMagicNumberRegistry.instance();
	var v = o.determineTypeForContentString((sb.toString()));
	if(v == null) {
		return JkMagicMagicNumberRegistry.createUnknown();
	}
	var w = JkMagicMagicNumberRegistryMagicNumberInfo.NEW();
	w.magic = v.magic;
	w.description = v.description;
	w.mimeType = v.mimeType;
	if(w.magic == null) {
		w.magic = "";
	}
	if(JkLangString.isEmpty(w.description)) {
		w.description = "Unknown";
	}
	if(JkLangString.isEmpty(w.mimeType)) {
		w.mimeType = "application/unknown";
	}
	return w;
};

JkMagicMagicNumberRegistry.prototype.isEntryMatching = function(entry, str) {
	if(!(str != null)) {
		return false;
	}
	if(!(entry != null)) {
		return false;
	}
	if(!(entry.magic != null)) {
		return false;
	}
	var sit = JkLangString.iterate(str);
	if(!(sit != null)) {
		return false;
	}
	var mit = JkLangString.iterate(entry.magic);
	if(!(mit != null)) {
		return false;
	}
	while(true){
		var sc = sit.getNextChar();
		var mc = mit.getNextChar();
		if(mc < 1) {
			break;
		}
		if(mc == '.'.charCodeAt()) {
			continue;
		}
		if(sc == mc) {
			continue;
		}
		return false;
	}
	return true;
};

JkMagicMagicNumberRegistry.prototype.determineTypeForContentString = function(str) {
	if(!(str != null)) {
		return null;
	}
	if(this.entries != null) {
		var n = 0;
		var m = this.entries.length;
		for(n = 0 ; n < m ; n++) {
			var entry = this.entries[n];
			if(entry != null) {
				if(this.isEntryMatching(entry, str)) {
					return entry;
				}
			}
		}
	}
	return null;
};

JkMagicMagicNumberRegistry.prototype.add = function(ident, description, mimeType) {
	if(!(ident != null)) {
		return;
	}
	var v = JkMagicMagicNumberRegistryMagicNumberInfo.NEW();
	v.magic = ident;
	v.description = description;
	v.mimeType = mimeType;
	this.entries.push(v);
};

JkMagicMagicNumberRegistry.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMagicMagicNumberRegistry"] === true;
};

JkMagicMagicNumberRegistry.myInstance = null;
