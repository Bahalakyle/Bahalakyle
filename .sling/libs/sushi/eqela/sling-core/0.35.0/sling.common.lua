sling = sling or {}

sling.common = sling.common or {}

sling.common.TokenSource = {}
sling.common.TokenSource.__index = sling.common.TokenSource
_vm:set_metatable(sling.common.TokenSource, {})

function sling.common.TokenSource._create()
	local v = _vm:set_metatable({}, sling.common.TokenSource)
	return v
end

function sling.common.TokenSource:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.TokenSource'
	self['_isType.sling.common.TokenSource'] = true
	self.file = nil
	self.content = nil
	self.name = nil
	self.lines = nil
end

function sling.common.TokenSource:_construct0()
	sling.common.TokenSource._init(self)
	return self
end

function sling.common.TokenSource:forFile(file, name)
	local v = _g.sling.common.TokenSource._construct0(_g.sling.common.TokenSource._create())
	do v:setFile(file) end
	do v:setName(name) end
	do return v end
end

function sling.common.TokenSource:forString(str)
	local v = _g.sling.common.TokenSource._construct0(_g.sling.common.TokenSource._create())
	do v:setContent(str) end
	do return v end
end

function sling.common.TokenSource:setName(v)
	self.name = v
	do return self end
end

function sling.common.TokenSource:getName()
	do return self.name end
end

function sling.common.TokenSource:getContent()
	if self.content == nil and self.file ~= nil then
		self.content = self.file:getContentsUTF8()
	end
	do return self.content end
end

function sling.common.TokenSource:setContent(v)
	self.content = v
	do return self end
end

function sling.common.TokenSource:recycleContent()
	if self.file ~= nil then
		self.content = nil
	end
end

function sling.common.TokenSource:getLines()
	if self.lines == nil then
		local cc = self:getContent()
		if cc ~= nil then
			self.lines = {}
			do
				local array = _g.jk.lang.String:split(self.content, 10, 0)
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local line = array[n + 1]
							if line ~= nil then
								while _g.jk.lang.String:endsWith(line, "\r") do
									line = _g.jk.lang.String:getSubString(line, 0, _g.jk.lang.String:getLength(line) - 1)
								end
								do _g.jk.lang.Vector:append(self.lines, line) end
							end
							do n = n + 1 end
						end
					end
				end
				do self:recycleContent() end
			end
		end
	end
	do return self.lines end
end

function sling.common.TokenSource:getLine(n)
	local lines = self:getLines()
	if not (lines ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Vector:getAt(lines, n) end
end

function sling.common.TokenSource:getFile()
	do return self.file end
end

function sling.common.TokenSource:setFile(v)
	self.file = v
	do return self end
end

sling.common.NodeInsertionPoint = {}

sling.common.SourceReference = {}

sling.common.NodeObject = {}
sling.common.NodeObject.__index = sling.common.NodeObject
_vm:set_metatable(sling.common.NodeObject, {})

function sling.common.NodeObject._create()
	local v = _vm:set_metatable({}, sling.common.NodeObject)
	return v
end

function sling.common.NodeObject:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.NodeObject'
	self['_isType.sling.common.NodeObject'] = true
	self['_isType.sling.common.SourceReference'] = true
	self.parent = nil
	self.source = nil
end

function sling.common.NodeObject:_construct0()
	sling.common.NodeObject._init(self)
	return self
end

function sling.common.NodeObject:dupNode(node)
	if not (node ~= nil) then
		do return nil end
	end
	do
		local v = node:dup()
		if not (v ~= nil) then
			do return nil end
		end
		do return v end
	end
end

function sling.common.NodeObject:visitVector(vector, visitor)
	if vector ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(vector)
		do
			n = 0
			while n < m do
				local node = _vm:to_table_with_key(vector[n + 1], '_isType.sling.common.NodeObject')
				if node ~= nil then
					if not node:accept(visitor) then
						do return false end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return true end
end

function sling.common.NodeObject:visitMap(nodes, visitor)
	if nodes == nil then
		do return true end
	end
	do
		local it = _vm:to_table_with_key(_g.jk.lang.Map:iterateValues(nodes), '_isType.jk.lang.Iterator')
		while it ~= nil do
			local o = it:next()
			if not (o ~= nil) then
				do break end
			end
			do
				local node = _vm:to_table_with_key(o, '_isType.sling.common.NodeObject')
				if not (node ~= nil) then
					goto _continue12
				end
				if not node:accept(visitor) then
					do return false end
				end
			end
			::_continue12::
		end
		do return true end
	end
end

function sling.common.NodeObject:accept(visitor)
	if visitor:getSkipChildren() then
		do return true end
	end
	if not visitor:onStartVisit(self) then
		do return false end
	end
	do
		local v = self:acceptVisitor(visitor)
		if visitor:onEndVisit(self) == false then
			v = false
		end
		do return v end
	end
end

function sling.common.NodeObject:acceptVisitor(visitor)
	if not visitor:visit(self) then
		do return false end
	end
	do return true end
end

function sling.common.NodeObject:getSource()
	local source = self.source
	if source == nil then
		local pp = self:getParent()
		while true do
			if pp == nil then
				do break end
			end
			source = pp:getSource()
			if source ~= nil then
				do break end
			end
			pp = pp:getParent()
		end
	end
	do return source end
end

function sling.common.NodeObject:setSource(src)
	self.source = src
	do return self end
end

function sling.common.NodeObject:getSourceName()
	local ss = self:getSource()
	if not (ss ~= nil) then
		do return nil end
	end
	do return ss:getSourceName() end
end

function sling.common.NodeObject:getSourceToken()
	local ss = self:getSource()
	if not (ss ~= nil) then
		do return nil end
	end
	do return ss:getSourceToken() end
end

function sling.common.NodeObject:getSourceLineNumber()
	local ss = self:getSource()
	if ss == nil then
		do return -1 end
	end
	do return ss:getSourceLineNumber() end
end

function sling.common.NodeObject:getSourceColumnNumber()
	local ss = self:getSource()
	if ss == nil then
		do return -1 end
	end
	do return ss:getSourceColumnNumber() end
end

function sling.common.NodeObject:getSourceContentLine()
	local ss = self:getSource()
	if not (ss ~= nil) then
		do return nil end
	end
	do return ss:getSourceContentLine() end
end

function sling.common.NodeObject:getNodeTrace()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local p = self
	while p ~= nil do
		do sb:appendString("\n<- ") end
		do sb:appendString(p:getNodeTypeName()) end
		if (_vm:to_table_with_key(p, '_isType.sling.common.NamedNode') ~= nil) then
			local pname = p:getNodeName()
			if _g.jk.lang.String:isEmpty(pname) == false then
				do sb:appendString(" \"") end
				do sb:appendString(pname) end
				do sb:appendString("\"") end
			end
		end
		p = p:getParent()
	end
	do return sb:toString() end
end

function sling.common.NodeObject:updateIndexForChild(decl)
end

function sling.common.NodeObject:onIndexPropertiesChanged()
	local pp = self:getParent()
	if pp ~= nil then
		do pp:updateIndexForChild(self) end
	end
end

function sling.common.NodeObject:getNodeTypeName()
	do return "NodeObject" end
end

function sling.common.NodeObject:getParent()
	do return self.parent end
end

function sling.common.NodeObject:clearParent()
	do self:setParent(nil) end
end

function sling.common.NodeObject:setParent(parent)
	if parent == nil and self.parent ~= nil then
		do self:destroy() end
	end
	self.parent = parent
	if parent ~= nil then
		do self:initialize() end
	end
end

function sling.common.NodeObject:initialize()
end

function sling.common.NodeObject:onChildDestroy(node)
end

function sling.common.NodeObject:destroy()
	if self.parent ~= nil then
		do self.parent:onChildDestroy(self) end
	end
	self.parent = nil
end

function sling.common.NodeObject:dup()
	local v = self:createNew()
	if not (v ~= nil) then
		do return nil end
	end
	if self:copyTo(v) == false then
		v = nil
	end
	do return v end
end

function sling.common.NodeObject:remove()
	do return self:replaceWith(nil, false) end
end

function sling.common.NodeObject:exportNode()
	do return self:replaceWith(nil, true) end
end

function sling.common.NodeObject:replaceNodeInVector(nodes, oldnode, newnode, doExport)
	if not (nodes ~= nil) then
		do return false end
	end
	if not (oldnode ~= nil) then
		do return false end
	end
	if newnode == nil then
		if _g.jk.lang.Vector:removeValue(nodes, oldnode) < 0 then
			do return false end
		end
		if doExport == false then
			do oldnode:destroy() end
		end
		do return true end
	end
	do
		local m = _g.jk.lang.Vector:getSize(nodes)
		do
			local n = 0
			while n < m do
				local value = _g.jk.lang.Vector:getAt(nodes, n)
				if value == oldnode then
					if doExport == false then
						do oldnode:destroy() end
					end
					do _g.jk.lang.Vector:set(nodes, n, newnode) end
					do newnode:setParent(self) end
					do return true end
				end
				do n = n + 1 end
			end
		end
		do return false end
	end
end

function sling.common.NodeObject:replaceChild(oldnode, newnode, doExport)
	do return false end
end

function sling.common.NodeObject:replaceWith(newnode, doExport)
	local pp = self:getParent()
	if not (pp ~= nil) then
		do return false end
	end
	if not pp:replaceChild(self, newnode, doExport) then
		do return false end
	end
	if newnode ~= nil and newnode:getSource() == nil then
		do newnode:setSource(self.source) end
	end
	do return true end
end

function sling.common.NodeObject:createNew()
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Not implemented: createNew", self:getSource(), _g.jk.lang.StackTrace:generate()))
	do return nil end
end

function sling.common.NodeObject:copyCustomTo(node)
	do return true end
end

function sling.common.NodeObject:copyTo(node)
	if node ~= nil then
		do node:setSource(self.source) end
		if not self:copyCustomTo(node) then
			do return false end
		end
	end
	do return true end
end

function sling.common.NodeObject:getInsertionPointForChild(node)
	do return nil end
end

function sling.common.NodeObject:getInsertionPoint()
	local pp = self:getParent()
	if not (pp ~= nil) then
		do return nil end
	end
	do return pp:getInsertionPointForChild(self) end
end

sling.common.Message = {}
sling.common.Message.__index = sling.common.Message
_vm:set_metatable(sling.common.Message, {})

function sling.common.Message._create()
	local v = _vm:set_metatable({}, sling.common.Message)
	return v
end

function sling.common.Message:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.Message'
	self['_isType.sling.common.Message'] = true
	self['_isType.jk.json.JSONObject'] = true
	self['_isType.jk.lang.StringObject'] = true
	self['_isType.jk.lang.StringObjectWithDebug'] = true
	self.message = nil
	self.reference = nil
	self.relatedMessages = nil
end

function sling.common.Message:_construct0()
	sling.common.Message._init(self)
	return self
end

function sling.common.Message:formatToken(token)
	if not (token ~= nil) then
		do return nil end
	end
	if token == "\n" then
		do return "<NL>" end
	end
	if token == "\r" then
		do return "<CR>" end
	end
	do return token end
end

function sling.common.Message:toJsonObject()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("type", self:getType()) end
	do v:setString("message", self.message) end
	if self.reference ~= nil then
		local rv = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do rv:setString("sourceName", self.reference:getSourceName()) end
		do rv:setString("sourceToken", self:formatToken(self.reference:getSourceToken())) end
		do rv:setInteger("sourceLineNumber", self.reference:getSourceLineNumber()) end
		do rv:setInteger("sourceColumnNumber", self.reference:getSourceColumnNumber()) end
		do rv:setString("sourceContentLine", self.reference:getSourceContentLine()) end
		do rv:setString("nodeTrace", self.reference:getNodeTrace()) end
		do v:setObject("reference", rv) end
	end
	do
		local rms = nil
		if self.relatedMessages ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self.relatedMessages)
			do
				n = 0
				while n < m do
					local related = self.relatedMessages[n + 1]
					if related ~= nil then
						local r = related:toJsonObject()
						if not (r ~= nil) then
							goto _continue8
						end
						if rms == nil then
							rms = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
						end
						do rms:appendObject(r) end
					end
					::_continue8::
					do n = n + 1 end
				end
			end
		end
		if rms ~= nil then
			do v:setObject("relatedMessages", rms) end
		end
		do return v end
	end
end

function sling.common.Message:fromJsonObject(o)
	do return false end
end

function sling.common.Message:getType()
end

function sling.common.Message:addRelatedMessage(message)
	if not (message ~= nil) then
		do return end
	end
	if self.relatedMessages == nil then
		self.relatedMessages = {}
	end
	do _g.jk.lang.Vector:append(self.relatedMessages, message) end
end

function sling.common.Message:copyFrom(msg)
	if not (msg ~= nil) then
		do return end
	end
	do self:setReference(msg:getReference()) end
	do self:setMessage(msg:getMessage()) end
end

function sling.common.Message:getMessageString()
	do return self.message end
end

function sling.common.Message:toStringWithDebug(isDebug)
	local mm = self:getMessageString()
	if mm == nil then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		if self.reference == nil then
			do sb:appendString(mm) end
		else
			local line = self.reference:getSourceLineNumber()
			local col = self.reference:getSourceColumnNumber()
			local name = self.reference:getSourceName()
			if _g.jk.lang.String:isEmpty(name) then
				name = "<unknown>"
			end
			do
				local token = self.reference:getSourceToken()
				if token ~= nil then
					if token == "\n" then
						token = "<NL>"
					elseif token == "\r" then
						token = "<CR>"
					elseif token == "\t" then
						token = "<TAB>"
					elseif token == "\f" then
						token = "<FF>"
					elseif _g.jk.lang.String:getIndexOfCharacter(token, 10, 0) >= 0 then
						token = "<multi-line-token>"
					end
				end
				do sb:appendString(name) end
				if line >= 0 then
					do sb:appendCharacter(58) end
					do sb:appendInteger(line + 1) end
					if col >= 0 then
						do sb:appendCharacter(58) end
						do sb:appendInteger(col + 1) end
					end
				end
				if _g.jk.lang.String:isEmpty(token) == false then
					do sb:appendString(" (`") end
					do sb:appendString(token) end
					do sb:appendString("')") end
				end
				do sb:appendString(": ") end
				do sb:appendString(mm) end
				do
					local cl = self.reference:getSourceContentLine()
					if not (cl == nil) then
						do sb:appendCharacter(10) end
						do
							local it = _g.jk.lang.String:iterate(cl)
							local c = 0
							while (function()
								c = it:getNextChar()
								do return c end
							end)() > 0 do
								if c == 9 then
									do sb:appendCharacter(32) end
								else
									do sb:appendCharacter(c) end
								end
							end
							if col >= 0 then
								do sb:appendCharacter(10) end
								do
									local n = 0
									do
										n = 0
										while n < col do
											do sb:appendCharacter(32) end
											do n = n + 1 end
										end
									end
									do sb:appendCharacter(94) end
								end
							end
						end
					else
						do sb:appendString("\n\t(no reference content)\n") end
					end
					if isDebug then
						local trace = self.reference:getNodeTrace()
						if _g.jk.lang.String:isNotEmpty(trace) then
							if _g.jk.lang.String:startsWith(trace, "\n", 0) == false then
								do sb:appendCharacter(10) end
							end
							do sb:appendString(trace) end
							if _g.jk.lang.String:endsWith(trace, "\n") == false then
								do sb:appendCharacter(10) end
							end
						end
					end
				end
			end
		end
		do
			local rms = false
			if self.relatedMessages ~= nil then
				local n2 = 0
				local m = _g.jk.lang.Vector:getSize(self.relatedMessages)
				do
					n2 = 0
					while n2 < m do
						local relatedMessage = self.relatedMessages[n2 + 1]
						if relatedMessage ~= nil then
							local rmts = relatedMessage:toStringWithDebug(isDebug)
							if _g.jk.lang.String:isEmpty(rmts) then
								goto _continue9
							end
							do
								local array = _g.jk.lang.String:split(rmts, 10, 0)
								if array ~= nil then
									local n3 = 0
									local m2 = _g.jk.lang.Vector:getSize(array)
									do
										n3 = 0
										while n3 < m2 do
											local line = array[n3 + 1]
											if line ~= nil then
												do sb:appendString("\n  => ") end
												do sb:appendString(line) end
											end
											do n3 = n3 + 1 end
										end
									end
								end
								rms = true
							end
						end
						::_continue9::
						do n2 = n2 + 1 end
					end
				end
			end
			if rms then
				do sb:appendCharacter(10) end
			end
			do return sb:toString() end
		end
	end
end

function sling.common.Message:toString()
	do return self:toStringWithDebug(false) end
end

function sling.common.Message:getMessage()
	do return self.message end
end

function sling.common.Message:setMessage(v)
	self.message = v
	do return self end
end

function sling.common.Message:getReference()
	do return self.reference end
end

function sling.common.Message:setReference(v)
	self.reference = v
	do return self end
end

function sling.common.Message:getRelatedMessages()
	do return self.relatedMessages end
end

function sling.common.Message:setRelatedMessages(v)
	self.relatedMessages = v
	do return self end
end

sling.common.OutputWriterManager = {}

sling.common.OutputWriter = {}

sling.common.DataTypeNode = _g.sling.common.NodeObject._create()
sling.common.DataTypeNode.__index = sling.common.DataTypeNode
_vm:set_metatable(sling.common.DataTypeNode, {
	__index = _g.sling.common.NodeObject
})

function sling.common.DataTypeNode._create()
	local v = _vm:set_metatable({}, sling.common.DataTypeNode)
	return v
end

function sling.common.DataTypeNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.DataTypeNode'
	self['_isType.sling.common.DataTypeNode'] = true
	self.isNullable = false
end

