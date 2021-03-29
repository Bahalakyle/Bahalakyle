jk = jk or {}

jk.fs = jk.fs or {}

jk.fs.FileWriter = {}

jk.fs.FileFinder = {}
jk.fs.FileFinder.__index = jk.fs.FileFinder
_vm:set_metatable(jk.fs.FileFinder, {})

function jk.fs.FileFinder._create()
	local v = _vm:set_metatable({}, jk.fs.FileFinder)
	return v
end

function jk.fs.FileFinder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.FileFinder'
	self['_isType.jk.fs.FileFinder'] = true
	self['_isType.jk.lang.Iterator'] = true
	self.root = nil
	self.patterns = nil
	self.excludePatterns = nil
	self.stack = nil
	self.includeMatchingDirectories = false
	self.includeDirectories = false
end

function jk.fs.FileFinder:forRoot(root)
	do return _g.jk.fs.FileFinder._construct0(_g.jk.fs.FileFinder._create()):setRoot(root) end
end

jk.fs.FileFinder.Pattern = {}
jk.fs.FileFinder.Pattern.__index = jk.fs.FileFinder.Pattern
_vm:set_metatable(jk.fs.FileFinder.Pattern, {})

function jk.fs.FileFinder.Pattern._create()
	local v = _vm:set_metatable({}, jk.fs.FileFinder.Pattern)
	return v
end

function jk.fs.FileFinder.Pattern:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.FileFinder.Pattern'
	self['_isType.jk.fs.FileFinder.Pattern'] = true
	self.pattern = nil
	self.suffix = nil
	self.prefix = nil
end

function jk.fs.FileFinder.Pattern:_construct0()
	jk.fs.FileFinder.Pattern._init(self)
	return self
end

function jk.fs.FileFinder.Pattern:setPattern(pattern)
	self.pattern = pattern
	if pattern ~= nil then
		if _g.jk.lang.String:startsWith(pattern, "*", 0) then
			self.suffix = _g.jk.lang.String:getEndOfString(pattern, 1)
		end
		if _g.jk.lang.String:endsWith(pattern, "*") then
			self.prefix = _g.jk.lang.String:getSubString(pattern, 0, _g.jk.lang.String:getLength(pattern) - 1)
		end
	end
	do return self end
end

function jk.fs.FileFinder.Pattern:match(check)
	if not (check ~= nil) then
		do return false end
	end
	if self.pattern == check then
		do return true end
	end
	if self.suffix ~= nil and _g.jk.lang.String:endsWith(check, self.suffix) then
		do return true end
	end
	if self.prefix ~= nil and _g.jk.lang.String:startsWith(check, self.prefix, 0) then
		do return true end
	end
	do return false end
end

function jk.fs.FileFinder:_construct0()
	jk.fs.FileFinder._init(self)
	self.patterns = {}
	self.excludePatterns = {}
	return self
end

function jk.fs.FileFinder:setRoot(root)
	self.root = root
	self.stack = nil
	do return self end
end

function jk.fs.FileFinder:addPattern(pattern)
	do _g.jk.lang.Vector:append(self.patterns, _g.jk.fs.FileFinder.Pattern._construct0(_g.jk.fs.FileFinder.Pattern._create()):setPattern(pattern)) end
	do return self end
end

function jk.fs.FileFinder:addExcludePattern(pattern)
	do _g.jk.lang.Vector:append(self.excludePatterns, _g.jk.fs.FileFinder.Pattern._construct0(_g.jk.fs.FileFinder.Pattern._create()):setPattern(pattern)) end
	do return self end
end

function jk.fs.FileFinder:matchPattern(file)
	if not (file ~= nil) then
		do return false end
	end
	if _g.jk.lang.Vector:getSize(self.patterns) < 1 then
		do return true end
	end
	do
		local filename = file:getBasename()
		if self.patterns ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self.patterns)
			do
				n = 0
				while n < m do
					local pattern = self.patterns[n + 1]
					if pattern ~= nil then
						if pattern:match(filename) then
							do return true end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do return false end
	end
end

function jk.fs.FileFinder:matchExcludePattern(file)
	if not (file ~= nil) then
		do return false end
	end
	if _g.jk.lang.Vector:getSize(self.excludePatterns) < 1 then
		do return false end
	end
	do
		local filename = file:getBasename()
		if self.excludePatterns ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self.excludePatterns)
			do
				n = 0
				while n < m do
					local pattern = self.excludePatterns[n + 1]
					if pattern ~= nil then
						if pattern:match(filename) then
							do return true end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do return false end
	end
end

function jk.fs.FileFinder:next()
	while true do
		if not (self.stack ~= nil) then
			if not (self.root ~= nil) then
				do break end
			end
			do
				local es = self.root:entries()
				self.root = nil
				if not (es ~= nil) then
					do break end
				end
				self.stack = _g.jk.lang.Stack._construct0(_g.jk.lang.Stack._create())
				do self.stack:push(es) end
			end
		end
		do
			local entries = self.stack:peek()
			if not (entries ~= nil) then
				self.stack = nil
				do break end
			end
			do
				local e = entries:next()
				if not (e ~= nil) then
					do self.stack:pop() end
				elseif self:matchExcludePattern(e) then
				elseif e:isFile() then
					if self:matchPattern(e) then
						do return e end
					end
				elseif self.includeMatchingDirectories and e:isDirectory() and self:matchPattern(e) then
					do return e end
				elseif e:isDirectory() and e:isLink() == false then
					local ees = e:entries()
					if ees ~= nil then
						do self.stack:push(ees) end
					end
					if self.includeDirectories then
						do return e end
					end
				end
			end
		end
	end
	do return nil end
end

function jk.fs.FileFinder:hasNext()
	if not (self.stack ~= nil) then
		do return false end
	end
	do
		local it = self.stack:peek()
		if not (it ~= nil) then
			do return false end
		end
		do return it:hasNext() end
	end
end

function jk.fs.FileFinder:getIncludeMatchingDirectories()
	do return self.includeMatchingDirectories end
end

function jk.fs.FileFinder:setIncludeMatchingDirectories(v)
	self.includeMatchingDirectories = v
	do return self end
end

function jk.fs.FileFinder:getIncludeDirectories()
	do return self.includeDirectories end
end

function jk.fs.FileFinder:setIncludeDirectories(v)
	self.includeDirectories = v
	do return self end
end

jk.fs.FileKit = {}
jk.fs.FileKit.__index = jk.fs.FileKit
_vm:set_metatable(jk.fs.FileKit, {})

function jk.fs.FileKit._create()
	local v = _vm:set_metatable({}, jk.fs.FileKit)
	return v
end

function jk.fs.FileKit:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.FileKit'
	self['_isType.jk.fs.FileKit'] = true
	self.ctx = nil
end

function jk.fs.FileKit:_construct0()
	jk.fs.FileKit._init(self)
	return self
end

function jk.fs.FileKit:_construct1(ctx)
	jk.fs.FileKit._init(self)
	self.ctx = ctx
	return self
end

function jk.fs.FileKit:asFile(file)
	local fo = _g.jk.fs.File:asFile(file)
	if not (fo ~= nil) then
		do _g.jk.lang.Error:throw("invalidParameter", _g.jk.lang.String:asString(file)) end
	end
	do return fo end
