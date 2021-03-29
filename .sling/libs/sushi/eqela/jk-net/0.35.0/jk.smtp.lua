jk = jk or {}

jk.smtp = jk.smtp or {}

jk.smtp.SMTPSender = {}
jk.smtp.SMTPSender.__index = jk.smtp.SMTPSender
_vm:set_metatable(jk.smtp.SMTPSender, {})

function jk.smtp.SMTPSender._create()
	local v = _vm:set_metatable({}, jk.smtp.SMTPSender)
	return v
end

function jk.smtp.SMTPSender:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.smtp.SMTPSender'
	self['_isType.jk.smtp.SMTPSender'] = true
	self.thisServerAddress = nil
	self.server = nil
	self.myName = nil
	self.myAddress = nil
	self.ctx = nil
	self.maxSenderCount = 0
	self.acceptInvalidCertificate = false
	self.serverInternal = nil
	self.senderCount = 0
end

function jk.smtp.SMTPSender:forCommonDetails(serverAddress, serverUsername, serverPassword, senderName, senderAddress)
	local config = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do config:setString("server_type", "smtp+ssl") end
	do config:setString("server_username", serverUsername) end
	do config:setString("server_password", serverPassword) end
	do config:setString("server_address", serverAddress) end
	do config:setString("sender_name", senderName) end
	do config:setString("sender_address", senderAddress) end
	do return _g.jk.smtp.SMTPSender:forConfiguration(config, nil) end
end

function jk.smtp.SMTPSender:forRemoteServerUrl(url)
	local v = _g.jk.smtp.SMTPSender._construct0(_g.jk.smtp.SMTPSender._create())
	do v:setServer(url) end
	do return v end
end

function jk.smtp.SMTPSender:forServerAddress(name, ctx)
	do return _g.jk.smtp.SMTPSender._construct0(_g.jk.smtp.SMTPSender._create()):setThisServerAddress(name):setCtx(ctx) end
end

function jk.smtp.SMTPSender:forConfiguration(config, ctx)
	do return _g.jk.smtp.SMTPSender._construct0(_g.jk.smtp.SMTPSender._create()):setCtx(ctx):configure(config) end
end

function jk.smtp.SMTPSender:_construct0()
	jk.smtp.SMTPSender._init(self)
	self.thisServerAddress = "smtpclient.jkop"
	return self
end

function jk.smtp.SMTPSender:getDescription()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if _g.jk.lang.String:isEmpty(self.myName) == false then
		do sb:appendCharacter(34) end
		do sb:appendString(self.myName) end
		do sb:appendCharacter(34) end
	end
	if _g.jk.lang.String:isEmpty(self.myAddress) == false then
		local hasName = false
		if sb:count() > 0 then
			hasName = true
		end
		if hasName then
			do sb:appendCharacter(32) end
			do sb:appendCharacter(60) end
		end
		do sb:appendString(self.myAddress) end
		if hasName then
			do sb:appendCharacter(62) end
		end
	end
	do
		local s = self.serverInternal
		if _g.jk.lang.String:isEmpty(s) then
			s = self.server
		end
		if _g.jk.lang.String:isEmpty(s) == false then
			do sb:appendCharacter(32) end
			do sb:appendCharacter(40) end
			do sb:appendString(s) end
			do sb:appendCharacter(41) end
		end
		if sb:count() < 1 then
			do sb:appendString("(no configuration; raw passhtrough of messages)") end
		end
		do return sb:toString() end
	end
end

function jk.smtp.SMTPSender:configure(config)
	if config == nil then
		do return self end
	end
	do
		local defaultPort = "25"
		local scheme = config:getString("server_type", "smtp")
		if _g.jk.lang.String:equals("smtp+ssl", scheme) then
			defaultPort = "465"
		end
		do
			local url = _g.jk.url.URL._construct0(_g.jk.url.URL._create()):setScheme(scheme):setUsername(config:getString("server_username", nil)):setPassword(config:getString("server_password", nil)):setHost(config:getString("server_address", nil)):setPort(config:getString("server_port", defaultPort))
			do self:setServer(url:toString()) end
			do url:setPassword(nil) end
			self.serverInternal = url:toString()
			do self:setMyName(config:getString("sender_name", "SMTP")) end
			do self:setMyAddress(config:getString("sender_address", "my@address.com")) end
			do self:setThisServerAddress(config:getString("this_server_address", self.thisServerAddress)) end
			do self:setAcceptInvalidCertificate(config:getBoolean("accept_invalid_certificate", self.acceptInvalidCertificate)) end
			do return self end
		end
	end
end

function jk.smtp.SMTPSender:onSendStart()
	do self.senderCount = self.senderCount + 1 end
	do _g.jk.log.Log:debug(self.ctx, "SMTP send start: Now " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.senderCount)) .. " sender(s)") end
end

function jk.smtp.SMTPSender:onSendEnd()
	do self.senderCount = self.senderCount - 1 end
	do _g.jk.log.Log:debug(self.ctx, "SMTP send end: Now " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.senderCount)) .. " sender(s)") end
end

function jk.smtp.SMTPSender:send(msg, listener)
	if msg == nil then
		if listener ~= nil then
			do listener:onSMTPSendComplete(msg, _g.jk.smtp.SMTPClientResult:forError("No message to send", nil)) end
		end
		do return end
	end
	do
		local rcpts = msg:getAllRcpts()
		if rcpts == nil or rcpts:getSize() < 1 then
			if listener ~= nil then
				do listener:onSMTPSendComplete(msg, _g.jk.smtp.SMTPClientResult:forSuccess()) end
			end
			do return end
		end
		if self.maxSenderCount > 0 and self.senderCount > self.maxSenderCount then
			do _g.jk.log.Log:warning(self.ctx, "Reached maximum sender count " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.maxSenderCount))) end
			if listener ~= nil then
				do listener:onSMTPSendComplete(msg, _g.jk.smtp.SMTPClientResult:forError("Maximum number of SMTP senders has been exceeded.", nil)) end
			end
			do return end
		end
		if _g.jk.lang.String:isEmpty(self.myName) == false then
			do msg:setMyName(self.myName) end
		end
		if _g.jk.lang.String:isEmpty(self.myAddress) == false then
			do msg:setMyAddress(self.myAddress) end
		end
		do
			local sct = _g.jk.smtp.SMTPClientTask._construct0(_g.jk.smtp.SMTPClientTask._create())
			if _g.jk.lang.String:isEmpty(self.server) == false then
				do sct:setServer(_g.jk.url.URL:forString(self.server, false)) end
			end
			do sct:setCtx(self.ctx) end
			do sct:setServerAddress(self.thisServerAddress) end
			do sct:setMsg(msg) end
			do sct:setListener(listener) end
			do sct:setSender(self) end
			do sct:setAcceptInvalidCertificate(self.acceptInvalidCertificate) end
			if _g.jk.thread.Thread:start(sct) == nil then
				do _g.jk.log.Log:error(self.ctx, "Failed to start SMTP sender background task") end
				if listener ~= nil then
					do listener:onSMTPSendComplete(msg, _g.jk.smtp.SMTPClientResult:forError("Failed to start SMTP sender background task", nil)) end
				end
				do return end
			end
			do self:onSendStart() end
		end
	end
