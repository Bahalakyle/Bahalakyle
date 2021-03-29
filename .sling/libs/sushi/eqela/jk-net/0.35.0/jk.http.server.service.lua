jk = jk or {}

jk.http = jk.http or {}

jk.http.server = jk.http.server or {}

jk.http.server.service = jk.http.server.service or {}

jk.http.server.service.HTTPServerService = {}
jk.http.server.service.HTTPServerService.__index = jk.http.server.service.HTTPServerService
_vm:set_metatable(jk.http.server.service.HTTPServerService, {})

function jk.http.server.service.HTTPServerService._create()
	local v = _vm:set_metatable({}, jk.http.server.service.HTTPServerService)
	return v
end

function jk.http.server.service.HTTPServerService:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.service.HTTPServerService'
	self['_isType.jk.http.server.service.HTTPServerService'] = true
end

function jk.http.server.service.HTTPServerService:_construct0()
	jk.http.server.service.HTTPServerService._init(self)
	return self
end

function jk.http.server.service.HTTPServerService:execute(ctx, rootHandler)
	local ioManager = _g.jk.socket.io.IOManager:createDefault()
	if not (ioManager ~= nil) then
		do _g.jk.log.Log:error(ctx, "Failed to create IO manager") end
		do return false end
	end
	do
		local server = _g.jk.http.server.HTTPServer._construct0(_g.jk.http.server.HTTPServer._create())
		local port = _g.jk.env.EnvironmentVariable:get("PORT")
		if port ~= nil then
			do server:setPort(_g.jk.lang.String:toInteger(port)) end
		end
		if rootHandler ~= nil then
			do server:pushRequestHandler2(rootHandler) end
		end
		if not server:initialize1(ioManager, ctx) then
			do _g.jk.log.Log:error(ctx, "Failed to initialize HTTP server.") end
			do return false end
		end
		if not ioManager:execute(ctx) then
			do _g.jk.log.Log:error(ctx, "Failed to execute IO manager") end
			do return false end
		end
		do _g.jk.log.Log:info(ctx, "Successfully completed.") end
		do return true end
	end
end
