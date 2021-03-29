jk = jk or {}

jk.magic = jk.magic or {}

jk.magic.MagicNumberRegistry = {}
jk.magic.MagicNumberRegistry.__index = jk.magic.MagicNumberRegistry
_vm:set_metatable(jk.magic.MagicNumberRegistry, {})

jk.magic.MagicNumberRegistry.myInstance = nil

function jk.magic.MagicNumberRegistry._create()
	local v = _vm:set_metatable({}, jk.magic.MagicNumberRegistry)
	return v
end

function jk.magic.MagicNumberRegistry:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.magic.MagicNumberRegistry'
	self['_isType.jk.magic.MagicNumberRegistry'] = true
	self.entries = {}
end

jk.magic.MagicNumberRegistry.MagicNumberInfo = {}
jk.magic.MagicNumberRegistry.MagicNumberInfo.__index = jk.magic.MagicNumberRegistry.MagicNumberInfo
_vm:set_metatable(jk.magic.MagicNumberRegistry.MagicNumberInfo, {})

function jk.magic.MagicNumberRegistry.MagicNumberInfo._create()
	local v = _vm:set_metatable({}, jk.magic.MagicNumberRegistry.MagicNumberInfo)
	return v
end

function jk.magic.MagicNumberRegistry.MagicNumberInfo:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.magic.MagicNumberRegistry.MagicNumberInfo'
	self['_isType.jk.magic.MagicNumberRegistry.MagicNumberInfo'] = true
	self.magic = nil
	self.description = nil
	self.mimeType = nil
end

function jk.magic.MagicNumberRegistry.MagicNumberInfo:_construct0()
	jk.magic.MagicNumberRegistry.MagicNumberInfo._init(self)
	return self
end

function jk.magic.MagicNumberRegistry:instance()
	if not (_g.jk.magic.MagicNumberRegistry.myInstance ~= nil) then
		_g.jk.magic.MagicNumberRegistry.myInstance = _g.jk.magic.MagicNumberRegistry._construct0(_g.jk.magic.MagicNumberRegistry._create())
	end
	do return _g.jk.magic.MagicNumberRegistry.myInstance end
end

function jk.magic.MagicNumberRegistry:createUnknown()
	local v = _g.jk.magic.MagicNumberRegistry.MagicNumberInfo._construct0(_g.jk.magic.MagicNumberRegistry.MagicNumberInfo._create())
	v.magic = ""
	v.description = "Unknown"
	v.mimeType = "application/unknown"
	do return v end
end

function jk.magic.MagicNumberRegistry:determineTypeForFile(file)
	if not (file ~= nil) then
		do return _g.jk.magic.MagicNumberRegistry:createUnknown() end
	end
	do
		local reader = file:read()
		if not (reader ~= nil) then
			do return _g.jk.magic.MagicNumberRegistry:createUnknown() end
		end
		do
			local buffer = _util:allocate_buffer(32)
			local r = reader:read(buffer)
			do reader:close() end
			if r < 1 then
				do return _g.jk.magic.MagicNumberRegistry:createUnknown() end
			end
			if r < 32 then
				buffer = _g.jk.lang.Buffer:getSubBuffer(buffer, 0, r, false)
			end
			do return _g.jk.magic.MagicNumberRegistry:determineMimeTypeForBuffer(buffer) end
		end
	end
end

function jk.magic.MagicNumberRegistry:determineMimeTypeForBuffer(buffer)
	if not (buffer ~= nil) then
		do return _g.jk.magic.MagicNumberRegistry:createUnknown() end
	end
	do
		local sz = #buffer
		if sz < 1 then
			do return _g.jk.magic.MagicNumberRegistry:createUnknown() end
		end
		do
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			if sz > 32 then
				sz = 32
			end
			do
				local n = 0
				while n < sz do
					do sb:appendString(_g.jk.lang.String:forIntegerHex(_g.jk.lang.Buffer:getByte(buffer, n), 2)) end
					do n = n + 1 end
				end
			end
			do
				local o = _g.jk.magic.MagicNumberRegistry:instance()
				local v = o:determineTypeForContentString(sb:toString())
				if v == nil then
					do return _g.jk.magic.MagicNumberRegistry:createUnknown() end
				end
				do
					local w = _g.jk.magic.MagicNumberRegistry.MagicNumberInfo._construct0(_g.jk.magic.MagicNumberRegistry.MagicNumberInfo._create())
					w.magic = v.magic
					w.description = v.description
					w.mimeType = v.mimeType
					if w.magic == nil then
						w.magic = ""
					end
					if _g.jk.lang.String:isEmpty(w.description) then
						w.description = "Unknown"
					end
					if _g.jk.lang.String:isEmpty(w.mimeType) then
						w.mimeType = "application/unknown"
					end
					do return w end
				end
			end
		end
	end
end