end

function jk.smtp.SMTPSender:sendSync(msg)
	if not (msg ~= nil) then
		do return _g.jk.smtp.SMTPClientResult:forError("No message was given to SMTPClientTask", msg) end
	end
	if self.maxSenderCount > 0 and self.senderCount > self.maxSenderCount then
		do _g.jk.log.Log:warning(self.ctx, "Reached maximum sender count " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.maxSenderCount))) end
		do return _g.jk.smtp.SMTPClientResult:forError("Maximum number of SMTP senders has been exceeded.", nil) end
	end
	if _g.jk.lang.String:isNotEmpty(self.myName) then
		do msg:setMyName(self.myName) end
	end
	if _g.jk.lang.String:isNotEmpty(self.myAddress) then
		do msg:setMyAddress(self.myAddress) end
	end
	do
		local sct = _g.jk.smtp.SMTPClientTask._construct0(_g.jk.smtp.SMTPClientTask._create())
		if _g.jk.lang.String:isEmpty(self.server) == false then
			do sct:setServer(_g.jk.url.URL:forString(self.server, false)) end
		end
		do self:onSendStart() end
		do
			local r = _g.jk.smtp.SMTPClient:sendMessage(msg, _g.jk.url.URL:forString(self.server, false), self.thisServerAddress, self.ctx, self.acceptInvalidCertificate)
			if not (r ~= nil) then
				r = _g.jk.smtp.SMTPClientResult:forError("Unknown error", msg)
			end
			do self:onSendEnd() end
			do return r end
		end
	end
end

function jk.smtp.SMTPSender:getThisServerAddress()
	do return self.thisServerAddress end
end

function jk.smtp.SMTPSender:setThisServerAddress(v)
	self.thisServerAddress = v
	do return self end
end

function jk.smtp.SMTPSender:getServer()
	do return self.server end
end

function jk.smtp.SMTPSender:setServer(v)
	self.server = v
	do return self end
end

function jk.smtp.SMTPSender:getMyName()
	do return self.myName end
end

function jk.smtp.SMTPSender:setMyName(v)
	self.myName = v
	do return self end
end

function jk.smtp.SMTPSender:getMyAddress()
	do return self.myAddress end
end

function jk.smtp.SMTPSender:setMyAddress(v)
	self.myAddress = v
	do return self end
end

function jk.smtp.SMTPSender:getCtx()
	do return self.ctx end
end

function jk.smtp.SMTPSender:setCtx(v)
	self.ctx = v
	do return self end
end

function jk.smtp.SMTPSender:getMaxSenderCount()
	do return self.maxSenderCount end
end

function jk.smtp.SMTPSender:setMaxSenderCount(v)
	self.maxSenderCount = v
	do return self end
end

function jk.smtp.SMTPSender:getAcceptInvalidCertificate()
	do return self.acceptInvalidCertificate end
end

function jk.smtp.SMTPSender:setAcceptInvalidCertificate(v)
	self.acceptInvalidCertificate = v
	do return self end
end

jk.smtp.SMTPMessage = {}
jk.smtp.SMTPMessage.__index = jk.smtp.SMTPMessage
_vm:set_metatable(jk.smtp.SMTPMessage, {})

jk.smtp.SMTPMessage.counter = 0

function jk.smtp.SMTPMessage._create()
	local v = _vm:set_metatable({}, jk.smtp.SMTPMessage)
	return v
end

function jk.smtp.SMTPMessage:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.smtp.SMTPMessage'
	self['_isType.jk.smtp.SMTPMessage'] = true
	self.rcptsTo = nil
	self.rcptsCC = nil
	self.rcptsBCC = nil
	self.replyTo = nil
	self.subject = nil
	self.contentType = nil
	self.text = nil
	self.myName = nil
	self.myAddress = nil
	self.messageBody = nil
	self.messageID = nil
	self.date = nil
	self.excludeAddresses = nil
end

function jk.smtp.SMTPMessage:_construct0()
	jk.smtp.SMTPMessage._init(self)
	self.date = _g.jk.time.format.VerboseDateTimeString:forUTCNow()
	return self
end

function jk.smtp.SMTPMessage:onChanged()
	self.messageBody = nil
end

function jk.smtp.SMTPMessage:generateMessageID(host)
	self.messageID = _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(_g.jk.time.SystemClock:asSeconds())) .. "-" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(_g.jk.random.Random._construct0(_g.jk.random.Random._create()):nextInt2(1000000))) .. "-" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(_g.jk.smtp.SMTPMessage.counter)) .. "@" .. _g.jk.lang.String:safeString(host)
	do _g.jk.smtp.SMTPMessage.counter = _g.jk.smtp.SMTPMessage.counter + 1 end
	do self:onChanged() end
	do return self end
end

function jk.smtp.SMTPMessage:getDate()
	do return self.date end
end

function jk.smtp.SMTPMessage:getReplyTo()
	do return self.replyTo end
end

function jk.smtp.SMTPMessage:setDate(date)
	self.date = date
	do self:onChanged() end
	do return self end
end

function jk.smtp.SMTPMessage:setMessageID(id)
	self.messageID = id
	do self:onChanged() end
	do return self end
end

function jk.smtp.SMTPMessage:setReplyTo(v)
	self.replyTo = v
	do self:onChanged() end
	do return self end
end

function jk.smtp.SMTPMessage:getMessageID()
	do return self.messageID end
end

function jk.smtp.SMTPMessage:isExcludedAddress(add)
	if self.excludeAddresses == nil or self.excludeAddresses:getSize() < 1 then
		do return false end
	end
	do
		local array = self.excludeAddresses:toVector()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local ea = (function(o)
						if (_vm:get_variable_type(o) == 'string') then
							do return o end
						end
						do return nil end
					end)(array[n + 1])
					if ea ~= nil then
						if _g.jk.lang.String:equals(ea, add) then
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

