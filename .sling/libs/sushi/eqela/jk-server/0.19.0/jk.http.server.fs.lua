jk = jk or {}

jk.http = jk.http or {}

jk.http.server = jk.http.server or {}

jk.http.server.fs = jk.http.server.fs or {}

jk.http.server.fs.HTTPServerDirectoryHandler = _g.jk.http.server.HTTPServerRequestHandlerAdapter._create()
jk.http.server.fs.HTTPServerDirectoryHandler.__index = jk.http.server.fs.HTTPServerDirectoryHandler
_vm:set_metatable(jk.http.server.fs.HTTPServerDirectoryHandler, {
	__index = _g.jk.http.server.HTTPServerRequestHandlerAdapter
})

function jk.http.server.fs.HTTPServerDirectoryHandler._create()
	local v = _vm:set_metatable({}, jk.http.server.fs.HTTPServerDirectoryHandler)
	return v
end

function jk.http.server.fs.HTTPServerDirectoryHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.fs.HTTPServerDirectoryHandler'
	self['_isType.jk.http.server.fs.HTTPServerDirectoryHandler'] = true
	self.listDirectories = false
	self.processTemplateFiles = false
	self.directory = nil
	self.maxAge = 300
	self.serverURL = nil
	self.indexFiles = nil
	self.templateIncludeDirs = nil
	self.serverName = nil
	self.templateData = nil
end

function jk.http.server.fs.HTTPServerDirectoryHandler:_construct0()
	jk.http.server.fs.HTTPServerDirectoryHandler._init(self)
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter._construct0(self) end
	return self
end

