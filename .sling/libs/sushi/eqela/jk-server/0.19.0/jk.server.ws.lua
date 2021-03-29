jk = jk or {}

jk.server = jk.server or {}

jk.server.ws = jk.server.ws or {}

jk.server.ws.WebSocketServer = _g.jk.server.CommonServer._create()
jk.server.ws.WebSocketServer.__index = jk.server.ws.WebSocketServer
_vm:set_metatable(jk.server.ws.WebSocketServer, {
	__index = _g.jk.server.CommonServer
})

function jk.server.ws.WebSocketServer._create()
	local v = _vm:set_metatable({}, jk.server.ws.WebSocketServer)
	return v
end

function jk.server.ws.WebSocketServer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.ws.WebSocketServer'
	self['_isType.jk.server.ws.WebSocketServer'] = true
	self.maintenanceTimerDelay = 0
end

jk.server.ws.WebSocketServer.MyWSServer = _g.jk.ws.server.WSServer._create()
jk.server.ws.WebSocketServer.MyWSServer.__index = jk.server.ws.WebSocketServer.MyWSServer
_vm:set_metatable(jk.server.ws.WebSocketServer.MyWSServer, {
	__index = _g.jk.ws.server.WSServer
})

function jk.server.ws.WebSocketServer.MyWSServer._create()
	local v = _vm:set_metatable({}, jk.server.ws.WebSocketServer.MyWSServer)
	return v
end

function jk.server.ws.WebSocketServer.MyWSServer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.ws.WebSocketServer.MyWSServer'
	self['_isType.jk.server.ws.WebSocketServer.MyWSServer'] = true
	self.myParent = nil
end

function jk.server.ws.WebSocketServer.MyWSServer:_construct0()
	jk.server.ws.WebSocketServer.MyWSServer._init(self)
	do _g.jk.ws.server.WSServer._construct0(self) end
	return self
end

function jk.server.ws.WebSocketServer.MyWSServer:onMaintenance()
	do _g.jk.ws.server.WSServer.onMaintenance(self) end
	do self.myParent:onMaintenance() end
end

function jk.server.ws.WebSocketServer.MyWSServer:getMyParent()
	do return self.myParent end
end

function jk.server.ws.WebSocketServer.MyWSServer:setMyParent(v)
	self.myParent = v
	do return self end
end

function jk.server.ws.WebSocketServer:_construct0()
	jk.server.ws.WebSocketServer._init(self)
	do _g.jk.server.CommonServer._construct0(self) end
	do self:initConfigValue("MAINTENANCE_TIMER_DELAY", "60") end
	return self
end

function jk.server.ws.WebSocketServer:configure(key, value, relativeTo, error)
	if key == "MAINTENANCE_TIMER_DELAY" or key == "maintenanceTimerDelay" then
		self.maintenanceTimerDelay = _g.jk.lang.Integer:asInteger(value)
		if self.maintenanceTimerDelay < 0 then
			self.maintenanceTimerDelay = 0
		end
		do return true end
	end
	do return _g.jk.server.CommonServer.configure(self, key, value, relativeTo, error) end
end

function jk.server.ws.WebSocketServer:createConnectionHandler()
end

function jk.server.ws.WebSocketServer:initializeServer(server)
	do return true end
end

function jk.server.ws.WebSocketServer:initializeNetworkServer(server)
	if not _g.jk.server.CommonServer.initializeNetworkServer(self, server) then
		do return false end
	end
	if (_vm:to_table_with_key(server, '_isType.jk.ws.server.WSServer') ~= nil) then
		if not self:initializeServer(server) then
			do return false end
		end
	end
	do return true end
end

function jk.server.ws.WebSocketServer:createServer()
	local server = _g.jk.server.ws.WebSocketServer.MyWSServer._construct0(_g.jk.server.ws.WebSocketServer.MyWSServer._create())
	do server:setMaintenanceTimerDelay(self.maintenanceTimerDelay) end
	do server:setMyParent(self) end
	do server:setPort(self:getListenPort()) end
	do server:setCreateConnectionHandlerObject(function()
		do return self:createConnectionHandler() end
	end) end
	do return server end
end