function jk.smtp.SMTPMessage:getAllRcpts()
	local rcpts = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
	if self.rcptsTo ~= nil then
		local array = self.rcptsTo:toVector()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local r = (function(o)
						if (_vm:get_variable_type(o) == 'string') then
							do return o end
						end
						do return nil end
					end)(array[n + 1])
					if r ~= nil then
						if self:isExcludedAddress(r) then
							goto _continue1
						end
						do rcpts:appendObject(r) end
					end
					::_continue1::
					do n = n + 1 end
				end
			end
		end
	end
	if self.rcptsCC ~= nil then
		local array2 = self.rcptsCC:toVector()
		if array2 ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(array2)
			do
				n2 = 0
				while n2 < m2 do
					local r = (function(o)
						if (_vm:get_variable_type(o) == 'string') then
							do return o end
						end
						do return nil end
					end)(array2[n2 + 1])
					if r ~= nil then
						if self:isExcludedAddress(r) then
							goto _continue2
						end
						do rcpts:appendObject(r) end
					end
					::_continue2::
					do n2 = n2 + 1 end
				end
			end
		end
	end
	if self.rcptsBCC ~= nil then
		local array3 = self.rcptsBCC:toVector()
		if array3 ~= nil then
			local n3 = 0
			local m3 = _g.jk.lang.Vector:getSize(array3)
			do
				n3 = 0
				while n3 < m3 do
					local r = (function(o)
						if (_vm:get_variable_type(o) == 'string') then
							do return o end
						end
						do return nil end
					end)(array3[n3 + 1])
					if r ~= nil then
						if self:isExcludedAddress(r) then
							goto _continue3
						end
						do rcpts:appendObject(r) end
					end
					::_continue3::
					do n3 = n3 + 1 end
				end
			end
		end
	end
	do return rcpts end
end

function jk.smtp.SMTPMessage:getRcptsTo()
	do return self.rcptsTo end
end

function jk.smtp.SMTPMessage:getRcptsCC()
	do return self.rcptsCC end
end

function jk.smtp.SMTPMessage:getRcptsBCC()
	do return self.rcptsBCC end
end

function jk.smtp.SMTPMessage:getSubject()
	do return self.subject end
end

function jk.smtp.SMTPMessage:getContentType()
	do return self.contentType end
end

function jk.smtp.SMTPMessage:getText()
	do return self.text end
end

function jk.smtp.SMTPMessage:getMyName()
	do return self.myName end
end

function jk.smtp.SMTPMessage:getMyAddress()
	do return self.myAddress end
end

function jk.smtp.SMTPMessage:setSubject(s)
	self.subject = s
	do self:onChanged() end
	do return self end
end

function jk.smtp.SMTPMessage:setContentType(c)
	self.contentType = c
	do self:onChanged() end
	do return self end
end

function jk.smtp.SMTPMessage:setText(t)
	self.text = t
	do self:onChanged() end
	do return self end
end

function jk.smtp.SMTPMessage:setMyName(n)
	self.myName = n
	do self:onChanged() end
	do return self end
end

function jk.smtp.SMTPMessage:setMyAddress(a)
	self.myAddress = a
	do self:onChanged() end
	do return self end
end

function jk.smtp.SMTPMessage:setTo(address)
	self.rcptsTo = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
	do self.rcptsTo:appendObject(address) end
	do self:onChanged() end
	do return self end
end

function jk.smtp.SMTPMessage:addTo(address)
	if _g.jk.lang.String:isNotEmpty(address) then
		if not (self.rcptsTo ~= nil) then
			self.rcptsTo = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
		end
		do self.rcptsTo:appendObject(address) end
	end
	do self:onChanged() end
	do return self end
end

function jk.smtp.SMTPMessage:addCC(address)
	if _g.jk.lang.String:isNotEmpty(address) then
		if not (self.rcptsCC ~= nil) then
			self.rcptsCC = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
		end
		do self.rcptsCC:appendObject(address) end
	end
	do self:onChanged() end
	do return self end
end

function jk.smtp.SMTPMessage:addBCC(address)
	if _g.jk.lang.String:isNotEmpty(address) then
		if not (self.rcptsBCC ~= nil) then
			self.rcptsBCC = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
		end
		do self.rcptsBCC:appendObject(address) end
	end
	do self:onChanged() end
	do return self end
end

function jk.smtp.SMTPMessage:setRecipients(to, cc, bcc)
	self.rcptsTo = to
	self.rcptsCC = cc
	self.rcptsBCC = bcc
	do self:onChanged() end
	do return self end
end

function jk.smtp.SMTPMessage:getSizeBytes()
	local b = self:getMessageBody()
	if not (b ~= nil) then
		do return 0 end
	end
	do
		local bb = _g.jk.lang.String:toUTF8Buffer(b)
		if not (bb ~= nil) then
			do return 0 end
		end
		do return _g.jk.lang.Buffer:getSize(bb) end
	end
end

function jk.smtp.SMTPMessage:getMessageBody()
	if self.messageBody ~= nil then
		do return self.messageBody end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString("From: ") end
		do sb:appendString(self.myName) end
		do sb:appendString(" <") end
		do sb:appendString(self.myAddress) end
		if _g.jk.lang.String:isNotEmpty(self.replyTo) then
			do sb:appendString(">\r\nReply-To: ") end
			do sb:appendString(self.myName) end
			do sb:appendString(" <") end
			do sb:appendString(self.replyTo) end
		end
		do sb:appendString(">\r\nTo: ") end
		do
			local first = true
			if self.rcptsTo ~= nil then
				local array = self.rcptsTo:toVector()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local to = (function(o)
								if (_vm:get_variable_type(o) == 'string') then
									do return o end
								end
								do return nil end
							end)(array[n + 1])
							if to ~= nil then
								if not first then
									do sb:appendString(", ") end
								end
								do sb:appendString(to) end
								first = false
							end
							do n = n + 1 end
						end
					end
				end
			end
			do sb:appendString("\r\nCc: ") end
			first = true
			if self.rcptsCC ~= nil then
				local array2 = self.rcptsCC:toVector()
				if array2 ~= nil then
					local n2 = 0
					local m2 = _g.jk.lang.Vector:getSize(array2)
					do
						n2 = 0
						while n2 < m2 do
							local to = (function(o)
								if (_vm:get_variable_type(o) == 'string') then
									do return o end
								end
								do return nil end
							end)(array2[n2 + 1])
							if to ~= nil then
								if not first then
									do sb:appendString(", ") end
								end
								do sb:appendString(to) end
								first = false
							end
							do n2 = n2 + 1 end
						end
					end
				end
			end
			do sb:appendString("\r\nSubject: ") end
			do sb:appendString(self.subject) end
			do sb:appendString("\r\nContent-Type: ") end
			do sb:appendString(self.contentType) end
			do sb:appendString("\r\nDate: ") end
			do sb:appendString(self.date) end
			if _g.jk.lang.String:isNotEmpty(self.messageID) then
				do sb:appendString("\r\nMessage-ID: <") end
				do sb:appendString(self.messageID) end
				do sb:appendString(">") end
			end
			do sb:appendString("\r\n\r\n") end
			do sb:appendString(self.text) end
			self.messageBody = sb:toString()
			do return self.messageBody end
		end
	end
end

function jk.smtp.SMTPMessage:getExcludeAddresses()
	do return self.excludeAddresses end
