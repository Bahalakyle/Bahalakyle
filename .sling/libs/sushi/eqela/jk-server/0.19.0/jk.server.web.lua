jk = jk or {}

jk.server = jk.server or {}

jk.server.web = jk.server.web or {}

jk.server.web.WebServer = _g.jk.server.CommonServer._create()
jk.server.web.WebServer.__index = jk.server.web.WebServer
_vm:set_metatable(jk.server.web.WebServer, {
	__index = _g.jk.server.CommonServer
})

function jk.server.web.WebServer._create()
	local v = _vm:set_metatable({}, jk.server.web.WebServer)
	return v
end

function jk.server.web.WebServer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.web.WebServer'
	self['_isType.jk.server.web.WebServer'] = true
	self.handler = nil
	self.worker = nil
	self.enableRequestLogging = false
	self.enableRateLimit = nil
	self.timeoutDelay = 0
	self.maintenanceTimerDelay = 0
	self.workers = nil
end

jk.server.web.WebServer.MyHTTPServer = _g.jk.http.server.HTTPServer._create()
jk.server.web.WebServer.MyHTTPServer.__index = jk.server.web.WebServer.MyHTTPServer
_vm:set_metatable(jk.server.web.WebServer.MyHTTPServer, {
	__index = _g.jk.http.server.HTTPServer
})

function jk.server.web.WebServer.MyHTTPServer._create()
	local v = _vm:set_metatable({}, jk.server.web.WebServer.MyHTTPServer)
	return v
end

function jk.server.web.WebServer.MyHTTPServer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.web.WebServer.MyHTTPServer'
	self['_isType.jk.server.web.WebServer.MyHTTPServer'] = true
	self.myParent = nil
end

function jk.server.web.WebServer.MyHTTPServer:_construct0()
	jk.server.web.WebServer.MyHTTPServer._init(self)
	do _g.jk.http.server.HTTPServer._construct0(self) end
	return self
end

function jk.server.web.WebServer.MyHTTPServer:onMaintenance()
	do _g.jk.http.server.HTTPServer.onMaintenance(self) end
	do self.myParent:onMaintenance() end
end

function jk.server.web.WebServer.MyHTTPServer:getMyParent()
	do return self.myParent end
end

function jk.server.web.WebServer.MyHTTPServer:setMyParent(v)
	self.myParent = v
	do return self end
end

function jk.server.web.WebServer:_construct0()
	jk.server.web.WebServer._init(self)
	do _g.jk.server.CommonServer._construct0(self) end
	self.workers = _g.jk.worker.WorkerPool:forContext(self.ctx)
	do self:initConfigValue("ENABLE_REQUEST_LOGGING", "true") end
	do self:initConfigValue("ENABLE_RATE_LIMIT", nil) end
	do self:initConfigValue("TIMEOUT_DELAY", "30") end
	do self:initConfigValue("MAINTENANCE_TIMER_DELAY", "0") end
	do self:initConfigValue("MAX_WORKER_COUNT", "200") end
	do self:initConfigValue("MAX_WORKER_QUEUE", "1000") end
	return self
end

function jk.server.web.WebServer:configure(key, value, relativeTo, error)
	if key == "ENABLE_REQUEST_LOGGING" or key == "enableRequestLogging" then
		self.enableRequestLogging = _g.jk.lang.Boolean:asBoolean(value, false)
		do return true end
	end
	if key == "ENABLE_RATE_LIMIT" or key == "enableRateLimit" then
		self.enableRateLimit = value
		do return true end
	end
	if key == "TIMEOUT_DELAY" or key == "timeoutDelay" then
		self.timeoutDelay = _g.jk.lang.Integer:asInteger(value)
		if self.timeoutDelay < 30 then
			self.timeoutDelay = 30
		end
		do return true end
	end
	if key == "MAINTENANCE_TIMER_DELAY" or key == "maintenanceTimerDelay" then
		self.maintenanceTimerDelay = _g.jk.lang.Integer:asInteger(value)
		if self.maintenanceTimerDelay < 0 then
			self.maintenanceTimerDelay = 0
		end
		do return true end
	end
	if key == "MAX_WORKER_COUNT" or key == "maxWorkerCount" then
		do self.workers:setMaxWorkers(_g.jk.lang.Integer:asInteger(value)) end
		do return true end
	end
	if key == "MAX_WORKER_QUEUE" or key == "maxWorkerQueue" then
		do self.workers:setMaxQueue(_g.jk.lang.Integer:asInteger(value)) end
		do return true end
	end
	do return _g.jk.server.CommonServer.configure(self, key, value, relativeTo, error) end
