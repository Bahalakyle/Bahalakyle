sling = sling or {}

sling.js = sling.js or {}

sling.js.generator = sling.js.generator or {}

sling.js.generator.JSGenerator = _g.sling.common.CodeGenerator._create()
sling.js.generator.JSGenerator.__index = sling.js.generator.JSGenerator
_vm:set_metatable(sling.js.generator.JSGenerator, {
	__index = _g.sling.common.CodeGenerator
})

function sling.js.generator.JSGenerator._create()
	local v = _vm:set_metatable({}, sling.js.generator.JSGenerator)
	return v
end

function sling.js.generator.JSGenerator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.generator.JSGenerator'
	self['_isType.sling.js.generator.JSGenerator'] = true
	self.isLastNL = false
	self.excludeComments = false
	self.currentIndent = 0
	self.copyrightDeclaration = nil
	self.hangingBraces = false
	self.insertSpaceAfterKeywords = true
	self.supportTypeScript = true
	self.readableCode = true
	self.enableClassEmbedBlock = false
end

function sling.js.generator.JSGenerator:_construct0()
	sling.js.generator.JSGenerator._init(self)
	do _g.sling.common.CodeGenerator._construct0(self) end
	return self
end

function sling.js.generator.JSGenerator:_construct2(ctx, output)
	sling.js.generator.JSGenerator._init(self)
	do _g.sling.common.CodeGenerator._construct2(self, ctx, output) end
	return self
end

function sling.js.generator.JSGenerator:adjustIndent(n)
	self.currentIndent = self.currentIndent + n
end

function sling.js.generator.JSGenerator:dumpOpeningBrace()
	if self.hangingBraces then
		do self:output(" {\n") end
	else
		do self:output("\n") end
		do self:output("{\n") end
	end
end

function sling.js.generator.JSGenerator:dumpKeywordParens()
	if self.insertSpaceAfterKeywords then
		do self:output(" (") end
	else
		do self:output("(") end
	end
end

function sling.js.generator.JSGenerator:onFileStarted()
	do _g.sling.common.CodeGenerator.onFileStarted(self) end
	self.currentIndent = 0
	self.isLastNL = false
	if _g.jk.lang.String:isEmpty(self.copyrightDeclaration) == false then
		local cc = _g.sling.model.CommentNode:forText(self.copyrightDeclaration, false)
		do cc:setSubstantial(true) end
		do self:dumpComment(cc, true) end
	end
end

function sling.js.generator.JSGenerator:dumpComment(node, allowExtraNewlines)
	if self.excludeComments then
		do return true end
	end
	do
		local substantial = node:getSubstantial()
		local text = node:getText()
		if substantial == false and _g.jk.lang.String:getIndexOfCharacter(text, 10, 0) >= 0 then
			substantial = true
		end
		if substantial and allowExtraNewlines then
			do self:doOutput("\n", true) end
		end
		if substantial == false then
			if _g.jk.lang.String:startsWith(text, " ", 0) == false then
				do self:doOutput("// " .. _g.jk.lang.String:safeString(text) .. "\n", true) end
			else
				do self:doOutput("//" .. _g.jk.lang.String:safeString(text) .. "\n", true) end
			end
		else
			do self:doOutput("/*\n", true) end
			do
				local array = _g.jk.lang.String:split(text, 10, 0)
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local line = array[n + 1]
							if line ~= nil then
								if _g.jk.lang.String:isEmpty(line) then
									do self:doOutput(" *\n", true) end
								else
									do self:doOutput(" * " .. _g.jk.lang.String:safeString(line) .. "\n", true) end
								end
							end
							do n = n + 1 end
						end
					end
				end
				do self:doOutput(" */\n", true) end
			end
		end
		if substantial and allowExtraNewlines then
			do self:doOutput("\n", true) end
		end
		do return true end
	end
end

function sling.js.generator.JSGenerator:doOutput(str, isComment)
	if not (str ~= nil) then
		do return end
	end
	do
		local decIndent = false
		if self.isLastNL and self.currentIndent > 0 then
			if isComment == false and (_g.jk.lang.String:startsWith(str, "}", 0) or _g.jk.lang.String:startsWith(str, "]", 0)) then
				do self.currentIndent = self.currentIndent - 1 end
				decIndent = true
			end
			if not (str == "\n") then
				local n = 0
				do
					n = 0
					while n < self.currentIndent do
						do self:outputDirect("\t") end
						do n = n + 1 end
					end
				end
			end
		end
		self.isLastNL = false
		do self:outputDirect(str) end
		if _g.jk.lang.String:endsWith(str, "\n") then
			self.isLastNL = true
			if isComment == false then
				if _g.jk.lang.String:endsWith(str, "{\n") or _g.jk.lang.String:endsWith(str, "[\n") then
					do self.currentIndent = self.currentIndent + 1 end
				elseif _g.jk.lang.String:endsWith(str, "}\n") or _g.jk.lang.String:endsWith(str, "]\n") then
					if decIndent == false then
						do self.currentIndent = self.currentIndent - 1 end
					end
				end
			end
		end
	end
end

function sling.js.generator.JSGenerator:output(str)
	if self.readableCode then
		do self:doOutput(str, false) end
	else
		str = _g.jk.lang.String:replaceString(str, "\n", "")
		if _g.jk.lang.String:isNotEmpty(str) then
			do self:outputDirect(str) end
		end
	end
end

function sling.js.generator.JSGenerator:tryDumpDataTypeAnnotation(node)
	if node ~= nil and (_vm:to_table_with_key(node, '_isType.sling.model.AutomaticDataTypeNode') ~= nil) == false then
		do self:output(" : ") end
		do self:dumpDataType(node) end
	end
end

function sling.js.generator.JSGenerator:dumpDataType(node)
	if not (node ~= nil) then
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
		do self:dumpSymbolNode(node:getSymbol(), true) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.VectorDataTypeNode') ~= nil) then
		do self:output("Array") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.SetDataTypeNode') ~= nil) then
		do self:output("Set") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.MapDataTypeNode') ~= nil) then
		do self:output("Map") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StringDataTypeNode') ~= nil) then
		do self:output("String") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BufferDataTypeNode') ~= nil) then
		do self:output("ArrayBuffer") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ObjectDataTypeNode') ~= nil) then
		do self:output("Object") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DateTimeDataTypeNode') ~= nil) then
		do self:output("Date") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PromiseDataTypeNode') ~= nil) then
		do self:output("Promise") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StaticArrayDataTypeNode') ~= nil) then
		if self.supportTypeScript then
			local type = node:getPrimaryType()
			if type ~= nil then
				do self:dumpDataType(type) end
			end
			do self:output("[]") end
			do return end
		else
			do self:output("Array") end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.NumberDataTypeNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.DoubleDataTypeNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.FloatDataTypeNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
		do self:output("number") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BooleanDataTypeNode') ~= nil) then
		do self:output("boolean") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.VoidDataTypeNode') ~= nil) then
		do self:output("void") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.NullDataTypeNode') ~= nil) then
		do self:output("null") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.UndefinedDataTypeNode') ~= nil) then
		do self:output("undefined") end
		do return end
	end
	if self.supportTypeScript then
		if (_vm:to_table_with_key(node, '_isType.sling.model.DynamicDataTypeNode') ~= nil) then
			do self:output("any") end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.MultipleDataTypeNode') ~= nil) then
			local types = node:getTypes()
			local first = true
			if types ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(types)
				do
					n = 0
					while n < m do
						local type = _vm:to_table_with_key(types[n + 1], '_isType.sling.common.DataTypeNode')
						if type ~= nil then
							if not first then
								do self:output(" | ") end
							end
							do self:dumpDataType(type) end
							first = false
						end
						do n = n + 1 end
					end
				end
			end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.TupleDataTypeNode') ~= nil) then
			local types = node:getTypes()
			local first = true
			do self:output("[") end
			if types ~= nil then
				local n2 = 0
				local m2 = _g.jk.lang.Vector:getSize(types)
				do
					n2 = 0
					while n2 < m2 do
						local type = _vm:to_table_with_key(types[n2 + 1], '_isType.sling.common.DataTypeNode')
						if type ~= nil then
							if not first then
								do self:output(", ") end
							end
							do self:dumpDataType(type) end
							first = false
						end
						do n2 = n2 + 1 end
					end
				end
			end
			do self:output("]") end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.ExpressionDataTypeNode') ~= nil) then
			local xpr = _vm:to_table_with_key(node:getExpression(), '_isType.sling.model.LiteralExpressionNode')
			if not (xpr ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No literal expression", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpLiteralExpression(xpr) end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDataTypeNode') ~= nil) then
			local nd = node
			local prms = nd:getDeclaration()
			if not (prms ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("function data type has no declaration", nil, _g.jk.lang.StackTrace:generate()))
				do return end
			end
			do self:dumpFunctionDeclarationParameters(prms) end
			do self:output("=>") end
			do self:dumpDataType(nd:getFunctionReturnType()) end
			do return end
		end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "data type" .. "'", node, nil))
end

function sling.js.generator.JSGenerator:dumpAnnotationModifier(mod)
	if not self.supportTypeScript then
		do return end
	end
	if not (mod ~= nil) then
		do return end
	end
	do self:output("@" .. _g.jk.lang.String:safeString(mod:getText())) end
	do self:output("(") end
	do
		local exps = mod:getExpressions()
		local first = true
		if exps ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(exps)
			do
				n = 0
				while n < m do
					local exp = _vm:to_table_with_key(exps[n + 1], '_isType.sling.model.ExpressionNode')
					if exp ~= nil then
						if not first then
							do self:output(", ") end
						end
						do self:dumpExpression(exp, nil) end
					end
					do n = n + 1 end
				end
			end
		end
		do self:output(")") end
	end
end