end

function jk.smtp.SMTPMessage:setExcludeAddresses(v)
	self.excludeAddresses = v
	do return self end
end

jk.smtp.SMTPClientResult = {}
jk.smtp.SMTPClientResult.__index = jk.smtp.SMTPClientResult
_vm:set_metatable(jk.smtp.SMTPClientResult, {})

function jk.smtp.SMTPClientResult._create()
	local v = _vm:set_metatable({}, jk.smtp.SMTPClientResult)
	return v
end

function jk.smtp.SMTPClientResult:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.smtp.SMTPClientResult'
	self['_isType.jk.smtp.SMTPClientResult'] = true
	self.message = nil
	self.transactions = nil
end

function jk.smtp.SMTPClientResult:_construct0()
	jk.smtp.SMTPClientResult._init(self)
	return self
end

function jk.smtp.SMTPClientResult:forSuccess()
	do return _g.jk.smtp.SMTPClientResult._construct0(_g.jk.smtp.SMTPClientResult._create()) end
end

function jk.smtp.SMTPClientResult:forMessage(msg)
	do return _g.jk.smtp.SMTPClientResult._construct0(_g.jk.smtp.SMTPClientResult._create()):setMessage(msg) end
end

function jk.smtp.SMTPClientResult:forError(error, msg)
	do return _g.jk.smtp.SMTPClientResult._construct0(_g.jk.smtp.SMTPClientResult._create()):setMessage(msg):addTransaction(_g.jk.smtp.SMTPClientTransactionResult:forError(error)) end
end

function jk.smtp.SMTPClientResult:getStatus()
	if not (self.transactions ~= nil) then
		do return false end
	end
	do
		local array = self.transactions:toVector()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local rr = _vm:to_table_with_key(array[n + 1], '_isType.jk.smtp.SMTPClientTransactionResult')
					if rr ~= nil then
						if rr:getStatus() == false then
							do return false end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do return true end
	end
end

function jk.smtp.SMTPClientResult:addTransaction(r)
	if r == nil then
		do return self end
	end
	if self.transactions == nil then
		self.transactions = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
	end
	do self.transactions:appendObject(r) end
	do return self end
end

function jk.smtp.SMTPClientResult:getMessage()
	do return self.message end
end

function jk.smtp.SMTPClientResult:setMessage(v)
	self.message = v
	do return self end
end

function jk.smtp.SMTPClientResult:getTransactions()
	do return self.transactions end
end

function jk.smtp.SMTPClientResult:setTransactions(v)
	self.transactions = v
	do return self end
end

jk.smtp.SMTPClientTransactionResult = {}
jk.smtp.SMTPClientTransactionResult.__index = jk.smtp.SMTPClientTransactionResult
_vm:set_metatable(jk.smtp.SMTPClientTransactionResult, {})

function jk.smtp.SMTPClientTransactionResult._create()
	local v = _vm:set_metatable({}, jk.smtp.SMTPClientTransactionResult)
	return v
end

function jk.smtp.SMTPClientTransactionResult:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.smtp.SMTPClientTransactionResult'
	self['_isType.jk.smtp.SMTPClientTransactionResult'] = true
	self.status = false
	self.errorMessage = nil
	self.domain = nil
	self.server = nil
	self.recipients = nil
end

function jk.smtp.SMTPClientTransactionResult:_construct0()
	jk.smtp.SMTPClientTransactionResult._init(self)
	return self
end

function jk.smtp.SMTPClientTransactionResult:forError(error)
	do return _g.jk.smtp.SMTPClientTransactionResult._construct0(_g.jk.smtp.SMTPClientTransactionResult._create()):setStatus(false):setErrorMessage(error) end
end

function jk.smtp.SMTPClientTransactionResult:forNetworkError()
	do return _g.jk.smtp.SMTPClientTransactionResult:forError("Network communications error") end
end

function jk.smtp.SMTPClientTransactionResult:forSuccess()
	do return _g.jk.smtp.SMTPClientTransactionResult._construct0(_g.jk.smtp.SMTPClientTransactionResult._create()):setStatus(true) end
end

function jk.smtp.SMTPClientTransactionResult:getStatus()
	do return self.status end
end

function jk.smtp.SMTPClientTransactionResult:setStatus(v)
	self.status = v
	do return self end
end

function jk.smtp.SMTPClientTransactionResult:getErrorMessage()
	do return self.errorMessage end
end

function jk.smtp.SMTPClientTransactionResult:setErrorMessage(v)
	self.errorMessage = v
	do return self end
end

function jk.smtp.SMTPClientTransactionResult:getDomain()
	do return self.domain end
end

function jk.smtp.SMTPClientTransactionResult:setDomain(v)
	self.domain = v
	do return self end
end

function jk.smtp.SMTPClientTransactionResult:getServer()
	do return self.server end
end

function jk.smtp.SMTPClientTransactionResult:setServer(v)
	self.server = v
	do return self end
end

function jk.smtp.SMTPClientTransactionResult:getRecipients()
	do return self.recipients end
end

function jk.smtp.SMTPClientTransactionResult:setRecipients(v)
	self.recipients = v
	do return self end
end

jk.smtp.SMTPMultipartMessage = _g.jk.smtp.SMTPMessage._create()
jk.smtp.SMTPMultipartMessage.__index = jk.smtp.SMTPMultipartMessage
_vm:set_metatable(jk.smtp.SMTPMultipartMessage, {
	__index = _g.jk.smtp.SMTPMessage
})

function jk.smtp.SMTPMultipartMessage._create()
	local v = _vm:set_metatable({}, jk.smtp.SMTPMultipartMessage)
	return v
end

function jk.smtp.SMTPMultipartMessage:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.smtp.SMTPMultipartMessage'
	self['_isType.jk.smtp.SMTPMultipartMessage'] = true
	self.attachments = nil
	self.message = nil
end

function jk.smtp.SMTPMultipartMessage:_construct0()
	jk.smtp.SMTPMultipartMessage._init(self)
	do _g.jk.smtp.SMTPMessage._construct0(self) end
	do self:setContentType("multipart/mixed") end
	return self
end

