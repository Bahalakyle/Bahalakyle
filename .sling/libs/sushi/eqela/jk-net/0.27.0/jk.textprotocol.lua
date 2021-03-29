jk = jk or {}

jk.textprotocol = jk.textprotocol or {}

jk.textprotocol.TextProtocolConnection = _g.jk.server.NetworkConnection._create()
jk.textprotocol.TextProtocolConnection.__index = jk.textprotocol.TextProtocolConnection
_vm:set_metatable(jk.textprotocol.TextProtocolConnection, {
	__index = _g.jk.server.NetworkConnection
})

function jk.textprotocol.TextProtocolConnection._create()
	local v = _vm:set_metatable({}, jk.textprotocol.TextProtocolConnection)
	return v
end

function jk.textprotocol.TextProtocolConnection:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.textprotocol.TextProtocolConnection'
	self['_isType.jk.textprotocol.TextProtocolConnection'] = true
	self.encoding = nil
end

function jk.textprotocol.TextProtocolConnection:_construct0()
	jk.textprotocol.TextProtocolConnection._init(self)
	do _g.jk.server.NetworkConnection._construct0(self) end
	return self
end

function jk.textprotocol.TextProtocolConnection:onDataReceived(data, size)
	if size < 1 then
		do return end
	end
	do
		local sb = _g.jk.lang.Buffer:getSubBuffer(data, 0, size, false)
		if not (sb ~= nil) then
			do return end
		end
		do
			local str = nil
			if self.encoding == nil then
				str = _g.jk.lang.String:forUTF8Buffer(sb)
			else
				str = _g.jk.lang.String:forBuffer(data, self.encoding)
			end
			if str == nil then
				do return end
			end
			do self:onTextReceived(str) end
		end
	end
end

function jk.textprotocol.TextProtocolConnection:sendText(text)
	if text == nil then
		do return end
	end
	do self:sendData(_g.jk.lang.String:toUTF8Buffer(text), -1) end
end

function jk.textprotocol.TextProtocolConnection:onTextReceived(data)
end

function jk.textprotocol.TextProtocolConnection:getEncoding()
	do return self.encoding end
end

function jk.textprotocol.TextProtocolConnection:setEncoding(v)
	self.encoding = v
	do return self end
end

jk.textprotocol.TextLineProtocolConnection = _g.jk.textprotocol.TextProtocolConnection._create()
jk.textprotocol.TextLineProtocolConnection.__index = jk.textprotocol.TextLineProtocolConnection
_vm:set_metatable(jk.textprotocol.TextLineProtocolConnection, {
	__index = _g.jk.textprotocol.TextProtocolConnection
})

function jk.textprotocol.TextLineProtocolConnection._create()
	local v = _vm:set_metatable({}, jk.textprotocol.TextLineProtocolConnection)
	return v
end

function jk.textprotocol.TextLineProtocolConnection:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.textprotocol.TextLineProtocolConnection'
	self['_isType.jk.textprotocol.TextLineProtocolConnection'] = true
	self.useCRLF = false
end

function jk.textprotocol.TextLineProtocolConnection:_construct0()
	jk.textprotocol.TextLineProtocolConnection._init(self)
	do _g.jk.textprotocol.TextProtocolConnection._construct0(self) end
	return self
end

function jk.textprotocol.TextLineProtocolConnection:sendLine(text)
	if self.useCRLF then
		do self:sendText(_g.jk.lang.String:safeString(text) .. "\r\n") end
	else
		do self:sendText(_g.jk.lang.String:safeString(text) .. "\n") end
	end
end

function jk.textprotocol.TextLineProtocolConnection:onTextReceived(data)
	if data == nil then
		do return end
	end
	do
		local str = data
		if _g.jk.lang.String:endsWith(str, "\r\n") then
			str = _g.jk.lang.String:getSubString(str, 0, _g.jk.lang.String:getLength(str) - 2)
		elseif _g.jk.lang.String:endsWith(str, "\n") then
			str = _g.jk.lang.String:getSubString(str, 0, _g.jk.lang.String:getLength(str) - 1)
		end
		do
			local nn = _g.jk.lang.String:getIndexOfCharacter(str, 10, 0)
			if nn < 0 then
				do self:onLineReceived(str) end
				do return end
			end
			do
				local array = _g.jk.lang.String:split(str, 10, 0)
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local line = array[n + 1]
							if line ~= nil then
								if _g.jk.lang.String:endsWith(line, "\r") then
									line = _g.jk.lang.String:getSubString(line, 0, _g.jk.lang.String:getLength(line) - 1)
								end
								do self:onLineReceived(line) end
							end
							do n = n + 1 end
						end
					end
				end
			end
		end
	end
end

function jk.textprotocol.TextLineProtocolConnection:onLineReceived(data)
end

function jk.textprotocol.TextLineProtocolConnection:getUseCRLF()
	do return self.useCRLF end
end

function jk.textprotocol.TextLineProtocolConnection:setUseCRLF(v)
	self.useCRLF = v
	do return self end
end