function sling.js.generator.JSGenerator:isDeclarationExpressionNode(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationExpressionNode') ~= nil) then
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.JavascriptFunctionDeclarationExpressionNode') ~= nil) then
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.ClassDeclarationExpressionNode') ~= nil) then
		do return true end
	end
	do return false end
end

function sling.js.generator.JSGenerator:isCompactNode(node)
	if node == nil then
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ImportStatementNode') ~= nil) then
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.ExportStatementNode') ~= nil) then
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.CommentNode') ~= nil) then
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationBaseNode') ~= nil) and node:getBody() == nil then
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.VariableDeclarationNode') ~= nil) and not self:isDeclarationExpressionNode(node:getInitializer()) then
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.AssignmentExpressionNode') ~= nil) and not self:isDeclarationExpressionNode(node:getRight()) then
		do return true end
	end
	do return false end
end

function sling.js.generator.JSGenerator:getOperatorPrecedence(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.MultipleExpressionNode') ~= nil) then
		do return 1 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.YieldValueExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.js.model.YieldToGeneratorExpressionNode') ~= nil) then
		do return 2 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.AssignmentExpressionBaseNode') ~= nil) then
		do return 3 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ConditionalExpressionNode') ~= nil) then
		do return 4 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LogicalOrExpressionNode') ~= nil) then
		do return 5 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LogicalAndExpressionNode') ~= nil) then
		do return 6 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseOrExpressionNode') ~= nil) then
		do return 8 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseXorExpressionNode') ~= nil) then
		do return 9 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseAndExpressionNode') ~= nil) then
		do return 10 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EqualityComparisonExpressionNode') ~= nil) then
		do return 11 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ComparisonExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.TypeCheckExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.MembershipCheckExpressionNode') ~= nil) then
		do return 12 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ShiftLeftExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.ShiftRightExpressionNode') ~= nil) then
		do return 13 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.AdditionExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.SubtractionExpressionNode') ~= nil) then
		do return 14 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.MultiplicationExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.DivisionExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.ModuloExpressionNode') ~= nil) then
		do return 15 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ExponentExpressionNode') ~= nil) then
		do return 16 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LogicalNotExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseNotExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.PositiveNumberExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.NegativeNumberExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.PreDecrementExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.PreIncrementExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.GetExpressionTypeinfoExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.AwaitExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.js.model.DeleteExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.js.model.VoidExpressionNode') ~= nil) then
		do return 17 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PostDecrementExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.PostIncrementExpressionNode') ~= nil) then
		do return 18 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.CreateObjectExpressionNode') ~= nil) then
		do return 19 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.MemberAccessExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.FunctionCallExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.SubscriptExpressionNode') ~= nil) then
		do return 20 end
	end
	do return 21 end
end

function sling.js.generator.JSGenerator:isRightToLeftAssociativity(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.CreateObjectExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.LogicalNotExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseNotExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.PositiveNumberExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.NegativeNumberExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.PreIncrementExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.PreDecrementExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.GetExpressionTypeinfoExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.js.model.VoidExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.js.model.DeleteExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.AwaitExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.ExponentExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.ConditionalExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.AssignmentExpressionBaseNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.YieldValueExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.js.model.YieldToGeneratorExpressionNode') ~= nil) then
		do return true end
	end
	do return false end
end

function sling.js.generator.JSGenerator:isRightValue(node, parent)
	local pb = _vm:to_table_with_key(parent, '_isType.sling.model.BinaryExpressionNode')
	if pb ~= nil then
		if pb:getRight() == node then
			do return true end
		end
	end
	do
		local pu = _vm:to_table_with_key(parent, '_isType.sling.model.UnaryExpressionNode')
		if pu ~= nil then
			if pu:getExpression() == node then
				do return true end
			end
		end
		do return false end
	end
end

function sling.js.generator.JSGenerator:isLowerPriority(node, parent)
	if not (parent ~= nil) then
		do return false end
	end
	if not (node ~= nil) then
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionCallExpressionNode') ~= nil) and (_vm:to_table_with_key(parent, '_isType.sling.model.FunctionCallExpressionNode') ~= nil) then
		do return true end
	end
	if self:isRightToLeftAssociativity(parent) and not self:isRightValue(node, parent) then
		do return false end
	end
	do
		local np = self:getOperatorPrecedence(node)
		local pp = self:getOperatorPrecedence(parent)
		if np < pp then
			do return true end
		end
		if np == pp and self:isRightValue(node, parent) then
			do return true end
		end
		do return false end
	end
end

function sling.js.generator.JSGenerator:dumpArrayLiteralExpression(node)
	if not (node ~= nil) then
		do return end
	end
	do self:output("[") end
	do
		local first = true
		local exprs = node:getExpressions()
		if exprs ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(exprs)
			do
				n = 0
				while n < m do
					local expr = _vm:to_table_with_key(exprs[n + 1], '_isType.sling.model.ExpressionNode')
					if expr ~= nil then
						if not first then
							do self:output(", ") end
						end
						do self:doDumpExpression(expr, nil) end
						first = false
					end
					do n = n + 1 end
				end
			end
		end
		do self:output("]") end
	end
end

function sling.js.generator.JSGenerator:dumpSetLiteralExpression(node)
	if not (node ~= nil) then
		do return end
	end
	do self:output("new Set([") end
	do
		local first = true
		local array = node:getValues()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local value = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ExpressionNode')
					if value ~= nil then
						if not first then
							do self:output(", ") end
						end
						do self:doDumpExpression(value, nil) end
						first = false
					end
					do n = n + 1 end
				end
			end
		end
		do self:output("])") end
	end
end

function sling.js.generator.JSGenerator:dumpBufferLiteralExpression(node)
	do self:output("new Uint8Array([") end
	do
		local bval = node:getValue()
		local size = _g.jk.lang.Buffer:getSize(bval)
		if size > 0 then
			local newl = false
			if size > 10 then
				newl = true
				do self:output("\n") end
			end
			do
				local c = 1
				local i = 0
				while true do
					if i >= size then
						do break end
					end
					if i > 0 then
						do self:output(",") end
					end
					if c <= 10 then
						if i > 0 then
							do self:output(" ") end
						end
					else
						do self:output("\n") end
						c = 0
					end
					do
						local b = _g.jk.lang.String:forIntegerHex(_g.jk.lang.Buffer:getByte(bval, i), 0)
						if _g.jk.lang.String:getLength(b) < 2 then
							b = "0" .. _g.jk.lang.String:safeString(b)
						end
						do self:output("0x" .. _g.jk.lang.String:safeString(b)) end
						do c = c + 1 end
						do i = i + 1 end
					end
				end
				if newl then
					do self:output("\n") end
				end
			end
		end
		do self:output("]).buffer") end
	end
end

function sling.js.generator.JSGenerator:dumpObjectLiteralValue(node)
	if not (node ~= nil) then
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.KeyValueNode') ~= nil) then
		local key = node:getKey()
		if (_vm:to_table_with_key(key, '_isType.sling.model.LiteralExpressionNode') ~= nil) or (_vm:to_table_with_key(key, '_isType.sling.model.SymbolExpressionNode') ~= nil) then
			do self:dumpExpression(key, nil) end
		else
			do self:output("[") end
			do self:dumpExpression(key, nil) end
			do self:output("]") end
		end
		do self:output(" : ") end
		do self:dumpExpression(node:getValue(), nil) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.PropertyFunctionDeclarationNode') ~= nil) then
		do self:dumpPropertyFunctionDeclaration(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ExpressionNode') ~= nil) then
		do self:dumpExpression(node, nil) end
		do return end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "map literal value" .. "'", node, nil))
end

function sling.js.generator.JSGenerator:dumpObjectLiteralExpression(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local exprs = node:getValues()
		if _g.jk.lang.Vector:getSize(exprs) == 1 then
			do self:output("{ ") end
			do self:dumpObjectLiteralValue(_vm:to_table_with_key(_g.jk.lang.Vector:get(exprs, 0), '_isType.sling.common.NodeObject')) end
			do self:output(" }") end
		elseif _g.jk.lang.Vector:getSize(exprs) > 1 then
			do self:output("{\n") end
			do
				local first = true
				if exprs ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(exprs)
					do
						n = 0
						while n < m do
							local expr = _vm:to_table_with_key(exprs[n + 1], '_isType.sling.common.NodeObject')
							if expr ~= nil then
								if not first then
									do self:output(",\n") end
								end
								do self:dumpObjectLiteralValue(expr) end
								first = false
							end
							do n = n + 1 end
						end
					end
				end
				do self:output("\n") end
				do self:output("}") end
			end
		else
			do self:output("{}") end
		end
		if self.supportTypeScript then
			do self:tryDumpDataTypeAnnotation(node:getDefaultDataType()) end
		end
	end
end

function sling.js.generator.JSGenerator:doDumpDestructuredDeclaration(node, withTerminator)
	if not (node ~= nil) then
		do return end
	end
	do
		local exp = node:getExpression()
		if not (exp ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpExpression(exp, nil) end
		if self.supportTypeScript then
			do self:tryDumpDataTypeAnnotation(node:getType()) end
		end
		do
			local init = node:getInitializer()
			if init ~= nil then
				do self:output(" = ") end
				do self:dumpExpression(init, nil) end
			end
			if withTerminator then
				do self:output(";\n") end
			end
		end
	end
end

function sling.js.generator.JSGenerator:dumpRegularExpressionLiteralExpression(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local flag = node:getRegexFlag()
		do self:output("/" .. _g.jk.lang.String:safeString(node:getValue()) .. "/" .. _g.jk.lang.String:safeString(flag)) end
	end
end

function sling.js.generator.JSGenerator:dumpLiteralExpression(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.NullLiteralExpressionNode') ~= nil) then
		do self:output("null") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BooleanLiteralExpressionNode') ~= nil) then
		do self:output(_g.jk.lang.String:forBoolean(node:getValue())) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StringLiteralExpressionNode') ~= nil) then
		do self:output("\"" .. _g.jk.lang.String:safeString(_g.sling.common.CodeStringUtil:escapeStringLiteralCStyle(node:getValue())) .. "\"") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.TemplateLiteralExpressionNode') ~= nil) then
		local tag = node:getTag()
		if tag ~= nil then
			do self:dumpDataType(tag) end
			do self:output(" ") end
		end
		do self:output("`" .. _g.jk.lang.String:safeString(node:getValue()) .. "`") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DecimalLiteralExpressionNode') ~= nil) then
		do self:output(_vm:to_table_with_key(node, '_isType.sling.model.DecimalLiteralExpressionNode'):getValue()) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.IntegerLiteralExpressionNode') ~= nil) then
		local ilen = node
		local frmt = ilen:getFormat()
		local ival = ilen:getValue()
		if frmt == _g.sling.model.IntegerLiteralExpressionNode.FORMAT_HEXADECIMAL then
			do self:output("0x") end
			if ilen:getType() == _g.sling.model.IntegerDataTypeNode.TYPE_INT64 then
				do self:output(_g.jk.lang.String:forLongIntegerHex(ival, 0)) end
			else
				do self:output(_g.jk.lang.String:forIntegerHex(ival, 0)) end
			end
		elseif frmt == _g.sling.model.IntegerLiteralExpressionNode.FORMAT_OCTAL then
			do self:output("0o") end
			do self:output(_g.jk.lang.String:forIntegerOctal(ival)) end
		elseif frmt == _g.sling.model.IntegerLiteralExpressionNode.FORMAT_BINARY then
			do self:output("0b") end
			do self:output(_g.jk.lang.String:forIntegerBinary(ival)) end
		else
			do self:output(_g.jk.lang.String:forLongInteger(ival)) end
		end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DoubleLiteralExpressionNode') ~= nil) then
		local dl = node
		do self:output(_g.jk.lang.String:forDouble(dl:getValue())) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FloatLiteralExpressionNode') ~= nil) then
		local dl = node
		do self:output(_g.jk.lang.String:forDouble(dl:getValue())) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.CharacterLiteralExpressionNode') ~= nil) then
		local cc = node:getValue()
		if cc == 39 then
			do self:output("'\\''") end
		elseif cc == 0 then
			do self:output("'\\0'") end
		elseif cc == 7 then
			do self:output("'\\a'") end
		elseif cc == 8 then
			do self:output("'\\b'") end
		elseif cc == 12 then
			do self:output("'\\f'") end
		elseif cc == 10 then
			do self:output("'\\n'") end
		elseif cc == 13 then
			do self:output("'\\r'") end
		elseif cc == 9 then
			do self:output("'\\t'") end
		elseif cc == 11 then
			do self:output("'\\v'") end
		elseif cc == 92 then
			do self:output("'\\\\'") end
		elseif cc == 34 then
			do self:output("'\\\"'") end
		else
			do self:output("'" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forCharacter(cc)) .. "'") end
		end
		do self:output(".charCodeAt()") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ArrayLiteralExpressionNode') ~= nil) then
		do self:dumpArrayLiteralExpression(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.ObjectLiteralExpressionNode') ~= nil) then
		do self:dumpObjectLiteralExpression(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.RegularExpressionLiteralExpressionNode') ~= nil) then
		do self:dumpRegularExpressionLiteralExpression(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.SetLiteralExpressionNode') ~= nil) then
		do self:dumpSetLiteralExpression(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BufferLiteralExpressionNode') ~= nil) then
		do self:dumpBufferLiteralExpression(node) end
		do return end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "literal expression" .. "'", node, nil))
end

function sling.js.generator.JSGenerator:dumpSymbolComponent(node, comp)
	if (_vm:get_variable_type(comp) == 'string') then
		do self:output(comp) end
		do return end
	end
	if (_vm:to_table_with_key(comp, '_isType.sling.model.SymbolNameComponentNode') ~= nil) then
		local cmp = comp
		local name = cmp:getName()
		if name ~= nil then
			do self:output(name) end
		end
		if self.supportTypeScript then
			local types = cmp:getTypeParameters()
			if not _g.jk.lang.Vector:isEmpty(types) then
				do self:output("<") end
				do
					local first = true
					if types ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(types)
						do
							n = 0
							while n < m do
								local type = _vm:to_table_with_key(types[n + 1], '_isType.sling.common.DataTypeNode')
								if type ~= nil then
									if not first then
										do self:output(", ") end
									end
									first = false
									do self:dumpDataType(type) end
								end
								do n = n + 1 end
							end
						end
					end
					do self:output(">") end
				end
			end
		end
		do return end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported symbol component", node, _g.jk.lang.StackTrace:generate()))
end

function sling.js.generator.JSGenerator:dumpSymbolNode(node, dumpAbsolute)
	if not (node ~= nil) then
		do return end
	end
	do
		local comps = _g.sling.util.SymbolUtil:getSymbolComponents(node)
		if _g.jk.lang.Vector:isEmpty(comps) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("symbol node has no components", node, _g.jk.lang.StackTrace:generate()))
		end
		if not dumpAbsolute then
			do self:dumpSymbolComponent(node, _g.jk.lang.Vector:getLast(comps)) end
		else
			local first = true
			if comps ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(comps)
				do
					n = 0
					while n < m do
						local comp = comps[n + 1]
						if comp ~= nil then
							if not first then
								do self:output(".") end
							end
							first = false
							do self:dumpSymbolComponent(node, comp) end
						end
						do n = n + 1 end
					end
				end
			end
		end
	end
end

function sling.js.generator.JSGenerator:shouldDumpAbsoluteSymbol(symbol)
	if not (symbol ~= nil) then
		do return true end
	end
	do
		local pp = _vm:to_table_with_key(symbol:getParent(), '_isType.sling.model.MemberAccessExpressionNode')
		if not (pp ~= nil) then
			do return true end
		end
		if pp:getChildExpression() == symbol then
			do return false end
		end
		if pp:getParentExpression() == symbol and (_vm:to_table_with_key(pp:getParent(), '_isType.sling.model.MemberAccessExpressionNode') ~= nil) then
			do return false end
		end
		do return true end
	end
end

function sling.js.generator.JSGenerator:dumpSymbolExpression(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local symb = node:getSymbol()
		if not (symb ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("symbol expression has no symbol", nil, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpSymbolNode(symb, self:shouldDumpAbsoluteSymbol(node)) end
	end
end

function sling.js.generator.JSGenerator:dumpMemberAccessExpression(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local prnt = node:getParentExpression()
		local chld = node:getChildExpression()
		if not (prnt ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("member access has no parent expression", node, _g.jk.lang.StackTrace:generate()))
		end
		if not (chld ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("member access has no child expression", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpExpression(prnt, node) end
		do self:output(".") end
		do self:dumpExpression(chld, node) end
	end
end

function sling.js.generator.JSGenerator:dumpFunctionCallExpression(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local expr = node:getExpression()
		if not (expr ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("function call has no expression", node, _g.jk.lang.StackTrace:generate()))
		end
		if (_vm:to_table_with_key(expr, '_isType.sling.model.FunctionDeclarationExpressionNode') ~= nil) or (_vm:to_table_with_key(expr, '_isType.sling.js.model.JavascriptFunctionDeclarationExpressionNode') ~= nil) then
			do self:output("(") end
			do self:doDumpExpression(expr, node) end
			do self:output(")") end
		else
			do self:dumpExpression(expr, node) end
		end
		do self:output("(") end
		do
			local prams = node:getParameters()
			local first = true
			if prams ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(prams)
				do
					n = 0
					while n < m do
						local pram = _vm:to_table_with_key(prams[n + 1], '_isType.sling.model.ExpressionNode')
						if pram ~= nil then
							if not first then
								do self:output(", ") end
							end
							do self:dumpExpression(pram, node) end
							first = false
						end
						do n = n + 1 end
					end
				end
			end
			do self:output(")") end
		end
	end
end

function sling.js.generator.JSGenerator:dumpExpression(node, parent)
	local lower = self:isLowerPriority(node, parent)
	if lower then
		do self:output("(") end
	end
	do self:doDumpExpression(node, parent) end
	if lower then
		do self:output(")") end
	end
end

function sling.js.generator.JSGenerator:dumpCreateObjectExpression(node)
	do self:output("new ") end
	do
		local type = node:getType()
		if type ~= nil then
			do self:dumpDataType(type) end
		else
			local typeExp = node:getTypeExpression()
			if not (typeExp ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("create object expression has no data type", node, _g.jk.lang.StackTrace:generate()))
				do return end
			end
			do self:dumpExpression(typeExp, nil) end
		end
		do
			local params = node:getParameters()
			if params ~= nil then
				do self:output("(") end
				do
					local first = true
					if params ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(params)
						do
							n = 0
							while n < m do
								local param = _vm:to_table_with_key(params[n + 1], '_isType.sling.model.ExpressionNode')
								if param ~= nil then
									if first == false then
										do self:output(", ") end
									end
									first = false
									do self:dumpExpression(param, node) end
								end
								do n = n + 1 end
							end
						end
					end
					do self:output(")") end
				end
			end
		end
	end
end

function sling.js.generator.JSGenerator:dumpSubScriptExpression(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local xp = node:getChild()
		if not (xp ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null child", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpExpression(xp, node) end
		do self:output("[") end
		do
			local ss = node:getSubscript()
			if ss ~= nil then
				do self:dumpExpression(ss, nil) end
			end
			do self:output("]") end
		end
	end
end

function sling.js.generator.JSGenerator:dumpMembershipCheckExpressionNode(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local left = node:getLeft()
		if not (left ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpExpression(left, node) end
		do self:output(" in ") end
		do
			local right = node:getRight()
			if not (right ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null type", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(right, node) end
		end
	end
end

function sling.js.generator.JSGenerator:doDumpExpression(node, parent)
	if (_vm:to_table_with_key(node, '_isType.sling.model.CurrentObjectExpressionNode') ~= nil) then
		do self:output("this") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BaseClassAccessExpressionNode') ~= nil) then
		do self:output("super") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EmptyExpressionNode') ~= nil) then
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.CreateObjectExpressionNode') ~= nil) then
		do self:dumpCreateObjectExpression(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LiteralExpressionNode') ~= nil) then
		do self:dumpLiteralExpression(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.SymbolExpressionNode') ~= nil) then
		do self:dumpSymbolExpression(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationExpressionNode') ~= nil) then
		do self:dumpArrowFunctionDeclaration(node:getDeclaration()) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.JavascriptFunctionDeclarationExpressionNode') ~= nil) then
		do self:dumpFunctionDeclaration(node:getDeclaration(), true, false) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.ClassDeclarationExpressionNode') ~= nil) then
		do self:dumpClassDeclaration(node:getDeclaration()) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.MemberAccessExpressionNode') ~= nil) then
		do self:dumpMemberAccessExpression(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionCallExpressionNode') ~= nil) then
		do self:dumpFunctionCallExpression(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EmbedBlockNode') ~= nil) then
		do self:dumpEmbededBlock(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.MembershipCheckExpressionNode') ~= nil) then
		do self:dumpMembershipCheckExpressionNode(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.SubscriptExpressionNode') ~= nil) then
		do self:dumpSubScriptExpression(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.GetExpressionTypeinfoExpressionNode') ~= nil) then
		do self:output("typeof ") end
		do self:dumpExpression(node:getExpression(), node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.GetDatatypeTypeinfoExpressionNode') ~= nil) then
		local nn = node
		local dt = nn:getType()
		if not (dt ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No data type", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpDataType(dt) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.TypeCheckExpressionNode') ~= nil) then
		local expr = node:getExpression()
		local type = node:getType()
		if not (type ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("type check expression has no data type", node, _g.jk.lang.StackTrace:generate()))
			do return end
		end
		if (_vm:to_table_with_key(type, '_isType.sling.model.BooleanDataTypeNode') ~= nil) then
			do self:output("typeof(") end
			do self:dumpExpression(expr, node) end
			do self:output(") === 'boolean'") end
		elseif (_vm:to_table_with_key(type, '_isType.sling.model.StringDataTypeNode') ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.CharacterDataTypeNode') ~= nil) then
			do self:output("typeof(") end
			do self:dumpExpression(expr, node) end
			do self:output(") === 'string'") end
		elseif (_vm:to_table_with_key(type, '_isType.sling.model.FunctionDataTypeNode') ~= nil) then
			do self:output("typeof(") end
			do self:dumpExpression(expr, node) end
			do self:output(") === 'function'") end
		elseif (_vm:to_table_with_key(type, '_isType.sling.model.IntegerDataTypeNode') ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.DecimalDataTypeNode') ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.DoubleDataTypeNode') ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.FloatDataTypeNode') ~= nil) then
			do self:output("typeof(") end
			do self:dumpExpression(expr, node) end
			do self:output(") === 'number'") end
		elseif (_vm:to_table_with_key(type, '_isType.sling.model.ObjectDataTypeNode') ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.ExceptionDataTypeNode') ~= nil) then
			do self:output("typeof(") end
			do self:dumpExpression(expr, node) end
			do self:output(") === 'object'") end
		else
			do self:dumpExpression(expr, node) end
			if (_vm:to_table_with_key(type, '_isType.sling.model.NullDataTypeNode') ~= nil) then
				do self:output(" === null") end
			else
				do self:output(" instanceof ") end
				if (_vm:to_table_with_key(type, '_isType.sling.model.ExpressionDataTypeNode') ~= nil) then
					do self:dumpExpression(type:getExpression(), nil) end
				else
					do self:dumpDataType(type) end
				end
			end
		end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DynamicCastExpressionNode') ~= nil) then
		local dcst = node
		if self.supportTypeScript then
			do self:dumpExpression(dcst:getExpression(), nil) end
			do self:output(" as ") end
			do self:dumpDataType(dcst:getType()) end
		else
			do self:dumpExpression(dcst:getExpression(), nil) end
		end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StaticCastExpressionNode') ~= nil) then
		local scst = node
		local expr = scst:getExpression()
		if not (expr ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("static cast expression has no expression", nil, _g.jk.lang.StackTrace:generate()))
			do return end
		end
		do
			local type = scst:getType()
			if not (type ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("static cast expression has no data type", nil, _g.jk.lang.StackTrace:generate()))
				do return end
			end
			if self.supportTypeScript then
				do self:output("<") end
				do self:dumpDataType(type) end
				do self:output(">") end
				do self:dumpExpression(expr, nil) end
			else
				do self:dumpExpression(expr, parent) end
			end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ArrayCreationExpressionNode') ~= nil) then
		local ac = node
		local lit = ac:getArrayLiteral()
		if lit ~= nil then
			do self:dumpArrayLiteralExpression(lit) end
		else
			do self:output("[]") end
		end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.UnaryExpressionNode') ~= nil) then
		local expr = node:getExpression()
		if (_vm:to_table_with_key(node, '_isType.sling.js.model.DeleteExpressionNode') ~= nil) then
			do self:output("delete ") end
			do self:dumpExpression(expr, node) end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.js.model.VoidExpressionNode') ~= nil) then
			do self:output("void ") end
			do self:dumpExpression(expr, node) end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.AwaitExpressionNode') ~= nil) then
			do self:output("await ") end
			do self:dumpExpression(expr, node) end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.js.model.SpreadExpressionNode') ~= nil) then
			do self:output("...") end
			do self:dumpExpression(expr, node) end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.LogicalNotExpressionNode') ~= nil) then
			do self:output("!") end
			do self:dumpExpression(expr, node) end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseNotExpressionNode') ~= nil) then
			do self:output("~") end
			do self:dumpExpression(expr, node) end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.PositiveNumberExpressionNode') ~= nil) then
			do self:output("+") end
			do self:dumpExpression(expr, node) end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.NegativeNumberExpressionNode') ~= nil) then
			do self:output("-") end
			do self:dumpExpression(expr, node) end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.PreIncrementExpressionNode') ~= nil) then
			do self:output("++") end
			do self:dumpExpression(expr, node) end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.PreDecrementExpressionNode') ~= nil) then
			do self:output("--") end
			do self:dumpExpression(expr, node) end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.PostIncrementExpressionNode') ~= nil) then
			do self:dumpExpression(expr, node) end
			do self:output("++") end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.PostDecrementExpressionNode') ~= nil) then
			do self:dumpExpression(expr, node) end
			do self:output("--") end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.js.model.YieldToGeneratorExpressionNode') ~= nil) then
			do self:output("yield* ") end
			do self:dumpExpression(expr, node) end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.YieldValueExpressionNode') ~= nil) then
			do self:output("yield ") end
			do self:dumpExpression(expr, node) end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.AllocateBufferExpressionNode') ~= nil) then
			do self:output("new ArrayBuffer(") end
			do
				local sz = node:getExpression()
				if sz == nil then
					do self:output("0") end
				else
					do self:dumpExpression(sz, nil) end
				end
				do self:output(")") end
				do return end
			end
		end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "unary expression" .. "'", node, nil))
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.AppendToVectorExpressionNode') ~= nil) then
		local av = node
		local ll = av:getLeft()
		if not (ll ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No left", av, _g.jk.lang.StackTrace:generate()))
		end
		do
			local rr = av:getRight()
			if not (rr ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No right", av, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(ll, _g.sling.model.MemberAccessExpressionNode._construct0(_g.sling.model.MemberAccessExpressionNode._create())) end
			do self:output(".push(") end
			do self:dumpExpression(rr, nil) end
			do self:output(")") end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BinaryExpressionNode') ~= nil) then
		local lval = node:getLeft()
		local rval = node:getRight()
		if not (lval ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("binary expression has no left value", node, _g.jk.lang.StackTrace:generate()))
		end
		if not (rval ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("binary expression has no right value", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpExpression(lval, node) end
		if (_vm:to_table_with_key(node, '_isType.sling.model.MultiplicationExpressionNode') ~= nil) then
			do self:output(" * ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.DivisionExpressionNode') ~= nil) then
			do self:output(" / ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.AdditionExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.StringConcatenationExpressionNode') ~= nil) then
			do self:output(" + ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.SubtractionExpressionNode') ~= nil) then
			do self:output(" - ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.ModuloExpressionNode') ~= nil) then
			do self:output(" % ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.ShiftLeftExpressionNode') ~= nil) then
			do self:output(" << ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.ShiftRightExpressionNode') ~= nil) then
			if node:getZeroLeftmostBit() then
				do self:output(" >>> ") end
			else
				do self:output(" >> ") end
			end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.LessThanExpressionNode') ~= nil) then
			do self:output(" < ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.GreaterThanExpressionNode') ~= nil) then
			do self:output(" > ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.LessOrEqualExpressionNode') ~= nil) then
			do self:output(" <= ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.GreaterOrEqualExpressionNode') ~= nil) then
			do self:output(" >= ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.MembershipCheckExpressionNode') ~= nil) then
			do self:output(" in ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.EqualsExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.StringEqualsExpressionNode') ~= nil) then
			do self:output(" == ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.NotEqualsExpressionNode') ~= nil) then
			do self:output(" != ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.StrictEqualsExpressionNode') ~= nil) then
			do self:output(" === ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.StrictNotEqualsExpressionNode') ~= nil) then
			do self:output(" !== ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseAndExpressionNode') ~= nil) then
			do self:output(" & ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseXorExpressionNode') ~= nil) then
			do self:output(" ^ ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseOrExpressionNode') ~= nil) then
			do self:output(" | ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.LogicalAndExpressionNode') ~= nil) then
			do self:output(" && ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.LogicalOrExpressionNode') ~= nil) then
			do self:output(" || ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.AssignmentExpressionNode') ~= nil) then
			do self:output(" = ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.MultiplicationAssignmentExpressionNode') ~= nil) then
			do self:output(" *= ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.DivisionAssignmentExpressionNode') ~= nil) then
			do self:output(" /= ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.ModuloAssignmentExpressionNode') ~= nil) then
			do self:output(" %= ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.AdditionAssignmentExpressionNode') ~= nil) then
			do self:output(" += ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.SubtractionAssignmentExpressionNode') ~= nil) then
			do self:output(" -= ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.ShiftLeftAssignmentExpressionNode') ~= nil) then
			do self:output(" <<= ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.ShiftRightAssignmentExpressionNode') ~= nil) then
			if node:getZeroLeftmostBit() then
				do self:output(" >>>= ") end
			else
				do self:output(" >>= ") end
			end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseAndAssignmentExpressionNode') ~= nil) then
			do self:output(" &= ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseXorAssignmentExpressionNode') ~= nil) then
			do self:output(" ^= ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseOrAssignmentExpressionNode') ~= nil) then
			do self:output(" |= ") end
		else
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "binary expression" .. "'", node, nil))
		end
		do self:dumpExpression(rval, node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ConditionalExpressionNode') ~= nil) then
		local cond = node:getCondition()
		local lval = node:getTrueExpr()
		local rval = node:getFalseExpr()
		if not (cond ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("conditional expression has no condition", node, _g.jk.lang.StackTrace:generate()))
		end
		if not (lval ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("conditional expression has no true expression", node, _g.jk.lang.StackTrace:generate()))
		end
		if not (rval ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("conditional expression has no false expression", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpExpression(cond, node) end
		do self:output(" ? ") end
		do self:dumpExpression(lval, node) end
		do self:output(" : ") end
		do self:dumpExpression(rval, node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.MultipleExpressionNode') ~= nil) then
		local first = true
		local exprs = node:getExpressions()
		if exprs ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(exprs)
			do
				n = 0
				while n < m do
					local expr = _vm:to_table_with_key(exprs[n + 1], '_isType.sling.model.ExpressionNode')
					if expr ~= nil then
						if not first then
							do self:output(", ") end
						end
						do self:dumpExpression(expr, nil) end
						first = false
					end
					do n = n + 1 end
				end
			end
		end
		do return end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "expression" .. "'", node, nil))
end

function sling.js.generator.JSGenerator:dumpBlockStatement(node, hasNewLine)
	do self:output("{\n") end
	do self:dumpStatementsFrom(node) end
	do self:output("}") end
	if hasNewLine then
		do self:output("\n") end
	end
end

function sling.js.generator.JSGenerator:dumpEmbededBlock(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local type = node:getType()
		local code = node:getCode()
		if not _g.jk.lang.String:equals("js", type) then
			do return end
		end
		if not _g.jk.lang.String:isNotEmpty(code) then
			do return end
		end
		do
			local isMultiLine = (_vm:to_table_with_key(node:getParent(), '_isType.sling.common.ContainerNode') ~= nil)
			local array = _g.jk.lang.String:split(code, 10, 0)
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local line = array[n + 1]
						if line ~= nil then
							line = _g.jk.lang.String:strip(line)
							if _g.jk.lang.String:isEmpty(line) == false then
								if isMultiLine then
									do self:output(_g.jk.lang.String:safeString(line) .. "\n") end
								else
									do self:output(line) end
								end
							end
						end
						do n = n + 1 end
					end
				end
			end
		end
	end
end

function sling.js.generator.JSGenerator:dumpStatementsFrom(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local array = node:getNodes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local nn = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
					if nn ~= nil then
						do self:dumpStatement(nn, false) end
					end
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.js.generator.JSGenerator:dumpVariableArgumentsDeclaration(node, withTerminator)
	if not (node ~= nil) then
		do return end
	end
	do self:output("...") end
	do self:doDumpVariableDeclaration(node:getVariableDeclaration(), withTerminator) end
end

function sling.js.generator.JSGenerator:dumpVariableDeclaration(node, withTerminator)
	if not (node ~= nil) then
		do return end
	end
	if _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.model.Modifier.CONSTANT) then
		do self:output("const ") end
	elseif _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.js.model.JSModifier.HOIST) then
		do self:output("var ") end
	else
		do self:output("let ") end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
		do self:doDumpVariableDeclaration(node, withTerminator) end
	elseif (_vm:to_table_with_key(node, '_isType.sling.js.model.DestructuredVariableDeclarationNode') ~= nil) then
		do self:doDumpDestructuredDeclaration(node, withTerminator) end
	elseif (_vm:to_table_with_key(node, '_isType.sling.model.MultipleVariableDeclarationNode') ~= nil) then
		do self:doDumpMultipleVariableDeclaration(node, withTerminator) end
	else
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "variable declaration" .. "'", node, nil))
	end
end

function sling.js.generator.JSGenerator:doDumpMultipleVariableDeclaration(node, withTerminator)
	if not (node ~= nil) then
		do return end
	end
	do
		local first = true
		local vdecs = node:getVariables()
		local count = _g.jk.lang.Vector:getSize(vdecs)
		local isLast = false
		if vdecs ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(vdecs)
			do
				n = 0
				while n < m do
					local vdec = _vm:to_table_with_key(vdecs[n + 1], '_isType.sling.common.NodeObject')
					if vdec ~= nil then
						if (_vm:to_table_with_key(vdec, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
							vdec = vdec
						elseif (_vm:to_table_with_key(vdec, '_isType.sling.js.model.DestructuredVariableDeclarationNode') ~= nil) then
							vdec = vdec
						end
						count = count - 1
						if not first then
							do self:output(", ") end
						end
						if first then
							do self:dumpVariableDeclaration(vdec, false) end
						elseif (_vm:to_table_with_key(vdec, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
							do self:doDumpVariableDeclaration(vdec, isLast and withTerminator) end
						else
							do self:doDumpDestructuredDeclaration(vdec, isLast and withTerminator) end
						end
						first = false
						if count == 1 then
							isLast = true
						end
					end
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.js.generator.JSGenerator:doDumpVariableDeclaration(node, withTerminator)
	if not (node ~= nil) then
		do return end
	end
	do
		local name = node:getNodeName()
		local init = node:getInitializer()
		if _g.jk.lang.String:isEmpty(name) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("variable declaration has no name", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:output(name) end
		if self.supportTypeScript then
			do self:tryDumpDataTypeAnnotation(node:getType()) end
		end
		if init ~= nil then
			do self:output(" = ") end
			do self:dumpExpression(init, nil) end
		end
		if withTerminator then
			do self:output(";\n") end
		end
	end
end

function sling.js.generator.JSGenerator:dumpFunctionDeclarationParameters(node)
	do self:output("(") end
	if node ~= nil then
		local first = true
		local vdecs = node:getParameters()
		if vdecs ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(vdecs)
			do
				n = 0
				while n < m do
					local vdec = _vm:to_table_with_key(vdecs[n + 1], '_isType.sling.common.NodeObject')
					if vdec ~= nil then
						if not first then
							do self:output(", ") end
						end
						first = false
						if self.supportTypeScript then
							do self:dumpModifiers(vdec) end
						end
						if self:dumpFunctionDeclarationParameter(vdec) then
							goto _continue1
						end
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. vdec:getNodeTypeName() .. "' in context `" .. "function declaration parameter" .. "'", vdec, nil))
					end
					::_continue1::
					do n = n + 1 end
				end
			end
		end
	end
	do self:output(")") end
end

function sling.js.generator.JSGenerator:dumpFunctionDeclarationParameter(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.VariableArgumentsDeclarationNode') ~= nil) then
		do self:dumpVariableArgumentsDeclaration(node, false) end
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
		do self:doDumpVariableDeclaration(node, false) end
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.DestructuredVariableDeclarationNode') ~= nil) then
		do self:doDumpDestructuredDeclaration(node, false) end
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.DestructuredParameterDeclarationNode') ~= nil) then
		local destructuredParameter = node
		local binding = destructuredParameter:getBinding()
		if not (binding ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Destructured parameter declaration has no binding", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpExpression(binding, nil) end
		do
			local init = destructuredParameter:getInitializer()
			if init ~= nil then
				do self:output(" = ") end
				do self:dumpExpression(init, nil) end
			end
			do return true end
		end
	end
	do return false end
end

function sling.js.generator.JSGenerator:dumpArrowFunctionDeclaration(node)
	if not (node ~= nil) then
		do return end
	end
	if _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.model.Modifier.ASYNCHRONOUS) then
		do self:output("async ") end
	end
	if node:getParameterCount() == 1 then
		local vdec = node:getParameter(0)
		if (_vm:to_table_with_key(vdec, '_isType.sling.model.VariableArgumentsDeclarationNode') ~= nil) then
			do self:output("(") end
			do self:dumpVariableArgumentsDeclaration(vdec, false) end
			do self:output(")") end
		elseif (_vm:to_table_with_key(vdec, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
			do self:doDumpVariableDeclaration(vdec, false) end
		else
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. vdec:getNodeTypeName() .. "' in context `" .. "function declaration parameter" .. "'", vdec, nil))
		end
	else
		do self:dumpFunctionDeclarationParameters(node) end
	end
	do self:output(" => ") end
	do
		local body = node:getBody()
		if not (body ~= nil) then
			do self:output("{}") end
			do return end
		end
		do
			local firstNode = body:getFirstNode()
			if body:getChildCount() == 1 and (_vm:to_table_with_key(firstNode, '_isType.sling.model.ExpressionNode') ~= nil) and self:isDeclarationExpressionNode(firstNode) == false then
				local isObjectLiteral = false
				if (_vm:to_table_with_key(firstNode, '_isType.sling.js.model.ObjectLiteralExpressionNode') ~= nil) then
					isObjectLiteral = true
				end
				if isObjectLiteral then
					do self:output("(") end
				end
				do self:dumpExpression(firstNode, nil) end
				if isObjectLiteral then
					do self:output(")") end
				end
				do return end
			end
			do self:dumpBlockStatement(node:getCreateBody(), false) end
		end
	end
end

function sling.js.generator.JSGenerator:dumpBaseTypes(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local bts = node:getBaseTypes()
		if not _g.jk.lang.Vector:isNotEmpty(bts) then
			do return end
		end
		do
			local extends = nil
			local implements = nil
			if bts ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(bts)
				do
					n = 0
					while n < m do
						local basetype = _vm:to_table_with_key(bts[n + 1], '_isType.sling.model.BaseTypeNode')
						if basetype ~= nil then
							local it = basetype:getInheritType()
							if it == _g.sling.model.BaseTypeNode.INHERIT_INFORMATIVE or it == _g.sling.model.BaseTypeNode.INHERIT_UNKNOWN then
								goto _continue2
							end
							if it == _g.sling.model.BaseTypeNode.INHERIT_EXTEND then
								if extends == nil then
									extends = {}
								end
								do _g.jk.lang.Vector:append(extends, basetype) end
								goto _continue2
							end
							if self.supportTypeScript then
								if it == _g.sling.model.BaseTypeNode.INHERIT_IMPLEMENT then
									if implements == nil then
										implements = {}
									end
									do _g.jk.lang.Vector:append(implements, basetype) end
									goto _continue2
								end
							end
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unknown inheritance type " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(it)) .. " encountered for base type.", node, _g.jk.lang.StackTrace:generate()))
						end
						::_continue2::
						do n = n + 1 end
					end
				end
			end
			if extends ~= nil then
				do self:doDumpBaseType(extends, " extends ") end
			end
			if implements ~= nil then
				do self:doDumpBaseType(implements, " implements ") end
			end
		end
	end
end

function sling.js.generator.JSGenerator:doDumpBaseType(basetypes, type)
	if not (basetypes ~= nil) then
		do return end
	end
	do
		local first = true
		if basetypes ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(basetypes)
			do
				n = 0
				while n < m do
					local basetype = basetypes[n + 1]
					if basetype ~= nil then
						if first then
							do self:output(type) end
						else
							do self:output(", ") end
						end
						first = false
						do
							local btt = basetype:getReferenceType()
							if not (btt ~= nil) then
								if basetype:getInheritType() == _g.sling.model.BaseTypeNode.INHERIT_EXTEND then
									local exp = basetype:getExpression()
									if exp ~= nil then
										do self:dumpExpression(exp, nil) end
									else
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No data type", basetype, _g.jk.lang.StackTrace:generate()))
									end
								else
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No data type", basetype, _g.jk.lang.StackTrace:generate()))
								end
							else
								do self:dumpDataType(btt) end
							end
						end
					end
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.js.generator.JSGenerator:dumpFunctionDeclaration(node, isExpression, isMethod)
	if not (node ~= nil) then
		do return end
	end
	if not isExpression then
		if _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.model.Modifier.STATIC) then
			do self:output("static ") end
		end
	end
	if _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.model.Modifier.ASYNCHRONOUS) then
		do self:output("async ") end
	end
	if isMethod then
		do self:output(node:getNodeName()) end
	else
		do self:output("function") end
		if _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.js.model.JSModifier.GENERATOR) then
			do self:output("*") end
		end
		if not isExpression then
			do self:output(" " .. _g.jk.lang.String:safeString(node:getNodeName())) end
		end
	end
	if self.supportTypeScript then
		local generics = node:getGenericTypes()
		if generics ~= nil then
			do self:dumpGenericTypes(generics) end
		end
	end
	do self:dumpFunctionDeclarationParameters(node) end
	if self.supportTypeScript then
		if node:getReturnType() ~= nil then
			do self:output(": ") end
			do self:dumpDataType(node:getReturnType()) end
		end
	end
	do
		local body = node:getBody()
		if body ~= nil then
			do self:output(" ") end
			do self:dumpBlockStatement(body, not isExpression) end
		else
			do self:output(" {}") end
		end
	end
end

function sling.js.generator.JSGenerator:dumpPropertyFunctionDeclaration(node)
	if not (node ~= nil) then
		do return end
	end
	do self:dumpModifiers(node) end
	do
		local drct = node:getDirection()
		local pref = nil
		if drct == _g.sling.js.model.PropertyFunctionDeclarationNode.DIRECTION_GET then
			pref = "get"
		elseif drct == _g.sling.js.model.PropertyFunctionDeclarationNode.DIRECTION_SET then
			pref = "set"
		end
		if pref ~= nil then
			do self:output(_g.jk.lang.String:safeString(pref) .. " ") end
		end
		do
			local name = node:getNodeName()
			if _g.jk.lang.String:isEmpty(name) then
				local n = node:getExpression()
				if (_vm:to_table_with_key(n, '_isType.sling.model.LiteralExpressionNode') ~= nil) or (_vm:to_table_with_key(n, '_isType.sling.model.SymbolExpressionNode') ~= nil) then
					do self:dumpExpression(n, nil) end
				else
					do self:output("[") end
					do self:dumpExpression(n, nil) end
					do self:output("]") end
				end
			else
				do self:output(name) end
			end
			if _g.jk.lang.String:equals(pref, "get") and node:getParameterCount() > 0 then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("get method declaration should not have parameters", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpFunctionDeclarationParameters(node) end
			do
				local body = node:getBody()
				if self.supportTypeScript then
					do self:tryDumpDataTypeAnnotation(node:getReturnType()) end
					if _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.model.Modifier.ABSTRACT) or not (body ~= nil) then
						do self:output(";\n") end
					else
						do self:dumpBlockStatement(body, true) end
					end
				elseif body ~= nil then
					do self:dumpBlockStatement(body, true) end
				end
			end
		end
	end
end

function sling.js.generator.JSGenerator:dumpInterfaceDeclaration(node)
	if not self.supportTypeScript then
		do return end
	end
	if not (node ~= nil) then
		do return end
	end
	do self:output("interface ") end
	do
		local name = node:getName()
		if not (name ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("interface declaration has no name", node, _g.jk.lang.StackTrace:generate()))
			do return end
		end
		do self:output(name) end
		do
			local generics = node:getGenericTypes()
			if generics ~= nil then
				do self:dumpGenericTypes(generics) end
			end
			do self:dumpBaseTypes(node) end
			do self:output(" {\n") end
			do
				local array = node:getNodes()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local chld = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
							if chld ~= nil then
								if (_vm:to_table_with_key(chld, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
									do self:dumpPropertyVariableDeclaration(chld) end
									goto _continue3
								end
								if (_vm:to_table_with_key(chld, '_isType.sling.js.model.DestructuredVariableDeclarationNode') ~= nil) then
									do self:doDumpDestructuredDeclaration(chld, true) end
									goto _continue3
								end
								if (_vm:to_table_with_key(chld, '_isType.sling.js.model.PropertyFunctionDeclarationNode') ~= nil) then
									do self:dumpPropertyFunctionDeclaration(chld) end
									goto _continue3
								end
							end
							::_continue3::
							do n = n + 1 end
						end
					end
				end
				do self:output("}") end
			end
		end
	end
end

function sling.js.generator.JSGenerator:dumpTypeAliasDeclaration(node)
	if not (node ~= nil) then
		do return end
	end
	do self:output("type ") end
	do self:output(node:getName()) end
	do
		local generics = node:getGenericTypes()
		if generics ~= nil then
			do self:dumpGenericTypes(generics) end
		end
		do self:output(" = ") end
		do self:dumpDataType(node:getType()) end
		do self:output("\n") end
	end
end

function sling.js.generator.JSGenerator:dumpConstructorDeclaration(node)
	if not (node ~= nil) then
		do return end
	end
	do self:output("constructor") end
	do self:dumpFunctionDeclarationParameters(node) end
	do self:output(" ") end
	do self:dumpBlockStatement(node:getCreateBody(), true) end
end

function sling.js.generator.JSGenerator:dumpClassDeclaration(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local clsn = node:getNodeName()
		do self:output("class ") end
		do self:output(clsn) end
		if self.supportTypeScript then
			local generics = node:getGenericTypes()
			if generics ~= nil then
				do self:dumpGenericTypes(generics) end
			end
		end
		do self:dumpBaseTypes(node) end
		do self:output(" {\n") end
		do
			local array = node:getNodes()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local chld = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
						if chld ~= nil then
							if (_vm:to_table_with_key(chld, '_isType.sling.js.model.PropertyFunctionDeclarationNode') ~= nil) then
								do self:dumpPropertyFunctionDeclaration(chld) end
								goto _continue4
							end
							if (_vm:to_table_with_key(chld, '_isType.sling.model.ConstructorDeclarationNode') ~= nil) then
								do self:dumpConstructorDeclaration(chld) end
								goto _continue4
							end
							if (_vm:to_table_with_key(chld, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
								do self:dumpFunctionDeclaration(chld, false, true) end
								goto _continue4
							end
							if self.supportTypeScript then
								if (_vm:to_table_with_key(chld, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
									do self:dumpPropertyVariableDeclaration(chld) end
									goto _continue4
								end
							end
							if self.enableClassEmbedBlock then
								if (_vm:to_table_with_key(chld, '_isType.sling.model.EmbedBlockNode') ~= nil) then
									do self:dumpEmbededBlock(chld) end
									goto _continue4
								end
							end
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. chld:getNodeTypeName() .. "' in context `" .. "class member" .. "'", chld, nil))
						end
						::_continue4::
						do n = n + 1 end
					end
				end
			end
			do self:output("}\n") end
		end
	end
end

function sling.js.generator.JSGenerator:dumpGenericTypes(genericTypes)
	if not self.supportTypeScript then
		do return end
	end
	if not _g.jk.lang.Vector:isEmpty(genericTypes) then
		do self:output("<") end
		do
			local first = true
			if genericTypes ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(genericTypes)
				do
					n = 0
					while n < m do
						local cd = _vm:to_table_with_key(genericTypes[n + 1], '_isType.sling.model.TemplateDeclarationNode')
						if cd ~= nil then
							if not first then
								do self:output(", ") end
							end
							do self:output(cd:getName()) end
							do
								local test = _g.sling.util.EntityUtil:getBaseClassTypeForEntity(cd)
								if test ~= nil then
									do self:output(" extends ") end
									do self:dumpDataType(test) end
								end
								first = false
							end
						end
						do n = n + 1 end
					end
				end
			end
			do self:output(">") end
		end
	end
end

function sling.js.generator.JSGenerator:dumpIfStatement(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local cond = node:getCondition()
		local ifbl = node:getIfBlock()
		local elbl = node:getElseBlock()
		if not (cond ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("if statement has no condition", node, _g.jk.lang.StackTrace:generate()))
		end
		if not (ifbl ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("if statement has no if block", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:output("if(") end
		do self:dumpExpression(cond, nil) end
		do self:output(") ") end
		do self:dumpStatement(ifbl, false) end
		if elbl ~= nil then
			local ends = elbl:getNodes()
			local oifs = _g.jk.lang.Vector:get(ends, 0)
			do self:output("else ") end
			if _g.jk.lang.Vector:getSize(ends) == 1 and (_vm:to_table_with_key(oifs, '_isType.sling.model.IfStatementNode') ~= nil) then
				do self:dumpStatement(oifs, false) end
			else
				do self:dumpStatement(elbl, false) end
			end
		end
	end
end

function sling.js.generator.JSGenerator:dumpDoWhileStatement(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local blck = node:getBlock()
		local cond = node:getCondition()
		if not (blck ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("do while statement has no block", node, _g.jk.lang.StackTrace:generate()))
		end
		if not (cond ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("do while statement has no condition", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:output("do ") end
		do self:dumpStatement(blck, false) end
		do self:output("while(") end
		do self:dumpExpression(cond, nil) end
		do self:output(");\n") end
	end
end

function sling.js.generator.JSGenerator:dumpWhileStatement(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local cond = node:getCondition()
		local blck = node:getBlock()
		if not (cond ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("while statement has no block", node, _g.jk.lang.StackTrace:generate()))
		end
		if not (blck ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("while statement has no condition", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:output("while(") end
		do self:dumpExpression(cond, nil) end
		do self:output(")") end
		do self:dumpStatement(blck, false) end
	end
end

function sling.js.generator.JSGenerator:dumpForStatement(node)
	do self:output("for(") end
	do
		local init = node:getInitializer()
		if init ~= nil then
			local first = true
			local array = init:getNodes()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local inode = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
						if inode ~= nil then
							if first == false then
								do self:output(", ") end
							end
							first = false
							if (_vm:to_table_with_key(inode, '_isType.sling.model.VariableDeclarationNode') ~= nil) or (_vm:to_table_with_key(inode, '_isType.sling.js.model.DestructuredVariableDeclarationNode') ~= nil) then
								do self:dumpVariableDeclaration(inode, false) end
							elseif (_vm:to_table_with_key(inode, '_isType.sling.model.ExpressionNode') ~= nil) then
								do self:dumpExpression(inode, nil) end
							end
						end
						do n = n + 1 end
					end
				end
			end
		end
		do self:output(" ; ") end
		do
			local cond = node:getCondition()
			if cond ~= nil then
				do self:dumpExpression(cond, nil) end
			end
			do self:output(" ; ") end
			do
				local ff = node:getFinalizer()
				if ff ~= nil then
					local first = true
					local array2 = ff:getNodes()
					if array2 ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(array2)
						do
							n2 = 0
							while n2 < m2 do
								local fnode = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.common.NodeObject')
								if fnode ~= nil then
									if first == false then
										do self:output(", ") end
									end
									first = false
									if (_vm:to_table_with_key(fnode, '_isType.sling.model.ExpressionNode') ~= nil) then
										do self:dumpExpression(fnode, nil) end
									else
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unknown node in finalizer", fnode, _g.jk.lang.StackTrace:generate()))
									end
								end
								do n2 = n2 + 1 end
							end
						end
					end
				end
				do self:output(") ") end
				do self:dumpStatement(node:getBlock(), false) end
			end
		end
	end
end

function sling.js.generator.JSGenerator:dumpForEachStatement(node)
	do self:output("for") end
	if _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.js.model.JSModifier.AWAIT) then
		if not node:getIterateKeys() then
			do self:output(" await ") end
		else
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("await is only valid in for...of", nil, _g.jk.lang.StackTrace:generate()))
		end
	end
	do self:output("(") end
	do
		local value = node:getLeft()
		if not (value ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No left node", node, _g.jk.lang.StackTrace:generate()))
		end
		do
			local right = node:getRight()
			if not (right ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No right node", node, _g.jk.lang.StackTrace:generate()))
			end
			do
				local block = node:getBlock()
				if not (block ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No block", node, _g.jk.lang.StackTrace:generate()))
				end
				if (_vm:to_table_with_key(value, '_isType.sling.model.VariableDeclarationNode') ~= nil) or (_vm:to_table_with_key(value, '_isType.sling.js.model.DestructuredVariableDeclarationNode') ~= nil) then
					do self:dumpVariableDeclaration(value, false) end
				elseif (_vm:to_table_with_key(value, '_isType.sling.model.ExpressionNode') ~= nil) then
					do self:doDumpExpression(value, nil) end
				end
				if node:getIterateKeys() then
					do self:output(" in ") end
				else
					do self:output(" of ") end
				end
				do self:dumpExpression(right, nil) end
				do self:output(")") end
				do self:dumpStatement(block, false) end
			end
		end
	end
end

function sling.js.generator.JSGenerator:dumpSwitchStatement(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local expr = node:getExpression()
		local blcks = node:getBlocks()
		if not (expr ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("switch statement has no expression", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:output("switch(") end
		do self:dumpExpression(expr, nil) end
		do self:output(") {\n") end
		if blcks ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(blcks)
			do
				n = 0
				while n < m do
					local blck = _vm:to_table_with_key(blcks[n + 1], '_isType.sling.model.CaseBlockNode')
					if blck ~= nil then
						if (_vm:to_table_with_key(blck, '_isType.sling.model.CaseEqualsBlockNode') ~= nil) then
							do self:output("case ") end
							do self:dumpExpression(blck:getExpression(), nil) end
						elseif (_vm:to_table_with_key(blck, '_isType.sling.model.CaseDefaultBlockNode') ~= nil) then
							do self:output("default") end
						end
						do self:output(":\n") end
						do self:adjustIndent(1) end
						do self:dumpStatementsFrom(blck:getBlock()) end
						do self:adjustIndent(-1) end
					end
					do n = n + 1 end
				end
			end
		end
		do self:output("}\n") end
	end
end

function sling.js.generator.JSGenerator:dumpTryCatchStatement(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local tryb = node:getTryBlock()
		local cbls = node:getCatchBlocks()
		local fblk = node:getFinallyBlock()
		do self:output("try ") end
		do self:dumpBlockStatement(tryb, true) end
		if cbls ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(cbls)
			do
				n = 0
				while n < m do
					local cblk = _vm:to_table_with_key(cbls[n + 1], '_isType.sling.model.CatchBlockNode')
					if cblk ~= nil then
						do self:output("catch") end
						do
							local exps = cblk:getExceptions()
							local size = _g.jk.lang.Vector:getSize(exps)
							if size == 0 then
								do self:output(" ") end
							elseif size == 1 then
								local vdec = _vm:to_table_with_key(_g.jk.lang.Vector:get(exps, 0), '_isType.sling.model.VariableDeclarationNode')
								if vdec ~= nil then
									do self:output("(") end
									do self:output(vdec:getNodeName()) end
									do self:output(") ") end
								end
							else
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("multiple catch block variables are not supported in Javascript", nil, _g.jk.lang.StackTrace:generate()))
							end
							do self:dumpBlockStatement(cblk:getBlock(), true) end
						end
					end
					do n = n + 1 end
				end
			end
		end
		if fblk ~= nil then
			do self:output("finally ") end
			do self:dumpBlockStatement(fblk, true) end
		end
	end
end

function sling.js.generator.JSGenerator:dumpWithStatement(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local exp = node:getExpression()
		local blck = node:getBlock()
		if not (exp ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("with statement has no expression", node, _g.jk.lang.StackTrace:generate()))
		end
		if not (blck ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("with statement has no block", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:output("with(") end
		do self:dumpExpression(exp, nil) end
		do self:output(")") end
		do self:dumpStatement(blck, false) end
	end
end

function sling.js.generator.JSGenerator:dumpImportStatement(node)
	if not (node ~= nil) then
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ImportStaticMemberStatementNode') ~= nil) then
		local mmbr = node:getMember()
		if not (mmbr ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("import member statement has no member", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:output("import ") end
		do self:dumpSymbolNode(mmbr, true) end
		do self:output(";\n") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.ImportMultipleStaticMembersStatementNode') ~= nil) then
		local cont = node:getContainer()
		local symns = node:getMembers()
		local def = node:getDefaultExport()
		if not (cont ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("import multiple members statement has no container", node, _g.jk.lang.StackTrace:generate()))
		end
		if _g.jk.lang.Vector:isEmpty(symns) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("import multiple members statement has no members", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:output("import ") end
		if def ~= nil then
			do self:output(def) end
			do self:output(", ") end
		end
		do self:output("{ ") end
		do
			local first = true
			if symns ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(symns)
				do
					n = 0
					while n < m do
						local symb = _vm:to_table_with_key(symns[n + 1], '_isType.sling.model.ImportEntityStatementNode')
						if symb ~= nil then
							if not first then
								do self:output(", ") end
							end
							do self:dumpSymbolNode(symb:getEntity(), true) end
							first = false
						end
						do n = n + 1 end
					end
				end
			end
			do self:output(" } from \"") end
			do self:dumpSymbolNode(cont, true) end
			do self:output("\";\n") end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ImportPackageStatementNode') ~= nil) then
		local name = node:getPackage()
		local locn = node:getLocalName()
		local def = node:getDefaultExport()
		if not (name ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("import package statement has no package", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:output("import ") end
		if def ~= nil then
			do self:output(def) end
		end
		if def ~= nil and locn ~= nil then
			do self:output(", ") end
		end
		if locn ~= nil then
			do self:output("* as ") end
			do self:output(locn) end
		end
		do self:output(" from \"") end
		do self:dumpSymbolNode(name, true) end
		do self:output("\";\n") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.ImportExpressionStatementNode') ~= nil) then
		local nd = node
		local localName = nd:getLocalName()
		if not (localName ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("import expression has no local name", nil, _g.jk.lang.StackTrace:generate()))
			do return end
		end
		do
			local exp = nd:getExpression()
			if not (exp ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("import expression has no expression", nil, _g.jk.lang.StackTrace:generate()))
				do return end
			end
			do self:output("import ") end
			do self:output(localName) end
			do self:output(" = ") end
			do self:dumpExpression(exp, nil) end
			do self:output(";\n") end
			do return end
		end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "import statement" .. "'", node, nil))
end

function sling.js.generator.JSGenerator:dumpEnumDeclaration(node)
	if not (node ~= nil) then
		do return end
	end
	do self:dumpModifiers(node) end
	do self:output("enum ") end
	do self:output(node:getName()) end
	do self:output(" {\n") end
	do
		local first = true
		local array = node:getNodes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local e = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.EnumValueNode')
					if e ~= nil then
						if not first then
							do self:output(",") end
							do self:output("\n") end
						end
						do self:output(e:getName()) end
						do
							local xpr = e:getValue()
							if xpr ~= nil then
								do self:output(" = ") end
								do self:dumpExpression(xpr, nil) end
							end
							first = false
						end
					end
					do n = n + 1 end
				end
			end
		end
		if not first then
			do self:output("\n") end
		end
		do self:output("}\n") end
	end
end

function sling.js.generator.JSGenerator:dumpPropertyVariableDeclaration(node)
	if not (node ~= nil) then
		do return end
	end
	do self:dumpModifiers(node) end
	do
		local name = node:getName()
		if not (name ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("property variable declartion has no name", node, _g.jk.lang.StackTrace:generate()))
			do return end
		end
		do self:output(name) end
		if _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.js.model.JSModifier.OPTIONAL) then
			do self:output("?") end
		end
		if self.supportTypeScript then
			do self:tryDumpDataTypeAnnotation(node:getType()) end
		end
		do
			local init = node:getInitializer()
			if init ~= nil then
				do self:output(" = ") end
				do self:dumpExpression(init, nil) end
			end
			do self:output(";\n") end
		end
	end
end

function sling.js.generator.JSGenerator:dumpExportStatement(node)
	if not (node ~= nil) then
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.ExportDeclarationStatementNode') ~= nil) then
		local decl = node:getDeclaration()
		if not (decl ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("export declaration statement has no declaration", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:output("export ") end
		if _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.js.model.JSModifier.DEFAULT) then
			do self:output("default ") end
		end
		do self:dumpStatement(decl, false) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.ExportAllStaticMembersStatementNode') ~= nil) then
		local cont = node:getContainer()
		if not (cont ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("export all statement has no container", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:output("export * from ") end
		do self:dumpSymbolNode(cont, true) end
		do self:output(";\n") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.ExportMultipleStaticMembersStatementNode') ~= nil) then
		do self:output("export { ") end
		do
			local first = true
			local symns = node:getMembers()
			if symns ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(symns)
				do
					n = 0
					while n < m do
						local symb = _vm:to_table_with_key(symns[n + 1], '_isType.sling.model.SymbolNode')
						if symb ~= nil then
							if not first then
								do self:output(", ") end
							end
							do self:dumpSymbolNode(symb, true) end
							first = false
						end
						do n = n + 1 end
					end
				end
			end
			do self:output("}") end
			do
				local cont = node:getContainer()
				if cont ~= nil then
					do self:output(" from ") end
					do self:dumpSymbolNode(cont, true) end
				end
				do self:output(";\n") end
				do return end
			end
		end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "export statement" .. "'", node, nil))
end

function sling.js.generator.JSGenerator:dumpStatements(node, includeModuleMembers)
	if not (node ~= nil) then
		do return end
	end
	do
		local n = 0
		local prev = nil
		local array = node:getNodes()
		if array ~= nil then
			local n2 = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n2 = 0
				while n2 < m do
					local nn = _vm:to_table_with_key(array[n2 + 1], '_isType.sling.common.NodeObject')
					if nn ~= nil then
						if n > 0 then
							if self:isCompactNode(nn) and self:isCompactNode(prev) then
							else
								do self:output("\n") end
							end
						end
						do
							local oc = self:getOutputCounter()
							prev = nn
							do self:dumpStatement(nn, includeModuleMembers) end
							if self:getOutputCounter() > oc then
								do n = n + 1 end
							end
						end
					end
					do n2 = n2 + 1 end
				end
			end
		end
	end
end

function sling.js.generator.JSGenerator:dumpStatement(node, includeModuleMembers)
	if not (node ~= nil) then
		do return end
	end
	if includeModuleMembers then
		if (_vm:to_table_with_key(node, '_isType.sling.model.ImportStatementNode') ~= nil) then
			do self:dumpImportStatement(node) end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.js.model.ExportStatementNode') ~= nil) then
			do self:dumpExportStatement(node) end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.VariableDeclarationNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.js.model.DestructuredVariableDeclarationNode') ~= nil) then
		do self:dumpVariableDeclaration(node, true) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
		do self:dumpFunctionDeclaration(node, false, false) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.PropertyFunctionDeclarationNode') ~= nil) then
		do self:dumpPropertyFunctionDeclaration(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ClassDeclarationNode') ~= nil) then
		do self:dumpClassDeclaration(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EnumDeclarationNode') ~= nil) then
		do self:dumpEnumDeclaration(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.CommentNode') ~= nil) and self.readableCode then
		do self:dumpComment(node, true) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EmptyStatementNode') ~= nil) then
		do self:output(";\n") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BlockNode') ~= nil) then
		do self:dumpBlockStatement(node, true) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
		do self:dumpVariableDeclaration(node, true) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.MultipleVariableDeclarationNode') ~= nil) then
		do self:dumpVariableDeclaration(node, true) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.IfStatementNode') ~= nil) then
		do self:dumpIfStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DoWhileStatementNode') ~= nil) then
		do self:dumpDoWhileStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.WhileStatementNode') ~= nil) then
		do self:dumpWhileStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ForStatementNode') ~= nil) then
		do self:dumpForStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.SwitchStatementNode') ~= nil) then
		do self:dumpSwitchStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.TryCatchStatementNode') ~= nil) then
		do self:dumpTryCatchStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ContinueStatementNode') ~= nil) then
		do self:output("continue;\n") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ContinueLabelStatementNode') ~= nil) then
		do self:output("continue ") end
		do self:output(node:getLabel()) end
		do self:output(";\n") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BreakStatementNode') ~= nil) then
		do self:output("break;\n") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BreakLabelStatementNode') ~= nil) then
		do self:output("break ") end
		do self:output(node:getLabel()) end
		do self:output(";\n") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ReturnStatementNode') ~= nil) then
		local expr = node:getExpression()
		do self:output("return") end
		if expr ~= nil then
			do self:output(" ") end
			do self:dumpExpression(expr, nil) end
		end
		do self:output(";\n") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LabeledStatementNode') ~= nil) then
		do self:output(_g.jk.lang.String:safeString(node:getName()) .. ":\n") end
		do self:dumpStatement(node:getStatement(), false) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ThrowStatementNode') ~= nil) then
		do self:output("throw ") end
		do self:dumpExpression(node:getExpression(), nil) end
		do self:output(";\n") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ExpressionNode') ~= nil) then
		do self:dumpExpression(node, nil) end
		do self:output(";\n") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.WithStatementNode') ~= nil) then
		do self:dumpWithStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.js.model.DebuggerStatementNode') ~= nil) then
		do self:output("debugger;\n") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ForEachStatementNode') ~= nil) then
		do self:dumpForEachStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PrintLineStatementNode') ~= nil) then
		do self:output("console.log(") end
		do
			local xpr = node:getExpression()
			if not (xpr ~= nil) then
				do self:output("\"\"") end
			else
				do self:dumpExpression(xpr, nil) end
			end
			do self:output(");\n") end
			do return end
		end
	end
	if self.supportTypeScript then
		if (_vm:to_table_with_key(node, '_isType.sling.model.InterfaceDeclarationNode') ~= nil) then
			do self:dumpInterfaceDeclaration(node) end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.TypeAliasDeclarationNode') ~= nil) then
			do self:dumpTypeAliasDeclaration(node) end
			do return end
		end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "statement" .. "'", node, nil))
end

function sling.js.generator.JSGenerator:dumpNamespace(namespace)
	local array = namespace:getNodes()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
				if node ~= nil then
					if (_vm:to_table_with_key(node, '_isType.sling.common.CodeFileNode') ~= nil) then
						do self:dumpFile(node) end
						goto _continue5
					end
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "namespace" .. "'", node, nil))
				end
				::_continue5::
				do n = n + 1 end
			end
		end
	end
end

function sling.js.generator.JSGenerator:dumpModifiers(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local nwmod = _vm:to_table_with_key(node, '_isType.sling.model.NodeWithModifiers')
		if not (nwmod ~= nil) then
			do return end
		end
		do
			local first = true
			if self.supportTypeScript then
				local modNodes = _g.sling.util.ModifierUtil:getModifierNodes(nwmod)
				if modNodes ~= nil then
					if modNodes ~= nil then
						local n2 = 0
						local m = _g.jk.lang.Vector:getSize(modNodes)
						do
							n2 = 0
							while n2 < m do
								local n = _vm:to_table_with_key(modNodes[n2 + 1], '_isType.sling.model.AnnotationModifierNode')
								if n ~= nil then
									if not first then
										do self:output(" ") end
									end
									do self:dumpAnnotationModifier(n) end
									first = false
								end
								do n2 = n2 + 1 end
							end
						end
					end
				end
			end
			do
				local commons = _g.sling.util.ModifierUtil:getCommonModifiers(nwmod)
				if commons ~= nil then
					if commons ~= nil then
						local n3 = 0
						local m2 = _g.jk.lang.Vector:getSize(commons)
						do
							n3 = 0
							while n3 < m2 do
								local mod = commons[n3 + 1]
								if mod ~= nil then
									if not first then
										do self:output(" ") end
									end
									first = false
									do self:dumpModifier(mod, node) end
								end
								do n3 = n3 + 1 end
							end
						end
					end
				end
				if not first then
					do self:output(" ") end
				end
			end
		end
	end
end

function sling.js.generator.JSGenerator:dumpModifier(mod, node)
	if not (node ~= nil) then
		do return end
	end
	if _g.jk.lang.String:equals(mod, _g.sling.js.model.JSModifier.GENERATOR) then
		do self:output("*") end
		do return end
	end
	if _g.jk.lang.String:equals(mod, _g.sling.model.Modifier.ASYNCHRONOUS) then
		do self:output("async") end
		do return end
	end
	if _g.jk.lang.String:equals(mod, _g.sling.js.model.JSModifier.DEFAULT) then
		do self:output("default") end
		do return end
	end
	if _g.jk.lang.String:equals(mod, _g.sling.model.Modifier.STATIC) then
		do self:output("static") end
		do return end
	end
	if _g.jk.lang.String:equals(mod, _g.sling.js.model.JSModifier.AWAIT) then
		do self:output("await") end
		do return end
	end
	if self.supportTypeScript then
		if _g.jk.lang.String:equals(mod, _g.sling.model.Modifier.PUBLIC) then
			do self:output("public") end
			do return end
		end
		if _g.jk.lang.String:equals(mod, _g.sling.model.Modifier.PROTECTED) then
			do self:output("protected") end
			do return end
		end
		if _g.jk.lang.String:equals(mod, _g.sling.model.Modifier.PRIVATE) then
			do self:output("private") end
			do return end
		end
		if _g.jk.lang.String:equals(mod, _g.sling.model.Modifier.ABSTRACT) then
			do self:output("abstract") end
			do return end
		end
		if _g.jk.lang.String:equals(mod, _g.sling.model.Modifier.READONLY) then
			do self:output("readonly") end
			do return end
		end
		if _g.jk.lang.String:equals(mod, _g.sling.model.Modifier.GLOBAL) then
			do self:output("declare") end
			do return end
		end
		if _g.jk.lang.String:equals(mod, _g.sling.js.model.JSModifier.OPTIONAL) then
			do return end
		end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported modifier `" .. _g.jk.lang.String:safeString(mod) .. "'", node, _g.jk.lang.StackTrace:generate()))
end

function sling.js.generator.JSGenerator:dumpModule(module)
	if not (module ~= nil) then
		do return end
	end
	do
		local array = module:getNodes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
					if node ~= nil then
						if (_vm:to_table_with_key(node, '_isType.sling.model.NamespaceNode') ~= nil) then
							do self:dumpNamespace(node) end
							goto _continue6
						end
						if (_vm:to_table_with_key(node, '_isType.sling.common.CodeFileNode') ~= nil) then
							do self:dumpFile(node) end
							goto _continue6
						end
						if (_vm:to_table_with_key(node, '_isType.sling.model.ResourceFileNode') ~= nil) then
							goto _continue6
						end
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "module" .. "'", node, nil))
					end
					::_continue6::
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.js.generator.JSGenerator:dumpFile(file)
	if not (file ~= nil) then
		do return end
	end
	do
		local name = file:getNodeName()
		if _g.jk.lang.String:isEmpty(name) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("code file has no name", file, _g.jk.lang.StackTrace:generate()))
		end
		do self:startFile(name) end
		do self:dumpStatements(file, true) end
		do self:endFile() end
	end
end

function sling.js.generator.JSGenerator:getExcludeComments()
	do return self.excludeComments end
end

function sling.js.generator.JSGenerator:setExcludeComments(v)
	self.excludeComments = v
	do return self end
end

function sling.js.generator.JSGenerator:getCurrentIndent()
	do return self.currentIndent end
end

function sling.js.generator.JSGenerator:setCurrentIndent(v)
	self.currentIndent = v
	do return self end
end

function sling.js.generator.JSGenerator:getCopyrightDeclaration()
	do return self.copyrightDeclaration end
end

function sling.js.generator.JSGenerator:setCopyrightDeclaration(v)
	self.copyrightDeclaration = v
	do return self end
end

function sling.js.generator.JSGenerator:getHangingBraces()
	do return self.hangingBraces end
end

function sling.js.generator.JSGenerator:setHangingBraces(v)
	self.hangingBraces = v
	do return self end
end

function sling.js.generator.JSGenerator:getInsertSpaceAfterKeywords()
	do return self.insertSpaceAfterKeywords end
end

function sling.js.generator.JSGenerator:setInsertSpaceAfterKeywords(v)
	self.insertSpaceAfterKeywords = v
	do return self end
end

function sling.js.generator.JSGenerator:getSupportTypeScript()
	do return self.supportTypeScript end
end

function sling.js.generator.JSGenerator:setSupportTypeScript(v)
	self.supportTypeScript = v
	do return self end
end

function sling.js.generator.JSGenerator:getReadableCode()
	do return self.readableCode end
end

function sling.js.generator.JSGenerator:setReadableCode(v)
	self.readableCode = v
	do return self end
end

function sling.js.generator.JSGenerator:getEnableClassEmbedBlock()
	do return self.enableClassEmbedBlock end
end

function sling.js.generator.JSGenerator:setEnableClassEmbedBlock(v)
	self.enableClassEmbedBlock = v
	do return self end
end