end

jk.server.web.WebServer.WorkerRequestHandler = {}
jk.server.web.WebServer.WorkerRequestHandler.__index = jk.server.web.WebServer.WorkerRequestHandler
_vm:set_metatable(jk.server.web.WebServer.WorkerRequestHandler, {})

function jk.server.web.WebServer.WorkerRequestHandler._create()
	local v = _vm:set_metatable({}, jk.server.web.WebServer.WorkerRequestHandler)
	return v
end

function jk.server.web.WebServer.WorkerRequestHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.web.WebServer.WorkerRequestHandler'
	self['_isType.jk.server.web.WebServer.WorkerRequestHandler'] = true
	self['_isType.jk.http.server.HTTPServerRequestHandler'] = true
	self['_isType.jk.http.server.HTTPServerComponent'] = true
	self.handler = nil
	self.worker = nil
end

function jk.server.web.WebServer.WorkerRequestHandler:_construct0()
	jk.server.web.WebServer.WorkerRequestHandler._init(self)
	return self
end

function jk.server.web.WebServer.WorkerRequestHandler:getComponent()
	do return _vm:to_table_with_key(_g.jk.lang.Reflection:createClassInstanceByTypeinfo(self.worker), '_isType.jk.http.server.HTTPServerComponent') end
end

function jk.server.web.WebServer.WorkerRequestHandler:handleRequest(req, next)
	do self.handler(req, next) end
end

function jk.server.web.WebServer.WorkerRequestHandler:initialize(server)
	local cc = self:getComponent()
	if cc ~= nil then
		do cc:initialize(server) end
	end
end

function jk.server.web.WebServer.WorkerRequestHandler:onMaintenance()
	local cc = self:getComponent()
	if cc ~= nil then
		do cc:onMaintenance() end
	end
end

function jk.server.web.WebServer.WorkerRequestHandler:onRefresh()
	local cc = self:getComponent()
	if cc ~= nil then
		do cc:onRefresh() end
	end
end

function jk.server.web.WebServer.WorkerRequestHandler:cleanup()
	local cc = self:getComponent()
	if cc ~= nil then
		do cc:cleanup() end
	end
end

function jk.server.web.WebServer.WorkerRequestHandler:getHandler()
	do return self.handler end
end

function jk.server.web.WebServer.WorkerRequestHandler:setHandler(v)
	self.handler = v
	do return self end
end

function jk.server.web.WebServer.WorkerRequestHandler:getWorker()
	do return self.worker end
end

function jk.server.web.WebServer.WorkerRequestHandler:setWorker(v)
	self.worker = v
	do return self end
end

function jk.server.web.WebServer:initializeHandlers(server)
	if self.handler ~= nil then
		do server:pushRequestHandler2(self.handler) end
	end
	if self.worker ~= nil then
		do server:pushRequestHandler2(_g.jk.server.web.WebServer.WorkerRequestHandler._construct0(_g.jk.server.web.WebServer.WorkerRequestHandler._create()):setWorker(self.worker):setHandler(function(req, next)
			do self:handleRequestWithWorker(req, self.worker) end
		end)) end
	end
end

