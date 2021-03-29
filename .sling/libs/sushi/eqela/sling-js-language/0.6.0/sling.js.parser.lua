sling = sling or {}

sling.js = sling.js or {}

sling.js.parser = sling.js.parser or {}

sling.js.parser.JSParser = _g.sling.common.CodeParser._create()
sling.js.parser.JSParser.__index = sling.js.parser.JSParser
_vm:set_metatable(sling.js.parser.JSParser, {
	__index = _g.sling.common.CodeParser
})

sling.js.parser.JSParser.CONTEXT_COMMON = 0
sling.js.parser.JSParser.CONTEXT_BLOCK_SCOPE = 1
sling.js.parser.JSParser.CONTEXT_TOP_LEVEL = 2

function sling.js.parser.JSParser._create()
	local v = _vm:set_metatable({}, sling.js.parser.JSParser)
	return v
end

function sling.js.parser.JSParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.parser.JSParser'
	self['_isType.sling.js.parser.JSParser'] = true
	self.supportTypeScript = true
	self.acceptAngularPiping = false
	self.reservedWords = nil
end

function sling.js.parser.JSParser:_construct0()
	sling.js.parser.JSParser._init(self)
	do _g.sling.common.CodeParser._construct0(self) end
	do self:setImproperCommentPolicy(_g.sling.common.LiveTokenizingParser.IMPROPER_COMMENT_QUEUE) end
	return self
end

function sling.js.parser.JSParser:acceptEndOfFile()
	do self:skipSpaces() end
	do return self:acceptEOF() end
end

function sling.js.parser.JSParser:isValidIdentifierPrefix(c)
	do return c == 36 or c == 95 or _g.sling.js.parser.UnicodeCharacter:isIDStartCharacter(c) end
end

function sling.js.parser.JSParser:isValidIdentifierCharacter(c)
	do return c == 36 or c == 95 or _g.sling.js.parser.UnicodeCharacter:isIDContinueCharacter(c) or c == 8204 or c == 8205 end
end

function sling.js.parser.JSParser:acceptModifiers(annotationOnly)
	local v = nil
	while true do
		local ant = self:acceptAnnotationModifier()
		if ant ~= nil then
			if not (v ~= nil) then
				v = {}
			end
			do _g.jk.lang.Vector:append(v, ant) end
			goto _continue1
		end
		if not annotationOnly then
			local mod = self:acceptModifier()
			if mod ~= nil then
				if not (v ~= nil) then
					v = {}
				end
				do _g.jk.lang.Vector:append(v, _g.sling.model.CommonModifierNode:forType(mod)) end
				goto _continue1
			end
		end
		do break end
		::_continue1::
	end
	do return v end
end

function sling.js.parser.JSParser:acceptModifier()
	if self:acceptToken2(42) ~= nil then
		do return _g.sling.js.model.JSModifier.GENERATOR end
	end
	if self:acceptToken1("async") ~= nil then
		do return _g.sling.model.Modifier.ASYNCHRONOUS end
	end
	if self:acceptToken1("default") ~= nil then
		do return _g.sling.js.model.JSModifier.DEFAULT end
	end
	if self:acceptToken1("static") ~= nil then
		do return _g.sling.model.Modifier.STATIC end
	end
	if self:acceptToken1("await") ~= nil then
		do return _g.sling.js.model.JSModifier.AWAIT end
	end
	if self.supportTypeScript then
		if self:acceptToken1("public") ~= nil then
			do return _g.sling.model.Modifier.PUBLIC end
		end
		if self:acceptToken1("protected") ~= nil then
			do return _g.sling.model.Modifier.PROTECTED end
		end
		if self:acceptToken1("private") ~= nil then
			do return _g.sling.model.Modifier.PRIVATE end
		end
		if self:acceptToken1("abstract") ~= nil then
			do return _g.sling.model.Modifier.ABSTRACT end
		end
		if self:acceptToken1("readonly") ~= nil then
			do return _g.sling.model.Modifier.READONLY end
		end
		if self:acceptToken1("declare") ~= nil then
			do return _g.sling.model.Modifier.GLOBAL end
		end
	end
	do return nil end
end

function sling.js.parser.JSParser:acceptAnnotationModifier()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken2(64)
		if not (src ~= nil) then
			do return nil end
		end
		do
			local idt = self:acceptIdentifier()
			if not (idt ~= nil) then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return nil end
			end
			if not (self:acceptToken2(40) ~= nil) then
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
				local prm = {}
				while true do
					local exp = self:acceptExpression(false)
					if exp ~= nil then
						do _g.jk.lang.Vector:append(prm, exp) end
					end
					if self:acceptToken2(44) ~= nil then
						goto _continue2
					end
					if self:acceptToken2(41) ~= nil then
						do break end
					end
					do self:skipSpaces() end
					do self:updateStagingToken() end
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`,' or `)'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
					::_continue2::
				end
				do
					local v = _g.sling.model.AnnotationModifierNode._construct0(_g.sling.model.AnnotationModifierNode._create())
					do v:setText(idt) end
					do v:setExpressions(prm, false) end
					do v:setSource(src) end
					do return v end
				end
			end
		end
	end
end

function sling.js.parser.JSParser:acceptStringLiteralExpression()
	local dqt = self:acceptDoubleQuotedStringToken(92, false)
	if dqt ~= nil then
		local v = _g.sling.model.StringLiteralExpressionNode:forValue(_g.sling.common.CodeStringUtil:unescapeStringLiteralCStyle(dqt.value, true))
		do v:setSource(dqt) end
		do return v end
	end
	do
		local sdt = self:acceptSingleQuotedStringToken()
		if sdt ~= nil then
			local v = _g.sling.model.StringLiteralExpressionNode:forValue(_g.sling.common.CodeStringUtil:unescapeStringLiteralCStyle(sdt.value, true))
			do v:setSource(sdt) end
			do return v end
		end
		do return nil end
	end
end

function sling.js.parser.JSParser:acceptTemplateLiteral()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local tag = self:acceptReferenceDataType()
		local backTick = self:acceptBacktickQuotedStringToken()
		if backTick ~= nil then
			local v = _g.sling.js.model.TemplateLiteralExpressionNode:forValue(_g.sling.common.CodeStringUtil:unescapeStringLiteralCStyle(backTick.value, true))
			do v:setSource(backTick) end
			if tag ~= nil then
				do v:setTag(tag) end
			end
			do return v end
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

function sling.js.parser.JSParser:acceptImmediateCommentToken()
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

function sling.js.parser.JSParser:cleanComment(comment)
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
				goto _continue3
			end
			if sb:count() < 1 and c == 10 then
				goto _continue3
			end
			if newline then
				if c == 32 or c == 9 or c == 42 then
					goto _continue3
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
			::_continue3::
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

function sling.js.parser.JSParser:acceptComment()
	local comment = self:acceptCommentToken()
	if not (comment ~= nil) then
		do return nil end
	end
	do
		local str = comment:getValue()
		if not (str ~= nil) then
			str = ""
		end
		do
			local text = _g.sling.js.parser.JSParser:cleanComment(str)
			local nn = _g.sling.model.CommentNode:forText(text, false)
			if _g.jk.lang.String:getIndexOfCharacter(str, 10, 0) >= 0 then
				do nn:setSubstantial(true) end
			end
			do nn:setSource(comment) end
			do return nn end
		end
	end
end

function sling.js.parser.JSParser:parseStringLiteralExpression()
	local v = self:acceptStringLiteralExpression()
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("string literal"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.js.parser.JSParser:acceptReferenceDataType()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = nil
		local ids = nil
		while true do
			local id = self:acceptIdentifierToken()
			if not (id ~= nil) then
				do break end
			end
			if not not self:isReservedWord(id.value) then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
				do return nil end
			end
			if not (src ~= nil) then
				src = id
			end
			if not (ids ~= nil) then
				ids = {}
			end
			if self.supportTypeScript then
				if self:acceptToken2(60) ~= nil then
					local gts = {}
					while true do
						local dtp = self:acceptDataType()
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
						do _g.jk.lang.Vector:append(gts, dtp) end
						if not (self:acceptToken2(44) ~= nil) then
							do break end
						end
					end
					if not (self:acceptToken2(62) ~= nil) then
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
						local snc = _g.sling.model.SymbolNameComponentNode._construct0(_g.sling.model.SymbolNameComponentNode._create())
						do snc:setSource(id) end
						do snc:setName(id.value) end
						do snc:setTypeParameters(gts, false) end
						do _g.jk.lang.Vector:append(ids, snc) end
					end
				else
					do _g.jk.lang.Vector:append(ids, id.value) end
				end
			else
				do _g.jk.lang.Vector:append(ids, id.value) end
			end
			if self:acceptToken2(46) ~= nil then
				goto _continue4
			end
			do break end
			::_continue4::
		end
		if not (src ~= nil) then
			do return nil end
		end
		if not (ids ~= nil) then
			do return nil end
		end
		do
			local v = _g.sling.model.ReferenceDataTypeNode:forVectorOfNames(ids)
			do v:setSource(src) end
			do return v end
		end
	end
end

function sling.js.parser.JSParser:acceptFunctionDataType()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local prm = self:acceptFunctionDeclarationParameters(false)
		if not (prm ~= nil) then
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
			do return nil end
		end
		if not (self:acceptToken1("=>") ~= nil) then
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
			local rtp = self:acceptDataType()
			if not (rtp ~= nil) then
				rtp = _g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create())
			end
			do
				local fdc = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
				do fdc:setParameters(prm, false) end
				do fdc:setReturnType(rtp, false) end
				do return _g.sling.model.FunctionDataTypeNode:forFunction(fdc) end
			end
		end
	end
end

function sling.js.parser.JSParser:parseReferenceDataType()
	local v = self:acceptReferenceDataType()
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("reference data type"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.js.parser.JSParser:acceptPrimaryDataType()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		if self:acceptToken1("null") ~= nil then
			do return _g.sling.model.NullDataTypeNode._construct0(_g.sling.model.NullDataTypeNode._create()) end
		end
		if self:acceptToken1("undefined") ~= nil then
			do return _g.sling.js.model.UndefinedDataTypeNode._construct0(_g.sling.js.model.UndefinedDataTypeNode._create()) end
		end
		if self:acceptToken1("string") ~= nil then
			do return _g.sling.model.StringDataTypeNode._construct0(_g.sling.model.StringDataTypeNode._create()) end
		end
		if self:acceptToken1("boolean") ~= nil then
			do return _g.sling.model.BooleanDataTypeNode._construct0(_g.sling.model.BooleanDataTypeNode._create()) end
		end
		if self:acceptToken1("number") ~= nil then
			do return _g.sling.js.model.NumberDataTypeNode._construct0(_g.sling.js.model.NumberDataTypeNode._create()) end
		end
		if self:acceptToken1("any") ~= nil then
			do return _g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create()) end
		end
		if self:acceptToken1("object") ~= nil or self:acceptToken1("{}") ~= nil then
			do return _g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create()) end
		end
		if self:acceptToken1("void") ~= nil then
			do return _g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()) end
		end
		if self:acceptToken2(91) ~= nil then
			local tps = {}
			while true do
				local type = self:acceptDataType()
				if not (type ~= nil) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				do _g.jk.lang.Vector:append(tps, type) end
				if self:acceptToken2(44) ~= nil then
					goto _continue5
				end
				if self:acceptToken2(93) ~= nil then
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
				::_continue5::
			end
			do return _g.sling.model.TupleDataTypeNode:forTypes(tps) end
		end
		if self.supportTypeScript then
			local olt = self:acceptObjectLiteralExpression()
			if olt ~= nil then
				local odt = _g.sling.model.ExpressionDataTypeNode._construct0(_g.sling.model.ExpressionDataTypeNode._create())
				do odt:setExpression(olt, false) end
				do return odt end
			end
			do
				local slt = self:acceptStringLiteralExpression()
				if slt ~= nil then
					local sdt = _g.sling.model.ExpressionDataTypeNode._construct0(_g.sling.model.ExpressionDataTypeNode._create())
					do sdt:setExpression(slt, false) end
					do return sdt end
				end
				do
					local nlt = self:acceptNumberLiteralExpression()
					if nlt ~= nil then
						local ndt = _g.sling.model.ExpressionDataTypeNode._construct0(_g.sling.model.ExpressionDataTypeNode._create())
						do ndt:setExpression(nlt, false) end
						do return ndt end
					end
					do
						local blt = self:acceptBooleanLiteralExpression()
						if blt ~= nil then
							local bdt = _g.sling.model.ExpressionDataTypeNode._construct0(_g.sling.model.ExpressionDataTypeNode._create())
							do bdt:setExpression(blt, false) end
							do return bdt end
						end
						do
							local fdt = self:acceptFunctionDataType()
							if fdt ~= nil then
								do return fdt end
							end
						end
					end
				end
			end
		end
		do
			local rdt = self:acceptReferenceDataType()
			if rdt ~= nil then
				do return rdt end
			end
			do return nil end
		end
	end
end

function sling.js.parser.JSParser:acceptArrayDataType()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local prm = self:acceptPrimaryDataType()
		if not (prm ~= nil) then
			do return nil end
		end
		do
			local src = prm:getSource()
			if self.supportTypeScript then
				while self:acceptToken2(91) ~= nil do
					if not (self:acceptToken2(93) ~= nil) then
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
						do return nil end
					end
					prm = _g.sling.model.StaticArrayDataTypeNode:forPrimaryType(prm, nil)
					do prm:setSource(src) end
				end
			end
			if self:peekToken2(58) then
				self.currentTokenColumn = ctc
				self.currentTokenLine = ctl
				do self.iterator:setCurrentPosition(ctp) end
				while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
					do self.commentQueue:pop() end
				end
				self.previousToken = cpt
			end
			do return prm end
		end
	end
end

function sling.js.parser.JSParser:acceptDataType()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local prm = self:acceptArrayDataType()
		if not (prm ~= nil) then
			do return nil end
		end
		do
			local src = prm:getSource()
			if self.supportTypeScript then
				if self:acceptToken2(124) ~= nil then
					local dts = {}
					do _g.jk.lang.Vector:append(dts, prm) end
					while true do
						local ndt = self:acceptArrayDataType()
						if not (ndt ~= nil) then
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
						end
						do _g.jk.lang.Vector:append(dts, ndt) end
						if self:acceptToken2(124) ~= nil then
							goto _continue6
						end
						do break end
						::_continue6::
					end
					do
						local mdt = _g.sling.model.MultipleDataTypeNode._construct0(_g.sling.model.MultipleDataTypeNode._create())
						do mdt:setTypes(dts, false) end
						do mdt:setSource(src) end
						prm = mdt
					end
				end
			end
			do return prm end
		end
	end
end

function sling.js.parser.JSParser:parseDataType()
	local v = self:acceptDataType()
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("data type"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.js.parser.JSParser:acceptDeclarationDataType(defaultToAutomatic)
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local type = nil
		if self.supportTypeScript then
			if not (self:acceptToken2(58) ~= nil) then
				do return nil end
			end
			type = self:acceptDataType()
			if not (type ~= nil) then
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
		if not (type ~= nil) and defaultToAutomatic then
			type = _g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create())
		end
		do return type end
	end
end

function sling.js.parser.JSParser:acceptSymbolExpression()
	local id = self:acceptIdentifierToken()
	if id ~= nil then
		local ctc = self.currentTokenColumn
		local ctl = self.currentTokenLine
		local ctp = self.iterator:getCurrentPosition()
		local cqs = 0
		if self.commentQueue ~= nil then
			cqs = self.commentQueue:getSize()
		end
		do
			local cpt = self.previousToken
			local ss = _g.sling.model.SymbolNode._construct0(_g.sling.model.SymbolNode._create())
			local sn = _g.sling.model.SymbolNameComponentNode:forName(id.value)
			do ss:addToComponents(sn) end
			if self.supportTypeScript and self:peekToken2(60) then
				do self:getNextCharacter() end
				while true do
					local tp = self:acceptDataType()
					if not (tp ~= nil) then
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
						do break end
					end
					do sn:addToTypeParameters(tp) end
					if self:acceptToken2(44) ~= nil then
						goto _continue7
					end
					if self:acceptToken2(62) ~= nil then
						do break end
					end
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do break end
					::_continue7::
				end
			end
			do
				local v = _g.sling.model.SymbolExpressionNode:forSymbol(ss)
				do v:setSource(id) end
				do return v end
			end
		end
	end
	do return nil end
end