function jk.smtp.SMTPMultipartMessage:getMessageBody()
	if self.attachments == nil or self.attachments:getSize() < 1 then
		do return nil end
	end
	if _g.jk.lang.String:isEmpty(self.message) == false then
		do return self.message end
	end
	do
		local subject = self:getSubject()
		local date = self:getDate()
		local myName = self:getMyName()
		local myAddress = self:getMyAddress()
		local text = self:getText()
		local recipientsTo = self:getRcptsTo()
		local recipientsCC = self:getRcptsCC()
		local messageID = self:getMessageID()
		local replyTo = self:getReplyTo()
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString("From: ") end
		do sb:appendString(myName) end
		do sb:appendString(" <") end
		do sb:appendString(myAddress) end
		if _g.jk.lang.String:isEmpty(replyTo) == false then
			do sb:appendString(">\r\nReply-To: ") end
			do sb:appendString(myName) end
			do sb:appendString(" <") end
			do sb:appendString(replyTo) end
		end
		do sb:appendString(">\r\nTo: ") end
		do
			local first = true
			if recipientsTo ~= nil then
				local array = recipientsTo:toVector()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local to = (function(o)
								if (_vm:get_variable_type(o) == 'string') then
									do return o end
								end
								do return nil end
							end)(array[n + 1])
							if to ~= nil then
								if first == false then
									do sb:appendString(", ") end
								end
								do sb:appendString(to) end
								first = false
							end
							do n = n + 1 end
						end
					end
				end
			end
			do sb:appendString("\r\nCc: ") end
			first = true
			if recipientsCC ~= nil then
				local array2 = recipientsCC:toVector()
				if array2 ~= nil then
					local n2 = 0
					local m2 = _g.jk.lang.Vector:getSize(array2)
					do
						n2 = 0
						while n2 < m2 do
							local to = (function(o)
								if (_vm:get_variable_type(o) == 'string') then
									do return o end
								end
								do return nil end
							end)(array2[n2 + 1])
							if to ~= nil then
								if first == false then
									do sb:appendString(", ") end
								end
								do sb:appendString(to) end
								first = false
							end
							do n2 = n2 + 1 end
						end
					end
				end
			end
			do sb:appendString("\r\nSubject: ") end
			do sb:appendString(subject) end
			do sb:appendString("\r\nMIME-Version: 1.0") end
			do sb:appendString("\r\nContent-Type: ") end
			do sb:appendString("multipart/mixed") end
			do sb:appendString("; boundary=\"XXXXboundarytext\"") end
			do sb:appendString("\r\nDate: ") end
			do sb:appendString(date) end
			do sb:appendString("\r\nMessage-ID: <") end
			do sb:appendString(messageID) end
			do sb:appendString(">\r\n\r\n") end
			do sb:appendString("This is a multipart message in MIME format.") end
			do sb:appendString("\r\n") end
			do sb:appendString("\r\n--XXXXboundarytext") end
			do sb:appendString("\r\nContent-Type: text/plain") end
			do sb:appendString("\r\n") end
			do sb:appendString("\r\n") end
			do sb:appendString(text) end
			do
				local array3 = self.attachments:toVector()
				if array3 ~= nil then
					local n3 = 0
					local m3 = _g.jk.lang.Vector:getSize(array3)
					do
						n3 = 0
						while n3 < m3 do
							local file = _vm:to_table_with_key(array3[n3 + 1], '_isType.jk.fs.File')
							if file ~= nil then
								do sb:appendString("\r\n--XXXXboundarytext") end
								do sb:appendString("\r\nContent-Type: ") end
								do
									local contentType = _g.jk.mime.MimeTypeRegistry:getSharedInstance():getTypeForFile(file)
									if _g.jk.lang.String:isEmpty(contentType) == false and _g.jk.lang.String:getIndexOfString(contentType, "text", 0) == 0 then
										do sb:appendString(contentType) end
										do sb:appendString("\r\nContent-Disposition: attachment; filename=") end
										do sb:appendString(file:getBasename()) end
										do sb:appendString("\r\n") end
										do sb:appendString("\r\n") end
										do sb:appendString(file:getContentsUTF8()) end
									else
										do sb:appendString(contentType) end
										do sb:appendString("\r\nContent-Transfer-Encoding: Base64") end
										do sb:appendString("\r\nContent-Disposition: attachment filename=") end
										do sb:appendString(file:getBasename()) end
										do sb:appendString("\r\n") end
										do sb:appendString("\r\n") end
										do sb:appendString(_g.jk.base64.Base64Encoder:encode(file:getContentsBuffer())) end
									end
								end
							end
							do n3 = n3 + 1 end
						end
					end
				end
				do sb:appendString("\r\n") end
				do sb:appendString("\r\n--XXXXboundarytext--") end
				do return (function()
					self.message = sb:toString()
					do return self.message end
				end)() end
			end
		end
	end
end

function jk.smtp.SMTPMultipartMessage:getAttachments()
	do return self.attachments end
end

function jk.smtp.SMTPMultipartMessage:setAttachments(v)
	self.attachments = v
	do return self end
end

jk.smtp.SMTPClientTaskResult = {}
jk.smtp.SMTPClientTaskResult.__index = jk.smtp.SMTPClientTaskResult
_vm:set_metatable(jk.smtp.SMTPClientTaskResult, {})

function jk.smtp.SMTPClientTaskResult._create()
	local v = _vm:set_metatable({}, jk.smtp.SMTPClientTaskResult)
	return v
end

function jk.smtp.SMTPClientTaskResult:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.smtp.SMTPClientTaskResult'
	self['_isType.jk.smtp.SMTPClientTaskResult'] = true
	self.message = nil
	self.status = false
end

function jk.smtp.SMTPClientTaskResult:_construct0()
	jk.smtp.SMTPClientTaskResult._init(self)
	return self
end

function jk.smtp.SMTPClientTaskResult:getMessage()
	do return self.message end
end

function jk.smtp.SMTPClientTaskResult:setMessage(v)
	self.message = v
	do return self end
end

function jk.smtp.SMTPClientTaskResult:getStatus()
	do return self.status end
end

function jk.smtp.SMTPClientTaskResult:setStatus(v)
	self.status = v
	do return self end
end

jk.smtp.SMTPClientTask = {}
jk.smtp.SMTPClientTask.__index = jk.smtp.SMTPClientTask
_vm:set_metatable(jk.smtp.SMTPClientTask, {})

function jk.smtp.SMTPClientTask._create()
	local v = _vm:set_metatable({}, jk.smtp.SMTPClientTask)
	return v
end

function jk.smtp.SMTPClientTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.smtp.SMTPClientTask'
	self['_isType.jk.smtp.SMTPClientTask'] = true
	self['_isType.jk.lang.Runnable'] = true
	self.ctx = nil
	self.server = nil
	self.msg = nil
	self.serverAddress = nil
	self.listener = nil
	self.sender = nil
	self.acceptInvalidCertificate = false
end

function jk.smtp.SMTPClientTask:_construct0()
	jk.smtp.SMTPClientTask._init(self)
	return self
end

function jk.smtp.SMTPClientTask:run()
	local r = nil
	if self.msg == nil then
		r = _g.jk.smtp.SMTPClientResult:forError("No message was given to SMTPClientTask", self.msg)
	else
		r = _g.jk.smtp.SMTPClient:sendMessage(self.msg, self.server, self.serverAddress, self.ctx, self.acceptInvalidCertificate)
	end
	if r == nil then
		r = _g.jk.smtp.SMTPClientResult:forError("Unknown error", self.msg)
	end
	if self.sender ~= nil then
		do self.sender:onSendEnd() end
	end
	if self.listener == nil then
		do return end
	end
	do self.listener:onSMTPSendComplete(r:getMessage(), r) end