function jk.server.web.WebServer:initializeServer(server)
	if _g.jk.lang.String:isNotEmpty(self.enableRateLimit) then
		local limit = _g.jk.server.web.HTTPServerRateLimitHandler._construct0(_g.jk.server.web.HTTPServerRateLimitHandler._create())
		if self.enableRateLimit == "true" or self.enableRateLimit == "yes" then
		else
			local comps = _g.jk.lang.String:split(self.enableRateLimit, 58, 3)
			do limit:setCountLimit(_g.jk.lang.Integer:asInteger(_g.jk.lang.Vector:get(comps, 0))) end
			do limit:setCountDuration(_g.jk.lang.Integer:asInteger(_g.jk.lang.Vector:get(comps, 1))) end
			do limit:setIgnoreDuration(_g.jk.lang.Integer:asInteger(_g.jk.lang.Vector:get(comps, 2))) end
		end
		do server:pushRequestHandler2(limit) end
	end
	do self:initializeHandlers(server) end
	do return true end
end

function jk.server.web.WebServer:initializeNetworkServer(server)
	if not _g.jk.server.CommonServer.initializeNetworkServer(self, server) then
		do return false end
	end
	if (_vm:to_table_with_key(server, '_isType.jk.http.server.HTTPServer') ~= nil) then
		if not self:initializeServer(server) then
			do return false end
		end
		if self.enableRequestLogging then
			do server:addRequestHandlerListener2(_g.jk.http.server.HTTPServerRequestLogger._construct0(_g.jk.http.server.HTTPServerRequestLogger._create()):setLogContext(self.ctx):setLogdir(self:getLoggingDirectory())) end
		end
	end
	do return true end
end

function jk.server.web.WebServer:createServer()
	local server = _g.jk.server.web.WebServer.MyHTTPServer._construct0(_g.jk.server.web.WebServer.MyHTTPServer._create())
	do server:setTimeoutDelay(self.timeoutDelay) end
	do server:setMaintenanceTimerDelay(self.maintenanceTimerDelay) end
	do server:setMyParent(self) end
	do server:setPort(self:getListenPort()) end
	do return server end
end

function jk.server.web.WebServer:handleRequestWithWorker(req, worker)
	if not (req ~= nil) then
		do return end
	end
	do
		local fulldata = nil
		do self.workers:executeWorker(worker, req:toMyPacket(), function(data, size)
			if not (data ~= nil) then
				if not (fulldata ~= nil) then
					do req:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInternalError(nil)) end
				else
					do req:sendResponse(_g.jk.http.server.HTTPServerResponse:forMyPacket(fulldata)) end
				end
			else
				fulldata = _g.jk.lang.Buffer:append(fulldata, data, size)
			end
		end) end
	end
end

function jk.server.web.WebServer:executeForHandler(handler, args)
	do self:setHandler(handler) end
	do return self:executeMain(args) end
end

function jk.server.web.WebServer:getHandler()
	do return self.handler end
end

function jk.server.web.WebServer:setHandler(v)
	self.handler = v
	do return self end
end

function jk.server.web.WebServer:getWorker()
	do return self.worker end
end

function jk.server.web.WebServer:setWorker(v)
	self.worker = v
	do return self end
end

jk.server.web.HTTPServerRateLimitHandler = {}
jk.server.web.HTTPServerRateLimitHandler.__index = jk.server.web.HTTPServerRateLimitHandler
_vm:set_metatable(jk.server.web.HTTPServerRateLimitHandler, {})

function jk.server.web.HTTPServerRateLimitHandler._create()
	local v = _vm:set_metatable({}, jk.server.web.HTTPServerRateLimitHandler)
	return v
end

function jk.server.web.HTTPServerRateLimitHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.web.HTTPServerRateLimitHandler'
	self['_isType.jk.server.web.HTTPServerRateLimitHandler'] = true
	self['_isType.jk.http.server.HTTPServerRequestHandler'] = true
	self['_isType.jk.http.server.HTTPServerComponent'] = true
	self.countLimit = 5
	self.countDuration = 5
	self.ignoreDuration = 60
	self.maintenanceCleanupDelay = 60
	self.lastCleanupTimeStamp = 0
	self.addresses = nil