function sling.common.DataTypeNode:duplicate(node)
	if not (node ~= nil) then
		do return nil end
	end
	do
		local v = _vm:to_table_with_key(node:dup(), '_isType.sling.common.DataTypeNode')
		if not (v ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to duplicate as data type", node:getSource(), _g.jk.lang.StackTrace:generate()))
		end
		do return v end
	end
end

function sling.common.DataTypeNode:_construct0()
	sling.common.DataTypeNode._init(self)
	do _g.sling.common.NodeObject._construct0(self) end
	do self:setIsNullable(true) end
	return self
end

function sling.common.DataTypeNode:getNodeTypeName()
	do return "DataTypeNode" end
end

function sling.common.DataTypeNode:createNew()
	do return _g.sling.common.DataTypeNode._construct0(_g.sling.common.DataTypeNode._create()) end
end

function sling.common.DataTypeNode:copyTo(o)
	if _g.sling.common.NodeObject.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.common.DataTypeNode')
		if n == nil then
			do return true end
		end
		n.isNullable = self.isNullable
		do return true end
	end
end

function sling.common.DataTypeNode:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.common.NodeObject.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.common.DataTypeNode:acceptVisitor(visitor)
	if _g.sling.common.NodeObject.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.common.DataTypeNode:destroy()
	do _g.sling.common.NodeObject.destroy(self) end
end

function sling.common.DataTypeNode:setIsNullable(v)
	self.isNullable = v
end

function sling.common.DataTypeNode:getIsNullable()
	do return self.isNullable end
end

sling.common.LiveTokenizingParser = {}
sling.common.LiveTokenizingParser.__index = sling.common.LiveTokenizingParser
_vm:set_metatable(sling.common.LiveTokenizingParser, {})

sling.common.LiveTokenizingParser.IMPROPER_COMMENT_NOOP = 0
sling.common.LiveTokenizingParser.IMPROPER_COMMENT_IGNORE = 1
sling.common.LiveTokenizingParser.IMPROPER_COMMENT_WARN_IGNORE = 2
sling.common.LiveTokenizingParser.IMPROPER_COMMENT_QUEUE = 3
sling.common.LiveTokenizingParser.IMPROPER_COMMENT_WARN_QUEUE = 4

function sling.common.LiveTokenizingParser._create()
	local v = _vm:set_metatable({}, sling.common.LiveTokenizingParser)
	return v
end

function sling.common.LiveTokenizingParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.LiveTokenizingParser'
	self['_isType.sling.common.LiveTokenizingParser'] = true
	self.improperCommentPolicy = _g.sling.common.LiveTokenizingParser.IMPROPER_COMMENT_NOOP
	self.tokensAreCaseSensitive = true
	self.fileEncoding = nil
	self.ctx = nil
	self.iterator = nil
	self.currentTokenLine = 0
	self.currentTokenColumn = 0
	self.currentTokenSource = nil
	self.stagingToken = nil
	self.acceptedToken = nil
	self.commentQueue = nil
	self.parseMessages = nil
	self.previousToken = nil
	self.allowSkipSpaces = true
	self.tokenIterator = _g.jk.lang.CharacterIteratorForString._construct0(_g.jk.lang.CharacterIteratorForString._create())
end

function sling.common.LiveTokenizingParser:_construct0()
	sling.common.LiveTokenizingParser._init(self)
	return self
end

sling.common.LiveTokenizingParser.Position = {}
sling.common.LiveTokenizingParser.Position.__index = sling.common.LiveTokenizingParser.Position
_vm:set_metatable(sling.common.LiveTokenizingParser.Position, {})

function sling.common.LiveTokenizingParser.Position._create()
	local v = _vm:set_metatable({}, sling.common.LiveTokenizingParser.Position)
	return v
end

function sling.common.LiveTokenizingParser.Position:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.LiveTokenizingParser.Position'
	self['_isType.sling.common.LiveTokenizingParser.Position'] = true
	self.line = 0
	self.column = 0
	self.position = 0
	self.commentQueueSize = 0
	self.previousToken = nil
end

function sling.common.LiveTokenizingParser.Position:_construct0()
	sling.common.LiveTokenizingParser.Position._init(self)
	return self
end

function sling.common.LiveTokenizingParser:resetParserState()
	self.iterator = nil
	self.currentTokenLine = 0
	self.currentTokenColumn = 0
	self.currentTokenSource = nil
	self.stagingToken = nil
	self.acceptedToken = nil
	self.commentQueue = nil
	self.parseMessages = nil
	self.previousToken = nil
end

function sling.common.LiveTokenizingParser:consumeParseMessages()
	local v = self.parseMessages
	self.parseMessages = nil
	do return v end
end

function sling.common.LiveTokenizingParser:getDisplayText(txt)
	if _g.jk.lang.String:isEmpty(txt) then
		do return "<EMPTY>" end
	end
	if txt == "\n" then
		do return "<NL>" end
	end
	if txt == "\r" then
		do return "<CR>" end
	end
	if txt == "\t" then
		do return "<TAB>" end
	end
	if txt == " " then
		do return "<SPACE>" end
	end
	do return txt end
end

function sling.common.LiveTokenizingParser:onParseMessage(message)
	if not (message ~= nil) then
		do return end
	end
	if self.ctx ~= nil then
		do _g.sling.common.RefLog:message(self.ctx, message) end
	else
		if self.parseMessages == nil then
			self.parseMessages = {}
		end
		do _g.jk.lang.Vector:append(self.parseMessages, message) end
	end
end

function sling.common.LiveTokenizingParser:initializeForTokenSource(source)
	if not (source ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No token source", self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do
		local str = source:getContent()
		if not (str ~= nil) then
			do self:skipSpaces() end
			do self:updateStagingToken() end
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No content from source", self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
		end
		do self:resetParserState() end
		self.currentTokenSource = source
		str = self:preprocessContent(str)
		if not (str ~= nil) then
			self.currentTokenSource = nil
			do self:skipSpaces() end
			do self:updateStagingToken() end
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Preprocessing failed", self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
		end
		do source:setContent(str) end
		self.iterator = _g.jk.lang.String:iterate(str)
		do self.iterator:moveToNextChar() end
		self.currentTokenLine = 0
		self.currentTokenColumn = 0
		do self:updateStagingToken() end
	end
end

function sling.common.LiveTokenizingParser:initializeForFile(file)
	if not (file ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null content file for parser", self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do
		local content = self:readFileContentsString(file)
		if not (content ~= nil) then
			do self:skipSpaces() end
			do self:updateStagingToken() end
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage(_g.sling.common.MessageFormatter:getFileMessage(file, "Failed to read file"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
		end
		do
			local ts = _g.sling.common.TokenSource._construct0(_g.sling.common.TokenSource._create())
			do ts:setContent(content) end
			do
				local cn = _g.sling.common.MessageFormatter:getFilePath(file)
				if _g.jk.lang.String:isEmpty(cn) then
					cn = "<file>"
				end
				do ts:setName(cn) end
				do ts:setFile(file) end
				do self:initializeForTokenSource(ts) end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:initializeForString(content, contentName)
	if not (content ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null content string for parser", self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do
		local ts = _g.sling.common.TokenSource._construct0(_g.sling.common.TokenSource._create())
		do ts:setContent(content) end
		do
			local cn = contentName
			if _g.jk.lang.String:isEmpty(cn) then
				cn = "<string>"
			end
			do ts:setName(cn) end
			do ts:setFile(nil) end
			do self:initializeForTokenSource(ts) end
		end
	end
end

function sling.common.LiveTokenizingParser:isSpaceCharacter(n)
	if n == 32 or n == 9 or n == 13 or n == 10 then
		do return true end
	end
	do return false end
end

function sling.common.LiveTokenizingParser:setCtx(ctx)
	self.ctx = ctx
	do return self end
end

function sling.common.LiveTokenizingParser:getCtx()
	do return self.ctx end
end

function sling.common.LiveTokenizingParser:getCurrentTokenSource()
	do return self.currentTokenSource end
end

function sling.common.LiveTokenizingParser:getCurrentTokenLine()
	do return self.currentTokenLine end
end

function sling.common.LiveTokenizingParser:getCurrentTokenColumn()
	do return self.currentTokenColumn end
end

function sling.common.LiveTokenizingParser:getCurrentInputName()
	if self.currentTokenSource == nil then
		do return "<none>" end
	end
	do return self.currentTokenSource:getName() end
end

function sling.common.LiveTokenizingParser:getCurrentFile()
	if self.currentTokenSource == nil then
		do return nil end
	end
	do return self.currentTokenSource:getFile() end
end

function sling.common.LiveTokenizingParser:getCurrentFileName()
	local currentFile = self:getCurrentFile()
	if currentFile == nil then
		do return nil end
	end
	do return currentFile:baseName() end
end

function sling.common.LiveTokenizingParser:getCurrentFileId()
	local currentFile = self:getCurrentFile()
	if currentFile == nil and self.currentTokenSource ~= nil then
		currentFile = _g.jk.fs.File:forPath(self.currentTokenSource:getName())
	end
	if currentFile ~= nil then
		do return currentFile:baseNameWithoutExtension() end
	end
	do return nil end
end

function sling.common.LiveTokenizingParser:getCurrentDirectory()
	local currentFile = self:getCurrentFile()
	if not (currentFile ~= nil) then
		do return nil end
	end
	do return currentFile:getParent() end
end

function sling.common.LiveTokenizingParser:getRelativeFile(name)
	if not _g.jk.lang.String:isNotEmpty(name) then
		do return nil end
	end
	if not (_g.jk.lang.String:getIndexOfCharacter(name, 92, 0) < 0) then
		do return nil end
	end
	do
		local currentFile = self:getCurrentFile()
		if not (currentFile ~= nil) then
			do return nil end
		end
		do
			local dd = currentFile:getParent()
			if not (dd ~= nil) then
				do return nil end
			end
			do
				local array = _g.jk.lang.String:split(name, 47, 0)
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local comp = array[n + 1]
							if comp ~= nil then
								if _g.jk.lang.String:isEmpty(comp) or comp == "." or comp == ".." then
									goto _continue1
								end
								dd = dd:entry(comp)
							end
							::_continue1::
							do n = n + 1 end
						end
					end
				end
				do return dd end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:getRelativeFileIgnoreCase(name)
	local r = self:getRelativeFile(name)
	if r ~= nil and r:exists() then
		do return r end
	end
	do
		local currentFile = self:getCurrentFile()
		if not (currentFile ~= nil) then
			do return nil end
		end
		do
			local dd = currentFile:getParent()
			if not (dd ~= nil) then
				do return nil end
			end
			do
				local v = nil
				local it = dd:entries()
				while it ~= nil do
					local ff = it:next()
					if not (ff ~= nil) then
						do break end
					end
					if _g.jk.lang.String:equalsIgnoreCase(ff:baseName(), name) then
						v = ff
						do break end
					end
				end
				if it ~= nil and (_vm:to_table_with_key(it, '_isType.jk.lang.Closable') ~= nil) then
					do it:close() end
				end
				do return v end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:readFileContentsString(file)
	if not (file ~= nil) then
		do return nil end
	end
	if not (self.fileEncoding ~= nil) then
		local buffer = file:getContentsBuffer()
		if not (buffer ~= nil) then
			do return nil end
		end
		do return _g.jk.text.StringBufferDecoder:decodeBufferWithBOM(buffer, false) end
	end
	do return file:getContentsString(self.fileEncoding) end
end

function sling.common.LiveTokenizingParser:updateStagingToken()
	if self.stagingToken == nil then
		self.stagingToken = _g.sling.common.Token._construct0(_g.sling.common.Token._create())
	end
	self.stagingToken.value = nil
	self.stagingToken.line = self.currentTokenLine
	self.stagingToken.column = self.currentTokenColumn
	self.stagingToken.source = self.currentTokenSource
	if self.iterator ~= nil then
		self.stagingToken.position = self.iterator:getCurrentPosition()
	end
end

function sling.common.LiveTokenizingParser:getStagingToken()
	do return self.stagingToken end
end

function sling.common.LiveTokenizingParser:rememberPosition()
	local v = _g.sling.common.LiveTokenizingParser.Position._construct0(_g.sling.common.LiveTokenizingParser.Position._create())
	v.line = self.currentTokenLine
	v.column = self.currentTokenColumn
	v.position = self.iterator:getCurrentPosition()
	if self.commentQueue ~= nil then
		v.commentQueueSize = self.commentQueue:getSize()
	else
		v.commentQueueSize = 0
	end
	v.previousToken = self.previousToken
	do return v end
end

function sling.common.LiveTokenizingParser:restorePosition(token)
	if not (token ~= nil) then
		do return end
	end
	self.currentTokenColumn = token.column
	self.currentTokenLine = token.line
	do self.iterator:setCurrentPosition(token.position) end
	while self.commentQueue ~= nil and self.commentQueue:getSize() > token.commentQueueSize do
		do self.commentQueue:pop() end
	end
	self.previousToken = token.previousToken
	do self:updateStagingToken() end
end

function sling.common.LiveTokenizingParser:getPreviousToken()
	do return self.previousToken end
end

function sling.common.LiveTokenizingParser:getAcceptedToken()
	do return self.acceptedToken end
end

function sling.common.LiveTokenizingParser:hasInputEnded()
	do return self.iterator:hasEnded() end
end

function sling.common.LiveTokenizingParser:peekNextCharacter()
	do return self.iterator:getCurrentChar() end
end

function sling.common.LiveTokenizingParser:getNextCharacter()
	local v = self.iterator:getCurrentChar()
	do self.iterator:moveToNextChar() end
	if v == 10 then
		do self.currentTokenLine = self.currentTokenLine + 1 end
		self.currentTokenColumn = 0
	else
		do self.currentTokenColumn = self.currentTokenColumn + 1 end
	end
	do return v end
end

function sling.common.LiveTokenizingParser:skipSpaces()
	if not (self.iterator ~= nil) then
		do return 0 end
	end
	if not self.allowSkipSpaces then
		do return 0 end
	end
	do
		local v = 0
		while true do
			if self:skipSpaceCharacter() then
				do v = v + 1 end
				goto _continue2
			end
			if self.improperCommentPolicy ~= _g.sling.common.LiveTokenizingParser.IMPROPER_COMMENT_NOOP then
				local cc = self:acceptImmediateCommentToken()
				if cc ~= nil then
					do v = v + 1 end
					self.previousToken = cc
					if self.improperCommentPolicy == _g.sling.common.LiveTokenizingParser.IMPROPER_COMMENT_IGNORE then
						goto _continue2
					end
					if self.improperCommentPolicy == _g.sling.common.LiveTokenizingParser.IMPROPER_COMMENT_QUEUE or self.improperCommentPolicy == _g.sling.common.LiveTokenizingParser.IMPROPER_COMMENT_WARN_QUEUE or self.improperCommentPolicy == _g.sling.common.LiveTokenizingParser.IMPROPER_COMMENT_WARN_IGNORE then
						if self.commentQueue == nil then
							self.commentQueue = _g.jk.lang.Queue._construct0(_g.jk.lang.Queue._create())
						end
						do self.commentQueue:push(cc) end
						goto _continue2
					end
				end
			end
			do break end
			::_continue2::
		end
		do return v end
	end
end

function sling.common.LiveTokenizingParser:areTokensConnected(first, second)
	if not (first ~= nil) then
		do return false end
	end
	if not (second ~= nil) then
		do return false end
	end
	if not (first.line == second.line) then
		do return false end
	end
	if not (first.column + _g.jk.lang.String:getLength(first.value) == second.column) then
		do return false end
	end
	do return true end
end

function sling.common.LiveTokenizingParser:onTokenAccepted(token)
	if not (token ~= nil) then
		do return end
	end
	self.previousToken = self.acceptedToken
	self.acceptedToken = token
end

function sling.common.LiveTokenizingParser:acceptEOF()
	if not self:hasInputEnded() then
		do return nil end
	end
	do
		local v = self.stagingToken
		self.stagingToken = nil
		do self:updateStagingToken() end
		v.value = nil
		do self:onTokenAccepted(v) end
		do return v end
	end
end

function sling.common.LiveTokenizingParser:preprocessCharacter(c)
	if self.tokensAreCaseSensitive then
		do return c end
	end
	do return _g.jk.lang.Character:toLowercase(c) end
end

function sling.common.LiveTokenizingParser:getCharacterBoundaryClass(c)
	if c == 32 or c == 10 or c == 13 or c == 9 then
		do return 0 end
	end
	if _g.jk.lang.Character:isAlphaNumeric(c) or c == 95 then
		do return 1 end
	end
	do return 2 end
end

function sling.common.LiveTokenizingParser:isTokenBoundary(c0, c1)
	local cl0 = self:getCharacterBoundaryClass(c0)
	local cl1 = self:getCharacterBoundaryClass(c1)
	if cl1 == 1 and cl0 == 1 then
		do return false end
	end
	do return true end
end

function sling.common.LiveTokenizingParser:acceptString(str)
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local it = self.tokenIterator
		do it:setString(str) end
		do
			local lc = 0
			while true do
				local c = it:getNextChar()
				if _g.jk.lang.Character:isEOF(c) then
					do break end
				end
				lc = c
				do
					local nn = self:getNextCharacter()
					if not self.tokensAreCaseSensitive then
						c = _g.jk.lang.Character:toLowercase(c)
						nn = _g.jk.lang.Character:toLowercase(nn)
					end
					if c ~= nn then
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
						do return nil end
					end
				end
			end
			do return str end
		end
	end
end

function sling.common.LiveTokenizingParser:acceptAnyString(strings)
	if strings ~= nil then
		local n = 0
		local m = #strings
		do
			n = 0
			while n < m do
				local string = strings[n + 1]
				if string ~= nil then
					local v = self:acceptString(string)
					if v ~= nil then
						do return v end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return nil end
end

function sling.common.LiveTokenizingParser:acceptAnyToken(tokens)
	if tokens ~= nil then
		local n = 0
		local m = #tokens
		do
			n = 0
			while n < m do
				local token = tokens[n + 1]
				if token ~= nil then
					local v = self:acceptToken1(token)
					if v ~= nil then
						do return v end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return nil end
end

function sling.common.LiveTokenizingParser:acceptConnectedToken(token)
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local v = self:acceptToken1(token)
		if not (v ~= nil) then
			do return nil end
		end
		if not self:areTokensConnected(self:getPreviousToken(), self:getAcceptedToken()) then
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
			do return nil end
		end
		do return v end
	end
end

function sling.common.LiveTokenizingParser:peekToken1(token)
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		if self:acceptToken1(token) ~= nil then
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
			do return true end
		end
		do return false end
	end
end

function sling.common.LiveTokenizingParser:peekToken2(token)
	do return self:peekToken1(_g.jk.lang.String:forCharacter(token)) end
end

function sling.common.LiveTokenizingParser:acceptToken1(token)
	if not (token ~= nil) then
		do return nil end
	end
	do self:skipSpaces() end
	do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			local it = self.tokenIterator
			do it:setString(token) end
			do
				local lc = 0
				while true do
					local c = it:getNextChar()
					if _g.jk.lang.Character:isEOF(c) then
						do break end
					end
					if lc == 0 then
						if self.tokensAreCaseSensitive then
							if c ~= self:peekNextCharacter() then
								do return nil end
							end
						elseif _g.jk.lang.Character:toLowercase(c) ~= _g.jk.lang.Character:toLowercase(self:peekNextCharacter()) then
							do return nil end
						end
					end
					lc = c
					do
						local nn = self:getNextCharacter()
						if not self.tokensAreCaseSensitive then
							c = _g.jk.lang.Character:toLowercase(c)
							nn = _g.jk.lang.Character:toLowercase(nn)
						end
						if c ~= nn then
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
							do return nil end
						end
					end
				end
				if self:isTokenBoundary(self:peekNextCharacter(), lc) == false then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				do
					local v = self.stagingToken
					self.stagingToken = nil
					do self:updateStagingToken() end
					v.line = ctl
					v.column = ctc
					v.position = ctp
					v.value = token
					do self:onTokenAccepted(v) end
					do return v end
				end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:acceptToken2(c)
	do self:skipSpaces() end
	if self:preprocessCharacter(self:peekNextCharacter()) ~= self:preprocessCharacter(c) then
		do return nil end
	end
	do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			do self:getNextCharacter() end
			if self:isTokenBoundary(self:peekNextCharacter(), c) == false then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return nil end
			end
			do
				local v = self.stagingToken
				self.stagingToken = nil
				v.line = ctl
				v.column = ctc
				v.position = ctp
				v.value = _g.jk.lang.String:forCharacter(c)
				do self:updateStagingToken() end
				do self:onTokenAccepted(v) end
				do return v end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:acceptToken3(c0, c1)
	do self:skipSpaces() end
	if self:preprocessCharacter(self:peekNextCharacter()) ~= self:preprocessCharacter(c0) then
		do return nil end
	end
	do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			do self:getNextCharacter() end
			if self:preprocessCharacter(self:peekNextCharacter()) ~= self:preprocessCharacter(c1) then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return nil end
			end
			do self:getNextCharacter() end
			do
				local v = self.stagingToken
				self.stagingToken = nil
				do self:updateStagingToken() end
				v.line = ctl
				v.column = ctc
				v.position = ctp
				do
					local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					do sb:appendCharacter(c0) end
					do sb:appendCharacter(c1) end
					v.value = sb:toString()
					do self:onTokenAccepted(v) end
					do return v end
				end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:acceptToken4(c0, c1, c2)
	do self:skipSpaces() end
	if self:preprocessCharacter(self:peekNextCharacter()) ~= self:preprocessCharacter(c0) then
		do return nil end
	end
	do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			do self:getNextCharacter() end
			if self:preprocessCharacter(self:peekNextCharacter()) ~= self:preprocessCharacter(c1) then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return nil end
			end
			do self:getNextCharacter() end
			if self:preprocessCharacter(self:peekNextCharacter()) ~= self:preprocessCharacter(c2) then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return nil end
			end
			do self:getNextCharacter() end
			do
				local v = self.stagingToken
				self.stagingToken = nil
				do self:updateStagingToken() end
				v.line = ctl
				v.column = ctc
				v.position = ctp
				do
					local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					do sb:appendCharacter(c0) end
					do sb:appendCharacter(c1) end
					do sb:appendCharacter(c2) end
					v.value = sb:toString()
					do self:onTokenAccepted(v) end
					do return v end
				end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:acceptToken5(c0, c1, c2, c3)
	do self:skipSpaces() end
	if self:preprocessCharacter(self:peekNextCharacter()) ~= self:preprocessCharacter(c0) then
		do return nil end
	end
	do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			do self:getNextCharacter() end
			if self:preprocessCharacter(self:peekNextCharacter()) ~= self:preprocessCharacter(c1) then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return nil end
			end
			do self:getNextCharacter() end
			if self:preprocessCharacter(self:peekNextCharacter()) ~= self:preprocessCharacter(c2) then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return nil end
			end
			do self:getNextCharacter() end
			if self:preprocessCharacter(self:peekNextCharacter()) ~= self:preprocessCharacter(c3) then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return nil end
			end
			do self:getNextCharacter() end
			do
				local v = self.stagingToken
				self.stagingToken = nil
				do self:updateStagingToken() end
				v.line = ctl
				v.column = ctc
				v.position = ctp
				do
					local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					do sb:appendCharacter(c0) end
					do sb:appendCharacter(c1) end
					do sb:appendCharacter(c2) end
					do sb:appendCharacter(c3) end
					v.value = sb:toString()
					do self:onTokenAccepted(v) end
					do return v end
				end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:preprocessIdentifier(t)
	do return t end
end

function sling.common.LiveTokenizingParser:acceptIdentifierToken()
	do self:skipSpaces() end
	do
		local c0 = self:peekNextCharacter()
		if _g.jk.lang.Character:isEOF(c0) or self:isValidIdentifierPrefix(c0) == false then
			do return nil end
		end
		do
			local ctc = self.currentTokenColumn
			local ctl = self.currentTokenLine
			local ctp = self.iterator:getCurrentPosition()
			local cqs = 0
			if self.commentQueue ~= nil then
				cqs = self.commentQueue:getSize()
			end
			do
				local cpt = self.previousToken
				do self:getNextCharacter() end
				do
					local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					do sb:appendCharacter(c0) end
					while true do
						local cn = self:peekNextCharacter()
						if _g.jk.lang.Character:isEOF(cn) or self:isValidIdentifierCharacter(cn) == false then
							do break end
						end
						do self:getNextCharacter() end
						do sb:appendCharacter(cn) end
					end
					do
						local ids = self:preprocessIdentifier(sb:toString())
						if self:isValidIdentifier(ids) == false then
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
							do return nil end
						end
						do
							local v = self.stagingToken
							self.stagingToken = nil
							do self:updateStagingToken() end
							v.line = ctl
							v.column = ctc
							v.position = ctp
							v.value = ids
							do self:onTokenAccepted(v) end
							do return v end
						end
					end
				end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:acceptBacktickQuotedStringToken()
	do self:skipSpaces() end
	do
		local c0 = self:peekNextCharacter()
		if c0 ~= 96 then
			do return nil end
		end
		do
			local ctc = self.currentTokenColumn
			local ctl = self.currentTokenLine
			local ctp = self.iterator:getCurrentPosition()
			local cqs = 0
			if self.commentQueue ~= nil then
				cqs = self.commentQueue:getSize()
			end
			do
				local cpt = self.previousToken
				do self:getNextCharacter() end
				do
					local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					do sb:appendCharacter(c0) end
					do
						local slash = false
						while true do
							local cn = self:getNextCharacter()
							if _g.jk.lang.Character:isEOF(cn) then
								self.currentTokenColumn = ctc
								self.currentTokenLine = ctl
								do self.iterator:setCurrentPosition(ctp) end
								while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
									do self.commentQueue:pop() end
								end
								self.previousToken = cpt
								do return nil end
							end
							do sb:appendCharacter(cn) end
							if cn == 96 and slash == false then
								do break end
							end
							if cn == 92 then
								if slash == true then
									slash = false
								else
									slash = true
								end
							else
								slash = false
							end
						end
						do
							local ids = sb:toString()
							local v = self.stagingToken
							self.stagingToken = nil
							do self:updateStagingToken() end
							v.line = ctl
							v.column = ctc
							v.position = ctp
							v.value = ids
							do self:onTokenAccepted(v) end
							do return v end
						end
					end
				end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:acceptSingleQuotedStringToken()
	do self:skipSpaces() end
	do
		local c0 = self:peekNextCharacter()
		if c0 ~= 39 then
			do return nil end
		end
		do
			local ctc = self.currentTokenColumn
			local ctl = self.currentTokenLine
			local ctp = self.iterator:getCurrentPosition()
			local cqs = 0
			if self.commentQueue ~= nil then
				cqs = self.commentQueue:getSize()
			end
			do
				local cpt = self.previousToken
				do self:getNextCharacter() end
				do
					local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					do sb:appendCharacter(c0) end
					do
						local slash = false
						while true do
							local cn = self:getNextCharacter()
							if _g.jk.lang.Character:isEOF(cn) then
								self.currentTokenColumn = ctc
								self.currentTokenLine = ctl
								do self.iterator:setCurrentPosition(ctp) end
								while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
									do self.commentQueue:pop() end
								end
								self.previousToken = cpt
								do return nil end
							end
							do sb:appendCharacter(cn) end
							if cn == 39 and slash == false then
								do break end
							end
							if cn == 92 then
								if slash == true then
									slash = false
								else
									slash = true
								end
							else
								slash = false
							end
						end
						do
							local ids = sb:toString()
							local v = self.stagingToken
							self.stagingToken = nil
							do self:updateStagingToken() end
							v.line = ctl
							v.column = ctc
							v.position = ctp
							v.value = ids
							do self:onTokenAccepted(v) end
							do return v end
						end
					end
				end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:acceptDoubleQuotedStringToken(escapeChar, allowNewlines)
	do self:skipSpaces() end
	do
		local c0 = self:peekNextCharacter()
		if c0 ~= 34 then
			do return nil end
		end
		do
			local ctc = self.currentTokenColumn
			local ctl = self.currentTokenLine
			local ctp = self.iterator:getCurrentPosition()
			local cqs = 0
			if self.commentQueue ~= nil then
				cqs = self.commentQueue:getSize()
			end
			do
				local cpt = self.previousToken
				do self:getNextCharacter() end
				do
					local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					do sb:appendCharacter(c0) end
					do
						local escape = false
						while true do
							local cn = self:getNextCharacter()
							if _g.jk.lang.Character:isEOF(cn) then
								self.currentTokenColumn = ctc
								self.currentTokenLine = ctl
								do self.iterator:setCurrentPosition(ctp) end
								while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
									do self.commentQueue:pop() end
								end
								self.previousToken = cpt
								do return nil end
							end
							if cn == 10 and allowNewlines == false then
								self.currentTokenColumn = ctc
								self.currentTokenLine = ctl
								do self.iterator:setCurrentPosition(ctp) end
								while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
									do self.commentQueue:pop() end
								end
								self.previousToken = cpt
								do return nil end
							end
							do sb:appendCharacter(cn) end
							if cn == 34 and escape == false then
								do break end
							end
							if escapeChar > 0 and cn == escapeChar then
								if escape == true then
									escape = false
								else
									escape = true
								end
							else
								escape = false
							end
						end
						do
							local ids = sb:toString()
							local v = self.stagingToken
							self.stagingToken = nil
							do self:updateStagingToken() end
							v.line = ctl
							v.column = ctc
							v.position = ctp
							v.value = ids
							do self:onTokenAccepted(v) end
							do return v end
						end
					end
				end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:acceptTripleQuotedMultiLineStringToken()
	do self:skipSpaces() end
	do
		local c0 = self:peekNextCharacter()
		if c0 ~= 34 then
			do return nil end
		end
		do
			local ctc = self.currentTokenColumn
			local ctl = self.currentTokenLine
			local ctp = self.iterator:getCurrentPosition()
			local cqs = 0
			if self.commentQueue ~= nil then
				cqs = self.commentQueue:getSize()
			end
			do
				local cpt = self.previousToken
				do self:getNextCharacter() end
				do
					local c1 = self:peekNextCharacter()
					if c1 ~= 34 then
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
						do return nil end
					end
					do self:getNextCharacter() end
					do
						local c2 = self:peekNextCharacter()
						if c2 ~= 34 then
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
							do return nil end
						end
						do self:acceptToken2(10) end
						do
							local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
							do sb:appendCharacter(c0) end
							do sb:appendCharacter(c1) end
							do sb:appendCharacter(c2) end
							do
								local qc = 0
								while true do
									local cn = self:getNextCharacter()
									if _g.jk.lang.Character:isEOF(cn) then
										self.currentTokenColumn = ctc
										self.currentTokenLine = ctl
										do self.iterator:setCurrentPosition(ctp) end
										while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
											do self.commentQueue:pop() end
										end
										self.previousToken = cpt
										do return nil end
									end
									do sb:appendCharacter(cn) end
									if cn == 34 then
										do qc = qc + 1 end
										if qc == 3 then
											do break end
										end
									else
										qc = 0
									end
								end
								do
									local val = sb:toString()
									local v = self.stagingToken
									self.stagingToken = nil
									do self:updateStagingToken() end
									v.line = ctl
									v.column = ctc
									v.position = ctp
									v.value = val
									do self:onTokenAccepted(v) end
									do return v end
								end
							end
						end
					end
				end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:acceptHexNumberLiteralToken(acceptUnderscores)
	do self:skipSpaces() end
	do
		local c0 = self:peekNextCharacter()
		if c0 ~= 48 then
			do return nil end
		end
		do
			local ctc = self.currentTokenColumn
			local ctl = self.currentTokenLine
			local ctp = self.iterator:getCurrentPosition()
			local cqs = 0
			if self.commentQueue ~= nil then
				cqs = self.commentQueue:getSize()
			end
			do
				local cpt = self.previousToken
				do self:getNextCharacter() end
				do
					local c1 = self:peekNextCharacter()
					if c1 ~= 120 and c1 ~= 88 then
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
						do return nil end
					end
					do self:getNextCharacter() end
					do
						local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
						do sb:appendCharacter(c0) end
						do sb:appendCharacter(c1) end
						while true do
							local cn = self:peekNextCharacter()
							if _g.jk.lang.Character:isEOF(cn) then
								do break end
							end
							if _g.jk.lang.Character:isDigit(cn) then
								do sb:appendCharacter(cn) end
							elseif cn >= 97 and cn <= 102 then
								do sb:appendCharacter(cn) end
							elseif cn >= 65 and cn <= 70 then
								do sb:appendCharacter(cn) end
							elseif cn == 95 and acceptUnderscores then
							else
								do break end
							end
							do self:getNextCharacter() end
						end
						do
							local ids = sb:toString()
							if ids == nil or _g.jk.lang.String:equals(ids, "0x") or _g.jk.lang.String:equals(ids, "0X") then
								self.currentTokenColumn = ctc
								self.currentTokenLine = ctl
								do self.iterator:setCurrentPosition(ctp) end
								while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
									do self.commentQueue:pop() end
								end
								self.previousToken = cpt
								do return nil end
							end
							do
								local v = self.stagingToken
								self.stagingToken = nil
								do self:updateStagingToken() end
								v.line = ctl
								v.column = ctc
								v.position = ctp
								v.value = ids
								do self:onTokenAccepted(v) end
								do return v end
							end
						end
					end
				end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:acceptOctalNumberLiteralToken(acceptUnderscores, requirePrefix)
	do self:skipSpaces() end
	do
		local c0 = self:peekNextCharacter()
		if c0 ~= 48 then
			do return nil end
		end
		do
			local ctc = self.currentTokenColumn
			local ctl = self.currentTokenLine
			local ctp = self.iterator:getCurrentPosition()
			local cqs = 0
			if self.commentQueue ~= nil then
				cqs = self.commentQueue:getSize()
			end
			do
				local cpt = self.previousToken
				do self:getNextCharacter() end
				do
					local c1 = 0
					if requirePrefix then
						c1 = self:peekNextCharacter()
						if c1 ~= 111 and c1 ~= 79 then
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
							do return nil end
						end
						do self:getNextCharacter() end
					end
					do
						local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
						do sb:appendCharacter(c0) end
						if requirePrefix then
							do sb:appendCharacter(c1) end
						end
						while true do
							local cn = self:peekNextCharacter()
							if _g.jk.lang.Character:isEOF(cn) then
								do break end
							end
							if cn >= 48 and cn <= 55 then
								do sb:appendCharacter(cn) end
							elseif cn == 95 and acceptUnderscores then
							else
								do break end
							end
							do self:getNextCharacter() end
						end
						do
							local ids = sb:toString()
							local isNotValidOctal = false
							if requirePrefix then
								isNotValidOctal = _g.jk.lang.String:equals(ids, "0o") or _g.jk.lang.String:equals(ids, "0O")
							else
								isNotValidOctal = _g.jk.lang.String:equals(ids, "0")
							end
							if ids == nil or isNotValidOctal then
								self.currentTokenColumn = ctc
								self.currentTokenLine = ctl
								do self.iterator:setCurrentPosition(ctp) end
								while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
									do self.commentQueue:pop() end
								end
								self.previousToken = cpt
								do return nil end
							end
							do
								local v = self.stagingToken
								self.stagingToken = nil
								do self:updateStagingToken() end
								v.line = ctl
								v.column = ctc
								v.position = ctp
								v.value = ids
								do self:onTokenAccepted(v) end
								do return v end
							end
						end
					end
				end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:acceptBinaryNumberLiteralToken(acceptUnderscores)
	do self:skipSpaces() end
	do
		local c0 = self:peekNextCharacter()
		if c0 ~= 48 then
			do return nil end
		end
		do
			local ctc = self.currentTokenColumn
			local ctl = self.currentTokenLine
			local ctp = self.iterator:getCurrentPosition()
			local cqs = 0
			if self.commentQueue ~= nil then
				cqs = self.commentQueue:getSize()
			end
			do
				local cpt = self.previousToken
				do self:getNextCharacter() end
				do
					local c1 = self:peekNextCharacter()
					if c1 ~= 98 and c1 ~= 66 then
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
						do return nil end
					end
					do self:getNextCharacter() end
					do
						local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
						do sb:appendCharacter(c0) end
						do sb:appendCharacter(c1) end
						while true do
							local cn = self:peekNextCharacter()
							if _g.jk.lang.Character:isEOF(cn) then
								do break end
							end
							if cn == 48 or cn == 49 then
								do sb:appendCharacter(cn) end
							elseif cn == 95 and acceptUnderscores then
							else
								do break end
							end
							do self:getNextCharacter() end
						end
						do
							local ids = sb:toString()
							if ids == nil or _g.jk.lang.String:equals(ids, "0b") or _g.jk.lang.String:equals(ids, "0B") then
								self.currentTokenColumn = ctc
								self.currentTokenLine = ctl
								do self.iterator:setCurrentPosition(ctp) end
								while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
									do self.commentQueue:pop() end
								end
								self.previousToken = cpt
								do return nil end
							end
							do
								local v = self.stagingToken
								self.stagingToken = nil
								do self:updateStagingToken() end
								v.line = ctl
								v.column = ctc
								v.position = ctp
								v.value = ids
								do self:onTokenAccepted(v) end
								do return v end
							end
						end
					end
				end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:acceptIntegerLiteralToken(acceptUnderscores)
	do self:skipSpaces() end
	do
		local c0 = self:peekNextCharacter()
		if _g.jk.lang.Character:isDigit(c0) == false then
			do return nil end
		end
		do
			local ctc = self.currentTokenColumn
			local ctl = self.currentTokenLine
			local ctp = self.iterator:getCurrentPosition()
			local cqs = 0
			if self.commentQueue ~= nil then
				cqs = self.commentQueue:getSize()
			end
			do
				local cpt = self.previousToken
				do self:getNextCharacter() end
				do
					local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					do sb:appendCharacter(c0) end
					while true do
						local cn = self:peekNextCharacter()
						if _g.jk.lang.Character:isEOF(cn) then
							do break end
						end
						if _g.jk.lang.Character:isDigit(cn) then
							do sb:appendCharacter(cn) end
						elseif cn == 95 and acceptUnderscores then
						else
							do break end
						end
						do self:getNextCharacter() end
					end
					do
						local ids = sb:toString()
						local v = self.stagingToken
						self.stagingToken = nil
						do self:updateStagingToken() end
						v.line = ctl
						v.column = ctc
						v.position = ctp
						v.value = ids
						do self:onTokenAccepted(v) end
						do return v end
					end
				end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:acceptDecimalNumberLiteralToken(acceptUnderscores, allowStartWithDelimiter, allowExponent, allowEndWithDelimiter)
	do self:skipSpaces() end
	do
		local c0 = self:peekNextCharacter()
		if _g.jk.lang.Character:isDigit(c0) then
		elseif c0 == 46 and allowStartWithDelimiter then
		else
			do return nil end
		end
		do
			local ctc = self.currentTokenColumn
			local ctl = self.currentTokenLine
			local ctp = self.iterator:getCurrentPosition()
			local cqs = 0
			if self.commentQueue ~= nil then
				cqs = self.commentQueue:getSize()
			end
			do
				local cpt = self.previousToken
				do self:getNextCharacter() end
				do
					local hasDelimiter = false
					local hasExp = false
					local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					if c0 == 46 then
						hasDelimiter = true
					end
					do sb:appendCharacter(c0) end
					while true do
						local cn = self:peekNextCharacter()
						if _g.jk.lang.Character:isEOF(cn) then
							do break end
						end
						if _g.jk.lang.Character:isDigit(cn) then
							do sb:appendCharacter(cn) end
							do self:getNextCharacter() end
						elseif hasDelimiter == false and cn == 46 then
							do sb:appendCharacter(cn) end
							hasDelimiter = true
							do self:getNextCharacter() end
						elseif hasExp == false and allowExponent and (cn == 101 or cn == 69) then
							do sb:appendCharacter(cn) end
							hasDelimiter = true
							hasExp = true
							do self:getNextCharacter() end
							do
								local nn = self:peekNextCharacter()
								if nn == 43 or nn == 45 then
									do sb:appendCharacter(nn) end
									do self:getNextCharacter() end
								end
							end
						elseif acceptUnderscores and cn == 95 then
							do self:getNextCharacter() end
						else
							do break end
						end
					end
					do
						local ids = sb:toString()
						if ids == nil or _g.jk.lang.String:endsWith(ids, "e") or _g.jk.lang.String:endsWith(ids, "E") then
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
							do return nil end
						end
						if ids == "." then
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
							do return nil end
						end
						if _g.jk.lang.String:startsWith(ids, ".", 0) then
							if allowStartWithDelimiter then
								ids = "0" .. _g.jk.lang.String:safeString(ids)
							else
								self.currentTokenColumn = ctc
								self.currentTokenLine = ctl
								do self.iterator:setCurrentPosition(ctp) end
								while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
									do self.commentQueue:pop() end
								end
								self.previousToken = cpt
								do return nil end
							end
						end
						if _g.jk.lang.String:endsWith(ids, ".") then
							if allowEndWithDelimiter then
								ids = _g.jk.lang.String:safeString(ids) .. "0"
							else
								self.currentTokenColumn = ctc
								self.currentTokenLine = ctl
								do self.iterator:setCurrentPosition(ctp) end
								while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
									do self.commentQueue:pop() end
								end
								self.previousToken = cpt
								do return nil end
							end
						end
						do
							local v = self.stagingToken
							self.stagingToken = nil
							do self:updateStagingToken() end
							v.line = ctl
							v.column = ctc
							v.position = ctp
							v.value = ids
							do self:onTokenAccepted(v) end
							do return v end
						end
					end
				end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:isNumberLiteralSuffixReal(c)
	if c == 100 or c == 68 or c == 102 or c == 70 then
		do return true end
	end
	do return false end
end

function sling.common.LiveTokenizingParser:acceptImmediateHashCommentToken()
	local c0 = self:peekNextCharacter()
	if c0 ~= 35 then
		do return nil end
	end
	do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			do self:getNextCharacter() end
			do
				local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				do sb:appendCharacter(c0) end
				while true do
					local cn = self:peekNextCharacter()
					if _g.jk.lang.Character:isEOF(cn) then
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
						do return nil end
					end
					if cn == 13 then
						do self:getNextCharacter() end
						goto _continue3
					end
					if cn == 10 then
						do break end
					end
					do sb:appendCharacter(cn) end
					do self:getNextCharacter() end
					::_continue3::
				end
				do
					local ids = sb:toString()
					local v = self.stagingToken
					self.stagingToken = nil
					do self:updateStagingToken() end
					v.line = ctl
					v.column = ctc
					v.position = ctp
					v.value = ids
					do self:onTokenAccepted(v) end
					do return v end
				end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:acceptImmediateSlashSlashCommentToken()
	local c0 = self:peekNextCharacter()
	if c0 ~= 47 then
		do return nil end
	end
	do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			do self:getNextCharacter() end
			do
				local c1 = self:peekNextCharacter()
				if c1 ~= 47 then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				do self:getNextCharacter() end
				do
					local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					do sb:appendCharacter(c0) end
					do sb:appendCharacter(c1) end
					while true do
						local cn = self:peekNextCharacter()
						if _g.jk.lang.Character:isEOF(cn) then
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
							do return nil end
						end
						if cn == 13 then
							do self:getNextCharacter() end
							goto _continue4
						end
						if cn == 10 then
							do break end
						end
						do sb:appendCharacter(cn) end
						do self:getNextCharacter() end
						::_continue4::
					end
					do
						local ids = sb:toString()
						local v = self.stagingToken
						self.stagingToken = nil
						do self:updateStagingToken() end
						v.line = ctl
						v.column = ctc
						v.position = ctp
						v.value = ids
						do self:onTokenAccepted(v) end
						do return v end
					end
				end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:acceptImmediateSlashAsteriskCommentToken()
	local c0 = self:peekNextCharacter()
	if c0 ~= 47 then
		do return nil end
	end
	do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			do self:getNextCharacter() end
			do
				local c1 = self:peekNextCharacter()
				if c1 ~= 42 then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				do self:getNextCharacter() end
				do
					local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					do sb:appendCharacter(c0) end
					do sb:appendCharacter(c1) end
					do
						local pc = 0
						while true do
							local cn = self:getNextCharacter()
							if _g.jk.lang.Character:isEOF(cn) then
								self.currentTokenColumn = ctc
								self.currentTokenLine = ctl
								do self.iterator:setCurrentPosition(ctp) end
								while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
									do self.commentQueue:pop() end
								end
								self.previousToken = cpt
								do return nil end
							end
							if cn == 13 then
								goto _continue5
							end
							do sb:appendCharacter(cn) end
							if pc == 42 and cn == 47 then
								do break end
							end
							pc = cn
							::_continue5::
						end
						do
							local ids = sb:toString()
							local v = self.stagingToken
							self.stagingToken = nil
							do self:updateStagingToken() end
							v.line = ctl
							v.column = ctc
							v.position = ctp
							v.value = ids
							do self:onTokenAccepted(v) end
							do return v end
						end
					end
				end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:parseIdentifierToken()
	local id = self:acceptIdentifierToken()
	if not (id ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("identifier"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return id end
end

function sling.common.LiveTokenizingParser:acceptIdentifier()
	local v = self:acceptIdentifierToken()
	if not (v ~= nil) then
		do return nil end
	end
	do return v.value end
end

function sling.common.LiveTokenizingParser:parseIdentifier()
	local v = self:parseIdentifierToken()
	if not (v ~= nil) then
		do return nil end
	end
	do return v.value end
end

function sling.common.LiveTokenizingParser:parseToken1(token)
	local v = self:acceptToken1(token)
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText(token), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.common.LiveTokenizingParser:parseToken2(token)
	local v = self:acceptToken2(token)
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText(_g.jk.lang.String:forCharacter(token)), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.common.LiveTokenizingParser:acceptCommentString()
	local t = self:acceptCommentToken()
	if not (t ~= nil) then
		do return nil end
	end
	do return t:getValue() end
end

function sling.common.LiveTokenizingParser:acceptCommentToken()
	if self.commentQueue ~= nil and (self.improperCommentPolicy == _g.sling.common.LiveTokenizingParser.IMPROPER_COMMENT_QUEUE or self.improperCommentPolicy == _g.sling.common.LiveTokenizingParser.IMPROPER_COMMENT_WARN_QUEUE or self.improperCommentPolicy == _g.sling.common.LiveTokenizingParser.IMPROPER_COMMENT_WARN_IGNORE) then
		while true do
			local cc = self.commentQueue:pop()
			if cc ~= nil then
				local isImproper = true
				if cc == self.previousToken then
					isImproper = false
				end
				if self.improperCommentPolicy == _g.sling.common.LiveTokenizingParser.IMPROPER_COMMENT_WARN_IGNORE then
					if isImproper then
						do self:onParseMessage(_g.sling.common.WarningMessage:forText("Improper comment", cc)) end
					end
				else
					if self.improperCommentPolicy == _g.sling.common.LiveTokenizingParser.IMPROPER_COMMENT_WARN_QUEUE and isImproper then
						do self:onParseMessage(_g.sling.common.WarningMessage:forText("Improper comment", cc)) end
					end
					do return cc end
				end
			else
				do break end
			end
		end
	end
	do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			local n = 0
			while true do
				if self:skipSpaceCharacter() then
					do n = n + 1 end
					goto _continue6
				end
				do break end
				::_continue6::
			end
			do
				local v = self:acceptImmediateCommentToken()
				if v ~= nil then
					do return v end
				end
				if n > 0 then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
				end
				do return nil end
			end
		end
	end
end

function sling.common.LiveTokenizingParser:skipSpaceCharacter()
	if self:isSpaceCharacter(self:peekNextCharacter()) then
		do self:getNextCharacter() end
		do return true end
	end
	do return false end
end

function sling.common.LiveTokenizingParser:isValidIdentifier(t)
	if not (t ~= nil) then
		do return false end
	end
	do
		local c = _g.jk.lang.String:getChar(t, 0)
		if not self:isValidIdentifierPrefix(c) then
			do return false end
		end
		do
			local it = self.tokenIterator
			do it:setString(t) end
			do it:getNextChar() end
			while true do
				local c = it:getNextChar()
				if _g.jk.lang.Character:isEOF(c) then
					do break end
				end
				if self:isValidIdentifierCharacter(c) == false then
					do return false end
				end
			end
			do return true end
		end
	end
end

function sling.common.LiveTokenizingParser:isValidIdentifierPrefix(c)
	do return false end
end

function sling.common.LiveTokenizingParser:isValidIdentifierCharacter(c)
	do return false end
end

function sling.common.LiveTokenizingParser:preprocessContent(content)
	do return content end
end

function sling.common.LiveTokenizingParser:acceptImmediateCommentToken()
	do return nil end
end

function sling.common.LiveTokenizingParser:getImproperCommentPolicy()
	do return self.improperCommentPolicy end
end

function sling.common.LiveTokenizingParser:setImproperCommentPolicy(v)
	self.improperCommentPolicy = v
	do return self end
end

function sling.common.LiveTokenizingParser:getTokensAreCaseSensitive()
	do return self.tokensAreCaseSensitive end
end

function sling.common.LiveTokenizingParser:setTokensAreCaseSensitive(v)
	self.tokensAreCaseSensitive = v
	do return self end
end

function sling.common.LiveTokenizingParser:getFileEncoding()
	do return self.fileEncoding end
end

function sling.common.LiveTokenizingParser:setFileEncoding(v)
	self.fileEncoding = v
	do return self end
end

function sling.common.LiveTokenizingParser:getParseMessages()
	do return self.parseMessages end
end

function sling.common.LiveTokenizingParser:setParseMessages(v)
	self.parseMessages = v
	do return self end
end

function sling.common.LiveTokenizingParser:getAllowSkipSpaces()
	do return self.allowSkipSpaces end
end

function sling.common.LiveTokenizingParser:setAllowSkipSpaces(v)
	self.allowSkipSpaces = v
	do return self end
end

sling.common.NodeVisitor = {}
sling.common.NodeVisitor.__index = sling.common.NodeVisitor
_vm:set_metatable(sling.common.NodeVisitor, {})

function sling.common.NodeVisitor._create()
	local v = _vm:set_metatable({}, sling.common.NodeVisitor)
	return v
end

function sling.common.NodeVisitor:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.NodeVisitor'
	self['_isType.sling.common.NodeVisitor'] = true
	self.skipChildren = false
	self.level = 0
end

function sling.common.NodeVisitor:_construct0()
	sling.common.NodeVisitor._init(self)
	return self
end

function sling.common.NodeVisitor:onStartVisit(node)
	do self.level = self.level + 1 end
	do return true end
end

function sling.common.NodeVisitor:onEndVisit(node)
	do self.level = self.level - 1 end
	self.skipChildren = false
	do return true end
end

function sling.common.NodeVisitor:visit(node)
	do return true end
end

function sling.common.NodeVisitor:getSkipChildren()
	do return self.skipChildren end
end

function sling.common.NodeVisitor:setSkipChildren(v)
	self.skipChildren = v
	do return self end
end

function sling.common.NodeVisitor:getLevel()
	do return self.level end
end

function sling.common.NodeVisitor:setLevel(v)
	self.level = v
	do return self end
end

sling.common.WarningMessage = _g.sling.common.Message._create()
sling.common.WarningMessage.__index = sling.common.WarningMessage
_vm:set_metatable(sling.common.WarningMessage, {
	__index = _g.sling.common.Message
})

function sling.common.WarningMessage._create()
	local v = _vm:set_metatable({}, sling.common.WarningMessage)
	return v
end

function sling.common.WarningMessage:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.WarningMessage'
	self['_isType.sling.common.WarningMessage'] = true
end

function sling.common.WarningMessage:_construct0()
	sling.common.WarningMessage._init(self)
	do _g.sling.common.Message._construct0(self) end
	return self
end

function sling.common.WarningMessage:forText(t, ref)
	local v = _g.sling.common.WarningMessage._construct0(_g.sling.common.WarningMessage._create())
	do v:setMessage(t) end
	do v:setReference(ref) end
	do return v end
end

function sling.common.WarningMessage:getType()
	do return "warning" end
end

sling.common.FileParser = {}

sling.common.RefLog = {}
sling.common.RefLog.__index = sling.common.RefLog
_vm:set_metatable(sling.common.RefLog, {})

function sling.common.RefLog._create()
	local v = _vm:set_metatable({}, sling.common.RefLog)
	return v
end

function sling.common.RefLog:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.RefLog'
	self['_isType.sling.common.RefLog'] = true
end

function sling.common.RefLog:_construct0()
	sling.common.RefLog._init(self)
	return self
end

function sling.common.RefLog:error(ctx, text, ref, trace)
	local isInDebugMode = true
	if ctx ~= nil then
		isInDebugMode = ctx:isInDebugMode()
	end
	do _g.sling.common.RefLog:message(ctx, _g.sling.common.ErrorMessage:forText(text, ref, isInDebugMode, trace)) end
end

function sling.common.RefLog:warning(ctx, text, ref)
	do _g.sling.common.RefLog:message(ctx, _g.sling.common.WarningMessage:forText(text, ref)) end
end

function sling.common.RefLog:info(ctx, text, ref)
	do _g.sling.common.RefLog:message(ctx, _g.sling.common.InfoMessage:forText(text, ref)) end
end

function sling.common.RefLog:debug(ctx, text, ref)
	do _g.sling.common.RefLog:message(ctx, _g.sling.common.DebugMessage:forText(text, ref)) end
end

function sling.common.RefLog:status(ctx, text)
	do _g.sling.common.RefLog:message(ctx, _g.sling.common.StatusMessage:forText(text)) end
end

function sling.common.RefLog:message(ctx, msg)
	if not (ctx ~= nil and msg ~= nil) then
		do return end
	end
	if (_vm:to_table_with_key(ctx, '_isType.sling.common.RefLogContext') ~= nil) then
		do ctx:onMessage(msg) end
		do return end
	end
	do
		local txt = msg:toStringWithDebug(ctx:isInDebugMode())
		if (_vm:to_table_with_key(msg, '_isType.sling.common.DebugMessage') ~= nil) then
			if txt ~= nil then
				do _g.jk.log.Log:debug(ctx, txt) end
			end
		elseif (_vm:to_table_with_key(msg, '_isType.sling.common.WarningMessage') ~= nil) then
			if txt ~= nil then
				do _g.jk.log.Log:warning(ctx, txt) end
			end
		elseif (_vm:to_table_with_key(msg, '_isType.sling.common.ErrorMessage') ~= nil) then
			if txt ~= nil then
				do _g.jk.log.Log:error(ctx, txt) end
			end
		elseif (_vm:to_table_with_key(msg, '_isType.sling.common.StatusMessage') ~= nil) then
			do _g.jk.log.Log:status(ctx, txt) end
		elseif txt ~= nil then
			do _g.jk.log.Log:info(ctx, txt) end
		end
	end
end

sling.common.StaticSourceReference = {}
sling.common.StaticSourceReference.__index = sling.common.StaticSourceReference
_vm:set_metatable(sling.common.StaticSourceReference, {})

function sling.common.StaticSourceReference._create()
	local v = _vm:set_metatable({}, sling.common.StaticSourceReference)
	return v
end

function sling.common.StaticSourceReference:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.StaticSourceReference'
	self['_isType.sling.common.StaticSourceReference'] = true
	self['_isType.sling.common.SourceReference'] = true
	self.name = nil
	self.token = nil
	self.lineNumber = 0
	self.columnNumber = 0
	self.contentLine = nil
	self.sourceReference = nil
end

function sling.common.StaticSourceReference:_construct0()
	sling.common.StaticSourceReference._init(self)
	return self
end

function sling.common.StaticSourceReference:instance(name, token, line, column, content, ref)
	local v = _g.sling.common.StaticSourceReference._construct0(_g.sling.common.StaticSourceReference._create())
	do v:setName(name) end
	do v:setToken(token) end
	do v:setLineNumber(line) end
	do v:setColumnNumber(column) end
	do v:setContentLine(content) end
	do v:setSourceReference(ref) end
	do return v end
end

function sling.common.StaticSourceReference:forFile(file)
	local cn = _g.sling.common.MessageFormatter:getFilePath(file)
	if _g.jk.lang.String:isEmpty(cn) then
		cn = "<file>"
	end
	do
		local v = _g.sling.common.StaticSourceReference._construct0(_g.sling.common.StaticSourceReference._create())
		do v:setName(cn) end
		do v:setToken(nil) end
		do v:setLineNumber(-1) end
		do v:setColumnNumber(-1) end
		do v:setContentLine(nil) end
		do v:setSourceReference(nil) end
		do return v end
	end
end

function sling.common.StaticSourceReference:getSourceName()
	do return self.name end
end

function sling.common.StaticSourceReference:getSourceToken()
	do return self.token end
end

function sling.common.StaticSourceReference:getSourceLineNumber()
	do return self.lineNumber end
end

function sling.common.StaticSourceReference:getSourceColumnNumber()
	do return self.columnNumber end
end

function sling.common.StaticSourceReference:getSourceContentLine()
	do return self.contentLine end
end

function sling.common.StaticSourceReference:getNodeTrace()
	if self.sourceReference ~= nil then
		do return self.sourceReference:getNodeTrace() end
	end
	do return nil end
end

function sling.common.StaticSourceReference:getName()
	do return self.name end
end

function sling.common.StaticSourceReference:setName(v)
	self.name = v
	do return self end
end

function sling.common.StaticSourceReference:getToken()
	do return self.token end
end

function sling.common.StaticSourceReference:setToken(v)
	self.token = v
	do return self end
end

function sling.common.StaticSourceReference:getLineNumber()
	do return self.lineNumber end
end

function sling.common.StaticSourceReference:setLineNumber(v)
	self.lineNumber = v
	do return self end
end

function sling.common.StaticSourceReference:getColumnNumber()
	do return self.columnNumber end
end

function sling.common.StaticSourceReference:setColumnNumber(v)
	self.columnNumber = v
	do return self end
end

function sling.common.StaticSourceReference:getContentLine()
	do return self.contentLine end
end

function sling.common.StaticSourceReference:setContentLine(v)
	self.contentLine = v
	do return self end
end

function sling.common.StaticSourceReference:getSourceReference()
	do return self.sourceReference end
end

function sling.common.StaticSourceReference:setSourceReference(v)
	self.sourceReference = v
	do return self end
end

sling.common.Token = {}
sling.common.Token.__index = sling.common.Token
_vm:set_metatable(sling.common.Token, {})

function sling.common.Token._create()
	local v = _vm:set_metatable({}, sling.common.Token)
	return v
end

function sling.common.Token:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.Token'
	self['_isType.sling.common.Token'] = true
	self['_isType.sling.common.SourceReference'] = true
	self.value = nil
	self.line = 0
	self.column = 0
	self.position = 0
	self.source = nil
end

function sling.common.Token:_construct0()
	sling.common.Token._init(self)
	return self
end

function sling.common.Token:instance(value, line, column, position)
	local v = _g.sling.common.Token._construct0(_g.sling.common.Token._create())
	v.value = value
	v.line = line
	v.column = column
	v.position = position
	do return v end
end

function sling.common.Token:dupWithValue(str)
	local v = _g.sling.common.Token._construct0(_g.sling.common.Token._create())
	v.value = str
	v.line = self.line
	v.column = self.column
	v.position = self.position
	v.source = self.source
	do return v end
end

function sling.common.Token:getTokenLineCount()
	if self.value == nil then
		do return 0 end
	end
	do
		local v = 1
		local it = _g.jk.lang.String:iterate(self.value)
		while true do
			local c = it:getNextChar()
			if c < 1 then
				do break end
			end
			if c == 10 then
				do v = v + 1 end
			end
		end
		do return v end
	end
end

function sling.common.Token:setValue(val)
	self.value = val
	do return self end
end

function sling.common.Token:getValue()
	do return self.value end
end

function sling.common.Token:getSourceName()
	if not (self.source ~= nil) then
		do return nil end
	end
	do return self.source:getName() end
end

function sling.common.Token:getSourceToken()
	do return self.value end
end

function sling.common.Token:getSourceLineNumber()
	do return self.line end
end

function sling.common.Token:getSourceColumnNumber()
	do return self.column end
end

function sling.common.Token:getSourceContentLine()
	if not (self.source ~= nil) then
		do return nil end
	end
	do return self.source:getLine(self.line) end
end

function sling.common.Token:getNodeTrace()
	do return nil end
end

sling.common.RefLogContext = {}

sling.common.ContainerNode = _g.sling.common.NodeObject._create()
sling.common.ContainerNode.__index = sling.common.ContainerNode
_vm:set_metatable(sling.common.ContainerNode, {
	__index = _g.sling.common.NodeObject
})

function sling.common.ContainerNode._create()
	local v = _vm:set_metatable({}, sling.common.ContainerNode)
	return v
end

function sling.common.ContainerNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.ContainerNode'
	self['_isType.sling.common.ContainerNode'] = true
	self.nodes = nil
	self.nodeIndex = nil
	self.caseSensitiveIndex = true
end

function sling.common.ContainerNode:_construct0()
	sling.common.ContainerNode._init(self)
	do _g.sling.common.NodeObject._construct0(self) end
	return self
end

function sling.common.ContainerNode:getNodeIndexNames()
	local v = _g.jk.lang.Map:getKeys(self.nodeIndex)
	do return v end
end

function sling.common.ContainerNode:getNodeIndexForName(name)
	if not (self.nodeIndex ~= nil) then
		do return nil end
	end
	if self.caseSensitiveIndex == false then
		do return _g.jk.lang.Map:get(self.nodeIndex, _g.jk.lang.String:toLowerCase(name)) end
	end
	do return _g.jk.lang.Map:get(self.nodeIndex, name) end
end

function sling.common.ContainerNode:copyTo(node)
	if not _g.sling.common.NodeObject.copyTo(self, node) then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(node, '_isType.sling.common.ContainerNode')
		if n == nil then
			do return true end
		end
		do n:clearNodes() end
		do n:setCaseSensitiveIndex(self:getCaseSensitiveIndex()) end
		if self.nodes ~= nil then
			local n2 = 0
			local m = _g.jk.lang.Vector:getSize(self.nodes)
			do
				n2 = 0
				while n2 < m do
					local cn = _vm:to_table_with_key(self.nodes[n2 + 1], '_isType.sling.common.NodeObject')
					if cn ~= nil then
						local ndup = cn:dup()
						if not (ndup ~= nil) then
							do return false end
						end
						do n:addNode(ndup) end
					end
					do n2 = n2 + 1 end
				end
			end
		end
		do return true end
	end
end

function sling.common.ContainerNode:getChildCount()
	if self.nodes == nil then
		do return 0 end
	end
	do return _g.jk.lang.Vector:getSize(self.nodes) end
end

sling.common.ContainerNode.MyInsertionPoint = {}
sling.common.ContainerNode.MyInsertionPoint.__index = sling.common.ContainerNode.MyInsertionPoint
_vm:set_metatable(sling.common.ContainerNode.MyInsertionPoint, {})

function sling.common.ContainerNode.MyInsertionPoint._create()
	local v = _vm:set_metatable({}, sling.common.ContainerNode.MyInsertionPoint)
	return v
end

function sling.common.ContainerNode.MyInsertionPoint:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.ContainerNode.MyInsertionPoint'
	self['_isType.sling.common.ContainerNode.MyInsertionPoint'] = true
	self['_isType.sling.common.NodeInsertionPoint'] = true
	self.container = nil
	self.nodes = nil
	self.index = 0
end

function sling.common.ContainerNode.MyInsertionPoint:_construct0()
	sling.common.ContainerNode.MyInsertionPoint._init(self)
	return self
end

function sling.common.ContainerNode.MyInsertionPoint:insertBefore(n)
	if not (n ~= nil) then
		do return false end
	end
	do _g.jk.lang.Vector:insert(self.nodes, n, self.index) end
	do n:setParent(self.container) end
	do self.container:addToIndex(n) end
	do self.index = self.index + 1 end
	do return true end
end

function sling.common.ContainerNode.MyInsertionPoint:insertAfter(n)
	if not (n ~= nil) then
		do return false end
	end
	do _g.jk.lang.Vector:insert(self.nodes, n, self.index + 1) end
	do n:setParent(self.container) end
	do self.container:addToIndex(n) end
	do return true end
end

function sling.common.ContainerNode.MyInsertionPoint:getBefore()
	do return _vm:to_table_with_key(_g.jk.lang.Vector:get(self.nodes, self.index - 1), '_isType.sling.common.NodeObject') end
end

function sling.common.ContainerNode.MyInsertionPoint:getNode()
	do return _vm:to_table_with_key(_g.jk.lang.Vector:get(self.nodes, self.index), '_isType.sling.common.NodeObject') end
end

function sling.common.ContainerNode.MyInsertionPoint:getAfter()
	do return _vm:to_table_with_key(_g.jk.lang.Vector:get(self.nodes, self.index + 1), '_isType.sling.common.NodeObject') end
end

function sling.common.ContainerNode.MyInsertionPoint:getContainer()
	do return self.container end
end

function sling.common.ContainerNode.MyInsertionPoint:setContainer(v)
	self.container = v
	do return self end
end

function sling.common.ContainerNode.MyInsertionPoint:getNodes()
	do return self.nodes end
end

function sling.common.ContainerNode.MyInsertionPoint:setNodes(v)
	self.nodes = v
	do return self end
end

function sling.common.ContainerNode.MyInsertionPoint:getIndex()
	do return self.index end
end

function sling.common.ContainerNode.MyInsertionPoint:setIndex(v)
	self.index = v
	do return self end
end

function sling.common.ContainerNode:getInsertionPointForChild(node)
	if not (node ~= nil) then
		do return nil end
	end
	if not (self.nodes ~= nil) then
		do return nil end
	end
	do
		local m = _g.jk.lang.Vector:getSize(self.nodes)
		do
			local n = 0
			while n < m do
				local value = _g.jk.lang.Vector:get(self.nodes, n)
				if node == value then
					local v = _g.sling.common.ContainerNode.MyInsertionPoint._construct0(_g.sling.common.ContainerNode.MyInsertionPoint._create())
					do v:setContainer(self) end
					do v:setNodes(self.nodes) end
					do v:setIndex(n) end
					do return v end
				end
				do n = n + 1 end
			end
		end
		do return nil end
	end
end

function sling.common.ContainerNode:insertAboveNode(newnode, existingnode)
	if not (newnode ~= nil) then
		do return false end
	end
	if existingnode == nil then
		do self:addNode(newnode) end
		do return true end
	end
	if not (self.nodes ~= nil) then
		do return false end
	end
	do
		local m = _g.jk.lang.Vector:getSize(self.nodes)
		do
			local n = 0
			while n < m do
				local value = _g.jk.lang.Vector:get(self.nodes, n)
				if existingnode == value then
					do _g.jk.lang.Vector:insert(self.nodes, newnode, n) end
					do newnode:setParent(self) end
					do self:addToIndex(newnode) end
					do return true end
				end
				do n = n + 1 end
			end
		end
		do return false end
	end
end

function sling.common.ContainerNode:insertBelowNode(newnode, existingnode)
	if not (newnode ~= nil) then
		do return false end
	end
	if existingnode == nil then
		do self:addNode(newnode) end
		do return true end
	end
	if not (self.nodes ~= nil) then
		do return false end
	end
	do
		local m = _g.jk.lang.Vector:getSize(self.nodes)
		do
			local n = 0
			while n < m do
				local value = _g.jk.lang.Vector:get(self.nodes, n)
				if existingnode == value then
					do _g.jk.lang.Vector:insert(self.nodes, newnode, n + 1) end
					do newnode:setParent(self) end
					do self:addToIndex(newnode) end
					do return true end
				end
				do n = n + 1 end
			end
		end
		do return false end
	end
end

function sling.common.ContainerNode:replaceChild(oldnode, newnode, doExport)
	if self:replaceNodeInVector(self.nodes, oldnode, newnode, doExport) then
		if doExport then
			do self:removeFromIndex(oldnode) end
		end
		if newnode ~= nil then
			do self:addToIndex(newnode) end
		end
		do return true end
	end
	do return _g.sling.common.NodeObject.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.common.ContainerNode:replaceExport(oldnode, newnode)
	if oldnode == nil then
		if newnode ~= nil then
			do self:addNode(newnode) end
		end
		do return nil end
	end
	if newnode == nil then
		do return self:exportNode1(oldnode) end
	end
	if not (self.nodes ~= nil) then
		do return nil end
	end
	do
		local m = _g.jk.lang.Vector:getSize(self.nodes)
		do
			local n = 0
			while n < m do
				local value = _g.jk.lang.Vector:get(self.nodes, n)
				if oldnode == value then
					do self:removeFromIndex(oldnode) end
					do _g.jk.lang.Vector:set(self.nodes, n, newnode) end
					do newnode:setParent(self) end
					do self:addToIndex(newnode) end
					do return oldnode end
				end
				do n = n + 1 end
			end
		end
		do return nil end
	end
end

function sling.common.ContainerNode:getNodeTypeName()
	do return "ContainerNode" end
end

function sling.common.ContainerNode:acceptVisitor(visitor)
	if not _g.sling.common.NodeObject.acceptVisitor(self, visitor) then
		do return false end
	end
	if not self:visitVector(self.nodes, visitor) then
		do return false end
	end
	do return true end
end

function sling.common.ContainerNode:exportNode1(decl)
	if not (decl ~= nil) then
		do return nil end
	end
	if not (self.nodes ~= nil) then
		do return nil end
	end
	do _g.jk.lang.Vector:removeValue(self.nodes, decl) end
	do self:removeFromIndex(decl) end
	do return decl end
end

function sling.common.ContainerNode:getNodes()
	do return self.nodes end
end

function sling.common.ContainerNode:getFirstNode()
	if not (self.nodes ~= nil) then
		do return nil end
	end
	do return _vm:to_table_with_key(_g.jk.lang.Vector:getFirst(self.nodes), '_isType.sling.common.NodeObject') end
end

function sling.common.ContainerNode:getLastNode()
	if not (self.nodes ~= nil) then
		do return nil end
	end
	do return _vm:to_table_with_key(_g.jk.lang.Vector:getLast(self.nodes), '_isType.sling.common.NodeObject') end
end

function sling.common.ContainerNode:exportNodes()
	local v = self.nodes
	self.nodes = nil
	self.nodeIndex = nil
	do return v end
end

function sling.common.ContainerNode:importNodes(decls)
	do self:clearNodes() end
	if decls ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(decls)
		do
			n = 0
			while n < m do
				local node = _vm:to_table_with_key(decls[n + 1], '_isType.sling.common.NodeObject')
				if node ~= nil then
					do node:setParent(self) end
				end
				do n = n + 1 end
			end
		end
	end
	self.nodes = decls
end

function sling.common.ContainerNode:hasChildNode(name)
	if not (self.nodeIndex ~= nil) or not (name ~= nil) then
		do return false end
	end
	do
		local a = self:getNodeIndexForName(name)
		if _g.jk.lang.Vector:isEmpty(a) then
			do return false end
		end
		do return true end
	end
end

function sling.common.ContainerNode:setNodes(decls)
	do self:clearNodes() end
	if decls ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(decls)
		do
			n = 0
			while n < m do
				local decl = _vm:to_table_with_key(decls[n + 1], '_isType.sling.common.NodeObject')
				if decl ~= nil then
					do self:addNode(decl) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.common.ContainerNode:addToIndex(decl)
	if not (decl ~= nil) then
		do return end
	end
	if (_vm:to_table_with_key(decl, '_isType.sling.common.NamedNode') ~= nil) then
		local name = decl:getNodeName()
		if not (name ~= nil) then
			do return end
		end
		if not (self.nodeIndex ~= nil) then
			self.nodeIndex = {}
		end
		do
			local ll = self:getNodeIndexForName(name)
			if not (ll ~= nil) then
				if self.caseSensitiveIndex == false then
					name = _g.jk.lang.String:toLowerCase(name)
				end
				ll = {}
				self.nodeIndex[name] = ll
			end
			do _g.jk.lang.Vector:append(ll, decl) end
		end
	end
end

function sling.common.ContainerNode:removeFromIndex(decl)
	if not (decl ~= nil) then
		do return end
	end
	if not (self.nodeIndex ~= nil) then
		do return end
	end
	if not (_vm:to_table_with_key(decl, '_isType.sling.common.NamedNode') ~= nil) then
		do return end
	end
	do
		local name = decl:getNodeName()
		if not (name ~= nil) then
			do return end
		end
		do
			local list = self:getNodeIndexForName(name)
			if list ~= nil then
				do _g.jk.lang.Vector:removeValue(list, decl) end
				if _g.jk.lang.Vector:getSize(list) < 1 then
					if self.caseSensitiveIndex == false then
						name = _g.jk.lang.String:toLowerCase(name)
					end
					do _g.jk.lang.Map:remove(self.nodeIndex, name) end
				end
			end
		end
	end
end

function sling.common.ContainerNode:updateIndexForChild(decl)
	do _g.sling.common.NodeObject.updateIndexForChild(self, decl) end
	do self:removeFromIndex(decl) end
	do self:addToIndex(decl) end
end

function sling.common.ContainerNode:insertNode(decl, index)
	if not (decl ~= nil) then
		do return end
	end
	if not (self.nodes ~= nil) then
		self.nodes = {}
	end
	do
		local idx = index
		local ns = _g.jk.lang.Vector:getSize(self.nodes)
		if idx > ns then
			idx = ns
		end
		if idx < 0 then
			idx = 0
		end
		do _g.jk.lang.Vector:insert(self.nodes, decl, index) end
		do self:addToIndex(decl) end
		do decl:setParent(self) end
	end
end

function sling.common.ContainerNode:addNode(decl)
	if not (decl ~= nil) then
		do return end
	end
	if not (self.nodes ~= nil) then
		self.nodes = {}
	end
	do _g.jk.lang.Vector:append(self.nodes, decl) end
	do self:addToIndex(decl) end
	do decl:setParent(self) end
end

function sling.common.ContainerNode:addToNodes(decl)
	do self:addNode(decl) end
end

function sling.common.ContainerNode:prependNode(decl)
	if not (decl ~= nil) then
		do return end
	end
	if not (self.nodes ~= nil) then
		self.nodes = {}
	end
	do _g.jk.lang.Vector:prepend(self.nodes, decl) end
	do self:addToIndex(decl) end
	do decl:setParent(self) end
end

function sling.common.ContainerNode:removeNode(decl)
	if not (decl ~= nil) then
		do return end
	end
	if not (self.nodes ~= nil) then
		do return end
	end
	do _g.jk.lang.Vector:removeValue(self.nodes, decl) end
	do decl:destroy() end
end

function sling.common.ContainerNode:clearNodes()
	self.nodeIndex = nil
	if self.nodes ~= nil then
		local n2 = 0
		local m = _g.jk.lang.Vector:getSize(self.nodes)
		do
			n2 = 0
			while n2 < m do
				local n = _vm:to_table_with_key(self.nodes[n2 + 1], '_isType.sling.common.NodeObject')
				if n ~= nil then
					do n:destroy() end
				end
				do n2 = n2 + 1 end
			end
		end
	end
	self.nodes = nil
end

function sling.common.ContainerNode:onChildDestroy(node)
	do _g.sling.common.NodeObject.onChildDestroy(self, node) end
	do self:removeFromIndex(node) end
end

function sling.common.ContainerNode:destroy()
	do _g.sling.common.NodeObject.destroy(self) end
	do self:clearNodes() end
end

function sling.common.ContainerNode:merge(other)
	if not (other ~= nil) then
		do return true end
	end
	do
		local array = other:exportNodes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
					if node ~= nil then
						if (_vm:to_table_with_key(node, '_isType.sling.common.NamedNode') ~= nil) and (_vm:to_table_with_key(node, '_isType.sling.common.ContainerNode') ~= nil) then
							local nt = node:getNodeTypeName()
							local idx = self:getNodeIndexForName(node:getNodeName())
							if nt ~= nil and idx ~= nil and _g.jk.lang.Vector:getSize(idx) > 0 then
								local ok = false
								if idx ~= nil then
									local n2 = 0
									local m2 = _g.jk.lang.Vector:getSize(idx)
									do
										n2 = 0
										while n2 < m2 do
											local xnode = _vm:to_table_with_key(idx[n2 + 1], '_isType.sling.common.ContainerNode')
											if xnode ~= nil then
												if nt == xnode:getNodeTypeName() then
													if not xnode:merge(node) then
														do return false end
													end
													ok = true
													do break end
												end
											end
											do n2 = n2 + 1 end
										end
									end
								end
								if ok then
									goto _continue7
								end
							end
						end
						do self:addNode(node) end
					end
					::_continue7::
					do n = n + 1 end
				end
			end
		end
		do return true end
	end
end

function sling.common.ContainerNode:getCaseSensitiveIndex()
	do return self.caseSensitiveIndex end
end

function sling.common.ContainerNode:setCaseSensitiveIndex(v)
	self.caseSensitiveIndex = v
	do return self end
end

sling.common.NamedNode = {}

sling.common.NamedContainerNode = _g.sling.common.ContainerNode._create()
sling.common.NamedContainerNode.__index = sling.common.NamedContainerNode
_vm:set_metatable(sling.common.NamedContainerNode, {
	__index = _g.sling.common.ContainerNode
})

function sling.common.NamedContainerNode._create()
	local v = _vm:set_metatable({}, sling.common.NamedContainerNode)
	return v
end

function sling.common.NamedContainerNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.NamedContainerNode'
	self['_isType.sling.common.NamedContainerNode'] = true
	self['_isType.sling.common.NamedNode'] = true
	self.name = nil
end

function sling.common.NamedContainerNode:_construct0()
	sling.common.NamedContainerNode._init(self)
	do _g.sling.common.ContainerNode._construct0(self) end
	return self
end

function sling.common.NamedContainerNode:getNodeName()
	do return self.name end
end

function sling.common.NamedContainerNode:renameNode(name)
	do self:setName(name) end
end

function sling.common.NamedContainerNode:setName(name)
	self.name = name
	do self:onIndexPropertiesChanged() end
end

function sling.common.NamedContainerNode:getNodeTypeName()
	do return "NamedContainerNode" end
end

function sling.common.NamedContainerNode:createNew()
	do return _g.sling.common.NamedContainerNode._construct0(_g.sling.common.NamedContainerNode._create()) end
end

function sling.common.NamedContainerNode:copyTo(o)
	if _g.sling.common.ContainerNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.common.NamedContainerNode')
		if n == nil then
			do return true end
		end
		n.name = self.name
		do return true end
	end
end

function sling.common.NamedContainerNode:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.common.ContainerNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.common.NamedContainerNode:acceptVisitor(visitor)
	if _g.sling.common.ContainerNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.common.NamedContainerNode:destroy()
	do _g.sling.common.ContainerNode.destroy(self) end
end

function sling.common.NamedContainerNode:getName()
	do return self.name end
end

sling.common.PrintWriterOutputWriter = {}
sling.common.PrintWriterOutputWriter.__index = sling.common.PrintWriterOutputWriter
_vm:set_metatable(sling.common.PrintWriterOutputWriter, {})

function sling.common.PrintWriterOutputWriter._create()
	local v = _vm:set_metatable({}, sling.common.PrintWriterOutputWriter)
	return v
end

function sling.common.PrintWriterOutputWriter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.PrintWriterOutputWriter'
	self['_isType.sling.common.PrintWriterOutputWriter'] = true
	self['_isType.sling.common.OutputWriter'] = true
	self.writer = nil
	self.doClose = true
end

function sling.common.PrintWriterOutputWriter:_construct0()
	sling.common.PrintWriterOutputWriter._init(self)
	return self
end

function sling.common.PrintWriterOutputWriter:writeString(str)
	if not (self.writer ~= nil) then
		do return false end
	end
	do return self.writer:print(str) end
end

function sling.common.PrintWriterOutputWriter:writeBuffer(buf)
	if not (buf ~= nil) then
		do return true end
	end
	if not (self.writer ~= nil) then
		do return false end
	end
	do
		local sz = _g.jk.lang.Buffer:getSize(buf)
		if self.writer:write(buf, -1) == sz then
			do return true end
		end
		do return false end
	end
end

function sling.common.PrintWriterOutputWriter:finalize()
	if self.doClose then
		if (_vm:to_table_with_key(self.writer, '_isType.jk.lang.Closable') ~= nil) then
			do self.writer:close() end
		end
	end
	self.writer = nil
	do return true end
end

function sling.common.PrintWriterOutputWriter:getWriter()
	do return self.writer end
end

function sling.common.PrintWriterOutputWriter:setWriter(v)
	self.writer = v
	do return self end
end

function sling.common.PrintWriterOutputWriter:getDoClose()
	do return self.doClose end
end

function sling.common.PrintWriterOutputWriter:setDoClose(v)
	self.doClose = v
	do return self end
end

sling.common.DebugMessage = _g.sling.common.Message._create()
sling.common.DebugMessage.__index = sling.common.DebugMessage
_vm:set_metatable(sling.common.DebugMessage, {
	__index = _g.sling.common.Message
})

function sling.common.DebugMessage._create()
	local v = _vm:set_metatable({}, sling.common.DebugMessage)
	return v
end

function sling.common.DebugMessage:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.DebugMessage'
	self['_isType.sling.common.DebugMessage'] = true
end

function sling.common.DebugMessage:_construct0()
	sling.common.DebugMessage._init(self)
	do _g.sling.common.Message._construct0(self) end
	return self
end

function sling.common.DebugMessage:forText(t, ref)
	local v = _g.sling.common.DebugMessage._construct0(_g.sling.common.DebugMessage._create())
	do v:setMessage(t) end
	do v:setReference(ref) end
	do return v end
end

function sling.common.DebugMessage:forMessage(msg)
	local v = _g.sling.common.DebugMessage._construct0(_g.sling.common.DebugMessage._create())
	if msg ~= nil then
		do v:setMessage(msg:getMessage()) end
		do v:setReference(msg:getReference()) end
	end
	do return v end
end

function sling.common.DebugMessage:getType()
	do return "debug" end
end

sling.common.CodeDirectoryNode = _g.sling.common.NamedContainerNode._create()
sling.common.CodeDirectoryNode.__index = sling.common.CodeDirectoryNode
_vm:set_metatable(sling.common.CodeDirectoryNode, {
	__index = _g.sling.common.NamedContainerNode
})

function sling.common.CodeDirectoryNode._create()
	local v = _vm:set_metatable({}, sling.common.CodeDirectoryNode)
	return v
end

function sling.common.CodeDirectoryNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.CodeDirectoryNode'
	self['_isType.sling.common.CodeDirectoryNode'] = true
	self.description = nil
end

function sling.common.CodeDirectoryNode:_construct0()
	sling.common.CodeDirectoryNode._init(self)
	do _g.sling.common.NamedContainerNode._construct0(self) end
	return self
end

function sling.common.CodeDirectoryNode:getNodeTypeName()
	do return "CodeDirectoryNode" end
end

function sling.common.CodeDirectoryNode:createNew()
	do return _g.sling.common.CodeDirectoryNode._construct0(_g.sling.common.CodeDirectoryNode._create()) end
end

function sling.common.CodeDirectoryNode:copyTo(o)
	if _g.sling.common.NamedContainerNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.common.CodeDirectoryNode')
		if n == nil then
			do return true end
		end
		n.description = self.description
		do return true end
	end
end

function sling.common.CodeDirectoryNode:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.common.NamedContainerNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.common.CodeDirectoryNode:acceptVisitor(visitor)
	if _g.sling.common.NamedContainerNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.common.CodeDirectoryNode:destroy()
	do _g.sling.common.NamedContainerNode.destroy(self) end
end

function sling.common.CodeDirectoryNode:setDescription(v)
	self.description = v
end

function sling.common.CodeDirectoryNode:getDescription()
	do return self.description end
end

sling.common.ErrorMessage = _g.sling.common.Message._create()
sling.common.ErrorMessage.__index = sling.common.ErrorMessage
_vm:set_metatable(sling.common.ErrorMessage, {
	__index = _g.sling.common.Message
})

function sling.common.ErrorMessage._create()
	local v = _vm:set_metatable({}, sling.common.ErrorMessage)
	return v
end

function sling.common.ErrorMessage:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.ErrorMessage'
	self['_isType.sling.common.ErrorMessage'] = true
	self.stackTrace = nil
end

function sling.common.ErrorMessage:_construct0()
	sling.common.ErrorMessage._init(self)
	do _g.sling.common.Message._construct0(self) end
	return self
end

function sling.common.ErrorMessage:forText(t, ref, isDebug, trace)
	local v = _g.sling.common.ErrorMessage._construct0(_g.sling.common.ErrorMessage._create())
	do v:setMessage(t) end
	do v:setReference(ref) end
	if isDebug then
		if trace ~= nil then
			do v:setStackTrace(trace) end
		else
			do v:updateStackTrace() end
		end
	end
	do return v end
end

function sling.common.ErrorMessage:forError(err, ref, isDebug, trace)
	local v = _g.sling.common.ErrorMessage._construct0(_g.sling.common.ErrorMessage._create())
	do v:setMessage(_g.jk.lang.Error:asString(err)) end
	do v:setReference(ref) end
	if isDebug then
		if trace ~= nil then
			do v:setStackTrace(trace) end
		else
			do v:updateStackTrace() end
		end
	end
	do return v end
end

function sling.common.ErrorMessage:forObject(o, isDebug, trace)
	if not (o ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(o, '_isType.sling.common.ErrorMessage') ~= nil) then
		do return _vm:to_table_with_key(o, '_isType.sling.common.ErrorMessage') end
	end
	if (_vm:get_variable_type(o) == 'string') or (_vm:to_table_with_key(o, '_isType.jk.lang.StringObject') ~= nil) then
		do return _g.sling.common.ErrorMessage:forText(_g.jk.lang.String:asString(o), nil, isDebug, trace) end
	end
	if (_vm:to_table_with_key(o, '_isType.jk.lang.Error') ~= nil) then
		do return _g.sling.common.ErrorMessage:forError(o, nil, isDebug, trace) end
	end
	do return nil end
end

function sling.common.ErrorMessage:asWarning()
	local v = _g.sling.common.WarningMessage:forText(self:getMessage(), self:getReference())
	local array = self:getRelatedMessages()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local relatedMessage = array[n + 1]
				if relatedMessage ~= nil then
					do v:addRelatedMessage(relatedMessage) end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function sling.common.ErrorMessage:updateStackTrace()
	do self:setStackTrace(_g.jk.lang.StackTrace:generate()) end
end

function sling.common.ErrorMessage:getType()
	do return "error" end
end

function sling.common.ErrorMessage:toStringWithDebug(isDebug)
	local v = _g.sling.common.Message.toStringWithDebug(self, isDebug)
	if isDebug == false or _g.jk.lang.String:isEmpty(self.stackTrace) then
		do return v end
	end
	do return _g.jk.lang.String:safeString(v) .. "\n" .. _g.jk.lang.String:safeString(self.stackTrace) end
end

function sling.common.ErrorMessage:getStackTrace()
	do return self.stackTrace end
end

function sling.common.ErrorMessage:setStackTrace(v)
	self.stackTrace = v
	do return self end
end

sling.common.CodeUnitNode = _g.sling.common.NamedContainerNode._create()
sling.common.CodeUnitNode.__index = sling.common.CodeUnitNode
_vm:set_metatable(sling.common.CodeUnitNode, {
	__index = _g.sling.common.NamedContainerNode
})

function sling.common.CodeUnitNode._create()
	local v = _vm:set_metatable({}, sling.common.CodeUnitNode)
	return v
end

function sling.common.CodeUnitNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.CodeUnitNode'
	self['_isType.sling.common.CodeUnitNode'] = true
	self.description = nil
	self.settings = nil
end

function sling.common.CodeUnitNode:_construct0()
	sling.common.CodeUnitNode._init(self)
	do _g.sling.common.NamedContainerNode._construct0(self) end
	return self
end

function sling.common.CodeUnitNode:getNodeTypeName()
	do return "CodeUnitNode" end
end

function sling.common.CodeUnitNode:createNew()
	do return _g.sling.common.CodeUnitNode._construct0(_g.sling.common.CodeUnitNode._create()) end
end

function sling.common.CodeUnitNode:copyTo(o)
	if _g.sling.common.NamedContainerNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.common.CodeUnitNode')
		if n == nil then
			do return true end
		end
		if n.settings ~= nil then
			do n.settings:destroy() end
			n.settings = nil
		end
		if self.settings ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.settings), '_isType.sling.common.CodeUnitSettingsNode')
			if pcp == nil then
				do return false end
			end
			n.settings = pcp
			do n.settings:setParent(n) end
		end
		n.description = self.description
		do return true end
	end
end

function sling.common.CodeUnitNode:replaceChild(oldnode, newnode, doExport)
	if oldnode == self.settings then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.common.CodeUnitSettingsNode') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.settings:destroy() end
		end
		self.settings = _vm:to_table_with_key(newnode, '_isType.sling.common.CodeUnitSettingsNode')
		if self.settings ~= nil then
			do self.settings:setParent(self) end
		end
		do return true end
	end
	do return _g.sling.common.NamedContainerNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.common.CodeUnitNode:acceptVisitor(visitor)
	if _g.sling.common.NamedContainerNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self.settings ~= nil then
		if self.settings:accept(visitor) == false then
			do return false end
		end
	end
	do return true end
end

function sling.common.CodeUnitNode:destroy()
	do _g.sling.common.NamedContainerNode.destroy(self) end
	if self.settings ~= nil then
		do self.settings:destroy() end
		self.settings = nil
	end
end

function sling.common.CodeUnitNode:setSettings(v, doExport)
	if self.settings ~= nil and doExport == false then
		do self.settings:destroy() end
	end
	self.settings = v
	if self.settings ~= nil then
		do self.settings:setParent(self) end
	end
end

function sling.common.CodeUnitNode:getSettings()
	do return self.settings end
end

function sling.common.CodeUnitNode:exportSettings()
	local v = self.settings
	self.settings = nil
	do return v end
end

function sling.common.CodeUnitNode:setDescription(v)
	self.description = v
end

function sling.common.CodeUnitNode:getDescription()
	do return self.description end
end

sling.common.DirectoryOutputWriterManager = {}
sling.common.DirectoryOutputWriterManager.__index = sling.common.DirectoryOutputWriterManager
_vm:set_metatable(sling.common.DirectoryOutputWriterManager, {})

function sling.common.DirectoryOutputWriterManager._create()
	local v = _vm:set_metatable({}, sling.common.DirectoryOutputWriterManager)
	return v
end

function sling.common.DirectoryOutputWriterManager:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.DirectoryOutputWriterManager'
	self['_isType.sling.common.DirectoryOutputWriterManager'] = true
	self['_isType.sling.common.OutputWriterManager'] = true
	self.directory = nil
	self.ctx = nil
	self.overwrite = false
	self.files = nil
end

function sling.common.DirectoryOutputWriterManager:_construct0()
	sling.common.DirectoryOutputWriterManager._init(self)
	return self
end

function sling.common.DirectoryOutputWriterManager:forDirectory(ctx, dir, overwrite)
	local v = _g.sling.common.DirectoryOutputWriterManager._construct0(_g.sling.common.DirectoryOutputWriterManager._create())
	do v:setDirectory(dir) end
	do v:setCtx(ctx) end
	do v:setOverwrite(overwrite) end
	do return v end
end

function sling.common.DirectoryOutputWriterManager:sanitizeComponent(comp)
	if _g.jk.os.OS:isWindows() == false then
		do return comp end
	end
	do
		local str = comp
		local dot = _g.jk.lang.String:getIndexOfCharacter(str, 46, 0)
		if dot >= 0 then
			str = _g.jk.lang.String:getSubString(str, 0, dot)
		end
		do
			local array = {
				"con",
				"prn",
				"aux",
				"nul",
				"com1",
				"com2",
				"com3",
				"com4",
				"com5",
				"com6",
				"com7",
				"com8",
				"com9",
				"lpt1",
				"lpt2",
				"lpt3",
				"lpt4",
				"lpt5",
				"lpt6",
				"lpt7",
				"lpt8",
				"lpt9"
			}
			if array ~= nil then
				local n = 0
				local m = #array
				do
					n = 0
					while n < m do
						local reserved = (function(o)
							if (_vm:get_variable_type(o) == 'string') then
								do return o end
							end
							do return nil end
						end)(array[n + 1])
						if reserved ~= nil then
							if _g.jk.lang.String:equalsIgnoreCase(str, reserved) then
								do return "_" .. _g.jk.lang.String:safeString(comp) end
							end
						end
						do n = n + 1 end
					end
				end
			end
			do return comp end
		end
	end
end

function sling.common.DirectoryOutputWriterManager:getOutputFile(name)
	if not (self.directory ~= nil) then
		do _g.sling.common.RefLog:error(self.ctx, "No directory specified for DirectoryOutputWriterManager", nil, nil) end
		do return nil end
	end
	if not (name ~= nil) then
		do _g.sling.common.RefLog:error(self.ctx, "No filename specified for DirectoryOutputWriterManager", nil, nil) end
		do return nil end
	end
	do
		local ff = self.directory
		local nn = _g.jk.lang.String:replaceCharacter(name, 92, 47)
		local array = _g.jk.lang.String:split(nn, 47, 0)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local comp = array[n + 1]
					if comp ~= nil then
						ff = ff:entry(self:sanitizeComponent(comp))
					end
					do n = n + 1 end
				end
			end
		end
		do
			local pp = ff:getParent()
			do pp:createDirectoryRecursive() end
			do _g.sling.common.RefLog:debug(self.ctx, "Writing file: `" .. _g.jk.lang.String:safeString(_g.sling.common.MessageFormatter:getFilePath(ff)) .. "'", nil) end
			if self.overwrite == false then
				if not (ff:exists() == false) then
					do _g.sling.common.RefLog:error(self.ctx, "File already exists, cannot write: `" .. _g.jk.lang.String:safeString(_g.sling.common.MessageFormatter:getFilePath(ff)) .. "'", nil, nil) end
					do return nil end
				end
			end
			do
				local wr = ff:write()
				if not (wr ~= nil) then
					local errorMessage = _g.sling.common.ErrorMessage:forText("Failed to write file: `" .. _g.jk.lang.String:safeString(_g.sling.common.MessageFormatter:getFilePath(ff)) .. "'", nil, self.ctx:isInDebugMode(), nil)
					local ed = ff:getLastErrorDescription()
					if _g.jk.lang.String:isNotEmpty(ed) then
						do errorMessage:addRelatedMessage(_g.sling.common.ErrorMessage:forText(ed, nil, self.ctx:isInDebugMode(), nil)) end
					end
					do _g.sling.common.RefLog:message(self.ctx, errorMessage) end
					do return nil end
				end
				if not (self.files ~= nil) then
					self.files = {}
				end
				do _g.jk.lang.Vector:append(self.files, ff) end
				do return _g.sling.common.PrintWriterOutputWriter._construct0(_g.sling.common.PrintWriterOutputWriter._create()):setWriter(_g.jk.io.PrintWriterWrapper:forWriter(wr)) end
			end
		end
	end
end

function sling.common.DirectoryOutputWriterManager:finalize()
end

function sling.common.DirectoryOutputWriterManager:getDirectory()
	do return self.directory end
end

function sling.common.DirectoryOutputWriterManager:setDirectory(v)
	self.directory = v
	do return self end
end

function sling.common.DirectoryOutputWriterManager:getCtx()
	do return self.ctx end
end

function sling.common.DirectoryOutputWriterManager:setCtx(v)
	self.ctx = v
	do return self end
end

function sling.common.DirectoryOutputWriterManager:getOverwrite()
	do return self.overwrite end
end

function sling.common.DirectoryOutputWriterManager:setOverwrite(v)
	self.overwrite = v
	do return self end
end

function sling.common.DirectoryOutputWriterManager:getFiles()
	do return self.files end
end

function sling.common.DirectoryOutputWriterManager:setFiles(v)
	self.files = v
	do return self end
end

sling.common.StaticTextErrorMessage = _g.sling.common.ErrorMessage._create()
sling.common.StaticTextErrorMessage.__index = sling.common.StaticTextErrorMessage
_vm:set_metatable(sling.common.StaticTextErrorMessage, {
	__index = _g.sling.common.ErrorMessage
})

function sling.common.StaticTextErrorMessage._create()
	local v = _vm:set_metatable({}, sling.common.StaticTextErrorMessage)
	return v
end

function sling.common.StaticTextErrorMessage:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.StaticTextErrorMessage'
	self['_isType.sling.common.StaticTextErrorMessage'] = true
	self.text = nil
end

function sling.common.StaticTextErrorMessage:_construct0()
	sling.common.StaticTextErrorMessage._init(self)
	do _g.sling.common.ErrorMessage._construct0(self) end
	return self
end

function sling.common.StaticTextErrorMessage:getPrefix()
	do return nil end
end

function sling.common.StaticTextErrorMessage:getMessageString()
	local pf = self:getPrefix()
	if not (pf ~= nil) then
		pf = "Error"
	end
	if _g.jk.lang.String:isEmpty(self.text) then
		do return pf end
	end
	do return _g.jk.lang.String:safeString(pf) .. ": " .. _g.jk.lang.String:safeString(self.text) end
end

function sling.common.StaticTextErrorMessage:getText()
	do return self.text end
end

function sling.common.StaticTextErrorMessage:setText(v)
	self.text = v
	do return self end
end

sling.common.CodeStringUtil = {}
sling.common.CodeStringUtil.__index = sling.common.CodeStringUtil
_vm:set_metatable(sling.common.CodeStringUtil, {})

function sling.common.CodeStringUtil._create()
	local v = _vm:set_metatable({}, sling.common.CodeStringUtil)
	return v
end

function sling.common.CodeStringUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.CodeStringUtil'
	self['_isType.sling.common.CodeStringUtil'] = true
end

function sling.common.CodeStringUtil:_construct0()
	sling.common.CodeStringUtil._init(self)
	return self
end

function sling.common.CodeStringUtil:combineCamelCase(components)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if components ~= nil then
		local n = 0
		local m = #components
		do
			n = 0
			while n < m do
				local component = (function(o)
					if (_vm:get_variable_type(o) == 'string') then
						do return o end
					end
					do return nil end
				end)(components[n + 1])
				if component ~= nil then
					if sb:count() < 1 then
						do sb:appendString(component) end
					else
						local c0 = _g.jk.lang.String:getChar(component, 0)
						if c0 >= 97 and c0 <= 122 then
							do sb:appendCharacter(c0 - 97 + 65) end
							do sb:appendString(_g.jk.lang.String:getEndOfString(component, 1)) end
						else
							do sb:appendString(component) end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return sb:toString() end
end

function sling.common.CodeStringUtil:escapeStringLiteralCStyle(str)
	if not (str ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local it = _g.jk.lang.String:iterate(str)
		local c = 0
		while (function()
			c = it:getNextChar()
			do return c end
		end)() > 0 do
			if c == 34 then
				do sb:appendString("\\\"") end
			elseif c == 7 then
				do sb:appendString("\\a") end
			elseif c == 8 then
				do sb:appendString("\\b") end
			elseif c == 12 then
				do sb:appendString("\\f") end
			elseif c == 10 then
				do sb:appendString("\\n") end
			elseif c == 13 then
				do sb:appendString("\\r") end
			elseif c == 9 then
				do sb:appendString("\\t") end
			elseif c == 11 then
				do sb:appendString("\\v") end
			elseif c == 92 then
				do sb:appendString("\\\\") end
			else
				do sb:appendCharacter(c) end
			end
		end
		do return sb:toString() end
	end
end

function sling.common.CodeStringUtil:unescapeStringLiteralCStyle(str, removeFirstAndLast)
	if not (str ~= nil) then
		do return nil end
	end
	do
		local n = 0
		local max = _g.jk.lang.String:getLength(str)
		if removeFirstAndLast then
			max = max - 2
		end
		do
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			local it = _g.jk.lang.String:iterate(str)
			if removeFirstAndLast then
				do it:getNextChar() end
			end
			while n < max do
				local c = it:getNextChar()
				do n = n + 1 end
				if c ~= 92 then
					do sb:appendCharacter(c) end
					goto _continue10
				end
				if n >= max then
					do break end
				end
				c = it:getNextChar()
				do n = n + 1 end
				if c == 97 then
					do sb:appendCharacter(7) end
				elseif c == 98 then
					do sb:appendCharacter(8) end
				elseif c == 102 then
					do sb:appendCharacter(12) end
				elseif c == 110 then
					do sb:appendCharacter(10) end
				elseif c == 114 then
					do sb:appendCharacter(13) end
				elseif c == 116 then
					do sb:appendCharacter(9) end
				elseif c == 118 then
					do sb:appendCharacter(11) end
				elseif c == 48 then
					do sb:appendCharacter(0) end
				else
					do sb:appendCharacter(c) end
				end
				::_continue10::
			end
			do return sb:toString() end
		end
	end
end

function sling.common.CodeStringUtil:unescapeStringLiteralSingleQuoteStyle(str)
	local n = 0
	local max = _g.jk.lang.String:getLength(str) - 2
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local it = _g.jk.lang.String:iterate(str)
	do it:getNextChar() end
	while n < max do
		local c = it:getNextChar()
		do n = n + 1 end
		if c ~= 92 then
			do sb:appendCharacter(c) end
			goto _continue11
		end
		if n >= max then
			do break end
		end
		c = it:getNextChar()
		do n = n + 1 end
		if c == 39 then
			do sb:appendCharacter(39) end
		elseif c == 92 then
			do sb:appendCharacter(92) end
		else
			do sb:appendCharacter(92) end
			do sb:appendCharacter(c) end
		end
		::_continue11::
	end
	do return sb:toString() end
end

function sling.common.CodeStringUtil:unescapeCharacterLiteralCStyle(literal, removeFirstAndLast)
	local str = literal
	if removeFirstAndLast then
		if not _g.jk.lang.String:startsWith(literal, "'", 0) then
			do return nil end
		end
		if not _g.jk.lang.String:endsWith(literal, "'") then
			do return nil end
		end
		str = _g.jk.lang.String:getSubString(literal, 1, _g.jk.lang.String:getLength(literal) - 2)
	end
	do
		local c = 0
		local ll = _g.jk.lang.String:getLength(str)
		if ll == 1 then
			c = _g.jk.lang.String:getChar(str, 0)
		elseif str == "\\a" then
			c = 7
		elseif str == "\\b" then
			c = 8
		elseif str == "\\f" then
			c = 12
		elseif str == "\\n" then
			c = 10
		elseif str == "\\r" then
			c = 13
		elseif str == "\\t" then
			c = 9
		elseif str == "\\v" then
			c = 11
		elseif str == "\\\\" then
			c = 92
		elseif str == "\\'" then
			c = 39
		elseif str == "\\\"" then
			c = 34
		elseif str == "\\?" then
			c = 63
		elseif str == "\\0" then
			c = 0
		elseif ll == 4 and _g.jk.lang.String:getChar(str, 0) == 92 and _g.jk.lang.String:getChar(str, 1) == 120 then
			local s2 = _g.jk.lang.String:getSubString(str, 2, 2)
			c = _g.jk.lang.String:toIntegerFromHex(s2)
		elseif ll == 6 and _g.jk.lang.String:getChar(str, 0) == 92 and _g.jk.lang.String:getChar(str, 1) == 117 then
			local s2 = _g.jk.lang.String:getSubString(str, 2, 4)
			c = _g.jk.lang.String:toIntegerFromHex(s2)
		elseif ll == 4 and _g.jk.lang.String:getChar(str, 0) == 92 then
			do return nil end
		else
			do return nil end
		end
		do return _g.jk.lang.Character:asObject(c) end
	end
end

function sling.common.CodeStringUtil:forDoubleHex(vv, minlength)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local d = _g.jk.math.Math:abs(vv)
	local subnormal = d < -1022
	local signifBits = _g.jk.lang.Double:doubleToLongBits(vv)
	signifBits = _vm:bitwise_or(_vm:bitwise_and(signifBits, 4503599627370495), 1152921504606846976)
	do sb:appendString((function(a, b, c)
		if a then
			do return b() end
		end
		do return c() end
	end)(subnormal, function()
		do return "0." end
	end, function()
		do return "1." end
	end)) end
	do
		local signif = _g.jk.lang.String:forLongIntegerHex(signifBits, 0)
		local str = _g.jk.lang.String:getSubString(signif, 3, _g.jk.lang.String:getLength(signif) - 3)
		if _g.jk.lang.String:equals(str, "0000000000000") then
			do sb:appendString("0") end
		else
			do sb:appendString(_g.jk.lang.String:getSubString(str, 0, 1)) end
			do
				local sstr = _g.jk.lang.String:getSubString(str, 1, 12)
				sstr = _g.jk.lang.String:replaceString(sstr, "0", "")
				do sb:appendString(sstr) end
			end
		end
		do sb:appendString("p") end
		if d == 0 then
			do sb:appendString("0") end
		else
			local exponent = _util:convert_to_integer(_g.jk.math.Math:log(d) / _g.jk.math.Math:log(2))
			do sb:appendInteger((function(a, b, c)
				if a then
					do return b() end
				end
				do return c() end
			end)(subnormal, function()
				do return -1022 end
			end, function()
				do return exponent end
			end)) end
		end
		do return sb:toString() end
	end
end

function sling.common.CodeStringUtil:toDoubleFromHex(str)
	local isNegative = (function(a, b, c)
		if a then
			do return b() end
		end
		do return c() end
	end)(_g.jk.lang.String:getChar(str, 0) == 45, function()
		do return true end
	end, function()
		do return false end
	end)
	local isFractionalForm = (function(a, b, c)
		if a then
			do return b() end
		end
		do return c() end
	end)(_g.jk.lang.String:contains(str, "."), function()
		do return true end
	end, function()
		do return false end
	end)
	local iPart = nil
	local fPart = nil
	local ePart = nil
	if isFractionalForm then
		local cmp = _g.jk.lang.String:split(str, 46, 0)
		iPart = (function(o)
			if (_vm:get_variable_type(o) == 'string') then
				do return o end
			end
			do return nil end
		end)(cmp[0 + 1])
		do
			local frac = (function(o)
				if (_vm:get_variable_type(o) == 'string') then
					do return o end
				end
				do return nil end
			end)(cmp[1 + 1])
			frac = _g.jk.lang.String:toLowerCase(frac)
			if _g.jk.lang.String:contains(frac, "p") then
				local efrac = _g.jk.lang.String:split(frac, 112, 0)
				fPart = efrac[0 + 1]
				ePart = efrac[1 + 1]
			else
				fPart = frac
			end
		end
	elseif _g.jk.lang.String:contains(str, "p") then
		local efrac = _g.jk.lang.String:split(str, 112, 0)
		iPart = efrac[0 + 1]
		ePart = efrac[1 + 1]
	else
		iPart = str
	end
	do
		local significandString = nil
		local signifLength = 0
		local exponentAdjust = 0
		local leftDigits = 0
		local rightDigits = 0
		if not isFractionalForm then
			significandString = _g.jk.text.StringUtil:stripLeadingZeros(iPart)
			leftDigits = _g.jk.lang.String:getLength(significandString)
		else
			local iPortion = _g.jk.text.StringUtil:stripLeadingZeros(iPart)
			leftDigits = _g.jk.lang.String:getLength(iPortion)
			do
				local fPortion = fPart
				rightDigits = _g.jk.lang.String:getLength(fPortion)
				significandString = _g.jk.lang.String:safeString(iPortion) .. _g.jk.lang.String:safeString(fPortion)
			end
		end
		significandString = _g.jk.text.StringUtil:stripLeadingZeros(significandString)
		signifLength = _g.jk.lang.String:getLength(significandString)
		if leftDigits >= 1 then
			exponentAdjust = 4 * (leftDigits - 1)
		else
			exponentAdjust = -4 * (rightDigits - signifLength + 1)
		end
		if signifLength == 0 then
			do return (function(a, b, c)
				if a then
					do return b() end
				end
				do return c() end
			end)(isNegative, function()
				do return -0.0 end
			end, function()
				do return 0.0 end
			end) end
		end
		do
			local positiveExponent = not _g.jk.lang.String:contains(ePart, "-")
			local rawExponent = (function(a, b, c)
				if a then
					do return b() end
				end
				do return c() end
			end)(positiveExponent, function()
				do return 1 end
			end, function()
				do return -1 end
			end) * _g.jk.lang.String:toInteger(ePart)
			local exponent = rawExponent + exponentAdjust
			local round = false
			local sticky = false
			local nextShift = 0
			local significand = 0
			local leadingDigit = _g.jk.lang.Character:getHexDigit(_g.jk.lang.String:getChar(significandString, 0))
			if leadingDigit == 1 then
				significand = _vm:bitwise_or(significand, _vm:bitwise_left_shift(leadingDigit, 52))
				nextShift = 52 - 4
			elseif leadingDigit <= 3 then
				significand = _vm:bitwise_or(significand, _vm:bitwise_left_shift(leadingDigit, 51))
				nextShift = 52 - 5
				exponent = exponent + 1
			elseif leadingDigit <= 7 then
				significand = _vm:bitwise_or(significand, _vm:bitwise_left_shift(leadingDigit, 50))
				nextShift = 52 - 6
				exponent = exponent + 2
			elseif leadingDigit <= 15 then
				significand = _vm:bitwise_or(significand, _vm:bitwise_left_shift(leadingDigit, 49))
				nextShift = 52 - 7
				exponent = exponent + 3
			else
				do return 0.0 end
			end
			do
				local i = 0
				do
					i = 1
					while i < signifLength and nextShift >= 0 do
						local currentDigit = _g.jk.lang.Character:getHexDigit(_g.jk.lang.String:getChar(significandString, i))
						significand = _vm:bitwise_or(significand, _vm:bitwise_left_shift(currentDigit, nextShift))
						nextShift = nextShift - 4
						do i = i + 1 end
					end
				end
				if i < signifLength then
					local currentDigit = _g.jk.lang.Character:getHexDigit(_g.jk.lang.String:getChar(significandString, i))
					do
						local v = nextShift
						if v == -1 then
							significand = _vm:bitwise_or(significand, _vm:bitwise_right_shift(_vm:bitwise_and(currentDigit, 14), 1))
							round = _vm:bitwise_and(currentDigit, 1) ~= 0
						elseif v == -2 then
							significand = _vm:bitwise_or(significand, _vm:bitwise_right_shift(_vm:bitwise_and(currentDigit, 12), 2))
							round = _vm:bitwise_and(currentDigit, 2) ~= 0
							sticky = _vm:bitwise_and(currentDigit, 1) ~= 0
						elseif v == -3 then
							significand = _vm:bitwise_or(significand, _vm:bitwise_right_shift(_vm:bitwise_and(currentDigit, 8), 3))
							round = _vm:bitwise_and(currentDigit, 4) ~= 0
							sticky = _vm:bitwise_and(currentDigit, 3) ~= 0
						elseif v == -4 then
							round = _vm:bitwise_and(currentDigit, 8) ~= 0
							sticky = _vm:bitwise_and(currentDigit, 7) ~= 0
						else
							_io:write_to_stdout("[sling.common.CodeStringUtil.toDoubleFromHex] (CodeStringUtil.sling:376:5): Unexpected shift distance remainder." .. "\n")
							do return 0.0 end
						end
					end
					do i = i + 1 end
					while i < signifLength and not sticky do
						currentDigit = _g.jk.lang.Character:getHexDigit(_g.jk.lang.String:getChar(significandString, i))
						sticky = sticky or currentDigit ~= 0
						do i = i + 1 end
					end
				end
				do
					local doubleSignificandWidth = 53
					local doubleMinSubExp = -1022 - (doubleSignificandWidth - 1)
					if exponent > 1023 then
						do return 0.0 end
					else
						if exponent <= 1023 and exponent >= -1022 then
							significand = _vm:bitwise_or(_vm:bitwise_and(_vm:bitwise_left_shift(exponent + 1023, doubleSignificandWidth - 1), 9218868437227405312), _vm:bitwise_and(4503599627370495, significand))
						elseif exponent < doubleMinSubExp - 1 then
							do return 0.0 end
						else
							sticky = sticky or round
							round = false
							do
								local bitsDiscarded = 53 - (exponent - doubleMinSubExp + 1)
								if not (bitsDiscarded >= 1 and bitsDiscarded <= 53) then
									do return 0.0 end
								end
								round = _vm:bitwise_and(significand, _vm:bitwise_left_shift(1, bitsDiscarded - 1)) ~= 0
								if bitsDiscarded > 1 then
									local mask = _vm:bitwise_not(_vm:bitwise_left_shift(0, bitsDiscarded - 1))
									sticky = sticky or _vm:bitwise_and(significand, mask) ~= 0
								end
								significand = _vm:bitwise_right_shift(significand, bitsDiscarded)
								significand = _vm:bitwise_or(_vm:bitwise_and(_vm:bitwise_left_shift(-1022 - 1 + 1023, doubleSignificandWidth - 1), 9218868437227405312), _vm:bitwise_and(4503599627370495, significand))
							end
						end
						do
							local leastZero = _vm:bitwise_and(significand, 1) == 0
							if leastZero and round and sticky or (not leastZero and round) then
								do significand = significand + 1 end
							end
							significand = (function(a, b, c)
								if a then
									do return b() end
								end
								do return c() end
							end)(isNegative, function()
								do return _vm:bitwise_or(significand, 2147483648) end
							end, function()
								do return significand end
							end)
						end
					end
					do return _g.jk.lang.Double:longBitsToDouble(significand) end
				end
			end
		end
	end
end

sling.common.FileGenerator = {}
sling.common.FileGenerator.__index = sling.common.FileGenerator
_vm:set_metatable(sling.common.FileGenerator, {})

function sling.common.FileGenerator._create()
	local v = _vm:set_metatable({}, sling.common.FileGenerator)
	return v
end

function sling.common.FileGenerator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.FileGenerator'
	self['_isType.sling.common.FileGenerator'] = true
	self.outputCounter = 0
	self.outputWriterManager = nil
	self.ctx = nil
	self.writer = nil
	self.currentFileName = nil
end

function sling.common.FileGenerator:_construct0()
	sling.common.FileGenerator._init(self)
	return self
end

function sling.common.FileGenerator:_construct2(ctx, output)
	sling.common.FileGenerator._init(self)
	self.ctx = ctx
	self.outputWriterManager = output
	return self
end

function sling.common.FileGenerator:setCtx(ctx)
	self.ctx = ctx
end

function sling.common.FileGenerator:setOutput(output)
	self.outputWriterManager = output
end

function sling.common.FileGenerator:getCurrentWriter()
	do return self.writer end
end

function sling.common.FileGenerator:getCurrentFileName()
	do return self.currentFileName end
end

function sling.common.FileGenerator:getCurrentFileId()
	local v = self:getCurrentFileName()
	if not (v ~= nil) then
		do return nil end
	end
	do
		local fslash = _g.jk.lang.String:getIndexOfCharacter(v, 47, 0)
		if fslash > 0 then
			v = _g.jk.lang.String:getEndOfString(v, fslash + 1)
		end
		do
			local bslash = _g.jk.lang.String:getIndexOfCharacter(v, 92, 0)
			if bslash > 0 then
				v = _g.jk.lang.String:getEndOfString(v, bslash + 1)
			end
			do
				local dot = _g.jk.lang.String:getLastIndexOfCharacter(v, 46, -1)
				if dot > 0 then
					v = _g.jk.lang.String:getSubString(v, 0, dot)
				end
				do return v end
			end
		end
	end
end

function sling.common.FileGenerator:output(output)
	do self:outputDirect(output) end
end

function sling.common.FileGenerator:outputDirect(str)
	if not (self.writer ~= nil) then
		do return end
	end
	do self.writer:writeString(str) end
	do self.outputCounter = self.outputCounter + 1 end
end

function sling.common.FileGenerator:onFileStarted()
end

function sling.common.FileGenerator:onFileEnding()
end

function sling.common.FileGenerator:startFile(name)
	if self.writer ~= nil then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("startFile called, but a file is already being written.", nil, _g.jk.lang.StackTrace:generate()))
	end
	self.writer = self.outputWriterManager:getOutputFile(name)
	if not (self.writer ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to start writing file: `" .. _g.jk.lang.String:safeString(name) .. "'", nil, _g.jk.lang.StackTrace:generate()))
	end
	self.currentFileName = name
	do self:onFileStarted() end
end

function sling.common.FileGenerator:endFile()
	if not (self.writer ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("endFile called, but no file is being written.", nil, _g.jk.lang.StackTrace:generate()))
	end
	do self:onFileEnding() end
	do self.writer:finalize() end
	self.writer = nil
	self.currentFileName = nil
end

function sling.common.FileGenerator:writeToFile1(name)
	do _g.sling.common.RefLog:debug(self.ctx, "Writing to file: `" .. _g.jk.lang.String:safeString(name) .. "'", nil) end
	do
		local v = self.outputWriterManager:getOutputFile(name)
		if not (v ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to write to file: `" .. _g.jk.lang.String:safeString(name) .. "'", nil, _g.jk.lang.StackTrace:generate()))
		end
		do return v end
	end
end

function sling.common.FileGenerator:writeToRelativeFile(name)
	if not (self.currentFileName ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("writeToRelativeFile without currentFileName", nil, _g.jk.lang.StackTrace:generate()))
	end
	if not (name ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("writeToRelativeFile without name", nil, _g.jk.lang.StackTrace:generate()))
	end
	do
		local rfn = name
		local slash = _g.jk.lang.String:getLastIndexOfCharacter(self.currentFileName, 47, -1)
		if slash >= 0 then
			rfn = _g.jk.lang.String:safeString(_g.jk.lang.String:getSubString(self.currentFileName, 0, slash + 1)) .. _g.jk.lang.String:safeString(name)
		end
		do return self:writeToFile1(rfn) end
	end
end

function sling.common.FileGenerator:writeBufferToRelativeFile(buffer, name)
	local writer = self:writeToRelativeFile(name)
	local v = writer:writeBuffer(buffer)
	do writer:finalize() end
	if not v then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to write buffer to file: `" .. _g.jk.lang.String:safeString(name) .. "'", nil, _g.jk.lang.StackTrace:generate()))
	end
end

function sling.common.FileGenerator:writeFileToRelativeFile(file, name)
	if not (file ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("writeFileToRelativeFile with null file", nil, _g.jk.lang.StackTrace:generate()))
	end
	do
		local btw = file:getContentsBuffer()
		if not (btw ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to read file: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'", nil, _g.jk.lang.StackTrace:generate()))
		end
		do
			local writer = self:writeToRelativeFile(name)
			local v = writer:writeBuffer(btw)
			do writer:finalize() end
			if not v then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to write buffer to file: `" .. _g.jk.lang.String:safeString(name) .. "'", nil, _g.jk.lang.StackTrace:generate()))
			end
		end
	end
end

function sling.common.FileGenerator:writeRelativeFileToRelativeFile(relativeTo, name)
	if not (relativeTo ~= nil) or not (name ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("writeRelativeFileToRelativeFile: null parameter", nil, _g.jk.lang.StackTrace:generate()))
	end
	do
		local ff = relativeTo:getParent()
		local array = _g.jk.lang.String:split(name, 47, 0)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local comp = array[n + 1]
					if comp ~= nil then
						if _g.jk.lang.String:isNotEmpty(comp) then
							ff = ff:entry(comp)
						end
					end
					do n = n + 1 end
				end
			end
		end
		do self:writeFileToRelativeFile(ff, name) end
	end
end

function sling.common.FileGenerator:writeToFile2(name, content)
	if _g.jk.lang.String:isEmpty(name) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("empty file name", nil, _g.jk.lang.StackTrace:generate()))
	end
	if _g.jk.lang.String:isEmpty(content) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("empty content", nil, _g.jk.lang.StackTrace:generate()))
	end
	do self:startFile(name) end
	do self:output(content) end
	do self:endFile() end
end

function sling.common.FileGenerator:writeToFile3(name, content)
	if _g.jk.lang.String:isEmpty(name) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("empty file name", nil, _g.jk.lang.StackTrace:generate()))
	end
	if _g.jk.lang.Buffer:getSize(content) < 1 then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("empty content", nil, _g.jk.lang.StackTrace:generate()))
	end
	do self:startFile(name) end
	do self.writer:writeBuffer(content) end
	do self:endFile() end
end

function sling.common.FileGenerator:getOutputCounter()
	do return self.outputCounter end
end

function sling.common.FileGenerator:setOutputCounter(v)
	self.outputCounter = v
	do return self end
end

sling.common.CodeParser = _g.sling.common.LiveTokenizingParser._create()
sling.common.CodeParser.__index = sling.common.CodeParser
_vm:set_metatable(sling.common.CodeParser, {
	__index = _g.sling.common.LiveTokenizingParser
})

function sling.common.CodeParser._create()
	local v = _vm:set_metatable({}, sling.common.CodeParser)
	return v
end

function sling.common.CodeParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.CodeParser'
	self['_isType.sling.common.CodeParser'] = true
	self['_isType.sling.common.FileParser'] = true
end

function sling.common.CodeParser:_construct0()
	sling.common.CodeParser._init(self)
	do _g.sling.common.LiveTokenizingParser._construct0(self) end
	return self
end

function sling.common.CodeParser:finalizeResult1(result, file)
	if not (result ~= nil) then
		do return nil end
	end
	if file ~= nil then
		if _g.jk.lang.String:isEmpty(result:getNodeName()) then
			do result:renameNode(file:baseNameWithoutExtension()) end
		end
		if not (result:getFile() ~= nil) then
			do result:setFile(file) end
		end
	end
	do return result end
end

function sling.common.CodeParser:finalizeResult2(result, name)
	if not (result ~= nil) then
		do return nil end
	end
	if name ~= nil then
		if _g.jk.lang.String:isEmpty(result:getNodeName()) then
			do result:renameNode(name) end
		end
	end
	do return result end
end

function sling.common.CodeParser:parseFile(file)
	do self:initializeForFile(file) end
	do return self:finalizeResult1(self:parse(), file) end
end

function sling.common.CodeParser:parseString(string, name)
	do self:initializeForString(string, name) end
	do return self:finalizeResult2(self:parse(), name) end
end

function sling.common.CodeParser:parse()
end

sling.common.NamedNodeObject = _g.sling.common.NodeObject._create()
sling.common.NamedNodeObject.__index = sling.common.NamedNodeObject
_vm:set_metatable(sling.common.NamedNodeObject, {
	__index = _g.sling.common.NodeObject
})

function sling.common.NamedNodeObject._create()
	local v = _vm:set_metatable({}, sling.common.NamedNodeObject)
	return v
end

function sling.common.NamedNodeObject:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.NamedNodeObject'
	self['_isType.sling.common.NamedNodeObject'] = true
	self['_isType.sling.common.NamedNode'] = true
	self.name = nil
end

function sling.common.NamedNodeObject:_construct0()
	sling.common.NamedNodeObject._init(self)
	do _g.sling.common.NodeObject._construct0(self) end
	return self
end

function sling.common.NamedNodeObject:getNodeName()
	do return self.name end
end

function sling.common.NamedNodeObject:renameNode(name)
	do self:setName(name) end
end

function sling.common.NamedNodeObject:setName(name)
	self.name = name
	do self:onIndexPropertiesChanged() end
end

function sling.common.NamedNodeObject:getNodeTypeName()
	do return "NamedNodeObject" end
end

function sling.common.NamedNodeObject:createNew()
	do return _g.sling.common.NamedNodeObject._construct0(_g.sling.common.NamedNodeObject._create()) end
end

function sling.common.NamedNodeObject:copyTo(o)
	if _g.sling.common.NodeObject.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.common.NamedNodeObject')
		if n == nil then
			do return true end
		end
		n.name = self.name
		do return true end
	end
end

function sling.common.NamedNodeObject:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.common.NodeObject.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.common.NamedNodeObject:acceptVisitor(visitor)
	if _g.sling.common.NodeObject.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.common.NamedNodeObject:destroy()
	do _g.sling.common.NodeObject.destroy(self) end
end

function sling.common.NamedNodeObject:getName()
	do return self.name end
end

sling.common.StringOutputWriterManager = {}
sling.common.StringOutputWriterManager.__index = sling.common.StringOutputWriterManager
_vm:set_metatable(sling.common.StringOutputWriterManager, {})

function sling.common.StringOutputWriterManager._create()
	local v = _vm:set_metatable({}, sling.common.StringOutputWriterManager)
	return v
end

function sling.common.StringOutputWriterManager:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.StringOutputWriterManager'
	self['_isType.sling.common.StringOutputWriterManager'] = true
	self['_isType.sling.common.OutputWriterManager'] = true
	self.buf = nil
end

sling.common.StringOutputWriterManager.MyOutput = {}
sling.common.StringOutputWriterManager.MyOutput.__index = sling.common.StringOutputWriterManager.MyOutput
_vm:set_metatable(sling.common.StringOutputWriterManager.MyOutput, {})

function sling.common.StringOutputWriterManager.MyOutput._create()
	local v = _vm:set_metatable({}, sling.common.StringOutputWriterManager.MyOutput)
	return v
end

function sling.common.StringOutputWriterManager.MyOutput:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.StringOutputWriterManager.MyOutput'
	self['_isType.sling.common.StringOutputWriterManager.MyOutput'] = true
	self['_isType.sling.common.OutputWriter'] = true
	self.buf = nil
end

function sling.common.StringOutputWriterManager.MyOutput:_construct0()
	sling.common.StringOutputWriterManager.MyOutput._init(self)
	return self
end

function sling.common.StringOutputWriterManager.MyOutput:writeString(str)
	do self.buf:appendString(str) end
	do return true end
end

function sling.common.StringOutputWriterManager.MyOutput:writeBuffer(bb)
	do self.buf:appendString(_g.jk.lang.String:forUTF8Buffer(bb)) end
	do return true end
end

function sling.common.StringOutputWriterManager.MyOutput:finalize()
	do return true end
end

function sling.common.StringOutputWriterManager.MyOutput:getBuf()
	do return self.buf end
end

function sling.common.StringOutputWriterManager.MyOutput:setBuf(v)
	self.buf = v
	do return self end
end

function sling.common.StringOutputWriterManager:_construct0()
	sling.common.StringOutputWriterManager._init(self)
	self.buf = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	return self
end

function sling.common.StringOutputWriterManager:getOutputFile(name)
	if self.buf:count() > 0 then
		do self.buf:appendCharacter(10) end
	end
	do return _g.sling.common.StringOutputWriterManager.MyOutput._construct0(_g.sling.common.StringOutputWriterManager.MyOutput._create()):setBuf(self.buf) end
end

function sling.common.StringOutputWriterManager:getResult()
	do return self.buf:toString() end
end

function sling.common.StringOutputWriterManager:finalize()
end

function sling.common.StringOutputWriterManager:toString()
	do return self.buf:toString() end
end

sling.common.RefLogCollectorContext = {}
sling.common.RefLogCollectorContext.__index = sling.common.RefLogCollectorContext
_vm:set_metatable(sling.common.RefLogCollectorContext, {})

function sling.common.RefLogCollectorContext._create()
	local v = _vm:set_metatable({}, sling.common.RefLogCollectorContext)
	return v
end

function sling.common.RefLogCollectorContext:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.RefLogCollectorContext'
	self['_isType.sling.common.RefLogCollectorContext'] = true
	self['_isType.jk.log.LoggingContext'] = true
	self['_isType.sling.common.RefLogContext'] = true
	self.messages = nil
	self.errors = 0
	self.warnings = 0
	self.infos = 0
	self.debugs = 0
end

function sling.common.RefLogCollectorContext:_construct0()
	sling.common.RefLogCollectorContext._init(self)
	return self
end

function sling.common.RefLogCollectorContext:onMessage(message)
	if not (message ~= nil) then
		do return end
	end
	if self.messages == nil then
		self.messages = {}
	end
	do _g.jk.lang.Vector:append(self.messages, message) end
	if (_vm:to_table_with_key(message, '_isType.sling.common.ErrorMessage') ~= nil) then
		do self.errors = self.errors + 1 end
	elseif (_vm:to_table_with_key(message, '_isType.sling.common.WarningMessage') ~= nil) then
		do self.warnings = self.warnings + 1 end
	elseif (_vm:to_table_with_key(message, '_isType.sling.common.InfoMessage') ~= nil) then
		do self.infos = self.infos + 1 end
	elseif (_vm:to_table_with_key(message, '_isType.sling.common.DebugMessage') ~= nil) then
		do self.debugs = self.debugs + 1 end
	end
end

function sling.common.RefLogCollectorContext:logError(message)
	do self:onMessage(_g.sling.common.ErrorMessage:forText(message, nil, true, nil)) end
end

function sling.common.RefLogCollectorContext:logWarning(message)
	do self:onMessage(_g.sling.common.WarningMessage:forText(message, nil)) end
end

function sling.common.RefLogCollectorContext:logInfo(message)
	do self:onMessage(_g.sling.common.InfoMessage:forText(message, nil)) end
end

function sling.common.RefLogCollectorContext:logDebug(message)
	do self:onMessage(_g.sling.common.DebugMessage:forText(message, nil)) end
end

function sling.common.RefLogCollectorContext:logStatus(message)
	do self:onMessage(_g.sling.common.StatusMessage:forText(message)) end
end

function sling.common.RefLogCollectorContext:isInDebugMode()
	do return true end
end

function sling.common.RefLogCollectorContext:getErrorCount()
	do return self.errors end
end

function sling.common.RefLogCollectorContext:getWarningCount()
	do return self.warnings end
end

function sling.common.RefLogCollectorContext:getInfoCount()
	do return self.infos end
end

function sling.common.RefLogCollectorContext:getDebugCount()
	do return self.debugs end
end

function sling.common.RefLogCollectorContext:resetCounters()
	self.errors = 0
	self.warnings = 0
	self.infos = 0
	self.debugs = 0
end

function sling.common.RefLogCollectorContext:getMessages()
	do return self.messages end
end

function sling.common.RefLogCollectorContext:setMessages(v)
	self.messages = v
	do return self end
end

sling.common.ExpectedErrorMessage = _g.sling.common.StaticTextErrorMessage._create()
sling.common.ExpectedErrorMessage.__index = sling.common.ExpectedErrorMessage
_vm:set_metatable(sling.common.ExpectedErrorMessage, {
	__index = _g.sling.common.StaticTextErrorMessage
})

function sling.common.ExpectedErrorMessage._create()
	local v = _vm:set_metatable({}, sling.common.ExpectedErrorMessage)
	return v
end

function sling.common.ExpectedErrorMessage:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.ExpectedErrorMessage'
	self['_isType.sling.common.ExpectedErrorMessage'] = true
end

function sling.common.ExpectedErrorMessage:_construct0()
	sling.common.ExpectedErrorMessage._init(self)
	do _g.sling.common.StaticTextErrorMessage._construct0(self) end
	return self
end

function sling.common.ExpectedErrorMessage:forText1(t, ref, isDebug)
	local v = _g.sling.common.ExpectedErrorMessage._construct0(_g.sling.common.ExpectedErrorMessage._create())
	do v:setText(t) end
	do v:setReference(ref) end
	if isDebug then
		do v:updateStackTrace() end
	end
	do return v end
end

function sling.common.ExpectedErrorMessage:getPrefix()
	do return "Expected" end
end

sling.common.ReferenceError = _g.jk.lang.Exception._create()
sling.common.ReferenceError.__index = sling.common.ReferenceError
_vm:set_metatable(sling.common.ReferenceError, {
	__index = _g.jk.lang.Exception
})

function sling.common.ReferenceError._create()
	local v = _vm:set_metatable({}, sling.common.ReferenceError)
	return v
end

function sling.common.ReferenceError:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.ReferenceError'
	self['_isType.sling.common.ReferenceError'] = true
	self['_isType.jk.lang.StringObject'] = true
	self['_isType.jk.lang.StringObjectWithDebug'] = true
	self.error = nil
end

function sling.common.ReferenceError:_construct0()
	sling.common.ReferenceError._init(self)
	do _g.jk.lang.Exception._construct0(self) end
	return self
end

function sling.common.ReferenceError:forMessage(message, source, trace)
	local v = _g.sling.common.ReferenceError._construct0(_g.sling.common.ReferenceError._create())
	do v:setError(_g.sling.common.ErrorMessage:forText(message, source, true, trace)) end
	do return v end
end

function sling.common.ReferenceError:forErrorMessage(error)
	local v = _g.sling.common.ReferenceError._construct0(_g.sling.common.ReferenceError._create())
	do v:setError(error) end
	do return v end
end

function sling.common.ReferenceError:getMessage()
	if not (self.error ~= nil) then
		do return nil end
	end
	do return self.error:getMessage() end
end

function sling.common.ReferenceError:getReference()
	if not (self.error ~= nil) then
		do return nil end
	end
	do return self.error:getReference() end
end

function sling.common.ReferenceError:addRelatedMessage(message, source)
	do self:addRelatedMessageObject(_g.sling.common.ErrorMessage:forText(message, source, false, nil)) end
	do return self end
end

function sling.common.ReferenceError:addRelatedMessageObject(message)
	if not (self.error ~= nil and message ~= nil) then
		do return end
	end
	do self.error:addRelatedMessage(message) end
end

function sling.common.ReferenceError:toStringWithDebug(debug)
	if not (self.error ~= nil) then
		do return nil end
	end
	do return self.error:toStringWithDebug(debug) end
end

function sling.common.ReferenceError:toString()
	do return self:toStringWithDebug(false) end
end

function sling.common.ReferenceError:getError()
	do return self.error end
end

function sling.common.ReferenceError:setError(v)
	self.error = v
	do return self end
end

sling.common.CodeUnitSettingsNode = _g.sling.common.NodeObject._create()
sling.common.CodeUnitSettingsNode.__index = sling.common.CodeUnitSettingsNode
_vm:set_metatable(sling.common.CodeUnitSettingsNode, {
	__index = _g.sling.common.NodeObject
})

function sling.common.CodeUnitSettingsNode._create()
	local v = _vm:set_metatable({}, sling.common.CodeUnitSettingsNode)
	return v
end

function sling.common.CodeUnitSettingsNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.CodeUnitSettingsNode'
	self['_isType.sling.common.CodeUnitSettingsNode'] = true
end

function sling.common.CodeUnitSettingsNode:_construct0()
	sling.common.CodeUnitSettingsNode._init(self)
	do _g.sling.common.NodeObject._construct0(self) end
	return self
end

function sling.common.CodeUnitSettingsNode:getNodeTypeName()
	do return "CodeUnitSettingsNode" end
end

function sling.common.CodeUnitSettingsNode:createNew()
	do return _g.sling.common.CodeUnitSettingsNode._construct0(_g.sling.common.CodeUnitSettingsNode._create()) end
end

function sling.common.CodeUnitSettingsNode:copyTo(o)
	if _g.sling.common.NodeObject.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.common.CodeUnitSettingsNode')
		if n == nil then
			do return true end
		end
		do return true end
	end
end

function sling.common.CodeUnitSettingsNode:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.common.NodeObject.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.common.CodeUnitSettingsNode:acceptVisitor(visitor)
	if _g.sling.common.NodeObject.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.common.CodeUnitSettingsNode:destroy()
	do _g.sling.common.NodeObject.destroy(self) end
end

sling.common.CodeGenerator = _g.sling.common.FileGenerator._create()
sling.common.CodeGenerator.__index = sling.common.CodeGenerator
_vm:set_metatable(sling.common.CodeGenerator, {
	__index = _g.sling.common.FileGenerator
})

function sling.common.CodeGenerator._create()
	local v = _vm:set_metatable({}, sling.common.CodeGenerator)
	return v
end

function sling.common.CodeGenerator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.CodeGenerator'
	self['_isType.sling.common.CodeGenerator'] = true
	self.currentModule = nil
end

function sling.common.CodeGenerator:_construct0()
	sling.common.CodeGenerator._init(self)
	do _g.sling.common.FileGenerator._construct0(self) end
	return self
end

function sling.common.CodeGenerator:_construct2(ctx, output)
	sling.common.CodeGenerator._init(self)
	do _g.sling.common.FileGenerator._construct2(self, ctx, output) end
	return self
end

function sling.common.CodeGenerator:getCurrentModuleName()
	if not (self.currentModule ~= nil) then
		do return nil end
	end
	do return self.currentModule:getName() end
end

function sling.common.CodeGenerator:onModuleStarted()
end

function sling.common.CodeGenerator:onModuleEnded()
end

function sling.common.CodeGenerator:writeModule(module)
	if not (module ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null module", nil, _g.jk.lang.StackTrace:generate()))
	end
	if not (self.outputWriterManager ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No output writer manager specified", nil, _g.jk.lang.StackTrace:generate()))
	end
	self.currentModule = module
	do self:onModuleStarted() end
	do
		local error = nil
		do
			local _status, _err = _vm:execute_protected_call(function()
				do self:dumpModule(module) end
			end)
			if _err then
				if (_vm:to_table_with_key(_err, '_isType.jk.lang.Exception') ~= nil) then
					local e = _err
					error = e
				else
					_vm:throw_error(_err)
				end
			end
		end
		do self:onModuleEnded() end
		if error ~= nil then
			_vm:throw_error(error)
		end
	end
end

function sling.common.CodeGenerator:writeFile(file)
	if not (file ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null file", nil, _g.jk.lang.StackTrace:generate()))
	end
	if not (self.outputWriterManager ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No output writer manager specified", nil, _g.jk.lang.StackTrace:generate()))
	end
	do
		local error = nil
		do
			local _status, _err = _vm:execute_protected_call(function()
				do self:dumpFile(file) end
			end)
			if _err then
				if (_vm:to_table_with_key(_err, '_isType.jk.lang.Exception') ~= nil) then
					local e = _err
					error = e
				else
					_vm:throw_error(_err)
				end
			end
		end
		if error ~= nil then
			_vm:throw_error(error)
		end
	end
end

function sling.common.CodeGenerator:dumpModule(module)
end

function sling.common.CodeGenerator:dumpFile(file)
end

function sling.common.CodeGenerator:getCurrentModule()
	do return self.currentModule end
end

function sling.common.CodeGenerator:setCurrentModule(v)
	self.currentModule = v
	do return self end
end

sling.common.LanguageProvider = {}
sling.common.LanguageProvider.__index = sling.common.LanguageProvider
_vm:set_metatable(sling.common.LanguageProvider, {})

function sling.common.LanguageProvider._create()
	local v = _vm:set_metatable({}, sling.common.LanguageProvider)
	return v
end

function sling.common.LanguageProvider:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.LanguageProvider'
	self['_isType.sling.common.LanguageProvider'] = true
end

function sling.common.LanguageProvider:_construct0()
	sling.common.LanguageProvider._init(self)
	return self
end

function sling.common.LanguageProvider:getId()
end

function sling.common.LanguageProvider:getParserForFile(file)
	do return nil end
end

function sling.common.LanguageProvider:getGenerator(ctx, output)
	do _g.jk.lang.Error:throw("notSupported", _g.jk.lang.String:safeString(self:getId()) .. ":getGenerator") end
	do return nil end
end

function sling.common.LanguageProvider:transformToSling(ctx, code)
	do _g.jk.lang.Error:throw("notSupported", _g.jk.lang.String:safeString(self:getId()) .. ":transformToSling") end
end

sling.common.CodeFileNode = _g.sling.common.NamedContainerNode._create()
sling.common.CodeFileNode.__index = sling.common.CodeFileNode
_vm:set_metatable(sling.common.CodeFileNode, {
	__index = _g.sling.common.NamedContainerNode
})

function sling.common.CodeFileNode._create()
	local v = _vm:set_metatable({}, sling.common.CodeFileNode)
	return v
end

function sling.common.CodeFileNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.CodeFileNode'
	self['_isType.sling.common.CodeFileNode'] = true
	self.file = nil
	self.description = nil
end

function sling.common.CodeFileNode:_construct0()
	sling.common.CodeFileNode._init(self)
	do _g.sling.common.NamedContainerNode._construct0(self) end
	return self
end

function sling.common.CodeFileNode:getNodeTypeName()
	do return "CodeFileNode" end
end

function sling.common.CodeFileNode:createNew()
	do return _g.sling.common.CodeFileNode._construct0(_g.sling.common.CodeFileNode._create()) end
end

function sling.common.CodeFileNode:copyTo(o)
	if _g.sling.common.NamedContainerNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.common.CodeFileNode')
		if n == nil then
			do return true end
		end
		n.file = self.file
		n.description = self.description
		do return true end
	end
end

function sling.common.CodeFileNode:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.common.NamedContainerNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.common.CodeFileNode:acceptVisitor(visitor)
	if _g.sling.common.NamedContainerNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.common.CodeFileNode:destroy()
	do _g.sling.common.NamedContainerNode.destroy(self) end
end

function sling.common.CodeFileNode:setFile(v)
	self.file = v
end

function sling.common.CodeFileNode:getFile()
	do return self.file end
end

function sling.common.CodeFileNode:setDescription(v)
	self.description = v
end

function sling.common.CodeFileNode:getDescription()
	do return self.description end
end

sling.common.InfoMessage = _g.sling.common.Message._create()
sling.common.InfoMessage.__index = sling.common.InfoMessage
_vm:set_metatable(sling.common.InfoMessage, {
	__index = _g.sling.common.Message
})

function sling.common.InfoMessage._create()
	local v = _vm:set_metatable({}, sling.common.InfoMessage)
	return v
end

function sling.common.InfoMessage:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.InfoMessage'
	self['_isType.sling.common.InfoMessage'] = true
end

function sling.common.InfoMessage:_construct0()
	sling.common.InfoMessage._init(self)
	do _g.sling.common.Message._construct0(self) end
	return self
end

function sling.common.InfoMessage:forText(t, ref)
	local v = _g.sling.common.InfoMessage._construct0(_g.sling.common.InfoMessage._create())
	do v:setMessage(t) end
	do v:setReference(ref) end
	do return v end
end

function sling.common.InfoMessage:getType()
	do return "info" end
end

sling.common.MessageFormatter = {}
sling.common.MessageFormatter.__index = sling.common.MessageFormatter
_vm:set_metatable(sling.common.MessageFormatter, {})

function sling.common.MessageFormatter._create()
	local v = _vm:set_metatable({}, sling.common.MessageFormatter)
	return v
end

function sling.common.MessageFormatter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.MessageFormatter'
	self['_isType.sling.common.MessageFormatter'] = true
end

function sling.common.MessageFormatter:_construct0()
	sling.common.MessageFormatter._init(self)
	return self
end

function sling.common.MessageFormatter:getFilePath(file)
	if not (file ~= nil) then
		do return nil end
	end
	do return file:getPath() end
end

function sling.common.MessageFormatter:getFileMessage(file, message)
	if not (message ~= nil) then
		do return _g.sling.common.MessageFormatter:getFilePath(file) end
	end
	do return _g.jk.lang.String:safeString(message) .. ": `" .. _g.jk.lang.String:safeString(_g.sling.common.MessageFormatter:getFilePath(file)) .. "'" end
end

sling.common.StatusMessage = _g.sling.common.Message._create()
sling.common.StatusMessage.__index = sling.common.StatusMessage
_vm:set_metatable(sling.common.StatusMessage, {
	__index = _g.sling.common.Message
})

function sling.common.StatusMessage._create()
	local v = _vm:set_metatable({}, sling.common.StatusMessage)
	return v
end

function sling.common.StatusMessage:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.common.StatusMessage'
	self['_isType.sling.common.StatusMessage'] = true
end

function sling.common.StatusMessage:_construct0()
	sling.common.StatusMessage._init(self)
	do _g.sling.common.Message._construct0(self) end
	return self
end

function sling.common.StatusMessage:forText(text)
	local v = _g.sling.common.StatusMessage._construct0(_g.sling.common.StatusMessage._create())
	do v:setMessage(text) end
	do return v end
end

function sling.common.StatusMessage:getType()
	do return "status" end
end
