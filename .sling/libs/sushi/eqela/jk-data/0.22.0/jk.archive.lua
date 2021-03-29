jk = jk or {}

jk.archive = jk.archive or {}

jk.archive.ZipWriter = {}
jk.archive.ZipWriter.__index = jk.archive.ZipWriter
_vm:set_metatable(jk.archive.ZipWriter, {})

function jk.archive.ZipWriter._create()
	local v = _vm:set_metatable({}, jk.archive.ZipWriter)
	return v
end

function jk.archive.ZipWriter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.archive.ZipWriter'
	self['_isType.jk.archive.ZipWriter'] = true
end

function jk.archive.ZipWriter:_construct0()
	jk.archive.ZipWriter._init(self)
	return self
end

function jk.archive.ZipWriter:forOutputFile(file)
	do return _g.jk.archive.ZipWriterForSushi:forFile(file) end
end

function jk.archive.ZipWriter:writeToZipRecursive(ctx, dest, source, truncateDirectoryName)
	if not (dest ~= nil) then
		do _g.jk.log.Log:error(ctx, "No destination file specified for ZIP writer") end
		do return false end
	end
	if not (source ~= nil) then
		do _g.jk.log.Log:error(ctx, "No source file specified for ZIP writer") end
		do return false end
	end
	do
		local zip = _g.jk.archive.ZipWriter:forOutputFile(dest)
		if not (zip ~= nil) then
			do _g.jk.log.Log:error(ctx, "Failed to create ZIP writer for file: `" .. _g.jk.lang.String:safeString(dest:getPath()) .. "'") end
			do return false end
		end
		do
			local pd = source:getParent()
			if not (pd ~= nil) then
				do _g.jk.log.Log:error(ctx, "Directory has no parent: `" .. _g.jk.lang.String:safeString(source:getPath()) .. "'") end
				do return false end
			end
			do
				local parentPath = pd:getPath()
				if not _g.jk.lang.String:isNotEmpty(parentPath) then
					do _g.jk.log.Log:error(ctx, "Parent path is empty: `" .. _g.jk.lang.String:safeString(source:getPath()) .. "'") end
					do return false end
				end
				do
					local parentPathLength = _g.jk.lang.String:getLength(parentPath)
					if truncateDirectoryName then
						parentPathLength = _g.jk.lang.String:getLength(source:getPath())
					end
					if source:isFile() then
						if not zip:addFile(source, source:getBasename()) then
							do _g.jk.log.Log:error(ctx, "Failed to add to ZIP file: `" .. _g.jk.lang.String:safeString(source:getPath()) .. "'") end
							do zip:close() end
							do dest:remove() end
							do return false end
						end
						do zip:close() end
						do return true end
					end
					do
						local root = source
						if truncateDirectoryName then
							root = nil
						end
						do
							local ff = _g.jk.fs.FileFinder:forRoot(source)
							do ff:setIncludeDirectories(true) end
							while true do
								local file = nil
								if root ~= nil then
									file = root
									root = nil
								else
									file = ff:next()
								end
								if not (file ~= nil) then
									do break end
								end
								do
									local isFile = file:isFile()
									local isDirectory = file:isDirectory()
									if isFile == false and isDirectory == false then
										goto _continue4
									end
									do
										local fpath = file:getPath()
										if _g.jk.lang.String:isEmpty(fpath) then
											goto _continue4
										end
										do
											local partialPath = _g.jk.lang.String:getEndOfString(fpath, parentPathLength + 1)
											if _g.jk.lang.String:isEmpty(partialPath) then
												goto _continue4
											end
											partialPath = _g.jk.lang.String:replaceCharacter(partialPath, 92, 47)
											if isDirectory then
												partialPath = _g.jk.lang.String:safeString(partialPath) .. "/"
											end
											if not zip:addFile(file, partialPath) then
												do _g.jk.log.Log:error(ctx, "Failed to add to ZIP file: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'") end
												do zip:close() end
												do dest:remove() end
												do return false end
											end
										end
									end
								end
								::_continue4::
							end
							do zip:close() end
							do return true end
						end
					end
				end
			end
		end
	end
end