function jk.magic.MagicNumberRegistry:_construct0()
	jk.magic.MagicNumberRegistry._init(self)
	do self:add("EDABEEDB", "RPM package", nil) end
	do self:add("53503031", "Amazon Kindle Update Package", nil) end
	do self:add("00000100", "ICO icon", "image/vnd.microsoft.icon") end
	do self:add("667479703367", "3GPP and 3GPP2 multimedia files", "video/3gpp") end
	do self:add("1F9D", "Compressed file (LZW)", nil) end
	do self:add("1FA0", "Compressed file (LZH)", nil) end
	do self:add("425A68", "Compressed file (bzip2)", "application/bzip2") end
	do self:add("474946383761", "GIF image", "image/gif") end
	do self:add("474946383961", "GIF image", "image/gif") end
	do self:add("49492A00100000004352", "Canon RAW image format version 2", "image/x-canon-cr2") end
	do self:add("49492A00", "TIFF image (little endian)", "image/tiff") end
	do self:add("4D4D002A", "TIFF image (big endian)", "image/tiff") end
	do self:add("802A5FD7", "Kodak Cineon Image", "image/x-kodak-cineon") end
	do self:add("524E4301", "RNC compressed file", nil) end
	do self:add("524E4302", "RNC compressed file", nil) end
	do self:add("53445058", "SMPTE DPX image (big endian)", "image/x-smpte-dpx") end
	do self:add("58504453", "SMPTE DPX image (little endian)", "image/x-smpte-dpx") end
	do self:add("762F3101", "OpenEXR image", "image/x-openexr") end
	do self:add("425047FB", "Better Portable Graphics format", "image/x-bpg") end
	do self:add("FFD8FFDB", "JPEG image", "image/jpeg") end
	do self:add("FFD8FFE0....4A4649460001", "JPEG image", "image/jpeg") end
	do self:add("FFD8FFE1....457869660000", "JPEG image", "image/jpeg") end
	do self:add("4C5A4950", "LZIP compressed file", nil) end
	do self:add("4D5A", "EXE executable file", "application/x-exe") end
	do self:add("504B0304", "ZIP compressed file", "application/zip") end
	do self:add("504B0506", "ZIP compressed file", "application/zip") end
	do self:add("504B0708", "ZIP compressed file", "application/zip") end
	do self:add("526172211A0700", "RAR compressed file (version 1.50 onwards)", "application/x-rar") end
	do self:add("526172211A070100", "RAR compressed file (version 5.0 onwards)", "application/x-rar") end
	do self:add("7F454C46", "ELF binary", "application/x-elf") end
	do self:add("89504E470D0A1A0A", "PNG image", "application/png") end
	do self:add("CAFEBABE", "Java CLASS file", "application/x-java-class") end
	do self:add("FEEDFACE", "Mach-O binary (32 bit)", "application/x-mach-o-binary") end
	do self:add("FEEDFACF", "Mach-O binary (64 bit)", "application/x-mach-o-binary") end
	do self:add("CEFAEDFE", "Mach-O binary (32 bit)", "application/x-mach-o-binary") end
	do self:add("CFFAEDFE", "Mach-O binary (64 bit)", "application/x-mach-o-binary") end
	do self:add("25215053", "Postscript document", "application/postscript") end
	do self:add("25504446", "PDF document", "application/pdf") end
	do self:add("3026B2758E66CF11A6D900AA0062CE6C", "Advanced Streaming Format", "video/x-ms-asf") end
	do self:add("2453444930303031", "System Deployment Image", nil) end
	do self:add("4F676753", "OGG media", "application/ogg") end
	do self:add("38425053", "Photoshop document (PSD)", "application/psd") end
	do self:add("52494646........57415645", "Waveform (WAV) audio", "audio/wav") end
	do self:add("52494646........41564920", "Audio video interleave (AVI) video", "video/avi") end
	do self:add("FFFB", "MP3 audio", "audio/mp3") end
	do self:add("494433", "MP3 audio", "audio/mp3") end
	do self:add("424D", "BMP bitmap", "image/bmp") end
	do self:add("4344303031", "ISO image", "application/x-iso9660-image") end
	do self:add("664C6143", "Free Lossless Audio Codec (FLAC)", "audio/flac") end
	do self:add("4D546864", "MIDI sound", "audio/midi") end
	do self:add("D0CF11E0A1B11AE1", "Compound file format", nil) end
	do self:add("6465780A30333500", "Dalvix executable (dex)", "application/x-dex") end
	do self:add("4B444d", "VMDK", "application/x-vmdk") end
	do self:add("43723234", "Google Chrome extension", "application/x-chrome-extension") end
	do self:add("41474433", "FreeHand 8 document", "application/x-freehand8") end
	do self:add("05070000424F424F0507000000000000000000000001", "AppleWorks 5 document", "application/x-appleworks5") end
	do self:add("0607E100424F424F0607E10000000000000000000001", "AppleWorkd 6 document", "application/x-appleworks6") end
	do self:add("455202000000", "Roxio Toast disc image or DMG", nil) end
	do self:add("8B455202000000", "Roxio Toast disc image or DMG", nil) end
	do self:add("7801730D626260", "Apple Disk Image (DMG)", "application/x-dmg") end
	do self:add("78617221", "Extensible Archive Format (XAR)", "application/x-xar") end
	do self:add("504D4F43434D4F43", "Windows Files and Settings Transfer Repository", nil) end
	do self:add("4E45531A", "Nintendo Entertainment System (NES) ROM", nil) end
	do self:add("7573746172003030", "TAR archive", "application/tar") end
	do self:add("7573746172202000", "TAR archive", "application/tar") end
	do self:add("746F7833", "Open source portable voxel file", nil) end
	do self:add("4D4C5649", "Magic Lantern Video", "application/x-mlv") end
	do self:add("44434D0150413330", "Windows Update Binary Delta Compression", nil) end
	do self:add("377ABCAF271C", "7ZIP archive", "application/7zip") end
	do self:add("1F8B", "GZIP archive", "application/gzip") end
	do self:add("FD377A585A0000", "XZ archive", "application/xz") end
	do self:add("04224D18", "LZ4 Frame Format", nil) end
	do self:add("4D534346", "Microsoft Cabinet (CAB)", "application/cab") end
	do self:add("535A444488F02733", "Microsoft Quantum Compressed", nil) end
	do self:add("464C4946", "Free Lossless Image Format", "image/flif") end
	do self:add("1A45DFA3", "Matroska Media Container", "video/mkv") end
	do self:add("41542654464F524D........444A56", "DjVu Document", "application/djvu") end
	do self:add("3082", "DER encoded X.509 certificate", nil) end
	do self:add("4449434D", "DICOM Medical File Format", nil) end
	do self:add("774F4646", "WOFF File Format 1.0", "application/x-woff-1") end
	do self:add("774F4632", "WOFF File Format 2.0", "application/x-woff-2") end
	do self:add("3C3F786D6C20", "XML", "text/xml") end
	do self:add("0061736D", "WebAssembly Binary Format", "application/wasm") end
	do self:add("CF8401", "Lepton Compressed JPEG Image", "image/x-lepton") end
	do self:add("435753", "Flash SWF", "application/swf") end
	do self:add("465753", "Flash SWF", "application/swf") end
	do self:add("213C617263683E", "Linux DEB File", "application/x-deb") end
	do self:add("52494646........57454250", "Google WebP Image", "image/webp") end
	do self:add("27051956", "U-Boot uImage", "application/x-uimage") end
	do self:add("7B5C72746631", "Rich Text Format (RTF)", "text/rtf") end
	do self:add("54415045", "Microsoft Tape Format", nil) end
	do self:add("47", "MPEG Video", "video/mpeg") end
	do self:add("000001BA", "MPEG Video", "video/mpeg") end
	do self:add("000001B3", "MPEG Video", "video/mpeg") end
	do self:add("7801", "Zlib Compression (low compression)", "application/x-zlib") end
	do self:add("789C", "Zlib Compression (default compression)", "application/x-zlib") end
	do self:add("78DA", "Zlib Compression (best compression)", "application/x-zlib") end
	return self
