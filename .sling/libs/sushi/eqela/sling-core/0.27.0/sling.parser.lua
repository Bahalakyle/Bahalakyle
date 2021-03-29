sling = sling or {}

sling.parser = sling.parser or {}

sling.parser.SlingParser = _g.sling.common.CodeParser._create()
sling.parser.SlingParser.__index = sling.parser.SlingParser
_vm:set_metatable(sling.parser.SlingParser, {
	__index = _g.sling.common.CodeParser
})

sling.parser.SlingParser.NODECONTEXT_ENTITY = 0
sling.parser.SlingParser.NODECONTEXT_NAMESPACE = 1
sling.parser.SlingParser.NODECONTEXT_STATEMENTBLOCK = 2
sling.parser.SlingParser.NODECONTEXT_FILE = 3

function sling.parser.SlingParser._create()
	local v = _vm:set_metatable({}, sling.parser.SlingParser)
	return v
end

function sling.parser.SlingParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.parser.SlingParser'
	self['_isType.sling.parser.SlingParser'] = true
	self.currentEntityName = nil
	self.showFixmeWarnings = false
	self.acceptDeprecatedConstructs = true
	self.isMacro = false
	self.isGenericTypeParameter = false
	self.reservedWords = nil
	self.entityStack = nil
	self.acceptNewlinesAsSpaces = false
end

function sling.parser.SlingParser:_construct0()
	sling.parser.SlingParser._init(self)
	do _g.sling.common.CodeParser._construct0(self) end
	do self:setImproperCommentPolicy(_g.sling.common.LiveTokenizingParser.IMPROPER_COMMENT_WARN_IGNORE) end
	return self
end

function sling.parser.SlingParser:getReservedWords()
	if not (self.reservedWords ~= nil) then
		self.reservedWords = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
		do self.reservedWords:add("true") end
		do self.reservedWords:add("false") end
		do self.reservedWords:add("null") end
		do self.reservedWords:add("fail") end
		do self.reservedWords:add("this") end
		do self.reservedWords:add("base") end
		if self.acceptDeprecatedConstructs then
			do self.reservedWords:add("PRINT") end
			do self.reservedWords:add("return") end
			do self.reservedWords:add("TYPEINFO") end
			do self.reservedWords:add("MALLOC") end
			do self.reservedWords:add("SIZE") end
		end
	end
	do return self.reservedWords end
end

function sling.parser.SlingParser:isReservedWord(name)
	do return self:getReservedWords():contains(name) end
end

function sling.parser.SlingParser:doAcceptNewlineToken(acceptSeveral)
	local nl = self:acceptToken2(10)
	if nl ~= nil then
		if acceptSeveral then
			while true do
				local el = self:acceptToken2(10)
				if el ~= nil then
					do self:onUnnecessaryEmptyLine(el) end
				else
					do break end
				end
			end
		end
		do return nl end
	end
	do return nil end
end

function sling.parser.SlingParser:doParseNewlineToken(acceptSeveral)
	local v = self:doAcceptNewlineToken(acceptSeveral)
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("newline"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.SlingParser:onUnnecessaryEmptyLine(token)
end

function sling.parser.SlingParser:acceptUnnecessaryNewlineToken()
	local v = self:acceptNewlineToken()
	if v ~= nil then
		do self:onUnnecessaryEmptyLine(v) end
	end
	do return v end
end

function sling.parser.SlingParser:acceptNewlineToken()
	do return self:doAcceptNewlineToken(false) end
end

function sling.parser.SlingParser:parseNewlineToken()
	do return self:doParseNewlineToken(false) end
end

function sling.parser.SlingParser:acceptMultipleNewlineTokens()
	do return self:doAcceptNewlineToken(true) end
end

function sling.parser.SlingParser:isSpaceCharacter(n)
	if n == 32 or n == 9 or n == 13 then
		do return true end
	end
	if self.acceptNewlinesAsSpaces and n == 10 then
		do return true end
	end
	do return false end
end

function sling.parser.SlingParser:isValidIdentifierPrefix(c)
	do return c == 95 or c == 126 or c == 36 or c == 64 or c == 35 or _g.jk.lang.Character:isAlpha(c) end
end

function sling.parser.SlingParser:isValidIdentifierCharacter(c)
	do return c == 95 or c == 36 or c == 35 or _g.jk.lang.Character:isAlnum(c) end
end

function sling.parser.SlingParser:isValidIdentifier(t)
	if not _g.sling.common.CodeParser.isValidIdentifier(self, t) then
		do return false end
	end
	if t == "~" then
		do return false end
	end
	do return true end
end

function sling.parser.SlingParser:acceptDocumentationCommentToken()
	do self:skipSpaces() end
	do
		local c0 = self:peekNextCharacter()
		if c0 ~= 42 then
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
						while true do
							local cn = self:getNextCharacter()
							if cn < 1 then
								do break end
							end
							if cn == 10 then
								do break end
							end
							do sb:appendCharacter(cn) end
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

function sling.parser.SlingParser:acceptMultilineStringToken()
	do self:skipSpaces() end
	do
		local c0 = self:peekNextCharacter()
		if c0 ~= 91 then
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
					if c1 ~= 91 then
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
					while self:peekNextCharacter() == 13 do
						do self:getNextCharacter() end
					end
					do
						local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
						do sb:appendCharacter(c0) end
						do sb:appendCharacter(c1) end
						do
							local pc = 0
							local nl = false
							local emptycount = -1
							local cc = 0
							local necc = 0
							if self:peekNextCharacter() == 10 then
								do self:getNextCharacter() end
								nl = true
							end
							while true do
								local cn = self:getNextCharacter()
								if cn < 1 then
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
									goto _continue1
								end
								if nl and (cn == 32 or cn == 9) then
									if emptycount < 0 or cc < emptycount then
										do cc = cc + 1 end
										goto _continue1
									end
								end
								do sb:appendCharacter(cn) end
								do necc = necc + 1 end
								if cn == 10 then
									nl = true
									if emptycount < 0 and necc > 1 then
										emptycount = cc
									end
									necc = 0
									cc = 0
								else
									nl = false
								end
								if pc == 93 and cn == 93 then
									do break end
								end
								pc = cn
								::_continue1::
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
end

function sling.parser.SlingParser:acceptTripleBraceBlockToken()
	do self:skipSpaces() end
	do
		local c0 = self:peekNextCharacter()
		if c0 ~= 123 then
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
					if c1 ~= 123 then
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
						if c2 ~= 123 then
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
							do sb:appendCharacter(c2) end
							do
								local cbc = 0
								while true do
									local cn = self:getNextCharacter()
									if cn < 1 then
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
									if cn == 125 then
										do cbc = cbc + 1 end
										if cbc == 3 then
											do break end
										end
									else
										cbc = 0
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
	end
end

function sling.parser.SlingParser:pushEntity(entity)
	local ee = entity
	if not (ee ~= nil) then
		ee = _g.sling.model.ClassDeclarationNode._construct0(_g.sling.model.ClassDeclarationNode._create())
	end
	if not (self.entityStack ~= nil) then
		self.entityStack = _g.jk.lang.Stack._construct0(_g.jk.lang.Stack._create())
	end
	do self.entityStack:push(ee) end
end

function sling.parser.SlingParser:popEntity()
	if not (self.entityStack ~= nil) then
		do return nil end
	end
	do return self.entityStack:pop() end
end

function sling.parser.SlingParser:peekEntity()
	if not (self.entityStack ~= nil) then
		do return nil end
	end
	do return self.entityStack:peek() end
end

function sling.parser.SlingParser:validateForReservedWords(token)
	if not (token ~= nil) then
		do return end
	end
	if self:isReservedWord(token.value) then
		do self:onParseMessage(_g.sling.common.WarningMessage:forText("Identifier name `" .. _g.jk.lang.String:safeString(token.value) .. "' is used internally by the language. Rename your declaration to avoid conflicts.", token)) end
	end
end

function sling.parser.SlingParser:acceptDeclarationIdentifier()
	local v = self:acceptIdentifierToken()
	if not (v ~= nil) then
		do return nil end
	end
	do self:validateForReservedWords(v) end
	do return v.value end
end

function sling.parser.SlingParser:parseDeclarationIdentifier()
	local v = self:parseIdentifierToken()
	do self:validateForReservedWords(v) end
	do return v.value end
end

function sling.parser.SlingParser:acceptEndOfStatementToken()
	local sc = self:acceptSemicolonToken()
	local nl = self:acceptNewlineToken()
	if nl ~= nil then
		if sc ~= nil then
			do self:onParseMessage(_g.sling.common.WarningMessage:forText("Unnecessary semicolon at the end of a line", sc)) end
		end
		do return nl end
	end
	if sc ~= nil then
		do return sc end
	end
	do return nil end
end

function sling.parser.SlingParser:parseEndOfStatementToken()
	local v = self:acceptEndOfStatementToken()
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("<NL> or `;'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.SlingParser:acceptSemicolonToken()
	local v = self:acceptToken2(59)
	local multiple = false
	while self:acceptToken2(59) ~= nil do
		multiple = true
	end
	if multiple then
		do self:onParseMessage(_g.sling.common.WarningMessage:forText("Multiple consecutive semicolons", v)) end
	end
	do return v end
end

function sling.parser.SlingParser:sanitizeFileId(id)
	if not (id ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local it = _g.jk.lang.String:iterate(id)
		while it ~= nil do
			local c = it:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				do break end
			end
			if self:isValidIdentifierCharacter(c) then
				do sb:appendCharacter(c) end
			else
				do sb:appendCharacter(95) end
			end
		end
		do return sb:toString() end
	end
end

function sling.parser.SlingParser:getCurrentFileId()
	local v = _g.sling.common.CodeParser.getCurrentFileId(self)
	if not (v ~= nil) then
		do return nil end
	end
	do
		local at = _g.jk.lang.String:getIndexOfCharacter(v, 64, 0)
		if at > 0 then
			v = _g.jk.lang.String:getSubString(v, 0, at)
		end
		do return self:sanitizeFileId(v) end
	end
end

function sling.parser.SlingParser:getCurrentFileIdComplete()
	do return _g.sling.common.CodeParser.getCurrentFileId(self) end
end

function sling.parser.SlingParser:acceptSymbolComponentGenericTypes()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		if self:acceptToken2(60) ~= nil then
			local genericTypes = nil
			while true do
				local tt = self:acceptDataType(true)
				if not (tt ~= nil) then
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
					local bts = nil
					if self:acceptToken2(58) ~= nil then
						bts = {}
						repeat
							local bdt = self:acceptDataType(true)
							if not (bdt ~= nil) then
								self.currentTokenColumn = ctc
								self.currentTokenLine = ctl
								do self.iterator:setCurrentPosition(ctp) end
								while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
									do self.commentQueue:pop() end
								end
								self.previousToken = cpt
								do return nil end
							end
							do _g.jk.lang.Vector:append(bts, bdt) end
						until not (self:acceptToken2(38) ~= nil)
					end
					if genericTypes == nil then
						genericTypes = {}
					end
					if bts ~= nil then
						local vb = _g.sling.model.ConstrainedDataTypeNode:forPrimaryType(tt)
						do vb:setSource(tt:getSource()) end
						if bts ~= nil then
							local n = 0
							local m = _g.jk.lang.Vector:getSize(bts)
							do
								n = 0
								while n < m do
									local node = _vm:to_table_with_key(bts[n + 1], '_isType.sling.common.DataTypeNode')
									if node ~= nil then
										do vb:addToBaseTypes(node) end
									end
									do n = n + 1 end
								end
							end
						end
						tt = vb
					end
					do _g.jk.lang.Vector:append(genericTypes, tt) end
					if self:acceptToken2(44) == nil then
						do break end
					end
				end
			end
			if self:acceptToken2(62) ~= nil then
				do return genericTypes end
			end
		end
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

function sling.parser.SlingParser:acceptSymbolComponent()
	local id = self:acceptIdentifierToken()
	if not (id ~= nil) then
		do return nil end
	end
	do
		local genericTypes = self:acceptSymbolComponentGenericTypes()
		if genericTypes ~= nil then
			local v = _g.sling.model.SymbolNameComponentNode._construct0(_g.sling.model.SymbolNameComponentNode._create())
			do v:setSource(id) end
			do v:setName(id.value) end
			do v:setTypeParameters(genericTypes, false) end
			do return v end
		end
		do return id.value end
	end
end

function sling.parser.SlingParser:acceptSymbolNode(acceptMultipleComponents)
	local src = nil
	local names = nil
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local isGlobal = false
		if self:acceptToken1("::") ~= nil then
			isGlobal = true
		end
		while true do
			local cc = self:acceptSymbolComponent()
			if not (cc ~= nil) then
				do break end
			end
			if not (src ~= nil) then
				if (_vm:to_table_with_key(cc, '_isType.sling.common.NodeObject') ~= nil) then
					src = cc:getSource()
				else
					src = self:getAcceptedToken()
				end
			end
			if names == nil then
				names = {}
			end
			do _g.jk.lang.Vector:append(names, cc) end
			if acceptMultipleComponents then
				if self:peekToken1("...") then
					do break end
				end
				if self:acceptToken2(46) ~= nil then
					goto _continue2
				end
			end
			do break end
			::_continue2::
		end
		if not (names ~= nil) then
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
			local v = _g.sling.model.SymbolNode:forVectorOfNames(names)
			do v:setSource(src) end
			if isGlobal then
				do _g.sling.util.ModifierUtil:addCommonModifier(v, _g.sling.model.Modifier.GLOBAL) end
			end
			do return v end
		end
	end
end

function sling.parser.SlingParser:parseSymbolNode(acceptMultipleComponents)
	local v = self:acceptSymbolNode(acceptMultipleComponents)
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("symbol reference"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.SlingParser:acceptFunctionDeclarationParameter()
	local namedDeclaration = self:acceptNamedParameterDeclaration()
	if namedDeclaration ~= nil then
		if self:acceptToken1("...") ~= nil then
			do return self:createVariableArgumentsDeclaration(namedDeclaration) end
		end
		do return namedDeclaration end
	end
	do
		local variableDeclaration = self:acceptParameterVariableDeclaration(false)
		if variableDeclaration ~= nil then
			if self:acceptToken1("...") ~= nil then
				do return self:createVariableArgumentsDeclaration(variableDeclaration) end
			end
			do return variableDeclaration end
		end
		do return nil end
	end
end

function sling.parser.SlingParser:parseFunctionDeclarationParameter()
	local v = self:acceptFunctionDeclarationParameter()
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("parameter variable declaration"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
		do return nil end
	end
	do return v end
end

function sling.parser.SlingParser:createVariableArgumentsDeclaration(node)
	if not (node ~= nil) then
		do return nil end
	end
	do
		local va = _g.sling.model.VariableArgumentsDeclarationNode._construct0(_g.sling.model.VariableArgumentsDeclarationNode._create())
		if (_vm:to_table_with_key(node, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
			local v = node
			do va:setSource(v:getSource()) end
			do va:setVariableDeclaration(v, false) end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.NamedParameterDeclarationNode') ~= nil) then
			local v = node:exportVariable()
			do va:setSource(v:getSource()) end
			do va:setVariableDeclaration(v, false) end
		end
		do return va end
	end
end

function sling.parser.SlingParser:acceptFunctionDeclarationParameters()
	local open = self:acceptToken2(40)
	if not (open ~= nil) then
		do return nil end
	end
	do
		local v = {}
		if self:acceptToken2(41) ~= nil then
			do self:onParseMessage(_g.sling.common.WarningMessage:forText("Empty parameter list: Parenthesis should be omitted", open)) end
			do return v end
		end
		while true do
			local vr = self:parseFunctionDeclarationParameter()
			do _g.jk.lang.Vector:append(v, vr) end
			if self:acceptToken2(44) ~= nil then
				do self:acceptMultipleNewlineTokens() end
				goto _continue3
			end
			if self:acceptToken2(41) ~= nil then
				do break end
			end
			do self:skipSpaces() end
			do self:updateStagingToken() end
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`,' or `)'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
			::_continue3::
		end
		do return v end
	end
end

function sling.parser.SlingParser:acceptStringLiteralExpression(acceptModifiers)
	local dqt = self:acceptDoubleQuotedStringToken(92, false)
	if dqt ~= nil then
		local v = _g.sling.model.StringLiteralExpressionNode:forValue(_g.sling.common.CodeStringUtil:unescapeStringLiteralCStyle(dqt.value, true))
		do v:setSource(dqt) end
		if acceptModifiers then
			while true do
				local mod = self:acceptAnnotationModifier()
				if mod == nil then
					do break end
				end
				do v:addToModifiers(mod) end
			end
		end
		do return v end
	end
	do
		local mlt = self:acceptMultilineStringToken()
		if mlt ~= nil then
			local n = 4
			local literal = mlt.value
			if _g.jk.lang.String:endsWith(literal, "\n]]") then
				do n = n + 1 end
			end
			do
				local v = _g.sling.model.StringLiteralExpressionNode:forValue(_g.jk.lang.String:getSubString(literal, 2, _g.jk.lang.String:getLength(literal) - n))
				do v:setSource(mlt) end
				do v:setIsLongString(true) end
				if acceptModifiers then
					while true do
						local mod = self:acceptAnnotationModifier()
						if mod == nil then
							do break end
						end
						do v:addToModifiers(mod) end
					end
				end
				do return v end
			end
		end
		do return nil end
	end
end

function sling.parser.SlingParser:parseStringLiteralExpression(acceptModifiers)
	local v = self:acceptStringLiteralExpression(acceptModifiers)
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("string literal"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.SlingParser:acceptStringLiteral()
	local lit = self:acceptStringLiteralExpression(true)
	if not (lit ~= nil) then
		do return nil end
	end
	do return lit:getValue() end
end

function sling.parser.SlingParser:parseStringLiteral()
	local lit = self:parseStringLiteralExpression(true)
	do return lit:getValue() end
end

function sling.parser.SlingParser:parseStringLiteralWithoutModifiers()
	local lit = self:parseStringLiteralExpression(false)
	do return lit:getValue() end
end

function sling.parser.SlingParser:acceptBooleanLiteralExpression()
	if self:acceptToken1("true") ~= nil then
		local v = _g.sling.model.BooleanLiteralExpressionNode:forValue(true)
		do v:setSource(self:getAcceptedToken()) end
		do return v end
	end
	if self:acceptToken1("false") ~= nil then
		local v = _g.sling.model.BooleanLiteralExpressionNode:forValue(false)
		do v:setSource(self:getAcceptedToken()) end
		do return v end
	end
	do return nil end
end

function sling.parser.SlingParser:acceptNullLiteralExpression()
	if self:acceptToken1("null") ~= nil then
		local v = _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create())
		do v:setSource(self:getAcceptedToken()) end
		do return v end
	end
	do return nil end
end

function sling.parser.SlingParser:acceptFailureLiteralExpression()
	if self:acceptToken1("fail") ~= nil then
		local v = _g.sling.model.FailureLiteralExpressionNode._construct0(_g.sling.model.FailureLiteralExpressionNode._create())
		do v:setSource(self:getAcceptedToken()) end
		do return v end
	end
	do return nil end
end

function sling.parser.SlingParser:acceptCharacterLiteralExpression()
	local token = self:acceptSingleQuotedStringToken()
	if not (token ~= nil) then
		do return nil end
	end
	do
		local literal = token.value
		local c = 0
		if _g.jk.lang.String:getLength(literal) == 3 then
			c = _g.jk.lang.String:getChar(literal, 1)
		elseif literal == "'\\a'" then
			c = 7
		elseif literal == "'\\b'" then
			c = 8
		elseif literal == "'\\f'" then
			c = 12
		elseif literal == "'\\n'" then
			c = 10
		elseif literal == "'\\r'" then
			c = 13
		elseif literal == "'\\t'" then
			c = 9
		elseif literal == "'\\v'" then
			c = 11
		elseif literal == "'\\\\'" then
			c = 92
		elseif literal == "'\\''" then
			c = 39
		elseif literal == "'\\\"'" then
			c = 34
		elseif literal == "'\\?'" then
			c = 63
		elseif literal == "'\\0'" then
			c = 0
		else
			local ll = _g.jk.lang.String:getLength(literal)
			local c1 = _g.jk.lang.String:getChar(literal, 1)
			if ll == 6 and c1 == 92 and _g.jk.lang.String:getChar(literal, 2) == 120 then
				c = _g.jk.lang.String:toIntegerFromHex(_g.jk.lang.String:getSubString(literal, 3, 2))
			elseif ll == 8 and c1 == 92 and _g.jk.lang.String:getChar(literal, 2) == 117 then
				c = _g.jk.lang.String:toIntegerFromHex(_g.jk.lang.String:getSubString(literal, 3, 4))
			elseif ll == 6 and c1 == 92 then
				local n = 0
				n = n + _util:convert_to_integer(_g.jk.lang.String:getChar(literal, 4) - 48)
				n = n + (_g.jk.lang.String:getChar(literal, 3) - 48) * 8
				c = n
			else
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported character literal", token, _g.jk.lang.StackTrace:generate()))
			end
		end
		do
			local v = _g.sling.model.CharacterLiteralExpressionNode:forValue(c)
			do v:setSource(token) end
			do return v end
		end
	end
end

function sling.parser.SlingParser:acceptIntegerLiteralExpression()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local num = _vm:to_table_with_key(self:acceptNumberLiteralExpression(), '_isType.sling.model.IntegerLiteralExpressionNode')
		if not (num ~= nil) then
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
			do return nil end
		end
		do return num end
	end
end

function sling.parser.SlingParser:acceptNumberLiteralExpression()
	local hex = self:acceptHexNumberLiteralToken(true)
	if hex ~= nil then
		local v = _g.sling.model.IntegerLiteralExpressionNode._construct0(_g.sling.model.IntegerLiteralExpressionNode._create())
		do v:setFormat(_g.sling.model.IntegerLiteralExpressionNode.FORMAT_HEXADECIMAL) end
		do v:setSource(hex) end
		do
			local st = _g.jk.lang.String:getEndOfString(hex.value, 2)
			if _g.jk.lang.String:getLength(st) >= 16 then
				do v:setType(_g.sling.model.IntegerDataTypeNode.TYPE_LONG) end
				do v:setValue(_g.jk.lang.String:toLongIntegerFromHex(st)) end
			else
				do v:setType(_g.sling.model.IntegerDataTypeNode.TYPE_INT) end
				do v:setValue(_g.jk.lang.String:toIntegerFromHex(st)) end
			end
			do return v end
		end
	end
	do
		local ii = self:acceptDecimalNumberLiteralToken(true, true, true, false)
		if ii ~= nil and _g.jk.lang.String:getIndexOfCharacter(ii.value, 46, 0) > -1 then
			if self:acceptToken2(109) ~= nil or self:acceptToken2(77) ~= nil then
				local v = _g.sling.model.DecimalLiteralExpressionNode._construct0(_g.sling.model.DecimalLiteralExpressionNode._create())
				do v:setSource(ii) end
				do v:setValue(ii.value) end
				do return v end
			end
			if self:acceptToken2(102) ~= nil or self:acceptToken2(70) ~= nil then
				local v = _g.sling.model.FloatLiteralExpressionNode:forValue(_g.jk.lang.String:toDouble(ii.value))
				do v:setSource(ii) end
				do return v end
			end
			do
				local v = _g.sling.model.DoubleLiteralExpressionNode:forValue(_g.jk.lang.String:toDouble(ii.value))
				do v:setSource(ii) end
				do return v end
			end
		end
		if not (ii ~= nil) then
			ii = self:acceptIntegerLiteralToken(true)
		end
		if ii ~= nil then
			local v = _g.sling.model.IntegerLiteralExpressionNode:forValue(_g.jk.lang.String:toLong(ii.value))
			do v:setFormat(_g.sling.model.IntegerLiteralExpressionNode.FORMAT_DECIMAL) end
			do v:setSource(ii) end
			do
				local unsigned = false
				local long = false
				if self:acceptToken2(117) ~= nil or self:acceptToken2(85) ~= nil then
					unsigned = true
				end
				if self:acceptToken2(108) ~= nil or self:acceptToken2(76) ~= nil then
					long = true
				end
				if unsigned then
					if long then
						do v:setType(_g.sling.model.IntegerDataTypeNode.TYPE_ULONG) end
						do v:setDefaultDataType(_g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_ULONG), false) end
					else
						do v:setType(_g.sling.model.IntegerDataTypeNode.TYPE_UINT) end
						do v:setDefaultDataType(_g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_UINT), false) end
					end
				elseif long then
					do v:setType(_g.sling.model.IntegerDataTypeNode.TYPE_LONG) end
					do v:setDefaultDataType(_g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_LONG), false) end
				end
				do return v end
			end
		end
		do return nil end
	end
end

function sling.parser.SlingParser:acceptPromiseLiteralExpression()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("promise")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local dtp = _g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create())
			if self:acceptToken1("<") ~= nil then
				if not ((function()
					dtp = self:acceptDataType(true)
					do return dtp end
				end)() ~= nil) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				if not (self:acceptToken1(">") ~= nil) then
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
				local blk = self:acceptBlock(false, nil)
				if not (blk ~= nil) then
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
					local prm = _g.sling.model.PromiseLiteralExpressionNode._construct0(_g.sling.model.PromiseLiteralExpressionNode._create())
					do prm:setType(dtp, false) end
					do prm:setBody(blk, false) end
					do prm:setSource(src) end
					do return prm end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptLiteralExpression()
	local slit = self:acceptStringLiteralExpression(true)
	if slit ~= nil then
		do return slit end
	end
	do
		local blit = self:acceptBooleanLiteralExpression()
		if blit ~= nil then
			do return blit end
		end
		do
			local nlit = self:acceptNullLiteralExpression()
			if nlit ~= nil then
				do return nlit end
			end
			do
				local flit = self:acceptFailureLiteralExpression()
				if flit ~= nil then
					do return flit end
				end
				do
					local clit = self:acceptCharacterLiteralExpression()
					if clit ~= nil then
						do return clit end
					end
					do
						local number = self:acceptNumberLiteralExpression()
						if number ~= nil then
							do return number end
						end
						do return nil end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptMultidimensionalArrayLiteralExpression(count)
	local src = self:acceptToken2(123)
	if not (src ~= nil) then
		do return nil end
	end
	do
		local ops = _g.jk.lang.Stack._construct0(_g.jk.lang.Stack._create())
		local rar = _g.sling.model.ArrayLiteralExpressionNode._construct0(_g.sling.model.ArrayLiteralExpressionNode._create())
		do rar:setSource(src) end
		do ops:push(rar) end
		while true do
			do self:acceptMultipleNewlineTokens() end
			if self:acceptToken2(123) ~= nil then
				local lit = _g.sling.model.ArrayLiteralExpressionNode._construct0(_g.sling.model.ArrayLiteralExpressionNode._create())
				do lit:setSource(self:getAcceptedToken()) end
				do ops:push(lit) end
				if ops:getSize() > count then
					do self:skipSpaces() end
					do self:updateStagingToken() end
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Multi-dimension array count exceeds count", self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
				end
				do self:acceptMultipleNewlineTokens() end
				if ops:getSize() == count then
					local top = ops:peek()
					if not (top ~= nil) then
						do self:skipSpaces() end
						do self:updateStagingToken() end
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No previous array literal expression instance to add the expression", self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
					end
					while true do
						local xpr = self:parseExpression(false)
						do top:addToExpressions(xpr) end
						if self:acceptToken2(44) ~= nil then
							do self:acceptMultipleNewlineTokens() end
							goto _continue4
						end
						do break end
						::_continue4::
					end
				end
				goto _continue5
			end
			if self:acceptToken2(44) ~= nil then
				do self:acceptMultipleNewlineTokens() end
				if ops:getSize() < count and self:peekNextCharacter() ~= 123 then
					do self:skipSpaces() end
					do self:updateStagingToken() end
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`{'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
				end
				goto _continue5
			end
			if self:acceptToken2(125) ~= nil then
				local top = ops:pop()
				local prv = ops:peek()
				if prv ~= nil then
					do prv:addToExpressions(top) end
				end
				if ops:getSize() < 1 then
					do break end
				else
					do self:acceptMultipleNewlineTokens() end
					if self:peekNextCharacter() ~= 44 and self:peekNextCharacter() ~= 125 then
						do self:skipSpaces() end
						do self:updateStagingToken() end
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`,' or `}'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
					end
				end
				goto _continue5
			end
			do self:skipSpaces() end
			do self:updateStagingToken() end
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`{', `}', `,' or expression"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
			::_continue5::
		end
		do return rar end
	end
end

function sling.parser.SlingParser:acceptArrayLiteralExpression(openToken, closeToken, allowDataType)
	local open = self:acceptToken2(openToken)
	if not (open ~= nil) then
		do return nil end
	end
	do
		local dt = nil
		if allowDataType then
			local ctc = self.currentTokenColumn
			local ctl = self.currentTokenLine
			local ctp = self.iterator:getCurrentPosition()
			local cqs = 0
			if self.commentQueue ~= nil then
				cqs = self.commentQueue:getSize()
			end
			do
				local cpt = self.previousToken
				dt = self:acceptDataType(true)
				if dt ~= nil then
					if self:acceptToken2(58) == nil then
						dt = nil
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
					end
				end
			end
		end
		do self:acceptMultipleNewlineTokens() end
		do
			local exprs = {}
			if self:acceptToken2(closeToken) == nil then
				while true do
					local xp = self:parseExpression(false)
					do _g.jk.lang.Vector:append(exprs, xp) end
					if self:acceptToken2(44) ~= nil then
						do self:acceptMultipleNewlineTokens() end
						goto _continue6
					end
					if self:acceptToken2(closeToken) ~= nil then
						do break end
					end
					if self:acceptMultipleNewlineTokens() ~= nil then
						do self:parseToken2(closeToken) end
						do break end
					end
					do self:skipSpaces() end
					do self:updateStagingToken() end
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`,' or `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forCharacter(closeToken)) .. "'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
					::_continue6::
				end
			end
			do
				local v = _g.sling.model.ArrayLiteralExpressionNode:forExpressions(exprs)
				if dt ~= nil then
					do v:setType(dt, false) end
				end
				do v:setSource(open) end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:createDefaultMapDataType()
	local v = _g.sling.model.MapDataTypeNode._construct0(_g.sling.model.MapDataTypeNode._create())
	do v:setKeyType(_g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create()), false) end
	do v:setValueType(_g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create()), false) end
	do return v end
end

function sling.parser.SlingParser:acceptLegacyMapLiteralExpression()
	local open = self:acceptToken2(123)
	if not (open ~= nil) then
		do return nil end
	end
	do self:acceptMultipleNewlineTokens() end
	do
		local v = _g.sling.model.MapLiteralExpressionNode._construct0(_g.sling.model.MapLiteralExpressionNode._create())
		do v:setDefaultDataType(self:createDefaultMapDataType(), false) end
		do v:setSource(open) end
		if self:acceptToken2(125) == nil then
			while true do
				if self:acceptToken2(125) ~= nil then
					do break end
				end
				do
					local key = self:parseExpression(false)
					do self:parseToken2(58) end
					do
						local val = self:parseExpression(false)
						local vn = _g.sling.model.KeyValueNode:forValues(key, val)
						do vn:setSource(key:getSource()) end
						do v:addToValues(vn) end
						if self:acceptToken2(44) ~= nil then
							do self:acceptMultipleNewlineTokens() end
							goto _continue7
						end
						do self:acceptMultipleNewlineTokens() end
						if self:acceptToken2(125) ~= nil then
							do break end
						end
						do self:skipSpaces() end
						do self:updateStagingToken() end
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`,' or `}'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
					end
				end
				::_continue7::
			end
		end
		do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", open)) end
		do return v end
	end
end

function sling.parser.SlingParser:acceptBufferLiteralExpression(keyword)
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1(keyword)
		if not (src ~= nil) then
			do return nil end
		end
		do
			local open = self:acceptToken2(123)
			if not (open ~= nil) then
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
				local xprs = {}
				while true do
					local lit = self:acceptIntegerLiteralExpression()
					if lit ~= nil then
						do _g.jk.lang.Vector:append(xprs, lit) end
						goto _continue8
					end
					if self:acceptToken2(44) ~= nil then
						goto _continue8
					end
					if self:acceptToken2(125) ~= nil then
						do break end
					end
					do self:skipSpaces() end
					do self:updateStagingToken() end
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("literal, `,' or `}'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
					::_continue8::
				end
				do
					local size = _g.jk.lang.Vector:getSize(xprs)
					if size < 1 then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Buffer literal with no data", src, _g.jk.lang.StackTrace:generate()))
					end
					do
						local buffer = _util:allocate_buffer(size)
						local n = 0
						if xprs ~= nil then
							local n2 = 0
							local m = _g.jk.lang.Vector:getSize(xprs)
							do
								n2 = 0
								while n2 < m do
									local lit = xprs[n2 + 1]
									if lit ~= nil then
										buffer[(function() local v = n n = n + 1 return v end)() + 1] = _vm:bitwise_and(lit:getValue(), 255)
									end
									do n2 = n2 + 1 end
								end
							end
						end
						do
							local v = _g.sling.model.BufferLiteralExpressionNode:forValue(buffer)
							do v:setSource(src) end
							do return v end
						end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptMapLiteralExpression(keyword)
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1(keyword)
		if not (src ~= nil) then
			do return nil end
		end
		do
			local type = nil
			if self:acceptToken2(60) ~= nil then
				local keytype = self:parseDataType(true)
				do self:parseToken2(44) end
				do
					local valtype = self:parseDataType(true)
					do self:parseToken2(62) end
					type = _g.sling.model.MapDataTypeNode:forTypes(keytype, valtype)
				end
			else
				type = self:createDefaultMapDataType()
			end
			do
				local open = self:acceptToken2(123)
				if not (open ~= nil) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				do self:acceptMultipleNewlineTokens() end
				do
					local v = _g.sling.model.MapLiteralExpressionNode._construct0(_g.sling.model.MapLiteralExpressionNode._create())
					do v:setDefaultDataType(type, false) end
					do v:setSource(src) end
					if self:acceptToken2(125) == nil then
						while true do
							if self:acceptToken2(125) ~= nil then
								do break end
							end
							do
								local key = self:parseExpression(false)
								do self:parseToken2(58) end
								do
									local val = self:parseExpression(false)
									local vn = _g.sling.model.KeyValueNode:forValues(key, val)
									do vn:setSource(key:getSource()) end
									do v:addToValues(vn) end
									if self:acceptToken2(44) ~= nil then
										do self:acceptMultipleNewlineTokens() end
										goto _continue9
									end
									do self:acceptMultipleNewlineTokens() end
									if self:acceptToken2(125) ~= nil then
										do break end
									end
									do self:skipSpaces() end
									do self:updateStagingToken() end
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`,' or `}'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
								end
							end
							::_continue9::
						end
					end
					do return v end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptSetLiteralExpression(keyword)
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1(keyword)
		if not (src ~= nil) then
			do return nil end
		end
		do
			local open = self:acceptToken2(123)
			if not (open ~= nil) then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return nil end
			end
			do self:acceptMultipleNewlineTokens() end
			do
				local v = _g.sling.model.SetLiteralExpressionNode._construct0(_g.sling.model.SetLiteralExpressionNode._create())
				do v:setSource(src) end
				if self:acceptToken2(125) == nil then
					while true do
						if self:acceptToken2(125) ~= nil then
							do break end
						end
						do
							local value = self:parseExpression(false)
							do v:addToValues(value) end
							if self:acceptToken2(44) ~= nil then
								do self:acceptMultipleNewlineTokens() end
								goto _continue10
							end
							do self:acceptMultipleNewlineTokens() end
							if self:acceptToken2(125) ~= nil then
								do break end
							end
							do self:skipSpaces() end
							do self:updateStagingToken() end
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`,' or `}'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
						end
						::_continue10::
					end
				end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptSubOrTupleExpression()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local open = self:acceptToken2(40)
		if not (open ~= nil) then
			do return nil end
		end
		do self:acceptMultipleNewlineTokens() end
		do
			local e0 = self:acceptExpression(false)
			if not (e0 ~= nil) then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return nil end
			end
			if self:acceptToken2(44) ~= nil then
				local tv = _g.sling.model.TupleExpressionNode._construct0(_g.sling.model.TupleExpressionNode._create())
				do tv:addToExpressions(e0) end
				while true do
					do self:acceptMultipleNewlineTokens() end
					do
						local x = self:acceptExpression(false)
						if not (x ~= nil) then
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
							do return nil end
						end
						do tv:addToExpressions(x) end
						if not (self:acceptToken2(44) ~= nil) then
							do break end
						end
					end
				end
				do self:acceptMultipleNewlineTokens() end
				if not (self:acceptToken2(41) ~= nil) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				do return tv end
			end
			do self:acceptMultipleNewlineTokens() end
			if self:acceptToken2(41) ~= nil then
				do return e0 end
			end
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