function jk.archive.ZipWriter:addFile(file, filename)
end

function jk.archive.ZipWriter:close()
end

jk.archive.ZipReader = {}
jk.archive.ZipReader.__index = jk.archive.ZipReader
_vm:set_metatable(jk.archive.ZipReader, {})

function jk.archive.ZipReader._create()
	local v = _vm:set_metatable({}, jk.archive.ZipReader)
	return v
end

function jk.archive.ZipReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.archive.ZipReader'
	self['_isType.jk.archive.ZipReader'] = true
end

function jk.archive.ZipReader:_construct0()
	jk.archive.ZipReader._init(self)
	return self
end

function jk.archive.ZipReader:forFile(file)
	do return _g.jk.archive.ZipReaderForSushi._construct0(_g.jk.archive.ZipReaderForSushi._create()):setFile(file):initialize() end
end

function jk.archive.ZipReader:extractZipBufferToDirectory(zipBuffer, destDir, listener)
	if not (zipBuffer ~= nil) then
		do return false end
	end
	do
		local dd = _g.jk.env.TemporaryDirectory:create()
		if not (dd ~= nil) then
			do return false end
		end
		do
			local ff = dd:entry("files.zip")
			if not ff:setContentsBuffer(zipBuffer) then
				do dd:removeRecursive() end
				do return false end
			end
			do
				local v = _g.jk.archive.ZipReader:extractZipFileToDirectory(ff, destDir, listener)
				do dd:removeRecursive() end
				do return v end
			end
		end
	end
end

function jk.archive.ZipReader:extractZipFileToDirectory(zipFile, destDir, listener)
	if not (zipFile ~= nil) then
		do return false end
	end
	if not (destDir ~= nil) then
		do return false end
	end
	do
		local zf = _g.jk.archive.ZipReader:forFile(zipFile)
		if not (zf ~= nil) then
			do return false end
		end
		if not destDir:isDirectory() then
			do destDir:createDirectoryRecursive() end
		end
		if not destDir:isDirectory() then
			do zf:close() end
			do return false end
		end
		do
			local array = zf:getEntries()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local entry = array[n + 1]
						if entry ~= nil then
							local ename = entry:getName()
							if _g.jk.lang.String:isEmpty(ename) then
								goto _continue1
							end
							do
								local dd = destDir
								ename = _g.jk.lang.String:replaceCharacter(ename, 92, 47)
								do
									local array2 = _g.jk.lang.String:split(ename, 47, 0)
									if array2 ~= nil then
										local n2 = 0
										local m2 = _g.jk.lang.Vector:getSize(array2)
										do
											n2 = 0
											while n2 < m2 do
												local comp = array2[n2 + 1]
												if comp ~= nil then
													if comp == "." or comp == ".." then
														goto _continue2
													end
													dd = dd:entry(comp)
												end
												::_continue2::
												do n2 = n2 + 1 end
											end
										end
									end
									if listener ~= nil then
										do listener(dd) end
									end
									if not entry:writeToFile(dd) then
										do zf:close() end
										do return false end
									end
								end
							end
						end
						::_continue1::
						do n = n + 1 end
					end
				end
			end
			do zf:close() end
			do return true end
		end
	end
end

function jk.archive.ZipReader:getEntries()
end

function jk.archive.ZipReader:close()
end

jk.archive.TarGZipWriter = {}
jk.archive.TarGZipWriter.__index = jk.archive.TarGZipWriter
_vm:set_metatable(jk.archive.TarGZipWriter, {})

function jk.archive.TarGZipWriter._create()
	local v = _vm:set_metatable({}, jk.archive.TarGZipWriter)
	return v
end

function jk.archive.TarGZipWriter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.archive.TarGZipWriter'
	self['_isType.jk.archive.TarGZipWriter'] = true
end

function jk.archive.TarGZipWriter:_construct0()
	jk.archive.TarGZipWriter._init(self)
	return self
end

function jk.archive.TarGZipWriter:instance()
	do return _g.jk.archive.ExternalTarGZipWriter._construct0(_g.jk.archive.ExternalTarGZipWriter._create()) end
end