end

function jk.fs.FileKit:copy(src, dst)
	local srcf = self:asFile(src)
	local dstf = self:asFile(dst)
	if dstf:isDirectory() then
		dstf = dstf:entry(srcf:getBasename())
	end
	if not srcf:copyFileOrDirectoryTo(dstf) then
		do _g.jk.lang.Error:throw("failedToCopy", srcf:getPath()) end
	end
	do return dstf end
end

function jk.fs.FileKit:remove(file)
	local fo = self:asFile(file)
	if not fo:removeRecursive() then
		do _g.jk.lang.Error:throw("failedToRemove", fo:getPath()) end
	end
end

function jk.fs.FileKit:readAsBuffer(file)
	local fo = self:asFile(file)
	local v = fo:getContentsBuffer()
	if not (v ~= nil) then
		do _g.jk.lang.Error:throw("failedToRead", fo:getPath()) end
	end
	do return v end
end

function jk.fs.FileKit:readAsString(file)
	local fo = self:asFile(file)
	local v = fo:getContentsUTF8()
	if not (v ~= nil) then
		do _g.jk.lang.Error:throw("failedToRead", fo:getPath()) end
	end
	do return v end
end

function jk.fs.FileKit:writeBuffer(file, data)
	local fo = self:asFile(file)
	if not fo:setContentsBuffer(data) then
		do _g.jk.lang.Error:throw("failedToWrite", fo:getPath()) end
	end
end

function jk.fs.FileKit:writeString(file, data)
	local fo = self:asFile(file)
	if not fo:setContentsUTF8(_g.jk.lang.String:asString(data)) then
		do _g.jk.lang.Error:throw("failedToWrite", fo:getPath()) end
	end
end

jk.fs.PathInfo = {}
jk.fs.PathInfo.__index = jk.fs.PathInfo
_vm:set_metatable(jk.fs.PathInfo, {})

function jk.fs.PathInfo._create()
	local v = _vm:set_metatable({}, jk.fs.PathInfo)
	return v
end

function jk.fs.PathInfo:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.PathInfo'
	self['_isType.jk.fs.PathInfo'] = true
end

function jk.fs.PathInfo:_construct0()
	jk.fs.PathInfo._init(self)
	return self
end

function jk.fs.PathInfo:getPathSeparator()
	if _g.jk.os.OS:isWindows() then
		do return 92 end
	end
	do return 47 end
end

function jk.fs.PathInfo:isAbsolutePath(path)
	if not (path ~= nil) then
		do return false end
	end
	do
		local c0 = _g.jk.lang.String:getChar(path, 0)
		if c0 == 47 then
			do return true end
		end
		if _g.jk.os.OS:isWindows() then
			if c0 == 92 then
				do return true end
			end
			if _g.jk.lang.Character:isAlpha(c0) and _g.jk.lang.String:getChar(path, 1) == 58 then
				local d = _g.jk.lang.String:getChar(path, 2)
				if d == 92 or d == 47 then
					do return true end
				end
			end
		end
		do return false end
	end
end

jk.fs.File = {}
jk.fs.File.__index = jk.fs.File
_vm:set_metatable(jk.fs.File, {})

function jk.fs.File._create()
	local v = _vm:set_metatable({}, jk.fs.File)
	return v
end