function sling.parser.SlingParser:acceptCreateObjectExpression()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("new")
		if not (src ~= nil) then
			do return nil end
		end
		if not (self:peekNextCharacter() ~= 40) then
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
			local mlit = self:acceptMapLiteralExpression("map")
			if mlit ~= nil then
				do return mlit end
			end
			do
				local slit = self:acceptSetLiteralExpression("set")
				if slit ~= nil then
					do return slit end
				end
				do
					local blit = self:acceptBufferLiteralExpression("buffer")
					if blit ~= nil then
						do return blit end
					end
					do
						local malit = self:acceptTreeLiteralExpression()
						if malit ~= nil then
							do return malit end
						end
						do
							local stlit = self:acceptStyleSheetLiteralExpression()
							if stlit ~= nil then
								do return stlit end
							end
							do
								local plit = self:acceptPromiseLiteralExpression()
								if plit ~= nil then
									do return plit end
								end
								do
									local xprn = nil
									local name = self:acceptDataType(false)
									if not (name ~= nil) then
										xprn = self:acceptExpression(true)
									end
									if name ~= nil and self:acceptToken2(91) ~= nil then
										local v = _g.sling.model.ArrayCreationExpressionNode:forPrimaryType(name)
										do v:setSource(src) end
										while true do
											local xpr = self:acceptExpression(false)
											if not (xpr ~= nil) then
												xpr = _g.sling.model.EmptyExpressionNode._construct0(_g.sling.model.EmptyExpressionNode._create())
											end
											do v:addToDimensions(xpr) end
											if not (self:acceptToken2(44) ~= nil) then
												do break end
											end
										end
										do self:parseToken2(93) end
										if _g.jk.lang.Vector:isEmpty(v:getDimensions()) then
											do v:addToDimensions(_g.sling.model.EmptyExpressionNode._construct0(_g.sling.model.EmptyExpressionNode._create())) end
										end
										if v:getDimensionCount() > 1 then
											local mdlit = self:acceptMultidimensionalArrayLiteralExpression(v:getDimensionCount())
											if mdlit ~= nil then
												do v:setArrayLiteral(mdlit, false) end
											end
										else
											local alit = self:acceptArrayLiteralExpression(123, 125, false)
											if alit ~= nil then
												do v:setArrayLiteral(alit, false) end
											end
										end
										do return v end
									end
									do
										local params = self:acceptFunctionCallParameters()
										if self:acceptToken2(123) ~= nil then
											do self:parseNewlineToken() end
											do
												local classdecl = _g.sling.model.ClassDeclarationNode._construct0(_g.sling.model.ClassDeclarationNode._create())
												local nameref = _vm:to_table_with_key(name, '_isType.sling.model.ReferenceDataTypeNode')
												if not (nameref ~= nil) then
													_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("reference data type"), name:getSource(), _g.jk.lang.StackTrace:generate()))
													do return nil end
												end
												do classdecl:addToBaseTypes(_g.sling.model.BaseTypeNode:forType(nameref, _g.sling.model.BaseTypeNode.INHERIT_AUTO)) end
												while true do
													if self:acceptToken2(125) ~= nil then
														do break end
													end
													do
														local dec = self:acceptDeclarationInEntity(true)
														if dec ~= nil then
															do self:addDeclarationToContainer(classdecl, dec) end
															goto _continue11
														end
														do self:skipSpaces() end
														do self:updateStagingToken() end
														_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`}' or entity declaration"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
													end
													::_continue11::
												end
												do
													local v = _g.sling.model.ClassDeclarationInstantiationExpressionNode._construct0(_g.sling.model.ClassDeclarationInstantiationExpressionNode._create())
													do v:setSource(src) end
													do v:setParameters(params, false) end
													do v:setClassDeclaration(classdecl, false) end
													do return v end
												end
											end
										end
										do
											local v = _g.sling.model.CreateObjectExpressionNode._construct0(_g.sling.model.CreateObjectExpressionNode._create())
											if name ~= nil then
												do v:setType(name, false) end
											elseif xprn ~= nil then
												do v:setTypeExpression(xprn, false) end
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
											do v:setSource(src) end
											do v:setParameters(params, false) end
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
	end
end

function sling.parser.SlingParser:acceptFunctionCallParameters()
	local opos = self:acceptToken2(40)
	if not (opos ~= nil) then
		do return nil end
	end
	do
		local params = {}
		if self:acceptToken2(41) ~= nil then
			do return params end
		end
		while true do
			do self:acceptMultipleNewlineTokens() end
			do
				local csym = self:parseExpression(false)
				do _g.jk.lang.Vector:append(params, csym) end
				if self:acceptToken2(44) ~= nil then
					goto _continue12
				end
				do self:acceptMultipleNewlineTokens() end
				if self:acceptToken2(41) ~= nil then
					do break end
				end
				do self:skipSpaces() end
				do self:updateStagingToken() end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`,' or `)'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
			end
			::_continue12::
		end
		do return params end
	end
end

function sling.parser.SlingParser:acceptSymbolExpression(isFirst)
	local symbol = self:acceptSymbolNode(false)
	if symbol ~= nil then
		local v = _g.sling.model.SymbolExpressionNode:forSymbol(symbol)
		do v:setSource(symbol:getSource()) end
		do return v end
	end
	do return nil end
end

function sling.parser.SlingParser:acceptExpressions16()
	local lit = self:acceptLiteralExpression()
	if lit ~= nil then
		do return lit end
	end
	do
		local alit = self:acceptArrayLiteralExpression(91, 93, true)
		if alit ~= nil then
			local v = _g.sling.model.ArrayCreationExpressionNode:forLiteral(alit)
			do v:setSource(alit:getSource()) end
			do return v end
		end
		if self.acceptDeprecatedConstructs then
			local mll = self:acceptLegacyMapLiteralExpression()
			if mll ~= nil then
				do return mll end
			end
			do
				local mlit = self:acceptMapLiteralExpression("MAP")
				if mlit ~= nil then
					do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", mlit)) end
					do return mlit end
				end
				do
					local slit = self:acceptSetLiteralExpression("SET")
					if slit ~= nil then
						do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", slit)) end
						do return slit end
					end
					do
						local blit = self:acceptBufferLiteralExpression("BUFFER")
						if blit ~= nil then
							do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", blit)) end
							do return blit end
						end
					end
				end
			end
		end
		do
			local stex = self:acceptSubOrTupleExpression()
			if stex ~= nil then
				do return stex end
			end
			do
				local xob = self:acceptCreateObjectExpression()
				if xob ~= nil then
					do return xob end
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
						if self:acceptToken1("var") ~= nil then
							if self:peekNextCharacter() ~= 40 then
								local src = self:getAcceptedToken()
								local idt = self:acceptIdentifier()
								if idt ~= nil then
									local dtp = nil
									if self:acceptToken1("as") ~= nil then
										dtp = self:parseDataType(true)
									end
									if not (dtp ~= nil) then
										dtp = _g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create())
									end
									if self:acceptToken1("=") ~= nil then
										local ini = self:parseExpression(true)
										local d = _g.sling.model.VariableDeclarationNode:instance(dtp, idt, ini)
										local r = _g.sling.model.VariableDeclarationExpressionNode._construct0(_g.sling.model.VariableDeclarationExpressionNode._create())
										do r:setDeclaration(d, false) end
										do r:setSource(src) end
										do return r end
									end
								end
							end
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
						end
						if self.acceptDeprecatedConstructs and self:acceptToken1("trycatch") ~= nil then
							if self:peekNextCharacter() ~= 40 then
								local src = self:getAcceptedToken()
								local xpr = self:acceptExpression(true)
								if xpr ~= nil then
									do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", src)) end
									do
										local r = _g.sling.model.TryCatchExpressionNode:forExpression(xpr)
										do r:setSource(src) end
										do return r end
									end
								end
							end
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
						end
						if self:acceptToken1("try") ~= nil then
							if self:peekNextCharacter() ~= 40 then
								local src = self:getAcceptedToken()
								local xpr = self:acceptExpression(true)
								if xpr ~= nil then
									local r = _g.sling.model.TryCatchExpressionNode:forExpression(xpr)
									do r:setSource(src) end
									do return r end
								end
							end
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
						end
						if self:acceptToken1("VALUE") ~= nil then
							local src = self:getAcceptedToken()
							local value = nil
							if self.acceptDeprecatedConstructs and self:acceptToken2(40) ~= nil then
								value = self:acceptStringLiteral()
								if value ~= nil then
									do self:parseToken2(41) end
									do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", src)) end
								end
							else
								value = self:acceptStringLiteral()
							end
							if value ~= nil then
								local r = _g.sling.model.PreprocessorValueExpressionNode:forVariable(value)
								do r:setSource(src) end
								do return r end
							end
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
						end
						if self:acceptToken1("TEXTFILE") ~= nil then
							local src = self:getAcceptedToken()
							local value = nil
							if self.acceptDeprecatedConstructs and self:acceptToken2(40) ~= nil then
								value = self:acceptStringLiteral()
								if value ~= nil then
									do self:parseToken2(41) end
									do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", src)) end
								end
							else
								value = self:acceptStringLiteral()
							end
							if value ~= nil then
								if _g.jk.lang.String:isEmpty(value) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Empty text file name", src, _g.jk.lang.StackTrace:generate()))
								end
								do
									local v = _g.sling.model.FileSystemTextFileReferenceExpressionNode._construct0(_g.sling.model.FileSystemTextFileReferenceExpressionNode._create())
									do v:setSource(src) end
									do v:setName(value) end
									do v:setRelativeTo(self:getCurrentFile()) end
									do return v end
								end
							end
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
						end
						if self:acceptToken1("FILE") ~= nil then
							if self:peekNextCharacter() ~= 40 then
								local src = self:getAcceptedToken()
								local value = self:acceptStringLiteral()
								if value ~= nil then
									if _g.jk.lang.String:isEmpty(value) then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Empty file name", src, _g.jk.lang.StackTrace:generate()))
									end
									do
										local v = _g.sling.model.FileSystemBinaryFileReferenceExpressionNode._construct0(_g.sling.model.FileSystemBinaryFileReferenceExpressionNode._create())
										do v:setSource(src) end
										do v:setName(value) end
										do v:setRelativeTo(self:getCurrentFile()) end
										do return v end
									end
								end
							end
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
						end
						if self:acceptToken1("DIRECTORY") ~= nil then
							if self:peekNextCharacter() ~= 40 then
								local src = self:getAcceptedToken()
								local value = self:acceptStringLiteral()
								if value ~= nil then
									if _g.jk.lang.String:isEmpty(value) then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Empty directory name", src, _g.jk.lang.StackTrace:generate()))
									end
									do
										local v = _g.sling.model.FileSystemDirectoryReferenceExpressionNode._construct0(_g.sling.model.FileSystemDirectoryReferenceExpressionNode._create())
										do v:setSource(src) end
										do v:setName(value) end
										do v:setRelativeTo(self:getCurrentFile()) end
										do return v end
									end
								end
							end
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
						end
						if self:acceptToken1("ui") ~= nil then
							local v = self:acceptUiExpression()
							if v ~= nil then
								do return v end
							end
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
						end
						do
							local langDeclaration = self:acceptLangDeclaration(false, true)
							if langDeclaration ~= nil then
								do return langDeclaration end
							end
							if self:acceptToken1("this") ~= nil then
								local v = _g.sling.model.CurrentObjectExpressionNode._construct0(_g.sling.model.CurrentObjectExpressionNode._create())
								do v:setSource(self:getAcceptedToken()) end
								do return v end
							end
							if self:acceptToken1("base") ~= nil then
								local v = _g.sling.model.BaseClassAccessExpressionNode._construct0(_g.sling.model.BaseClassAccessExpressionNode._create())
								do v:setSource(self:getAcceptedToken()) end
								do return v end
							end
							do
								local funcd = self:acceptFunctionDeclarationExpression()
								if funcd ~= nil then
									do return funcd end
								end
								do
									local symx = self:acceptSymbolExpression(true)
									if symx ~= nil then
										do return symx end
									end
									do return nil end
								end
							end
						end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptBinaryOperator(text)
	local v = self:acceptToken1(text)
	if v ~= nil then
		do self:acceptMultipleNewlineTokens() end
		do return v end
	end
	do return nil end
end