function jk.archive.TarGZipWriter:writeToTarballRecursive(ctx, dest, source, truncateDirectoryName)
	if not (dest ~= nil) then
		do _g.jk.log.Log:error(ctx, "No destination file specified for tar/gzip writer") end
		do return false end
	end
	if not (source ~= nil) then
		do _g.jk.log.Log:error(ctx, "No source file specified for tar/gzip writer") end
		do return false end
	end
	do
		local writer = _g.jk.archive.TarGZipWriter:instance()
		if not (writer ~= nil) then
			do _g.jk.log.Log:error(ctx, "Failed to create tar/gzip writer") end
			do return false end
		end
		do return writer:tarDir(ctx, source, dest, truncateDirectoryName) end
	end
end

function jk.archive.TarGZipWriter:tarDir(ctx, dir, output, truncateDir)
end

jk.archive.ZipReaderEntry = {}
jk.archive.ZipReaderEntry.__index = jk.archive.ZipReaderEntry
_vm:set_metatable(jk.archive.ZipReaderEntry, {})

function jk.archive.ZipReaderEntry._create()
	local v = _vm:set_metatable({}, jk.archive.ZipReaderEntry)
	return v
end

function jk.archive.ZipReaderEntry:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.archive.ZipReaderEntry'
	self['_isType.jk.archive.ZipReaderEntry'] = true
	self.name = nil
	self.compressedSize = 0
	self.uncompressedSize = 0
	self.isDirectory = false
	self.mode = 0
end

function jk.archive.ZipReaderEntry:_construct0()
	jk.archive.ZipReaderEntry._init(self)
	return self
end

function jk.archive.ZipReaderEntry:getName()
	do return self.name end
end

function jk.archive.ZipReaderEntry:setName(newName)
	self.name = _g.jk.lang.String:replaceCharacter(newName, 92, 47)
	if _g.jk.lang.String:endsWith(self.name, "/") then
		self.isDirectory = true
		self.name = _g.jk.lang.String:getSubString(self.name, 0, _g.jk.lang.String:getLength(self.name) - 1)
	end
	do return self end
end

function jk.archive.ZipReaderEntry:getContentReader()
	do return nil end
end

function jk.archive.ZipReaderEntry:getContentsBuffer()
	if self:getIsDirectory() then
		do return nil end
	end
	do
		local reader = self:getContentReader()
		if not (reader ~= nil) then
			do return nil end
		end
		do
			local v = nil
			local buf = _util:allocate_buffer(4096 * 4)
			while true do
				local n = reader:read(buf)
				if n == 0 then
					do break end
				end
				if n < 0 then
					v = nil
					do break end
				end
				v = _g.jk.lang.Buffer:append(v, buf, n)
			end
			if (_vm:to_table_with_key(reader, '_isType.jk.lang.Closable') ~= nil) then
				do reader:close() end
			end
			do return v end
		end
	end
end