function jk.fs.File:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.File'
	self['_isType.jk.fs.File'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.lastErrorDescription = nil
end

function jk.fs.File:_construct0()
	jk.fs.File._init(self)
	return self
end

function jk.fs.File:asFile(o)
	if not (o ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(o, '_isType.jk.fs.File') ~= nil) then
		do return o end
	end
	do
		local ss = _g.jk.lang.String:asString(o)
		if ss ~= nil then
			do return _g.jk.fs.File:forPath(ss) end
		end
		do return nil end
	end
end

function jk.fs.File:asFileVector(o)
	local it = _g.jk.lang.DynamicObject:iterate(o)
	if not (it ~= nil) then
		do return nil end
	end
	do
		local v = {}
		while true do
			local oo = it:next()
			if not (oo ~= nil) then
				do break end
			end
			do
				local ff = _g.jk.fs.File:asFile(oo)
				if ff ~= nil then
					do _g.jk.lang.Vector:append(v, ff) end
				end
			end
		end
		do return v end
	end
end

function jk.fs.File:forPath(path)
	if path == nil or _g.jk.lang.String:getLength(path) < 1 then
		do return _g.jk.fs.FileInvalid._construct0(_g.jk.fs.FileInvalid._create()) end
	end
	do return _g.jk.fs.FileForSushi:forPath(path) end
end

function jk.fs.File:forRawPath(path)
	do return _g.jk.fs.FileForSushi:forRawPath(path) end
end

function jk.fs.File:forRelativePath(path, relativeTo, alwaysSupportWindowsPathnames)
	if relativeTo == nil then
		do return _g.jk.fs.File:forPath(path) end
	end
	if path == nil then
		do return _g.jk.fs.FileInvalid._construct0(_g.jk.fs.FileInvalid._create()) end
	end
	if _g.jk.fs.PathInfo:isAbsolutePath(path) then
		do return _g.jk.fs.File:forPath(path) end
	end
	do
		local sep = _g.jk.fs.PathInfo:getPathSeparator()
		if sep ~= 47 then
			if _g.jk.lang.String:getIndexOfCharacter(path, sep, 0) < 0 and _g.jk.lang.String:getIndexOfCharacter(path, 47, 0) >= 0 then
				sep = 47
			end
		elseif alwaysSupportWindowsPathnames then
			if _g.jk.lang.String:getIndexOfCharacter(path, sep, 0) < 0 and _g.jk.lang.String:getIndexOfCharacter(path, 92, 0) >= 0 then
				sep = 92
			end
		end
		do
			local f = relativeTo
			local comps = _g.jk.lang.String:split(path, sep, 0)
			if comps ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(comps)
				do
					n = 0
					while n < m do
						local comp = comps[n + 1]
						if comp ~= nil then
							if _g.jk.lang.String:isEmpty(comp) then
								goto _continue1
							end
							f = f:entry(comp)
						end
						::_continue1::
						do n = n + 1 end
					end
				end
			end
			do return f end
		end
	end
end

function jk.fs.File:entry(name)
end

function jk.fs.File:rawEntry(name)
	do return self:entry(name) end
end

function jk.fs.File:entries()
end

function jk.fs.File:move(dest, replace)
end

function jk.fs.File:touch()
end

function jk.fs.File:read()
end

function jk.fs.File:write()
end

function jk.fs.File:append()
end

function jk.fs.File:stat()
end

function jk.fs.File:createDirectory()
end

function jk.fs.File:createDirectoryRecursive()
end

function jk.fs.File:removeDirectory()
end

function jk.fs.File:getPath()
end

function jk.fs.File:remove()
end

function jk.fs.File:makeExecutable()
end

function jk.fs.File:getRelativePath(baseFile, prefix)
	if not (baseFile ~= nil) then
		do return nil end
	end
	do
		local vp = self:getPath()
		local bp = baseFile:getPath()
		while _g.jk.lang.String:endsWith(bp, "/") or _g.jk.lang.String:endsWith(bp, "\\") do
			bp = _g.jk.lang.String:getSubString(bp, 0, _g.jk.lang.String:getLength(bp) - 1)
		end
		if _g.jk.lang.String:startsWith(vp, _g.jk.lang.String:safeString(bp) .. "/", 0) or _g.jk.lang.String:startsWith(vp, _g.jk.lang.String:safeString(bp) .. "\\", 0) then
			if prefix ~= nil then
				do return _g.jk.lang.String:safeString(prefix) .. _g.jk.lang.String:safeString(_g.jk.lang.String:getEndOfString(vp, _g.jk.lang.String:getLength(bp))) end
			end
			do return _g.jk.lang.String:getEndOfString(vp, _g.jk.lang.String:getLength(bp) + 1) end
		end
		do return nil end
	end
end

function jk.fs.File:getRelativePathOrBasename(baseFile, prefix)
	local v = self:getRelativePath(baseFile, prefix)
	if v ~= nil then
		do return v end
	end
	do return self:getBasename() end
end

function jk.fs.File:rename(newname, replace)
	do return self:move(_g.jk.fs.File:forRelativePath(newname, self:getParent(), false), replace) end
end

function jk.fs.File:writeFromReader(reader, doAppend)
	do self:onError(nil) end
	if not (reader ~= nil) then
		do return false end
	end
	do
		local buffer = _util:allocate_buffer(1024)
		if not (buffer ~= nil) then
			do return false end
		end
		do
			local writer = nil
			if doAppend then
				writer = self:append()
			else
				writer = self:write()
			end
			if not (writer ~= nil) then
				do return false end
			end
			do
				local v = true
				while true do
					local r = reader:read(buffer)
					if r < 1 then
						do break end
					end
					do
						local w = writer:write(buffer, r)
						if w < r then
							v = false
							do break end
						end
					end
				end
				do writer:close() end
				do return v end
			end
		end
	end
end

function jk.fs.File:createFifo()
	do self:onError("Not supported") end
	do return false end
end

function jk.fs.File:isExecutable()
	if _g.jk.os.OS:isWindows() then
		do return self:hasExtension("exe") or self:hasExtension("bat") or self:hasExtension("cmd") or self:hasExtension("com") end
	end
	do return self:stat():getExecutable() end
end

function jk.fs.File:exists()
	do self:onError(nil) end
	do
		local fi = self:stat()
		do return fi:getType() ~= _g.jk.fs.FileInfo.FILE_TYPE_UNKNOWN end
	end
end

function jk.fs.File:isIdentical(file)
	if not (file ~= nil) then
		do return false end
	end
	do
		local myrd = self:read()
		if not (myrd ~= nil) then
			do return false end
		end
		do
			local oord = file:read()
			if not (oord ~= nil) then
				do return false end
			end
			do
				local mybuf = _util:allocate_buffer(1024)
				if not (mybuf ~= nil) then
					do return false end
				end
				do
					local oobuf = _util:allocate_buffer(1024)
					if not (oobuf ~= nil) then
						do return false end
					end
					do
						local v = true
						while v do
							local myr = myrd:read(mybuf)
							local oor = oord:read(oobuf)
							if myr ~= oor then
								v = false
							else
								if myr < 1 then
									do break end
								end
								do
									local n = 0
									while n < myr do
										if mybuf[n + 1] ~= oobuf[n + 1] then
											v = false
										end
										do n = n + 1 end
									end
								end
							end
						end
						do myrd:close() end
						do oord:close() end
						do return v end
					end
				end
			end
		end
	end
end

jk.fs.File.ReadLineIterator = {}
jk.fs.File.ReadLineIterator.__index = jk.fs.File.ReadLineIterator
_vm:set_metatable(jk.fs.File.ReadLineIterator, {})

function jk.fs.File.ReadLineIterator._create()
	local v = _vm:set_metatable({}, jk.fs.File.ReadLineIterator)
	return v
end

function jk.fs.File.ReadLineIterator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.File.ReadLineIterator'
	self['_isType.jk.fs.File.ReadLineIterator'] = true
	self['_isType.jk.lang.Iterator'] = true
	self.reader = nil
end

function jk.fs.File.ReadLineIterator:_construct0()
	jk.fs.File.ReadLineIterator._init(self)
	return self
end

function jk.fs.File.ReadLineIterator:next()
	if not (self.reader ~= nil) then
		do return nil end
	end
	do
		local v = self.reader:readLine()
		if v == nil then
			do self.reader:close() end
			self.reader = nil
		end
		do return v end
	end
end

function jk.fs.File.ReadLineIterator:hasNext()
	if not (self.reader ~= nil) then
		do return false end
	end
	do return not self.reader:hasEnded() end
end

function jk.fs.File.ReadLineIterator:getReader()
	do return self.reader end
end

function jk.fs.File.ReadLineIterator:setReader(v)
	self.reader = v
	do return self end
end

function jk.fs.File:getLastErrorDescription()
	do return self.lastErrorDescription end
end

function jk.fs.File:onError(v)
	local pp = self:getPath()
	if not (v ~= nil) then
		self.lastErrorDescription = nil
	elseif pp ~= nil then
		self.lastErrorDescription = _g.jk.lang.String:safeString(pp) .. ": " .. _g.jk.lang.String:safeString(v)
	else
		self.lastErrorDescription = v
	end
end

function jk.fs.File:readLines()
	local rd = _g.jk.io.PrintReader:forReader(self:read())
	if not (rd ~= nil) then
		do return nil end
	end
	do return _g.jk.fs.File.ReadLineIterator._construct0(_g.jk.fs.File.ReadLineIterator._create()):setReader(rd) end
end

function jk.fs.File:readLinesVector()
	local it = self:readLines()
	if not (it ~= nil) then
		do return nil end
	end
	do
		local v = {}
		while true do
			local line = it:next()
			if not (line ~= nil) then
				do break end
			end
			do _g.jk.lang.Vector:append(v, line) end
		end
		do return v end
	end
end

function jk.fs.File:hasChangedSince(originalTimeStamp)
	local nts = self:getLastModifiedTimeStamp()
	if nts > originalTimeStamp then
		do return true end
	end
	do return false end
end

function jk.fs.File:getLastModifiedTimeStamp()
	if self:isFile() == false then
		do return 0 end
	end
	do
		local st = self:stat()
		if st == nil then
			do return 0 end
		end
		do return st:getModifyTime() end
	end
end

function jk.fs.File:compareModificationTime(bf)
	if bf == nil then
		do return 1 end
	end
	do
		local myts = self:getLastModifiedTimeStamp()
		local bfts = bf:getLastModifiedTimeStamp()
		if myts < bfts then
			do return -1 end
		end
		if myts > bfts then
			do return 1 end
		end
		do return 0 end
	end
end

function jk.fs.File:isNewerThan(bf)
	do return self:compareModificationTime(bf) > 0 end
end

function jk.fs.File:isOlderThan(bf)
	do return self:compareModificationTime(bf) < 0 end
end

function jk.fs.File:isSame(file)
	do self:onError(nil) end
	if not (file ~= nil) then
		do return false end
	end
	do
		local path = self:getPath()
		if path ~= nil and path == file:getPath() then
			do return true end
		end
		do return false end
	end
end

function jk.fs.File:removeRecursive()
	do self:onError(nil) end
	do
		local finfo = self:stat()
		if not (finfo ~= nil) then
			do return true end
		end
		if finfo:isDirectory() == false or finfo:isLink() == true then
			do return self:remove() end
		end
		do
			local it = self:entries()
			if not (it ~= nil) then
				do return false end
			end
			while it ~= nil do
				local f = it:next()
				if not (f ~= nil) then
					do break end
				end
				if not f:removeRecursive() then
					do self:onError(f:getLastErrorDescription()) end
					do return false end
				end
			end
			do return self:removeDirectory() end
		end
	end
end

function jk.fs.File:isFile()
	local st = self:stat()
	if not (st ~= nil) then
		do return false end
	end
	do return st:isFile() end
end

function jk.fs.File:isDirectory()
	local st = self:stat()
	if not (st ~= nil) then
		do return false end
	end
	do return st:isDirectory() end
end

function jk.fs.File:isLink()
	local st = self:stat()
	if not (st ~= nil) then
		do return false end
	end
	do return st:isLink() end
end

function jk.fs.File:getSize()
	local st = self:stat()
	if st == nil then
		do return 0 end
	end
	do return st:getSize() end
end

function jk.fs.File:setMode(mode)
	do self:onError("Not supported") end
	do return false end
end

function jk.fs.File:setOwnerUser(uid)
	do self:onError("Not supported") end
	do return false end
end

function jk.fs.File:setOwnerGroup(gid)
	do self:onError("Not supported") end
	do return false end
end

function jk.fs.File:withExtension(ext)
	if not (ext ~= nil) then
		do return self end
	end
	do
		local bn = self:getBasename()
		do return self:getSibling(_g.jk.lang.String:safeString(bn) .. "." .. _g.jk.lang.String:safeString(ext)) end
	end
end

function jk.fs.File:asExecutable()
	if _g.jk.os.OS:isWindows() then
		if self:hasExtension("exe") == false and self:hasExtension("bat") == false and self:hasExtension("cmd") == false and self:hasExtension("com") == false then
			local exe = self:withExtension("exe")
			if exe:isFile() then
				do return exe end
			end
			do
				local bat = self:withExtension("bat")
				if bat:isFile() then
					do return bat end
				end
				do
					local cmd = self:withExtension("cmd")
					if cmd:isFile() then
						do return cmd end
					end
					do
						local com = self:withExtension("com")
						if com:isFile() then
							do return com end
						end
						do return exe end
					end
				end
			end
		end
	end
	do return self end
end

function jk.fs.File:getParent()
	do self:onError(nil) end
	do
		local path = self:directoryName()
		if path == nil then
			do return _g.jk.fs.FileInvalid._construct0(_g.jk.fs.FileInvalid._create()) end
		end
		do return _g.jk.fs.File:forPath(path) end
	end
end

function jk.fs.File:getSibling(name)
	local pp = self:getParent()
	if not (pp ~= nil) then
		do return nil end
	end
	if name == nil then
		do return pp end
	end
	do return pp:entry(name) end
end

function jk.fs.File:hasExtension(ext)
	local xx = self:extension()
	if not (xx ~= nil) then
		do return false end
	end
	do return _g.jk.lang.String:equalsIgnoreCase(xx, ext) end
end

function jk.fs.File:extension()
	local bn = self:getBasename()
	if not (bn ~= nil) then
		do return nil end
	end
	do
		local dot = _g.jk.lang.String:getLastIndexOfCharacter(bn, 46, -1)
		if dot < 0 then
			do return nil end
		end
		do return _g.jk.lang.String:getEndOfString(bn, dot + 1) end
	end
end

function jk.fs.File:directoryName()
	local path = self:getPath()
	if not (path ~= nil) then
		do return nil end
	end
	do
		local delim = _g.jk.fs.PathInfo:getPathSeparator()
		local dp = _g.jk.lang.String:getLastIndexOfCharacter(path, delim, -1)
		if delim ~= 47 then
			local sdp = _g.jk.lang.String:getLastIndexOfCharacter(path, 47, -1)
			if sdp > dp then
				dp = sdp
			end
		end
		if dp < 0 then
			do return "." end
		end
		do return _g.jk.lang.String:getSubString(path, 0, dp) end
	end
end

function jk.fs.File:getBasename()
	local path = self:getPath()
	if not (path ~= nil) then
		do return nil end
	end
	do
		local delim = _g.jk.fs.PathInfo:getPathSeparator()
		if _g.jk.lang.String:endsWith(path, _g.jk.lang.String:forCharacter(delim)) then
			path = _g.jk.lang.String:getSubString(path, 0, _g.jk.lang.String:getLength(path) - 1)
		end
		if delim ~= 47 and _g.jk.lang.String:endsWith(path, "/") then
			path = _g.jk.lang.String:getSubString(path, 0, _g.jk.lang.String:getLength(path) - 1)
		end
		do
			local dp = _g.jk.lang.String:getLastIndexOfCharacter(path, delim, -1)
			if delim ~= 47 then
				local sdp = _g.jk.lang.String:getLastIndexOfCharacter(path, 47, -1)
				if sdp > dp then
					dp = sdp
				end
			end
			if dp < 0 then
				do return path end
			end
			do return _g.jk.lang.String:getEndOfString(path, dp + 1) end
		end
	end
end

function jk.fs.File:getBasenameWithoutExtension()
	local bn = self:getBasename()
	if not (bn ~= nil) then
		do return nil end
	end
	do
		local dot = _g.jk.lang.String:getLastIndexOfCharacter(bn, 46, -1)
		if dot < 0 then
			do return bn end
		end
		do return _g.jk.lang.String:getSubString(bn, 0, dot) end
	end
end

function jk.fs.File:baseName()
	do return self:getBasename() end
end

function jk.fs.File:baseNameWithoutExtension()
	do return self:getBasenameWithoutExtension() end
end

function jk.fs.File:copyFileTo(dest)
	do self:onError(nil) end
	if not (dest ~= nil) then
		do return false end
	end
	if self:isSame(dest) then
		do return true end
	end
	do
		local buf = _util:allocate_buffer(4096 * 4)
		if not (buf ~= nil) then
			do return false end
		end
		do
			local reader = self:read()
			if not (reader ~= nil) then
				do return false end
			end
			do
				local writer = dest:write()
				if not (writer ~= nil) then
					if (_vm:to_table_with_key(reader, '_isType.jk.lang.Closable') ~= nil) then
						do reader:close() end
					end
					do self:onError(dest:getLastErrorDescription()) end
					do return false end
				end
				do
					local v = true
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
					if v then
						local fi = self:stat()
						if fi ~= nil then
							local mode = fi:getMode()
							if mode ~= 0 then
								do dest:setMode(mode) end
							end
						end
					else
						do dest:remove() end
					end
					if reader ~= nil and (_vm:to_table_with_key(reader, '_isType.jk.lang.Closable') ~= nil) then
						do reader:close() end
					end
					if writer ~= nil and (_vm:to_table_with_key(writer, '_isType.jk.lang.Closable') ~= nil) then
						do writer:close() end
					end
					do return v end
				end
			end
		end
	end
end

function jk.fs.File:copyFileOrDirectoryTo(dest)
	if not (dest ~= nil) then
		do return false end
	end
	if self:isFile() then
		do return self:copyFileTo(dest) end
	end
	if not self:isDirectory() then
		do return false end
	end
	if not dest:createDirectoryRecursive() then
		do return false end
	end
	do
		local it = self:entries()
		if not (it ~= nil) then
			do return false end
		end
		while true do
			local nsrc = it:next()
			if not (nsrc ~= nil) then
				do break end
			end
			do
				local ndest = dest:entry(nsrc:getBasename())
				if not nsrc:copyFileOrDirectoryTo(ndest) then
					do return false end
				end
			end
		end
		do return true end
	end
end

function jk.fs.File:setContentsString(str, encoding)
	if _g.jk.lang.String:isEmpty(encoding) then
		do return false end
	end
	do return self:setContentsBuffer(_g.jk.lang.String:toBuffer(str, encoding)) end
end

function jk.fs.File:setContentsUTF8(str)
	do return self:setContentsBuffer(_g.jk.lang.String:toUTF8Buffer(str)) end
end

function jk.fs.File:setContentsBuffer(buffer)
	do self:onError(nil) end
	if not (buffer ~= nil) then
		do return false end
	end
	do
		local writer = self:write()
		if not (writer ~= nil) then
			do return false end
		end
		if writer:write(buffer, #buffer) < 0 then
			do return false end
		end
		do writer:close() end
		do return true end
	end
end

function jk.fs.File:getContentsString(encoding)
	if _g.jk.lang.String:isEmpty(encoding) then
		do return nil end
	end
	do
		local b = self:getContentsBuffer()
		if not (b ~= nil) then
			if self:isFile() and self:getSize() == 0 then
				do return "" end
			end
			do return nil end
		end
		do return _g.jk.lang.String:forBuffer(b, encoding) end
	end
end

function jk.fs.File:getContentsUTF8()
	local b = self:getContentsBuffer()
	if not (b ~= nil) then
		if self:isFile() and self:getSize() == 0 then
			do return "" end
		end
		do return nil end
	end
	do return _g.jk.lang.String:forUTF8Buffer(b) end
end

function jk.fs.File:getContentsBuffer()
	do self:onError(nil) end
	do
		local reader = self:read()
		if not (reader ~= nil) then
			do return nil end
		end
		do
			local sz = reader:getSize()
			if sz < 1 then
				do reader:close() end
				do return nil end
			end
			do
				local b = _util:allocate_buffer(sz)
				local rsz = reader:read(b)
				do reader:close() end
				if rsz < sz then
					do return nil end
				end
				do return b end
			end
		end
	end
end

function jk.fs.File:toString()
	do return self:getPath() end
end

jk.fs.FileInvalid = _g.jk.fs.File._create()
jk.fs.FileInvalid.__index = jk.fs.FileInvalid
_vm:set_metatable(jk.fs.FileInvalid, {
	__index = _g.jk.fs.File
})

function jk.fs.FileInvalid._create()
	local v = _vm:set_metatable({}, jk.fs.FileInvalid)
	return v
end

function jk.fs.FileInvalid:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.FileInvalid'
	self['_isType.jk.fs.FileInvalid'] = true
end

function jk.fs.FileInvalid:_construct0()
	jk.fs.FileInvalid._init(self)
	do _g.jk.fs.File._construct0(self) end
	return self
end

function jk.fs.FileInvalid:entry(name)
	do return _g.jk.fs.FileInvalid._construct0(_g.jk.fs.FileInvalid._create()) end
end

function jk.fs.FileInvalid:makeExecutable()
	do return false end
end

function jk.fs.FileInvalid:move(dest, replace)
	do return false end
end

function jk.fs.FileInvalid:touch()
	do return false end
end

function jk.fs.FileInvalid:read()
	do return nil end
end

function jk.fs.FileInvalid:write()
	do return nil end
end

function jk.fs.FileInvalid:append()
	do return nil end
end

function jk.fs.FileInvalid:stat()
	do return nil end
end

function jk.fs.FileInvalid:exists()
	do return false end
end

function jk.fs.FileInvalid:isExecutable()
	do return false end
end

function jk.fs.FileInvalid:createFifo()
	do return false end
end

function jk.fs.FileInvalid:createDirectory()
	do return false end
end

function jk.fs.FileInvalid:createDirectoryRecursive()
	do return false end
end

function jk.fs.FileInvalid:removeDirectory()
	do return false end
end

function jk.fs.FileInvalid:getPath()
	do return nil end
end

function jk.fs.FileInvalid:isSame(file)
	do return false end
end

function jk.fs.FileInvalid:remove()
	do return false end
end

function jk.fs.FileInvalid:removeRecursive()
	do return false end
end

function jk.fs.FileInvalid:getBasename()
	do return nil end
end

function jk.fs.FileInvalid:isIdentical(file)
	do return false end
end

function jk.fs.FileInvalid:getContentsBuffer()
	do return nil end
end

function jk.fs.FileInvalid:getContentsString(encoding)
	do return nil end
end

function jk.fs.FileInvalid:setContentsBuffer(buffer)
	do return false end
end

function jk.fs.FileInvalid:setContentsString(str, encoding)
	do return false end
end

function jk.fs.FileInvalid:entries()
	do return nil end
end

jk.fs.FileReader = {}

jk.fs.FileInfo = {}
jk.fs.FileInfo.__index = jk.fs.FileInfo
_vm:set_metatable(jk.fs.FileInfo, {})

jk.fs.FileInfo.FILE_TYPE_UNKNOWN = 0
jk.fs.FileInfo.FILE_TYPE_FILE = 1
jk.fs.FileInfo.FILE_TYPE_DIR = 2

function jk.fs.FileInfo._create()
	local v = _vm:set_metatable({}, jk.fs.FileInfo)
	return v
end

function jk.fs.FileInfo:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.FileInfo'
	self['_isType.jk.fs.FileInfo'] = true
	self.file = nil
	self.size = 0
	self.createTime = 0
	self.accessTime = 0
	self.modifyTime = 0
	self.ownerUser = 0
	self.ownerGroup = 0
	self.mode = 0
	self.executable = false
	self.type = 0
	self.link = false
end

function jk.fs.FileInfo:_construct0()
	jk.fs.FileInfo._init(self)
	return self
end

function jk.fs.FileInfo:forFile(file)
	if file == nil then
		do return _g.jk.fs.FileInfo._construct0(_g.jk.fs.FileInfo._create()) end
	end
	do return file:stat() end
end

function jk.fs.FileInfo:setFile(v)
	self.file = v
end

function jk.fs.FileInfo:setSize(v)
	self.size = v
end

function jk.fs.FileInfo:setCreateTime(v)
	self.createTime = v
end

function jk.fs.FileInfo:setAccessTime(v)
	self.accessTime = v
end

function jk.fs.FileInfo:setModifyTime(v)
	self.modifyTime = v
end

function jk.fs.FileInfo:setOwnerUser(v)
	self.ownerUser = v
end

function jk.fs.FileInfo:setOwnerGroup(v)
	self.ownerGroup = v
end

function jk.fs.FileInfo:setMode(v)
	self.mode = v
end

function jk.fs.FileInfo:setExecutable(v)
	self.executable = v
end

function jk.fs.FileInfo:setType(v)
	self.type = v
end

function jk.fs.FileInfo:setLink(v)
	self.link = v
end

function jk.fs.FileInfo:getFile()
	do return self.file end
end

function jk.fs.FileInfo:getSize()
	do return self.size end
end

function jk.fs.FileInfo:getCreateTime()
	do return self.createTime end
end

function jk.fs.FileInfo:getCreateTimeUTC()
	do return self.createTime + _g.jk.time.SystemClock:getTimezoneOffsetAsSeconds() end
end

function jk.fs.FileInfo:getAccessTime()
	do return self.accessTime end
end

function jk.fs.FileInfo:getAccessTimeUTC()
	do return self.accessTime + _g.jk.time.SystemClock:getTimezoneOffsetAsSeconds() end
end

function jk.fs.FileInfo:getModifyTime()
	do return self.modifyTime end
end

function jk.fs.FileInfo:getModifyTimeUTC()
	do return self.modifyTime + _g.jk.time.SystemClock:getTimezoneOffsetAsSeconds() end
end

function jk.fs.FileInfo:getOwnerUser()
	do return self.ownerUser end
end

function jk.fs.FileInfo:getOwnerGroup()
	do return self.ownerGroup end
end

function jk.fs.FileInfo:getMode()
	do return self.mode end
end

function jk.fs.FileInfo:getExecutable()
	do return self.executable end
end

function jk.fs.FileInfo:getType()
	do return self.type end
end

function jk.fs.FileInfo:getLink()
	do return self.link end
end

function jk.fs.FileInfo:isFile()
	if self.type == _g.jk.fs.FileInfo.FILE_TYPE_FILE then
		do return true end
	end
	do return false end
end

function jk.fs.FileInfo:isLink()
	do return self.link end
end

function jk.fs.FileInfo:isDirectory()
	if self.type == _g.jk.fs.FileInfo.FILE_TYPE_DIR then
		do return true end
	end
	do return false end
end

function jk.fs.FileInfo:exists()
	do return self:isFile() or self:isDirectory() or self:isLink() end
end

jk.fs.FileForSushi = _g.jk.fs.File._create()
jk.fs.FileForSushi.__index = jk.fs.FileForSushi
_vm:set_metatable(jk.fs.FileForSushi, {
	__index = _g.jk.fs.File
})

function jk.fs.FileForSushi._create()
	local v = _vm:set_metatable({}, jk.fs.FileForSushi)
	return v
end

function jk.fs.FileForSushi:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.FileForSushi'
	self['_isType.jk.fs.FileForSushi'] = true
	self.path = nil
end

function jk.fs.FileForSushi:_construct0()
	jk.fs.FileForSushi._init(self)
	do _g.jk.fs.File._construct0(self) end
	return self
end

jk.fs.FileForSushi.MyFileReader = {}
jk.fs.FileForSushi.MyFileReader.__index = jk.fs.FileForSushi.MyFileReader
_vm:set_metatable(jk.fs.FileForSushi.MyFileReader, {})

function jk.fs.FileForSushi.MyFileReader._create()
	local v = _vm:set_metatable({}, jk.fs.FileForSushi.MyFileReader)
	return v
end

function jk.fs.FileForSushi.MyFileReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.FileForSushi.MyFileReader'
	self['_isType.jk.fs.FileForSushi.MyFileReader'] = true
	self['_isType.jk.fs.FileReader'] = true
	self['_isType.jk.io.SizedReader'] = true
	self['_isType.jk.io.Reader'] = true
	self['_isType.jk.lang.Closable'] = true
	self['_isType.jk.io.SeekableReader'] = true
	self.handle = -1
	self.file = nil
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

function jk.fs.FileForSushi.MyFileReader:_construct0()
	jk.fs.FileForSushi.MyFileReader._init(self)
	return self
end

function jk.fs.FileForSushi.MyFileReader:_destruct()
	do self:close() end
end

function jk.fs.FileForSushi.MyFileReader:read(buffer)
	local v = -1
	local handle = self.handle
	if handle >= 0 then
		do v = _io:read_from_handle(handle, buffer) end
	end
	do return v end
end

function jk.fs.FileForSushi.MyFileReader:getSize()
	local v = -1
	local handle = self.handle
	if handle >= 0 then
		do v = _io:get_size_for_handle(handle) end
	end
	do return v end
end

function jk.fs.FileForSushi.MyFileReader:close()
	local handle = self.handle
	if handle >= 0 then
		do _io:close_handle(handle) end
		self.handle = -1
	end
end

function jk.fs.FileForSushi.MyFileReader:setCurrentPosition(n)
	local handle = self.handle
	if handle < 0 then
		do return false end
	end
	if _io:set_current_position(handle, n) < 0 then
		do return false end
	end
	do return true end
end

function jk.fs.FileForSushi.MyFileReader:getCurrentPosition()
	local handle = self.handle
	if handle < 0 then
		do return 0 end
	end
	do return _io:get_current_position(handle) end
end

function jk.fs.FileForSushi.MyFileReader:getHandle()
	do return self.handle end
end

function jk.fs.FileForSushi.MyFileReader:setHandle(v)
	self.handle = v
	do return self end
end

function jk.fs.FileForSushi.MyFileReader:getFile()
	do return self.file end
end

function jk.fs.FileForSushi.MyFileReader:setFile(v)
	self.file = v
	do return self end
end

jk.fs.FileForSushi.MyFileWriter = {}
jk.fs.FileForSushi.MyFileWriter.__index = jk.fs.FileForSushi.MyFileWriter
_vm:set_metatable(jk.fs.FileForSushi.MyFileWriter, {})

function jk.fs.FileForSushi.MyFileWriter._create()
	local v = _vm:set_metatable({}, jk.fs.FileForSushi.MyFileWriter)
	return v
end

function jk.fs.FileForSushi.MyFileWriter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.FileForSushi.MyFileWriter'
	self['_isType.jk.fs.FileForSushi.MyFileWriter'] = true
	self['_isType.jk.fs.FileWriter'] = true
	self['_isType.jk.io.Writer'] = true
	self['_isType.jk.lang.Closable'] = true
	self['_isType.jk.io.SeekableWriter'] = true
	self.handle = -1
	self.file = nil
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

function jk.fs.FileForSushi.MyFileWriter:_construct0()
	jk.fs.FileForSushi.MyFileWriter._init(self)
	return self
end

function jk.fs.FileForSushi.MyFileWriter:_destruct()
	do self:close() end
end

function jk.fs.FileForSushi.MyFileWriter:write(buf, size)
	local v = -1
	local handle = self.handle
	if handle >= 0 then
		do v = _io:write_to_handle(handle, buf, size) end
	end
	do return v end
end

function jk.fs.FileForSushi.MyFileWriter:close()
	local handle = self.handle
	if handle >= 0 then
		do _io:close_handle(handle) end
		self.handle = -1
	end
end

function jk.fs.FileForSushi.MyFileWriter:setCurrentPosition(n)
	local handle = self.handle
	if handle < 0 then
		do return false end
	end
	if _io:set_current_position(handle, n) < 0 then
		do return false end
	end
	do return true end
end

function jk.fs.FileForSushi.MyFileWriter:getCurrentPosition()
	local handle = self.handle
	if handle < 0 then
		do return 0 end
	end
	do return _io:get_current_position(handle) end
end

function jk.fs.FileForSushi.MyFileWriter:getHandle()
	do return self.handle end
end

function jk.fs.FileForSushi.MyFileWriter:setHandle(v)
	self.handle = v
	do return self end
end

function jk.fs.FileForSushi.MyFileWriter:getFile()
	do return self.file end
end

function jk.fs.FileForSushi.MyFileWriter:setFile(v)
	self.file = v
	do return self end
end

function jk.fs.FileForSushi:forPath(path)
	local v = _g.jk.fs.FileForSushi._construct0(_g.jk.fs.FileForSushi._create())
	do v:setPath(path, true) end
	do return v end
end

function jk.fs.FileForSushi:forRawPath(path)
	local v = _g.jk.fs.FileForSushi._construct0(_g.jk.fs.FileForSushi._create())
	do v:setPath(path, false) end
	do return v end
end

function jk.fs.FileForSushi:entry(name)
	local pp = self.path
	if _g.jk.lang.String:isNotEmpty(name) then
		if pp ~= nil then
			pp = _g.jk.lang.String:safeString(pp) .. "/" .. _g.jk.lang.String:safeString(name)
		else
			pp = name
		end
	end
	do return _g.jk.fs.FileForSushi:forPath(pp) end
end

function jk.fs.FileForSushi:rawEntry(name)
	local pp = self.path
	if _g.jk.lang.String:isNotEmpty(name) then
		if pp ~= nil then
			pp = _g.jk.lang.String:safeString(pp) .. "/" .. _g.jk.lang.String:safeString(name)
		else
			pp = name
		end
	end
	do return _g.jk.fs.FileForSushi:forRawPath(pp) end
end

function jk.fs.FileForSushi:move(dest, replace)
	local dthis = _vm:to_table_with_key(dest, '_isType.jk.fs.FileForSushi')
	if not (dthis ~= nil) then
		do return false end
	end
	do
		local opath = self.path
		local npath = dthis:getPath()
		if not _g.jk.lang.String:isNotEmpty(opath) then
			do return false end
		end
		if not _g.jk.lang.String:isNotEmpty(npath) then
			do return false end
		end
		if replace then
			do dthis:removeRecursive() end
		elseif dthis:exists() then
			do return false end
		end
		do
			local r = _io:rename_path(opath, npath)
			if r ~= 1 then
				do return false end
			end
			do return true end
		end
	end
end

function jk.fs.FileForSushi:touch()
	local path = self.path
	local r = _io:touch_file(path)
	if r == 1 then
		do return true end
	end
	do return false end
end

function jk.fs.FileForSushi:read()
	local handle = 0
	local path = self.path
	do handle = _io:open_file_for_reading(path) end
	if not (handle >= 0) then
		do return nil end
	end
	do
		local v = _g.jk.fs.FileForSushi.MyFileReader._construct0(_g.jk.fs.FileForSushi.MyFileReader._create())
		do v:setFile(self) end
		do v:setHandle(handle) end
		do return v end
	end
end

function jk.fs.FileForSushi:write()
	local handle = 0
	local path = self.path
	do handle = _io:open_file_for_writing(path) end
	if not (handle >= 0) then
		do return nil end
	end
	do
		local v = _g.jk.fs.FileForSushi.MyFileWriter._construct0(_g.jk.fs.FileForSushi.MyFileWriter._create())
		do v:setFile(self) end
		do v:setHandle(handle) end
		do return v end
	end
end

function jk.fs.FileForSushi:append()
	local handle = 0
	local path = self.path
	do handle = _io:open_file_for_appending(path) end
	if not (handle >= 0) then
		do return nil end
	end
	do
		local v = _g.jk.fs.FileForSushi.MyFileWriter._construct0(_g.jk.fs.FileForSushi.MyFileWriter._create())
		do v:setFile(self) end
		do v:setHandle(handle) end
		do return v end
	end
end

function jk.fs.FileForSushi:stat()
	local path = self.path
	local valid = true
	local size = 0
	local ctim = 0
	local atim = 0
	local mtim = 0
	local uid = 0
	local gid = 0
	local mode = 0
	do size, ctim, atim, mtim, uid, gid, mode = _io:get_file_info(path) if size == nil then valid = false end end
	do
		local v = _g.jk.fs.FileInfo._construct0(_g.jk.fs.FileInfo._create())
		do v:setFile(self) end
		if not valid then
			do v:setType(_g.jk.fs.FileInfo.FILE_TYPE_UNKNOWN) end
			do return v end
		end
		do v:setSize(size) end
		do v:setCreateTime(ctim) end
		do v:setAccessTime(ctim) end
		do v:setModifyTime(mtim) end
		do v:setOwnerUser(uid) end
		do v:setOwnerGroup(gid) end
		do v:setMode(_vm:bitwise_and(mode, 511)) end
		if _vm:bitwise_and(mode, 32768) ~= 0 then
			do v:setType(_g.jk.fs.FileInfo.FILE_TYPE_FILE) end
		elseif _vm:bitwise_and(mode, 16384) ~= 0 then
			do v:setType(_g.jk.fs.FileInfo.FILE_TYPE_DIR) end
		else
			do v:setType(_g.jk.fs.FileInfo.FILE_TYPE_UNKNOWN) end
		end
		if _vm:bitwise_and(mode, 40960) ~= 0 then
			do v:setLink(true) end
		end
		if _vm:bitwise_and(mode, 64) ~= 0 or _vm:bitwise_and(mode, 8) ~= 0 or _vm:bitwise_and(mode, 1) ~= 0 then
			do v:setExecutable(true) end
		end
		do return v end
	end
end

function jk.fs.FileForSushi:createDirectory()
	local path = self.path
	local r = _io:create_directory(path)
	if r == 1 then
		do return true end
	end
	do return false end
end

function jk.fs.FileForSushi:createDirectoryRecursive()
	if self:isDirectory() then
		do return true end
	end
	do
		local parent = self:getParent()
		if parent ~= nil then
			if not parent:createDirectoryRecursive() then
				do return false end
			end
		end
		do return self:createDirectory() end
	end
end

function jk.fs.FileForSushi:removeDirectory()
	local path = self.path
	local r = _io:remove_directory(path)
	if r == 1 then
		do return true end
	end
	do return false end
end

function jk.fs.FileForSushi:normalizePath(apath)
	local path = apath
	if not (path ~= nil) then
		do return nil end
	end
	if _g.jk.os.OS:isWindows() then
		path = _g.jk.lang.String:replaceCharacter(path, 92, 47)
	end
	do
		local v = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local comps = _g.jk.lang.String:split(path, 47, 0)
		if comps ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(comps)
			do
				n = 0
				while n < m do
					local comp = comps[n + 1]
					if comp ~= nil then
						if _g.jk.lang.String:isEmpty(comp) then
						elseif comp == "." then
						elseif comp == ".." then
							local str = v:toString()
							do v:clear() end
							if str ~= nil then
								local slash = _g.jk.lang.String:getLastIndexOfCharacter(str, 47, -1)
								if slash > 0 then
									do v:appendString(_g.jk.lang.String:getSubString(str, 0, slash)) end
								end
							end
						else
							if v:count() > 0 then
								do v:appendCharacter(47) end
							end
							do v:appendString(comp) end
						end
					end
					do n = n + 1 end
				end
			end
		end
		if _g.jk.lang.String:startsWith(path, "/", 0) then
			do return "/" .. _g.jk.lang.String:safeString(v:toString()) end
		end
		do return v:toString() end
	end
end

function jk.fs.FileForSushi:setPath(v, useRealPath)
	if _g.jk.lang.String:isEmpty(v) then
		self.path = nil
		do return end
	end
	if _g.jk.os.OS:isWindows() then
		local l = _g.jk.lang.String:getLength(v)
		local c1 = _g.jk.lang.String:getChar(v, 1)
		if l == 2 and c1 == 58 then
			self.path = _g.jk.lang.String:safeString(v) .. "/"
			do return end
		end
		do
			local c2 = _g.jk.lang.String:getChar(v, 2)
			if l == 3 and c1 == 58 and (c2 == 92 or c2 == 47) then
				local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				do sb:appendCharacter(_g.jk.lang.String:getChar(v, 0)) end
				do sb:appendCharacter(58) end
				do sb:appendCharacter(47) end
				self.path = sb:toString()
				do return end
			end
		end
	end
	if useRealPath then
		local realpath = nil
		do realpath = _io:get_real_path(v) end
		if _g.jk.lang.String:isNotEmpty(realpath) then
			self.path = realpath
			if _g.jk.os.OS:isWindows() then
				self.path = _g.jk.lang.String:replaceCharacter(self.path, 92, 47)
			end
			do return end
		end
	end
	if _g.jk.fs.PathInfo:isAbsolutePath(v) then
		self.path = self:normalizePath(v)
	else
		self.path = self:normalizePath(_g.jk.lang.String:safeString(_io:get_current_directory()) .. "/" .. _g.jk.lang.String:safeString(v))
	end
end

function jk.fs.FileForSushi:getPath()
	do return self.path end
end

function jk.fs.FileForSushi:remove()
	local path = self.path
	if _io:remove_file(path) == 1 then
		do return true end
	end
	do return false end
end

function jk.fs.FileForSushi:makeExecutable()
	local path = self.path
	local mode = _vm:bitwise_or(_vm:bitwise_or(_vm:bitwise_or(_vm:bitwise_or(_vm:bitwise_or(_vm:bitwise_or(1, 4), 8), 32), 64), 128), 256)
	do return _io:set_file_mode(path, mode ) end
end

function jk.fs.FileForSushi:setMode(mode)
	local path = self.path
	do return _io:set_file_mode(path, mode ) end
end

jk.fs.FileForSushi.MyDirectoryIterator = {}
jk.fs.FileForSushi.MyDirectoryIterator.__index = jk.fs.FileForSushi.MyDirectoryIterator
_vm:set_metatable(jk.fs.FileForSushi.MyDirectoryIterator, {})

function jk.fs.FileForSushi.MyDirectoryIterator._create()
	local v = _vm:set_metatable({}, jk.fs.FileForSushi.MyDirectoryIterator)
	return v
end

function jk.fs.FileForSushi.MyDirectoryIterator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.FileForSushi.MyDirectoryIterator'
	self['_isType.jk.fs.FileForSushi.MyDirectoryIterator'] = true
	self['_isType.jk.lang.Iterator'] = true
	self['_isType.jk.lang.Closable'] = true
	self.parent = nil
	self.handle = nil
	self.current = nil
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

function jk.fs.FileForSushi.MyDirectoryIterator:_construct0()
	jk.fs.FileForSushi.MyDirectoryIterator._init(self)
	return self
end

function jk.fs.FileForSushi.MyDirectoryIterator:_destruct()
	do self:close() end
end

function jk.fs.FileForSushi.MyDirectoryIterator:close()
	local handle = self.handle
	if handle ~= nil then
		do _io:close_directory(handle) end
		self.handle = nil
	end
end

function jk.fs.FileForSushi.MyDirectoryIterator:doNext()
	local handle = self.handle
	if not (handle ~= nil) then
		do return nil end
	end
	do
		local name = _io:read_directory(handle)
		if not (name ~= nil) then
			do self:close() end
			do return nil end
		end
		do return _g.jk.fs.File:forRelativePath(name, self.parent, false) end
	end
end

function jk.fs.FileForSushi.MyDirectoryIterator:next()
	if self.current ~= nil then
		local vv = self.current
		self.current = nil
		do return vv end
	end
	do return self:doNext() end
end

function jk.fs.FileForSushi.MyDirectoryIterator:hasNext()
	if self.current ~= nil then
		do return true end
	end
	do
		local v = self:doNext()
		if v ~= nil then
			self.current = v
			do return true end
		end
		do return false end
	end
end

function jk.fs.FileForSushi.MyDirectoryIterator:getParent()
	do return self.parent end
end

function jk.fs.FileForSushi.MyDirectoryIterator:setParent(v)
	self.parent = v
	do return self end
end

function jk.fs.FileForSushi.MyDirectoryIterator:getHandle()
	do return self.handle end
end

function jk.fs.FileForSushi.MyDirectoryIterator:setHandle(v)
	self.handle = v
	do return self end
end

function jk.fs.FileForSushi:entries()
	local pp = self.path
	if not _g.jk.lang.String:isNotEmpty(pp) then
		do return nil end
	end
	do
		local handle = _io:open_directory(pp)
		if not (handle ~= nil) then
			do return nil end
		end
		do
			local v = _g.jk.fs.FileForSushi.MyDirectoryIterator._construct0(_g.jk.fs.FileForSushi.MyDirectoryIterator._create())
			do v:setParent(self) end
			do v:setHandle(handle) end
			do return v end
		end
	end
end

jk.fs.CurrentDirectory = {}
jk.fs.CurrentDirectory.__index = jk.fs.CurrentDirectory
_vm:set_metatable(jk.fs.CurrentDirectory, {})

function jk.fs.CurrentDirectory._create()
	local v = _vm:set_metatable({}, jk.fs.CurrentDirectory)
	return v
end

function jk.fs.CurrentDirectory:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.fs.CurrentDirectory'
	self['_isType.jk.fs.CurrentDirectory'] = true
end

function jk.fs.CurrentDirectory:_construct0()
	jk.fs.CurrentDirectory._init(self)
	return self
end

function jk.fs.CurrentDirectory:set(dir)
	if not (dir ~= nil) then
		do return end
	end
	do _io:set_current_directory(dir:getPath()) end
end

function jk.fs.CurrentDirectory:get()
	do return _g.jk.fs.File:forPath(_io:get_current_directory()) end
end