end

function jk.smtp.SMTPClientTask:getCtx()
	do return self.ctx end
end

function jk.smtp.SMTPClientTask:setCtx(v)
	self.ctx = v
	do return self end
end

function jk.smtp.SMTPClientTask:getServer()
	do return self.server end
end

function jk.smtp.SMTPClientTask:setServer(v)
	self.server = v
	do return self end
end

function jk.smtp.SMTPClientTask:getMsg()
	do return self.msg end
end

function jk.smtp.SMTPClientTask:setMsg(v)
	self.msg = v
	do return self end
end

function jk.smtp.SMTPClientTask:getServerAddress()
	do return self.serverAddress end
end

function jk.smtp.SMTPClientTask:setServerAddress(v)
	self.serverAddress = v
	do return self end
end

function jk.smtp.SMTPClientTask:getListener()
	do return self.listener end
end

function jk.smtp.SMTPClientTask:setListener(v)
	self.listener = v
	do return self end
end

function jk.smtp.SMTPClientTask:getSender()
	do return self.sender end
end

function jk.smtp.SMTPClientTask:setSender(v)
	self.sender = v
	do return self end
end

function jk.smtp.SMTPClientTask:getAcceptInvalidCertificate()
	do return self.acceptInvalidCertificate end
end

function jk.smtp.SMTPClientTask:setAcceptInvalidCertificate(v)
	self.acceptInvalidCertificate = v
	do return self end
end

jk.smtp.SMTPClient = {}
jk.smtp.SMTPClient.__index = jk.smtp.SMTPClient
_vm:set_metatable(jk.smtp.SMTPClient, {})

function jk.smtp.SMTPClient._create()
	local v = _vm:set_metatable({}, jk.smtp.SMTPClient)
	return v
end

function jk.smtp.SMTPClient:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.smtp.SMTPClient'
	self['_isType.jk.smtp.SMTPClient'] = true
end

function jk.smtp.SMTPClient:_construct0()
	jk.smtp.SMTPClient._init(self)
	return self
end

function jk.smtp.SMTPClient:connect(server, port, ctx)
	if _g.jk.lang.String:isEmpty(server) or port < 1 then
		do return nil end
	end
	do
		local address = server
		local dns = _g.jk.dns.DNSResolver:create()
		if dns ~= nil then
			address = dns:getIPAddress(server, ctx)
			if _g.jk.lang.String:isEmpty(address) then
				do _g.jk.log.Log:error(ctx, "SMTPClient: Could not resolve SMTP server address: `" .. _g.jk.lang.String:safeString(server) .. "'") end
				do return nil end
			end
		end
		do _g.jk.log.Log:debug(ctx, "SMTPClient: Connecting to SMTP server `" .. _g.jk.lang.String:safeString(address) .. ":" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(port)) .. "' ..") end
		do
			local v = _g.jk.socket.TCPSocket:createAndConnect(address, port)
			if v ~= nil then
				do _g.jk.log.Log:debug(ctx, "SMTPClient: Connected to SMTP server `" .. _g.jk.lang.String:safeString(address) .. ":" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(port)) .. "' ..") end
			else
				do _g.jk.log.Log:error(ctx, "SMTPClient: FAILED connection to SMTP server `" .. _g.jk.lang.String:safeString(address) .. ":" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(port)) .. "' ..") end
			end
			do return v end
		end
	end
end

function jk.smtp.SMTPClient:writeLine(ops, str, ctx)
	local v = ops:print(_g.jk.lang.String:safeString(str) .. "\r\n")
	if v == false then
		do _g.jk.log.Log:error(ctx, "SMTPClient: Failed to write to server: `" .. _g.jk.lang.String:safeString(str) .. "'") end
	end
	do return v end
end

function jk.smtp.SMTPClient:communicate(ins, expectCode, ctx)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local line = ins:readLine()
	if _g.jk.lang.String:isEmpty(line) == false then
		do sb:appendString(line) end
	end
	while _g.jk.lang.String:isEmpty(line) == false and _g.jk.lang.String:getChar(line, 3) == 45 do
		line = ins:readLine()
		if _g.jk.lang.String:isEmpty(line) == false then
			do sb:appendString(line) end
		end
	end
	if _g.jk.lang.String:isEmpty(line) == false and _g.jk.lang.String:getChar(line, 3) == 32 then
		if _g.jk.lang.String:isEmpty(expectCode) then
			do return nil end
		end
		do
			local rc = _g.jk.lang.String:getSubString(line, 0, 3)
			local array = _g.jk.lang.String:split(expectCode, 124, 0)
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local cc = array[n + 1]
						if cc ~= nil then
							if _g.jk.lang.String:equals(cc, rc) then
								do return nil end
							end
						end
						do n = n + 1 end
					end
				end
			end
		end
	end
	do
		local v = sb:toString()
		if _g.jk.lang.String:isEmpty(v) then
			v = "XXX Unknown SMTP server error response"
		end
		do _g.jk.log.Log:error(ctx, "SMTPClient: Server responded with error status: `" .. _g.jk.lang.String:safeString(v) .. "'") end
		do return v end
	end
end

function jk.smtp.SMTPClient:encode(enc)
	if _g.jk.lang.String:isEmpty(enc) then
		do return nil end
	end
	do return _g.jk.base64.Base64Encoder:encode(_g.jk.lang.String:toUTF8Buffer(enc)) end
end

function jk.smtp.SMTPClient:rcptAsEmailAddress(ss)
	if _g.jk.lang.String:isEmpty(ss) then
		do return ss end
	end
	do
		local b = _g.jk.lang.String:getIndexOfCharacter(ss, 60, 0)
		if b < 0 then
			do return ss end
		end
		do
			local e = _g.jk.lang.String:getIndexOfCharacter(ss, 62, 0)
			if e < 0 then
				do return ss end
			end
			do return _g.jk.lang.String:getSubString(ss, b + 1, e - b - 1) end
		end
	end
end

function jk.smtp.SMTPClient:resolveMXServerForDomain(domain)
	local dns = _g.jk.dns.DNSResolver:instance()
	if not (dns ~= nil) then
		do return nil end
	end
	do
		local rcs = dns:getNSRecords(domain, "MX", nil)
		if rcs == nil or rcs:getSize() < 1 then
			do return nil end
		end
		do
			local v = nil
			local pr = 0
			local array = rcs:toVector()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local mx = _vm:to_table_with_key(array[n + 1], '_isType.jk.dns.DNSRecordMX')
						if mx ~= nil then
							local p = mx:getPriority()
							if v == nil or p < pr then
								pr = p
								v = mx:getAddress()
							end
						end
						do n = n + 1 end
					end
				end
			end
			do return v end
		end
	end