function jk.http.server.fs.HTTPServerDirectoryHandler:forDirectory(dir)
	local v = _g.jk.http.server.fs.HTTPServerDirectoryHandler._construct0(_g.jk.http.server.fs.HTTPServerDirectoryHandler._create())
	do v:setDirectory(dir) end
	do return v end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:addTemplateIncludeDir(dir)
	if dir == nil then
		do return end
	end
	if self.templateIncludeDirs == nil then
		self.templateIncludeDirs = {}
	end
	do _g.jk.lang.Vector:append(self.templateIncludeDirs, dir) end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:setIndexFiles(files)
	self.indexFiles = {}
	if files ~= nil then
		local n = 0
		local m = #files
		do
			n = 0
			while n < m do
				local file = (function(o)
					if (_vm:get_variable_type(o) == 'string') then
						do return o end
					end
					do return nil end
				end)(files[n + 1])
				if file ~= nil then
					do _g.jk.lang.Vector:append(self.indexFiles, file) end
				end
				do n = n + 1 end
			end
		end
	end
	do return self end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:setServerName(name)
	self.serverName = name
	do return self end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getServerName()
	if self.serverName ~= nil then
		do return self.serverName end
	end
	do
		local server = self:getServer()
		if not (server ~= nil) then
			do return nil end
		end
		do return server:getServerName() end
	end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getDirectoryEntries(dir, allEntries, dirs, files)
	if not (dir ~= nil) then
		do return end
	end
	do
		local entries = dir:entries()
		while entries ~= nil do
			local entry = entries:next()
			if entry == nil then
				do break end
			end
			do
				local name = entry:getBasename()
				if dirs ~= nil and entry:isDirectory() then
					do _g.jk.lang.Vector:append(dirs, name) end
				end
				if files ~= nil and entry:isFile() then
					do _g.jk.lang.Vector:append(files, name) end
				end
				if allEntries ~= nil then
					do _g.jk.lang.Vector:append(allEntries, name) end
				end
			end
		end
	end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:dirToJSONObject(dir)
	local allEntries = {}
	local dirs = {}
	local files = {}
	do self:getDirectoryEntries(dir, allEntries, dirs, files) end
	do
		local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do v:setObject("files", _g.jk.lang.DynamicVector:forStringVector(files)) end
		do v:setObject("dirs", _g.jk.lang.DynamicVector:forStringVector(dirs)) end
		do v:setObject("all", _g.jk.lang.DynamicVector:forStringVector(allEntries)) end
		do return v end
	end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:dirToJSON(dir)
	do return _g.jk.json.JSONEncoder:encode(self:dirToJSONObject(dir), true, false) end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getTemplateVariablesForFile(file)
	do return nil end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:dirToHTML(dir)
	if not (dir ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString("<html>\n") end
		do sb:appendString("<head>\n") end
		do sb:appendString("<title>") end
		do sb:appendString(dir:getBasename()) end
		do sb:appendString("</title>\n") end
		do sb:appendString("<style>\n") end
		do sb:appendString("* { font-face: arial; font-size: 12px; }\n") end
		do sb:appendString("h1 { font-face: arial; font-size: 14px; font-style: bold; border-bottom: solid 1px black; padding: 4px; margin: 4px}\n") end
		do sb:appendString("#content a { text-decoration: none; color: #000080; }\n") end
		do sb:appendString("#content a:hover { text-decoration: none; color: #FFFFFF; font-weight: bold; }\n") end
		do sb:appendString(".entry { padding: 4px; }\n") end
		do sb:appendString(".entry:hover { background-color: #AAAACC; }\n") end
		do sb:appendString(".dir { font-weight: bold; }\n") end
		do sb:appendString(".even { background-color: #DDDDDD; }\n") end
		do sb:appendString(".odd { background-color: #EEEEEE; }\n") end
		do sb:appendString("#footer { border-top: 1px solid black; padding: 4px; margin: 4px; font-size: 10px; text-align: right; }\n") end
		do sb:appendString("#footer a { font-size: 10px; text-decoration: none; color: #000000; }\n") end
		do sb:appendString("#footer a:hover { font-size: 10px; text-decoration: underline; color: #000000; }\n") end
		do sb:appendString("</style>\n") end
		do sb:appendString("<meta name=\"viewport\" content=\"initial-scale=1,maximum-scale=1\" />\n") end
		do sb:appendString("</head>\n") end
		do sb:appendString("<body>\n") end
		do sb:appendString("<h1>") end
		do sb:appendString(dir:getBasename()) end
		do sb:appendString("</h1>\n") end
		do sb:appendString("<div id=\"content\">\n") end
		do
			local dirs = {}
			local files = {}
			do self:getDirectoryEntries(dir, nil, dirs, files) end
			do
				local n = 0
				if dirs ~= nil then
					local n2 = 0
					local m = _g.jk.lang.Vector:getSize(dirs)
					do
						n2 = 0
						while n2 < m do
							local dn = dirs[n2 + 1]
							if dn ~= nil then
								local cc = nil
								if _util:convert_to_integer(n % 2) == 0 then
									cc = "even"
								else
									cc = "odd"
								end
								do sb:appendString("<a href=\"") end
								do sb:appendString(dn) end
								do sb:appendString("/\"><div class=\"entry dir ") end
								do sb:appendString(cc) end
								do sb:appendString("\">") end
								do sb:appendString(dn) end
								do sb:appendString("/</div></a>\n") end
								do n = n + 1 end
							end
							do n2 = n2 + 1 end
						end
					end
				end
				if files ~= nil then
					local n3 = 0
					local m2 = _g.jk.lang.Vector:getSize(files)
					do
						n3 = 0
						while n3 < m2 do
							local fn = files[n3 + 1]
							if fn ~= nil then
								local cc = nil
								if _util:convert_to_integer(n % 2) == 0 then
									cc = "even"
								else
									cc = "odd"
								end
								do sb:appendString("<a href=\"") end
								do sb:appendString(fn) end
								do sb:appendString("\"><div class=\"entry ") end
								do sb:appendString(cc) end
								do sb:appendString("\">") end
								do sb:appendString(fn) end
								do sb:appendString("</div></a>\n") end
								do n = n + 1 end
							end
							do n3 = n3 + 1 end
						end
					end
				end
				do sb:appendString("</div>\n") end
				do sb:appendString("<div id=\"footer\">") end
				do
					local serverName = self:getServerName()
					if _g.jk.lang.String:isEmpty(serverName) == false then
						if _g.jk.lang.String:isEmpty(self.serverURL) == false then
							do sb:appendString("Generated by <a href=\"") end
							if _g.jk.lang.String:contains(self.serverURL, "://") == false then
								do sb:appendString("http://") end
							end
							do sb:appendString(self.serverURL) end
							do sb:appendString("\">") end
							do sb:appendString(serverName) end
							do sb:appendString("</a>\n") end
						else
							do sb:appendString("Generated by ") end
							do sb:appendString(serverName) end
							do sb:appendString("\n") end
						end
					end
					do sb:appendString("</div>\n") end
					do sb:appendString("</body>\n") end
					do sb:appendString("</html>\n") end
					do return sb:toString() end
				end
			end
		end
	end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:processResponse(resp)
	if not (resp ~= nil) then
		do return nil end
	end
	if self.maxAge > 0 then
		do resp:addHeader("Cache-Control", "max-age=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.maxAge))) end
	end
	do return resp end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:onGET1(req)
	local startingResource = req:getCurrentResource()
	if self.directory == nil then
		do return false end
	end
	do
		local dd = self.directory
		while true do
			local comp = req:popResource()
			if comp == nil then
				do break end
			end
			dd = dd:entry(comp)
		end
		if dd:isDirectory() then
			if self.indexFiles ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(self.indexFiles)
				do
					n = 0
					while n < m do
						local indexFile = self.indexFiles[n + 1]
						if indexFile ~= nil then
							local ff = dd:entry(indexFile)
							if ff:isFile() then
								dd = ff
								do break end
							end
						end
						do n = n + 1 end
					end
				end
			end
		end
		if dd:isDirectory() then
			if req:isForDirectory() == false then
				do req:sendRedirectAsDirectory() end
				do return true end
			end
			if self.listDirectories == false then
				if startingResource ~= req:getCurrentResource() then
					do req:setCurrentResource(startingResource) end
				end
				do return false end
			end
			do req:sendResponse(self:processResponse(_g.jk.http.server.HTTPServerResponse:forHTMLString(self:dirToHTML(dd)))) end
			do return true end
		end
		if dd:exists() == false and self.processTemplateFiles then
			local bn = dd:getBasename()
			local nf = dd:getParent():entry(_g.jk.lang.String:safeString(bn) .. ".t")
			if nf:isFile() then
				dd = nf
			else
				nf = dd:getParent():entry(_g.jk.lang.String:safeString(bn) .. ".html.t")
				if nf:isFile() then
					dd = nf
				end
			end
		end
		if dd:isFile() then
			local resp = nil
			if self.processTemplateFiles then
				local bn = dd:getBasename()
				local isJSONTemplate = false
				local isHTMLTemplate = false
				local isCSSTemplate = false
				if _g.jk.lang.String:endsWith(bn, ".html.t") then
					isHTMLTemplate = true
				elseif _g.jk.lang.String:endsWith(bn, ".css.t") then
					isCSSTemplate = true
				elseif _g.jk.lang.String:endsWith(bn, ".json.t") then
					isJSONTemplate = true
				end
				if isHTMLTemplate or isCSSTemplate or isJSONTemplate then
					local data = dd:getContentsUTF8()
					if data == nil then
						do _g.jk.log.Log:error(self.logContext, "Failed to read template file content: `" .. _g.jk.lang.String:safeString(dd:getPath()) .. "'") end
						do req:sendResponse(self:processResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInternalError(nil))) end
						do return true end
					end
					do
						local includeDirs = {}
						do _g.jk.lang.Vector:append(includeDirs, dd:getParent()) end
						if self.templateIncludeDirs ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(self.templateIncludeDirs)
							do
								n2 = 0
								while n2 < m2 do
									local dir = self.templateIncludeDirs[n2 + 1]
									if dir ~= nil then
										do _g.jk.lang.Vector:append(includeDirs, dir) end
									end
									do n2 = n2 + 1 end
								end
							end
						end
						do
							local tt = nil
							if isHTMLTemplate or isCSSTemplate then
								tt = _g.jk.template.TextTemplate:forHTMLString(data, includeDirs, nil, self.logContext)
							else
								tt = _g.jk.template.TextTemplate:forJSONString(data, includeDirs, nil, self.logContext)
							end
							if tt == nil then
								do _g.jk.log.Log:error(self.logContext, "Failed to process template file content: `" .. _g.jk.lang.String:safeString(dd:getPath()) .. "'") end
								do req:sendResponse(self:processResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInternalError(nil))) end
								do return true end
							end
							do
								local tdata = self.templateData
								local dynamicData = self:getTemplateVariablesForFile(dd)
								if dynamicData ~= nil then
									if tdata == nil then
										tdata = dynamicData
									else
										do tdata:mergeFrom(dynamicData) end
									end
								end
								do
									local text = tt:execute(tdata, includeDirs)
									if text == nil then
										do _g.jk.log.Log:error(self.logContext, "Failed to execute template: `" .. _g.jk.lang.String:safeString(dd:getPath()) .. "'") end
										do req:sendResponse(self:processResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInternalError(nil))) end
										do return true end
									end
									if isHTMLTemplate then
										resp = _g.jk.http.server.HTTPServerResponse:forHTMLString(text)
									elseif isCSSTemplate then
										resp = _g.jk.http.server.HTTPServerResponse:forString(text, "text/css")
									else
										resp = _g.jk.http.server.HTTPServerResponse:forJSONString(text)
									end
								end
							end
						end
					end
				end
			end
			if resp == nil then
				resp = _g.jk.http.server.HTTPServerResponse:forFile(dd, -1)
			end
			do req:sendResponse(self:processResponse(resp)) end
			do return true end
		end
		if startingResource ~= req:getCurrentResource() then
			do req:setCurrentResource(startingResource) end
		end
		do return false end
	end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getListDirectories()
	do return self.listDirectories end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:setListDirectories(v)
	self.listDirectories = v
	do return self end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getProcessTemplateFiles()
	do return self.processTemplateFiles end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:setProcessTemplateFiles(v)
	self.processTemplateFiles = v
	do return self end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getDirectory()
	do return self.directory end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:setDirectory(v)
	self.directory = v
	do return self end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getMaxAge()
	do return self.maxAge end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:setMaxAge(v)
	self.maxAge = v
	do return self end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getServerURL()
	do return self.serverURL end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:setServerURL(v)
	self.serverURL = v
	do return self end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getIndexFiles()
	do return self.indexFiles end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getTemplateIncludeDirs()
	do return self.templateIncludeDirs end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:setTemplateIncludeDirs(v)
	self.templateIncludeDirs = v
	do return self end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:getTemplateData()
	do return self.templateData end
end

function jk.http.server.fs.HTTPServerDirectoryHandler:setTemplateData(v)
	self.templateData = v
	do return self end
end
