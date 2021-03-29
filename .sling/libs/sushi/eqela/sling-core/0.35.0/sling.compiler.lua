sling = sling or {}

sling.compiler = sling.compiler or {}

sling.compiler.SlingPreprocessor = {}
sling.compiler.SlingPreprocessor.__index = sling.compiler.SlingPreprocessor
_vm:set_metatable(sling.compiler.SlingPreprocessor, {})

function sling.compiler.SlingPreprocessor._create()
	local v = _vm:set_metatable({}, sling.compiler.SlingPreprocessor)
	return v
end

function sling.compiler.SlingPreprocessor:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.SlingPreprocessor'
	self['_isType.sling.compiler.SlingPreprocessor'] = true
	self.variables = nil
	self.ctx = nil
end

function sling.compiler.SlingPreprocessor:_construct0()
	sling.compiler.SlingPreprocessor._init(self)
	return self
end

sling.compiler.SlingPreprocessor.MyVisitor = _g.sling.common.NodeVisitor._create()
sling.compiler.SlingPreprocessor.MyVisitor.__index = sling.compiler.SlingPreprocessor.MyVisitor
_vm:set_metatable(sling.compiler.SlingPreprocessor.MyVisitor, {
	__index = _g.sling.common.NodeVisitor
})

function sling.compiler.SlingPreprocessor.MyVisitor._create()
	local v = _vm:set_metatable({}, sling.compiler.SlingPreprocessor.MyVisitor)
	return v
end

function sling.compiler.SlingPreprocessor.MyVisitor:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.SlingPreprocessor.MyVisitor'
	self['_isType.sling.compiler.SlingPreprocessor.MyVisitor'] = true
	self.ifs = nil
	self.values = nil
	self.thiss = nil
	self.parents = nil
	self.errors = nil
	self.resources = nil
	self.templates = nil
end

function sling.compiler.SlingPreprocessor.MyVisitor:_construct0()
	sling.compiler.SlingPreprocessor.MyVisitor._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.compiler.SlingPreprocessor.MyVisitor:visit(node)
	if node == nil then
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ThisDataTypeNode') ~= nil) then
		if self.thiss == nil then
			self.thiss = {}
		end
		do _g.jk.lang.Vector:append(self.thiss, node) end
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ParentDataTypeNode') ~= nil) then
		if self.parents == nil then
			self.parents = {}
		end
		do _g.jk.lang.Vector:append(self.parents, node) end
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PreprocessorIfStatementNode') ~= nil) then
		if self.ifs == nil then
			self.ifs = {}
		end
		do _g.jk.lang.Vector:append(self.ifs, node) end
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PreprocessorValueExpressionNode') ~= nil) then
		if self.values == nil then
			self.values = {}
		end
		do _g.jk.lang.Vector:append(self.values, node) end
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ErrorStatementNode') ~= nil) then
		if self.errors == nil then
			self.errors = {}
		end
		do _g.jk.lang.Vector:append(self.errors, node) end
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ResourceFileNode') ~= nil) then
		if self.resources == nil then
			self.resources = {}
		end
		do _g.jk.lang.Vector:append(self.resources, node) end
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.TemplateStatementNode') ~= nil) then
		if self.templates == nil then
			self.templates = {}
		end
		do _g.jk.lang.Vector:append(self.templates, node) end
		do return true end
	end
	do return true end
end

function sling.compiler.SlingPreprocessor.MyVisitor:getIfs()
	do return self.ifs end
end

function sling.compiler.SlingPreprocessor.MyVisitor:setIfs(v)
	self.ifs = v
	do return self end
end

function sling.compiler.SlingPreprocessor.MyVisitor:getValues()
	do return self.values end
end

function sling.compiler.SlingPreprocessor.MyVisitor:setValues(v)
	self.values = v
	do return self end
end

function sling.compiler.SlingPreprocessor.MyVisitor:getThiss()
	do return self.thiss end
end

function sling.compiler.SlingPreprocessor.MyVisitor:setThiss(v)
	self.thiss = v
	do return self end
end

function sling.compiler.SlingPreprocessor.MyVisitor:getParents()
	do return self.parents end
end

function sling.compiler.SlingPreprocessor.MyVisitor:setParents(v)
	self.parents = v
	do return self end
end

function sling.compiler.SlingPreprocessor.MyVisitor:getErrors()
	do return self.errors end
end

function sling.compiler.SlingPreprocessor.MyVisitor:setErrors(v)
	self.errors = v
	do return self end
end

function sling.compiler.SlingPreprocessor.MyVisitor:getResources()
	do return self.resources end
end

function sling.compiler.SlingPreprocessor.MyVisitor:setResources(v)
	self.resources = v
	do return self end
end

function sling.compiler.SlingPreprocessor.MyVisitor:getTemplates()
	do return self.templates end
end

function sling.compiler.SlingPreprocessor.MyVisitor:setTemplates(v)
	self.templates = v
	do return self end
end

function sling.compiler.SlingPreprocessor:forDefines(defines)
	local v = _g.sling.compiler.SlingPreprocessor._construct0(_g.sling.compiler.SlingPreprocessor._create())
	if defines ~= nil then
		local array = defines:getKeys()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local key = array[n + 1]
					if key ~= nil then
						do v:set(key, defines:getString(key, nil)) end
					end
					do n = n + 1 end
				end
			end
		end
	end
	do return v end
end

function sling.compiler.SlingPreprocessor:set(key, value)
	if not (self.variables ~= nil) then
		self.variables = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	end
	do self.variables:setString(key, value) end
end

function sling.compiler.SlingPreprocessor:evaluate(cond)
	if not (cond ~= nil) then
		do return false end
	end
	if (_vm:to_table_with_key(cond, '_isType.sling.model.LogicalOrExpressionNode') ~= nil) then
		if self:evaluate(cond:getLeft()) then
			do return true end
		end
		if self:evaluate(cond:getRight()) then
			do return true end
		end
		do return false end
	end
	if (_vm:to_table_with_key(cond, '_isType.sling.model.LogicalAndExpressionNode') ~= nil) then
		if not self:evaluate(cond:getLeft()) then
			do return false end
		end
		if not self:evaluate(cond:getRight()) then
			do return false end
		end
		do return true end
	end
	if (_vm:to_table_with_key(cond, '_isType.sling.model.LogicalNotExpressionNode') ~= nil) then
		if self:evaluate(cond:getExpression()) then
			do return false end
		end
		do return true end
	end
	if (_vm:to_table_with_key(cond, '_isType.sling.model.PreprocessorIsDefinedExpressionNode') ~= nil) then
		local v2 = cond:getVariable()
		if _g.jk.lang.String:isNotEmpty(v2) then
			local oo = self:getVariableValue(v2, self.variables, cond)
			if oo ~= nil then
				do return true end
			end
		end
		do return false end
	end
	do _g.sling.common.RefLog:error(self.ctx, "Node not supported in preprocessor context", cond, nil) end
	do return false end
end

function sling.compiler.SlingPreprocessor:getVariableValue(variable, variables, node)
	if not (node ~= nil) then
		do return nil end
	end
	if not (variable ~= nil) then
		do return nil end
	end
	if _g.jk.lang.String:startsWith(variable, "__", 0) and _g.jk.lang.String:endsWith(variable, "__") then
		local token = _vm:to_table_with_key(node:getSource(), '_isType.sling.common.Token')
		if token == nil then
			local nn = node
			while nn ~= nil do
				token = _vm:to_table_with_key(nn:getSource(), '_isType.sling.common.Token')
				if token ~= nil then
					do break end
				end
				nn = nn:getParent()
			end
		end
		if token ~= nil then
			if variable == "__LINE__" then
				do return _g.jk.lang.String:forInteger(token.line + 1) end
			end
			if variable == "__COLUMN__" then
				do return _g.jk.lang.String:forInteger(token.column + 1) end
			end
			if variable == "__FILE__" then
				local src = token.source
				if not (src ~= nil) then
					do return nil end
				end
				do
					local file = src:getFile()
					if not (file ~= nil) then
						do return nil end
					end
					do return file:getBasename() end
				end
			end
		end
		if variable == "__THIS__" or variable == "__THIS_SYMBOL__" then
			local ee = _g.sling.util.FindUtil:findNearestEntity(node)
			if not (ee ~= nil) then
				do return nil end
			end
			do return ee:getNodeName() end
		end
		if variable == "__THISQN__" then
			local ee = _g.sling.util.FindUtil:findNearestEntity(node)
			if not (ee ~= nil) then
				do return nil end
			end
			do return _g.sling.util.NodeUtil:getQualifiedNameString(ee, 46) end
		end
	end
	if not (variables ~= nil) then
		do return nil end
	end
	do return variables:getString(variable, nil) end
end

function sling.compiler.SlingPreprocessor:execute(root)
	if not (root ~= nil) then
		do return end
	end
	do
		local vv = _g.sling.compiler.SlingPreprocessor.MyVisitor._construct0(_g.sling.compiler.SlingPreprocessor.MyVisitor._create())
		if not root:accept(vv) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to execute visitor", root, nil))
		end
		do
			local values = vv:getValues()
			if values ~= nil then
				if values ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(values)
					do
						n = 0
						while n < m do
							local value = _vm:to_table_with_key(values[n + 1], '_isType.sling.model.PreprocessorValueExpressionNode')
							if value ~= nil then
								if value:getParent() == nil then
									goto _continue1
								end
								do
									local variable = value:getVariable()
									if _g.jk.lang.String:isEmpty(variable) then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Empty variable", value, nil))
									end
									do
										local str = self:getVariableValue(variable, self.variables, value)
										if str == nil then
											do _g.sling.common.RefLog:warning(self.ctx, "Variable `" .. _g.jk.lang.String:safeString(variable) .. "' is not defined", value) end
											str = ""
										end
										do
											local ltr = _g.sling.model.StringLiteralExpressionNode:forValue(str)
											do ltr:setSource(value:getSource()) end
											if variable == "__THIS_SYMBOL__" or variable == "__THISQN__" then
												do _g.sling.util.ModifierUtil:addAnnotationModifier(ltr, "symbol") end
											elseif variable == "__LINE__" then
												do _g.sling.util.ModifierUtil:addAnnotationModifier(ltr, "preprocessorLineValue") end
											elseif variable == "__COLUMN__" then
												do _g.sling.util.ModifierUtil:addAnnotationModifier(ltr, "preprocessorColumnValue") end
											elseif variable == "__FILE__" then
												do _g.sling.util.ModifierUtil:addAnnotationModifier(ltr, "preprocessorFileValue") end
											elseif variable == "__THIS__" then
												do _g.sling.util.ModifierUtil:addAnnotationModifier(ltr, "preprocessorThisValue") end
											end
											if not value:replaceWith(ltr, false) then
												_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to replace node", value, nil))
											end
										end
									end
								end
							end
							::_continue1::
							do n = n + 1 end
						end
					end
				end
			end
			do
				local ifs = vv:getIfs()
				if ifs ~= nil then
					local it = _g.jk.lang.Vector:iterateReverse(ifs)
					while it ~= nil do
						local pif = _vm:to_table_with_key(it:next(), '_isType.sling.model.PreprocessorIfStatementNode')
						if pif == nil then
							do break end
						end
						if pif:getParent() == nil then
							do _g.sling.common.RefLog:debug(self.ctx, "Skipping a preprocessor if statement with no parent", pif) end
							goto _continue2
						end
						do
							local cond = pif:getCondition()
							if not (cond ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null condition", pif, nil))
							end
							do
								local cb = nil
								if self:evaluate(cond) then
									cb = pif:getIfBlock()
								else
									cb = pif:getElseBlock()
								end
								if cb ~= nil then
									local cbnodes = cb:getNodes()
									if cbnodes ~= nil and _g.jk.lang.Vector:getSize(cbnodes) == 1 then
										local thenode = _vm:to_table_with_key(_g.jk.lang.Vector:get(cbnodes, 0), '_isType.sling.common.NodeObject')
										do cb:exportNodes() end
										if not pif:replaceWith(thenode, false) then
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to replace node", pif, nil))
										end
										goto _continue2
									end
									do
										local pcont = _vm:to_table_with_key(pif:getParent(), '_isType.sling.common.ContainerNode')
										if not (pcont ~= nil) then
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Parent is not a ContainerNode. Cannot insert block contents.", pif, nil))
										end
										do
											local ip = pcont:getInsertionPointForChild(pif)
											if not (ip ~= nil) then
												_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to get insertion point for this node", pif, nil))
											end
											do
												local nds = cb:exportNodes()
												if nds ~= nil then
													local n2 = 0
													local m2 = _g.jk.lang.Vector:getSize(nds)
													do
														n2 = 0
														while n2 < m2 do
															local node = _vm:to_table_with_key(nds[n2 + 1], '_isType.sling.common.NodeObject')
															if node ~= nil then
																if not ip:insertBefore(node) then
																	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to insert replacement node: `" .. _g.jk.lang.String:safeString(node:getNodeTypeName()) .. "'", pif, nil))
																end
															end
															do n2 = n2 + 1 end
														end
													end
												end
											end
										end
									end
								end
								if not pif:remove() then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to remove node", pif, nil))
								end
							end
						end
						::_continue2::
					end
				end
				do
					local thiss = vv:getThiss()
					if thiss ~= nil then
						if thiss ~= nil then
							local n3 = 0
							local m3 = _g.jk.lang.Vector:getSize(thiss)
							do
								n3 = 0
								while n3 < m3 do
									local ts = _vm:to_table_with_key(thiss[n3 + 1], '_isType.sling.model.ThisDataTypeNode')
									if ts ~= nil then
										if ts:getParent() == nil then
											goto _continue3
										end
										do
											local ee = _g.sling.util.FindUtil:findNearestEntity(ts)
											if not (ee ~= nil) then
												_vm:throw_error(_g.sling.common.ReferenceError:forMessage("`this' encountered without an enclosing entity.", ts, nil))
											end
											do
												local ndt = _g.sling.model.ReferenceDataTypeNode:forNode(ee, nil)
												local gee = _vm:to_table_with_key(ee, '_isType.sling.model.GenericCapableEntityDeclarationNode')
												if gee ~= nil then
													local tps = {}
													local array = gee:getGenericTypes()
													if array ~= nil then
														local n4 = 0
														local m4 = _g.jk.lang.Vector:getSize(array)
														do
															n4 = 0
															while n4 < m4 do
																local temp = _vm:to_table_with_key(array[n4 + 1], '_isType.sling.model.TemplateDeclarationNode')
																if temp ~= nil then
																	do _g.jk.lang.Vector:append(tps, _g.sling.model.ReferenceDataTypeNode:forNode(temp, nil)) end
																end
																do n4 = n4 + 1 end
															end
														end
													end
													do
														local sym = ndt:getSymbol()
														if sym ~= nil then
															do sym:setTypeParameters(tps, false) end
														end
													end
												end
												do _g.sling.util.NodeUtil:replaceNode(ts, ndt) end
											end
										end
									end
									::_continue3::
									do n3 = n3 + 1 end
								end
							end
						end
					end
					do
						local parents = vv:getParents()
						if parents ~= nil then
							if parents ~= nil then
								local n5 = 0
								local m5 = _g.jk.lang.Vector:getSize(parents)
								do
									n5 = 0
									while n5 < m5 do
										local ts = _vm:to_table_with_key(parents[n5 + 1], '_isType.sling.model.ParentDataTypeNode')
										if ts ~= nil then
											if ts:getParent() == nil then
												goto _continue4
											end
											do
												local ee = _g.sling.util.FindUtil:findNearestEntity(ts)
												if not (ee ~= nil) then
													_vm:throw_error(_g.sling.common.ReferenceError:forMessage("`parent' encountered without an enclosing entity.", ts, nil))
												end
												do
													local ee2 = _g.sling.util.FindUtil:findNearestEntity(ee)
													if not (ee2 ~= nil) then
														_vm:throw_error(_g.sling.common.ReferenceError:forMessage("`parent' encountered in a top level entity.", ts, nil))
													end
													do
														local ndt = _g.sling.model.ReferenceDataTypeNode:forNode(ee2, nil)
														local gee = _vm:to_table_with_key(ee2, '_isType.sling.model.GenericCapableEntityDeclarationNode')
														if gee ~= nil then
															local tps = {}
															local array2 = gee:getGenericTypes()
															if array2 ~= nil then
																local n6 = 0
																local m6 = _g.jk.lang.Vector:getSize(array2)
																do
																	n6 = 0
																	while n6 < m6 do
																		local temp = _vm:to_table_with_key(array2[n6 + 1], '_isType.sling.model.TemplateDeclarationNode')
																		if temp ~= nil then
																			do _g.jk.lang.Vector:append(tps, _g.sling.model.ReferenceDataTypeNode:forNode(temp, nil)) end
																		end
																		do n6 = n6 + 1 end
																	end
																end
															end
															do
																local sym = ndt:getSymbol()
																if sym ~= nil then
																	do sym:setTypeParameters(tps, false) end
																end
															end
														end
														do _g.sling.util.NodeUtil:replaceNode(ts, ndt) end
													end
												end
											end
										end
										::_continue4::
										do n5 = n5 + 1 end
									end
								end
							end
						end
						do
							local resources = vv:getResources()
							if resources ~= nil then
								if resources ~= nil then
									local n7 = 0
									local m7 = _g.jk.lang.Vector:getSize(resources)
									do
										n7 = 0
										while n7 < m7 do
											local resource = _vm:to_table_with_key(resources[n7 + 1], '_isType.sling.model.ResourceFileNode')
											if resource ~= nil then
												local condition = resource:getCondition()
												if _g.jk.lang.String:isEmpty(condition) then
													goto _continue5
												end
												do
													local oo = self:getVariableValue(condition, self.variables, resource)
													if oo ~= nil then
														goto _continue5
													end
													if not resource:remove() then
														_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to remove resource node that does not match preprocessor rules", resource, nil))
													end
												end
											end
											::_continue5::
											do n7 = n7 + 1 end
										end
									end
								end
							end
							do
								local templates = vv:getTemplates()
								if templates ~= nil then
									if templates ~= nil then
										local n8 = 0
										local m8 = _g.jk.lang.Vector:getSize(templates)
										do
											n8 = 0
											while n8 < m8 do
												local template = templates[n8 + 1]
												if template ~= nil then
													local pcont = _vm:to_table_with_key(template:getParent(), '_isType.sling.common.ContainerNode')
													if not (pcont ~= nil) then
														_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Parent is not a ContainerNode. Cannot insert block contents.", template, nil))
													end
													do
														local ip = pcont:getInsertionPointForChild(template)
														if not (ip ~= nil) then
															_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to get insertion point for this node", template, nil))
														end
														do
															local name = template:getName()
															if _g.jk.lang.String:isEmpty(name) then
																_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No filename for template", template, nil))
															end
															do
																local relativeTo = template:getRelativeTo()
																if not (relativeTo ~= nil) then
																	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No relative path for template", template, nil))
																end
																do
																	local file = relativeTo:getParent()
																	name = _g.jk.lang.String:replaceCharacter(name, 92, 47)
																	do
																		local array3 = _g.jk.lang.String:split(name, 47, 0)
																		if array3 ~= nil then
																			local n9 = 0
																			local m9 = _g.jk.lang.Vector:getSize(array3)
																			do
																				n9 = 0
																				while n9 < m9 do
																					local comp = array3[n9 + 1]
																					if comp ~= nil then
																						if _g.jk.lang.String:isEmpty(comp) or comp == "." or comp == ".." then
																							goto _continue6
																						end
																						file = file:entry(comp)
																					end
																					::_continue6::
																					do n9 = n9 + 1 end
																				end
																			end
																		end
																		if not self:processTemplateFile(template, file, template:getSymbol(), ip) then
																			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to process template file: `" .. _g.jk.lang.String:safeString(_g.sling.common.MessageFormatter:getFilePath(file)) .. "'", template, nil))
																		end
																		if not template:remove() then
																			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to remove processed template node", template, nil))
																		end
																	end
																end
															end
														end
													end
												end
												do n8 = n8 + 1 end
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

function sling.compiler.SlingPreprocessor:processTemplateFile(node, file, symbol, ip)
	if not (file ~= nil) then
		do return false end
	end
	if not (symbol ~= nil) then
		do return false end
	end
	if not (ip ~= nil) then
		do return false end
	end
	do
		local content = file:getContentsUTF8()
		if not (content ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to read file: `" .. _g.jk.lang.String:safeString(_g.sling.common.MessageFormatter:getFilePath(file)) .. "'", node, nil))
		end
		do
			local it = _g.jk.lang.String:iterate(content)
			if not (it ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to iterate over file contents: `" .. _g.jk.lang.String:safeString(_g.sling.common.MessageFormatter:getFilePath(file)) .. "'", node, nil))
			end
			do
				local code = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				local isCode = false
				local pc = 0
				while true do
					local c = it:getNextChar()
					if isCode and pc == 37 then
						if c == 125 then
							local cs = sb:toString()
							do sb:clear() end
							if _g.jk.lang.String:startsWith(cs, "=", 0) then
								do code:appendString(_g.sling.util.SymbolUtil:getSymbolNamesString(symbol, 46)) end
								do code:appendString(".appendString(") end
								do code:appendString(_g.jk.lang.String:strip(_g.jk.lang.String:getEndOfString(cs, 1))) end
								do code:appendString(")\n") end
							else
								do code:appendString(cs) end
								do code:appendCharacter(10) end
							end
							isCode = false
							pc = 0
							goto _continue7
						end
						do sb:appendCharacter(pc) end
					end
					if isCode == false and pc == 123 then
						if c == 37 then
							local text = sb:toString()
							do sb:clear() end
							do code:appendString(_g.sling.util.SymbolUtil:getSymbolNamesString(symbol, 46)) end
							do code:appendString(".appendString(\"") end
							do code:appendString(_g.sling.common.CodeStringUtil:escapeStringLiteralCStyle(text)) end
							do code:appendString("\")\n") end
							isCode = true
							pc = 0
							goto _continue7
						end
						do sb:appendCharacter(pc) end
					end
					if isCode and c == 37 then
						pc = c
						goto _continue7
					end
					if isCode == false and c == 123 then
						pc = c
						goto _continue7
					end
					if c < 1 then
						do break end
					end
					do sb:appendCharacter(c) end
					pc = c
					::_continue7::
				end
				if isCode then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("File ends with an open code segment: `" .. _g.jk.lang.String:safeString(_g.sling.common.MessageFormatter:getFilePath(file)) .. "'", node, nil))
				end
				do
					local text = sb:toString()
					if _g.jk.lang.String:isEmpty(text) == false then
						do code:appendString(_g.sling.util.SymbolUtil:getSymbolNamesString(symbol, 46)) end
						do code:appendString(".appendString(\"") end
						do code:appendString(_g.sling.common.CodeStringUtil:escapeStringLiteralCStyle(text)) end
						do code:appendString("\")\n") end
					end
					do
						local codestr = code:toString()
						if _g.jk.lang.String:isEmpty(codestr) == false then
							local stmts = _g.sling.parser.SlingParser._construct0(_g.sling.parser.SlingParser._create()):parseStringAsStatements(codestr, "[" .. _g.jk.lang.String:safeString(_g.sling.common.MessageFormatter:getFilePath(file)) .. "]")
							if not (stmts ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to parse embedded code", node, nil))
							end
							do
								local array = stmts:exportNodes()
								if array ~= nil then
									local n = 0
									local m = _g.jk.lang.Vector:getSize(array)
									do
										n = 0
										while n < m do
											local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
											if node ~= nil then
												if not ip:insertBefore(node) then
													_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to insert parsed node", node, nil))
												end
											end
											do n = n + 1 end
										end
									end
								end
								do stmts:destroy() end
							end
						end
						do return true end
					end
				end
			end
		end
	end
end

function sling.compiler.SlingPreprocessor:getVariables()
	do return self.variables end
end

function sling.compiler.SlingPreprocessor:setVariables(v)
	self.variables = v
	do return self end
end

function sling.compiler.SlingPreprocessor:getCtx()
	do return self.ctx end
end

function sling.compiler.SlingPreprocessor:setCtx(v)
	self.ctx = v
	do return self end
end

sling.compiler.JkopOps = {}
sling.compiler.JkopOps.__index = sling.compiler.JkopOps
_vm:set_metatable(sling.compiler.JkopOps, {})

function sling.compiler.JkopOps._create()
	local v = _vm:set_metatable({}, sling.compiler.JkopOps)
	return v
end

function sling.compiler.JkopOps:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.JkopOps'
	self['_isType.sling.compiler.JkopOps'] = true
end

function sling.compiler.JkopOps:_construct0()
	sling.compiler.JkopOps._init(self)
	return self
end

function sling.compiler.JkopOps:expandToJkopSetContains(ctx, node)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.MembershipCheckExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local nn = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.MembershipCheckExpressionNode')
				if nn ~= nil then
					local fc = _g.sling.model.FunctionCallExpressionNode:forNames({
						"Set",
						"contains"
					})
					do fc:setSource(nn:getSource()) end
					do fc:addToParameters(nn:exportRight()) end
					do fc:addToParameters(nn:exportLeft()) end
					do nn:replaceWith(fc, false) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.JkopOps:convertModelsToJkop(ctx, node)
	do _g.sling.compiler.DynamicModelExpander._construct0(_g.sling.compiler.DynamicModelExpander._create()):execute(node) end
	do _g.sling.compiler.ModelExpanderForJkop._construct0(_g.sling.compiler.ModelExpanderForJkop._create()):execute(node) end
end

function sling.compiler.JkopOps:convertWebApiToSympathy(ctx, node)
	local x = _g.sling.compiler.WebApiExpanderForSympathy._construct0(_g.sling.compiler.WebApiExpanderForSympathy._create())
	do x:setCtx(ctx) end
	do x:execute(node) end
end

function sling.compiler.JkopOps:convertWebApi2ToSympathy(ctx, node)
	local x = _g.sling.compiler.WebApi2ExpanderForSympathy._construct0(_g.sling.compiler.WebApi2ExpanderForSympathy._create())
	do x:setCtx(ctx) end
	do x:execute(node) end
end

function sling.compiler.JkopOps:protectStringConcatenationExpression(xpr)
	if not (xpr ~= nil) then
		do return end
	end
	if (_vm:to_table_with_key(xpr, '_isType.sling.model.StringLiteralExpressionNode') ~= nil) or (_vm:to_table_with_key(xpr, '_isType.sling.model.StringConcatenationExpressionNode') ~= nil) then
	else
		local fc = _g.sling.model.FunctionCallExpressionNode:forNames({
			"jk",
			"lang",
			"String",
			"safeString"
		})
		do xpr:replaceWith(fc, true) end
		do fc:addToParameters(xpr) end
	end
end

function sling.compiler.JkopOps:protectStringConcatenationExpressions(ctx, node)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(node, "class:sling.model.EntityDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local decl = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.EntityDeclarationNode')
				if decl ~= nil then
					if _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "nojkop") then
						goto _continue8
					end
					do
						local array2 = _g.sling.util.NodeFinder:findCompatibleNodes(decl, "class:sling.model.StringConcatenationExpressionNode", false, true, false)
						if array2 ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(array2)
							do
								n2 = 0
								while n2 < m2 do
									local xpr = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.StringConcatenationExpressionNode')
									if xpr ~= nil then
										do _g.sling.compiler.JkopOps:protectStringConcatenationExpression(xpr:getLeft()) end
										do _g.sling.compiler.JkopOps:protectStringConcatenationExpression(xpr:getRight()) end
									end
									do n2 = n2 + 1 end
								end
							end
						end
					end
				end
				::_continue8::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.JkopOps:addJkopAutomaticImports(ctx, node)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(node, "class:sling.model.EntityDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local decl = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.EntityDeclarationNode')
				if decl ~= nil then
					if (_vm:to_table_with_key(decl, '_isType.sling.model.ClassDeclarationNode') ~= nil) == false and (_vm:to_table_with_key(decl, '_isType.sling.model.InterfaceDeclarationNode') ~= nil) == false and (_vm:to_table_with_key(decl, '_isType.sling.model.ModelDeclarationNode') ~= nil) == false then
						goto _continue9
					end
					if _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "nojkop") then
						goto _continue9
					end
					if (_vm:to_table_with_key(decl:getParent(), '_isType.sling.model.EntityDeclarationNode') ~= nil) then
						goto _continue9
					end
					do
						local nspace = _g.sling.util.FindUtil:findNearestNamespace(decl)
						if nspace ~= nil and _g.jk.lang.String:equals(_g.sling.util.NodeUtil:getQualifiedNameString(nspace, 46), "jk.lang") then
							goto _continue9
						end
						do decl:addToImportNamespaces(_g.sling.model.SymbolNode:forArrayOfNames({
							"jk",
							"lang"
						})) end
					end
				end
				::_continue9::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.JkopOps:forceJkopVectorOperations(ctx, node)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(node, "class:sling.model.EntityDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local decl = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.EntityDeclarationNode')
				if decl ~= nil then
					if _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "nojkop") then
						goto _continue10
					end
					do
						local types = {
							"class:sling.model.GetSizeExpressionNode",
							"class:sling.model.AppendToVectorExpressionNode"
						}
						local nodes = _g.sling.util.FindUtil:findNodesOfTypes(decl, types, false, true, false)
						if nodes ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(nodes)
							do
								n2 = 0
								while n2 < m2 do
									local node = nodes[n2 + 1]
									if node ~= nil then
										if (_vm:to_table_with_key(node, '_isType.sling.model.GetSizeExpressionNode') ~= nil) then
											local xpr = node:getExpression()
											local xprdt = _g.sling.util.ExpressionUtil:getExpressionDataType(xpr, nil)
											if xprdt ~= nil and (_vm:to_table_with_key(xprdt, '_isType.sling.model.VectorDataTypeNode') ~= nil) then
												local fc = _g.sling.model.FunctionCallExpressionNode:forNames({
													"Vector",
													"getSize"
												})
												do fc:addToParameters(node:exportExpression()) end
												do node:replaceWith(fc, false) end
											end
										elseif (_vm:to_table_with_key(node, '_isType.sling.model.AppendToVectorExpressionNode') ~= nil) then
											local left = node:exportLeft()
											local right = node:exportRight()
											local fc = _g.sling.model.FunctionCallExpressionNode:forNames({
												"Vector",
												"append"
											})
											do fc:addToParameters(left) end
											do fc:addToParameters(right) end
											do node:replaceWith(fc, false) end
										else
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Incorrect node type", node, nil))
										end
									end
									do n2 = n2 + 1 end
								end
							end
						end
					end
				end
				::_continue10::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.JkopOps:processCriticalSections(ctx, node)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(node, "class:sling.model.EntityDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local decl = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.EntityDeclarationNode')
				if decl ~= nil then
					if _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "nojkop") then
						goto _continue11
					end
					do
						local importProcessed = false
						local array2 = _g.sling.util.NodeFinder:findCompatibleNodes(decl, "class:sling.model.CriticalSectionBlockNode", false, true, false)
						if array2 ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(array2)
							do
								n2 = 0
								while n2 < m2 do
									local csb = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.CriticalSectionBlockNode')
									if csb ~= nil then
										if not importProcessed then
											do decl:addToImportNamespaces(_g.sling.model.SymbolNode:forArrayOfNames({
												"jk",
												"thread"
											})) end
											importProcessed = true
										end
										do
											local object = csb:exportObject()
											if not (object ~= nil) then
												object = _g.sling.model.CurrentObjectExpressionNode._construct0(_g.sling.model.CurrentObjectExpressionNode._create())
											end
											do
												local block = csb:exportBlock()
												local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("CriticalSection"), "execute", true)
												do fc:setSource(csb:getSource()) end
												do fc:addToParameters(object) end
												do
													local fd = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
													do fd:setBody(block, false) end
													do fd:setReturnType(_g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()), false) end
													do fc:addToParameters(_g.sling.model.FunctionDeclarationExpressionNode:forDeclaration(fd)) end
													do _g.sling.util.NodeUtil:replaceNode(csb, fc) end
												end
											end
										end
									end
									do n2 = n2 + 1 end
								end
							end
						end
					end
				end
				::_continue11::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.JkopOps:createDynamicConverterExpression(xpr, type, resolver)
	if not (type ~= nil) then
		do return xpr end
	end
	do
		local names = {}
		if (_vm:to_table_with_key(type, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
			local bound = resolver:getBoundNode(type)
			local array = _g.sling.util.NodeUtil:getQualifiedNameComponents(bound, true)
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local comp = (function(o)
							if (_vm:get_variable_type(o) == 'string') then
								do return o end
							end
							do return nil end
						end)(array[n + 1])
						if comp ~= nil then
							do _g.jk.lang.Vector:append(names, comp) end
						end
						do n = n + 1 end
					end
				end
			end
			do _g.jk.lang.Vector:append(names, "asThis") end
		elseif (_vm:to_table_with_key(type, '_isType.sling.model.StringDataTypeNode') ~= nil) then
			do _g.jk.lang.Vector:append(names, "jk") end
			do _g.jk.lang.Vector:append(names, "lang") end
			do _g.jk.lang.Vector:append(names, "String") end
			do _g.jk.lang.Vector:append(names, "asString") end
		elseif (_vm:to_table_with_key(type, '_isType.sling.model.BooleanDataTypeNode') ~= nil) then
			do _g.jk.lang.Vector:append(names, "jk") end
			do _g.jk.lang.Vector:append(names, "lang") end
			do _g.jk.lang.Vector:append(names, "Boolean") end
			do _g.jk.lang.Vector:append(names, "asBoolean") end
		elseif (_vm:to_table_with_key(type, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
			do _g.jk.lang.Vector:append(names, "jk") end
			do _g.jk.lang.Vector:append(names, "lang") end
			do _g.jk.lang.Vector:append(names, "Double") end
			do _g.jk.lang.Vector:append(names, "asDouble") end
		elseif (_vm:to_table_with_key(type, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
			if type:getType() == _g.sling.model.IntegerDataTypeNode.TYPE_INT64 then
				do _g.jk.lang.Vector:append(names, "jk") end
				do _g.jk.lang.Vector:append(names, "lang") end
				do _g.jk.lang.Vector:append(names, "LongInteger") end
				do _g.jk.lang.Vector:append(names, "asLong") end
			else
				do _g.jk.lang.Vector:append(names, "jk") end
				do _g.jk.lang.Vector:append(names, "lang") end
				do _g.jk.lang.Vector:append(names, "Integer") end
				do _g.jk.lang.Vector:append(names, "asInteger") end
			end
		else
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Dynamic conversion not supported for data tyoe: `" .. _g.jk.lang.String:safeString(_g.sling.generator.SlingGeneratorUtil:describeDataType(type)) .. "'", type, nil))
		end
		do
			local sex = nil
			if names ~= nil then
				local n2 = 0
				local m2 = _g.jk.lang.Vector:getSize(names)
				do
					n2 = 0
					while n2 < m2 do
						local name = names[n2 + 1]
						if name ~= nil then
							sex = _g.sling.model.MemberAccessExpressionNode:append(_g.sling.model.SymbolExpressionNode:forName(name), sex)
						end
						do n2 = n2 + 1 end
					end
				end
			end
			do
				local fc = _g.sling.model.FunctionCallExpressionNode:forExpression(sex)
				do fc:addToParameters(xpr) end
				do return fc end
			end
		end
	end
end

sling.compiler.SlingOps = {}
sling.compiler.SlingOps.__index = sling.compiler.SlingOps
_vm:set_metatable(sling.compiler.SlingOps, {})

function sling.compiler.SlingOps._create()
	local v = _vm:set_metatable({}, sling.compiler.SlingOps)
	return v
end

function sling.compiler.SlingOps:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.SlingOps'
	self['_isType.sling.compiler.SlingOps'] = true
end

function sling.compiler.SlingOps:_construct0()
	sling.compiler.SlingOps._init(self)
	return self
end

function sling.compiler.SlingOps:performCommonAdjustments(ctx, node)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.TryCatchStatementNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local tcs = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.TryCatchStatementNode')
				if tcs ~= nil then
					if _g.jk.lang.Vector:getSize(tcs:getCatchBlocks()) < 1 then
						local evar = _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.ExceptionDataTypeNode._construct0(_g.sling.model.ExceptionDataTypeNode._create()), "e", nil)
						do tcs:addToCatchBlocks(_g.sling.model.CatchBlockNode:instance(evar, _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create()))) end
					end
					do
						local array2 = tcs:getCatchBlocks()
						if array2 ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(array2)
							do
								n2 = 0
								while n2 < m2 do
									local cb = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.CatchBlockNode')
									if cb ~= nil then
										local array3 = cb:getExceptions()
										if array3 ~= nil then
											local n3 = 0
											local m3 = _g.jk.lang.Vector:getSize(array3)
											do
												n3 = 0
												while n3 < m3 do
													local x = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.model.VariableDeclarationNode')
													if x ~= nil then
														if not (x:getType() ~= nil) then
															do x:setType(_g.sling.model.ExceptionDataTypeNode._construct0(_g.sling.model.ExceptionDataTypeNode._create()), false) end
														end
													end
													do n3 = n3 + 1 end
												end
											end
										end
									end
									do n2 = n2 + 1 end
								end
							end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:preprocess(ctx, node, defines)
	local pp = _g.sling.compiler.SlingPreprocessor:forDefines(defines)
	do pp:setCtx(ctx) end
	do pp:execute(node) end
end

function sling.compiler.SlingOps:processDefaultDataTypeValues(ctx, node, processTemplates, resolver)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.DataTypeDefaultValueExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local nn = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.DataTypeDefaultValueExpressionNode')
				if nn ~= nil then
					local type = nn:getType()
					if processTemplates == false and (_vm:to_table_with_key(type, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
						if resolver ~= nil then
							do resolver:resolveDataType(type) end
						end
						do
							local binding = _g.sling.util.SymbolUtil:tryGetSymbolBinding(type:getSymbol())
							if not (binding ~= nil) then
								goto _continue12
							end
							if (_vm:to_table_with_key(binding, '_isType.sling.model.TemplateDeclarationNode') ~= nil) then
								goto _continue12
							end
						end
					end
					do
						local v = _g.sling.compiler.SlingOps:createDataTypeDefaultValue(type)
						if not (v ~= nil) then
							v = _g.sling.model.EmptyExpressionNode._construct0(_g.sling.model.EmptyExpressionNode._create())
						end
						do v:setSource(nn:getSource()) end
						do _g.sling.util.NodeUtil:replaceNode(nn, v) end
					end
				end
				::_continue12::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:expandElseBlocksInLoopDeclarations(ctx, root)
	local array = _g.sling.util.NodeFinder:findNodesOfTypes(root, {
		"class:sling.model.WhileStatementNode",
		"class:sling.model.ForEachStatementNode"
	}, false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local node = array[n + 1]
				if node ~= nil then
					local prnt = _vm:to_table_with_key(node:getParent(), '_isType.sling.common.ContainerNode')
					if not (prnt ~= nil) then
						goto _continue13
					end
					do
						local elseBlock = nil
						if (_vm:to_table_with_key(node, '_isType.sling.model.ForEachStatementNode') ~= nil) then
							elseBlock = _vm:to_table_with_key(node, '_isType.sling.model.ForEachStatementNode'):exportElseBlock()
						end
						if (_vm:to_table_with_key(node, '_isType.sling.model.WhileStatementNode') ~= nil) then
							elseBlock = _vm:to_table_with_key(node, '_isType.sling.model.WhileStatementNode'):exportElseBlock()
						end
						if not (elseBlock ~= nil) then
							goto _continue13
						end
						do
							local brName = _g.sling.util.FunctionUtil:findUniqueVariableNameForNode(node, "islb")
							local brk = _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.BooleanDataTypeNode._construct0(_g.sling.model.BooleanDataTypeNode._create()), brName, nil)
							do prnt:insertAboveNode(brk, node) end
							do
								local array2 = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.BreakStatementNode", false, true, false)
								if array2 ~= nil then
									local n2 = 0
									local m2 = _g.jk.lang.Vector:getSize(array2)
									do
										n2 = 0
										while n2 < m2 do
											local brn = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.BreakStatementNode')
											if brn ~= nil then
												local brkIsTrue = _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forName(brName), _g.sling.model.BooleanLiteralExpressionNode:forValue(true))
												local brkParent = _vm:to_table_with_key(brn:getParent(), '_isType.sling.common.ContainerNode')
												if not (brkParent ~= nil) then
													goto _continue14
												end
												do brkParent:insertAboveNode(brkIsTrue, brn) end
											end
											::_continue14::
											do n2 = n2 + 1 end
										end
									end
								end
								do
									local exp = _g.sling.model.EqualsExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(brName), _g.sling.model.BooleanLiteralExpressionNode:forValue(false))
									local isn = _g.sling.model.IfStatementNode:instance(exp, elseBlock, nil)
									do prnt:insertBelowNode(isn, node) end
								end
							end
						end
					end
				end
				::_continue13::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:expandVariableDeclarationExpressionsInIfStatements(ctx, root)
	local array = _g.sling.util.NodeFinder:findNodesOfType(root, "class:sling.model.IfStatementNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local ifst = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.IfStatementNode')
				if ifst ~= nil then
					local vxps = _g.sling.util.NodeFinder:findNodesOfType(ifst:getCondition(), "class:sling.model.VariableDeclarationExpressionNode", false, true, false)
					if _g.jk.lang.Vector:isEmpty(vxps) then
						goto _continue15
					end
					do
						local blck = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
						do _g.sling.util.NodeUtil:replaceAndExport(ifst, blck) end
						do
							local stms = {}
							if vxps ~= nil then
								local n2 = 0
								local m2 = _g.jk.lang.Vector:getSize(vxps)
								do
									n2 = 0
									while n2 < m2 do
										local vdex = _vm:to_table_with_key(vxps[n2 + 1], '_isType.sling.model.VariableDeclarationExpressionNode')
										if vdex ~= nil then
											local vdec = vdex:exportDeclaration()
											local symf = _g.sling.model.SymbolExpressionNode:forName(vdec:getName())
											do _g.sling.util.NodeUtil:replaceNode(vdex, symf) end
											do _g.jk.lang.Vector:append(stms, vdec) end
										end
										do n2 = n2 + 1 end
									end
								end
							end
							do _g.jk.lang.Vector:append(stms, ifst) end
							do blck:setNodes(stms) end
						end
					end
				end
				::_continue15::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:expandPropertyDeclarationsToMethods(ctx, node, resolver)
	do _g.sling.compiler.PropertyDeclarationExpander._construct0(_g.sling.compiler.PropertyDeclarationExpander._create()):execute(ctx, node, resolver) end
end

function sling.compiler.SlingOps:expandVariablesWithPropertyModifier(ctx, resolver, node)
	do _g.sling.compiler.PropertyVariableExpander._construct0(_g.sling.compiler.PropertyVariableExpander._create()):execute(node, resolver) end
end

function sling.compiler.SlingOps:consolidateEntities(ctx, node)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(node, "class:sling.model.EntityDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local entity = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.EntityDeclarationNode')
				if entity ~= nil then
					local deps = {}
					local pimps = {}
					local eimps = {}
					local simps = {}
					local bts = {}
					local mods = {}
					local cmods = {}
					local array2 = entity:getNodes()
					if array2 ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(array2)
						do
							n2 = 0
							while n2 < m2 do
								local childNode = array2[n2 + 1]
								if childNode ~= nil then
									if (_vm:to_table_with_key(childNode, '_isType.sling.model.DependencyDeclarationNode') ~= nil) then
										do _g.jk.lang.Vector:append(deps, childNode) end
									elseif (_vm:to_table_with_key(childNode, '_isType.sling.model.ImportPackageStatementNode') ~= nil) then
										do _g.jk.lang.Vector:append(pimps, childNode) end
									elseif (_vm:to_table_with_key(childNode, '_isType.sling.model.ImportEntityStatementNode') ~= nil) then
										do _g.jk.lang.Vector:append(eimps, childNode) end
									elseif (_vm:to_table_with_key(childNode, '_isType.sling.model.ImportStaticMemberStatementNode') ~= nil) then
										do _g.jk.lang.Vector:append(simps, childNode) end
									elseif (_vm:to_table_with_key(childNode, '_isType.sling.model.BaseTypeNode') ~= nil) then
										do _g.jk.lang.Vector:append(bts, childNode) end
									elseif (_vm:to_table_with_key(childNode, '_isType.sling.model.CommonModifierNode') ~= nil) then
										do _g.jk.lang.Vector:append(mods, childNode) end
									elseif (_vm:to_table_with_key(childNode, '_isType.sling.model.AnnotationModifierNode') ~= nil) then
										do _g.jk.lang.Vector:append(cmods, childNode) end
									end
								end
								do n2 = n2 + 1 end
							end
						end
					end
					if deps ~= nil then
						local n3 = 0
						local m3 = _g.jk.lang.Vector:getSize(deps)
						do
							n3 = 0
							while n3 < m3 do
								local dep = deps[n3 + 1]
								if dep ~= nil then
									do entity:addToDependencies(dep:getValue()) end
									do _g.sling.util.NodeUtil:removeNode(dep) end
								end
								do n3 = n3 + 1 end
							end
						end
					end
					if pimps ~= nil then
						local n4 = 0
						local m4 = _g.jk.lang.Vector:getSize(pimps)
						do
							n4 = 0
							while n4 < m4 do
								local imp = pimps[n4 + 1]
								if imp ~= nil then
									local ns = imp:exportPackage()
									if ns ~= nil then
										do entity:addToImportNamespaces(ns) end
									end
									do _g.sling.util.NodeUtil:removeNode(imp) end
								end
								do n4 = n4 + 1 end
							end
						end
					end
					if simps ~= nil then
						local n5 = 0
						local m5 = _g.jk.lang.Vector:getSize(simps)
						do
							n5 = 0
							while n5 < m5 do
								local simp = simps[n5 + 1]
								if simp ~= nil then
									do _g.sling.util.NodeUtil:exportNode(simp) end
									do entity:addToImportStaticNamespaces(simp) end
								end
								do n5 = n5 + 1 end
							end
						end
					end
					if eimps ~= nil then
						local n6 = 0
						local m6 = _g.jk.lang.Vector:getSize(eimps)
						do
							n6 = 0
							while n6 < m6 do
								local imp = eimps[n6 + 1]
								if imp ~= nil then
									do _g.sling.util.NodeUtil:exportNode(imp) end
									do entity:addToImportEntities(imp) end
								end
								do n6 = n6 + 1 end
							end
						end
					end
					if bts ~= nil then
						local n7 = 0
						local m7 = _g.jk.lang.Vector:getSize(bts)
						do
							n7 = 0
							while n7 < m7 do
								local bt = bts[n7 + 1]
								if bt ~= nil then
									do _g.sling.util.NodeUtil:exportNode(bt) end
									do entity:addToBaseTypes(bt) end
								end
								do n7 = n7 + 1 end
							end
						end
					end
					if mods ~= nil then
						local n8 = 0
						local m8 = _g.jk.lang.Vector:getSize(mods)
						do
							n8 = 0
							while n8 < m8 do
								local mod = mods[n8 + 1]
								if mod ~= nil then
									do _g.sling.util.NodeUtil:exportNode(mod) end
									do entity:addToModifiers(mod) end
								end
								do n8 = n8 + 1 end
							end
						end
					end
					if cmods ~= nil then
						local n9 = 0
						local m9 = _g.jk.lang.Vector:getSize(cmods)
						do
							n9 = 0
							while n9 < m9 do
								local cmod = cmods[n9 + 1]
								if cmod ~= nil then
									do _g.sling.util.NodeUtil:exportNode(cmod) end
									do entity:addToModifiers(cmod) end
								end
								do n9 = n9 + 1 end
							end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:preprocessProperties(ctx, node)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(node, "class:sling.model.PropertyDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local propdec = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.PropertyDeclarationNode')
				if propdec ~= nil then
					local generateVariable = false
					local bvn = propdec:getBackingVariableName()
					if _g.jk.lang.String:isEmpty(bvn) then
						bvn = "_" .. _g.jk.lang.String:safeString(propdec:getName())
					else
						generateVariable = true
					end
					if not _g.sling.util.NodeUtil:hasVisibilityModifier(propdec) then
						do _g.sling.util.ModifierUtil:addCommonModifier(propdec, _g.sling.model.Modifier.PUBLIC) end
					end
					do
						local getter = _g.sling.util.PropertyUtil:getGetFunction(propdec)
						if getter == nil and _g.sling.util.ModifierUtil:hasAnnotationModifier(propdec, "setonly") == false then
							local fd = _g.sling.model.PropertyGetFunctionDeclarationNode._construct0(_g.sling.model.PropertyGetFunctionDeclarationNode._create())
							do fd:setSource(propdec:getSource()) end
							do fd:setReturnType(_g.sling.util.DataTypeUtil:dupAsDataType(propdec:getType()), false) end
							do fd:getCreateBody():addNode(_g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.SymbolExpressionNode:forName(bvn))) end
							do propdec:addToBody(fd) end
							generateVariable = true
							getter = fd
						end
						do
							local setter = _g.sling.util.PropertyUtil:getSetFunction(propdec)
							if setter == nil and _g.sling.util.ModifierUtil:hasAnnotationModifier(propdec, "getonly") == false then
								local fd = _g.sling.model.PropertySetFunctionDeclarationNode._construct0(_g.sling.model.PropertySetFunctionDeclarationNode._create())
								do fd:setSource(propdec:getSource()) end
								do fd:setParameter(_g.sling.util.DataTypeUtil:dupAsDataType(propdec:getType()), "value") end
								do
									local assx = _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forName(bvn), _g.sling.model.SymbolExpressionNode:forName("value"))
									do fd:getCreateBody():addNode(assx) end
									do propdec:addToBody(fd) end
									generateVariable = true
									setter = fd
								end
							end
							do
								local willset = _g.sling.util.PropertyUtil:getWillSetFunction(propdec)
								if willset ~= nil then
									do _g.sling.util.ModifierUtil:addCommonModifier(willset, _g.sling.model.Modifier.PRIVATE) end
								end
								do
									local didset = _g.sling.util.PropertyUtil:getDidSetFunction(propdec)
									if didset ~= nil then
										do _g.sling.util.ModifierUtil:addCommonModifier(didset, _g.sling.model.Modifier.PRIVATE) end
									end
									if getter ~= nil then
										do _g.sling.util.ModifierUtil:copyModifiers(propdec, getter) end
										do _g.sling.util.ModifierUtil:addAnnotationModifier(getter, "getterMethod") end
										if _g.sling.util.ModifierUtil:hasAnnotationModifier(propdec, "getOverride") then
											do _g.sling.util.ModifierUtil:addCommonModifier(getter, _g.sling.model.Modifier.OVERRIDE) end
										end
									end
									if setter ~= nil then
										do _g.sling.util.ModifierUtil:copyModifiers(propdec, setter) end
										do _g.sling.util.ModifierUtil:addAnnotationModifier(setter, "setterMethod") end
										if _g.sling.util.ModifierUtil:hasAnnotationModifier(propdec, "setOverride") then
											do _g.sling.util.ModifierUtil:addCommonModifier(setter, _g.sling.model.Modifier.OVERRIDE) end
										end
										if _g.sling.util.ModifierUtil:hasAnnotationModifier(propdec, "notLiteral") then
											local parms = setter:getParameters()
											if parms ~= nil then
												local parm = _vm:to_table_with_key(_g.jk.lang.Vector:get(parms, 0), '_isType.sling.model.VariableDeclarationNode')
												if parm ~= nil then
													do _g.sling.util.ModifierUtil:addAnnotationModifier(parm, "notLiteral") end
												end
											end
										end
									end
									if generateVariable then
										local vd = _g.sling.model.VariableDeclarationNode:instance(_g.sling.util.DataTypeUtil:dupAsDataType(propdec:getType()), bvn, propdec:exportInitializer())
										do _g.sling.util.ModifierUtil:addCommonModifier(vd, _g.sling.model.Modifier.PRIVATE) end
										do _g.sling.util.NodeUtil:insertAboveNode(propdec, vd) end
									else
										local init = propdec:getInitializer()
										if init ~= nil then
											do _g.sling.common.RefLog:warning(ctx, "Initializer defined but not used.", init) end
										end
									end
								end
							end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:expandFileSystemReferenceExpressions(ctx, node)
	local types = {
		"class:sling.model.FileSystemDirectoryReferenceExpressionNode",
		"class:sling.model.FileSystemBinaryFileReferenceExpressionNode",
		"class:sling.model.FileSystemTextFileReferenceExpressionNode"
	}
	local array = _g.sling.util.NodeFinder:findNodesOfTypes(node, types, false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local fref = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FileSystemReferenceExpressionNode')
				if fref ~= nil then
					local curr = fref:getRelativeTo()
					local name = fref:getName()
					if curr == nil then
						goto _continue16
					end
					if _g.jk.lang.String:isEmpty(name) then
						goto _continue16
					end
					do
						local ff = curr:getParent()
						name = _g.jk.lang.String:replaceCharacter(name, 92, 47)
						do
							local array2 = _g.jk.lang.String:split(name, 47, 0)
							if array2 ~= nil then
								local n2 = 0
								local m2 = _g.jk.lang.Vector:getSize(array2)
								do
									n2 = 0
									while n2 < m2 do
										local comp = array2[n2 + 1]
										if comp ~= nil then
											if _g.jk.lang.String:isEmpty(comp) or comp == "." or comp == ".." then
												goto _continue17
											end
											ff = ff:entry(comp)
										end
										::_continue17::
										do n2 = n2 + 1 end
									end
								end
							end
							do
								local expr = nil
								if (_vm:to_table_with_key(fref, '_isType.sling.model.FileSystemDirectoryReferenceExpressionNode') ~= nil) then
									if not ff:isDirectory() then
										goto _continue16
									end
									expr = _g.sling.compiler.SlingOps:readDirectoryAsMapLiteral(ff)
								elseif (_vm:to_table_with_key(fref, '_isType.sling.model.FileSystemTextFileReferenceExpressionNode') ~= nil) then
									if not ff:isFile() then
										goto _continue16
									end
									expr = _g.sling.model.StringLiteralExpressionNode:forValue(ff:getContentsUTF8())
								elseif (_vm:to_table_with_key(fref, '_isType.sling.model.FileSystemBinaryFileReferenceExpressionNode') ~= nil) then
									if not ff:isFile() then
										goto _continue16
									end
									do
										local buff = ff:getContentsBuffer()
										if buff == nil then
											goto _continue16
										end
										expr = _g.sling.model.BufferLiteralExpressionNode:forValue(buff)
									end
								end
								if expr == nil then
									goto _continue16
								end
								do _g.sling.util.NodeUtil:replaceAndExport(fref, expr) end
							end
						end
					end
				end
				::_continue16::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:readDirectoryAsMapLiteral(dir)
	local it = dir:entries()
	if not (it ~= nil) then
		do return nil end
	end
	do
		local v = _g.sling.model.MapLiteralExpressionNode._construct0(_g.sling.model.MapLiteralExpressionNode._create())
		do v:setDefaultDataType(_g.sling.model.MapDataTypeNode:forTypes(_g.sling.model.StringDataTypeNode._construct0(_g.sling.model.StringDataTypeNode._create()), _g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create())), false) end
		while true do
			local f = it:next()
			if not (f ~= nil) then
				do break end
			end
			if f:isFile() then
				local buf = f:getContentsBuffer()
				if not (buf ~= nil) then
					v = nil
					do break end
				end
				do
					local buflit = _g.sling.model.BufferLiteralExpressionNode:forValue(buf)
					do buflit:setType(_g.sling.model.BufferDataTypeNode._construct0(_g.sling.model.BufferDataTypeNode._create()), false) end
					do v:addToValues(_g.sling.model.KeyValueNode:forValues(_g.sling.model.StringLiteralExpressionNode:forValue(f:baseName()), buflit)) end
				end
			elseif f:isDirectory() then
				local dd = _g.sling.compiler.SlingOps:readDirectoryAsMapLiteral(f)
				if not (dd ~= nil) then
					v = nil
					do break end
				end
				do v:addToValues(_g.sling.model.KeyValueNode:forValues(_g.sling.model.StringLiteralExpressionNode:forValue(f:baseName()), dd)) end
			else
				goto _continue18
			end
			::_continue18::
		end
		if it ~= nil and (_vm:to_table_with_key(it, '_isType.jk.lang.Closable') ~= nil) then
			do it:close() end
		end
		do return v end
	end
end

function sling.compiler.SlingOps:expandMacros(ctx, node, resolver, removeDeclarations)
	do _g.sling.compiler.MacroHandler._construct0(_g.sling.compiler.MacroHandler._create()):execute(ctx, node, resolver, removeDeclarations) end
end

function sling.compiler.SlingOps:removeMacroDeclarations(ctx, node)
	local decls = {}
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(node, "class:sling.model.FunctionDeclarationNode", false, false, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local decl = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FunctionDeclarationNode')
				if decl ~= nil then
					if _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "macro") then
						do _g.jk.lang.Vector:append(decls, decl) end
					end
				end
				do n = n + 1 end
			end
		end
	end
	if decls ~= nil then
		local n2 = 0
		local m2 = _g.jk.lang.Vector:getSize(decls)
		do
			n2 = 0
			while n2 < m2 do
				local decl = decls[n2 + 1]
				if decl ~= nil then
					do _g.sling.util.NodeUtil:removeNode(decl) end
				end
				do n2 = n2 + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:createSlingConstructorsForClass(ctx, tr, cl)
	if (_vm:to_table_with_key(cl, '_isType.sling.model.TemplateDeclarationNode') ~= nil) or (_vm:to_table_with_key(cl, '_isType.sling.model.MagicalClassDeclarationNode') ~= nil) then
		do return end
	end
	if _g.sling.util.ModifierUtil:hasAnnotationModifier(cl, "typedef") then
		do return end
	end
	do
		local found = false
		local array = cl:getNodes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local nd = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ConstructorDeclarationNode')
					if nd ~= nil then
						found = true
						do break end
					end
					do n = n + 1 end
				end
			end
		end
		if found then
			do return end
		end
		do _g.sling.op.CommonOps:fixInheritanceTypes(ctx, tr, cl) end
		do
			local created = false
			local bc = tr:getBaseClass(cl)
			if bc ~= nil then
				local type = tr:getBaseClassType(cl)
				if type ~= nil and type:getMagical() then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No constructor found for class", cl, nil))
				end
				do _g.sling.compiler.SlingOps:createSlingConstructorsForClass(ctx, tr, bc) end
				do
					local array2 = bc:getNodes()
					if array2 ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(array2)
						do
							n2 = 0
							while n2 < m2 do
								local octor = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.ConstructorDeclarationNode')
								if octor ~= nil then
									do tr:resolveFunctionSignature(octor, tr) end
									do
										local nctor = _g.sling.model.ConstructorDeclarationNode._construct0(_g.sling.model.ConstructorDeclarationNode._create())
										do _g.sling.util.ModifierUtil:addCommonModifier(nctor, _g.sling.model.Modifier.PUBLIC) end
										do _g.sling.util.FunctionUtil:copySignatureTo(octor, nctor) end
										do _g.sling.util.FunctionUtil:addBaseCall(nctor, false) end
										do cl:prependNode(nctor) end
										created = true
									end
								end
								do n2 = n2 + 1 end
							end
						end
					end
				end
			end
			if not created then
				local nc = _g.sling.model.ConstructorDeclarationNode._construct0(_g.sling.model.ConstructorDeclarationNode._create())
				do _g.sling.util.ModifierUtil:addCommonModifier(nc, _g.sling.model.Modifier.PUBLIC) end
				do nc:setBody(_g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create()), false) end
				do cl:prependNode(nc) end
			end
		end
	end
end

function sling.compiler.SlingOps:createSlingConstructors(ctx, tr, node)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(node, "class:sling.model.ClassDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local cl = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ClassDeclarationNode')
				if cl ~= nil then
					do _g.sling.compiler.SlingOps:createSlingConstructorsForClass(ctx, tr, cl) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:processTypedefEntities(ctx, root, resolver)
	local array = _g.sling.util.NodeFinder:findNodesOfType(root, "class:sling.model.ReferenceDataTypeNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ReferenceDataTypeNode')
				if node ~= nil then
					if node:getSymbol() == nil then
						goto _continue19
					end
					do
						local ee = resolver:getBoundEntity(node)
						if not (ee ~= nil) then
							goto _continue19
						end
						if not _g.sling.util.ModifierUtil:hasAnnotationModifier(ee, "typedef") and (_vm:to_table_with_key(ee, '_isType.sling.model.TypeAliasDeclarationNode') ~= nil) == false then
							goto _continue19
						end
						do
							local bb = nil
							if (_vm:to_table_with_key(ee, '_isType.sling.model.TypeAliasDeclarationNode') ~= nil) then
								local bt = ee:getType()
								if not (bt ~= nil) then
									goto _continue19
								end
								bb = _g.sling.util.DataTypeUtil:dupAsDataType(bt)
							else
								local bt = resolver:getBaseClassType(ee)
								if not (bt ~= nil) then
									goto _continue19
								end
								bb = _g.sling.util.DataTypeUtil:dupAsReferenceDataType(bt)
							end
							do _g.sling.util.NodeUtil:replaceNode(node, bb) end
							do
								local ne = _g.sling.util.FindUtil:findTopmostEntity(bb)
								if ne ~= nil then
									local array2 = ee:getDependencies()
									if array2 ~= nil then
										local n2 = 0
										local m2 = _g.jk.lang.Vector:getSize(array2)
										do
											n2 = 0
											while n2 < m2 do
												local dstr = (function(o)
													if (_vm:get_variable_type(o) == 'string') then
														do return o end
													end
													do return nil end
												end)(array2[n2 + 1])
												if dstr ~= nil then
													if not _g.jk.lang.String:startsWith(dstr, "typedef:", 0) then
														goto _continue20
													end
													do
														local sstr = _g.jk.lang.String:split(dstr, 58, 2)
														do ne:addToDependencies(_g.jk.lang.Vector:get(sstr, 1)) end
													end
												end
												::_continue20::
												do n2 = n2 + 1 end
											end
										end
									end
								end
							end
						end
					end
				end
				::_continue19::
				do n = n + 1 end
			end
		end
	end
	do
		local array3 = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.EntityDeclarationNode", false, true, false)
		if array3 ~= nil then
			local n3 = 0
			local m3 = _g.jk.lang.Vector:getSize(array3)
			do
				n3 = 0
				while n3 < m3 do
					local node = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.model.EntityDeclarationNode')
					if node ~= nil then
						if not _g.sling.util.ModifierUtil:hasAnnotationModifier(node, "typedef") and (_vm:to_table_with_key(node, '_isType.sling.model.TypeAliasDeclarationNode') ~= nil) == false then
							goto _continue21
						end
						do
							local okToDelete = true
							local array4 = node:getNodes()
							if array4 ~= nil then
								local n4 = 0
								local m4 = _g.jk.lang.Vector:getSize(array4)
								do
									n4 = 0
									while n4 < m4 do
										local childNode = _vm:to_table_with_key(array4[n4 + 1], '_isType.sling.common.NodeObject')
										if childNode ~= nil then
											if (_vm:to_table_with_key(childNode, '_isType.sling.model.CommentNode') ~= nil) or (_vm:to_table_with_key(childNode, '_isType.sling.model.EmbedBlockNode') ~= nil) then
												goto _continue22
											end
											if _g.sling.util.ModifierUtil:hasCommonModifier(childNode, _g.sling.model.Modifier.STATIC) == false then
												_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Invalid declaration. Only static declarations, embed blocks and comments are allowed inside typedef entities.", node, nil))
												do return end
											end
											do _g.sling.util.ModifierUtil:removeAnnotationModifier(childNode, "typedef") end
											okToDelete = false
										end
										::_continue22::
										do n4 = n4 + 1 end
									end
								end
							end
							if okToDelete then
								do _g.sling.util.NodeUtil:removeNode(node) end
							else
								do node:clearBaseTypes() end
							end
						end
					end
					::_continue21::
					do n3 = n3 + 1 end
				end
			end
		end
	end
end

function sling.compiler.SlingOps:processStringComparisonOperators(ctx, root)
	local types = {
		"class:sling.model.EqualsExpressionNode",
		"class:sling.model.NotEqualsExpressionNode"
	}
	local array = _g.sling.util.NodeFinder:findNodesOfTypes(root, types, false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.BinaryExpressionNode')
				if node ~= nil then
					local left = node:getLeft()
					if not (left ~= nil) then
						goto _continue23
					end
					do
						local ldt = _g.sling.util.ExpressionUtil:getExpressionDataType(left, nil)
						if (_vm:to_table_with_key(ldt, '_isType.sling.model.StringDataTypeNode') ~= nil) == false then
							goto _continue23
						end
						do
							local notequals = false
							if (_vm:to_table_with_key(node, '_isType.sling.model.NotEqualsExpressionNode') ~= nil) then
								notequals = true
							end
							do
								local lx = node:exportLeft()
								local rx = node:exportRight()
								if lx == nil or rx == nil then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to export nodes", node, nil))
								end
								do
									local se = _g.sling.model.StringEqualsExpressionNode._construct0(_g.sling.model.StringEqualsExpressionNode._create())
									do se:setSource(node:getSource()) end
									do se:setLeft(lx, false) end
									do se:setRight(rx, false) end
									do
										local v = nil
										if notequals then
											v = _g.sling.model.LogicalNotExpressionNode:forExpression(se)
										else
											v = se
										end
										do _g.sling.util.NodeUtil:replaceNode(node, v) end
									end
								end
							end
						end
					end
				end
				::_continue23::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:processAdditionOperators(ctx, root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.AdditionAssignmentExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.AdditionAssignmentExpressionNode')
				if node ~= nil then
					local left = node:getLeft()
					if not (left ~= nil) then
						goto _continue24
					end
					do
						local ldt = _g.sling.util.ExpressionUtil:getExpressionDataType(left, nil)
						if (_vm:to_table_with_key(ldt, '_isType.sling.model.VectorDataTypeNode') ~= nil) == false then
							goto _continue24
						end
						do
							local lx = node:exportLeft()
							local rx = node:exportRight()
							if lx == nil or rx == nil then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to export nodes", node, nil))
							end
							do
								local v = _g.sling.model.AppendToVectorExpressionNode._construct0(_g.sling.model.AppendToVectorExpressionNode._create())
								do v:setSource(node:getSource()) end
								do v:setLeft(lx, false) end
								do v:setRight(rx, false) end
								do _g.sling.util.NodeUtil:replaceNode(node, v) end
							end
						end
					end
				end
				::_continue24::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:performAutomaticTypeConversions(ctx, resolver, root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.ExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ExpressionNode')
				if node ~= nil then
					local xdt = resolver:getExpectedExpressionDataType(node)
					if not (xdt ~= nil) then
						goto _continue25
					end
					do
						local cdt = _g.sling.util.ExpressionUtil:tryGetExpressionDataType(node, nil)
						if not (cdt ~= nil) then
							goto _continue25
						end
						if resolver:isSame(cdt, xdt, nil) then
							goto _continue25
						end
						do
							local nnode = nil
							if (_vm:to_table_with_key(xdt, '_isType.sling.model.BooleanDataTypeNode') ~= nil) then
								if (_vm:to_table_with_key(cdt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
									nnode = _g.sling.model.NotEqualsExpressionNode:instance(_g.sling.util.ExpressionUtil:dupAsExpression(node), _g.sling.model.IntegerLiteralExpressionNode:forValue(0))
								elseif (_vm:to_table_with_key(cdt, '_isType.sling.model.CharacterDataTypeNode') ~= nil) then
									nnode = _g.sling.model.NotEqualsExpressionNode:instance(_g.sling.util.ExpressionUtil:dupAsExpression(node), _g.sling.model.CharacterLiteralExpressionNode:forValue(0))
								elseif (_vm:to_table_with_key(cdt, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
									nnode = _g.sling.model.NotEqualsExpressionNode:instance(_g.sling.util.ExpressionUtil:dupAsExpression(node), _g.sling.model.DoubleLiteralExpressionNode:forValue(0.0))
								elseif (_vm:to_table_with_key(cdt, '_isType.sling.model.FloatDataTypeNode') ~= nil) then
									nnode = _g.sling.model.NotEqualsExpressionNode:instance(_g.sling.util.ExpressionUtil:dupAsExpression(node), _g.sling.model.FloatLiteralExpressionNode:forValue(0.0))
								elseif (_vm:to_table_with_key(cdt, '_isType.sling.model.PrimitiveDataTypeNode') ~= nil) then
								else
									nnode = _g.sling.model.NotEqualsExpressionNode:instance(_g.sling.util.ExpressionUtil:dupAsExpression(node), _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()))
								end
							elseif (_vm:to_table_with_key(xdt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
								if (_vm:to_table_with_key(cdt, '_isType.sling.model.DoubleDataTypeNode') ~= nil) or (_vm:to_table_with_key(cdt, '_isType.sling.model.FloatDataTypeNode') ~= nil) then
									nnode = _g.sling.model.StaticCastExpressionNode:instance(_g.sling.util.DataTypeUtil:dupAsDataType(xdt), _g.sling.util.ExpressionUtil:dupAsExpression(node))
								end
							end
							if nnode ~= nil then
								do nnode:setSource(node:getSource()) end
								do _g.sling.util.NodeUtil:replaceNode(node, nnode) end
								if resolver ~= nil then
									do resolver:resolveExpression(nnode) end
								end
							end
						end
					end
				end
				::_continue25::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:mergeSlingUnitSettings(from, to)
	local array = from:getResources()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local resource = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ResourceFileNode')
				if resource ~= nil then
					do to:addToResources(resource) end
				end
				do n = n + 1 end
			end
		end
	end
	do to:setAndroidMetaData(_g.jk.lang.DynamicMap:forDynamicMaps(from:getAndroidMetaData(), to:getAndroidMetaData())) end
	do
		local array2 = from:getAndroidManifestCustomXmls()
		if array2 ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(array2)
			do
				n2 = 0
				while n2 < m2 do
					local o = (function(o)
						if (_vm:get_variable_type(o) == 'string') then
							do return o end
						end
						do return nil end
					end)(array2[n2 + 1])
					if o ~= nil then
						do to:addToAndroidManifestCustomXmls(o) end
					end
					do n2 = n2 + 1 end
				end
			end
		end
		do
			local array3 = from:getAndroidManifestApplicationCustomXmls()
			if array3 ~= nil then
				local n3 = 0
				local m3 = _g.jk.lang.Vector:getSize(array3)
				do
					n3 = 0
					while n3 < m3 do
						local o = (function(o)
							if (_vm:get_variable_type(o) == 'string') then
								do return o end
							end
							do return nil end
						end)(array3[n3 + 1])
						if o ~= nil then
							do to:addToAndroidManifestApplicationCustomXmls(o) end
						end
						do n3 = n3 + 1 end
					end
				end
			end
			do
				local array4 = from:getAndroidPermissions()
				if array4 ~= nil then
					local n4 = 0
					local m4 = _g.jk.lang.Vector:getSize(array4)
					do
						n4 = 0
						while n4 < m4 do
							local o = (function(o)
								if (_vm:get_variable_type(o) == 'string') then
									do return o end
								end
								do return nil end
							end)(array4[n4 + 1])
							if o ~= nil then
								do to:addToAndroidPermissions(o) end
							end
							do n4 = n4 + 1 end
						end
					end
				end
				do
					local array5 = from:getAndroidFeatures()
					if array5 ~= nil then
						local n5 = 0
						local m5 = _g.jk.lang.Vector:getSize(array5)
						do
							n5 = 0
							while n5 < m5 do
								local o = (function(o)
									if (_vm:get_variable_type(o) == 'string') then
										do return o end
									end
									do return nil end
								end)(array5[n5 + 1])
								if o ~= nil then
									do to:addToAndroidFeatures(o) end
								end
								do n5 = n5 + 1 end
							end
						end
					end
					do
						local array6 = from:getAndroidGradleDepends()
						if array6 ~= nil then
							local n6 = 0
							local m6 = _g.jk.lang.Vector:getSize(array6)
							do
								n6 = 0
								while n6 < m6 do
									local o = (function(o)
										if (_vm:get_variable_type(o) == 'string') then
											do return o end
										end
										do return nil end
									end)(array6[n6 + 1])
									if o ~= nil then
										do to:addToAndroidGradleDepends(o) end
									end
									do n6 = n6 + 1 end
								end
							end
						end
						do
							local array7 = from:getIosPods()
							if array7 ~= nil then
								local n7 = 0
								local m7 = _g.jk.lang.Vector:getSize(array7)
								do
									n7 = 0
									while n7 < m7 do
										local o = (function(o)
											if (_vm:get_variable_type(o) == 'string') then
												do return o end
											end
											do return nil end
										end)(array7[n7 + 1])
										if o ~= nil then
											do to:addToIosPods(o) end
										end
										do n7 = n7 + 1 end
									end
								end
							end
							do
								local array8 = from:getIosFrameworks()
								if array8 ~= nil then
									local n8 = 0
									local m8 = _g.jk.lang.Vector:getSize(array8)
									do
										n8 = 0
										while n8 < m8 do
											local o = (function(o)
												if (_vm:get_variable_type(o) == 'string') then
													do return o end
												end
												do return nil end
											end)(array8[n8 + 1])
											if o ~= nil then
												do to:addToIosFrameworks(o) end
											end
											do n8 = n8 + 1 end
										end
									end
								end
								do
									local array9 = from:getIosLinkLibs()
									if array9 ~= nil then
										local n9 = 0
										local m9 = _g.jk.lang.Vector:getSize(array9)
										do
											n9 = 0
											while n9 < m9 do
												local o = (function(o)
													if (_vm:get_variable_type(o) == 'string') then
														do return o end
													end
													do return nil end
												end)(array9[n9 + 1])
												if o ~= nil then
													do to:addToIosLinkLibs(o) end
												end
												do n9 = n9 + 1 end
											end
										end
									end
									do
										local array10 = from:getIosLdFlags()
										if array10 ~= nil then
											local n10 = 0
											local m10 = _g.jk.lang.Vector:getSize(array10)
											do
												n10 = 0
												while n10 < m10 do
													local o = (function(o)
														if (_vm:get_variable_type(o) == 'string') then
															do return o end
														end
														do return nil end
													end)(array10[n10 + 1])
													if o ~= nil then
														do to:addToIosLdFlags(o) end
													end
													do n10 = n10 + 1 end
												end
											end
										end
										do
											local array11 = from:getIosPlists()
											if array11 ~= nil then
												local n11 = 0
												local m11 = _g.jk.lang.Vector:getSize(array11)
												do
													n11 = 0
													while n11 < m11 do
														local o = (function(o)
															if (_vm:get_variable_type(o) == 'string') then
																do return o end
															end
															do return nil end
														end)(array11[n11 + 1])
														if o ~= nil then
															do to:addToIosPlists(o) end
														end
														do n11 = n11 + 1 end
													end
												end
											end
											do
												local array12 = from:getIosInfoPlistData()
												if array12 ~= nil then
													local n12 = 0
													local m12 = _g.jk.lang.Vector:getSize(array12)
													do
														n12 = 0
														while n12 < m12 do
															local o = (function(o)
																if (_vm:get_variable_type(o) == 'string') then
																	do return o end
																end
																do return nil end
															end)(array12[n12 + 1])
															if o ~= nil then
																do to:addToIosInfoPlistData(o) end
															end
															do n12 = n12 + 1 end
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

function sling.compiler.SlingOps:consolidateSlingUnitSettings(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local v = _vm:to_table_with_key(node:getSettings(), '_isType.sling.model.ext.NSlingUnitSettings')
		if not (v ~= nil) then
			local settings = {}
			local array = _g.sling.util.NodeFinder:findCompatibleNodes(node, "class:sling.model.ext.NSlingUnitSettings", false, true, false)
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local child = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ext.NSlingUnitSettings')
						if child ~= nil then
							if child:getIsMainUnit() then
								v = child
							else
								do _g.jk.lang.Vector:append(settings, child) end
							end
							do _g.sling.util.NodeUtil:exportNode(child) end
						end
						do n = n + 1 end
					end
				end
			end
			if not (v ~= nil) then
				if _g.jk.lang.Vector:getSize(settings) < 1 then
					do return end
				end
				v = _g.jk.lang.Vector:get(settings, 0)
				do _g.jk.lang.Vector:remove(settings, 0) end
				if not (v ~= nil) then
					do return end
				end
			end
			if settings ~= nil then
				local n2 = 0
				local m2 = _g.jk.lang.Vector:getSize(settings)
				do
					n2 = 0
					while n2 < m2 do
						local snode = settings[n2 + 1]
						if snode ~= nil then
							do _g.sling.compiler.SlingOps:mergeSlingUnitSettings(snode, v) end
						end
						do n2 = n2 + 1 end
					end
				end
			end
			do node:setSettings(v, false) end
		end
	end
end

function sling.compiler.SlingOps:transferTrailingParametersToParameters(node)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.FunctionCallExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local fcxp = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FunctionCallExpressionNode')
				if fcxp ~= nil then
					local trxp = fcxp:exportTrailingParameter()
					if not (trxp ~= nil) then
						goto _continue26
					end
					do fcxp:addToParameters(trxp) end
				end
				::_continue26::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:transformToOutputModuleCombined(v, root, fileName, fileExtension)
	if not (root ~= nil and v ~= nil) then
		do return end
	end
	do
		local script = _g.sling.common.CodeFileNode._construct0(_g.sling.common.CodeFileNode._create())
		local array = root:exportNodes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
					if node ~= nil then
						if (_vm:to_table_with_key(node, '_isType.sling.model.ResourceFileNode') ~= nil) then
							do v:addToNodes(node) end
							goto _continue27
						end
						do script:addToNodes(node) end
					end
					::_continue27::
					do n = n + 1 end
				end
			end
		end
		do v:addToNodes(script) end
		do
			local array2 = _g.sling.util.FindUtil:findCompatibleNodes(script, "class:sling.common.CodeUnitSettingsNode", false, true, false)
			if array2 ~= nil then
				local n2 = 0
				local m2 = _g.jk.lang.Vector:getSize(array2)
				do
					n2 = 0
					while n2 < m2 do
						local ss = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.common.CodeUnitSettingsNode')
						if ss ~= nil then
							do _g.sling.util.NodeUtil:exportNode(ss) end
							do v:addToNodes(ss) end
						end
						do n2 = n2 + 1 end
					end
				end
			end
			do _g.sling.compiler.SlingOps:consolidateSlingUnitSettings(v) end
			if _g.jk.lang.String:isNotEmpty(fileName) then
				do script:setName(fileName) end
			else
				local unit = _vm:to_table_with_key(v:getSettings(), '_isType.sling.model.ext.NSlingUnitSettings')
				local name = nil
				if unit ~= nil then
					name = unit:getModuleId()
					if _g.jk.lang.String:isEmpty(name) then
						name = unit:getProjectId()
					end
				end
				if _g.jk.lang.String:isEmpty(name) then
					name = "output"
				end
				if _g.jk.lang.String:isNotEmpty(fileExtension) then
					name = _g.jk.lang.String:safeString(name) .. "." .. _g.jk.lang.String:safeString(fileExtension)
				end
				do script:setName(name) end
			end
		end
	end
end

function sling.compiler.SlingOps:expandForeachStatementsStatic(ctx, tr, root)
	do _g.sling.compiler.ForEachHandler:expandForeachStatementsStatic(ctx, tr, root) end
end

function sling.compiler.SlingOps:expandForeachStatementsDynamic(root)
	do _g.sling.compiler.ForEachHandler:expandForeachStatementsDynamic(root) end
end

function sling.compiler.SlingOps:expandMembershipCheckExpressions(root)
	local array = _g.sling.util.FindUtil:findNodesOfType(root, "class:sling.model.ClassDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local decl = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ClassDeclarationNode')
				if decl ~= nil then
					local nojkop = _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "nojkop")
					local array2 = _g.sling.util.FindUtil:findNodesOfType(decl, "class:sling.model.MembershipCheckExpressionNode", false, true, false)
					if array2 ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(array2)
						do
							n2 = 0
							while n2 < m2 do
								local node = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.MembershipCheckExpressionNode')
								if node ~= nil then
									local rval = node:getRight()
									if not (rval ~= nil) then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("membership check has no right value", node, nil))
									end
									do
										local rdtp = _g.sling.util.ExpressionUtil:tryGetExpressionDataType(rval, nil)
										if not (rdtp ~= nil) then
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("right value data type is unknown", node, nil))
										end
										do
											local rplc = nil
											if (_vm:to_table_with_key(rdtp, '_isType.sling.model.VectorDataTypeNode') ~= nil) and not nojkop then
												local call = _g.sling.model.FunctionCallExpressionNode:forNames({
													"jk",
													"lang",
													"Vector",
													"contains"
												})
												do call:addToParameters(node:exportRight()) end
												do call:addToParameters(node:exportLeft()) end
												rplc = call
											elseif (_vm:to_table_with_key(rdtp, '_isType.sling.model.StaticArrayDataTypeNode') ~= nil) and not nojkop then
												local call = _g.sling.model.FunctionCallExpressionNode:forNames({
													"jk",
													"lang",
													"Array",
													"contains"
												})
												do call:addToParameters(node:exportRight()) end
												do call:addToParameters(node:exportLeft()) end
												rplc = call
											elseif (_vm:to_table_with_key(rdtp, '_isType.sling.model.StringDataTypeNode') ~= nil) and not nojkop then
												local call = _g.sling.model.FunctionCallExpressionNode:forNames({
													"jk",
													"lang",
													"String",
													"contains"
												})
												do call:addToParameters(node:exportRight()) end
												do call:addToParameters(node:exportLeft()) end
												rplc = call
											elseif (_vm:to_table_with_key(rdtp, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
												local call = _g.sling.model.FunctionCallExpressionNode:forMethod(node:exportRight(), "contains", false)
												do call:addToParameters(node:exportLeft()) end
												rplc = call
											elseif (_vm:to_table_with_key(rdtp, '_isType.sling.model.RangeDataTypeNode') ~= nil) then
												local lval = node:exportLeft()
												if not (lval ~= nil) then
													_vm:throw_error(_g.sling.common.ReferenceError:forMessage("membership check has no left value", node, nil))
												end
												do
													local type = _g.sling.util.ExpressionUtil:tryGetExpressionDataType(lval, nil)
													if (_vm:to_table_with_key(type, '_isType.sling.model.DoubleDataTypeNode') ~= nil) == false and (_vm:to_table_with_key(type, '_isType.sling.model.IntegerDataTypeNode') ~= nil) == false then
														_vm:throw_error(_g.sling.common.ReferenceError:forMessage("unsupported left value type in membership check with range `" .. _g.jk.lang.String:safeString(type:getNodeTypeName()) .. "'", node, nil))
													end
													do
														local cond1 = nil
														local cond2 = nil
														local range = _vm:to_table_with_key(node:exportRight(), '_isType.sling.model.RangeExpressionNode')
														local lower = range:exportLowerBound()
														local upper = range:exportUpperBound()
														local xtype = range:getExclusionType()
														local duplv = _g.sling.util.ExpressionUtil:dupAsExpression(lval)
														if xtype == _g.sling.model.RangeExpressionNode.TYPE_EXCLUDE_BOTH_BOUNDS then
															cond1 = _g.sling.model.GreaterThanExpressionNode:instance(lval, lower)
															cond2 = _g.sling.model.LessThanExpressionNode:instance(duplv, upper)
														elseif xtype == _g.sling.model.RangeExpressionNode.TYPE_EXCLUDE_UPPER_BOUND then
															cond1 = _g.sling.model.GreaterOrEqualExpressionNode:instance(lval, lower)
															cond2 = _g.sling.model.LessThanExpressionNode:instance(duplv, upper)
														elseif xtype == _g.sling.model.RangeExpressionNode.TYPE_EXCLUDE_LOWER_BOUND then
															cond1 = _g.sling.model.GreaterThanExpressionNode:instance(lval, lower)
															cond2 = _g.sling.model.LessOrEqualExpressionNode:instance(duplv, upper)
														else
															cond1 = _g.sling.model.GreaterOrEqualExpressionNode:instance(lval, lower)
															cond2 = _g.sling.model.LessOrEqualExpressionNode:instance(duplv, upper)
														end
														rplc = _g.sling.model.LogicalAndExpressionNode:instance(cond1, cond2)
													end
												end
											else
												_vm:throw_error(_g.sling.common.ReferenceError:forMessage("unsupported right value type in membership check expression `" .. _g.jk.lang.String:safeString(rdtp:getNodeTypeName()) .. "'", node, nil))
											end
											do _g.sling.util.NodeUtil:replaceNode(node, rplc) end
										end
									end
								end
								do n2 = n2 + 1 end
							end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:getRangeInstantiationFunctionCall(range)
	if not (range ~= nil) then
		do return nil end
	end
	do
		local lval = range:exportLowerBound()
		if not (lval ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Range expression has no lower bound", range, nil))
		end
		do
			local uval = range:exportUpperBound()
			if not (uval ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Range expression has no upper bound", range, nil))
			end
			do
				local call = _g.sling.model.FunctionCallExpressionNode:forNames({
					"jk",
					"lang",
					"Range",
					"forValues"
				})
				do call:addToParameters(lval) end
				do call:addToParameters(uval) end
				do call:addToParameters(_g.sling.model.IntegerLiteralExpressionNode:forValue(range:getExclusionType())) end
				do return call end
			end
		end
	end
end

function sling.compiler.SlingOps:convertRangeExpressionsToJkopRange(root)
	local array = _g.sling.util.FindUtil:findNodesOfType(root, "class:sling.model.ClassDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local decl = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ClassDeclarationNode')
				if decl ~= nil then
					if _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "nojkop") then
						goto _continue28
					end
					do
						local array2 = _g.sling.util.FindUtil:findNodesOfType(decl, "class:sling.model.RangeExpressionNode", false, true, false)
						if array2 ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(array2)
							do
								n2 = 0
								while n2 < m2 do
									local node = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.RangeExpressionNode')
									if node ~= nil then
										local prnt = _vm:to_table_with_key(node:getParent(), '_isType.sling.model.MembershipCheckExpressionNode')
										if prnt ~= nil and prnt:getRight() == node then
											goto _continue29
										end
										do _g.sling.util.NodeUtil:replaceNode(node, _g.sling.compiler.SlingOps:getRangeInstantiationFunctionCall(node)) end
									end
									::_continue29::
									do n2 = n2 + 1 end
								end
							end
						end
					end
				end
				::_continue28::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:addNodeToTargetNamespace(node, target)
	if not (node ~= nil and target ~= nil) then
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.NamespaceNode') ~= nil) == false then
		do target:addNode(node) end
		do return end
	end
	do
		local ons = node
		local nn = ons:getNodeName()
		if _g.jk.lang.String:isEmpty(nn) then
			do target:addNode(node) end
			do return end
		end
		do
			local ans = _g.sling.util.NodeUtil:getOrCreateNamespace(target, nn)
			local array = ons:exportNodes()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local child = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
						if child ~= nil then
							do _g.sling.compiler.SlingOps:addNodeToTargetNamespace(child, ans) end
						end
						do n = n + 1 end
					end
				end
			end
		end
	end
end

function sling.compiler.SlingOps:addVectorToNamespace(node, container, target)
	if not (container ~= nil and target ~= nil) then
		do return end
	end
	if container ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(container)
		do
			n = 0
			while n < m do
				local modnode = _vm:to_table_with_key(container[n + 1], '_isType.sling.common.NodeObject')
				if modnode ~= nil then
					if (_vm:to_table_with_key(modnode, '_isType.sling.common.CodeFileNode') ~= nil) then
						local script = modnode
						local nodes = script:exportNodes()
						local imps = {}
						if nodes ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(nodes)
							do
								n2 = 0
								while n2 < m2 do
									local imp = _vm:to_table_with_key(nodes[n2 + 1], '_isType.sling.model.ImportStatementNode')
									if imp ~= nil then
										do _g.jk.lang.Vector:append(imps, imp) end
									end
									do n2 = n2 + 1 end
								end
							end
						end
						if nodes ~= nil then
							local n3 = 0
							local m3 = _g.jk.lang.Vector:getSize(nodes)
							do
								n3 = 0
								while n3 < m3 do
									local nn = _vm:to_table_with_key(nodes[n3 + 1], '_isType.sling.common.NodeObject')
									if nn ~= nil then
										if (_vm:to_table_with_key(nn, '_isType.sling.model.ImportStatementNode') ~= nil) then
											goto _continue30
										end
										if (_vm:to_table_with_key(nn, '_isType.sling.model.EntityDeclarationNode') ~= nil) then
											if imps ~= nil then
												local n4 = 0
												local m4 = _g.jk.lang.Vector:getSize(imps)
												do
													n4 = 0
													while n4 < m4 do
														local imp = imps[n4 + 1]
														if imp ~= nil then
															local impdup = _vm:to_table_with_key(_g.sling.util.NodeUtil:dupAsNode(imp), '_isType.sling.model.ImportStatementNode')
															if not (impdup ~= nil) then
																_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to duplicate as ImportStatementNode", imp, nil))
															end
															do _g.sling.util.EntityUtil:addImportToEntity(nn, impdup) end
														end
														do n4 = n4 + 1 end
													end
												end
											end
										end
										do _g.sling.compiler.SlingOps:addNodeToTargetNamespace(nn, target) end
									end
									::_continue30::
									do n3 = n3 + 1 end
								end
							end
						end
					elseif (_vm:to_table_with_key(modnode, '_isType.sling.common.CodeDirectoryNode') ~= nil) then
						local tt = target
						local array = _g.jk.lang.String:split(modnode:getNodeName(), 46, 0)
						if array ~= nil then
							local n5 = 0
							local m5 = _g.jk.lang.Vector:getSize(array)
							do
								n5 = 0
								while n5 < m5 do
									local comp = array[n5 + 1]
									if comp ~= nil then
										tt = _g.sling.util.NodeUtil:getOrCreateNamespace(tt, comp)
									end
									do n5 = n5 + 1 end
								end
							end
						end
						do _g.sling.compiler.SlingOps:addVectorToNamespace(modnode, modnode:getNodes(), tt) end
					else
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type in module `" .. _g.jk.lang.String:safeString(node:getNodeName()) .. "': `" .. _g.jk.lang.String:safeString(modnode:getNodeTypeName()) .. "'", modnode, nil))
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:addDefaultModifiersToDeclarations(node)
	local array = _g.sling.util.FindUtil:findCompatibleNodes(node, "class:sling.model.EntityDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local entity = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.EntityDeclarationNode')
				if entity ~= nil then
					if (_vm:to_table_with_key(entity:getParent(), '_isType.sling.model.NamespaceNode') ~= nil) and _g.sling.util.NodeUtil:hasVisibilityModifier(entity) == false then
						do _g.sling.util.ModifierUtil:addCommonModifier(entity, _g.sling.model.Modifier.PUBLIC) end
					end
					do
						local array2 = entity:getNodes()
						if array2 ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(array2)
							do
								n2 = 0
								while n2 < m2 do
									local decl = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.common.NodeObject')
									if decl ~= nil then
										if _g.sling.util.NodeUtil:hasVisibilityModifier(decl) == false then
											if (_vm:to_table_with_key(decl, '_isType.sling.model.VariableDeclarationNode') ~= nil) and _g.sling.util.ModifierUtil:hasCommonModifier(decl, _g.sling.model.Modifier.PROPERTY) then
												do _g.sling.util.ModifierUtil:addCommonModifier(decl, _g.sling.model.Modifier.PUBLIC) end
											elseif (_vm:to_table_with_key(decl, '_isType.sling.model.PropertyDeclarationNode') ~= nil) then
												do _g.sling.util.ModifierUtil:addCommonModifier(decl, _g.sling.model.Modifier.PUBLIC) end
											elseif (_vm:to_table_with_key(decl, '_isType.sling.model.DestructorDeclarationNode') ~= nil) then
											elseif (_vm:to_table_with_key(decl, '_isType.sling.model.ConstructorDeclarationNode') ~= nil) then
												do _g.sling.util.ModifierUtil:addCommonModifier(decl, _g.sling.model.Modifier.PUBLIC) end
											elseif (_vm:to_table_with_key(decl, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
												do _g.sling.util.ModifierUtil:addCommonModifier(decl, _g.sling.model.Modifier.PUBLIC) end
											elseif (_vm:to_table_with_key(decl, '_isType.sling.model.MainFunctionDeclarationNode') ~= nil) then
												do _g.sling.util.ModifierUtil:addCommonModifier(decl, _g.sling.model.Modifier.PUBLIC) end
											elseif (_vm:to_table_with_key(decl, '_isType.sling.model.NodeWithModifiers') ~= nil) then
												do _g.sling.util.ModifierUtil:addCommonModifier(decl, _g.sling.model.Modifier.PRIVATE) end
											end
										end
										if (_vm:to_table_with_key(entity, '_isType.sling.model.ScriptDeclarationNode') ~= nil) then
											if (_vm:to_table_with_key(decl, '_isType.sling.model.NodeWithModifiers') ~= nil) then
												do _g.sling.util.ModifierUtil:addCommonModifier(decl, _g.sling.model.Modifier.STATIC) end
											end
										elseif (_vm:to_table_with_key(decl, '_isType.sling.model.EntityDeclarationNode') ~= nil) and (_vm:to_table_with_key(decl, '_isType.sling.model.DelegateDeclarationNode') ~= nil) == false then
											do _g.sling.util.ModifierUtil:addCommonModifier(decl, _g.sling.model.Modifier.STATIC) end
										end
									end
									do n2 = n2 + 1 end
								end
							end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:transformToProcessingTree(ctx, modules)
	local v = _g.sling.model.NamespaceNode._construct0(_g.sling.model.NamespaceNode._create())
	if modules ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(modules)
		do
			n = 0
			while n < m do
				local module = modules[n + 1]
				if module ~= nil then
					local target = v
					local modname = module:getNodeName()
					if _g.jk.lang.String:isNotEmpty(modname) then
						local array = _g.jk.lang.String:split(modname, 46, 0)
						if array ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(array)
							do
								n2 = 0
								while n2 < m2 do
									local comp = array[n2 + 1]
									if comp ~= nil then
										target = _g.sling.util.NodeUtil:getOrCreateNamespace(target, comp)
									end
									do n2 = n2 + 1 end
								end
							end
						end
					end
					do
						local types = {
							"class:sling.common.CodeUnitSettingsNode",
							"class:sling.model.ResourceFileNode"
						}
						local array2 = _g.sling.util.NodeFinder:findCompatibleNodesForTypes(module, types, false, true, false)
						if array2 ~= nil then
							local n3 = 0
							local m3 = _g.jk.lang.Vector:getSize(array2)
							do
								n3 = 0
								while n3 < m3 do
									local fn = array2[n3 + 1]
									if fn ~= nil then
										do _g.sling.util.NodeUtil:exportNode(fn) end
										do target:addNode(fn) end
									end
									do n3 = n3 + 1 end
								end
							end
						end
						do _g.sling.compiler.SlingOps:addVectorToNamespace(module, module:getNodes(), target) end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function sling.compiler.SlingOps:createDataTypeDefaultValue(type)
	do return _g.sling.util.DataTypeUtil:createDefaultValue(type) end
end

function sling.compiler.SlingOps:convertReferenceSubscriptsToFunctionCalls(node, resolver)
	local cache = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.SubscriptExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local ssxp = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.SubscriptExpressionNode')
				if ssxp ~= nil then
					local type = _vm:to_table_with_key(_g.sling.util.ExpressionUtil:tryGetExpressionDataType(ssxp:getChild(), resolver), '_isType.sling.model.ReferenceDataTypeNode')
					if not (type ~= nil) then
						goto _continue31
					end
					do
						local prnt = _vm:to_table_with_key(ssxp:getParent(), '_isType.sling.model.AssignmentExpressionNode')
						local tstr = _g.sling.util.SymbolUtil:getSymbolNamesString(type:getSymbol(), 46)
						local smap = cache:getDynamicMap(tstr)
						if not (smap ~= nil) then
							local entt = _g.sling.util.TypeResolver:getAndRequireBoundEntity(type)
							local getter = nil
							local setters = nil
							local array2 = entt:getNodes()
							if array2 ~= nil then
								local n2 = 0
								local m2 = _g.jk.lang.Vector:getSize(array2)
								do
									n2 = 0
									while n2 < m2 do
										local fdecl = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.FunctionDeclarationNode')
										if fdecl ~= nil then
											if _g.sling.util.ModifierUtil:hasAnnotationModifier(fdecl, "subscriptGet") then
												if getter ~= nil then
													_vm:throw_error(_g.sling.common.ReferenceError:forMessage("subscriptGet modifier found in multiple functions", fdecl, nil))
												end
												do
													local rtrn = fdecl:getOwnReturnType()
													if not (rtrn ~= nil) or (_vm:to_table_with_key(rtrn, '_isType.sling.model.VoidDataTypeNode') ~= nil) then
														_vm:throw_error(_g.sling.common.ReferenceError:forMessage("subscriptGet modifier found in a void returning function", fdecl, nil))
													end
													if fdecl:getParameterCount() ~= 1 then
														_vm:throw_error(_g.sling.common.ReferenceError:forMessage("subscriptGet modifier found in a function does not have 1 parameter", fdecl, nil))
													end
													getter = fdecl
												end
											elseif _g.sling.util.ModifierUtil:hasAnnotationModifier(fdecl, "subscriptSet") then
												local rtrn = fdecl:getOwnReturnType()
												if rtrn ~= nil and (_vm:to_table_with_key(rtrn, '_isType.sling.model.VoidDataTypeNode') ~= nil) == false then
													_vm:throw_error(_g.sling.common.ReferenceError:forMessage("subscriptSet modifier found in a non-void returning function", fdecl, nil))
												end
												if fdecl:getParameterCount() ~= 2 then
													_vm:throw_error(_g.sling.common.ReferenceError:forMessage("subscriptGet modifier found in a function does not have 2 parameter", fdecl, nil))
												end
												if not (setters ~= nil) then
													setters = {}
												end
												do _g.jk.lang.Vector:append(setters, fdecl) end
											end
										end
										do n2 = n2 + 1 end
									end
								end
							end
							smap = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
							do smap:setObject("getter", getter) end
							do smap:setObject("setters", setters) end
							do cache:setObject(tstr, smap) end
						end
						do
							local subx = ssxp:getSubscript()
							local call = nil
							local trgt = nil
							if prnt ~= nil and prnt:getLeft() == ssxp then
								local vparams = {}
								do _g.jk.lang.Vector:append(vparams, subx) end
								do _g.jk.lang.Vector:append(vparams, prnt:getRight()) end
								if vparams ~= nil then
									local n3 = 0
									local m3 = _g.jk.lang.Vector:getSize(vparams)
									do
										n3 = 0
										while n3 < m3 do
											local param = _vm:to_table_with_key(vparams[n3 + 1], '_isType.sling.model.ExpressionNode')
											if param ~= nil then
												do resolver:resolveExpression(param) end
											end
											do n3 = n3 + 1 end
										end
									end
								end
								do
									local setters = smap:getVector("setters")
									local setfunc = nil
									if setters ~= nil then
										local n4 = 0
										local m4 = _g.jk.lang.Vector:getSize(setters)
										do
											n4 = 0
											while n4 < m4 do
												local setf = _vm:to_table_with_key(setters[n4 + 1], '_isType.sling.model.FunctionDeclarationNode')
												if setf ~= nil then
													if resolver:matchesCallParameters(setf, vparams, nil, true, false) then
														setfunc = setf
														do break end
													end
												end
												do n4 = n4 + 1 end
											end
										end
									end
									if not (setfunc ~= nil) then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No subscriptSet function found for reference subscript", ssxp, nil))
									end
									do _g.sling.util.NodeUtil:exportNode(subx) end
									call = _g.sling.model.FunctionCallExpressionNode._construct0(_g.sling.model.FunctionCallExpressionNode._create())
									do call:setExpression(_g.sling.model.MemberAccessExpressionNode:forNodes(ssxp:exportChild(), _g.sling.model.SymbolExpressionNode:forName(setfunc:getNodeName())), false) end
									do call:addToParameters(subx) end
									do call:addToParameters(prnt:exportRight()) end
									trgt = prnt
								end
							else
								local getter = _vm:to_table_with_key(smap:get("getter"), '_isType.sling.model.FunctionDeclarationNode')
								if not (getter ~= nil) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No subscriptGet function found for reference subscript", ssxp, nil))
								end
								do _g.sling.util.NodeUtil:exportNode(subx) end
								call = _g.sling.model.FunctionCallExpressionNode._construct0(_g.sling.model.FunctionCallExpressionNode._create())
								do call:setExpression(_g.sling.model.MemberAccessExpressionNode:forNodes(ssxp:exportChild(), _g.sling.model.SymbolExpressionNode:forName(getter:getNodeName())), false) end
								do call:addToParameters(subx) end
								trgt = ssxp
							end
							do _g.sling.util.NodeUtil:replaceAndExport(trgt, call) end
						end
					end
				end
				::_continue31::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:validateTree(ctx, resolver, node)
	do _g.jk.log.Log:status(ctx, "Validating node tree ..") end
	do _g.sling.compiler.SlingOps:validateCreateObjectExpressions(node) end
	do _g.sling.compiler.SlingOps:validateReturnStatements(ctx, resolver, node) end
	do _g.sling.compiler.SlingOps:validateExpectedTypes(ctx, resolver, node) end
	do _g.sling.compiler.SlingOps:validateVariableDeclarations(ctx, node) end
	do _g.sling.compiler.SlingOps:validateInheritedInterfaces(ctx, resolver, node) end
	do _g.sling.compiler.SlingOps:validateFunctionDeclarations(ctx, node) end
	do _g.sling.compiler.SlingOps:validateEntityBoundSymbolExpressions(ctx, node) end
	do _g.sling.compiler.SlingOps:validateEntityBaseClasses(ctx, resolver, node) end
	do _g.sling.compiler.SlingOps:validateExpressionsInStaticDeclarations(ctx, resolver, node) end
end

function sling.compiler.SlingOps:validateCreateObjectExpressions(node)
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.CreateObjectExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local co = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.CreateObjectExpressionNode')
				if co ~= nil then
					local tp = co:getType()
					if (_vm:to_table_with_key(tp, '_isType.sling.model.PrimitiveDataTypeNode') ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Primitive data types are not allowed in create object expressions", tp, nil))
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:validateExpectedTypes(ctx, resolver, node)
	local array = _g.sling.util.FindUtil:findCompatibleNodes(node, "class:sling.model.ExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local xp = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ExpressionNode')
				if xp ~= nil then
					local ex = resolver:getExpectedExpressionDataType(xp)
					if not (ex ~= nil) or (_vm:to_table_with_key(ex, '_isType.sling.model.AutomaticDataTypeNode') ~= nil) or (_vm:to_table_with_key(ex, '_isType.sling.model.DynamicDataTypeNode') ~= nil) then
						goto _continue32
					end
					do
						local et = resolver:mapType(_g.sling.util.ExpressionUtil:getExpressionDataType(xp, nil), nil)
						if not resolver:matches(ex, et, nil, false, false) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Data type `" .. _g.jk.lang.String:safeString(_g.sling.generator.SlingGeneratorUtil:describeDataType(et)) .. "' does not match expected data type `" .. _g.jk.lang.String:safeString(_g.sling.generator.SlingGeneratorUtil:describeDataType(ex)) .. "'", xp, nil))
						end
					end
				end
				::_continue32::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:validateVariableDeclarations(ctx, node)
	local array = _g.sling.util.FindUtil:findCompatibleNodes(node, "class:sling.common.ContainerNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local decl = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.ContainerNode')
				if decl ~= nil then
					local vars = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
					if (_vm:to_table_with_key(decl, '_isType.sling.model.BlockNode') ~= nil) then
						local prnt = decl:getParent()
						if (_vm:to_table_with_key(prnt, '_isType.sling.model.ForEachStatementNode') ~= nil) then
							local array2 = prnt:getLefts()
							if array2 ~= nil then
								local n2 = 0
								local m2 = _g.jk.lang.Vector:getSize(array2)
								do
									n2 = 0
									while n2 < m2 do
										local left = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.VariableDeclarationNode')
										if left ~= nil then
											local name = left:getNodeName()
											if vars:contains(name) then
												_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Duplicate variable declaration found", left, nil))
											end
											do vars:add(name) end
										end
										do n2 = n2 + 1 end
									end
								end
							end
						elseif (_vm:to_table_with_key(prnt, '_isType.sling.model.ForStatementNode') ~= nil) then
							local init = prnt:getInitializer()
							local array3 = init:getNodes()
							if array3 ~= nil then
								local n3 = 0
								local m3 = _g.jk.lang.Vector:getSize(array3)
								do
									n3 = 0
									while n3 < m3 do
										local vdec = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.model.VariableDeclarationNode')
										if vdec ~= nil then
											local name = vdec:getNodeName()
											if vars:contains(name) then
												_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Duplicate variable declaration found", vdec, nil))
											end
											do vars:add(name) end
										end
										do n3 = n3 + 1 end
									end
								end
							end
						end
					end
					do
						local array4 = decl:getNodes()
						if array4 ~= nil then
							local n4 = 0
							local m4 = _g.jk.lang.Vector:getSize(array4)
							do
								n4 = 0
								while n4 < m4 do
									local vdec = _vm:to_table_with_key(array4[n4 + 1], '_isType.sling.model.VariableDeclarationNode')
									if vdec ~= nil then
										local name = vdec:getNodeName()
										if vars:contains(name) then
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Duplicate variable declaration found", vdec, nil))
										end
										do vars:add(name) end
									end
									do n4 = n4 + 1 end
								end
							end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:validateInheritedInterfaces(ctx, resolver, node)
	local strl = resolver
	if not (strl ~= nil) then
		do return end
	end
	do
		local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.ClassDeclarationNode", false, true, false)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local cdec = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ClassDeclarationNode')
					if cdec ~= nil then
						if _g.sling.util.ModifierUtil:hasCommonModifier(cdec, _g.sling.model.Modifier.HEADER) then
							goto _continue33
						end
						do
							local array2 = cdec:getBaseTypes()
							if array2 ~= nil then
								local n2 = 0
								local m2 = _g.jk.lang.Vector:getSize(array2)
								do
									n2 = 0
									while n2 < m2 do
										local btyp = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.BaseTypeNode')
										if btyp ~= nil then
											if btyp:getInheritType() ~= _g.sling.model.BaseTypeNode.INHERIT_IMPLEMENT then
												goto _continue34
											end
											do
												local type = btyp:getReferenceType()
												if type ~= nil and type:getMagical() then
													goto _continue34
												end
												do
													local intr = resolver:getAndRequireBoundInterface(type)
													local array3 = intr:getNodes()
													if array3 ~= nil then
														local n3 = 0
														local m3 = _g.jk.lang.Vector:getSize(array3)
														do
															n3 = 0
															while n3 < m3 do
																local idec = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.model.FunctionDeclarationNode')
																if idec ~= nil then
																	local icom = true
																	local array4 = cdec:getNodeIndexForName(idec:getNodeName())
																	if array4 ~= nil then
																		local n4 = 0
																		local m4 = _g.jk.lang.Vector:getSize(array4)
																		do
																			n4 = 0
																			while n4 < m4 do
																				local fdec = _vm:to_table_with_key(array4[n4 + 1], '_isType.sling.model.FunctionDeclarationNode')
																				if fdec ~= nil then
																					if _g.jk.lang.Vector:isNotEmpty(intr:getGenericTypes()) then
																						if _g.sling.compiler.SlingTypeResolver:hasSameSignature(idec, fdec, nil, true, true, false) then
																							icom = false
																							do break end
																						end
																					end
																					if _g.sling.compiler.SlingTypeResolver:hasSameSignature(idec, fdec, nil, false, false, false) then
																						icom = false
																						do break end
																					end
																				end
																				do n4 = n4 + 1 end
																			end
																		end
																	end
																	if icom then
																		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Incomplete implementation of an inherited interface", cdec, nil):addRelatedMessage("No matching method signature found", idec))
																	end
																end
																do n3 = n3 + 1 end
															end
														end
													end
												end
											end
										end
										::_continue34::
										do n2 = n2 + 1 end
									end
								end
							end
						end
					end
					::_continue33::
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.compiler.SlingOps:validateFunctionDeclarations(ctx, node)
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.FunctionDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local fdec = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FunctionDeclarationNode')
				if fdec ~= nil then
					local parent = fdec:getParent()
					if (_vm:to_table_with_key(parent, '_isType.sling.model.FunctionDataTypeNode') ~= nil) then
						goto _continue35
					end
					if (_vm:to_table_with_key(parent, '_isType.sling.model.ClassDeclarationNode') ~= nil) then
						local cdec = parent
						if _g.sling.util.ModifierUtil:hasCommonModifier(cdec, _g.sling.model.Modifier.HEADER) then
							goto _continue35
						end
						if _g.sling.util.ModifierUtil:hasCommonModifier(fdec, _g.sling.model.Modifier.ABSTRACT) then
							if not _g.sling.util.ModifierUtil:hasCommonModifier(cdec, _g.sling.model.Modifier.ABSTRACT) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("A class that contains abstract methods must be declared abstract.", cdec, nil):addRelatedMessage("An abstract method was found inside the class", fdec))
							end
							if fdec:getBody() ~= nil then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("An abstract method must not contain a body.", fdec, nil))
							end
						elseif fdec:getBody() == nil then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("A method without a body must be declared abstract.", fdec, nil))
						end
					elseif _g.sling.util.ModifierUtil:hasCommonModifier(fdec, _g.sling.model.Modifier.ABSTRACT) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Functions declared as abstract must be inside a class", fdec, nil))
					end
				end
				::_continue35::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:validateEntityBoundSymbolExpressions(ctx, node)
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.SymbolExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local symb = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.SymbolExpressionNode')
				if symb ~= nil then
					local bndn = _g.sling.util.SymbolUtil:tryGetSymbolBindingForExpression(symb)
					if not (bndn ~= nil) then
						goto _continue36
					end
					if (_vm:to_table_with_key(bndn, '_isType.sling.model.EntityDeclarationNode') ~= nil) == false then
						goto _continue36
					end
					do
						local prnt = symb:getParent()
						if not (prnt ~= nil) then
							goto _continue36
						end
						if (_vm:to_table_with_key(prnt, '_isType.sling.model.MemberAccessExpressionNode') ~= nil) then
							local last = prnt:getLastNode()
							if last ~= symb then
								goto _continue36
							end
						end
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Symbol expression that is bound to an entity is not allowed inside `" .. _g.jk.lang.String:safeString(prnt:getNodeTypeName()) .. "'", symb, nil))
					end
				end
				::_continue36::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:validateReturnStatements(ctx, resolver, node)
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.ReturnStatementNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local rstm = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ReturnStatementNode')
				if rstm ~= nil then
					local fdec = _g.sling.util.FindUtil:findNearestFunctionBase(rstm)
					if not (fdec ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Return statement that is not inside a function", rstm, nil))
					end
					do
						local type = nil
						if (_vm:to_table_with_key(fdec, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
							type = fdec:getOwnReturnType()
						elseif (_vm:to_table_with_key(fdec, '_isType.sling.model.MainFunctionDeclarationNode') ~= nil) then
							type = _g.sling.model.IntegerDataTypeNode._construct0(_g.sling.model.IntegerDataTypeNode._create())
						end
						if type ~= nil then
							type = resolver:getActualType(type)
						end
						do
							local expr = rstm:getExpression()
							if type == nil or (_vm:to_table_with_key(type, '_isType.sling.model.VoidDataTypeNode') ~= nil) then
								if expr ~= nil then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Return statement returns a value in a void function", rstm, nil))
								end
							else
								if not (expr ~= nil) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No return expression in a function requiring a return value", rstm, nil))
								end
								do
									local edtp = resolver:mapType(_g.sling.util.ExpressionUtil:getExpressionDataType(expr, nil), nil)
									if not (edtp ~= nil) then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to determine expression data type", expr, nil))
									end
									if not resolver:matches(type, edtp, nil, false, false) then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Return value data type `" .. _g.jk.lang.String:safeString(_g.sling.generator.SlingGeneratorUtil:describeDataType(edtp)) .. "' does not match function return type `" .. _g.jk.lang.String:safeString(_g.sling.generator.SlingGeneratorUtil:describeDataType(type)) .. "'", expr, nil))
									end
								end
							end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:validateEntityBaseClasses(ctx, resolver, node)
	local array = _g.sling.util.FindUtil:findCompatibleNodes(node, "class:sling.model.EntityDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local entt = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.EntityDeclarationNode')
				if entt ~= nil then
					local bcnt = 0
					local array2 = entt:getBaseTypes()
					if array2 ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(array2)
						do
							n2 = 0
							while n2 < m2 do
								local bstp = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.BaseTypeNode')
								if bstp ~= nil then
									local bent = _g.sling.util.TypeResolver:getAndRequireBoundEntity(bstp:getReferenceType())
									if bstp:getInheritType() == _g.sling.model.BaseTypeNode.INHERIT_EXTEND then
										if (_vm:to_table_with_key(bent, '_isType.sling.model.ClassDeclarationNode') ~= nil) == false then
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Extending a non-class reference is not allowed", entt, nil))
										end
										if bcnt > 1 then
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Extending multiple classes is not allowed", entt, nil))
										end
										do bcnt = bcnt + 1 end
									elseif bstp:getInheritType() == _g.sling.model.BaseTypeNode.INHERIT_IMPLEMENT then
										if (_vm:to_table_with_key(bent, '_isType.sling.model.InterfaceDeclarationNode') ~= nil) == false then
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Implementing a non-interface reference is not allowed", entt, nil))
										end
									end
								end
								do n2 = n2 + 1 end
							end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingOps:validateExpressionsInStaticDeclarations(ctx, resolver, root)
	do _g.sling.util.NodeFinder:visitAllNodes(root, function(node)
		local fdec = _vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationNode')
		if not (fdec ~= nil) then
			do return end
		end
		if not _g.sling.util.ModifierUtil:hasCommonModifier(fdec, _g.sling.model.Modifier.STATIC) then
			do return end
		end
		do _g.sling.util.NodeFinder:visitAllNodes(fdec, function(expr)
			if (_vm:to_table_with_key(expr, '_isType.sling.model.BaseClassAccessExpressionNode') ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Accessing the `base class' in a static context is not allowed.", expr, nil))
			end
			if (_vm:to_table_with_key(expr, '_isType.sling.model.CurrentObjectExpressionNode') ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Accessing the `current object' in a static context is not allowed.", expr, nil))
			end
			if (_vm:to_table_with_key(expr, '_isType.sling.model.SymbolExpressionNode') ~= nil) then
				local bind = _g.sling.util.SymbolUtil:tryGetSymbolBindingForExpression(expr)
				if (_vm:to_table_with_key(bind, '_isType.sling.model.VariableDeclarationNode') ~= nil) == false and (_vm:to_table_with_key(bind, '_isType.sling.model.FunctionDeclarationNode') ~= nil) == false then
					do return end
				end
				if _g.sling.util.ModifierUtil:hasCommonModifier(bind, _g.sling.model.Modifier.STATIC) then
					do return end
				end
				if (_vm:to_table_with_key(bind, '_isType.sling.model.VariableDeclarationNode') ~= nil) and (_vm:to_table_with_key(bind:getParent(), '_isType.sling.model.EntityDeclarationNode') ~= nil) == false then
					do return end
				end
				if (_vm:to_table_with_key(expr:getParent(), '_isType.sling.model.MemberAccessExpressionNode') ~= nil) then
					local prev = _g.sling.model.MemberAccessExpressionNode:getPreviousNode(expr)
					if prev ~= nil then
						if (_vm:to_table_with_key(prev, '_isType.sling.model.CreateObjectExpressionNode') ~= nil) then
							do return end
						end
						if (_vm:to_table_with_key(prev, '_isType.sling.model.SymbolExpressionNode') ~= nil) then
							local pbnd = _g.sling.util.SymbolUtil:tryGetSymbolBindingForExpression(prev)
							if pbnd ~= nil and (_vm:to_table_with_key(pbnd, '_isType.sling.model.EntityDeclarationNode') ~= nil) == false then
								do return end
							end
						else
							do return end
						end
					end
				end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Accessing a non-static symbol in a static context is not allowed.", expr, nil):addRelatedMessage("Symbol references to this", bind))
			end
		end) end
	end) end
end

function sling.compiler.SlingOps:expandFailureLiterals(ctx, node, resolver)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.FailureLiteralExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local nn = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FailureLiteralExpressionNode')
				if nn ~= nil then
					local pp = nn:getParent()
					if (_vm:to_table_with_key(pp, '_isType.sling.model.ReturnStatementNode') ~= nil) and pp:getExpression() == nn then
						local ff = _g.sling.util.FindUtil:findNearestFunction(nn)
						if not (ff ~= nil) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No enclosing function", nn, nil))
						end
						do
							local dt = ff:getReturnType()
							if dt == nil or (_vm:to_table_with_key(dt, '_isType.sling.model.VoidDataTypeNode') ~= nil) then
								do nn:remove() end
							else
								local lit = nil
								if (_vm:to_table_with_key(dt, '_isType.sling.model.BooleanDataTypeNode') ~= nil) then
									lit = _g.sling.model.BooleanLiteralExpressionNode:forValue(false)
								elseif (_vm:to_table_with_key(dt, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
									if resolver ~= nil then
										do resolver:resolveDataType(dt) end
										do
											local binding = _g.sling.util.SymbolUtil:tryGetSymbolBinding(dt:getSymbol())
											if binding ~= nil and (_vm:to_table_with_key(binding, '_isType.sling.model.TemplateDeclarationNode') ~= nil) then
												lit = _g.sling.model.DataTypeDefaultValueExpressionNode:forType(_g.sling.util.DataTypeUtil:dupAsDataType(dt))
											else
												lit = _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create())
											end
										end
									else
										lit = _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create())
									end
								elseif (_vm:to_table_with_key(dt, '_isType.sling.model.FunctionDataTypeNode') ~= nil) then
									lit = _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create())
								elseif (_vm:to_table_with_key(dt, '_isType.sling.model.VectorDataTypeNode') ~= nil) or (_vm:to_table_with_key(dt, '_isType.sling.model.MapDataTypeNode') ~= nil) or (_vm:to_table_with_key(dt, '_isType.sling.model.SetDataTypeNode') ~= nil) or (_vm:to_table_with_key(dt, '_isType.sling.model.ExceptionDataTypeNode') ~= nil) or (_vm:to_table_with_key(dt, '_isType.sling.model.StaticArrayDataTypeNode') ~= nil) or (_vm:to_table_with_key(dt, '_isType.sling.model.ObjectDataTypeNode') ~= nil) or (_vm:to_table_with_key(dt, '_isType.sling.model.StringDataTypeNode') ~= nil) or (_vm:to_table_with_key(dt, '_isType.sling.model.DynamicDataTypeNode') ~= nil) or (_vm:to_table_with_key(dt, '_isType.sling.model.BufferDataTypeNode') ~= nil) then
									lit = _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create())
								elseif (_vm:to_table_with_key(dt, '_isType.sling.model.CharacterDataTypeNode') ~= nil) then
									lit = _g.sling.model.CharacterLiteralExpressionNode:forValue(0)
								elseif (_vm:to_table_with_key(dt, '_isType.sling.model.FloatDataTypeNode') ~= nil) then
									lit = _g.sling.model.FloatLiteralExpressionNode:forValue(0.0)
								elseif (_vm:to_table_with_key(dt, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
									lit = _g.sling.model.DoubleLiteralExpressionNode:forValue(0.0)
								elseif (_vm:to_table_with_key(dt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
									lit = _g.sling.model.IntegerLiteralExpressionNode:forValue(0)
									do
										local dttype = dt:getType()
										if dttype ~= 0 then
											local cast = _g.sling.model.StaticCastExpressionNode._construct0(_g.sling.model.StaticCastExpressionNode._create())
											do cast:setCastType(_g.sling.model.StaticCastExpressionNode.TYPE_PRIMITIVE) end
											do cast:setExpression(lit, false) end
											do cast:setType(_g.sling.util.DataTypeUtil:dupAsDataType(dt), false) end
											lit = cast
										end
									end
								else
									lit = _g.sling.model.IntegerLiteralExpressionNode:forValue(0)
								end
								do nn:replaceWith(lit, false) end
							end
							goto _continue37
						end
					end
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported context for failure literal", nn, nil))
				end
				::_continue37::
				do n = n + 1 end
			end
		end
	end
end

sling.compiler.LibraryManager = {}
sling.compiler.LibraryManager.__index = sling.compiler.LibraryManager
_vm:set_metatable(sling.compiler.LibraryManager, {})

function sling.compiler.LibraryManager._create()
	local v = _vm:set_metatable({}, sling.compiler.LibraryManager)
	return v
end

function sling.compiler.LibraryManager:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.LibraryManager'
	self['_isType.sling.compiler.LibraryManager'] = true
	self.directory = nil
	self.forcedLibraryVersions = {}
end

function sling.compiler.LibraryManager:_construct0()
	sling.compiler.LibraryManager._init(self)
	return self
end

function sling.compiler.LibraryManager:substituteCustomLibraries(libraries, customlibs)
	if _g.jk.lang.Vector:isEmpty(customlibs) then
		do return libraries end
	end
	do
		local v = {}
		local used = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
		if libraries ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(libraries)
			do
				n = 0
				while n < m do
					local lib = (function(o)
						if (_vm:get_variable_type(o) == 'string') then
							do return o end
						end
						do return nil end
					end)(libraries[n + 1])
					if lib ~= nil then
						local library = lib
						local libname = _g.sling.compiler.LibraryName:parse(library)
						if libname ~= nil then
							if customlibs ~= nil then
								local n2 = 0
								local m2 = _g.jk.lang.Vector:getSize(customlibs)
								do
									n2 = 0
									while n2 < m2 do
										local clibname = customlibs[n2 + 1]
										if clibname ~= nil then
											if libname:getNamespace() == clibname:getNamespace() and libname:getName() == clibname:getName() then
												library = clibname:toString()
												do used:add(library) end
												do break end
											end
										end
										do n2 = n2 + 1 end
									end
								end
							end
						end
						do _g.jk.lang.Vector:append(v, library) end
					end
					do n = n + 1 end
				end
			end
		end
		if customlibs ~= nil then
			local n3 = 0
			local m3 = _g.jk.lang.Vector:getSize(customlibs)
			do
				n3 = 0
				while n3 < m3 do
					local clibname = customlibs[n3 + 1]
					if clibname ~= nil then
						local customlib = clibname:toString()
						if not used:contains(customlib) then
							do _g.jk.lang.Vector:append(v, customlib) end
						end
					end
					do n3 = n3 + 1 end
				end
			end
		end
		do return v end
	end
end

function sling.compiler.LibraryManager:getPlatformName()
end

function sling.compiler.LibraryManager:getLinkTargetFile(directory, moduleName)
end

function sling.compiler.LibraryManager:getLibraryDirectory()
	if not (self.directory ~= nil) then
		do return nil end
	end
	do
		local pname = self:getPlatformName()
		if not _g.jk.lang.String:isNotEmpty(pname) then
			do return nil end
		end
		do return self.directory:entry(pname) end
	end
end

function sling.compiler.LibraryManager:setForcedLibraryVersion(id, version)
	if not (id ~= nil) then
		do return end
	end
	self.forcedLibraryVersions[id] = version
end

sling.compiler.LibraryManager.RepositoryUrl = {}
sling.compiler.LibraryManager.RepositoryUrl.__index = sling.compiler.LibraryManager.RepositoryUrl
_vm:set_metatable(sling.compiler.LibraryManager.RepositoryUrl, {})

function sling.compiler.LibraryManager.RepositoryUrl._create()
	local v = _vm:set_metatable({}, sling.compiler.LibraryManager.RepositoryUrl)
	return v
end

function sling.compiler.LibraryManager.RepositoryUrl:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.LibraryManager.RepositoryUrl'
	self['_isType.sling.compiler.LibraryManager.RepositoryUrl'] = true
	self.url = nil
	self.authKey = nil
end

function sling.compiler.LibraryManager.RepositoryUrl:_construct0()
	sling.compiler.LibraryManager.RepositoryUrl._init(self)
	return self
end

function sling.compiler.LibraryManager.RepositoryUrl:forUrlString(str)
	local v = _g.sling.compiler.LibraryManager.RepositoryUrl._construct0(_g.sling.compiler.LibraryManager.RepositoryUrl._create())
	local uu = _g.jk.url.URL:forString(str, false)
	local username = uu:getUsername()
	if _g.jk.lang.String:isNotEmpty(username) then
		do uu:setUsername(nil) end
		do uu:setPassword(nil) end
		do v:setUrl(uu:toString()) end
		do v:setAuthKey(username) end
	else
		do v:setUrl(str) end
		do v:setAuthKey(nil) end
	end
	do return v end
end

function sling.compiler.LibraryManager.RepositoryUrl:getUrl()
	do return self.url end
end

function sling.compiler.LibraryManager.RepositoryUrl:setUrl(v)
	self.url = v
	do return self end
end

function sling.compiler.LibraryManager.RepositoryUrl:getAuthKey()
	do return self.authKey end
end

function sling.compiler.LibraryManager.RepositoryUrl:setAuthKey(v)
	self.authKey = v
	do return self end
end

function sling.compiler.LibraryManager:readRepositoryConfigFile(ctx, map)
	if not (map ~= nil) then
		do return nil end
	end
	if not map:isFile() then
		do _g.jk.log.Log:debug(ctx, "Repository map does not exist: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(map)) .. "'") end
		do return nil end
	end
	do _g.jk.log.Log:debug(ctx, "Reading repository map: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(map)) .. "'") end
	do
		local mapdata = _vm:to_table_with_key(_g.jk.json.JSONParser:parseFile(map), '_isType.jk.lang.DynamicMap')
		if not (mapdata ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to read repository map: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(map)) .. "'", nil, nil))
		end
		do return mapdata end
	end
end

function sling.compiler.LibraryManager:getDefaultRepositoryUrls(urls)
	local url1 = _g.sling.compiler.LibraryManager.RepositoryUrl._construct0(_g.sling.compiler.LibraryManager.RepositoryUrl._create())
	do url1:setUrl("https://files.eqela.com/sling/libs/%s_%n_%v_%p.slib") end
	do _g.jk.lang.Vector:append(urls, url1) end
end

function sling.compiler.LibraryManager:getHubRepositoryUrls(urls)
	local token = _g.jk.env.EnvironmentVariable:get("SLING_SLIB_TOKEN")
	if _g.jk.lang.String:isNotEmpty(token) then
		local uu = _g.sling.compiler.LibraryManager.RepositoryUrl._construct0(_g.sling.compiler.LibraryManager.RepositoryUrl._create())
		do uu:setUrl("https://hub.eqela.com/download?type=slib&vendor=%s&name=%n&version=%v&platform=%p") end
		do uu:setAuthKey(token) end
		do _g.jk.lang.Vector:append(urls, uu) end
	end
end

function sling.compiler.LibraryManager:getRepositoryUrls(ctx)
	local v = {}
	local isFinal = false
	local ev = _g.jk.env.EnvironmentVariable:get("SLING_REPOSITORY_URLS")
	if _g.jk.lang.String:isNotEmpty(ev) then
		local array = _g.jk.lang.String:split(ev, 32, 0)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local url = array[n + 1]
					if url ~= nil then
						if url == "final" then
							isFinal = true
							do break end
						end
						if _g.jk.lang.String:isNotEmpty(url) then
							do _g.jk.lang.Vector:append(v, _g.sling.compiler.LibraryManager.RepositoryUrl:forUrlString(url)) end
						end
					end
					do n = n + 1 end
				end
			end
		end
	end
	if not isFinal and self.directory ~= nil then
		local slon = self.directory:entry("repositories.slon")
		if slon:isFile() then
			local list = _vm:to_table_with_key(_g.jk.slon.SLONParser:parseFile(slon), '_isType.jk.lang.DynamicVector')
			if not (list ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to read repository list: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(slon)) .. "'", nil, nil))
			end
			do
				local array2 = list:toVector()
				if array2 ~= nil then
					local n2 = 0
					local m2 = _g.jk.lang.Vector:getSize(array2)
					do
						n2 = 0
						while n2 < m2 do
							local url = array2[n2 + 1]
							if url ~= nil then
								local urls = _g.jk.lang.String:asString(url)
								if not (urls ~= nil) then
									goto _continue38
								end
								if urls == "final" then
									isFinal = true
									do break end
								end
								do _g.jk.lang.Vector:append(v, _g.sling.compiler.LibraryManager.RepositoryUrl:forUrlString(urls)) end
							end
							::_continue38::
							do n2 = n2 + 1 end
						end
					end
				end
			end
		end
	end
	if not isFinal and self.directory ~= nil then
		local json = self.directory:entry("repositories.json")
		local mapdata = self:readRepositoryConfigFile(ctx, json)
		if mapdata ~= nil then
			local array3 = mapdata:getKeys()
			if array3 ~= nil then
				local n3 = 0
				local m3 = _g.jk.lang.Vector:getSize(array3)
				do
					n3 = 0
					while n3 < m3 do
						local name = array3[n3 + 1]
						if name ~= nil then
							local repo = mapdata:getDynamicMap(name)
							if repo ~= nil then
								local urls = repo:getDynamicMap(self:getPlatformName())
								if not (urls ~= nil) then
									urls = repo:getDynamicMap("default")
								end
								if urls ~= nil then
									local uu = urls:getString("url", nil)
									if _g.jk.lang.String:isNotEmpty(uu) then
										local url = _g.sling.compiler.LibraryManager.RepositoryUrl._construct0(_g.sling.compiler.LibraryManager.RepositoryUrl._create())
										do url:setUrl(uu) end
										do url:setAuthKey(urls:getString("authKey", nil)) end
										do _g.jk.lang.Vector:append(v, url) end
									else
										local uus = urls:getDynamicVector("urls")
										if uus ~= nil then
											local array4 = uus:toVectorOfStrings()
											if array4 ~= nil then
												local n4 = 0
												local m4 = _g.jk.lang.Vector:getSize(array4)
												do
													n4 = 0
													while n4 < m4 do
														local uu = array4[n4 + 1]
														if uu ~= nil then
															if _g.jk.lang.String:isNotEmpty(uu) then
																local url = _g.sling.compiler.LibraryManager.RepositoryUrl._construct0(_g.sling.compiler.LibraryManager.RepositoryUrl._create())
																do url:setUrl(uu) end
																do url:setAuthKey(urls:getString("authKey", nil)) end
																do _g.jk.lang.Vector:append(v, url) end
															end
														end
														do n4 = n4 + 1 end
													end
												end
											end
										end
									end
									if urls:getBoolean("final", false) == true then
										isFinal = true
										do break end
									end
								end
							end
						end
						do n3 = n3 + 1 end
					end
				end
			end
		end
	end
	if not isFinal then
		do self:getDefaultRepositoryUrls(v) end
		do self:getHubRepositoryUrls(v) end
	end
	if v ~= nil then
		local n5 = 0
		local m5 = _g.jk.lang.Vector:getSize(v)
		do
			n5 = 0
			while n5 < m5 do
				local url = v[n5 + 1]
				if url ~= nil then
					do _g.jk.log.Log:debug(ctx, "Repository URL: `" .. _g.jk.lang.String:safeString(url:getUrl()) .. "'") end
				end
				do n5 = n5 + 1 end
			end
		end
	end
	do return v end
end

function sling.compiler.LibraryManager:isInstalled(libid)
	local directory = self:getLibraryDirectory()
	if not (directory ~= nil) then
		do return false end
	end
	do
		local name = _g.sling.compiler.LibraryName:parse(libid)
		if not (name ~= nil) then
			do return false end
		end
		do
			local dir = directory:entry(name:getNamespace()):entry(name:getName()):entry(name:getVersion())
			do return dir:isDirectory() end
		end
	end
end

function sling.compiler.LibraryManager:getLibraryFileManifest(file)
	if not (file ~= nil) then
		do return nil end
	end
	do
		local reader = _g.jk.archive.ZipReader:forFile(file)
		if not (reader ~= nil) then
			do return nil end
		end
		do
			local entries = reader:getEntries()
			if not (entries ~= nil) then
				do return nil end
			end
			do
				local v = nil
				if entries ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(entries)
					do
						n = 0
						while n < m do
							local entry = entries[n + 1]
							if entry ~= nil then
								if entry:getName() == "slib.manifest" then
									local data = entry:getContentsUTF8()
									if data ~= nil then
										v = _vm:to_table_with_key(_g.jk.json.JSONParser:parse(data), '_isType.jk.lang.DynamicMap')
									end
									do break end
								end
							end
							do n = n + 1 end
						end
					end
				end
				do reader:close() end
				do return v end
			end
		end
	end
end

function sling.compiler.LibraryManager:installLibraryFromFile(ctx, file, overwrite)
	local directory = self:getLibraryDirectory()
	if not (directory ~= nil) then
		do _g.jk.log.Log:error(ctx, "LibraryManager: null directory") end
		do return false end
	end
	if not (file ~= nil) then
		do _g.jk.log.Log:error(ctx, "LibraryManager: null file to install") end
		do return false end
	end
	do _g.jk.log.Log:debug(ctx, "Installing library file: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'") end
	do
		local manifest = self:getLibraryFileManifest(file)
		if not (manifest ~= nil) then
			do _g.jk.log.Log:error(ctx, "Library file in incorrect format: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'") end
			do return false end
		end
		do
			local namespace = manifest:getString("namespace", nil)
			local name = manifest:getString("name", nil)
			local version = manifest:getString("version", nil)
			if not _g.jk.lang.String:isNotEmpty(namespace) then
				do _g.jk.log.Log:error(ctx, "Library does not have namespace: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'") end
				do return false end
			end
			if not _g.jk.lang.String:isNotEmpty(name) then
				do _g.jk.log.Log:error(ctx, "Library does not have name: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'") end
				do return false end
			end
			if not _g.jk.lang.String:isNotEmpty(version) then
				do _g.jk.log.Log:error(ctx, "Library does not have version: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'") end
				do return false end
			end
			do
				local output = directory:entry(namespace):entry(name):entry(version)
				if output:exists() then
					if overwrite then
						do _g.jk.log.Log:debug(ctx, "Library already installed: `" .. _g.jk.lang.String:safeString(output:getPath()) .. "'. Removing previously installed version.") end
						do output:removeRecursive() end
					else
						do _g.jk.log.Log:error(ctx, "Library already installed: `" .. _g.jk.lang.String:safeString(namespace) .. ":" .. _g.jk.lang.String:safeString(name) .. ":" .. _g.jk.lang.String:safeString(version) .. "'") end
						do return false end
					end
				end
				do _g.jk.log.Log:status(ctx, "[Installing] " .. _g.jk.lang.String:safeString(file:getPath()) .. " .. ") end
				do
					local r = _g.jk.archive.ZipReader:extractZipFileToDirectory(file, output, function(file)
						do _g.jk.log.Log:status(ctx, "[Installing] " .. _g.jk.lang.String:safeString(file:getPath())) end
					end)
					do _g.jk.log.Log:status(ctx, nil) end
					if not r then
						do _g.jk.log.Log:error(ctx, "Failed to install library file: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'") end
						do return false end
					end
					do _g.jk.log.Log:info(ctx, "Library installed: `" .. _g.jk.lang.String:safeString(namespace) .. ":" .. _g.jk.lang.String:safeString(name) .. ":" .. _g.jk.lang.String:safeString(version) .. "'") end
					do return true end
				end
			end
		end
	end
end

function sling.compiler.LibraryManager:installLibraryFromBuffer(ctx, buffer, overwrite)
	local file = _g.jk.env.TemporaryFile:create(nil)
	if not (file ~= nil) then
		do _g.jk.log.Log:error(ctx, "Failed to create a temporary file!") end
		do return false end
	end
	if not file:setContentsBuffer(buffer) then
		do _g.jk.log.Log:error(ctx, "Failed to write to file: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'") end
		do file:remove() end
		do return false end
	end
	do
		local v = self:installLibraryFromFile(ctx, file, overwrite)
		do file:remove() end
		do return v end
	end
end

function sling.compiler.LibraryManager:installLibraryById(ctx, libid, force)
	if force == false and self:isInstalled(libid) then
		do _g.jk.log.Log:error(ctx, "Library already installed: `" .. _g.jk.lang.String:safeString(libid) .. "'") end
		do return false end
	end
	do
		local name = _g.sling.compiler.LibraryName:parse(libid)
		if not (name ~= nil) then
			do _g.jk.log.Log:error(ctx, "Invalid library identifier: `" .. _g.jk.lang.String:safeString(libid) .. "'") end
			do return false end
		end
		do _g.jk.log.Log:debug(ctx, "Installing library by identifier: `" .. _g.jk.lang.String:safeString(libid) .. "'") end
		do
			local client = _g.jk.http.client.CustomWebClient._construct0(_g.jk.http.client.CustomWebClient._create())
			local array = self:getRepositoryUrls(ctx)
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local repo = array[n + 1]
						if repo ~= nil then
							local url = repo:getUrl()
							if _g.jk.lang.String:isEmpty(url) then
								goto _continue39
							end
							if _g.jk.lang.String:getIndexOfCharacter(url, 37, 0) < 0 then
								if _g.jk.lang.String:endsWith(url, "/") == false then
									url = _g.jk.lang.String:safeString(url) .. "/"
								end
								url = _g.jk.lang.String:safeString(url) .. "%s/%n/%v/%p"
							end
							url = _g.jk.lang.String:replaceString(url, "%s", _g.jk.url.URLEncoder:encode(name:getNamespace(), false, true))
							url = _g.jk.lang.String:replaceString(url, "%n", _g.jk.url.URLEncoder:encode(name:getName(), false, true))
							url = _g.jk.lang.String:replaceString(url, "%v", _g.jk.url.URLEncoder:encode(name:getVersion(), false, true))
							url = _g.jk.lang.String:replaceString(url, "%p", _g.jk.url.URLEncoder:encode(self:getPlatformName(), false, true))
							do
								local status = nil
								local data = nil
								local hdrs = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
								local auth = repo:getAuthKey()
								if _g.jk.lang.String:isNotEmpty(auth) then
									do hdrs:add("Authorization", "Bearer " .. _g.jk.lang.String:safeString(auth)) end
								end
								do _g.jk.log.Log:debug(ctx, "Trying to retrieve URL: `" .. _g.jk.lang.String:safeString(url) .. "' ..") end
								do _g.jk.log.Log:status(ctx, "[Downloading] " .. _g.jk.lang.String:safeString(url) .. " .. ") end
								do client:query("GET", url, hdrs, nil, function(rstatus, rheaders, rdata)
									status = rstatus
									data = rdata
								end) end
								do _g.jk.log.Log:status(ctx, nil) end
								if status == "200" and data ~= nil then
									do _g.jk.log.Log:debug(ctx, "Successfully downloaded: `" .. _g.jk.lang.String:safeString(url) .. "'") end
									if not self:installLibraryFromBuffer(ctx, data, force) then
										do _g.jk.log.Log:error(ctx, "Failed to install downloaded library: `" .. _g.jk.lang.String:safeString(libid) .. "'") end
										do return false end
									end
									do return true end
								else
									do _g.jk.log.Log:debug(ctx, "Download failed: `" .. _g.jk.lang.String:safeString(url) .. "', response status=`" .. _g.jk.lang.String:safeString(status) .. "'") end
								end
							end
						end
						::_continue39::
						do n = n + 1 end
					end
				end
			end
			do _g.jk.log.Log:error(ctx, "Unable to find and install library: `" .. _g.jk.lang.String:safeString(libid) .. "'") end
			do return false end
		end
	end
end

function sling.compiler.LibraryManager:isOlderCompatibleVersion(thisVersion, processedVersion)
	if not (thisVersion ~= nil) then
		do return false end
	end
	if not (processedVersion ~= nil) then
		do return false end
	end
	if processedVersion == "local" then
		do return true end
	end
	do
		local acomps = _g.jk.lang.String:split(thisVersion, 46, 0)
		local sz = _g.jk.lang.Vector:getSize(acomps)
		if sz ~= 3 then
			do return false end
		end
		do
			local bcomps = _g.jk.lang.String:split(processedVersion, 46, 0)
			if _g.jk.lang.Vector:getSize(bcomps) ~= sz then
				do return false end
			end
			if not (_g.jk.lang.Vector:get(acomps, 0) == _g.jk.lang.Vector:get(bcomps, 0)) then
				do return false end
			end
			do
				local an2 = _g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(acomps, 1))
				local bn2 = _g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(bcomps, 1))
				if an2 < bn2 then
					do return true end
				end
				if an2 > bn2 then
					do return false end
				end
				do
					local an1 = _g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(acomps, 2))
					local bn1 = _g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(bcomps, 2))
					if an1 < bn1 then
						do return true end
					end
					do return false end
				end
			end
		end
	end
end

function sling.compiler.LibraryManager:isNewerCompatibleVersion(thisVersion, processedVersion)
	if not (thisVersion ~= nil) then
		do return false end
	end
	if not (processedVersion ~= nil) then
		do return false end
	end
	if thisVersion == "local" then
		do return true end
	end
	do
		local acomps = _g.jk.lang.String:split(thisVersion, 46, 0)
		local sz = _g.jk.lang.Vector:getSize(acomps)
		if sz ~= 3 then
			do return false end
		end
		do
			local bcomps = _g.jk.lang.String:split(processedVersion, 46, 0)
			if _g.jk.lang.Vector:getSize(bcomps) ~= sz then
				do return false end
			end
			if not (_g.jk.lang.Vector:get(acomps, 0) == _g.jk.lang.Vector:get(bcomps, 0)) then
				do return false end
			end
			do
				local an2 = _g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(acomps, 1))
				local bn2 = _g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(bcomps, 1))
				if an2 > bn2 then
					do return true end
				end
				if an2 < bn2 then
					do return false end
				end
				do
					local an1 = _g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(acomps, 2))
					local bn1 = _g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(bcomps, 2))
					if an1 > bn1 then
						do return true end
					end
					do return false end
				end
			end
		end
	end
end

function sling.compiler.LibraryManager:processRequiredLibraryToVector(ctx, alibname, results, resultVector, processed)
	local directory = self:getLibraryDirectory()
	if not (directory ~= nil) then
		do return false end
	end
	do
		local libname = alibname
		local name = _g.sling.compiler.LibraryName:parse(libname)
		if not (name ~= nil) then
			do _g.jk.log.Log:error(ctx, "Invalid library identifier: `" .. _g.jk.lang.String:safeString(libname) .. "'") end
			do return false end
		end
		do
			local id = _g.jk.lang.String:safeString(name:getNamespace()) .. ":" .. _g.jk.lang.String:safeString(name:getName())
			local forcedVersion = _g.jk.lang.Map:get(self.forcedLibraryVersions, id)
			if forcedVersion ~= nil then
				libname = _g.jk.lang.String:safeString(id) .. ":" .. _g.jk.lang.String:safeString(forcedVersion)
				if not ((function()
					name = _g.sling.compiler.LibraryName:parse(libname)
					do return name end
				end)() ~= nil) then
					do _g.jk.log.Log:error(ctx, "Invalid forced library identifier: `" .. _g.jk.lang.String:safeString(libname) .. "'") end
					do return false end
				end
				do _g.jk.log.Log:debug(ctx, "Forced library version `" .. _g.jk.lang.String:safeString(name:toString()) .. "' for original library `" .. _g.jk.lang.String:safeString(alibname) .. "'") end
			end
			do
				local processedVersion = _g.jk.lang.Map:get(processed, id)
				if processedVersion ~= nil then
					local thisVersion = name:getVersion()
					if processedVersion == thisVersion then
						do return true end
					end
					if self:isOlderCompatibleVersion(thisVersion, processedVersion) then
						do return true end
					end
					if self:isNewerCompatibleVersion(thisVersion, processedVersion) then
					else
						do _g.jk.log.Log:error(ctx, "Incompatible versions of library `" .. _g.jk.lang.String:safeString(id) .. "' required: `" .. _g.jk.lang.String:safeString(thisVersion) .. "' and `" .. _g.jk.lang.String:safeString(processedVersion) .. "'") end
						do return false end
					end
				end
				do
					local dir = directory:entry(name:getNamespace()):entry(name:getName()):entry(name:getVersion())
					if not dir:isDirectory() then
						if not self:installLibraryById(ctx, libname, false) then
							do _g.jk.log.Log:error(ctx, "Failed to install required library: `" .. _g.jk.lang.String:safeString(libname) .. "'") end
							do return false end
						end
					end
					if not dir:isDirectory() then
						do _g.jk.log.Log:error(ctx, "Library not found: `" .. _g.jk.lang.String:safeString(libname) .. "'") end
						do return false end
					end
					do _g.jk.lang.Map:set(processed, id, name:getVersion()) end
					if results ~= nil then
						results[id] = dir
					end
					do
						local mf = dir:entry("slib.manifest")
						if mf:isFile() then
							local manifest = _vm:to_table_with_key(_g.jk.json.JSONParser:parse(mf), '_isType.jk.lang.DynamicMap')
							if not (manifest ~= nil) then
								do _g.jk.log.Log:error(ctx, "Failed to parse manifest: `" .. _g.jk.lang.String:safeString(mf:getPath()) .. "'") end
								do return false end
							end
							do
								local libraries = manifest:getDynamicVector("libraries")
								if libraries ~= nil then
									local array = libraries:toVectorOfStrings()
									if array ~= nil then
										local n = 0
										local m = _g.jk.lang.Vector:getSize(array)
										do
											n = 0
											while n < m do
												local library = array[n + 1]
												if library ~= nil then
													if not self:processRequiredLibraryToVector(ctx, library, results, resultVector, processed) then
														do return false end
													end
												end
												do n = n + 1 end
											end
										end
									end
								end
							end
						end
						if resultVector ~= nil then
							do _g.jk.lang.Vector:append(resultVector, dir) end
						end
						do return true end
					end
				end
			end
		end
	end
end

function sling.compiler.LibraryManager:processRequiredLibraries(ctx, libnames)
	local vmap = {}
	local processed = {}
	local v = {}
	if libnames ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(libnames)
		do
			n = 0
			while n < m do
				local libname = (function(o)
					if (_vm:get_variable_type(o) == 'string') then
						do return o end
					end
					do return nil end
				end)(libnames[n + 1])
				if libname ~= nil then
					if not self:processRequiredLibraryToVector(ctx, libname, vmap, v, processed) then
						do return nil end
					end
				end
				do n = n + 1 end
			end
		end
	end
	if v ~= nil then
		local n2 = 0
		local m2 = _g.jk.lang.Vector:getSize(v)
		do
			n2 = 0
			while n2 < m2 do
				local libdir = v[n2 + 1]
				if libdir ~= nil then
					do _g.jk.log.Log:debug(ctx, "Required library found in path: `" .. _g.jk.lang.String:safeString(libdir:getPath()) .. "'") end
				end
				do n2 = n2 + 1 end
			end
		end
	end
	do return v end
end

function sling.compiler.LibraryManager:readDependencyFile(file)
	if not (file ~= nil) then
		do return nil end
	end
	do return file:readLinesVector() end
end

function sling.compiler.LibraryManager:generateModuleInfosForLibdirs(ctx, libdirs)
	local v = {}
	if libdirs ~= nil then
		local n = 0
		local m2 = _g.jk.lang.Vector:getSize(libdirs)
		do
			n = 0
			while n < m2 do
				local libdir = libdirs[n + 1]
				if libdir ~= nil then
					local entries = libdir:entries()
					if not (entries ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to read directory: `" .. _g.jk.lang.String:safeString(libdir:getPath()) .. "'", nil, nil))
					end
					while true do
						local f = entries:next()
						if not (f ~= nil) then
							do break end
						end
						if f:hasExtension("sling") then
							local moduleName = f:getBasenameWithoutExtension()
							local apifile = f
							local linkTarget = self:getLinkTargetFile(f:getParent(), moduleName)
							local depfile = f:getSibling(_g.jk.lang.String:safeString(moduleName) .. ".deps")
							if linkTarget ~= nil and linkTarget:exists() and apifile:isFile() and depfile:isFile() then
								local timestamp = depfile:getLastModifiedTimeStamp()
								local dependencies = self:readDependencyFile(depfile)
								local m = _g.sling.compiler.LinkableModuleInfo._construct0(_g.sling.compiler.LinkableModuleInfo._create())
								do m:setModuleId(moduleName) end
								do m:setLinkTarget(linkTarget) end
								do m:setTimestamp(timestamp) end
								do m:setApifile(apifile) end
								do m:setDepfile(depfile) end
								do m:setDependencies(dependencies) end
								do _g.jk.lang.Vector:append(v, m) end
							end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function sling.compiler.LibraryManager:generateModuleInfosForBuild(ctx, dirs, customlibs)
	local libnames = {}
	if dirs ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(dirs)
		do
			n = 0
			while n < m do
				local dir = dirs[n + 1]
				if dir ~= nil then
					local pling = dir:entry("project.slon")
					if not pling:isFile() then
						pling = dir:entry("project.pling")
					end
					if not pling:isFile() then
						goto _continue40
					end
					do
						local pdata = _g.sling.parser.PlingParser._construct1(_g.sling.parser.PlingParser._create(), ctx):parseFileAsUnitSettings(pling, nil, nil)
						if not (pdata ~= nil) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to read project file: `" .. _g.jk.lang.String:safeString(pling:getPath()) .. "'", nil, nil))
						end
						do
							local libraries = pdata:getLibraries()
							if _g.jk.lang.Vector:isNotEmpty(libraries) then
								if libraries ~= nil then
									local n2 = 0
									local m2 = _g.jk.lang.Vector:getSize(libraries)
									do
										n2 = 0
										while n2 < m2 do
											local libname = libraries[n2 + 1]
											if libname ~= nil then
												do _g.jk.lang.Vector:append(libnames, libname) end
											end
											do n2 = n2 + 1 end
										end
									end
								end
							end
						end
					end
				end
				::_continue40::
				do n = n + 1 end
			end
		end
	end
	libnames = _g.sling.compiler.LibraryManager:substituteCustomLibraries(libnames, customlibs)
	do
		local libdirs = self:processRequiredLibraries(ctx, libnames)
		if not (libdirs ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to process library dependencies", nil, nil))
		end
		do return self:generateModuleInfosForLibdirs(ctx, libdirs) end
	end
end

function sling.compiler.LibraryManager:getDirectory()
	do return self.directory end
end

function sling.compiler.LibraryManager:setDirectory(v)
	self.directory = v
	do return self end
end

sling.compiler.ForEachHandler = {}
sling.compiler.ForEachHandler.__index = sling.compiler.ForEachHandler
_vm:set_metatable(sling.compiler.ForEachHandler, {})

function sling.compiler.ForEachHandler._create()
	local v = _vm:set_metatable({}, sling.compiler.ForEachHandler)
	return v
end

function sling.compiler.ForEachHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.ForEachHandler'
	self['_isType.sling.compiler.ForEachHandler'] = true
end

function sling.compiler.ForEachHandler:_construct0()
	sling.compiler.ForEachHandler._init(self)
	return self
end

function sling.compiler.ForEachHandler:setInitializer(vdec, init, tr)
	if not (vdec ~= nil) then
		do return end
	end
	do
		local type = vdec:getType()
		if not (type ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Variable has no data type", vdec, nil))
		end
		if type ~= nil and (_vm:to_table_with_key(type, '_isType.sling.model.AutomaticDataTypeNode') ~= nil) == false then
			local xprt = _g.sling.util.ExpressionUtil:getExpressionDataType(init, tr)
			if xprt == nil or tr:isSame(xprt, type, nil) == false then
				local tdup = _g.sling.util.DataTypeUtil:dupAsDataType(type)
				init = _g.sling.model.DynamicCastExpressionNode:instance(tdup, init)
			end
		end
		do vdec:setInitializer(init, false) end
		if (_vm:to_table_with_key(type, '_isType.sling.model.AutomaticDataTypeNode') ~= nil) then
			local rdtp = _vm:to_table_with_key(tr, '_isType.sling.compiler.SlingTypeResolver'):resolveVariableType(vdec)
			do vdec:setType(_g.sling.util.DataTypeUtil:dupAsDataType(rdtp), false) end
		end
	end
end

function sling.compiler.ForEachHandler:toStaticArrayIterator(fes, tr)
	local nvarname = _g.sling.util.FunctionUtil:findUniqueVariableNameForNode(fes, "n")
	local mvarname = _g.sling.util.FunctionUtil:findUniqueVariableNameForNode(fes, "m")
	local rr = fes:getRight()
	if not (rr ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right", fes, nil))
	end
	do
		local cc = fes:getLeftCount()
		if cc < 1 then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Foreach statement has no left values", fes, nil))
		end
		do
			local array2 = fes:getLefts()
			if array2 ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array2)
				do
					n = 0
					while n < m do
						local lval = _vm:to_table_with_key(array2[n + 1], '_isType.sling.common.NodeObject')
						if lval ~= nil then
							if (_vm:to_table_with_key(lval, '_isType.sling.model.VariableDeclarationNode') ~= nil) == false then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported construct in foreach statement left values", lval, nil))
							end
						end
						do n = n + 1 end
					end
				end
			end
			do
				local v = {}
				local arrayvar = nil
				if (_vm:to_table_with_key(rr, '_isType.sling.model.SymbolExpressionNode') ~= nil) then
					arrayvar = _vm:to_table_with_key(_g.sling.util.SymbolUtil:tryGetSymbolBindingForExpression(rr), '_isType.sling.model.VariableDeclarationNode')
				end
				if arrayvar == nil then
					local avname = _g.sling.util.FunctionUtil:findUniqueVariableNameForNode(fes, "array")
					arrayvar = _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create()), avname, fes:exportRight())
					do _g.jk.lang.Vector:append(v, arrayvar) end
				end
				do
					local mblock = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
					do _g.jk.lang.Vector:append(v, _g.sling.model.IfStatementNode:instance(_g.sling.model.NotEqualsExpressionNode:forNull(_g.sling.model.SymbolExpressionNode:forBinding(arrayvar, nil)), mblock, nil)) end
					do
						local nvar = _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.IntegerDataTypeNode._construct0(_g.sling.model.IntegerDataTypeNode._create()), nvarname, nil)
						do mblock:addNode(nvar) end
						do
							local mvar = _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.IntegerDataTypeNode._construct0(_g.sling.model.IntegerDataTypeNode._create()), mvarname, _g.sling.model.GetSizeExpressionNode:forExpression(_g.sling.model.SymbolExpressionNode:forBinding(arrayvar, nil)))
							do mblock:addNode(mvar) end
							do
								local block = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
								local initializer = _g.sling.model.FlatBlockNode._construct0(_g.sling.model.FlatBlockNode._create())
								do initializer:addNode(_g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forBinding(nvar, nil), _g.sling.model.IntegerLiteralExpressionNode:forValue(0))) end
								do
									local finalizer = _g.sling.model.FlatBlockNode._construct0(_g.sling.model.FlatBlockNode._create())
									do finalizer:addNode(_g.sling.model.PostIncrementExpressionNode:forExpression(_g.sling.model.SymbolExpressionNode:forBinding(nvar, nil))) end
									do mblock:addNode(_g.sling.model.ForStatementNode:instance(initializer, _g.sling.model.LessThanExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forBinding(nvar, nil), _g.sling.model.SymbolExpressionNode:forBinding(mvar, nil)), finalizer, block)) end
									do
										local lefts = {}
										local array = _g.sling.model.SubscriptExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forBinding(arrayvar, nil), _g.sling.model.SymbolExpressionNode:forBinding(nvar, nil))
										local atype = _g.sling.util.ExpressionUtil:getExpressionDataType(array, tr)
										if atype ~= nil then
											local dval = _g.sling.util.DataTypeUtil:createDefaultValue(atype)
											if dval ~= nil then
												atype = _g.sling.util.ExpressionUtil:getExpressionDataType(dval, tr)
											end
										end
										if cc > 1 then
											local name = _g.sling.util.FunctionUtil:findUniqueVariableNameForNode(fes, "v")
											local vdecl = _g.sling.model.VariableDeclarationNode:forAutomatic(name, array)
											do block:addNode(vdecl) end
											do
												local count = 0
												local array3 = fes:exportLefts()
												if array3 ~= nil then
													local n2 = 0
													local m2 = _g.jk.lang.Vector:getSize(array3)
													do
														n2 = 0
														while n2 < m2 do
															local left = _vm:to_table_with_key(array3[n2 + 1], '_isType.sling.model.VariableDeclarationNode')
															if left ~= nil then
																local init = _g.sling.model.SubscriptExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forBinding(vdecl, nil), _g.sling.model.IntegerLiteralExpressionNode:forValue(count))
																do _g.sling.compiler.ForEachHandler:setInitializer(left, init, tr) end
																do block:addNode(left) end
																do _g.jk.lang.Vector:append(lefts, left) end
																do count = count + 1 end
															end
															do n2 = n2 + 1 end
														end
													end
												end
											end
										else
											local left = _g.sling.util.NodeUtil:exportLeftAsVariableDeclaration(fes)
											do block:addNode(left) end
											do _g.sling.compiler.ForEachHandler:setInitializer(left, array, tr) end
											do _g.jk.lang.Vector:append(lefts, left) end
										end
										do
											local ncks = nil
											if lefts ~= nil then
												local n3 = 0
												local m3 = _g.jk.lang.Vector:getSize(lefts)
												do
													n3 = 0
													while n3 < m3 do
														local left = lefts[n3 + 1]
														if left ~= nil then
															local type = left:getType()
															local dval = _g.sling.util.DataTypeUtil:createDefaultValue(type)
															if dval ~= nil then
																type = _g.sling.util.ExpressionUtil:getExpressionDataType(dval, tr)
															end
															do
																local nchk = nil
																if type == nil or (_vm:to_table_with_key(type, '_isType.sling.model.NullDataTypeNode') ~= nil) then
																	nchk = _g.sling.model.NotEqualsExpressionNode:forNull(_g.sling.model.SymbolExpressionNode:forBinding(left, nil))
																end
																if not (nchk ~= nil) then
																	goto _continue41
																end
																if ncks ~= nil then
																	ncks = _g.sling.model.LogicalAndExpressionNode:instance(ncks, nchk)
																else
																	ncks = nchk
																end
															end
														end
														::_continue41::
														do n3 = n3 + 1 end
													end
												end
											end
											do
												local cxpr = fes:exportCondition()
												if cxpr ~= nil then
													if ncks ~= nil then
														ncks = _g.sling.model.LogicalAndExpressionNode:instance(ncks, cxpr)
													else
														ncks = cxpr
													end
												end
												if ncks ~= nil then
													do block:addNode(_g.sling.model.IfStatementNode:instance(ncks, fes:exportBlock(), nil)) end
												else
													local ebb = fes:exportBlock()
													if ebb ~= nil then
														local array4 = ebb:getNodes()
														if array4 ~= nil then
															local n4 = 0
															local m4 = _g.jk.lang.Vector:getSize(array4)
															do
																n4 = 0
																while n4 < m4 do
																	local en = _vm:to_table_with_key(array4[n4 + 1], '_isType.sling.common.NodeObject')
																	if en ~= nil then
																		do block:addNode(en) end
																	end
																	do n4 = n4 + 1 end
																end
															end
														end
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
				end
			end
		end
	end
end

function sling.compiler.ForEachHandler:toCapeIterator(fes, tr)
	local rval = fes:exportRight()
	if not (rval ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right", fes, nil))
	end
	do
		local blck = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
		local vnme = _g.sling.util.FunctionUtil:findUniqueVariableNameForNode(fes, "_vl")
		local vdec = _g.sling.model.VariableDeclarationNode:forAutomatic(vnme, rval)
		do blck:addNode(vdec) end
		do
			local blk1 = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
			do blck:addNode(_g.sling.model.IfStatementNode:instance(_g.sling.model.NotEqualsExpressionNode:forNull(_g.sling.model.SymbolExpressionNode:forBinding(vdec, nil)), blk1, nil)) end
			do
				local inme = _g.sling.util.FunctionUtil:findUniqueVariableNameForNode(fes, "_it")
				local idec = _g.sling.model.VariableDeclarationNode:forAutomatic(inme, _g.sling.model.FunctionCallExpressionNode:forExpression(_g.sling.model.MemberAccessExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forBinding(vdec, nil), _g.sling.model.SymbolExpressionNode:forName("iterate"))))
				do blk1:addNode(idec) end
				do
					local blk2 = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
					local cond = _g.sling.model.LogicalAndExpressionNode:instance(_g.sling.model.NotEqualsExpressionNode:forNull(_g.sling.model.SymbolExpressionNode:forBinding(idec, nil)), _g.sling.model.FunctionCallExpressionNode:forExpression(_g.sling.model.MemberAccessExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forBinding(idec, nil), _g.sling.model.SymbolExpressionNode:forName("hasNext"))))
					do blk1:addNode(_g.sling.model.WhileStatementNode:instance(cond, blk2, nil)) end
					do
						local next = _g.sling.util.NodeUtil:exportLeftAsVariableDeclaration(fes)
						if not (next ~= nil) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left", fes, nil))
						end
						do
							local type = next:getType()
							if not (type ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("foreach left value has no type", fes, nil))
							end
							do
								local init = _g.sling.model.FunctionCallExpressionNode:forExpression(_g.sling.model.MemberAccessExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forBinding(idec, nil), _g.sling.model.SymbolExpressionNode:forName("next")))
								if type ~= nil and (_vm:to_table_with_key(type, '_isType.sling.model.AutomaticDataTypeNode') ~= nil) == false then
									init = _g.sling.model.DynamicCastExpressionNode:instance(_g.sling.util.DataTypeUtil:dupAsDataType(type), init)
								end
								do next:setInitializer(init, false) end
								do blk2:addNode(next) end
								do
									local fint = _g.sling.util.ExpressionUtil:getExpressionDataType(init, tr)
									if fint ~= nil and (_vm:to_table_with_key(fint, '_isType.sling.model.PrimitiveDataTypeNode') ~= nil) == false then
										do blk2:addNode(_g.sling.model.IfStatementNode:forStatement(_g.sling.model.EqualsExpressionNode:forNull(_g.sling.model.SymbolExpressionNode:forBinding(next, nil)), _g.sling.model.ContinueStatementNode._construct0(_g.sling.model.ContinueStatementNode._create()))) end
									end
									do
										local cxpr = fes:exportCondition()
										local blk3 = nil
										if cxpr ~= nil then
											blk3 = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
											do blk2:addNode(_g.sling.model.IfStatementNode:instance(cxpr, blk3, nil)) end
										else
											blk3 = blk2
										end
										do
											local fblk = fes:exportBlock()
											if fblk ~= nil then
												local array = fblk:getNodes()
												if array ~= nil then
													local n = 0
													local m = _g.jk.lang.Vector:getSize(array)
													do
														n = 0
														while n < m do
															local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
															if node ~= nil then
																do blk3:addNode(node) end
															end
															do n = n + 1 end
														end
													end
												end
											end
											do
												local v = {}
												do _g.jk.lang.Vector:append(v, blck) end
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
end

function sling.compiler.ForEachHandler:isCapeIterateable(tr, type)
	if not (type ~= nil) then
		do return false end
	end
	do
		local node = tr:getBoundEntity(type)
		if not (node ~= nil) then
			do return false end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.InterfaceDeclarationNode') ~= nil) then
			local qlf = _g.sling.util.NodeUtil:getQualifiedNameString(node, 46)
			do return _g.jk.lang.String:equals(qlf, "jk.lang.Iterateable") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.ClassDeclarationNode') ~= nil) then
			local infc = tr:getImplementedInterfaceReference(node, {
				"jk",
				"lang",
				"Iterateable"
			})
			if not (infc ~= nil) then
				do return false end
			end
			do return true end
		end
		do return false end
	end
end

function sling.compiler.ForEachHandler:expandForeachStatementsStatic(ctx, tr, root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.ForEachStatementNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local fes = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ForEachStatementNode')
				if fes ~= nil then
					local bb = nil
					local rr = fes:getRight()
					if not (rr ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("foreach with null expression", fes, nil))
					end
					do
						local rexp = _g.sling.util.ExpressionUtil:getExpressionDataType(rr, tr)
						if (_vm:to_table_with_key(rexp, '_isType.sling.model.StaticArrayDataTypeNode') ~= nil) then
							bb = _g.sling.compiler.ForEachHandler:toStaticArrayIterator(fes, tr)
							if not (bb ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to process the unrolling of static array foreach", fes, nil))
							end
						elseif (_vm:to_table_with_key(rexp, '_isType.sling.model.VectorDataTypeNode') ~= nil) then
							bb = _g.sling.compiler.ForEachHandler:toStaticArrayIterator(fes, tr)
							if not (bb ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to process the unrolling of vector foreach", fes, nil))
							end
						elseif (_vm:to_table_with_key(rexp, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) and _g.sling.compiler.ForEachHandler:isCapeIterateable(tr, rexp) then
							bb = _g.sling.compiler.ForEachHandler:toCapeIterator(fes, tr)
							if not (bb ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to process the unrolling of iterator foreach", fes, nil))
							end
						else
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Don't know how to unroll foreach for data type `" .. _g.jk.lang.String:safeString(rexp:getNodeTypeName()) .. "'", fes, nil))
						end
						do
							local src = fes:getSource()
							if bb ~= nil then
								local n3 = 0
								local m2 = _g.jk.lang.Vector:getSize(bb)
								do
									n3 = 0
									while n3 < m2 do
										local cn = _vm:to_table_with_key(bb[n3 + 1], '_isType.sling.common.NodeObject')
										if cn ~= nil then
											do cn:setSource(src) end
										end
										do n3 = n3 + 1 end
									end
								end
							end
							if _g.jk.lang.Vector:getSize(bb) == 1 then
								local nd = _vm:to_table_with_key(_g.jk.lang.Vector:get(bb, 0), '_isType.sling.common.NodeObject')
								if not (nd ~= nil) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("nd is null", fes, nil))
								end
								do _g.sling.util.NodeUtil:replaceNode(fes, nd) end
							else
								local pp = _vm:to_table_with_key(fes:getParent(), '_isType.sling.common.ContainerNode')
								if not (pp ~= nil) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No container node parent", fes, nil))
								end
								do
									local ip = pp:getInsertionPointForChild(fes)
									if not (ip ~= nil) then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to get insertion point", fes, nil))
									end
									if bb ~= nil then
										local n4 = 0
										local m3 = _g.jk.lang.Vector:getSize(bb)
										do
											n4 = 0
											while n4 < m3 do
												local n2 = _vm:to_table_with_key(bb[n4 + 1], '_isType.sling.common.NodeObject')
												if n2 ~= nil then
													if not ip:insertBefore(n2) then
														_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to insert node in insertion point", fes, nil))
													end
												end
												do n4 = n4 + 1 end
											end
										end
									end
									do _g.sling.util.NodeUtil:removeNode(fes) end
								end
							end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.ForEachHandler:expandForeachStatementsDynamic(root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.ForEachStatementNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local fes = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ForEachStatementNode')
				if fes ~= nil then
					local lefts = fes:exportLefts()
					if not (_g.jk.lang.Vector:getSize(lefts) == 1) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Only 1 left variable is supported.", fes, nil))
						do return end
					end
					do
						local left = _vm:to_table_with_key(_g.jk.lang.Vector:get(lefts, 0), '_isType.sling.model.VariableDeclarationNode')
						if not (left ~= nil) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Invalid left variable", fes, nil))
							do return end
						end
						do
							local right = fes:exportRight()
							if not (right ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null right", fes, nil))
								do return end
							end
							do
								local fc = _g.sling.model.FunctionCallExpressionNode:forExpression(_g.sling.model.SymbolExpressionNode:forArrayOfNames({
									"jk",
									"lang",
									"DynamicObject",
									"iterate"
								}))
								do fc:addToParameters(right) end
								do
									local varname = _g.sling.util.FunctionUtil:findUniqueVariableNameForNode(fes, "it")
									local mblock = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
									local vd = _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create()), varname, fc)
									do mblock:addNode(vd) end
									do
										local wblock = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
										local lvarname = left:getName()
										local itnextfc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName(varname), "next", false)
										do wblock:addNode(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create()), lvarname, itnextfc)) end
										do
											local ifcond = _g.sling.model.EqualsExpressionNode:forNull(_g.sling.model.SymbolExpressionNode:forName(lvarname))
											do wblock:addNode(_g.sling.model.IfStatementNode:forStatement(ifcond, _g.sling.model.BreakStatementNode._construct0(_g.sling.model.BreakStatementNode._create()))) end
											do
												local bb = fes:exportBlock()
												if bb ~= nil then
													do wblock:addNode(bb) end
												end
												do
													local ww = _g.sling.model.WhileStatementNode:instance(_g.sling.model.NotEqualsExpressionNode:forNull(_g.sling.model.SymbolExpressionNode:forName(varname)), wblock, nil)
													do mblock:addNode(ww) end
													do _g.sling.util.NodeUtil:replaceNode(fes, mblock) end
												end
											end
										end
									end
								end
							end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

sling.compiler.ModelExpanderForJkop = {}
sling.compiler.ModelExpanderForJkop.__index = sling.compiler.ModelExpanderForJkop
_vm:set_metatable(sling.compiler.ModelExpanderForJkop, {})

function sling.compiler.ModelExpanderForJkop._create()
	local v = _vm:set_metatable({}, sling.compiler.ModelExpanderForJkop)
	return v
end

function sling.compiler.ModelExpanderForJkop:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.ModelExpanderForJkop'
	self['_isType.sling.compiler.ModelExpanderForJkop'] = true
	self.generateAsJsonObject = true
	self.generateMethods = true
	self.generateProperties = false
end

function sling.compiler.ModelExpanderForJkop:_construct0()
	sling.compiler.ModelExpanderForJkop._init(self)
	return self
end

sling.compiler.ModelExpanderForJkop.ModelNodeFinder = _g.sling.common.NodeVisitor._create()
sling.compiler.ModelExpanderForJkop.ModelNodeFinder.__index = sling.compiler.ModelExpanderForJkop.ModelNodeFinder
_vm:set_metatable(sling.compiler.ModelExpanderForJkop.ModelNodeFinder, {
	__index = _g.sling.common.NodeVisitor
})

function sling.compiler.ModelExpanderForJkop.ModelNodeFinder._create()
	local v = _vm:set_metatable({}, sling.compiler.ModelExpanderForJkop.ModelNodeFinder)
	return v
end

function sling.compiler.ModelExpanderForJkop.ModelNodeFinder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.ModelExpanderForJkop.ModelNodeFinder'
	self['_isType.sling.compiler.ModelExpanderForJkop.ModelNodeFinder'] = true
	self.results = {}
end

function sling.compiler.ModelExpanderForJkop.ModelNodeFinder:_construct0()
	sling.compiler.ModelExpanderForJkop.ModelNodeFinder._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.compiler.ModelExpanderForJkop.ModelNodeFinder:visit(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.ModelDeclarationNode') ~= nil) and _g.sling.util.ModifierUtil:hasAnnotationModifier(node, "nojkop") == false then
		do _g.jk.lang.Vector:append(self.results, node) end
	end
	do return true end
end

function sling.compiler.ModelExpanderForJkop.ModelNodeFinder:getResults()
	do return self.results end
end

function sling.compiler.ModelExpanderForJkop.ModelNodeFinder:setResults(v)
	self.results = v
	do return self end
end

function sling.compiler.ModelExpanderForJkop:convertPrimitiveType(type)
	if (_vm:to_table_with_key(type, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
		local it = type
		if it:getType() == _g.sling.model.IntegerDataTypeNode.TYPE_INT64 then
			do return _g.sling.model.ReferenceDataTypeNode:forArrayOfNames({
				"jk",
				"lang",
				"LongIntegerObject"
			}) end
		end
		do return _g.sling.model.ReferenceDataTypeNode:forArrayOfNames({
			"jk",
			"lang",
			"IntegerObject"
		}) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
		do return _g.sling.model.ReferenceDataTypeNode:forArrayOfNames({
			"jk",
			"lang",
			"DoubleObject"
		}) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.BooleanDataTypeNode') ~= nil) then
		do return _g.sling.model.ReferenceDataTypeNode:forArrayOfNames({
			"jk",
			"lang",
			"BooleanObject"
		}) end
	end
	do return nil end
end

function sling.compiler.ModelExpanderForJkop:dataTypeToSymbolExpression(type)
	local refdt = _vm:to_table_with_key(type, '_isType.sling.model.ReferenceDataTypeNode')
	if not (refdt ~= nil) then
		do return nil end
	end
	do
		local sym = refdt:getSymbol()
		if not (sym ~= nil) then
			do return nil end
		end
		do
			local symdup = _vm:to_table_with_key(sym:dup(), '_isType.sling.model.SymbolNode')
			if not (symdup ~= nil) then
				do return nil end
			end
			do return _g.sling.model.SymbolExpressionNode:forSymbol(symdup) end
		end
	end
end

function sling.compiler.ModelExpanderForJkop:getUnboxingFunctionFor(vname, type)
	if _g.jk.lang.String:isEmpty(vname) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("getUnboxingFunctionFor: empty vname", type, nil))
	end
	if not (type ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("getUnboxingFunctionFor: null type for vname `" .. _g.jk.lang.String:safeString(vname) .. "'", nil, nil))
	end
	do
		local className = nil
		local method = nil
		if (_vm:to_table_with_key(type, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
			local it = type
			if it:getType() == _g.sling.model.IntegerDataTypeNode.TYPE_INT64 then
				className = "LongInteger"
				method = "asLong"
			else
				className = "Integer"
				method = "asInteger"
			end
		elseif (_vm:to_table_with_key(type, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
			className = "Double"
			method = "asDouble"
		elseif (_vm:to_table_with_key(type, '_isType.sling.model.BooleanDataTypeNode') ~= nil) then
			className = "Boolean"
			method = "asBoolean"
		else
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported primitive data type for unboxing model value: `" .. _g.jk.lang.String:safeString(_g.sling.generator.SlingGeneratorUtil:describeDataType(type)) .. "'", type, nil))
		end
		do
			local ff = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName(className), method, false)
			do ff:addToParameters(_g.sling.model.SymbolExpressionNode:forName(vname)) end
			do return ff end
		end
	end
end

function sling.compiler.ModelExpanderForJkop:getBoxingFunctionFor(vname, type)
	if _g.jk.lang.String:isEmpty(vname) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("getBoxingFunctionFor: empty vname", type, nil))
	end
	if not (type ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("getBoxingFunctionFor: null type for vname `" .. _g.jk.lang.String:safeString(vname) .. "'", nil, nil))
	end
	do
		local name = nil
		if (_vm:to_table_with_key(type, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
			local it = type
			if it:getType() == _g.sling.model.IntegerDataTypeNode.TYPE_INT64 then
				name = "LongInteger"
			else
				name = "Integer"
			end
		elseif (_vm:to_table_with_key(type, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
			name = "Double"
		elseif (_vm:to_table_with_key(type, '_isType.sling.model.BooleanDataTypeNode') ~= nil) then
			name = "Boolean"
		else
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported primitive data type for boxing model value: `" .. _g.jk.lang.String:safeString(_g.sling.generator.SlingGeneratorUtil:describeDataType(type)) .. "'", type, nil))
		end
		do
			local call = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName(name), "asObject", false)
			do call:addToParameters(_g.sling.model.SymbolExpressionNode:forName(vname)) end
			do return call end
		end
	end
end

function sling.compiler.ModelExpanderForJkop:addPropertyVariable(decl, name, type)
	local pdec = _g.sling.model.PropertyDeclarationNode._construct0(_g.sling.model.PropertyDeclarationNode._create())
	do pdec:setType(_g.sling.util.DataTypeUtil:dupAsDataType(type), false) end
	do pdec:setName(name) end
	do
		local body = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
		do pdec:setBody(body, false) end
		do
			local setter = _g.sling.model.PropertySetFunctionDeclarationNode._construct0(_g.sling.model.PropertySetFunctionDeclarationNode._create())
			do setter:setParameter(_g.sling.util.DataTypeUtil:dupAsDataType(type), "value") end
			do
				local assx = _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forName("_" .. _g.jk.lang.String:safeString(name)), _g.sling.model.SymbolExpressionNode:forName("value"))
				do _g.sling.util.FunctionUtil:addStatement(setter, assx) end
				do body:addNode(setter) end
				do
					local getter = _g.sling.model.PropertyGetFunctionDeclarationNode._construct0(_g.sling.model.PropertyGetFunctionDeclarationNode._create())
					do getter:setReturnType(_g.sling.util.DataTypeUtil:dupAsDataType(type), false) end
					do _g.sling.util.FunctionUtil:addStatement(getter, _g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.SymbolExpressionNode:forName("_" .. _g.jk.lang.String:safeString(name)))) end
					do body:addNode(getter) end
					do decl:addNode(pdec) end
				end
			end
		end
	end
end

function sling.compiler.ModelExpanderForJkop:addPrimitivePropertyVariable(decl, name, type)
	local pdec = _g.sling.model.PropertyDeclarationNode._construct0(_g.sling.model.PropertyDeclarationNode._create())
	do pdec:setType(_g.sling.util.DataTypeUtil:dupAsDataType(type), false) end
	do pdec:setName(_g.sling.common.CodeStringUtil:combineCamelCase({
		name,
		"value"
	})) end
	do
		local body = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
		do pdec:setBody(body, false) end
		do
			local setter = _g.sling.model.PropertySetFunctionDeclarationNode._construct0(_g.sling.model.PropertySetFunctionDeclarationNode._create())
			do setter:setParameter(_g.sling.util.DataTypeUtil:dupAsDataType(type), "value") end
			do
				local boxer = self:getBoxingFunctionFor("value", type)
				local assx = _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forName("_" .. _g.jk.lang.String:safeString(name)), boxer)
				do _g.sling.util.FunctionUtil:addStatement(setter, assx) end
				do body:addNode(setter) end
				do
					local getter = _g.sling.model.PropertyGetFunctionDeclarationNode._construct0(_g.sling.model.PropertyGetFunctionDeclarationNode._create())
					do getter:setReturnType(_g.sling.util.DataTypeUtil:dupAsDataType(type), false) end
					do
						local unboxer = self:getUnboxingFunctionFor("_" .. _g.jk.lang.String:safeString(name), type)
						do _g.sling.util.FunctionUtil:addStatement(getter, _g.sling.model.ReturnStatementNode:forExpression(unboxer)) end
						do body:addNode(getter) end
						do decl:addNode(pdec) end
					end
				end
			end
		end
	end
end

function sling.compiler.ModelExpanderForJkop:addSetterAndGetterMethod(decl, name, type)
	local setter = _g.sling.model.FunctionDeclarationNode:forName(_g.sling.common.CodeStringUtil:combineCamelCase({
		"set",
		name
	}), false)
	do setter:setReturnType(_g.sling.model.ReferenceDataTypeNode:forNode(decl, nil), false) end
	do _g.sling.util.ModifierUtil:addCommonModifier(setter, _g.sling.model.Modifier.PUBLIC) end
	do setter:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.util.DataTypeUtil:dupAsDataType(type), "value", nil)) end
	do
		local assx = _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forName("_" .. _g.jk.lang.String:safeString(name)), _g.sling.model.SymbolExpressionNode:forName("value"))
		do _g.sling.util.FunctionUtil:addStatement(setter, assx) end
		do _g.sling.util.FunctionUtil:addStatement(setter, _g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.CurrentObjectExpressionNode._construct0(_g.sling.model.CurrentObjectExpressionNode._create()))) end
		do decl:addNode(setter) end
		do
			local getter = _g.sling.model.FunctionDeclarationNode:forName(_g.sling.common.CodeStringUtil:combineCamelCase({
				"get",
				name
			}), false)
			do _g.sling.util.ModifierUtil:addCommonModifier(getter, _g.sling.model.Modifier.PUBLIC) end
			do getter:setReturnType(_g.sling.util.DataTypeUtil:dupAsDataType(type), false) end
			do _g.sling.util.FunctionUtil:addStatement(getter, _g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.SymbolExpressionNode:forName("_" .. _g.jk.lang.String:safeString(name)))) end
			do decl:addNode(getter) end
		end
	end
end

function sling.compiler.ModelExpanderForJkop:addPrimitiveSetterAndGetterMethod(decl, name, type)
	local setter = _g.sling.model.FunctionDeclarationNode:forName(_g.sling.common.CodeStringUtil:combineCamelCase({
		"set",
		name,
		"value"
	}), false)
	do setter:setReturnType(_g.sling.model.ReferenceDataTypeNode:forNode(decl, nil), false) end
	do _g.sling.util.ModifierUtil:addCommonModifier(setter, _g.sling.model.Modifier.PUBLIC) end
	do
		local sptype = _g.sling.util.DataTypeUtil:dupAsDataType(type)
		do setter:addToParameters(_g.sling.model.VariableDeclarationNode:instance(sptype, "value", nil)) end
		do
			local boxer = self:getBoxingFunctionFor("value", type)
			local spcall = _g.sling.model.FunctionCallExpressionNode:forName(_g.sling.common.CodeStringUtil:combineCamelCase({
				"set",
				name
			}))
			do spcall:addToParameters(boxer) end
			do _g.sling.util.FunctionUtil:addStatement(setter, _g.sling.model.ReturnStatementNode:forExpression(spcall)) end
			do decl:addNode(setter) end
			do
				local getter = _g.sling.model.FunctionDeclarationNode:forName(_g.sling.common.CodeStringUtil:combineCamelCase({
					"get",
					name,
					"value"
				}), false)
				do _g.sling.util.ModifierUtil:addCommonModifier(getter, _g.sling.model.Modifier.PUBLIC) end
				do
					local gptype = _g.sling.util.DataTypeUtil:dupAsDataType(type)
					local unboxer = self:getUnboxingFunctionFor("_" .. _g.jk.lang.String:safeString(name), type)
					do getter:setReturnType(gptype, false) end
					do _g.sling.util.FunctionUtil:addStatement(getter, _g.sling.model.ReturnStatementNode:forExpression(unboxer)) end
					do decl:addNode(getter) end
				end
			end
		end
	end
end

function sling.compiler.ModelExpanderForJkop:getPropertyName(variable)
	if not (variable ~= nil) then
		do return nil end
	end
	do
		local v = variable:getName()
		if not (v ~= nil) then
			do return nil end
		end
		if _g.jk.lang.String:startsWith(v, "_", 0) then
			do return _g.jk.lang.String:getEndOfString(v, 1) end
		end
		do return v end
	end
end

function sling.compiler.ModelExpanderForJkop:execute(root)
	if not (root ~= nil) then
		do return end
	end
	do
		local cf = _g.sling.compiler.ModelExpanderForJkop.ModelNodeFinder._construct0(_g.sling.compiler.ModelExpanderForJkop.ModelNodeFinder._create())
		if not root:accept(cf) then
			do return end
		end
		do
			local array = cf:getResults()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local model = array[n + 1]
						if model ~= nil then
							local explicit = false
							if _g.sling.util.ModifierUtil:hasAnnotationModifier(model, "explicit") then
								explicit = true
							end
							do
								local cdecl = _g.sling.model.ClassDeclarationNode:forName(model:getNodeName())
								do _g.sling.util.ModifierUtil:addCommonModifier(cdecl, _g.sling.model.Modifier.PUBLIC) end
								if (_vm:to_table_with_key(model:getParent(), '_isType.sling.model.EntityDeclarationNode') ~= nil) then
									do _g.sling.util.ModifierUtil:addCommonModifier(cdecl, _g.sling.model.Modifier.STATIC) end
								end
								do cdecl:setDependencies(model:getDependencies()) end
								do cdecl:setImportNamespaces(model:exportImportNamespaces(), false) end
								do cdecl:setImportEntities(model:exportImportEntities(), false) end
								do
									local array2 = model:getNodes()
									if array2 ~= nil then
										local n2 = 0
										local m2 = _g.jk.lang.Vector:getSize(array2)
										do
											n2 = 0
											while n2 < m2 do
												local variable = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.VariableDeclarationNode')
												if variable ~= nil then
													local pd = _g.sling.model.VariableDeclarationNode._construct0(_g.sling.model.VariableDeclarationNode._create())
													local pn = variable:getNodeName()
													do pd:setSource(variable:getSource()) end
													do pd:setName("_" .. _g.jk.lang.String:safeString(pn)) end
													do
														local originaltype = variable:getType()
														if (_vm:to_table_with_key(originaltype, '_isType.sling.model.StringDataTypeNode') ~= nil) then
															do pd:setType(_g.sling.model.StringDataTypeNode._construct0(_g.sling.model.StringDataTypeNode._create()), false) end
														elseif (_vm:to_table_with_key(originaltype, '_isType.sling.model.BufferDataTypeNode') ~= nil) then
															do pd:setType(_g.sling.model.BufferDataTypeNode._construct0(_g.sling.model.BufferDataTypeNode._create()), false) end
														elseif (_vm:to_table_with_key(originaltype, '_isType.sling.model.StaticArrayDataTypeNode') ~= nil) then
															local pt = originaltype:getPrimaryType()
															if not (pt ~= nil) then
																_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No primary type", originaltype, nil))
															end
															do
																local ptdup = nil
																if (_vm:to_table_with_key(pt, '_isType.sling.model.PrimitiveDataTypeNode') ~= nil) then
																	if not ((function()
																		ptdup = self:convertPrimitiveType(pt)
																		do return ptdup end
																	end)() ~= nil) then
																		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported primitive data type: `" .. _g.jk.lang.String:safeString(_g.sling.generator.SlingGeneratorUtil:describeDataType(pt)) .. "'", pt, nil))
																		do return end
																	end
																else
																	ptdup = _g.sling.util.DataTypeUtil:dupAsDataType(pt)
																end
																do pd:setType(_g.sling.model.VectorDataTypeNode:forPrimaryType(ptdup), false) end
															end
														elseif (_vm:to_table_with_key(originaltype, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
															do pd:setType(_g.sling.util.DataTypeUtil:dupAsDataType(originaltype), false) end
														else
															local ctype = self:convertPrimitiveType(originaltype)
															if ctype ~= nil then
																do pd:setType(ctype, false) end
																if self.generateMethods then
																	do self:addPrimitiveSetterAndGetterMethod(cdecl, pn, originaltype) end
																end
																if self.generateProperties then
																	do self:addPrimitivePropertyVariable(cdecl, pn, originaltype) end
																end
															else
																_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported data type as model field: `" .. _g.jk.lang.String:safeString(_g.sling.generator.SlingGeneratorUtil:describeDataType(originaltype)) .. "'", originaltype, nil))
															end
														end
														do
															local newtype = pd:getType()
															do pd:setDescription(variable:getDescription()) end
															do cdecl:addNode(pd) end
															if self.generateMethods then
																do self:addSetterAndGetterMethod(cdecl, pn, newtype) end
															end
															if self.generateProperties then
																do self:addPropertyVariable(cdecl, pn, newtype) end
															end
														end
													end
												end
												do n2 = n2 + 1 end
											end
										end
									end
									if self.generateAsJsonObject then
										do cdecl:addToImportNamespaces(_g.sling.model.SymbolNode:forArrayOfNames({
											"jk",
											"json"
										})) end
										if explicit then
											do cdecl:addToBaseTypes(_g.sling.model.BaseTypeNode:forType(_g.sling.model.ReferenceDataTypeNode:forName("JSONObjectAdapterExplicit"), 0)) end
										else
											do cdecl:addToBaseTypes(_g.sling.model.BaseTypeNode:forType(_g.sling.model.ReferenceDataTypeNode:forName("JSONObjectAdapter"), 0)) end
										end
										do cdecl:addToBaseTypes(_g.sling.model.BaseTypeNode:forType(_g.sling.model.ReferenceDataTypeNode:forName("StringObject"), 0)) end
										do
											local mto = _g.sling.model.FunctionDeclarationNode:forName("toJsonObject", false)
											do _g.sling.util.ModifierUtil:addCommonModifier(mto, _g.sling.model.Modifier.OVERRIDE) end
											do _g.sling.util.ModifierUtil:addCommonModifier(mto, _g.sling.model.Modifier.PUBLIC) end
											do mto:setReturnType(_g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create()), false) end
											do
												local vdecl = _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create()), "v", nil)
												do vdecl:setInitializer(_g.sling.model.CreateObjectExpressionNode:forType(_g.sling.model.ReferenceDataTypeNode:forName("DynamicMap")), false) end
												do _g.sling.util.FunctionUtil:addStatement(mto, vdecl) end
												do
													local array3 = cdecl:getNodes()
													if array3 ~= nil then
														local n3 = 0
														local m3 = _g.jk.lang.Vector:getSize(array3)
														do
															n3 = 0
															while n3 < m3 do
																local vardecl = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.model.VariableDeclarationNode')
																if vardecl ~= nil then
																	local fname = nil
																	local tt = vardecl:getType()
																	if (_vm:to_table_with_key(tt, '_isType.sling.model.VectorDataTypeNode') ~= nil) then
																		fname = "SET_VALUE_VECTOR"
																	else
																		fname = "SET_VALUE_OBJECT"
																	end
																	do
																		local fc = _g.sling.model.FunctionCallExpressionNode:forName(fname)
																		do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forName("v")) end
																		do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(self:getPropertyName(vardecl))) end
																		do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forName(vardecl:getNodeName())) end
																		do _g.sling.util.FunctionUtil:addStatement(mto, fc) end
																	end
																end
																do n3 = n3 + 1 end
															end
														end
													end
													do _g.sling.util.FunctionUtil:addStatement(mto, _g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.SymbolExpressionNode:forName("v"))) end
													do cdecl:addNode(mto) end
													do
														local mfr = _g.sling.model.FunctionDeclarationNode:forName("fromJsonObject", false)
														do _g.sling.util.ModifierUtil:addCommonModifier(mfr, _g.sling.model.Modifier.OVERRIDE) end
														do _g.sling.util.ModifierUtil:addCommonModifier(mfr, _g.sling.model.Modifier.PUBLIC) end
														do mfr:setReturnType(_g.sling.model.BooleanDataTypeNode._construct0(_g.sling.model.BooleanDataTypeNode._create()), false) end
														do mfr:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create()), "o", nil)) end
														do
															local vdecl2 = _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create()), "v", nil)
															do vdecl2:setInitializer(_g.sling.model.DynamicCastExpressionNode:instance(_g.sling.model.ReferenceDataTypeNode:forName("DynamicMap"), _g.sling.model.SymbolExpressionNode:forName("o")), false) end
															do _g.sling.util.FunctionUtil:addStatement(mfr, vdecl2) end
															do _g.sling.util.FunctionUtil:addStatement(mfr, _g.sling.model.AssertStatementNode:forChild(_g.sling.model.SymbolExpressionNode:forName("v"))) end
															do
																local array4 = cdecl:getNodes()
																if array4 ~= nil then
																	local n4 = 0
																	local m4 = _g.jk.lang.Vector:getSize(array4)
																	do
																		n4 = 0
																		while n4 < m4 do
																			local vardecl = _vm:to_table_with_key(array4[n4 + 1], '_isType.sling.model.VariableDeclarationNode')
																			if vardecl ~= nil then
																				local fname = nil
																				local typeParam = nil
																				local tt = vardecl:getType()
																				if (_vm:to_table_with_key(tt, '_isType.sling.model.StringDataTypeNode') ~= nil) then
																					fname = "GET_VALUE_STRING"
																				elseif (_vm:to_table_with_key(tt, '_isType.sling.model.BufferDataTypeNode') ~= nil) then
																					fname = "GET_VALUE_BUFFER"
																				elseif (_vm:to_table_with_key(tt, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
																					local reftt = tt
																					local refname = _g.sling.util.SymbolUtil:getSymbolNamesString(reftt:getSymbol(), 46)
																					if refname == "jk.lang.IntegerObject" then
																						fname = "GET_VALUE_INTEGER"
																					elseif refname == "jk.lang.LongIntegerObject" then
																						fname = "GET_VALUE_LONG_INTEGER"
																					elseif refname == "jk.lang.DoubleObject" then
																						fname = "GET_VALUE_DOUBLE"
																					elseif refname == "jk.lang.BooleanObject" then
																						fname = "GET_VALUE_BOOLEAN"
																					else
																						fname = "GET_VALUE_OBJECT"
																						typeParam = self:dataTypeToSymbolExpression(tt)
																					end
																				elseif (_vm:to_table_with_key(tt, '_isType.sling.model.VectorDataTypeNode') ~= nil) then
																					local ss = tt:getPrimaryType()
																					if not (ss ~= nil) then
																						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No primary type", tt, nil))
																						do return end
																					end
																					if (_vm:to_table_with_key(ss, '_isType.sling.model.StringDataTypeNode') ~= nil) then
																						fname = "GET_VALUE_STRING_VECTOR"
																					elseif (_vm:to_table_with_key(ss, '_isType.sling.model.BufferDataTypeNode') ~= nil) then
																						fname = "GET_VALUE_BUFFER_VECTOR"
																					elseif (_vm:to_table_with_key(ss, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
																						local refss = ss
																						local refname = _g.sling.util.SymbolUtil:getSymbolNamesString(refss:getSymbol(), 46)
																						if refname == "jk.lang.IntegerObject" then
																							fname = "GET_VALUE_INTEGER_VECTOR"
																						elseif refname == "jk.lang.LongIntegerObject" then
																							fname = "GET_VALUE_LONG_INTEGER_VECTOR"
																						elseif refname == "jk.lang.DoubleObject" then
																							fname = "GET_VALUE_DOUBLE_VECTOR"
																						elseif refname == "jk.lang.BooleanObject" then
																							fname = "GET_VALUE_BOOLEAN_VECTOR"
																						else
																							fname = "GET_VALUE_OBJECT_VECTOR"
																							typeParam = self:dataTypeToSymbolExpression(ss)
																						end
																					else
																						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported primary data type in vector: `" .. _g.jk.lang.String:safeString(ss:getNodeTypeName()) .. "'", ss, nil))
																					end
																				else
																					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported data type: `" .. _g.jk.lang.String:safeString(tt:getNodeTypeName()) .. "'", tt, nil))
																				end
																				if fname ~= nil then
																					local fc = _g.sling.model.FunctionCallExpressionNode:forName(fname)
																					do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forName(vardecl:getNodeName())) end
																					if typeParam ~= nil then
																						do fc:addToParameters(typeParam) end
																					end
																					do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(self:getPropertyName(vardecl))) end
																					do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forName("v")) end
																					do _g.sling.util.FunctionUtil:addStatement(mfr, fc) end
																				end
																			end
																			do n4 = n4 + 1 end
																		end
																	end
																end
																do _g.sling.util.FunctionUtil:addStatement(mfr, _g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.BooleanLiteralExpressionNode:forValue(true))) end
																do cdecl:addNode(mfr) end
																do
																	local fjs = _g.sling.model.FunctionDeclarationNode:forName("fromJsonString", false)
																	do _g.sling.util.ModifierUtil:addCommonModifier(fjs, _g.sling.model.Modifier.PUBLIC) end
																	do fjs:setReturnType(_g.sling.model.BooleanDataTypeNode._construct0(_g.sling.model.BooleanDataTypeNode._create()), false) end
																	do fjs:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.StringDataTypeNode._construct0(_g.sling.model.StringDataTypeNode._create()), "o", nil)) end
																	do
																		local fjsfc = _g.sling.model.FunctionCallExpressionNode:forName("fromJsonObject")
																		local fjsfcp = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("JSONParser"), "parse", false)
																		do fjsfcp:addToParameters(_g.sling.model.SymbolExpressionNode:forName("o")) end
																		do fjsfc:addToParameters(fjsfcp) end
																		do _g.sling.util.FunctionUtil:addStatement(fjs, _g.sling.model.ReturnStatementNode:forExpression(fjsfc)) end
																		do cdecl:addNode(fjs) end
																		do
																			local tjs = _g.sling.model.FunctionDeclarationNode:forName("toJsonString", false)
																			do _g.sling.util.ModifierUtil:addCommonModifier(tjs, _g.sling.model.Modifier.PUBLIC) end
																			do tjs:setReturnType(_g.sling.model.StringDataTypeNode._construct0(_g.sling.model.StringDataTypeNode._create()), false) end
																			do
																				local tjsp = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("JSONEncoder"), "encode", false)
																				do tjsp:addToParameters(_g.sling.model.FunctionCallExpressionNode:forName("toJsonObject")) end
																				do _g.sling.util.FunctionUtil:addStatement(tjs, _g.sling.model.ReturnStatementNode:forExpression(tjsp)) end
																				do cdecl:addNode(tjs) end
																				do
																					local ts = _g.sling.model.FunctionDeclarationNode:forName("toString", false)
																					do _g.sling.util.ModifierUtil:addCommonModifier(ts, _g.sling.model.Modifier.PUBLIC) end
																					do ts:setReturnType(_g.sling.model.StringDataTypeNode._construct0(_g.sling.model.StringDataTypeNode._create()), false) end
																					do
																						local tsp = _g.sling.model.FunctionCallExpressionNode:forName("toJsonString")
																						do _g.sling.util.FunctionUtil:addStatement(ts, _g.sling.model.ReturnStatementNode:forExpression(tsp)) end
																						do cdecl:addNode(ts) end
																						do
																							local forjs = _g.sling.model.FunctionDeclarationNode:forName("forJsonString", false)
																							do _g.sling.util.ModifierUtil:addCommonModifier(forjs, _g.sling.model.Modifier.PUBLIC) end
																							do _g.sling.util.ModifierUtil:addCommonModifier(forjs, _g.sling.model.Modifier.STATIC) end
																							do forjs:setReturnType(_g.sling.model.ReferenceDataTypeNode:forNode(cdecl, nil), false) end
																							do forjs:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.StringDataTypeNode._construct0(_g.sling.model.StringDataTypeNode._create()), "o", nil)) end
																							do _g.sling.util.FunctionUtil:addStatement(forjs, _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create()), "v", _g.sling.model.CreateObjectExpressionNode:forType(_g.sling.model.ReferenceDataTypeNode:forNode(cdecl, nil)))) end
																							do
																								local ass = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("v"), "fromJsonString", false)
																								do ass:addToParameters(_g.sling.model.SymbolExpressionNode:forName("o")) end
																								do _g.sling.util.FunctionUtil:addStatement(forjs, _g.sling.model.AssertStatementNode:forChild(ass)) end
																								do _g.sling.util.FunctionUtil:addStatement(forjs, _g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.SymbolExpressionNode:forName("v"))) end
																								do cdecl:addNode(forjs) end
																								do
																									local forjo = _g.sling.model.FunctionDeclarationNode:forName("forJsonObject", false)
																									do _g.sling.util.ModifierUtil:addCommonModifier(forjo, _g.sling.model.Modifier.PUBLIC) end
																									do _g.sling.util.ModifierUtil:addCommonModifier(forjo, _g.sling.model.Modifier.STATIC) end
																									do forjo:setReturnType(_g.sling.model.ReferenceDataTypeNode:forNode(cdecl, nil), false) end
																									do forjo:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create()), "o", nil)) end
																									do _g.sling.util.FunctionUtil:addStatement(forjo, _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create()), "v", _g.sling.model.CreateObjectExpressionNode:forType(_g.sling.model.ReferenceDataTypeNode:forNode(cdecl, nil)))) end
																									do
																										local ax = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("v"), "fromJsonObject", false)
																										do ax:addToParameters(_g.sling.model.SymbolExpressionNode:forName("o")) end
																										do _g.sling.util.FunctionUtil:addStatement(forjo, _g.sling.model.AssertStatementNode:forChild(ax)) end
																										do _g.sling.util.FunctionUtil:addStatement(forjo, _g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.SymbolExpressionNode:forName("v"))) end
																										do cdecl:addNode(forjo) end
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
									do model:replaceWith(cdecl, false) end
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

function sling.compiler.ModelExpanderForJkop:getGenerateAsJsonObject()
	do return self.generateAsJsonObject end
end

function sling.compiler.ModelExpanderForJkop:setGenerateAsJsonObject(v)
	self.generateAsJsonObject = v
	do return self end
end

function sling.compiler.ModelExpanderForJkop:getGenerateMethods()
	do return self.generateMethods end
end

function sling.compiler.ModelExpanderForJkop:setGenerateMethods(v)
	self.generateMethods = v
	do return self end
end

function sling.compiler.ModelExpanderForJkop:getGenerateProperties()
	do return self.generateProperties end
end

function sling.compiler.ModelExpanderForJkop:setGenerateProperties(v)
	self.generateProperties = v
	do return self end
end

sling.compiler.SlingCompiler = {}
sling.compiler.SlingCompiler.__index = sling.compiler.SlingCompiler
_vm:set_metatable(sling.compiler.SlingCompiler, {})

sling.compiler.SlingCompiler.globalBuildVersion = nil

function sling.compiler.SlingCompiler._create()
	local v = _vm:set_metatable({}, sling.compiler.SlingCompiler)
	return v
end

function sling.compiler.SlingCompiler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.SlingCompiler'
	self['_isType.sling.compiler.SlingCompiler'] = true
	self.ctx = nil
	self.configurationCache = {}
	self.depth = 0
	self.workDir = nil
	self.infomapCompiled = {}
	self.infomapLibraries = {}
	self.includes = nil
	self.customDefines = nil
	self.customPlingOptions = nil
	self.compilerVersion = nil
	self.customPreprocessors = nil
	self.rebuildAll = false
	self.customLibs = nil
	self.forcedLibraries = nil
end

function sling.compiler.SlingCompiler:_construct0()
	sling.compiler.SlingCompiler._init(self)
	return self
end

function sling.compiler.SlingCompiler:getGlobalBuildVersion()
	if not (_g.sling.compiler.SlingCompiler.globalBuildVersion ~= nil) then
		local dd = _g.jk.time.SystemClock:asDateTimeUTC()
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendInteger(dd:getYear()) end
		do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(dd:getMonth(), 2, "0")) end
		do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(dd:getDayOfMonth(), 2, "0")) end
		_g.sling.compiler.SlingCompiler.globalBuildVersion = sb:toString()
	end
	do return _g.sling.compiler.SlingCompiler.globalBuildVersion end
end

function sling.compiler.SlingCompiler:sanitizeModuleId(id)
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
			if _g.jk.lang.Character:isUppercaseAlpha(c) or _g.jk.lang.Character:isLowercaseAlpha(c) or _g.jk.lang.Character:isDigit(c) or c == 46 then
				do sb:appendCharacter(c) end
			else
				do sb:appendCharacter(95) end
			end
		end
		do return sb:toString() end
	end
end

function sling.compiler.SlingCompiler:_construct1(ctx)
	sling.compiler.SlingCompiler._init(self)
	do self:setCtx(ctx) end
	return self
end

function sling.compiler.SlingCompiler:getTargetPlatformId()
end

function sling.compiler.SlingCompiler:getTargetPlatformName()
end

function sling.compiler.SlingCompiler:getDefines(v)
end

function sling.compiler.SlingCompiler:transform(ctx, node, resolver)
end

function sling.compiler.SlingCompiler:writeModuleSources(ctx, node, output, moduleId)
end

function sling.compiler.SlingCompiler:createLibraryManager()
end

function sling.compiler.SlingCompiler:getLinkTargetFile(directory, moduleName)
end

function sling.compiler.SlingCompiler:addToForcedLibraries(library)
	if not _g.jk.lang.String:isNotEmpty(library) then
		do return end
	end
	if not (self.forcedLibraries ~= nil) then
		self.forcedLibraries = {}
	end
	do _g.jk.lang.Vector:append(self.forcedLibraries, library) end
end

function sling.compiler.SlingCompiler:getLibraryManager()
	local v = self:createLibraryManager()
	if not (v ~= nil) then
		do _g.jk.lang.Error:throw("failedToCreate", "libraryManager") end
	end
	do
		local flibs = self:getForcedLibraries()
		if flibs ~= nil then
			if flibs ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(flibs)
				do
					n = 0
					while n < m do
						local flib = flibs[n + 1]
						if flib ~= nil then
							local nn = _g.sling.compiler.LibraryName:parse(flib)
							if not (nn ~= nil) then
								do _g.jk.lang.Error:throw("invalidLibraryName", flib) end
							end
							do v:setForcedLibraryVersion(_g.jk.lang.String:safeString(nn:getNamespace()) .. ":" .. _g.jk.lang.String:safeString(nn:getName()), nn:getVersion()) end
						end
						do n = n + 1 end
					end
				end
			end
		end
		do
			local dd = _g.jk.env.CommonPath:getHomeDirectory()
			if dd ~= nil then
				dd = dd:entry(".sling"):entry("libs")
			end
			if not (dd ~= nil) then
				dd = _g.jk.env.TemporaryDirectory:create()
			end
			do v:setDirectory(dd) end
			do return v end
		end
	end
end

function sling.compiler.SlingCompiler:addCustomPreprocessor(pp)
	if not (pp ~= nil) then
		do return end
	end
	if not (self.customPreprocessors ~= nil) then
		self.customPreprocessors = {}
	end
	do _g.jk.lang.Vector:append(self.customPreprocessors, pp) end
end

function sling.compiler.SlingCompiler:setCtx(ctx)
	self.ctx = ctx
	do return self end
end

function sling.compiler.SlingCompiler:getCtx()
	do return self.ctx end
end

function sling.compiler.SlingCompiler:setModuleInfoForLibraries(entries)
	self.infomapLibraries = {}
	if entries ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(entries)
		do
			n = 0
			while n < m do
				local entry = entries[n + 1]
				if entry ~= nil then
					local id = entry:getModuleId()
					if _g.jk.lang.String:isEmpty(id) then
						goto _continue42
					end
					self.infomapLibraries[id] = entry
				end
				::_continue42::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingCompiler:setWorkDir(dir)
	self.workDir = dir
end

function sling.compiler.SlingCompiler:getWorkDir()
	if not (self.workDir ~= nil) then
		self.workDir = _g.jk.env.TemporaryDirectory:create()
	end
	if not (self.workDir ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unable to create a temporary working directory", nil, nil))
	end
	do return self.workDir end
end

function sling.compiler.SlingCompiler:getWorkDirFile(name)
	do return self:getWorkDir():entry(name) end
end

function sling.compiler.SlingCompiler:getBuildDirFor(file)
	if not (file ~= nil) then
		do return nil end
	end
	do
		local mid = self:getModuleId(file)
		if not (mid ~= nil) then
			do return nil end
		end
		do
			local str = file:getPath()
			if _g.jk.lang.Vector:getSize(self.customLibs) > 0 then
				local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				do sb:appendString(str) end
				if self.customLibs ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(self.customLibs)
					do
						n = 0
						while n < m do
							local clib = self.customLibs[n + 1]
							if clib ~= nil then
								local lib = clib:toString()
								do sb:appendCharacter(58) end
								do sb:appendString(lib) end
							end
							do n = n + 1 end
						end
					end
				end
				str = sb:toString()
			end
			do
				local hash = _g.jk.sha.SHAEncoder:getSha1HashForString(str)
				if not (hash ~= nil) then
					hash = _g.jk.md5.MD5Encoder:encodeString(str)
				end
				if _g.jk.lang.String:isNotEmpty(hash) then
					mid = _g.jk.lang.String:safeString(mid) .. "-" .. _g.jk.lang.String:safeString(hash)
				end
				do return self:getWorkDirFile(mid):entry(self:getTargetPlatformId()) end
			end
		end
	end
end

function sling.compiler.SlingCompiler:changeDepth(dx)
	self.depth = self.depth + dx
end

function sling.compiler.SlingCompiler:logWarning(text)
	do _g.jk.log.Log:warning(self.ctx, "[slingc:" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.depth)) .. "] " .. _g.jk.lang.String:safeString(text)) end
end

function sling.compiler.SlingCompiler:logInfo(text)
	do _g.jk.log.Log:info(self.ctx, "[slingc:" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.depth)) .. "] " .. _g.jk.lang.String:safeString(text)) end
end

function sling.compiler.SlingCompiler:logDebug(text)
	do _g.jk.log.Log:debug(self.ctx, "[slingc:" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.depth)) .. "] " .. _g.jk.lang.String:safeString(text)) end
end

function sling.compiler.SlingCompiler:getRawModuleId(module)
	if not (module ~= nil) then
		do return nil end
	end
	if module:isFile() then
		do return module:getBasenameWithoutExtension() end
	end
	if module:isDirectory() then
		do return module:getBasename() end
	end
	do return nil end
end

function sling.compiler.SlingCompiler:getModuleId(module)
	do return _g.sling.compiler.SlingCompiler:sanitizeModuleId(self:getRawModuleId(module)) end
end

function sling.compiler.SlingCompiler:getModuleConfiguration(module, customPlingOptions)
	if not (module ~= nil) then
		do return nil end
	end
	do
		local path = module:getPath()
		if not (path ~= nil) then
			do return nil end
		end
		do
			local v = _g.jk.lang.Map:get(self.configurationCache, path)
			if not (v ~= nil) then
				local parser = _g.sling.parser.PlingParser._construct1(_g.sling.parser.PlingParser._create(), self.ctx)
				local baseopts = nil
				local projectPling = module:getParent():entry("project.slon")
				if not projectPling:isFile() then
					projectPling = module:getParent():entry("project.pling")
				end
				if projectPling:isFile() then
					baseopts = parser:parseFileAsMap(projectPling)
				else
					local commonPling = module:getParent():entry("common.pling")
					if commonPling:isFile() then
						baseopts = parser:parseFileAsMap(commonPling)
						do self:logWarning("Processing a deprecated common.pling file: `" .. _g.jk.lang.String:safeString(commonPling:getPath()) .. "'") end
					end
				end
				do
					local co = customPlingOptions
					if not (co ~= nil) then
						co = self:getCustomPlingOptions()
					end
					if module:isDirectory() then
						local modulePling = module:entry("module.slon")
						if not modulePling:isFile() then
							modulePling = module:entry("module.pling")
						end
						if modulePling:isFile() then
							v = parser:parseFileAsUnitSettings(modulePling, baseopts, co)
						else
							local thisPling = module:entry("this.slon")
							if not thisPling:isFile() then
								thisPling = module:entry("this.pling")
							end
							if thisPling:isFile() then
								v = parser:parseFileAsUnitSettings(thisPling, baseopts, co)
							end
						end
					end
					if not (v ~= nil) then
						local map = baseopts
						if not (map ~= nil) then
							map = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
						end
						if co ~= nil then
							do map:mergeFrom(co) end
						end
						v = parser:createSettingsForMap(map)
					end
					if _g.jk.lang.String:isEmpty(v:getModuleId()) then
						local pid = self:getModuleId(module)
						if pid ~= nil then
							do v:setModuleId(pid) end
						end
					end
					if _g.jk.lang.String:isEmpty(v:getProjectVersion()) then
						do v:setProjectVersion(_g.sling.compiler.SlingCompiler:getGlobalBuildVersion()) end
					end
					self.configurationCache[path] = v
				end
			end
			do return v end
		end
	end
end

function sling.compiler.SlingCompiler:isSlingModule(module)
	if not (module ~= nil) then
		do return false end
	end
	if module:isFile() then
		if module:hasExtension("sling") then
			do return true end
		end
	elseif module:isDirectory() then
		if module:entry("module.slon"):isFile() then
			do return true end
		end
		if module:entry("module.pling"):isFile() then
			do return true end
		end
		do
			local v = false
			local es = module:entries()
			while es ~= nil do
				local cfile = es:next()
				if not (cfile ~= nil) then
					do break end
				end
				if cfile:isFile() and cfile:hasExtension("sling") then
					v = true
					do break end
				end
			end
			if es ~= nil and (_vm:to_table_with_key(es, '_isType.jk.lang.Closable') ~= nil) then
				do es:close() end
			end
			do return v end
		end
	end
	do return false end
end

function sling.compiler.SlingCompiler:getContainingModule(dir, name)
	if not (dir ~= nil) then
		do return nil end
	end
	if not _g.jk.lang.String:isNotEmpty(name) then
		do return nil end
	end
	do
		local nn = name
		while true do
			local module = dir:entry(nn)
			if _g.sling.compiler.SlingCompiler:isSlingModule(module) then
				if nn == name then
					do return module end
				end
				do
					local remain = _g.jk.lang.String:getEndOfString(name, _g.jk.lang.String:getLength(nn) + 1)
					if _g.jk.lang.String:isNotEmpty(remain) then
						local v = self:getContainingModule(module, remain)
						if v ~= nil then
							do return module end
						end
					end
				end
			end
			do
				local dot = _g.jk.lang.String:getLastIndexOfCharacter(nn, 46, -1)
				if dot < 0 then
					do break end
				end
				nn = _g.jk.lang.String:getSubString(nn, 0, dot)
			end
		end
		do return nil end
	end
end

function sling.compiler.SlingCompiler:findSlingModuleInIncludes(name)
	if not _g.jk.lang.String:isNotEmpty(name) then
		do return nil end
	end
	if self.includes ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.includes)
		do
			n = 0
			while n < m do
				local include = self.includes[n + 1]
				if include ~= nil then
					local module = self:getContainingModule(include, name)
					if module ~= nil then
						do return module end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return nil end
end

function sling.compiler.SlingCompiler:readSlingString(string, name)
	if not (string ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null string given to readSlingString", nil, nil))
	end
	do
		local code = nil
		local error = nil
		local parser = _g.sling.parser.SlingParser._construct0(_g.sling.parser.SlingParser._create())
		do parser:setCtx(self.ctx) end
		do _g.jk.log.Log:status(self.ctx, "[Reading string] ..") end
		do
			local _status, _err = _vm:execute_protected_call(function()
				code = parser:parseString(string, name)
			end)
			if _err then
				if (_vm:to_table_with_key(_err, '_isType.sling.common.ReferenceError') ~= nil) then
					local e = _err
					error = e
					code = nil
				else
					_vm:throw_error(_err)
				end
			end
		end
		do _g.jk.log.Log:status(self.ctx, nil) end
		if error ~= nil then
			_vm:throw_error(error)
		end
		do return code end
	end
end

function sling.compiler.SlingCompiler:executePostFilters(node)
	do _g.sling.compiler.JcoOps:validateWidgets(self.ctx, node) end
end

function sling.compiler.SlingCompiler:getRelativeFile(file, path)
	if not (file ~= nil and path ~= nil) then
		do return nil end
	end
	if file:isFile() then
		do return file:getSibling(path) end
	end
	if file:isDirectory() then
		do return file:entry(path) end
	end
	do return nil end
end

function sling.compiler.SlingCompiler:getDependencyModulesForTree(tree, myName)
	local v = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
	local array = _g.sling.util.NodeFinder:findCompatibleNodesForTypes(tree, {
		"class:sling.model.ImportStatementNode",
		"class:sling.model.EntityDeclarationNode"
	}, false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local found = array[n + 1]
				if found ~= nil then
					if (_vm:to_table_with_key(found, '_isType.sling.model.EntityDeclarationNode') ~= nil) then
						local decl = found
						local array2 = decl:getImportNamespaces()
						if array2 ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(array2)
							do
								n2 = 0
								while n2 < m2 do
									local ns = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.SymbolNode')
									if ns ~= nil then
										local nn = _g.sling.util.SymbolUtil:getSymbolNamesString(ns, 46)
										if myName == nil or _g.jk.lang.String:isNotEqual(myName, nn) then
											do v:add(nn) end
										end
									end
									do n2 = n2 + 1 end
								end
							end
						end
						do
							local array3 = decl:getDependencies()
							if array3 ~= nil then
								local n3 = 0
								local m3 = _g.jk.lang.Vector:getSize(array3)
								do
									n3 = 0
									while n3 < m3 do
										local dd = (function(o)
											if (_vm:get_variable_type(o) == 'string') then
												do return o end
											end
											do return nil end
										end)(array3[n3 + 1])
										if dd ~= nil then
											if _g.jk.lang.String:startsWith(dd, "module:", 0) then
												local mm = _g.jk.lang.String:getEndOfString(dd, 7)
												if _g.jk.lang.String:isNotEmpty(mm) then
													do v:add(mm) end
												end
											end
										end
										do n3 = n3 + 1 end
									end
								end
							end
						end
					elseif (_vm:to_table_with_key(found, '_isType.sling.model.ImportEntityStatementNode') ~= nil) then
						local ns = found
						local nn = _g.sling.util.SymbolUtil:getSymbolNamesString(ns:getContainer(), 46)
						if _g.jk.lang.String:isEmpty(nn) then
							goto _continue43
						end
						if myName == nil or _g.jk.lang.String:isNotEqual(myName, nn) then
							do v:add(nn) end
						end
					elseif (_vm:to_table_with_key(found, '_isType.sling.model.ImportStaticMemberStatementNode') ~= nil) then
						local im = found
						local cn = _g.sling.util.SymbolUtil:getSymbolNamesString(im:getContainer(), 46)
						if _g.jk.lang.String:isEmpty(cn) then
							goto _continue43
						end
						if myName == nil or _g.jk.lang.String:isNotEqual(myName, cn) then
							do v:add(cn) end
						end
					elseif (_vm:to_table_with_key(found, '_isType.sling.model.ImportPackageStatementNode') ~= nil) then
						local ips = found
						local ns = ips:getPackage()
						local nn = _g.sling.util.SymbolUtil:getSymbolNamesString(ns, 46)
						if myName == nil or _g.jk.lang.String:isNotEqual(myName, nn) then
							do v:add(nn) end
						end
					else
						do _g.sling.common.RefLog:warning(self.ctx, "Unsupported statement node encountered when computing dependencies: `" .. _g.jk.lang.String:safeString(found:getNodeTypeName()) .. "'. Ignoring it.", found) end
					end
				end
				::_continue43::
				do n = n + 1 end
			end
		end
	end
	do return v:getAll() end
end

function sling.compiler.SlingCompiler:readCodeFile(file, parser, showParseMessages)
	if not (file ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null file given to readCodeFile", nil, nil))
	end
	do
		local code = nil
		local error = nil
		do _g.jk.log.Log:status(self.ctx, "[Reading] " .. _g.jk.lang.String:safeString(file:getPath()) .. " ..") end
		if showParseMessages then
			do parser:setCtx(self.ctx) end
		end
		do
			local _status, _err = _vm:execute_protected_call(function()
				code = parser:parseFile(file)
			end)
			if _err then
				if (_vm:to_table_with_key(_err, '_isType.sling.common.ReferenceError') ~= nil) then
					local e = _err
					error = e
					code = nil
				else
					_vm:throw_error(_err)
				end
			end
		end
		do _g.jk.log.Log:status(self.ctx, nil) end
		if error ~= nil then
			_vm:throw_error(error)
		end
		do return code end
	end
end

function sling.compiler.SlingCompiler:tryReadCodeFile(file)
	if not (file ~= nil) then
		do return nil end
	end
	if not file:isFile() then
		do return nil end
	end
	if file:hasExtension("sling") then
		do return self:readCodeFile(file, _g.sling.parser.SlingParser._construct0(_g.sling.parser.SlingParser._create()), true) end
	end
	do return nil end
end

function sling.compiler.SlingCompiler:processDirectoryToVector(dir, container)
	if not (dir ~= nil) then
		do return 0 end
	end
	do
		local v = 0
		local it = dir:entries()
		while it ~= nil do
			local ff = it:next()
			if not (ff ~= nil) then
				do break end
			end
			if ff:isDirectory() then
				local dn = _g.sling.common.CodeDirectoryNode._construct0(_g.sling.common.CodeDirectoryNode._create())
				do dn:setName(ff:getBasename()) end
				do
					local vv = {}
					local r = self:processDirectoryToVector(ff, vv)
					do dn:setNodes(vv) end
					if r > 0 then
						do _g.jk.lang.Vector:append(container, dn) end
					end
					v = v + r
				end
			else
				local cf = self:tryReadCodeFile(ff)
				if cf ~= nil then
					do _g.jk.lang.Vector:append(container, cf) end
					do v = v + 1 end
				end
			end
		end
		do return v end
	end
end

function sling.compiler.SlingCompiler:readModuleSourceCodeFromFile(file)
	if not (file ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null file for readModuleSourceCodeFromFile", nil, nil))
	end
	do
		local moduleId = self:getModuleId(file)
		if _g.jk.lang.String:isEmpty(moduleId) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Empty module ID for file: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'", nil, nil))
		end
		do self:logDebug("Reading source code for module `" .. _g.jk.lang.String:safeString(moduleId) .. "': `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'") end
		do
			local v = nil
			if file:isFile() then
				local cf = self:tryReadCodeFile(file)
				if not (cf ~= nil) then
					cf = self:readCodeFile(file, _g.sling.parser.SlingParser._construct0(_g.sling.parser.SlingParser._create()), true)
				end
				v = _g.sling.common.CodeUnitNode._construct0(_g.sling.common.CodeUnitNode._create())
				do v:setName(moduleId) end
				do v:addToNodes(cf) end
			elseif file:isDirectory() then
				v = _g.sling.common.CodeUnitNode._construct0(_g.sling.common.CodeUnitNode._create())
				do v:setName(moduleId) end
				do
					local vv = {}
					local r = self:processDirectoryToVector(file, vv)
					do v:setNodes(vv) end
					if r < 1 then
						v = nil
					end
				end
			else
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Not a valid module: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'", nil, nil))
			end
			do return v end
		end
	end
end

function sling.compiler.SlingCompiler:readModuleSourceCodeFromString(moduleName, string)
	local file = self:readSlingString(string, moduleName)
	if not (file ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to read module source code from string.", nil, nil))
	end
	do
		local v = _g.sling.common.CodeUnitNode._construct0(_g.sling.common.CodeUnitNode._create())
		do v:setName(moduleName) end
		do v:addToNodes(file) end
		do return v end
	end
end

function sling.compiler.SlingCompiler:readAndPreprocessModuleSourceCode(file, customPlingOptions)
	local moduleId = self:getModuleId(file)
	local mod = self:readModuleSourceCodeFromFile(file)
	if not (mod ~= nil) then
		do return nil end
	end
	do
		local options = self:getModuleConfiguration(file, customPlingOptions)
		if options ~= nil then
			local moduleImports = options:getImports()
			if moduleImports ~= nil then
				local array = _g.sling.util.NodeFinder:findCompatibleNodes(mod, "class:sling.model.EntityDeclarationNode", false, true, false)
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local e = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.EntityDeclarationNode')
							if e ~= nil then
								if (_vm:to_table_with_key(e:getParent(), '_isType.sling.model.EntityDeclarationNode') ~= nil) then
									goto _continue44
								end
								if moduleImports ~= nil then
									local n2 = 0
									local m2 = _g.jk.lang.Vector:getSize(moduleImports)
									do
										n2 = 0
										while n2 < m2 do
											local imp = (function(o)
												if (_vm:get_variable_type(o) == 'string') then
													do return o end
												end
												do return nil end
											end)(moduleImports[n2 + 1])
											if imp ~= nil then
												do e:addToImportNamespaces(_g.sling.model.SymbolNode:forVectorOfNames(_g.jk.text.StringUtil:toObjectVector(_g.jk.lang.String:split(imp, 46, 0)))) end
											end
											do n2 = n2 + 1 end
										end
									end
								end
							end
							::_continue44::
							do n = n + 1 end
						end
					end
				end
			end
			if options:getIgnoreModuleIdInNamespace() then
				do mod:renameNode(nil) end
			end
		end
		do self:preprocessModule(moduleId, mod, options) end
		do return mod end
	end
end

function sling.compiler.SlingCompiler:preprocessModule(moduleId, mod, opts)
	local options = opts
	if not (options ~= nil) then
		options = _g.sling.model.ext.NSlingUnitSettings._construct0(_g.sling.model.ext.NSlingUnitSettings._create())
	end
	do
		local moduleDefines = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		local cversion = self.compilerVersion
		if not (cversion ~= nil) then
			cversion = "0.35.0"
		end
		do moduleDefines:setString("slingCompilerVersion", cversion) end
		do moduleDefines:setString("targetPlatformId", self:getTargetPlatformId()) end
		do moduleDefines:setString("targetPlatformName", self:getTargetPlatformName()) end
		do moduleDefines:setString("projectVersion", options:getProjectVersion()) end
		do moduleDefines:setString("projectId", options:getProjectId()) end
		do moduleDefines:setString("projectName", options:getProjectId()) end
		do moduleDefines:setString("projectTitle", options:getProjectTitle()) end
		do moduleDefines:setString("projectDescription", options:getProjectDescription()) end
		do moduleDefines:setString("projectCopyright", options:getProjectCopyright()) end
		do moduleDefines:setString("projectLicense", options:getProjectLicense()) end
		do moduleDefines:setString("moduleId", options:getModuleId()) end
		do moduleDefines:setString("moduleName", options:getModuleId()) end
		do moduleDefines:setString("moduleTitle", options:getModuleTitle()) end
		do moduleDefines:setString("moduleDescription", options:getModuleDescription()) end
		do moduleDefines:setString("target_platformid", self:getTargetPlatformId()) end
		do moduleDefines:setString("target_platform", self:getTargetPlatformName()) end
		do moduleDefines:setString("sling_compiler", "true") end
		do moduleDefines:setString("sling_compiler_version", cversion) end
		do moduleDefines:setString("sling_project_version", options:getProjectVersion()) end
		do moduleDefines:setString("sling_project_id", options:getProjectId()) end
		do moduleDefines:setString("sling_project_name", options:getProjectId()) end
		do moduleDefines:setString("sling_project_title", options:getProjectTitle()) end
		do moduleDefines:setString("sling_project_description", options:getProjectDescription()) end
		do moduleDefines:setString("sling_project_copyright", options:getProjectCopyright()) end
		do moduleDefines:setString("sling_project_license", options:getProjectLicense()) end
		do moduleDefines:setString("sling_module_id", options:getModuleId()) end
		do moduleDefines:setString("sling_module_name", options:getModuleId()) end
		do moduleDefines:setString("sling_module_title", options:getModuleTitle()) end
		do moduleDefines:setString("sling_module_description", options:getModuleDescription()) end
		do moduleDefines:setString("name", options:getProjectId()) end
		do moduleDefines:setString("title", options:getProjectTitle()) end
		do moduleDefines:setString("displayname", options:getProjectTitle()) end
		do moduleDefines:setString("version", options:getProjectVersion()) end
		do self:getDefines(moduleDefines) end
		do moduleDefines:mergeFrom(options:getDefines()) end
		do moduleDefines:mergeFrom(self.customDefines) end
		if self.ctx ~= nil and self.ctx:isInDebugMode() then
			do _g.jk.log.Log:debug(self.ctx, "Preprocessing with these defines: `" .. _g.jk.lang.String:safeString(_g.jk.json.JSONEncoder:encode(moduleDefines, false, false)) .. "'") end
		end
		do _g.sling.compiler.SlingOps:preprocess(self.ctx, mod, moduleDefines) end
		if options:getUseJkop() == false then
			local array = _g.sling.util.NodeFinder:findCompatibleNodes(mod, "class:sling.model.EntityDeclarationNode", false, true, false)
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local decl = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.EntityDeclarationNode')
						if decl ~= nil then
							do _g.sling.util.ModifierUtil:addAnnotationModifier(decl, "nojkop") end
						end
						do n = n + 1 end
					end
				end
			end
		end
		do options:setIsMainUnit(false) end
		do mod:setSettings(options, false) end
		if not (moduleId == "jk.lang") then
			do _g.sling.compiler.JkopOps:addJkopAutomaticImports(self.ctx, mod) end
		end
		do self:executePreprocessorFilters(mod) end
	end
end

function sling.compiler.SlingCompiler:executePreprocessorFilters(mod)
	local ph = _g.sling.compiler.ProgressHelper:forMaximumValue(self.ctx, "Preprocessing", 9 + _g.jk.lang.Vector:getSize(self.customPreprocessors))
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:consolidateEntities(self.ctx, mod) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:preprocessProperties(self.ctx, mod) end
	do ph:onUpdate() end
	do _g.sling.compiler.JkopOps:convertModelsToJkop(self.ctx, mod) end
	do ph:onUpdate() end
	do _g.sling.compiler.JcoOps:convertUIExpressionsToWidgets(self.ctx, mod) end
	do ph:onUpdate() end
	do _g.sling.compiler.JkopOps:convertWebApiToSympathy(self.ctx, mod) end
	do ph:onUpdate() end
	do _g.sling.compiler.JkopOps:convertWebApi2ToSympathy(self.ctx, mod) end
	do ph:onUpdate() end
	do _g.sling.compiler.JkopOps:protectStringConcatenationExpressions(self.ctx, mod) end
	do ph:onUpdate() end
	do _g.sling.compiler.JkopOps:processCriticalSections(self.ctx, mod) end
	do ph:onUpdate() end
	do _g.sling.compiler.Samtree2Ops:execute(self.ctx, mod) end
	if self.customPreprocessors ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.customPreprocessors)
		do
			n = 0
			while n < m do
				local pp = self.customPreprocessors[n + 1]
				if pp ~= nil then
					do ph:onUpdate() end
					do pp(self.ctx, mod) end
				end
				do n = n + 1 end
			end
		end
	end
	do ph:_end() end
end

function sling.compiler.SlingCompiler:initializeOutputDirectory(output)
	if not (output ~= nil) then
		do return end
	end
	if output:exists() then
		if output:removeRecursive() == false then
			local dbg = false
			if self.ctx ~= nil then
				dbg = self.ctx:isInDebugMode()
			end
			do
				local emsg = _g.sling.common.ErrorMessage:forText("FAILED to delete existing output directory: `" .. _g.jk.lang.String:safeString(output:getPath()) .. "'", nil, dbg, nil)
				local lerr = output:getLastErrorDescription()
				if _g.jk.lang.String:isEmpty(lerr) then
					lerr = "(no details for the error)"
				end
				do emsg:addRelatedMessage(_g.sling.common.ErrorMessage:forText(lerr, nil, dbg, nil)) end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage(emsg:toStringWithDebug(dbg), nil, nil))
			end
		end
		if output:exists() then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Output directory was successfully deleted, but the directory still exists! `" .. _g.jk.lang.String:safeString(output:getPath()) .. "'", nil, nil))
		end
	end
	do output:createDirectoryRecursive() end
end

function sling.compiler.SlingCompiler:getDependencyModulesFromFile(file)
	if not (file ~= nil) then
		do return nil end
	end
	do
		local v = {}
		local array = file:readLinesVector()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local line = array[n + 1]
					if line ~= nil then
						if _g.jk.lang.String:isNotEmpty(line) then
							do _g.jk.lang.Vector:append(v, line) end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do return v end
	end
end

function sling.compiler.SlingCompiler:writeDependenciesToFile(deps, file)
	if not (file ~= nil) then
		do return end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		if deps ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(deps)
			do
				n = 0
				while n < m do
					local dp = deps[n + 1]
					if dp ~= nil then
						do sb:appendString(dp) end
						do sb:appendCharacter(10) end
					end
					do n = n + 1 end
				end
			end
		end
		do
			local str = sb:toString()
			if not (str ~= nil) then
				str = ""
			end
			if not file:setContentsUTF8(str) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to write file: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'", nil, nil))
			end
		end
	end
end

function sling.compiler.SlingCompiler:getModuleInfo(name)
	local v = _g.jk.lang.Map:get(self.infomapCompiled, name)
	if v ~= nil then
		do return v end
	end
	do return _g.jk.lang.Map:get(self.infomapLibraries, name) end
end

function sling.compiler.SlingCompiler:getCompiledModuleInfo(name)
	do return _g.jk.lang.Map:get(self.infomapCompiled, name) end
end

function sling.compiler.SlingCompiler:updateModuleInfo(name, info)
	self.infomapCompiled[name] = info
end

function sling.compiler.SlingCompiler:getFileTimestamp(file)
	if not (file ~= nil) then
		do return 0 end
	end
	if file:isFile() == false then
		do return 0 end
	end
	do return file:getLastModifiedTimeStamp() end
end

function sling.compiler.SlingCompiler:getDirectoryTimestamp(dir)
	if dir:isFile() then
		do return self:getFileTimestamp(dir) end
	end
	do
		local v = 0
		local ff = _g.jk.fs.FileFinder:forRoot(dir)
		while true do
			local file = ff:next()
			if not (file ~= nil) then
				do break end
			end
			do
				local ts = file:getLastModifiedTimeStamp()
				if ts > v then
					v = ts
				end
			end
		end
		do return v end
	end
end

function sling.compiler.SlingCompiler:readDependencyHeaders(deps, modules, processed)
	if deps ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(deps)
		do
			n = 0
			while n < m do
				local dep = deps[n + 1]
				if dep ~= nil then
					if processed:contains(dep) then
						goto _continue45
					end
					do processed:add(dep) end
					do
						local info = self:getModuleInfo(dep)
						if not (info ~= nil) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No module info for dependency: `" .. _g.jk.lang.String:safeString(dep) .. "'", nil, nil))
						end
						do
							local header = info:getHeader()
							if not (header ~= nil) then
								do self:logDebug("Read dependency header `" .. _g.jk.lang.String:safeString(dep) .. "' ..") end
								header = _g.sling.common.CodeUnitNode._construct0(_g.sling.common.CodeUnitNode._create())
								do
									local ff = self:readCodeFile(info:getApifile(), _g.sling.parser.SlingParser._construct0(_g.sling.parser.SlingParser._create()), false)
									do _g.sling.compiler.SlingOps:consolidateEntities(self.ctx, ff) end
									do header:addToNodes(ff) end
									do info:setHeader(header) end
								end
							else
								do self:logDebug("Read dependency header `" .. _g.jk.lang.String:safeString(dep) .. "': Cached") end
							end
							do self:readDependencyHeaders(info:getDependencies(), modules, processed) end
							do
								local dupped = _g.sling.util.NodeUtil:dupAsNode(header)
								if not (dupped ~= nil) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to duplicate header node", header, nil))
								end
								do
									local duppedCodeUnit = _vm:to_table_with_key(dupped, '_isType.sling.common.CodeUnitNode')
									if not (duppedCodeUnit ~= nil) then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Dupped header node is not CodeUnitNode", dupped, nil))
									end
									do _g.jk.lang.Vector:append(modules, duppedCodeUnit) end
								end
							end
						end
					end
				end
				::_continue45::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingCompiler:normalize(node, resolver)
	local ph = _g.sling.compiler.ProgressHelper:forFirstHalf(self.ctx, "Normalizing", 35)
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:performCommonAdjustments(self.ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:addReturnToMainFunction(self.ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:removeComments(self.ctx, node) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:addDefaultModifiersToDeclarations(node) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:expandMacros(self.ctx, node, resolver, false) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:expandFileSystemReferenceExpressions(self.ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:expandStubFunctions(self.ctx, node) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:expandVariablesWithPropertyModifier(self.ctx, resolver, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:forceUnresolveSymbols(node) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:createSlingConstructors(self.ctx, resolver, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:forceUnresolveSymbols(node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:removeEmptyNamespaces(self.ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:expandAssertStatements(self.ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:expandErrorStatements(self.ctx, node) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:expandFailureLiterals(self.ctx, node, resolver) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:expandVariableDeclarationExpressionsInIfStatements(self.ctx, node) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:expandElseBlocksInLoopDeclarations(self.ctx, node) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:transferTrailingParametersToParameters(node) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:convertRangeExpressionsToJkopRange(node) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:convertReferenceSubscriptsToFunctionCalls(node, resolver) end
	do ph:onUpdate() end
	do resolver:execute(node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:removeExpressionDataTypeNodes(self.ctx, node) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:processStringComparisonOperators(self.ctx, node) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:processAdditionOperators(self.ctx, node) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:expandMembershipCheckExpressions(node) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:expandForeachStatementsStatic(self.ctx, resolver, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:setDefaultValuesInVariableDeclarations(self.ctx, node) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:processDefaultDataTypeValues(self.ctx, node, false, resolver) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:expandThisReferences(self.ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:addAwaitAndAsyncModifiers(node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:flattenPromiseExpressions(node) end
	do ph:onUpdate() end
	do resolver:execute(node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:fixInheritanceTypes(self.ctx, resolver, node) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:performAutomaticTypeConversions(self.ctx, resolver, node) end
	do ph:onUpdate() end
	do resolver:resolveBaseClassDeclarationsForMethods(self.ctx, node) end
	do ph:_end() end
end

function sling.compiler.SlingCompiler:processModuleByPath(module, customPlingOptions)
	if not (module ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null module", nil, nil))
	end
	if not _g.sling.compiler.SlingCompiler:isSlingModule(module) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Not a sling module: `" .. _g.jk.lang.String:safeString(module:getPath()) .. "'", nil, nil))
	end
	do
		local moduleId = self:getModuleId(module)
		if not (moduleId ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No module ID", nil, nil))
		end
		do
			local info = self:getCompiledModuleInfo(moduleId)
			if info ~= nil then
				do self:logDebug("Module `" .. _g.jk.lang.String:safeString(moduleId) .. "' already processed. Not processing: `" .. _g.jk.lang.String:safeString(module:getPath()) .. "'.") end
				do
					local ts = info:getTimestamp()
					if ts < 1 then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Circular dependency detected: `" .. _g.jk.lang.String:safeString(moduleId) .. "'", nil, nil))
					end
					do return ts end
				end
			end
			do self:changeDepth(1) end
			do self:logDebug("Processing: `" .. _g.jk.lang.String:safeString(module:getPath()) .. "' ..") end
			info = _g.sling.compiler.LinkableModuleInfo._construct0(_g.sling.compiler.LinkableModuleInfo._create())
			do info:setModuleId(moduleId) end
			do self:updateModuleInfo(moduleId, info) end
			do
				local targetdir = self:getBuildDirFor(module)
				if not (targetdir ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No targetdir", nil, nil))
				end
				do self:logDebug("Target directory for `" .. _g.jk.lang.String:safeString(moduleId) .. "': `" .. _g.jk.lang.String:safeString(targetdir:getPath()) .. "'") end
				do
					local apifile = targetdir:entry(_g.jk.lang.String:safeString(moduleId) .. ".sling")
					local depfile = targetdir:entry(_g.jk.lang.String:safeString(moduleId) .. ".deps")
					do info:setLinkTarget(self:getLinkTargetFile(targetdir, moduleId)) end
					do info:setApifile(apifile) end
					do info:setDepfile(depfile) end
					do
						local doBuild = false
						local code = nil
						local deps = nil
						local lastBuildTimestamp = self:getFileTimestamp(depfile)
						local sourceCodeTimestamp = self:getDirectoryTimestamp(module)
						if self.rebuildAll == false and sourceCodeTimestamp <= lastBuildTimestamp then
							deps = self:getDependencyModulesFromFile(depfile)
						else
							doBuild = true
							code = self:readAndPreprocessModuleSourceCode(module, customPlingOptions)
							deps = self:getDependencyModulesForTree(code, moduleId)
						end
						do
							local selfdep = false
							if deps ~= nil then
								local n = 0
								local m = _g.jk.lang.Vector:getSize(deps)
								do
									n = 0
									while n < m do
										local dep = deps[n + 1]
										if dep ~= nil then
											if dep == moduleId then
												selfdep = true
												do break end
											end
										end
										do n = n + 1 end
									end
								end
							end
							if selfdep then
								do self:logWarning("Module `" .. _g.jk.lang.String:safeString(moduleId) .. "' depends on itself. Ignoring the self-dependency.") end
								do
									local ndeps = {}
									if deps ~= nil then
										local n2 = 0
										local m2 = _g.jk.lang.Vector:getSize(deps)
										do
											n2 = 0
											while n2 < m2 do
												local dep = deps[n2 + 1]
												if dep ~= nil then
													if not (dep == moduleId) then
														do _g.jk.lang.Vector:append(ndeps, dep) end
													end
												end
												do n2 = n2 + 1 end
											end
										end
									end
									deps = ndeps
								end
							end
							do info:setDependencies(deps) end
							do
								local depts = 0
								if deps ~= nil then
									local n3 = 0
									local m3 = _g.jk.lang.Vector:getSize(deps)
									do
										n3 = 0
										while n3 < m3 do
											local dep = deps[n3 + 1]
											if dep ~= nil then
												do self:logDebug("Processing dependency of `" .. _g.jk.lang.String:safeString(moduleId) .. "': `" .. _g.jk.lang.String:safeString(dep) .. "'") end
												do
													local ts = self:processModuleByName(dep)
													if ts > depts then
														depts = ts
													end
												end
											end
											do n3 = n3 + 1 end
										end
									end
								end
								if depts > lastBuildTimestamp then
									doBuild = true
								end
								if doBuild then
									do self:logInfo("Building: `" .. _g.jk.lang.String:safeString(module:getPath()) .. "' ..") end
									if not (code ~= nil) then
										code = self:readAndPreprocessModuleSourceCode(module, customPlingOptions)
									end
									do
										local modules = {}
										do _g.jk.lang.Vector:append(modules, code) end
										do self:logDebug("Reading dependency headers of `" .. _g.jk.lang.String:safeString(moduleId) .. "' ..") end
										do self:readDependencyHeaders(deps, modules, _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())) end
										do
											local tree = _g.sling.compiler.SlingOps:transformToProcessingTree(self.ctx, modules)
											if not (tree ~= nil) then
												_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to transform code units to processing tree", nil, nil))
											end
											do
												local resolver = _g.sling.compiler.SlingTypeResolver._construct0(_g.sling.compiler.SlingTypeResolver._create())
												do self:normalize(tree, resolver) end
												do targetdir:removeRecursive() end
												do targetdir:createDirectoryRecursive() end
												do
													local _status, _err = _vm:execute_protected_call(function()
														do _g.sling.compiler.SlingOps:validateTree(self.ctx, resolver, tree) end
														do
															local owm = _g.sling.common.StringOutputWriterManager._construct0(_g.sling.common.StringOutputWriterManager._create())
															do _g.sling.generator.SlingGenerator._construct2(_g.sling.generator.SlingGenerator._create(), self.ctx, owm):dumpHeader(tree, moduleId) end
															do
																local apistring = owm:toString()
																if apistring ~= nil then
																	local existingapi = apifile:getContentsUTF8()
																	if existingapi == nil or not (apistring == existingapi) then
																		do apifile:setContentsUTF8(apistring) end
																	end
																end
																do self:writeDependenciesToFile(self:getDependencyModulesForTree(tree, nil), depfile) end
																do _g.sling.compiler.SlingOps:removeMacroDeclarations(self.ctx, tree) end
																do _g.sling.compiler.SlingOps:processTypedefEntities(self.ctx, tree, resolver) end
																do self:transform(self.ctx, tree, resolver) end
																do self:executePostFilters(tree) end
																do _g.sling.op.CommonOps:removeHeaderDeclarations(self.ctx, tree) end
																do _g.sling.op.CommonOps:removeEmptyNamespaces(self.ctx, tree) end
																do self:writeModuleSources(self.ctx, tree, targetdir, moduleId) end
															end
														end
													end)
													if _err then
														if (_vm:to_table_with_key(_err, '_isType.sling.common.ReferenceError') ~= nil) then
															local e = _err
															do targetdir:removeRecursive() end
															_vm:throw_error(e)
														else
															_vm:throw_error(_err)
														end
													end
												end
												do self:logInfo("Built: `" .. _g.jk.lang.String:safeString(moduleId) .. "'") end
											end
										end
									end
								else
									do self:logDebug("Already up to date: `" .. _g.jk.lang.String:safeString(moduleId) .. "'") end
								end
								do info:setTimestamp(self:getFileTimestamp(apifile)) end
								do self:changeDepth(-1) end
								do return info:getTimestamp() end
							end
						end
					end
				end
			end
		end
	end
end

function sling.compiler.SlingCompiler:processModuleByName(name)
	local module = self:findSlingModuleInIncludes(name)
	if module ~= nil then
		do return self:processModuleByPath(module, nil) end
	end
	do
		local info = self:getModuleInfo(name)
		if info ~= nil then
			local ts = info:getTimestamp()
			if ts >= 0 then
				do return ts end
			end
		end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to find required module: `" .. _g.jk.lang.String:safeString(name) .. "'", nil, nil))
		do return 0 end
	end
end

function sling.compiler.SlingCompiler:addToModuleInfos(v, ids, handled)
	if ids ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(ids)
		do
			n = 0
			while n < m do
				local id = ids[n + 1]
				if id ~= nil then
					if handled:contains(id) then
						goto _continue46
					end
					do handled:add(id) end
					do
						local mi = self:getModuleInfo(id)
						if not (mi ~= nil) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to find module: `" .. _g.jk.lang.String:safeString(id) .. "'", nil, nil))
						end
						do self:addToModuleInfos(v, mi:getDependencies(), handled) end
						do _g.jk.lang.Vector:append(v, mi) end
					end
				end
				::_continue46::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingCompiler:toModuleInfos(modules)
	local v = {}
	local ids = {}
	if modules ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(modules)
		do
			n = 0
			while n < m do
				local module = modules[n + 1]
				if module ~= nil then
					do _g.jk.lang.Vector:append(ids, self:getModuleId(module)) end
				end
				do n = n + 1 end
			end
		end
	end
	do
		local handled = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
		do self:addToModuleInfos(v, ids, handled) end
		do return v end
	end
end

function sling.compiler.SlingCompiler:getAllModulesForSource(source)
	if not (source ~= nil) then
		do return nil end
	end
	do
		local v = {}
		do _g.jk.lang.Vector:append(v, source) end
		do return self:toModuleInfos(v) end
	end
end

sling.compiler.SlingCompiler.CompileLibraryResult = {}
sling.compiler.SlingCompiler.CompileLibraryResult.__index = sling.compiler.SlingCompiler.CompileLibraryResult
_vm:set_metatable(sling.compiler.SlingCompiler.CompileLibraryResult, {})

function sling.compiler.SlingCompiler.CompileLibraryResult._create()
	local v = _vm:set_metatable({}, sling.compiler.SlingCompiler.CompileLibraryResult)
	return v
end

function sling.compiler.SlingCompiler.CompileLibraryResult:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.SlingCompiler.CompileLibraryResult'
	self['_isType.sling.compiler.SlingCompiler.CompileLibraryResult'] = true
	self.namespace = nil
	self.name = nil
	self.version = nil
	self.platform = nil
	self.file = nil
	self.wasModified = false
end

function sling.compiler.SlingCompiler.CompileLibraryResult:_construct0()
	sling.compiler.SlingCompiler.CompileLibraryResult._init(self)
	return self
end

function sling.compiler.SlingCompiler.CompileLibraryResult:getNamespace()
	do return self.namespace end
end

function sling.compiler.SlingCompiler.CompileLibraryResult:setNamespace(v)
	self.namespace = v
	do return self end
end

function sling.compiler.SlingCompiler.CompileLibraryResult:getName()
	do return self.name end
end

function sling.compiler.SlingCompiler.CompileLibraryResult:setName(v)
	self.name = v
	do return self end
end

function sling.compiler.SlingCompiler.CompileLibraryResult:getVersion()
	do return self.version end
end

function sling.compiler.SlingCompiler.CompileLibraryResult:setVersion(v)
	self.version = v
	do return self end
end

function sling.compiler.SlingCompiler.CompileLibraryResult:getPlatform()
	do return self.platform end
end

function sling.compiler.SlingCompiler.CompileLibraryResult:setPlatform(v)
	self.platform = v
	do return self end
end

function sling.compiler.SlingCompiler.CompileLibraryResult:getFile()
	do return self.file end
end

function sling.compiler.SlingCompiler.CompileLibraryResult:setFile(v)
	self.file = v
	do return self end
end

function sling.compiler.SlingCompiler.CompileLibraryResult:getWasModified()
	do return self.wasModified end
end

function sling.compiler.SlingCompiler.CompileLibraryResult:setWasModified(v)
	self.wasModified = v
	do return self end
end

function sling.compiler.SlingCompiler:compileSlingLibrary(src, moduleDirs, outfile, outdir, customPlingOptions, incremental)
	if src ~= nil then
		do _g.jk.log.Log:debug(self.ctx, "Compiling library: `" .. _g.jk.lang.String:safeString(src:getPath()) .. "' ..") end
	else
		do _g.jk.log.Log:debug(self.ctx, "Compiling library ..") end
	end
	do
		local namespace = nil
		local name = nil
		local version = nil
		local title = nil
		local description = nil
		local copyright = nil
		local license = nil
		local libraries = nil
		local pmap = nil
		if src ~= nil then
			local pling = src:entry("project.slon")
			if not pling:isFile() then
				pling = src:entry("project.pling")
			end
			if pling:isFile() then
				local cpo = customPlingOptions
				if not (cpo ~= nil) then
					cpo = self:getCustomPlingOptions()
				end
				pmap = _g.sling.parser.PlingParser._construct1(_g.sling.parser.PlingParser._create(), self.ctx):parseFileAsUnitSettings(pling, nil, cpo)
			else
				do _g.jk.log.Log:warning(self.ctx, "Library project has no project file: `" .. _g.jk.lang.String:safeString(src:getPath()) .. "'") end
			end
		end
		if not (pmap ~= nil) and customPlingOptions ~= nil then
			pmap = _g.sling.parser.PlingParser._construct1(_g.sling.parser.PlingParser._create(), self.ctx):createSettingsForMap(customPlingOptions)
		end
		if pmap ~= nil then
			namespace = pmap:getVendorId()
			name = pmap:getProjectId()
			version = pmap:getProjectVersion()
			title = pmap:getProjectTitle()
			description = pmap:getProjectDescription()
			copyright = pmap:getProjectCopyright()
			license = pmap:getProjectLicense()
			libraries = pmap:getLibraries()
		end
		if _g.jk.lang.String:isEmpty(version) then
			version = _g.sling.compiler.SlingCompiler:getGlobalBuildVersion()
		end
		do
			local psrc = nil
			if src ~= nil then
				psrc = _g.sling.common.StaticSourceReference:forFile(src)
			end
			if _g.jk.lang.String:isEmpty(namespace) then
				do _g.sling.common.RefLog:warning(self.ctx, "No `vendorId' defined for project.", psrc) end
			end
			if _g.jk.lang.String:isEmpty(name) then
				do _g.sling.common.RefLog:warning(self.ctx, "No `projectId' defined for project.", psrc) end
			end
			if _g.jk.lang.String:isEmpty(version) then
				do _g.sling.common.RefLog:warning(self.ctx, "No `projectVersion' defined for project.", psrc) end
			end
			libraries = _g.sling.compiler.LibraryManager:substituteCustomLibraries(libraries, self.customLibs)
			do
				local outputfile = outfile
				if not (outputfile ~= nil) then
					local outputdir = outdir
					if not (outputdir ~= nil) and src ~= nil then
						outputdir = src:getParent()
					end
					if outputdir ~= nil and _g.jk.lang.String:isNotEmpty(namespace) and _g.jk.lang.String:isNotEmpty(name) and _g.jk.lang.String:isNotEmpty(version) then
						local filename = _g.jk.lang.String:safeString(namespace) .. "_" .. _g.jk.lang.String:safeString(name) .. "_" .. _g.jk.lang.String:safeString(version) .. "_" .. _g.jk.lang.String:safeString(self:getTargetPlatformId()) .. ".slib"
						outputfile = outputdir:entry(filename)
					end
				end
				if not (outputfile ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Output file was not specified and can not be automatically determined.", nil, nil))
					do return nil end
				end
				do
					local sources = {}
					if src ~= nil then
						local it = src:entries()
						while it ~= nil do
							local ff = it:next()
							if not (ff ~= nil) then
								do break end
							end
							if _g.sling.compiler.SlingCompiler:isSlingModule(ff) then
								do _g.jk.lang.Vector:append(sources, ff) end
							end
						end
					end
					if moduleDirs ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(moduleDirs)
						do
							n = 0
							while n < m do
								local moduleDir = moduleDirs[n + 1]
								if moduleDir ~= nil then
									local it = moduleDir:entries()
									while it ~= nil do
										local ff = it:next()
										if not (ff ~= nil) then
											do break end
										end
										if _g.sling.compiler.SlingCompiler:isSlingModule(ff) then
											do _g.jk.lang.Vector:append(sources, ff) end
										end
									end
								end
								do n = n + 1 end
							end
						end
					end
					if _g.jk.lang.Vector:isEmpty(sources) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No source modules found.", nil, nil))
					end
					if sources ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(sources)
						do
							n2 = 0
							while n2 < m2 do
								local source = sources[n2 + 1]
								if source ~= nil then
									do self:processModuleByPath(source, customPlingOptions) end
								end
								do n2 = n2 + 1 end
							end
						end
					end
					do
						local files = {}
						local resources = {}
						if sources ~= nil then
							local n3 = 0
							local m3 = _g.jk.lang.Vector:getSize(sources)
							do
								n3 = 0
								while n3 < m3 do
									local source = sources[n3 + 1]
									if source ~= nil then
										local bd = self:getBuildDirFor(source)
										if bd ~= nil then
											local id = self:getModuleId(source)
											id = _g.jk.lang.String:safeString(id) .. "."
											do
												local fit = bd:entries()
												while fit ~= nil do
													local ff = fit:next()
													if not (ff ~= nil) then
														do break end
													end
													do
														local fn = ff:getBasename()
														if not _g.jk.lang.String:startsWith(fn, id, 0) then
															goto _continue47
														end
														if _g.jk.lang.String:getIndexOfCharacter(fn, 46, _g.jk.lang.String:getLength(id)) >= 0 then
															goto _continue47
														end
														do _g.jk.lang.Vector:append(files, ff) end
													end
													::_continue47::
												end
												do
													local srcdir = bd:entry("src")
													if srcdir:isDirectory() then
														do _g.jk.lang.Vector:append(files, srcdir) end
													end
													do
														local resdir = bd:entry("resources")
														if resdir:isDirectory() then
															local rit = resdir:entries()
															while rit ~= nil do
																local ff = rit:next()
																if not (ff ~= nil) then
																	do break end
																end
																do _g.jk.lang.Vector:append(resources, ff) end
															end
														end
													end
												end
											end
										end
									end
									do n3 = n3 + 1 end
								end
							end
						end
						if incremental and outputfile:isFile() then
							local dobuild = false
							local outputfilets = outputfile:getLastModifiedTimeStamp()
							if files ~= nil then
								local n4 = 0
								local m4 = _g.jk.lang.Vector:getSize(files)
								do
									n4 = 0
									while n4 < m4 do
										local ff = files[n4 + 1]
										if ff ~= nil then
											if ff:getLastModifiedTimeStamp() > outputfilets then
												dobuild = true
												do break end
											end
										end
										do n4 = n4 + 1 end
									end
								end
							end
							if not dobuild then
								do _g.jk.log.Log:debug(self.ctx, "No changes: `" .. _g.jk.lang.String:safeString(outputfile:getPath()) .. "'") end
								do
									local v = _g.sling.compiler.SlingCompiler.CompileLibraryResult._construct0(_g.sling.compiler.SlingCompiler.CompileLibraryResult._create())
									do v:setNamespace(namespace) end
									do v:setName(name) end
									do v:setVersion(version) end
									do v:setPlatform(self:getTargetPlatformId()) end
									do v:setFile(outputfile) end
									do v:setWasModified(false) end
									do return v end
								end
							end
						end
						do
							local tmpdir = _g.jk.env.TemporaryDirectory:create()
							if not (tmpdir ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to create temporary directory for building slib", nil, nil))
							end
							do tmpdir:removeRecursive() end
							do tmpdir:createDirectoryRecursive() end
							if files ~= nil then
								local n5 = 0
								local m5 = _g.jk.lang.Vector:getSize(files)
								do
									n5 = 0
									while n5 < m5 do
										local ff = files[n5 + 1]
										if ff ~= nil then
											local fn = ff:getBasename()
											local dest = tmpdir:entry(fn)
											do _g.jk.log.Log:debug(self.ctx, "Copy: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(ff)) .. "' -> `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(dest)) .. "'") end
											if not ff:copyFileOrDirectoryTo(dest) then
												do tmpdir:removeRecursive() end
												_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to copy file: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(ff)) .. "'", nil, nil))
											end
										end
										do n5 = n5 + 1 end
									end
								end
							end
							if _g.jk.lang.Vector:isNotEmpty(resources) then
								local tmpresdir = tmpdir:entry("resources")
								do tmpresdir:createDirectoryRecursive() end
								if resources ~= nil then
									local n6 = 0
									local m6 = _g.jk.lang.Vector:getSize(resources)
									do
										n6 = 0
										while n6 < m6 do
											local ff = resources[n6 + 1]
											if ff ~= nil then
												local fn = ff:getBasename()
												local dest = tmpresdir:entry(fn)
												do _g.jk.log.Log:debug(self.ctx, "Copy resource: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(ff)) .. "' -> `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(dest)) .. "'") end
												if not ff:copyFileOrDirectoryTo(dest) then
													do tmpdir:removeRecursive() end
													_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to copy resource: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(ff)) .. "'", nil, nil))
												end
											end
											do n6 = n6 + 1 end
										end
									end
								end
							end
							do
								local manifest = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
								do manifest:setString("namespace", namespace) end
								do manifest:setString("name", name) end
								do manifest:setString("version", version) end
								do manifest:setString("title", title) end
								do manifest:setString("description", description) end
								do manifest:setString("copyright", copyright) end
								do manifest:setString("license", license) end
								if libraries ~= nil then
									local libs = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
									if libraries ~= nil then
										local n7 = 0
										local m7 = _g.jk.lang.Vector:getSize(libraries)
										do
											n7 = 0
											while n7 < m7 do
												local library = (function(o)
													if (_vm:get_variable_type(o) == 'string') then
														do return o end
													end
													do return nil end
												end)(libraries[n7 + 1])
												if library ~= nil then
													do libs:appendString(library) end
												end
												do n7 = n7 + 1 end
											end
										end
									end
									do manifest:setObject("libraries", libs) end
								end
								do
									local mfile = tmpdir:entry("slib.manifest")
									if not mfile:setContentsUTF8(_g.jk.json.JSONEncoder:encode(manifest, true, false)) then
										do tmpdir:removeRecursive() end
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to write slib manifest", nil, nil))
									end
									do outputfile:getParent():createDirectoryRecursive() end
									do
										local r = _g.jk.archive.ZipWriter:writeToZipRecursive(nil, outputfile, tmpdir, true)
										do tmpdir:removeRecursive() end
										if r == false or not outputfile:exists() then
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to create slib file: `" .. _g.jk.lang.String:safeString(outputfile:getPath()) .. "'", nil, nil))
										end
										do _g.jk.log.Log:info(self.ctx, "Compiled: `" .. _g.jk.lang.String:safeString(outputfile:getPath()) .. "'") end
										do
											local v = _g.sling.compiler.SlingCompiler.CompileLibraryResult._construct0(_g.sling.compiler.SlingCompiler.CompileLibraryResult._create())
											do v:setNamespace(namespace) end
											do v:setName(name) end
											do v:setVersion(version) end
											do v:setPlatform(self:getTargetPlatformId()) end
											do v:setFile(outputfile) end
											do v:setWasModified(true) end
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

function sling.compiler.SlingCompiler:getFinalVersion(version)
	local v = version
	if _g.jk.lang.String:isEmpty(v) then
		v = _g.sling.compiler.SlingCompiler:getGlobalBuildVersion()
	end
	do return v end
end

function sling.compiler.SlingCompiler:getFinalApplicationName(source, customName)
	local v = customName
	if _g.jk.lang.String:isEmpty(v) then
		v = self:getRawModuleId(source)
		if _g.jk.lang.String:isEmpty(v) then
			v = "application"
		end
	end
	do return v end
end

function sling.compiler.SlingCompiler:buildApplicationModules(source, customName, customVersion)
	local libraryManager = self:getLibraryManager()
	local incls = {}
	local array = self:getIncludes()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local incl = array[n + 1]
				if incl ~= nil then
					do _g.jk.lang.Vector:append(incls, incl) end
				end
				do n = n + 1 end
			end
		end
	end
	if source ~= nil then
		do _g.jk.lang.Vector:append(incls, source:getParent()) end
	end
	do self:setModuleInfoForLibraries(libraryManager:generateModuleInfosForBuild(self.ctx, incls, self:getCustomLibs())) end
	do self:setIncludes(incls) end
	do
		local cpo = self:getCustomPlingOptions()
		if _g.jk.lang.String:isNotEmpty(customVersion) then
			if not (cpo ~= nil) then
				cpo = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
			end
			do cpo:setString("projectVersion", customVersion) end
		end
		if _g.jk.lang.String:isNotEmpty(customName) then
			if not (cpo ~= nil) then
				cpo = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
			end
			do cpo:setString("projectId", customName) end
		end
		do self:processModuleByPath(source, cpo) end
	end
end

function sling.compiler.SlingCompiler:buildToSlingLibrary(source, output, customVersion, install)
	local version = self:getFinalVersion(customVersion)
	local libraryManager = self:getLibraryManager()
	local incls = {}
	local array = self:getIncludes()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local incl = array[n + 1]
				if incl ~= nil then
					do _g.jk.lang.Vector:append(incls, incl) end
				end
				do n = n + 1 end
			end
		end
	end
	do _g.jk.lang.Vector:append(incls, source) end
	do self:setModuleInfoForLibraries(libraryManager:generateModuleInfosForBuild(self.ctx, incls, self:getCustomLibs())) end
	do self:setIncludes(incls) end
	do
		local cpo = self:getCustomPlingOptions()
		local cve = version
		if _g.jk.lang.String:isNotEmpty(cve) then
			if not (cpo ~= nil) then
				cpo = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
			end
			do cpo:setString("projectVersion", cve) end
		end
		do
			local v = self:compileSlingLibrary(source, nil, nil, output, cpo, true)
			local vfile = v:getFile()
			do _g.jk.log.Log:info(self.ctx, "Library: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(vfile))) end
			if install and v:getWasModified() then
				if not libraryManager:installLibraryFromFile(self.ctx, vfile, true) then
					do _g.jk.lang.Error:throw("failedToInstall", vfile:getPath()) end
				end
			end
		end
	end
end

function sling.compiler.SlingCompiler:getIncludes()
	do return self.includes end
end

function sling.compiler.SlingCompiler:setIncludes(v)
	self.includes = v
	do return self end
end

function sling.compiler.SlingCompiler:getCustomDefines()
	do return self.customDefines end
end

function sling.compiler.SlingCompiler:setCustomDefines(v)
	self.customDefines = v
	do return self end
end

function sling.compiler.SlingCompiler:getCustomPlingOptions()
	do return self.customPlingOptions end
end

function sling.compiler.SlingCompiler:setCustomPlingOptions(v)
	self.customPlingOptions = v
	do return self end
end

function sling.compiler.SlingCompiler:getCompilerVersion()
	do return self.compilerVersion end
end

function sling.compiler.SlingCompiler:setCompilerVersion(v)
	self.compilerVersion = v
	do return self end
end

function sling.compiler.SlingCompiler:getCustomPreprocessors()
	do return self.customPreprocessors end
end

function sling.compiler.SlingCompiler:setCustomPreprocessors(v)
	self.customPreprocessors = v
	do return self end
end

function sling.compiler.SlingCompiler:getRebuildAll()
	do return self.rebuildAll end
end

function sling.compiler.SlingCompiler:setRebuildAll(v)
	self.rebuildAll = v
	do return self end
end

function sling.compiler.SlingCompiler:getCustomLibs()
	do return self.customLibs end
end

function sling.compiler.SlingCompiler:setCustomLibs(v)
	self.customLibs = v
	do return self end
end

function sling.compiler.SlingCompiler:getForcedLibraries()
	do return self.forcedLibraries end
end

function sling.compiler.SlingCompiler:setForcedLibraries(v)
	self.forcedLibraries = v
	do return self end
end

sling.compiler.Samtree2Ops = {}
sling.compiler.Samtree2Ops.__index = sling.compiler.Samtree2Ops
_vm:set_metatable(sling.compiler.Samtree2Ops, {})

function sling.compiler.Samtree2Ops._create()
	local v = _vm:set_metatable({}, sling.compiler.Samtree2Ops)
	return v
end

function sling.compiler.Samtree2Ops:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.Samtree2Ops'
	self['_isType.sling.compiler.Samtree2Ops'] = true
end

function sling.compiler.Samtree2Ops:_construct0()
	sling.compiler.Samtree2Ops._init(self)
	return self
end

sling.compiler.Samtree2Ops.ClassFinder = _g.sling.common.NodeVisitor._create()
sling.compiler.Samtree2Ops.ClassFinder.__index = sling.compiler.Samtree2Ops.ClassFinder
_vm:set_metatable(sling.compiler.Samtree2Ops.ClassFinder, {
	__index = _g.sling.common.NodeVisitor
})

function sling.compiler.Samtree2Ops.ClassFinder._create()
	local v = _vm:set_metatable({}, sling.compiler.Samtree2Ops.ClassFinder)
	return v
end

function sling.compiler.Samtree2Ops.ClassFinder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.Samtree2Ops.ClassFinder'
	self['_isType.sling.compiler.Samtree2Ops.ClassFinder'] = true
	self.classes = {}
end

function sling.compiler.Samtree2Ops.ClassFinder:_construct0()
	sling.compiler.Samtree2Ops.ClassFinder._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.compiler.Samtree2Ops.ClassFinder:visit(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.ClassDeclarationNode') ~= nil) and _g.sling.util.ModifierUtil:hasAnnotationModifier(node, "samnode") then
		do _g.jk.lang.Vector:append(self.classes, node) end
		do _g.sling.util.ModifierUtil:removeAnnotationModifier(node, "samnode") end
	end
	do return true end
end

function sling.compiler.Samtree2Ops.ClassFinder:getClasses()
	do return self.classes end
end

function sling.compiler.Samtree2Ops.ClassFinder:setClasses(v)
	self.classes = v
	do return self end
end

sling.compiler.Samtree2Ops.VariableFinder = _g.sling.common.NodeVisitor._create()
sling.compiler.Samtree2Ops.VariableFinder.__index = sling.compiler.Samtree2Ops.VariableFinder
_vm:set_metatable(sling.compiler.Samtree2Ops.VariableFinder, {
	__index = _g.sling.common.NodeVisitor
})

function sling.compiler.Samtree2Ops.VariableFinder._create()
	local v = _vm:set_metatable({}, sling.compiler.Samtree2Ops.VariableFinder)
	return v
end

function sling.compiler.Samtree2Ops.VariableFinder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.Samtree2Ops.VariableFinder'
	self['_isType.sling.compiler.Samtree2Ops.VariableFinder'] = true
	self.nodeVars = {}
	self.valueVars = {}
	self.vectorVars = {}
end

function sling.compiler.Samtree2Ops.VariableFinder:_construct0()
	sling.compiler.Samtree2Ops.VariableFinder._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.compiler.Samtree2Ops.VariableFinder:visit(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
		if _g.sling.util.ModifierUtil:hasAnnotationModifier(node, "node") then
			do _g.jk.lang.Vector:append(self.nodeVars, node) end
			do _g.sling.util.ModifierUtil:removeAnnotationModifier(node, "node") end
		elseif _g.sling.util.ModifierUtil:hasAnnotationModifier(node, "vector") then
			do _g.jk.lang.Vector:append(self.vectorVars, node) end
			do _g.sling.util.ModifierUtil:removeAnnotationModifier(node, "vector") end
		elseif _g.sling.util.ModifierUtil:hasAnnotationModifier(node, "value") then
			do _g.jk.lang.Vector:append(self.valueVars, node) end
			do _g.sling.util.ModifierUtil:removeAnnotationModifier(node, "value") end
		end
	end
	do return true end
end

function sling.compiler.Samtree2Ops.VariableFinder:getNodeVars()
	do return self.nodeVars end
end

function sling.compiler.Samtree2Ops.VariableFinder:setNodeVars(v)
	self.nodeVars = v
	do return self end
end

function sling.compiler.Samtree2Ops.VariableFinder:getValueVars()
	do return self.valueVars end
end

function sling.compiler.Samtree2Ops.VariableFinder:setValueVars(v)
	self.valueVars = v
	do return self end
end

function sling.compiler.Samtree2Ops.VariableFinder:getVectorVars()
	do return self.vectorVars end
end

function sling.compiler.Samtree2Ops.VariableFinder:setVectorVars(v)
	self.vectorVars = v
	do return self end
end

function sling.compiler.Samtree2Ops:modifyName(prefix, name)
	local sb = _g.jk.lang.StringBuilder:forString(prefix)
	local c0 = _g.jk.lang.String:getChar(name, 0)
	if c0 >= 97 and c0 <= 122 then
		do sb:appendCharacter(c0 - 97 + 65) end
		do sb:appendString(_g.jk.lang.String:getEndOfString(name, 1)) end
	else
		do sb:appendString(name) end
	end
	do return sb:toString() end
end

function sling.compiler.Samtree2Ops:execute(ctx, root)
	if not (root ~= nil) then
		do return end
	end
	do
		local cf = _g.sling.compiler.Samtree2Ops.ClassFinder._construct0(_g.sling.compiler.Samtree2Ops.ClassFinder._create())
		do root:acceptVisitor(cf) end
		do
			local array = cf:getClasses()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local class = array[n + 1]
						if class ~= nil then
							local gntn = nil
							if class:hasChildNode("getNodeTypeName") == false then
								gntn = _g.sling.model.FunctionDeclarationNode:forName("getNodeTypeName", true)
								do _g.sling.util.ModifierUtil:addCommonModifier(gntn, _g.sling.model.Modifier.OVERRIDE) end
								do gntn:setReturnType(_g.sling.model.StringDataTypeNode._construct0(_g.sling.model.StringDataTypeNode._create()), false) end
								do
									local lit = _g.sling.model.StringLiteralExpressionNode:forValue(class:getNodeName())
									do _g.sling.util.FunctionUtil:addStatement(gntn, _g.sling.model.ReturnStatementNode:forExpression(lit)) end
									do class:addNode(gntn) end
								end
							end
							do
								local createnew = nil
								if class:hasChildNode("createNew") == false and _g.sling.util.ModifierUtil:hasCommonModifier(class, _g.sling.model.Modifier.ABSTRACT) == false then
									createnew = _g.sling.model.FunctionDeclarationNode:forName("createNew", true)
									do _g.sling.util.ModifierUtil:addCommonModifier(createnew, _g.sling.model.Modifier.OVERRIDE) end
									do createnew:setReturnType(_g.sling.model.ReferenceDataTypeNode:forName("NodeObject"), false) end
									do _g.sling.util.FunctionUtil:addStatement(createnew, _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_CREATE_NEW")) end
									do class:addNode(createnew) end
								end
								do
									local copyto = nil
									if class:hasChildNode("copyTo") == false then
										copyto = _g.sling.model.FunctionDeclarationNode:forName("copyTo", true)
										do _g.sling.util.ModifierUtil:addCommonModifier(copyto, _g.sling.model.Modifier.OVERRIDE) end
										do copyto:setReturnType(_g.sling.model.BooleanDataTypeNode._construct0(_g.sling.model.BooleanDataTypeNode._create()), false) end
										do copyto:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.ReferenceDataTypeNode:forName("NodeObject"), "o", nil)) end
										do _g.sling.util.FunctionUtil:addStatement(copyto, _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_COPY_TO_BEGIN")) end
										do class:addNode(copyto) end
									end
									do
										local replacechild = nil
										if class:hasChildNode("replaceChild") == false then
											replacechild = _g.sling.model.FunctionDeclarationNode:forName("replaceChild", true)
											do _g.sling.util.ModifierUtil:addCommonModifier(replacechild, _g.sling.model.Modifier.OVERRIDE) end
											do replacechild:setReturnType(_g.sling.model.BooleanDataTypeNode._construct0(_g.sling.model.BooleanDataTypeNode._create()), false) end
											do replacechild:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.ReferenceDataTypeNode:forName("NodeObject"), "oldnode", nil)) end
											do replacechild:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.ReferenceDataTypeNode:forName("NodeObject"), "newnode", nil)) end
											do replacechild:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.BooleanDataTypeNode._construct0(_g.sling.model.BooleanDataTypeNode._create()), "doExport", nil)) end
											do _g.sling.util.FunctionUtil:addStatement(replacechild, _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_REPLACE_CHILD_BEGIN")) end
											do class:addNode(replacechild) end
										end
										do
											local acceptvisitor = nil
											if class:hasChildNode("acceptVisitor") == false then
												acceptvisitor = _g.sling.model.FunctionDeclarationNode:forName("acceptVisitor", true)
												do _g.sling.util.ModifierUtil:addCommonModifier(acceptvisitor, _g.sling.model.Modifier.OVERRIDE) end
												do acceptvisitor:setReturnType(_g.sling.model.BooleanDataTypeNode._construct0(_g.sling.model.BooleanDataTypeNode._create()), false) end
												do acceptvisitor:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.ReferenceDataTypeNode:forName("NodeVisitor"), "visitor", nil)) end
												do _g.sling.util.FunctionUtil:addStatement(acceptvisitor, _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_ACCEPT_VISITOR_BEGIN")) end
												do class:addNode(acceptvisitor) end
											end
											do
												local destroy = nil
												if class:hasChildNode("destroy") == false then
													destroy = _g.sling.model.FunctionDeclarationNode:forName("destroy", true)
													do _g.sling.util.ModifierUtil:addCommonModifier(destroy, _g.sling.model.Modifier.OVERRIDE) end
													do destroy:setReturnType(_g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()), false) end
													do _g.sling.util.FunctionUtil:addStatement(destroy, _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_DESTROY_BEGIN")) end
													do class:addNode(destroy) end
												end
												do
													local vf = _g.sling.compiler.Samtree2Ops.VariableFinder._construct0(_g.sling.compiler.Samtree2Ops.VariableFinder._create())
													do class:acceptVisitor(vf) end
													do
														local array2 = vf:getNodeVars()
														if array2 ~= nil then
															local n2 = 0
															local m2 = _g.jk.lang.Vector:getSize(array2)
															do
																n2 = 0
																while n2 < m2 do
																	local vv = array2[n2 + 1]
																	if vv ~= nil then
																		local vname = vv:getNodeName()
																		if _g.jk.lang.String:isEmpty(vname) then
																			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Variable name is empty", vv, nil))
																		end
																		if replacechild ~= nil then
																			local fc = _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_REPLACE_CHILD")
																			do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																			do _g.sling.util.FunctionUtil:addStatement(replacechild, fc) end
																		end
																		if copyto ~= nil then
																			local fc = _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_COPY_PROPERTY")
																			do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																			do _g.sling.util.FunctionUtil:addStatement(copyto, fc) end
																		end
																		if acceptvisitor ~= nil then
																			local fc = _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_VISIT_PROPERTY")
																			do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																			do _g.sling.util.FunctionUtil:addStatement(acceptvisitor, fc) end
																		end
																		if destroy ~= nil then
																			local fc = _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_DESTROY_PROPERTY")
																			do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																			do _g.sling.util.FunctionUtil:addStatement(destroy, fc) end
																		end
																		do
																			local nset = _g.sling.compiler.Samtree2Ops:modifyName("set", vname)
																			if class:hasChildNode(nset) == false then
																				local fset = _g.sling.model.FunctionDeclarationNode:forName(nset, true)
																				do fset:setReturnType(_g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()), false) end
																				do
																					local dt = _g.sling.util.DataTypeUtil:dupAsDataType(vv:getType())
																					do fset:addToParameters(_g.sling.model.VariableDeclarationNode:instance(dt, "v", nil)) end
																					do fset:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.BooleanDataTypeNode._construct0(_g.sling.model.BooleanDataTypeNode._create()), "doExport", _g.sling.model.BooleanLiteralExpressionNode:forValue(false))) end
																					do
																						local fc = _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_SET_PROPERTY")
																						do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																						do _g.sling.util.FunctionUtil:addStatement(fset, fc) end
																						do class:addNode(fset) end
																					end
																				end
																			end
																			do
																				local nget = _g.sling.compiler.Samtree2Ops:modifyName("get", vname)
																				if class:hasChildNode(nget) == false then
																					local fget = _g.sling.model.FunctionDeclarationNode:forName(nget, true)
																					local dt = _g.sling.util.DataTypeUtil:dupAsDataType(vv:getType())
																					do fget:setReturnType(dt, false) end
																					do
																						local fc = _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_GET_PROPERTY")
																						do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																						do _g.sling.util.FunctionUtil:addStatement(fget, fc) end
																						do class:addNode(fget) end
																					end
																				end
																				do
																					local nexp = _g.sling.compiler.Samtree2Ops:modifyName("export", vname)
																					if class:hasChildNode(nexp) == false then
																						local fexp = _g.sling.model.FunctionDeclarationNode:forName(nexp, true)
																						local dt = _g.sling.util.DataTypeUtil:dupAsDataType(vv:getType())
																						do fexp:setReturnType(dt, false) end
																						do
																							local fc = _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_EXPORT_PROPERTY")
																							do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																							do _g.sling.util.FunctionUtil:addStatement(fexp, fc) end
																							do class:addNode(fexp) end
																						end
																					end
																				end
																			end
																		end
																	end
																	do n2 = n2 + 1 end
																end
															end
														end
														do
															local array3 = vf:getValueVars()
															if array3 ~= nil then
																local n3 = 0
																local m3 = _g.jk.lang.Vector:getSize(array3)
																do
																	n3 = 0
																	while n3 < m3 do
																		local vv = array3[n3 + 1]
																		if vv ~= nil then
																			local vtype = vv:getType()
																			if not (vtype ~= nil) or (_vm:to_table_with_key(vtype, '_isType.sling.model.AutomaticDataTypeNode') ~= nil) then
																				local init = vv:getInitializer()
																				if not (init ~= nil) then
																					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Value variable has no data type or initializer", vv, nil))
																				end
																				do
																					local initdt = _g.sling.util.ExpressionUtil:getExpressionDataType(init, nil)
																					if not (initdt ~= nil) then
																						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Value variable initializer data type cannot be determined.", vv, nil))
																					end
																					vtype = initdt
																					do vv:setType(_g.sling.util.DataTypeUtil:dupAsDataType(vtype), false) end
																				end
																			end
																			do
																				local vname = vv:getNodeName()
																				if _g.jk.lang.String:isEmpty(vname) then
																					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Variable name is empty", vv, nil))
																				end
																				if copyto ~= nil then
																					local fc = _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_COPY_VALUE")
																					do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																					do _g.sling.util.FunctionUtil:addStatement(copyto, fc) end
																				end
																				do
																					local nset = _g.sling.compiler.Samtree2Ops:modifyName("set", vname)
																					if class:hasChildNode(nset) == false then
																						local fset = _g.sling.model.FunctionDeclarationNode:forName(nset, true)
																						do fset:setReturnType(_g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()), false) end
																						do
																							local dt = _g.sling.util.DataTypeUtil:dupAsDataType(vtype)
																							do fset:addToParameters(_g.sling.model.VariableDeclarationNode:instance(dt, "v", nil)) end
																							do
																								local fc = _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_SET_VALUE")
																								do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																								do _g.sling.util.FunctionUtil:addStatement(fset, fc) end
																								do class:addNode(fset) end
																							end
																						end
																					end
																					do
																						local nget = _g.sling.compiler.Samtree2Ops:modifyName("get", vname)
																						if class:hasChildNode(nget) == false then
																							local fget = _g.sling.model.FunctionDeclarationNode:forName(nget, true)
																							local dt = _g.sling.util.DataTypeUtil:dupAsDataType(vtype)
																							do fget:setReturnType(dt, false) end
																							do
																								local fc = _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_GET_VALUE")
																								do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																								do _g.sling.util.FunctionUtil:addStatement(fget, fc) end
																								do class:addNode(fget) end
																							end
																						end
																					end
																				end
																			end
																		end
																		do n3 = n3 + 1 end
																	end
																end
															end
															do
																local array4 = vf:getVectorVars()
																if array4 ~= nil then
																	local n4 = 0
																	local m4 = _g.jk.lang.Vector:getSize(array4)
																	do
																		n4 = 0
																		while n4 < m4 do
																			local vv = array4[n4 + 1]
																			if vv ~= nil then
																				local vname = vv:getNodeName()
																				local dt = _g.sling.util.DataTypeUtil:dupAsDataType(vv:getType())
																				local isPrimitive = false
																				if _g.sling.util.ModifierUtil:hasAnnotationModifier(vv, "value") then
																					do _g.sling.util.ModifierUtil:removeAnnotationModifier(vv, "value") end
																					isPrimitive = true
																				end
																				do vv:setType(_g.sling.model.VectorDataTypeNode:forPrimaryType(_g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create())), false) end
																				if _g.jk.lang.String:isEmpty(vname) then
																					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Variable name is empty", vv, nil))
																				end
																				if replacechild ~= nil and isPrimitive == false then
																					local fc = _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_REPLACE_CHILD_IN_VECTOR")
																					do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																					do _g.sling.util.FunctionUtil:addStatement(replacechild, fc) end
																				end
																				if copyto ~= nil then
																					local fc = _g.sling.model.FunctionCallExpressionNode:forName((function(a, b, c)
																						if a then
																							do return b() end
																						end
																						do return c() end
																					end)(isPrimitive, function()
																						do return "IMPLEMENT_COPY_VALUE_VECTOR" end
																					end, function()
																						do return "IMPLEMENT_COPY_PROPERTY_VECTOR" end
																					end))
																					do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																					do _g.sling.util.FunctionUtil:addStatement(copyto, fc) end
																				end
																				if acceptvisitor ~= nil and isPrimitive == false then
																					local fc = _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_VISIT_PROPERTY_VECTOR")
																					do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																					do _g.sling.util.FunctionUtil:addStatement(acceptvisitor, fc) end
																				end
																				if destroy ~= nil and isPrimitive == false then
																					local fc = _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_DESTROY_PROPERTY_VECTOR")
																					do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																					do _g.sling.util.FunctionUtil:addStatement(destroy, fc) end
																				end
																				do
																					local nset = _g.sling.compiler.Samtree2Ops:modifyName("set", vname)
																					if class:hasChildNode(nset) == false then
																						local fset = _g.sling.model.FunctionDeclarationNode:forName(nset, true)
																						do fset:setReturnType(_g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()), false) end
																						do fset:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.VectorDataTypeNode:forPrimaryType(_g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create())), "v", nil)) end
																						if isPrimitive == false then
																							do fset:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.BooleanDataTypeNode._construct0(_g.sling.model.BooleanDataTypeNode._create()), "doExport", _g.sling.model.BooleanLiteralExpressionNode:forValue(false))) end
																						end
																						do
																							local fc = _g.sling.model.FunctionCallExpressionNode:forName((function(a, b, c)
																								if a then
																									do return b() end
																								end
																								do return c() end
																							end)(isPrimitive, function()
																								do return "IMPLEMENT_SET_VALUE_VECTOR" end
																							end, function()
																								do return "IMPLEMENT_SET_PROPERTY_VECTOR" end
																							end))
																							do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																							do _g.sling.util.FunctionUtil:addStatement(fset, fc) end
																							do class:addNode(fset) end
																						end
																					end
																					do
																						local nget = _g.sling.compiler.Samtree2Ops:modifyName("get", vname)
																						if class:hasChildNode(nget) == false then
																							local fget = _g.sling.model.FunctionDeclarationNode:forName(nget, true)
																							do fget:setReturnType(_g.sling.model.VectorDataTypeNode:forPrimaryType(_g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create())), false) end
																							do
																								local fc = _g.sling.model.FunctionCallExpressionNode:forName((function(a, b, c)
																									if a then
																										do return b() end
																									end
																									do return c() end
																								end)(isPrimitive, function()
																									do return "IMPLEMENT_GET_VALUE_VECTOR" end
																								end, function()
																									do return "IMPLEMENT_GET_PROPERTY_VECTOR" end
																								end))
																								do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																								do _g.sling.util.FunctionUtil:addStatement(fget, fc) end
																								do class:addNode(fget) end
																							end
																						end
																						if isPrimitive == false then
																							local nexp = _g.sling.compiler.Samtree2Ops:modifyName("export", vname)
																							if class:hasChildNode(nexp) == false then
																								local fexp = _g.sling.model.FunctionDeclarationNode:forName(nexp, true)
																								do fexp:setReturnType(_g.sling.model.VectorDataTypeNode:forPrimaryType(_g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create())), false) end
																								do
																									local fc = _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_EXPORT_PROPERTY_VECTOR")
																									do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																									do _g.sling.util.FunctionUtil:addStatement(fexp, fc) end
																									do class:addNode(fexp) end
																								end
																							end
																						end
																						do
																							local nadd = _g.sling.compiler.Samtree2Ops:modifyName("addTo", vname)
																							if class:hasChildNode(nadd) == false then
																								local fadd = _g.sling.model.FunctionDeclarationNode:forName(nadd, true)
																								do fadd:setReturnType(_g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()), false) end
																								do fadd:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.util.DataTypeUtil:dupAsDataType(dt), "v", nil)) end
																								do
																									local fc = _g.sling.model.FunctionCallExpressionNode:forName((function(a, b, c)
																										if a then
																											do return b() end
																										end
																										do return c() end
																									end)(isPrimitive, function()
																										do return "IMPLEMENT_ADD_TO_VALUE_VECTOR" end
																									end, function()
																										do return "IMPLEMENT_ADD_TO_PROPERTY_VECTOR" end
																									end))
																									do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																									do _g.sling.util.FunctionUtil:addStatement(fadd, fc) end
																									do class:addNode(fadd) end
																								end
																							end
																							do
																								local nclr = _g.sling.compiler.Samtree2Ops:modifyName("clear", vname)
																								if class:hasChildNode(nclr) == false then
																									local fclr = _g.sling.model.FunctionDeclarationNode:forName(nclr, true)
																									do fclr:setReturnType(_g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()), false) end
																									do
																										local fc = _g.sling.model.FunctionCallExpressionNode:forName((function(a, b, c)
																											if a then
																												do return b() end
																											end
																											do return c() end
																										end)(isPrimitive, function()
																											do return "IMPLEMENT_CLEAR_VALUE_VECTOR" end
																										end, function()
																											do return "IMPLEMENT_CLEAR_PROPERTY_VECTOR" end
																										end))
																										do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																										do _g.sling.util.FunctionUtil:addStatement(fclr, fc) end
																										do class:addNode(fclr) end
																									end
																								end
																								do dt:destroy() end
																							end
																						end
																					end
																				end
																			end
																			do n4 = n4 + 1 end
																		end
																	end
																end
																if replacechild ~= nil then
																	do _g.sling.util.FunctionUtil:addStatement(replacechild, _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_REPLACE_CHILD_END")) end
																end
																if copyto ~= nil then
																	do _g.sling.util.FunctionUtil:addStatement(copyto, _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_COPY_TO_END")) end
																end
																if acceptvisitor ~= nil then
																	do _g.sling.util.FunctionUtil:addStatement(acceptvisitor, _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_ACCEPT_VISITOR_END")) end
																end
																if destroy ~= nil then
																	do _g.sling.util.FunctionUtil:addStatement(destroy, _g.sling.model.FunctionCallExpressionNode:forName("IMPLEMENT_DESTROY_END")) end
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
						do n = n + 1 end
					end
				end
			end
		end
	end
end

sling.compiler.ProgressHelper = {}
sling.compiler.ProgressHelper.__index = sling.compiler.ProgressHelper
_vm:set_metatable(sling.compiler.ProgressHelper, {})

function sling.compiler.ProgressHelper._create()
	local v = _vm:set_metatable({}, sling.compiler.ProgressHelper)
	return v
end

function sling.compiler.ProgressHelper:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.ProgressHelper'
	self['_isType.sling.compiler.ProgressHelper'] = true
	self._ctx = nil
	self._message = nil
	self._startPercentage = 0.0
	self._maxPercentage = 1.0
	self._currentValue = 0
	self._maxValue = 0
end

function sling.compiler.ProgressHelper:_construct0()
	sling.compiler.ProgressHelper._init(self)
	return self
end

function sling.compiler.ProgressHelper:forMaximumValue(ctx, message, value)
	local v = _g.sling.compiler.ProgressHelper._construct0(_g.sling.compiler.ProgressHelper._create())
	do v:setCtx(ctx) end
	do v:setMessage(message) end
	do v:setCurrentValue(0) end
	do v:setMaxValue(value) end
	do return v end
end

function sling.compiler.ProgressHelper:forFirstHalf(ctx, message, value)
	local v = _g.sling.compiler.ProgressHelper._construct0(_g.sling.compiler.ProgressHelper._create())
	do v:setCtx(ctx) end
	do v:setMessage(message) end
	do v:setCurrentValue(0) end
	do v:setMaxValue(value * 2) end
	do return v end
end

function sling.compiler.ProgressHelper:forSecondHalf(ctx, message, value)
	local v = _g.sling.compiler.ProgressHelper._construct0(_g.sling.compiler.ProgressHelper._create())
	do v:setCtx(ctx) end
	do v:setMessage(message) end
	do v:setCurrentValue(value) end
	do v:setMaxValue(value * 2) end
	do return v end
end

function sling.compiler.ProgressHelper:toProgress(n, c)
	local f = (n + 1) / c
	f = f * (self:getMaxPercentage() - self:getStartPercentage())
	f = f + self:getStartPercentage()
	do return _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(_util:convert_to_integer(f * 100.0))) .. "%" end
end

function sling.compiler.ProgressHelper:onUpdate()
	do _g.jk.log.Log:status(self:getCtx(), "[" .. _g.jk.lang.String:safeString(self:toProgress(self:getCurrentValue(), self:getMaxValue())) .. "] " .. _g.jk.lang.String:safeString(self:getMessage()) .. " ..") end
	do self:setCurrentValue(self:getCurrentValue() + 1) end
end

function sling.compiler.ProgressHelper:_end()
	do _g.jk.log.Log:status(self:getCtx(), nil) end
end

function sling.compiler.ProgressHelper:getCtx()
	do return self._ctx end
end

function sling.compiler.ProgressHelper:doSetCtx(value)
	self._ctx = value
end

function sling.compiler.ProgressHelper:setCtx(v)
	do self:doSetCtx(v) end
	do return v end
end

function sling.compiler.ProgressHelper:getMessage()
	do return self._message end
end

function sling.compiler.ProgressHelper:doSetMessage(value)
	self._message = value
end

function sling.compiler.ProgressHelper:setMessage(v)
	do self:doSetMessage(v) end
	do return v end
end

function sling.compiler.ProgressHelper:getStartPercentage()
	do return self._startPercentage end
end

function sling.compiler.ProgressHelper:doSetStartPercentage(value)
	self._startPercentage = value
end

function sling.compiler.ProgressHelper:setStartPercentage(v)
	do self:doSetStartPercentage(v) end
	do return v end
end

function sling.compiler.ProgressHelper:getMaxPercentage()
	do return self._maxPercentage end
end

function sling.compiler.ProgressHelper:doSetMaxPercentage(value)
	self._maxPercentage = value
end

function sling.compiler.ProgressHelper:setMaxPercentage(v)
	do self:doSetMaxPercentage(v) end
	do return v end
end

function sling.compiler.ProgressHelper:getCurrentValue()
	do return self._currentValue end
end

function sling.compiler.ProgressHelper:doSetCurrentValue(value)
	self._currentValue = value
end

function sling.compiler.ProgressHelper:setCurrentValue(v)
	do self:doSetCurrentValue(v) end
	do return v end
end

function sling.compiler.ProgressHelper:getMaxValue()
	do return self._maxValue end
end

function sling.compiler.ProgressHelper:doSetMaxValue(value)
	self._maxValue = value
end

function sling.compiler.ProgressHelper:setMaxValue(v)
	do self:doSetMaxValue(v) end
	do return v end
end

sling.compiler.PropertyVariableExpander = {}
sling.compiler.PropertyVariableExpander.__index = sling.compiler.PropertyVariableExpander
_vm:set_metatable(sling.compiler.PropertyVariableExpander, {})

function sling.compiler.PropertyVariableExpander._create()
	local v = _vm:set_metatable({}, sling.compiler.PropertyVariableExpander)
	return v
end

function sling.compiler.PropertyVariableExpander:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.PropertyVariableExpander'
	self['_isType.sling.compiler.PropertyVariableExpander'] = true
end

function sling.compiler.PropertyVariableExpander:_construct0()
	sling.compiler.PropertyVariableExpander._init(self)
	return self
end

function sling.compiler.PropertyVariableExpander:modifyName(prefix, name)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString(prefix) end
	do
		local c0 = _g.jk.lang.String:getChar(name, 0)
		if c0 >= 97 and c0 <= 122 then
			do sb:appendCharacter(c0 - 97 + 65) end
			do sb:appendString(_g.jk.lang.String:getEndOfString(name, 1)) end
		else
			do sb:appendString(name) end
		end
		do return sb:toString() end
	end
end

function sling.compiler.PropertyVariableExpander:execute(root, resolver)
	local array = _g.sling.util.NodeFinder:findNodesOfType(root, "class:sling.model.VariableDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local vd = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.VariableDeclarationNode')
				if vd ~= nil then
					if _g.sling.util.ModifierUtil:hasCommonModifier(vd, _g.sling.model.Modifier.PROPERTY) == false then
						goto _continue48
					end
					do
						local name = vd:getNodeName()
						if _g.jk.lang.String:isEmpty(name) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Empty name", vd, nil))
						end
						do
							local dt = vd:getType()
							if not (dt ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No datatype", vd, nil))
							end
							if (_vm:to_table_with_key(dt, '_isType.sling.model.AutomaticDataTypeNode') ~= nil) then
								local init = vd:getInitializer()
								if not (init ~= nil) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unable to determine declaration data type (missing initializer)", vd, nil))
								end
								dt = _g.sling.util.ExpressionUtil:getExpressionDataType(init, resolver)
								if not (dt ~= nil) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unable to determine expression data type", init, nil))
								end
							end
							do
								local parentNode = vd:getParent()
								if not (parentNode ~= nil) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Declaration has no parent", vd, nil))
								end
								do
									local pp = _vm:to_table_with_key(parentNode, '_isType.sling.model.EntityDeclarationNode')
									if not (pp ~= nil) then
										local error = _g.sling.common.ReferenceError:forMessage("Property declaration is not enclosed inside an entity", vd, nil)
										do error:addRelatedMessage("This is the parent of the declaration", parentNode) end
										_vm:throw_error(error)
									end
									do
										local visibility = nil
										if _g.sling.util.ModifierUtil:hasCommonModifier(vd, _g.sling.model.Modifier.PUBLIC) then
											visibility = _g.sling.model.Modifier.PUBLIC
										elseif _g.sling.util.ModifierUtil:hasCommonModifier(vd, _g.sling.model.Modifier.PROTECTED) then
											visibility = _g.sling.model.Modifier.PROTECTED
										elseif _g.sling.util.ModifierUtil:hasCommonModifier(vd, _g.sling.model.Modifier.PRIVATE) then
											visibility = _g.sling.model.Modifier.PRIVATE
										end
										if not (visibility ~= nil) then
											visibility = _g.sling.model.Modifier.PUBLIC
										end
										do
											local doGetter = true
											local doSetter = true
											local isVirtual = false
											local isGetOverride = false
											local isSetOverride = false
											if _g.sling.util.ModifierUtil:hasCommonModifier(vd, _g.sling.model.Modifier.FINAL) or _g.sling.util.ModifierUtil:hasCommonModifier(vd, _g.sling.model.Modifier.READONLY) then
												doSetter = false
											end
											if _g.sling.util.ModifierUtil:hasCommonModifier(vd, _g.sling.model.Modifier.VIRTUAL) then
												isVirtual = true
											end
											if _g.sling.util.ModifierUtil:hasCommonModifier(vd, _g.sling.model.Modifier.OVERRIDE) then
												isGetOverride = true
												isSetOverride = true
											else
												if _g.sling.util.ModifierUtil:hasAnnotationModifier(vd, "getOverride") then
													isGetOverride = true
												end
												if _g.sling.util.ModifierUtil:hasAnnotationModifier(vd, "setOverride") then
													isSetOverride = true
												end
											end
											do
												local settername = self:modifyName("set", name)
												local gettername = self:modifyName("get", name)
												if doGetter and _g.sling.util.EntityUtil:methodExists(pp, gettername) then
													doGetter = false
												end
												if doSetter and _g.sling.util.EntityUtil:methodExists(pp, settername) then
													doSetter = false
												end
												if doGetter then
													local gf = _g.sling.model.FunctionDeclarationNode:forName(gettername, false)
													do gf:setSource(vd:getSource()) end
													do _g.sling.util.ModifierUtil:addAnnotationModifier(gf, "getterMethod") end
													do
														local dtd = _g.sling.util.DataTypeUtil:dupAsDataType(dt)
														do gf:setReturnType(dtd, false) end
														do _g.sling.util.ModifierUtil:addCommonModifier(gf, visibility) end
														if isVirtual then
															do _g.sling.util.ModifierUtil:addCommonModifier(gf, _g.sling.model.Modifier.VIRTUAL) end
														end
														if isGetOverride then
															do _g.sling.util.ModifierUtil:addCommonModifier(gf, _g.sling.model.Modifier.OVERRIDE) end
														end
														do _g.sling.util.FunctionUtil:addStatement(gf, _g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.SymbolExpressionNode:forName(name))) end
														do pp:addNode(gf) end
													end
												end
												if doSetter then
													local isDynamic = false
													local isStrict = false
													if _g.sling.util.ModifierUtil:hasAnnotationModifier(vd, "dynamic") then
														isDynamic = true
														if _g.sling.util.ModifierUtil:hasAnnotationModifier(vd, "strict") then
															isStrict = true
														end
													end
													do
														local sf = _g.sling.model.FunctionDeclarationNode:forName(settername, false)
														do sf:setSource(vd:getSource()) end
														do _g.sling.util.ModifierUtil:addAnnotationModifier(sf, "setterMethod") end
														do sf:setReturnType(_g.sling.model.ReferenceDataTypeNode:forNode(pp, nil), false) end
														do _g.sling.util.ModifierUtil:addCommonModifier(sf, visibility) end
														if isVirtual then
															do _g.sling.util.ModifierUtil:addCommonModifier(sf, _g.sling.model.Modifier.VIRTUAL) end
														end
														if isSetOverride then
															do _g.sling.util.ModifierUtil:addCommonModifier(sf, _g.sling.model.Modifier.OVERRIDE) end
														end
														do
															local dtd = nil
															if isDynamic then
																dtd = _g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create())
															else
																dtd = _g.sling.util.DataTypeUtil:dupAsDataType(dt)
															end
															do
																local param = _g.sling.model.VariableDeclarationNode:instance(dtd, "v", nil)
																if _g.sling.util.ModifierUtil:hasAnnotationModifier(vd, "notLiteral") then
																	do _g.sling.util.ModifierUtil:addAnnotationModifier(param, "notLiteral") end
																end
																do sf:addToParameters(param) end
																do
																	local valuexpr = _g.sling.model.SymbolExpressionNode:forName("v")
																	if isDynamic then
																		valuexpr = _g.sling.compiler.JkopOps:createDynamicConverterExpression(valuexpr, dt, resolver)
																	end
																	do _g.sling.util.FunctionUtil:addStatement(sf, _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forName(name), valuexpr)) end
																	if isStrict then
																		local cc = _g.sling.model.LogicalNotExpressionNode:forExpression(_g.sling.model.SymbolExpressionNode:forName(name))
																		local stmt = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("Error"), "throw", true)
																		do stmt:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue("not_" .. _g.jk.lang.String:safeString(_g.sling.generator.SlingGeneratorUtil:describeDataType(dt)))) end
																		do stmt:addToParameters(_g.sling.model.SymbolExpressionNode:forName("v")) end
																		do _g.sling.util.FunctionUtil:addStatement(sf, _g.sling.model.IfStatementNode:forStatement(cc, stmt)) end
																	end
																	do _g.sling.util.FunctionUtil:addStatement(sf, _g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.CurrentObjectExpressionNode._construct0(_g.sling.model.CurrentObjectExpressionNode._create()))) end
																	do pp:addNode(sf) end
																end
															end
														end
													end
												end
												do _g.sling.util.ModifierUtil:removeCommonModifier(vd, _g.sling.model.Modifier.PROPERTY) end
												do _g.sling.util.ModifierUtil:removeCommonModifier(vd, visibility) end
												do _g.sling.util.ModifierUtil:addCommonModifier(vd, _g.sling.model.Modifier.PRIVATE) end
											end
										end
									end
								end
							end
						end
					end
				end
				::_continue48::
				do n = n + 1 end
			end
		end
	end
end

sling.compiler.JcoOps = {}
sling.compiler.JcoOps.__index = sling.compiler.JcoOps
_vm:set_metatable(sling.compiler.JcoOps, {})

function sling.compiler.JcoOps._create()
	local v = _vm:set_metatable({}, sling.compiler.JcoOps)
	return v
end

function sling.compiler.JcoOps:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.JcoOps'
	self['_isType.sling.compiler.JcoOps'] = true
end

function sling.compiler.JcoOps:_construct0()
	sling.compiler.JcoOps._init(self)
	return self
end

sling.compiler.JcoOps.UIExpressionFinder = _g.sling.common.NodeVisitor._create()
sling.compiler.JcoOps.UIExpressionFinder.__index = sling.compiler.JcoOps.UIExpressionFinder
_vm:set_metatable(sling.compiler.JcoOps.UIExpressionFinder, {
	__index = _g.sling.common.NodeVisitor
})

function sling.compiler.JcoOps.UIExpressionFinder._create()
	local v = _vm:set_metatable({}, sling.compiler.JcoOps.UIExpressionFinder)
	return v
end

function sling.compiler.JcoOps.UIExpressionFinder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.JcoOps.UIExpressionFinder'
	self['_isType.sling.compiler.JcoOps.UIExpressionFinder'] = true
	self.results = {}
end

function sling.compiler.JcoOps.UIExpressionFinder:_construct0()
	sling.compiler.JcoOps.UIExpressionFinder._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.compiler.JcoOps.UIExpressionFinder:visit(node)
	local uinode = _vm:to_table_with_key(node, '_isType.sling.model.UIExpressionNode')
	if uinode ~= nil then
		do _g.jk.lang.Vector:append(self.results, uinode) end
		do self:setSkipChildren(true) end
	end
	do return true end
end

function sling.compiler.JcoOps.UIExpressionFinder:getResults()
	do return self.results end
end

function sling.compiler.JcoOps.UIExpressionFinder:setResults(v)
	self.results = v
	do return self end
end

function sling.compiler.JcoOps:findUIExpressions(node)
	if not (node ~= nil) then
		do return nil end
	end
	do
		local xprs = _g.sling.compiler.JcoOps.UIExpressionFinder._construct0(_g.sling.compiler.JcoOps.UIExpressionFinder._create())
		do return xprs:getResults() end
	end
end

function sling.compiler.JcoOps:expandAllUIExpressions(node)
	local array = _g.sling.compiler.JcoOps:findUIExpressions(node)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local expr = array[n + 1]
				if expr ~= nil then
					local method = _g.sling.util.FindUtil:findNearestFunctionBase(expr)
					if not (method ~= nil) then
						goto _continue49
					end
					if _g.sling.util.ModifierUtil:hasAnnotationModifier(method, "nojkop") then
						goto _continue49
					end
					do
						local entity = _g.sling.util.FindUtil:findNearestEntity(method)
						if entity ~= nil and _g.sling.util.ModifierUtil:hasAnnotationModifier(entity, "nojkop") then
							goto _continue49
						end
						do
							local body = method:getBody()
							if not (body ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to get method body", method, nil))
							end
							do
								local ip = nil
								local pp = _vm:to_table_with_key(expr, '_isType.sling.common.NodeObject')
								while true do
									local nn = pp:getParent()
									if not (nn ~= nil) then
										pp = nil
										do break end
									end
									if (_vm:to_table_with_key(nn, '_isType.sling.model.BlockNode') ~= nil) then
										ip = nn:getInsertionPointForChild(pp)
										do break end
									end
									pp = nn
								end
								if not (ip ~= nil) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("UI Expression is not inside a block!", expr, nil))
								end
								do
									local vd = _g.sling.compiler.JcoOps:handleUIExpressionNode(expr, nil, method, body, ip, nil, "context", false, false)
									if not (vd ~= nil) then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failure in handling UI expressions", node, nil))
									end
									do _g.sling.util.NodeUtil:replaceNode(expr, _g.sling.model.SymbolExpressionNode:forBinding(vd, nil)) end
								end
							end
						end
					end
				end
				::_continue49::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.JcoOps:convertGetExpressionToFunctionCall(node, isExact, parentNode)
	if (_vm:to_table_with_key(node, '_isType.sling.model.SymbolExpressionNode') ~= nil) then
		local nsym = node
		local symName = _g.sling.util.SymbolUtil:getSymbolName(nsym:getSymbol())
		if _g.jk.lang.String:isEmpty(symName) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No name for symbol", nsym, nil))
		end
		do
			local fname = nil
			if isExact then
				fname = symName
			else
				fname = _g.sling.common.CodeStringUtil:combineCamelCase({
					"get",
					"widget",
					symName
				})
			end
			do
				local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(parentNode, fname, false)
				do fc:setSource(node:getSource()) end
				do return fc end
			end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionCallExpressionNode') ~= nil) then
		local nfc = node
		local nxpr = nfc:getExpression()
		if not (nxpr ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No expression in function call", nfc, nil))
		end
		do
			local nsym = _vm:to_table_with_key(nxpr, '_isType.sling.model.SymbolExpressionNode')
			if not (nsym ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Function call expression is not a symbol!", nfc, nil))
			end
			do
				local symName = _g.sling.util.SymbolUtil:getSymbolName(nsym:getSymbol())
				if _g.jk.lang.String:isEmpty(symName) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No name for symbol", nsym, nil))
				end
				do
					local fname = nil
					if isExact then
						fname = symName
					else
						fname = _g.sling.common.CodeStringUtil:combineCamelCase({
							"get",
							"widget",
							symName
						})
					end
					do
						local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(parentNode, fname, false)
						do fc:setSource(node:getSource()) end
						do
							local array = nfc:exportParameters()
							if array ~= nil then
								local n = 0
								local m = _g.jk.lang.Vector:getSize(array)
								do
									n = 0
									while n < m do
										local param = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ExpressionNode')
										if param ~= nil then
											do fc:addToParameters(param) end
										end
										do n = n + 1 end
									end
								end
							end
							do return fc end
						end
					end
				end
			end
		end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported expression as get expression: `" .. _g.jk.lang.String:safeString(node:getNodeTypeName()) .. "'", node, nil))
	do return nil end
end

function sling.compiler.JcoOps:isNameValid(name)
	if not (name ~= nil) then
		do return false end
	end
	do
		local it = _g.jk.lang.String:iterate(name)
		while it ~= nil do
			local c = it:getNextChar()
			if c < 1 then
				do break end
			end
			if c >= 97 and c <= 122 then
			elseif c >= 65 and c <= 90 then
			elseif c >= 48 and c <= 57 then
			elseif c == 95 then
			else
				do return false end
			end
		end
		do return true end
	end
end

function sling.compiler.JcoOps:convertSetExpressionToFunctionCall(node, leftName, value, isExact, isCommon, parentNode)
	if _g.jk.lang.String:isEmpty(leftName) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No value for key", node, nil))
	end
	if not _g.sling.compiler.JcoOps:isNameValid(leftName) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Invalid name for set expression: `" .. _g.jk.lang.String:safeString(leftName) .. "'", node, nil))
	end
	do
		local fcall = nil
		if isCommon then
			fcall = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("Widget"), "setWidgetId", false)
			do fcall:addToParameters(parentNode) end
		else
			local fname = nil
			if isExact then
				fname = _g.sling.common.CodeStringUtil:combineCamelCase({
					"set",
					leftName
				})
			else
				fname = _g.sling.common.CodeStringUtil:combineCamelCase({
					"set",
					"widget",
					leftName
				})
			end
			fcall = _g.sling.model.FunctionCallExpressionNode:forMethod(parentNode, fname, false)
		end
		do fcall:setSource(node:getSource()) end
		do
			local array = node:exportKeyParams()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local pp = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ExpressionNode')
						if pp ~= nil then
							do fcall:addToParameters(pp) end
						end
						do n = n + 1 end
					end
				end
			end
			if value ~= nil then
				do fcall:addToParameters(value) end
			end
			do return fcall end
		end
	end
end

function sling.compiler.JcoOps:handlePropertyValueDeclaration(node, parentNode)
	local lefto = node:getKey()
	if not (lefto ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No key", node, nil))
	end
	do
		local righto = node:exportValue()
		if not (righto ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No value", node, nil))
		end
		do return _g.sling.compiler.JcoOps:convertSetExpressionToFunctionCall(node, lefto, righto, _g.sling.util.ModifierUtil:hasAnnotationModifier(node, "exact"), _g.sling.util.ModifierUtil:hasAnnotationModifier(node, "common"), parentNode) end
	end
end

function sling.compiler.JcoOps:handleUIExpressionNode(node, entity, method, block, insertionPoint, parentNode, contextVariableName, declareClassVariables, includeAddStatement)
	local dt = _g.sling.util.ExpressionUtil:tryGetExpressionDataType(node, nil)
	if dt ~= nil then
		dt = _g.sling.util.DataTypeUtil:dupAsDataType(dt)
	end
	do
		local xpr = node:exportExpression()
		local createXpr = nil
		if dt ~= nil then
			local oo = _g.sling.model.CreateObjectExpressionNode:forType(dt)
			do oo:setSource(node:getSource()) end
			do oo:addToParameters(_g.sling.model.SymbolExpressionNode:forName(contextVariableName)) end
			createXpr = oo
		elseif xpr ~= nil then
			createXpr = xpr
		else
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("UI expression has neither data type nor expression", node, nil))
		end
		do
			local vname = node:getName()
			local isOriginal = true
			if _g.jk.lang.String:isEmpty(vname) then
				vname = _g.sling.util.FunctionUtil:findUniqueVariableNameInFunction(method, "widget")
				isOriginal = false
			end
			if _g.jk.lang.String:isEmpty(vname) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to find a unique variable name for `widget'", method, nil))
			end
			do
				local vd = _g.sling.model.VariableDeclarationNode:forName(vname)
				do vd:setSource(node:getSource()) end
				if declareClassVariables and isOriginal then
					do _g.sling.util.ModifierUtil:addCommonModifier(vd, _g.sling.model.Modifier.PRIVATE) end
					if not (entity ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unable to declare a class variable: Not inside an entity", node, nil))
					end
					if dt ~= nil then
						do vd:setType(_g.sling.util.DataTypeUtil:dupAsDataType(dt), false) end
						do entity:addNode(vd) end
						if insertionPoint ~= nil then
							do insertionPoint:insertBefore(_g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forBinding(vd, nil), createXpr)) end
						else
							do block:addNode(_g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forBinding(vd, nil), createXpr)) end
						end
					else
						do vd:setType(_g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create()), false) end
						do vd:setInitializer(createXpr, false) end
						do entity:addNode(vd) end
					end
				else
					do vd:setType(_g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create()), false) end
					do vd:setInitializer(createXpr, false) end
					if insertionPoint ~= nil then
						do insertionPoint:insertBefore(vd) end
					else
						do block:addNode(vd) end
					end
				end
				do
					local array = node:exportChildren()
					if array ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(array)
						do
							n = 0
							while n < m do
								local child = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
								if child ~= nil then
									if (_vm:to_table_with_key(child, '_isType.sling.model.CommentNode') ~= nil) then
										if insertionPoint ~= nil then
											do insertionPoint:insertBefore(child) end
										else
											do block:addNode(child) end
										end
									elseif (_vm:to_table_with_key(child, '_isType.sling.model.UIExpressionNode') ~= nil) then
										do _g.sling.compiler.JcoOps:handleUIExpressionNode(child, entity, method, block, insertionPoint, _g.sling.model.SymbolExpressionNode:forBinding(vd, nil), contextVariableName, declareClassVariables, true) end
									elseif (_vm:to_table_with_key(child, '_isType.sling.model.PropertyValueDeclarationNode') ~= nil) then
										local v = _g.sling.compiler.JcoOps:handlePropertyValueDeclaration(child, _g.sling.model.SymbolExpressionNode:forBinding(vd, nil))
										if insertionPoint ~= nil then
											do insertionPoint:insertBefore(v) end
										else
											do block:addNode(v) end
										end
									else
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node inside UI expression: `" .. _g.jk.lang.String:safeString(child:getNodeTypeName()) .. "'", child, nil))
									end
								end
								do n = n + 1 end
							end
						end
					end
					if includeAddStatement then
						local addCall = _g.sling.model.FunctionCallExpressionNode:forMethod(parentNode, "addWidget", false)
						do addCall:setSource(node:getSource()) end
						do addCall:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vd, nil)) end
						do
							local array2 = node:exportLayoutParams()
							if array2 ~= nil then
								local n2 = 0
								local m2 = _g.jk.lang.Vector:getSize(array2)
								do
									n2 = 0
									while n2 < m2 do
										local layoutParam = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.ExpressionNode')
										if layoutParam ~= nil then
											do addCall:addToParameters(layoutParam) end
										end
										do n2 = n2 + 1 end
									end
								end
							end
							if insertionPoint ~= nil then
								do insertionPoint:insertBefore(addCall) end
							else
								do block:addNode(addCall) end
							end
						end
					end
					do return vd end
				end
			end
		end
	end
end

function sling.compiler.JcoOps:createScreenForMainWidget(root)
	local array = _g.sling.util.NodeFinder:findNodesOfType(root, "class:sling.model.ClassDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local decl = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ClassDeclarationNode')
				if decl ~= nil then
					if _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "widget") == false then
						goto _continue50
					end
					if _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "main") == false then
						goto _continue50
					end
					if _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "nojkop") then
						goto _continue50
					end
					do
						local screen = _g.sling.model.ClassDeclarationNode:forName(_g.jk.lang.String:safeString(decl:getNodeName()) .. "Screen")
						do screen:addToDependencies("module:jk.lang") end
						do screen:addToDependencies("module:jk.ui") end
						do screen:addToDependencies("module:jk.widget") end
						do screen:addBaseTypeExtends(_g.sling.model.ReferenceDataTypeNode:forArrayOfNames({
							"jk",
							"widget",
							"ScreenForWidget"
						})) end
						do _g.sling.util.ModifierUtil:addCommonModifier(screen, _g.sling.model.Modifier.PUBLIC) end
						do _g.sling.util.ModifierUtil:addAnnotationModifier(screen, "screen") end
						do _g.sling.util.ModifierUtil:addAnnotationModifier(screen, "main") end
						do
							local init = _g.sling.model.FunctionDeclarationNode:forName("initialize", false)
							do _g.sling.util.ModifierUtil:addCommonModifier(init, _g.sling.model.Modifier.PUBLIC) end
							do _g.sling.util.ModifierUtil:addCommonModifier(init, _g.sling.model.Modifier.OVERRIDE) end
							do _g.sling.util.FunctionUtil:addBaseCall(init, false) end
							do
								local ci = _g.sling.model.CreateObjectExpressionNode:forType(_g.sling.model.ReferenceDataTypeNode:forNode(decl, nil))
								do ci:addToParameters(_g.sling.model.SymbolExpressionNode:forName("context")) end
								do
									local fc = _g.sling.model.FunctionCallExpressionNode:forName("setWidget")
									do fc:addToParameters(ci) end
									do _g.sling.util.FunctionUtil:addStatement(init, fc) end
									do screen:addNode(init) end
									do
										local pp = _vm:to_table_with_key(decl:getParent(), '_isType.sling.common.ContainerNode')
										if not (pp ~= nil) then
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No parent container!", decl, nil))
										end
										do pp:addNode(screen) end
										do _g.sling.util.ModifierUtil:removeAnnotationModifier(decl, "main") end
									end
								end
							end
						end
					end
				end
				::_continue50::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.JcoOps:expandWidgetClasses(root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.EntityDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local entity = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.EntityDeclarationNode')
				if entity ~= nil then
					if not _g.sling.util.ModifierUtil:hasAnnotationModifier(entity, "widget") then
						goto _continue51
					end
					if _g.sling.util.ModifierUtil:hasAnnotationModifier(entity, "nojkop") then
						goto _continue51
					end
					do
						local decls = {}
						local array2 = entity:getNodes()
						if array2 ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(array2)
							do
								n2 = 0
								while n2 < m2 do
									local node = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.UIExpressionNode')
									if node ~= nil then
										do _g.jk.lang.Vector:append(decls, node) end
									end
									do n2 = n2 + 1 end
								end
							end
						end
						do
							local declsz = _g.jk.lang.Vector:getSize(decls)
							if declsz > 1 then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Multiple UI expressions found inside one entity", entity, nil))
							end
							do
								local decl = _g.jk.lang.Vector:get(decls, 0)
								do entity:addToImportNamespaces(_g.sling.model.SymbolNode:forArrayOfNames({
									"jk",
									"lang"
								})) end
								do entity:addToImportNamespaces(_g.sling.model.SymbolNode:forArrayOfNames({
									"jk",
									"ui"
								})) end
								do entity:addToImportNamespaces(_g.sling.model.SymbolNode:forArrayOfNames({
									"jk",
									"gfx"
								})) end
								do
									local ppns = _vm:to_table_with_key(entity:getParent(), '_isType.sling.model.NamespaceNode')
									if ppns == nil or not (_g.sling.util.NodeUtil:getQualifiedNameString(ppns, 46) == "jk.widget") then
										do entity:addToImportNamespaces(_g.sling.model.SymbolNode:forArrayOfNames({
											"jk",
											"widget"
										})) end
									end
									if decl ~= nil then
										local dt = _vm:to_table_with_key(_g.sling.util.ExpressionUtil:tryGetExpressionDataType(decl, nil), '_isType.sling.model.ReferenceDataTypeNode')
										if dt ~= nil then
											dt = _g.sling.util.DataTypeUtil:dupAsReferenceDataType(dt)
										end
										if dt ~= nil then
											do entity:addBaseTypeExtends(dt) end
										end
									end
									do
										local method = nil
										local array3 = entity:getNodes()
										if array3 ~= nil then
											local n3 = 0
											local m3 = _g.jk.lang.Vector:getSize(array3)
											do
												n3 = 0
												while n3 < m3 do
													local ctor = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.model.ConstructorDeclarationNode')
													if ctor ~= nil then
														local params = ctor:getParameters()
														if params == nil or _g.jk.lang.Vector:getSize(params) ~= 1 then
															goto _continue52
														end
														do
															local pp = _vm:to_table_with_key(_g.jk.lang.Vector:get(params, 0), '_isType.sling.model.VariableDeclarationNode')
															if not (pp ~= nil) then
																goto _continue52
															end
															do
																local ppdt = _vm:to_table_with_key(pp:getType(), '_isType.sling.model.ReferenceDataTypeNode')
																if not (ppdt ~= nil) then
																	goto _continue52
																end
																do
																	local ppdtname = _g.sling.util.DataTypeUtil:getSymbolName(ppdt)
																	if not (ppdtname == "GuiApplicationContext") then
																		goto _continue52
																	end
																	method = ctor
																end
															end
														end
													end
													::_continue52::
													do n3 = n3 + 1 end
												end
											end
										end
										if not (method ~= nil) then
											local v = _g.sling.model.ConstructorDeclarationNode._construct0(_g.sling.model.ConstructorDeclarationNode._create())
											do _g.sling.util.ModifierUtil:addCommonModifier(v, _g.sling.model.Modifier.PUBLIC) end
											do v:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.ReferenceDataTypeNode:forArrayOfNames({
												"jk",
												"ui",
												"GuiApplicationContext"
											}), "context", nil)) end
											do _g.sling.util.FunctionUtil:addBaseCall(v, false) end
											do entity:prependNode(v) end
											method = v
										end
										do
											local forContext = nil
											local array4 = entity:getNodes()
											if array4 ~= nil then
												local n4 = 0
												local m4 = _g.jk.lang.Vector:getSize(array4)
												do
													n4 = 0
													while n4 < m4 do
														local ff = _vm:to_table_with_key(array4[n4 + 1], '_isType.sling.model.FunctionDeclarationNode')
														if ff ~= nil then
															if _g.jk.lang.String:equals(ff:getName(), "forContext") then
																local pps = ff:getParameters()
																if not (pps ~= nil) or _g.jk.lang.Vector:getSize(pps) ~= 1 then
																	goto _continue53
																end
																do
																	local pp = _vm:to_table_with_key(_g.jk.lang.Vector:get(pps, 0), '_isType.sling.model.VariableDeclarationNode')
																	if not (pp ~= nil) then
																		goto _continue53
																	end
																	do
																		local ppdt = _vm:to_table_with_key(pp:getType(), '_isType.sling.model.ReferenceDataTypeNode')
																		if not (ppdt ~= nil) then
																			goto _continue53
																		end
																		if not (_g.sling.util.DataTypeUtil:getSymbolName(ppdt) == "GuiApplicationContext") then
																			goto _continue53
																		end
																		forContext = ff
																		do break end
																	end
																end
															end
														end
														::_continue53::
														do n4 = n4 + 1 end
													end
												end
											end
											if not (forContext ~= nil) then
												forContext = _g.sling.model.FunctionDeclarationNode:forName("forContext", false)
												do forContext:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.ReferenceDataTypeNode:forArrayOfNames({
													"jk",
													"ui",
													"GuiApplicationContext"
												}), "context", nil)) end
												do
													local bd = forContext:getCreateBody()
													if bd ~= nil then
														local cx = _g.sling.model.CreateObjectExpressionNode:forType(_g.sling.model.ThisDataTypeNode._construct0(_g.sling.model.ThisDataTypeNode._create()))
														do cx:addToParameters(_g.sling.model.SymbolExpressionNode:forName("context")) end
														do bd:addNode(_g.sling.model.ReturnStatementNode:forExpression(cx)) end
													end
												end
											end
											if decl ~= nil then
												local shouldDoEarlyCreate = false
												local hasEarly = _g.sling.util.ModifierUtil:hasAnnotationModifier(entity, "earlyCreate")
												local hasLate = _g.sling.util.ModifierUtil:hasAnnotationModifier(entity, "lateCreate")
												if hasEarly and hasLate then
													_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Cannot specify both #earlyCreate and #lateCreate at the same time", entity, nil))
												elseif hasEarly then
													shouldDoEarlyCreate = true
												elseif hasLate then
													shouldDoEarlyCreate = false
												else
												end
												do
													local uiExpressionDestination = nil
													if not shouldDoEarlyCreate then
														local createMethod = _g.sling.model.FunctionDeclarationNode:forName("createWidget", false)
														do _g.sling.util.ModifierUtil:addCommonModifier(createMethod, _g.sling.model.Modifier.OVERRIDE) end
														do _g.sling.util.ModifierUtil:addCommonModifier(createMethod, _g.sling.model.Modifier.PUBLIC) end
														do _g.sling.util.FunctionUtil:addBaseCall(createMethod, false) end
														do entity:addNode(createMethod) end
														uiExpressionDestination = createMethod
													else
														uiExpressionDestination = method
													end
													do
														local body = uiExpressionDestination:getCreateBody()
														local thisWidgetVariable = _g.sling.model.VariableDeclarationNode:forName("thisWidget")
														do thisWidgetVariable:setType(_g.sling.model.ThisDataTypeNode._construct0(_g.sling.model.ThisDataTypeNode._create()), false) end
														do thisWidgetVariable:setInitializer(_g.sling.model.CurrentObjectExpressionNode._construct0(_g.sling.model.CurrentObjectExpressionNode._create()), false) end
														do _g.sling.util.ModifierUtil:addCommonModifier(thisWidgetVariable, _g.sling.model.Modifier.FINAL) end
														do _g.sling.util.ModifierUtil:addAnnotationModifier(thisWidgetVariable, "used") end
														do body:addNode(thisWidgetVariable) end
														do
															local array5 = decl:exportChildren()
															if array5 ~= nil then
																local n5 = 0
																local m5 = _g.jk.lang.Vector:getSize(array5)
																do
																	n5 = 0
																	while n5 < m5 do
																		local node = _vm:to_table_with_key(array5[n5 + 1], '_isType.sling.common.NodeObject')
																		if node ~= nil then
																			if (_vm:to_table_with_key(node, '_isType.sling.model.CommentNode') ~= nil) then
																				do body:addNode(node) end
																			elseif (_vm:to_table_with_key(node, '_isType.sling.model.UIExpressionNode') ~= nil) then
																				do _g.sling.compiler.JcoOps:handleUIExpressionNode(node, entity, uiExpressionDestination, body, nil, nil, "context", true, true) end
																			elseif (_vm:to_table_with_key(node, '_isType.sling.model.PropertyValueDeclarationNode') ~= nil) then
																				local v = _g.sling.compiler.JcoOps:handlePropertyValueDeclaration(node, nil)
																				do body:addNode(v) end
																			else
																				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node inside UI expression: `" .. _g.jk.lang.String:safeString(node:getNodeTypeName()) .. "'", node, nil))
																			end
																		end
																		do n5 = n5 + 1 end
																	end
																end
															end
															do _g.sling.util.NodeUtil:removeNode(decl) end
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
				::_continue51::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.JcoOps:validateWidgets(ctx, node)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(node, "class:sling.model.ClassDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local decl = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ClassDeclarationNode')
				if decl ~= nil then
					if _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "nojkop") then
						goto _continue54
					end
					do
						local name = decl:getNodeName()
						if name ~= nil then
							local hasWidgetName = _g.jk.lang.String:endsWith(name, "Widget") and _g.jk.lang.String:endsWith(name, "ForWidget") == false
							if hasWidgetName and name == "Widget" and _g.sling.util.NodeUtil:getQualifiedNameString(decl, 46) == "jk.widget.Widget" then
								hasWidgetName = false
							end
							do
								local hasWidgetModifier = _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "widget")
								if hasWidgetName == true and hasWidgetModifier == false then
									do _g.sling.common.RefLog:warning(ctx, "Class name ends with `Widget', but it does not have the #widget modifier.", decl) end
								end
								do
									local hasAnnotationModifier = _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "ignoreNamingConvention")
									if hasWidgetModifier == true and hasWidgetName == false and hasAnnotationModifier == false then
										do _g.sling.common.RefLog:warning(ctx, "Class has the #widget modifier, but class name does not end with `Widget'.", decl) end
									end
								end
							end
						end
					end
				end
				::_continue54::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.JcoOps:convertUIExpressionsToWidgets(ctx, node)
	do _g.sling.compiler.JcoOps:expandWidgetClasses(node) end
	do _g.sling.compiler.JcoOps:expandAllUIExpressions(node) end
	do _g.sling.compiler.JcoOps:createScreenForMainWidget(node) end
end

function sling.compiler.JcoOps:convertTreeDeclarationsToJkDom(ctx, node)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(node, "class:sling.model.EntityDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local entity = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.EntityDeclarationNode')
				if entity ~= nil then
					local mustImport = false
					local array2 = _g.sling.util.NodeFinder:findCompatibleNodes(entity, "class:sling.model.TreeExpressionNode", false, true, false)
					if array2 ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(array2)
						do
							n2 = 0
							while n2 < m2 do
								local decl = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.TreeExpressionNode')
								if decl ~= nil then
									local fd = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
									do fd:setReturnType(_g.sling.model.ReferenceDataTypeNode:forArrayOfNames({
										"jk",
										"dom",
										"Node"
									}), false) end
									do
										local fdx = _g.sling.model.FunctionDeclarationExpressionNode:forDeclaration(fd)
										local fc = _g.sling.model.FunctionCallExpressionNode:forExpression(fdx)
										local body = fd:getCreateBody()
										do body:addNode(_g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()))) end
										do _g.sling.util.NodeUtil:replaceNode(decl, fc) end
										mustImport = true
									end
								end
								do n2 = n2 + 1 end
							end
						end
					end
					if mustImport then
						do _g.sling.util.EntityUtil:addToImportNamespacesUnique(entity, _g.sling.model.SymbolNode:forArrayOfNames({
							"jk",
							"dom"
						})) end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

sling.compiler.SlingTypeResolver = _g.sling.util.TypeResolver._create()
sling.compiler.SlingTypeResolver.__index = sling.compiler.SlingTypeResolver
_vm:set_metatable(sling.compiler.SlingTypeResolver, {
	__index = _g.sling.util.TypeResolver
})

function sling.compiler.SlingTypeResolver._create()
	local v = _vm:set_metatable({}, sling.compiler.SlingTypeResolver)
	return v
end

function sling.compiler.SlingTypeResolver:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.SlingTypeResolver'
	self['_isType.sling.compiler.SlingTypeResolver'] = true
	self.ignoreFailedPaths = false
end

function sling.compiler.SlingTypeResolver:_construct0()
	sling.compiler.SlingTypeResolver._init(self)
	do _g.sling.util.TypeResolver._construct0(self) end
	return self
end

function sling.compiler.SlingTypeResolver:createTypeMapforEntity(entity, typeParameters)
	if not (typeParameters ~= nil) then
		do return nil end
	end
	if not (entity ~= nil) then
		do return nil end
	end
	do
		local gts = self:getAllGenericTypes(entity)
		if not (gts ~= nil) then
			do return nil end
		end
		do
			local it = _g.jk.lang.Vector:iterate(typeParameters)
			local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
			local rit = _g.jk.lang.Vector:iterate(gts)
			while true do
				local ndo = rit:next()
				if not (ndo ~= nil) then
					do break end
				end
				do
					local nd = _vm:to_table_with_key(ndo, '_isType.sling.model.TemplateDeclarationNode')
					if not (nd ~= nil) then
						goto _continue55
					end
					do
						local nn = _g.sling.util.NodeUtil:getQualifiedNameString(nd, 46)
						if _g.jk.lang.String:isEmpty(nn) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Empty name for generic type", nd, nil))
						end
						do
							local tt = _vm:to_table_with_key(it:next(), '_isType.sling.common.DataTypeNode')
							if not (tt ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Ran out of data type parameters when generating type map", entity, nil))
							end
							do v:setObject(nn, tt) end
						end
					end
				end
				::_continue55::
			end
			do return _g.sling.model.TypeMap:forDynamicMap(v) end
		end
	end
end

function sling.compiler.SlingTypeResolver:addToTypemap(v, type, entity)
	if not (v ~= nil and type ~= nil and entity ~= nil) then
		do return end
	end
	do
		local tps = self:getTypeParametersForNode(type)
		if _g.jk.lang.Vector:isEmpty(tps) then
			do return end
		end
		do
			local gee = _vm:to_table_with_key(entity, '_isType.sling.model.GenericCapableEntityDeclarationNode')
			if not (gee ~= nil) then
				do return end
			end
			do
				local gts = self:getAllGenericTypes(gee)
				if _g.jk.lang.Vector:isEmpty(gts) then
					do return end
				end
				do
					local typemap = v:getTypemap()
					if not (typemap ~= nil) then
						typemap = _g.sling.model.TypeMap._construct0(_g.sling.model.TypeMap._create())
						do v:setTypemap(typemap) end
					end
					do
						local n = 0
						while true do
							local tt = _vm:to_table_with_key(_g.jk.lang.Vector:get(gts, n), '_isType.sling.model.TemplateDeclarationNode')
							local vv = _vm:to_table_with_key(_g.jk.lang.Vector:get(tps, n), '_isType.sling.common.DataTypeNode')
							if tt == nil or vv == nil then
								do break end
							end
							do n = n + 1 end
							do typemap:set(_g.sling.util.NodeUtil:getQualifiedNameString(tt, 46), vv) end
						end
					end
				end
			end
		end
	end
end

function sling.compiler.SlingTypeResolver:isNodeBefore(nodea, nodeb, block)
	local array = block:getNodes()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local nn = array[n + 1]
				if nn ~= nil then
					if nn == nodeb then
						do return false end
					end
					if nn == nodea then
						do return true end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return false end
end

function sling.compiler.SlingTypeResolver:tryResolveChildInContainer(container, beforeNode, childName, staticOnly)
	if not (container ~= nil) then
		do return nil end
	end
	do
		local n = 0
		local idx = container:getNodeIndexForName(childName)
		while true do
			local v = _g.jk.lang.Vector:get(idx, n)
			if not (v ~= nil) then
				do break end
			end
			if beforeNode ~= nil and (_vm:to_table_with_key(container, '_isType.sling.model.BlockNode') ~= nil) and self:isNodeBefore(v, beforeNode, container) == false then
				do n = n + 1 end
				goto _continue56
			end
			if staticOnly then
				if not _g.sling.util.ModifierUtil:hasCommonModifier(v, _g.sling.model.Modifier.STATIC) then
					do n = n + 1 end
					goto _continue56
				end
			end
			do
				local rr = _g.sling.util.ResolveResult._construct0(_g.sling.util.ResolveResult._create())
				do rr:setNode(v) end
				do return rr end
			end
			::_continue56::
		end
		do
			local entity = _vm:to_table_with_key(container, '_isType.sling.model.EntityDeclarationNode')
			if entity ~= nil then
				local array = entity:getBaseTypes()
				if array ~= nil then
					local n2 = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n2 = 0
						while n2 < m do
							local basetype = _vm:to_table_with_key(array[n2 + 1], '_isType.sling.model.BaseTypeNode')
							if basetype ~= nil then
								local type = basetype:getReferenceType()
								if not (type ~= nil) then
									goto _continue57
								end
								do
									local _rval = nil
									local _status, _err = _vm:execute_protected_call(function()
										do self:resolveDataType(type) end
										do
											local be = _g.sling.util.TypeResolver:getAndRequireBoundContainer(type)
											local v = self:tryResolveChildInContainer(be, nil, childName, staticOnly)
											if v ~= nil then
												do self:addToTypemap(v, type, be) end
												_rval = {}
												_rval.value = v
												do return end
											end
										end
									end)
									if _err then
										if (_vm:to_table_with_key(_err, '_isType.sling.common.ReferenceError') ~= nil) then
											local e = _err
											if not self.ignoreFailedPaths then
												_vm:throw_error(e)
											end
										else
											_vm:throw_error(_err)
										end
									end
									if _rval then
										do return _rval.value end
									end
								end
							end
							::_continue57::
							do n2 = n2 + 1 end
						end
					end
				end
			end
			do return nil end
		end
	end
end

function sling.compiler.SlingTypeResolver:resolveChild(parent, childName)
	if not (parent ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("resolveChild: null parent", nil, nil))
	end
	if not (childName ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("resolveChild: null childName", nil, nil))
	end
	if (_vm:to_table_with_key(parent, '_isType.sling.common.ContainerNode') ~= nil) then
		local v = self:tryResolveChildInContainer(parent, nil, childName, false)
		if v ~= nil then
			do return v end
		end
	elseif (_vm:to_table_with_key(parent, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
		local ref = _g.sling.util.TypeResolver:getAndRequireBoundContainer(parent:getType())
		do return self:resolveChild(ref, childName) end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Declaration of `" .. _g.jk.lang.String:safeString(childName) .. "' was not found here", parent, nil))
	do return nil end
end

function sling.compiler.SlingTypeResolver:resolveAbsoluteNames(context, names)
	local v = _vm:to_table_with_key(_g.sling.util.FindUtil:findRootNamespace(context), '_isType.sling.common.NodeObject')
	if not (v ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unable to find root namespace", context, nil))
	end
	do
		local sz = _g.jk.lang.Vector:getSize(names)
		local rr = _g.sling.util.ResolveResult:forNode(v)
		do
			local n = 0
			while n < sz do
				local vv = self:resolveChild(rr:getNode(), _g.jk.lang.Vector:get(names, n))
				local typemap = _g.sling.model.TypeMap._construct0(_g.sling.model.TypeMap._create())
				do typemap:copyFrom(rr:getTypemap()) end
				do typemap:copyFrom(vv:getTypemap()) end
				do vv:setTypemap(typemap) end
				rr = vv
				do n = n + 1 end
			end
		end
		do return rr end
	end
end

function sling.compiler.SlingTypeResolver:resolveAbsoluteNamesNode(context, names)
	local v = self:resolveAbsoluteNames(context, names)
	if not (v ~= nil) then
		do return nil end
	end
	do return v:getNode() end
end

function sling.compiler.SlingTypeResolver:resolveNames(context, names)
	if not (context ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No context", nil, nil))
	end
	if not (names ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No names", nil, nil))
	end
	do
		local firstName = _g.jk.lang.Vector:get(names, 0)
		if _g.jk.lang.String:isEmpty(firstName) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("First name to resolve is empty!", context, nil))
		end
		do
			local pp = self:resolveName(context, firstName)
			local sz = _g.jk.lang.Vector:getSize(names)
			do
				local n = 1
				while n < sz do
					local npp = self:resolveChild(pp:getNode(), _g.jk.lang.Vector:get(names, n))
					local typemap = _g.sling.model.TypeMap._construct0(_g.sling.model.TypeMap._create())
					do typemap:copyFrom(pp:getTypemap()) end
					do typemap:copyFrom(npp:getTypemap()) end
					do npp:setTypemap(typemap) end
					pp = npp
					do n = n + 1 end
				end
			end
			do return pp end
		end
	end
end

function sling.compiler.SlingTypeResolver:tryResolveNames(context, names)
	do
		local _rval = nil
		local _status, _err = _vm:execute_protected_call(function()
			_rval = {}
			_rval.value = self:resolveNames(context, names)
			do return end
		end)
		if _err then
		end
		if _rval then
			do return _rval.value end
		end
	end
	do return nil end
end

function sling.compiler.SlingTypeResolver:resolveName(context, name)
	if not (name ~= nil) then
		do return nil end
	end
	do
		local node = context
		local pnode = nil
		while node ~= nil do
			local entity = _vm:to_table_with_key(node, '_isType.sling.model.EntityDeclarationNode')
			if entity ~= nil then
				local fromBaseType = (_vm:to_table_with_key(pnode, '_isType.sling.model.BaseTypeNode') ~= nil)
				if not fromBaseType then
					local v = self:tryResolveChildInContainer(entity, nil, name, false)
					if v ~= nil then
						do return v end
					end
				end
				do
					local array = entity:getImportEntities()
					if array ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(array)
						do
							n = 0
							while n < m do
								local importEntity = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ImportEntityStatementNode')
								if importEntity ~= nil then
									local container = importEntity:getContainer()
									local entity = importEntity:getEntity()
									local names = _g.sling.util.SymbolUtil:getSymbolNames(_g.sling.util.SymbolUtil:mergeSymbols(container, entity))
									local nsref = nil
									local error = nil
									do
										local _status, _err = _vm:execute_protected_call(function()
											nsref = self:resolveAbsoluteNamesNode(entity, names)
										end)
										if _err then
											if (_vm:to_table_with_key(_err, '_isType.sling.common.ReferenceError') ~= nil) then
												local ee = _err
												error = ee
											else
												_vm:throw_error(_err)
											end
										end
									end
									if not (nsref ~= nil) then
										local re = _g.sling.common.ReferenceError:forMessage("Imported entity not found: `" .. _g.jk.lang.String:safeString(_g.sling.util.SymbolUtil:getSymbolNamesString(entity, 46)) .. "'", entity, nil)
										if error ~= nil then
											do re:addRelatedMessageObject(error:getError()) end
										end
										_vm:throw_error(re)
									end
									do
										local allMembers = importEntity:getAllMembers()
										if not allMembers then
											local nn = _vm:to_table_with_key(nsref, '_isType.sling.common.NamedNode')
											if nn ~= nil then
												if _g.jk.lang.String:equals(name, nn:getNodeName()) then
													do return _g.sling.util.ResolveResult:forNode(nn) end
												end
											end
										else
											local v = self:tryResolveChildInContainer(_vm:to_table_with_key(nsref, '_isType.sling.common.ContainerNode'), nil, name, false)
											if v ~= nil then
												do return v end
											end
										end
									end
								end
								do n = n + 1 end
							end
						end
					end
					do
						local array2 = entity:getImportStaticNamespaces()
						if array2 ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(array2)
							do
								n2 = 0
								while n2 < m2 do
									local importNamespace = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.ImportStaticMemberStatementNode')
									if importNamespace ~= nil then
										local container = importNamespace:getContainer()
										local members = importNamespace:getMember()
										local names = _g.sling.util.SymbolUtil:getSymbolNames(_g.sling.util.SymbolUtil:mergeSymbols(container, members))
										local nsref = nil
										local error = nil
										do
											local _status, _err = _vm:execute_protected_call(function()
												nsref = self:resolveAbsoluteNamesNode(entity, names)
											end)
											if _err then
												if (_vm:to_table_with_key(_err, '_isType.sling.common.ReferenceError') ~= nil) then
													local ee = _err
													error = ee
												else
													_vm:throw_error(_err)
												end
											end
										end
										if not (nsref ~= nil) then
											local re = _g.sling.common.ReferenceError:forMessage("Static import not found: `" .. _g.jk.lang.String:safeString(_g.sling.util.SymbolUtil:getSymbolNamesString(importNamespace:getMember(), 46)) .. "'", importNamespace, nil)
											if error ~= nil then
												do re:addRelatedMessageObject(error:getError()) end
											end
											_vm:throw_error(re)
										end
										do
											local allMembers = importNamespace:getAllMembers()
											if not allMembers then
												local nn = _vm:to_table_with_key(nsref, '_isType.sling.common.NamedNode')
												if nn ~= nil then
													if _g.jk.lang.String:equals(name, nn:getNodeName()) and _g.sling.util.ModifierUtil:hasCommonModifier(nn, _g.sling.model.Modifier.STATIC) then
														do return _g.sling.util.ResolveResult:forNode(nn) end
													end
												end
											else
												local v = self:tryResolveChildInContainer(_vm:to_table_with_key(nsref, '_isType.sling.common.ContainerNode'), nil, name, true)
												if v ~= nil then
													do return v end
												end
											end
										end
									end
									do n2 = n2 + 1 end
								end
							end
						end
						do
							local array3 = entity:getImportNamespaces()
							if array3 ~= nil then
								local n3 = 0
								local m3 = _g.jk.lang.Vector:getSize(array3)
								do
									n3 = 0
									while n3 < m3 do
										local importNamespace = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.model.SymbolNode')
										if importNamespace ~= nil then
											local names = _g.sling.util.SymbolUtil:getSymbolNames(importNamespace)
											local nsref = nil
											local error = nil
											do
												local _status, _err = _vm:execute_protected_call(function()
													nsref = _vm:to_table_with_key(self:resolveAbsoluteNamesNode(entity, names), '_isType.sling.model.NamespaceNode')
												end)
												if _err then
													if (_vm:to_table_with_key(_err, '_isType.sling.common.ReferenceError') ~= nil) then
														local ee = _err
														error = ee
													else
														_vm:throw_error(_err)
													end
												end
											end
											if not (nsref ~= nil) then
												if self.ignoreFailedPaths then
													goto _continue58
												end
												do
													local re = _g.sling.common.ReferenceError:forMessage("Namespace not found: `" .. _g.jk.lang.String:safeString(_g.sling.util.SymbolUtil:getSymbolNamesString(importNamespace, 46)) .. "'", importNamespace, nil)
													if error ~= nil then
														do re:addRelatedMessageObject(error:getError()) end
													end
													_vm:throw_error(re)
												end
											end
											do
												local v = self:tryResolveChildInContainer(nsref, nil, name, false)
												if v ~= nil then
													do return v end
												end
											end
										end
										::_continue58::
										do n3 = n3 + 1 end
									end
								end
							end
							do
								local gentity = _vm:to_table_with_key(node, '_isType.sling.model.GenericCapableEntityDeclarationNode')
								if gentity ~= nil then
									local array4 = gentity:getGenericTypes()
									if array4 ~= nil then
										local n4 = 0
										local m4 = _g.jk.lang.Vector:getSize(array4)
										do
											n4 = 0
											while n4 < m4 do
												local type = _vm:to_table_with_key(array4[n4 + 1], '_isType.sling.model.TemplateDeclarationNode')
												if type ~= nil then
													if _g.jk.lang.String:equals(type:getName(), name) then
														do return _g.sling.util.ResolveResult:forNode(type) end
													end
												end
												do n4 = n4 + 1 end
											end
										end
									end
								end
								if fromBaseType then
									pnode = node
									node = node:getParent()
									goto _continue59
								end
							end
						end
					end
				end
			else
				local container = _vm:to_table_with_key(node, '_isType.sling.common.ContainerNode')
				if container ~= nil then
					local v = self:tryResolveChildInContainer(container, pnode, name, false)
					if v ~= nil then
						do return v end
					end
				end
			end
			do
				local fd = _vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationBaseNode')
				if fd ~= nil then
					local array5 = fd:getGenericTypes()
					if array5 ~= nil then
						local n5 = 0
						local m5 = _g.jk.lang.Vector:getSize(array5)
						do
							n5 = 0
							while n5 < m5 do
								local type = _vm:to_table_with_key(array5[n5 + 1], '_isType.sling.model.TemplateDeclarationNode')
								if type ~= nil then
									if _g.jk.lang.String:equals(type:getName(), name) then
										do return _g.sling.util.ResolveResult:forNode(type) end
									end
								end
								do n5 = n5 + 1 end
							end
						end
					end
				end
				do
					local forloop = _vm:to_table_with_key(node, '_isType.sling.model.ForStatementNode')
					if forloop ~= nil then
						local inits = forloop:getInitializer()
						local array6 = inits:getNodes()
						if array6 ~= nil then
							local n6 = 0
							local m6 = _g.jk.lang.Vector:getSize(array6)
							do
								n6 = 0
								while n6 < m6 do
									local init = _vm:to_table_with_key(array6[n6 + 1], '_isType.sling.common.NamedNode')
									if init ~= nil then
										if _g.jk.lang.String:equals(name, init:getNodeName()) then
											do return _g.sling.util.ResolveResult:forNode(init) end
										end
									end
									do n6 = n6 + 1 end
								end
							end
						end
					end
					do
						local fes = _vm:to_table_with_key(node, '_isType.sling.model.ForEachStatementNode')
						if fes ~= nil then
							local array7 = fes:getLefts()
							if array7 ~= nil then
								local n7 = 0
								local m7 = _g.jk.lang.Vector:getSize(array7)
								do
									n7 = 0
									while n7 < m7 do
										local left = _vm:to_table_with_key(array7[n7 + 1], '_isType.sling.model.VariableDeclarationNode')
										if left ~= nil then
											if _g.jk.lang.String:equals(left:getName(), name) then
												do return _g.sling.util.ResolveResult:forNode(left) end
											end
										end
										do n7 = n7 + 1 end
									end
								end
							end
						end
						do
							local _function = _vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationBaseNode')
							if _function ~= nil then
								local array8 = _function:getParameters()
								if array8 ~= nil then
									local n8 = 0
									local m8 = _g.jk.lang.Vector:getSize(array8)
									do
										n8 = 0
										while n8 < m8 do
											local parameter = _vm:to_table_with_key(array8[n8 + 1], '_isType.sling.common.NamedNode')
											if parameter ~= nil then
												if _g.jk.lang.String:equals(name, parameter:getNodeName()) then
													do return _g.sling.util.ResolveResult:forNode(parameter) end
												end
											end
											do n8 = n8 + 1 end
										end
									end
								end
							end
							do
								local cb = _vm:to_table_with_key(node, '_isType.sling.model.CatchBlockNode')
								if cb ~= nil then
									local array9 = cb:getExceptions()
									if array9 ~= nil then
										local n9 = 0
										local m9 = _g.jk.lang.Vector:getSize(array9)
										do
											n9 = 0
											while n9 < m9 do
												local variable = _vm:to_table_with_key(array9[n9 + 1], '_isType.sling.model.VariableDeclarationNode')
												if variable ~= nil then
													if _g.jk.lang.String:equals(name, variable:getName()) then
														do return _g.sling.util.ResolveResult:forNode(variable) end
													end
												end
												do n9 = n9 + 1 end
											end
										end
									end
								end
								pnode = node
								node = node:getParent()
							end
						end
					end
				end
			end
			::_continue59::
		end
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No matching declaration was found: `" .. _g.jk.lang.String:safeString(name) .. "'", context, nil))
		do return nil end
	end
end

function sling.compiler.SlingTypeResolver:tryResolveDataType(ctx, rdt)
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:resolveDataType(rdt) end
		end)
		if _err then
			if (_vm:to_table_with_key(_err, '_isType.sling.common.ReferenceError') ~= nil) then
				local e = _err
				if ctx ~= nil and ctx:isInDebugMode() then
					do _g.jk.log.Log:debug(ctx, e:toStringWithDebug(true)) end
				end
				do return false end
			else
				_vm:throw_error(_err)
			end
		end
	end
	do return true end
end

function sling.compiler.SlingTypeResolver:storeTypeParameters(symbol)
	do symbol:setTypeParameters(nil, false) end
	do
		local params = self:getTypeParametersForNode(symbol)
		if params ~= nil then
			local v = {}
			if params ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(params)
				do
					n = 0
					while n < m do
						local dt = _vm:to_table_with_key(params[n + 1], '_isType.sling.common.DataTypeNode')
						if dt ~= nil then
							do _g.jk.lang.Vector:append(v, _g.sling.util.DataTypeUtil:dupAsDataType(dt)) end
						end
						do n = n + 1 end
					end
				end
			end
			do symbol:setTypeParameters(v, false) end
		end
	end
end

function sling.compiler.SlingTypeResolver:resolveDataType(odt)
	if not (odt ~= nil) then
		do return end
	end
	if (_vm:to_table_with_key(odt, '_isType.sling.model.ThisDataTypeNode') ~= nil) then
		do return end
	end
	do
		local rdt = _vm:to_table_with_key(odt, '_isType.sling.model.ReferenceDataTypeNode')
		if not (rdt ~= nil) then
			do return end
		end
		do
			local symbol = rdt:getSymbol()
			if not (symbol ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null symbol", rdt, nil))
			end
			if rdt:getMagical() then
				local v = _g.sling.model.MagicalClassDeclarationNode._construct0(_g.sling.model.MagicalClassDeclarationNode._create())
				do v:setSymbol(_vm:to_table_with_key(_g.sling.util.NodeUtil:dupAsNode(symbol), '_isType.sling.model.SymbolNode'), false) end
				do symbol:setBinding(v, nil) end
				do return end
			end
			do
				local binding = symbol:getBinding()
				if binding ~= nil then
					if (_vm:to_table_with_key(binding, '_isType.sling.model.MagicalClassDeclarationNode') ~= nil) == false and binding:getParent() == nil then
						do symbol:setBinding(nil, nil) end
					else
						do return end
					end
				end
				do
					local names = _g.sling.util.SymbolUtil:getSymbolNames(symbol)
					if not (names ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No names for symbol", symbol, nil))
					end
					do
						local _status, _err = _vm:execute_protected_call(function()
							local result = self:resolveNames(rdt, names)
							do _g.sling.compiler.SlingTypeResolver:storeTypeParameters(symbol) end
							do symbol:setBinding(result:getNode(), result:getTypemap()) end
							do self:resolveDataTypes(symbol) end
						end)
						if _err then
							if (_vm:to_table_with_key(_err, '_isType.sling.common.ReferenceError') ~= nil) then
								local error = _err
								local re = _g.sling.common.ReferenceError:forMessage("Failed to resolve symbol", symbol, nil)
								do re:addRelatedMessageObject(error:getError()) end
								_vm:throw_error(re)
							else
								_vm:throw_error(_err)
							end
						end
					end
				end
			end
		end
	end
end

function sling.compiler.SlingTypeResolver:getResolveError(xpr)
	local sxpr = _vm:to_table_with_key(xpr, '_isType.sling.model.SymbolExpressionNode')
	if not (sxpr ~= nil) then
		do return _g.sling.common.ReferenceError:forMessage("Failed to resolve expression", xpr, nil) end
	end
	do
		local symbol = sxpr:getSymbol()
		local name = nil
		if not (symbol ~= nil) then
			name = "(null symbol in expression)"
		else
			name = _g.sling.util.SymbolUtil:getSymbolNamesString(symbol, 46)
		end
		if _g.jk.lang.String:isEmpty(name) and symbol ~= nil then
			local comps = _g.sling.util.SymbolUtil:getSymbolComponents(symbol)
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			if comps ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(comps)
				do
					n = 0
					while n < m do
						local comp = _vm:to_table_with_key(comps[n + 1], '_isType.sling.model.SymbolNameComponentNode')
						if comp ~= nil then
							if sb:count() > 0 then
								do sb:appendCharacter(46) end
							end
							do sb:appendString(comp:getName()) end
						end
						do n = n + 1 end
					end
				end
			end
			if sb:count() > 0 then
				do sb:appendString(" (original name; bound node name was empty)") end
			end
			name = sb:toString()
		end
		if _g.jk.lang.String:isEmpty(name) then
			name = "(empty symbol components)"
		end
		do return _g.sling.common.ReferenceError:forMessage("Failure while resolving symbol expression: `" .. _g.jk.lang.String:safeString(name) .. "'", xpr, nil) end
	end
end

function sling.compiler.SlingTypeResolver:getPossibleBindingsFromBaseTypes(container, name, v)
	local entity = _vm:to_table_with_key(container, '_isType.sling.model.EntityDeclarationNode')
	if not (entity ~= nil) then
		do return end
	end
	do
		local array = entity:getBaseTypes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local basetype = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.BaseTypeNode')
					if basetype ~= nil then
						local type = basetype:getReferenceType()
						if not (type ~= nil) then
							goto _continue60
						end
						do
							local _status, _err = _vm:execute_protected_call(function()
								do self:resolveDataType(type) end
								do
									local be = _g.sling.util.TypeResolver:getAndRequireBoundContainer(type)
									local rr = self:tryResolveChildInContainer(be, nil, name, false)
									if rr ~= nil then
										do self:addToTypemap(rr, type, be) end
										do _g.jk.lang.Vector:append(v, rr) end
									end
									do self:getPossibleBindingsFromBaseTypes(be, name, v) end
								end
							end)
							if _err then
								if (_vm:to_table_with_key(_err, '_isType.sling.common.ReferenceError') ~= nil) then
									local e = _err
									if not self.ignoreFailedPaths then
										_vm:throw_error(e)
									end
								else
									_vm:throw_error(_err)
								end
							end
						end
					end
					::_continue60::
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.compiler.SlingTypeResolver:getPossibleBindings(xpr)
	if not (xpr ~= nil) then
		do return nil end
	end
	do
		local symbol = xpr:getSymbol()
		if not (symbol ~= nil) then
			do return nil end
		end
		do
			local binding = _g.sling.util.SymbolUtil:tryGetSymbolBindingForExpression(xpr)
			if not (binding ~= nil) then
				do return nil end
			end
			do
				local bp = _vm:to_table_with_key(binding:getParent(), '_isType.sling.common.ContainerNode')
				if not (bp ~= nil) then
					local v = {}
					local rr = _g.sling.util.ResolveResult._construct0(_g.sling.util.ResolveResult._create())
					do rr:setNode(binding) end
					do rr:setTypemap(symbol:getBindingTypemap()) end
					do rr:setTypeParameters(symbol:getTypeParameters()) end
					do _g.jk.lang.Vector:append(v, rr) end
					do return v end
				end
				do
					local name = _g.sling.util.SymbolUtil:getSymbolName(symbol)
					if _g.jk.lang.String:isEmpty(name) then
						do return nil end
					end
					do
						local v = {}
						local array = bp:getNodeIndexForName(name)
						if array ~= nil then
							local n = 0
							local m = _g.jk.lang.Vector:getSize(array)
							do
								n = 0
								while n < m do
									local node = array[n + 1]
									if node ~= nil then
										local rr = _g.sling.util.ResolveResult._construct0(_g.sling.util.ResolveResult._create())
										do rr:setNode(node) end
										do rr:setTypemap(symbol:getBindingTypemap()) end
										do rr:setTypeParameters(symbol:getTypeParameters()) end
										do _g.jk.lang.Vector:append(v, rr) end
									end
									do n = n + 1 end
								end
							end
						end
						do self:getPossibleBindingsFromBaseTypes(bp, name, v) end
						do return v end
					end
				end
			end
		end
	end
end

function sling.compiler.SlingTypeResolver:handleInferTypes(dt1, dt2, tnames, typemap)
	if (_vm:to_table_with_key(dt1, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
		local tref = _g.sling.util.SymbolUtil:tryGetSymbolBinding(dt1:getSymbol())
		if tref ~= nil then
			local name1 = _g.sling.util.NodeUtil:getQualifiedNameString(tref, 46)
			if name1 ~= nil and tnames:contains(name1) then
				if typemap:contains(name1) == false then
					do typemap:set(name1, dt2) end
				end
			end
		end
	end
	do
		local tp1 = self:getTypeParametersForNode(dt1)
		local tp2 = self:getTypeParametersForNode(dt2)
		if tp1 ~= nil and tp2 ~= nil then
			local n1 = 0
			local n2 = 0
			while true do
				local tp1dt = _vm:to_table_with_key(_g.jk.lang.Vector:get(tp1, n1), '_isType.sling.common.DataTypeNode')
				local tp2dt = _vm:to_table_with_key(_g.jk.lang.Vector:get(tp2, n2), '_isType.sling.common.DataTypeNode')
				if tp1dt ~= nil and tp2dt ~= nil then
					do self:handleInferTypes(tp1dt, tp2dt, tnames, typemap) end
				else
					do break end
				end
				do n1 = n1 + 1 end
				do n2 = n2 + 1 end
			end
		end
	end
end

function sling.compiler.SlingTypeResolver:inferTypeMapFromCallParameters(fd, params)
	if not (fd ~= nil) then
		do return nil end
	end
	do
		local generics = fd:getGenericTypes()
		if not _g.jk.lang.Vector:isNotEmpty(generics) then
			do return nil end
		end
		do
			local myparams = fd:getParameters()
			local v = _g.sling.model.TypeMap._construct0(_g.sling.model.TypeMap._create())
			local n1 = 0
			local n2 = 0
			local tnames = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
			if generics ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(generics)
				do
					n = 0
					while n < m do
						local generic = _vm:to_table_with_key(generics[n + 1], '_isType.sling.model.TemplateDeclarationNode')
						if generic ~= nil then
							local name = _g.sling.util.NodeUtil:getQualifiedNameString(generic, 46)
							if name ~= nil then
								do tnames:add(name) end
							end
						end
						do n = n + 1 end
					end
				end
			end
			while true do
				local vd = _vm:to_table_with_key(_g.jk.lang.Vector:get(myparams, n1), '_isType.sling.model.VariableDeclarationNode')
				local pp = _vm:to_table_with_key(_g.jk.lang.Vector:get(params, n2), '_isType.sling.model.ExpressionNode')
				do n1 = n1 + 1 end
				do n2 = n2 + 1 end
				if vd == nil or pp == nil then
					do break end
				end
				do
					local dt1 = self:resolveVariableType(vd)
					local dt2 = _g.sling.util.ExpressionUtil:getExpressionDataType(pp, self)
					if dt1 == nil and dt2 == nil then
						goto _continue61
					end
					if dt1 == nil or dt2 == nil then
						do break end
					end
					do self:handleInferTypes(dt1, dt2, tnames, v) end
				end
				::_continue61::
			end
			do return v end
		end
	end
end

sling.compiler.SlingTypeResolver.MatchingComponents = {}
sling.compiler.SlingTypeResolver.MatchingComponents.__index = sling.compiler.SlingTypeResolver.MatchingComponents
_vm:set_metatable(sling.compiler.SlingTypeResolver.MatchingComponents, {})

function sling.compiler.SlingTypeResolver.MatchingComponents._create()
	local v = _vm:set_metatable({}, sling.compiler.SlingTypeResolver.MatchingComponents)
	return v
end

function sling.compiler.SlingTypeResolver.MatchingComponents:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.SlingTypeResolver.MatchingComponents'
	self['_isType.sling.compiler.SlingTypeResolver.MatchingComponents'] = true
	self.declaration = nil
	self.binding = nil
	self.typemap = nil
end

function sling.compiler.SlingTypeResolver.MatchingComponents:_construct0()
	sling.compiler.SlingTypeResolver.MatchingComponents._init(self)
	return self
end

function sling.compiler.SlingTypeResolver.MatchingComponents:getDeclaration()
	do return self.declaration end
end

function sling.compiler.SlingTypeResolver.MatchingComponents:setDeclaration(v)
	self.declaration = v
	do return self end
end

function sling.compiler.SlingTypeResolver.MatchingComponents:getBinding()
	do return self.binding end
end

function sling.compiler.SlingTypeResolver.MatchingComponents:setBinding(v)
	self.binding = v
	do return self end
end

function sling.compiler.SlingTypeResolver.MatchingComponents:getTypemap()
	do return self.typemap end
end

function sling.compiler.SlingTypeResolver.MatchingComponents:setTypemap(v)
	self.typemap = v
	do return self end
end

function sling.compiler.SlingTypeResolver:getFunctionMatchingComponents(decls, params, oxpr)
	local fcomps = {}
	if decls ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(decls)
		do
			n = 0
			while n < m do
				local declbind = decls[n + 1]
				if declbind ~= nil then
					local node = declbind:getNode()
					local binding = nil
					local decl = nil
					if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
						if not _g.sling.util.ModifierUtil:hasAnnotationModifier(node, "macro") then
							decl = node
							binding = node
						end
					elseif (_vm:to_table_with_key(node, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
						local dt = _vm:to_table_with_key(self:resolveVariableType(node), '_isType.sling.model.FunctionDataTypeNode')
						if dt ~= nil then
							local dd = dt:getDeclaration()
							if dd ~= nil then
								decl = dd
								binding = node
							end
						end
					end
					if not (decl ~= nil) then
						goto _continue62
					end
					do
						local typemap = nil
						if _g.sling.util.ModifierUtil:hasCommonModifier(decl, _g.sling.model.Modifier.STATIC) then
							typemap = self:inferTypeMapFromCallParameters(decl, params)
						else
							typemap = self:getTypeMapFromExpression(oxpr)
						end
						do
							local tps = declbind:getTypeParameters()
							if tps ~= nil then
								local bindmap = self:createTypeMapforEntity(_vm:to_table_with_key(_g.sling.util.FindUtil:findNearestEntity(decl), '_isType.sling.model.GenericCapableEntityDeclarationNode'), tps)
								if bindmap ~= nil then
									typemap = _g.sling.model.TypeMap:merge(bindmap, typemap)
								end
							end
							do
								local refmap = declbind:getTypemap()
								if refmap ~= nil then
									typemap = _g.sling.model.TypeMap:merge(refmap, typemap)
								end
								do
									local v = _g.sling.compiler.SlingTypeResolver.MatchingComponents._construct0(_g.sling.compiler.SlingTypeResolver.MatchingComponents._create())
									do v:setDeclaration(decl) end
									do v:setTypemap(typemap) end
									do v:setBinding(binding) end
									do _g.jk.lang.Vector:append(fcomps, v) end
								end
							end
						end
					end
				end
				::_continue62::
				do n = n + 1 end
			end
		end
	end
	do return fcomps end
end

function sling.compiler.SlingTypeResolver:resolveFunctionDeclaration(fc)
	if not (fc ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("resolveFunctionDeclaration: null fc", nil, nil))
	end
	do
		local xpr = fc:getExpression()
		if not (xpr ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Function call has no expression", fc, nil))
		end
		do self:resolveExpression(xpr) end
		do
			local array = fc:getParameters()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local param = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ExpressionNode')
						if param ~= nil then
							do self:resolveExpression(param) end
						end
						do n = n + 1 end
					end
				end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.FunctionDeclarationExpressionNode') ~= nil) then
				local v = xpr:getDeclaration()
				if not (v ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Function declaration expression has no declaration!", xpr, nil))
				end
				do return v end
			end
			do
				local oxpr = xpr
				if (_vm:to_table_with_key(xpr, '_isType.sling.model.MemberAccessExpressionNode') ~= nil) then
					xpr = xpr:getLastNode()
				end
				do
					local rt = xpr:getResolvedDataType()
					if (_vm:to_table_with_key(rt, '_isType.sling.model.DynamicDataTypeNode') ~= nil) then
						do return nil end
					end
					if (_vm:to_table_with_key(xpr, '_isType.sling.model.SymbolExpressionNode') ~= nil) then
						local binds = self:getPossibleBindings(xpr)
						if _g.jk.lang.Vector:isEmpty(binds) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unable to find any candidates for function: `" .. _g.jk.lang.String:safeString(_g.sling.util.SymbolUtil:getSymbolNamesString(xpr:getSymbol(), 46)) .. "'", xpr, nil))
						end
						do
							local prams = fc:getParameters()
							local comps = self:getFunctionMatchingComponents(binds, prams, oxpr)
							if comps ~= nil then
								local n2 = 0
								local m2 = _g.jk.lang.Vector:getSize(comps)
								do
									n2 = 0
									while n2 < m2 do
										local comp = comps[n2 + 1]
										if comp ~= nil then
											if self:matchesCallParameters(comp:getDeclaration(), prams, comp:getTypemap(), true, true) then
												local decl = comp:getDeclaration()
												do self:setBindingForFunctionCallSymbol(xpr, comp:getBinding(), comp:getTypemap()) end
												do return decl end
											end
										end
										do n2 = n2 + 1 end
									end
								end
							end
							do
								local nems = nil
								if comps ~= nil then
									local n3 = 0
									local m3 = _g.jk.lang.Vector:getSize(comps)
									do
										n3 = 0
										while n3 < m3 do
											local comp = comps[n3 + 1]
											if comp ~= nil then
												if self:matchesCallParameters(comp:getDeclaration(), prams, comp:getTypemap(), false, true) then
													if not (nems ~= nil) then
														nems = {}
													end
													do _g.jk.lang.Vector:append(nems, comp) end
												end
											end
											do n3 = n3 + 1 end
										end
									end
								end
								if nems ~= nil then
									local most = self:resolveMostExactFunctionDeclaration(nems, prams)
									if most ~= nil then
										local decl = most:getDeclaration()
										do self:setBindingForFunctionCallSymbol(xpr, most:getBinding(), most:getTypemap()) end
										do return decl end
									end
								end
								do
									local error = _g.sling.common.ReferenceError:forMessage("Unable to find the requested function: `" .. _g.jk.lang.String:safeString(_g.sling.generator.SlingGenerator:getFunctionCallDisplayString(fc)) .. "'", xpr, nil)
									if binds ~= nil then
										local n4 = 0
										local m4 = _g.jk.lang.Vector:getSize(binds)
										do
											n4 = 0
											while n4 < m4 do
												local bind = binds[n4 + 1]
												if bind ~= nil then
													do error:addRelatedMessage("Possible candidate", bind:getNode()) end
												end
												do n4 = n4 + 1 end
											end
										end
									end
									_vm:throw_error(error)
								end
							end
						end
					end
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported child expression type for function call: `" .. _g.jk.lang.String:safeString(xpr:getNodeTypeName()) .. "'", xpr, nil))
					do return nil end
				end
			end
		end
	end
end

function sling.compiler.SlingTypeResolver:resolveMostExactFunctionDeclaration(comps, prams)
	if not (_g.jk.lang.Vector:getSize(prams) > 0) then
		do return nil end
	end
	do
		local size = _g.jk.lang.Vector:getSize(comps)
		if not (size > 0) then
			do return nil end
		end
		if size == 1 then
			do return _g.jk.lang.Vector:getFirst(comps) end
		end
		do
			local hscr = -1
			local mcom = nil
			if comps ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(comps)
				do
					n = 0
					while n < m do
						local comp = comps[n + 1]
						if comp ~= nil then
							local decl = comp:getDeclaration()
							local dprm = decl:getParameters()
							local i = 0
							local c = 0
							while true do
								local vd = _vm:to_table_with_key(_g.jk.lang.Vector:get(dprm, i), '_isType.sling.model.VariableDeclarationNode')
								local pp = _vm:to_table_with_key(_g.jk.lang.Vector:get(prams, i), '_isType.sling.model.ExpressionNode')
								if vd == nil or pp == nil then
									do break end
								end
								do i = i + 1 end
								do
									local d1 = vd:getType()
									local d2 = _g.sling.util.ExpressionUtil:tryGetExpressionDataType(pp, nil)
									c = c + self:getPrimitiveDataTypeLikenessScore(d2, d1)
								end
							end
							if c > hscr then
								hscr = c
								mcom = comp
							end
						end
						do n = n + 1 end
					end
				end
			end
			do return mcom end
		end
	end
end

function sling.compiler.SlingTypeResolver:setBindingForFunctionCallSymbol(symbol, decl, typemap)
	local ss = symbol:getSymbol()
	if ss ~= nil then
		do ss:setBinding(decl, typemap) end
	end
end

function sling.compiler.SlingTypeResolver:doReduceDimension(original)
	if not (original ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("reduceDimension: null original", nil, nil))
	end
	if (_vm:to_table_with_key(original, '_isType.sling.model.VectorDataTypeNode') ~= nil) then
		do return original:getPrimaryType() end
	end
	if (_vm:to_table_with_key(original, '_isType.sling.model.StaticArrayDataTypeNode') ~= nil) then
		local ptype = original:getPrimaryType()
		if (_vm:to_table_with_key(ptype, '_isType.sling.model.ConstrainedDataTypeNode') ~= nil) then
			local dts = ptype:getBaseTypes()
			local sz = _g.jk.lang.Vector:getSize(dts)
			if sz == 1 then
				do return _vm:to_table_with_key(dts[0 + 1], '_isType.sling.common.DataTypeNode') end
			else
				do return _g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create()) end
			end
		end
		do return ptype end
	end
	if (_vm:to_table_with_key(original, '_isType.sling.model.BufferDataTypeNode') ~= nil) then
		do return _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_UINT8) end
	end
	if (_vm:to_table_with_key(original, '_isType.sling.model.StringDataTypeNode') ~= nil) then
		do return _g.sling.model.CharacterDataTypeNode._construct0(_g.sling.model.CharacterDataTypeNode._create()) end
	end
	if (_vm:to_table_with_key(original, '_isType.sling.model.MapDataTypeNode') ~= nil) then
		do return original:getValueType() end
	end
	if (_vm:to_table_with_key(original, '_isType.sling.model.RangeDataTypeNode') ~= nil) then
		do return _g.sling.model.IntegerDataTypeNode._construct0(_g.sling.model.IntegerDataTypeNode._create()) end
	end
	if (_vm:to_table_with_key(original, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
		local iterref = self:getImplementedInterfaceReference(_g.sling.util.TypeResolver:getAndRequireBoundEntity(original), {
			"jk",
			"lang",
			"Iterateable"
		})
		if iterref ~= nil then
			local type = _vm:to_table_with_key(_g.jk.lang.Vector:getFirst(self:getTypeParametersForNode(iterref)), '_isType.sling.common.DataTypeNode')
			if type ~= nil then
				do return type end
			end
		end
	end
	do return nil end
end

function sling.compiler.SlingTypeResolver:reduceDimension(original)
	local v = self:doReduceDimension(original)
	if not (v ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to reduce data type to a lower dimension: `" .. _g.jk.lang.String:safeString(original:getNodeTypeName()) .. "'", original, nil))
	end
	do return v end
end

function sling.compiler.SlingTypeResolver:resolveVariableType(node)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null variable", nil, nil))
	end
	do
		local type = node:getType()
		if not (type ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null type for variable", node, nil))
		end
		if (_vm:to_table_with_key(type, '_isType.sling.model.AutomaticDataTypeNode') ~= nil) == false then
			do return type end
		end
		do
			local init = node:getInitializer()
			if init ~= nil then
				do return _g.sling.util.ExpressionUtil:getExpressionDataType(init, self) end
			end
			do
				local fes = _vm:to_table_with_key(node:getParent(), '_isType.sling.model.ForEachStatementNode')
				if fes ~= nil then
					local right = fes:getRight()
					if not (right ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No right expression", fes, nil))
					end
					do return self:reduceDimension(_g.sling.util.ExpressionUtil:getExpressionDataType(right, nil)) end
				end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Variable declaration with automatic type but not inside foreach and no initializer", node, nil))
				do return nil end
			end
		end
	end
end

function sling.compiler.SlingTypeResolver:resolvePropertyVariableType(node)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null property variable", nil, nil))
	end
	do
		local type = node:getType()
		if not (type ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null type for property variable", node, nil))
		end
		if (_vm:to_table_with_key(type, '_isType.sling.model.AutomaticDataTypeNode') ~= nil) == false then
			do return type end
		end
		do
			local init = node:getInitializer()
			if init ~= nil then
				do return _g.sling.util.ExpressionUtil:getExpressionDataType(init, self) end
			end
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Property variable declaration with automatic type but without initializer", node, nil))
			do return nil end
		end
	end
end

function sling.compiler.SlingTypeResolver:resolveToDataType(node)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null node in resolveToDataType", node, nil))
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.NamespaceNode') ~= nil) then
		do return _g.sling.model.ReferenceDataTypeNode:forNode(node, nil) end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EntityDeclarationNode') ~= nil) then
		do return _g.sling.model.ReferenceDataTypeNode:forNode(node, nil) end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
		do return _g.sling.util.DataTypeUtil:dupAsDataType(self:resolveVariableType(node)) end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PropertyDeclarationNode') ~= nil) then
		do return _g.sling.util.DataTypeUtil:dupAsDataType(self:resolvePropertyVariableType(node)) end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
		local array = node:getParameters()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local cnode = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.VariableDeclarationNode')
					if cnode ~= nil then
						do self:resolveExpressions(cnode:getInitializer()) end
					end
					do n = n + 1 end
				end
			end
		end
		do return _g.sling.model.FunctionDataTypeNode:forFunction(node) end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EnumValueNode') ~= nil) then
		local pp = _vm:to_table_with_key(node:getParent(), '_isType.sling.model.EnumDeclarationNode')
		if not (pp ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Enum value is not inside an enum declaration", node, nil))
		end
		do return _g.sling.model.ReferenceDataTypeNode:forNode(pp, nil) end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported type when resolving to data type: `" .. _g.jk.lang.String:safeString(node:getNodeTypeName()) .. "'", node, nil))
	do return nil end
end

function sling.compiler.SlingTypeResolver:getTypeMapFromExpression(xpr)
	if not (xpr ~= nil) then
		do return nil end
	end
	do
		local max = _vm:to_table_with_key(xpr, '_isType.sling.model.MemberAccessExpressionNode')
		if not (max ~= nil) then
			do return nil end
		end
		do
			local last = max:getLastNode()
			if not (last ~= nil) then
				do return nil end
			end
			do
				local parent = _g.sling.model.MemberAccessExpressionNode:getPreviousNode(last)
				if not (parent ~= nil) then
					do return nil end
				end
				do return self:getTypeMapFromDataType(_g.sling.util.ExpressionUtil:getExpressionDataType(parent, self)) end
			end
		end
	end
end

function sling.compiler.SlingTypeResolver:getTypeMapFromDataType(dt)
	local pdt = _vm:to_table_with_key(dt, '_isType.sling.model.ReferenceDataTypeNode')
	if not (pdt ~= nil) then
		do return nil end
	end
	do
		local entity = self:getBoundEntity(pdt)
		if not (entity ~= nil) then
			do return nil end
		end
		do
			local v = nil
			if entity ~= nil and (_vm:to_table_with_key(entity, '_isType.sling.model.GenericCapableEntityDeclarationNode') ~= nil) then
				v = self:createTypeMapforEntity(entity, self:getTypeParametersForNode(pdt))
			end
			do
				local array = entity:getBaseTypes()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local basetype = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.BaseTypeNode')
							if basetype ~= nil then
								local tm2 = self:getTypeMapFromDataType(basetype:getReferenceType())
								if tm2 ~= nil then
									if not (v ~= nil) then
										v = tm2
									else
										do v:copyFrom(tm2) end
									end
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
end

function sling.compiler.SlingTypeResolver:findInferredTemplate(fc, decl, name)
	if not (fc ~= nil) then
		do return nil end
	end
	if not (decl ~= nil) then
		do return nil end
	end
	if not (name ~= nil) then
		do return nil end
	end
	do
		local parameters = fc:getParameters()
		if not (parameters ~= nil) then
			do return nil end
		end
		do
			local pit = _g.jk.lang.Vector:iterate(parameters)
			if not (pit ~= nil) then
				do return nil end
			end
			do
				local dparams = decl:getParameters()
				if not (dparams ~= nil) then
					do return nil end
				end
				do
					local dit = _g.jk.lang.Vector:iterate(dparams)
					if not (dit ~= nil) then
						do return nil end
					end
					while true do
						local decl = _vm:to_table_with_key(dit:next(), '_isType.sling.model.VariableDeclarationNode')
						if decl == nil then
							do break end
						end
						do
							local xpr = _vm:to_table_with_key(pit:next(), '_isType.sling.model.ExpressionNode')
							if xpr == nil then
								do break end
							end
							do
								local xprdt = _g.sling.util.ExpressionUtil:getExpressionDataType(xpr, self)
								if xprdt == nil then
									goto _continue63
								end
								do
									local ddt = self:resolveVariableType(decl)
									if ddt == nil then
										goto _continue63
									end
									if (_vm:to_table_with_key(ddt, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) and name == _g.sling.util.SymbolUtil:getSymbolName(ddt:getSymbol()) then
										do return xprdt end
									end
									if (_vm:to_table_with_key(ddt, '_isType.sling.model.DataTypeExtenderNode') ~= nil) and (_vm:to_table_with_key(xprdt, '_isType.sling.model.DataTypeExtenderNode') ~= nil) then
										local pt = ddt:getPrimaryType()
										if pt ~= nil and (_vm:to_table_with_key(pt, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) and name == _g.sling.util.SymbolUtil:getSymbolName(pt:getSymbol()) then
											local x = xprdt:getPrimaryType()
											if x ~= nil then
												do return x end
											end
										end
									end
									do
										local ddtparams = self:getTypeParametersForNode(ddt)
										local xprparams = self:getTypeParametersForNode(xprdt)
										if _g.jk.lang.Vector:isEmpty(ddtparams) == false and _g.jk.lang.Vector:isEmpty(xprparams) == false then
											local n = 0
											local found = -1
											if ddtparams ~= nil then
												local n2 = 0
												local m = _g.jk.lang.Vector:getSize(ddtparams)
												do
													n2 = 0
													while n2 < m do
														local tpdt = _vm:to_table_with_key(ddtparams[n2 + 1], '_isType.sling.common.DataTypeNode')
														if tpdt ~= nil then
															if (_vm:to_table_with_key(tpdt, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) and name == _g.sling.util.SymbolUtil:getSymbolName(tpdt:getSymbol()) then
																found = n
																do break end
															end
															do n = n + 1 end
														end
														do n2 = n2 + 1 end
													end
												end
											end
											if found >= 0 then
												local n = 0
												if xprparams ~= nil then
													local n3 = 0
													local m2 = _g.jk.lang.Vector:getSize(xprparams)
													do
														n3 = 0
														while n3 < m2 do
															local tpdt = _vm:to_table_with_key(xprparams[n3 + 1], '_isType.sling.common.DataTypeNode')
															if tpdt ~= nil then
																if n == found then
																	do return tpdt end
																end
																do n = n + 1 end
															end
															do n3 = n3 + 1 end
														end
													end
												end
											end
										end
									end
								end
							end
						end
						::_continue63::
					end
					do return nil end
				end
			end
		end
	end
end

function sling.compiler.SlingTypeResolver:findInferredTemplateForDataType(dt, fcx, fdecl)
	local rt = _vm:to_table_with_key(dt, '_isType.sling.model.ReferenceDataTypeNode')
	if rt ~= nil then
		local be = _vm:to_table_with_key(self:getBoundNode(rt), '_isType.sling.model.TemplateDeclarationNode')
		if be ~= nil then
			local inft = self:findInferredTemplate(fcx, fdecl, be:getName())
			if inft ~= nil then
				do return inft end
			end
		end
	end
	do return dt end
end

function sling.compiler.SlingTypeResolver:substituteInferredTemplates(adt, fcx, fdecl)
	local changed = false
	do self:resolveDataType(adt) end
	do
		local dt = _g.sling.util.DataTypeUtil:dupAsDataType(adt)
		local tps = self:getTypeParametersForNode(dt)
		if tps ~= nil then
			if tps ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(tps)
				do
					n = 0
					while n < m do
						local tp = _vm:to_table_with_key(tps[n + 1], '_isType.sling.common.DataTypeNode')
						if tp ~= nil then
							local ntp = self:substituteInferredTemplates(tp, fcx, fdecl)
							if ntp ~= tp then
								do _g.sling.util.NodeUtil:replaceNode(tp, ntp) end
								changed = true
							end
						end
						do n = n + 1 end
					end
				end
			end
		end
		do
			local v = self:findInferredTemplateForDataType(dt, fcx, fdecl)
			if v ~= adt then
				changed = true
			end
			if not changed then
				do return adt end
			end
			do return v end
		end
	end
end

function sling.compiler.SlingTypeResolver:getIntegerType(type)
	local idtn = _vm:to_table_with_key(type, '_isType.sling.model.IntegerDataTypeNode')
	if not (idtn ~= nil) then
		do return 0 end
	end
	do return idtn:getType() end
end

function sling.compiler.SlingTypeResolver:resolveExpression(xpr)
	if not (xpr ~= nil) then
		do return end
	end
	do
		local xprdt = _g.sling.util.ExpressionUtil:tryGetExpressionDataType(xpr, nil)
		if xprdt ~= nil then
			do return end
		end
		do
			local pdt = nil
			local pref = nil
			local pn = _g.sling.model.MemberAccessExpressionNode:getPreviousNode(xpr)
			if pn ~= nil then
				pdt = _g.sling.util.ExpressionUtil:getExpressionDataType(pn, self)
			end
			if pdt ~= nil then
				do
					local _status, _err = _vm:execute_protected_call(function()
						if (_vm:to_table_with_key(pdt, '_isType.sling.model.DynamicDataTypeNode') ~= nil) then
							pref = _g.sling.model.MagicalClassDeclarationNode._construct0(_g.sling.model.MagicalClassDeclarationNode._create())
						else
							if (_vm:to_table_with_key(pdt, '_isType.sling.model.ExpressionDataTypeNode') ~= nil) then
								local xpr2 = pdt:getExpression()
								pdt = _g.sling.util.ExpressionUtil:getExpressionDataType(xpr2, self)
							end
							if (_vm:to_table_with_key(pdt, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) == false then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Not a reference data type", pn, nil))
							end
							pref = _g.sling.util.TypeResolver:getAndRequireBoundContainer(pdt)
						end
					end)
					if _err then
						if (_vm:to_table_with_key(_err, '_isType.sling.common.ReferenceError') ~= nil) then
							local error = _err
							local re = self:getResolveError(xpr)
							do re:addRelatedMessageObject(error:getError()) end
							_vm:throw_error(re)
						else
							_vm:throw_error(_err)
						end
					end
				end
			end
			if pref ~= nil and (_vm:to_table_with_key(pref, '_isType.sling.model.MagicalClassDeclarationNode') ~= nil) then
				do xpr:setResolvedDataType(_g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create()), false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.FunctionCallExpressionNode') ~= nil) then
				local fcx = xpr
				if (_vm:to_table_with_key(fcx:getExpression(), '_isType.sling.model.BaseClassAccessExpressionNode') ~= nil) then
					do xpr:setResolvedDataType(_g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()), false) end
				elseif (_vm:to_table_with_key(fcx:getExpression(), '_isType.sling.model.CurrentObjectExpressionNode') ~= nil) then
					do xpr:setResolvedDataType(_g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()), false) end
				else
					local fdecl = self:resolveFunctionDeclaration(fcx)
					if not (fdecl ~= nil) then
						do xpr:setResolvedDataType(_g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create()), false) end
						do return end
					end
					do
						local rt = fdecl:getReturnType()
						if not (rt ~= nil) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Function has no return type", fdecl, nil))
						end
						do
							local rttm = self:getTypeMapFromExpression(fcx:getExpression())
							rt = self:mapType(rt, rttm)
							rt = self:substituteInferredTemplates(rt, fcx, fdecl)
							do
								local rtdup = _g.sling.util.DataTypeUtil:dupAsDataType(rt)
								if _g.sling.util.ModifierUtil:hasCommonModifier(fdecl, _g.sling.model.Modifier.ASYNCHRONOUS) and (_vm:to_table_with_key(rtdup, '_isType.sling.model.PromiseDataTypeNode') ~= nil) == false then
									do xpr:setResolvedDataType(_g.sling.model.PromiseDataTypeNode:forPrimaryType(rtdup), false) end
								else
									do xpr:setResolvedDataType(rtdup, false) end
								end
							end
						end
					end
				end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.SymbolExpressionNode') ~= nil) then
				local symbol = xpr:getSymbol()
				if not (symbol ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Symbol expression has null symbol", xpr, nil))
				end
				do
					local _status, _err = _vm:execute_protected_call(function()
						local targetref = symbol:getBinding()
						local targetmap = symbol:getBindingTypemap()
						if not (targetref ~= nil) then
							if pref ~= nil then
								local sn = _g.sling.util.SymbolUtil:getSymbolName(symbol)
								if _g.jk.lang.String:isEmpty(sn) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Empty symbol", xpr, nil))
								end
								do
									local tt = self:resolveChild(pref, sn)
									targetref = tt:getNode()
									targetmap = tt:getTypemap()
								end
							else
								local names = _g.sling.util.SymbolUtil:expressionToSymbolNames(xpr)
								if _g.jk.lang.Vector:getSize(names) < 1 then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Symbol expression has no symbol names", xpr, nil))
								end
								if _g.sling.util.ModifierUtil:hasCommonModifier(symbol, _g.sling.model.Modifier.GLOBAL) then
									local rr = self:resolveAbsoluteNames(symbol, names)
									targetref = rr:getNode()
									targetmap = rr:getTypemap()
								else
									local tt = self:resolveNames(xpr, names)
									targetref = tt:getNode()
									targetmap = tt:getTypemap()
								end
							end
							if (_vm:to_table_with_key(targetref, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
								local vd = targetref
								if (_vm:to_table_with_key(vd:getType(), '_isType.sling.model.AutomaticDataTypeNode') ~= nil) then
									do self:resolveExpression(vd:getInitializer()) end
								end
							end
							do symbol:setBinding(targetref, targetmap) end
							do
								local tpfn = self:getTypeParametersForNode(pdt)
								if tpfn ~= nil then
									local vv = {}
									if tpfn ~= nil then
										local n2 = 0
										local m = _g.jk.lang.Vector:getSize(tpfn)
										do
											n2 = 0
											while n2 < m do
												local tp = tpfn[n2 + 1]
												if tp ~= nil then
													if (_vm:to_table_with_key(tp, '_isType.sling.common.NodeObject') ~= nil) then
														do _g.jk.lang.Vector:append(vv, _g.sling.util.NodeUtil:dupAsNode(tp)) end
													else
														do _g.jk.lang.Vector:append(vv, tp) end
													end
												end
												do n2 = n2 + 1 end
											end
										end
									end
									do symbol:setTypeParameters(vv, false) end
								else
									do symbol:setTypeParameters(nil, false) end
								end
							end
						end
						do
							local rt = self:resolveToDataType(targetref)
							if pdt ~= nil then
								rt = self:mapType(rt, self:getTypeMapFromDataType(pdt))
								rt = self:mapType(rt, targetmap)
							end
							do xpr:setResolvedDataType(rt, false) end
						end
					end)
					if _err then
						if (_vm:to_table_with_key(_err, '_isType.sling.common.ReferenceError') ~= nil) then
							local error = _err
							local re = self:getResolveError(xpr)
							do re:addRelatedMessageObject(error:getError()) end
							_vm:throw_error(re)
						else
							_vm:throw_error(_err)
						end
					end
				end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.MemberAccessExpressionNode') ~= nil) then
				local child = xpr:getChildExpression()
				if child ~= nil then
					do self:setSameResolvedType(xpr, child) end
				end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.CreateObjectExpressionNode') ~= nil) then
				do xpr:setResolvedDataType(_g.sling.util.DataTypeUtil:dupAsDataType(xpr:getType()), false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.AssignmentExpressionBaseNode') ~= nil) then
				local left = xpr:getLeft()
				if left ~= nil then
					do self:setSameResolvedType(xpr, left) end
				end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.StringConcatenationExpressionNode') ~= nil) then
				do xpr:setResolvedDataType(_g.sling.model.StringDataTypeNode._construct0(_g.sling.model.StringDataTypeNode._create()), false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.LogicalNotExpressionNode') ~= nil) or (_vm:to_table_with_key(xpr, '_isType.sling.model.LogicalExpressionNode') ~= nil) then
				do xpr:setResolvedDataType(_g.sling.model.BooleanDataTypeNode._construct0(_g.sling.model.BooleanDataTypeNode._create()), false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.CurrentObjectExpressionNode') ~= nil) then
				local entity = _g.sling.util.FindUtil:findNearestEntity(xpr)
				if not (entity ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No enclosing entity", xpr, nil))
				end
				do xpr:setResolvedDataType(_g.sling.model.ReferenceDataTypeNode:forNode(entity, nil), false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.BaseClassAccessExpressionNode') ~= nil) then
				local entity = _g.sling.util.FindUtil:findNearestEntity(xpr)
				if not (entity ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No enclosing entity", xpr, nil))
				end
				do
					local bc = self:getBaseClass(entity)
					if not (bc ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Enclosing entity has no base class", xpr, nil))
					end
					do xpr:setResolvedDataType(_g.sling.model.ReferenceDataTypeNode:forNode(bc, nil), false) end
					do return end
				end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.ArithmeticExpressionNode') ~= nil) then
				if (_vm:to_table_with_key(xpr, '_isType.sling.model.ModuloExpressionNode') ~= nil) or (_vm:to_table_with_key(xpr, '_isType.sling.model.AdditionExpressionNode') ~= nil) or (_vm:to_table_with_key(xpr, '_isType.sling.model.DivisionExpressionNode') ~= nil) or (_vm:to_table_with_key(xpr, '_isType.sling.model.MultiplicationExpressionNode') ~= nil) or (_vm:to_table_with_key(xpr, '_isType.sling.model.SubtractionExpressionNode') ~= nil) then
					local aex = _vm:to_table_with_key(xpr, '_isType.sling.model.ArithmeticExpressionNode')
					local left = aex:getLeft()
					if not (left ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No left", aex, nil))
					end
					do
						local right = aex:getRight()
						if not (right ~= nil) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No right", aex, nil))
						end
						do
							local ldt = _g.sling.util.ExpressionUtil:getExpressionDataType(left, self)
							local rdt = _g.sling.util.ExpressionUtil:getExpressionDataType(right, self)
							local xdt = nil
							if (_vm:to_table_with_key(ldt, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(ldt)
							elseif (_vm:to_table_with_key(rdt, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(rdt)
							elseif (_vm:to_table_with_key(ldt, '_isType.sling.model.FloatDataTypeNode') ~= nil) then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(ldt)
							elseif (_vm:to_table_with_key(rdt, '_isType.sling.model.FloatDataTypeNode') ~= nil) then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(rdt)
							elseif (_vm:to_table_with_key(ldt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and self:getIntegerType(ldt) == _g.sling.model.IntegerDataTypeNode.TYPE_INT64 then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(ldt)
							elseif (_vm:to_table_with_key(rdt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and self:getIntegerType(rdt) == _g.sling.model.IntegerDataTypeNode.TYPE_INT64 then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(rdt)
							elseif (_vm:to_table_with_key(ldt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and self:getIntegerType(ldt) == _g.sling.model.IntegerDataTypeNode.TYPE_INT32 then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(ldt)
							elseif (_vm:to_table_with_key(rdt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and self:getIntegerType(rdt) == _g.sling.model.IntegerDataTypeNode.TYPE_INT32 then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(rdt)
							elseif (_vm:to_table_with_key(ldt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and self:getIntegerType(ldt) == _g.sling.model.IntegerDataTypeNode.TYPE_INT16 then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(ldt)
							elseif (_vm:to_table_with_key(rdt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and self:getIntegerType(rdt) == _g.sling.model.IntegerDataTypeNode.TYPE_INT16 then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(rdt)
							elseif (_vm:to_table_with_key(ldt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and self:getIntegerType(ldt) == _g.sling.model.IntegerDataTypeNode.TYPE_INT8 then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(ldt)
							elseif (_vm:to_table_with_key(rdt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and self:getIntegerType(rdt) == _g.sling.model.IntegerDataTypeNode.TYPE_INT8 then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(rdt)
							elseif (_vm:to_table_with_key(ldt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and self:getIntegerType(ldt) == _g.sling.model.IntegerDataTypeNode.TYPE_UINT64 then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(ldt)
							elseif (_vm:to_table_with_key(rdt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and self:getIntegerType(rdt) == _g.sling.model.IntegerDataTypeNode.TYPE_UINT64 then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(rdt)
							elseif (_vm:to_table_with_key(ldt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and self:getIntegerType(ldt) == _g.sling.model.IntegerDataTypeNode.TYPE_UINT32 then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(ldt)
							elseif (_vm:to_table_with_key(rdt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and self:getIntegerType(rdt) == _g.sling.model.IntegerDataTypeNode.TYPE_UINT32 then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(rdt)
							elseif (_vm:to_table_with_key(ldt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and self:getIntegerType(ldt) == _g.sling.model.IntegerDataTypeNode.TYPE_UINT16 then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(ldt)
							elseif (_vm:to_table_with_key(rdt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and self:getIntegerType(rdt) == _g.sling.model.IntegerDataTypeNode.TYPE_UINT16 then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(rdt)
							elseif (_vm:to_table_with_key(ldt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and self:getIntegerType(ldt) == _g.sling.model.IntegerDataTypeNode.TYPE_UINT8 then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(ldt)
							elseif (_vm:to_table_with_key(rdt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and self:getIntegerType(rdt) == _g.sling.model.IntegerDataTypeNode.TYPE_UINT8 then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(rdt)
							elseif (_vm:to_table_with_key(ldt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(ldt)
							elseif (_vm:to_table_with_key(rdt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(rdt)
							else
								xdt = _g.sling.util.DataTypeUtil:dupAsDataType(ldt)
							end
							if not (xdt ~= nil) then
								xdt = _g.sling.model.DoubleDataTypeNode._construct0(_g.sling.model.DoubleDataTypeNode._create())
							end
							do xpr:setResolvedDataType(xdt, false) end
							do return end
						end
					end
				end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.TypeCheckExpressionNode') ~= nil) then
				do xpr:setResolvedDataType(_g.sling.model.BooleanDataTypeNode._construct0(_g.sling.model.BooleanDataTypeNode._create()), false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.StaticCastExpressionNode') ~= nil) then
				local dt = xpr:getType()
				if not (dt ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No data type", xpr, nil))
				end
				do xpr:setResolvedDataType(_g.sling.util.DataTypeUtil:dupAsDataType(dt), false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.DynamicCastExpressionNode') ~= nil) then
				local dt = xpr:getType()
				if not (dt ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No data type", xpr, nil))
				end
				do xpr:setResolvedDataType(_g.sling.util.DataTypeUtil:dupAsDataType(dt), false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.PreDecrementExpressionNode') ~= nil) or (_vm:to_table_with_key(xpr, '_isType.sling.model.PostDecrementExpressionNode') ~= nil) or (_vm:to_table_with_key(xpr, '_isType.sling.model.PreIncrementExpressionNode') ~= nil) or (_vm:to_table_with_key(xpr, '_isType.sling.model.PostIncrementExpressionNode') ~= nil) or (_vm:to_table_with_key(xpr, '_isType.sling.model.NegativeNumberExpressionNode') ~= nil) or (_vm:to_table_with_key(xpr, '_isType.sling.model.BitwiseNotExpressionNode') ~= nil) then
				local ux = xpr
				local child = ux:getExpression()
				if not (child ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null expression", ux, nil))
				end
				do self:setSameResolvedType(xpr, child) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.ForceUnwrapOptionalExpressionNode') ~= nil) or (_vm:to_table_with_key(xpr, '_isType.sling.model.SafeUnwrapOptionalExpressionNode') ~= nil) then
				local ux = xpr
				local child = ux:getExpression()
				if not (child ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null expression", ux, nil))
				end
				do
					local op = _g.sling.util.ExpressionUtil:getExpressionDataType(child, self)
					if (_vm:to_table_with_key(op, '_isType.sling.model.OptionalDataTypeNode') ~= nil) == false then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unwrapping of non optional data type is not allowed", op, nil))
					end
					do xpr:setResolvedDataType(_g.sling.util.DataTypeUtil:dupAsDataType(op:getPrimaryType()), false) end
					do return end
				end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.ArrayCreationExpressionNode') ~= nil) then
				local acx = xpr
				local pt = acx:getPrimaryType()
				if pt ~= nil then
					local c = acx:getDimensionCount()
					local v = _g.sling.util.DataTypeUtil:dupAsDataType(pt)
					do
						local i = 0
						while i < c do
							v = _g.sling.model.StaticArrayDataTypeNode:forPrimaryType(v, nil)
							do i = i + 1 end
						end
					end
					do xpr:setResolvedDataType(v, false) end
					do return end
				end
				do
					local lit = acx:getArrayLiteral()
					if lit ~= nil then
						do self:setSameResolvedType(xpr, lit) end
						do return end
					end
					do xpr:setResolvedDataType(_g.sling.model.StaticArrayDataTypeNode:forPrimaryType(_g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create()), nil), false) end
					do return end
				end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.ArrayLiteralExpressionNode') ~= nil) then
				local lit = xpr
				local type = lit:getType()
				if type ~= nil then
					do xpr:setResolvedDataType(_g.sling.model.StaticArrayDataTypeNode:forPrimaryType(_g.sling.util.DataTypeUtil:dupAsDataType(type), nil), false) end
					do return end
				end
				do xpr:setResolvedDataType(_g.sling.model.StaticArrayDataTypeNode:forPrimaryType(_g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create()), nil), false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.EmptyExpressionNode') ~= nil) then
				do xpr:setResolvedDataType(_g.sling.model.UnknownDataTypeNode._construct0(_g.sling.model.UnknownDataTypeNode._create()), false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.GetSizeExpressionNode') ~= nil) then
				do xpr:setResolvedDataType(_g.sling.model.IntegerDataTypeNode._construct0(_g.sling.model.IntegerDataTypeNode._create()), false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.SubscriptExpressionNode') ~= nil) then
				local sex = xpr
				local child = sex:getChild()
				if not (child ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Subscript expression has no child", sex, nil))
				end
				do
					local dt = _g.sling.util.ExpressionUtil:getExpressionDataType(child, self)
					local sss = _g.jk.lang.Vector:getSize(sex:getSubscripts())
					do
						local n = 0
						while n < sss do
							dt = self:reduceDimension(dt)
							do n = n + 1 end
						end
					end
					do xpr:setResolvedDataType(_g.sling.util.DataTypeUtil:dupAsDataType(dt), false) end
					do return end
				end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.FunctionDeclarationExpressionNode') ~= nil) then
				local proto = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
				local odecl = xpr:getDeclaration()
				if not (odecl ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No function declaration in expression", xpr, nil))
				end
				do _g.sling.util.FunctionUtil:copySignatureTo(odecl, proto) end
				do
					local dt = _g.sling.model.FunctionDataTypeNode._construct0(_g.sling.model.FunctionDataTypeNode._create())
					do dt:setDeclaration(proto, false) end
					do xpr:setResolvedDataType(dt, false) end
					do return end
				end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.BitwiseAndExpressionNode') ~= nil) or (_vm:to_table_with_key(xpr, '_isType.sling.model.BitwiseOrExpressionNode') ~= nil) or (_vm:to_table_with_key(xpr, '_isType.sling.model.BitwiseXorExpressionNode') ~= nil) or (_vm:to_table_with_key(xpr, '_isType.sling.model.ShiftLeftExpressionNode') ~= nil) or (_vm:to_table_with_key(xpr, '_isType.sling.model.ShiftRightExpressionNode') ~= nil) then
				local bex = xpr
				local left = bex:getLeft()
				if not (left ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left", bex, nil))
				end
				do self:setSameResolvedType(xpr, left) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.DataTypeDefaultValueExpressionNode') ~= nil) then
				local dd = xpr:getType()
				if dd == nil then
					dd = _g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create())
				else
					dd = _g.sling.util.DataTypeUtil:dupAsDataType(dd)
				end
				do xpr:setResolvedDataType(dd, false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.AppendToVectorExpressionNode') ~= nil) then
				local left = xpr:getLeft()
				if not (left ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left", xpr, nil))
				end
				do self:setSameResolvedType(xpr, left) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.ConditionalExpressionNode') ~= nil) then
				local aex = _vm:to_table_with_key(xpr, '_isType.sling.model.ConditionalExpressionNode')
				local left = aex:getTrueExpr()
				if not (left ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No left", aex, nil))
				end
				do
					local right = aex:getFalseExpr()
					if not (right ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No right", aex, nil))
					end
					do self:resolveExpression(right) end
					do xpr:setResolvedDataType(_g.sling.util.DataTypeUtil:dupAsDataType(_g.sling.util.ExpressionUtil:getExpressionDataType(left, self)), false) end
					do return end
				end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.EmbedBlockNode') ~= nil) then
				local dd = xpr:getDefaultDataType()
				if dd == nil then
					dd = _g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create())
				else
					dd = _g.sling.util.DataTypeUtil:dupAsDataType(dd)
				end
				do xpr:setResolvedDataType(dd, false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.TryCatchExpressionNode') ~= nil) then
				do xpr:setResolvedDataType(_g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create()), false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.MapLiteralExpressionNode') ~= nil) then
				local dd = xpr:getDefaultDataType()
				if not (dd ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Map literal has no default data type", xpr, nil))
				end
				dd = _g.sling.util.DataTypeUtil:dupAsDataType(dd)
				do xpr:setResolvedDataType(dd, false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.TupleExpressionNode') ~= nil) then
				do xpr:setResolvedDataType(_g.sling.model.TupleDataTypeNode._construct0(_g.sling.model.TupleDataTypeNode._create()), false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.MultipleExpressionNode') ~= nil) then
				local xprs = xpr:getExpressions()
				if _g.jk.lang.Vector:isEmpty(xprs) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No expressions", xpr, nil))
				end
				do
					local lxp = _vm:to_table_with_key(_g.jk.lang.Vector:get(xprs, _g.jk.lang.Vector:getSize(xprs) - 1), '_isType.sling.model.ExpressionNode')
					if not (lxp ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null last expression", xpr, nil))
					end
					do xpr:setResolvedDataType(_g.sling.util.DataTypeUtil:dupAsDataType(_g.sling.util.ExpressionUtil:getExpressionDataType(lxp, self)), false) end
					do return end
				end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.MembershipCheckExpressionNode') ~= nil) then
				do xpr:setResolvedDataType(_g.sling.model.BooleanDataTypeNode._construct0(_g.sling.model.BooleanDataTypeNode._create()), false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.AwaitExpressionNode') ~= nil) then
				local pe = xpr:getExpression()
				if not (pe ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Await expression has no primary expression", xpr, nil))
				end
				do self:resolveExpression(pe) end
				do
					local dt = _g.sling.util.ExpressionUtil:getExpressionDataType(pe, self)
					local promise = _vm:to_table_with_key(dt, '_isType.sling.model.PromiseDataTypeNode')
					if not (promise ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported data type: `" .. _g.jk.lang.String:safeString(dt:getNodeTypeName()) .. "'. Promise expected.", dt, nil))
					end
					do
						local propri = promise:getPrimaryType()
						if not (propri ~= nil) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Promise has no primary type", promise, nil))
						end
						do xpr:setResolvedDataType(_g.sling.util.DataTypeUtil:dupAsDataType(propri), false) end
						do return end
					end
				end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.PromiseExpressionNode') ~= nil) then
				local pe = xpr:getExpression()
				if not (pe ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Promise expression has no primary expression", xpr, nil))
				end
				do self:resolveExpression(pe) end
				do
					local dt = _g.sling.util.ExpressionUtil:getExpressionDataType(pe, self)
					if (_vm:to_table_with_key(dt, '_isType.sling.model.PromiseDataTypeNode') ~= nil) == false then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported data type: `" .. _g.jk.lang.String:safeString(dt:getNodeTypeName()) .. "' in promise expression. Promise expected", dt, nil))
					end
					do xpr:setResolvedDataType(_g.sling.util.DataTypeUtil:dupAsDataType(dt), false) end
					do return end
				end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.PromiseLiteralExpressionNode') ~= nil) then
				local tp = xpr:getType()
				if not (tp ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Promise literal expression has no type", xpr, nil))
				end
				do xpr:setResolvedDataType(_g.sling.model.PromiseDataTypeNode:forPrimaryType(_g.sling.util.DataTypeUtil:dupAsDataType(tp)), false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.GetAddressExpressionNode') ~= nil) then
				local pe = xpr:getExpression()
				if not (pe ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("AddressOfExpression has no primary expression", xpr, nil))
				end
				do self:resolveExpression(pe) end
				do xpr:setResolvedDataType(_g.sling.model.PointerDataTypeNode:forPrimaryType(_g.sling.util.DataTypeUtil:dupAsDataType(_g.sling.util.ExpressionUtil:getExpressionDataType(pe, self))), false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.GetReferenceExpressionNode') ~= nil) then
				local pe = xpr:getExpression()
				if not (pe ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("GetReferenceExpression has no primary expression", xpr, nil))
				end
				do self:resolveExpression(pe) end
				do xpr:setResolvedDataType(_g.sling.model.VariableReferenceDataTypeNode:forPrimaryType(_g.sling.util.DataTypeUtil:dupAsDataType(_g.sling.util.ExpressionUtil:getExpressionDataType(pe, self))), false) end
				do return end
			end
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.GetValueExpressionNode') ~= nil) then
				local pe = xpr:getExpression()
				if not (pe ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("DereferenceExpression has no primary expression", xpr, nil))
				end
				do self:resolveExpression(pe) end
				do
					local dt = _g.sling.util.ExpressionUtil:getExpressionDataType(pe, self)
					if (_vm:to_table_with_key(dt, '_isType.sling.model.PointerDataTypeNode') ~= nil) then
						local dtp = dt
						do xpr:setResolvedDataType(_g.sling.util.DataTypeUtil:dupAsDataType(dtp:getPrimaryType()), false) end
					elseif (_vm:to_table_with_key(dt, '_isType.sling.model.VariableReferenceDataTypeNode') ~= nil) then
						local dtp = dt
						do xpr:setResolvedDataType(_g.sling.util.DataTypeUtil:dupAsDataType(dtp:getPrimaryType()), false) end
					else
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Data type is neither pointer nor variable reference", dt, nil))
					end
					do return end
				end
			end
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported expression type in resolver: `" .. _g.jk.lang.String:safeString(xpr:getNodeTypeName()) .. "'", xpr, nil))
		end
	end
end

function sling.compiler.SlingTypeResolver:setSameResolvedType(xpr, child)
	do xpr:setResolvedDataType(_g.sling.util.DataTypeUtil:dupAsDataType(_g.sling.util.ExpressionUtil:getExpressionDataType(child, self)), false) end
end

function sling.compiler.SlingTypeResolver:resolveDataTypes(node)
	local array = _g.sling.util.FindUtil:findCompatibleNodes(node, "class:sling.model.ReferenceDataTypeNode", true, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local rdt = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ReferenceDataTypeNode')
				if rdt ~= nil then
					do self:resolveDataType(rdt) end
				end
				do n = n + 1 end
			end
		end
	end
	do
		local array2 = _g.sling.util.FindUtil:findCompatibleNodes(node, "class:sling.model.ExpressionDataTypeNode", false, true, false)
		if array2 ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(array2)
			do
				n2 = 0
				while n2 < m2 do
					local xdt = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.ExpressionDataTypeNode')
					if xdt ~= nil then
						local xpr = xdt:getExpression()
						if xpr ~= nil then
							do self:resolveExpression(xpr) end
						end
					end
					do n2 = n2 + 1 end
				end
			end
		end
	end
end

function sling.compiler.SlingTypeResolver:isSameTypeObject(primary, other)
	if primary == nil and other == nil then
		do return true end
	end
	if primary == nil or other == nil then
		do return false end
	end
	do
		local ta = _vm:get_datatype_info(primary)
		local tb = _vm:get_datatype_info(other)
		if ta == tb then
			do return true end
		end
		do return false end
	end
end

function sling.compiler.SlingTypeResolver:isSame(primary, other, typemap)
	if primary == nil and other == nil then
		do return true end
	end
	if primary == nil or other == nil then
		do return false end
	end
	if (_vm:to_table_with_key(primary, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
		local aother = _vm:to_table_with_key(other, '_isType.sling.common.DataTypeNode')
		local primdt = primary
		if primdt:getMagical() then
			if other == nil or (_vm:to_table_with_key(other, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) == false then
				do return false end
			end
			do return true end
		end
		do
			local tr = primdt
			if typemap ~= nil then
				local ntr = self:mapType(tr, typemap)
				if ntr ~= tr then
					do return self:isSame(ntr, aother, nil) end
				end
			end
			if tr ~= nil and (_vm:to_table_with_key(tr, '_isType.sling.model.UnknownDataTypeNode') ~= nil) then
				do return true end
			end
			do
				local otherref = _vm:to_table_with_key(aother, '_isType.sling.model.ReferenceDataTypeNode')
				if not (otherref ~= nil) then
					do return false end
				end
				do
					local me = _vm:to_table_with_key(tr, '_isType.sling.model.ReferenceDataTypeNode')
					if not (me ~= nil) then
						do return false end
					end
					do
						local r = self:getBoundEntity(me)
						local oref = self:getBoundEntity(otherref)
						if r ~= oref then
							if (_vm:to_table_with_key(r, '_isType.sling.model.TemplateDeclarationNode') ~= nil) and (_vm:to_table_with_key(oref, '_isType.sling.model.TemplateDeclarationNode') ~= nil) then
								do return self:isSameTemplate(r, oref, typemap) end
							end
							do return false end
						end
						do
							local tp1 = self:getTypeParametersForNode(me)
							local tp2 = self:getTypeParametersForNode(otherref)
							if _g.jk.lang.Vector:isEmpty(tp1) and _g.jk.lang.Vector:isEmpty(tp2) then
								do return true end
							end
							if tp1 == nil or tp2 == nil then
								do return false end
							end
							do
								local it1 = _g.jk.lang.Vector:iterate(tp1)
								local it2 = _g.jk.lang.Vector:iterate(tp2)
								while true do
									local o1 = _vm:to_table_with_key(it1:next(), '_isType.sling.common.DataTypeNode')
									if typemap ~= nil then
										o1 = self:mapType(o1, typemap)
									end
									do
										local o2 = _vm:to_table_with_key(it2:next(), '_isType.sling.common.DataTypeNode')
										if o1 == nil then
											if o2 == nil then
												do break end
											end
											do return false end
										end
										if o2 == nil then
											do return false end
										end
										if self:isSame(o1, o2, typemap) == false then
											do return false end
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
	end
	if (_vm:to_table_with_key(primary, '_isType.sling.model.ExpressionDataTypeNode') ~= nil) then
		local xdt = _g.sling.util.ExpressionUtil:getExpressionDataType(primary:getExpression(), nil)
		do return self:isSame(xdt, other, typemap) end
	end
	if not self:isSameTypeObject(primary, other) then
		do return false end
	end
	if (_vm:to_table_with_key(primary, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
		if (_vm:to_table_with_key(other, '_isType.sling.model.IntegerDataTypeNode') ~= nil) == false then
			do return false end
		end
		do
			local ptype = primary:getType()
			local otype = other:getType()
			do return ptype == otype end
		end
	end
	if (_vm:to_table_with_key(primary, '_isType.sling.model.MapDataTypeNode') ~= nil) then
		if (_vm:to_table_with_key(other, '_isType.sling.model.MapDataTypeNode') ~= nil) == false then
			do return false end
		end
		do
			local pm = primary
			local om = other
			if self:isSame(pm:getKeyType(), om:getKeyType(), typemap) == false then
				do return false end
			end
			if self:isSame(pm:getValueType(), om:getValueType(), typemap) == false then
				do return false end
			end
			do return true end
		end
	end
	if (_vm:to_table_with_key(primary, '_isType.sling.model.MultiDimensionalArrayDataTypeNode') ~= nil) then
		local oa = _vm:to_table_with_key(other, '_isType.sling.model.MultiDimensionalArrayDataTypeNode')
		if not (oa ~= nil) then
			do return false end
		end
		do return oa:getDimensions() == primary:getDimensions() end
	end
	if (_vm:to_table_with_key(primary, '_isType.sling.model.MultipleDataTypeNode') ~= nil) then
		do return false end
	end
	if (_vm:to_table_with_key(primary, '_isType.sling.model.NullDataTypeNode') ~= nil) then
		do return false end
	end
	if (_vm:to_table_with_key(primary, '_isType.sling.model.PointerDataTypeNode') ~= nil) then
		local otherp = _vm:to_table_with_key(other, '_isType.sling.model.PointerDataTypeNode')
		if not (otherp ~= nil) then
			do return false end
		end
		do
			local tpt = primary:getPrimaryType()
			local opt = otherp:getPrimaryType()
			if tpt == nil and opt == nil then
				do return true end
			end
			if tpt ~= nil then
				do return self:isSame(tpt, opt, typemap) end
			end
			do return false end
		end
	end
	if (_vm:to_table_with_key(primary, '_isType.sling.model.VariableReferenceDataTypeNode') ~= nil) then
		local otherp = _vm:to_table_with_key(other, '_isType.sling.model.VariableReferenceDataTypeNode')
		if not (otherp ~= nil) then
			do return false end
		end
		do
			local tpt = primary:getPrimaryType()
			local opt = otherp:getPrimaryType()
			if tpt == nil and opt == nil then
				do return true end
			end
			if tpt ~= nil then
				do return self:isSame(tpt, opt, typemap) end
			end
			do return false end
		end
	end
	if (_vm:to_table_with_key(primary, '_isType.sling.model.StaticArrayDataTypeNode') ~= nil) then
		local othera = _vm:to_table_with_key(other, '_isType.sling.model.StaticArrayDataTypeNode')
		if not (othera ~= nil) then
			do return false end
		end
		do
			local thissize = primary:getSize()
			local othersize = othera:getSize()
			if thissize ~= nil or othersize ~= nil then
				if not (thissize ~= nil) then
					do return false end
				end
				if not (othersize ~= nil) then
					do return false end
				end
				if (_vm:to_table_with_key(thissize, '_isType.sling.model.IntegerLiteralExpressionNode') ~= nil) == false or (_vm:to_table_with_key(othersize, '_isType.sling.model.IntegerLiteralExpressionNode') ~= nil) == false then
					do return false end
				end
				if thissize:getValue() ~= othersize:getValue() then
					do return false end
				end
			end
			do return self:isSame(primary:getPrimaryType(), othera:getPrimaryType(), typemap) end
		end
	end
	if (_vm:to_table_with_key(primary, '_isType.sling.model.VectorDataTypeNode') ~= nil) then
		local otherv = _vm:to_table_with_key(other, '_isType.sling.model.VectorDataTypeNode')
		if not (otherv ~= nil) then
			do return false end
		end
		do return self:isSame(primary:getPrimaryType(), otherv:getPrimaryType(), typemap) end
	end
	if (_vm:to_table_with_key(primary, '_isType.sling.model.SetDataTypeNode') ~= nil) then
		local otherv = _vm:to_table_with_key(other, '_isType.sling.model.SetDataTypeNode')
		if not (otherv ~= nil) then
			do return false end
		end
		do return self:isSame(primary:getPrimaryType(), otherv:getPrimaryType(), typemap) end
	end
	if (_vm:to_table_with_key(primary, '_isType.sling.model.PromiseDataTypeNode') ~= nil) then
		local otherv = _vm:to_table_with_key(other, '_isType.sling.model.PromiseDataTypeNode')
		if not (otherv ~= nil) then
			do return false end
		end
		do return self:isSame(primary:getPrimaryType(), otherv:getPrimaryType(), typemap) end
	end
	if (_vm:to_table_with_key(primary, '_isType.sling.model.ThisDataTypeNode') ~= nil) then
		if not (_vm:to_table_with_key(other, '_isType.sling.model.ThisDataTypeNode') ~= nil) then
			do return false end
		end
		do
			local myee = _g.sling.util.FindUtil:findNearestEntity(primary)
			local ooee = _g.sling.util.FindUtil:findNearestEntity(other)
			do return myee == ooee end
		end
	end
	if (_vm:to_table_with_key(primary, '_isType.sling.model.OptionalDataTypeNode') ~= nil) then
		local otherv = _vm:to_table_with_key(other, '_isType.sling.model.OptionalDataTypeNode')
		if not (otherv ~= nil) then
			do return false end
		end
		do
			local optpr1 = primary:getPrimaryType()
			if not (optpr1 ~= nil) then
				do return false end
			end
			do
				local optpr2 = otherv:getPrimaryType()
				if not (optpr2 ~= nil) then
					do return false end
				end
				do return self:isSame(optpr1, optpr2, typemap) end
			end
		end
	end
	if (_vm:to_table_with_key(primary, '_isType.sling.model.ConstrainedDataTypeNode') ~= nil) then
		local primc = primary
		local otherc = _vm:to_table_with_key(other, '_isType.sling.model.ConstrainedDataTypeNode')
		if not (otherc ~= nil) then
			do return false end
		end
		if not self:isSame(primc:getPrimaryType(), otherc:getPrimaryType(), typemap) then
			do return false end
		end
		do
			local baseTypes = primc:getBaseTypes()
			if baseTypes ~= nil then
				local otl = otherc:getBaseTypes()
				if not (otl ~= nil) then
					do return false end
				end
				do
					local it1 = _g.jk.lang.Vector:iterate(baseTypes)
					local it2 = _g.jk.lang.Vector:iterate(otl)
					while true do
						local o1 = nil
						local o2 = nil
						if it1 ~= nil then
							o1 = _vm:to_table_with_key(it1:next(), '_isType.sling.common.DataTypeNode')
						end
						if it2 ~= nil then
							o2 = _vm:to_table_with_key(it2:next(), '_isType.sling.common.DataTypeNode')
						end
						if o1 == nil then
							if o2 == nil then
								do break end
							end
							do return false end
						end
						if o2 == nil then
							do return false end
						end
						if not self:isSame(o1, o2, typemap) then
							do return false end
						end
					end
				end
			end
			do return true end
		end
	end
	if (_vm:to_table_with_key(primary, '_isType.sling.model.FunctionDataTypeNode') ~= nil) then
		local fother = _vm:to_table_with_key(other, '_isType.sling.model.FunctionDataTypeNode')
		if not (fother ~= nil) then
			do return false end
		end
		do return _g.sling.compiler.SlingTypeResolver:hasSameSignature(primary:getDeclaration(), fother:getDeclaration(), typemap, false, false, true) end
	end
	do return true end
end

function sling.compiler.SlingTypeResolver:isSameTemplate(primary, aother, typemap)
	if not (primary ~= nil) then
		do return false end
	end
	do
		local other = _vm:to_table_with_key(aother, '_isType.sling.model.TemplateDeclarationNode')
		if not (other ~= nil) then
			do return false end
		end
		do
			local bts1 = primary:getBaseTypes()
			local bts2 = other:getBaseTypes()
			if _g.jk.lang.Vector:isEmpty(bts1) then
				if _g.jk.lang.Vector:isEmpty(bts2) then
					do return true end
				end
				do return false end
			end
			if _g.jk.lang.Vector:isEmpty(bts2) then
				do return false end
			end
			do
				local n1 = 0
				local n2 = 0
				while true do
					if n1 >= _g.jk.lang.Vector:getSize(bts1) then
						if n2 >= _g.jk.lang.Vector:getSize(bts2) then
							do break end
						end
						do return false end
					end
					if n2 >= _g.jk.lang.Vector:getSize(bts2) then
						do return false end
					end
					do
						local bt1 = _vm:to_table_with_key(_g.jk.lang.Vector:get(bts1, n1), '_isType.sling.model.BaseTypeNode')
						local bt2 = _vm:to_table_with_key(_g.jk.lang.Vector:get(bts2, n2), '_isType.sling.model.BaseTypeNode')
						do n1 = n1 + 1 end
						do n2 = n2 + 1 end
						if bt1 == nil then
							if bt2 == nil then
								goto _continue64
							end
							do return false end
						end
						if bt2 == nil then
							do return false end
						end
						do
							local dt1 = bt1:getReferenceType()
							local dt2 = bt2:getReferenceType()
							if dt1 == nil then
								if dt2 == nil then
									goto _continue64
								end
								do return false end
							end
							if dt2 == nil then
								do return false end
							end
							if not self:isSame(dt1, dt2, typemap) then
								do return false end
							end
						end
					end
					::_continue64::
				end
				do return true end
			end
		end
	end
end

function sling.compiler.SlingTypeResolver:getPrimitiveDataTypeLikenessScore(primary, other)
	if not (primary ~= nil) then
		do return 0 end
	end
	if not (other ~= nil) then
		do return 0 end
	end
	if (_vm:to_table_with_key(primary, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
		if other ~= nil and (_vm:to_table_with_key(other, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
			local tp1 = primary:getType()
			local tp2 = other:getType()
			if tp1 == _g.sling.model.IntegerDataTypeNode.TYPE_INT64 then
				if tp2 == _g.sling.model.IntegerDataTypeNode.TYPE_INT64 then
					do return 1 end
				end
			end
			if tp1 == _g.sling.model.IntegerDataTypeNode.TYPE_INT32 then
				if tp2 == _g.sling.model.IntegerDataTypeNode.TYPE_INT32 then
					do return 2 end
				end
				if tp2 == _g.sling.model.IntegerDataTypeNode.TYPE_INT64 then
					do return 1 end
				end
			end
			if tp1 == _g.sling.model.IntegerDataTypeNode.TYPE_INT16 then
				if tp2 == _g.sling.model.IntegerDataTypeNode.TYPE_INT16 then
					do return 3 end
				end
				if tp2 == _g.sling.model.IntegerDataTypeNode.TYPE_INT32 then
					do return 2 end
				end
				if tp2 == _g.sling.model.IntegerDataTypeNode.TYPE_INT64 then
					do return 1 end
				end
			end
			if tp1 == _g.sling.model.IntegerDataTypeNode.TYPE_INT8 then
				if tp2 == _g.sling.model.IntegerDataTypeNode.TYPE_INT8 then
					do return 4 end
				end
				if tp2 == _g.sling.model.IntegerDataTypeNode.TYPE_INT16 then
					do return 3 end
				end
				if tp2 == _g.sling.model.IntegerDataTypeNode.TYPE_INT32 then
					do return 2 end
				end
				if tp2 == _g.sling.model.IntegerDataTypeNode.TYPE_INT64 then
					do return 1 end
				end
			end
		end
	end
	if (_vm:to_table_with_key(primary, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
		if other ~= nil then
			if (_vm:to_table_with_key(other, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
				do return 3 end
			end
			if (_vm:to_table_with_key(other, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
				do return 2 end
			end
			if (_vm:to_table_with_key(other, '_isType.sling.model.CharacterDataTypeNode') ~= nil) then
				do return 1 end
			end
		end
	end
	do return 0 end
end

function sling.compiler.SlingTypeResolver:isBaseDataTypeOf(entity, candidate)
	if not (entity ~= nil and candidate ~= nil) then
		do return false end
	end
	do
		local array = entity:getBaseTypes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local basetype = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.BaseTypeNode')
					if basetype ~= nil then
						local bound = self:getBoundEntity(basetype:getReferenceType())
						if not (bound ~= nil) then
							goto _continue65
						end
						do
							local ref = self:getBoundEntity(candidate)
							if not (ref ~= nil) then
								goto _continue65
							end
							if ref == bound then
								do return true end
							end
						end
					end
					::_continue65::
					do n = n + 1 end
				end
			end
		end
		do return false end
	end
end

function sling.compiler.SlingTypeResolver:getIntegerDataTypeSize(idt)
	if not (idt ~= nil) then
		do return 31 end
	end
	do
		local type = idt:getType()
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_INT8 then
			do return 7 end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_UINT8 then
			do return 8 end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_INT16 then
			do return 15 end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_UINT16 then
			do return 16 end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_INT32 then
			do return 31 end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_UINT32 then
			do return 32 end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_INT64 then
			do return 63 end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_UINT64 then
			do return 64 end
		end
		do return 31 end
	end
end

function sling.compiler.SlingTypeResolver:getIsSignedIntegerDataType(idt)
	if not (idt ~= nil) then
		do return false end
	end
	do
		local type = idt:getType()
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_UINT8 then
			do return false end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_UINT16 then
			do return false end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_UINT32 then
			do return false end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_UINT64 then
			do return false end
		end
		do return true end
	end
end

function sling.compiler.SlingTypeResolver:matches(primary, other, typemap, exact, allowFloatDowncast)
	local pdt = self:getActualType(primary)
	local odt = self:getActualType(other)
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.StringDataTypeNode') ~= nil) then
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.NullDataTypeNode') ~= nil) then
			do return true end
		end
		do return self:isSame(pdt, odt, typemap) end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
			do return true end
		end
		if not exact then
			if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
				do return true end
			end
			if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.CharacterDataTypeNode') ~= nil) then
				do return true end
			end
			if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.FloatDataTypeNode') ~= nil) then
				do return true end
			end
		end
		do return false end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
		if allowFloatDowncast then
			if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
				do return true end
			end
			if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.FloatDataTypeNode') ~= nil) then
				do return true end
			end
		end
		if exact then
			if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
				do return pdt:getType() == odt:getType() end
			end
		else
			if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
				if pdt:getType() == _g.sling.model.IntegerDataTypeNode.TYPE_ANY then
					do return true end
				end
				if self:getIsSignedIntegerDataType(pdt) == false and self:getIsSignedIntegerDataType(odt) == true then
					do return false end
				end
				if self:getIntegerDataTypeSize(pdt) < self:getIntegerDataTypeSize(odt) then
					do return false end
				end
				do return true end
			end
			if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.CharacterDataTypeNode') ~= nil) then
				if self:getIntegerDataTypeSize(pdt) >= 31 then
					do return true end
				end
				do return false end
			end
		end
		do return false end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.CharacterDataTypeNode') ~= nil) then
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and self:getIntegerDataTypeSize(odt) <= 32 then
			do return true end
		end
		do return self:isSame(pdt, odt, typemap) end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.PromiseDataTypeNode') ~= nil) then
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.NullDataTypeNode') ~= nil) then
			do return true end
		end
		do return self:isSame(pdt, odt, typemap) end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.VectorDataTypeNode') ~= nil) then
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.NullDataTypeNode') ~= nil) then
			do return true end
		end
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.DynamicDataTypeNode') ~= nil) then
			do return true end
		end
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.VectorDataTypeNode') ~= nil) then
			local othistype = pdt:getPrimaryType()
			local thistype = othistype
			local othertype = other:getPrimaryType()
			if typemap ~= nil then
				thistype = self:mapType(thistype, typemap)
			end
			if thistype ~= nil or othertype ~= nil then
				if thistype == nil then
					do return false end
				end
				if othertype == nil then
					do return false end
				end
				if (_vm:to_table_with_key(thistype, '_isType.sling.model.UnknownDataTypeNode') ~= nil) == false then
					if not self:isSame(othistype, othertype, typemap) then
						do return false end
					end
				end
			end
			do return true end
		end
		do return self:isSame(pdt, odt, typemap) end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.StaticArrayDataTypeNode') ~= nil) then
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.NullDataTypeNode') ~= nil) then
			do return true end
		end
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.DynamicDataTypeNode') ~= nil) then
			do return true end
		end
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.StaticArrayDataTypeNode') ~= nil) then
			local othistype = pdt:getPrimaryType()
			local thistype = othistype
			local othertype = odt:getPrimaryType()
			if (_vm:to_table_with_key(othistype, '_isType.sling.model.ConstrainedDataTypeNode') ~= nil) then
				do return self:matches(othistype, othertype, typemap, false, false) end
			end
			if typemap ~= nil then
				thistype = self:mapType(thistype, typemap)
			end
			if thistype ~= nil or othertype ~= nil then
				if not (thistype ~= nil) then
					do return false end
				end
				if not (othertype ~= nil) then
					do return false end
				end
				if (_vm:to_table_with_key(thistype, '_isType.sling.model.UnknownDataTypeNode') ~= nil) == false then
					if not self:isSame(othistype, othertype, typemap) then
						do return false end
					end
				end
			end
			do
				local thissize = pdt:getSize()
				local othersize = odt:getSize()
				if thissize ~= nil or othersize ~= nil then
					if not (thissize ~= nil) then
						do return false end
					end
					if not (othersize ~= nil) then
						do return false end
					end
					if (_vm:to_table_with_key(thissize, '_isType.sling.model.IntegerLiteralExpressionNode') ~= nil) == false or (_vm:to_table_with_key(othersize, '_isType.sling.model.IntegerLiteralExpressionNode') ~= nil) == false then
						do return false end
					end
					if thissize:getValue() ~= othersize:getValue() then
						do return false end
					end
				end
				do return true end
			end
		end
		do return self:isSame(pdt, odt, typemap) end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
		local refdt = pdt
		if refdt:getMagical() then
			do return true end
		end
		if typemap ~= nil then
			local ntr = self:mapType(pdt, typemap)
			if ntr ~= pdt then
				do return self:matches(ntr, odt, nil, false, false) end
			end
		end
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.NullDataTypeNode') ~= nil) then
			do return true end
		end
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.DynamicDataTypeNode') ~= nil) then
			do return true end
		end
		if self:isSame(pdt, odt, typemap) then
			do return true end
		end
		if (_vm:to_table_with_key(odt, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
			local ref = self:getBoundEntity(odt)
			if ref ~= nil then
				local array = ref:getBaseTypes()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local btn = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.BaseTypeNode')
							if btn ~= nil then
								local tt = btn:getReferenceType()
								if tt ~= nil and self:matches(pdt, tt, typemap, false, false) then
									do return true end
								end
							end
							do n = n + 1 end
						end
					end
				end
			end
		end
		do return false end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.ObjectDataTypeNode') ~= nil) then
		if odt ~= nil and ((_vm:to_table_with_key(odt, '_isType.sling.model.NullDataTypeNode') ~= nil) or (_vm:to_table_with_key(odt, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) or (_vm:to_table_with_key(odt, '_isType.sling.model.StringDataTypeNode') ~= nil) or (_vm:to_table_with_key(odt, '_isType.sling.model.VectorDataTypeNode') ~= nil) or (_vm:to_table_with_key(odt, '_isType.sling.model.MapDataTypeNode') ~= nil) or (_vm:to_table_with_key(odt, '_isType.sling.model.FunctionDataTypeNode') ~= nil) or (_vm:to_table_with_key(odt, '_isType.sling.model.ExceptionDataTypeNode') ~= nil) or (_vm:to_table_with_key(odt, '_isType.sling.model.BufferDataTypeNode') ~= nil)) then
			do return true end
		end
		do return self:isSame(pdt, odt, typemap) end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.BufferDataTypeNode') ~= nil) then
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.NullDataTypeNode') ~= nil) then
			do return true end
		end
		do return self:isSame(pdt, odt, typemap) end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.ExceptionDataTypeNode') ~= nil) then
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.NullDataTypeNode') ~= nil) then
			do return true end
		end
		do return self:isSame(pdt, odt, typemap) end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.PointerDataTypeNode') ~= nil) then
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.NullDataTypeNode') ~= nil) then
			do return true end
		end
		do return self:isSame(pdt, odt, typemap) end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.VariableReferenceDataTypeNode') ~= nil) then
		do return self:isSame(pdt, odt, typemap) end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.FunctionDataTypeNode') ~= nil) then
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.NullDataTypeNode') ~= nil) then
			do return true end
		end
		do return self:isSame(pdt, odt, typemap) end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.DateTimeDataTypeNode') ~= nil) then
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.NullDataTypeNode') ~= nil) then
			do return true end
		end
		do return self:isSame(pdt, odt, typemap) end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.DecimalDataTypeNode') ~= nil) then
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.NullDataTypeNode') ~= nil) then
			do return true end
		end
		do return self:isSame(pdt, odt, typemap) end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.MapDataTypeNode') ~= nil) then
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.NullDataTypeNode') ~= nil) then
			do return true end
		end
		do return self:isSame(pdt, odt, typemap) end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.UnknownDataTypeNode') ~= nil) then
		do return true end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.DynamicDataTypeNode') ~= nil) then
		do return true end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.ConstrainedDataTypeNode') ~= nil) then
		local baseTypes = pdt:getBaseTypes()
		if _g.jk.lang.Vector:isEmpty(baseTypes) then
			do return true end
		end
		if (_vm:to_table_with_key(other, '_isType.sling.model.ConstrainedDataTypeNode') ~= nil) then
			local bts = other:getBaseTypes()
			if bts ~= nil then
				local n2 = 0
				local m2 = _g.jk.lang.Vector:getSize(bts)
				do
					n2 = 0
					while n2 < m2 do
						local basetype = _vm:to_table_with_key(bts[n2 + 1], '_isType.sling.common.DataTypeNode')
						if basetype ~= nil then
							if self:matches(pdt, basetype, typemap, false, false) then
								do return true end
							end
						end
						do n2 = n2 + 1 end
					end
				end
			end
		end
		if baseTypes ~= nil then
			local n3 = 0
			local m3 = _g.jk.lang.Vector:getSize(baseTypes)
			do
				n3 = 0
				while n3 < m3 do
					local basetype = _vm:to_table_with_key(baseTypes[n3 + 1], '_isType.sling.common.DataTypeNode')
					if basetype ~= nil then
						if (_vm:to_table_with_key(other, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) and (_vm:to_table_with_key(basetype, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
							if self:isBaseDataTypeOf(self:getBoundEntity(other), basetype) then
								do return true end
							end
						end
						if self:matches(basetype, other, typemap, false, false) then
							do return true end
						end
					end
					do n3 = n3 + 1 end
				end
			end
		end
		do return self:isSame(pdt, odt, typemap) end
	end
	if (_vm:to_table_with_key(pdt, '_isType.sling.model.TypeInfoDataTypeNode') ~= nil) then
		if odt ~= nil and (_vm:to_table_with_key(odt, '_isType.sling.model.NullDataTypeNode') ~= nil) then
			do return true end
		end
		do return self:isSame(pdt, odt, typemap) end
	end
	do return self:isSame(pdt, odt, typemap) end
end

function sling.compiler.SlingTypeResolver:matchesCallParameters(fd, pms, typemap, exact, allowFloatDowncast)
	if not (fd ~= nil) then
		do return false end
	end
	do
		local myparams = fd:getParameters()
		local n1 = 0
		local n2 = 0
		while true do
			local vd = _vm:to_table_with_key(_g.jk.lang.Vector:get(myparams, n1), '_isType.sling.model.VariableDeclarationNode')
			local pp = _vm:to_table_with_key(_g.jk.lang.Vector:get(pms, n2), '_isType.sling.model.ExpressionNode')
			if vd == nil and pp == nil then
				do break end
			end
			if vd == nil and pp ~= nil then
				do return false end
			end
			if vd ~= nil and pp == nil then
				if vd:getInitializer() ~= nil then
					do break end
				end
				do return false end
			end
			do n1 = n1 + 1 end
			do n2 = n2 + 1 end
			do
				local dt1 = nil
				local dt2 = nil
				if vd ~= nil then
					dt1 = vd:getType()
				end
				if pp ~= nil then
					dt2 = _g.sling.util.ExpressionUtil:tryGetExpressionDataType(pp, nil)
				end
				if not (dt1 ~= nil) then
					if not (dt2 ~= nil) then
						goto _continue66
					end
					do return false end
				end
				if not (dt2 ~= nil) then
					do return false end
				end
				if not self:matches(dt1, dt2, typemap, exact, allowFloatDowncast) then
					do return false end
				end
			end
			::_continue66::
		end
		do return true end
	end
end

function sling.compiler.SlingTypeResolver:getMatchingConstructor(entity, parameters, typemap)
	if not (entity ~= nil) then
		do return nil end
	end
	do
		local array = entity:getNodes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local ct = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ConstructorDeclarationNode')
					if ct ~= nil then
						if self:matchesCallParameters(ct, parameters, typemap, false, false) then
							do return ct end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do return nil end
	end
end

function sling.compiler.SlingTypeResolver:isSameDeclaration(oba, obb, typemap, ignoreName)
	if oba == nil or obb == nil then
		do return false end
	end
	if ignoreName == false then
		local nta = oba:getNodeName()
		local ntb = obb:getNodeName()
		if not (nta == ntb) then
			do return false end
		end
	end
	do
		local typea = oba:getType()
		local typeb = obb:getType()
		if typea == nil then
			if typeb ~= nil then
				do return false end
			end
		elseif self:isSame(typea, typeb, typemap) == false then
			do return false end
		end
		do return true end
	end
end

function sling.compiler.SlingTypeResolver:compareParameterArrays(parameters, nps, typemap, ignoreVariableNames)
	if _g.jk.lang.Vector:isEmpty(nps) then
		if _g.jk.lang.Vector:isEmpty(parameters) then
			do return true end
		end
		do return false end
	end
	if _g.jk.lang.Vector:isEmpty(parameters) then
		do return false end
	end
	if _g.jk.lang.Vector:getSize(nps) ~= _g.jk.lang.Vector:getSize(parameters) then
		do return false end
	end
	do
		local ita = _g.jk.lang.Vector:iterate(parameters)
		local itb = _g.jk.lang.Vector:iterate(nps)
		if ita == nil then
			if itb ~= nil then
				do return false end
			end
			do return true end
		end
		if itb == nil then
			do return false end
		end
		while true do
			local oba = _vm:to_table_with_key(ita:next(), '_isType.sling.common.NodeObject')
			local obb = _vm:to_table_with_key(itb:next(), '_isType.sling.common.NodeObject')
			if oba == nil then
				if obb ~= nil then
					do return false end
				end
				do break end
			end
			if obb == nil then
				do return false end
			end
			if (_vm:to_table_with_key(oba, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
				if _g.sling.compiler.SlingTypeResolver:isSameDeclaration(oba, _vm:to_table_with_key(obb, '_isType.sling.model.VariableDeclarationNode'), typemap, ignoreVariableNames) == false then
					do return false end
				end
			elseif (_vm:to_table_with_key(oba, '_isType.sling.model.VariableArgumentsDeclarationNode') ~= nil) then
				local obbv = _vm:to_table_with_key(obb, '_isType.sling.model.VariableArgumentsDeclarationNode')
				if not (obbv ~= nil) then
					do return false end
				end
				if not _g.sling.compiler.SlingTypeResolver:isSameDeclaration(oba:getVariableDeclaration(), obbv:getVariableDeclaration(), typemap, ignoreVariableNames) then
					do return false end
				end
			else
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unknown parameter node type when comparing signatures: `" .. _g.jk.lang.String:safeString(oba:getNodeTypeName()) .. "'", oba, nil))
				do return false end
			end
		end
		do return true end
	end
end

function sling.compiler.SlingTypeResolver:hasSameSignature(anode, bnode, typemap, ignoreType, ignoreParameters, ignoreName)
	if ignoreName == false then
		local nn = bnode:getNodeName()
		if not (nn ~= nil) then
			if anode:getNodeName() ~= nil then
				do return false end
			end
		elseif not (nn == anode:getNodeName()) then
			do return false end
		end
	end
	if ignoreType == false then
		local nt = bnode:getReturnType()
		local type = anode:getReturnType()
		if not (nt ~= nil) then
			if type ~= nil then
				do return false end
			end
		else
			if not (type ~= nil) then
				do return false end
			end
			if not self:isSame(type, nt, typemap) then
				do return false end
			end
		end
	end
	if ignoreParameters == false then
		if _g.sling.compiler.SlingTypeResolver:compareParameterArrays(anode:getParameters(), bnode:getParameters(), typemap, true) == false then
			do return false end
		end
	end
	do return true end
end

function sling.compiler.SlingTypeResolver:doFindBaseclassDeclaration(fdecl, ee, lookHere, typemap, ignoreType, ignoreParameters, typemapr)
	if ee == nil or (_vm:to_table_with_key(ee, '_isType.sling.model.InterfaceDeclarationNode') ~= nil) then
		do return nil end
	end
	if lookHere then
		local array = ee:getNodes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local eef = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FunctionDeclarationNode')
					if eef ~= nil then
						if _g.sling.compiler.SlingTypeResolver:hasSameSignature(eef, fdecl, typemap, ignoreType, ignoreParameters, false) then
							if typemapr ~= nil then
								do typemapr:clear() end
								if typemap ~= nil then
									do typemap:copyTo(typemapr) end
								end
							end
							do return eef end
						end
					end
					do n = n + 1 end
				end
			end
		end
	end
	do
		local array2 = ee:getBaseTypes()
		if array2 ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(array2)
			do
				n2 = 0
				while n2 < m2 do
					local btn = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.BaseTypeNode')
					if btn ~= nil then
						local type = btn:getReferenceType()
						if not (type ~= nil) then
							goto _continue67
						end
						do
							local ref = self:getBoundEntity(type)
							if not (ref ~= nil) then
								goto _continue67
							end
							if (_vm:to_table_with_key(ref, '_isType.sling.model.MagicalClassDeclarationNode') ~= nil) then
								goto _continue67
							end
							do
								local ntypemap = nil
								local tps = self:getTypeParametersForNode(type)
								if tps ~= nil then
									ntypemap = self:createTypeMapforEntity(_vm:to_table_with_key(ref, '_isType.sling.model.GenericCapableEntityDeclarationNode'), tps)
								end
								if ref ~= nil then
									local mf = _g.sling.compiler.SlingTypeResolver:doFindBaseclassDeclaration(fdecl, ref, true, ntypemap, ignoreType, ignoreParameters, typemapr)
									if mf ~= nil then
										do return mf end
									end
								end
							end
						end
					end
					::_continue67::
					do n2 = n2 + 1 end
				end
			end
		end
		do return nil end
	end
end

function sling.compiler.SlingTypeResolver:tryFindBaseclassDeclaration(fdecl, ignoreType, ignoreParameters, typemapr)
	if not (fdecl ~= nil) then
		do return nil end
	end
	do
		local pp = _vm:to_table_with_key(fdecl:getParent(), '_isType.sling.model.EntityDeclarationNode')
		if not (pp ~= nil) then
			do return nil end
		end
		do
			local v = _g.sling.compiler.SlingTypeResolver:doFindBaseclassDeclaration(fdecl, pp, false, nil, ignoreType, ignoreParameters, typemapr)
			do return v end
		end
	end
end

function sling.compiler.SlingTypeResolver:resolveBaseClassDeclaration(fdecl, requireModifier)
	if not (fdecl ~= nil) then
		do return end
	end
	do
		local bd = fdecl:getBaseClassDeclaration()
		if bd ~= nil then
			do return end
		end
		do
			local hasModifier = _g.sling.util.ModifierUtil:hasCommonModifier(fdecl, _g.sling.model.Modifier.OVERRIDE)
			if requireModifier == false or hasModifier then
				local typemapr = _g.sling.model.TypeMap._construct0(_g.sling.model.TypeMap._create())
				local bcd = _g.sling.compiler.SlingTypeResolver:tryFindBaseclassDeclaration(fdecl, false, false, typemapr)
				if bcd == nil and hasModifier then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to find base class declaration for overriding method", fdecl, nil))
				end
				do fdecl:setBaseClassDeclaration(bcd, typemapr) end
				if bcd ~= nil then
					do bcd:addToOverridingDeclarations(fdecl) end
				end
			end
		end
	end
end

function sling.compiler.SlingTypeResolver:doFindImplementedInterfaceMethods(v, fdecl, ee, lookHere, typemap, typemapr)
	if not (v ~= nil) then
		do return end
	end
	do
		local ii = _vm:to_table_with_key(ee, '_isType.sling.model.InterfaceDeclarationNode')
		if ii ~= nil and lookHere then
			local array = ii:getNodes()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local eef = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FunctionDeclarationNode')
						if eef ~= nil then
							if _g.sling.compiler.SlingTypeResolver:hasSameSignature(eef, fdecl, typemap, false, false, false) then
								if typemapr ~= nil then
									do typemapr:clear() end
									if typemap ~= nil then
										do typemap:copyTo(typemapr) end
									end
								end
								do _g.jk.lang.Vector:append(v, eef) end
								do break end
							end
						end
						do n = n + 1 end
					end
				end
			end
		end
		do
			local array2 = ee:getBaseTypes()
			if array2 ~= nil then
				local n2 = 0
				local m2 = _g.jk.lang.Vector:getSize(array2)
				do
					n2 = 0
					while n2 < m2 do
						local btn = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.BaseTypeNode')
						if btn ~= nil then
							local type = btn:getReferenceType()
							if not (type ~= nil) then
								goto _continue68
							end
							do
								local ref = self:getBoundEntity(type)
								if not (ref ~= nil) then
									goto _continue68
								end
								if (_vm:to_table_with_key(ref, '_isType.sling.model.InterfaceDeclarationNode') ~= nil) then
								elseif (_vm:to_table_with_key(ref, '_isType.sling.model.ClassDeclarationNode') ~= nil) and _g.sling.util.ModifierUtil:hasCommonModifier(ref, _g.sling.model.Modifier.ABSTRACT) then
								else
									goto _continue68
								end
								do
									local ntypemap = nil
									local tps = self:getTypeParametersForNode(type)
									if tps ~= nil then
										ntypemap = self:createTypeMapforEntity(_vm:to_table_with_key(ref, '_isType.sling.model.GenericCapableEntityDeclarationNode'), tps)
									end
									if ref ~= nil then
										do self:doFindImplementedInterfaceMethods(v, fdecl, ref, true, ntypemap, typemapr) end
									end
								end
							end
						end
						::_continue68::
						do n2 = n2 + 1 end
					end
				end
			end
		end
	end
end

function sling.compiler.SlingTypeResolver:findImplementedInterfaceMethod(fdecl)
	if not (fdecl ~= nil) then
		do return nil end
	end
	do
		local v = fdecl:getImplementedDeclarations()
		if not (v ~= nil) then
			local ee = _vm:to_table_with_key(fdecl:getParent(), '_isType.sling.model.EntityDeclarationNode')
			if not (ee ~= nil) then
				do return nil end
			end
			v = {}
			do self:doFindImplementedInterfaceMethods(v, fdecl, ee, false, nil, nil) end
		end
		do return _g.jk.lang.Vector:get(v, 0) end
	end
end

function sling.compiler.SlingTypeResolver:findAllImplementedInterfaceMethods(fdecl, force)
	if not (fdecl ~= nil) then
		do return nil end
	end
	do
		local v = fdecl:getImplementedDeclarations()
		if not (v ~= nil) or force then
			local ee = _vm:to_table_with_key(fdecl:getParent(), '_isType.sling.model.EntityDeclarationNode')
			if not (ee ~= nil) then
				do return nil end
			end
			v = {}
			do self:doFindImplementedInterfaceMethods(v, fdecl, ee, false, nil, nil) end
		end
		do return v end
	end
end

function sling.compiler.SlingTypeResolver:resolveImplementedInterfaces(fdecl, force)
	if not (fdecl ~= nil) then
		do return end
	end
	do
		local impls = self:findAllImplementedInterfaceMethods(fdecl, force)
		do fdecl:setImplementedDeclarations(impls) end
		if impls ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(impls)
			do
				n = 0
				while n < m do
					local impl = impls[n + 1]
					if impl ~= nil then
						do impl:addToOverridingDeclarations(fdecl) end
					end
					do n = n + 1 end
				end
			end
		end
	end
end

sling.compiler.SlingTypeResolver.DataTypeResolverVisitor = _g.sling.common.NodeVisitor._create()
sling.compiler.SlingTypeResolver.DataTypeResolverVisitor.__index = sling.compiler.SlingTypeResolver.DataTypeResolverVisitor
_vm:set_metatable(sling.compiler.SlingTypeResolver.DataTypeResolverVisitor, {
	__index = _g.sling.common.NodeVisitor
})

function sling.compiler.SlingTypeResolver.DataTypeResolverVisitor._create()
	local v = _vm:set_metatable({}, sling.compiler.SlingTypeResolver.DataTypeResolverVisitor)
	return v
end

function sling.compiler.SlingTypeResolver.DataTypeResolverVisitor:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.SlingTypeResolver.DataTypeResolverVisitor'
	self['_isType.sling.compiler.SlingTypeResolver.DataTypeResolverVisitor'] = true
	self.resolver = nil
	self.ignoreErrors = false
	self.ctx = nil
end

function sling.compiler.SlingTypeResolver.DataTypeResolverVisitor:_construct0()
	sling.compiler.SlingTypeResolver.DataTypeResolverVisitor._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.compiler.SlingTypeResolver.DataTypeResolverVisitor:visit(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationNode') ~= nil) and _g.sling.util.ModifierUtil:hasAnnotationModifier(node, "macro") then
		do self:setSkipChildren(true) end
	elseif (_vm:to_table_with_key(node, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
		if self.ignoreErrors then
			do self.resolver:tryResolveDataType(self.ctx, node) end
		else
			do self.resolver:resolveDataType(node) end
		end
	end
	do return true end
end

function sling.compiler.SlingTypeResolver.DataTypeResolverVisitor:getResolver()
	do return self.resolver end
end

function sling.compiler.SlingTypeResolver.DataTypeResolverVisitor:setResolver(v)
	self.resolver = v
	do return self end
end

function sling.compiler.SlingTypeResolver.DataTypeResolverVisitor:getIgnoreErrors()
	do return self.ignoreErrors end
end

function sling.compiler.SlingTypeResolver.DataTypeResolverVisitor:setIgnoreErrors(v)
	self.ignoreErrors = v
	do return self end
end

function sling.compiler.SlingTypeResolver.DataTypeResolverVisitor:getCtx()
	do return self.ctx end
end

function sling.compiler.SlingTypeResolver.DataTypeResolverVisitor:setCtx(v)
	self.ctx = v
	do return self end
end

sling.compiler.SlingTypeResolver.ExpressionResolverVisitor = _g.sling.common.NodeVisitor._create()
sling.compiler.SlingTypeResolver.ExpressionResolverVisitor.__index = sling.compiler.SlingTypeResolver.ExpressionResolverVisitor
_vm:set_metatable(sling.compiler.SlingTypeResolver.ExpressionResolverVisitor, {
	__index = _g.sling.common.NodeVisitor
})

function sling.compiler.SlingTypeResolver.ExpressionResolverVisitor._create()
	local v = _vm:set_metatable({}, sling.compiler.SlingTypeResolver.ExpressionResolverVisitor)
	return v
end

function sling.compiler.SlingTypeResolver.ExpressionResolverVisitor:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.SlingTypeResolver.ExpressionResolverVisitor'
	self['_isType.sling.compiler.SlingTypeResolver.ExpressionResolverVisitor'] = true
	self.resolver = nil
	self.ignoreErrors = false
	self.ctx = nil
end

function sling.compiler.SlingTypeResolver.ExpressionResolverVisitor:_construct0()
	sling.compiler.SlingTypeResolver.ExpressionResolverVisitor._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.compiler.SlingTypeResolver.ExpressionResolverVisitor:visit(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationNode') ~= nil) and _g.sling.util.ModifierUtil:hasAnnotationModifier(node, "macro") then
		do self:setSkipChildren(true) end
	elseif (_vm:to_table_with_key(node, '_isType.sling.model.ExpressionNode') ~= nil) then
		if self.ignoreErrors then
			do
				local _status, _err = _vm:execute_protected_call(function()
					do self.resolver:resolveExpression(node) end
				end)
				if _err then
					if (_vm:to_table_with_key(_err, '_isType.sling.common.ReferenceError') ~= nil) then
						local e = _err
						if self.ctx ~= nil and self.ctx:isInDebugMode() then
							do _g.jk.log.Log:debug(self.ctx, e:toStringWithDebug(true)) end
						end
					else
						_vm:throw_error(_err)
					end
				end
			end
		else
			do self.resolver:resolveExpression(node) end
		end
	end
	do return true end
end

function sling.compiler.SlingTypeResolver.ExpressionResolverVisitor:getResolver()
	do return self.resolver end
end

function sling.compiler.SlingTypeResolver.ExpressionResolverVisitor:setResolver(v)
	self.resolver = v
	do return self end
end

function sling.compiler.SlingTypeResolver.ExpressionResolverVisitor:getIgnoreErrors()
	do return self.ignoreErrors end
end

function sling.compiler.SlingTypeResolver.ExpressionResolverVisitor:setIgnoreErrors(v)
	self.ignoreErrors = v
	do return self end
end

function sling.compiler.SlingTypeResolver.ExpressionResolverVisitor:getCtx()
	do return self.ctx end
end

function sling.compiler.SlingTypeResolver.ExpressionResolverVisitor:setCtx(v)
	self.ctx = v
	do return self end
end

function sling.compiler.SlingTypeResolver:execute(node)
	if node ~= nil then
		do node:accept(_g.sling.compiler.SlingTypeResolver.DataTypeResolverVisitor._construct0(_g.sling.compiler.SlingTypeResolver.DataTypeResolverVisitor._create()):setResolver(self)) end
		do node:accept(_g.sling.compiler.SlingTypeResolver.ExpressionResolverVisitor._construct0(_g.sling.compiler.SlingTypeResolver.ExpressionResolverVisitor._create()):setResolver(self)) end
	end
end

function sling.compiler.SlingTypeResolver:tryExecute(ctx, node)
	if node ~= nil then
		do node:accept(_g.sling.compiler.SlingTypeResolver.DataTypeResolverVisitor._construct0(_g.sling.compiler.SlingTypeResolver.DataTypeResolverVisitor._create()):setCtx(ctx):setIgnoreErrors(true):setResolver(self)) end
		do node:accept(_g.sling.compiler.SlingTypeResolver.ExpressionResolverVisitor._construct0(_g.sling.compiler.SlingTypeResolver.ExpressionResolverVisitor._create()):setCtx(ctx):setIgnoreErrors(true):setResolver(self)) end
	end
end

function sling.compiler.SlingTypeResolver:resolveBaseClassDeclarationsForMethods(ctx, root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.FunctionDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local ff = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FunctionDeclarationNode')
				if ff ~= nil then
					if (_vm:to_table_with_key(ff:getParent(), '_isType.sling.model.FunctionDataTypeNode') ~= nil) then
						goto _continue69
					end
					if _g.sling.util.ModifierUtil:hasAnnotationModifier(ff, "magical") == false then
						do self:resolveBaseClassDeclaration(ff, false) end
					end
					do self:resolveImplementedInterfaces(ff, false) end
				end
				::_continue69::
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.SlingTypeResolver:getIgnoreFailedPaths()
	do return self.ignoreFailedPaths end
end

function sling.compiler.SlingTypeResolver:setIgnoreFailedPaths(v)
	self.ignoreFailedPaths = v
	do return self end
end

sling.compiler.DynamicModelExpander = {}
sling.compiler.DynamicModelExpander.__index = sling.compiler.DynamicModelExpander
_vm:set_metatable(sling.compiler.DynamicModelExpander, {})

function sling.compiler.DynamicModelExpander._create()
	local v = _vm:set_metatable({}, sling.compiler.DynamicModelExpander)
	return v
end

function sling.compiler.DynamicModelExpander:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.DynamicModelExpander'
	self['_isType.sling.compiler.DynamicModelExpander'] = true
end

function sling.compiler.DynamicModelExpander:_construct0()
	sling.compiler.DynamicModelExpander._init(self)
	return self
end

sling.compiler.DynamicModelExpander.ModelNodeFinder = _g.sling.common.NodeVisitor._create()
sling.compiler.DynamicModelExpander.ModelNodeFinder.__index = sling.compiler.DynamicModelExpander.ModelNodeFinder
_vm:set_metatable(sling.compiler.DynamicModelExpander.ModelNodeFinder, {
	__index = _g.sling.common.NodeVisitor
})

function sling.compiler.DynamicModelExpander.ModelNodeFinder._create()
	local v = _vm:set_metatable({}, sling.compiler.DynamicModelExpander.ModelNodeFinder)
	return v
end

function sling.compiler.DynamicModelExpander.ModelNodeFinder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.DynamicModelExpander.ModelNodeFinder'
	self['_isType.sling.compiler.DynamicModelExpander.ModelNodeFinder'] = true
	self.results = {}
end

function sling.compiler.DynamicModelExpander.ModelNodeFinder:_construct0()
	sling.compiler.DynamicModelExpander.ModelNodeFinder._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.compiler.DynamicModelExpander.ModelNodeFinder:visit(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.ModelDeclarationNode') ~= nil) and _g.sling.util.ModifierUtil:hasAnnotationModifier(node, "dynamic") then
		do _g.jk.lang.Vector:append(self.results, node) end
	end
	do return true end
end

function sling.compiler.DynamicModelExpander.ModelNodeFinder:getResults()
	do return self.results end
end

function sling.compiler.DynamicModelExpander.ModelNodeFinder:setResults(v)
	self.results = v
	do return self end
end

function sling.compiler.DynamicModelExpander:dataTypeToSymbolExpression(type)
	local refdt = _vm:to_table_with_key(type, '_isType.sling.model.ReferenceDataTypeNode')
	if not (refdt ~= nil) then
		do return nil end
	end
	do
		local sym = refdt:getSymbol()
		if not (sym ~= nil) then
			do return nil end
		end
		do
			local symdup = _vm:to_table_with_key(sym:dup(), '_isType.sling.model.SymbolNode')
			if not (symdup ~= nil) then
				do return nil end
			end
			do return _g.sling.model.SymbolExpressionNode:forSymbol(symdup) end
		end
	end
end

function sling.compiler.DynamicModelExpander:isDynamicMap(type)
	local symbolName = _g.sling.util.DataTypeUtil:getSymbolName(type)
	if not (symbolName ~= nil) then
		do return false end
	end
	if symbolName == "DynamicMap" then
		do return true end
	end
	do return false end
end

function sling.compiler.DynamicModelExpander:isDynamicVector(type)
	local symbolName = _g.sling.util.DataTypeUtil:getSymbolName(type)
	if not (symbolName ~= nil) then
		do return false end
	end
	if symbolName == "DynamicVector" then
		do return true end
	end
	do return false end
end

function sling.compiler.DynamicModelExpander:isLongInteger(type)
	local idt = _vm:to_table_with_key(type, '_isType.sling.model.IntegerDataTypeNode')
	if not (idt ~= nil) then
		do return false end
	end
	do
		local type = idt:getType()
		if type == type == _g.sling.model.IntegerDataTypeNode.TYPE_INT64 or type == _g.sling.model.IntegerDataTypeNode.TYPE_UINT64 then
			do return true end
		end
		do return false end
	end
end

function sling.compiler.DynamicModelExpander:execute(root)
	if not (root ~= nil) then
		do return end
	end
	do
		local cf = _g.sling.compiler.DynamicModelExpander.ModelNodeFinder._construct0(_g.sling.compiler.DynamicModelExpander.ModelNodeFinder._create())
		if not root:accept(cf) then
			do return end
		end
		do
			local array = cf:getResults()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local model = array[n + 1]
						if model ~= nil then
							local cdecl = _g.sling.model.ClassDeclarationNode:forName(model:getNodeName())
							do cdecl:setSource(model:getSource()) end
							do cdecl:setDescription(model:getDescription()) end
							do _g.sling.util.ModifierUtil:copyModifiers(model, cdecl) end
							do _g.sling.util.ModifierUtil:removeAnnotationModifier(cdecl, "dynamic") end
							if (_vm:to_table_with_key(model:getParent(), '_isType.sling.model.EntityDeclarationNode') ~= nil) then
								do _g.sling.util.ModifierUtil:addCommonModifier(cdecl, _g.sling.model.Modifier.STATIC) end
							end
							do cdecl:setDependencies(model:getDependencies()) end
							do cdecl:setImportNamespaces(model:exportImportNamespaces(), false) end
							do cdecl:setImportEntities(model:exportImportEntities(), false) end
							do
								local fields = {}
								local array2 = model:getNodes()
								if array2 ~= nil then
									local n2 = 0
									local m2 = _g.jk.lang.Vector:getSize(array2)
									do
										n2 = 0
										while n2 < m2 do
											local variable = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.VariableDeclarationNode')
											if variable ~= nil then
												local pd = _g.sling.model.PropertyDeclarationNode._construct0(_g.sling.model.PropertyDeclarationNode._create())
												local propertyName = variable:getName()
												local encodedName = variable:getParamName()
												if _g.jk.lang.String:isEmpty(encodedName) then
													encodedName = propertyName
												end
												do pd:setName(propertyName) end
												do pd:setDescription(variable:getDescription()) end
												do pd:setSource(variable:getSource()) end
												do
													local originaltype = variable:getType()
													if (_vm:to_table_with_key(originaltype, '_isType.sling.model.StaticArrayDataTypeNode') ~= nil) then
														local pt = originaltype:getPrimaryType()
														if not (pt ~= nil) then
															_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No primary type", originaltype, nil))
														end
														do pd:setType(_g.sling.model.VectorDataTypeNode:forPrimaryType(_g.sling.util.DataTypeUtil:dupAsDataType(pt)), false) end
													else
														do pd:setType(_g.sling.util.DataTypeUtil:dupAsDataType(originaltype), false) end
													end
													do
														local newtype = pd:getType()
														do pd:setDescription(variable:getDescription()) end
														do
															local pdbody = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
															do pd:setBody(pdbody, false) end
															do
																local getter = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
																if (_vm:to_table_with_key(newtype, '_isType.sling.model.StringDataTypeNode') ~= nil) then
																	local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("data"), "getString", false)
																	do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																	do getter:addNode(_g.sling.model.ReturnStatementNode:forExpression(fc)) end
																elseif (_vm:to_table_with_key(newtype, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
																	if self:isLongInteger(newtype) then
																		local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("data"), "getLongInteger", false)
																		do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																		do getter:addNode(_g.sling.model.ReturnStatementNode:forExpression(fc)) end
																	else
																		local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("data"), "getInteger", false)
																		do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																		do getter:addNode(_g.sling.model.ReturnStatementNode:forExpression(fc)) end
																	end
																elseif (_vm:to_table_with_key(newtype, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
																	local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("data"), "getDouble", false)
																	do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																	do getter:addNode(_g.sling.model.ReturnStatementNode:forExpression(fc)) end
																elseif (_vm:to_table_with_key(newtype, '_isType.sling.model.BooleanDataTypeNode') ~= nil) then
																	local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("data"), "getBoolean", false)
																	do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																	do getter:addNode(_g.sling.model.ReturnStatementNode:forExpression(fc)) end
																elseif (_vm:to_table_with_key(newtype, '_isType.sling.model.BufferDataTypeNode') ~= nil) then
																	local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("data"), "getBuffer", false)
																	do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																	do getter:addNode(_g.sling.model.ReturnStatementNode:forExpression(fc)) end
																elseif self:isDynamicMap(newtype) then
																	local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("data"), "getDynamicMap", false)
																	do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																	do getter:addNode(_g.sling.model.ReturnStatementNode:forExpression(fc)) end
																elseif self:isDynamicVector(newtype) then
																	local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("data"), "getDynamicVector", false)
																	do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																	do getter:addNode(_g.sling.model.ReturnStatementNode:forExpression(fc)) end
																elseif (_vm:to_table_with_key(newtype, '_isType.sling.model.VectorDataTypeNode') ~= nil) then
																	local vdt = newtype
																	local pdt = vdt:getPrimaryType()
																	if (_vm:to_table_with_key(pdt, '_isType.sling.model.StringDataTypeNode') ~= nil) then
																		local fc = _g.sling.model.FunctionCallExpressionNode:forName("getFieldAsStringVector")
																		do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																		do getter:addNode(_g.sling.model.ReturnStatementNode:forExpression(fc)) end
																	elseif (_vm:to_table_with_key(pdt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
																		if self:isLongInteger(pdt) then
																			local fc = _g.sling.model.FunctionCallExpressionNode:forName("getFieldAsLongIntegerVector")
																			do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																			do getter:addNode(_g.sling.model.ReturnStatementNode:forExpression(fc)) end
																		else
																			local fc = _g.sling.model.FunctionCallExpressionNode:forName("getFieldAsIntegerVector")
																			do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																			do getter:addNode(_g.sling.model.ReturnStatementNode:forExpression(fc)) end
																		end
																	elseif (_vm:to_table_with_key(pdt, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
																		local fc = _g.sling.model.FunctionCallExpressionNode:forName("getFieldAsDoubleVector")
																		do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																		do getter:addNode(_g.sling.model.ReturnStatementNode:forExpression(fc)) end
																	elseif (_vm:to_table_with_key(pdt, '_isType.sling.model.BooleanDataTypeNode') ~= nil) then
																		local fc = _g.sling.model.FunctionCallExpressionNode:forName("getFieldAsBooleanVector")
																		do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																		do getter:addNode(_g.sling.model.ReturnStatementNode:forExpression(fc)) end
																	elseif (_vm:to_table_with_key(pdt, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
																		local fc = _g.sling.model.FunctionCallExpressionNode:forName("RETURN_VECTOR_FIELD_OBJECTS")
																		do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																		do fc:addToParameters(self:dataTypeToSymbolExpression(pdt)) end
																		do getter:addNode(fc) end
																	else
																		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported vector getter data type", pdt, nil))
																	end
																elseif (_vm:to_table_with_key(newtype, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
																	local gdmfc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("data"), "getDynamicMap", false)
																	do gdmfc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																	do
																		local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(self:dataTypeToSymbolExpression(newtype), "forData", false)
																		do fc:addToParameters(gdmfc) end
																		do getter:addNode(_g.sling.model.ReturnStatementNode:forExpression(fc)) end
																	end
																else
																	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported getter data type", newtype, nil))
																end
																do
																	local v = _g.sling.model.PropertyGetFunctionDeclarationNode._construct0(_g.sling.model.PropertyGetFunctionDeclarationNode._create())
																	do v:setSource(variable:getSource()) end
																	do v:setReturnType(_g.sling.util.DataTypeUtil:dupAsDataType(newtype), false) end
																	do v:setBody(getter, false) end
																	do pdbody:addNode(v) end
																end
															end
															do
																local setter = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
																if (_vm:to_table_with_key(newtype, '_isType.sling.model.StringDataTypeNode') ~= nil) then
																	local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("data"), "setString", false)
																	do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																	do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forName("value")) end
																	do setter:addNode(fc) end
																elseif (_vm:to_table_with_key(newtype, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
																	if self:isLongInteger(newtype) then
																		local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("data"), "setLongInteger", false)
																		do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																		do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forName("value")) end
																		do setter:addNode(fc) end
																	else
																		local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("data"), "setInteger", false)
																		do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																		do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forName("value")) end
																		do setter:addNode(fc) end
																	end
																elseif (_vm:to_table_with_key(newtype, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
																	local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("data"), "setDouble", false)
																	do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																	do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forName("value")) end
																	do setter:addNode(fc) end
																elseif (_vm:to_table_with_key(newtype, '_isType.sling.model.BooleanDataTypeNode') ~= nil) then
																	local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("data"), "setBoolean", false)
																	do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																	do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forName("value")) end
																	do setter:addNode(fc) end
																elseif (_vm:to_table_with_key(newtype, '_isType.sling.model.BufferDataTypeNode') ~= nil) then
																	local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("data"), "setBuffer", false)
																	do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																	do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forName("value")) end
																	do setter:addNode(fc) end
																elseif (_vm:to_table_with_key(newtype, '_isType.sling.model.VectorDataTypeNode') ~= nil) then
																	local fc = _g.sling.model.FunctionCallExpressionNode:forName("SET_VECTOR_FIELD")
																	do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																	do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forName("value")) end
																	do setter:addNode(fc) end
																elseif self:isDynamicMap(newtype) then
																	local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("data"), "setObject", false)
																	do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																	do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forName("value")) end
																	do setter:addNode(fc) end
																elseif self:isDynamicVector(newtype) then
																	local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("data"), "setObject", false)
																	do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																	do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forName("value")) end
																	do setter:addNode(fc) end
																elseif (_vm:to_table_with_key(newtype, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
																	local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("data"), "setObject", false)
																	do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(encodedName)) end
																	do
																		local vfc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("DynamicModel"), "asDynamicMap", false)
																		do vfc:addToParameters(_g.sling.model.SymbolExpressionNode:forName("value")) end
																		do fc:addToParameters(vfc) end
																		do setter:addNode(fc) end
																	end
																else
																	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported setter data type", newtype, nil))
																end
																do
																	local v = _g.sling.model.PropertySetFunctionDeclarationNode._construct0(_g.sling.model.PropertySetFunctionDeclarationNode._create())
																	do v:setSource(variable:getSource()) end
																	do v:setParameter(_g.sling.util.DataTypeUtil:dupAsDataType(newtype), "value") end
																	do v:setBody(setter, false) end
																	do pdbody:addNode(v) end
																end
															end
															if (_vm:to_table_with_key(newtype, '_isType.sling.model.VectorDataTypeNode') ~= nil) then
																local vdt = newtype
																local pdt = vdt:getPrimaryType()
																if not (pdt ~= nil) then
																	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No primary type", vdt, nil))
																end
																do
																	local fname = _g.sling.common.CodeStringUtil:combineCamelCase({
																		"addTo",
																		propertyName
																	})
																	local addto = _g.sling.model.FunctionDeclarationNode:forName(fname, false)
																	do _g.sling.util.ModifierUtil:addCommonModifier(addto, _g.sling.model.Modifier.PUBLIC) end
																	do addto:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.util.DataTypeUtil:dupAsDataType(pdt), "value", nil)) end
																	do
																		local cfname = nil
																		if (_vm:to_table_with_key(pdt, '_isType.sling.model.StringDataTypeNode') ~= nil) then
																			cfname = "addStringToVectorField"
																		elseif (_vm:to_table_with_key(pdt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
																			if self:isLongInteger(pdt) then
																				cfname = "addLongIntegerToVectorField"
																			else
																				cfname = "addIntegerToVectorField"
																			end
																		elseif (_vm:to_table_with_key(pdt, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
																			cfname = "addDoubleToVectorField"
																		elseif (_vm:to_table_with_key(pdt, '_isType.sling.model.BooleanDataTypeNode') ~= nil) then
																			cfname = "addBooleanToVectorField"
																		elseif (_vm:to_table_with_key(pdt, '_isType.sling.model.BufferDataTypeNode') ~= nil) then
																			cfname = "addBufferToVectorField"
																		elseif (_vm:to_table_with_key(pdt, '_isType.sling.model.VectorDataTypeNode') ~= nil) then
																			cfname = "addObjectToVectorField"
																		elseif (_vm:to_table_with_key(pdt, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
																			cfname = "addObjectToVectorField"
																		else
																			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported data type in addTo method", pdt, nil))
																		end
																		do
																			local fc = _g.sling.model.FunctionCallExpressionNode:forName(cfname)
																			do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(propertyName)) end
																			do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forName("value")) end
																			do _g.sling.util.FunctionUtil:addStatement(addto, fc) end
																			do cdecl:addNode(addto) end
																		end
																	end
																end
															end
															do
																local field = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
																local vd = _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.ReferenceDataTypeNode:forName("DynamicModelField"), "o", _g.sling.model.CreateObjectExpressionNode:forType(_g.sling.model.ReferenceDataTypeNode:forName("DynamicModelField")))
																do field:addNode(vd) end
																do field:addNode(_g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.MemberAccessExpressionNode:forSymbolNames("o", "name"), _g.sling.model.StringLiteralExpressionNode:forValue(propertyName))) end
																do field:addNode(_g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.MemberAccessExpressionNode:forSymbolNames("o", "encodedName"), _g.sling.model.StringLiteralExpressionNode:forValue(encodedName))) end
																do
																	local typename = nil
																	if (_vm:to_table_with_key(newtype, '_isType.sling.model.StringDataTypeNode') ~= nil) then
																		typename = "TYPE_STRING"
																	elseif (_vm:to_table_with_key(newtype, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
																		if self:isLongInteger(newtype) then
																			typename = "TYPE_LONG_INTEGER"
																		else
																			typename = "TYPE_INTEGER"
																		end
																	elseif (_vm:to_table_with_key(newtype, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
																		typename = "TYPE_DOUBLE"
																	elseif (_vm:to_table_with_key(newtype, '_isType.sling.model.BooleanDataTypeNode') ~= nil) then
																		typename = "TYPE_BOOLEAN"
																	elseif (_vm:to_table_with_key(newtype, '_isType.sling.model.BufferDataTypeNode') ~= nil) then
																		typename = "TYPE_BUFFER"
																	elseif self:isDynamicMap(newtype) then
																		typename = "TYPE_MAP"
																	elseif self:isDynamicVector(newtype) then
																		typename = "TYPE_VECTOR"
																	elseif (_vm:to_table_with_key(newtype, '_isType.sling.model.VectorDataTypeNode') ~= nil) then
																		typename = "TYPE_VECTOR"
																	elseif (_vm:to_table_with_key(newtype, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
																		typename = "TYPE_OBJECT"
																	else
																		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported data type when determining data type", newtype, nil))
																	end
																	do field:addNode(_g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.MemberAccessExpressionNode:forSymbolNames("o", "type"), _g.sling.model.MemberAccessExpressionNode:forSymbolNames("DynamicModelField", typename))) end
																	do field:addNode(_g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.MemberAccessExpressionNode:forSymbolNames("o", "description"), _g.sling.model.StringLiteralExpressionNode:forValue(pd:getDescription()))) end
																	do
																		local array3 = _g.sling.util.ModifierUtil:getAnnotationModifiers(variable)
																		if array3 ~= nil then
																			local n3 = 0
																			local m3 = _g.jk.lang.Vector:getSize(array3)
																			do
																				n3 = 0
																				while n3 < m3 do
																					local mod = array3[n3 + 1]
																					if mod ~= nil then
																						local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("o"), "addToTags", false)
																						do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(mod)) end
																						do field:addNode(fc) end
																					end
																					do n3 = n3 + 1 end
																				end
																			end
																		end
																		do field:addNode(_g.sling.model.AdditionAssignmentExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName("v"), _g.sling.model.SymbolExpressionNode:forName("o"))) end
																		do _g.jk.lang.Vector:append(fields, field) end
																	end
																end
															end
															do cdecl:addNode(pd) end
														end
													end
												end
											end
											do n2 = n2 + 1 end
										end
									end
								end
								do cdecl:addToImportNamespaces(_g.sling.model.SymbolNode:forArrayOfNames({
									"jk",
									"model"
								})) end
								do cdecl:addToBaseTypes(_g.sling.model.BaseTypeNode:forType(_g.sling.model.ReferenceDataTypeNode:forName("DynamicModel"), 0)) end
								do
									local forData = _g.sling.model.FunctionDeclarationNode:forName("forData", false)
									do _g.sling.util.ModifierUtil:addCommonModifier(forData, _g.sling.model.Modifier.PUBLIC) end
									do _g.sling.util.ModifierUtil:addCommonModifier(forData, _g.sling.model.Modifier.STATIC) end
									do forData:setReturnType(_g.sling.model.ReferenceDataTypeNode:forNode(cdecl, nil), false) end
									do forData:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.ReferenceDataTypeNode:forName("DynamicMap"), "data", nil)) end
									do _g.sling.util.FunctionUtil:addStatement(forData, _g.sling.model.AssertStatementNode:forChild(_g.sling.model.SymbolExpressionNode:forName("data"))) end
									do
										local xob = _g.sling.model.CreateObjectExpressionNode:forType(_g.sling.model.ThisDataTypeNode._construct0(_g.sling.model.ThisDataTypeNode._create()))
										do xob:addToParameters(_g.sling.model.SymbolExpressionNode:forName("data")) end
										do _g.sling.util.FunctionUtil:addStatement(forData, _g.sling.model.ReturnStatementNode:forExpression(xob)) end
										do cdecl:addNode(forData) end
									end
								end
								do
									local gfi = _g.sling.model.FunctionDeclarationNode:forName("getFieldInformation", false)
									do _g.sling.util.ModifierUtil:addCommonModifier(gfi, _g.sling.model.Modifier.PUBLIC) end
									do _g.sling.util.ModifierUtil:addCommonModifier(gfi, _g.sling.model.Modifier.OVERRIDE) end
									do gfi:setReturnType(_g.sling.model.VectorDataTypeNode:forPrimaryType(_g.sling.model.ReferenceDataTypeNode:forName("DynamicModelField")), false) end
									do
										local vdinit = _g.sling.model.CreateObjectExpressionNode:forType(_g.sling.model.VectorDataTypeNode:forPrimaryType(_g.sling.model.ReferenceDataTypeNode:forName("DynamicModelField")))
										local vd = _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.VectorDataTypeNode:forPrimaryType(_g.sling.model.ReferenceDataTypeNode:forName("DynamicModelField")), "v", vdinit)
										do _g.sling.util.FunctionUtil:addStatement(gfi, vd) end
										if fields ~= nil then
											local n4 = 0
											local m4 = _g.jk.lang.Vector:getSize(fields)
											do
												n4 = 0
												while n4 < m4 do
													local field = fields[n4 + 1]
													if field ~= nil then
														do _g.sling.util.FunctionUtil:addStatement(gfi, field) end
													end
													do n4 = n4 + 1 end
												end
											end
										end
										do _g.sling.util.FunctionUtil:addStatement(gfi, _g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.SymbolExpressionNode:forName("v"))) end
										do cdecl:addNode(gfi) end
									end
								end
								do
									local metadata = model:getMetadata()
									if _g.jk.lang.String:isNotEmpty(metadata) then
										local gmm = _g.sling.model.FunctionDeclarationNode:forName("getModelMetadata", false)
										do _g.sling.util.ModifierUtil:addCommonModifier(gmm, _g.sling.model.Modifier.PUBLIC) end
										do _g.sling.util.ModifierUtil:addCommonModifier(gmm, _g.sling.model.Modifier.OVERRIDE) end
										do gmm:setReturnType(_g.sling.model.StringDataTypeNode._construct0(_g.sling.model.StringDataTypeNode._create()), false) end
										do _g.sling.util.FunctionUtil:addStatement(gmm, _g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.StringLiteralExpressionNode:forValue(metadata))) end
										do cdecl:addNode(gmm) end
									end
									do model:replaceWith(cdecl, false) end
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

sling.compiler.LibraryName = {}
sling.compiler.LibraryName.__index = sling.compiler.LibraryName
_vm:set_metatable(sling.compiler.LibraryName, {})

function sling.compiler.LibraryName._create()
	local v = _vm:set_metatable({}, sling.compiler.LibraryName)
	return v
end

function sling.compiler.LibraryName:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.LibraryName'
	self['_isType.sling.compiler.LibraryName'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.namespace = nil
	self.name = nil
	self.version = nil
end

function sling.compiler.LibraryName:_construct0()
	sling.compiler.LibraryName._init(self)
	return self
end

function sling.compiler.LibraryName:asLibraryName(o)
	local str = _g.jk.lang.String:asString(o)
	if not (str ~= nil) then
		do return nil end
	end
	do
		local v = _g.sling.compiler.LibraryName:parse(str)
		if not (v ~= nil) then
			do _g.jk.lang.Error:throw("invalidLibraryName", str) end
		end
		do return v end
	end
end

function sling.compiler.LibraryName:asLibraryNameVector(o)
	local it = _g.jk.lang.DynamicObject:iterate(o)
	if not (it ~= nil) then
		do return nil end
	end
	do
		local v = {}
		while true do
			local oo = it:next()
			if not (oo ~= nil) then
				do break end
			end
			do
				local ff = _g.sling.compiler.LibraryName:asLibraryName(oo)
				if ff ~= nil then
					do _g.jk.lang.Vector:append(v, ff) end
				end
			end
		end
		do return v end
	end
end

function sling.compiler.LibraryName:parse(string)
	if not (string ~= nil) then
		do return nil end
	end
	do
		local namespace = nil
		local name = nil
		local version = nil
		local vals = _g.jk.lang.String:split(string, 58, 3)
		local c = _g.jk.lang.Vector:getSize(vals)
		if c == 2 then
			name = _g.jk.lang.Vector:get(vals, 0)
			version = _g.jk.lang.Vector:get(vals, 1)
		elseif c == 3 then
			namespace = _g.jk.lang.Vector:get(vals, 0)
			name = _g.jk.lang.Vector:get(vals, 1)
			version = _g.jk.lang.Vector:get(vals, 2)
		else
			do return nil end
		end
		if _g.jk.lang.String:isEmpty(namespace) then
			namespace = "eqela"
		end
		if not _g.jk.lang.String:isNotEmpty(name) then
			do return nil end
		end
		if not _g.jk.lang.String:isNotEmpty(version) then
			do return nil end
		end
		do
			local v = _g.sling.compiler.LibraryName._construct0(_g.sling.compiler.LibraryName._create())
			do v:setNamespace(namespace) end
			do v:setName(name) end
			do v:setVersion(version) end
			do return v end
		end
	end
end

function sling.compiler.LibraryName:toString()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if self.namespace ~= nil then
		do sb:appendString(self.namespace) end
	end
	do sb:appendCharacter(58) end
	if self.name ~= nil then
		do sb:appendString(self.name) end
	end
	do sb:appendCharacter(58) end
	if self.version ~= nil then
		do sb:appendString(self.version) end
	end
	do return sb:toString() end
end

function sling.compiler.LibraryName:getNamespace()
	do return self.namespace end
end

function sling.compiler.LibraryName:setNamespace(v)
	self.namespace = v
	do return self end
end

function sling.compiler.LibraryName:getName()
	do return self.name end
end

function sling.compiler.LibraryName:setName(v)
	self.name = v
	do return self end
end

function sling.compiler.LibraryName:getVersion()
	do return self.version end
end

function sling.compiler.LibraryName:setVersion(v)
	self.version = v
	do return self end
end

sling.compiler.PropertyDeclarationExpander = {}
sling.compiler.PropertyDeclarationExpander.__index = sling.compiler.PropertyDeclarationExpander
_vm:set_metatable(sling.compiler.PropertyDeclarationExpander, {})

function sling.compiler.PropertyDeclarationExpander._create()
	local v = _vm:set_metatable({}, sling.compiler.PropertyDeclarationExpander)
	return v
end

function sling.compiler.PropertyDeclarationExpander:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.PropertyDeclarationExpander'
	self['_isType.sling.compiler.PropertyDeclarationExpander'] = true
end

function sling.compiler.PropertyDeclarationExpander:_construct0()
	sling.compiler.PropertyDeclarationExpander._init(self)
	return self
end

function sling.compiler.PropertyDeclarationExpander:modifyName(prefix, name)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString(prefix) end
	do
		local c0 = _g.jk.lang.String:getChar(name, 0)
		if c0 >= 97 and c0 <= 122 then
			do sb:appendCharacter(c0 - 97 + 65) end
			do sb:appendString(_g.jk.lang.String:getEndOfString(name, 1)) end
		else
			do sb:appendString(name) end
		end
		do return sb:toString() end
	end
end

function sling.compiler.PropertyDeclarationExpander:createMethodName(prefix, name, pp, decl)
	local fname = self:modifyName(prefix, name)
	if _g.sling.util.EntityUtil:methodExists(pp, fname) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Property method `" .. _g.jk.lang.String:safeString(fname) .. "' already exists in parent entity. Unable to generate method.", decl, nil):addRelatedMessage("This is the parent entity", pp))
	end
	do return fname end
end

function sling.compiler.PropertyDeclarationExpander:execute(ctx, root, resolver)
	local array = _g.sling.util.NodeFinder:findNodesOfType(root, "class:sling.model.PropertyDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local vd = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.PropertyDeclarationNode')
				if vd ~= nil then
					local name = vd:getName()
					if _g.jk.lang.String:isEmpty(name) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Empty property name", vd, nil))
					end
					do
						local dt = vd:getType()
						if dt == nil or (_vm:to_table_with_key(dt, '_isType.sling.model.AutomaticDataTypeNode') ~= nil) then
							local init = vd:getInitializer()
							if not (init ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unable to determine declaration data type (missing initializer)", vd, nil))
							end
							dt = _g.sling.util.ExpressionUtil:getExpressionDataType(init, nil)
						end
						do
							local parentNode = vd:getParent()
							if not (parentNode ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Declaration has no parent", vd, nil))
							end
							do
								local pp = _vm:to_table_with_key(parentNode, '_isType.sling.model.EntityDeclarationNode')
								if not (pp ~= nil) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Property declaration is not enclosed inside an entity", vd, nil):addRelatedMessage("This is the parent of the declaration", parentNode))
								end
								do
									local gets = {}
									local sets = {}
									local willsets = {}
									local didsets = {}
									local array2 = _g.sling.util.PropertyUtil:getBodyNodes(vd)
									if array2 ~= nil then
										local n2 = 0
										local m2 = _g.jk.lang.Vector:getSize(array2)
										do
											n2 = 0
											while n2 < m2 do
												local child = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.common.NodeObject')
												if child ~= nil then
													if (_vm:to_table_with_key(child, '_isType.sling.model.PropertyGetFunctionDeclarationNode') ~= nil) then
														do _g.jk.lang.Vector:append(gets, child) end
													elseif (_vm:to_table_with_key(child, '_isType.sling.model.PropertyWillSetFunctionDeclarationNode') ~= nil) then
														do _g.jk.lang.Vector:append(willsets, child) end
													elseif (_vm:to_table_with_key(child, '_isType.sling.model.PropertyDidSetFunctionDeclarationNode') ~= nil) then
														do _g.jk.lang.Vector:append(didsets, child) end
													elseif (_vm:to_table_with_key(child, '_isType.sling.model.PropertySetFunctionDeclarationNode') ~= nil) then
														do _g.jk.lang.Vector:append(sets, child) end
													else
														_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported property body member: `" .. _g.jk.lang.String:safeString(child:getNodeTypeName()) .. "'", child, nil))
													end
												end
												do n2 = n2 + 1 end
											end
										end
									end
									do
										local gettername = nil
										if gets ~= nil then
											local n3 = 0
											local m3 = _g.jk.lang.Vector:getSize(gets)
											do
												n3 = 0
												while n3 < m3 do
													local child = gets[n3 + 1]
													if child ~= nil then
														gettername = self:createMethodName("get", name, pp, vd)
														do
															local fd = _g.sling.model.FunctionDeclarationNode:forName(gettername, false)
															do fd:setSource(child:getSource()) end
															do fd:setBody(child:exportBody(), false) end
															do fd:setReturnType(child:exportReturnType(), false) end
															do fd:setModifiers(child:exportModifiers(), false) end
															do _g.sling.util.ModifierUtil:addAnnotationModifier(fd, "propertyMethod") end
															do pp:addNode(fd) end
														end
													end
													do n3 = n3 + 1 end
												end
											end
										end
										do
											local willsetfns = {}
											local willsetn = 1
											if willsets ~= nil then
												local n4 = 0
												local m4 = _g.jk.lang.Vector:getSize(willsets)
												do
													n4 = 0
													while n4 < m4 do
														local child = willsets[n4 + 1]
														if child ~= nil then
															local mn = "onWillSet"
															if willsetn > 1 then
																mn = _g.jk.lang.String:safeString(mn) .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(willsetn))
															end
															mn = self:createMethodName(mn, name, pp, vd)
															do
																local fd = _g.sling.model.FunctionDeclarationNode:forName(mn, false)
																do fd:setSource(child:getSource()) end
																do fd:setBody(child:exportBody(), false) end
																do fd:setParameters(child:exportParameters(), false) end
																do fd:setReturnType(_g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()), false) end
																do fd:setModifiers(child:exportModifiers(), false) end
																do _g.sling.util.ModifierUtil:addAnnotationModifier(fd, "propertyMethod") end
																do pp:addNode(fd) end
																do willsetn = willsetn + 1 end
																do _g.jk.lang.Vector:append(willsetfns, mn) end
															end
														end
														do n4 = n4 + 1 end
													end
												end
											end
											do
												local didsetfns = {}
												local didsetn = 1
												if didsets ~= nil then
													local n5 = 0
													local m5 = _g.jk.lang.Vector:getSize(didsets)
													do
														n5 = 0
														while n5 < m5 do
															local child = didsets[n5 + 1]
															if child ~= nil then
																local mn = "onDidSet"
																if didsetn > 1 then
																	mn = _g.jk.lang.String:safeString(mn) .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(didsetn))
																end
																mn = self:createMethodName(mn, name, pp, vd)
																do
																	local fd = _g.sling.model.FunctionDeclarationNode:forName(mn, false)
																	do fd:setSource(child:getSource()) end
																	do fd:setBody(child:exportBody(), false) end
																	do fd:setParameters(child:exportParameters(), false) end
																	do fd:setReturnType(_g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()), false) end
																	do fd:setModifiers(child:exportModifiers(), false) end
																	do _g.sling.util.ModifierUtil:addAnnotationModifier(fd, "propertyMethod") end
																	do pp:addNode(fd) end
																	do didsetn = didsetn + 1 end
																	do _g.jk.lang.Vector:append(didsetfns, mn) end
																end
															end
															do n5 = n5 + 1 end
														end
													end
												end
												if sets ~= nil then
													local n6 = 0
													local m6 = _g.jk.lang.Vector:getSize(sets)
													do
														n6 = 0
														while n6 < m6 do
															local child = sets[n6 + 1]
															if child ~= nil then
																local dosetfd = _g.sling.model.FunctionDeclarationNode:forName(self:createMethodName("doSet", name, pp, vd), false)
																do dosetfd:setSource(child:getSource()) end
																do dosetfd:setBody(child:exportBody(), false) end
																do dosetfd:setParameters(child:exportParameters(), false) end
																do dosetfd:setReturnType(_g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()), false) end
																do dosetfd:setModifiers(child:exportModifiers(), false) end
																do _g.sling.util.ModifierUtil:addAnnotationModifier(dosetfd, "propertyMethod") end
																do pp:addNode(dosetfd) end
																do
																	local setname = self:createMethodName("set", name, pp, vd)
																	local fd = _g.sling.model.FunctionDeclarationNode:forName(setname, false)
																	do fd:setSource(child:getSource()) end
																	do fd:setReturnType(_g.sling.util.DataTypeUtil:dupAsDataType(vd:getType()), false) end
																	do fd:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.util.DataTypeUtil:dupAsDataType(vd:getType()), "v", nil)) end
																	do
																		local body = fd:getCreateBody()
																		if _g.jk.lang.Vector:getSize(didsetfns) > 0 then
																			if _g.jk.lang.String:isEmpty(gettername) then
																				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No gettername", vd, nil))
																			end
																			do body:addNode(_g.sling.model.VariableDeclarationNode:instance(_g.sling.util.DataTypeUtil:dupAsDataType(vd:getType()), "ov", _g.sling.model.FunctionCallExpressionNode:forName(gettername))) end
																		end
																		if willsetfns ~= nil then
																			local n7 = 0
																			local m7 = _g.jk.lang.Vector:getSize(willsetfns)
																			do
																				n7 = 0
																				while n7 < m7 do
																					local willsetfn = willsetfns[n7 + 1]
																					if willsetfn ~= nil then
																						local wsfc = _g.sling.model.FunctionCallExpressionNode:forName(willsetfn)
																						do wsfc:addToParameters(_g.sling.model.SymbolExpressionNode:forName("v")) end
																						do body:addNode(wsfc) end
																					end
																					do n7 = n7 + 1 end
																				end
																			end
																		end
																		do
																			local setterfc = _g.sling.model.FunctionCallExpressionNode:forName(dosetfd:getName())
																			do setterfc:addToParameters(_g.sling.model.SymbolExpressionNode:forName("v")) end
																			do body:addNode(setterfc) end
																			if didsetfns ~= nil then
																				local n8 = 0
																				local m8 = _g.jk.lang.Vector:getSize(didsetfns)
																				do
																					n8 = 0
																					while n8 < m8 do
																						local didsetfn = didsetfns[n8 + 1]
																						if didsetfn ~= nil then
																							local dsfc = _g.sling.model.FunctionCallExpressionNode:forName(didsetfn)
																							do dsfc:addToParameters(_g.sling.model.SymbolExpressionNode:forName("ov")) end
																							do body:addNode(dsfc) end
																						end
																						do n8 = n8 + 1 end
																					end
																				end
																			end
																			do body:addNode(_g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.SymbolExpressionNode:forName("v"))) end
																			do pp:addNode(fd) end
																		end
																	end
																end
															end
															do n6 = n6 + 1 end
														end
													end
												end
												do _g.sling.util.NodeUtil:removeNode(vd) end
											end
										end
									end
								end
							end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do
		local array3 = _g.sling.util.NodeFinder:findNodesOfType(root, "class:sling.model.SymbolNode", false, true, false)
		if array3 ~= nil then
			local n9 = 0
			local m9 = _g.jk.lang.Vector:getSize(array3)
			do
				n9 = 0
				while n9 < m9 do
					local symbol = _vm:to_table_with_key(array3[n9 + 1], '_isType.sling.model.SymbolNode')
					if symbol ~= nil then
						local propdec = _vm:to_table_with_key(symbol:getBinding(), '_isType.sling.model.PropertyDeclarationNode')
						if not (propdec ~= nil) then
							goto _continue70
						end
						do
							local xpr = _vm:to_table_with_key(symbol:getParent(), '_isType.sling.model.SymbolExpressionNode')
							if not (xpr ~= nil) then
								goto _continue70
							end
							do
								local assx = self:getAssignmentExpressionForSymbolIfLeftValue(xpr)
								if assx ~= nil then
									local left = assx:exportLeft()
									local right = assx:exportRight()
									local fc = _g.sling.model.FunctionCallExpressionNode._construct0(_g.sling.model.FunctionCallExpressionNode._create())
									do fc:setExpression(left, false) end
									do fc:addToParameters(right) end
									do _g.sling.util.NodeUtil:replaceNode(assx, fc) end
									do _g.sling.util.SymbolUtil:setName(symbol, self:modifyName("set", _g.sling.util.SymbolUtil:getSymbolName(symbol))) end
									do symbol:setBinding(nil, nil) end
									do xpr:setResolvedDataType(nil, false) end
									if resolver ~= nil then
										do resolver:resolveExpression(xpr) end
									end
								else
									local rx = xpr
									local max = _vm:to_table_with_key(xpr:getParent(), '_isType.sling.model.MemberAccessExpressionNode')
									if max ~= nil then
										if max:getChildExpression() == xpr then
											rx = max
										elseif max:getParentExpression() == xpr then
											local maxp = _vm:to_table_with_key(max:getParent(), '_isType.sling.model.MemberAccessExpressionNode')
											if not (maxp ~= nil) then
												rx = xpr
											else
												if maxp:getChildExpression() ~= max then
													_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Corrupted member access expression tree. Cannot turn into function call.", max, nil))
												end
												do
													local top = _g.sling.model.MemberAccessExpressionNode:findFromChild(max)
													if not (top ~= nil) then
														_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Corrupted member access expression tree: Unable to find child from max", max, nil))
													end
													do maxp:exportChildExpression() end
													do _g.sling.util.NodeUtil:replaceAndExport(top, max) end
													do maxp:setChildExpression(max:exportParentExpression(), false) end
													do
														local fc = _g.sling.model.FunctionCallExpressionNode._construct0(_g.sling.model.FunctionCallExpressionNode._create())
														do fc:setExpression(top, false) end
														do max:setParentExpression(fc, false) end
														rx = nil
													end
												end
											end
										end
									end
									if rx ~= nil then
										local fc = _g.sling.model.FunctionCallExpressionNode._construct0(_g.sling.model.FunctionCallExpressionNode._create())
										do _g.sling.util.NodeUtil:replaceAndExport(rx, fc) end
										do fc:setExpression(rx, false) end
									end
									do _g.sling.util.SymbolUtil:setName(symbol, self:modifyName("get", _g.sling.util.SymbolUtil:getSymbolName(symbol))) end
									do symbol:setBinding(nil, nil) end
									do xpr:setResolvedDataType(nil, false) end
									if resolver ~= nil then
										do resolver:resolveExpression(xpr) end
									end
								end
							end
						end
					end
					::_continue70::
					do n9 = n9 + 1 end
				end
			end
		end
		if resolver ~= nil then
			do resolver:execute(root) end
		end
	end
end

function sling.compiler.PropertyDeclarationExpander:getAssignmentExpressionForSymbolIfLeftValue(xpr)
	if not (xpr ~= nil) then
		do return nil end
	end
	do
		local ass1 = _vm:to_table_with_key(xpr:getParent(), '_isType.sling.model.AssignmentExpressionNode')
		if ass1 ~= nil and ass1:getLeft() == xpr then
			do return ass1 end
		end
		do
			local maxbot = _vm:to_table_with_key(xpr:getParent(), '_isType.sling.model.MemberAccessExpressionNode')
			if maxbot ~= nil and maxbot:getChildExpression() == xpr then
				local max = _g.sling.model.MemberAccessExpressionNode:findFromChild(xpr)
				if max ~= nil then
					local ass2 = _vm:to_table_with_key(max:getParent(), '_isType.sling.model.AssignmentExpressionNode')
					if ass2 ~= nil and ass2:getLeft() == max then
						do return ass2 end
					end
				end
			end
			do return nil end
		end
	end
end

sling.compiler.MacroHandler = {}
sling.compiler.MacroHandler.__index = sling.compiler.MacroHandler
_vm:set_metatable(sling.compiler.MacroHandler, {})

function sling.compiler.MacroHandler._create()
	local v = _vm:set_metatable({}, sling.compiler.MacroHandler)
	return v
end

function sling.compiler.MacroHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.MacroHandler'
	self['_isType.sling.compiler.MacroHandler'] = true
	self.expandMacroCalls = true
	self.deleteMacroDeclarations = true
end

function sling.compiler.MacroHandler:_construct0()
	sling.compiler.MacroHandler._init(self)
	return self
end

sling.compiler.MacroHandler.CallInfo = {}
sling.compiler.MacroHandler.CallInfo.__index = sling.compiler.MacroHandler.CallInfo
_vm:set_metatable(sling.compiler.MacroHandler.CallInfo, {})

function sling.compiler.MacroHandler.CallInfo._create()
	local v = _vm:set_metatable({}, sling.compiler.MacroHandler.CallInfo)
	return v
end

function sling.compiler.MacroHandler.CallInfo:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.MacroHandler.CallInfo'
	self['_isType.sling.compiler.MacroHandler.CallInfo'] = true
	self.call = nil
	self.decl = nil
end

function sling.compiler.MacroHandler.CallInfo:_construct0()
	sling.compiler.MacroHandler.CallInfo._init(self)
	return self
end

function sling.compiler.MacroHandler.CallInfo:getCall()
	do return self.call end
end

function sling.compiler.MacroHandler.CallInfo:setCall(v)
	self.call = v
	do return self end
end

function sling.compiler.MacroHandler.CallInfo:getDecl()
	do return self.decl end
end

function sling.compiler.MacroHandler.CallInfo:setDecl(v)
	self.decl = v
	do return self end
end

sling.compiler.MacroHandler.MyVisitor = _g.sling.common.NodeVisitor._create()
sling.compiler.MacroHandler.MyVisitor.__index = sling.compiler.MacroHandler.MyVisitor
_vm:set_metatable(sling.compiler.MacroHandler.MyVisitor, {
	__index = _g.sling.common.NodeVisitor
})

function sling.compiler.MacroHandler.MyVisitor._create()
	local v = _vm:set_metatable({}, sling.compiler.MacroHandler.MyVisitor)
	return v
end

function sling.compiler.MacroHandler.MyVisitor:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.MacroHandler.MyVisitor'
	self['_isType.sling.compiler.MacroHandler.MyVisitor'] = true
	self.resolver = nil
	self.decls = {}
	self.calls = {}
end

function sling.compiler.MacroHandler.MyVisitor:_construct0()
	sling.compiler.MacroHandler.MyVisitor._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.compiler.MacroHandler.MyVisitor:tryGetDeclaration(fcx)
	if not (fcx ~= nil) then
		do return nil end
	end
	do
		local xpr = fcx:getExpression()
		if not (xpr ~= nil) then
			do return nil end
		end
		do
			local names = _g.sling.util.SymbolUtil:expressionToSymbolNames(xpr)
			if not (names ~= nil) then
				do return nil end
			end
			do
				local targetr = self.resolver:tryResolveNames(xpr:getParent(), names)
				if not (targetr ~= nil) then
					do return nil end
				end
				do
					local target = targetr:getNode()
					if not (target ~= nil) then
						do return nil end
					end
					do
						local parent = _vm:to_table_with_key(target:getParent(), '_isType.sling.common.ContainerNode')
						if not (parent ~= nil) then
							do return nil end
						end
						do
							local fcpc = _g.jk.lang.Vector:getSize(fcx:getParameters())
							local array = parent:getNodeIndexForName(_g.jk.lang.Vector:getLast(names))
							if array ~= nil then
								local n = 0
								local m = _g.jk.lang.Vector:getSize(array)
								do
									n = 0
									while n < m do
										local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FunctionDeclarationNode')
										if node ~= nil then
											if _g.jk.lang.Vector:getSize(node:getParameters()) == fcpc then
												do return node end
											end
										end
										do n = n + 1 end
									end
								end
							end
							do return nil end
						end
					end
				end
			end
		end
	end
end

function sling.compiler.MacroHandler.MyVisitor:visit(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
		local fdecl = node
		if _g.sling.util.ModifierUtil:hasAnnotationModifier(fdecl, "macro") then
			do _g.jk.lang.Vector:append(self.decls, fdecl) end
		end
	elseif (_vm:to_table_with_key(node, '_isType.sling.model.FunctionCallExpressionNode') ~= nil) then
		local cd = self:tryGetDeclaration(node)
		if cd ~= nil and _g.sling.util.ModifierUtil:hasAnnotationModifier(cd, "macro") then
			local ci = _g.sling.compiler.MacroHandler.CallInfo._construct0(_g.sling.compiler.MacroHandler.CallInfo._create())
			do ci:setCall(node) end
			do ci:setDecl(cd) end
			do _g.jk.lang.Vector:append(self.calls, ci) end
			do self:setSkipChildren(true) end
		end
	end
	do return true end
end

function sling.compiler.MacroHandler.MyVisitor:getResolver()
	do return self.resolver end
end

function sling.compiler.MacroHandler.MyVisitor:setResolver(v)
	self.resolver = v
	do return self end
end

function sling.compiler.MacroHandler.MyVisitor:getDecls()
	do return self.decls end
end

function sling.compiler.MacroHandler.MyVisitor:setDecls(v)
	self.decls = v
	do return self end
end

function sling.compiler.MacroHandler.MyVisitor:getCalls()
	do return self.calls end
end

function sling.compiler.MacroHandler.MyVisitor:setCalls(v)
	self.calls = v
	do return self end
end

sling.compiler.MacroHandler.AdjustExpandedMacroVisitor = _g.sling.common.NodeVisitor._create()
sling.compiler.MacroHandler.AdjustExpandedMacroVisitor.__index = sling.compiler.MacroHandler.AdjustExpandedMacroVisitor
_vm:set_metatable(sling.compiler.MacroHandler.AdjustExpandedMacroVisitor, {
	__index = _g.sling.common.NodeVisitor
})

function sling.compiler.MacroHandler.AdjustExpandedMacroVisitor._create()
	local v = _vm:set_metatable({}, sling.compiler.MacroHandler.AdjustExpandedMacroVisitor)
	return v
end

function sling.compiler.MacroHandler.AdjustExpandedMacroVisitor:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.MacroHandler.AdjustExpandedMacroVisitor'
	self['_isType.sling.compiler.MacroHandler.AdjustExpandedMacroVisitor'] = true
	self.call = nil
	self.decl = nil
	self.object = nil
	self.symbols = {}
	self.objectrefs = {}
	self.decls = {}
	self.datatypes = {}
	self.literals = {}
end

function sling.compiler.MacroHandler.AdjustExpandedMacroVisitor:_construct0()
	sling.compiler.MacroHandler.AdjustExpandedMacroVisitor._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.compiler.MacroHandler.AdjustExpandedMacroVisitor:visit(node)
	do node:setSource(nil) end
	if (_vm:to_table_with_key(node, '_isType.sling.model.SymbolExpressionNode') ~= nil) then
		do _g.jk.lang.Vector:append(self.symbols, node) end
	elseif (_vm:to_table_with_key(node, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
		do _g.jk.lang.Vector:append(self.datatypes, node) end
	elseif (_vm:to_table_with_key(node, '_isType.sling.common.NamedNode') ~= nil) then
		local name = node:getNodeName()
		if name ~= nil and _g.jk.lang.String:startsWith(name, "__", 0) and _g.jk.lang.String:endsWith(name, "__") then
			do _g.jk.lang.Vector:append(self.decls, node) end
		end
	elseif (_vm:to_table_with_key(node, '_isType.sling.model.StringLiteralExpressionNode') ~= nil) then
		do _g.jk.lang.Vector:append(self.literals, node) end
	end
	do return true end
end

function sling.compiler.MacroHandler.AdjustExpandedMacroVisitor:getParameterExpressionForName(rn)
	local n = 0
	local array = self.decl:getParameters()
	if array ~= nil then
		local n2 = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n2 = 0
			while n2 < m do
				local vd = _vm:to_table_with_key(array[n2 + 1], '_isType.sling.model.VariableDeclarationNode')
				if vd ~= nil then
					if not (rn == vd:getNodeName()) then
						do n = n + 1 end
						goto _continue71
					end
					do return self.call:getParameter(n) end
				end
				::_continue71::
				do n2 = n2 + 1 end
			end
		end
	end
	do return nil end
end

function sling.compiler.MacroHandler.AdjustExpandedMacroVisitor:getNameForExpression(par)
	local parse = _vm:to_table_with_key(par, '_isType.sling.model.SymbolExpressionNode')
	if not (parse ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Parameter must be a symbol expression", par, nil))
	end
	do
		local nname = _g.sling.util.SymbolUtil:getSymbolName(parse:getSymbol())
		if _g.jk.lang.String:isEmpty(nname) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Empty name", par, nil))
		end
		do return nname end
	end
end

function sling.compiler.MacroHandler.AdjustExpandedMacroVisitor:processLiterals(token, entity)
	if self.literals ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.literals)
		do
			n = 0
			while n < m do
				local literal = self.literals[n + 1]
				if literal ~= nil then
					if token ~= nil and _g.sling.util.ModifierUtil:hasAnnotationModifier(literal, "preprocessorLineValue") then
						do literal:setValue(_g.jk.lang.String:forInteger(token:getSourceLineNumber() + 1)) end
					elseif token ~= nil and _g.sling.util.ModifierUtil:hasAnnotationModifier(literal, "preprocessorColumnValue") then
						do literal:setValue(_g.jk.lang.String:forInteger(token:getSourceColumnNumber() + 1)) end
					elseif token ~= nil and _g.sling.util.ModifierUtil:hasAnnotationModifier(literal, "preprocessorFileValue") then
						local name = nil
						local tt = _vm:to_table_with_key(token, '_isType.sling.common.Token')
						if tt ~= nil then
							local ts = tt.source
							if ts ~= nil then
								local tsf = ts:getFile()
								if tsf ~= nil then
									name = tsf:getBasename()
								end
							end
						end
						if _g.jk.lang.String:isEmpty(name) then
							name = token:getSourceName()
						end
						do literal:setValue(name) end
					elseif entity ~= nil and _g.sling.util.ModifierUtil:hasAnnotationModifier(literal, "preprocessorThisValue") then
						do literal:setValue(entity:getName()) end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.compiler.MacroHandler.AdjustExpandedMacroVisitor:processSymbols()
	if self.symbols ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.symbols)
		do
			n = 0
			while n < m do
				local node = self.symbols[n + 1]
				if node ~= nil then
					local names = _g.sling.util.SymbolUtil:getSymbolNames(node:getSymbol())
					if not (names ~= nil) then
						goto _continue72
					end
					if _g.jk.lang.Vector:getSize(names) ~= 1 then
						goto _continue72
					end
					do
						local name = _g.jk.lang.String:forObject(_g.jk.lang.Vector:get(names, 0))
						if _g.jk.lang.String:isEmpty(name) then
							goto _continue72
						end
						if _g.jk.lang.String:startsWith(name, "__", 0) and _g.jk.lang.String:endsWith(name, "__") then
							local rn = _g.jk.lang.String:getSubString(name, 2, _g.jk.lang.String:getLength(name) - 4)
							if _g.jk.lang.String:isEmpty(rn) == false then
								local par = self:getParameterExpressionForName(rn)
								if par ~= nil then
									local nname = self:getNameForExpression(par)
									do node:setSymbol(_g.sling.model.SymbolNode:forName(nname), false) end
									goto _continue72
								end
							end
						end
						do
							local nxp = self:getParameterExpressionForName(name)
							if not (nxp ~= nil) then
								goto _continue72
							end
							do
								local pdup = _g.sling.util.ExpressionUtil:dupAsExpression(nxp)
								do _g.sling.util.NodeUtil:replaceNode(node, pdup) end
							end
						end
					end
				end
				::_continue72::
				do n = n + 1 end
			end
		end
	end
	if self.datatypes ~= nil then
		local n2 = 0
		local m2 = _g.jk.lang.Vector:getSize(self.datatypes)
		do
			n2 = 0
			while n2 < m2 do
				local node = self.datatypes[n2 + 1]
				if node ~= nil then
					local symbol = node:getSymbol()
					if not (symbol ~= nil) then
						goto _continue73
					end
					do
						local names = _g.sling.util.SymbolUtil:getSymbolNames(symbol)
						if not (names ~= nil) then
							goto _continue73
						end
						if _g.jk.lang.Vector:getSize(names) ~= 1 then
							goto _continue73
						end
						do
							local name = _g.jk.lang.String:forObject(_g.jk.lang.Vector:get(names, 0))
							if _g.jk.lang.String:isEmpty(name) then
								goto _continue73
							end
							if _g.jk.lang.String:startsWith(name, "__", 0) and _g.jk.lang.String:endsWith(name, "__") then
								local rn = _g.jk.lang.String:getSubString(name, 2, _g.jk.lang.String:getLength(name) - 4)
								if _g.jk.lang.String:isEmpty(rn) == false then
									local par = self:getParameterExpressionForName(rn)
									if par ~= nil then
										local nname = self:getNameForExpression(par)
										do node:setSymbol(_g.sling.model.SymbolNode:forName(nname), false) end
										goto _continue73
									end
								end
							end
						end
					end
				end
				::_continue73::
				do n2 = n2 + 1 end
			end
		end
	end
	if self.decls ~= nil then
		local n3 = 0
		local m3 = _g.jk.lang.Vector:getSize(self.decls)
		do
			n3 = 0
			while n3 < m3 do
				local nn = self.decls[n3 + 1]
				if nn ~= nil then
					local name = nn:getNodeName()
					if name == nil then
						goto _continue74
					end
					do
						local rn = _g.jk.lang.String:getSubString(name, 2, _g.jk.lang.String:getLength(name) - 4)
						if _g.jk.lang.String:isEmpty(rn) then
							goto _continue74
						end
						do
							local par = self:getParameterExpressionForName(rn)
							if par == nil then
								goto _continue74
							end
							do
								local nname = self:getNameForExpression(par)
								do nn:renameNode(nname) end
							end
						end
					end
				end
				::_continue74::
				do n3 = n3 + 1 end
			end
		end
	end
	if self.objectrefs ~= nil then
		local n4 = 0
		local m4 = _g.jk.lang.Vector:getSize(self.objectrefs)
		do
			n4 = 0
			while n4 < m4 do
				local ref = self.objectrefs[n4 + 1]
				if ref ~= nil then
					local odup = _vm:to_table_with_key(self.object:dup(), '_isType.sling.model.ExpressionNode')
					if odup == nil then
						goto _continue75
					end
					do _g.sling.util.NodeUtil:replaceNode(ref, odup) end
				end
				::_continue75::
				do n4 = n4 + 1 end
			end
		end
	end
end

function sling.compiler.MacroHandler.AdjustExpandedMacroVisitor:getCall()
	do return self.call end
end

function sling.compiler.MacroHandler.AdjustExpandedMacroVisitor:setCall(v)
	self.call = v
	do return self end
end

function sling.compiler.MacroHandler.AdjustExpandedMacroVisitor:getDecl()
	do return self.decl end
end

function sling.compiler.MacroHandler.AdjustExpandedMacroVisitor:setDecl(v)
	self.decl = v
	do return self end
end

function sling.compiler.MacroHandler.AdjustExpandedMacroVisitor:getObject()
	do return self.object end
end

function sling.compiler.MacroHandler.AdjustExpandedMacroVisitor:setObject(v)
	self.object = v
	do return self end
end

function sling.compiler.MacroHandler:getParentExpression(call)
	if not (call ~= nil) then
		do return nil end
	end
	do
		local xpr = _vm:to_table_with_key(call:getExpression(), '_isType.sling.model.MemberAccessExpressionNode')
		if not (xpr ~= nil) then
			do return nil end
		end
		do
			local xdup = _vm:to_table_with_key(xpr:dup(), '_isType.sling.model.MemberAccessExpressionNode')
			if not (xdup ~= nil) then
				do return nil end
			end
			do return xdup:removeLastNode() end
		end
	end
end

function sling.compiler.MacroHandler:substituteExpressionMacro(call, decl, body)
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expression macros: Not implemented.", call, nil))
end

function sling.compiler.MacroHandler:substituteStatementMacro(visitor, call, decl, body)
	local pp = _vm:to_table_with_key(call:getParent(), '_isType.sling.model.BlockNode')
	if not (pp ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Statement macro was called in an invalid context (not inside a block)", call, nil))
	end
	do
		local bdup = _g.sling.util.NodeUtil:dupBlock(body)
		local av = _g.sling.compiler.MacroHandler.AdjustExpandedMacroVisitor._construct0(_g.sling.compiler.MacroHandler.AdjustExpandedMacroVisitor._create())
		do av:setCall(call) end
		do av:setObject(self:getParentExpression(call)) end
		do av:setDecl(decl) end
		do bdup:accept(av) end
		do av:processSymbols() end
		do av:processLiterals(call:getSource(), _g.sling.util.FindUtil:findNearestEntity(call)) end
		do
			local ip = pp:getInsertionPointForChild(call)
			if not (ip ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to get insertion point for node", call, nil))
			end
			do
				local array = bdup:exportNodes()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local ndup = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
							if ndup ~= nil then
								do ndup:setSource(call:getSource()) end
								if not ip:insertBefore(ndup) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to insert node", ndup, nil))
								end
								do ndup:accept(visitor) end
							end
							do n = n + 1 end
						end
					end
				end
				do _g.sling.util.NodeUtil:removeNode(call) end
			end
		end
	end
end

function sling.compiler.MacroHandler:substitute(ci, visitor)
	local call = ci:getCall()
	local decl = ci:getDecl()
	local body = decl:getBody()
	if not (body ~= nil) then
		body = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
	end
	do
		local dt = decl:getReturnType()
		if not (dt ~= nil) then
			dt = _g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create())
		end
		if (_vm:to_table_with_key(dt, '_isType.sling.model.VoidDataTypeNode') ~= nil) then
			do self:substituteStatementMacro(visitor, call, decl, body) end
		else
			do self:substituteExpressionMacro(call, decl, body) end
		end
	end
end

function sling.compiler.MacroHandler:execute(ctx, root, resolver, removeDeclarations)
	if not (root ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("MacroHandler: null root", nil, nil))
	end
	do
		local visitor = _g.sling.compiler.MacroHandler.MyVisitor._construct0(_g.sling.compiler.MacroHandler.MyVisitor._create())
		do visitor:setResolver(resolver) end
		do root:accept(visitor) end
		do
			local decls = visitor:getDecls()
			while true do
				local v2 = _g.sling.compiler.MacroHandler.MyVisitor._construct0(_g.sling.compiler.MacroHandler.MyVisitor._create())
				do v2:setResolver(resolver) end
				do
					local array = visitor:getCalls()
					if array ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(array)
						do
							n = 0
							while n < m do
								local call = array[n + 1]
								if call ~= nil then
									do self:substitute(call, v2) end
								end
								do n = n + 1 end
							end
						end
					end
					if _g.jk.lang.Vector:getSize(v2:getCalls()) < 1 then
						do break end
					end
					visitor = v2
				end
			end
			if removeDeclarations then
				if decls ~= nil then
					local n2 = 0
					local m2 = _g.jk.lang.Vector:getSize(decls)
					do
						n2 = 0
						while n2 < m2 do
							local decl = decls[n2 + 1]
							if decl ~= nil then
								do _g.sling.util.NodeUtil:removeNode(decl) end
							end
							do n2 = n2 + 1 end
						end
					end
				end
			end
		end
	end
end

function sling.compiler.MacroHandler:getExpandMacroCalls()
	do return self.expandMacroCalls end
end

function sling.compiler.MacroHandler:setExpandMacroCalls(v)
	self.expandMacroCalls = v
	do return self end
end

function sling.compiler.MacroHandler:getDeleteMacroDeclarations()
	do return self.deleteMacroDeclarations end
end

function sling.compiler.MacroHandler:setDeleteMacroDeclarations(v)
	self.deleteMacroDeclarations = v
	do return self end
end

sling.compiler.LinkableModuleInfo = {}
sling.compiler.LinkableModuleInfo.__index = sling.compiler.LinkableModuleInfo
_vm:set_metatable(sling.compiler.LinkableModuleInfo, {})

function sling.compiler.LinkableModuleInfo._create()
	local v = _vm:set_metatable({}, sling.compiler.LinkableModuleInfo)
	return v
end

function sling.compiler.LinkableModuleInfo:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.LinkableModuleInfo'
	self['_isType.sling.compiler.LinkableModuleInfo'] = true
	self.moduleId = nil
	self.linkTarget = nil
	self.timestamp = 0
	self.apifile = nil
	self.depfile = nil
	self.dependencies = nil
	self.header = nil
end

function sling.compiler.LinkableModuleInfo:_construct0()
	sling.compiler.LinkableModuleInfo._init(self)
	return self
end

function sling.compiler.LinkableModuleInfo:getModuleId()
	do return self.moduleId end
end

function sling.compiler.LinkableModuleInfo:setModuleId(v)
	self.moduleId = v
	do return self end
end

function sling.compiler.LinkableModuleInfo:getLinkTarget()
	do return self.linkTarget end
end

function sling.compiler.LinkableModuleInfo:setLinkTarget(v)
	self.linkTarget = v
	do return self end
end

function sling.compiler.LinkableModuleInfo:getTimestamp()
	do return self.timestamp end
end

function sling.compiler.LinkableModuleInfo:setTimestamp(v)
	self.timestamp = v
	do return self end
end

function sling.compiler.LinkableModuleInfo:getApifile()
	do return self.apifile end
end

function sling.compiler.LinkableModuleInfo:setApifile(v)
	self.apifile = v
	do return self end
end

function sling.compiler.LinkableModuleInfo:getDepfile()
	do return self.depfile end
end

function sling.compiler.LinkableModuleInfo:setDepfile(v)
	self.depfile = v
	do return self end
end

function sling.compiler.LinkableModuleInfo:getDependencies()
	do return self.dependencies end
end

function sling.compiler.LinkableModuleInfo:setDependencies(v)
	self.dependencies = v
	do return self end
end

function sling.compiler.LinkableModuleInfo:getHeader()
	do return self.header end
end

function sling.compiler.LinkableModuleInfo:setHeader(v)
	self.header = v
	do return self end
end

sling.compiler.WebApiExpanderForSympathy = {}
sling.compiler.WebApiExpanderForSympathy.__index = sling.compiler.WebApiExpanderForSympathy
_vm:set_metatable(sling.compiler.WebApiExpanderForSympathy, {})

function sling.compiler.WebApiExpanderForSympathy._create()
	local v = _vm:set_metatable({}, sling.compiler.WebApiExpanderForSympathy)
	return v
end

function sling.compiler.WebApiExpanderForSympathy:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.WebApiExpanderForSympathy'
	self['_isType.sling.compiler.WebApiExpanderForSympathy'] = true
	self.ctx = nil
end

function sling.compiler.WebApiExpanderForSympathy:_construct0()
	sling.compiler.WebApiExpanderForSympathy._init(self)
	return self
end

sling.compiler.WebApiExpanderForSympathy.WebApiClassFinder = _g.sling.common.NodeVisitor._create()
sling.compiler.WebApiExpanderForSympathy.WebApiClassFinder.__index = sling.compiler.WebApiExpanderForSympathy.WebApiClassFinder
_vm:set_metatable(sling.compiler.WebApiExpanderForSympathy.WebApiClassFinder, {
	__index = _g.sling.common.NodeVisitor
})

function sling.compiler.WebApiExpanderForSympathy.WebApiClassFinder._create()
	local v = _vm:set_metatable({}, sling.compiler.WebApiExpanderForSympathy.WebApiClassFinder)
	return v
end

function sling.compiler.WebApiExpanderForSympathy.WebApiClassFinder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.WebApiExpanderForSympathy.WebApiClassFinder'
	self['_isType.sling.compiler.WebApiExpanderForSympathy.WebApiClassFinder'] = true
	self.results = {}
end

function sling.compiler.WebApiExpanderForSympathy.WebApiClassFinder:_construct0()
	sling.compiler.WebApiExpanderForSympathy.WebApiClassFinder._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.compiler.WebApiExpanderForSympathy.WebApiClassFinder:visit(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.ClassDeclarationNode') ~= nil) and _g.sling.util.ModifierUtil:hasAnnotationModifier(node, "webapi") and _g.sling.util.ModifierUtil:hasAnnotationModifier(node, "nojkop") == false then
		do _g.jk.lang.Vector:append(self.results, node) end
	end
	do return true end
end

function sling.compiler.WebApiExpanderForSympathy.WebApiClassFinder:getResults()
	do return self.results end
end

function sling.compiler.WebApiExpanderForSympathy.WebApiClassFinder:setResults(v)
	self.results = v
	do return self end
end

sling.compiler.WebApiExpanderForSympathy.WebApiStatementFinder = _g.sling.common.NodeVisitor._create()
sling.compiler.WebApiExpanderForSympathy.WebApiStatementFinder.__index = sling.compiler.WebApiExpanderForSympathy.WebApiStatementFinder
_vm:set_metatable(sling.compiler.WebApiExpanderForSympathy.WebApiStatementFinder, {
	__index = _g.sling.common.NodeVisitor
})

function sling.compiler.WebApiExpanderForSympathy.WebApiStatementFinder._create()
	local v = _vm:set_metatable({}, sling.compiler.WebApiExpanderForSympathy.WebApiStatementFinder)
	return v
end

function sling.compiler.WebApiExpanderForSympathy.WebApiStatementFinder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.WebApiExpanderForSympathy.WebApiStatementFinder'
	self['_isType.sling.compiler.WebApiExpanderForSympathy.WebApiStatementFinder'] = true
	self.results = {}
end

function sling.compiler.WebApiExpanderForSympathy.WebApiStatementFinder:_construct0()
	sling.compiler.WebApiExpanderForSympathy.WebApiStatementFinder._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.compiler.WebApiExpanderForSympathy.WebApiStatementFinder:visit(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.ext.NSlingWebApiStatement') ~= nil) then
		do _g.jk.lang.Vector:append(self.results, node) end
	end
	do return true end
end

function sling.compiler.WebApiExpanderForSympathy.WebApiStatementFinder:getResults()
	do return self.results end
end

function sling.compiler.WebApiExpanderForSympathy.WebApiStatementFinder:setResults(v)
	self.results = v
	do return self end
end

function sling.compiler.WebApiExpanderForSympathy:createInvalidRequestAssert(xpr)
	local ass = _g.sling.model.AssertStatementNode:forChild(xpr)
	local errb = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("req"), "sendJSONObject", false)
	do errb:addToParameters(_g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("HTTPServerJSONResponse"), "forInvalidRequest", false)) end
	do ass:setErrorBlock(_g.sling.model.BlockNode:forStatement(errb), false) end
	do return ass end
end

function sling.compiler.WebApiExpanderForSympathy:createNotAuthenticatedAssert(xpr)
	local ass = _g.sling.model.AssertStatementNode:forChild(xpr)
	local errb = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("req"), "sendJSONObject", false)
	do errb:addToParameters(_g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("HTTPServerJSONResponse"), "forNotAuthenticated", false)) end
	do ass:setErrorBlock(_g.sling.model.BlockNode:forStatement(errb), false) end
	do return ass end
end

function sling.compiler.WebApiExpanderForSympathy:createValidateStringStatement(varname)
	local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("String"), "isNotEmpty", false)
	do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forName(varname)) end
	do return self:createInvalidRequestAssert(fc) end
end

function sling.compiler.WebApiExpanderForSympathy:processWebApiStatements(body)
	local sf = _g.sling.compiler.WebApiExpanderForSympathy.WebApiStatementFinder._construct0(_g.sling.compiler.WebApiExpanderForSympathy.WebApiStatementFinder._create())
	if not body:accept(sf) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("failure in statement finder", body, nil))
	end
	do
		local array = sf:getResults()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local statement = array[n + 1]
					if statement ~= nil then
						if (_vm:to_table_with_key(statement, '_isType.sling.model.ext.NSlingWebApiSampleRequest') ~= nil) or (_vm:to_table_with_key(statement, '_isType.sling.model.ext.NSlingWebApiSampleResponse') ~= nil) then
							if not statement:remove() then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to remove node", statement, nil))
							end
						elseif (_vm:to_table_with_key(statement, '_isType.sling.model.ext.NSlingWebApiInPathStatement') ~= nil) then
							local name = statement:getName()
							local type = statement:exportType()
							if type ~= nil then
								do _g.sling.common.RefLog:warning(self.ctx, "Data type is currently ignored", type) end
							end
							do
								local stmts = {}
								do _g.jk.lang.Vector:append(stmts, _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create()), name, _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("req"), "popResource", false))) end
								do _g.jk.lang.Vector:append(stmts, self:createValidateStringStatement(name)) end
								do _g.sling.util.NodeUtil:replaceWithNodes(statement, stmts) end
							end
						elseif (_vm:to_table_with_key(statement, '_isType.sling.model.ext.NSlingWebApiInQueryParameterStatement') ~= nil) then
							local name = statement:getName()
							local type = statement:exportType()
							if type ~= nil then
								do _g.sling.common.RefLog:warning(self.ctx, "Data type is currently ignored", type) end
							end
							do
								local stmts = {}
								local myfc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("req"), "getQueryParameter", false)
								do myfc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(name)) end
								do _g.jk.lang.Vector:append(stmts, _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create()), name, myfc)) end
								if statement:getOptional() == false then
									do _g.jk.lang.Vector:append(stmts, self:createValidateStringStatement(name)) end
								end
								do _g.sling.util.NodeUtil:replaceWithNodes(statement, stmts) end
							end
						elseif (_vm:to_table_with_key(statement, '_isType.sling.model.ext.NSlingWebApiInPostStatement') ~= nil) then
							local name = statement:getName()
							local type = statement:exportType()
							local stmts = {}
							local varname = _g.jk.lang.String:safeString(name) .. "BodyData"
							do _g.jk.lang.Vector:append(stmts, _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create()), varname, _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("req"), "getBodyJSONMap", false))) end
							do _g.jk.lang.Vector:append(stmts, self:createInvalidRequestAssert(_g.sling.model.SymbolExpressionNode:forName(varname))) end
							do _g.jk.lang.Vector:append(stmts, _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create()), name, _g.sling.model.CreateObjectExpressionNode:forType(type))) end
							do
								local fromxpr = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName(name), "fromJsonObject", false)
								do fromxpr:addToParameters(_g.sling.model.SymbolExpressionNode:forName(varname)) end
								do _g.jk.lang.Vector:append(stmts, self:createInvalidRequestAssert(fromxpr)) end
								do _g.sling.util.NodeUtil:replaceWithNodes(statement, stmts) end
							end
						elseif (_vm:to_table_with_key(statement, '_isType.sling.model.ext.NSlingWebApiInSessionStatement') ~= nil) then
							local name = statement:getName()
							local type = statement:exportType()
							local stmts = {}
							local reqfc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("req"), "getSession", false)
							local reqfcc = _g.sling.model.DynamicCastExpressionNode:instance(type, reqfc)
							do _g.jk.lang.Vector:append(stmts, _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create()), name, reqfcc)) end
							do _g.jk.lang.Vector:append(stmts, self:createNotAuthenticatedAssert(_g.sling.model.SymbolExpressionNode:forName(name))) end
							do _g.sling.util.NodeUtil:replaceWithNodes(statement, stmts) end
						elseif (_vm:to_table_with_key(statement, '_isType.sling.model.ext.NSlingWebApiOutErrorStatement') ~= nil) then
							local code = statement:exportCode()
							local data = statement:exportData()
							local stmts = {}
							local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("req"), "sendJSONObject", false)
							local fec = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("HTTPServerJSONResponse"), "forError", false)
							do fec:addToParameters(code) end
							do fc:addToParameters(fec) end
							do _g.jk.lang.Vector:append(stmts, fc) end
							if data ~= nil then
								do _g.sling.common.RefLog:warning(self.ctx, "Data parameter is currently ignored", data) end
							end
							do _g.sling.util.NodeUtil:replaceWithNodes(statement, stmts) end
						elseif (_vm:to_table_with_key(statement, '_isType.sling.model.ext.NSlingWebApiOutOkStatement') ~= nil) then
							local data = statement:exportData()
							local stmts = {}
							local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("req"), "sendJSONObject", false)
							local fec = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("HTTPServerJSONResponse"), "forOk", false)
							do fec:addToParameters(data) end
							do fc:addToParameters(fec) end
							do _g.jk.lang.Vector:append(stmts, fc) end
							do _g.sling.util.NodeUtil:replaceWithNodes(statement, stmts) end
						elseif (_vm:to_table_with_key(statement, '_isType.sling.model.ext.NSlingWebApiOutObjectStatement') ~= nil) then
							local data = statement:exportData()
							local stmts = {}
							local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("req"), "sendJSONObject", false)
							do fc:addToParameters(data) end
							do _g.jk.lang.Vector:append(stmts, fc) end
							do _g.sling.util.NodeUtil:replaceWithNodes(statement, stmts) end
						else
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported webapi statement: `" .. _g.jk.lang.String:safeString(statement:getNodeTypeName()) .. "'", statement, nil))
						end
					end
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.compiler.WebApiExpanderForSympathy:execute(root)
	if not (root ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null root", nil, nil))
	end
	do
		local cf = _g.sling.compiler.WebApiExpanderForSympathy.WebApiClassFinder._construct0(_g.sling.compiler.WebApiExpanderForSympathy.WebApiClassFinder._create())
		if not root:accept(cf) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failure in class finder", root, nil))
		end
		do
			local mainClass = nil
			local array = cf:getResults()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local wac = array[n + 1]
						if wac ~= nil then
							if _g.sling.util.EntityUtil:methodExists(wac, "initialize") then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("The initialize() method in a #webapi class cannot be manually declared.", wac, nil))
							end
							do
								local im = _g.sling.model.FunctionDeclarationNode:forName("initialize", true)
								do im:setReturnType(_g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()), false) end
								do _g.sling.util.ModifierUtil:addCommonModifier(im, _g.sling.model.Modifier.OVERRIDE) end
								do im:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.ReferenceDataTypeNode:forArrayOfNames({
									"jk",
									"http",
									"server",
									"HTTPServerBase"
								}), "server", nil)) end
								do _g.sling.util.FunctionUtil:addBaseCall(im, false) end
								do
									local toRemove = {}
									local initBlock = nil
									local array2 = wac:getNodes()
									if array2 ~= nil then
										local n2 = 0
										local m2 = _g.jk.lang.Vector:getSize(array2)
										do
											n2 = 0
											while n2 < m2 do
												local node = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.InitializerFunctionDeclarationNode')
												if node ~= nil then
													local nb = node:getBody()
													if not (nb ~= nil) then
														goto _continue76
													end
													if not (initBlock ~= nil) then
														initBlock = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
													end
													do
														local array3 = nb:exportNodes()
														if array3 ~= nil then
															local n3 = 0
															local m3 = _g.jk.lang.Vector:getSize(array3)
															do
																n3 = 0
																while n3 < m3 do
																	local statement = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.common.NodeObject')
																	if statement ~= nil then
																		do initBlock:addNode(statement) end
																	end
																	do n3 = n3 + 1 end
																end
															end
														end
														do _g.jk.lang.Vector:append(toRemove, node) end
													end
												end
												::_continue76::
												do n2 = n2 + 1 end
											end
										end
									end
									if initBlock ~= nil then
										do _g.sling.util.FunctionUtil:addStatement(im, initBlock) end
									end
									do
										local array4 = wac:getNodes()
										if array4 ~= nil then
											local n4 = 0
											local m4 = _g.jk.lang.Vector:getSize(array4)
											do
												n4 = 0
												while n4 < m4 do
													local wh = _vm:to_table_with_key(array4[n4 + 1], '_isType.sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration')
													if wh ~= nil then
														local fc = _g.sling.model.FunctionCallExpressionNode:forName(_g.jk.lang.String:toLowerCase(wh:getMethod()))
														do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(wh:getPath())) end
														do
															local fd = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
															do fd:setReturnType(_g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()), false) end
															do fd:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.ReferenceDataTypeNode:forArrayOfNames({
																"jk",
																"http",
																"server",
																"HTTPServerRequest"
															}), "req", nil)) end
															do fd:setBody(wh:exportBody(), false) end
															do fc:addToParameters(_g.sling.model.FunctionDeclarationExpressionNode:forDeclaration(fd)) end
															do _g.sling.util.FunctionUtil:addStatement(im, fc) end
															do self:processWebApiStatements(fd:getBody()) end
															do _g.jk.lang.Vector:append(toRemove, wh) end
														end
													end
													do n4 = n4 + 1 end
												end
											end
										end
										do
											local array5 = wac:getNodes()
											if array5 ~= nil then
												local n5 = 0
												local m5 = _g.jk.lang.Vector:getSize(array5)
												do
													n5 = 0
													while n5 < m5 do
														local node = _vm:to_table_with_key(array5[n5 + 1], '_isType.sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration')
														if node ~= nil then
															local fc = _g.sling.model.FunctionCallExpressionNode:forName("child")
															do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(node:getPath())) end
															do fc:addToParameters(node:exportExpression()) end
															do _g.sling.util.FunctionUtil:addStatement(im, fc) end
															do _g.jk.lang.Vector:append(toRemove, node) end
														end
														do n5 = n5 + 1 end
													end
												end
											end
											if toRemove ~= nil then
												local n6 = 0
												local m6 = _g.jk.lang.Vector:getSize(toRemove)
												do
													n6 = 0
													while n6 < m6 do
														local node = toRemove[n6 + 1]
														if node ~= nil then
															do node:remove() end
														end
														do n6 = n6 + 1 end
													end
												end
											end
											do wac:addNode(im) end
											do _g.sling.util.ModifierUtil:removeAnnotationModifier(wac, "webapi") end
											do
												local isInSympathy = _g.sling.util.NodeUtil:getQualifiedNameString(wac:getParent(), 46) == "jk.http.server"
												if not isInSympathy then
													do wac:addToImportNamespaces(_g.sling.model.SymbolNode:forArrayOfNames({
														"jk",
														"http",
														"server"
													})) end
												end
												do
													local bts = wac:getBaseTypes()
													if bts == nil or _g.jk.lang.Vector:getSize(bts) < 1 then
														do wac:addBaseTypeExtends(_g.sling.model.ReferenceDataTypeNode:forArrayOfNames({
															"jk",
															"http",
															"server",
															"HTTPServerRequestHandlerMap"
														})) end
													end
													if _g.sling.util.ModifierUtil:hasAnnotationModifier(wac, "main") then
														if not (mainClass ~= nil) then
															mainClass = wac
														end
														do _g.sling.util.ModifierUtil:removeAnnotationModifier(wac, "main") end
													end
												end
											end
										end
									end
								end
							end
						end
						do n = n + 1 end
					end
				end
			end
			if mainClass ~= nil then
				do mainClass:addToImportNamespaces(_g.sling.model.SymbolNode:forArrayOfNames({
					"jk",
					"server",
					"web"
				})) end
				do
					local mf = _g.sling.model.MainFunctionDeclarationNode._construct0(_g.sling.model.MainFunctionDeclarationNode._create())
					do mf:setArgumentArrayName("args") end
					do
						local webserver = _g.sling.model.CreateObjectExpressionNode:forType(_g.sling.model.ReferenceDataTypeNode:forName("WebServer"))
						local newthis = _g.sling.model.CreateObjectExpressionNode:forType(_g.sling.model.ThisDataTypeNode._construct0(_g.sling.model.ThisDataTypeNode._create()))
						local rx = _g.sling.model.MemberAccessExpressionNode:forNodes(webserver, _g.sling.model.SymbolExpressionNode:forName("executeForHandler"))
						local fc = _g.sling.model.FunctionCallExpressionNode:forExpression(rx)
						do fc:addToParameters(newthis) end
						do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forName("args")) end
						do _g.sling.util.FunctionUtil:addStatement(mf, _g.sling.model.ReturnStatementNode:forExpression(fc)) end
						do mainClass:addNode(mf) end
					end
				end
			end
		end
	end
end

function sling.compiler.WebApiExpanderForSympathy:getCtx()
	do return self.ctx end
end

function sling.compiler.WebApiExpanderForSympathy:setCtx(v)
	self.ctx = v
	do return self end
end

sling.compiler.WebApi2ExpanderForSympathy = {}
sling.compiler.WebApi2ExpanderForSympathy.__index = sling.compiler.WebApi2ExpanderForSympathy
_vm:set_metatable(sling.compiler.WebApi2ExpanderForSympathy, {})

function sling.compiler.WebApi2ExpanderForSympathy._create()
	local v = _vm:set_metatable({}, sling.compiler.WebApi2ExpanderForSympathy)
	return v
end

function sling.compiler.WebApi2ExpanderForSympathy:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.WebApi2ExpanderForSympathy'
	self['_isType.sling.compiler.WebApi2ExpanderForSympathy'] = true
	self.ctx = nil
end

function sling.compiler.WebApi2ExpanderForSympathy:_construct0()
	sling.compiler.WebApi2ExpanderForSympathy._init(self)
	return self
end

sling.compiler.WebApi2ExpanderForSympathy.WebApiClassFinder = _g.sling.common.NodeVisitor._create()
sling.compiler.WebApi2ExpanderForSympathy.WebApiClassFinder.__index = sling.compiler.WebApi2ExpanderForSympathy.WebApiClassFinder
_vm:set_metatable(sling.compiler.WebApi2ExpanderForSympathy.WebApiClassFinder, {
	__index = _g.sling.common.NodeVisitor
})

function sling.compiler.WebApi2ExpanderForSympathy.WebApiClassFinder._create()
	local v = _vm:set_metatable({}, sling.compiler.WebApi2ExpanderForSympathy.WebApiClassFinder)
	return v
end

function sling.compiler.WebApi2ExpanderForSympathy.WebApiClassFinder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.WebApi2ExpanderForSympathy.WebApiClassFinder'
	self['_isType.sling.compiler.WebApi2ExpanderForSympathy.WebApiClassFinder'] = true
	self.results = {}
end

function sling.compiler.WebApi2ExpanderForSympathy.WebApiClassFinder:_construct0()
	sling.compiler.WebApi2ExpanderForSympathy.WebApiClassFinder._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.compiler.WebApi2ExpanderForSympathy.WebApiClassFinder:visit(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.ClassDeclarationNode') ~= nil) and _g.sling.util.ModifierUtil:hasAnnotationModifier(node, "webapi2") and _g.sling.util.ModifierUtil:hasAnnotationModifier(node, "nojkop") == false then
		do _g.jk.lang.Vector:append(self.results, node) end
	end
	do return true end
end

function sling.compiler.WebApi2ExpanderForSympathy.WebApiClassFinder:getResults()
	do return self.results end
end

function sling.compiler.WebApi2ExpanderForSympathy.WebApiClassFinder:setResults(v)
	self.results = v
	do return self end
end

sling.compiler.WebApi2ExpanderForSympathy.WebApiStatementFinder = _g.sling.common.NodeVisitor._create()
sling.compiler.WebApi2ExpanderForSympathy.WebApiStatementFinder.__index = sling.compiler.WebApi2ExpanderForSympathy.WebApiStatementFinder
_vm:set_metatable(sling.compiler.WebApi2ExpanderForSympathy.WebApiStatementFinder, {
	__index = _g.sling.common.NodeVisitor
})

function sling.compiler.WebApi2ExpanderForSympathy.WebApiStatementFinder._create()
	local v = _vm:set_metatable({}, sling.compiler.WebApi2ExpanderForSympathy.WebApiStatementFinder)
	return v
end

function sling.compiler.WebApi2ExpanderForSympathy.WebApiStatementFinder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.compiler.WebApi2ExpanderForSympathy.WebApiStatementFinder'
	self['_isType.sling.compiler.WebApi2ExpanderForSympathy.WebApiStatementFinder'] = true
	self.results = {}
end

function sling.compiler.WebApi2ExpanderForSympathy.WebApiStatementFinder:_construct0()
	sling.compiler.WebApi2ExpanderForSympathy.WebApiStatementFinder._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.compiler.WebApi2ExpanderForSympathy.WebApiStatementFinder:visit(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.ext.NSlingWebApiStatement') ~= nil) then
		do _g.jk.lang.Vector:append(self.results, node) end
	end
	do return true end
end

function sling.compiler.WebApi2ExpanderForSympathy.WebApiStatementFinder:getResults()
	do return self.results end
end

function sling.compiler.WebApi2ExpanderForSympathy.WebApiStatementFinder:setResults(v)
	self.results = v
	do return self end
end

function sling.compiler.WebApi2ExpanderForSympathy:getDynamicMapMethod(type, primitivesOnly)
	if not (type ~= nil) then
		do return "get" end
	end
	do
		local method = nil
		if (_vm:to_table_with_key(type, '_isType.sling.model.ObjectDataTypeNode') ~= nil) or ((_vm:to_table_with_key(type, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) and primitivesOnly == false) then
			method = "get"
		elseif (_vm:to_table_with_key(type, '_isType.sling.model.StringDataTypeNode') ~= nil) then
			method = "getString"
		elseif (_vm:to_table_with_key(type, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
			if type:getType() == _g.sling.model.IntegerDataTypeNode.TYPE_INT64 then
				method = "getLongInteger"
			else
				method = "getInteger"
			end
		elseif (_vm:to_table_with_key(type, '_isType.sling.model.BooleanDataTypeNode') ~= nil) then
			method = "getBoolean"
		elseif (_vm:to_table_with_key(type, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
			method = "getDouble"
		elseif (_vm:to_table_with_key(type, '_isType.sling.model.BufferDataTypeNode') ~= nil) and primitivesOnly == false then
			method = "getBuffer"
		elseif (_vm:to_table_with_key(type, '_isType.sling.model.VectorDataTypeNode') ~= nil) and primitivesOnly == false then
			method = "getVector"
		else
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported data type.", type, nil))
		end
		do return method end
	end
end

function sling.compiler.WebApi2ExpanderForSympathy:createInvalidRequestAssert(xpr, res)
	local ass = _g.sling.model.AssertStatementNode:forChild(xpr)
	local err = _g.sling.model.FunctionCallExpressionNode:forName("setInvalidRequest")
	do err:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(res, nil)) end
	do ass:setErrorBlock(_g.sling.model.BlockNode:forStatement(err), false) end
	do return ass end
end

function sling.compiler.WebApi2ExpanderForSympathy:createNotAuthenticatedAssert(xpr, res)
	local ass = _g.sling.model.AssertStatementNode:forChild(xpr)
	local err = _g.sling.model.FunctionCallExpressionNode:forName("setNotAuthenticated")
	do err:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(res, nil)) end
	do ass:setErrorBlock(_g.sling.model.BlockNode:forStatement(err), false) end
	do return ass end
end

function sling.compiler.WebApi2ExpanderForSympathy:createValidateStringStatement(varname, res)
	local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("String"), "isNotEmpty", false)
	do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forName(varname)) end
	do return self:createInvalidRequestAssert(fc, res) end
end

function sling.compiler.WebApi2ExpanderForSympathy:processWebApiStatements(body, req, res, vars)
	local sf = _g.sling.compiler.WebApi2ExpanderForSympathy.WebApiStatementFinder._construct0(_g.sling.compiler.WebApi2ExpanderForSympathy.WebApiStatementFinder._create())
	if not body:accept(sf) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to accept webapi2 statement finder", body, nil))
	end
	do
		local array = sf:getResults()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local statement = array[n + 1]
					if statement ~= nil then
						if (_vm:to_table_with_key(statement, '_isType.sling.model.ext.NSlingWebApiSampleRequest') ~= nil) or (_vm:to_table_with_key(statement, '_isType.sling.model.ext.NSlingWebApiSampleResponse') ~= nil) then
							if not statement:remove() then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to remove node", statement, nil))
							end
						elseif (_vm:to_table_with_key(statement, '_isType.sling.model.ext.NSlingWebApiInPathStatement') ~= nil) then
							local name = statement:getName()
							local type = statement:exportType()
							if type ~= nil then
								do _g.sling.common.RefLog:warning(self.ctx, "Data type is currently ignored", type) end
							end
							do
								local stmts = {}
								local fcall = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forBinding(vars, nil), "getString", false)
								do fcall:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(name)) end
								do _g.jk.lang.Vector:append(stmts, _g.sling.model.VariableDeclarationNode:forAutomatic(name, fcall)) end
								do _g.jk.lang.Vector:append(stmts, self:createValidateStringStatement(name, res)) end
								do _g.sling.util.NodeUtil:replaceWithNodes(statement, stmts) end
							end
						elseif (_vm:to_table_with_key(statement, '_isType.sling.model.ext.NSlingWebApiInQueryParameterStatement') ~= nil) then
							local name = statement:getName()
							local type = statement:exportType()
							if type ~= nil then
								do _g.sling.common.RefLog:warning(self.ctx, "Data type is currently ignored", type) end
							end
							do
								local stmts = {}
								local fcall = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forBinding(req, nil), "getQueryParameter", false)
								do fcall:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(name)) end
								do _g.jk.lang.Vector:append(stmts, _g.sling.model.VariableDeclarationNode:forAutomatic(name, fcall)) end
								if statement:getOptional() == false then
									do _g.jk.lang.Vector:append(stmts, self:createValidateStringStatement(name, res)) end
								end
								do _g.sling.util.NodeUtil:replaceWithNodes(statement, stmts) end
							end
						elseif (_vm:to_table_with_key(statement, '_isType.sling.model.ext.NSlingWebApiInPostStatement') ~= nil) then
							local name = statement:getName()
							local type = statement:exportType()
							local stmts = {}
							local varname = _g.jk.lang.String:safeString(name) .. "BodyData"
							do _g.jk.lang.Vector:append(stmts, _g.sling.model.VariableDeclarationNode:forAutomatic(varname, _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forBinding(req, nil), "getBodyJSONMap", false))) end
							do _g.jk.lang.Vector:append(stmts, self:createInvalidRequestAssert(_g.sling.model.SymbolExpressionNode:forName(varname), res)) end
							do _g.jk.lang.Vector:append(stmts, _g.sling.model.VariableDeclarationNode:forAutomatic(name, _g.sling.model.CreateObjectExpressionNode:forType(type))) end
							do
								local fromxpr = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName(name), "fromJsonObject", false)
								do fromxpr:addToParameters(_g.sling.model.SymbolExpressionNode:forName(varname)) end
								do _g.jk.lang.Vector:append(stmts, self:createInvalidRequestAssert(fromxpr, res)) end
								do _g.sling.util.NodeUtil:replaceWithNodes(statement, stmts) end
							end
						elseif (_vm:to_table_with_key(statement, '_isType.sling.model.ext.NSlingWebApiInSessionStatement') ~= nil) then
							local name = statement:getName()
							local type = statement:exportType()
							local stmts = {}
							local reqfc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forBinding(req, nil), "getSession", false)
							local reqfcc = _g.sling.model.DynamicCastExpressionNode:instance(type, reqfc)
							do _g.jk.lang.Vector:append(stmts, _g.sling.model.VariableDeclarationNode:forAutomatic(name, reqfcc)) end
							do _g.jk.lang.Vector:append(stmts, self:createNotAuthenticatedAssert(_g.sling.model.SymbolExpressionNode:forName(name), res)) end
							do _g.sling.util.NodeUtil:replaceWithNodes(statement, stmts) end
						elseif (_vm:to_table_with_key(statement, '_isType.sling.model.ext.NSlingWebApiOutErrorStatement') ~= nil) then
							local code = statement:exportCode()
							local data = statement:exportData()
							local stmts = {}
							local errfc = _g.sling.model.FunctionCallExpressionNode:forName("setErrorResponse")
							do errfc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(res, nil)) end
							do errfc:addToParameters(code) end
							do _g.jk.lang.Vector:append(stmts, errfc) end
							if data ~= nil then
								do _g.sling.common.RefLog:warning(self.ctx, "Data parameter is currently ignored", data) end
							end
							do _g.sling.util.NodeUtil:replaceWithNodes(statement, stmts) end
						elseif (_vm:to_table_with_key(statement, '_isType.sling.model.ext.NSlingWebApiOutOkStatement') ~= nil) then
							local data = statement:exportData()
							local stmts = {}
							local okayc = _g.sling.model.FunctionCallExpressionNode:forName("setOkResponse")
							do okayc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(res, nil)) end
							if data ~= nil then
								do okayc:addToParameters(data) end
							end
							do _g.jk.lang.Vector:append(stmts, okayc) end
							do _g.sling.util.NodeUtil:replaceWithNodes(statement, stmts) end
						elseif (_vm:to_table_with_key(statement, '_isType.sling.model.ext.NSlingWebApiOutObjectStatement') ~= nil) then
							local data = statement:exportData()
							local stmts = {}
							local objfc = _g.sling.model.FunctionCallExpressionNode:forName("setJsonObjectResponse")
							do objfc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(res, nil)) end
							do objfc:addToParameters(data) end
							do _g.jk.lang.Vector:append(stmts, objfc) end
							do _g.sling.util.NodeUtil:replaceWithNodes(statement, stmts) end
						else
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported webapi statement: `" .. _g.jk.lang.String:safeString(statement:getNodeTypeName()) .. "'", statement, nil))
						end
					end
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.compiler.WebApi2ExpanderForSympathy:execute(root)
	if not (root ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null root", nil, nil))
	end
	do
		local cf = _g.sling.compiler.WebApi2ExpanderForSympathy.WebApiClassFinder._construct0(_g.sling.compiler.WebApi2ExpanderForSympathy.WebApiClassFinder._create())
		if not root:accept(cf) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to accept webapi2 class finder", root, nil))
		end
		do
			local mc = nil
			local array = cf:getResults()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local wac = array[n + 1]
						if wac ~= nil then
							if _g.sling.util.EntityUtil:methodExists(wac, "initRoutes") then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("The initRoutes() method in a #webapi2 class cannot be manually declared.", wac, nil))
							end
							do
								local ir = _g.sling.model.FunctionDeclarationNode:forName("initRoutes", true)
								do ir:setReturnType(_g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()), false) end
								do _g.sling.util.ModifierUtil:addCommonModifier(ir, _g.sling.model.Modifier.OVERRIDE) end
								do _g.sling.util.FunctionUtil:addBaseCall(ir, false) end
								do
									local toRemove = {}
									local ib = nil
									local array2 = wac:getNodes()
									if array2 ~= nil then
										local n2 = 0
										local m2 = _g.jk.lang.Vector:getSize(array2)
										do
											n2 = 0
											while n2 < m2 do
												local ii = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.InitializerFunctionDeclarationNode')
												if ii ~= nil then
													local nb = ii:getBody()
													if not (nb ~= nil) then
														goto _continue77
													end
													if not (ib ~= nil) then
														ib = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
													end
													do
														local array3 = nb:exportNodes()
														if array3 ~= nil then
															local n3 = 0
															local m3 = _g.jk.lang.Vector:getSize(array3)
															do
																n3 = 0
																while n3 < m3 do
																	local st = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.common.NodeObject')
																	if st ~= nil then
																		do ib:addNode(st) end
																	end
																	do n3 = n3 + 1 end
																end
															end
														end
														do _g.jk.lang.Vector:append(toRemove, ii) end
													end
												end
												::_continue77::
												do n2 = n2 + 1 end
											end
										end
									end
									if ib ~= nil then
										do _g.sling.util.FunctionUtil:addStatement(ir, ib) end
									end
									do
										local array4 = wac:getNodes()
										if array4 ~= nil then
											local n4 = 0
											local m4 = _g.jk.lang.Vector:getSize(array4)
											do
												n4 = 0
												while n4 < m4 do
													local ho = _vm:to_table_with_key(array4[n4 + 1], '_isType.sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration')
													if ho ~= nil then
														_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported declaration.", ho, nil))
													end
													do n4 = n4 + 1 end
												end
											end
										end
										do
											local array5 = wac:getNodes()
											if array5 ~= nil then
												local n5 = 0
												local m5 = _g.jk.lang.Vector:getSize(array5)
												do
													n5 = 0
													while n5 < m5 do
														local wh = _vm:to_table_with_key(array5[n5 + 1], '_isType.sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration')
														if wh ~= nil then
															local fc = _g.sling.model.FunctionCallExpressionNode:forName("addRoute")
															do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(wh:getMethod())) end
															do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(wh:getPath())) end
															do
																local rq = _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.ReferenceDataTypeNode:forArrayOfNames({
																	"jk",
																	"http",
																	"worker",
																	"HTTPWorkerRequest"
																}), "req", nil)
																local rs = _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.ReferenceDataTypeNode:forArrayOfNames({
																	"jk",
																	"http",
																	"worker",
																	"HTTPWorkerResponse"
																}), "resp", nil)
																local vd = _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.ReferenceDataTypeNode:forArrayOfNames({
																	"jk",
																	"lang",
																	"DynamicMap"
																}), "vars", nil)
																local fd = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
																do fd:setReturnType(_g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()), false) end
																do fd:addToParameters(rq) end
																do fd:addToParameters(rs) end
																do fd:addToParameters(vd) end
																do fc:addToParameters(_g.sling.model.FunctionDeclarationExpressionNode:forDeclaration(fd)) end
																do fd:setBody(wh:exportBody(), false) end
																do _g.sling.util.FunctionUtil:addStatement(ir, fc) end
																do self:processWebApiStatements(fd:getBody(), rq, rs, vd) end
																do _g.jk.lang.Vector:append(toRemove, wh) end
															end
														end
														do n5 = n5 + 1 end
													end
												end
											end
											do
												local array6 = wac:getNodes()
												if array6 ~= nil then
													local n6 = 0
													local m6 = _g.jk.lang.Vector:getSize(array6)
													do
														n6 = 0
														while n6 < m6 do
															local rp = _vm:to_table_with_key(array6[n6 + 1], '_isType.sling.model.FunctionDeclarationNode')
															if rp ~= nil then
																if _g.sling.util.ModifierUtil:hasAnnotationModifier(rp, "webrpc") == false then
																	goto _continue78
																end
																if (_vm:to_table_with_key(rp:getOwnReturnType(), '_isType.sling.model.ObjectDataTypeNode') ~= nil) == false then
																	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Function declarations with #webrpc modifiers should have an object data type.", rp, nil))
																end
																do
																	local fc = _g.sling.model.FunctionCallExpressionNode:forName("addFunction")
																	do fc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(rp:getNodeName())) end
																	do
																		local vd = _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.ReferenceDataTypeNode:forArrayOfNames({
																			"jk",
																			"lang",
																			"DynamicMap"
																		}), "parameters", nil)
																		local fd = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
																		do fd:setReturnType(_g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create()), false) end
																		do fd:addToParameters(vd) end
																		do
																			local rc = _g.sling.model.FunctionCallExpressionNode:forName(rp:getNodeName())
																			local array7 = rp:getParameters()
																			if array7 ~= nil then
																				local n7 = 0
																				local m7 = _g.jk.lang.Vector:getSize(array7)
																				do
																					n7 = 0
																					while n7 < m7 do
																						local pr = _vm:to_table_with_key(array7[n7 + 1], '_isType.sling.model.VariableDeclarationNode')
																						if pr ~= nil then
																							local dt = pr:getType()
																							local ts = self:getDynamicMapMethod(dt, false)
																							local nn = pr:getNodeName()
																							local cc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forBinding(vd, nil), ts, false)
																							do cc:addToParameters(_g.sling.model.StringLiteralExpressionNode:forValue(nn)) end
																							do
																								local pp = _g.sling.model.VariableDeclarationNode:forAutomatic(nn, cc)
																								do _g.sling.util.FunctionUtil:addStatement(fd, pp) end
																								do rc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(pp, nil)) end
																							end
																						end
																						do n7 = n7 + 1 end
																					end
																				end
																			end
																			do _g.sling.util.FunctionUtil:addStatement(fd, _g.sling.model.ReturnStatementNode:forExpression(rc)) end
																			do fc:addToParameters(_g.sling.model.FunctionDeclarationExpressionNode:forDeclaration(fd)) end
																			do _g.sling.util.FunctionUtil:addStatement(ir, fc) end
																			do _g.sling.util.ModifierUtil:removeAnnotationModifier(rp, "webrpc") end
																		end
																	end
																end
															end
															::_continue78::
															do n6 = n6 + 1 end
														end
													end
												end
												if toRemove ~= nil then
													local n8 = 0
													local m8 = _g.jk.lang.Vector:getSize(toRemove)
													do
														n8 = 0
														while n8 < m8 do
															local node = toRemove[n8 + 1]
															if node ~= nil then
																do node:remove() end
															end
															do n8 = n8 + 1 end
														end
													end
												end
												do wac:addNode(ir) end
												do _g.sling.util.ModifierUtil:removeAnnotationModifier(wac, "webapi2") end
												if _g.jk.lang.String:isNotEqual(_g.sling.util.NodeUtil:getQualifiedNameString(wac:getParent(), 46), "jk.http.worker") then
													do wac:addToImportNamespaces(_g.sling.model.SymbolNode:forArrayOfNames({
														"jk",
														"http",
														"worker"
													})) end
												end
												do
													local bts = wac:getBaseTypes()
													if bts == nil or _g.jk.lang.Vector:getSize(bts) < 1 then
														do wac:addBaseTypeExtends(_g.sling.model.ReferenceDataTypeNode:forArrayOfNames({
															"jk",
															"http",
															"worker",
															"HTTPRPCRouter"
														})) end
													end
													if _g.sling.util.ModifierUtil:hasAnnotationModifier(wac, "main") then
														if not (mc ~= nil) then
															mc = wac
														end
														do _g.sling.util.ModifierUtil:removeAnnotationModifier(wac, "main") end
													end
												end
											end
										end
									end
								end
							end
						end
						do n = n + 1 end
					end
				end
			end
			if mc ~= nil then
				do mc:addToImportNamespaces(_g.sling.model.SymbolNode:forArrayOfNames({
					"jk",
					"server",
					"web"
				})) end
				do
					local mf = _g.sling.model.MainFunctionDeclarationNode._construct0(_g.sling.model.MainFunctionDeclarationNode._create())
					do mf:setArgumentArrayName("args") end
					do
						local c1 = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.CreateObjectExpressionNode:forType(_g.sling.model.ReferenceDataTypeNode:forName("WebServer")), "setWorker", false)
						do c1:addToParameters(_g.sling.model.GetDatatypeTypeinfoExpressionNode:forDatatype(_g.sling.model.ThisDataTypeNode._construct0(_g.sling.model.ThisDataTypeNode._create()))) end
						do
							local c2 = _g.sling.model.FunctionCallExpressionNode:forMethod(c1, "executeMain", false)
							do c2:addToParameters(_g.sling.model.SymbolExpressionNode:forName("args")) end
							do _g.sling.util.FunctionUtil:addStatement(mf, _g.sling.model.ReturnStatementNode:forExpression(c2)) end
							do mc:addNode(mf) end
						end
					end
				end
			end
		end
	end
end

function sling.compiler.WebApi2ExpanderForSympathy:getCtx()
	do return self.ctx end
end

function sling.compiler.WebApi2ExpanderForSympathy:setCtx(v)
	self.ctx = v
	do return self end
end