function sling.parser.SlingParser:acceptUnwrappingExpression(node)
	if not (node ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LiteralExpressionNode') ~= nil) then
		do return node end
	end
	if self:peekNextCharacter() == 33 then
		do self:getNextCharacter() end
		do
			local v = _g.sling.model.ForceUnwrapOptionalExpressionNode:forExpression(node)
			do v:setSource(node:getSource()) end
			do return v end
		end
	end
	if self:peekNextCharacter() == 63 then
		do self:getNextCharacter() end
		do
			local v = _g.sling.model.SafeUnwrapOptionalExpressionNode:forExpression(node)
			do v:setSource(node:getSource()) end
			do return v end
		end
	end
	do return node end
end

function sling.parser.SlingParser:getUnwrappingExpression()
	if self:peekNextCharacter() == 33 then
		do self:getNextCharacter() end
		do return _g.sling.model.ForceUnwrapOptionalExpressionNode._construct0(_g.sling.model.ForceUnwrapOptionalExpressionNode._create()) end
	end
	if self:peekNextCharacter() == 63 then
		do self:getNextCharacter() end
		do return _g.sling.model.SafeUnwrapOptionalExpressionNode._construct0(_g.sling.model.SafeUnwrapOptionalExpressionNode._create()) end
	end
	do return nil end
end

function sling.parser.SlingParser:acceptExpressions15()
	local pe = self:acceptUnwrappingExpression(self:acceptExpressions16())
	if not (pe ~= nil) then
		do return nil end
	end
	do
		local pi = nil
		while true do
			local ctc = self.currentTokenColumn
			local ctl = self.currentTokenLine
			local ctp = self.iterator:getCurrentPosition()
			local cqs = 0
			if self.commentQueue ~= nil then
				cqs = self.commentQueue:getSize()
			end
			do
				local cpt = self.previousToken
				local hadNewLine = self:acceptMultipleNewlineTokens()
				local dot = self:acceptToken1(".")
				if dot ~= nil then
					local ne = self:acceptUnwrappingExpression(self:acceptSymbolExpression(false))
					if not (ne ~= nil) then
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
						do break end
					end
					if pi == nil then
						pi = _g.sling.model.MemberAccessExpressionNode:forNodes(pe, ne)
						pe = pi
					else
						local nx = _g.sling.model.MemberAccessExpressionNode:forNodes(pi:exportChildExpression(), ne)
						do pi:setChildExpression(nx, false) end
						pi = nx
					end
					do pi:setSource(dot) end
					goto _continue13
				end
				if hadNewLine == nil then
					local params = self:acceptFunctionCallParameters()
					if params ~= nil then
						local fc = _g.sling.model.FunctionCallExpressionNode:forExpression(pe)
						do fc:setParameters(params, false) end
						do
							local uw = self:getUnwrappingExpression()
							local fdexpr = self:acceptFunctionDeclarationExpression()
							if fdexpr ~= nil then
								do fc:setTrailingParameter(fdexpr, false) end
							end
							do fc:setSource(pe:getSource()) end
							if uw ~= nil then
								do uw:setExpression(fc, false) end
								do uw:setSource(fc:getSource()) end
								pe = uw
							else
								pe = fc
							end
							pi = nil
							goto _continue13
						end
					end
				end
				if hadNewLine == nil and self:acceptToken2(91) ~= nil then
					local subscript = nil
					if self:acceptToken2(93) == nil then
						subscript = self:parseExpression(true)
						do self:parseToken2(93) end
					end
					do
						local se = _g.sling.model.SubscriptExpressionNode:instance(pe, subscript)
						do se:setSource(pe:getSource()) end
						pe = self:acceptUnwrappingExpression(se)
						pi = nil
						goto _continue13
					end
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do break end
			end
			::_continue13::
		end
		if self:acceptToken1("++") ~= nil then
			local r = _g.sling.model.PostIncrementExpressionNode:forExpression(pe)
			do r:setSource(pe:getSource()) end
			do return r end
		end
		if self:acceptToken1("--") ~= nil then
			local r = _g.sling.model.PostDecrementExpressionNode:forExpression(pe)
			do r:setSource(pe:getSource()) end
			do return r end
		end
		do return pe end
	end
end

function sling.parser.SlingParser:acceptLegacyTypeCastOperator()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local open = self:acceptToken2(40)
		if not (open ~= nil) then
			do return nil end
		end
		do
			local dt = nil
			do
				local _status, _err = _vm:execute_protected_call(function()
					dt = self:acceptDataType(true)
				end)
				if _err then
					if (_vm:to_table_with_key(_err, '_isType.jk.lang.Exception') ~= nil) then
						local e = _err
						dt = nil
					else
						_vm:throw_error(_err)
					end
				end
			end
			if not (dt ~= nil) then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return nil end
			end
			if not (self:acceptToken2(41) ~= nil) then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return nil end
			end
			do return dt end
		end
	end
end

function sling.parser.SlingParser:acceptExpressions14()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		if self.acceptDeprecatedConstructs then
			if self:acceptToken1("TYPEINFO") ~= nil then
				local src = self:getAcceptedToken()
				if self:acceptToken2(40) ~= nil then
					local xpr = self:acceptExpression(false)
					if xpr ~= nil then
						do self:parseToken2(41) end
						do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", src)) end
						do
							local v = _g.sling.model.GetExpressionTypeinfoExpressionNode:forExpression(xpr)
							do v:setSource(src) end
							do return v end
						end
					end
				end
				if self:acceptToken2(91) ~= nil then
					local dt = self:acceptDataType(true)
					if dt ~= nil then
						do self:parseToken2(93) end
						do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", src)) end
						do
							local v = _g.sling.model.GetDatatypeTypeinfoExpressionNode:forDatatype(dt)
							do v:setSource(src) end
							do return v end
						end
					end
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			if self:acceptToken1("MALLOC") ~= nil then
				local src = self:getAcceptedToken()
				local parens = self:acceptToken2(40)
				local sz = self:acceptExpression(false)
				if sz ~= nil then
					if parens ~= nil then
						do self:parseToken2(41) end
					end
					do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", src)) end
					do
						local v = _g.sling.model.AllocateBufferExpressionNode._construct0(_g.sling.model.AllocateBufferExpressionNode._create())
						do v:setSource(src) end
						do v:setExpression(sz, false) end
						do return v end
					end
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			if self:acceptToken1("SIZE") ~= nil then
				local src = self:getAcceptedToken()
				local parens = self:acceptToken2(40)
				local expr = self:acceptExpression(false)
				if expr ~= nil then
					if parens ~= nil then
						do self:parseToken2(41) end
					end
					do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", src)) end
					do
						local v = _g.sling.model.GetSizeExpressionNode:forExpression(expr)
						do v:setSource(src) end
						do return v end
					end
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			if self:acceptToken1("DEFAULT") ~= nil then
				local src = self:getAcceptedToken()
				local parens = self:acceptToken2(40)
				local dt = self:acceptDataType(true)
				if dt ~= nil then
					if parens ~= nil then
						do self:parseToken2(41) end
					end
					do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", src)) end
					do
						local v = _g.sling.model.DataTypeDefaultValueExpressionNode:forType(dt)
						do v:setSource(src) end
						do return v end
					end
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
		end
		if self:acceptToken1("typeof") ~= nil then
			if self:peekNextCharacter() ~= 40 then
				local src = self:getAcceptedToken()
				local xpr = self:acceptExpression(false)
				if xpr ~= nil then
					local v = _g.sling.model.GetExpressionTypeinfoExpressionNode:forExpression(xpr)
					do v:setSource(src) end
					do return v end
				end
			end
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
		end
		if self:acceptToken1("typeinfo") ~= nil then
			if self:peekNextCharacter() ~= 40 then
				local src = self:getAcceptedToken()
				local dt = self:acceptDataType(true)
				if dt ~= nil then
					local v = _g.sling.model.GetDatatypeTypeinfoExpressionNode:forDatatype(dt)
					do v:setSource(src) end
					do return v end
				end
			end
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
		end
		if self:acceptToken1("sizeof") ~= nil then
			if self:peekNextCharacter() ~= 40 then
				local src = self:getAcceptedToken()
				local expr = self:acceptExpressions14()
				if expr ~= nil then
					local v = _g.sling.model.GetSizeExpressionNode:forExpression(expr)
					do v:setSource(src) end
					do return v end
				end
			end
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
		end
		if self:acceptToken1("defaultvalue") ~= nil then
			if self:peekNextCharacter() ~= 40 then
				local src = self:getAcceptedToken()
				local dt = self:acceptDataType(true)
				if dt ~= nil then
					do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", src)) end
					do
						local v = _g.sling.model.DataTypeDefaultValueExpressionNode:forType(dt)
						do v:setSource(src) end
						do return v end
					end
				end
			end
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
		end
		if self:acceptToken1("defaultValue") ~= nil then
			local pnc = self:peekNextCharacter()
			if pnc ~= 40 then
				local src = self:getAcceptedToken()
				if self:acceptToken2(60) ~= nil then
					local dt = self:acceptDataType(true)
					if dt ~= nil then
						if self:acceptToken2(62) ~= nil then
							local v = _g.sling.model.DataTypeDefaultValueExpressionNode:forType(dt)
							do v:setSource(src) end
							do return v end
						end
					end
				else
					local v = _g.sling.model.DefaultValueExpressionNode._construct0(_g.sling.model.DefaultValueExpressionNode._create())
					do v:setSource(src) end
					do return v end
				end
			end
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
		end
		if self:acceptToken1("++") ~= nil then
			local src = self:getAcceptedToken()
			local v = self:acceptExpressions14()
			if v ~= nil then
				local r = _g.sling.model.PreIncrementExpressionNode:forExpression(v)
				do r:setSource(src) end
				do return r end
			end
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
		end
		if self:acceptToken1("--") ~= nil then
			local src = self:getAcceptedToken()
			local v = self:acceptExpressions14()
			if v ~= nil then
				local r = _g.sling.model.PreDecrementExpressionNode:forExpression(v)
				do r:setSource(src) end
				do return r end
			end
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
		end
		if self:acceptToken1("+") ~= nil then
			local right = self:acceptExpressions14()
			if right ~= nil then
				do return right end
			end
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
		end
		if self:acceptToken1("await") ~= nil then
			if self:peekNextCharacter() ~= 40 then
				local src = self:getAcceptedToken()
				local right = self:acceptExpressions14()
				if right ~= nil then
					local v = _g.sling.model.AwaitExpressionNode:forExpression(right)
					do v:setSource(src) end
					do return v end
				end
			end
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
		end
		if self:acceptToken1("promise") ~= nil then
			if self:peekNextCharacter() ~= 40 then
				local src = self:getAcceptedToken()
				local right = self:acceptExpressions13()
				if right ~= nil then
					local v = _g.sling.model.PromiseExpressionNode:forExpression(right)
					do v:setSource(src) end
					do return v end
				end
			end
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
		end
		if self:acceptToken1("addr") ~= nil then
			if self:isSpaceCharacter(self:peekNextCharacter()) == false then
				local src = self:getAcceptedToken()
				local right = self:acceptExpressions14()
				if right ~= nil then
					local v = _g.sling.model.GetAddressExpressionNode._construct0(_g.sling.model.GetAddressExpressionNode._create())
					do v:setExpression(right, false) end
					do v:setSource(src) end
					do return v end
				end
			end
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
		end
		if self:acceptToken1("ref") ~= nil then
			if self:isSpaceCharacter(self:peekNextCharacter()) == false then
				local src = self:getAcceptedToken()
				local right = self:acceptExpressions14()
				if right ~= nil then
					local v = _g.sling.model.GetReferenceExpressionNode._construct0(_g.sling.model.GetReferenceExpressionNode._create())
					do v:setExpression(right, false) end
					do v:setSource(src) end
					do return v end
				end
			end
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
		end
		if self:acceptToken1("val") ~= nil then
			if self:isSpaceCharacter(self:peekNextCharacter()) == false then
				local src = self:getAcceptedToken()
				local right = self:acceptExpressions14()
				if right ~= nil then
					local v = _g.sling.model.GetValueExpressionNode._construct0(_g.sling.model.GetValueExpressionNode._create())
					do v:setExpression(right, false) end
					do v:setSource(src) end
					do return v end
				end
			end
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
		end
		if self:acceptToken1("+") ~= nil then
			local src = self:getAcceptedToken()
			local right = self:acceptExpressions14()
			if right ~= nil then
				local v = _g.sling.model.PositiveNumberExpressionNode:forExpression(right)
				do v:setSource(src) end
				do return v end
			end
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
		end
		if self:acceptToken1("-") ~= nil then
			local src = self:getAcceptedToken()
			local right = self:acceptExpressions14()
			if right ~= nil then
				local v = _g.sling.model.NegativeNumberExpressionNode:forExpression(right)
				do v:setSource(src) end
				do return v end
			end
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
		end
		if self:acceptToken1("!") ~= nil then
			local src = self:getAcceptedToken()
			local v = self:acceptExpressions14()
			if v ~= nil then
				local r = _g.sling.model.LogicalNotExpressionNode:forExpression(v)
				do r:setSource(src) end
				do return r end
			end
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
		end
		if self:acceptToken1("not") ~= nil then
			if self:peekNextCharacter() ~= 40 then
				local src = self:getAcceptedToken()
				local v = self:acceptExpressions14()
				if v ~= nil then
					local r = _g.sling.model.LogicalNotExpressionNode:forExpression(v)
					do r:setSource(src) end
					do return r end
				end
			end
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
		end
		if self:acceptToken1("~") ~= nil then
			local src = self:getAcceptedToken()
			local v = self:acceptExpressions14()
			if v ~= nil then
				local r = _g.sling.model.BitwiseNotExpressionNode:forExpression(v)
				do r:setSource(src) end
				do return r end
			end
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
		end
		if self.acceptDeprecatedConstructs then
			local castdt = self:acceptLegacyTypeCastOperator()
			if castdt ~= nil then
				local v = self:acceptExpressions14()
				if v ~= nil then
					do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated syntax for static cast expressions: Use either `as' or `as!' instead.", castdt)) end
					do
						local r = _g.sling.model.StaticCastExpressionNode:instance(castdt, v)
						do r:setSource(castdt:getSource()) end
						do return r end
					end
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
		end
		do
			local left = self:acceptExpressions15()
			while true do
				local ctc = self.currentTokenColumn
				local ctl = self.currentTokenLine
				local ctp = self.iterator:getCurrentPosition()
				local cqs = 0
				if self.commentQueue ~= nil then
					cqs = self.commentQueue:getSize()
				end
				do
					local cpt = self.previousToken
					local o1 = self:acceptBinaryOperator("as!")
					if o1 ~= nil then
						local right = self:acceptDataType(true)
						if right ~= nil then
							local v = _g.sling.model.StaticCastExpressionNode:instance(right, left)
							do v:setSource(o1) end
							left = v
							goto _continue14
						end
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
					end
					do
						local o2 = self:acceptBinaryOperator("as")
						if o2 ~= nil then
							local right = self:acceptDataType(true)
							if right ~= nil then
								if (_vm:to_table_with_key(right, '_isType.sling.model.PrimitiveDataTypeNode') ~= nil) then
									local v = _g.sling.model.StaticCastExpressionNode:instance(right, left)
									do v:setSource(o2) end
									left = v
								else
									local v = _g.sling.model.DynamicCastExpressionNode:instance(right, left)
									do v:setSource(o2) end
									left = v
								end
								goto _continue14
							end
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
						end
						do break end
					end
				end
				::_continue14::
			end
			do return left end
		end
	end
end

function sling.parser.SlingParser:acceptExpressions13()
	local left = self:acceptExpressions14()
	if not (left ~= nil) then
		do return nil end
	end
	while true do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			local o1 = self:acceptBinaryOperator("*")
			if o1 ~= nil then
				local right = self:acceptExpressions14()
				if right ~= nil then
					local v = _g.sling.model.MultiplicationExpressionNode:instance(left, right)
					do v:setSource(o1) end
					left = v
					goto _continue15
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			do
				local o2 = self:acceptBinaryOperator("/")
				if o2 ~= nil then
					local right = self:acceptExpressions14()
					if right ~= nil then
						local v = _g.sling.model.DivisionExpressionNode:instance(left, right)
						do v:setSource(o2) end
						left = v
						goto _continue15
					end
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
				end
				do
					local o3 = self:acceptBinaryOperator("%")
					if o3 ~= nil then
						local right = self:acceptExpressions14()
						if right ~= nil then
							local v = _g.sling.model.ModuloExpressionNode:instance(left, right)
							do v:setSource(o3) end
							left = v
							goto _continue15
						end
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
					end
					do
						local o4 = self:acceptBinaryOperator("...")
						if o4 ~= nil then
							local right = self:acceptExpressions14()
							if right ~= nil then
								local v = _g.sling.model.RangeExpressionNode:instance(left, right)
								do v:setSource(o4) end
								do v:setExclusionType(_g.sling.model.RangeExpressionNode.TYPE_NONE) end
								left = v
								goto _continue15
							end
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
						end
						do
							local o5 = self:acceptBinaryOperator("..<")
							if o5 ~= nil then
								local right = self:acceptExpressions14()
								if right ~= nil then
									local v = _g.sling.model.RangeExpressionNode:instance(left, right)
									do v:setSource(o5) end
									do v:setExclusionType(_g.sling.model.RangeExpressionNode.TYPE_EXCLUDE_UPPER_BOUND) end
									left = v
									goto _continue15
								end
								self.currentTokenColumn = ctc
								self.currentTokenLine = ctl
								do self.iterator:setCurrentPosition(ctp) end
								while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
									do self.commentQueue:pop() end
								end
								self.previousToken = cpt
							end
							do
								local o6 = self:acceptBinaryOperator(">..")
								if o6 ~= nil then
									local right = self:acceptExpressions14()
									if right ~= nil then
										local v = _g.sling.model.RangeExpressionNode:instance(left, right)
										do v:setSource(o6) end
										do v:setExclusionType(_g.sling.model.RangeExpressionNode.TYPE_EXCLUDE_LOWER_BOUND) end
										left = v
										goto _continue15
									end
									self.currentTokenColumn = ctc
									self.currentTokenLine = ctl
									do self.iterator:setCurrentPosition(ctp) end
									while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
										do self.commentQueue:pop() end
									end
									self.previousToken = cpt
								end
								do
									local o7 = self:acceptBinaryOperator(">.<")
									if o7 ~= nil then
										local right = self:acceptExpressions14()
										if right ~= nil then
											local v = _g.sling.model.RangeExpressionNode:instance(left, right)
											do v:setSource(o7) end
											do v:setExclusionType(_g.sling.model.RangeExpressionNode.TYPE_EXCLUDE_BOTH_BOUNDS) end
											left = v
											goto _continue15
										end
										self.currentTokenColumn = ctc
										self.currentTokenLine = ctl
										do self.iterator:setCurrentPosition(ctp) end
										while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
											do self.commentQueue:pop() end
										end
										self.previousToken = cpt
									end
									do break end
								end
							end
						end
					end
				end
			end
		end
		::_continue15::
	end
	do return left end
end

function sling.parser.SlingParser:acceptExpressions12()
	local left = self:acceptExpressions13()
	if not (left ~= nil) then
		do return nil end
	end
	while true do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			local o1 = self:acceptBinaryOperator("..")
			if o1 ~= nil then
				local right = self:acceptExpressions13()
				if right ~= nil then
					local v = _g.sling.model.StringConcatenationExpressionNode:instance(left, right)
					do v:setSource(o1) end
					left = v
					goto _continue16
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			do
				local o2 = self:acceptBinaryOperator("+")
				if o2 ~= nil then
					local right = self:acceptExpressions13()
					if right ~= nil then
						local v = _g.sling.model.AdditionExpressionNode:instance(left, right)
						do v:setSource(o2) end
						left = v
						goto _continue16
					end
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
				end
				do
					local o3 = self:acceptBinaryOperator("-")
					if o3 ~= nil then
						local right = self:acceptExpressions13()
						if right ~= nil then
							local v = _g.sling.model.SubtractionExpressionNode:instance(left, right)
							do v:setSource(o3) end
							left = v
							goto _continue16
						end
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
					end
					do break end
				end
			end
		end
		::_continue16::
	end
	do return left end
end

function sling.parser.SlingParser:acceptExpressions11()
	local left = self:acceptExpressions12()
	if not (left ~= nil) then
		do return nil end
	end
	while true do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			local o1 = self:acceptBinaryOperator("<<")
			if o1 ~= nil then
				local right = self:acceptExpressions12()
				if right ~= nil then
					local v = _g.sling.model.ShiftLeftExpressionNode:instance(left, right)
					do v:setSource(o1) end
					left = v
					goto _continue17
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			do
				local o2 = self:acceptBinaryOperator(">>")
				if o2 ~= nil then
					local right = self:acceptExpressions12()
					if right ~= nil then
						local v = _g.sling.model.ShiftRightExpressionNode:instance(left, right)
						do v:setSource(o2) end
						left = v
						goto _continue17
					end
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
				end
				do
					local o3 = self:acceptBinaryOperator(">>>")
					if o3 ~= nil then
						local right = self:acceptExpressions12()
						if right ~= nil then
							local v = _g.sling.model.ShiftRightExpressionNode:instance(left, right)
							do v:setZeroLeftmostBit(true) end
							do v:setSource(o3) end
							left = v
							goto _continue17
						end
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
					end
					do break end
				end
			end
		end
		::_continue17::
	end
	do return left end
end

function sling.parser.SlingParser:acceptExpressions10()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		if self:acceptToken1("malloc") ~= nil then
			if self:peekNextCharacter() ~= 40 then
				local src = self:getAcceptedToken()
				local sz = self:acceptExpressions11()
				if sz ~= nil then
					local v = _g.sling.model.AllocateBufferExpressionNode._construct0(_g.sling.model.AllocateBufferExpressionNode._create())
					do v:setSource(src) end
					do v:setExpression(sz, false) end
					do return v end
				end
			end
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
		end
		do return self:acceptExpressions11() end
	end
end

function sling.parser.SlingParser:acceptExpressions9()
	local left = self:acceptExpressions10()
	if not (left ~= nil) then
		do return nil end
	end
	while true do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			local o1 = self:acceptBinaryOperator("<")
			if o1 ~= nil then
				local right = self:acceptExpressions10()
				if right ~= nil then
					local v = _g.sling.model.LessThanExpressionNode:instance(left, right)
					do v:setSource(o1) end
					left = v
					goto _continue18
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			do
				local o2 = self:acceptBinaryOperator(">")
				if o2 ~= nil then
					local right = self:acceptExpressions10()
					if right ~= nil then
						local v = _g.sling.model.GreaterThanExpressionNode:instance(left, right)
						do v:setSource(o2) end
						left = v
						goto _continue18
					end
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
				end
				do
					local o3 = self:acceptBinaryOperator("<=")
					if o3 ~= nil then
						local right = self:acceptExpressions10()
						if right ~= nil then
							local v = _g.sling.model.LessOrEqualExpressionNode:instance(left, right)
							do v:setSource(o3) end
							left = v
							goto _continue18
						end
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
					end
					do
						local o4 = self:acceptBinaryOperator(">=")
						if o4 ~= nil then
							local right = self:acceptExpressions10()
							if right ~= nil then
								local v = _g.sling.model.GreaterOrEqualExpressionNode:instance(left, right)
								do v:setSource(o4) end
								left = v
								goto _continue18
							end
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
						end
						do
							local o5 = self:acceptBinaryOperator("in")
							if o5 ~= nil then
								local right = self:acceptExpressions10()
								if right ~= nil then
									local v = _g.sling.model.MembershipCheckExpressionNode:instance(left, right)
									do v:setSource(o5) end
									left = v
									goto _continue18
								end
								self.currentTokenColumn = ctc
								self.currentTokenLine = ctl
								do self.iterator:setCurrentPosition(ctp) end
								while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
									do self.commentQueue:pop() end
								end
								self.previousToken = cpt
							end
							do
								local o6 = self:acceptBinaryOperator("is")
								if o6 ~= nil then
									local right = self:acceptDataType(true)
									if right ~= nil then
										local v = _g.sling.model.TypeCheckExpressionNode:instance(right, left, false)
										do v:setSource(o6) end
										left = v
										goto _continue18
									end
									self.currentTokenColumn = ctc
									self.currentTokenLine = ctl
									do self.iterator:setCurrentPosition(ctp) end
									while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
										do self.commentQueue:pop() end
									end
									self.previousToken = cpt
								end
								do break end
							end
						end
					end
				end
			end
		end
		::_continue18::
	end
	do return left end
end

function sling.parser.SlingParser:acceptExpressions8()
	local left = self:acceptExpressions9()
	if not (left ~= nil) then
		do return nil end
	end
	while true do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			local o1 = self:acceptBinaryOperator("==")
			if o1 ~= nil then
				local right = self:acceptExpressions9()
				if right ~= nil then
					local v = _g.sling.model.EqualsExpressionNode:instance(left, right)
					do v:setSource(o1) end
					left = v
					goto _continue19
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			do
				local o2 = self:acceptBinaryOperator("!=")
				if o2 ~= nil then
					local right = self:acceptExpressions9()
					if right ~= nil then
						local v = _g.sling.model.NotEqualsExpressionNode:instance(left, right)
						do v:setSource(o2) end
						left = v
						goto _continue19
					end
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
				end
				do break end
			end
		end
		::_continue19::
	end
	do return left end
end

function sling.parser.SlingParser:acceptExpressions7()
	local left = self:acceptExpressions8()
	if not (left ~= nil) then
		do return nil end
	end
	while true do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			local o1 = self:acceptBinaryOperator("&")
			if o1 ~= nil then
				local right = self:acceptExpressions8()
				if right ~= nil then
					local v = _g.sling.model.BitwiseAndExpressionNode:instance(left, right)
					do v:setSource(o1) end
					left = v
					goto _continue20
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			do break end
		end
		::_continue20::
	end
	do return left end
end

function sling.parser.SlingParser:acceptExpressions6()
	local left = self:acceptExpressions7()
	if not (left ~= nil) then
		do return nil end
	end
	while true do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			local o1 = self:acceptBinaryOperator("^")
			if o1 ~= nil then
				local right = self:acceptExpressions7()
				if right ~= nil then
					local v = _g.sling.model.BitwiseXorExpressionNode:instance(left, right)
					do v:setSource(o1) end
					left = v
					goto _continue21
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			do break end
		end
		::_continue21::
	end
	do return left end
end

function sling.parser.SlingParser:acceptBitwiseOrExpression()
	local left = self:acceptExpressions6()
	if not (left ~= nil) then
		do return nil end
	end
	while true do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			local o1 = self:acceptBinaryOperator("|")
			if o1 ~= nil then
				local right = self:acceptExpressions6()
				if right ~= nil then
					local v = _g.sling.model.BitwiseOrExpressionNode:instance(left, right)
					do v:setSource(o1) end
					left = v
					goto _continue22
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			do break end
		end
		::_continue22::
	end
	do return left end
end

function sling.parser.SlingParser:acceptLogicalAndExpression()
	local left = self:acceptBitwiseOrExpression()
	if not (left ~= nil) then
		do return nil end
	end
	while true do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			local o1 = self:acceptBinaryOperator("&&")
			if o1 ~= nil then
				local right = self:acceptBitwiseOrExpression()
				if right ~= nil then
					local v = _g.sling.model.LogicalAndExpressionNode:instance(left, right)
					do v:setSource(o1) end
					left = v
					goto _continue23
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			do break end
		end
		::_continue23::
	end
	do return left end
end

function sling.parser.SlingParser:acceptLogicalXorExpression()
	local left = self:acceptLogicalAndExpression()
	if not (left ~= nil) then
		do return nil end
	end
	while true do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			local o1 = self:acceptBinaryOperator("^^")
			if o1 ~= nil then
				local right = self:acceptLogicalAndExpression()
				if right ~= nil then
					local v = _g.sling.model.LogicalXorExpressionNode:instance(left, right)
					do v:setSource(o1) end
					left = v
					goto _continue24
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			do break end
		end
		::_continue24::
	end
	do return left end
end

function sling.parser.SlingParser:acceptLogicalOrExpression()
	local left = self:acceptLogicalXorExpression()
	if not (left ~= nil) then
		do return nil end
	end
	while true do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			local o1 = self:acceptBinaryOperator("||")
			if o1 ~= nil then
				local right = self:acceptLogicalXorExpression()
				if right ~= nil then
					local v = _g.sling.model.LogicalOrExpressionNode:instance(left, right)
					do v:setSource(o1) end
					left = v
					goto _continue25
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			do break end
		end
		::_continue25::
	end
	do return left end
end

function sling.parser.SlingParser:acceptDynamicAndExpression()
	local left = self:acceptLogicalOrExpression()
	if not (left ~= nil) then
		do return nil end
	end
	while true do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			local o1 = self:acceptBinaryOperator("&&&")
			if o1 ~= nil then
				local right = self:acceptLogicalOrExpression()
				if right ~= nil then
					local v = _g.sling.model.DynamicAndExpressionNode:instance(left, right)
					do v:setSource(o1) end
					left = v
					goto _continue26
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			do break end
		end
		::_continue26::
	end
	do return left end
end

function sling.parser.SlingParser:acceptDynamicXorExpression()
	local left = self:acceptDynamicAndExpression()
	if not (left ~= nil) then
		do return nil end
	end
	while true do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			local o1 = self:acceptBinaryOperator("^^^")
			if o1 ~= nil then
				local right = self:acceptDynamicAndExpression()
				if right ~= nil then
					local v = _g.sling.model.DynamicXorExpressionNode:instance(left, right)
					do v:setSource(o1) end
					left = v
					goto _continue27
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			do break end
		end
		::_continue27::
	end
	do return left end
end

function sling.parser.SlingParser:acceptDynamicOrExpression()
	local left = self:acceptDynamicXorExpression()
	if not (left ~= nil) then
		do return nil end
	end
	while true do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			local o1 = self:acceptBinaryOperator("|||")
			if o1 ~= nil then
				local right = self:acceptDynamicXorExpression()
				if right ~= nil then
					local v = _g.sling.model.DynamicOrExpressionNode:instance(left, right)
					do v:setSource(o1) end
					left = v
					goto _continue28
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			do break end
		end
		::_continue28::
	end
	do return left end
end

function sling.parser.SlingParser:acceptConditionalExpression()
	local left = self:acceptDynamicOrExpression()
	if not (left ~= nil) then
		do return nil end
	end
	while true do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			local o1 = self:acceptToken2(63)
			if o1 ~= nil then
				local trueExpr = self:acceptExpression(false)
				if trueExpr ~= nil and self:acceptToken2(58) ~= nil then
					local falseExpr = self:acceptExpression(false)
					if falseExpr ~= nil then
						local v = _g.sling.model.ConditionalExpressionNode:instance(left, trueExpr, falseExpr)
						do v:setSource(o1) end
						left = v
						goto _continue29
					end
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			do break end
		end
		::_continue29::
	end
	do return left end
end

function sling.parser.SlingParser:acceptAssignmentExpressions()
	local left = self:acceptConditionalExpression()
	if not (left ~= nil) then
		do return nil end
	end
	while true do
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			local o1 = self:acceptBinaryOperator("=")
			if o1 ~= nil then
				local right = self:acceptConditionalExpression()
				if right ~= nil then
					local v = _g.sling.model.AssignmentExpressionNode:forNodes(left, right)
					do v:setSource(o1) end
					left = v
					goto _continue30
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			do
				local o2 = self:acceptBinaryOperator("*=")
				if o2 ~= nil then
					local right = self:acceptConditionalExpression()
					if right ~= nil then
						local v = _g.sling.model.MultiplicationAssignmentExpressionNode:instance(left, right)
						do v:setSource(o2) end
						left = v
						goto _continue30
					end
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
				end
				do
					local o3 = self:acceptBinaryOperator("/=")
					if o3 ~= nil then
						local right = self:acceptConditionalExpression()
						if right ~= nil then
							local v = _g.sling.model.DivisionAssignmentExpressionNode:instance(left, right)
							do v:setSource(o3) end
							left = v
							goto _continue30
						end
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
					end
					do
						local o4 = self:acceptBinaryOperator("%=")
						if o4 ~= nil then
							local right = self:acceptConditionalExpression()
							if right ~= nil then
								local v = _g.sling.model.ModuloAssignmentExpressionNode:instance(left, right)
								do v:setSource(o4) end
								left = v
								goto _continue30
							end
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
						end
						do
							local o5 = self:acceptBinaryOperator("+=")
							if o5 ~= nil then
								local right = self:acceptConditionalExpression()
								if right ~= nil then
									local v = _g.sling.model.AdditionAssignmentExpressionNode:instance(left, right)
									do v:setSource(o5) end
									left = v
									goto _continue30
								end
								self.currentTokenColumn = ctc
								self.currentTokenLine = ctl
								do self.iterator:setCurrentPosition(ctp) end
								while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
									do self.commentQueue:pop() end
								end
								self.previousToken = cpt
							end
							do
								local o6 = self:acceptBinaryOperator("-=")
								if o6 ~= nil then
									local right = self:acceptConditionalExpression()
									if right ~= nil then
										local v = _g.sling.model.SubtractionAssignmentExpressionNode:instance(left, right)
										do v:setSource(o6) end
										left = v
										goto _continue30
									end
									self.currentTokenColumn = ctc
									self.currentTokenLine = ctl
									do self.iterator:setCurrentPosition(ctp) end
									while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
										do self.commentQueue:pop() end
									end
									self.previousToken = cpt
								end
								do
									local o7 = self:acceptBinaryOperator("<<=")
									if o7 ~= nil then
										local right = self:acceptConditionalExpression()
										if right ~= nil then
											local v = _g.sling.model.ShiftLeftAssignmentExpressionNode:instance(left, right)
											do v:setSource(o7) end
											left = v
											goto _continue30
										end
										self.currentTokenColumn = ctc
										self.currentTokenLine = ctl
										do self.iterator:setCurrentPosition(ctp) end
										while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
											do self.commentQueue:pop() end
										end
										self.previousToken = cpt
									end
									do
										local o8 = self:acceptBinaryOperator(">>=")
										if o8 ~= nil then
											local right = self:acceptConditionalExpression()
											if right ~= nil then
												local v = _g.sling.model.ShiftRightAssignmentExpressionNode:instance(left, right)
												do v:setSource(o8) end
												left = v
												goto _continue30
											end
											self.currentTokenColumn = ctc
											self.currentTokenLine = ctl
											do self.iterator:setCurrentPosition(ctp) end
											while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
												do self.commentQueue:pop() end
											end
											self.previousToken = cpt
										end
										do
											local o9 = self:acceptBinaryOperator(">>>=")
											if o9 ~= nil then
												local right = self:acceptConditionalExpression()
												if right ~= nil then
													local v = _g.sling.model.ShiftRightAssignmentExpressionNode:instance(left, right)
													do v:setSource(o9) end
													do v:setZeroLeftmostBit(true) end
													left = v
													goto _continue30
												end
												self.currentTokenColumn = ctc
												self.currentTokenLine = ctl
												do self.iterator:setCurrentPosition(ctp) end
												while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
													do self.commentQueue:pop() end
												end
												self.previousToken = cpt
											end
											do
												local o10 = self:acceptBinaryOperator("&=")
												if o10 ~= nil then
													local right = self:acceptConditionalExpression()
													if right ~= nil then
														local v = _g.sling.model.BitwiseAndAssignmentExpressionNode:instance(left, right)
														do v:setSource(o10) end
														left = v
														goto _continue30
													end
													self.currentTokenColumn = ctc
													self.currentTokenLine = ctl
													do self.iterator:setCurrentPosition(ctp) end
													while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
														do self.commentQueue:pop() end
													end
													self.previousToken = cpt
												end
												do
													local o11 = self:acceptBinaryOperator("^=")
													if o11 ~= nil then
														local right = self:acceptConditionalExpression()
														if right ~= nil then
															local v = _g.sling.model.BitwiseXorAssignmentExpressionNode:instance(left, right)
															do v:setSource(o11) end
															left = v
															goto _continue30
														end
														self.currentTokenColumn = ctc
														self.currentTokenLine = ctl
														do self.iterator:setCurrentPosition(ctp) end
														while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
															do self.commentQueue:pop() end
														end
														self.previousToken = cpt
													end
													do
														local o12 = self:acceptBinaryOperator("|=")
														if o12 ~= nil then
															local right = self:acceptConditionalExpression()
															if right ~= nil then
																local v = _g.sling.model.BitwiseOrAssignmentExpressionNode:instance(left, right)
																do v:setSource(o12) end
																left = v
																goto _continue30
															end
															self.currentTokenColumn = ctc
															self.currentTokenLine = ctl
															do self.iterator:setCurrentPosition(ctp) end
															while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
																do self.commentQueue:pop() end
															end
															self.previousToken = cpt
														end
														do break end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
		::_continue30::
	end
	do return left end
end

function sling.parser.SlingParser:acceptExpression(allowMultipleExpression)
	local exp = self:acceptAssignmentExpressions()
	if allowMultipleExpression and self:acceptToken2(44) ~= nil then
		local v = _g.sling.model.MultipleExpressionNode._construct0(_g.sling.model.MultipleExpressionNode._create())
		do v:addToExpressions(exp) end
		do v:setSource(exp:getSource()) end
		while true do
			local x = self:acceptAssignmentExpressions()
			if not (x ~= nil) then
				do self:skipSpaces() end
				do self:updateStagingToken() end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("expression"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
			end
			do v:addToExpressions(x) end
			if not (self:acceptToken2(44) ~= nil) then
				do break end
			end
		end
		exp = v
	end
	do return exp end
end

function sling.parser.SlingParser:parseExpression(allowMultipleExpression)
	local v = self:acceptExpression(allowMultipleExpression)
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("expression"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.SlingParser:acceptErrorStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("ERROR")
		if not (src ~= nil) then
			do return nil end
		end
		if not (self:peekNextCharacter() ~= 40) then
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
			local message = self:acceptStringLiteral()
			if not (message ~= nil) then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return nil end
			end
			do self:parseEndOfStatementToken() end
			do
				local v = _g.sling.model.ErrorStatementNode._construct0(_g.sling.model.ErrorStatementNode._create())
				do v:setSource(src) end
				do v:setMessage(message) end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptTraceStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("TRACE")
		if not (src ~= nil) then
			do return nil end
		end
		if not (self:peekNextCharacter() ~= 40) then
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
			local message = self:acceptStringLiteral()
			if not (message ~= nil) then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return nil end
			end
			do self:parseEndOfStatementToken() end
			do
				local v = _g.sling.model.ErrorStatementNode._construct0(_g.sling.model.ErrorStatementNode._create())
				do v:setSource(src) end
				do v:setMessage(message) end
				do self:onParseMessage(_g.sling.common.WarningMessage:forText("TRACE statement", src)) end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptLoopVariableDeclaration()
	local src = self:acceptToken1("var")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local name = self:parseDeclarationIdentifier()
		local dt = nil
		local mods = {}
		if self:acceptToken1("as") ~= nil then
			dt = self:parseDataType(true)
		end
		while true do
			local cm = self:acceptAnnotationModifier()
			if cm ~= nil then
				do _g.jk.lang.Vector:append(mods, cm) end
			else
				do break end
			end
		end
		do
			local expr = nil
			if self:acceptToken2(61) ~= nil then
				expr = self:parseExpression(true)
			end
			if dt == nil then
				if expr ~= nil then
					dt = _g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create())
				else
					dt = _g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create())
				end
			end
			do
				local v = _g.sling.model.VariableDeclarationNode:instance(dt, name, nil)
				do v:setSource(src) end
				do v:setModifiers(mods, false) end
				do v:setInitializer(expr, false) end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptForStatementInitializer()
	local v = self:acceptLoopVariableDeclaration()
	if v ~= nil then
		do return v end
	end
	do
		local xp = self:acceptExpression(false)
		if xp ~= nil then
			do return xp end
		end
		do return nil end
	end
end

function sling.parser.SlingParser:acceptForStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("for")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local parens = self:acceptToken2(40)
			local st1 = {}
			if self:acceptToken2(59) ~= nil then
				do _g.jk.lang.Vector:append(st1, _g.sling.model.EmptyStatementNode._construct0(_g.sling.model.EmptyStatementNode._create())) end
			else
				while true do
					local i = self:acceptForStatementInitializer()
					if not (i ~= nil) then
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
						do return nil end
					end
					do _g.jk.lang.Vector:append(st1, i) end
					if self:acceptToken2(44) == nil then
						do break end
					end
				end
				if parens ~= nil then
					if not (self:acceptToken2(59) ~= nil) then
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
						do return nil end
					end
				else
					do self:parseToken2(59) end
				end
			end
			do
				local st2 = nil
				if not (self:acceptToken2(59) ~= nil) then
					st2 = self:parseExpression(true)
					do self:parseToken2(59) end
				end
				do
					local st3 = self:acceptExpression(true)
					if parens ~= nil then
						do self:parseToken2(41) end
					end
					do
						local block = self:parseControlStructureBlock()
						local v = _g.sling.model.ForStatementNode:instance(nil, st2, nil, block)
						if st1 ~= nil then
							local n = 0
							local m = _g.jk.lang.Vector:getSize(st1)
							do
								n = 0
								while n < m do
									local st = _vm:to_table_with_key(st1[n + 1], '_isType.sling.common.NodeObject')
									if st ~= nil then
										do v:addInitializer(st) end
									end
									do n = n + 1 end
								end
							end
						end
						do v:addFinalizer(st3) end
						do v:setSource(src) end
						do return v end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:parseControlStructureBlock()
	local block = self:acceptBlockOrStatement(false, nil)
	if block ~= nil then
		do return block end
	end
	do
		local eos = self:acceptEndOfStatementToken()
		if eos ~= nil then
			do return nil end
		end
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("block, single-statement block or end of statement"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
		do return nil end
	end
end

function sling.parser.SlingParser:parseFunctionBlock(meta)
	local block = self:acceptBlockOrStatement(true, meta)
	if block ~= nil then
		do return block end
	end
	do
		local eos = self:acceptEndOfStatementToken()
		if eos ~= nil then
			do return nil end
		end
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("block, single-statement block or end of statement"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
		do return nil end
	end
end

function sling.parser.SlingParser:acceptAssertStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("assert")
		if not (src ~= nil) then
			do return nil end
		end
		if not (self:peekNextCharacter() ~= 40) then
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
			local expression = self:acceptExpression(true)
			if not (expression ~= nil) then
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
				local block = self:parseControlStructureBlock()
				local v = _g.sling.model.AssertStatementNode:forChild(expression)
				do v:setSource(src) end
				do v:setStyle(_g.sling.model.AssertStatementNode.STYLE_RETURN) end
				do v:setErrorBlock(block, false) end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptBlockOrStatement(newlineForBrace, meta)
	local statement = self:acceptToken2(58)
	if statement ~= nil then
		do self:parseNewlineToken() end
		do
			local stmt = self:parseStatement()
			local v = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
			do v:setSource(statement) end
			do self:addDeclarationToContainer(v, stmt) end
			do return v end
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
			local newline = self:acceptNewlineToken()
			local block = self:acceptBlock(true, meta)
			if not (block ~= nil) then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return nil end
			end
			if newlineForBrace then
				if newline == nil then
					do self:onParseMessage(_g.sling.common.WarningMessage:forText("Expected: " .. "newline", block)) end
				end
			elseif newline ~= nil then
				do self:onParseMessage(_g.sling.common.WarningMessage:forText("Improper newline", newline)) end
			end
			do return block end
		end
	end
end

function sling.parser.SlingParser:parseBlockOrStatement(newlineForBrace, meta)
	local v = self:acceptBlockOrStatement(newlineForBrace, meta)
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("block or statement"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.SlingParser:acceptIfStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("if")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local condition = nil
			if self:getNextCharacter() == 40 then
				if not self.acceptDeprecatedConstructs then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				if not ((function()
					condition = self:acceptExpression(true)
					do return condition end
				end)() ~= nil) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				if not (self:acceptToken2(41) ~= nil) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				if not (self:peekToken2(58) or self:peekToken2(123)) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated if syntax with parenthesis", src)) end
			else
				if not ((function()
					condition = self:acceptExpression(true)
					do return condition end
				end)() ~= nil) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				if not (self:peekToken2(58) or self:peekToken2(123)) then
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
				local block = self:parseControlStructureBlock()
				if block == nil then
					do self:onParseMessage(_g.sling.common.WarningMessage:forText("The `if' statement has no block. This doesn't make sense.", src)) end
				end
				do
					local elseBlock = nil
					local elseComment = nil
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
							elseComment = self:acceptCommentWithNewlines()
							do self:skipUnnecessaryEmptyLines() end
							do
								local elseToken = self:acceptToken1("else")
								if elseToken ~= nil then
									local childIf = self:acceptIfStatement()
									if childIf ~= nil then
										elseBlock = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
										do elseBlock:addNode(childIf) end
										do elseBlock:setSource(elseToken) end
									else
										elseBlock = self:parseControlStructureBlock()
										if elseBlock == nil then
											do self:onParseMessage(_g.sling.common.WarningMessage:forText("The `else' statement has no block. This doesn't make sense.", elseToken)) end
										end
									end
								else
									self.currentTokenColumn = ctc
									self.currentTokenLine = ctl
									do self.iterator:setCurrentPosition(ctp) end
									while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
										do self.commentQueue:pop() end
									end
									self.previousToken = cpt
								end
							end
						end
					end
					do
						local v = _g.sling.model.IfStatementNode:instance(condition, block, elseBlock)
						do v:setSource(src) end
						do v:setElseBlockComment(elseComment, false) end
						do return v end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptWhileStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("while")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local condition = nil
			if self:getNextCharacter() == 40 then
				if not self.acceptDeprecatedConstructs then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				if not ((function()
					condition = self:acceptExpression(true)
					do return condition end
				end)() ~= nil) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				if not (self:acceptToken2(41) ~= nil) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				if not (self:peekToken2(58) or self:peekToken2(123)) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated while syntax with parenthesis", src)) end
			elseif not ((function()
				condition = self:acceptExpression(true)
				do return condition end
			end)() ~= nil) then
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
				local block = self:parseControlStructureBlock()
				local elseBlock = nil
				if self:acceptToken1("else") ~= nil then
					elseBlock = self:parseControlStructureBlock()
				end
				do
					local v = _g.sling.model.WhileStatementNode:instance(condition, block, elseBlock)
					do v:setSource(src) end
					do return v end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptBreakStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("break")
		if not (src ~= nil) then
			do return nil end
		end
		if not (self:acceptEndOfStatementToken() ~= nil) then
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
			local v = _g.sling.model.BreakStatementNode._construct0(_g.sling.model.BreakStatementNode._create())
			do v:setSource(src) end
			do return v end
		end
	end
end

function sling.parser.SlingParser:acceptContinueStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("continue")
		if not (src ~= nil) then
			do return nil end
		end
		if not (self:acceptEndOfStatementToken() ~= nil) then
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
			local v = _g.sling.model.ContinueStatementNode._construct0(_g.sling.model.ContinueStatementNode._create())
			do v:setSource(src) end
			do return v end
		end
	end
end

function sling.parser.SlingParser:acceptDoStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("do")
		if not (src ~= nil) then
			do return nil end
		end
		if not (self:peekToken2(58) or self:peekToken2(123)) then
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
			local block = self:parseControlStructureBlock()
			local parens = false
			if self.acceptDeprecatedConstructs and self:acceptToken1("while(") ~= nil then
				parens = true
				do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated syntax with parenthesis", self:getAcceptedToken())) end
			else
				do self:parseToken1("while") end
			end
			do
				local condition = self:parseExpression(true)
				if parens then
					do self:parseToken2(41) end
				end
				do self:parseEndOfStatementToken() end
				do
					local v = _g.sling.model.DoWhileStatementNode:instance(condition, block)
					do v:setSource(src) end
					do return v end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptPrintLineStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		if self.acceptDeprecatedConstructs then
			local ps = self:acceptToken1("PRINT")
			if ps ~= nil then
				local expr = self:acceptExpression(true)
				if not (self:acceptEndOfStatementToken() ~= nil) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", ps)) end
				do
					local v = _g.sling.model.PrintLineStatementNode:forExpression(expr)
					do v:setSource(ps) end
					do return v end
				end
			end
		end
		do
			local src = self:acceptToken1("println")
			if not (src ~= nil) then
				do return nil end
			end
			if not (self:peekNextCharacter() ~= 40) then
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
				local expr = self:acceptExpression(true)
				if not (self:acceptEndOfStatementToken() ~= nil) then
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
					local v = _g.sling.model.PrintLineStatementNode:forExpression(expr)
					do v:setSource(src) end
					do return v end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptPrintStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("print")
		if not (src ~= nil) then
			do return nil end
		end
		if not (self:peekNextCharacter() ~= 40) then
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
			local expr = self:acceptExpression(true)
			if not (self:acceptEndOfStatementToken() ~= nil) then
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
				local v = _g.sling.model.PrintStatementNode:forExpression(expr)
				do v:setSource(src) end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptReturnStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("return")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local isDeprecated = false
			if self:peekNextCharacter() == 40 then
				if not self.acceptDeprecatedConstructs then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				isDeprecated = true
			end
			do
				local expr = nil
				if not (self:acceptEndOfStatementToken() ~= nil) then
					if not ((function()
						expr = self:acceptExpression(true)
						do return expr end
					end)() ~= nil) then
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
						do return nil end
					end
					do self:parseEndOfStatementToken() end
				end
				if isDeprecated then
					do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated return syntax with parenthesis", src)) end
				end
				do
					local v = _g.sling.model.ReturnStatementNode:forExpression(expr)
					do v:setSource(src) end
					do return v end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptTryStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("try")
		if not (src ~= nil) then
			do return nil end
		end
		if not (self:peekToken2(58) or self:peekToken2(123)) then
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
			local v = _g.sling.model.TryCatchStatementNode._construct0(_g.sling.model.TryCatchStatementNode._create())
			do v:setSource(src) end
			do
				local tryBlock = self:parseControlStructureBlock()
				if tryBlock == nil then
					do self:onParseMessage(_g.sling.common.WarningMessage:forText("The `try' statement has no block.", src)) end
					tryBlock = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
				end
				do v:setTryBlock(tryBlock, false) end
				while true do
					if self:acceptToken1("catch") == nil then
						do break end
					end
					do
						local cb = _g.sling.model.CatchBlockNode._construct0(_g.sling.model.CatchBlockNode._create())
						do cb:setSource(self:getAcceptedToken()) end
						do
							local parens = self:acceptToken2(40)
							local variable = self:acceptParameterVariableDeclaration(false)
							if variable ~= nil then
								do cb:addToExceptions(variable) end
								if self:acceptToken2(44) ~= nil then
									while true do
										do cb:addToExceptions(self:parseParameterVariableDeclaration(false)) end
										if not (self:acceptToken2(44) ~= nil) then
											do break end
										end
									end
								end
							end
							if parens ~= nil then
								do self:parseToken2(41) end
							end
							if self:acceptToken1("when") ~= nil then
								do cb:setWhen(self:parseExpression(true), false) end
							end
							do cb:setBlock(self:parseControlStructureBlock(), false) end
							do v:addToCatchBlocks(cb) end
						end
					end
				end
				while true do
					if v:getFinallyBlock() == nil then
						local finally = self:acceptToken1("finally")
						if finally ~= nil then
							local fb = self:parseControlStructureBlock()
							if not (fb ~= nil) then
								do self:onParseMessage(_g.sling.common.WarningMessage:forText("The `finally' statement has no block.", finally)) end
								fb = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
							end
							do v:setFinallyBlock(fb, false) end
							goto _continue31
						end
					end
					if v:getElseBlock() == nil then
						local elset = self:acceptToken1("else")
						if elset ~= nil then
							local fb = self:parseControlStructureBlock()
							if not (fb ~= nil) then
								do self:onParseMessage(_g.sling.common.WarningMessage:forText("The `else' statement has no block.", elset)) end
								fb = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
							end
							do v:setElseBlock(fb, false) end
							goto _continue31
						end
					end
					do break end
					::_continue31::
				end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptThrowStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("throw")
		if not (src ~= nil) then
			do return nil end
		end
		if not (self:peekNextCharacter() ~= 40) then
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
			local expr = self:acceptExpression(true)
			if not (expr ~= nil) then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return nil end
			end
			do self:parseEndOfStatementToken() end
			do
				local v = _g.sling.model.ThrowStatementNode:forExpression(expr)
				do v:setSource(src) end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptCriticalSection()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("critical")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local ob = nil
			if self:acceptToken2(40) ~= nil then
				ob = self:acceptExpression(true)
				do self:parseToken2(41) end
			end
			if not (self:peekToken2(58) or self:peekToken2(123)) then
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
				local block = self:parseControlStructureBlock()
				if block == nil then
					do self:onParseMessage(_g.sling.common.WarningMessage:forText("The `critical' statement has no block. This doesn't make sense.", src)) end
				end
				if ob == nil then
					ob = _g.sling.model.CurrentObjectExpressionNode._construct0(_g.sling.model.CurrentObjectExpressionNode._create())
				end
				do
					local v = _g.sling.model.CriticalSectionBlockNode:instance(ob, block)
					do v:setSource(src) end
					do return v end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptEmptyStatement()
	local semi = self:acceptSemicolonToken()
	if semi ~= nil then
		do self:acceptNewlineToken() end
		do
			local v = _g.sling.model.EmptyStatementNode._construct0(_g.sling.model.EmptyStatementNode._create())
			do v:setSource(semi) end
			do return v end
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
			local nopt = self:acceptToken1("nop")
			if nopt ~= nil then
				while self:skipSpaceCharacter() do
				end
				do
					local v = _g.sling.model.EmptyStatementNode._construct0(_g.sling.model.EmptyStatementNode._create())
					do v:setSource(nopt) end
					do
						local comment = self:acceptImmediateSlashSlashCommentToken()
						if comment ~= nil then
							local str = comment:getValue()
							if str == nil then
								str = ""
							end
							do v:setComment(_g.sling.parser.SlingParserUtil:cleanComment(str)) end
						elseif not (self:acceptNewlineToken() ~= nil) then
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
			end
			do return nil end
		end
	end
end

function sling.parser.SlingParser:acceptLoopStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("loop")
		if not (src ~= nil) then
			do return nil end
		end
		if not (self:peekToken2(58) or self:peekToken2(123)) then
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
			local block = self:parseControlStructureBlock()
			local v = _g.sling.model.WhileStatementNode:instance(_g.sling.model.BooleanLiteralExpressionNode:forValue(true), block, nil)
			do v:setSource(src) end
			do return v end
		end
	end
end

function sling.parser.SlingParser:acceptSlonObject()
	local map = self:acceptSlonDynamicMap()
	if map ~= nil then
		do return map end
	end
	do
		local str = self:acceptStringLiteral()
		if str ~= nil then
			do return str end
		end
		do
			local blit = self:acceptBooleanLiteralExpression()
			if blit ~= nil then
				do return _g.jk.lang.Boolean:asObject(blit:getValue()) end
			end
			if self:acceptToken1("null") ~= nil then
				do return nil end
			end
			do return nil end
		end
	end
end

function sling.parser.SlingParser:parseSlonObject()
	if self:acceptToken1("null") ~= nil then
		do return nil end
	end
	do
		local v = self:acceptSlonObject()
		if not (v ~= nil) then
			do self:skipSpaces() end
			do self:updateStagingToken() end
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("SLON object"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
		end
		do return v end
	end
end

function sling.parser.SlingParser:acceptSlonVector()
	local src = self:acceptToken2(91)
	if not (src ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
		do self:parseNewlineToken() end
		while true do
			if self:acceptToken2(93) ~= nil then
				do break end
			end
			do
				local o = self:acceptSlonObject()
				if o ~= nil then
					do v:appendObject(o) end
					goto _continue32
				end
				do self:skipSpaces() end
				do self:updateStagingToken() end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`]' or identifier"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
			end
			::_continue32::
		end
		do self:parseEndOfStatementToken() end
		do return v end
	end
end

function sling.parser.SlingParser:acceptSlonDynamicMap()
	local src = self:acceptToken2(123)
	if not (src ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do self:parseNewlineToken() end
		while true do
			if self:acceptToken2(125) ~= nil then
				do break end
			end
			do
				local identifier = self:acceptIdentifier()
				if identifier ~= nil then
					do v:setObject(identifier, self:parseSlonObject()) end
					goto _continue33
				end
				do self:skipSpaces() end
				do self:updateStagingToken() end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`}' or identifier"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
			end
			::_continue33::
		end
		do self:parseEndOfStatementToken() end
		do return v end
	end
end

function sling.parser.SlingParser:acceptExternalImplementationReference()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("externalImplementation")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local data = self:acceptSlonDynamicMap()
			if not (data ~= nil) then
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
				local v = _g.sling.model.ExternalImplementationReferenceNode._construct0(_g.sling.model.ExternalImplementationReferenceNode._create())
				do v:setSource(src) end
				do v:setData(data) end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptStatement()
	local currentEntity = self:peekEntity()
	if currentEntity ~= nil then
		if _g.sling.util.ModifierUtil:hasAnnotationModifier(currentEntity, "webapi") or _g.sling.util.ModifierUtil:hasAnnotationModifier(currentEntity, "webapi2") then
			local stmt = self:acceptWebApiStatement()
			if stmt ~= nil then
				do return stmt end
			end
		end
	end
	do
		local templateStatement = self:acceptTemplateStatement()
		if templateStatement ~= nil then
			do return templateStatement end
		end
		do
			local ifdef = self:acceptIfdef(_g.sling.parser.SlingParser.NODECONTEXT_STATEMENTBLOCK)
			if ifdef ~= nil then
				do return ifdef end
			end
			do
				local ifndef = self:acceptIfndef(_g.sling.parser.SlingParser.NODECONTEXT_STATEMENTBLOCK)
				if ifndef ~= nil then
					do return ifndef end
				end
				do
					local emptyStatement = self:acceptEmptyStatement()
					if emptyStatement ~= nil then
						do return emptyStatement end
					end
					do
						local block = self:acceptBlock(true, nil)
						if block ~= nil then
							do return block end
						end
						do
							local criticalSection = self:acceptCriticalSection()
							if criticalSection ~= nil then
								do return criticalSection end
							end
							do
								local assertStatement = self:acceptAssertStatement()
								if assertStatement ~= nil then
									do return assertStatement end
								end
								do
									local ifStatement = self:acceptIfStatement()
									if ifStatement ~= nil then
										do return ifStatement end
									end
									do
										local switchStatement = self:acceptSwitchStatement()
										if switchStatement ~= nil then
											do return switchStatement end
										end
										do
											local whileStatement = self:acceptWhileStatement()
											if whileStatement ~= nil then
												do return whileStatement end
											end
											do
												local doStatement = self:acceptDoStatement()
												if doStatement ~= nil then
													do return doStatement end
												end
												do
													local forStatement = self:acceptForStatement()
													if forStatement ~= nil then
														do return forStatement end
													end
													do
														local breakStatement = self:acceptBreakStatement()
														if breakStatement ~= nil then
															do return breakStatement end
														end
														do
															local nested = self:acceptFunctionDeclarationStatement(nil)
															if nested ~= nil then
																do return nested end
															end
															do
																local continueStatement = self:acceptContinueStatement()
																if continueStatement ~= nil then
																	do return continueStatement end
																end
																do
																	local tryStatement = self:acceptTryStatement()
																	if tryStatement ~= nil then
																		do return tryStatement end
																	end
																	do
																		local throwStatement = self:acceptThrowStatement()
																		if throwStatement ~= nil then
																			do return throwStatement end
																		end
																		do
																			local error = self:acceptErrorStatement()
																			if error ~= nil then
																				do return error end
																			end
																			do
																				local trace = self:acceptTraceStatement()
																				if trace ~= nil then
																					do return trace end
																				end
																				do
																					local printLineStatement = self:acceptPrintLineStatement()
																					if printLineStatement ~= nil then
																						do return printLineStatement end
																					end
																					do
																						local printStatement = self:acceptPrintStatement()
																						if printStatement ~= nil then
																							do return printStatement end
																						end
																						do
																							local returnStatement = self:acceptReturnStatement()
																							if returnStatement ~= nil then
																								do return returnStatement end
																							end
																							do
																								local langDeclaration = self:acceptLangDeclaration(false, false)
																								if langDeclaration ~= nil then
																									do return langDeclaration end
																								end
																								do
																									local foreachStatement = self:acceptForeachStatement()
																									if foreachStatement ~= nil then
																										do return foreachStatement end
																									end
																									do
																										local loopStatement = self:acceptLoopStatement()
																										if loopStatement ~= nil then
																											do return loopStatement end
																										end
																										do
																											local vds = self:acceptVariableDeclarationStatement(nil)
																											if vds ~= nil then
																												do return vds end
																											end
																											do
																												local external = self:acceptExternalImplementationReference()
																												if external ~= nil then
																													do return external end
																												end
																												do
																													local xp = self:acceptExpression(true)
																													if xp ~= nil then
																														do self:parseEndOfStatementToken() end
																														do return xp end
																													end
																													do return nil end
																												end
																											end
																										end
																									end
																								end
																							end
																						end
																					end
																				end
																			end
																		end
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:parseStatement()
	local v = self:acceptStatement()
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("statement"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.SlingParser:acceptEntityBlockDeclaration()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local mods = nil
		while true do
			local mod = self:acceptCommonModifierId()
			if not (mod ~= nil) then
				do break end
			end
			if not (mods ~= nil) then
				mods = {}
			end
			do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(mod)) end
		end
		do
			local src = self:acceptToken2(123)
			if not (src ~= nil) then
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
				local v = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
				do v:setSource(src) end
				do v:setModifiers(mods, false) end
				do self:parseNewlineToken() end
				while true do
					local comment = self:acceptCommentWithNewlines()
					if comment ~= nil then
						do self:addDeclarationToContainer(v, comment) end
						goto _continue34
					end
					if self:skipUnnecessaryEmptyLines() > 0 then
						goto _continue34
					end
					if self:acceptToken2(125) ~= nil then
						do break end
					end
					do
						local vds = self:acceptDeclarationInEntity(false)
						if vds ~= nil then
							do self:addDeclarationToContainer(v, vds) end
							goto _continue34
						end
						do self:skipSpaces() end
						do self:updateStagingToken() end
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`}' or statement"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
					end
					::_continue34::
				end
				do self:parseNewlineToken() end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptBlock(endWithNewLine, meta)
	local src = self:acceptToken2(123)
	if not (src ~= nil) then
		do return nil end
	end
	do
		local v = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
		do v:setSource(src) end
		do
			local comment = self:acceptComment()
			if comment ~= nil then
				do v:addNode(comment) end
			end
			do self:parseNewlineToken() end
			while true do
				local comment = self:acceptCommentWithNewlines()
				if comment ~= nil then
					do self:addDeclarationToContainer(v, comment) end
					goto _continue35
				end
				if self:skipUnnecessaryEmptyLines() > 0 then
					goto _continue35
				end
				if self:acceptBlockMetaInformation(meta) then
					goto _continue35
				end
				if self:acceptToken2(125) ~= nil then
					do break end
				end
				do
					local stmt = self:acceptStatement()
					if stmt ~= nil then
						do self:addDeclarationToContainer(v, stmt) end
						goto _continue35
					end
					do self:skipSpaces() end
					do self:updateStagingToken() end
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`}' or statement"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
				end
				::_continue35::
			end
			if endWithNewLine then
				do self:parseNewlineToken() end
			end
			do return v end
		end
	end
end

function sling.parser.SlingParser:parseBlock(endWithNewLine, meta)
	local v = self:acceptBlock(endWithNewLine, meta)
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("block"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.SlingParser:acceptInclude(root, context)
	if not (root ~= nil) then
		do return false end
	end
	do
		local isEntity = (_vm:to_table_with_key(root, '_isType.sling.model.EntityDeclarationNode') ~= nil)
		if isEntity then
			do self:pushEntity(root) end
		end
		do
			local v = self:doAcceptInclude(root, context)
			if isEntity then
				do self:popEntity() end
			end
			do return v end
		end
	end
end

function sling.parser.SlingParser:doAcceptInclude(root, context)
	local src = self:acceptToken1("INCLUDE")
	if not (src ~= nil) then
		do return false end
	end
	do
		local parens = self:acceptToken2(40)
		local filename = self:parseStringLiteral()
		if _g.jk.lang.String:isEmpty(filename) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Empty filename", src, _g.jk.lang.StackTrace:generate()))
		end
		if parens ~= nil then
			do self:parseToken2(41) end
		end
		do self:parseEndOfStatementToken() end
		do
			local ff = self:getRelativeFile(filename)
			if ff == nil or ff:isFile() == false then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Specified file does not exist", src, _g.jk.lang.StackTrace:generate()))
			end
			do
				local parser = _g.sling.parser.SlingParser._construct0(_g.sling.parser.SlingParser._create())
				local bb = parser:parseFileInContext(ff, context)
				if not (bb ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed in processing the included file", src, _g.jk.lang.StackTrace:generate()))
				end
				do
					local array = bb:exportNodes()
					if array ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(array)
						do
							n = 0
							while n < m do
								local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
								if node ~= nil then
									do root:addNode(node) end
								end
								do n = n + 1 end
							end
						end
					end
					do
						local array2 = parser:getParseMessages()
						if array2 ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(array2)
							do
								n2 = 0
								while n2 < m2 do
									local message = array2[n2 + 1]
									if message ~= nil then
										do self:onParseMessage(message) end
									end
									do n2 = n2 + 1 end
								end
							end
						end
						do return true end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptTemplateStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("TEMPLATE")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local filename = self:acceptStringLiteral()
			if not (filename ~= nil) then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return nil end
			end
			if _g.jk.lang.String:isEmpty(filename) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Empty filename", src, _g.jk.lang.StackTrace:generate()))
			end
			do self:acceptToken2(44) end
			do
				local sym = self:parseSymbolNode(true)
				do self:parseEndOfStatementToken() end
				do
					local v = _g.sling.model.TemplateStatementNode._construct0(_g.sling.model.TemplateStatementNode._create())
					do v:setSource(src) end
					do v:setName(filename) end
					do v:setRelativeTo(self:getCurrentFile()) end
					do v:setSymbol(sym, false) end
					do return v end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptCommentWithNewlines()
	local icp = self:getImproperCommentPolicy()
	do self:setImproperCommentPolicy(_g.sling.common.LiveTokenizingParser.IMPROPER_COMMENT_NOOP) end
	do
		local v = self:doAcceptCommentWithNewlines()
		do self:setImproperCommentPolicy(icp) end
		do return v end
	end
end

function sling.parser.SlingParser:doAcceptCommentWithNewlines()
	local v = self:acceptComment()
	if v ~= nil then
		if not (self:acceptNewlineToken() ~= nil) then
			do self:onParseMessage(_g.sling.common.WarningMessage:forText("No newline after comment", self:getStagingToken())) end
		end
		do return v end
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
			local nls = nil
			while true do
				local v2 = self:acceptComment()
				if v2 ~= nil then
					if nls ~= nil then
						do _g.jk.lang.Vector:removeLast(nls) end
						if nls ~= nil then
							local n = 0
							local m = _g.jk.lang.Vector:getSize(nls)
							do
								n = 0
								while n < m do
									local nl = nls[n + 1]
									if nl ~= nil then
										do self:onUnnecessaryEmptyLine(nl) end
									end
									do n = n + 1 end
								end
							end
						end
					end
					do self:acceptNewlineToken() end
					do self:acceptNewlineToken() end
					do return v2 end
				end
				do
					local nl = self:acceptNewlineToken()
					if nl ~= nil then
						if nls == nil then
							nls = {}
						end
						do _g.jk.lang.Vector:append(nls, nl) end
						goto _continue36
					end
					do break end
				end
				::_continue36::
			end
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

function sling.parser.SlingParser:skipUnnecessaryEmptyLines()
	local v = 0
	while true do
		if self:acceptNewlineToken() ~= nil then
			do v = v + 1 end
		else
			do break end
		end
	end
	do return v end
end

function sling.parser.SlingParser:doAcceptIfdef(context, isIfndef)
	local token = "IFDEF"
	if isIfndef then
		token = "IFNDEF"
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
			local src = self:acceptToken1(token)
			if not (src ~= nil) then
				do return nil end
			end
			do
				local parens = false
				if self.acceptDeprecatedConstructs and self:acceptToken2(40) ~= nil then
					parens = true
				end
				do
					local value = self:acceptStringLiteral()
					if not (value ~= nil) then
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
						local xpr = _g.sling.model.PreprocessorIsDefinedExpressionNode:forVariable(value)
						if parens then
							do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated IFDEF syntax with parenthesis", src)) end
							do self:parseToken2(41) end
						end
						do self:acceptNewlineToken() end
						do
							local ifBlock = self:parseFlatBlockInContext(context, true)
							local elseBlock = nil
							local elseComment = nil
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
									elseComment = self:acceptCommentWithNewlines()
									do self:skipUnnecessaryEmptyLines() end
									if self:acceptToken1("ELSE") ~= nil then
										local ifdef = self:doAcceptIfdef(context, false)
										if ifdef ~= nil then
											elseBlock = _g.sling.model.FlatBlockNode._construct0(_g.sling.model.FlatBlockNode._create())
											do elseBlock:addNode(ifdef) end
										else
											local ifndef = self:doAcceptIfdef(context, true)
											if ifndef ~= nil then
												elseBlock = _g.sling.model.FlatBlockNode._construct0(_g.sling.model.FlatBlockNode._create())
												do elseBlock:addNode(ifndef) end
											else
												do self:acceptNewlineToken() end
												elseBlock = self:parseFlatBlockInContext(context, true)
											end
										end
									else
										self.currentTokenColumn = ctc
										self.currentTokenLine = ctl
										do self.iterator:setCurrentPosition(ctp) end
										while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
											do self.commentQueue:pop() end
										end
										self.previousToken = cpt
									end
								end
							end
							if isIfndef then
								xpr = _g.sling.model.LogicalNotExpressionNode:forExpression(xpr)
							end
							do
								local v = _g.sling.model.PreprocessorIfStatementNode:instance(xpr, ifBlock, elseBlock)
								do v:setSource(src) end
								do v:setElseBlockComment(elseComment, false) end
								do return v end
							end
						end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptIfdef(context)
	do return self:doAcceptIfdef(context, false) end
end

function sling.parser.SlingParser:acceptIfndef(context)
	do return self:doAcceptIfdef(context, true) end
end

function sling.parser.SlingParser:getExistingChildNamespace(root, name)
	if not (root ~= nil) then
		do return nil end
	end
	if not (name ~= nil) then
		do return nil end
	end
	do
		local idx = root:getNodeIndexForName(name)
		if not (idx ~= nil) then
			do return nil end
		end
		if idx ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(idx)
			do
				n = 0
				while n < m do
					local node = _vm:to_table_with_key(idx[n + 1], '_isType.sling.model.NamespaceNode')
					if node ~= nil then
						do return node end
					end
					do n = n + 1 end
				end
			end
		end
		do return nil end
	end
end

function sling.parser.SlingParser:getCreateNamespace(root, nss)
	local v = root
	if nss ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(nss)
		do
			n = 0
			while n < m do
				local ns = (function(o)
					if (_vm:get_variable_type(o) == 'string') then
						do return o end
					end
					do return nil end
				end)(nss[n + 1])
				if ns ~= nil then
					local x = self:getExistingChildNamespace(v, ns)
					if x ~= nil then
						v = x
						goto _continue37
					end
					do
						local nsn = _g.sling.model.NamespaceNode:forName(ns)
						do v:addNode(nsn) end
						v = nsn
					end
				end
				::_continue37::
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function sling.parser.SlingParser:applyImportsToDeclaration(dec, addImports)
	if not (dec ~= nil and addImports ~= nil) then
		do return end
	end
	if (_vm:to_table_with_key(dec, '_isType.sling.model.EntityDeclarationNode') ~= nil) then
		local ee = dec
		if addImports ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(addImports)
			do
				n = 0
				while n < m do
					local node = _vm:to_table_with_key(addImports[n + 1], '_isType.sling.common.NodeObject')
					if node ~= nil then
						local ndup = _g.sling.util.NodeUtil:dupAsNode(node)
						if (_vm:to_table_with_key(ndup, '_isType.sling.model.SymbolNode') ~= nil) then
							do ee:addToImportNamespaces(_vm:to_table_with_key(ndup, '_isType.sling.model.SymbolNode')) end
						elseif (_vm:to_table_with_key(ndup, '_isType.sling.model.ImportPackageStatementNode') ~= nil) then
							do ee:addToImportNamespaces(ndup:getPackage()) end
						elseif (_vm:to_table_with_key(ndup, '_isType.sling.model.ImportStaticMemberStatementNode') ~= nil) then
							do ee:addToImportStaticNamespaces(ndup) end
						elseif (_vm:to_table_with_key(ndup, '_isType.sling.model.ImportEntityStatementNode') ~= nil) then
							do ee:addToImportEntities(ndup) end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do return end
	end
	if (_vm:to_table_with_key(dec, '_isType.sling.model.PreprocessorIfStatementNode') ~= nil) then
		local ib = dec:getIfBlock()
		if ib ~= nil then
			local array = ib:getNodes()
			if array ~= nil then
				local n2 = 0
				local m2 = _g.jk.lang.Vector:getSize(array)
				do
					n2 = 0
					while n2 < m2 do
						local ibn = _vm:to_table_with_key(array[n2 + 1], '_isType.sling.common.NodeObject')
						if ibn ~= nil then
							do self:applyImportsToDeclaration(ibn, addImports) end
						end
						do n2 = n2 + 1 end
					end
				end
			end
		end
		do
			local eb = dec:getElseBlock()
			if eb ~= nil then
				local array2 = eb:getNodes()
				if array2 ~= nil then
					local n3 = 0
					local m3 = _g.jk.lang.Vector:getSize(array2)
					do
						n3 = 0
						while n3 < m3 do
							local ebn = _vm:to_table_with_key(array2[n3 + 1], '_isType.sling.common.NodeObject')
							if ebn ~= nil then
								do self:applyImportsToDeclaration(ebn, addImports) end
							end
							do n3 = n3 + 1 end
						end
					end
				end
			end
			do return end
		end
	end
end

function sling.parser.SlingParser:acceptImportStatement()
	local src = self:acceptToken1("import")
	if not (src ~= nil) then
		do return nil end
	end
	if self:acceptToken1("static") ~= nil then
		local allMembers = false
		local symbol = _g.sling.model.SymbolNode._construct0(_g.sling.model.SymbolNode._create())
		do symbol:addNameToComponents(self:parseIdentifier()) end
		do symbol:setSource(self:getAcceptedToken()) end
		while true do
			if not (self:acceptToken2(46) ~= nil) then
				do break end
			end
			if self:acceptToken2(42) ~= nil then
				allMembers = true
				do break end
			end
			do
				local id = self:acceptIdentifier()
				if id ~= nil then
					do symbol:addNameToComponents(id) end
					goto _continue38
				end
				do self:skipSpaces() end
				do self:updateStagingToken() end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("identifier or `*'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
			end
			::_continue38::
		end
		do
			local container = nil
			if self:acceptToken1("from") ~= nil then
				container = self:parseSymbolNode(true)
			end
			do self:parseNewlineToken() end
			do
				local v = _g.sling.model.ImportStaticMemberStatementNode._construct0(_g.sling.model.ImportStaticMemberStatementNode._create())
				do v:setMember(symbol, false) end
				do v:setContainer(container, false) end
				do v:setAllMembers(allMembers) end
				do v:setSource(src) end
				do return v end
			end
		end
	end
	do
		local symbol = self:parseSymbolNode(true)
		local name = nil
		if self:acceptToken1("as") ~= nil then
			name = self:parseIdentifier()
		end
		do self:parseNewlineToken() end
		do
			local imp = _g.sling.model.ImportPackageStatementNode._construct0(_g.sling.model.ImportPackageStatementNode._create())
			do imp:setSource(src) end
			do imp:setPackage(symbol, false) end
			do imp:setLocalName(name) end
			do return imp end
		end
	end
end

function sling.parser.SlingParser:acceptUseStatement()
	local src = self:acceptToken1("use")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local allMembers = false
		local symbol = _g.sling.model.SymbolNode._construct0(_g.sling.model.SymbolNode._create())
		do symbol:addNameToComponents(self:parseIdentifier()) end
		while true do
			if not (self:acceptToken2(46) ~= nil) then
				do break end
			end
			if self:acceptToken2(42) ~= nil then
				allMembers = true
				do break end
			end
			do
				local id = self:acceptIdentifier()
				if id ~= nil then
					do symbol:addNameToComponents(id) end
					goto _continue39
				end
				do self:skipSpaces() end
				do self:updateStagingToken() end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("identifier or `*'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
			end
			::_continue39::
		end
		do
			local container = nil
			if self:acceptToken1("from") ~= nil then
				container = self:parseSymbolNode(true)
			end
			do
				local imp = _g.sling.model.ImportEntityStatementNode._construct0(_g.sling.model.ImportEntityStatementNode._create())
				do imp:setSource(src) end
				do imp:setContainer(container, false) end
				do imp:setEntity(symbol, false) end
				do imp:setAllMembers(allMembers) end
				do return imp end
			end
		end
	end
end

function sling.parser.SlingParser:acceptDeclarationInFile(nss)
	local istmt = self:acceptImportStatement()
	if istmt ~= nil then
		do return istmt end
	end
	do
		local ustmt = self:acceptUseStatement()
		if ustmt ~= nil then
			do return ustmt end
		end
		do
			local fmd = self:acceptDeclarationInFileMode()
			if fmd ~= nil then
				do return fmd end
			end
			do
				local decl = self:acceptDeclarationInNamespace(nss)
				if decl ~= nil then
					do return decl end
				end
				do return nil end
			end
		end
	end
end

function sling.parser.SlingParser:parseFlatBlockInContext(context, requireBraces)
	local v = _g.sling.model.FlatBlockNode._construct0(_g.sling.model.FlatBlockNode._create())
	if requireBraces then
		do self:parseToken2(123) end
		do
			local comment = self:acceptComment()
			if comment ~= nil then
				do v:addNode(comment) end
			end
			do self:parseNewlineToken() end
		end
	end
	do
		local myImports = nil
		while true do
			local comment = self:acceptCommentWithNewlines()
			if comment ~= nil then
				do self:addDeclarationToContainer(v, comment) end
				goto _continue40
			end
			if requireBraces then
				if self:acceptToken2(125) ~= nil then
					if not (self:acceptEOF() ~= nil) then
						do self:parseNewlineToken() end
					end
					do break end
				end
			elseif self:acceptEOF() ~= nil then
				do break end
			end
			if self:skipUnnecessaryEmptyLines() > 0 then
				goto _continue40
			end
			if self:acceptInclude(v, context) then
				goto _continue40
			end
			if context == _g.sling.parser.SlingParser.NODECONTEXT_FILE then
				local nss = {}
				local decl = self:acceptDeclarationInFile(nss)
				if decl ~= nil then
					if _g.jk.lang.Vector:getSize(nss) > 0 then
						do self:addDeclarationToContainer(self:getCreateNamespace(v, nss), decl) end
					else
						do self:addDeclarationToContainer(v, decl) end
					end
					goto _continue40
				end
			elseif context == _g.sling.parser.SlingParser.NODECONTEXT_NAMESPACE then
				local nss = {}
				local decl = self:acceptDeclarationInNamespace(nss)
				if decl ~= nil then
					if _g.jk.lang.Vector:getSize(nss) > 0 then
						do self:addDeclarationToContainer(self:getCreateNamespace(v, nss), decl) end
					else
						do self:addDeclarationToContainer(v, decl) end
					end
					goto _continue40
				end
			elseif context == _g.sling.parser.SlingParser.NODECONTEXT_ENTITY then
				local decl = self:acceptDeclarationInEntity(true)
				if decl ~= nil then
					do self:addDeclarationToContainer(v, decl) end
					goto _continue40
				end
			elseif context == _g.sling.parser.SlingParser.NODECONTEXT_STATEMENTBLOCK then
				local stmt = self:acceptStatement()
				if stmt ~= nil then
					do self:addDeclarationToContainer(v, stmt) end
					goto _continue40
				end
			else
				do self:skipSpaces() end
				do self:updateStagingToken() end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unknown node context: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(context)) .. "'", self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
			end
			do self:skipSpaces() end
			do self:updateStagingToken() end
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("declaration or statement"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
			::_continue40::
		end
		do return v end
	end
end

function sling.parser.SlingParser:isFixme(comment)
	if not (comment ~= nil) then
		do return false end
	end
	do
		local text = comment:getText()
		if not (text ~= nil) then
			do return false end
		end
		do
			local tt = _g.jk.lang.String:strip(text)
			if _g.jk.lang.String:startsWith(tt, "FIXME", 0) or _g.jk.lang.String:startsWith(tt, "TODO", 0) or _g.jk.lang.String:startsWith(tt, "FIX ME", 0) then
				do return true end
			end
			do return false end
		end
	end
end

function sling.parser.SlingParser:acceptImmediateCommentToken()
	local ss = self:acceptImmediateSlashSlashCommentToken()
	if ss ~= nil then
		do return ss end
	end
	do
		local sa = self:acceptImmediateSlashAsteriskCommentToken()
		if sa ~= nil then
			do return sa end
		end
		do return nil end
	end
end

function sling.parser.SlingParser:acceptComment()
	local comment = self:acceptCommentToken()
	if not (comment ~= nil) then
		do return nil end
	end
	do
		local str = comment:getValue()
		if str == nil then
			str = ""
		end
		do
			local text = _g.sling.parser.SlingParserUtil:cleanComment(str)
			local nn = _g.sling.model.CommentNode:forText(text, false)
			if _g.jk.lang.String:getIndexOfCharacter(str, 10, 0) >= 0 then
				do nn:setSubstantial(true) end
			end
			do nn:setSource(comment) end
			if self:isFixme(nn) then
				if self.showFixmeWarnings then
					do self:onParseMessage(_g.sling.common.WarningMessage:forText("Code needs fixing", nn)) end
				end
			end
			do return nn end
		end
	end
end

function sling.parser.SlingParser:preprocessIdentifier(t)
	if not (t ~= nil) then
		do return nil end
	end
	if _g.jk.lang.String:getChar(t, 0) == 64 then
		do return _g.jk.lang.String:getEndOfString(t, 1) end
	end
	do return t end
end

function sling.parser.SlingParser:acceptBuiltinDataType()
	if self:acceptToken1("typeinfo") ~= nil then
		local src = self:getAcceptedToken()
		local v = _g.sling.model.TypeInfoDataTypeNode._construct0(_g.sling.model.TypeInfoDataTypeNode._create())
		do v:setSource(src) end
		do return v end
	end
	if self:acceptToken1("array") ~= nil then
		local src = self:getAcceptedToken()
		local dt = nil
		local sz = nil
		local basetypes = nil
		if self:acceptToken2(60) ~= nil then
			dt = self:parseDataType(true)
			if self:acceptToken2(91) ~= nil then
				sz = self:parseExpression(true)
				do self:parseToken2(93) end
			end
			if self:acceptToken2(58) ~= nil then
				local base = nil
				if not (basetypes ~= nil) then
					basetypes = {}
				end
				while true do
					do _g.jk.lang.Vector:append(basetypes, self:parseDataType(true)) end
					if not (self:acceptToken2(44) ~= nil) then
						do break end
					end
				end
			end
			do self:parseToken2(62) end
		end
		if dt == nil then
			dt = _g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create())
		end
		if basetypes ~= nil and _g.jk.lang.Vector:getSize(basetypes) > 0 then
			local cd = _g.sling.model.ConstrainedDataTypeNode:forPrimaryType(dt)
			if basetypes ~= nil then
				local n2 = 0
				local m = _g.jk.lang.Vector:getSize(basetypes)
				do
					n2 = 0
					while n2 < m do
						local node = _vm:to_table_with_key(basetypes[n2 + 1], '_isType.sling.common.DataTypeNode')
						if node ~= nil then
							do cd:addToBaseTypes(node) end
						end
						do n2 = n2 + 1 end
					end
				end
			end
			dt = cd
		end
		do
			local v = _g.sling.model.StaticArrayDataTypeNode:forPrimaryType(dt, nil)
			do v:setSource(src) end
			do v:setSize(sz, false) end
			do return v end
		end
	end
	if self:acceptToken1("vector") ~= nil then
		local src = self:getAcceptedToken()
		local dt = nil
		if self:acceptToken2(60) ~= nil then
			if not ((function()
				dt = self:parseDataType(true)
				do return dt end
			end)() ~= nil) then
				do return nil end
			end
			do self:parseToken2(62) end
		end
		if dt == nil then
			dt = _g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create())
		end
		do
			local v = _g.sling.model.VectorDataTypeNode:forPrimaryType(dt)
			do v:setSource(src) end
			do return v end
		end
	end
	if self:acceptToken1("ref") ~= nil then
		local src = self:getAcceptedToken()
		local dt = nil
		if self:acceptToken2(60) ~= nil then
			if not ((function()
				dt = self:parseDataType(true)
				do return dt end
			end)() ~= nil) then
				do return nil end
			end
			do self:parseToken2(62) end
		end
		if dt == nil then
			dt = _g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create())
		end
		do
			local v = _g.sling.model.VariableReferenceDataTypeNode:forPrimaryType(dt)
			do v:setSource(src) end
			do return v end
		end
	end
	if self:acceptToken1("ptr") ~= nil then
		local src = self:getAcceptedToken()
		local dt = nil
		if self:acceptToken2(60) ~= nil then
			if not ((function()
				dt = self:parseDataType(true)
				do return dt end
			end)() ~= nil) then
				do return nil end
			end
			do self:parseToken2(62) end
		end
		if dt == nil then
			dt = _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_UINT8)
		end
		do
			local v = _g.sling.model.PointerDataTypeNode:forPrimaryType(dt)
			do v:setSource(src) end
			do return v end
		end
	end
	if self:acceptToken1("map") ~= nil then
		local src = self:getAcceptedToken()
		local keytype = nil
		local valtype = nil
		if self:acceptToken2(60) ~= nil then
			keytype = self:parseDataType(true)
			do self:parseToken2(44) end
			valtype = self:parseDataType(true)
			do self:parseToken2(62) end
		end
		if keytype == nil then
			keytype = _g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create())
		end
		if valtype == nil then
			valtype = _g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create())
		end
		do
			local v = _g.sling.model.MapDataTypeNode:forTypes(keytype, valtype)
			do v:setSource(src) end
			do return v end
		end
	end
	if self:acceptToken1("set") ~= nil then
		local src = self:getAcceptedToken()
		local valtype = nil
		if self:acceptToken2(60) ~= nil then
			valtype = self:parseDataType(true)
			do self:parseToken2(62) end
		end
		if valtype == nil then
			valtype = _g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create())
		end
		do
			local v = _g.sling.model.SetDataTypeNode:forPrimaryType(valtype)
			do v:setSource(src) end
			do return v end
		end
	end
	if self:acceptToken1("promise") ~= nil then
		local src = self:getAcceptedToken()
		local valtype = nil
		if self:acceptToken2(60) ~= nil then
			valtype = self:parseDataType(true)
			do self:parseToken2(62) end
		end
		if valtype == nil then
			valtype = _g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create())
		end
		do
			local v = _g.sling.model.PromiseDataTypeNode:forPrimaryType(valtype)
			do v:setSource(src) end
			do return v end
		end
	end
	if self:acceptToken1("function") ~= nil then
		local src = self:getAcceptedToken()
		local vdecl = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
		if self:acceptToken2(60) ~= nil then
			local rt = self:parseDataType(true)
			do vdecl:setReturnType(rt, false) end
			do
				local n = 1
				while true do
					if self:acceptToken2(44) == nil then
						do break end
					end
					do
						local dt = self:parseDataType(true)
						do vdecl:addToParameters(_g.sling.model.VariableDeclarationNode:instance(dt, "p" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger((function() local v = n n = n + 1 return v end)())), nil)) end
					end
				end
				do self:parseToken2(62) end
			end
		else
			do vdecl:setReturnType(_g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()), false) end
		end
		do
			local v = _g.sling.model.FunctionDataTypeNode._construct0(_g.sling.model.FunctionDataTypeNode._create())
			do v:setDeclaration(vdecl, false) end
			do v:setSource(src) end
			do return v end
		end
	end
	if self:acceptToken1("this") ~= nil then
		do return _g.sling.model.ThisDataTypeNode._construct0(_g.sling.model.ThisDataTypeNode._create()) end
	end
	if self:acceptToken1("parent") ~= nil then
		do return _g.sling.model.ParentDataTypeNode._construct0(_g.sling.model.ParentDataTypeNode._create()) end
	end
	if self:acceptToken1("object") ~= nil then
		do return _g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create()) end
	end
	if self:acceptToken1("buffer") ~= nil then
		do return _g.sling.model.BufferDataTypeNode._construct0(_g.sling.model.BufferDataTypeNode._create()) end
	end
	if self:acceptToken1("dynamic") ~= nil then
		do return _g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create()) end
	end
	if self:acceptToken1("auto") ~= nil then
		do return _g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create()) end
	end
	if self:acceptToken1("char") ~= nil then
		do return _g.sling.model.CharacterDataTypeNode._construct0(_g.sling.model.CharacterDataTypeNode._create()) end
	end
	if self:acceptToken1("int") ~= nil then
		do return _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_INT) end
	end
	if self:acceptToken1("uint") ~= nil then
		do return _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_UINT) end
	end
	if self:acceptToken1("short") ~= nil then
		do return _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_SHORT) end
	end
	if self:acceptToken1("ushort") ~= nil then
		do return _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_USHORT) end
	end
	if self:acceptToken1("long") ~= nil then
		do return _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_LONG) end
	end
	if self:acceptToken1("ulong") ~= nil then
		do return _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_ULONG) end
	end
	if self:acceptToken1("int8") ~= nil then
		do return _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_INT8) end
	end
	if self:acceptToken1("uint8") ~= nil then
		do return _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_UINT8) end
	end
	if self:acceptToken1("int16") ~= nil then
		do return _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_INT16) end
	end
	if self:acceptToken1("uint16") ~= nil then
		do return _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_UINT16) end
	end
	if self:acceptToken1("int32") ~= nil then
		do return _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_INT32) end
	end
	if self:acceptToken1("uint32") ~= nil then
		do return _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_UINT32) end
	end
	if self:acceptToken1("int64") ~= nil then
		do return _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_INT64) end
	end
	if self:acceptToken1("uint64") ~= nil then
		do return _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_UINT64) end
	end
	if self:acceptToken1("double") ~= nil then
		do return _g.sling.model.DoubleDataTypeNode._construct0(_g.sling.model.DoubleDataTypeNode._create()) end
	end
	if self:acceptToken1("float") ~= nil then
		do return _g.sling.model.FloatDataTypeNode._construct0(_g.sling.model.FloatDataTypeNode._create()) end
	end
	if self:acceptToken1("void") ~= nil then
		do return _g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()) end
	end
	if self:acceptToken1("bool") ~= nil or self:acceptToken1("boolean") ~= nil then
		do return _g.sling.model.BooleanDataTypeNode._construct0(_g.sling.model.BooleanDataTypeNode._create()) end
	end
	if self:acceptToken1("string") ~= nil then
		do return _g.sling.model.StringDataTypeNode._construct0(_g.sling.model.StringDataTypeNode._create()) end
	end
	if self:acceptToken1("tuple") ~= nil then
		do return _g.sling.model.TupleDataTypeNode._construct0(_g.sling.model.TupleDataTypeNode._create()) end
	end
	if self:acceptToken1("unknown") ~= nil then
		do return _g.sling.model.UnknownDataTypeNode._construct0(_g.sling.model.UnknownDataTypeNode._create()) end
	end
	if self:acceptToken1("datetime") ~= nil then
		do return _g.sling.model.DateTimeDataTypeNode._construct0(_g.sling.model.DateTimeDataTypeNode._create()) end
	end
	if self:acceptToken1("decimal") ~= nil then
		do return _g.sling.model.DecimalDataTypeNode._construct0(_g.sling.model.DecimalDataTypeNode._create()) end
	end
	if self:acceptToken1("exception") ~= nil then
		do return _g.sling.model.ExceptionDataTypeNode._construct0(_g.sling.model.ExceptionDataTypeNode._create()) end
	end
	if self:acceptToken1("stylesheet") ~= nil then
		local v = _g.sling.model.StyleSheetDataTypeNode._construct0(_g.sling.model.StyleSheetDataTypeNode._create())
		do v:setSource(self:getAcceptedToken()) end
		do return v end
	end
	if self:acceptToken1("tree") ~= nil then
		local v = _g.sling.model.TreeDataTypeNode._construct0(_g.sling.model.TreeDataTypeNode._create())
		do v:setSource(self:getAcceptedToken()) end
		do return v end
	end
	do return nil end