end

function jk.smtp.SMTPClient:sendMessage(msg, server, serverName, ctx, acceptInvalidCertificate)
	if msg == nil then
		do return _g.jk.smtp.SMTPClientResult:forMessage(msg):addTransaction(_g.jk.smtp.SMTPClientTransactionResult:forError("No message")) end
	end
	do
		local rcpts = msg:getAllRcpts()
		if server ~= nil then
			local t = _g.jk.smtp.SMTPClient:executeTransaction(msg, server, rcpts, serverName, ctx, acceptInvalidCertificate)
			if t ~= nil then
				do t:setServer(server:getHost()) end
				do t:setRecipients(rcpts) end
			end
			do return _g.jk.smtp.SMTPClientResult:forMessage(msg):addTransaction(t) end
		end
		do
			local r = _g.jk.smtp.SMTPClientResult:forMessage(msg)
			local servers = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
			local array = rcpts:toVector()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local rcpt = (function(o)
							if (_vm:get_variable_type(o) == 'string') then
								do return o end
							end
							do return nil end
						end)(array[n + 1])
						if rcpt ~= nil then
							local em = _g.jk.smtp.SMTPClient:rcptAsEmailAddress(rcpt)
							if _g.jk.lang.String:isEmpty(em) then
								do r:addTransaction(_g.jk.smtp.SMTPClientTransactionResult:forError("Invalid recipient address: `" .. _g.jk.lang.String:safeString(rcpt) .. "'")) end
								do break end
							end
							do
								local at = _g.jk.lang.String:getIndexOfCharacter(em, 64, 0)
								if at < 0 then
									do r:addTransaction(_g.jk.smtp.SMTPClientTransactionResult:forError("Invalid recipient address: `" .. _g.jk.lang.String:safeString(rcpt) .. "'")) end
									do break end
								end
								do
									local sa = _g.jk.lang.String:getEndOfString(em, at + 1)
									if _g.jk.lang.String:isEmpty(sa) then
										do r:addTransaction(_g.jk.smtp.SMTPClientTransactionResult:forError("Invalid recipient address: `" .. _g.jk.lang.String:safeString(rcpt) .. "'")) end
										do break end
									end
									do
										local ss = _vm:to_table_with_key(servers:get(sa), '_isType.jk.lang.DynamicVector')
										if ss == nil then
											ss = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
											do servers:setObject(sa, ss) end
										end
										do ss:appendObject(rcpt) end
									end
								end
							end
						end
						do n = n + 1 end
					end
				end
			end
			do
				local itr = servers:iterateKeys()
				while itr ~= nil do
					local domain = itr:next()
					if _g.jk.lang.String:isEmpty(domain) then
						do break end
					end
					do
						local ds = _g.jk.smtp.SMTPClient:resolveMXServerForDomain(domain)
						if _g.jk.lang.String:isEmpty(ds) then
							do r:addTransaction(_g.jk.smtp.SMTPClientTransactionResult:forError("Unable to determine mail server for `" .. _g.jk.lang.String:safeString(domain) .. "'")) end
						else
							do _g.jk.log.Log:debug(ctx, "SMTP server for domain `" .. _g.jk.lang.String:safeString(domain) .. "': `" .. _g.jk.lang.String:safeString(ds) .. "'") end
							do
								local trcpts = _vm:to_table_with_key(servers:get(domain), '_isType.jk.lang.DynamicVector')
								local t = _g.jk.smtp.SMTPClient:executeTransaction(msg, _g.jk.url.URL:forString("smtp://" .. _g.jk.lang.String:safeString(ds), false), trcpts, serverName, ctx, acceptInvalidCertificate)
								if t ~= nil then
									do t:setDomain(domain) end
									do t:setServer(ds) end
									do t:setRecipients(trcpts) end
								end
								do r:addTransaction(t) end
							end
						end
					end
				end
				do
					local vt = r:getTransactions()
					if vt == nil or vt:getSize() < 1 then
						do r:addTransaction(_g.jk.smtp.SMTPClientTransactionResult:forError("Unknown error in SMTPClient")) end
					end
					do return r end
				end
			end
		end
	end
end