end

jk.server.web.HTTPServerRateLimitHandler.RequestCounter = {}
jk.server.web.HTTPServerRateLimitHandler.RequestCounter.__index = jk.server.web.HTTPServerRateLimitHandler.RequestCounter
_vm:set_metatable(jk.server.web.HTTPServerRateLimitHandler.RequestCounter, {})

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter._create()
	local v = _vm:set_metatable({}, jk.server.web.HTTPServerRateLimitHandler.RequestCounter)
	return v
end

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.web.HTTPServerRateLimitHandler.RequestCounter'
	self['_isType.jk.server.web.HTTPServerRateLimitHandler.RequestCounter'] = true
	self.ipAddress = nil
	self.startCountTimeStamp = 0
	self.startIgnoreTimeStamp = 0
	self.requestCount = 1
end

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter:_construct0()
	jk.server.web.HTTPServerRateLimitHandler.RequestCounter._init(self)
	return self
end

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter:getCountAfterIncrement()
	do return (function() self.requestCount = self.requestCount + 1 return self.requestCount end)() end
end

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter:getIpAddress()
	do return self.ipAddress end
end

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter:setIpAddress(v)
	self.ipAddress = v
	do return self end
end

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter:getStartCountTimeStamp()
	do return self.startCountTimeStamp end
end

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter:setStartCountTimeStamp(v)
	self.startCountTimeStamp = v
	do return self end
end

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter:getStartIgnoreTimeStamp()
	do return self.startIgnoreTimeStamp end
end

function jk.server.web.HTTPServerRateLimitHandler.RequestCounter:setStartIgnoreTimeStamp(v)
	self.startIgnoreTimeStamp = v
	do return self end
end

function jk.server.web.HTTPServerRateLimitHandler:_construct0()
	jk.server.web.HTTPServerRateLimitHandler._init(self)
	self.addresses = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	return self
end

function jk.server.web.HTTPServerRateLimitHandler:initialize(server)
end

function jk.server.web.HTTPServerRateLimitHandler:onMaintenance()
	if not (self.addresses ~= nil) then
		do return end
	end
	do
		local now = _g.jk.time.SystemClock:asSeconds()
		if now - self.lastCleanupTimeStamp < self.maintenanceCleanupDelay then
			do return end
		end
		self.lastCleanupTimeStamp = now
		do
			local keys = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
			local itr = self.addresses:iterateValues()
			if not (itr ~= nil) then
				do return end
			end
			while true do
				local rc = _vm:to_table_with_key(itr:next(), '_isType.jk.server.web.HTTPServerRateLimitHandler.RequestCounter')
				if rc == nil then
					do break end
				end
				if rc:getStartIgnoreTimeStamp() == 0 and now - rc:getStartCountTimeStamp() > self.countDuration then
					do keys:appendObject(rc:getIpAddress()) end
				end
			end
			do
				local array = keys:toVector()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local k = (function(o)
								if (_vm:get_variable_type(o) == 'string') then
									do return o end
								end
								do return nil end
							end)(array[n + 1])
							if k ~= nil then
								do self.addresses:remove(k) end
							end
							do n = n + 1 end
						end
					end
				end
			end
		end
	end
end

function jk.server.web.HTTPServerRateLimitHandler:onRefresh()
end

function jk.server.web.HTTPServerRateLimitHandler:cleanup()
end

function jk.server.web.HTTPServerRateLimitHandler:handleRequest(req, next)
	if self:isRequestRejected(req) then
		do req:sendJSONObject(_g.jk.http.server.HTTPServerJSONResponse:forNotAllowed()) end
		do return end
	end
	do next() end
end