end

function sling.parser.SlingParser:parseDataType(allowArray)
	local v = self:acceptDataType(allowArray)
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("data type"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.SlingParser:parseReferenceDataType()
	local v = self:acceptReferenceDatatype()
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("reference data type"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.SlingParser:acceptReferenceDatatype()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local v = self:acceptDataType(false)
		if not (v ~= nil) then
			do return nil end
		end
		if (_vm:to_table_with_key(v, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) == false then
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

function sling.parser.SlingParser:acceptDataType(allowArray)
	local v = self:acceptPrimaryDatatype()
	if not (v ~= nil) then
		do return nil end
	end
	do
		local src = v:getSource()
		if self:peekNextCharacter() == 63 then
			do self:getNextCharacter() end
			v = _g.sling.model.OptionalDataTypeNode:forPrimaryType(v)
			do v:setSource(src) end
		end
		if allowArray then
			while self:peekNextCharacter() == 91 do
				do self:getNextCharacter() end
				do
					local dims = 1
					while self:acceptToken2(44) ~= nil do
						do dims = dims + 1 end
					end
					do self:parseToken2(93) end
					if dims > 1 then
						v = _g.sling.model.MultiDimensionalArrayDataTypeNode:forDimensions(v, dims)
					else
						v = _g.sling.model.StaticArrayDataTypeNode:forPrimaryType(v, nil)
					end
					do v:setSource(src) end
				end
			end
		end
		do return v end
	end
end

function sling.parser.SlingParser:acceptPrimaryDatatype()
	if self.acceptDeprecatedConstructs then
		if self:acceptToken1("TYPEOF") ~= nil then
			local src = self:getAcceptedToken()
			local parens = self:acceptToken2(40)
			local xpr = self:parseExpression(true)
			if parens ~= nil then
				do self:parseToken2(41) end
			end
			do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", src)) end
			do
				local v = _g.sling.model.ExpressionDataTypeNode._construct0(_g.sling.model.ExpressionDataTypeNode._create())
				do v:setSource(src) end
				do v:setExpression(xpr, false) end
				do return v end
			end
		end
		if self:acceptToken1("xprtype") ~= nil then
			local src = self:getAcceptedToken()
			do self:parseToken2(40) end
			do
				local xpr = self:parseExpression(true)
				do self:parseToken2(41) end
				do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", src)) end
				do
					local v = _g.sling.model.ExpressionDataTypeNode._construct0(_g.sling.model.ExpressionDataTypeNode._create())
					do v:setSource(src) end
					do v:setExpression(xpr, false) end
					do return v end
				end
			end
		end
	end
	if self:acceptToken1("typeof") ~= nil then
		local src = self:getAcceptedToken()
		do self:parseToken2(40) end
		do
			local xpr = self:parseExpression(true)
			do self:parseToken2(41) end
			do
				local v = _g.sling.model.ExpressionDataTypeNode._construct0(_g.sling.model.ExpressionDataTypeNode._create())
				do v:setSource(src) end
				do v:setExpression(xpr, false) end
				do return v end
			end
		end
	end
	do
		local btt = self:acceptBuiltinDataType()
		if btt ~= nil then
			if btt:getSource() == nil then
				do btt:setSource(self:getAcceptedToken()) end
			end
			do return btt end
		end
		do
			local magical = false
			local symbol = nil
			if self:acceptToken1("magical") ~= nil then
				magical = true
				do self:parseToken2(60) end
				symbol = self:parseMagicalDataTypeSymbol()
				do symbol:setMagical(true) end
				do self:parseToken2(62) end
			elseif self:acceptToken2(33) ~= nil then
				magical = true
				symbol = self:parseMagicalDataTypeSymbol()
				do symbol:setMagical(true) end
			else
				symbol = self:acceptSymbolNode(true)
				if symbol ~= nil then
					local names = _g.sling.util.SymbolUtil:getSymbolComponents(symbol)
					if names ~= nil and self.isMacro == false and self.isGenericTypeParameter == false then
						local fname = _g.jk.lang.String:forObject(_g.jk.lang.Vector:get(names, 0))
						if fname ~= nil and fname == self.currentEntityName then
							do self:onParseMessage(_g.sling.common.WarningMessage:forText("Data type reference to the current class was encountered. Should use `this' instead.", symbol)) end
						end
					end
				end
			end
			if symbol ~= nil then
				local v = _g.sling.model.ReferenceDataTypeNode:forSymbol(symbol)
				do v:setSource(symbol:getSource()) end
				do v:setMagical(magical) end
				do return v end
			end
			do return nil end
		end
	end
end

function sling.parser.SlingParser:parseMagicalDataTypeSymbol()
	local v = self:acceptMagicalDataTypeSymbol()
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("magical symbol reference"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.SlingParser:acceptMagicalDataTypeSymbol()
	local v = self:acceptSymbolNode(true)
	if v ~= nil then
		do return v end
	end
	do
		local dqt = self:acceptDoubleQuotedStringToken(92, false)
		if dqt ~= nil then
			local v = _g.sling.model.SymbolNode:forName(_g.sling.common.CodeStringUtil:unescapeStringLiteralCStyle(dqt.value, true))
			do v:setSource(dqt) end
			do return v end
		end
		do return nil end
	end
end

function sling.parser.SlingParser:acceptModifierKeyword(keyword)
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		do self:acceptNewlineToken() end
		if self:acceptToken1(keyword) ~= nil then
			do return true end
		end
		self.currentTokenColumn = ctc
		self.currentTokenLine = ctl
		do self.iterator:setCurrentPosition(ctp) end
		while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
			do self.commentQueue:pop() end
		end
		self.previousToken = cpt
		do return false end
	end
end

function sling.parser.SlingParser:acceptCommonModifierId()
	if self:acceptModifierKeyword("public") then
		do return _g.sling.model.Modifier.PUBLIC end
	end
	if self:acceptModifierKeyword("private") then
		do return _g.sling.model.Modifier.PRIVATE end
	end
	if self:acceptModifierKeyword("protected") then
		do return _g.sling.model.Modifier.PROTECTED end
	end
	if self:acceptModifierKeyword("nsprivate") then
		do return _g.sling.model.Modifier.NAMESPACEPRIVATE end
	end
	if self:acceptModifierKeyword("static") then
		do return _g.sling.model.Modifier.STATIC end
	end
	if self:acceptModifierKeyword("abstract") then
		do return _g.sling.model.Modifier.ABSTRACT end
	end
	if self:acceptModifierKeyword("extern") then
		do return _g.sling.model.Modifier.EXTERNAL end
	end
	if self:acceptModifierKeyword("implement") then
		do return _g.sling.model.Modifier.IMPLEMENT end
	end
	if self:acceptModifierKeyword("override") then
		do return _g.sling.model.Modifier.OVERRIDE end
	end
	if self:acceptModifierKeyword("virtual") then
		do return _g.sling.model.Modifier.VIRTUAL end
	end
	if self:acceptModifierKeyword("fundamental") then
		do return _g.sling.model.Modifier.FUNDAMENTAL end
	end
	if self:acceptModifierKeyword("partial") then
		do return _g.sling.model.Modifier.PARTIAL end
	end
	if self:acceptModifierKeyword("const") then
		do return _g.sling.model.Modifier.CONSTANT end
	end
	if self:acceptModifierKeyword("new") then
		do return _g.sling.model.Modifier.NEW end
	end
	if self:acceptModifierKeyword("stub") then
		do return _g.sling.model.Modifier.STUB end
	end
	if self:acceptModifierKeyword("weak") then
		do return _g.sling.model.Modifier.WEAK end
	end
	if self:acceptModifierKeyword("final") then
		do return _g.sling.model.Modifier.FINAL end
	end
	if self:acceptModifierKeyword("global") then
		do return _g.sling.model.Modifier.GLOBAL end
	end
	if self:acceptModifierKeyword("header") then
		do return _g.sling.model.Modifier.HEADER end
	end
	if self:acceptModifierKeyword("property") then
		do return _g.sling.model.Modifier.PROPERTY end
	end
	if self:acceptModifierKeyword("readonly") then
		do return _g.sling.model.Modifier.READONLY end
	end
	if self:acceptModifierKeyword("writeonly") then
		do return _g.sling.model.Modifier.WRITEONLY end
	end
	if self:acceptModifierKeyword("readwrite") then
		do return _g.sling.model.Modifier.READWRITE end
	end
	if self:acceptModifierKeyword("volatile") then
		do return _g.sling.model.Modifier.VOLATILE end
	end
	if self:acceptModifierKeyword("throwable") then
		do return _g.sling.model.Modifier.THROWABLE end
	end
	if self:acceptModifierKeyword("transient") then
		do return _g.sling.model.Modifier.TRANSIENT end
	end
	if self:acceptModifierKeyword("deprecated") then
		do return _g.sling.model.Modifier.DEPRECATED end
	end
	if self:acceptModifierKeyword("async") then
		do return _g.sling.model.Modifier.ASYNCHRONOUS end
	end
	if self:acceptModifierKeyword("synchronized") then
		do return _g.sling.model.Modifier.SYNCHRONIZED end
	end
	if self:acceptModifierKeyword("implementation") then
		do return _g.sling.model.Modifier.IMPLEMENTATION end
	end
	if self:acceptModifierKeyword("reference") then
		do return _g.sling.model.Modifier.REFERENCE end
	end
	do return nil end
end

function sling.parser.SlingParser:acceptCommonModifier()
	local id = self:acceptCommonModifierId()
	if not (id ~= nil) then
		do return nil end
	end
	do
		local v = _g.sling.model.CommonModifierNode:forType(id)
		do v:setSource(self:getAcceptedToken()) end
		do return v end
	end
end

function sling.parser.SlingParser:acceptCommonModifiers()
	local v = nil
	local visibility = false
	while true do
		local mod = self:acceptCommonModifier()
		if mod ~= nil then
			if not (v ~= nil) then
				v = {}
			end
			do _g.jk.lang.Vector:append(v, mod) end
			if _g.sling.model.Modifier:isVisibilityModifier(mod:getType()) then
				if visibility then
					do self:onParseMessage(_g.sling.common.WarningMessage:forText("Multiple visibility modifiers encountered.", mod:getSource())) end
				else
					visibility = true
				end
			end
		else
			do break end
		end
	end
	do return v end
end

function sling.parser.SlingParser:acceptEntityDetails(mods, basetypes, imports, uses, depends)
	local visibility = false
	while true do
		if self:acceptModifierKeyword("is") then
			local src = self:getAcceptedToken()
			if not (basetypes ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Base types are not supported in this context", src, _g.jk.lang.StackTrace:generate()))
			end
			while true do
				local sym = self:parseReferenceDataType()
				local btn = _g.sling.model.BaseTypeNode:forType(sym, _g.sling.model.BaseTypeNode.INHERIT_AUTO)
				do btn:setSource(src) end
				do _g.jk.lang.Vector:append(basetypes, btn) end
				if not (self:acceptToken2(44) ~= nil) then
					do break end
				end
			end
		elseif self.acceptDeprecatedConstructs and self:acceptModifierKeyword("imports") then
			do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", self:getAcceptedToken())) end
			if not (imports ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("`imports' is not supported in this context", self:getAcceptedToken(), _g.jk.lang.StackTrace:generate()))
			end
			while true do
				do _g.jk.lang.Vector:append(imports, self:parseSymbolNode(true)) end
				if not (self:acceptToken2(44) ~= nil) then
					do break end
				end
			end
		elseif self.acceptDeprecatedConstructs and self:acceptModifierKeyword("uses") then
			do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", self:getAcceptedToken())) end
			if not (uses ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("`uses' is not supported in this context", self:getAcceptedToken(), _g.jk.lang.StackTrace:generate()))
			end
			while true do
				local sym = self:parseSymbolNode(true)
				do _g.jk.lang.Vector:append(uses, sym) end
				if not (self:acceptToken2(44) ~= nil) then
					do break end
				end
			end
		elseif self.acceptDeprecatedConstructs and self:acceptModifierKeyword("depends") then
			do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", self:getAcceptedToken())) end
			if not (depends ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("`depends' is not supported in this context", self:getAcceptedToken(), _g.jk.lang.StackTrace:generate()))
			end
			while true do
				local str = self:parseStringLiteralWithoutModifiers()
				do _g.jk.lang.Vector:append(depends, str) end
				if not (self:acceptToken2(44) ~= nil) then
					do break end
				end
			end
		elseif self:acceptModifierKeyword("extends") then
			local src = self:getAcceptedToken()
			if not (basetypes ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Base types are not supported in this context", src, _g.jk.lang.StackTrace:generate()))
			end
			do
				local sym = self:parseReferenceDataType()
				local btn = _g.sling.model.BaseTypeNode:forType(sym, _g.sling.model.BaseTypeNode.INHERIT_EXTEND)
				do btn:setSource(src) end
				do _g.jk.lang.Vector:append(basetypes, btn) end
			end
		elseif self:acceptModifierKeyword("implements") then
			local src = self:getAcceptedToken()
			if not (basetypes ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Base types are not supported in this context", src, _g.jk.lang.StackTrace:generate()))
			end
			while true do
				local sym = self:parseReferenceDataType()
				local btn = _g.sling.model.BaseTypeNode:forType(sym, _g.sling.model.BaseTypeNode.INHERIT_IMPLEMENT)
				do btn:setSource(src) end
				do _g.jk.lang.Vector:append(basetypes, btn) end
				if not (self:acceptToken2(44) ~= nil) then
					do break end
				end
			end
		elseif self:acceptModifierKeyword("isAlso") then
			local src = self:getAcceptedToken()
			if not (basetypes ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Base types are not supported in this context", src, _g.jk.lang.StackTrace:generate()))
			end
			while true do
				local sym = self:parseReferenceDataType()
				local btn = _g.sling.model.BaseTypeNode:forType(sym, _g.sling.model.BaseTypeNode.INHERIT_INFORMATIVE)
				do btn:setSource(src) end
				do _g.jk.lang.Vector:append(basetypes, btn) end
				if not (self:acceptToken2(44) ~= nil) then
					do break end
				end
			end
		elseif self.acceptDeprecatedConstructs and (self:acceptModifierKeyword("basetype") or self:acceptModifierKeyword("bt")) then
			local src = self:getAcceptedToken()
			if not (basetypes ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Base types are not supported in this context", src, _g.jk.lang.StackTrace:generate()))
			end
			while true do
				local sym = self:parseReferenceDataType()
				do self:onParseMessage(_g.sling.common.WarningMessage:forText("Using deprecated syntax for base type declaration. Use `is' instead.", src)) end
				do
					local btn = _g.sling.model.BaseTypeNode:forType(sym, _g.sling.model.BaseTypeNode.INHERIT_AUTO)
					do btn:setSource(src) end
					do _g.jk.lang.Vector:append(basetypes, btn) end
					if not (self:acceptToken2(44) ~= nil) then
						do break end
					end
				end
			end
		else
			local mod = self:acceptCommonModifierId()
			if mod ~= nil then
				if not (mods ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Modifiers are not supported in this context", self:getAcceptedToken(), _g.jk.lang.StackTrace:generate()))
				end
				if _g.sling.model.Modifier:isVisibilityModifier(mod) then
					if visibility then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Multiple visibility modifiers are not allowed.", self:getAcceptedToken(), _g.jk.lang.StackTrace:generate()))
					end
					visibility = true
				end
				do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(mod)) end
			else
				do break end
			end
		end
	end
	while true do
		local cm = self:acceptAnnotationModifier()
		if cm ~= nil then
			if not (mods ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Modifiers not supported in this context", self:getAcceptedToken(), _g.jk.lang.StackTrace:generate()))
			end
			do _g.jk.lang.Vector:append(mods, cm) end
		else
			do break end
		end
	end
end

sling.parser.SlingParser.DeclarationName = {}
sling.parser.SlingParser.DeclarationName.__index = sling.parser.SlingParser.DeclarationName
_vm:set_metatable(sling.parser.SlingParser.DeclarationName, {})

function sling.parser.SlingParser.DeclarationName._create()
	local v = _vm:set_metatable({}, sling.parser.SlingParser.DeclarationName)
	return v
end

function sling.parser.SlingParser.DeclarationName:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.parser.SlingParser.DeclarationName'
	self['_isType.sling.parser.SlingParser.DeclarationName'] = true
	self.src = nil
	self.ns = nil
	self.name = nil
end

function sling.parser.SlingParser.DeclarationName:_construct0()
	sling.parser.SlingParser.DeclarationName._init(self)
	return self
end

function sling.parser.SlingParser:acceptDeclarationName()
	local r = _g.sling.parser.SlingParser.DeclarationName._construct0(_g.sling.parser.SlingParser.DeclarationName._create())
	r.src = nil
	r.name = nil
	r.ns = nil
	do
		local v = self:acceptIdentifier()
		if v == nil then
			do return r end
		end
		r.src = self:getAcceptedToken()
		if self:acceptToken2(46) == nil then
			r.name = v
			do return r end
		end
		r.ns = {}
		do _g.jk.lang.Vector:append(r.ns, v) end
		while true do
			v = self:parseIdentifier()
			if self:acceptToken2(46) == nil then
				r.name = v
				do break end
			end
			do _g.jk.lang.Vector:append(r.ns, v) end
		end
		do return r end
	end
end

function sling.parser.SlingParser:parseDeclarationName()
	local v = self:acceptDeclarationName()
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("Declaration name"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.SlingParser:acceptGenericTypes()
	local genericTypes = nil
	if self:acceptToken2(60) ~= nil then
		while true do
			local id = self:parseIdentifier()
			local cl = _g.sling.model.TemplateDeclarationNode:forName1(id)
			do cl:setSource(self:getAcceptedToken()) end
			if self:acceptToken1("class") ~= nil then
				do cl:setType(_g.sling.model.TemplateDeclarationNode.TYPE_CLASS) end
			end
			if self:acceptToken2(58) ~= nil then
				repeat
					local src = self:getAcceptedToken()
					self.isGenericTypeParameter = true
					do
						local tt = self:parseDataType(true)
						self.isGenericTypeParameter = false
						do
							local tx = _vm:to_table_with_key(tt, '_isType.sling.model.ReferenceDataTypeNode')
							if not (tx ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Must be a reference data type", tt, _g.jk.lang.StackTrace:generate()))
							end
							do
								local prv = _g.sling.model.BaseTypeNode:forType(tx, 0)
								do prv:setSource(src) end
								do cl:addToBaseTypes(prv) end
							end
						end
					end
				until not (self:acceptToken2(38) ~= nil)
			end
			if genericTypes == nil then
				genericTypes = {}
			end
			do _g.jk.lang.Vector:append(genericTypes, cl) end
			if self:acceptToken2(44) == nil then
				do break end
			end
		end
		do self:parseToken2(62) end
	end
	do return genericTypes end
end

function sling.parser.SlingParser:acceptDelegate(nss)
	local src = self:acceptToken1("delegate")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local name = self:parseDeclarationInit(nss, true)
		local params = self:acceptFunctionDeclarationParameters()
		local mods = self:acceptCommonModifiers()
		local type = nil
		if self:acceptToken1("as") ~= nil then
			type = self:parseDataType(true)
		end
		if type == nil then
			type = _g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create())
		end
		mods = self:acceptAnnotationModifiers(mods)
		do self:parseEndOfStatementToken() end
		do
			local v = _g.sling.model.DelegateDeclarationNode._construct0(_g.sling.model.DelegateDeclarationNode._create())
			do v:setSource(src) end
			do v:setModifiers(mods, false) end
			do v:setReturnType(type) end
			do v:setName(name) end
			do v:setParameters(params) end
			do self:parseToken2(123) end
			do self:parseEndOfStatementToken() end
			do self:acceptEntityMetaInformation(v) end
			do self:parseToken2(125) end
			do self:parseEndOfStatementToken() end
			do return v end
		end
	end
end

function sling.parser.SlingParser:parseDeclarationInit(nss, acceptLegacyName)
	if acceptLegacyName then
		if self:acceptToken1("name") ~= nil then
			do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", self:getAcceptedToken())) end
		end
	end
	do
		local name = self:parseDeclarationName()
		if _g.jk.lang.String:isEmpty(name.name) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No declaration name", name.src, _g.jk.lang.StackTrace:generate()))
		end
		if name.ns ~= nil then
			if not (nss ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Declaration with namespace is not allowed in this context", name.src, _g.jk.lang.StackTrace:generate()))
			end
			do
				local array = name.ns
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local ns = (function(o)
								if (_vm:get_variable_type(o) == 'string') then
									do return o end
								end
								do return nil end
							end)(array[n + 1])
							if ns ~= nil then
								do _g.jk.lang.Vector:append(nss, ns) end
							end
							do n = n + 1 end
						end
					end
				end
			end
		end
		do return name.name end
	end
end

function sling.parser.SlingParser:acceptModelInFileMode()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("model")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local genericTypes = self:acceptGenericTypes()
			local mods = self:acceptCommonModifiers()
			mods = self:acceptAnnotationModifiers(mods)
			if not self:acceptFileModeStartTerminator() then
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
				local v = _g.sling.model.ModelDeclarationNode:forName(self:getFileModeEntityName(src))
				do v:setSource(src) end
				do v:setModifiers(mods, false) end
				do v:setGenericTypes(genericTypes, false) end
				do self:parseModelContents(v, true) end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptModel(nss)
	local src = self:acceptToken1("model")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local name = self:parseDeclarationInit(nss, true)
		local genericTypes = self:acceptGenericTypes()
		local mods = self:acceptCommonModifiers()
		mods = self:acceptAnnotationModifiers(mods)
		do self:parseNewlineToken() end
		do self:parseToken2(123) end
		do self:parseNewlineToken() end
		do
			local v = _g.sling.model.ModelDeclarationNode:forName(name)
			do v:setSource(src) end
			do v:setModifiers(mods, false) end
			do v:setGenericTypes(genericTypes, false) end
			do self:parseModelContents(v, false) end
			do return v end
		end
	end
end

function sling.parser.SlingParser:parseModelContents(v, inFileMode)
	local ee = self.currentEntityName
	self.currentEntityName = v:getName()
	while true do
		local comment = self:acceptCommentWithNewlines()
		if comment ~= nil then
			do self:addDeclarationToContainer(v, comment) end
			goto _continue41
		end
		if inFileMode then
			if self:acceptEOF() ~= nil then
				do break end
			end
		elseif self:acceptToken2(125) ~= nil then
			do self:parseNewlineToken() end
			do break end
		end
		if self:skipUnnecessaryEmptyLines() > 0 then
			goto _continue41
		end
		if self:acceptEntityMetaInformation(v) then
			goto _continue41
		end
		do
			local fsrc = self:parseIdentifierToken()
			local fname = fsrc.value
			local ename = self:acceptStringLiteral()
			do self:parseToken1("as") end
			do
				local fdt = self:parseDataType(true)
				local mods = {}
				while true do
					local mod = self:acceptAnnotationModifier()
					if not (mod ~= nil) then
						do break end
					end
					do _g.jk.lang.Vector:append(mods, mod) end
				end
				do self:parseNewlineToken() end
				do
					local vdec = _g.sling.model.VariableDeclarationNode:instance(fdt, fname, nil)
					do vdec:setModifiers(mods, false) end
					do vdec:setParamName(ename) end
					do vdec:setSource(fsrc) end
					do v:addNode(vdec) end
				end
			end
		end
		::_continue41::
	end
	self.currentEntityName = ee
end

function sling.parser.SlingParser:acceptScriptInFileMode()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("script")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local imports = {}
			local uses = {}
			local depends = {}
			local mods = {}
			do self:acceptEntityDetails(mods, nil, imports, uses, depends) end
			if not self:acceptFileModeStartTerminator() then
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
				local v = _g.sling.model.ScriptDeclarationNode:forName(self:getFileModeEntityName(src))
				do v:setSource(src) end
				do v:setModifiers(mods, false) end
				do v:setDependencies(depends) end
				do v:setImportNamespaces(imports, false) end
				do v:setImportEntities(uses, false) end
				do self:parseScriptContents(v, true) end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptScript(nss)
	local src = self:acceptToken1("script")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local name = self:parseDeclarationInit(nss, true)
		local imports = {}
		local uses = {}
		local depends = {}
		local mods = {}
		do self:acceptEntityDetails(mods, nil, imports, uses, depends) end
		do self:parseNewlineToken() end
		do self:parseToken2(123) end
		do self:parseNewlineToken() end
		do
			local v = _g.sling.model.ScriptDeclarationNode:forName(name)
			do v:setSource(src) end
			do v:setModifiers(mods, false) end
			do v:setDependencies(depends) end
			do v:setImportNamespaces(imports, false) end
			do v:setImportEntities(uses, false) end
			do self:parseScriptContents(v, false) end
			do return v end
		end
	end
end

function sling.parser.SlingParser:parseScriptContents(v, inFileMode)
	local ee = self.currentEntityName
	self.currentEntityName = v:getName()
	while true do
		local comment = self:acceptCommentWithNewlines()
		if comment ~= nil then
			do self:addDeclarationToContainer(v, comment) end
			goto _continue42
		end
		if inFileMode then
			if self:acceptEOF() ~= nil then
				do break end
			end
		elseif self:acceptToken2(125) ~= nil then
			do self:parseNewlineToken() end
			do break end
		end
		if self:skipUnnecessaryEmptyLines() > 0 then
			goto _continue42
		end
		if self:acceptEntityMetaInformation(v) then
			goto _continue42
		end
		if self:acceptInclude(v, _g.sling.parser.SlingParser.NODECONTEXT_ENTITY) then
			goto _continue42
		end
		do self:pushEntity(v) end
		do
			local dec = self:parseScriptDeclaration()
			do self:popEntity() end
			do self:addDeclarationToContainer(v, dec) end
		end
		::_continue42::
	end
	self.currentEntityName = ee
end

function sling.parser.SlingParser:parseScriptDeclaration()
	local ifdef = self:acceptIfdef(_g.sling.parser.SlingParser.NODECONTEXT_ENTITY)
	if ifdef ~= nil then
		do return ifdef end
	end
	do
		local ifndef = self:acceptIfndef(_g.sling.parser.SlingParser.NODECONTEXT_ENTITY)
		if ifndef ~= nil then
			do return ifndef end
		end
		do
			local alias = self:acceptTypeAliasDeclaration()
			if alias ~= nil then
				do return alias end
			end
			do
				local r = self:acceptEntityDeclaration(nil)
				if r ~= nil then
					do return r end
				end
				do
					local edesc = self:acceptEntityDeclarationDescription()
					if edesc ~= nil then
						do self:parseNewlineToken() end
					end
					do
						local vardec = self:acceptEntityVariableDeclaration(true)
						if vardec ~= nil then
							if _g.jk.lang.String:isEmpty(vardec:getDescription()) then
								do vardec:setDescription(edesc) end
							end
							do return vardec end
						end
						do
							local mm = self:acceptMacroDeclaration()
							if mm ~= nil then
								if _g.jk.lang.String:isEmpty(mm:getDescription()) then
									do mm:setDescription(edesc) end
								end
								do return mm end
							end
							do
								local ff = self:acceptFunctionDeclarationStatement(nil)
								if ff ~= nil then
									if _g.jk.lang.String:isEmpty(ff:getDescription()) then
										do ff:setDescription(edesc) end
									end
									do return ff end
								end
								do
									local stmt = self:acceptStatement()
									if stmt ~= nil then
										do return stmt end
									end
									do self:skipSpaces() end
									do self:updateStagingToken() end
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("script declaration"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
									do return nil end
								end
							end
						end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptEntityMetaInformation(ee)
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		if not (self:acceptToken1("meta") ~= nil) then
			do return false end
		end
		do self:acceptNewlineToken() end
		if not (self:acceptToken2(123) ~= nil) then
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
			do return false end
		end
		do self:parseNewlineToken() end
		while true do
			local comment = self:acceptCommentWithNewlines()
			if comment ~= nil then
				goto _continue43
			end
			if self:acceptToken1("description") ~= nil then
				local desc = self:parseStringLiteral()
				do self:parseNewlineToken() end
				do ee:setDescription(desc) end
				goto _continue43
			end
			if self:acceptToken1("data") ~= nil then
				local desc = self:parseStringLiteral()
				do self:parseNewlineToken() end
				do ee:setMetadata(desc) end
				goto _continue43
			end
			if self:acceptToken2(125) ~= nil then
				do self:parseNewlineToken() end
				do break end
			end
			do self:skipSpaces() end
			do self:updateStagingToken() end
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("Meta declaration"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
			::_continue43::
		end
		do return true end
	end
end

function sling.parser.SlingParser:acceptBlockMetaInformation(node)
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		if not (self:acceptToken1("meta") ~= nil) then
			do return false end
		end
		do self:acceptNewlineToken() end
		if not (self:acceptToken2(123) ~= nil) then
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
			do return false end
		end
		do self:parseNewlineToken() end
		do
			local fdb = _vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationBaseNode')
			while true do
				if fdb ~= nil then
					if self:acceptToken1("description") ~= nil then
						local desc = self:parseStringLiteral()
						do self:parseNewlineToken() end
						do fdb:setDescription(desc) end
						goto _continue44
					end
					if self:acceptToken1("param") ~= nil then
						local sym = self:parseSymbolNode(true)
						do self:parseNewlineToken() end
						do self:onParseMessage(_g.sling.common.WarningMessage:forText("param declarations are not implemented.", sym)) end
						goto _continue44
					end
				end
				if self:acceptToken2(125) ~= nil then
					do self:parseNewlineToken() end
					do break end
				end
				do self:skipSpaces() end
				do self:updateStagingToken() end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("Meta declaration"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
				::_continue44::
			end
			do return true end
		end
	end
end

function sling.parser.SlingParser:acceptRegionDeclaration(context)
	local src = self:acceptToken1("region")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local name = self:acceptIdentifier()
		local description = self:acceptStringLiteral()
		local comment = self:acceptComment()
		do self:acceptNewlineToken() end
		do
			local content = self:parseFlatBlockInContext(context, true)
			local v = _g.sling.model.RegionDeclarationNode._construct0(_g.sling.model.RegionDeclarationNode._create())
			do v:setSource(src) end
			do v:setName(name) end
			do v:setDescription(description) end
			do
				local array = content:getNodes()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
							if node ~= nil then
								do v:addNode(node) end
							end
							do n = n + 1 end
						end
					end
				end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:getFileModeEntityName(src)
	local name = self:getCurrentFileId()
	if _g.jk.lang.String:isEmpty(name) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unable to determine declaration name as current file id", src, _g.jk.lang.StackTrace:generate()))
	end
	do return name end
end

function sling.parser.SlingParser:acceptFileModeStartTerminator()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		if not (self:acceptToken2(58) ~= nil) then
			do return false end
		end
		if not (self:acceptNewlineToken() ~= nil) then
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
			do return false end
		end
		if not (self:acceptEOF() ~= nil) then
			do self:parseNewlineToken() end
		end
		do return true end
	end
end

function sling.parser.SlingParser:acceptEnumInFileMode()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("enum")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local imports = {}
			local uses = {}
			local depends = {}
			local mods = {}
			do self:acceptEntityDetails(mods, nil, imports, uses, depends) end
			if not self:acceptFileModeStartTerminator() then
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
				local v = _g.sling.model.EnumDeclarationNode:forName(self:getFileModeEntityName(src))
				do v:setSource(src) end
				do v:setModifiers(mods, false) end
				do v:setDependencies(depends) end
				do v:setImportNamespaces(imports, false) end
				do v:setImportEntities(uses, false) end
				do self:parseEnumContents(v, true) end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptEnum(nss)
	local src = self:acceptToken1("enum")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local name = self:parseDeclarationInit(nss, true)
		local imports = {}
		local uses = {}
		local depends = {}
		local mods = {}
		do self:acceptEntityDetails(mods, nil, imports, uses, depends) end
		do self:parseNewlineToken() end
		do self:parseToken2(123) end
		do self:parseNewlineToken() end
		do
			local v = _g.sling.model.EnumDeclarationNode:forName(name)
			do v:setSource(src) end
			do v:setModifiers(mods, false) end
			do v:setDependencies(depends) end
			do v:setImportNamespaces(imports, false) end
			do v:setImportEntities(uses, false) end
			do self:parseEnumContents(v, false) end
			do return v end
		end
	end
end

function sling.parser.SlingParser:parseEnumContents(v, inFileMode)
	local ee = self.currentEntityName
	self.currentEntityName = v:getName()
	while true do
		local comment = self:acceptCommentWithNewlines()
		if comment ~= nil then
			do self:addDeclarationToContainer(v, comment) end
			goto _continue45
		end
		if inFileMode then
			if self:acceptEOF() ~= nil then
				do break end
			end
		elseif self:acceptToken2(125) ~= nil then
			do self:parseNewlineToken() end
			do break end
		end
		if self:skipUnnecessaryEmptyLines() > 0 then
			goto _continue45
		end
		if self:acceptEntityMetaInformation(v) then
			goto _continue45
		end
		do
			local id = self:acceptIdentifier()
			if not (id ~= nil) then
				do self:skipSpaces() end
				do self:updateStagingToken() end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("identifier"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
			end
			do
				local e = _g.sling.model.EnumValueNode._construct0(_g.sling.model.EnumValueNode._create())
				do e:setSource(self:getAcceptedToken()) end
				do e:setName(id) end
				if self:acceptToken2(61) ~= nil then
					do e:setValue(self:parseExpression(false), false) end
				end
				do self:parseNewlineToken() end
				do v:addNode(e) end
			end
		end
		::_continue45::
	end
	self.currentEntityName = ee
end

function sling.parser.SlingParser:acceptClassInFileMode()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("class")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local genericTypes = self:acceptGenericTypes()
			local basetypes = {}
			local imports = {}
			local uses = {}
			local depends = {}
			local mods = {}
			do self:acceptEntityDetails(mods, basetypes, imports, uses, depends) end
			if not self:acceptFileModeStartTerminator() then
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
				local v = _g.sling.model.ClassDeclarationNode:forName(self:getFileModeEntityName(src))
				do v:setGenericTypes(genericTypes, false) end
				do v:setSource(src) end
				do v:setImportNamespaces(imports, false) end
				do v:setImportEntities(uses, false) end
				do v:setModifiers(mods, false) end
				do v:setBaseTypes(basetypes, false) end
				do v:setDependencies(depends) end
				do self:parseClassContents(v, true) end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptClass(nss)
	local src = self:acceptToken1("class")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local name = self:parseDeclarationInit(nss, true)
		local genericTypes = self:acceptGenericTypes()
		local basetypes = {}
		local imports = {}
		local uses = {}
		local depends = {}
		local mods = {}
		do self:acceptEntityDetails(mods, basetypes, imports, uses, depends) end
		do self:parseNewlineToken() end
		do self:parseToken2(123) end
		do self:parseNewlineToken() end
		do
			local v = _g.sling.model.ClassDeclarationNode:forName(name)
			do v:setGenericTypes(genericTypes, false) end
			do v:setSource(src) end
			do v:setImportNamespaces(imports, false) end
			do v:setImportEntities(uses, false) end
			do v:setModifiers(mods, false) end
			do v:setBaseTypes(basetypes, false) end
			do v:setDependencies(depends) end
			do self:parseClassContents(v, false) end
			do return v end
		end
	end
end

function sling.parser.SlingParser:parseClassContents(v, inFileMode)
	local ee = self.currentEntityName
	self.currentEntityName = v:getName()
	while true do
		local comment = self:acceptCommentWithNewlines()
		if comment ~= nil then
			do self:addDeclarationToContainer(v, comment) end
			goto _continue46
		end
		if inFileMode then
			if self:acceptEOF() ~= nil then
				do break end
			end
		elseif self:acceptToken2(125) ~= nil then
			do self:parseNewlineToken() end
			do break end
		end
		if self:skipUnnecessaryEmptyLines() > 0 then
			goto _continue46
		end
		if self:acceptEntityMetaInformation(v) then
			goto _continue46
		end
		if self:acceptInclude(v, _g.sling.parser.SlingParser.NODECONTEXT_ENTITY) then
			goto _continue46
		end
		do self:pushEntity(v) end
		do
			local dec = self:acceptDeclarationInEntity(true)
			do self:popEntity() end
			if dec ~= nil then
				do self:addDeclarationToContainer(v, dec) end
				goto _continue46
			end
			do self:skipSpaces() end
			do self:updateStagingToken() end
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("class member"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
		end
		::_continue46::
	end
	self.currentEntityName = ee
end

function sling.parser.SlingParser:acceptInterfaceInFileMode()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("interface")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local genericTypes = self:acceptGenericTypes()
			local basetypes = {}
			local imports = {}
			local uses = {}
			local depends = {}
			local mods = {}
			do self:acceptEntityDetails(mods, basetypes, imports, uses, depends) end
			if not self:acceptFileModeStartTerminator() then
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
				local v = _g.sling.model.InterfaceDeclarationNode:forName(self:getFileModeEntityName(src))
				do v:setGenericTypes(genericTypes, false) end
				do v:setSource(src) end
				do v:setModifiers(mods, false) end
				do v:setDependencies(depends) end
				do v:setBaseTypes(basetypes, false) end
				do v:setImportNamespaces(imports, false) end
				do v:setImportEntities(uses, false) end
				do self:parseInterfaceContents(v, true) end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptInterface(nss)
	local src = self:acceptToken1("interface")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local name = self:parseDeclarationInit(nss, true)
		local genericTypes = self:acceptGenericTypes()
		local basetypes = {}
		local imports = {}
		local uses = {}
		local depends = {}
		local mods = {}
		do self:acceptEntityDetails(mods, basetypes, imports, uses, depends) end
		do self:parseNewlineToken() end
		do self:parseToken2(123) end
		do self:parseNewlineToken() end
		do
			local v = _g.sling.model.InterfaceDeclarationNode:forName(name)
			do v:setGenericTypes(genericTypes, false) end
			do v:setSource(src) end
			do v:setModifiers(mods, false) end
			do v:setDependencies(depends) end
			do v:setBaseTypes(basetypes, false) end
			do v:setImportNamespaces(imports, false) end
			do v:setImportEntities(uses, false) end
			do self:parseInterfaceContents(v, false) end
			do return v end
		end
	end
end

function sling.parser.SlingParser:parseInterfaceContents(v, inFileMode)
	local ee = self.currentEntityName
	self.currentEntityName = v:getName()
	while true do
		local comment = self:acceptCommentWithNewlines()
		if comment ~= nil then
			do self:addDeclarationToContainer(v, comment) end
			goto _continue47
		end
		if inFileMode then
			if self:acceptEOF() ~= nil then
				do break end
			end
		elseif self:acceptToken2(125) ~= nil then
			do self:parseNewlineToken() end
			do break end
		end
		if self:skipUnnecessaryEmptyLines() > 0 then
			goto _continue47
		end
		if self:acceptEntityMetaInformation(v) then
			goto _continue47
		end
		if self:acceptInclude(v, _g.sling.parser.SlingParser.NODECONTEXT_ENTITY) then
			goto _continue47
		end
		do self:pushEntity(v) end
		do
			local dec = self:acceptDeclarationInEntity(true)
			do self:popEntity() end
			if dec ~= nil then
				do self:addDeclarationToContainer(v, dec) end
				goto _continue47
			end
			do self:skipSpaces() end
			do self:updateStagingToken() end
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("interface member"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
		end
		::_continue47::
	end
	self.currentEntityName = ee
end

function sling.parser.SlingParser:acceptForeachStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("foreach")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local parens = false
			if self.acceptDeprecatedConstructs and self:acceptToken2(40) ~= nil then
				parens = true
			end
			do
				local lefts = nil
				while true do
					local vdecl = _g.sling.model.VariableDeclarationNode:forName(self:parseDeclarationIdentifier())
					local vtype = _g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create())
					if self:acceptToken1("as") ~= nil then
						vtype = self:parseDataType(true)
					end
					do vdecl:setType(vtype, false) end
					if not (lefts ~= nil) then
						lefts = {}
					end
					do _g.jk.lang.Vector:append(lefts, vdecl) end
					if not (self:acceptToken2(44) ~= nil) then
						do break end
					end
				end
				if not (lefts ~= nil) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				if not (self:acceptToken1("in") ~= nil) then
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
					local right = self:parseExpression(true)
					local condition = nil
					if self:acceptToken1("where") ~= nil then
						condition = self:parseExpression(true)
					end
					if parens then
						do self:parseToken2(41) end
						do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated foreach syntax with parenthesis", src)) end
					end
					do
						local block = self:parseControlStructureBlock()
						local v = _g.sling.model.ForEachStatementNode._construct0(_g.sling.model.ForEachStatementNode._create())
						do v:setLefts(lefts, false) end
						do v:setRight(right, false) end
						do v:setBlock(block, false) end
						do v:setCondition(condition, false) end
						if self:acceptToken1("else") ~= nil then
							local elseBlock = self:parseControlStructureBlock()
							do v:setElseBlock(elseBlock, false) end
						end
						do v:setSource(src) end
						do return v end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptSwitchStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("switch")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local val = nil
			if self.acceptDeprecatedConstructs and self:acceptToken2(40) ~= nil then
				if not ((function()
					val = self:acceptExpression(true)
					do return val end
				end)() ~= nil) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				if not (self:acceptToken2(41) ~= nil) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				do self:acceptUnnecessaryNewlineToken() end
				if not (self:acceptToken2(123) ~= nil) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated switch syntax with parenthesis", src)) end
			else
				if not ((function()
					val = self:acceptExpression(true)
					do return val end
				end)() ~= nil) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				do self:parseToken2(123) end
			end
			do self:parseNewlineToken() end
			do
				local stmts = {}
				while true do
					local cserr = nil
					local c = nil
					if self:acceptToken1("case") ~= nil then
						cserr = self:getAcceptedToken()
						if self:acceptToken1("!=") ~= nil then
							local x = self:parseExpression(true)
							c = _g.sling.model.CaseNotEqualsBlockNode:instance(x, nil)
						elseif self:acceptToken1("<=") ~= nil then
							local x = self:parseExpression(true)
							c = _g.sling.model.CaseLessOrEqualBlockNode:instance(x, nil)
						elseif self:acceptToken2(60) ~= nil then
							local x = self:parseExpression(true)
							c = _g.sling.model.CaseLessThanBlockNode:instance(x, nil)
						elseif self:acceptToken1(">=") ~= nil then
							local x = self:parseExpression(true)
							c = _g.sling.model.CaseGreaterOrEqualBlockNode:instance(x, nil)
						elseif self:acceptToken2(62) ~= nil then
							local x = self:parseExpression(true)
							c = _g.sling.model.CaseGreaterThanBlockNode:instance(x, nil)
						else
							local x = self:parseExpression(true)
							if (_vm:to_table_with_key(x, '_isType.sling.model.RangeExpressionNode') ~= nil) then
								local r = x
								c = _g.sling.model.CaseRangeBlockNode:instance(r:exportLowerBound(), r:exportUpperBound(), nil, r:getExclusionType())
								do r:destroy() end
							elseif (_vm:to_table_with_key(x, '_isType.sling.model.MultipleExpressionNode') ~= nil) then
								c = _g.sling.model.CaseMultipleEqualsBlockNode:forVectorOfObjects(x:exportExpressions(), nil)
							else
								c = _g.sling.model.CaseEqualsBlockNode:instance(x, nil)
							end
						end
					elseif self:acceptToken1("default") ~= nil then
						cserr = self:getAcceptedToken()
						c = _g.sling.model.CaseDefaultBlockNode._construct0(_g.sling.model.CaseDefaultBlockNode._create())
					else
						do self:skipSpaces() end
						do self:updateStagingToken() end
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`case' or `default'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
					end
					if self.acceptDeprecatedConstructs and self:acceptToken2(58) ~= nil then
						do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", self:getAcceptedToken())) end
					end
					do self:acceptUnnecessaryNewlineToken() end
					do
						local block = self:parseBlock(true, nil)
						do c:setBlock(block, false) end
						do c:setSource(cserr) end
						do _g.jk.lang.Vector:append(stmts, c) end
						if self:acceptToken2(125) ~= nil then
							do self:parseNewlineToken() end
							do break end
						end
					end
				end
				do
					local v = _g.sling.model.SwitchStatementNode:forExpression(val)
					do v:setBlocks(stmts, false) end
					do v:setSource(src) end
					do return v end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptLangDeclaration(langOptional, isExpression)
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("lang")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local type = self:acceptStringLiteral()
			local dt = self:acceptDataType(true)
			do self:acceptUnnecessaryNewlineToken() end
			do
				local blockToken = self:acceptTripleBraceBlockToken()
				if not (blockToken ~= nil) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				if not (type ~= nil) and not langOptional then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("language type"), src, _g.jk.lang.StackTrace:generate()))
				end
				if isExpression and dt == nil then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("data type"), src, _g.jk.lang.StackTrace:generate()))
				end
				do
					local block = blockToken:getValue()
					if block == nil then
						block = ""
					end
					if isExpression == false then
						do self:parseNewlineToken() end
					end
					do
						local n1 = 3
						local n2 = 3
						local it1 = _g.jk.lang.String:iterate(block)
						do it1:getNextChar() end
						do it1:getNextChar() end
						do it1:getNextChar() end
						while it1:getNextChar() == 10 do
							do n1 = n1 + 1 end
						end
						it1 = _g.jk.lang.String:iterateReverse(block)
						do it1:getNextChar() end
						do it1:getNextChar() end
						do it1:getNextChar() end
						while it1:getNextChar() == 9 do
							do n2 = n2 + 1 end
						end
						block = _g.jk.lang.String:getSubString(block, n1, _g.jk.lang.String:getLength(block) - n1 - n2)
						do
							local v = _g.sling.model.EmbedBlockNode:instance(type, block)
							do v:setDefaultDataType(dt, false) end
							do v:setSource(src) end
							do return v end
						end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptAnnotationModifierToken()
	do self:skipSpaces() end
	do
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
					if self:peekNextCharacter() == 91 then
						local counter = 1
						do sb:appendCharacter(self:getNextCharacter()) end
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
							if cn == 91 then
								do counter = counter + 1 end
							elseif cn == 93 then
								do counter = counter - 1 end
								if counter < 1 then
									do break end
								end
							end
						end
					else
						while true do
							local cn = self:peekNextCharacter()
							if _g.jk.lang.Character:isAlnum(cn) or cn == 95 then
								do self:getNextCharacter() end
								do sb:appendCharacter(cn) end
							else
								do break end
							end
						end
					end
					do
						local v = self.stagingToken
						self.stagingToken = nil
						do self:updateStagingToken() end
						v.line = ctl
						v.column = ctc
						v.position = ctp
						v.value = sb:toString()
						do self:onTokenAccepted(v) end
						do return v end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptAnnotationModifier()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local v = nil
		if self:acceptToken1("#@") ~= nil then
			local src = self:getAcceptedToken()
			local symbol = self:acceptSymbolNode(true)
			if not (symbol ~= nil) then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return nil end
			end
			v = _g.sling.model.AnnotationModifierNode._construct0(_g.sling.model.AnnotationModifierNode._create())
			do v:setSource(src) end
			do v:setSymbol(symbol, false) end
		else
			local cmt = self:acceptAnnotationModifierToken()
			if not (cmt ~= nil) then
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
				local t = cmt:getValue()
				if not (t ~= nil) then
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
					local cm = _g.jk.lang.String:getEndOfString(t, 1)
					if _g.jk.lang.String:startsWith(cm, "[", 0) and _g.jk.lang.String:endsWith(cm, "]") then
						cm = _g.jk.lang.String:getSubString(cm, 1, _g.jk.lang.String:getLength(cm) - 2)
					end
					if not _g.jk.lang.String:isNotEmpty(cm) then
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
						do return nil end
					end
					v = _g.sling.model.AnnotationModifierNode:forText(cm)
					do v:setSource(cmt) end
					if self:acceptToken2(64) ~= nil then
						do v:setSymbol(self:parseSymbolNode(true), false) end
					end
				end
			end
		end
		if self:acceptToken2(40) ~= nil then
			while true do
				do v:addToExpressions(self:parseExpression(false)) end
				if not (self:acceptToken2(44) ~= nil) then
					do break end
				end
			end
			do self:parseToken2(41) end
		end
		do return v end
	end
end

function sling.parser.SlingParser:acceptNamespaceDeclaration()
	local src = self:acceptToken1("namespace")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local name = self:parseDeclarationIdentifier()
		do self:parseNewlineToken() end
		do
			local block = self:parseFlatBlockInContext(_g.sling.parser.SlingParser.NODECONTEXT_NAMESPACE, true)
			local v = _g.sling.model.NamespaceNode:forName(name)
			do v:setSource(src) end
			do
				local array = block:exportNodes()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
							if node ~= nil then
								do v:addNode(node) end
							end
							do n = n + 1 end
						end
					end
				end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptDeclarationInNamespace(nss)
	local ifdef = self:acceptIfdef(_g.sling.parser.SlingParser.NODECONTEXT_NAMESPACE)
	if ifdef ~= nil then
		do return ifdef end
	end
	do
		local ifndef = self:acceptIfndef(_g.sling.parser.SlingParser.NODECONTEXT_NAMESPACE)
		if ifndef ~= nil then
			do return ifndef end
		end
		do
			local langDeclaration = self:acceptLangDeclaration(false, false)
			if langDeclaration ~= nil then
				do return langDeclaration end
			end
			do
				local r = self:acceptEntityDeclaration(nss)
				if r ~= nil then
					do return r end
				end
				do
					local edesc = self:acceptEntityDeclarationDescription()
					if edesc ~= nil then
						do self:parseNewlineToken() end
					end
					do
						local mm = self:acceptMacroDeclaration()
						if mm ~= nil then
							if _g.jk.lang.String:isEmpty(mm:getDescription()) then
								do mm:setDescription(edesc) end
							end
							do return mm end
						end
						do
							local fd = self:acceptFunctionDeclarationStatement(nss)
							if fd ~= nil then
								do return fd end
							end
							do
								local vd = self:acceptVariableDeclarationStatement(nss)
								if vd ~= nil then
									do return vd end
								end
								do
									local ns = self:acceptNamespaceDeclaration()
									if ns ~= nil then
										do return ns end
									end
									do
										local region = self:acceptRegionDeclaration(_g.sling.parser.SlingParser.NODECONTEXT_NAMESPACE)
										if region ~= nil then
											do return region end
										end
										do return nil end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:parseDeclarationInNamespace(nss)
	local v = self:acceptDeclarationInNamespace(nss)
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("namespace declaration"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.SlingParser:acceptDocumentationToken()
	local t = self:acceptDocumentationCommentToken()
	if not (t ~= nil) then
		do return nil end
	end
	do
		local ts = t:getValue()
		if not (ts ~= nil) then
			do return nil end
		end
		if not _g.jk.lang.String:startsWith(ts, "**", 0) then
			do return "" end
		end
		do
			local v = _g.jk.lang.String:getEndOfString(ts, 2)
			if not (v ~= nil) then
				v = ""
			end
			if v ~= nil then
				v = _g.jk.lang.String:strip(v)
			end
			do return v end
		end
	end
end

function sling.parser.SlingParser:acceptDocumentationSection()
	local dt = self:acceptDocumentationToken()
	if not (dt ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		if _g.jk.lang.String:isEmpty(dt) == false then
			do self:onParseMessage(_g.sling.common.WarningMessage:forText("Documentation sections should start with an empty header line `**' without content (this one has content: `" .. _g.jk.lang.String:safeString(dt) .. "').", self:getAcceptedToken())) end
			do sb:appendString(dt) end
		end
		do
			local v = {}
			while true do
				local dt = self:acceptDocumentationToken()
				if dt == nil then
					do break end
				end
				if _g.jk.lang.String:isEmpty(dt) then
					local ss = sb:toString()
					do sb:clear() end
					if _g.jk.lang.String:isEmpty(ss) then
						do self:onParseMessage(_g.sling.common.WarningMessage:forText("Empty paragraph in documentation section", self:getAcceptedToken())) end
					else
						do _g.jk.lang.Vector:append(v, ss) end
					end
				else
					if sb:count() > 0 then
						do sb:appendCharacter(32) end
					end
					do sb:appendString(dt) end
				end
			end
			if sb:count() > 0 then
				do self:onParseMessage(_g.sling.common.WarningMessage:forText("Documentation sections should end with a blank footer line `**' without content.", self:getAcceptedToken())) end
				do _g.jk.lang.Vector:append(v, sb:toString()) end
			end
			do return v end
		end
	end
end

function sling.parser.SlingParser:acceptEntityDescription()
	local paragraphs = self:acceptDocumentationSection()
	if not (paragraphs ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		if paragraphs ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(paragraphs)
			do
				n = 0
				while n < m do
					local paragraph = paragraphs[n + 1]
					if paragraph ~= nil then
						if sb:count() > 0 then
							do sb:appendCharacter(10) end
						end
						do sb:appendString(paragraph) end
					end
					do n = n + 1 end
				end
			end
		end
		do return sb:toString() end
	end
end

function sling.parser.SlingParser:acceptEntityDeclarationDescription()
	local paragraphs = self:acceptDocumentationSection()
	if not (paragraphs ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		if paragraphs ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(paragraphs)
			do
				n = 0
				while n < m do
					local paragraph = paragraphs[n + 1]
					if paragraph ~= nil then
						if sb:count() > 0 then
							do sb:appendCharacter(10) end
						end
						do sb:appendString(paragraph) end
					end
					do n = n + 1 end
				end
			end
		end
		do return sb:toString() end
	end
end

function sling.parser.SlingParser:acceptEntityDeclaration(nss)
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local edesc = self:acceptEntityDescription()
		if edesc ~= nil then
			do self:parseNewlineToken() end
		end
		do
			local cdec = self:acceptClass(nss)
			if cdec ~= nil then
				if _g.jk.lang.String:isEmpty(cdec:getDescription()) then
					do cdec:setDescription(edesc) end
				end
				do return cdec end
			end
			do
				local enum = self:acceptEnum(nss)
				if enum ~= nil then
					if _g.jk.lang.String:isEmpty(enum:getDescription()) then
						do enum:setDescription(edesc) end
					end
					do return enum end
				end
				do
					local model = self:acceptModel(nss)
					if model ~= nil then
						if _g.jk.lang.String:isEmpty(model:getDescription()) then
							do model:setDescription(edesc) end
						end
						do return model end
					end
					do
						local iface = self:acceptInterface(nss)
						if iface ~= nil then
							if _g.jk.lang.String:isEmpty(iface:getDescription()) then
								do iface:setDescription(edesc) end
							end
							do return iface end
						end
						do
							local dlg = self:acceptDelegate(nss)
							if dlg ~= nil then
								if _g.jk.lang.String:isEmpty(dlg:getDescription()) then
									do dlg:setDescription(edesc) end
								end
								do return dlg end
							end
							do
								local script = self:acceptScript(nss)
								if script ~= nil then
									if _g.jk.lang.String:isEmpty(script:getDescription()) then
										do script:setDescription(edesc) end
									end
									do return script end
								end
								if edesc ~= nil then
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
			end
		end
	end
end

function sling.parser.SlingParser:acceptDeclarationInFileMode()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local edesc = self:acceptEntityDescription()
		if edesc ~= nil then
			do self:parseNewlineToken() end
		end
		do
			local cdec = self:acceptClassInFileMode()
			if cdec ~= nil then
				if _g.jk.lang.String:isEmpty(cdec:getDescription()) then
					do cdec:setDescription(edesc) end
				end
				do return cdec end
			end
			do
				local edec = self:acceptEnumInFileMode()
				if edec ~= nil then
					if _g.jk.lang.String:isEmpty(edec:getDescription()) then
						do edec:setDescription(edesc) end
					end
					do return edec end
				end
				do
					local mdec = self:acceptModelInFileMode()
					if mdec ~= nil then
						if _g.jk.lang.String:isEmpty(mdec:getDescription()) then
							do mdec:setDescription(edesc) end
						end
						do return mdec end
					end
					do
						local idec = self:acceptInterfaceInFileMode()
						if idec ~= nil then
							if _g.jk.lang.String:isEmpty(idec:getDescription()) then
								do idec:setDescription(edesc) end
							end
							do return idec end
						end
						do
							local sdec = self:acceptScriptInFileMode()
							if sdec ~= nil then
								if _g.jk.lang.String:isEmpty(sdec:getDescription()) then
									do sdec:setDescription(edesc) end
								end
								do return sdec end
							end
							if edesc ~= nil then
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
		end
	end
end

function sling.parser.SlingParser:acceptMacroDeclaration()
	if self.isMacro then
		do return nil end
	end
	do
		local src = self:acceptToken1("macro")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local name = self:parseDeclarationIdentifier()
			local params = self:acceptFunctionDeclarationParameters()
			local mods = {}
			do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.PUBLIC)) end
			do _g.jk.lang.Vector:append(mods, _g.sling.model.AnnotationModifierNode:forText("macro")) end
			while true do
				local cm = self:acceptAnnotationModifier()
				if cm ~= nil then
					do _g.jk.lang.Vector:append(mods, cm) end
					goto _continue48
				end
				do break end
				::_continue48::
			end
			self.isMacro = true
			do
				local body = self:parseFunctionBlock(nil)
				self.isMacro = false
				if not (body ~= nil) then
					do return nil end
				end
				do
					local v = _g.sling.model.FunctionDeclarationNode:forName(name, false)
					do v:setSource(src) end
					do v:setReturnType(_g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()), false) end
					do v:setModifiers(mods, false) end
					do v:setParameters(params, false) end
					do v:setBody(body, false) end
					do return v end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptInitializerBlockDeclaration()
	local src = self:acceptToken1("init")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local body = self:parseFunctionBlock(nil)
		local v = _g.sling.model.InitializerBlockDeclarationNode:forBlock(body)
		do v:setSource(src) end
		do return v end
	end
end

function sling.parser.SlingParser:acceptFunctionDeclarationStatement(nss)
	local src = self:acceptToken1("func")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local name = self:parseDeclarationInit(nss, false)
		local genericTypes = self:acceptGenericTypes()
		local params = self:acceptFunctionDeclarationParameters()
		local mods = self:acceptCommonModifiers()
		local throwables = {}
		while true do
			if self:acceptModifierKeyword("throws") then
				do _g.jk.lang.Vector:append(throwables, self:parseDataType(true)) end
			else
				do break end
			end
		end
		do
			local dt = nil
			if self:acceptModifierKeyword("as") then
				dt = self:parseDataType(true)
			end
			mods = self:acceptAnnotationModifiers(mods)
			do
				local body = nil
				local v = _g.sling.model.FunctionDeclarationNode:forName(name, false)
				if self:acceptSemicolonToken() ~= nil then
					do self:acceptNewlineToken() end
				else
					body = self:parseFunctionBlock(v)
				end
				if dt == nil then
					dt = _g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create())
				end
				do v:setSource(src) end
				do v:setReturnType(dt, false) end
				do v:setModifiers(mods, false) end
				do v:setParameters(params, false) end
				do v:setThrowables(throwables, false) end
				do v:setGenericTypes(genericTypes, false) end
				do v:setBody(body, false) end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptStaticBlockDeclaration()
	local src = self:acceptToken1("initStatic")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local body = self:parseFunctionBlock(nil)
		local v = _g.sling.model.StaticBlockDeclarationNode:forBlock(body)
		do v:setSource(src) end
		do return v end
	end
end

function sling.parser.SlingParser:acceptFunctionDeclarationExpression()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("func")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local params = nil
			local emptyParameterListWarning = false
			if self:acceptToken2(40) ~= nil then
				params = {}
				if self:acceptToken2(41) ~= nil then
					emptyParameterListWarning = true
				else
					while true do
						local vr = self:acceptFunctionDeclarationParameter()
						if not (vr ~= nil) then
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
							do return nil end
						end
						do _g.jk.lang.Vector:append(params, vr) end
						if self:acceptToken2(44) ~= nil then
							do self:acceptMultipleNewlineTokens() end
							goto _continue49
						end
						if self:acceptToken2(41) ~= nil then
							do break end
						end
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
						do return nil end
						::_continue49::
					end
				end
			end
			do
				local throwables = {}
				while true do
					if self:acceptModifierKeyword("throws") then
						do _g.jk.lang.Vector:append(throwables, self:parseDataType(true)) end
					else
						do break end
					end
				end
				do
					local dt = nil
					if self:acceptModifierKeyword("as") then
						dt = self:parseDataType(true)
					end
					do
						local mods = nil
						while true do
							local cm = self:acceptAnnotationModifier()
							if cm ~= nil then
								if not (mods ~= nil) then
									mods = {}
								end
								do _g.jk.lang.Vector:append(mods, cm) end
							else
								do break end
							end
						end
						do
							local v = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
							local body = self:acceptBlock(false, v)
							if not (body ~= nil) then
								self.currentTokenColumn = ctc
								self.currentTokenLine = ctl
								do self.iterator:setCurrentPosition(ctp) end
								while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
									do self.commentQueue:pop() end
								end
								self.previousToken = cpt
								do return nil end
							end
							if emptyParameterListWarning then
								do self:onParseMessage(_g.sling.common.WarningMessage:forText("Empty parameter list in function declaration expression: Parenthesis should be omitted", src)) end
							end
							if dt == nil then
								dt = _g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create())
							end
							do v:setSource(src) end
							do v:setReturnType(dt, false) end
							do v:setParameters(params, false) end
							do v:setThrowables(throwables, false) end
							do v:setBody(body, false) end
							do v:setModifiers(mods, false) end
							do
								local vv = _g.sling.model.FunctionDeclarationExpressionNode:forDeclaration(v)
								do vv:setSource(src) end
								do return vv end
							end
						end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptTypeAliasDeclaration()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("typedef")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local idt = self:parseDeclarationIdentifier()
			local gen = self:acceptGenericTypes()
			if not (self:acceptToken1("=") ~= nil) then
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
				local dtp = self:acceptDataType(true)
				if not (dtp ~= nil) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				do self:parseEndOfStatementToken() end
				do
					local v = _g.sling.model.TypeAliasDeclarationNode:instance(idt, dtp)
					do v:setSource(src) end
					do v:setGenericTypes(gen, false) end
					do return v end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptConstructorDeclaration()
	if self:acceptToken1("constructor") == nil and self:acceptToken1("ctor") == nil then
		do return nil end
	end
	do
		local src = self:getAcceptedToken()
		local genericTypes = self:acceptGenericTypes()
		local throwables = {}
		local visibility = nil
		local nextcall = nil
		local stub = false
		local mods = {}
		local params = self:acceptFunctionDeclarationParameters()
		while true do
			if self:acceptModifierKeyword("public") then
				visibility = _g.sling.model.Modifier.PUBLIC
			elseif self:acceptModifierKeyword("deprecated") then
				do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.DEPRECATED)) end
			elseif self:acceptModifierKeyword("private") then
				visibility = _g.sling.model.Modifier.PRIVATE
			elseif self:acceptModifierKeyword("nsprivate") then
				visibility = _g.sling.model.Modifier.NAMESPACEPRIVATE
			elseif self:acceptModifierKeyword("protected") then
				visibility = _g.sling.model.Modifier.PROTECTED
			elseif self:acceptModifierKeyword("stub") then
				stub = true
			elseif self:acceptModifierKeyword("throws") then
				local dt = self:parseDataType(true)
				do _g.jk.lang.Vector:append(throwables, dt) end
			elseif self:acceptModifierKeyword("next") then
				local nc = self:parseExpression(true)
				nextcall = _vm:to_table_with_key(nc, '_isType.sling.model.FunctionCallExpressionNode')
				if not (nextcall ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("function call expression"), nc:getSource(), _g.jk.lang.StackTrace:generate()))
				end
			elseif self:acceptModifierKeyword("override") then
				do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.OVERRIDE)) end
			else
				do break end
			end
		end
		while true do
			local cm = self:acceptAnnotationModifier()
			if cm ~= nil then
				do _g.jk.lang.Vector:append(mods, cm) end
			else
				do break end
			end
		end
		if visibility == nil then
			visibility = _g.sling.model.Modifier.PUBLIC
		end
		do
			local block = nil
			if stub then
				if self:acceptSemicolonToken() == nil then
					do self:parseNewlineToken() end
				else
					do self:acceptNewlineToken() end
				end
			else
				block = self:parseFunctionBlock(nil)
			end
			do
				local v = _g.sling.model.ConstructorDeclarationNode._construct0(_g.sling.model.ConstructorDeclarationNode._create())
				do v:setSource(src) end
				do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(visibility)) end
				if stub then
					do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.STUB)) end
				end
				do v:setModifiers(mods, false) end
				do v:setParameters(params, false) end
				do v:setThrowables(throwables, false) end
				do v:setBody(block, false) end
				do v:setGenericTypes(genericTypes, false) end
				do v:setNext(nextcall, false) end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptDestructorDeclaration()
	if self:acceptToken1("destructor") == nil and self:acceptToken1("dtor") == nil then
		do return nil end
	end
	do
		local src = self:getAcceptedToken()
		local block = nil
		if self:acceptSemicolonToken() ~= nil then
			do self:acceptNewlineToken() end
		else
			block = self:parseFunctionBlock(nil)
		end
		do
			local v = _g.sling.model.DestructorDeclarationNode._construct0(_g.sling.model.DestructorDeclarationNode._create())
			do v:setSource(src) end
			do v:setBody(block, false) end
			do return v end
		end
	end
end

function sling.parser.SlingParser:parseParameterVariableDeclaration(defaultAutomatic)
	local v = self:acceptParameterVariableDeclaration(defaultAutomatic)
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("parameter variable declaration"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.SlingParser:acceptNamedParameterDeclaration()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local name = self:acceptDeclarationIdentifier()
		if not (name ~= nil) then
			do return nil end
		end
		do
			local src = self:getAcceptedToken()
			if not (self:acceptToken2(58) ~= nil) then
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
				local argument = self:acceptDeclarationIdentifier()
				if not (argument ~= nil) then
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
					local argumentSrc = self:getAcceptedToken()
					local mods = {}
					while true do
						if self:acceptModifierKeyword("final") then
							do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.FINAL)) end
						else
							do break end
						end
					end
					if not (self:acceptToken1("as") ~= nil) then
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
						local dt = self:parseDataType(true)
						while true do
							local cm = self:acceptAnnotationModifier()
							if not (cm ~= nil) then
								do break end
							end
							do _g.jk.lang.Vector:append(mods, cm) end
						end
						do
							local v = _g.sling.model.VariableDeclarationNode:instance(dt, argument, nil)
							do v:setSource(argumentSrc) end
							do v:setModifiers(mods, false) end
							if self:acceptToken2(61) ~= nil then
								do v:setInitializer(self:parseExpression(false), false) end
							end
							do
								local npd = _g.sling.model.NamedParameterDeclarationNode._construct0(_g.sling.model.NamedParameterDeclarationNode._create())
								do npd:setSource(src) end
								do npd:setName(name) end
								do npd:setVariable(v, false) end
								do return npd end
							end
						end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptParameterVariableDeclaration(defaultAutomatic)
	local name = self:acceptDeclarationIdentifier()
	if not (name ~= nil) then
		do return nil end
	end
	do
		local src = self:getAcceptedToken()
		local paramName = nil
		local dt = nil
		local mods = {}
		while true do
			if self:acceptModifierKeyword("final") then
				do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.FINAL)) end
			else
				do break end
			end
		end
		while true do
			if self:acceptToken1("pname") ~= nil then
				if not ((function()
					paramName = self:parseIdentifier()
					do return paramName end
				end)() ~= nil) then
					do return nil end
				end
			else
				do break end
			end
		end
		if self:acceptToken1("as") ~= nil then
			if not ((function()
				dt = self:parseDataType(true)
				do return dt end
			end)() ~= nil) then
				do return nil end
			end
		end
		while true do
			local cm = self:acceptAnnotationModifier()
			if cm ~= nil then
				do _g.jk.lang.Vector:append(mods, cm) end
			else
				do break end
			end
		end
		do
			local expr = nil
			if self:acceptToken2(61) ~= nil then
				expr = self:parseExpression(false)
			end
			if dt == nil then
				if expr ~= nil and (_vm:to_table_with_key(expr, '_isType.sling.model.LiteralExpressionNode') ~= nil) then
					local dd = expr:getDefaultDataType()
					if not (dd ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Literal expression has no default data type!", expr, _g.jk.lang.StackTrace:generate()))
					end
					if not ((function()
						dt = _vm:to_table_with_key(dd:dup(), '_isType.sling.common.DataTypeNode')
						do return dt end
					end)() ~= nil) then
						do return nil end
					end
				elseif expr ~= nil or defaultAutomatic then
					dt = _g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create())
				else
					dt = _g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create())
				end
			end
			do
				local v = _g.sling.model.VariableDeclarationNode:instance(dt, name, nil)
				do v:setSource(src) end
				do v:setParamName(paramName) end
				do v:setModifiers(mods, false) end
				do v:setInitializer(expr, false) end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptVariableDeclarationStatement(nss)
	local src = self:acceptToken1("var")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local name = self:parseDeclarationInit(nss, false)
		local dt = nil
		local mods = self:acceptCommonModifiers()
		if self:acceptToken1("as") ~= nil then
			if not ((function()
				dt = self:parseDataType(true)
				do return dt end
			end)() ~= nil) then
				do return nil end
			end
		end
		mods = self:acceptAnnotationModifiers(mods)
		if self:acceptToken1(",") ~= nil then
			local mvd = _g.sling.model.MultipleVariableDeclarationNode._construct0(_g.sling.model.MultipleVariableDeclarationNode._create())
			do mvd:setSource(src) end
			do mvd:setType(dt, false) end
			do
				local ov = _g.sling.model.VariableDeclarationNode:instance(dt, name, nil)
				do ov:setSource(src) end
				do ov:setModifiers(mods, false) end
				do mvd:addToVariables(ov) end
				while true do
					if not (self:acceptToken2(44) ~= nil) then
						do break end
					end
					do
						local nn = self:acceptDeclarationIdentifier()
						if self:acceptToken1("as") ~= nil then
							dt = self:parseDataType(true)
						end
						do
							local v = _g.sling.model.VariableDeclarationNode:instance(dt, nn, nil)
							do v:setSource(src) end
							do _g.sling.util.ModifierUtil:copyModifiers(ov, v) end
							do mvd:addToVariables(v) end
						end
					end
				end
				if self:acceptToken2(61) ~= nil then
					do mvd:setInitializer(self:parseExpression(true), false) end
				end
				do return mvd end
			end
		end
		do
			local isAssert = nil
			local assertErrorBlock = nil
			local expr = nil
			if self:acceptToken2(61) ~= nil then
				isAssert = self:acceptToken1("assert")
				expr = self:parseExpression(true)
				if isAssert ~= nil then
					assertErrorBlock = self:parseControlStructureBlock()
				end
			end
			do
				local comment = nil
				if not (isAssert ~= nil) then
					comment = self:acceptComment()
					do self:parseEndOfStatementToken() end
				end
				if not (dt ~= nil) then
					if expr ~= nil then
						dt = _g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create())
					else
						dt = _g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create())
					end
				end
				do
					local v = _g.sling.model.VariableDeclarationNode:instance(dt, name, nil)
					do v:setSource(src) end
					do v:setModifiers(mods, false) end
					do v:setInitializer(expr, false) end
					if comment ~= nil then
						if _g.jk.lang.String:isEmpty(v:getDescription()) then
							do v:setDescription(comment:getText()) end
						end
					end
					if not (isAssert ~= nil) then
						do return v end
					end
					do
						local an = _g.sling.model.AssertStatementNode:forChild(v)
						do an:setSource(src) end
						do an:setErrorBlock(assertErrorBlock, false) end
						do return an end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptAnnotationModifiers(mods)
	local v = mods
	while true do
		local cm = self:acceptAnnotationModifier()
		if cm ~= nil then
			if not (v ~= nil) then
				v = {}
			end
			do _g.jk.lang.Vector:append(v, cm) end
		else
			do break end
		end
	end
	do return v end