end

function jk.magic.MagicNumberRegistry:isEntryMatching(entry, str)
	if not (str ~= nil) then
		do return false end
	end
	if not (entry ~= nil) then
		do return false end
	end
	if not (entry.magic ~= nil) then
		do return false end
	end
	do
		local sit = _g.jk.lang.String:iterate(str)
		if not (sit ~= nil) then
			do return false end
		end
		do
			local mit = _g.jk.lang.String:iterate(entry.magic)
			if not (mit ~= nil) then
				do return false end
			end
			while true do
				local sc = sit:getNextChar()
				local mc = mit:getNextChar()
				if mc < 1 then
					do break end
				end
				if mc == 46 then
					goto _continue1
				end
				if sc == mc then
					goto _continue1
				end
				do return false end
				::_continue1::
			end
			do return true end
		end
	end
end

function jk.magic.MagicNumberRegistry:determineTypeForContentString(str)
	if not (str ~= nil) then
		do return nil end
	end
	if self.entries ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.entries)
		do
			n = 0
			while n < m do
				local entry = self.entries[n + 1]
				if entry ~= nil then
					if self:isEntryMatching(entry, str) then
						do return entry end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return nil end
end

function jk.magic.MagicNumberRegistry:add(ident, description, mimeType)
	if not (ident ~= nil) then
		do return end
	end
	do
		local v = _g.jk.magic.MagicNumberRegistry.MagicNumberInfo._construct0(_g.jk.magic.MagicNumberRegistry.MagicNumberInfo._create())
		v.magic = ident
		v.description = description
		v.mimeType = mimeType
		do _g.jk.lang.Vector:append(self.entries, v) end
	end
end