function sling.js.parser.JSParser:parseSymbolExpression()
	local v = self:acceptSymbolExpression()
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("symbol expression"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.js.parser.JSParser:acceptExpressions20()
	if self:acceptToken1("this") ~= nil then
		local v = _g.sling.model.CurrentObjectExpressionNode._construct0(_g.sling.model.CurrentObjectExpressionNode._create())
		do v:setSource(self:getAcceptedToken()) end
		do return v end
	end
	if self:acceptToken1("super") ~= nil then
		local v = _g.sling.model.BaseClassAccessExpressionNode._construct0(_g.sling.model.BaseClassAccessExpressionNode._create())
		do v:setSource(self:getAcceptedToken()) end
		do return v end
	end
	do
		local arrowfdx = self:acceptArrowFunctionDeclarationExpression()
		if arrowfdx ~= nil then
			do return arrowfdx end
		end
		if self:acceptToken2(40) ~= nil then
			local v = self:parseExpression(false)
			do self:parseToken2(41) end
			do return v end
		end
		do
			local cox = self:acceptCreateObjectExpression()
			if cox ~= nil then
				do return cox end
			end
			do
				local alx = self:acceptArrayLiteralExpression()
				if alx ~= nil then
					do return alx end
				end
				do
					local slit = self:acceptStringLiteralExpression()
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
								local ilit = self:acceptNumberLiteralExpression()
								if ilit ~= nil then
									do return ilit end
								end
								do
									local fdx = self:acceptFunctionDeclarationExpression()
									if fdx ~= nil then
										do return fdx end
									end
									do
										local odx = self:acceptObjectLiteralExpression()
										if odx ~= nil then
											do return odx end
										end
										do
											local backtick = self:acceptTemplateLiteral()
											if backtick ~= nil then
												do return backtick end
											end
											do
												local regex = self:acceptRegularExpressionLiteralExpression()
												if regex ~= nil then
													do return regex end
												end
												do
													local classExp = self:acceptClassDeclarationExpressionNode()
													if classExp ~= nil then
														do return classExp end
													end
													do
														local symx = self:acceptSymbolExpression()
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
				end
			end
		end
	end
end

function sling.js.parser.JSParser:getReservedWords()
	if not (self.reservedWords ~= nil) then
		self.reservedWords = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
		do
			local words = {
				"break",
				"do",
				"in",
				"typeof",
				"case",
				"else",
				"instanceof",
				"var",
				"catch",
				"export",
				"new",
				"void",
				"class",
				"extends",
				"return",
				"while",
				"const",
				"finally",
				"super",
				"with",
				"continue",
				"for",
				"switch",
				"yield",
				"debugger",
				"function",
				"default",
				"if",
				"throw",
				"delete",
				"import",
				"try"
			}
			if words ~= nil then
				local n = 0
				local m = #words
				do
					n = 0
					while n < m do
						local word = words[n + 1]
						if word ~= nil then
							do self.reservedWords:add(word) end
						end
						do n = n + 1 end
					end
				end
			end
		end
	end
	do return self.reservedWords end
end

function sling.js.parser.JSParser:isReservedWord(name)
	do return self:getReservedWords():contains(name) end
end

function sling.js.parser.JSParser:acceptCreateObjectExpression()
	local src = self:acceptToken1("new")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local rdt = self:acceptReferenceDataType()
		local v = _g.sling.model.CreateObjectExpressionNode:forType(rdt)
		do v:setSource(src) end
		if not (rdt ~= nil) then
			do v:setTypeExpression(self:parseExpression(false), false) end
		end
		if self:acceptToken2(40) ~= nil then
			if not (self:acceptToken2(41) ~= nil) then
				while true do
					local xpr = self:parseExpression(false)
					do v:addToParameters(xpr) end
					if self:acceptToken2(44) ~= nil then
						goto _continue8
					end
					if self:acceptToken2(41) ~= nil then
						do break end
					end
					do self:skipSpaces() end
					do self:updateStagingToken() end
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`,' or `)'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
					::_continue8::
				end
			else
				do v:setParameters({}, false) end
			end
		end
		do return v end
	end
end

function sling.js.parser.JSParser:acceptObjectLiteralExpression()
	local v = {}
	local first = true
	local src = self:acceptToken2(123)
	if not (src ~= nil) then
		do return nil end
	end
	while true do
		if self:acceptToken2(125) ~= nil then
			do break end
		end
		if not first then
			do self:parseToken2(44) end
		end
		if self:acceptToken2(125) ~= nil then
			do break end
		end
		do
			local stmt = self:acceptStatementForObjectLiteral()
			first = false
			if stmt ~= nil then
				do _g.jk.lang.Vector:append(v, stmt) end
				goto _continue9
			end
			do self:skipSpaces() end
			do self:updateStagingToken() end
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("object literal statement"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
		end
		::_continue9::
	end
	do
		local vv = _g.sling.js.model.ObjectLiteralExpressionNode._construct0(_g.sling.js.model.ObjectLiteralExpressionNode._create())
		do vv:setValues(v, false) end
		do vv:setSource(src) end
		do return vv end
	end
end

function sling.js.parser.JSParser:acceptObjectLiteralValueExpression()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local mod = nil
		local key = self:acceptPropertyName()
		if not (key ~= nil) then
			do return nil end
		end
		if self.supportTypeScript then
			if self:acceptToken2(63) ~= nil then
				if not (mod ~= nil) then
					mod = {}
				end
				do _g.jk.lang.Vector:append(mod, _g.sling.model.CommonModifierNode:forType(_g.sling.js.model.JSModifier.OPTIONAL)) end
			end
		end
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
			local v = _g.sling.model.KeyValueNode:forValues(key, self:parseExpression(false))
			do return v end
		end
	end
end

function sling.js.parser.JSParser:acceptStatementForObjectLiteral()
	local mapfd = self:acceptObjectLiteralValueExpression()
	if mapfd ~= nil then
		do return mapfd end
	end
	do
		local proper = self:acceptPropertyFunctionDeclaration(false)
		if proper ~= nil then
			do return proper end
		end
		do
			local exp = self:acceptExpression(false)
			if exp ~= nil then
				do return exp end
			end
			do return nil end
		end
	end
end

function sling.js.parser.JSParser:acceptNumberLiteralExpression()
	local bin = self:acceptBinaryNumberLiteralToken(false)
	if bin ~= nil then
		local b = _g.jk.lang.String:toIntegerFromBinary(_g.jk.lang.String:getEndOfString(bin.value, 2))
		local v = _g.sling.model.IntegerLiteralExpressionNode:forValue(b)
		do v:setFormat(_g.sling.model.IntegerLiteralExpressionNode.FORMAT_BINARY) end
		do v:setSource(bin) end
		do return v end
	end
	do
		local oct = self:acceptOctalNumberLiteralToken(false, true)
		if oct ~= nil then
			local o = _g.jk.lang.String:toIntegerFromOctal(_g.jk.lang.String:getEndOfString(oct.value, 2))
			local v = _g.sling.model.IntegerLiteralExpressionNode:forValue(o)
			do v:setFormat(_g.sling.model.IntegerLiteralExpressionNode.FORMAT_OCTAL) end
			do v:setSource(oct) end
			do return v end
		end
		do
			local hex = self:acceptHexNumberLiteralToken(false)
			if hex ~= nil then
				local h = _g.jk.lang.String:toIntegerFromHex(_g.jk.lang.String:getEndOfString(hex.value, 2))
				local v = _g.sling.model.IntegerLiteralExpressionNode:forValue(h)
				do v:setFormat(_g.sling.model.IntegerLiteralExpressionNode.FORMAT_HEXADECIMAL) end
				do v:setSource(hex) end
				do return v end
			end
			do
				local dlt = self:acceptDecimalNumberLiteralToken(false, true, true, true)
				if dlt ~= nil then
					local val = dlt.value
					if _g.jk.lang.String:contains(val, ".") or _g.jk.lang.String:contains(val, "e") or _g.jk.lang.String:contains(val, "E") then
						local v = _g.sling.model.DoubleLiteralExpressionNode:forValue(_g.jk.lang.String:toDouble(val))
						do v:setSource(dlt) end
						do return v end
					end
					do
						local v = _g.sling.model.IntegerLiteralExpressionNode:forValue(_g.jk.lang.String:toInteger(val))
						do v:setFormat(_g.sling.model.IntegerLiteralExpressionNode.FORMAT_DECIMAL) end
						do v:setSource(dlt) end
						do return v end
					end
				end
				do return nil end
			end
		end
	end
end

function sling.js.parser.JSParser:acceptNullLiteralExpression()
	if not (self:acceptAnyToken({
		"null",
		"undefined"
	}) ~= nil) then
		do return nil end
	end
	do
		local v = _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create())
		do v:setSource(self:getAcceptedToken()) end
		do return v end
	end
end

function sling.js.parser.JSParser:acceptBooleanLiteralExpression()
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

function sling.js.parser.JSParser:acceptVariableDeclarationStatement(currentContext, requiredSemiColon)
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local mod = self:acceptModifiers(false)
		local vtp = nil
		if self:acceptToken1("var") ~= nil then
			vtp = _g.sling.js.model.JSModifier.HOIST
		elseif self:acceptToken1("const") ~= nil then
			vtp = _g.sling.model.Modifier.CONSTANT
		elseif self:acceptToken1("let") ~= nil then
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
		if not (mod ~= nil) then
			mod = {}
		end
		if vtp ~= nil then
			do _g.jk.lang.Vector:append(mod, _g.sling.model.CommonModifierNode:forType(vtp)) end
		end
		do
			local mv = nil
			local src = self:getAcceptedToken()
			local vbl = nil
			while true do
				if self:peekToken2(91) or self:peekToken2(123) then
					vbl = self:acceptDestructuredVariableDeclarationStatement(requiredSemiColon)
				else
					local id = self:acceptIdentifier()
					if not (id ~= nil) then
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
						local type = self:acceptDeclarationDataType(true)
						local initializer = nil
						if self:acceptToken2(61) ~= nil then
							initializer = self:parseExpression(false)
						end
						vbl = _g.sling.model.VariableDeclarationNode:instance(type, id, initializer)
					end
				end
				do vbl:setSource(src) end
				if self:acceptToken2(44) ~= nil then
					if not (mv ~= nil) then
						mv = _g.sling.model.MultipleVariableDeclarationNode._construct0(_g.sling.model.MultipleVariableDeclarationNode._create())
					end
					do mv:addToVariables(vbl) end
				else
					if requiredSemiColon then
						do self:parseToken2(59) end
					else
						do self:acceptToken2(59) end
					end
					if mv ~= nil then
						do mv:addToVariables(vbl) end
						do break end
					end
					if (_vm:to_table_with_key(vbl, '_isType.sling.model.NodeWithModifiers') ~= nil) then
						do vbl:setModifiers(mod, false) end
					end
					do return vbl end
				end
			end
			do mv:setModifiers(mod, false) end
			do return mv end
		end
	end
end

function sling.js.parser.JSParser:acceptClassDeclarationExpressionNode()
	local classDec = self:acceptClassDeclaration(true)
	if not (classDec ~= nil) then
		do return nil end
	end
	do return _g.sling.js.model.ClassDeclarationExpressionNode:forDeclaration(classDec) end
end

function sling.js.parser.JSParser:acceptLeftHandSideExpression()
	do return self:acceptExpressions18() end
end

function sling.js.parser.JSParser:acceptExpressions18()
	local pe = self:acceptExpressions20()
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
				local dot = self:acceptToken2(46)
				if dot ~= nil then
					local ne = self:acceptSymbolExpression()
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
					goto _continue10
				end
				if self:acceptToken2(40) ~= nil then
					local fc = _g.sling.model.FunctionCallExpressionNode:forExpression(pe)
					do fc:setSource(pe:getSource()) end
					if not (self:acceptToken2(41) ~= nil) then
						while true do
							if self:acceptToken2(41) ~= nil then
								do break end
							end
							do
								local xpr = self:parseExpression(false)
								do fc:addToParameters(xpr) end
								if self:acceptToken2(44) ~= nil then
									goto _continue11
								end
								if self:acceptToken2(41) ~= nil then
									do break end
								end
								do self:skipSpaces() end
								do self:updateStagingToken() end
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`,' or `)'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
							end
							::_continue11::
						end
					end
					pe = fc
					pi = nil
					goto _continue10
				end
				if self:acceptToken2(91) ~= nil then
					local subscript = nil
					if not (self:acceptToken2(93) ~= nil) then
						subscript = self:parseExpression(false)
						do self:parseToken2(93) end
					end
					do
						local se = _g.sling.model.SubscriptExpressionNode:instance(pe, subscript)
						do se:setSource(pe:getSource()) end
						pe = se
						pi = nil
						goto _continue10
					end
				end
				do break end
			end
			::_continue10::
		end
		do return pe end
	end
end

function sling.js.parser.JSParser:acceptExpressions17()
	local left = self:acceptExpressions18()
	if not (left ~= nil) then
		do return nil end
	end
	while true do
		local o1 = self:acceptToken1("++")
		if o1 ~= nil then
			local v = _g.sling.model.PostIncrementExpressionNode:forExpression(left)
			do v:setSource(o1) end
			do return v end
		end
		do
			local o2 = self:acceptToken1("--")
			if o2 ~= nil then
				local v = _g.sling.model.PostDecrementExpressionNode:forExpression(left)
				do v:setSource(o2) end
				do return v end
			end
			do break end
		end
	end
	do return left end
end

function sling.js.parser.JSParser:acceptArrayLiteralExpression()
	local src = self:acceptToken2(91)
	if not (src ~= nil) then
		do return nil end
	end
	do
		local exprs = {}
		if not (self:acceptToken2(93) ~= nil) then
			while true do
				if self:peekToken2(93) then
					do break end
				end
				do
					local exp = self:acceptExpression(false)
					if not (exp ~= nil) then
						do _g.jk.lang.Vector:append(exprs, _g.sling.model.EmptyExpressionNode._construct0(_g.sling.model.EmptyExpressionNode._create())) end
					else
						do _g.jk.lang.Vector:append(exprs, exp) end
					end
					if not (self:acceptToken2(44) ~= nil) then
						do break end
					end
				end
			end
			do self:parseToken2(93) end
		end
		do
			local v = _g.sling.model.ArrayLiteralExpressionNode:forExpressions(exprs)
			do v:setSource(src) end
			do return v end
		end
	end
end