end

function sling.parser.SlingParser:acceptConstantVariableDeclaration()
	local src = self:acceptToken1("const")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local name = self:parseDeclarationIdentifier()
		local dt = nil
		if self:acceptModifierKeyword("as") then
			if not ((function()
				dt = self:parseDataType(true)
				do return dt end
			end)() ~= nil) then
				do return nil end
			end
		end
		do
			local mods = {}
			do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.PUBLIC)) end
			do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.STATIC)) end
			do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.CONSTANT)) end
			mods = self:acceptAnnotationModifiers(mods)
			do
				local expr = nil
				if self:acceptToken2(61) ~= nil then
					expr = self:parseExpression(true)
				end
				if not (dt ~= nil) then
					if expr ~= nil then
						dt = _g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create())
					else
						dt = _g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create())
					end
				end
				do
					local comment = self:acceptComment()
					do self:parseEndOfStatementToken() end
					do
						local v = _g.sling.model.VariableDeclarationNode:instance(dt, name, nil)
						do v:setSource(src) end
						do v:setModifiers(mods, false) end
						do v:setInitializer(expr, false) end
						if comment ~= nil then
							if _g.jk.lang.String:isEmpty(v:getDescription()) then
								do v:setDescription(comment:getText()) end
							end
						end
						do return v end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptIndexerDeclaration()
	local src = self:acceptToken1("indexer")
	if not (src ~= nil) then
		do return nil end
	end
	do self:parseToken2(40) end
	do
		local v = _g.sling.model.IndexerDeclarationNode._construct0(_g.sling.model.IndexerDeclarationNode._create())
		do v:setSource(src) end
		while true do
			local id = self:parseIdentifier()
			do self:parseToken1("as") end
			do
				local dt = self:parseDataType(true)
				local vd = _g.sling.model.VariableDeclarationNode:instance(dt, id, nil)
				do vd:setParamName(id) end
				if self:acceptToken2(61) ~= nil then
					do vd:setInitializer(self:parseExpression(true), false) end
				end
				do v:addToParameters(vd) end
				if self:acceptToken2(41) ~= nil then
					do break end
				end
				if self:acceptToken2(44) ~= nil then
					goto _continue50
				end
				do self:skipSpaces() end
				do self:updateStagingToken() end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`)' or `,'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
			end
			::_continue50::
		end
		do self:parseToken1("as") end
		do v:setType(self:parseDataType(true), false) end
		do self:parseEndOfStatementToken() end
		do self:parseToken2(123) end
		do self:parseEndOfStatementToken() end
		while true do
			if self:acceptToken2(125) ~= nil then
				do self:parseEndOfStatementToken() end
				do break end
			end
			if self:acceptToken1("set") ~= nil then
				local mysrc = self:getAcceptedToken()
				local varName = nil
				if self:acceptToken1("(") ~= nil then
					varName = self:parseIdentifier()
					do self:parseToken2(41) end
				end
				do
					local block = self:parseBlockOrStatement(false, nil)
					if v:getSetter() ~= nil then
						do self:onParseMessage(_g.sling.common.WarningMessage:forText("Multiple setters encountered. Ignoring declaration.", mysrc)) end
					else
						do v:setSetterAsBlock(block, varName) end
					end
					goto _continue51
				end
			end
			if self:acceptToken1("get") ~= nil then
				local mysrc = self:getAcceptedToken()
				local block = self:parseBlockOrStatement(false, nil)
				if v:getGetter() ~= nil then
					do self:onParseMessage(_g.sling.common.WarningMessage:forText("Multiple getters encountered. Ignoring declaration.", mysrc)) end
				else
					do v:setGetterAsBlock(block) end
				end
				goto _continue51
			end
			do self:skipSpaces() end
			do self:updateStagingToken() end
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`}', `set' or `get'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
			::_continue51::
		end
		do return v end
	end