function jk.archive.ZipReaderEntry:getContentsUTF8()
	local v = self:getContentsBuffer()
	if not (v ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.String:forUTF8Buffer(v) end
end

function jk.archive.ZipReaderEntry:writeToFile(file)
	if not (file ~= nil) then
		do return false end
	end
	do
		local v = false
		if self:getIsDirectory() then
			v = file:createDirectoryRecursive()
		else
			local reader = self:getContentReader()
			if not (reader ~= nil) then
				do return false end
			end
			do
				local fp = file:getParent()
				if fp ~= nil then
					do fp:createDirectoryRecursive() end
				end
				do
					local writer = file:write()
					if not (writer ~= nil) then
						if (_vm:to_table_with_key(reader, '_isType.jk.lang.Closable') ~= nil) then
							do reader:close() end
						end
						do return false end
					end
					do
						local buf = _util:allocate_buffer(4096 * 4)
						v = true
						do
							local n = 0
							while (function()
								n = reader:read(buf)
								do return n end
							end)() > 0 do
								local nr = writer:write(buf, n)
								if nr ~= n then
									v = false
									do break end
								end
							end
							if reader ~= nil and (_vm:to_table_with_key(reader, '_isType.jk.lang.Closable') ~= nil) then
								do reader:close() end
							end
							if writer ~= nil and (_vm:to_table_with_key(writer, '_isType.jk.lang.Closable') ~= nil) then
								do writer:close() end
							end
							if not v then
								do file:remove() end
							end
						end
					end
				end
			end
		end
		if v and self.mode > 0 and (_g.jk.os.OS:isLinux() or _g.jk.os.OS:isMacOS()) then
			do file:setMode(self.mode) end
		end
		do return v end
	end
end

function jk.archive.ZipReaderEntry:writeToDir(dir, fullPath, overwrite)
	if not (dir ~= nil) then
		do return nil end
	end
	if not (self.name ~= nil) then
		do return nil end
	end
	do
		local path = nil
		if fullPath == false then
			local nn = nil
			local r = _g.jk.lang.String:getLastIndexOfCharacter(self.name, 47, -1)
			if r < 1 then
				nn = self.name
			else
				nn = _g.jk.lang.String:getEndOfString(self.name, r + 1)
			end
			if nn == nil or _g.jk.lang.String:getLength(nn) < 1 then
				do return nil end
			end
			path = dir:entry(nn)
		else
			path = dir
			do
				local array = _g.jk.lang.String:split(self.name, 47, 0)
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local x = array[n + 1]
							if x ~= nil then
								if x ~= nil and _g.jk.lang.String:getLength(x) > 0 then
									path = path:entry(x)
								end
							end
							do n = n + 1 end
						end
					end
				end
				do
					local dd = path:getParent()
					if not dd:isDirectory() then
						do dd:createDirectoryRecursive() end
					end
					if not dd:isDirectory() then
						do return nil end
					end
				end
			end
		end
		if overwrite == false then
			if path:exists() then
				do return nil end
			end
		end
		if not self:writeToFile(path) then
			do return nil end
		end
		do return path end
	end
end

function jk.archive.ZipReaderEntry:getCompressedSize()
	do return self.compressedSize end
end

function jk.archive.ZipReaderEntry:setCompressedSize(v)
	self.compressedSize = v
	do return self end
end

function jk.archive.ZipReaderEntry:getUncompressedSize()
	do return self.uncompressedSize end
end

function jk.archive.ZipReaderEntry:setUncompressedSize(v)
	self.uncompressedSize = v
	do return self end
end

function jk.archive.ZipReaderEntry:getIsDirectory()
	do return self.isDirectory end
end

function jk.archive.ZipReaderEntry:setIsDirectory(v)
	self.isDirectory = v
	do return self end
end

function jk.archive.ZipReaderEntry:getMode()
	do return self.mode end
end

function jk.archive.ZipReaderEntry:setMode(v)
	self.mode = v
	do return self end
end

jk.archive.ZipWriterForSushi = _g.jk.archive.ZipWriter._create()
jk.archive.ZipWriterForSushi.__index = jk.archive.ZipWriterForSushi
_vm:set_metatable(jk.archive.ZipWriterForSushi, {
	__index = _g.jk.archive.ZipWriter
})

function jk.archive.ZipWriterForSushi._create()
	local v = _vm:set_metatable({}, jk.archive.ZipWriterForSushi)
	return v
end

function jk.archive.ZipWriterForSushi:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.archive.ZipWriterForSushi'
	self['_isType.jk.archive.ZipWriterForSushi'] = true
	self.zip = nil
end

function jk.archive.ZipWriterForSushi:_construct0()
	jk.archive.ZipWriterForSushi._init(self)
	do _g.jk.archive.ZipWriter._construct0(self) end
	return self
end

function jk.archive.ZipWriterForSushi:forFile(file)
	if not (file ~= nil) then
		do return nil end
	end
	do
		local path = file:getPath()
		if not _g.jk.lang.String:isNotEmpty(path) then
			do return nil end
		end
		do
			local zip = _zip:write_open(path)
			if not (zip ~= nil) then
				do return nil end
			end
			do
				local v = _g.jk.archive.ZipWriterForSushi._construct0(_g.jk.archive.ZipWriterForSushi._create())
				do v:setZip(zip) end
				do return v end
			end
		end
	end
end

function jk.archive.ZipWriterForSushi:addFile(file, filename)
	local zip = self.zip
	if not (zip ~= nil) then
		do return false end
	end
	if not (file ~= nil) then
		do return false end
	end
	if not _g.jk.lang.String:isNotEmpty(filename) then
		do return false end
	end
	do
		local v = false
		local ts = file:getLastModifiedTimeStamp()
		local attribs = 0
		local mode = 0
		local info = file:stat()
		if info ~= nil then
			mode = info:getMode()
		end
		do
			local large = 0
			if info:getSize() > 4294967295 then
				large = 1
			end
			if not _zip:write_start_file(zip, filename, ts, mode, large) then
				do return false end
			end
			if file:isDirectory() then
				v = true
			else
				local rd = file:read()
				if rd ~= nil then
					v = true
					do
						local bb = _util:allocate_buffer(32 * 1024)
						while true do
							local sz = rd:read(bb)
							if sz < 1 then
								do break end
							end
							if not _zip:write_to_file(zip, bb, sz) then
								v = false
								do break end
							end
						end
						do rd:close() end
					end
				end
			end
			do _zip:write_end_file(zip) end
			do return v end
		end
	end
end

function jk.archive.ZipWriterForSushi:close()
	local zz = self.zip
	if zz ~= nil then
		do _zip:write_close(zz) end
		self.zip = nil
	end
end

function jk.archive.ZipWriterForSushi:getZip()
	do return self.zip end
end

function jk.archive.ZipWriterForSushi:setZip(v)
	self.zip = v
	do return self end
end

jk.archive.ArchiveKit = {}
jk.archive.ArchiveKit.__index = jk.archive.ArchiveKit
_vm:set_metatable(jk.archive.ArchiveKit, {})

function jk.archive.ArchiveKit._create()
	local v = _vm:set_metatable({}, jk.archive.ArchiveKit)
	return v
end

function jk.archive.ArchiveKit:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.archive.ArchiveKit'
	self['_isType.jk.archive.ArchiveKit'] = true
	self.ctx = nil
end

function jk.archive.ArchiveKit:_construct0()
	jk.archive.ArchiveKit._init(self)
	return self
end

function jk.archive.ArchiveKit:_construct1(ctx)
	jk.archive.ArchiveKit._init(self)
	self.ctx = ctx
	return self
end

function jk.archive.ArchiveKit:compressZip(src, output)
	local srcfile = _g.jk.fs.File:asFile(src)
	if not (srcfile ~= nil) then
		do _g.jk.lang.Error:throw("invalidParameter", _g.jk.lang.String:asString(src)) end
	end
	do
		local outputfile = _g.jk.fs.File:asFile(output)
		if not (outputfile ~= nil) then
			outputfile = srcfile:getSibling(_g.jk.lang.String:safeString(srcfile:getBasename()) .. ".zip")
		end
		do _g.jk.log.Log:status(self.ctx, "Compressing files ..") end
		if not _g.jk.archive.ZipWriter:writeToZipRecursive(self.ctx, outputfile, srcfile, true) then
			do _g.jk.lang.Error:throw("failedToWrite", outputfile:getPath()) end
		end
		do _g.jk.log.Log:status(self.ctx, nil) end
		do return outputfile end
	end
end

function jk.archive.ArchiveKit:compressTarball(src, output)
	local srcfile = _g.jk.fs.File:asFile(src)
	if not (srcfile ~= nil) then
		do _g.jk.lang.Error:throw("invalidParameter", _g.jk.lang.String:asString(src)) end
	end
	do
		local outputfile = _g.jk.fs.File:asFile(output)
		if not (outputfile ~= nil) then
			outputfile = srcfile:getSibling(_g.jk.lang.String:safeString(srcfile:getBasename()) .. ".tar.gz")
		end
		do _g.jk.log.Log:status(self.ctx, "Compressing files ..") end
		if not _g.jk.archive.TarGZipWriter:writeToTarballRecursive(self.ctx, outputfile, srcfile, true) then
			do _g.jk.lang.Error:throw("failedToWrite", outputfile:getPath()) end
		end
		do _g.jk.log.Log:status(self.ctx, nil) end
		do return outputfile end
	end
end

jk.archive.TarReader = {}
jk.archive.TarReader.__index = jk.archive.TarReader
_vm:set_metatable(jk.archive.TarReader, {})

function jk.archive.TarReader._create()
	local v = _vm:set_metatable({}, jk.archive.TarReader)
	return v
end

function jk.archive.TarReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.archive.TarReader'
	self['_isType.jk.archive.TarReader'] = true
end

function jk.archive.TarReader:_construct0()
	jk.archive.TarReader._init(self)
	return self
end

function jk.archive.TarReader:isTarFile(file)
	if not (file ~= nil) then
		do return false end
	end
	do
		local bn = _g.jk.lang.String:toLowerCase(file:getBasename())
		if not (bn ~= nil) then
			do return false end
		end
		if _g.jk.lang.String:endsWith(bn, ".tar") then
			do return true end
		end
		if _g.jk.lang.String:endsWith(bn, ".tar.gz") or _g.jk.lang.String:endsWith(bn, ".tar.bz2") or _g.jk.lang.String:endsWith(bn, ".tar.xz") then
			do return true end
		end
		if _g.jk.lang.String:endsWith(bn, ".tgz") or _g.jk.lang.String:endsWith(bn, ".tbz") or _g.jk.lang.String:endsWith(bn, ".tbz2") or _g.jk.lang.String:endsWith(bn, ".txz") then
			do return true end
		end
		do return false end
	end
end

function jk.archive.TarReader:extractTarFileToDirectory(tarFile, destDir)
	if not (tarFile ~= nil) then
		do return false end
	end
	if not (destDir ~= nil) then
		do return false end
	end
	do
		local pl = _g.jk.process.ProcessLauncher:forCommand("tar", nil)
		if not (pl ~= nil) then
			do return false end
		end
		if not destDir:isDirectory() then
			do destDir:createDirectoryRecursive() end
		end
		if not destDir:isDirectory() then
			do return false end
		end
		do pl:setCwd(destDir) end
		do pl:addToParams("xf") end
		do pl:addToParams(tarFile:getPath()) end
		if not (pl:execute() == 0) then
			do return false end
		end
		do return true end
	end
end

jk.archive.ExternalTarGZipWriter = _g.jk.archive.TarGZipWriter._create()
jk.archive.ExternalTarGZipWriter.__index = jk.archive.ExternalTarGZipWriter
_vm:set_metatable(jk.archive.ExternalTarGZipWriter, {
	__index = _g.jk.archive.TarGZipWriter
})

function jk.archive.ExternalTarGZipWriter._create()
	local v = _vm:set_metatable({}, jk.archive.ExternalTarGZipWriter)
	return v
end

function jk.archive.ExternalTarGZipWriter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.archive.ExternalTarGZipWriter'
	self['_isType.jk.archive.ExternalTarGZipWriter'] = true
end

function jk.archive.ExternalTarGZipWriter:_construct0()
	jk.archive.ExternalTarGZipWriter._init(self)
	do _g.jk.archive.TarGZipWriter._construct0(self) end
	return self
end

function jk.archive.ExternalTarGZipWriter:tarDir(ctx, dir, output, truncateDir)
	if not (dir ~= nil) then
		do _g.jk.log.Log:error(ctx, "No directory provided.") end
		do return false end
	end
	if not dir:isDirectory() then
		do _g.jk.log.Log:error(ctx, "Not a directory: `" .. _g.jk.lang.String:safeString(dir:getPath()) .. "'") end
		do return false end
	end
	do
		local bn = dir:baseName()
		if not (_g.jk.lang.String:isEmpty(bn) == false) then
			do _g.jk.log.Log:error(ctx, "Empty basename: `" .. _g.jk.lang.String:safeString(dir:getPath()) .. "'") end
			do return false end
		end
		do
			local pd = dir:getParent()
			if not (pd ~= nil) then
				do _g.jk.log.Log:error(ctx, "Directory has no parent: `" .. _g.jk.lang.String:safeString(dir:getPath()) .. "'") end
				do return false end
			end
			do
				local of = output
				if of == nil then
					of = pd:entry(_g.jk.lang.String:safeString(bn) .. ".tar.gz")
				end
				do
					local pl = _g.jk.process.ProcessLauncher:forCommand("tar", nil)
					if not (pl ~= nil) then
						do _g.jk.log.Log:error(ctx, "Failed to create a process launcher for command: `tar'") end
						do return false end
					end
					do pl:addToParams("zcf") end
					do pl:addToParams(of:getPath()) end
					if truncateDir then
						do pl:setCwd(dir) end
						do pl:addToParams(".") end
					else
						do pl:setCwd(pd) end
						do pl:addToParams(bn) end
					end
					do
						local r = pl:execute()
						if not (r == 0) then
							do _g.jk.log.Log:error(ctx, "Failure in execution of the tar command") end
							do return false end
						end
						do return true end
					end
				end
			end
		end
	end
end

jk.archive.ZipReaderForSushi = _g.jk.archive.ZipReader._create()
jk.archive.ZipReaderForSushi.__index = jk.archive.ZipReaderForSushi
_vm:set_metatable(jk.archive.ZipReaderForSushi, {
	__index = _g.jk.archive.ZipReader
})

function jk.archive.ZipReaderForSushi._create()
	local v = _vm:set_metatable({}, jk.archive.ZipReaderForSushi)
	return v
end

function jk.archive.ZipReaderForSushi:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.archive.ZipReaderForSushi'
	self['_isType.jk.archive.ZipReaderForSushi'] = true
	self.file = nil
	self.handle = nil
	self.readerOpen = false
	self.entryReader = nil
end

jk.archive.ZipReaderForSushi.MyZipFileEntryReader = {}
jk.archive.ZipReaderForSushi.MyZipFileEntryReader.__index = jk.archive.ZipReaderForSushi.MyZipFileEntryReader
_vm:set_metatable(jk.archive.ZipReaderForSushi.MyZipFileEntryReader, {})

function jk.archive.ZipReaderForSushi.MyZipFileEntryReader._create()
	local v = _vm:set_metatable({}, jk.archive.ZipReaderForSushi.MyZipFileEntryReader)
	return v
end

function jk.archive.ZipReaderForSushi.MyZipFileEntryReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.archive.ZipReaderForSushi.MyZipFileEntryReader'
	self['_isType.jk.archive.ZipReaderForSushi.MyZipFileEntryReader'] = true
	self['_isType.jk.io.Reader'] = true
	self['_isType.jk.lang.Closable'] = true
	self.parent = nil
end

function jk.archive.ZipReaderForSushi.MyZipFileEntryReader:_construct0()
	jk.archive.ZipReaderForSushi.MyZipFileEntryReader._init(self)
	return self
end

function jk.archive.ZipReaderForSushi.MyZipFileEntryReader:read(buffer)
	if not (self.parent ~= nil) then
		do return -1 end
	end
	do
		local handle = self.parent:getHandle()
		if not (handle ~= nil) then
			do return -1 end
		end
		if not (buffer ~= nil) then
			do return 0 end
		end
		do return _zip:read_get_file_data(handle, buffer) end
	end
end

function jk.archive.ZipReaderForSushi.MyZipFileEntryReader:close()
	if not (self.parent ~= nil) then
		do return end
	end
	do self.parent:closeEntryReader() end
end

function jk.archive.ZipReaderForSushi.MyZipFileEntryReader:getParent()
	do return self.parent end
end

function jk.archive.ZipReaderForSushi.MyZipFileEntryReader:setParent(v)
	self.parent = v
	do return self end
end

jk.archive.ZipReaderForSushi.MyZipReaderEntry = _g.jk.archive.ZipReaderEntry._create()
jk.archive.ZipReaderForSushi.MyZipReaderEntry.__index = jk.archive.ZipReaderForSushi.MyZipReaderEntry
_vm:set_metatable(jk.archive.ZipReaderForSushi.MyZipReaderEntry, {
	__index = _g.jk.archive.ZipReaderEntry
})

function jk.archive.ZipReaderForSushi.MyZipReaderEntry._create()
	local v = _vm:set_metatable({}, jk.archive.ZipReaderForSushi.MyZipReaderEntry)
	return v
end

function jk.archive.ZipReaderForSushi.MyZipReaderEntry:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.archive.ZipReaderForSushi.MyZipReaderEntry'
	self['_isType.jk.archive.ZipReaderForSushi.MyZipReaderEntry'] = true
	self.parent = nil
end

function jk.archive.ZipReaderForSushi.MyZipReaderEntry:_construct0()
	jk.archive.ZipReaderForSushi.MyZipReaderEntry._init(self)
	do _g.jk.archive.ZipReaderEntry._construct0(self) end
	return self
end

function jk.archive.ZipReaderForSushi.MyZipReaderEntry:getContentReader()
	if not (self.parent ~= nil) then
		do return nil end
	end
	do return self.parent:getReaderForFile(self:getName()) end
end

function jk.archive.ZipReaderForSushi.MyZipReaderEntry:getParent()
	do return self.parent end
end

function jk.archive.ZipReaderForSushi.MyZipReaderEntry:setParent(v)
	self.parent = v
	do return self end
end

function jk.archive.ZipReaderForSushi:_construct0()
	jk.archive.ZipReaderForSushi._init(self)
	do _g.jk.archive.ZipReader._construct0(self) end
	self.entryReader = _g.jk.archive.ZipReaderForSushi.MyZipFileEntryReader._construct0(_g.jk.archive.ZipReaderForSushi.MyZipFileEntryReader._create())
	do self.entryReader:setParent(self) end
	return self
end

function jk.archive.ZipReaderForSushi:getHandle()
	do return self.handle end
end

function jk.archive.ZipReaderForSushi:initialize()
	if not (self.file ~= nil) then
		do return nil end
	end
	do
		local path = self.file:getPath()
		if not (path ~= nil) then
			do return nil end
		end
		if self.handle ~= nil then
			do self:close() end
		end
		self.handle = _zip:read_open(path)
		if not (self.handle ~= nil) then
			do return nil end
		end
		do return self end
	end
end

function jk.archive.ZipReaderForSushi:closeEntryReader()
	if self.readerOpen then
		do _zip:read_close_file(handle) end
		self.readerOpen = false
	end
end

function jk.archive.ZipReaderForSushi:getReaderForFile(filename)
	local handle = self.handle
	if not (handle ~= nil) then
		do return nil end
	end
	do
		local name = filename
		if not (name ~= nil) then
			do return nil end
		end
		do self:closeEntryReader() end
		if not (_zip:read_open_file(handle, name) == 1) then
			do return nil end
		end
		do return self.entryReader end
	end
end

function jk.archive.ZipReaderForSushi:getEntries()
	local handle = self.handle
	if not (handle ~= nil) then
		do return nil end
	end
	do
		local v = {}
		if _zip:read_first(handle) == 0 then
			do return nil end
		end
		while true do
			local name = nil
			local compressedSize = 0
			local uncompressedSize = 0
			local mode = 0
			do name, compressedSize, uncompressedSize, mode = _zip:read_entry_info(handle) end
			if not (name ~= nil) then
				do break end
			end
			do
				local entry = _g.jk.archive.ZipReaderForSushi.MyZipReaderEntry._construct0(_g.jk.archive.ZipReaderForSushi.MyZipReaderEntry._create())
				do entry:setParent(self) end
				do entry:setName(name) end
				do entry:setCompressedSize(compressedSize) end
				do entry:setUncompressedSize(uncompressedSize) end
				do entry:setMode(mode) end
				do _g.jk.lang.Vector:append(v, entry) end
				do
					local r = _zip:read_next(handle)
					if r == 0 then
						do return nil end
					end
					if r == 1 then
						goto _continue3
					end
					if r == 2 then
						do break end
					end
				end
			end
			::_continue3::
		end
		do return v end
	end
end

function jk.archive.ZipReaderForSushi:close()
	do self:closeEntryReader() end
	do
		local handle = self.handle
		if handle ~= nil then
			do _zip:read_close(handle) end
			handle = nil
		end
	end
end

function jk.archive.ZipReaderForSushi:getFile()
	do return self.file end
end

function jk.archive.ZipReaderForSushi:setFile(v)
	self.file = v
	do return self end
end