function jk.server.web.HTTPServerRateLimitHandler:isRequestRejected(req)
	local connection = req:getConnection()
	if connection == nil then
		do return true end
	end
	do
		local socket = connection:getSocket()
		if socket == nil then
			do return true end
		end
		do
			local ipAddress = nil
			if (_vm:to_table_with_key(socket, '_isType.jk.socket.TCPSocket') ~= nil) then
				ipAddress = socket:getRemoteAddress()
			else
				ipAddress = req:getRemoteAddress()
			end
			if _g.jk.lang.String:isEmpty(ipAddress) then
				do return true end
			end
			do
				local now = _g.jk.time.SystemClock:asSeconds()
				local rc = _vm:to_table_with_key(self.addresses:get(ipAddress), '_isType.jk.server.web.HTTPServerRateLimitHandler.RequestCounter')
				if rc == nil then
					do self.addresses:setObject(ipAddress, _g.jk.server.web.HTTPServerRateLimitHandler.RequestCounter._construct0(_g.jk.server.web.HTTPServerRateLimitHandler.RequestCounter._create()):setIpAddress(ipAddress):setStartCountTimeStamp(now)) end
					do return false end
				end
				if rc:getStartIgnoreTimeStamp() > 0 then
					if now - rc:getStartIgnoreTimeStamp() <= self.ignoreDuration then
						do return true end
					end
					do self.addresses:remove(ipAddress) end
					do return false end
				end
				if now - rc:getStartCountTimeStamp() <= self.countDuration then
					local count = rc:getCountAfterIncrement()
					if count >= self.countLimit then
						do rc:setStartIgnoreTimeStamp(now) end
						do return true end
					end
					do return false end
				end
				do self.addresses:remove(ipAddress) end
				do return false end
			end
		end
	end
end

function jk.server.web.HTTPServerRateLimitHandler:getCountLimit()
	do return self.countLimit end
end

function jk.server.web.HTTPServerRateLimitHandler:setCountLimit(v)
	self.countLimit = v
	do return self end
end

function jk.server.web.HTTPServerRateLimitHandler:getCountDuration()
	do return self.countDuration end
end

function jk.server.web.HTTPServerRateLimitHandler:setCountDuration(v)
	self.countDuration = v
	do return self end
end

function jk.server.web.HTTPServerRateLimitHandler:getIgnoreDuration()
	do return self.ignoreDuration end
end

function jk.server.web.HTTPServerRateLimitHandler:setIgnoreDuration(v)
	self.ignoreDuration = v
	do return self end
end

function jk.server.web.HTTPServerRateLimitHandler:getMaintenanceCleanupDelay()
	do return self.maintenanceCleanupDelay end
end

function jk.server.web.HTTPServerRateLimitHandler:setMaintenanceCleanupDelay(v)
	self.maintenanceCleanupDelay = v
	do return self end
end

jk.server.web.WebSiteServerHandler = _g.jk.http.server.HTTPServerRequestHandlerMap._create()
jk.server.web.WebSiteServerHandler.__index = jk.server.web.WebSiteServerHandler
_vm:set_metatable(jk.server.web.WebSiteServerHandler, {
	__index = _g.jk.http.server.HTTPServerRequestHandlerMap
})

function jk.server.web.WebSiteServerHandler._create()
	local v = _vm:set_metatable({}, jk.server.web.WebSiteServerHandler)
	return v
end

function jk.server.web.WebSiteServerHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.web.WebSiteServerHandler'
	self['_isType.jk.server.web.WebSiteServerHandler'] = true
	self.templateDir = nil
	self.resourceDir = nil
	self.templates = nil
end

function jk.server.web.WebSiteServerHandler:_construct0()
	jk.server.web.WebSiteServerHandler._init(self)
	do _g.jk.http.server.HTTPServerRequestHandlerMap._construct0(self) end
	return self
end

function jk.server.web.WebSiteServerHandler:getTemplates()
	if not (self.templates ~= nil) then
		self.templates = _g.jk.template.TextTemplateManager:forDirectory(self.templateDir, false)
	end
	do return self.templates end
end