end

function sling.parser.SlingParser:acceptEventDeclaration()
	local src = self:acceptToken1("event")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local name = self:parseDeclarationIdentifier()
		local mods = self:acceptCommonModifiers()
		do self:parseToken1("as") end
		do
			local type = self:parseDataType(true)
			mods = self:acceptAnnotationModifiers(mods)
			do
				local comment = self:acceptComment()
				do self:acceptNewlineToken() end
				do
					local v = _g.sling.model.EventDeclarationNode._construct0(_g.sling.model.EventDeclarationNode._create())
					do v:setSource(src) end
					do v:setModifiers(mods, false) end
					do v:setName(name) end
					do v:setType(type, false) end
					do
						local body = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
						do v:setBody(body, false) end
						if comment ~= nil then
							if _g.jk.lang.String:isEmpty(v:getDescription()) then
								do v:setDescription(comment:getText()) end
							end
						end
						do self:parseToken2(123) end
						while true do
							do self:acceptMultipleNewlineTokens() end
							if self:acceptToken2(125) ~= nil then
								do break end
							end
							if self:acceptToken1("description") ~= nil then
								local desc = self:parseStringLiteralExpression(true)
								do v:setDescription(desc:getValue()) end
								goto _continue52
							end
							do
								local comment = self:acceptComment()
								if comment ~= nil then
									do body:addNode(comment) end
									goto _continue52
								end
								if self:acceptToken1("add") ~= nil then
									local mysrc = self:getAcceptedToken()
									local varName = nil
									if self:acceptToken1("(") ~= nil then
										varName = self:parseIdentifier()
										do self:parseToken2(41) end
									end
									if not (varName ~= nil) then
										varName = "value"
									end
									do
										local block = self:parseBlockOrStatement(false, nil)
										local v = _g.sling.model.EventAddFunctionDeclarationNode._construct0(_g.sling.model.EventAddFunctionDeclarationNode._create())
										do v:setSource(mysrc) end
										do v:setParameter(_g.sling.util.DataTypeUtil:dupAsDataType(type), varName) end
										do v:setBody(block, false) end
										do body:addNode(v) end
										goto _continue52
									end
								end
								if self:acceptToken1("remove") ~= nil then
									local mysrc = self:getAcceptedToken()
									local varName = nil
									if self:acceptToken1("(") ~= nil then
										varName = self:parseIdentifier()
										do self:parseToken2(41) end
									end
									if not (varName ~= nil) then
										varName = "value"
									end
									do
										local block = self:parseBlockOrStatement(false, nil)
										local v = _g.sling.model.EventRemoveFunctionDeclarationNode._construct0(_g.sling.model.EventRemoveFunctionDeclarationNode._create())
										do v:setSource(mysrc) end
										do v:setParameter(_g.sling.util.DataTypeUtil:dupAsDataType(type), varName) end
										do v:setBody(block, false) end
										do body:addNode(v) end
										goto _continue52
									end
								end
								do self:skipSpaces() end
								do self:updateStagingToken() end
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`add', comment, or `remove'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
							end
							::_continue52::
						end
						do return v end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptPropertyDeclaration()
	local src = self:acceptToken1("property")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local name = self:parseDeclarationIdentifier()
		local backingVariableName = nil
		if self:acceptToken2(58) ~= nil then
			backingVariableName = self:parseDeclarationIdentifier()
		end
		do
			local mods = self:acceptCommonModifiers()
			do self:parseToken1("as") end
			do
				local dt = self:parseDataType(true)
				local expr = nil
				if self:acceptToken2(61) ~= nil then
					expr = self:parseExpression(true)
				end
				mods = self:acceptAnnotationModifiers(mods)
				do
					local comment = self:acceptComment()
					do self:acceptNewlineToken() end
					do
						local v = _g.sling.model.PropertyDeclarationNode._construct0(_g.sling.model.PropertyDeclarationNode._create())
						do v:setSource(src) end
						do v:setModifiers(mods, false) end
						do v:setName(name) end
						do v:setBackingVariableName(backingVariableName) end
						do v:setType(dt, false) end
						do v:setInitializer(expr, false) end
						if comment ~= nil then
							if _g.jk.lang.String:isEmpty(v:getDescription()) then
								do v:setDescription(comment:getText()) end
							end
						end
						do self:parseToken2(123) end
						do
							local body = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
							do v:setBody(body, false) end
							while true do
								do self:acceptMultipleNewlineTokens() end
								if self:acceptToken2(125) ~= nil then
									do break end
								end
								if self:acceptToken1("description") ~= nil then
									local desc = self:parseStringLiteralExpression(true)
									do v:setDescription(desc:getValue()) end
									goto _continue53
								end
								do
									local comment = self:acceptComment()
									if comment ~= nil then
										do body:addNode(comment) end
										goto _continue53
									end
									if self:acceptToken1("set") ~= nil then
										local mysrc = self:getAcceptedToken()
										local varName = nil
										if self:acceptToken1("(") ~= nil then
											varName = self:parseIdentifier()
											do self:parseToken2(41) end
										end
										if not (varName ~= nil) then
											varName = "value"
										end
										do
											local block = self:parseBlockOrStatement(false, nil)
											local v = _g.sling.model.PropertySetFunctionDeclarationNode._construct0(_g.sling.model.PropertySetFunctionDeclarationNode._create())
											do v:setSource(mysrc) end
											do v:setParameter(_g.sling.util.DataTypeUtil:dupAsDataType(dt), varName) end
											do v:setBody(block, false) end
											do body:addNode(v) end
											goto _continue53
										end
									end
									if self:acceptToken1("get") ~= nil then
										local mysrc = self:getAcceptedToken()
										local block = self:parseBlockOrStatement(false, nil)
										local v = _g.sling.model.PropertyGetFunctionDeclarationNode._construct0(_g.sling.model.PropertyGetFunctionDeclarationNode._create())
										do v:setSource(mysrc) end
										do v:setReturnType(_g.sling.util.DataTypeUtil:dupAsDataType(dt), false) end
										do v:setBody(block, false) end
										do body:addNode(v) end
										goto _continue53
									end
									if self:acceptToken1("init") ~= nil then
										local mysrc = self:getAcceptedToken()
										local block = self:parseBlockOrStatement(false, nil)
										local v = _g.sling.model.PropertyInitializeFunctionDeclarationNode._construct0(_g.sling.model.PropertyInitializeFunctionDeclarationNode._create())
										do v:setSource(mysrc) end
										do v:setBody(block, false) end
										do body:addNode(v) end
										goto _continue53
									end
									if self:acceptToken1("willset") ~= nil then
										local mysrc = self:getAcceptedToken()
										local varName = nil
										if self:acceptToken1("(") ~= nil then
											varName = self:parseIdentifier()
											do self:parseToken2(41) end
										end
										if not (varName ~= nil) then
											varName = "value"
										end
										do
											local block = self:parseBlockOrStatement(false, nil)
											local v = _g.sling.model.PropertyWillSetFunctionDeclarationNode._construct0(_g.sling.model.PropertyWillSetFunctionDeclarationNode._create())
											do v:setSource(mysrc) end
											do v:setParameter(_g.sling.util.DataTypeUtil:dupAsDataType(dt), varName) end
											do v:setBody(block, false) end
											do body:addNode(v) end
											goto _continue53
										end
									end
									if self:acceptToken1("didset") ~= nil then
										local mysrc = self:getAcceptedToken()
										local varName = nil
										if self:acceptToken1("(") ~= nil then
											varName = self:parseIdentifier()
											do self:parseToken2(41) end
										end
										do
											local block = self:parseBlockOrStatement(false, nil)
											local v = _g.sling.model.PropertyDidSetFunctionDeclarationNode._construct0(_g.sling.model.PropertyDidSetFunctionDeclarationNode._create())
											do v:setSource(mysrc) end
											do v:setParameter(_g.sling.util.DataTypeUtil:dupAsDataType(dt), varName) end
											do v:setBody(block, false) end
											do body:addNode(v) end
											goto _continue53
										end
									end
									if self:acceptToken1("hasset") ~= nil then
										local v = _g.sling.model.PropertySetFunctionDeclarationNode._construct0(_g.sling.model.PropertySetFunctionDeclarationNode._create())
										do v:setSource(self:getAcceptedToken()) end
										do v:setParameter(_g.sling.util.DataTypeUtil:dupAsDataType(dt), "value") end
										do v:setBody(nil, false) end
										do body:addNode(v) end
										goto _continue53
									end
									if self:acceptToken1("hasget") ~= nil then
										local v = _g.sling.model.PropertyGetFunctionDeclarationNode._construct0(_g.sling.model.PropertyGetFunctionDeclarationNode._create())
										do v:setSource(self:getAcceptedToken()) end
										do v:setReturnType(_g.sling.util.DataTypeUtil:dupAsDataType(dt), false) end
										do v:setBody(nil, false) end
										do body:addNode(v) end
										goto _continue53
									end
									do self:skipSpaces() end
									do self:updateStagingToken() end
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`description', comment, `set', `hasset', `get', `hasget', `init', `willset' or `didset'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
								end
								::_continue53::
							end
							do return v end
						end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptEntityVariableDeclaration(addDefaultModifier)
	local cc = self:acceptConstantVariableDeclaration()
	if cc ~= nil then
		do return cc end
	end
	do
		local isPropertyKeyword = false
		if self:acceptToken1("prop") ~= nil then
			do self:onParseMessage(_g.sling.common.WarningMessage:forText("Property variables should be declared with keyword `pvar'", self:getAcceptedToken())) end
			isPropertyKeyword = true
		elseif self:acceptToken1("pvar") ~= nil then
			isPropertyKeyword = true
		elseif not (self:acceptToken1("var") ~= nil) then
			do return nil end
		end
		do
			local src = self:getAcceptedToken()
			local name = self:parseDeclarationIdentifier()
			local genericTypes = self:acceptGenericTypes()
			if genericTypes ~= nil then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported generic types encountered for a variable declaration (?)", src, _g.jk.lang.StackTrace:generate()))
			end
			do
				local dt = nil
				local mods = {}
				local visibility = false
				local isProperty = false
				while true do
					if self:acceptModifierKeyword("public") then
						if visibility then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Multiple visibility modifiers are not allowed.", self:getAcceptedToken(), _g.jk.lang.StackTrace:generate()))
						end
						visibility = true
						do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.PUBLIC)) end
					elseif self:acceptModifierKeyword("private") then
						if visibility then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Multiple visibility modifiers are not allowed.", self:getAcceptedToken(), _g.jk.lang.StackTrace:generate()))
						end
						visibility = true
						do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.PRIVATE)) end
					elseif self:acceptModifierKeyword("nsprivate") then
						if visibility then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Multiple visibility modifiers are not allowed.", self:getAcceptedToken(), _g.jk.lang.StackTrace:generate()))
						end
						visibility = true
						do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.NAMESPACEPRIVATE)) end
					elseif self:acceptModifierKeyword("protected") then
						if visibility then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Multiple visibility modifiers are not allowed.", self:getAcceptedToken(), _g.jk.lang.StackTrace:generate()))
						end
						visibility = true
						do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.PROTECTED)) end
					elseif self.acceptDeprecatedConstructs and self:acceptModifierKeyword("property") then
						do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.PROPERTY)) end
						isProperty = true
						do self:onParseMessage(_g.sling.common.WarningMessage:forText("The `property' modifier is deprecated. Use `pvar' declarations instead.", self:getAcceptedToken())) end
					elseif self:acceptModifierKeyword("const") then
						do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.CONSTANT)) end
					elseif self:acceptModifierKeyword("volatile") then
						do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.VOLATILE)) end
					elseif self:acceptModifierKeyword("transient") then
						do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.TRANSIENT)) end
					elseif self:acceptModifierKeyword("static") then
						do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.STATIC)) end
					elseif self:acceptModifierKeyword("extern") then
						do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.EXTERNAL)) end
					elseif self:acceptModifierKeyword("final") then
						do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.FINAL)) end
					elseif self:acceptModifierKeyword("synchronized") then
						do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.SYNCHRONIZED)) end
					elseif self:acceptModifierKeyword("deprecated") then
						do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.DEPRECATED)) end
					elseif self:acceptModifierKeyword("weak") then
						do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.WEAK)) end
					else
						do break end
					end
				end
				if self:acceptModifierKeyword("as") then
					if not ((function()
						dt = self:parseDataType(true)
						do return dt end
					end)() ~= nil) then
						do return nil end
					end
				end
				mods = self:acceptAnnotationModifiers(mods)
				if not isPropertyKeyword then
					if visibility == false and addDefaultModifier == true then
						if isProperty then
							do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.PUBLIC)) end
						else
							do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.PRIVATE)) end
						end
						visibility = true
					end
				end
				do
					local expr = nil
					if self:acceptToken2(61) ~= nil then
						expr = self:parseExpression(true)
					end
					if dt == nil then
						if expr ~= nil then
							dt = _g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create())
						else
							dt = _g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create())
						end
					end
					if isPropertyKeyword then
						do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.PUBLIC)) end
						do _g.jk.lang.Vector:append(mods, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.PROPERTY)) end
					end
					do
						local comment = self:acceptComment()
						do self:parseEndOfStatementToken() end
						do
							local v = _g.sling.model.VariableDeclarationNode:instance(dt, name, nil)
							do v:setSource(src) end
							do v:setModifiers(mods, false) end
							do v:setInitializer(expr, false) end
							if comment ~= nil then
								if _g.jk.lang.String:isEmpty(v:getDescription()) then
									do v:setDescription(comment:getText()) end
								end
							end
							do return v end
						end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:acceptModifierDeclaration(src)
	local cum = self:acceptAnnotationModifier()
	if cum ~= nil then
		do cum:setSource(src) end
		do return end
	end
	do
		local com = self:acceptCommonModifierId()
		if com ~= nil then
			local v = _g.sling.model.CommonModifierNode:forType(com)
			do v:setSource(src) end
			do return v end
		end
		do return nil end
	end
