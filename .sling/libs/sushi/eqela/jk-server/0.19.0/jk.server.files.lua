jk = jk or {}

jk.server = jk.server or {}

jk.server.files = jk.server.files or {}

jk.server.files.FileServerMain = _g.jk.server.web.WebServer._create()
jk.server.files.FileServerMain.__index = jk.server.files.FileServerMain
_vm:set_metatable(jk.server.files.FileServerMain, {
	__index = _g.jk.server.web.WebServer
})

function jk.server.files.FileServerMain._create()
	local v = _vm:set_metatable({}, jk.server.files.FileServerMain)
	return v
end

function jk.server.files.FileServerMain:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.files.FileServerMain'
	self['_isType.jk.server.files.FileServerMain'] = true
	self.contentDirectory = nil
	self.listDirectories = true
	self.processTemplateFiles = false
	self.maxAge = 300
end

function jk.server.files.FileServerMain:_construct0()
	jk.server.files.FileServerMain._init(self)
	do _g.jk.server.web.WebServer._construct0(self) end
	return self
end

function jk.server.files.FileServerMain:configure(key, value, relativeTo, error)
	if _g.jk.server.web.WebServer.configure(self, key, value, relativeTo, error) then
		do return true end
	end
	if key == "maxAge" then
		self.maxAge = _g.jk.lang.Integer:asInteger(value)
		do return true end
	end
	if key == "contentDirectory" then
		self.contentDirectory = _g.jk.fs.File:forRelativePath(value, relativeTo, false)
		do return true end
	end
	if key == "listDirectories" then
		self.listDirectories = _g.jk.lang.Boolean:asBoolean(value, false)
		do return true end
	end
	if key == "processTemplateFiles" then
		self.processTemplateFiles = _g.jk.lang.Boolean:asBoolean(value, false)
		do return true end
	end
	do return false end
end

function jk.server.files.FileServerMain:acceptCommandLineArgument(arg)
	if _g.jk.server.web.WebServer.acceptCommandLineArgument(self, arg) then
		do return true end
	end
	if arg:isParameter() then
		self.contentDirectory = _g.jk.fs.File:forPath(arg.parameter)
		do return true end
	end
	do return false end
end

function jk.server.files.FileServerMain:initializeServer(server)
	if not _g.jk.server.web.WebServer.initializeServer(self, server) then
		do return false end
	end
	if not (self.contentDirectory ~= nil) then
		do _g.jk.log.Log:error(self.ctx, "No `contentDirectory' specified. Either use a config file or specify -OcontentDirectory=<directory>") end
		do return false end
	end
	if not self.contentDirectory:isDirectory() then
		do _g.jk.log.Log:error(self.ctx, "Not a directory: `" .. _g.jk.lang.String:safeString(self.contentDirectory:getPath()) .. "'") end
		do return false end
	end
	do
		local files = _g.jk.http.server.fs.HTTPServerDirectoryHandler:forDirectory(self.contentDirectory)
		do files:setMaxAge(self.maxAge) end
		do files:setListDirectories(self.listDirectories) end
		do files:setProcessTemplateFiles(self.processTemplateFiles) end
		if self.processTemplateFiles then
			do files:setIndexFiles({
				"index.html",
				"index.html.t"
			}) end
		else
			do files:setIndexFiles({
				"index.html"
			}) end
		end
		do server:pushRequestHandler2(files) end
		do return true end
	end
end

function jk.server.files.FileServerMain:_main(args)
	if _g.jk.server.files.FileServerMain._construct0(_g.jk.server.files.FileServerMain._create()):execute(args) == false then
		do return 1 end
	end
	do return 0 end
end

function _main(args)
	do return jk.server.files.FileServerMain:_main(args) end
end