function jk.server.web.WebSiteServerHandler:processTemplate(name, params)
	local templates = self:getTemplates()
	if not (templates ~= nil) then
		do return nil end
	end
	do return templates:getText(name, params) end
end

function jk.server.web.WebSiteServerHandler:initialize(server)
	do _g.jk.http.server.HTTPServerRequestHandlerMap.initialize(self, server) end
	do self:get("*", function(req)
		do req:sendFromDirectory(self.resourceDir) end
	end) end
end

function jk.server.web.WebSiteServerHandler:getTemplateDir()
	do return self.templateDir end
end

function jk.server.web.WebSiteServerHandler:setTemplateDir(v)
	self.templateDir = v
	do return self end
end

function jk.server.web.WebSiteServerHandler:getResourceDir()
	do return self.resourceDir end
end

function jk.server.web.WebSiteServerHandler:setResourceDir(v)
	self.resourceDir = v
	do return self end
end

jk.server.web.WebSiteServerMain = _g.jk.server.web.WebServer._create()
jk.server.web.WebSiteServerMain.__index = jk.server.web.WebSiteServerMain
_vm:set_metatable(jk.server.web.WebSiteServerMain, {
	__index = _g.jk.server.web.WebServer
})

function jk.server.web.WebSiteServerMain._create()
	local v = _vm:set_metatable({}, jk.server.web.WebSiteServerMain)
	return v
end

function jk.server.web.WebSiteServerMain:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.web.WebSiteServerMain'
	self['_isType.jk.server.web.WebSiteServerMain'] = true
	self.templateDir = nil
	self.resourceDir = nil
end

function jk.server.web.WebSiteServerMain:_construct0()
	jk.server.web.WebSiteServerMain._init(self)
	do _g.jk.server.web.WebServer._construct0(self) end
	local cdir = nil
	local lib = _g.jk.env.CommonPath:getCodeFileForObject(self)
	if lib ~= nil then
		cdir = lib:getParent()
	end
	if not (cdir ~= nil) or (_vm:to_table_with_key(cdir, '_isType.jk.fs.FileInvalid') ~= nil) then
		cdir = _g.jk.env.CommonPath:getAppDirectory()
	end
	if not (cdir ~= nil) or (_vm:to_table_with_key(cdir, '_isType.jk.fs.FileInvalid') ~= nil) then
		cdir = _g.jk.fs.File:forPath(".")
	end
	if cdir ~= nil then
		self.templateDir = cdir:entry("templates")
		self.resourceDir = cdir:entry("resources")
	end
	return self
end

function jk.server.web.WebSiteServerMain:configure(key, value, relativeTo, error)
	if key == "templates" then
		self.templateDir = _g.jk.fs.File:forRelativePath(value, relativeTo, false)
		do return true end
	end
	if key == "resources" then
		self.resourceDir = _g.jk.fs.File:forRelativePath(value, relativeTo, false)
		do return true end
	end
	do return _g.jk.server.web.WebServer.configure(self, key, value, relativeTo, error) end
end

function jk.server.web.WebSiteServerMain:initializeServer(server)
	if not _g.jk.server.web.WebServer.initializeServer(self, server) then
		do return false end
	end
	do
		local wssh = _vm:to_table_with_key(self:getHandler(), '_isType.jk.server.web.WebSiteServerHandler')
		if wssh ~= nil then
			do wssh:setTemplateDir(self.templateDir) end
			do wssh:setResourceDir(self.resourceDir) end
		end
		do return true end
	end
end

function jk.server.web.WebSiteServerMain:getTemplateDir()
	do return self.templateDir end
end

function jk.server.web.WebSiteServerMain:setTemplateDir(v)
	self.templateDir = v
	do return self end
end

function jk.server.web.WebSiteServerMain:getResourceDir()
	do return self.resourceDir end
end

function jk.server.web.WebSiteServerMain:setResourceDir(v)
	self.resourceDir = v
	do return self end
end