end

function sling.parser.SlingParser:parseModifierDeclaration(src)
	local v = self:acceptModifierDeclaration(src)
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("modifier declaration"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.SlingParser:parseDependsDeclaration(src)
	local str = self:parseStringLiteral()
	do self:parseNewlineToken() end
	do
		local v = _g.sling.model.DependencyDeclarationNode._construct0(_g.sling.model.DependencyDeclarationNode._create())
		do v:setSource(src) end
		do v:setValue(str) end
		do return v end
	end
end

function sling.parser.SlingParser:parseBaseTypeDeclaration(src)
	local sym = self:parseReferenceDataType()
	local type = _g.sling.model.BaseTypeNode.INHERIT_AUTO
	if self:acceptToken1("type") ~= nil then
		if self:acceptToken1("auto") ~= nil then
			type = _g.sling.model.BaseTypeNode.INHERIT_AUTO
		elseif self:acceptToken1("extends") ~= nil then
			type = _g.sling.model.BaseTypeNode.INHERIT_EXTEND
		elseif self:acceptToken1("implements") ~= nil then
			type = _g.sling.model.BaseTypeNode.INHERIT_IMPLEMENT
		elseif self:acceptToken1("isAlso") ~= nil then
			type = _g.sling.model.BaseTypeNode.INHERIT_INFORMATIVE
		else
			do self:skipSpaces() end
			do self:updateStagingToken() end
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`auto', `extends', `implements' or `isAlso'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
		end
	end
	do self:parseNewlineToken() end
	do
		local btn = _g.sling.model.BaseTypeNode:forType(sym, type)
		do btn:setSource(src) end
		do return btn end
	end
end

function sling.parser.SlingParser:addDeclarationToContainer(container, declaration)
	if container == nil or declaration == nil then
		do return end
	end
	if (_vm:to_table_with_key(declaration, '_isType.sling.model.FlatBlockNode') ~= nil) then
		local array = declaration:exportNodes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
					if node ~= nil then
						do container:addNode(node) end
					end
					do n = n + 1 end
				end
			end
		end
	else
		do container:addNode(declaration) end
	end
end

function sling.parser.SlingParser:acceptUiDeclaration()
	local src = self:acceptToken1("ui")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local dt = self:acceptReferenceDatatype()
		do self:parseNewlineToken() end
		do self:parseToken2(123) end
		do self:parseNewlineToken() end
		do
			local v = _g.sling.model.UIExpressionNode._construct0(_g.sling.model.UIExpressionNode._create())
			do v:setSource(src) end
			do v:setDefaultDataType(dt, false) end
			while true do
				local comment = self:acceptCommentWithNewlines()
				if comment ~= nil then
					do v:addToChildren(comment) end
					goto _continue54
				end
				if self:skipUnnecessaryEmptyLines() > 0 then
					goto _continue54
				end
				if self:acceptToken2(125) ~= nil then
					do self:parseNewlineToken() end
					do break end
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
						local id = self:acceptIdentifier()
						if id ~= nil then
							local src2 = self:getAcceptedToken()
							local mods = {}
							while true do
								local cm = self:acceptAnnotationModifier()
								if cm ~= nil then
									do _g.jk.lang.Vector:append(mods, cm) end
								else
									do break end
								end
							end
							if not (self:acceptToken2(61) ~= nil) then
								self.currentTokenColumn = ctc
								self.currentTokenLine = ctl
								do self.iterator:setCurrentPosition(ctp) end
								while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
									do self.commentQueue:pop() end
								end
								self.previousToken = cpt
							else
								local value = self:parseExpression(true)
								do self:parseNewlineToken() end
								do
									local ae = _g.sling.model.PropertyValueDeclarationNode:forName(id, value)
									do ae:setModifiers(mods, false) end
									do ae:setSource(src2) end
									do v:addToChildren(ae) end
									goto _continue54
								end
							end
						end
						do
							local xpr = self:acceptUiExpression()
							if xpr ~= nil then
								do self:parseEndOfStatementToken() end
								do v:addToChildren(xpr) end
								goto _continue54
							end
							do self:skipSpaces() end
							do self:updateStagingToken() end
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("ui expression or assignment"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
						end
					end
				end
				::_continue54::
			end
			do return v end
		end
	end
end

function sling.parser.SlingParser:acceptUiExpression()
	local v = nil
	local opos = self:rememberPosition()
	local dt = self:acceptReferenceDatatype()
	if dt ~= nil then
		local name = self:acceptIdentifier()
		local opos2 = self:rememberPosition()
		if self:acceptToken2(123) ~= nil or self:acceptToken2(58) ~= nil then
			v = _g.sling.model.UIExpressionNode._construct0(_g.sling.model.UIExpressionNode._create())
			do v:setDefaultDataType(dt, false) end
			do v:setName(name) end
			do v:setSource(dt:getSource()) end
			do self:restorePosition(opos2) end
		else
			do self:restorePosition(opos) end
		end
	end
	if not (v ~= nil) then
		local xpr = self:acceptExpression(true)
		if xpr ~= nil then
			local name = self:acceptIdentifier()
			v = _g.sling.model.UIExpressionNode._construct0(_g.sling.model.UIExpressionNode._create())
			do v:setExpression(xpr, false) end
			do v:setName(name) end
			do v:setSource(xpr:getSource()) end
		end
	end
	if not (v ~= nil) then
		do return nil end
	end
	if self:acceptToken2(58) ~= nil then
		while true do
			local xpr = self:parseExpression(false)
			do v:addToLayoutParams(xpr) end
			if not (self:acceptToken2(44) ~= nil) then
				do break end
			end
		end
	end
	if self:acceptToken2(123) ~= nil then
		do self:parseNewlineToken() end
		while true do
			local comment = self:acceptCommentWithNewlines()
			if comment ~= nil then
				do v:addToChildren(comment) end
				goto _continue55
			end
			if self:skipUnnecessaryEmptyLines() > 0 then
				goto _continue55
			end
			if self:acceptToken2(125) ~= nil then
				do break end
			end
			do
				local opos2 = self:rememberPosition()
				local id = self:acceptIdentifier()
				if id ~= nil then
					local src2 = self:getAcceptedToken()
					local mods = {}
					while true do
						local cm = self:acceptAnnotationModifier()
						if cm ~= nil then
							do _g.jk.lang.Vector:append(mods, cm) end
						else
							do break end
						end
					end
					if not (self:acceptToken2(61) ~= nil) then
						do self:restorePosition(opos2) end
					else
						local value = self:parseExpression(true)
						do self:parseNewlineToken() end
						do
							local ae = _g.sling.model.PropertyValueDeclarationNode:forName(id, value)
							do ae:setModifiers(mods, false) end
							do ae:setSource(src2) end
							do v:addToChildren(ae) end
							goto _continue55
						end
					end
				end
				do
					local xpr = self:acceptUiExpression()
					if xpr ~= nil then
						do self:parseEndOfStatementToken() end
						do v:addToChildren(xpr) end
						goto _continue55
					end
					do self:skipSpaces() end
					do self:updateStagingToken() end
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("ui expression or assignment"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
				end
			end
			::_continue55::
		end
	end
	do return v end
end

function sling.parser.SlingParser:acceptHttpMethod()
	if self:acceptToken1("GET") ~= nil then
		do return "GET" end
	end
	if self:acceptToken1("PUT") ~= nil then
		do return "PUT" end
	end
	if self:acceptToken1("POST") ~= nil then
		do return "POST" end
	end
	if self:acceptToken1("PATCH") ~= nil then
		do return "PATCH" end
	end
	if self:acceptToken1("DELETE") ~= nil then
		do return "DELETE" end
	end
	do return nil end
end

function sling.parser.SlingParser:acceptWebApiDeclaration(edesc)
	local initialize = self:acceptToken1("initialize")
	if initialize ~= nil then
		local block = self:parseFunctionBlock(nil)
		local v = _g.sling.model.InitializerFunctionDeclarationNode._construct0(_g.sling.model.InitializerFunctionDeclarationNode._create())
		if _g.jk.lang.String:isEmpty(v:getDescription()) then
			do v:setDescription(edesc) end
		end
		do v:setSource(initialize) end
		do v:setBody(block, false) end
		do return v end
	end
	if self:acceptToken1("handler") ~= nil then
		local src = self:getAcceptedToken()
		local path = self:parseStringLiteral()
		do self:parseToken2(61) end
		do
			local xpr = self:parseExpression(true)
			do self:parseEndOfStatementToken() end
			do
				local v = _g.sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration._construct0(_g.sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration._create())
				do v:setSource(src) end
				do v:setPath(path) end
				do v:setExpression(xpr, false) end
				do return v end
			end
		end
	end
	do
		local method = self:acceptHttpMethod()
		if not (method ~= nil) then
			do return nil end
		end
		do
			local src = self:getAcceptedToken()
			local methodt = self:getAcceptedToken()
			local path = self:parseStringLiteral()
			local v = _g.sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration._construct0(_g.sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration._create())
			do v:setSource(src) end
			if _g.jk.lang.String:isEmpty(v:getDescription()) then
				do v:setDescription(edesc) end
			end
			do v:setSource(methodt) end
			do v:setMethod(method) end
			do v:setPath(path) end
			while true do
				local cm = self:acceptAnnotationModifier()
				if not (cm ~= nil) then
					do break end
				end
				do v:addToModifiers(cm) end
			end
			do
				local block = self:parseFunctionBlock(nil)
				do v:setBody(block, false) end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptWebApiStatement()
	if self:acceptToken1("sampleRequest") ~= nil then
		local src = self:getAcceptedToken()
		local title = self:parseStringLiteral()
		local content = self:parseStringLiteral()
		do self:parseEndOfStatementToken() end
		do
			local cparsed = _g.jk.json.JSONParser:parse(content)
			if cparsed ~= nil then
				content = _g.jk.json.JSONEncoder:encode(cparsed, true, false)
			end
			do
				local v = _g.sling.model.ext.NSlingWebApiSampleRequest._construct0(_g.sling.model.ext.NSlingWebApiSampleRequest._create())
				do v:setSource(src) end
				do v:setTitle(title) end
				do v:setContent(content) end
				do return v end
			end
		end
	end
	if self:acceptToken1("sampleResponse") ~= nil then
		local src = self:getAcceptedToken()
		local title = self:parseStringLiteral()
		local content = self:parseStringLiteral()
		do self:parseEndOfStatementToken() end
		do
			local cparsed = _g.jk.json.JSONParser:parse(content)
			if cparsed ~= nil then
				content = _g.jk.json.JSONEncoder:encode(cparsed, true, false)
			end
			do
				local v = _g.sling.model.ext.NSlingWebApiSampleResponse._construct0(_g.sling.model.ext.NSlingWebApiSampleResponse._create())
				do v:setSource(src) end
				do v:setTitle(title) end
				do v:setContent(content) end
				do return v end
			end
		end
	end
	if self:acceptToken1("receivePath") ~= nil then
		local src = self:getAcceptedToken()
		local name = self:parseIdentifier()
		local type = nil
		if self:acceptToken1("as") ~= nil then
			type = self:parseDataType(true)
		end
		do
			local desc = self:acceptStringLiteral()
			do self:parseEndOfStatementToken() end
			do
				local v = _g.sling.model.ext.NSlingWebApiInPathStatement._construct0(_g.sling.model.ext.NSlingWebApiInPathStatement._create())
				do v:setSource(src) end
				do v:setName(name) end
				do v:setType(type, false) end
				if _g.jk.lang.String:isEmpty(v:getDescription()) then
					do v:setDescription(desc) end
				end
				do return v end
			end
		end
	end
	if self:acceptToken1("receiveQueryParameter") ~= nil then
		local src = self:getAcceptedToken()
		local name = self:parseIdentifier()
		local type = nil
		local optional = false
		if self:acceptToken1("as") ~= nil then
			type = self:parseDataType(true)
		end
		if self:acceptToken1("optional") ~= nil then
			optional = true
		end
		do
			local desc = self:acceptStringLiteral()
			do self:parseEndOfStatementToken() end
			do
				local v = _g.sling.model.ext.NSlingWebApiInQueryParameterStatement._construct0(_g.sling.model.ext.NSlingWebApiInQueryParameterStatement._create())
				do v:setSource(src) end
				do v:setName(name) end
				do v:setType(type, false) end
				do v:setOptional(optional) end
				if _g.jk.lang.String:isEmpty(v:getDescription()) then
					do v:setDescription(desc) end
				end
				do return v end
			end
		end
	end
	if self:acceptToken1("receivePost") ~= nil then
		local src = self:getAcceptedToken()
		local name = self:parseIdentifier()
		if not (self:parseToken1("as") ~= nil) then
			do return nil end
		end
		do
			local type = self:parseDataType(true)
			local desc = self:acceptStringLiteral()
			do self:parseEndOfStatementToken() end
			do
				local v = _g.sling.model.ext.NSlingWebApiInPostStatement._construct0(_g.sling.model.ext.NSlingWebApiInPostStatement._create())
				do v:setSource(src) end
				do v:setName(name) end
				do v:setType(type, false) end
				if _g.jk.lang.String:isEmpty(v:getDescription()) then
					do v:setDescription(desc) end
				end
				do return v end
			end
		end
	end
	if self:acceptToken1("receiveSession") ~= nil then
		local src = self:getAcceptedToken()
		local name = self:parseIdentifier()
		do self:parseToken1("as") end
		do
			local type = self:parseDataType(true)
			do self:parseEndOfStatementToken() end
			do
				local v = _g.sling.model.ext.NSlingWebApiInSessionStatement._construct0(_g.sling.model.ext.NSlingWebApiInSessionStatement._create())
				do v:setSource(src) end
				do v:setName(name) end
				do v:setType(type, false) end
				do return v end
			end
		end
	end
	if self:acceptToken1("sendError") ~= nil then
		local src = self:getAcceptedToken()
		local code = self:acceptExpression(true)
		local data = self:acceptExpression(true)
		do self:parseEndOfStatementToken() end
		do
			local v = _g.sling.model.ext.NSlingWebApiOutErrorStatement._construct0(_g.sling.model.ext.NSlingWebApiOutErrorStatement._create())
			do v:setSource(src) end
			do v:setCode(code, false) end
			do v:setData(data, false) end
			do return v end
		end
	end
	if self:acceptToken1("sendOk") ~= nil then
		local src = self:getAcceptedToken()
		local data = self:acceptExpression(true)
		do self:parseEndOfStatementToken() end
		do
			local v = _g.sling.model.ext.NSlingWebApiOutOkStatement._construct0(_g.sling.model.ext.NSlingWebApiOutOkStatement._create())
			do v:setSource(src) end
			do v:setData(data, false) end
			do return v end
		end
	end
	if self:acceptToken1("sendObject") ~= nil then
		local src = self:getAcceptedToken()
		local data = self:parseExpression(true)
		do self:parseEndOfStatementToken() end
		do
			local v = _g.sling.model.ext.NSlingWebApiOutObjectStatement._construct0(_g.sling.model.ext.NSlingWebApiOutObjectStatement._create())
			do v:setSource(src) end
			do v:setData(data, false) end
			do return v end
		end
	end
	do return nil end
end

function sling.parser.SlingParser:acceptMarkupTagParamValue()
	if self:acceptToken2(123) ~= nil then
		local v = self:parseExpression(true)
		do self:parseToken2(125) end
		do return v end
	end
	do
		local lit = self:acceptStringLiteralExpression(true)
		if lit ~= nil then
			do return lit end
		end
		do return nil end
	end
end

function sling.parser.SlingParser:parseMarkupTagParamValue()
	local v = self:acceptMarkupTagParamValue()
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("markup tag parameter value"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.SlingParser:isClosingTagComing()
	if not (self:peekNextCharacter() ~= 0) == 60 then
		do return false end
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
				local v = false
				if self:peekNextCharacter() == 47 then
					v = true
				end
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:acceptMarkupTextContentToken()
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
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			while true do
				local c = self:peekNextCharacter()
				if _g.jk.lang.Character:isEOF(c) then
					do break end
				end
				if c == 60 and self:isClosingTagComing() then
					do break end
				end
				do self:getNextCharacter() end
				do sb:appendCharacter(c) end
			end
			do
				local ids = sb:toString()
				if not _g.jk.lang.String:isNotEmpty(ids) then
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

function sling.parser.SlingParser:acceptTagNameToken()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		while true do
			local c = self:peekNextCharacter()
			if _g.jk.lang.Character:isEOF(c) or c == 62 or c == 32 or c == 47 then
				do break end
			end
			do self:getNextCharacter() end
			do sb:appendCharacter(c) end
		end
		do
			local ids = sb:toString()
			if not _g.jk.lang.String:isNotEmpty(ids) then
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

function sling.parser.SlingParser:acceptTreeElementChild(v)
	if self:acceptToken2(123) ~= nil then
		local xpr = self:parseExpression(true)
		do self:parseToken2(125) end
		do v:addToChildren(xpr) end
		do return true end
	end
	do
		local tag = self:acceptTreeElement()
		if tag ~= nil then
			do v:addToChildren(tag) end
			do return true end
		end
		do
			local text = self:acceptMarkupTextContentToken()
			if text ~= nil then
				local lit = _g.sling.model.StringLiteralExpressionNode:forValue(text.value)
				do lit:setSource(text) end
				do v:addToChildren(lit) end
				do return true end
			end
			do return false end
		end
	end
end

function sling.parser.SlingParser:parseTreeElementChild(v)
	if not self:acceptTreeElementChild(v) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("<tag>, {expression} or text content"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
end

function sling.parser.SlingParser:acceptTreeElement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken2(60)
		if not (src ~= nil) then
			do return nil end
		end
		do
			local tagsrc = self:acceptTagNameToken()
			if not (tagsrc ~= nil) then
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
				local tag = tagsrc.value
				if not (tag ~= nil) then
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
					local v = _g.sling.model.TreeElementNode._construct0(_g.sling.model.TreeElementNode._create())
					do v:setSource(src) end
					do v:setName(tag) end
					if self:acceptToken2(64) ~= nil then
						do v:setReference(self:parseIdentifier()) end
					end
					while true do
						local param = self:acceptIdentifier()
						if not (param ~= nil) then
							do break end
						end
						do
							local attrsrc = self:getAcceptedToken()
							local value = nil
							if self:acceptToken2(61) ~= nil then
								value = self:parseMarkupTagParamValue()
							else
								value = _g.sling.model.BooleanLiteralExpressionNode:forValue(true)
							end
							do
								local attr = _g.sling.model.TreeElementAttributeNode._construct0(_g.sling.model.TreeElementAttributeNode._create())
								do attr:setSource(attrsrc) end
								do attr:setName(param) end
								do attr:setValue(value, false) end
								do v:addToAttributes(attr) end
							end
						end
					end
					if self:acceptToken1("/>") ~= nil then
						do return v end
					end
					do self:parseToken2(62) end
					do
						local closeToken = "</" .. _g.jk.lang.String:safeString(tag) .. ">"
						while true do
							if self:acceptToken1(closeToken) ~= nil then
								do break end
							end
							do self:parseTreeElementChild(v) end
						end
						do return v end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:parseTreeElement()
	local v = self:acceptTreeElement()
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("tag"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.SlingParser:isStyleSheetSelectorCharacter(c)
	if _g.jk.lang.Character:isAlphaNumeric(c) or c == 46 or c == 35 or c == 64 or c == 45 or c == 95 then
		do return true end
	end
	if c == 40 or c == 41 or c == 91 or c == 93 or c == 123 or c == 125 then
		do return true end
	end
	do return false end
end

function sling.parser.SlingParser:acceptStyleSheetSelectorToken()
	do self:skipSpaces() end
	do
		local c0 = self:peekNextCharacter()
		if not self:isStyleSheetSelectorCharacter(c0) then
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
				local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				do sb:appendCharacter(c0) end
				do self:getNextCharacter() end
				while true do
					local c = self:peekNextCharacter()
					if not self:isStyleSheetSelectorCharacter(c) then
						do break end
					end
					do self:getNextCharacter() end
					do sb:appendCharacter(c) end
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

function sling.parser.SlingParser:parseStyleSheetSelector()
	local token = self:acceptStyleSheetSelectorToken()
	if not (token ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("selector"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return token.value end
end

function sling.parser.SlingParser:isStyleSheetRulePropertyNameCharacter(c)
	if _g.jk.lang.Character:isAlphaNumeric(c) or c == 45 or c == 95 or c == 46 then
		do return true end
	end
	do return false end
end

function sling.parser.SlingParser:acceptStyleSheetRulePropertyNameToken()
	do self:skipSpaces() end
	do
		local c0 = self:peekNextCharacter()
		if not self:isStyleSheetRulePropertyNameCharacter(c0) then
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
				local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				do sb:appendCharacter(c0) end
				do self:getNextCharacter() end
				while true do
					local c = self:peekNextCharacter()
					if not self:isStyleSheetRulePropertyNameCharacter(c) then
						do break end
					end
					do self:getNextCharacter() end
					do sb:appendCharacter(c) end
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

function sling.parser.SlingParser:parseStyleSheetRulePropertyName()
	local token = self:acceptStyleSheetRulePropertyNameToken()
	if not (token ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("property name"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return token.value end
end

function sling.parser.SlingParser:parseStyleSheetRulePropertyValue()
	if self:acceptToken2(123) ~= nil then
		local v = self:parseExpression(true)
		do self:parseToken2(125) end
		do return v end
	end
	do
		local value = self:acceptStringLiteralExpression(true)
		if value ~= nil then
			do return value end
		end
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("{expression} or string literal"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
		do return nil end
	end
end

function sling.parser.SlingParser:acceptStyleSheetDeclaration()
	local src = self:acceptToken1("stylesheet")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local name = self:acceptIdentifier()
		do self:parseNewlineToken() end
		do
			local body = self:parseStyleSheetBlock()
			local v = _g.sling.model.StyleSheetDeclarationNode._construct0(_g.sling.model.StyleSheetDeclarationNode._create())
			do v:setSource(src) end
			do v:setName(name) end
			do v:setBody(body, false) end
			do return v end
		end
	end
end

function sling.parser.SlingParser:acceptStyleSheetLiteralExpression()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("stylesheet")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local body = self:acceptStyleSheetBlock()
			if not (body ~= nil) then
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
				local v = _g.sling.model.StyleSheetExpressionNode._construct0(_g.sling.model.StyleSheetExpressionNode._create())
				do v:setSource(src) end
				do v:setBody(body, false) end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:parseStyleSheetBlock()
	local v = self:acceptStyleSheetBlock()
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("style sheet block"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.SlingParser:acceptStyleSheetBlock()
	local src = self:acceptToken2(123)
	if not (src ~= nil) then
		do return nil end
	end
	do self:parseNewlineToken() end
	do
		local v = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
		do v:setSource(src) end
		while true do
			while self:acceptNewlineToken() ~= nil do
			end
			if self:acceptToken2(125) ~= nil then
				do break end
			end
			do
				local dsd = _g.sling.model.StyleSheetRuleNode._construct0(_g.sling.model.StyleSheetRuleNode._create())
				do dsd:addToSelectors(self:parseStyleSheetSelector()) end
				do dsd:setSource(self:getAcceptedToken()) end
				while self:acceptToken2(44) ~= nil do
					do dsd:addToSelectors(self:parseStyleSheetSelector()) end
				end
				do self:parseToken2(123) end
				do self:parseNewlineToken() end
				do
					local body = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
					do dsd:setBody(body, false) end
					while true do
						while self:acceptNewlineToken() ~= nil do
						end
						if self:acceptToken2(125) ~= nil then
							do self:parseEndOfStatementToken() end
							do break end
						end
						do
							local propid = self:parseStyleSheetRulePropertyName()
							local propsrc = self:getAcceptedToken()
							do self:acceptToken2(58) end
							do
								local value = self:parseStyleSheetRulePropertyValue()
								do self:acceptToken2(59) end
								do self:parseNewlineToken() end
								do
									local decl = _g.sling.model.StyleSheetRulePropertyNode._construct0(_g.sling.model.StyleSheetRulePropertyNode._create())
									do decl:setSource(propsrc) end
									do decl:setName(propid) end
									do decl:setValue(value, false) end
									do body:addNode(decl) end
								end
							end
						end
					end
					do v:addNode(dsd) end
				end
			end
		end
		do return v end
	end
end

function sling.parser.SlingParser:acceptTreeDeclaration()
	local src = self:acceptToken1("markup")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local name = self:acceptIdentifier()
		do self:parseNewlineToken() end
		do
			local root = self:parseTreeDeclarationBlock()
			local v = _g.sling.model.TreeDeclarationNode._construct0(_g.sling.model.TreeDeclarationNode._create())
			do v:setSource(src) end
			do v:setName(name) end
			do v:setRoot(root, false) end
			do return v end
		end
	end
end

function sling.parser.SlingParser:acceptTreeLiteralExpression()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("tree")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local root = self:acceptTreeDeclarationBlock()
			if not (root ~= nil) then
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
				local v = _g.sling.model.TreeExpressionNode._construct0(_g.sling.model.TreeExpressionNode._create())
				do v:setSource(src) end
				do v:setRoot(root, false) end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:parseTreeDeclarationBlock()
	local v = self:acceptTreeDeclarationBlock()
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("tree declaration block"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.SlingParser:acceptTreeDeclarationBlock()
	local src = self:acceptToken2(123)
	if not (src ~= nil) then
		do return nil end
	end
	do self:parseEndOfStatementToken() end
	do
		local o = self.acceptNewlinesAsSpaces
		self.acceptNewlinesAsSpaces = true
		do
			local v = _g.sling.model.TreeElementNode._construct0(_g.sling.model.TreeElementNode._create())
			while true do
				if self:acceptToken2(125) ~= nil then
					do break end
				end
				do self:parseTreeElementChild(v) end
			end
			self.acceptNewlinesAsSpaces = o
			do return v end
		end
	end
end

function sling.parser.SlingParser:acceptDeclarationInEntity(addDefaultModifier)
	local currentEntity = self:peekEntity()
	if not (currentEntity ~= nil) then
		currentEntity = _g.sling.model.ClassDeclarationNode._construct0(_g.sling.model.ClassDeclarationNode._create())
		do self:onParseMessage(_g.sling.common.WarningMessage:forText("acceptDeclarationInEntity called with a null currentEntity!", self:getStagingToken())) end
	end
	do
		local ifdef = self:acceptIfdef(_g.sling.parser.SlingParser.NODECONTEXT_ENTITY)
		if ifdef ~= nil then
			do return ifdef end
		end
		do
			local ifndef = self:acceptIfndef(_g.sling.parser.SlingParser.NODECONTEXT_ENTITY)
			if ifndef ~= nil then
				do return ifndef end
			end
			if self:acceptToken1("modifier") ~= nil then
				do return self:parseModifierDeclaration(self:getAcceptedToken()) end
			end
			if self:acceptToken1("depend") ~= nil then
				do return self:parseDependsDeclaration(self:getAcceptedToken()) end
			end
			do
				local imps = self:acceptImportStatement()
				if imps ~= nil then
					do return imps end
				end
				do
					local uses = self:acceptUseStatement()
					if uses ~= nil then
						do return uses end
					end
					if self.acceptDeprecatedConstructs and self:acceptToken1("basetype") ~= nil then
						do self:onParseMessage(_g.sling.common.WarningMessage:forText("Deprecated construct", self:getAcceptedToken())) end
						do return self:parseBaseTypeDeclaration(self:getAcceptedToken()) end
					end
					if self:acceptToken1("is") ~= nil then
						local src = self:getAcceptedToken()
						local sym = self:parseReferenceDataType()
						do self:parseNewlineToken() end
						do
							local btn = _g.sling.model.BaseTypeNode:forType(sym, _g.sling.model.BaseTypeNode.INHERIT_AUTO)
							do btn:setSource(src) end
							do return btn end
						end
					end
					if self:acceptToken1("extend") ~= nil then
						local src = self:getAcceptedToken()
						local sym = self:parseReferenceDataType()
						do self:parseNewlineToken() end
						do
							local btn = _g.sling.model.BaseTypeNode:forType(sym, _g.sling.model.BaseTypeNode.INHERIT_EXTEND)
							do btn:setSource(src) end
							do return btn end
						end
					end
					if self:acceptToken1("implement") ~= nil then
						local src = self:getAcceptedToken()
						local sym = self:parseReferenceDataType()
						do self:parseNewlineToken() end
						do
							local btn = _g.sling.model.BaseTypeNode:forType(sym, _g.sling.model.BaseTypeNode.INHERIT_IMPLEMENT)
							do btn:setSource(src) end
							do return btn end
						end
					end
					if self:acceptToken1("isAlso") ~= nil then
						local src = self:getAcceptedToken()
						local sym = self:parseReferenceDataType()
						do self:parseNewlineToken() end
						do
							local btn = _g.sling.model.BaseTypeNode:forType(sym, _g.sling.model.BaseTypeNode.INHERIT_INFORMATIVE)
							do btn:setSource(src) end
							do return btn end
						end
					end
					do
						local langDeclaration = self:acceptLangDeclaration(false, false)
						if langDeclaration ~= nil then
							do return langDeclaration end
						end
						do
							local uiDecl = self:acceptUiDeclaration()
							if uiDecl ~= nil then
								do return uiDecl end
							end
							do
								local alias = self:acceptTypeAliasDeclaration()
								if alias ~= nil then
									do return alias end
								end
								do
									local r = self:acceptEntityDeclaration(nil)
									if r ~= nil then
										do return r end
									end
									do
										local edesc = self:acceptEntityDeclarationDescription()
										if edesc ~= nil then
											do self:parseNewlineToken() end
										end
										if self:acceptToken1("main") ~= nil then
											local src = self:getAcceptedToken()
											local argsVariableName = "args"
											if self:acceptToken2(40) ~= nil then
												argsVariableName = self:parseIdentifier()
												do self:parseToken2(41) end
											end
											do
												local block = self:parseFunctionBlock(nil)
												local v = _g.sling.model.MainFunctionDeclarationNode._construct0(_g.sling.model.MainFunctionDeclarationNode._create())
												if _g.jk.lang.String:isEmpty(v:getDescription()) then
													do v:setDescription(edesc) end
												end
												do v:setArgumentArrayName(argsVariableName) end
												do v:setSource(src) end
												do v:setBody(block, false) end
												do return v end
											end
										end
										do
											local mlit = self:acceptTreeDeclaration()
											if mlit ~= nil then
												do self:parseEndOfStatementToken() end
												do return mlit end
											end
											do
												local slit = self:acceptStyleSheetDeclaration()
												if slit ~= nil then
													do self:parseEndOfStatementToken() end
													do return slit end
												end
												if _g.sling.util.ModifierUtil:hasAnnotationModifier(currentEntity, "webapi") or _g.sling.util.ModifierUtil:hasAnnotationModifier(currentEntity, "webapi2") then
													local decl = self:acceptWebApiDeclaration(edesc)
													if decl ~= nil then
														do return decl end
													end
												end
												do
													local ctor = self:acceptConstructorDeclaration()
													if ctor ~= nil then
														if _g.jk.lang.String:isEmpty(ctor:getDescription()) then
															do ctor:setDescription(edesc) end
														end
														do return ctor end
													end
													do
														local dtor = self:acceptDestructorDeclaration()
														if dtor ~= nil then
															if _g.jk.lang.String:isEmpty(dtor:getDescription()) then
																do dtor:setDescription(edesc) end
															end
															do return dtor end
														end
														do
															local mm = self:acceptMacroDeclaration()
															if mm ~= nil then
																if _g.jk.lang.String:isEmpty(mm:getDescription()) then
																	do mm:setDescription(edesc) end
																end
																do return mm end
															end
															do
																local ff = self:acceptFunctionDeclarationStatement(nil)
																if ff ~= nil then
																	if _g.jk.lang.String:isEmpty(ff:getDescription()) then
																		do ff:setDescription(edesc) end
																	end
																	do return ff end
																end
																do
																	local ibd = self:acceptInitializerBlockDeclaration()
																	if ibd ~= nil then
																		do return ibd end
																	end
																	do
																		local propdec = self:acceptPropertyDeclaration()
																		if propdec ~= nil then
																			if _g.jk.lang.String:isEmpty(propdec:getDescription()) then
																				do propdec:setDescription(edesc) end
																			end
																			do return propdec end
																		end
																		do
																			local indexdec = self:acceptIndexerDeclaration()
																			if indexdec ~= nil then
																				if _g.jk.lang.String:isEmpty(indexdec:getDescription()) then
																					do indexdec:setDescription(edesc) end
																				end
																				do return indexdec end
																			end
																			do
																				local eventdec = self:acceptEventDeclaration()
																				if eventdec ~= nil then
																					if _g.jk.lang.String:isEmpty(eventdec:getDescription()) then
																						do eventdec:setDescription(edesc) end
																					end
																					do return eventdec end
																				end
																				do
																					local vardec = self:acceptEntityVariableDeclaration(addDefaultModifier)
																					if vardec ~= nil then
																						if _g.jk.lang.String:isEmpty(vardec:getDescription()) then
																							do vardec:setDescription(edesc) end
																						end
																						do return vardec end
																					end
																					do
																						local sbd = self:acceptStaticBlockDeclaration()
																						if sbd ~= nil then
																							do return sbd end
																						end
																						do
																							local bvd = self:acceptEntityBlockDeclaration()
																							if bvd ~= nil then
																								do return bvd end
																							end
																							do
																								local region = self:acceptRegionDeclaration(_g.sling.parser.SlingParser.NODECONTEXT_ENTITY)
																								if region ~= nil then
																									do return region end
																								end
																								do return nil end
																							end
																						end
																					end
																				end
																			end
																		end
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

function sling.parser.SlingParser:parse()
	local nodes = self:parseFlatBlockInContext(_g.sling.parser.SlingParser.NODECONTEXT_FILE, false)
	if not (nodes ~= nil) then
		do return nil end
	end
	do
		local v = _g.sling.common.CodeFileNode._construct0(_g.sling.common.CodeFileNode._create())
		do v:setFile(self:getCurrentFile()) end
		do
			local array = nodes:exportNodes()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
						if node ~= nil then
							do v:addToNodes(node) end
						end
						do n = n + 1 end
					end
				end
			end
			do
				local fid = self:getCurrentFileIdComplete()
				if _g.jk.lang.String:isNotEmpty(fid) then
					local us = _g.jk.lang.String:getIndexOfCharacter(fid, 64, 0)
					if us > 0 then
						do v:renameNode(_g.jk.lang.String:getSubString(fid, 0, us)) end
						do
							local def = _g.jk.lang.String:getEndOfString(fid, us + 1)
							if _g.jk.lang.String:isNotEmpty(def) then
								local flatblock = _g.sling.model.FlatBlockNode._construct0(_g.sling.model.FlatBlockNode._create())
								local array2 = v:exportNodes()
								if array2 ~= nil then
									local n2 = 0
									local m2 = _g.jk.lang.Vector:getSize(array2)
									do
										n2 = 0
										while n2 < m2 do
											local node = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.common.NodeObject')
											if node ~= nil then
												do flatblock:addNode(node) end
											end
											do n2 = n2 + 1 end
										end
									end
								end
								do
									local cc = _g.sling.model.PreprocessorIsDefinedExpressionNode:forVariable(def)
									local vv = _g.sling.model.PreprocessorIfStatementNode:instance(cc, flatblock, nil)
									do vv:setSource(v:getSource()) end
									do v:addToNodes(vv) end
								end
							end
						end
					else
						do v:renameNode(fid) end
					end
				end
				do return v end
			end
		end
	end
end

function sling.parser.SlingParser:parseAsStatements()
	do return self:parseFlatBlockInContext(_g.sling.parser.SlingParser.NODECONTEXT_STATEMENTBLOCK, false) end
end

function sling.parser.SlingParser:parseAsEntityDeclarations()
	do return self:parseFlatBlockInContext(_g.sling.parser.SlingParser.NODECONTEXT_ENTITY, false) end
end

function sling.parser.SlingParser:parseAsNamespaceDeclarations()
	do return self:parseFlatBlockInContext(_g.sling.parser.SlingParser.NODECONTEXT_NAMESPACE, false) end
end

function sling.parser.SlingParser:parseFileAsStatements(file)
	do self:initializeForFile(file) end
	do return self:parseAsStatements() end
end

function sling.parser.SlingParser:parseStringAsStatements(data, dataName)
	do self:initializeForString(data, dataName) end
	do return self:parseAsStatements() end
end

function sling.parser.SlingParser:parseFileAsEntityDeclarations(file)
	do self:initializeForFile(file) end
	do return self:parseAsEntityDeclarations() end
end

function sling.parser.SlingParser:parseStringAsEntityDeclarations(data, dataName)
	do self:initializeForString(data, dataName) end
	do return self:parseAsEntityDeclarations() end
end

function sling.parser.SlingParser:parseStringAsNamespaceDeclarations(data, dataName)
	do self:initializeForString(data, dataName) end
	do return self:parseAsNamespaceDeclarations() end
end

function sling.parser.SlingParser:parseFileAsNamespaceDeclarations(file)
	do self:initializeForFile(file) end
	do return self:parseAsNamespaceDeclarations() end
end

function sling.parser.SlingParser:parseFileInContext(file, context)
	do self:initializeForFile(file) end
	do return self:parseFlatBlockInContext(context, false) end
end

function sling.parser.SlingParser:getCurrentEntityName()
	do return self.currentEntityName end
end

function sling.parser.SlingParser:setCurrentEntityName(v)
	self.currentEntityName = v
	do return self end
end

function sling.parser.SlingParser:getShowFixmeWarnings()
	do return self.showFixmeWarnings end
end

function sling.parser.SlingParser:setShowFixmeWarnings(v)
	self.showFixmeWarnings = v
	do return self end
end

function sling.parser.SlingParser:getAcceptDeprecatedConstructs()
	do return self.acceptDeprecatedConstructs end
end

function sling.parser.SlingParser:setAcceptDeprecatedConstructs(v)
	self.acceptDeprecatedConstructs = v
	do return self end
end

sling.parser.PlingParser = _g.sling.common.LiveTokenizingParser._create()
sling.parser.PlingParser.__index = sling.parser.PlingParser
_vm:set_metatable(sling.parser.PlingParser, {
	__index = _g.sling.common.LiveTokenizingParser
})

function sling.parser.PlingParser._create()
	local v = _vm:set_metatable({}, sling.parser.PlingParser)
	return v
end

function sling.parser.PlingParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.parser.PlingParser'
	self['_isType.sling.parser.PlingParser'] = true
	self.ctx = nil
end

function sling.parser.PlingParser:_construct0()
	sling.parser.PlingParser._init(self)
	do _g.sling.common.LiveTokenizingParser._construct0(self) end
	return self
end

function sling.parser.PlingParser:_construct1(ctx)
	sling.parser.PlingParser._init(self)
	do _g.sling.common.LiveTokenizingParser._construct0(self) end
	self.ctx = ctx
	return self
end

function sling.parser.PlingParser:acceptImmediateCommentToken()
	do return self:acceptImmediateSlashAsteriskCommentToken() end
end

function sling.parser.PlingParser:isValidIdentifierPrefix(c)
	do return c == 95 or _g.jk.lang.Character:isAlpha(c) end
end

function sling.parser.PlingParser:isValidIdentifierCharacter(c)
	do return c == 95 or c == 46 or _g.jk.lang.Character:isAlnum(c) end
end

function sling.parser.PlingParser:isSpaceCharacter(n)
	if n == 10 then
		do return false end
	end
	do return _g.sling.common.LiveTokenizingParser.isSpaceCharacter(self, n) end
end

function sling.parser.PlingParser:acceptNewLine()
	do return self:acceptToken2(10) ~= nil end
end

function sling.parser.PlingParser:acceptMultipleNewLine()
	while self:acceptNewLine() do
	end
end

function sling.parser.PlingParser:acceptIndex()
	if not (self:acceptToken2(91) ~= nil) then
		do return nil end
	end
	do
		local v = self:parseStringLiteral()
		do self:parseToken2(93) end
		do return v end
	end
end

function sling.parser.PlingParser:parseOperator()
	local app = self:acceptString("+=")
	if app ~= nil then
		do return app end
	end
	do
		local eql = self:acceptString("=")
		if eql ~= nil then
			do return eql end
		end
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("either `=' or `+='"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
		do return nil end
	end
end

function sling.parser.PlingParser:acceptStringLiteral()
	local v = self:acceptDoubleQuotedStringToken(92, true)
	if not (v ~= nil) then
		do return nil end
	end
	do return _g.sling.common.CodeStringUtil:unescapeStringLiteralCStyle(v:getValue(), true) end
end

function sling.parser.PlingParser:parseStringLiteral()
	local v = self:acceptStringLiteral()
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("string literal"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.PlingParser:acceptList()
	if not (self:acceptToken2(91) ~= nil) then
		do return nil end
	end
	do self:acceptMultipleNewLine() end
	do
		local d = {}
		if self:acceptToken2(93) ~= nil then
			do return d end
		end
		while true do
			if self:acceptToken2(93) ~= nil then
				do break end
			end
			do self:acceptMultipleNewLine() end
			do
				local v = self:parseValue()
				do _g.jk.lang.Vector:append(d, v) end
				if self:acceptToken2(44) ~= nil then
					goto _continue56
				end
				do self:acceptMultipleNewLine() end
				if self:acceptToken2(93) ~= nil then
					do break end
				end
				do self:skipSpaces() end
				do self:updateStagingToken() end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`,' or `]'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
			end
			::_continue56::
		end
		do return d end
	end
end

function sling.parser.PlingParser:acceptMap()
	if not (self:acceptToken2(123) ~= nil) then
		do return nil end
	end
	do self:acceptMultipleNewLine() end
	do
		local d = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		if self:acceptToken2(125) ~= nil then
			do return d end
		end
		while true do
			if self:acceptToken2(125) ~= nil then
				do break end
			end
			do self:acceptMultipleNewLine() end
			do
				local k = self:parseStringLiteral()
				do self:parseToken2(58) end
				do
					local v = self:parseValue()
					do d:setObject(k, v) end
					if self:acceptToken2(44) ~= nil then
						goto _continue57
					end
					do self:acceptMultipleNewLine() end
					if self:acceptToken2(125) ~= nil then
						do break end
					end
					do self:skipSpaces() end
					do self:updateStagingToken() end
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`,' or `}'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
				end
			end
			::_continue57::
		end
		do return d end
	end