function jk.smtp.SMTPClient:executeTransaction(msg, server, rcpts, serverName, ctx, acceptInvalidCertificate)
	local url = server
	if url == nil then
		do return _g.jk.smtp.SMTPClientTransactionResult:forError("No server URL") end
	end
	do
		local socket = nil
		local scheme = url:getScheme()
		local host = url:getHost()
		local port = url:getPortInt()
		do
			local n = 0
			while n < 3 do
				if _g.jk.lang.String:equals("smtp", scheme) or _g.jk.lang.String:equals("smtp+tls", scheme) then
					if port < 1 then
						port = 25
					end
					socket = _g.jk.smtp.SMTPClient:connect(host, port, ctx)
				elseif _g.jk.lang.String:equals("smtp+ssl", scheme) then
					if port < 1 then
						port = 465
					end
					do
						local ts = _g.jk.smtp.SMTPClient:connect(host, port, ctx)
						if ts ~= nil then
							socket = _g.jk.socket.ssl.SSLSocket:forClient(ts, host, ctx, acceptInvalidCertificate, nil)
							if socket == nil then
								do return _g.jk.smtp.SMTPClientTransactionResult:forError("Failed to start SSL") end
							end
						end
					end
				else
					do return _g.jk.smtp.SMTPClientTransactionResult:forError("SMTPClient: Unknown SMTP URI scheme `" .. _g.jk.lang.String:safeString(scheme) .. "'") end
				end
				if socket ~= nil then
					do break end
				end
				do _g.jk.log.Log:debug(ctx, "Failed to connect to SMTP server `" .. _g.jk.lang.String:safeString(host) .. ":" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(port)) .. "'. Waiting to retry ..") end
				do _g.jk.thread.CurrentThread:sleepSeconds(1) end
				do n = n + 1 end
			end
		end
		if socket == nil then
			do return _g.jk.smtp.SMTPClientTransactionResult:forError("Unable to connect to SMTP server `" .. _g.jk.lang.String:safeString(host) .. ":" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(port)) .. "'") end
		end
		do
			local ops = _g.jk.io.PrintWriterWrapper:forWriter(socket)
			local ins = _g.jk.io.PrintReader:forReader(socket)
			if ops == nil or ins == nil then
				do return _g.jk.smtp.SMTPClientTransactionResult:forError("Unable to establish SMTP I/O streams") end
			end
			do
				local err = nil
				if not ((function()
					err = _g.jk.smtp.SMTPClient:communicate(ins, "220", ctx)
					do return err end
				end)() == nil) then
					do return _g.jk.smtp.SMTPClientTransactionResult:forError(err) end
				end
				do
					local sn = serverName
					if _g.jk.lang.String:isEmpty(sn) then
						sn = "smtpclient.jkop"
					end
					if _g.jk.smtp.SMTPClient:writeLine(ops, "EHLO " .. _g.jk.lang.String:safeString(sn), ctx) == false then
						do return _g.jk.smtp.SMTPClientTransactionResult:forNetworkError() end
					end
					if not ((function()
						err = _g.jk.smtp.SMTPClient:communicate(ins, "250", ctx)
						do return err end
					end)() == nil) then
						do return _g.jk.smtp.SMTPClientTransactionResult:forError(err) end
					end
					if _g.jk.lang.String:equals("smtp+tls", scheme) then
						if _g.jk.smtp.SMTPClient:writeLine(ops, "STARTTLS", ctx) == false then
							do return _g.jk.smtp.SMTPClientTransactionResult:forNetworkError() end
						end
						if not ((function()
							err = _g.jk.smtp.SMTPClient:communicate(ins, "220", ctx)
							do return err end
						end)() == nil) then
							do return _g.jk.smtp.SMTPClientTransactionResult:forError(err) end
						end
						ops = nil
						ins = nil
						socket = _g.jk.socket.ssl.SSLSocket:forClient(socket, host, ctx, acceptInvalidCertificate, nil)
						if socket == nil then
							do return _g.jk.smtp.SMTPClientTransactionResult:forError("Failed to start SSL") end
						end
						ops = _g.jk.io.PrintWriterWrapper:forWriter(socket)
						ins = _g.jk.io.PrintReader:forReader(socket)
						if _g.jk.smtp.SMTPClient:writeLine(ops, "EHLO " .. _g.jk.lang.String:safeString(sn), ctx) == false then
							do return _g.jk.smtp.SMTPClientTransactionResult:forNetworkError() end
						end
						if not ((function()
							err = _g.jk.smtp.SMTPClient:communicate(ins, "250", ctx)
							do return err end
						end)() == nil) then
							do return _g.jk.smtp.SMTPClientTransactionResult:forError(err) end
						end
					end
					do
						local username = url:getUsername()
						local password = url:getPassword()
						if _g.jk.lang.String:isEmpty(username) == false then
							if _g.jk.smtp.SMTPClient:writeLine(ops, "AUTH login", ctx) == false then
								do return _g.jk.smtp.SMTPClientTransactionResult:forNetworkError() end
							end
							if not ((function()
								err = _g.jk.smtp.SMTPClient:communicate(ins, "334", ctx)
								do return err end
							end)() == nil) then
								do return _g.jk.smtp.SMTPClientTransactionResult:forError(err) end
							end
							if _g.jk.smtp.SMTPClient:writeLine(ops, _g.jk.smtp.SMTPClient:encode(username), ctx) == false then
								do return _g.jk.smtp.SMTPClientTransactionResult:forNetworkError() end
							end
							if not ((function()
								err = _g.jk.smtp.SMTPClient:communicate(ins, "334", ctx)
								do return err end
							end)() == nil) then
								do return _g.jk.smtp.SMTPClientTransactionResult:forError(err) end
							end
							if _g.jk.smtp.SMTPClient:writeLine(ops, _g.jk.smtp.SMTPClient:encode(password), ctx) == false then
								do return _g.jk.smtp.SMTPClientTransactionResult:forNetworkError() end
							end
							if not ((function()
								err = _g.jk.smtp.SMTPClient:communicate(ins, "235|530", ctx)
								do return err end
							end)() == nil) then
								do return _g.jk.smtp.SMTPClientTransactionResult:forError(err) end
							end
						end
						if _g.jk.smtp.SMTPClient:writeLine(ops, "MAIL FROM:<" .. _g.jk.lang.String:safeString(msg:getMyAddress()) .. ">", ctx) == false then
							do return _g.jk.smtp.SMTPClientTransactionResult:forNetworkError() end
						end
						if not ((function()
							err = _g.jk.smtp.SMTPClient:communicate(ins, "250", ctx)
							do return err end
						end)() == nil) then
							do return _g.jk.smtp.SMTPClientTransactionResult:forError(err) end
						end
						if rcpts ~= nil then
							local array = rcpts:toVector()
							if array ~= nil then
								local n2 = 0
								local m = _g.jk.lang.Vector:getSize(array)
								do
									n2 = 0
									while n2 < m do
										local rcpt = (function(o)
											if (_vm:get_variable_type(o) == 'string') then
												do return o end
											end
											do return nil end
										end)(array[n2 + 1])
										if rcpt ~= nil then
											if _g.jk.smtp.SMTPClient:writeLine(ops, "RCPT TO:<" .. _g.jk.lang.String:safeString(_g.jk.smtp.SMTPClient:rcptAsEmailAddress(rcpt)) .. ">", ctx) == false then
												do return _g.jk.smtp.SMTPClientTransactionResult:forNetworkError() end
											end
											if not ((function()
												err = _g.jk.smtp.SMTPClient:communicate(ins, "250", ctx)
												do return err end
											end)() == nil) then
												do return _g.jk.smtp.SMTPClientTransactionResult:forError(err) end
											end
										end
										do n2 = n2 + 1 end
									end
								end
							end
						end
						if _g.jk.smtp.SMTPClient:writeLine(ops, "DATA", ctx) == false then
							do return _g.jk.smtp.SMTPClientTransactionResult:forNetworkError() end
						end
						if not ((function()
							err = _g.jk.smtp.SMTPClient:communicate(ins, "354", ctx)
							do return err end
						end)() == nil) then
							do return _g.jk.smtp.SMTPClientTransactionResult:forError(err) end
						end
						if _g.jk.lang.String:isEmpty(msg:getMessageID()) then
							do msg:generateMessageID(sn) end
						end
						do
							local bod = msg:getMessageBody()
							do _g.jk.log.Log:debug(ctx, "Sending message body: `" .. _g.jk.lang.String:safeString(bod) .. "'") end
							if ops:print(bod) == false then
								do return _g.jk.smtp.SMTPClientTransactionResult:forNetworkError() end
							end
							if ops:print("\r\n.\r\n") == false then
								do return _g.jk.smtp.SMTPClientTransactionResult:forNetworkError() end
							end
							if not ((function()
								err = _g.jk.smtp.SMTPClient:communicate(ins, "250", ctx)
								do return err end
							end)() == nil) then
								do return _g.jk.smtp.SMTPClientTransactionResult:forError(err) end
							end
							if _g.jk.smtp.SMTPClient:writeLine(ops, "QUIT", ctx) == false then
								do return _g.jk.smtp.SMTPClientTransactionResult:forNetworkError() end
							end
							do return _g.jk.smtp.SMTPClientTransactionResult:forSuccess() end
						end
					end
				end
			end
		end
	end
end

jk.smtp.SMTPSenderListener = {}