function sling.js.parser.JSParser:acceptForStatement()
	local start = self:acceptToken1("for")
	if not (start ~= nil) then
		do return nil end
	end
	do self:parseToken2(40) end
	do
		local st1 = {}
		local isExpression = false
		if self:acceptToken2(59) ~= nil then
			do _g.jk.lang.Vector:append(st1, _g.sling.model.EmptyStatementNode._construct0(_g.sling.model.EmptyStatementNode._create())) end
		else
			while true do
				if self:peekToken1("var") or self:peekToken1("let") or self:peekToken1("const") then
					local i = self:acceptVariableDeclarationStatement(_g.sling.js.parser.JSParser.CONTEXT_BLOCK_SCOPE, false)
					if not (i ~= nil) then
						do self:skipSpaces() end
						do self:updateStagingToken() end
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("for statement initializer"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
					end
					do _g.jk.lang.Vector:append(st1, i) end
				else
					do _g.jk.lang.Vector:append(st1, self:parseExpression(false)) end
					isExpression = true
				end
				if not (self:acceptToken2(44) ~= nil) then
					do break end
				end
			end
			if isExpression then
				do self:parseToken2(59) end
			end
		end
		do
			local st2 = nil
			if not (self:acceptToken2(59) ~= nil) then
				st2 = self:acceptExpression(false)
				do self:parseToken2(59) end
			end
			do
				local st3 = self:acceptExpression(false)
				do self:parseToken2(41) end
				do
					local block = self:parseBlockOrStatement()
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
					do v:setSource(start) end
					do return v end
				end
			end
		end
	end
end

function sling.js.parser.JSParser:acceptExpressions16()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		if self:acceptToken2(33) ~= nil then
			local src = self:getAcceptedToken()
			local v = self:acceptExpressions16()
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
		if self:acceptToken1("~") ~= nil then
			local src = self:getAcceptedToken()
			local v = self:acceptExpressions16()
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
		if self:acceptToken1("++") ~= nil then
			local src = self:getAcceptedToken()
			local v = self:acceptExpressions16()
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
			local v = self:acceptExpressions16()
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
		if self:acceptToken1("...") ~= nil then
			local src = self:getAcceptedToken()
			local v = self:acceptExpressions16()
			if v ~= nil then
				local r = _g.sling.js.model.SpreadExpressionNode:forExpression(v)
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
		if self:acceptToken2(43) ~= nil then
			local src = self:getAcceptedToken()
			local right = self:acceptExpressions16()
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
			local right = self:acceptExpressions16()
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
		if self:acceptToken1("typeof") ~= nil then
			local src = self:getAcceptedToken()
			local right = self:acceptExpressions16()
			if right ~= nil then
				local v = _g.sling.model.GetExpressionTypeinfoExpressionNode:forExpression(right)
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
		if self:acceptToken1("void") ~= nil then
			local src = self:getAcceptedToken()
			local right = self:acceptExpressions16()
			if right ~= nil then
				local v = _g.sling.js.model.VoidExpressionNode._construct0(_g.sling.js.model.VoidExpressionNode._create())
				do v:setSource(src) end
				do v:setExpression(right, false) end
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
		if self:acceptToken1("delete") ~= nil then
			local src = self:getAcceptedToken()
			local right = self:acceptExpressions16()
			if right ~= nil then
				local v = _g.sling.js.model.DeleteExpressionNode._construct0(_g.sling.js.model.DeleteExpressionNode._create())
				do v:setSource(src) end
				do v:setExpression(right, false) end
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
		if self:acceptToken1("await") ~= nil then
			local src = self:getAcceptedToken()
			local right = self:acceptExpressions16()
			if right ~= nil then
				local v = _g.sling.model.AwaitExpressionNode:forExpression(right)
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
		if self:acceptToken2(60) ~= nil then
			local src = self:getAcceptedToken()
			local type = self:acceptDataType()
			if type ~= nil then
				do self:parseToken2(62) end
				do
					local right = self:acceptExpressions16()
					if right ~= nil then
						local v = _g.sling.model.StaticCastExpressionNode:instance(type, right)
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
		do return self:acceptExpressions17() end
	end
end

function sling.js.parser.JSParser:acceptEnumDeclaration()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local mod = self:acceptModifiers(false)
		local src = self:acceptToken1("enum")
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
			local name = self:parseIdentifier()
			local ent = _g.sling.model.EnumDeclarationNode:forName(name)
			do ent:setSource(src) end
			do ent:setModifiers(mod, false) end
			do self:parseToken2(123) end
			while true do
				if self:acceptToken2(44) ~= nil then
					goto _continue12
				end
				if self:acceptToken2(125) ~= nil then
					do break end
				end
				do
					local id = self:acceptIdentifier()
					if not (id ~= nil) then
						do break end
					end
					do
						local ev = _g.sling.model.EnumValueNode._construct0(_g.sling.model.EnumValueNode._create())
						do ev:setName(id) end
						if self:acceptToken2(61) ~= nil then
							do ev:setValue(self:parseExpression(false), false) end
						end
						do ent:addNode(ev) end
					end
				end
				::_continue12::
			end
			do self:acceptToken2(59) end
			do return ent end
		end
	end
end

function sling.js.parser.JSParser:acceptExpressions15()
	local left = self:acceptExpressions16()
	if not (left ~= nil) then
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
			local o1 = self:acceptToken1("**")
			if o1 ~= nil then
				local right = self:acceptExpressions15()
				if right ~= nil then
					local v = _g.sling.model.ExponentExpressionNode:instance(left, right)
					do v:setSource(o1) end
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
			do return left end
		end
	end
end

function sling.js.parser.JSParser:acceptExpressions14()
	local left = self:acceptExpressions15()
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
			local o1 = self:acceptToken2(42)
			if o1 ~= nil then
				local right = self:acceptExpressions15()
				if right ~= nil then
					local v = _g.sling.model.MultiplicationExpressionNode:instance(left, right)
					do v:setSource(o1) end
					left = v
					goto _continue13
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
				local o2 = self:acceptToken2(47)
				if o2 ~= nil then
					local right = self:acceptExpressions15()
					if right ~= nil then
						local v = _g.sling.model.DivisionExpressionNode:instance(left, right)
						do v:setSource(o2) end
						left = v
						goto _continue13
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
					local o3 = self:acceptToken2(37)
					if o3 ~= nil then
						local right = self:acceptExpressions15()
						if right ~= nil then
							local v = _g.sling.model.ModuloExpressionNode:instance(left, right)
							do v:setSource(o3) end
							left = v
							goto _continue13
						end
						self.currentTokenColumn = ctc
						self.currentTokenLine = ctl
						do self.iterator:setCurrentPosition(ctp) end
						while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
							do self.commentQueue:pop() end
						end
						self.previousToken = cpt
					end
					if self.supportTypeScript then
						local o4 = self:acceptToken1("as")
						if o4 ~= nil then
							local right = self:acceptDataType()
							if right ~= nil then
								local v = _g.sling.model.DynamicCastExpressionNode:instance(right, left)
								do v:setSource(o4) end
								left = v
								goto _continue13
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
					do break end
				end
			end
		end
		::_continue13::
	end
	do return left end
end

function sling.js.parser.JSParser:acceptExpressions13()
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
			local o1 = self:acceptToken2(43)
			if o1 ~= nil then
				local right = self:acceptExpressions14()
				if right ~= nil then
					local v = _g.sling.model.AdditionExpressionNode:instance(left, right)
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
				local o2 = self:acceptToken2(45)
				if o2 ~= nil then
					local right = self:acceptExpressions14()
					if right ~= nil then
						local v = _g.sling.model.SubtractionExpressionNode:instance(left, right)
						do v:setSource(o2) end
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
				do break end
			end
		end
		::_continue14::
	end
	do return left end
end

function sling.js.parser.JSParser:acceptExpressions12()
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
			local o1 = self:acceptToken1("<<")
			if o1 ~= nil then
				local right = self:acceptExpressions13()
				if right ~= nil then
					local v = _g.sling.model.ShiftLeftExpressionNode:instance(left, right)
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
				local o2 = self:acceptToken1(">>")
				if o2 ~= nil then
					local right = self:acceptExpressions13()
					if right ~= nil then
						local v = _g.sling.model.ShiftRightExpressionNode:instance(left, right)
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
					local o3 = self:acceptToken1(">>>")
					if o3 ~= nil then
						local right = self:acceptExpressions13()
						if right ~= nil then
							local v = _g.sling.model.ShiftRightExpressionNode:instance(left, right)
							do v:setZeroLeftmostBit(true) end
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
					do break end
				end
			end
		end
		::_continue15::
	end
	do return left end
end

function sling.js.parser.JSParser:acceptExpressions11()
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
			local o1 = self:acceptToken2(60)
			if o1 ~= nil then
				local right = self:acceptExpressions12()
				if right ~= nil then
					local v = _g.sling.model.LessThanExpressionNode:instance(left, right)
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
				local o2 = self:acceptToken1("<=")
				if o2 ~= nil then
					local right = self:acceptExpressions12()
					if right ~= nil then
						local v = _g.sling.model.LessOrEqualExpressionNode:instance(left, right)
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
					local o3 = self:acceptToken2(62)
					if o3 ~= nil then
						local right = self:acceptExpressions12()
						if right ~= nil then
							local v = _g.sling.model.GreaterThanExpressionNode:instance(left, right)
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
					do
						local o4 = self:acceptToken1(">=")
						if o4 ~= nil then
							local right = self:acceptExpressions12()
							if right ~= nil then
								local v = _g.sling.model.GreaterOrEqualExpressionNode:instance(left, right)
								do v:setSource(o4) end
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
							local o5 = self:acceptToken1("in")
							if o5 ~= nil then
								local right = self:acceptExpressions12()
								if right ~= nil then
									local v = _g.sling.model.MembershipCheckExpressionNode:instance(left, right)
									do v:setSource(o5) end
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
								local o6 = self:acceptToken1("instanceof")
								if o6 ~= nil then
									local v = _g.sling.model.TypeCheckExpressionNode._construct0(_g.sling.model.TypeCheckExpressionNode._create())
									do v:setExpression(left, false) end
									do v:setSource(o6) end
									do
										local typeExp = nil
										local right = self:acceptReferenceDataType()
										if not (right ~= nil) then
											typeExp = _g.sling.model.ExpressionDataTypeNode._construct0(_g.sling.model.ExpressionDataTypeNode._create())
											do typeExp:setExpression(self:parseExpression(false), false) end
										end
										if right ~= nil or typeExp ~= nil then
											if right ~= nil then
												do v:setType(right, false) end
											else
												do v:setType(typeExp, false) end
											end
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
								end
								do break end
							end
						end
					end
				end
			end
		end
		::_continue16::
	end
	do return left end
end

function sling.js.parser.JSParser:acceptExpressions10()
	local left = self:acceptExpressions11()
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
			local o1 = self:acceptToken1("===")
			if o1 ~= nil then
				local right = self:acceptExpressions11()
				if right ~= nil then
					local v = _g.sling.model.StrictEqualsExpressionNode:instance(left, right)
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
				local o2 = self:acceptToken1("==")
				if o2 ~= nil then
					local right = self:acceptExpressions11()
					if right ~= nil then
						local v = _g.sling.model.EqualsExpressionNode:instance(left, right)
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
					local o3 = self:acceptToken1("!==")
					if o3 ~= nil then
						local right = self:acceptExpressions11()
						if right ~= nil then
							local v = _g.sling.model.StrictNotEqualsExpressionNode:instance(left, right)
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
					do
						local o4 = self:acceptToken1("!=")
						if o4 ~= nil then
							local right = self:acceptExpressions11()
							if right ~= nil then
								local v = _g.sling.model.NotEqualsExpressionNode:instance(left, right)
								do v:setSource(o4) end
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
		end
		::_continue17::
	end
	do return left end
end

function sling.js.parser.JSParser:acceptImmediateSlashSlashCommentToken()
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
						if cn == 13 then
							do self:getNextCharacter() end
							goto _continue18
						end
						if cn == 10 or self:hasInputEnded() then
							do break end
						end
						do sb:appendCharacter(cn) end
						do self:getNextCharacter() end
						::_continue18::
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

function sling.js.parser.JSParser:acceptExpressions9()
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
			local o1 = self:acceptToken2(38)
			if o1 ~= nil then
				local right = self:acceptExpressions10()
				if right ~= nil then
					local v = _g.sling.model.BitwiseAndExpressionNode:instance(left, right)
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
			do break end
		end
		::_continue19::
	end
	do return left end
end

function sling.js.parser.JSParser:acceptExpressions8()
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
			local o1 = self:acceptToken2(94)
			if o1 ~= nil then
				local right = self:acceptExpressions9()
				if right ~= nil then
					local v = _g.sling.model.BitwiseXorExpressionNode:instance(left, right)
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

function sling.js.parser.JSParser:acceptExpressions7()
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
			local o1 = self:acceptToken2(124)
			if o1 ~= nil then
				if self.acceptAngularPiping then
					local pname = self:acceptIdentifier()
					if pname ~= nil then
						local prams = nil
						if self:acceptToken2(58) ~= nil then
							while true do
								local expr = self:parseExpression(false)
								if not (prams ~= nil) then
									prams = {}
								end
								do _g.jk.lang.Vector:append(prams, expr) end
								if not (self:acceptToken2(58) ~= nil) then
									do break end
								end
							end
						end
						do
							local right = _g.sling.model.FunctionCallExpressionNode._construct0(_g.sling.model.FunctionCallExpressionNode._create())
							do right:setExpression(_g.sling.model.SymbolExpressionNode:forName(pname), false) end
							do right:setParameters(prams, false) end
							do
								local v = _g.sling.js.model.PipeExpressionNode:instance(left, right)
								do v:setSource(o1) end
								left = v
								goto _continue21
							end
						end
					end
				else
					local right = self:acceptExpressions8()
					if right ~= nil then
						local v = _g.sling.model.BitwiseOrExpressionNode:instance(left, right)
						do v:setSource(o1) end
						left = v
						goto _continue21
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
		::_continue21::
	end
	do return left end
end

function sling.js.parser.JSParser:acceptExpressions6()
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
			local o1 = self:acceptToken1("&&")
			if o1 ~= nil then
				local right = self:acceptExpressions7()
				if right ~= nil then
					local v = _g.sling.model.LogicalAndExpressionNode:instance(left, right)
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

function sling.js.parser.JSParser:acceptExpressions5()
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
			local o1 = self:acceptToken1("||")
			if o1 ~= nil then
				local right = self:acceptExpressions6()
				if right ~= nil then
					local v = _g.sling.model.LogicalOrExpressionNode:instance(left, right)
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

function sling.js.parser.JSParser:acceptExpressions4()
	local left = self:acceptExpressions5()
	if not (left ~= nil) then
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
			local o1 = self:acceptToken2(63)
			if o1 ~= nil then
				local trueExpr = self:acceptExpression(false)
				if trueExpr ~= nil and self:acceptToken2(58) ~= nil then
					local falseExpr = self:acceptExpression(false)
					if falseExpr ~= nil then
						local v = _g.sling.model.ConditionalExpressionNode:instance(left, trueExpr, falseExpr)
						do v:setSource(o1) end
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
			do return left end
		end
	end
end

function sling.js.parser.JSParser:acceptExpressions3()
	local left = self:acceptExpressions4()
	if not (left ~= nil) then
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
			local o1 = self:acceptToken2(61)
			if o1 ~= nil then
				local right = self:acceptExpression(false)
				if right ~= nil then
					local v = _g.sling.model.AssignmentExpressionNode:forNodes(left, right)
					do v:setSource(o1) end
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
				local o2 = self:acceptToken1("+=")
				if o2 ~= nil then
					local right = self:acceptExpression(false)
					if right ~= nil then
						local v = _g.sling.model.AdditionAssignmentExpressionNode:instance(left, right)
						do v:setSource(o2) end
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
					local o3 = self:acceptToken1("-=")
					if o3 ~= nil then
						local right = self:acceptExpression(false)
						if right ~= nil then
							local v = _g.sling.model.SubtractionAssignmentExpressionNode:instance(left, right)
							do v:setSource(o3) end
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
						local o4 = self:acceptToken1("**=")
						if o4 ~= nil then
							local right = self:acceptExpression(false)
							if right ~= nil then
								local v = _g.sling.model.ExponentAssignmentExpressionNode:instance(left, right)
								do v:setSource(o4) end
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
							local o5 = self:acceptToken1("*=")
							if o5 ~= nil then
								local right = self:acceptExpression(false)
								if right ~= nil then
									local v = _g.sling.model.MultiplicationAssignmentExpressionNode:instance(left, right)
									do v:setSource(o5) end
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
								local o6 = self:acceptToken1("/=")
								if o6 ~= nil then
									local right = self:acceptExpression(false)
									if right ~= nil then
										local v = _g.sling.model.DivisionAssignmentExpressionNode:instance(left, right)
										do v:setSource(o6) end
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
									local o7 = self:acceptToken1("%=")
									if o7 ~= nil then
										local right = self:acceptExpression(false)
										if right ~= nil then
											local v = _g.sling.model.ModuloAssignmentExpressionNode:instance(left, right)
											do v:setSource(o7) end
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
										local o8 = self:acceptToken1("<<=")
										if o8 ~= nil then
											local right = self:acceptExpression(false)
											if right ~= nil then
												local v = _g.sling.model.ShiftLeftAssignmentExpressionNode:instance(left, right)
												do v:setSource(o8) end
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
											local o9 = self:acceptToken1(">>=")
											if o9 ~= nil then
												local right = self:acceptExpression(false)
												if right ~= nil then
													local v = _g.sling.model.ShiftRightAssignmentExpressionNode:instance(left, right)
													do v:setSource(o9) end
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
												local o10 = self:acceptToken1(">>>=")
												if o10 ~= nil then
													local right = self:acceptExpression(false)
													if right ~= nil then
														local v = _g.sling.model.ShiftRightAssignmentExpressionNode:instance(left, right)
														do v:setSource(o10) end
														do v:setZeroLeftmostBit(true) end
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
													local o11 = self:acceptToken1("&=")
													if o11 ~= nil then
														local right = self:acceptExpression(false)
														if right ~= nil then
															local v = _g.sling.model.BitwiseAndAssignmentExpressionNode:instance(left, right)
															do v:setSource(o11) end
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
														local o12 = self:acceptToken1("^=")
														if o12 ~= nil then
															local right = self:acceptExpression(false)
															if right ~= nil then
																local v = _g.sling.model.BitwiseXorAssignmentExpressionNode:instance(left, right)
																do v:setSource(o12) end
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
															local o13 = self:acceptToken1("|=")
															if o13 ~= nil then
																local right = self:acceptExpression(false)
																if right ~= nil then
																	local v = _g.sling.model.BitwiseOrAssignmentExpressionNode:instance(left, right)
																	do v:setSource(o13) end
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
															do return left end
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

function sling.js.parser.JSParser:acceptExpressions2()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		if self:acceptToken1("yield*") ~= nil then
			local src = self:getAcceptedToken()
			local right = self:acceptExpressions3()
			if right ~= nil then
				local v = _g.sling.js.model.YieldToGeneratorExpressionNode._construct0(_g.sling.js.model.YieldToGeneratorExpressionNode._create())
				do v:setSource(src) end
				do v:setExpression(right, false) end
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
		if self:acceptToken1("yield") ~= nil then
			local src = self:getAcceptedToken()
			local right = self:acceptExpressions3()
			if right ~= nil then
				local v = _g.sling.model.YieldValueExpressionNode._construct0(_g.sling.model.YieldValueExpressionNode._create())
				do v:setSource(src) end
				do v:setExpression(right, false) end
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
		do return self:acceptExpressions3() end
	end
end

function sling.js.parser.JSParser:acceptExpressions1()
	local left = self:acceptExpressions2()
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
			local o1 = self:acceptToken2(44)
			if o1 ~= nil then
				local right = self:acceptExpressions2()
				if right ~= nil then
					if (_vm:to_table_with_key(left, '_isType.sling.model.MultipleExpressionNode') ~= nil) then
						do left:addToExpressions(right) end
					else
						local mm = _g.sling.model.MultipleExpressionNode._construct0(_g.sling.model.MultipleExpressionNode._create())
						do mm:setSource(o1) end
						do mm:addToExpressions(left) end
						do mm:addToExpressions(right) end
						left = mm
					end
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

function sling.js.parser.JSParser:acceptExpression(acceptCommaOperator)
	if not acceptCommaOperator then
		do return self:acceptExpressions2() end
	end
	do return self:acceptExpressions1() end
end

function sling.js.parser.JSParser:parseExpression(acceptCommaOperator)
	local v = self:acceptExpression(acceptCommaOperator)
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("expression"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return v end
end

function sling.js.parser.JSParser:acceptImportStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("import")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local symbol = _g.sling.model.SymbolNode._construct0(_g.sling.model.SymbolNode._create())
			local v = {}
			local slit = self:acceptStringLiteralExpression()
			if slit ~= nil then
				do symbol:addNameToComponents("\"" .. _g.jk.lang.String:safeString(slit:getValue()) .. "\"") end
				do
					local x = _g.sling.model.ImportStaticMemberStatementNode._construct0(_g.sling.model.ImportStaticMemberStatementNode._create())
					do x:setSource(src) end
					do x:setMember(symbol, false) end
					do self:acceptToken2(59) end
					do return x end
				end
			end
			if self:peekToken1("from") then
				do self:skipSpaces() end
				do self:updateStagingToken() end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("local name and/or default export is expected"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
			end
			do
				local defEx = self:acceptIdentifier()
				do self:acceptToken2(44) end
				if self:acceptToken2(123) ~= nil then
					local impMutipleStatMem = _g.sling.js.model.ImportMultipleStaticMembersStatementNode._construct0(_g.sling.js.model.ImportMultipleStaticMembersStatementNode._create())
					if defEx ~= nil then
						do impMutipleStatMem:setDefaultExport(defEx) end
					end
					if not (self:acceptToken2(125) ~= nil) then
						while true do
							local id = self:parseIdentifier()
							local name = nil
							local imp = _g.sling.model.ImportEntityStatementNode._construct0(_g.sling.model.ImportEntityStatementNode._create())
							do imp:setEntity(_g.sling.model.SymbolNode:forName(id), false) end
							if self:acceptToken1("as") ~= nil then
								do imp:setLocalName(self:parseIdentifier()) end
							end
							do _g.jk.lang.Vector:append(v, imp) end
							if not (self:acceptToken2(44) ~= nil) then
								do break end
							end
						end
					end
					do self:acceptToken2(125) end
					do impMutipleStatMem:setMembers(v, false) end
					do self:acceptToken1("from") end
					do
						local ss = _g.sling.model.SymbolNode._construct0(_g.sling.model.SymbolNode._create())
						local str = self:acceptStringLiteralExpression()
						if str ~= nil then
							do ss:addNameToComponents(str:getValue()) end
						end
						do impMutipleStatMem:setContainer(ss, false) end
						do impMutipleStatMem:setSource(src) end
						do self:acceptToken2(59) end
						do return impMutipleStatMem end
					end
				elseif self:acceptToken2(61) ~= nil then
					local exp = self:parseExpression(false)
					do self:acceptToken2(59) end
					do
						local imp = _g.sling.js.model.ImportExpressionStatementNode._construct0(_g.sling.js.model.ImportExpressionStatementNode._create())
						do imp:setLocalName(defEx) end
						do imp:setExpression(exp, false) end
						do imp:setSource(src) end
						do return imp end
					end
				else
					local i = _g.sling.model.ImportPackageStatementNode._construct0(_g.sling.model.ImportPackageStatementNode._create())
					if defEx ~= nil then
						do i:setDefaultExport(defEx) end
					end
					if self:acceptToken2(42) ~= nil then
						do self:parseToken1("as") end
						do i:setLocalName(self:parseIdentifier()) end
					end
					do self:acceptToken1("from") end
					do
						local q = _g.sling.model.SymbolNode._construct0(_g.sling.model.SymbolNode._create())
						local str = self:acceptStringLiteralExpression()
						if str ~= nil then
							do q:addNameToComponents(str:getValue()) end
						end
						do i:setPackage(q, false) end
						do i:setSource(src) end
						do self:acceptToken2(59) end
						do return i end
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
	end
end

function sling.js.parser.JSParser:acceptExportStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local mod = self:acceptModifiers(true)
		local src = self:acceptToken1("export")
		if not (src ~= nil) then
			do return nil end
		end
		do
			local v = {}
			if self:acceptToken2(123) ~= nil then
				local expMutipleStatMem = _g.sling.js.model.ExportMultipleStaticMembersStatementNode._construct0(_g.sling.js.model.ExportMultipleStaticMembersStatementNode._create())
				if not (self:acceptToken2(125) ~= nil) then
					while true do
						local id = self:parseIdentifier()
						local name = nil
						if self:acceptToken1("as") ~= nil then
							name = self:parseIdentifier()
						end
						if name ~= nil then
							local s = _g.sling.model.SymbolNode._construct0(_g.sling.model.SymbolNode._create())
							do s:addNameToComponents(_g.jk.lang.String:safeString(id) .. " as " .. _g.jk.lang.String:safeString(name)) end
							do _g.jk.lang.Vector:append(v, s) end
						else
							local s = _g.sling.model.SymbolNode._construct0(_g.sling.model.SymbolNode._create())
							do s:addNameToComponents(id) end
							do _g.jk.lang.Vector:append(v, s) end
						end
						if not (self:acceptToken2(44) ~= nil) then
							do break end
						end
					end
				end
				do self:acceptToken2(125) end
				do expMutipleStatMem:setMembers(v, false) end
				if self:acceptToken1("from") ~= nil then
					local ss = _g.sling.model.SymbolNode._construct0(_g.sling.model.SymbolNode._create())
					local str = self:acceptStringLiteralExpression()
					if str ~= nil then
						do ss:addNameToComponents("\"" .. _g.jk.lang.String:safeString(str:getValue()) .. "\"") end
					end
					do expMutipleStatMem:setContainer(ss, false) end
				end
				do expMutipleStatMem:setSource(src) end
				do self:acceptToken2(59) end
				do return expMutipleStatMem end
			elseif self:acceptToken2(42) ~= nil then
				local expAll = _g.sling.js.model.ExportAllStaticMembersStatementNode._construct0(_g.sling.js.model.ExportAllStaticMembersStatementNode._create())
				do self:parseToken1("from") end
				do
					local q = _g.sling.model.SymbolNode._construct0(_g.sling.model.SymbolNode._create())
					local str = self:acceptStringLiteralExpression()
					if str ~= nil then
						do q:addNameToComponents("\"" .. _g.jk.lang.String:safeString(str:getValue()) .. "\"") end
					end
					do expAll:setContainer(q, false) end
					do expAll:setSource(src) end
					do self:acceptToken2(59) end
					do return expAll end
				end
			else
				local enums = self:acceptEnumDeclaration()
				if enums ~= nil then
					local enum = _g.sling.js.model.ExportDeclarationStatementNode._construct0(_g.sling.js.model.ExportDeclarationStatementNode._create())
					do enum:setModifiers(mod, false) end
					do enum:setDeclaration(enums, false) end
					do enum:setSource(src) end
					do return enum end
				end
				do
					local fdc = self:acceptFunctionDeclarationStatement()
					if fdc ~= nil then
						local exf = _g.sling.js.model.ExportDeclarationStatementNode._construct0(_g.sling.js.model.ExportDeclarationStatementNode._create())
						do exf:setModifiers(mod, false) end
						do exf:setDeclaration(fdc, false) end
						do exf:setSource(src) end
						do return exf end
					end
					do
						local cdc = self:acceptClassDeclaration(false)
						if cdc ~= nil then
							local exc = _g.sling.js.model.ExportDeclarationStatementNode._construct0(_g.sling.js.model.ExportDeclarationStatementNode._create())
							do exc:setModifiers(mod, false) end
							do exc:setDeclaration(cdc, false) end
							do exc:setSource(src) end
							do return exc end
						end
						do
							local idc = self:acceptInterfaceDeclaration()
							if idc ~= nil then
								local exi = _g.sling.js.model.ExportDeclarationStatementNode._construct0(_g.sling.js.model.ExportDeclarationStatementNode._create())
								do exi:setModifiers(mod, false) end
								do exi:setDeclaration(idc, false) end
								do exi:setSource(src) end
								do return exi end
							end
							do
								local vdc = self:acceptVariableDeclarationStatement(_g.sling.js.parser.JSParser.CONTEXT_BLOCK_SCOPE, false)
								if vdc ~= nil then
									local exv = _g.sling.js.model.ExportDeclarationStatementNode._construct0(_g.sling.js.model.ExportDeclarationStatementNode._create())
									do exv:setModifiers(mod, false) end
									do exv:setDeclaration(vdc, false) end
									do exv:setSource(src) end
									do return exv end
								end
								do
									local tal = self:acceptTypeAliasDeclarationStatement()
									if tal ~= nil then
										local ext = _g.sling.js.model.ExportDeclarationStatementNode._construct0(_g.sling.js.model.ExportDeclarationStatementNode._create())
										do ext:setModifiers(mod, false) end
										do ext:setDeclaration(tal, false) end
										do ext:setSource(src) end
										do return ext end
									end
									do
										local exp = self:acceptExpression(false)
										if exp ~= nil then
											local exx = _g.sling.js.model.ExportDeclarationStatementNode._construct0(_g.sling.js.model.ExportDeclarationStatementNode._create())
											do exx:setModifiers(mod, false) end
											do exx:setDeclaration(exp, false) end
											do exx:setSource(src) end
											do return exx end
										end
									end
								end
							end
						end
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
			do return nil end
		end
	end
end

function sling.js.parser.JSParser:acceptLabeledStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptIdentifier()
		if not (src ~= nil) then
			do return nil end
		end
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
			local v = _g.sling.model.LabeledStatementNode:forLabel(src)
			do v:setStatement(self:parseStatement(_g.sling.js.parser.JSParser.CONTEXT_COMMON), false) end
			do return v end
		end
	end
end

function sling.js.parser.JSParser:acceptFunctionDeclarationParameters(isArrowParameter)
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local hasOpenParenthesis = false
		if self:acceptToken2(40) ~= nil then
			hasOpenParenthesis = true
		end
		if not isArrowParameter then
			if not hasOpenParenthesis then
				do return nil end
			end
		end
		do
			local v = {}
			local isArrowSyntax = false
			if self:acceptToken2(41) ~= nil then
				do return v end
			end
			if not hasOpenParenthesis and isArrowParameter and self:acceptToken2(95) ~= nil then
				do return v end
			end
			while true do
				if self:acceptToken2(41) ~= nil or isArrowSyntax then
					do break end
				end
				do
					local mod = self:acceptModifiers(false)
					local pname = nil
					local prm = nil
					if self:acceptToken1("...") ~= nil then
						local src = self:getAcceptedToken()
						local name = self:acceptIdentifier()
						if not (name ~= nil) then
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
							local type = self:acceptDeclarationDataType(true)
							local restparam = _g.sling.model.VariableArgumentsDeclarationNode:forDeclaration(_g.sling.model.VariableDeclarationNode:instance(type, name, nil))
							do restparam:setSource(src) end
							prm = restparam
						end
					elseif self:peekToken2(91) or self:peekToken2(123) then
						if self:peekToken2(91) then
							prm = _g.sling.js.model.DestructuredParameterDeclarationNode:forBinding(self:parseArrayLiteralExpression())
						else
							prm = _g.sling.js.model.DestructuredParameterDeclarationNode:forBinding(self:parseObjectLiteralExpression())
						end
					else
						pname = self:acceptIdentifier()
						if not (pname ~= nil) then
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
						local opt = self:acceptToken2(63)
						local type = _g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create())
						if self:acceptToken2(58) ~= nil then
							type = self:acceptDataType()
							if not (type ~= nil) then
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
							local initializer = nil
							if isArrowParameter then
								if self:peekToken1("=>") then
									isArrowSyntax = true
								end
							end
							if not isArrowSyntax then
								if self:acceptToken2(61) ~= nil then
									if not ((function()
										initializer = self:acceptExpression(false)
										do return initializer end
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
								end
							end
							if (_vm:to_table_with_key(prm, '_isType.sling.js.model.DestructuredParameterDeclarationNode') ~= nil) then
								do prm:setInitializer(initializer, false) end
							elseif not (prm ~= nil) then
								local vd = _g.sling.model.VariableDeclarationNode:instance(type, pname, initializer)
								do vd:setSource(self:getAcceptedToken()) end
								if opt ~= nil then
									do vd:addToModifiers(_g.sling.model.CommonModifierNode:forType(_g.sling.js.model.JSModifier.OPTIONAL)) end
								end
								prm = vd
							end
							if mod ~= nil then
								if (_vm:to_table_with_key(prm, '_isType.sling.model.NodeWithModifiers') ~= nil) then
									do prm:setModifiers(mod, false) end
								elseif (_vm:to_table_with_key(prm, '_isType.sling.model.VariableArgumentsDeclarationNode') ~= nil) then
									local vdec = prm:getVariableDeclaration()
									if vdec ~= nil then
										do vdec:setModifiers(mod, false) end
									end
								else
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unable to set modifiers on node of type `" .. _g.jk.lang.String:safeString(prm:getNodeTypeName()) .. "'", prm, _g.jk.lang.StackTrace:generate()))
								end
							end
							do _g.jk.lang.Vector:append(v, prm) end
							if self:acceptToken2(44) ~= nil then
								if not hasOpenParenthesis then
									self.currentTokenColumn = ctc
									self.currentTokenLine = ctl
									do self.iterator:setCurrentPosition(ctp) end
									while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
										do self.commentQueue:pop() end
									end
									self.previousToken = cpt
									do return nil end
								end
								goto _continue25
							end
							if self:acceptToken2(41) ~= nil or isArrowSyntax then
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
						end
					end
				end
				::_continue25::
			end
			do return v end
		end
	end
end

function sling.js.parser.JSParser:acceptDestructuredVariableDeclarationStatement(requiredSemiColon)
	local expression = nil
	if self:peekToken2(91) then
		expression = self:acceptArrayLiteralExpression()
	elseif self:peekToken2(123) then
		expression = self:acceptObjectLiteralExpression()
	end
	do
		local type = nil
		if self.supportTypeScript then
			type = self:acceptDeclarationDataType(true)
		end
		do
			local initializer = nil
			if self:acceptToken2(61) ~= nil then
				initializer = self:parseExpression(false)
			end
			do
				local v = _g.sling.js.model.DestructuredVariableDeclarationNode:forExpression(expression, initializer, type)
				if requiredSemiColon then
					do self:parseToken2(59) end
				else
					do self:acceptToken2(59) end
				end
				do return v end
			end
		end
	end
end

function sling.js.parser.JSParser:parseArrayLiteralExpression()
	local v = self:acceptArrayLiteralExpression()
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("array literal expression"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
		do return nil end
	end
	do return v end
end

function sling.js.parser.JSParser:parseObjectLiteralExpression()
	local v = self:acceptObjectLiteralExpression()
	if not (v ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("object literal expression"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
		do return nil end
	end
	do return v end
end

function sling.js.parser.JSParser:acceptRegularExpressionLiteralExpression()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		if not (self:getNextCharacter() == 47) then
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
			local c0 = self:peekNextCharacter()
			if not (c0 ~= 47 and c0 ~= 42) then
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
				local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				while true do
					local c = self:getNextCharacter()
					if c == 32 then
						do self.iterator:moveToNextChar() end
						goto _continue26
					end
					if c ~= 47 and c ~= 10 then
						if c == 91 or c == 40 then
							do sb:appendCharacter(c) end
							while true do
								local next = self:getNextCharacter()
								if next == 93 or next == 41 then
									do sb:appendCharacter(next) end
									do break end
								elseif next == 10 then
									do self:skipSpaces() end
									do self:updateStagingToken() end
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("']' is expected"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
								end
								do sb:appendCharacter(next) end
							end
						else
							do sb:appendCharacter(c) end
							if c == 92 then
								local cc = self:getNextCharacter()
								if cc == 10 then
									do self:skipSpaces() end
									do self:updateStagingToken() end
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("invalid regular expression"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
								else
									do sb:appendCharacter(cc) end
								end
							end
						end
						if self:peekNextCharacter() == 32 then
							do sb:appendCharacter(self:getNextCharacter()) end
						elseif self:peekNextCharacter() == 10 or self:hasInputEnded() then
							if c ~= 47 then
								do self:skipSpaces() end
								do self:updateStagingToken() end
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("'/' is expected"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
							end
							do break end
						end
					elseif c == 47 then
						do break end
					end
					::_continue26::
				end
				do
					local regexFlag = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					while true do
						local n = self:peekNextCharacter()
						if self:isValidRegexFlag(n) then
							do regexFlag:appendCharacter(self:getNextCharacter()) end
						else
							do break end
						end
					end
					do self:acceptToken2(59) end
					do
						local vv = _g.sling.js.model.RegularExpressionLiteralExpressionNode:forValue(sb:toString())
						do vv:setRegexFlag(regexFlag:toString()) end
						do return vv end
					end
				end
			end
		end
	end
end

function sling.js.parser.JSParser:isValidRegexFlag(c)
	local syntaxChars = "gimsuy"
	local iter = _g.jk.lang.String:iterate(syntaxChars)
	local cc = 0
	while (function()
		cc = iter:getNextChar()
		do return cc end
	end)() > 0 do
		if cc == c then
			do return true end
		end
	end
	do return false end
end

function sling.js.parser.JSParser:nextCharIsNotEqualTo(char)
	if self:peekNextCharacter() == char then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("valid RegularExpressionLiteral"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return true end
end

function sling.js.parser.JSParser:acceptArrowFunctionDeclarationExpression()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local mod = self:acceptModifiers(false)
		local params = nil
		if not (self:acceptToken2(95) ~= nil) then
			if not ((function()
				params = self:acceptFunctionDeclarationParameters(true)
				do return params end
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
		end
		do
			local rt = self:acceptDeclarationDataType(true)
			if not (rt ~= nil) then
				rt = _g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create())
			end
			do
				local src = self:acceptToken1("=>")
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
					local fd = _g.sling.model.FunctionDeclarationNode:forName(nil, false)
					do fd:setSource(src) end
					do fd:setModifiers(mod, false) end
					do fd:setParameters(params, false) end
					do fd:setReturnType(rt, false) end
					do
						local body = fd:getCreateBody()
						if self:acceptToken2(123) ~= nil then
							while true do
								if self:acceptToken2(125) ~= nil then
									do break end
								end
								do
									local stmt = self:acceptStatement(_g.sling.js.parser.JSParser.CONTEXT_COMMON)
									if stmt ~= nil then
										do body:addNode(stmt) end
										goto _continue27
									end
									do self:skipSpaces() end
									do self:updateStagingToken() end
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("arrow function statement"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
								end
								::_continue27::
							end
						else
							local exp = self:parseExpression(false)
							do body:addNode(exp) end
						end
						do
							local v = _g.sling.model.FunctionDeclarationExpressionNode:forDeclaration(fd)
							do v:setSource(src) end
							do return v end
						end
					end
				end
			end
		end
	end
end

function sling.js.parser.JSParser:acceptFunctionDeclarationExpression()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local mod = self:acceptModifiers(false)
		local src = self:acceptToken1("function")
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
		if self:acceptToken2(42) ~= nil then
			if not (mod ~= nil) then
				mod = {}
			end
			do _g.jk.lang.Vector:append(mod, _g.sling.model.CommonModifierNode:forType(_g.sling.js.model.JSModifier.GENERATOR)) end
		end
		do
			local name = self:acceptIdentifier()
			local params = self:acceptFunctionDeclarationParameters(false)
			if not (params ~= nil) then
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
				local type = self:acceptDeclarationDataType(true)
				local fd = _g.sling.model.FunctionDeclarationNode:forName(name, false)
				do fd:setSource(src) end
				do fd:setModifiers(mod, false) end
				do fd:setParameters(params, false) end
				do fd:setReturnType(type, false) end
				do
					local body = fd:getCreateBody()
					do self:parseToken2(123) end
					while true do
						if self:acceptToken2(125) ~= nil then
							do break end
						end
						do
							local stmt = self:acceptStatement(_g.sling.js.parser.JSParser.CONTEXT_COMMON)
							if stmt ~= nil then
								do body:addNode(stmt) end
								goto _continue28
							end
							do self:skipSpaces() end
							do self:updateStagingToken() end
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("function declaration expression statement"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
						end
						::_continue28::
					end
					do
						local v = _g.sling.js.model.JavascriptFunctionDeclarationExpressionNode:forDeclaration(fd)
						do v:setSource(src) end
						do return v end
					end
				end
			end
		end
	end
end

function sling.js.parser.JSParser:acceptFunctionDeclarationStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local mod = self:acceptModifiers(false)
		local src = self:acceptToken1("function")
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
		if self:acceptToken2(42) ~= nil then
			if not (mod ~= nil) then
				mod = {}
			end
			do _g.jk.lang.Vector:append(mod, _g.sling.model.CommonModifierNode:forType(_g.sling.js.model.JSModifier.GENERATOR)) end
		end
		do
			local name = self:acceptIdentifier()
			if not (name ~= nil) then
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
				local grc = self:acceptGenericTypes()
				local params = self:acceptFunctionDeclarationParameters(false)
				if not (params ~= nil) then
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
					local type = self:acceptDeclarationDataType(true)
					local fd = _g.sling.model.FunctionDeclarationNode:forName(name, false)
					do fd:setSource(src) end
					do fd:setModifiers(mod, false) end
					do fd:setParameters(params, false) end
					do fd:setReturnType(type, false) end
					do fd:setGenericTypes(grc, false) end
					if self:acceptToken2(123) ~= nil then
						local body = fd:getCreateBody()
						while true do
							if self:acceptToken2(125) ~= nil then
								do break end
							end
							do
								local stmt = self:acceptStatement(_g.sling.js.parser.JSParser.CONTEXT_COMMON)
								if stmt ~= nil then
									do body:addNode(stmt) end
									goto _continue29
								end
								do self:skipSpaces() end
								do self:updateStagingToken() end
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("function declaration statement"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
							end
							::_continue29::
						end
					end
					do return fd end
				end
			end
		end
	end
end

function sling.js.parser.JSParser:acceptConstructorDeclaration()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local mod = self:acceptModifiers(false)
		local src = self:acceptToken1("constructor")
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
			local params = self:acceptFunctionDeclarationParameters(false)
			local fd = _g.sling.model.ConstructorDeclarationNode._construct0(_g.sling.model.ConstructorDeclarationNode._create())
			do fd:setParameters(params, false) end
			do fd:setSource(src) end
			do fd:setModifiers(mod, false) end
			if self:acceptToken2(123) ~= nil then
				local body = fd:getCreateBody()
				while true do
					if self:acceptToken2(125) ~= nil then
						do break end
					end
					do
						local stmt = self:acceptStatement(_g.sling.js.parser.JSParser.CONTEXT_COMMON)
						if stmt ~= nil then
							do body:addNode(stmt) end
							goto _continue30
						end
						do self:skipSpaces() end
						do self:updateStagingToken() end
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("method declaration statement"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
					end
					::_continue30::
				end
			end
			do return fd end
		end
	end
end

function sling.js.parser.JSParser:acceptPropertyName()
	local num = self:acceptNumberLiteralExpression()
	if num ~= nil then
		do return num end
	end
	do
		local str = self:acceptStringLiteralExpression()
		if str ~= nil then
			do return str end
		end
		do
			local symbol = self:acceptSymbolExpression()
			if symbol ~= nil then
				do return symbol end
			end
			if self:acceptToken2(91) ~= nil then
				local v = self:parseExpression(false)
				if self.supportTypeScript then
					local d = self:acceptDeclarationDataType(true)
					if d ~= nil then
						do v:setDefaultDataType(d, false) end
					end
				end
				do self:parseToken2(93) end
				do return v end
			end
			do return nil end
		end
	end
end

function sling.js.parser.JSParser:acceptPropertyFunctionDeclaration(forInterface)
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local mod = self:acceptModifiers(false)
		local dir = self:acceptAnyToken({
			"get",
			"set"
		})
		local name = self:acceptIdentifier()
		local grc = self:acceptGenericTypes()
		local exp = nil
		if not (name ~= nil) then
			if not self:peekToken2(40) then
				exp = self:acceptPropertyName()
				if not (exp ~= nil) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
			elseif dir ~= nil then
				name = dir.value
				dir = nil
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
			local src = nil
			if dir ~= nil then
				src = dir
			else
				src = self:getAcceptedToken()
			end
			do
				local params = self:acceptFunctionDeclarationParameters(false)
				if not (params ~= nil) then
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
					local fd = nil
					if name ~= nil then
						fd = _g.sling.js.model.PropertyFunctionDeclarationNode:forName(name)
					else
						fd = _g.sling.js.model.PropertyFunctionDeclarationNode:forExpression(exp)
					end
					do fd:setSource(src) end
					do fd:setParameters(params, false) end
					do fd:setModifiers(mod, false) end
					do fd:setGenericTypes(grc, false) end
					do
						local rt = self:acceptDeclarationDataType(false)
						if not (rt ~= nil) then
							rt = _g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create())
						end
						do fd:setReturnType(rt, false) end
						if dir ~= nil then
							if _g.jk.lang.String:equals(dir.value, "set") then
								do fd:setDirection(_g.sling.js.model.PropertyFunctionDeclarationNode.DIRECTION_SET) end
							elseif _g.jk.lang.String:equals(dir.value, "get") then
								do fd:setDirection(_g.sling.js.model.PropertyFunctionDeclarationNode.DIRECTION_GET) end
							end
							if mod ~= nil then
								if _g.sling.util.ModifierUtil:hasCommonModifier(fd, _g.sling.js.model.JSModifier.GENERATOR) then
									do _g.sling.util.ModifierUtil:removeCommonModifier(fd, _g.sling.js.model.JSModifier.GENERATOR) end
									do self:onParseMessage(_g.sling.common.WarningMessage:forText("getter/setter method declaration should not contain generator symbol", self:getStagingToken())) end
								end
								if _g.sling.util.ModifierUtil:hasCommonModifier(fd, _g.sling.model.Modifier.ASYNCHRONOUS) then
									do _g.sling.util.ModifierUtil:removeCommonModifier(fd, _g.sling.model.Modifier.ASYNCHRONOUS) end
									do self:onParseMessage(_g.sling.common.WarningMessage:forText("getter/setter method declaration should not contain async symbol", self:getStagingToken())) end
								end
							end
						end
						if _g.sling.util.ModifierUtil:hasCommonModifier(fd, _g.sling.model.Modifier.ABSTRACT) or forInterface then
							do self:acceptToken2(59) end
							do return fd end
						end
						if self:acceptToken2(123) ~= nil then
							local body = fd:getCreateBody()
							while true do
								if self:acceptToken2(125) ~= nil then
									do break end
								end
								do
									local stmt = self:acceptStatement(_g.sling.js.parser.JSParser.CONTEXT_COMMON)
									if stmt ~= nil then
										do body:addNode(stmt) end
										goto _continue31
									end
									do self:skipSpaces() end
									do self:updateStagingToken() end
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("method declaration statement"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
								end
								::_continue31::
							end
						elseif self:acceptToken2(46) ~= nil then
							self.currentTokenColumn = ctc
							self.currentTokenLine = ctl
							do self.iterator:setCurrentPosition(ctp) end
							while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
								do self.commentQueue:pop() end
							end
							self.previousToken = cpt
							do return nil end
						else
							if not self.supportTypeScript then
								self.currentTokenColumn = ctc
								self.currentTokenLine = ctl
								do self.iterator:setCurrentPosition(ctp) end
								while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
									do self.commentQueue:pop() end
								end
								self.previousToken = cpt
								do return nil end
							end
							do self:acceptToken2(59) end
						end
						do return fd end
					end
				end
			end
		end
	end
end

function sling.js.parser.JSParser:acceptPropertyVariableDeclaration()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local mod = self:acceptModifiers(false)
		local src = self:getAcceptedToken()
		local idt = self:acceptIdentifier()
		if not (idt ~= nil) then
			self.currentTokenColumn = ctc
			self.currentTokenLine = ctl
			do self.iterator:setCurrentPosition(ctp) end
			while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
				do self.commentQueue:pop() end
			end
			self.previousToken = cpt
			do return nil end
		end
		if self:acceptToken2(63) ~= nil then
			if not (mod ~= nil) then
				mod = {}
			end
			do _g.jk.lang.Vector:append(mod, _g.sling.model.CommonModifierNode:forType(_g.sling.js.model.JSModifier.OPTIONAL)) end
		end
		if not (src ~= nil) then
			src = self:getAcceptedToken()
		end
		do
			local tpe = self:acceptDeclarationDataType(true)
			if not (tpe ~= nil) then
				tpe = _g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create())
			end
			do
				local ini = nil
				if self:acceptToken2(61) ~= nil then
					ini = self:parseExpression(false)
				end
				do self:acceptToken2(59) end
				if not (mod ~= nil) then
					mod = {}
				end
				do _g.jk.lang.Vector:append(mod, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.PROPERTY)) end
				do _g.jk.lang.Vector:append(mod, _g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.PUBLIC)) end
				do
					local v = _g.sling.model.VariableDeclarationNode._construct0(_g.sling.model.VariableDeclarationNode._create())
					do v:setName(idt) end
					do v:setSource(src) end
					do v:setModifiers(mod, false) end
					do v:setType(tpe, false) end
					do v:setInitializer(ini, false) end
					do return v end
				end
			end
		end
	end
end

function sling.js.parser.JSParser:acceptClassDeclaration(isExportDeclaration)
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local mod = self:acceptModifiers(false)
		local src = self:acceptToken1("class")
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
		if not self:isSpaceCharacter(self:peekNextCharacter()) then
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
			local name = nil
			if self:peekToken1("extends") then
				if not isExportDeclaration then
					do self:skipSpaces() end
					do self:updateStagingToken() end
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("class name"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
				end
			elseif isExportDeclaration then
				name = self:acceptIdentifier()
			else
				name = self:parseIdentifier()
			end
			do
				local v = _g.sling.model.ClassDeclarationNode:forName(name)
				do v:setSource(src) end
				do v:setGenericTypes(self:acceptGenericTypes(), false) end
				do v:setModifiers(mod, false) end
				while true do
					if self.supportTypeScript then
						if self:acceptToken1("implements") ~= nil then
							local ref = self:acceptReferenceDataType()
							if not (ref ~= nil) then
								do self:skipSpaces() end
								do self:updateStagingToken() end
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("reference data"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
							end
							do v:addBaseTypeImplements(ref) end
							if self:acceptToken2(44) ~= nil then
								while true do
									local irf = self:acceptReferenceDataType()
									if not (irf ~= nil) then
										do self:skipSpaces() end
										do self:updateStagingToken() end
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("reference data"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
									end
									do v:addBaseTypeImplements(irf) end
									if self:acceptToken2(44) ~= nil then
										goto _continue32
									end
									do break end
									::_continue32::
								end
							end
							goto _continue33
						end
					end
					if self:acceptToken1("extends") ~= nil then
						local first = true
						while true do
							if not (self:acceptToken2(44) ~= nil) then
								if not first then
									do break end
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
									local ref = self:acceptReferenceDataType()
									local isNotValidRef = false
									if ref ~= nil then
										if self:acceptToken2(40) ~= nil then
											isNotValidRef = true
										else
											do v:addBaseTypeExtends(ref) end
										end
									end
									if not (ref ~= nil) or isNotValidRef then
										self.currentTokenColumn = ctc
										self.currentTokenLine = ctl
										do self.iterator:setCurrentPosition(ctp) end
										while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
											do self.commentQueue:pop() end
										end
										self.previousToken = cpt
										do v:addBaseTypeExtendsAsExpression(self:parseExpression(false)) end
									end
									first = false
									if self:peekToken2(123) then
										do break end
									end
								end
							end
						end
						goto _continue33
					end
					do break end
					::_continue33::
				end
				do self:parseToken2(123) end
				while true do
					local mm = self:acceptClassBody()
					if mm ~= nil then
						do self:acceptToken2(59) end
						do v:addNode(mm) end
						goto _continue34
					end
					if self:acceptToken2(125) ~= nil then
						do break end
					end
					do self:skipSpaces() end
					do self:updateStagingToken() end
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("declaration in class"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
					::_continue34::
				end
				do return v end
			end
		end
	end
end

function sling.js.parser.JSParser:acceptInterfaceDeclaration()
	local src = self:acceptToken1("interface")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local idt = self:parseIdentifier()
		local grc = self:acceptGenericTypes()
		local v = _g.sling.model.InterfaceDeclarationNode._construct0(_g.sling.model.InterfaceDeclarationNode._create())
		if self.supportTypeScript then
			if self:acceptToken1("extends") ~= nil then
				while true do
					local ref = self:acceptReferenceDataType()
					if not (ref ~= nil) then
						do self:skipSpaces() end
						do self:updateStagingToken() end
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("reference data"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
					end
					do v:addBaseTypeExtends(ref) end
					if not (self:acceptToken2(44) ~= nil) then
						do break end
					end
					goto _continue35
					::_continue35::
				end
			end
		end
		do self:parseToken2(123) end
		while true do
			if self:acceptToken2(125) ~= nil then
				do break end
			end
			do
				local prf = self:acceptPropertyFunctionDeclaration(true)
				if prf ~= nil then
					do v:addNode(prf) end
					goto _continue36
				end
				do
					local vdc = self:acceptPropertyVariableDeclaration()
					if vdc ~= nil then
						do v:addNode(vdc) end
						goto _continue36
					end
					do
						local desctructure = self:acceptDestructuredVariableDeclarationStatement(false)
						if desctructure ~= nil then
							do v:addNode(desctructure) end
							goto _continue36
						end
						do self:skipSpaces() end
						do self:updateStagingToken() end
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("property function or variable declarations"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
					end
				end
			end
			::_continue36::
		end
		do v:setName(idt) end
		do v:setSource(src) end
		do v:setGenericTypes(grc, false) end
		do return v end
	end
end

function sling.js.parser.JSParser:acceptGenericTypes()
	if not self.supportTypeScript then
		do return nil end
	end
	do
		local src = self:acceptToken2(60)
		if not (src ~= nil) then
			do return nil end
		end
		do
			local grs = {}
			while true do
				local idt = self:parseIdentifier()
				local tmp = _g.sling.model.TemplateDeclarationNode._construct0(_g.sling.model.TemplateDeclarationNode._create())
				if self:acceptToken1("extends") ~= nil then
					do tmp:addBaseTypeExtends(self:parseReferenceDataType()) end
				end
				do tmp:setName(idt) end
				do _g.jk.lang.Vector:append(grs, tmp) end
				if self:acceptToken2(44) ~= nil then
					goto _continue37
				end
				if self:acceptToken2(62) ~= nil then
					do break end
				end
				do self:skipSpaces() end
				do self:updateStagingToken() end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`,' or `>'"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
				::_continue37::
			end
			do return grs end
		end
	end
end

function sling.js.parser.JSParser:acceptClassBody()
	local constructor = self:acceptConstructorDeclaration()
	if constructor ~= nil then
		do return constructor end
	end
	do
		local amds = self:acceptPropertyFunctionDeclaration(false)
		if amds ~= nil then
			do return amds end
		end
		if self.supportTypeScript then
			local vdc = self:acceptPropertyVariableDeclaration()
			if vdc ~= nil then
				do return vdc end
			end
		end
		do return nil end
	end
end

function sling.js.parser.JSParser:parseBlockOrStatement()
	local v = nil
	if self:peekToken2(123) then
		v = self:parseBlock()
	else
		local stmt = self:parseStatement(_g.sling.js.parser.JSParser.CONTEXT_BLOCK_SCOPE)
		v = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
		do v:addNode(stmt) end
	end
	do return v end
end

function sling.js.parser.JSParser:acceptIfStatement()
	local src = self:acceptToken1("if")
	if not (src ~= nil) then
		do return nil end
	end
	do self:parseToken2(40) end
	do
		local condition = self:parseExpression(false)
		do self:parseToken2(41) end
		do
			local block = self:parseBlockOrStatement()
			local elseBlock = nil
			if self:acceptToken1("else") ~= nil then
				local elsesrc = self:getAcceptedToken()
				local childIf = self:acceptIfStatement()
				if childIf ~= nil then
					local ebb = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
					do ebb:addNode(childIf) end
					do ebb:setSource(elsesrc) end
					elseBlock = ebb
				else
					elseBlock = self:parseBlockOrStatement()
				end
			end
			do
				local v = _g.sling.model.IfStatementNode:instance(condition, block, elseBlock)
				do v:setSource(src) end
				do return v end
			end
		end
	end
end

function sling.js.parser.JSParser:acceptBlock()
	if not (self:acceptToken2(123) ~= nil) then
		do return nil end
	end
	do
		local src = nil
		local v = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
		while true do
			if self:acceptToken2(125) ~= nil then
				do break end
			end
			do v:addNode(self:parseStatement(_g.sling.js.parser.JSParser.CONTEXT_BLOCK_SCOPE)) end
		end
		do v:setSource(src) end
		do return v end
	end
end

function sling.js.parser.JSParser:acceptContinueStatement()
	local src = self:acceptToken1("continue")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local id = self:acceptIdentifier()
		do self:acceptToken2(59) end
		if id ~= nil then
			local b = _g.sling.model.ContinueLabelStatementNode:forLabel(id)
			do b:setSource(src) end
			do return b end
		end
		do
			local v = _g.sling.model.ContinueStatementNode._construct0(_g.sling.model.ContinueStatementNode._create())
			do v:setSource(src) end
			do return v end
		end
	end
end

function sling.js.parser.JSParser:acceptDebuggerStatement()
	local src = self:acceptToken1("debugger")
	if not (src ~= nil) then
		do return nil end
	end
	do self:acceptToken2(59) end
	do
		local v = _g.sling.js.model.DebuggerStatementNode._construct0(_g.sling.js.model.DebuggerStatementNode._create())
		do v:setSource(src) end
		do return v end
	end
end

function sling.js.parser.JSParser:acceptWhileStatement()
	local src = self:acceptToken1("while")
	if not (src ~= nil) then
		do return nil end
	end
	do self:parseToken2(40) end
	do
		local condition = self:parseExpression(false)
		do self:parseToken2(41) end
		do
			local block = self:parseBlockOrStatement()
			local v = _g.sling.model.WhileStatementNode:instance(condition, block, nil)
			do v:setSource(src) end
			do return v end
		end
	end
end

function sling.js.parser.JSParser:acceptDoWhileStatement()
	local src = self:acceptToken1("do")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local block = self:parseBlockOrStatement()
		do self:parseToken1("while") end
		do self:parseToken2(40) end
		do
			local condition = self:parseExpression(false)
			do self:parseToken2(41) end
			do
				local v = _g.sling.model.DoWhileStatementNode:instance(condition, block)
				do v:setSource(src) end
				do return v end
			end
		end
	end
end

function sling.js.parser.JSParser:acceptWithStatement()
	local src = self:acceptToken1("with")
	if not (src ~= nil) then
		do return nil end
	end
	do self:parseToken2(40) end
	do
		local expression = self:parseExpression(false)
		do self:parseToken2(41) end
		do
			local block = self:parseBlockOrStatement()
			local v = _g.sling.model.WithStatementNode._construct0(_g.sling.model.WithStatementNode._create())
			do v:setExpression(expression, false) end
			do v:setBlock(block, false) end
			do v:setSource(src) end
			do return v end
		end
	end
end

function sling.js.parser.JSParser:acceptBreakStatement()
	local src = self:acceptToken1("break")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local id = self:acceptIdentifier()
		do self:acceptToken2(59) end
		if id ~= nil then
			local b = _g.sling.model.BreakLabelStatementNode:forLabel(id)
			do b:setSource(src) end
			do return b end
		end
		do
			local v = _g.sling.model.BreakStatementNode._construct0(_g.sling.model.BreakStatementNode._create())
			do v:setSource(src) end
			do return v end
		end
	end
end

function sling.js.parser.JSParser:acceptThrowStatement()
	local src = self:acceptToken1("throw")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local expr = nil
		if not (self:acceptToken2(59) ~= nil) then
			expr = self:parseExpression(false)
			do self:acceptToken2(59) end
		end
		do
			local v = _g.sling.model.ThrowStatementNode:forExpression(expr)
			do v:setSource(src) end
			do return v end
		end
	end
end

function sling.js.parser.JSParser:acceptTryCatchStatement()
	local src = self:acceptToken1("try")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local v = _g.sling.model.TryCatchStatementNode._construct0(_g.sling.model.TryCatchStatementNode._create())
		do v:setSource(src) end
		do v:setTryBlock(self:parseBlockOrStatement(), false) end
		do
			local b = false
			if self:acceptToken1("catch") ~= nil then
				b = true
				do
					local vd = nil
					if self:acceptToken2(40) ~= nil then
						vd = _g.sling.model.VariableDeclarationNode:forName(self:parseIdentifier())
						do self:parseToken2(41) end
					end
					do v:addToCatchBlocks(_g.sling.model.CatchBlockNode:instance(vd, self:parseBlockOrStatement())) end
				end
			end
			if self:acceptToken1("finally") ~= nil then
				b = true
				do v:setFinallyBlock(self:parseBlockOrStatement(), false) end
			end
			if not b then
				do self:skipSpaces() end
				do self:updateStagingToken() end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("`catch` or/and `finally` block"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
			end
			do return v end
		end
	end
end

function sling.js.parser.JSParser:acceptForEachStatement()
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
			local iterateKeys = false
			local isAwait = false
			if self:acceptToken1("await") ~= nil then
				isAwait = true
			end
			do self:parseToken2(40) end
			do
				local val = nil
				local exp = nil
				if self:peekToken1("var") or self:peekToken1("let") or self:peekToken1("const") then
					val = self:acceptVariableDeclarationStatement(_g.sling.js.parser.JSParser.CONTEXT_BLOCK_SCOPE, false)
				else
					val = self:acceptLeftHandSideExpression()
					if not (val ~= nil) then
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
						local mul = _g.sling.model.MultipleExpressionNode._construct0(_g.sling.model.MultipleExpressionNode._create())
						do mul:addToExpressions(val) end
						while true do
							local right = self:acceptLeftHandSideExpression()
							if right ~= nil then
								do mul:addToExpressions(right) end
							end
							if not (self:acceptToken2(44) ~= nil) then
								do break end
							end
						end
						val = mul
					end
				end
				if not (self:acceptToken1("in") ~= nil or self:acceptToken1("of") ~= nil) then
					self.currentTokenColumn = ctc
					self.currentTokenLine = ctl
					do self.iterator:setCurrentPosition(ctp) end
					while self.commentQueue ~= nil and self.commentQueue:getSize() > cqs do
						do self.commentQueue:pop() end
					end
					self.previousToken = cpt
					do return nil end
				end
				if _g.jk.lang.String:equals(self:getAcceptedToken().value, "in") then
					iterateKeys = true
				end
				exp = self:parseExpression(false)
				do self:parseToken2(41) end
				do
					local block = self:parseBlockOrStatement()
					local v = _g.sling.model.ForEachStatementNode:instance(val, exp, block, nil)
					do v:setIterateKeys(iterateKeys) end
					if isAwait then
						do v:addToModifiers(_g.sling.model.CommonModifierNode:forType(_g.sling.js.model.JSModifier.AWAIT)) end
					end
					do v:setSource(src) end
					do return v end
				end
			end
		end
	end
end

function sling.js.parser.JSParser:acceptSwitchStatement()
	local src = self:acceptToken1("switch")
	if not (src ~= nil) then
		do return nil end
	end
	do self:parseToken2(40) end
	do
		local val = self:parseExpression(false)
		do self:parseToken2(41) end
		do self:parseToken2(123) end
		do
			local stmts = {}
			local currentDefaultValue = nil
			while true do
				local block = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
				local cserr = nil
				local r = nil
				if self:acceptToken1("case") ~= nil then
					cserr = self:getAcceptedToken()
					r = self:parseExpression(false)
				elseif self:acceptToken1("default") ~= nil then
					cserr = self:getAcceptedToken()
					if currentDefaultValue ~= nil then
						do self:onParseMessage(_g.sling.common.WarningMessage:forText("Multiple default blocks encountered in switch statement", self:getStagingToken())) end
					end
				else
					do break end
				end
				do self:parseToken2(58) end
				while true do
					if self:peekToken1("case") or self:peekToken1("default") or self:peekToken2(125) then
						do break end
					end
					do block:addNode(self:parseStatement(_g.sling.js.parser.JSParser.CONTEXT_COMMON)) end
				end
				if r ~= nil then
					local o = _g.sling.model.CaseEqualsBlockNode:instance(r, block)
					do o:setSource(cserr) end
					do _g.jk.lang.Vector:append(stmts, o) end
				else
					currentDefaultValue = _g.sling.model.CaseDefaultBlockNode:instance(block)
					do currentDefaultValue:setSource(cserr) end
				end
			end
			if currentDefaultValue ~= nil then
				do _g.jk.lang.Vector:append(stmts, currentDefaultValue) end
			end
			do self:parseToken2(125) end
			do
				local v = _g.sling.model.SwitchStatementNode:forExpression(val)
				do v:setBlocks(stmts, false) end
				do v:setSource(src) end
				do return v end
			end
		end
	end
end

function sling.js.parser.JSParser:acceptReturnStatement()
	local src = self:acceptToken1("return")
	if not (src ~= nil) then
		do return nil end
	end
	do
		local expr = nil
		if not (self:acceptToken2(59) ~= nil) then
			expr = self:acceptExpression(false)
			do self:acceptToken2(59) end
		end
		do
			local v = _g.sling.model.ReturnStatementNode:forExpression(expr)
			do v:setSource(src) end
			do return v end
		end
	end
end

function sling.js.parser.JSParser:acceptTypeAliasDeclarationStatement()
	local ctc = self.currentTokenColumn
	local ctl = self.currentTokenLine
	local ctp = self.iterator:getCurrentPosition()
	local cqs = 0
	if self.commentQueue ~= nil then
		cqs = self.commentQueue:getSize()
	end
	do
		local cpt = self.previousToken
		local src = self:acceptToken1("type")
		if not (src ~= nil) then
			do return nil end
		end
		if not self:isSpaceCharacter(self:peekNextCharacter()) then
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
			local idt = self:parseIdentifier()
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
				local dtp = self:parseDataType()
				local v = _g.sling.model.TypeAliasDeclarationNode._construct0(_g.sling.model.TypeAliasDeclarationNode._create())
				do v:setName(idt) end
				do v:setType(dtp, false) end
				do v:setSource(src) end
				do v:setGenericTypes(gen, false) end
				do return v end
			end
		end
	end
end

function sling.js.parser.JSParser:parseBlock()
	local block = self:acceptBlock()
	if not (block ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("block"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
		do return nil end
	end
	do return block end
end

function sling.js.parser.JSParser:parseStatement(currentContext)
	local statement = self:acceptStatement(currentContext)
	if not (statement ~= nil) then
		do self:skipSpaces() end
		do self:updateStagingToken() end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("statement"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
	end
	do return statement end
end

function sling.js.parser.JSParser:acceptEmptyStatement()
	if not (self:acceptToken2(59) ~= nil) then
		do return nil end
	end
	do
		local v = _g.sling.model.EmptyStatementNode._construct0(_g.sling.model.EmptyStatementNode._create())
		do v:setSource(self:getAcceptedToken()) end
		do return v end
	end
end

function sling.js.parser.JSParser:acceptStatement(currentContext)
	local comment = self:acceptComment()
	if comment ~= nil then
		do return comment end
	end
	if currentContext == _g.sling.js.parser.JSParser.CONTEXT_TOP_LEVEL then
		local imp = self:acceptImportStatement()
		if imp ~= nil then
			do return imp end
		end
		do
			local exps = self:acceptExportStatement()
			if exps ~= nil then
				do return exps end
			end
			if self.supportTypeScript then
				local inf = self:acceptInterfaceDeclaration()
				if inf ~= nil then
					do return inf end
				end
			end
		end
	end
	do
		local vd = self:acceptVariableDeclarationStatement(currentContext, false)
		if vd ~= nil then
			do return vd end
		end
		do
			local empty = self:acceptEmptyStatement()
			if empty ~= nil then
				do return empty end
			end
			do
				local block = self:acceptBlock()
				if block ~= nil then
					do return block end
				end
				do
					local ifsd = self:acceptIfStatement()
					if ifsd ~= nil then
						do return ifsd end
					end
					do
						local dsd = self:acceptDebuggerStatement()
						if dsd ~= nil then
							do return dsd end
						end
						do
							local forinsd = self:acceptForEachStatement()
							if forinsd ~= nil then
								do return forinsd end
							end
							do
								local forstat = self:acceptForStatement()
								if forstat ~= nil then
									do return forstat end
								end
								do
									local dwsd = self:acceptDoWhileStatement()
									if dwsd ~= nil then
										do return dwsd end
									end
									do
										local wsd = self:acceptWhileStatement()
										if wsd ~= nil then
											do return wsd end
										end
										do
											local withstatement = self:acceptWithStatement()
											if withstatement ~= nil then
												do return withstatement end
											end
											do
												local trysd = self:acceptTryCatchStatement()
												if trysd ~= nil then
													do return trysd end
												end
												do
													local rsd = self:acceptReturnStatement()
													if rsd ~= nil then
														do return rsd end
													end
													do
														local ssd = self:acceptSwitchStatement()
														if ssd ~= nil then
															do return ssd end
														end
														do
															local bsd = self:acceptBreakStatement()
															if bsd ~= nil then
																do return bsd end
															end
															do
																local csd = self:acceptContinueStatement()
																if csd ~= nil then
																	do return csd end
																end
																do
																	local cd = self:acceptClassDeclaration(false)
																	if cd ~= nil then
																		do return cd end
																	end
																	do
																		local en = self:acceptEnumDeclaration()
																		if en ~= nil then
																			do return en end
																		end
																		do
																			local alsn = self:acceptLabeledStatement()
																			if alsn ~= nil then
																				do return alsn end
																			end
																			do
																				local fd = self:acceptFunctionDeclarationStatement()
																				if fd ~= nil then
																					do return fd end
																				end
																				do
																					local throwStatement = self:acceptThrowStatement()
																					if throwStatement ~= nil then
																						do return throwStatement end
																					end
																					if currentContext == _g.sling.js.parser.JSParser.CONTEXT_TOP_LEVEL then
																						local propfd = self:acceptPropertyFunctionDeclaration(false)
																						if propfd ~= nil then
																							do return propfd end
																						end
																					end
																					if self.supportTypeScript then
																						local ta = self:acceptTypeAliasDeclarationStatement()
																						if ta ~= nil then
																							do return ta end
																						end
																					end
																					do
																						local xpr = self:acceptExpression(false)
																						if xpr ~= nil then
																							do self:acceptToken2(59) end
																							do return xpr end
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

function sling.js.parser.JSParser:parse()
	local v = _g.sling.common.CodeFileNode._construct0(_g.sling.common.CodeFileNode._create())
	do v:setFile(self:getCurrentFile()) end
	do v:renameNode(self:getCurrentFileId()) end
	while true do
		if self:acceptEndOfFile() ~= nil then
			do break end
		end
		do
			local stmt = self:acceptStatement(_g.sling.js.parser.JSParser.CONTEXT_TOP_LEVEL)
			if stmt ~= nil then
				do v:addNode(stmt) end
				goto _continue38
			end
			do self:skipSpaces() end
			do self:updateStagingToken() end
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expected: " .. self:getDisplayText("module statement"), self:getStagingToken(), _g.jk.lang.StackTrace:generate()))
		end
		::_continue38::
	end
	do return v end
end

function sling.js.parser.JSParser:parseStringAsExpression(str, withAngularPiping)
	local v = _g.sling.js.parser.JSParser._construct0(_g.sling.js.parser.JSParser._create())
	do v:initializeForString(str, nil) end
	do v:setAcceptAngularPiping(withAngularPiping) end
	do return v:parseExpression(false) end
end

function sling.js.parser.JSParser:getSupportTypeScript()
	do return self.supportTypeScript end
end

function sling.js.parser.JSParser:setSupportTypeScript(v)
	self.supportTypeScript = v
	do return self end
end

function sling.js.parser.JSParser:getAcceptAngularPiping()
	do return self.acceptAngularPiping end
end

function sling.js.parser.JSParser:setAcceptAngularPiping(v)
	self.acceptAngularPiping = v
	do return self end
end

sling.js.parser.UnicodeCharacter = {}
sling.js.parser.UnicodeCharacter.__index = sling.js.parser.UnicodeCharacter
_vm:set_metatable(sling.js.parser.UnicodeCharacter, {})

function sling.js.parser.UnicodeCharacter._create()
	local v = _vm:set_metatable({}, sling.js.parser.UnicodeCharacter)
	return v
end

function sling.js.parser.UnicodeCharacter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.parser.UnicodeCharacter'
	self['_isType.sling.js.parser.UnicodeCharacter'] = true
end

function sling.js.parser.UnicodeCharacter:_construct0()
	sling.js.parser.UnicodeCharacter._init(self)
	return self
end

function sling.js.parser.UnicodeCharacter:isIDStartCharacter(c)
	do return _g.sling.js.parser.UnicodeCharacter:isLetterCombined(c) or _g.sling.js.parser.UnicodeCharacter:isOtherLetter(c) or _g.sling.js.parser.UnicodeCharacter:isLetterNumber(c) or _g.sling.js.parser.UnicodeCharacter:isModifierLetter(c) end
end

function sling.js.parser.UnicodeCharacter:isIDContinueCharacter(c)
	do return _g.sling.js.parser.UnicodeCharacter:isIDStartCharacter(c) or _g.sling.js.parser.UnicodeCharacter:isNonSpacingMark(c) or _g.sling.js.parser.UnicodeCharacter:isSpacingCombiningMark(c) or _g.sling.js.parser.UnicodeCharacter:isDecimalDigitNumber(c) or _g.sling.js.parser.UnicodeCharacter:isConnectorPunctuation(c) end
end

function sling.js.parser.UnicodeCharacter:isLetterCombined(c)
	local isValidChar = false
	if c >= 65 and c <= 90 or (c >= 97 and c <= 122) or (c >= 192 and c <= 214) or (c >= 216 and c <= 246) or (c >= 444 and c <= 447) or (c >= 248 and c <= 442) or (c >= 452 and c <= 659) or (c >= 661 and c <= 687) or (c >= 880 and c <= 883) or (c >= 886 and c <= 887) or (c >= 891 and c <= 893) or (c >= 904 and c <= 906) or (c >= 910 and c <= 929) or (c >= 931 and c <= 1013) or (c >= 1015 and c <= 1153) or (c >= 1162 and c <= 1319) then
		isValidChar = true
	elseif c >= 1329 and c <= 1366 or (c >= 1377 and c <= 1415) or (c >= 4256 and c <= 4293) or (c >= 7424 and c <= 7467) or (c >= 7531 and c <= 7543) or (c >= 7545 and c <= 7578) or (c >= 7680 and c <= 7957) or (c >= 7960 and c <= 7965) or (c >= 7968 and c <= 8005) or (c >= 8008 and c <= 8013) or (c >= 8016 and c <= 8023) or (c >= 8031 and c <= 8061) or (c >= 8064 and c <= 8116) or (c >= 8118 and c <= 8124) or (c >= 8130 and c <= 8132) or (c >= 8134 and c <= 8140) then
		isValidChar = true
	elseif c >= 8144 and c <= 8147 or (c >= 8150 and c <= 8155) or (c >= 8160 and c <= 8172) or (c >= 8178 and c <= 8180) or (c >= 8182 and c <= 8188) or (c >= 8458 and c <= 8467) or (c >= 8473 and c <= 8477) or (c >= 8490 and c <= 8493) or (c >= 8495 and c <= 8500) or (c >= 8508 and c <= 8511) or (c >= 8517 and c <= 8521) or (c >= 8579 and c <= 8580) or (c >= 11264 and c <= 11310) or (c >= 11312 and c <= 11358) or (c >= 11360 and c <= 11387) or (c >= 11390 and c <= 11492) then
		isValidChar = true
	elseif c >= 11499 and c <= 11502 or (c >= 11506 and c <= 11507) or (c >= 11520 and c <= 11557) or (c >= 42560 and c <= 42605) or (c >= 42624 and c <= 42647) or (c >= 42786 and c <= 42863) or (c >= 42865 and c <= 42887) or (c >= 42891 and c <= 42894) or (c >= 42896 and c <= 42899) or (c >= 42912 and c <= 42922) or (c >= 64256 and c <= 64262) or (c >= 64275 and c <= 64279) or (c >= 65313 and c <= 65338) or (c >= 65345 and c <= 65370) or (c >= 66560 and c <= 66639) or (c >= 119973 and c <= 119974) then
		isValidChar = true
	elseif c >= 119808 and c <= 119892 or (c >= 119894 and c <= 119964) or (c >= 119966 and c <= 119967) or (c >= 119977 and c <= 119980) or (c >= 119982 and c <= 119993) or (c >= 119997 and c <= 120003) or (c >= 120005 and c <= 120069) or (c >= 120071 and c <= 120074) or (c >= 120077 and c <= 120084) or (c >= 120086 and c <= 120092) or (c >= 120094 and c <= 120121) or (c >= 120123 and c <= 120126) or (c >= 120128 and c <= 120132) or (c >= 120138 and c <= 120144) or (c >= 120146 and c <= 120485) or (c >= 120488 and c <= 120512) then
		isValidChar = true
	elseif c >= 120514 and c <= 120538 or (c >= 120540 and c <= 120570) or (c >= 120572 and c <= 120596) or (c >= 120598 and c <= 120628) or (c >= 120630 and c <= 120654) or (c >= 120656 and c <= 120686) or (c >= 120688 and c <= 120712) or (c >= 120714 and c <= 120744) or (c >= 120746 and c <= 120770) or (c >= 120772 and c <= 120779) or c == 181 or c == 902 or c == 908 or c == 4295 then
		isValidChar = true
	elseif c == 4301 or c == 8025 or c == 8027 or c == 8029 or c == 8126 or c == 8450 or c == 8455 or c == 8469 or c == 8505 or c == 8526 or c == 11559 or c == 11565 or c == 8484 or c == 8486 or c == 8488 or c == 43002 or c == 119970 or c == 119995 or c == 120134 then
		isValidChar = true
	end
	do return isValidChar end
end

function sling.js.parser.UnicodeCharacter:isOtherLetter(c)
	local isValidChar = false
	if c >= 448 and c <= 451 or (c >= 1488 and c <= 1514) or (c >= 1520 and c <= 1522) or (c >= 1568 and c <= 1599) or (c >= 1601 and c <= 1610) or (c >= 1646 and c <= 1647) or (c >= 1649 and c <= 1747) or (c >= 1774 and c <= 1775) or (c >= 1786 and c <= 1788) or (c >= 1810 and c <= 1839) or (c >= 1869 and c <= 1957) or (c >= 1994 and c <= 2026) or (c >= 2048 and c <= 2069) or (c >= 2112 and c <= 2136) or (c >= 2210 and c <= 2220) or (c >= 2308 and c <= 2361) or (c >= 2392 and c <= 2401) then
		isValidChar = true
	elseif c >= 2418 and c <= 2423 or (c >= 2425 and c <= 2431) or (c >= 2437 and c <= 2444) or (c >= 2447 and c <= 2448) or (c >= 2451 and c <= 2472) or (c >= 2474 and c <= 2480) or (c >= 2486 and c <= 2489) or (c >= 2524 and c <= 2525) or (c >= 2527 and c <= 2529) or (c >= 2544 and c <= 2545) or (c >= 2565 and c <= 2570) or (c >= 2575 and c <= 2576) or (c >= 2579 and c <= 2600) or (c >= 2602 and c <= 2608) or (c >= 2610 and c <= 2611) or (c >= 2613 and c <= 2614) then
		isValidChar = true
	elseif c >= 2616 and c <= 2617 or (c >= 2649 and c <= 2652) or (c >= 2674 and c <= 2676) or (c >= 2693 and c <= 2701) or (c >= 2703 and c <= 2705) or (c >= 2707 and c <= 2728) or (c >= 2730 and c <= 2736) or (c >= 2738 and c <= 2739) or (c >= 2741 and c <= 2745) or (c >= 2784 and c <= 2785) or (c >= 2821 and c <= 2828) or (c >= 2831 and c <= 2832) or (c >= 2835 and c <= 2856) or (c >= 2858 and c <= 2864) or (c >= 2866 and c <= 2867) or (c >= 2869 and c <= 2873) then
		isValidChar = true
	elseif c >= 2908 and c <= 2909 or (c >= 2911 and c <= 2913) or (c >= 2949 and c <= 2954) or (c >= 2958 and c <= 2960) or (c >= 2962 and c <= 2965) or (c >= 2969 and c <= 2970) or (c >= 2974 and c <= 2975) or (c >= 2979 and c <= 2980) or (c >= 2984 and c <= 2986) or (c >= 2990 and c <= 3001) or (c >= 3077 and c <= 3084) or (c >= 3086 and c <= 3088) or (c >= 3090 and c <= 3112) or (c >= 3114 and c <= 3123) or (c >= 3125 and c <= 3129) or (c >= 3160 and c <= 3161) then
		isValidChar = true
	elseif c >= 3168 and c <= 3169 or (c >= 3205 and c <= 3212) or (c >= 3214 and c <= 3216) or (c >= 3218 and c <= 3240) or (c >= 3242 and c <= 3251) or (c >= 3253 and c <= 3257) or (c >= 3296 and c <= 3297) or (c >= 3313 and c <= 3314) or (c >= 3333 and c <= 3340) or (c >= 3342 and c <= 3344) or (c >= 3346 and c <= 3386) or (c >= 3424 and c <= 3425) or (c >= 3450 and c <= 3455) or (c >= 3461 and c <= 3478) or (c >= 3482 and c <= 3505) or (c >= 3507 and c <= 3515) then
		isValidChar = true
	elseif c >= 3520 and c <= 3526 or (c >= 3585 and c <= 3632) or (c >= 3634 and c <= 3635) or (c >= 3648 and c <= 3653) or (c >= 3713 and c <= 3714) or (c >= 3719 and c <= 3720) or (c >= 3732 and c <= 3735) or (c >= 3737 and c <= 3743) or (c >= 3745 and c <= 3747) or (c >= 3754 and c <= 3755) or (c >= 3757 and c <= 3760) or (c >= 3762 and c <= 3763) or (c >= 3776 and c <= 3780) or (c >= 3804 and c <= 3807) or (c >= 3904 and c <= 3911) or (c >= 3913 and c <= 3948) then
		isValidChar = true
	elseif c >= 3976 and c <= 3980 or (c >= 4096 and c <= 4138) or (c >= 4176 and c <= 4181) or (c >= 4186 and c <= 4189) or (c >= 4197 and c <= 4198) or (c >= 4206 and c <= 4208) or (c >= 4213 and c <= 4225) or (c >= 4304 and c <= 4346) or (c >= 4349 and c <= 4680) or (c >= 4682 and c <= 4685) or (c >= 4688 and c <= 4694) or (c >= 4698 and c <= 4701) or (c >= 4704 and c <= 4744) or (c >= 4746 and c <= 4749) or (c >= 4752 and c <= 4784) or (c >= 4786 and c <= 4789) then
		isValidChar = true
	elseif c >= 4792 and c <= 4798 or (c >= 4802 and c <= 4805) or (c >= 4808 and c <= 4822) or (c >= 4824 and c <= 4880) or (c >= 4882 and c <= 4885) or (c >= 4888 and c <= 4954) or (c >= 4992 and c <= 5007) or (c >= 5024 and c <= 5108) or (c >= 5121 and c <= 5740) or (c >= 5743 and c <= 5759) or (c >= 5761 and c <= 5786) or (c >= 5792 and c <= 5866) or (c >= 5888 and c <= 5900) or (c >= 5902 and c <= 5905) or (c >= 5920 and c <= 5937) or (c >= 5952 and c <= 5969) then
		isValidChar = true
	elseif c >= 5984 and c <= 5996 or (c >= 5998 and c <= 6000) or (c >= 6016 and c <= 6067) or (c >= 6176 and c <= 6210) or (c >= 6212 and c <= 6263) or (c >= 6272 and c <= 6312) or (c >= 6320 and c <= 6389) or (c >= 6400 and c <= 6428) or (c >= 6480 and c <= 6509) or (c >= 6512 and c <= 6516) or (c >= 6528 and c <= 6571) or (c >= 6593 and c <= 6599) or (c >= 6656 and c <= 6678) or (c >= 6688 and c <= 6740) or (c >= 6917 and c <= 6963) or (c >= 6981 and c <= 6987) then
		isValidChar = true
	elseif c >= 7043 and c <= 7072 or (c >= 7086 and c <= 7087) or (c >= 7098 and c <= 7141) or (c >= 7168 and c <= 7203) or (c >= 7245 and c <= 7247) or (c >= 7258 and c <= 7287) or (c >= 7401 and c <= 7404) or (c >= 7406 and c <= 7409) or (c >= 7413 and c <= 7414) or (c >= 8501 and c <= 8504) or (c >= 11568 and c <= 11623) or (c >= 11648 and c <= 11670) or (c >= 11680 and c <= 11686) or (c >= 11688 and c <= 11694) or (c >= 11696 and c <= 11702) or (c >= 11704 and c <= 11710) then
		isValidChar = true
	elseif c >= 11712 and c <= 11718 or (c >= 11720 and c <= 11726) or (c >= 11728 and c <= 11734) or (c >= 11736 and c <= 11742) or (c >= 12353 and c <= 12438) or (c >= 12449 and c <= 12538) or (c >= 12549 and c <= 12589) or (c >= 12593 and c <= 12686) or (c >= 12704 and c <= 12730) or (c >= 12784 and c <= 12799) or (c >= 13312 and c <= 19893) or (c >= 19968 and c <= 40908) or (c >= 40960 and c <= 40980) or (c >= 40982 and c <= 42124) or (c >= 42192 and c <= 42231) or (c >= 42240 and c <= 42507) then
		isValidChar = true
	elseif c >= 42512 and c <= 42527 or (c >= 42538 and c <= 42539) or (c >= 42656 and c <= 42725) or (c >= 43003 and c <= 43009) or (c >= 43011 and c <= 43013) or (c >= 43015 and c <= 43018) or (c >= 43020 and c <= 43042) or (c >= 43072 and c <= 43123) or (c >= 43138 and c <= 43187) or (c >= 43250 and c <= 43255) or (c >= 43274 and c <= 43301) or (c >= 43312 and c <= 43334) or (c >= 43360 and c <= 43388) or (c >= 43396 and c <= 43442) or (c >= 43520 and c <= 43560) or (c >= 43584 and c <= 43586) then
		isValidChar = true
	elseif c >= 43588 and c <= 43595 or (c >= 43616 and c <= 43631) or (c >= 43633 and c <= 43638) or (c >= 43648 and c <= 43695) or (c >= 43701 and c <= 43702) or (c >= 43705 and c <= 43709) or (c >= 43739 and c <= 43740) or (c >= 43744 and c <= 43754) or (c >= 43777 and c <= 43782) or (c >= 43785 and c <= 43790) or (c >= 43793 and c <= 43798) or (c >= 43808 and c <= 43814) or (c >= 43816 and c <= 43822) or (c >= 43968 and c <= 44002) or (c >= 44032 and c <= 55203) or (c >= 55216 and c <= 55238) then
		isValidChar = true
	elseif c >= 55243 and c <= 55291 or (c >= 63744 and c <= 64109) or (c >= 64112 and c <= 64217) or (c >= 64287 and c <= 64296) or (c >= 64298 and c <= 64310) or (c >= 64312 and c <= 64316) or (c >= 64320 and c <= 64321) or (c >= 64323 and c <= 64324) or (c >= 64326 and c <= 64433) or (c >= 64467 and c <= 64829) or (c >= 64848 and c <= 64911) or (c >= 64914 and c <= 64967) or (c >= 65008 and c <= 65019) or (c >= 65136 and c <= 65140) or (c >= 65142 and c <= 65276) or (c >= 65382 and c <= 65391) then
		isValidChar = true
	elseif c >= 65393 and c <= 65437 or (c >= 65440 and c <= 65470) or (c >= 65474 and c <= 65479) or (c >= 65482 and c <= 65487) or (c >= 65490 and c <= 65495) or (c >= 65498 and c <= 65500) or (c >= 65536 and c <= 65547) or (c >= 65549 and c <= 65574) or (c >= 65576 and c <= 65594) or (c >= 65596 and c <= 65597) or (c >= 65599 and c <= 65613) or (c >= 65616 and c <= 65629) or (c >= 65664 and c <= 65786) or (c >= 66176 and c <= 66204) or (c >= 66208 and c <= 66256) or (c >= 66304 and c <= 66334) then
		isValidChar = true
	elseif c >= 66352 and c <= 66368 or (c >= 66370 and c <= 66377) or (c >= 66432 and c <= 66461) or (c >= 66464 and c <= 66499) or (c >= 66504 and c <= 66511) or (c >= 66640 and c <= 66717) or (c >= 67584 and c <= 67589) or (c >= 67594 and c <= 67637) or (c >= 67639 and c <= 67640) or (c >= 67647 and c <= 67669) or (c >= 67840 and c <= 67861) or (c >= 67872 and c <= 67897) or (c >= 67968 and c <= 68023) or (c >= 68030 and c <= 68031) or (c >= 68112 and c <= 68115) or (c >= 68117 and c <= 68119) then
		isValidChar = true
	elseif c >= 68121 and c <= 68147 or (c >= 68192 and c <= 68220) or (c >= 68352 and c <= 68405) or (c >= 68416 and c <= 68437) or (c >= 68448 and c <= 68466) or (c >= 68608 and c <= 68680) or (c >= 69635 and c <= 69687) or (c >= 69763 and c <= 69807) or (c >= 69840 and c <= 69864) or (c >= 69891 and c <= 69926) or (c >= 70019 and c <= 70066) or (c >= 70081 and c <= 70084) or (c >= 71296 and c <= 71338) or (c >= 73728 and c <= 74606) or (c >= 77824 and c <= 78894) or (c >= 92160 and c <= 92728) then
		isValidChar = true
	elseif c >= 93952 and c <= 94020 or (c >= 110592 and c <= 110593) or (c >= 126464 and c <= 126467) or (c >= 126469 and c <= 126495) or (c >= 126497 and c <= 126498) or (c >= 126505 and c <= 126514) or (c >= 126516 and c <= 126519) or (c >= 126541 and c <= 126543) or (c >= 126545 and c <= 126546) or (c >= 126561 and c <= 126562) or (c >= 126567 and c <= 126570) or (c >= 126572 and c <= 126578) or (c >= 126580 and c <= 126583) or (c >= 126585 and c <= 126588) or (c >= 126592 and c <= 126601) or (c >= 126603 and c <= 126619) then
		isValidChar = true
	elseif c >= 126625 and c <= 126627 or (c >= 126629 and c <= 126633) or (c >= 126635 and c <= 126651) or (c >= 131072 and c <= 173782) or (c >= 173824 and c <= 177972) or (c >= 177984 and c <= 178205) or (c >= 194560 and c <= 195101) or c == 170 or c == 186 or c == 443 or c == 660 or c == 1749 or c == 1791 or c == 1808 or c == 1969 or c == 2208 or c == 2365 or c == 2384 or c == 2482 or c == 2493 or c == 2510 or c == 2654 or c == 2749 or c == 2768 or c == 2877 then
		isValidChar = true
	elseif c == 2929 or c == 2947 or c == 2972 or c == 3716 or c == 3722 or c == 3725 or c == 3749 or c == 3751 or c == 3773 or c == 3840 or c == 4159 or c == 4193 or c == 4238 or c == 12294 or c == 12348 or c == 12447 or c == 12543 or c == 42606 or c == 4696 or c == 4800 or c == 6108 or c == 6314 or c == 43259 or c == 43642 or c == 43697 or c == 43712 or c == 43714 or c == 43762 or c == 64285 or c == 64318 or c == 67592 or c == 67644 then
		isValidChar = true
	elseif c == 68096 or c == 94032 or c == 126500 or c == 126503 or c == 126521 or c == 126523 or c == 126530 or c == 126535 or c == 126548 or c == 126551 or c == 126553 or c == 126555 or c == 126557 or c == 126559 or c == 126564 or c == 126590 or c == 3024 or c == 3133 or c == 3261 or c == 3294 or c == 3389 or c == 3406 or c == 3517 or c == 126537 or c == 126539 then
		isValidChar = true
	end
	do return isValidChar end
end

function sling.js.parser.UnicodeCharacter:isLetterNumber(c)
	do return c >= 5870 and c <= 5872 or (c >= 8544 and c <= 8578) or (c >= 8581 and c <= 8584) or (c >= 12321 and c <= 12329) or (c >= 12344 and c <= 12346) or (c >= 42726 and c <= 42735) or (c >= 65856 and c <= 65908) or (c >= 66513 and c <= 66517) or (c >= 74752 and c <= 74850) or c == 12295 or c == 66369 or c == 66378 end
end

function sling.js.parser.UnicodeCharacter:isModifierLetter(c)
	do return c >= 688 and c <= 705 or (c >= 710 and c <= 721) or (c >= 736 and c <= 740) or (c >= 1765 and c <= 1766) or (c >= 2036 and c <= 2037) or (c >= 7288 and c <= 7293) or (c >= 7468 and c <= 7530) or (c >= 7579 and c <= 7615) or (c >= 8336 and c <= 8348) or (c >= 11388 and c <= 11389) or (c >= 12337 and c <= 12341) or (c >= 12445 and c <= 12446) or (c >= 12540 and c <= 12542) or (c >= 42232 and c <= 42237) or (c >= 42775 and c <= 42783) or (c >= 43000 and c <= 43001) or (c >= 43763 and c <= 43764) or (c >= 94099 and c <= 94111) or (c >= 65438 and c <= 65439) or c == 748 or c == 750 or c == 884 or c == 890 or c == 1369 or c == 1600 or c == 2084 or c == 2088 or c == 2042 or c == 2074 or c == 2417 or c == 3654 or c == 3782 or c == 11631 or c == 12293 or c == 12347 or c == 40981 or c == 42508 or c == 42623 or c == 42864 or c == 4348 or c == 6103 or c == 6211 or c == 6823 or c == 7544 or c == 8305 or c == 8319 or c == 42888 or c == 43471 or c == 43632 or c == 43741 or c == 65392 end
end

function sling.js.parser.UnicodeCharacter:isNonSpacingMark(c)
	local isValidChar = false
	if c >= 768 and c <= 879 or (c >= 1155 and c <= 1159) or (c >= 1425 and c <= 1469) or c == 1471 or (c >= 1473 and c <= 1474) or (c >= 1476 and c <= 1477) or c == 1479 or (c >= 1552 and c <= 1562) or (c >= 1611 and c <= 1631) or c == 1648 or (c >= 1750 and c <= 1756) or (c >= 1759 and c <= 1764) or (c >= 1767 and c <= 1768) or (c >= 1770 and c <= 1773) or c == 1809 or (c >= 1840 and c <= 1866) then
		isValidChar = true
	elseif c >= 768 and c <= 879 or (c >= 1155 and c <= 1159) or (c >= 1425 and c <= 1469) or c == 1471 or (c >= 1473 and c <= 1474) or (c >= 1476 and c <= 1477) or c == 1479 or (c >= 1552 and c <= 1562) or (c >= 1611 and c <= 1631) or c == 1648 or (c >= 1750 and c <= 1756) or (c >= 1759 and c <= 1764) or (c >= 1767 and c <= 1768) or (c >= 1770 and c <= 1773) or c == 1809 or (c >= 1840 and c <= 1866) then
		isValidChar = true
	elseif c >= 1958 and c <= 1968 or (c >= 2027 and c <= 2035) or (c >= 2070 and c <= 2073) or (c >= 2075 and c <= 2083) or (c >= 2085 and c <= 2087) or (c >= 2089 and c <= 2093) or (c >= 2137 and c <= 2139) or (c >= 2276 and c <= 2302) or (c >= 2304 and c <= 2306) or c == 2362 or c == 2364 or (c >= 2369 and c <= 2376) or c == 2381 then
		isValidChar = true
	elseif c >= 2385 and c <= 2391 or (c >= 2402 and c <= 2403) or c == 2433 or c == 2492 or (c >= 2497 and c <= 2500) or c == 2509 or (c >= 2530 and c <= 2531) or (c >= 2561 and c <= 2562) or c == 2620 or (c >= 2625 and c <= 2626) or (c >= 2631 and c <= 2632) or (c >= 2635 and c <= 2637) or c == 2641 or (c >= 2672 and c <= 2673) or c == 2677 or (c >= 2689 and c <= 2690) or c == 2748 or (c >= 2753 and c <= 2757) or (c >= 2759 and c <= 2760) or c == 2765 then
		isValidChar = true
	elseif c >= 2786 and c <= 2787 or c == 2817 or c == 2876 or c == 2879 or (c >= 2881 and c <= 2884) or c == 2893 or c == 2902 or (c >= 2914 and c <= 2915) or c == 2946 or c == 3008 or c == 3021 or (c >= 3134 and c <= 3136) or (c >= 3142 and c <= 3144) or (c >= 3146 and c <= 3149) or (c >= 3157 and c <= 3158) or (c >= 3170 and c <= 3171) or c == 3260 or c == 3263 or c == 3270 or (c >= 3276 and c <= 3277) or (c >= 3298 and c <= 3299) then
		isValidChar = true
	elseif c >= 3393 and c <= 3396 or c == 3405 or (c >= 3426 and c <= 3427) or c == 3530 or (c >= 3538 and c <= 3540) or c == 3542 or c == 3633 or (c >= 3636 and c <= 3642) or (c >= 3655 and c <= 3662) or c == 3761 or (c >= 3764 and c <= 3769) or (c >= 3771 and c <= 3772) or (c >= 3784 and c <= 3789) or (c >= 3864 and c <= 3865) or c == 3893 or c == 3895 or c == 3897 or (c >= 3953 and c <= 3966) or (c >= 3968 and c <= 3972) then
		isValidChar = true
	elseif c >= 3974 and c <= 3975 or (c >= 3981 and c <= 3991) or (c >= 3993 and c <= 4028) or c == 4038 or (c >= 4141 and c <= 4144) or (c >= 4146 and c <= 4151) or (c >= 4153 and c <= 4154) or (c >= 4157 and c <= 4158) or (c >= 4184 and c <= 4185) or (c >= 4190 and c <= 4192) or (c >= 4209 and c <= 4212) or c == 4226 or (c >= 4229 and c <= 4230) or c == 4237 or c == 4253 or (c >= 4957 and c <= 4959) or (c >= 5906 and c <= 5908) then
		isValidChar = true
	elseif c >= 5938 and c <= 5940 or (c >= 5970 and c <= 5971) or (c >= 6002 and c <= 6003) or (c >= 6068 and c <= 6069) or (c >= 6071 and c <= 6077) or c == 6086 or (c >= 6089 and c <= 6099) or c == 6109 or (c >= 6155 and c <= 6157) or c == 6313 or (c >= 6432 and c <= 6434) or (c >= 6439 and c <= 6440) or c == 6450 or (c >= 6457 and c <= 6459) or (c >= 6679 and c <= 6680) or c == 6683 or c == 6742 or (c >= 6744 and c <= 6750) or c == 6752 or c == 6754 then
		isValidChar = true
	elseif c >= 6757 and c <= 6764 or (c >= 6771 and c <= 6780) or c == 6783 or (c >= 6912 and c <= 6915) or c == 6964 or (c >= 6966 and c <= 6970) or c == 6972 or c == 6978 or (c >= 7019 and c <= 7027) or (c >= 7040 and c <= 7041) or (c >= 7074 and c <= 7077) or (c >= 7080 and c <= 7081) or c == 7083 or c == 7142 or (c >= 7144 and c <= 7145) or c == 7149 or (c >= 7151 and c <= 7153) or (c >= 7212 and c <= 7219) or (c >= 7222 and c <= 7223) then
		isValidChar = true
	elseif c >= 7376 and c <= 7378 or (c >= 7380 and c <= 7392) or (c >= 7394 and c <= 7400) or c == 7405 or c == 7412 or (c >= 7616 and c <= 7654) or (c >= 7676 and c <= 7679) or (c >= 8400 and c <= 8412) or c == 8417 or (c >= 8421 and c <= 8432) or (c >= 11503 and c <= 11505) or c == 11647 or (c >= 11744 and c <= 11775) or (c >= 12330 and c <= 12333) or (c >= 12441 and c <= 12442) or c == 42607 or (c >= 42612 and c <= 42621) or c == 42655 then
		isValidChar = true
	elseif c >= 42736 and c <= 42737 or c == 43010 or c == 43014 or c == 43019 or (c >= 43045 and c <= 43046) or c == 43204 or (c >= 43232 and c <= 43249) or (c >= 43302 and c <= 43309) or (c >= 43335 and c <= 43345) or (c >= 43392 and c <= 43394) or c == 43443 or (c >= 43446 and c <= 43449) or c == 43452 or (c >= 43561 and c <= 43566) or (c >= 43569 and c <= 43570) or (c >= 43573 and c <= 43574) or c == 43587 or c == 43596 or c == 43696 or (c >= 43698 and c <= 43700) then
		isValidChar = true
	elseif c >= 43703 and c <= 43704 or (c >= 43710 and c <= 43711) or c == 43713 or (c >= 43756 and c <= 43757) or c == 43766 or c == 44005 or c == 44008 or c == 44013 or c == 64286 or (c >= 65024 and c <= 65039) or (c >= 65056 and c <= 65062) or c == 66045 or (c >= 68097 and c <= 68099) or (c >= 68101 and c <= 68102) or (c >= 68108 and c <= 68111) or (c >= 68152 and c <= 68154) or c == 68159 or c == 69633 or (c >= 69688 and c <= 69702) then
		isValidChar = true
	elseif c >= 69760 and c <= 69761 or (c >= 69811 and c <= 69814) or (c >= 69817 and c <= 69818) or (c >= 69888 and c <= 69890) or (c >= 69927 and c <= 69931) or (c >= 69933 and c <= 69940) or (c >= 70016 and c <= 70017) or (c >= 70070 and c <= 70078) or c == 71339 or c == 71341 or (c >= 71344 and c <= 71349) or c == 71351 or (c >= 94095 and c <= 94098) or (c >= 119143 and c <= 119145) or (c >= 119163 and c <= 119170) or (c >= 119173 and c <= 119179) or (c >= 119210 and c <= 119213) or (c >= 119362 and c <= 119364) or (c >= 917760 and c <= 917999) then
		isValidChar = true
	end
	do return isValidChar end
end

function sling.js.parser.UnicodeCharacter:isSpacingCombiningMark(c)
	local isValidChar = false
	if c == 2307 or c == 2363 or (c >= 2366 and c <= 2368) or (c >= 2377 and c <= 2380) or (c >= 2382 and c <= 2383) or (c >= 2434 and c <= 2435) or (c >= 2494 and c <= 2496) or (c >= 2503 and c <= 2504) or (c >= 2507 and c <= 2508) or c == 2519 or (c >= 2524 and c <= 2525) or c == 2563 or (c >= 2622 and c <= 2624) or c == 2691 or (c >= 2750 and c <= 2752) or c == 2761 or (c >= 2763 and c <= 2764) or (c >= 2818 and c <= 2819) then
		isValidChar = true
	elseif c == 2878 or (c >= 2881 and c <= 2884) or (c >= 2887 and c <= 2888) or (c >= 2891 and c <= 2892) or c == 2903 or (c >= 3006 and c <= 3007) or (c >= 3009 and c <= 3010) or (c >= 3014 and c <= 3016) or (c >= 3018 and c <= 3020) or c == 3031 or (c >= 3073 and c <= 3075) or (c >= 3137 and c <= 3140) or (c >= 3202 and c <= 3203) or c == 3262 or (c >= 3264 and c <= 3268) or (c >= 3271 and c <= 3272) then
		isValidChar = true
	elseif c >= 3274 and c <= 3275 or (c >= 3285 and c <= 3286) or (c >= 3330 and c <= 3331) or (c >= 3390 and c <= 3392) or (c >= 3398 and c <= 3400) or (c >= 3402 and c <= 3404) or c == 3415 or (c >= 3458 and c <= 3459) or (c >= 3535 and c <= 3537) or (c >= 3544 and c <= 3551) or (c >= 3570 and c <= 3571) or (c >= 3902 and c <= 3903) or c == 3967 or (c >= 4139 and c <= 4140) or c == 4145 or c == 4152 or (c >= 4155 and c <= 4156) then
		isValidChar = true
	elseif c >= 4182 and c <= 4183 or (c >= 4194 and c <= 4196) or (c >= 4199 and c <= 4205) or (c >= 4227 and c <= 4228) or (c >= 4231 and c <= 4236) or c == 4239 or (c >= 4250 and c <= 4252) or c == 6070 or (c >= 6078 and c <= 6085) or (c >= 6087 and c <= 6088) or (c >= 6435 and c <= 6438) or (c >= 6441 and c <= 6443) or (c >= 6448 and c <= 6449) or (c >= 6451 and c <= 6456) or (c >= 6576 and c <= 6592) or (c >= 6600 and c <= 6601) then
		isValidChar = true
	elseif c >= 6681 and c <= 6682 or c == 6741 or c == 6743 or c == 6753 or (c >= 6755 and c <= 6756) or (c >= 6765 and c <= 6770) or c == 6916 or c == 6965 or c == 6971 or (c >= 6973 and c <= 6977) or (c >= 6979 and c <= 6980) or c == 7042 or c == 7073 or (c >= 7078 and c <= 7079) or c == 7082 or (c >= 7084 and c <= 7085) or c == 7143 or (c >= 7146 and c <= 7148) or c == 7150 then
		isValidChar = true
	elseif c >= 7154 and c <= 7155 or (c >= 7204 and c <= 7211) or (c >= 7220 and c <= 7221) or c == 7393 or (c >= 7410 and c <= 7411) or (c >= 12334 and c <= 12335) or (c >= 43043 and c <= 43044) or c == 43047 or (c >= 43136 and c <= 43137) or (c >= 43188 and c <= 43203) or (c >= 43346 and c <= 43347) or c == 43395 or (c >= 43444 and c <= 43445) or (c >= 43450 and c <= 43451) or (c >= 43453 and c <= 43456) or (c >= 43567 and c <= 43568) then
		isValidChar = true
	elseif c >= 43571 and c <= 43572 or c == 43597 or c == 43643 or c == 43755 or (c >= 43758 and c <= 43759) or c == 43765 or (c >= 44003 and c <= 44004) or (c >= 44006 and c <= 44007) or (c >= 44009 and c <= 44010) or c == 44012 or c == 69632 or c == 69634 or c == 69762 or (c >= 69808 and c <= 69810) or (c >= 69815 and c <= 69816) then
		isValidChar = true
	elseif c == 69932 or c == 70018 or (c >= 70067 and c <= 70069) or (c >= 70079 and c <= 70080) or c == 71340 or (c >= 71342 and c <= 71343) or c == 71350 or (c >= 94033 and c <= 94078) or (c >= 119141 and c <= 119142) or (c >= 119149 and c <= 119154) then
		isValidChar = true
	end
	do return isValidChar end
end

function sling.js.parser.UnicodeCharacter:isDecimalDigitNumber(c)
	do return c >= 48 and c <= 57 or (c >= 1632 and c <= 1641) or (c >= 1776 and c <= 1785) or (c >= 1984 and c <= 1993) or (c >= 2406 and c <= 2415) or (c >= 2534 and c <= 2543) or (c >= 2662 and c <= 2671) or (c >= 2790 and c <= 2799) or (c >= 2918 and c <= 2927) or (c >= 3046 and c <= 3055) or (c >= 3174 and c <= 3183) or (c >= 3302 and c <= 3311) or (c >= 3430 and c <= 3439) or (c >= 3664 and c <= 3673) or (c >= 3792 and c <= 3801) or (c >= 3872 and c <= 3881) or (c >= 4160 and c <= 4169) or (c >= 4240 and c <= 4249) or (c >= 6112 and c <= 6121) or (c >= 6160 and c <= 6169) or (c >= 6470 and c <= 6479) or (c >= 6608 and c <= 6617) or (c >= 6784 and c <= 6793) or (c >= 6800 and c <= 6809) or (c >= 6992 and c <= 7001) or (c >= 7088 and c <= 7097) or (c >= 7232 and c <= 7241) or (c >= 7248 and c <= 7257) or (c >= 42528 and c <= 42537) or (c >= 43216 and c <= 43225) or (c >= 43264 and c <= 43273) or (c >= 43472 and c <= 43481) or (c >= 43600 and c <= 43609) or (c >= 44016 and c <= 44025) or (c >= 65296 and c <= 65305) or (c >= 66720 and c <= 66729) or (c >= 69734 and c <= 69743) or (c >= 69872 and c <= 69881) or (c >= 69942 and c <= 69951) or (c >= 70096 and c <= 70105) or (c >= 71360 and c <= 71369) or (c >= 120782 and c <= 120831) end
end

function sling.js.parser.UnicodeCharacter:isConnectorPunctuation(c)
	do return c == 95 or (c >= 8255 and c <= 8256) or c == 8276 or (c >= 65075 and c <= 65076) or (c >= 65101 and c <= 65103) or c == 65343 end
end