end

function sling.parser.PlingParser:acceptValue()
	local str = self:acceptStringLiteral()
	if str ~= nil then
		do return str end
	end
	do
		local lst = self:acceptList()
		if lst ~= nil then
			do return lst end
		end
		do
			local map = self:acceptMap()
			if map ~= nil then
				do return map end
			end
			do return nil end
		end
	end
end

function sling.parser.PlingParser:parseValue()
	local v = self:acceptValue()
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Invalid value", self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.parser.PlingParser:parseConfiguration()
	local data = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	while true do
		do self:acceptMultipleNewLine() end
		do
			local comment = self:acceptCommentString()
			if comment ~= nil then
				goto _continue58
			end
			if self:acceptEOF() ~= nil then
				do break end
			end
			do
				local id = self:parseIdentifier()
				local ix = self:acceptIndex()
				local op = self:parseOperator()
				local vv = self:parseValue()
				do self:acceptMultipleNewLine() end
				if ix == nil then
					if op == "=" then
						do data:setObject(id, vv) end
					elseif op == "+=" then
						local cc = data:getVector(id)
						if cc == nil then
							cc = {}
							do data:setObject(id, cc) end
						end
						do _g.jk.lang.Vector:append(cc, vv) end
					end
				else
					local d = _vm:to_table_with_key(data:get(id), '_isType.jk.lang.DynamicMap')
					if d == nil then
						d = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
						do data:setObject(id, d) end
					end
					if op == "=" then
						do d:setObject(ix, vv) end
					elseif op == "+=" then
						local cc = d:getVector(ix)
						if cc == nil then
							cc = {}
							do d:setObject(ix, cc) end
						end
						do _g.jk.lang.Vector:append(cc, vv) end
					end
				end
			end
		end
		::_continue58::
	end
	do return data end
end

function sling.parser.PlingParser:parseFileAsMap(file)
	if not (file ~= nil) then
		do return nil end
	end
	if file:hasExtension("slon") then
		local v = _vm:to_table_with_key(_g.jk.slon.SLONParser:parseFile(file), '_isType.jk.lang.DynamicMap')
		if not (v ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported file format: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(file)) .. "'", nil, nil))
		end
		do return v end
	end
	do self:initializeForFile(file) end
	do return self:parseConfiguration() end
end

function sling.parser.PlingParser:parseFileAsUnitSettings(file, baseOptions, customOptions)
	local data = self:parseFileAsMap(file)
	local v = baseOptions
	if v ~= nil then
		do v:mergeFrom(data) end
	else
		v = data
	end
	do v:mergeFrom(customOptions) end
	do return self:createSettingsForMap(v) end
end

function sling.parser.PlingParser:createSettings()
	local v = _g.sling.model.ext.NSlingUnitSettings._construct0(_g.sling.model.ext.NSlingUnitSettings._create())
	do v:setUseJkop(true) end
	do return v end
end

function sling.parser.PlingParser:createSettingsForMap(data)
	local v = self:createSettings()
	if not (data ~= nil) then
		do return v end
	end
	if self.ctx ~= nil and self.ctx:isInDebugMode() then
		do _g.jk.log.Log:debug(self.ctx, "createSettingsForMap: `" .. _g.jk.lang.String:safeString(_g.jk.json.JSONEncoder:encode(data, false, false)) .. "'") end
	end
	do
		local iter = data:iterate()
		while iter ~= nil do
			local key = iter:next()
			if not (key ~= nil) then
				do break end
			end
			if key == "vendorId" then
				do v:setVendorId(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "projectVersion" or key == "version" then
				do v:setProjectVersion(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "projectId" then
				do v:setProjectId(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "projectTitle" or key == "title" then
				do v:setProjectTitle(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "projectDescription" or key == "description" then
				do v:setProjectDescription(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "projectCopyright" or key == "copyright" then
				do v:setProjectCopyright(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "projectLicense" or key == "license" then
				do v:setProjectLicense(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "moduleId" then
				do v:setModuleId(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "moduleTitle" then
				do v:setModuleTitle(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "moduleDescription" then
				do v:setModuleDescription(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "useJkop" then
				do v:setUseJkop(data:getBoolean(key, false)) end
				goto _continue59
			end
			if key == "imports" then
				do v:setImports(data:getVector(key)) end
				goto _continue59
			end
			if key == "defines" then
				do v:setDefines(data:getDynamicMap(key)) end
				goto _continue59
			end
			if key == "ignoreModuleIdInNamespace" then
				do v:setIgnoreModuleIdInNamespace(data:getBoolean(key, false)) end
				goto _continue59
			end
			if key == "libraries" then
				do v:setLibraries(data:getVector(key)) end
				goto _continue59
			end
			if key == "libraryRepositories" then
				do _g.jk.log.Log:warning(self.ctx, "Ignoring obsolete directive `libraryRepositories'") end
				goto _continue59
			end
			if key == "preFilters" then
				do _g.jk.log.Log:warning(self.ctx, "Ignoring obsolete directive `preFilters'") end
				goto _continue59
			end
			if key == "resources" then
				local array = data:getVector(key)
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local rstr = (function(o)
								if (_vm:get_variable_type(o) == 'string') then
									do return o end
								end
								do return nil end
							end)(array[n + 1])
							if rstr ~= nil then
								if _g.jk.lang.String:isEmpty(rstr) then
									goto _continue60
								end
								do
									local file = self:getRelativeFile(rstr)
									if not file:isFile() and not file:isDirectory() then
										goto _continue60
									end
									do
										local condition = nil
										local ii = _g.jk.lang.String:getLastIndexOfCharacter(rstr, 63, -1)
										if ii >= 0 then
											condition = _g.jk.lang.String:getEndOfString(rstr, ii + 1)
											rstr = _g.jk.lang.String:getSubString(rstr, 0, ii)
										end
										if file:isFile() then
											local sr = _g.sling.model.ResourceFileNode._construct0(_g.sling.model.ResourceFileNode._create())
											do sr:setSource(_g.sling.common.StaticSourceReference:forFile(file)) end
											do sr:setFile(file) end
											do sr:setCondition(condition) end
											do v:addToResources(sr) end
										elseif file:isDirectory() then
											local iter = file:entries()
											while iter ~= nil do
												local f = iter:next()
												if not (f ~= nil) then
													do break end
												end
												if f:isFile() then
													local sr = _g.sling.model.ResourceFileNode._construct0(_g.sling.model.ResourceFileNode._create())
													do sr:setSource(_g.sling.common.StaticSourceReference:forFile(f)) end
													do sr:setFile(f) end
													do sr:setCondition(condition) end
													do v:addToResources(sr) end
												end
											end
										else
											do self:onParseMessage(_g.sling.common.WarningMessage:forText("Invalid resource file `" .. _g.jk.lang.String:safeString(rstr) .. "' ", self:getStagingToken())) end
										end
									end
								end
							end
							::_continue60::
							do n = n + 1 end
						end
					end
				end
				goto _continue59
			end
			if key == "androidProjectId" then
				do v:setAndroidProjectId(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "androidVersion" then
				do v:setAndroidVersion(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "androidPackageName" then
				do v:setAndroidPackageName(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "androidMinSdkVersion" then
				do v:setAndroidMinSdkVersion(data:getInteger(key, 0)) end
				goto _continue59
			end
			if key == "androidTargetSdkVersion" then
				do v:setAndroidTargetSdkVersion(data:getInteger(key, 0)) end
				goto _continue59
			end
			if key == "androidToolsVersion" then
				do v:setAndroidToolsVersion(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "androidGradlePluginVersion" then
				do v:setAndroidGradlePluginVersion(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "androidKotlinVersion" then
				do v:setAndroidKotlinVersion(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "androidEnableAndroidJackForLibraries" then
				do v:setAndroidEnableAndroidJackForLibraries(data:getBoolean(key, false)) end
				goto _continue59
			end
			if key == "androidKeyStore" then
				do v:setAndroidKeyStore(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "androidKeyStorePassword" then
				do v:setAndroidKeyStorePassword(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "androidKeyAlias" then
				do v:setAndroidKeyAlias(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "androidKeyAliasPassword" then
				do v:setAndroidKeyAliasPassword(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "androidGoogleServicesVersion" then
				do v:setAndroidGoogleServicesVersion(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "androidMetaData" then
				do v:setAndroidMetaData(data:getDynamicMap(key)) end
				goto _continue59
			end
			if key == "androidManifestCustomXmls" then
				do v:setAndroidManifestCustomXmls(data:getVector(key)) end
				goto _continue59
			end
			if key == "androidManifestApplicationCustomXml" then
				do v:setAndroidManifestApplicationCustomXmls(data:getVector(key)) end
				goto _continue59
			end
			if key == "androidPermissions" then
				do v:setAndroidPermissions(data:getVector(key)) end
				goto _continue59
			end
			if key == "androidFeatures" then
				do v:setAndroidFeatures(data:getVector(key)) end
				goto _continue59
			end
			if key == "androidGradleDepends" then
				do v:setAndroidGradleDepends(data:getVector(key)) end
				goto _continue59
			end
			if key == "androidGradleHeap" then
				do v:setAndroidGradleHeap(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "iosProjectName" then
				do v:setIosProjectName(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "iosVersion" then
				do v:setIosVersion(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "iosDisplayName" then
				do v:setIosDisplayName(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "iosCflags" then
				do v:setIosCflags(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "iosLinkMethod" then
				do v:setIosLinkMethod(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "iosDeploymentTarget" then
				do v:setIosDeploymentTarget(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "iosResultType" then
				do v:setIosResultType(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "iosPods" then
				do v:setIosPods(data:getVector(key)) end
				goto _continue59
			end
			if key == "iosFrameworks" then
				do v:setIosFrameworks(data:getVector(key)) end
				goto _continue59
			end
			if key == "iosLinkLibs" then
				do v:setIosLinkLibs(data:getVector(key)) end
				goto _continue59
			end
			if key == "iosLdFlags" then
				do v:setIosLdFlags(data:getVector(key)) end
				goto _continue59
			end
			if key == "iosPlists" then
				do v:setIosPlists(data:getVector(key)) end
				goto _continue59
			end
			if key == "iosInfoPlistData" then
				do v:setIosInfoPlistData(data:getVector(key)) end
				goto _continue59
			end
			if key == "iosScreenOrientation" then
				do v:setIosScreenOrientation(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "mavenArtifactId" then
				do v:setMavenArtifactId(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "mavenGroupId" then
				do v:setMavenGroupId(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "mavenVersion" then
				do v:setMavenVersion(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "mavenName" then
				do v:setMavenName(data:getString(key, nil)) end
				goto _continue59
			end
			if key == "npmPackageJson" then
				do v:setNpmPackageJson(data:getDynamicMap(key)) end
				goto _continue59
			end
			if key == "npmAngularJson" then
				do v:setNpmAngularJson(data:getDynamicMap(key)) end
				goto _continue59
			end
			if key == "npmTsconfigJson" then
				do v:setNpmTsconfigJson(data:getDynamicMap(key)) end
				goto _continue59
			end
			if key == "npmTslintJson" then
				do v:setNpmTslintJson(data:getDynamicMap(key)) end
				goto _continue59
			end
			::_continue59::
		end
		do return v end
	end
end

sling.parser.SlingParserUtil = {}
sling.parser.SlingParserUtil.__index = sling.parser.SlingParserUtil
_vm:set_metatable(sling.parser.SlingParserUtil, {})

function sling.parser.SlingParserUtil._create()
	local v = _vm:set_metatable({}, sling.parser.SlingParserUtil)
	return v
end

function sling.parser.SlingParserUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.parser.SlingParserUtil'
	self['_isType.sling.parser.SlingParserUtil'] = true
end

function sling.parser.SlingParserUtil:_construct0()
	sling.parser.SlingParserUtil._init(self)
	return self
end

function sling.parser.SlingParserUtil:parseString(ctx, program, filename)
	local parser = _g.sling.parser.SlingParser._construct0(_g.sling.parser.SlingParser._create())
	do parser:setCtx(ctx) end
	do return parser:parseString(program, filename) end
end

function sling.parser.SlingParserUtil:parseFile(ctx, program)
	local parser = _g.sling.parser.SlingParser._construct0(_g.sling.parser.SlingParser._create())
	do parser:setCtx(ctx) end
	do return parser:parseFile(program) end
end

function sling.parser.SlingParserUtil:cleanComment(comment)
	if not (comment ~= nil) then
		do return nil end
	end
	if _g.jk.lang.String:startsWith(comment, "//", 0) then
		do return _g.jk.lang.String:stripFromEnd(_g.jk.lang.String:getEndOfString(comment, 2)) end
	end
	if _g.jk.lang.String:startsWith(comment, "/*", 0) == false or _g.jk.lang.String:endsWith(comment, "*/") == false then
		do return comment end
	end
	do
		local m = _g.jk.lang.String:getLength(comment) - 4
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local it = _g.jk.lang.String:iterate(comment)
		local n = 2
		local newline = true
		local blank = false
		do it:getNextChar() end
		do it:getNextChar() end
		while n <= m do
			local c = it:getNextChar()
			do n = n + 1 end
			if c < 1 then
				do break end
			end
			if c == 13 then
				goto _continue61
			end
			if sb:count() < 1 and c == 10 then
				goto _continue61
			end
			if newline then
				if c == 32 or c == 9 or c == 42 then
					goto _continue61
				end
				newline = false
			end
			do sb:appendCharacter(c) end
			if c == 10 then
				newline = true
			end
			if c == 32 or c == 9 or c == 10 then
				blank = true
			else
				blank = false
			end
			::_continue61::
		end
		do
			local v = sb:toString()
			if blank then
				v = _g.jk.lang.String:strip(v)
			end
			do return v end
		end
	end
end
