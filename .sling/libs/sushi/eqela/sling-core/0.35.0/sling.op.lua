sling = sling or {}

sling.op = sling.op or {}

sling.op.EntitySorter = {}
sling.op.EntitySorter.__index = sling.op.EntitySorter
_vm:set_metatable(sling.op.EntitySorter, {})

function sling.op.EntitySorter._create()
	local v = _vm:set_metatable({}, sling.op.EntitySorter)
	return v
end

function sling.op.EntitySorter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.op.EntitySorter'
	self['_isType.sling.op.EntitySorter'] = true
	self.resolver = nil
end

function sling.op.EntitySorter:_construct0()
	sling.op.EntitySorter._init(self)
	return self
end

function sling.op.EntitySorter:findNodeIndex(nodes, node)
	if node == nil then
		do return -1 end
	end
	do
		local c = _g.jk.lang.Vector:getSize(nodes)
		local n = 0
		while n < c do
			if _g.jk.lang.Vector:get(nodes, n) == node then
				do return n end
			end
			do n = n + 1 end
		end
		do return -1 end
	end
end

function sling.op.EntitySorter:orderContainerByDependency(depEntity, entity)
	local dep = _vm:to_table_with_key(depEntity:getParent(), '_isType.sling.common.ContainerNode')
	if not (dep ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Entity has no container parent (1)", depEntity, nil))
	end
	do
		local ee = _vm:to_table_with_key(entity:getParent(), '_isType.sling.common.ContainerNode')
		if not (ee ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Entity has no container parent (2)", entity, nil))
		end
		do
			local dpp = dep
			local epp = nil
			local dpns = depEntity
			local epns = entity
			local commonAncestor = nil
			while true do
				if dpp == nil then
					do break end
				end
				epns = entity
				epp = ee
				while true do
					if epp == nil then
						do break end
					end
					if dpp == epp then
						commonAncestor = dpp
						do break end
					end
					if (_vm:to_table_with_key(epp, '_isType.sling.common.ContainerNode') ~= nil) == false then
						do break end
					end
					epns = epp
					epp = _vm:to_table_with_key(epp:getParent(), '_isType.sling.common.ContainerNode')
				end
				if commonAncestor ~= nil then
					do break end
				end
				if (_vm:to_table_with_key(dpp, '_isType.sling.common.ContainerNode') ~= nil) == false then
					do break end
				end
				dpns = dpp
				dpp = _vm:to_table_with_key(dpp:getParent(), '_isType.sling.common.ContainerNode')
			end
			if not (commonAncestor ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to get commonAncestor", dep, nil))
			end
			do
				local nodes = commonAncestor:getNodes()
				local dpIdx = self:findNodeIndex(nodes, dpns)
				if dpIdx < 0 then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Corrupted location of dpns", dpns, nil))
				end
				do
					local epIdx = self:findNodeIndex(nodes, epns)
					if epIdx < 0 then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Corrupted location of epns", epns, nil))
					end
					if epIdx < dpIdx then
						do _g.jk.lang.Vector:set(nodes, dpIdx, epns) end
						do _g.jk.lang.Vector:set(nodes, epIdx, dpns) end
					end
				end
			end
		end
	end
end

function sling.op.EntitySorter:orderBaseTypeOfInnerClass(oentity, entity, nodes)
	local enodes = entity:getNodes()
	local nidx = self:findNodeIndex(nodes, oentity)
	if nidx < 0 then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Corrupted location of oentity", oentity, nil))
	end
	do
		local swaps = 0
		local swapped = false
		if _g.jk.lang.Vector:isEmpty(enodes) == false then
			if enodes ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(enodes)
				do
					n = 0
					while n < m do
						local nn = _vm:to_table_with_key(enodes[n + 1], '_isType.sling.model.EntityDeclarationNode')
						if nn ~= nil then
							if self:orderBaseTypeOfInnerClass(oentity, nn, nodes) then
								do return true end
							end
							do
								local array = nn:getBaseTypes()
								if array ~= nil then
									local n2 = 0
									local m2 = _g.jk.lang.Vector:getSize(array)
									do
										n2 = 0
										while n2 < m2 do
											local bt = _vm:to_table_with_key(array[n2 + 1], '_isType.sling.model.BaseTypeNode')
											if bt ~= nil then
												local decl = _g.sling.util.TypeResolver:getAndRequireBoundEntity(bt:getReferenceType())
												local idx = self:findNodeIndex(nodes, decl)
												if idx <= nidx then
													goto _continue1
												end
												do _g.jk.lang.Vector:set(nodes, idx, oentity) end
												do _g.jk.lang.Vector:set(nodes, nidx, decl) end
												do swaps = swaps + 1 end
												swapped = true
												if swaps > 10000 then
													_vm:throw_error(_g.sling.common.ReferenceError:forMessage("More than 10000 swaps encountered when sorting inner child entities. Possibly recursive dependency. Don't know how to continue.", nn, nil))
												end
												do break end
											end
											::_continue1::
											do n2 = n2 + 1 end
										end
									end
								end
								if swapped then
									do return true end
								end
							end
						end
						do n = n + 1 end
					end
				end
			end
		end
		do return false end
	end
end

function sling.op.EntitySorter:sortContainer(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local nodes = node:getNodes()
		if not _g.jk.lang.Vector:isNotEmpty(nodes) then
			do return end
		end
		do
			local n = 0
			local c = _g.jk.lang.Vector:getSize(nodes)
			local swaps = 0
			if nodes ~= nil then
				local n2 = 0
				local m = _g.jk.lang.Vector:getSize(nodes)
				do
					n2 = 0
					while n2 < m do
						local ee = _vm:to_table_with_key(nodes[n2 + 1], '_isType.sling.model.EntityDeclarationNode')
						if ee ~= nil then
							do self:sortContainer(ee) end
						end
						do n2 = n2 + 1 end
					end
				end
			end
			while n < c do
				local ee = _vm:to_table_with_key(_g.jk.lang.Vector:get(nodes, n), '_isType.sling.model.EntityDeclarationNode')
				if ee == nil then
					do n = n + 1 end
					goto _continue2
				end
				if self:orderBaseTypeOfInnerClass(ee, ee, nodes) then
					goto _continue2
				end
				do
					local swapped = false
					local array = ee:getBaseTypes()
					if array ~= nil then
						local n3 = 0
						local m2 = _g.jk.lang.Vector:getSize(array)
						do
							n3 = 0
							while n3 < m2 do
								local btn = _vm:to_table_with_key(array[n3 + 1], '_isType.sling.model.BaseTypeNode')
								if btn ~= nil then
									local decl = _g.sling.util.TypeResolver:getAndRequireBoundEntity(btn:getReferenceType())
									if (_vm:to_table_with_key(decl, '_isType.sling.model.MagicalClassDeclarationNode') ~= nil) or (_vm:to_table_with_key(decl, '_isType.sling.model.TemplateDeclarationNode') ~= nil) then
										goto _continue3
									end
									do
										local idx = self:findNodeIndex(nodes, decl)
										if idx < 0 then
											do self:orderContainerByDependency(decl, ee) end
										end
										if idx <= n then
											goto _continue3
										end
										do _g.jk.lang.Vector:set(nodes, idx, ee) end
										do _g.jk.lang.Vector:set(nodes, n, decl) end
										swapped = true
										do swaps = swaps + 1 end
										if swaps > 10000 then
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("More than 10000 swaps encountered when sorting child entities. Possibly recursive dependency. Don't know how to continue.", ee, nil))
										end
										do break end
									end
								end
								::_continue3::
								do n3 = n3 + 1 end
							end
						end
					end
					if swapped == false then
						do n = n + 1 end
					end
				end
				::_continue2::
			end
		end
	end
end

function sling.op.EntitySorter:execute(ctx, root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.NamespaceNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local ns = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.NamespaceNode')
				if ns ~= nil then
					do self:sortContainer(ns) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.EntitySorter:getResolver()
	do return self.resolver end
end

function sling.op.EntitySorter:setResolver(v)
	self.resolver = v
	do return self end
end

sling.op.RenamerForReservedWords = {}
sling.op.RenamerForReservedWords.__index = sling.op.RenamerForReservedWords
_vm:set_metatable(sling.op.RenamerForReservedWords, {})

function sling.op.RenamerForReservedWords._create()
	local v = _vm:set_metatable({}, sling.op.RenamerForReservedWords)
	return v
end

function sling.op.RenamerForReservedWords:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.op.RenamerForReservedWords'
	self['_isType.sling.op.RenamerForReservedWords'] = true
end

function sling.op.RenamerForReservedWords:_construct0()
	sling.op.RenamerForReservedWords._init(self)
	return self
end

function sling.op.RenamerForReservedWords:execute(ctx, root, words, issueWarnings)
	local set = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
	if words ~= nil then
		local n = 0
		local m = #words
		do
			n = 0
			while n < m do
				local word = words[n + 1]
				if word ~= nil then
					do set:add(word) end
				end
				do n = n + 1 end
			end
		end
	end
	do
		local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.common.NamedNode", false, true, false)
		if array ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(array)
			do
				n2 = 0
				while n2 < m2 do
					local nn = _vm:to_table_with_key(array[n2 + 1], '_isType.sling.common.NamedNode')
					if nn ~= nil then
						local name = nn:getNodeName()
						if _g.jk.lang.String:isEmpty(name) then
							goto _continue4
						end
						if set:contains(name) then
							if issueWarnings then
								if _g.sling.util.ModifierUtil:hasCommonModifier(_g.sling.util.FindUtil:findNearestEntity(nn), _g.sling.model.Modifier.HEADER) == false then
									do _g.sling.common.RefLog:warning(ctx, "Renaming node with reserved word: `" .. _g.jk.lang.String:safeString(name) .. "'", nn) end
								end
							end
							do nn:renameNode("_" .. _g.jk.lang.String:safeString(name)) end
						end
					end
					::_continue4::
					do n2 = n2 + 1 end
				end
			end
		end
	end
end

sling.op.CommonOps = {}
sling.op.CommonOps.__index = sling.op.CommonOps
_vm:set_metatable(sling.op.CommonOps, {})

function sling.op.CommonOps._create()
	local v = _vm:set_metatable({}, sling.op.CommonOps)
	return v
end

function sling.op.CommonOps:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.op.CommonOps'
	self['_isType.sling.op.CommonOps'] = true
end

function sling.op.CommonOps:_construct0()
	sling.op.CommonOps._init(self)
	return self
end

function sling.op.CommonOps:flattenOptionalDataTypes(ctx, node)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.OptionalDataTypeNode", true, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local op = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.OptionalDataTypeNode')
				if op ~= nil then
					do _g.sling.common.RefLog:warning(ctx, "Flattening optional data type", op) end
					do _g.sling.util.NodeUtil:replaceNode(op, op:exportPrimaryType()) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:flattenUnwrappingExpressions(ctx, node)
	local array = _g.sling.util.NodeFinder:findNodesOfTypes(node, {
		"class:sling.model.ForceUnwrapOptionalExpressionNode",
		"class:sling.model.SafeUnwrapOptionalExpressionNode"
	}, true, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local uw = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.UnaryExpressionNode')
				if uw ~= nil then
					do _g.sling.common.RefLog:warning(ctx, "Flattening unwrapping expression", uw) end
					do _g.sling.util.NodeUtil:replaceNode(uw, uw:exportExpression()) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:flattenPromiseExpressions(node)
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.PromiseExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local px = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.PromiseExpressionNode')
				if px ~= nil then
					do _g.sling.util.NodeUtil:replaceNode(px, px:exportExpression()) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:removeComments(ctx, node)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.CommentNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local nn = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.CommentNode')
				if nn ~= nil then
					do _g.sling.util.NodeUtil:removeNode(nn) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:removeDestructors(ctx, node)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.DestructorDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local nn = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.DestructorDeclarationNode')
				if nn ~= nil then
					do _g.sling.common.RefLog:warning(ctx, "Removing destructor", nn) end
					do _g.sling.util.NodeUtil:removeNode(nn) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:renameAmbiguousClassVariables(node)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(node, "class:sling.model.EntityDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local entt = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.EntityDeclarationNode')
				if entt ~= nil then
					local array2 = entt:getNodes()
					if array2 ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(array2)
						do
							n2 = 0
							while n2 < m2 do
								local chld = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.VariableDeclarationNode')
								if chld ~= nil then
									local name = chld:getNodeName()
									local decs = entt:getNodeIndexForName(name)
									if _g.jk.lang.Vector:getSize(decs) > 1 then
										local flag = _g.sling.op.CommonOps:nameClashedWithFunction(decs)
										if decs ~= nil then
											local n3 = 0
											local m3 = _g.jk.lang.Vector:getSize(decs)
											do
												n3 = 0
												while n3 < m3 do
													local vdec = _vm:to_table_with_key(decs[n3 + 1], '_isType.sling.model.VariableDeclarationNode')
													if vdec ~= nil then
														local vnnm = name
														if flag then
															vnnm = "_" .. _g.jk.lang.String:safeString(vnnm)
														end
														vnnm = _g.sling.op.CommonOps:getUniqueName(vnnm, entt)
														do vdec:renameNode(vnnm) end
													end
													do n3 = n3 + 1 end
												end
											end
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

function sling.op.CommonOps:nameClashedWithFunction(decs)
	if decs ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(decs)
		do
			n = 0
			while n < m do
				local fdec = _vm:to_table_with_key(decs[n + 1], '_isType.sling.model.FunctionDeclarationNode')
				if fdec ~= nil then
					do return true end
				end
				do n = n + 1 end
			end
		end
	end
	do return false end
end

function sling.op.CommonOps:getUniqueName(name, entt)
	local cc = 1
	while true do
		local nn = _g.jk.lang.String:safeString(name) .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(cc))
		if _g.jk.lang.Vector:isEmpty(entt:getNodeIndexForName(nn)) then
			do return nn end
		end
		do cc = cc + 1 end
	end
	do return name end
end

function sling.op.CommonOps:expandConditionalExpressions(ctx, node)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.ConditionalExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local nn = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ConditionalExpressionNode')
				if nn ~= nil then
					local condition = nn:exportCondition()
					local trueExpr = nn:exportTrueExpr()
					local falseExpr = nn:exportFalseExpr()
					local mfcd = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
					do mfcd:setReturnType(_g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create()), false) end
					do mfcd:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create()), "a", nil)) end
					do mfcd:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create()), "b", nil)) end
					do mfcd:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create()), "c", nil)) end
					do
						local trs = _g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.FunctionCallExpressionNode:forName("b"))
						local cond = _g.sling.model.IfStatementNode:instance(_g.sling.model.SymbolExpressionNode:forName("a"), _g.sling.model.BlockNode:forStatement(trs), nil)
						do _g.sling.util.FunctionUtil:addStatement(mfcd, cond) end
						do _g.sling.util.FunctionUtil:addStatement(mfcd, _g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.FunctionCallExpressionNode:forName("c"))) end
						do
							local mfc = _g.sling.model.FunctionDeclarationExpressionNode:forDeclaration(mfcd)
							local fc = _g.sling.model.FunctionCallExpressionNode:forExpression(mfc)
							do fc:addToParameters(condition) end
							do
								local af = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
								do af:setReturnType(_g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create()), false) end
								do _g.sling.util.FunctionUtil:addStatement(af, _g.sling.model.ReturnStatementNode:forExpression(trueExpr)) end
								do fc:addToParameters(_g.sling.model.FunctionDeclarationExpressionNode:forDeclaration(af)) end
								do
									local bf = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
									do bf:setReturnType(_g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create()), false) end
									do _g.sling.util.FunctionUtil:addStatement(bf, _g.sling.model.ReturnStatementNode:forExpression(falseExpr)) end
									do fc:addToParameters(_g.sling.model.FunctionDeclarationExpressionNode:forDeclaration(bf)) end
									do _g.sling.util.NodeUtil:replaceNode(nn, fc) end
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

function sling.op.CommonOps:expandAssignmentExpressions(ctx, node)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(node, "class:sling.model.AssignmentExpressionBaseNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local nn = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.AssignmentExpressionBaseNode')
				if nn ~= nil then
					if (_vm:to_table_with_key(nn, '_isType.sling.model.AssignmentExpressionNode') ~= nil) then
						goto _continue5
					end
					do
						local x = nil
						if (_vm:to_table_with_key(nn, '_isType.sling.model.AdditionAssignmentExpressionNode') ~= nil) then
							x = _g.sling.model.AdditionExpressionNode._construct0(_g.sling.model.AdditionExpressionNode._create())
						elseif (_vm:to_table_with_key(nn, '_isType.sling.model.BitwiseAndAssignmentExpressionNode') ~= nil) then
							x = _g.sling.model.BitwiseAndExpressionNode._construct0(_g.sling.model.BitwiseAndExpressionNode._create())
						elseif (_vm:to_table_with_key(nn, '_isType.sling.model.BitwiseOrAssignmentExpressionNode') ~= nil) then
							x = _g.sling.model.BitwiseOrExpressionNode._construct0(_g.sling.model.BitwiseOrExpressionNode._create())
						elseif (_vm:to_table_with_key(nn, '_isType.sling.model.BitwiseXorAssignmentExpressionNode') ~= nil) then
							x = _g.sling.model.BitwiseXorExpressionNode._construct0(_g.sling.model.BitwiseXorExpressionNode._create())
						elseif (_vm:to_table_with_key(nn, '_isType.sling.model.DivisionAssignmentExpressionNode') ~= nil) then
							x = _g.sling.model.DivisionExpressionNode._construct0(_g.sling.model.DivisionExpressionNode._create())
						elseif (_vm:to_table_with_key(nn, '_isType.sling.model.ExponentAssignmentExpressionNode') ~= nil) then
							x = _g.sling.model.ExponentExpressionNode._construct0(_g.sling.model.ExponentExpressionNode._create())
						elseif (_vm:to_table_with_key(nn, '_isType.sling.model.FloorDivisionAssignmentExpressionNode') ~= nil) then
							x = _g.sling.model.FloorDivisionExpressionNode._construct0(_g.sling.model.FloorDivisionExpressionNode._create())
						elseif (_vm:to_table_with_key(nn, '_isType.sling.model.ModuloAssignmentExpressionNode') ~= nil) then
							x = _g.sling.model.ModuloExpressionNode._construct0(_g.sling.model.ModuloExpressionNode._create())
						elseif (_vm:to_table_with_key(nn, '_isType.sling.model.MultiplicationAssignmentExpressionNode') ~= nil) then
							x = _g.sling.model.MultiplicationExpressionNode._construct0(_g.sling.model.MultiplicationExpressionNode._create())
						elseif (_vm:to_table_with_key(nn, '_isType.sling.model.ShiftLeftAssignmentExpressionNode') ~= nil) then
							x = _g.sling.model.ShiftLeftExpressionNode._construct0(_g.sling.model.ShiftLeftExpressionNode._create())
						elseif (_vm:to_table_with_key(nn, '_isType.sling.model.ShiftRightAssignmentExpressionNode') ~= nil) then
							x = _g.sling.model.ShiftRightExpressionNode._construct0(_g.sling.model.ShiftRightExpressionNode._create())
						elseif (_vm:to_table_with_key(nn, '_isType.sling.model.StringConcatenationAssignmentExpressionNode') ~= nil) then
							x = _g.sling.model.StringConcatenationExpressionNode._construct0(_g.sling.model.StringConcatenationExpressionNode._create())
						elseif (_vm:to_table_with_key(nn, '_isType.sling.model.SubtractionAssignmentExpressionNode') ~= nil) then
							x = _g.sling.model.SubtractionExpressionNode._construct0(_g.sling.model.SubtractionExpressionNode._create())
						else
							do _g.sling.common.RefLog:warning(ctx, "Unsupported assignment expression node: `" .. _g.jk.lang.String:safeString(nn:getNodeTypeName()) .. "'", nn) end
						end
						if x ~= nil then
							do x:setLeft(_g.sling.util.ExpressionUtil:dupAsExpression(nn:getLeft()), false) end
							do x:setRight(nn:exportRight(), false) end
							do
								local nx = _g.sling.model.AssignmentExpressionNode:forNodes(nn:exportLeft(), x)
								if not nn:replaceWith(nx, false) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to replace node", nn, nil))
								end
							end
						end
					end
				end
				::_continue5::
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:expandAssertStatements(ctx, node)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.AssertStatementNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local an = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.AssertStatementNode')
				if an ~= nil then
					local style = an:getStyle()
					if style == _g.sling.model.AssertStatementNode.STYLE_RETURN then
						local block = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
						local errorBlock = an:getErrorBlock()
						if errorBlock ~= nil then
							local array2 = errorBlock:exportNodes()
							if array2 ~= nil then
								local n2 = 0
								local m2 = _g.jk.lang.Vector:getSize(array2)
								do
									n2 = 0
									while n2 < m2 do
										local enode = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.common.NodeObject')
										if enode ~= nil then
											do block:addNode(enode) end
										end
										do n2 = n2 + 1 end
									end
								end
							end
						end
						do block:addNode(_g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.FailureLiteralExpressionNode._construct0(_g.sling.model.FailureLiteralExpressionNode._create()))) end
						do
							local xpr = nil
							local child = an:exportChild()
							if (_vm:to_table_with_key(child, '_isType.sling.model.ExpressionNode') ~= nil) then
								xpr = child
							elseif (_vm:to_table_with_key(child, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
								local vd = child
								local pp = _vm:to_table_with_key(an:getParent(), '_isType.sling.common.ContainerNode')
								if not (pp ~= nil) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Assert statement is not inside a container", an, nil))
								end
								do pp:insertAboveNode(child, an) end
								xpr = _g.sling.model.SymbolExpressionNode:forName(vd:getName())
							else
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported child type in assert statement", child, nil))
							end
							do
								local ifs = _g.sling.model.IfStatementNode:instance(_g.sling.model.LogicalNotExpressionNode:forExpression(xpr), block, nil)
								do ifs:setSource(an:getSource()) end
								do _g.sling.util.NodeUtil:replaceNode(an, ifs) end
							end
						end
					else
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:expandErrorStatements(ctx, node)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.ErrorStatementNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local error = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ErrorStatementNode')
				if error ~= nil then
					if error:getParent() == nil then
						goto _continue6
					end
					do
						local ff = _g.sling.util.FindUtil:findNearestFunctionBase(error)
						if not (ff ~= nil) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to find enclosing function", error, nil))
						end
						do
							local ffqn = nil
							if (_vm:to_table_with_key(ff, '_isType.sling.model.ConstructorDeclarationNode') ~= nil) then
								local ffp = ff:getParent()
								if not (ffp ~= nil) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Node has no parent", ff, nil))
								end
								ffqn = _g.sling.util.NodeUtil:getQualifiedNameString(ffp, 46)
							else
								ffqn = _g.sling.util.NodeUtil:getQualifiedNameString(ff, 46)
							end
							if _g.jk.lang.String:isEmpty(ffqn) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to find qualified name of method / function", ff, nil))
							end
							do
								local tokmsg = nil
								local tok = _vm:to_table_with_key(error:getSource(), '_isType.sling.common.Token')
								if tok ~= nil then
									local toksrc = tok.source
									if toksrc ~= nil then
										local ff = toksrc:getFile()
										if ff ~= nil then
											tokmsg = " (" .. _g.jk.lang.String:safeString(ff:baseName()) .. ":" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(tok.line + 1)) .. ":" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(tok.column + 1)) .. ")"
										end
									end
								end
								do
									local msg = error:getMessage()
									if _g.jk.lang.String:isEmpty(msg) then
										msg = "ERROR"
									end
									if tokmsg == nil then
										tokmsg = ""
									end
									do
										local line = "[" .. _g.jk.lang.String:safeString(ffqn) .. "]" .. _g.jk.lang.String:safeString(tokmsg) .. ": " .. _g.jk.lang.String:safeString(msg)
										local pl = _g.sling.model.PrintLineStatementNode:forExpression(_g.sling.model.StringLiteralExpressionNode:forValue(line))
										if not error:replaceWith(pl, false) then
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to replace node", error, nil))
										end
									end
								end
							end
						end
					end
				end
				::_continue6::
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:expandThisReferences(ctx, node)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.ThisDataTypeNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local nn = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ThisDataTypeNode')
				if nn ~= nil then
					local ee = _g.sling.util.FindUtil:findNearestEntity(nn)
					if not (ee ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No enclosing entity", nn, nil))
					end
					do
						local name = ee:getName()
						if _g.jk.lang.String:isEmpty(name) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Entity has no name", ee, nil))
						end
						do
							local ref = _g.sling.model.ReferenceDataTypeNode:forName(name)
							do ref:setSource(nn:getSource()) end
							do nn:replaceWith(ref, false) end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:expandForStatements(ctx, node)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.ForStatementNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local nn = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ForStatementNode')
				if nn ~= nil then
					local inits = nn:exportInitializer()
					local condition = nn:exportCondition()
					local finalizer = nn:exportFinalizer()
					local block = nn:exportBlock()
					if not (block ~= nil) then
						block = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
					end
					do
						local v = _g.sling.model.WhileStatementNode._construct0(_g.sling.model.WhileStatementNode._create())
						do v:setSource(nn:getSource()) end
						do v:setCondition(condition, false) end
						do v:setBlock(block, false) end
						do
							local mblock = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
							do mblock:setSource(nn:getSource()) end
							if inits ~= nil then
								local array2 = inits:getNodes()
								if array2 ~= nil then
									local n2 = 0
									local m2 = _g.jk.lang.Vector:getSize(array2)
									do
										n2 = 0
										while n2 < m2 do
											local init = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.common.NodeObject')
											if init ~= nil then
												do mblock:addNode(init) end
											end
											do n2 = n2 + 1 end
										end
									end
								end
							end
							do mblock:addNode(v) end
							do
								local olast = block:getLastNode()
								if olast ~= nil and ((_vm:to_table_with_key(olast, '_isType.sling.model.ReturnStatementNode') ~= nil) or (_vm:to_table_with_key(olast, '_isType.sling.model.ContinueStatementNode') ~= nil) or (_vm:to_table_with_key(olast, '_isType.sling.model.BreakStatementNode') ~= nil)) then
								else
									local bdup = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(finalizer), '_isType.sling.model.FlatBlockNode')
									if not (bdup ~= nil) then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to duplicate node", finalizer, nil))
									end
									do
										local array3 = bdup:exportNodes()
										if array3 ~= nil then
											local n3 = 0
											local m3 = _g.jk.lang.Vector:getSize(array3)
											do
												n3 = 0
												while n3 < m3 do
													local stmt = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.common.NodeObject')
													if stmt ~= nil then
														do block:addNode(stmt) end
													end
													do n3 = n3 + 1 end
												end
											end
										end
									end
								end
								do
									local array4 = _g.sling.util.NodeFinder:findNodesOfType(block, "class:sling.model.ContinueStatementNode", false, true, false)
									if array4 ~= nil then
										local n4 = 0
										local m4 = _g.jk.lang.Vector:getSize(array4)
										do
											n4 = 0
											while n4 < m4 do
												local cn = _vm:to_table_with_key(array4[n4 + 1], '_isType.sling.model.ContinueStatementNode')
												if cn ~= nil then
													local nb = _g.sling.util.FindUtil:findNearestLoop(cn)
													if nb ~= v then
														goto _continue7
													end
													do
														local cnp = _vm:to_table_with_key(cn:getParent(), '_isType.sling.common.ContainerNode')
														if not (cnp ~= nil) then
															do _g.sling.common.RefLog:warning(ctx, "Continue statement is not inside a container", cn) end
															goto _continue7
														end
														do
															local bdup = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(finalizer), '_isType.sling.model.FlatBlockNode')
															if not (bdup ~= nil) then
																_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to duplicate node", finalizer, nil))
															end
															do
																local array5 = bdup:exportNodes()
																if array5 ~= nil then
																	local n5 = 0
																	local m5 = _g.jk.lang.Vector:getSize(array5)
																	do
																		n5 = 0
																		while n5 < m5 do
																			local stmt = _vm:to_table_with_key(array5[n5 + 1], '_isType.sling.common.NodeObject')
																			if stmt ~= nil then
																				if not cnp:insertAboveNode(stmt, cn) then
																					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to insertAboveNode", cn, nil))
																				end
																			end
																			do n5 = n5 + 1 end
																		end
																	end
																end
															end
														end
													end
												end
												::_continue7::
												do n4 = n4 + 1 end
											end
										end
									end
									do nn:replaceWith(mblock, false) end
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

function sling.op.CommonOps:expandDynamicCastExpressions(ctx, node, excludeReferenceTypes)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.DynamicCastExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local nn = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.DynamicCastExpressionNode')
				if nn ~= nil then
					local type = nn:getType()
					if excludeReferenceTypes and (_vm:to_table_with_key(type, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
						goto _continue8
					end
					do
						local xpr = nn:exportExpression()
						local fd = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
						do fd:setSource(nn:getSource()) end
						do fd:setReturnType(_vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(type), '_isType.sling.common.DataTypeNode'), false) end
						do
							local vd = _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create()), "o", nil)
							do fd:addToParameters(vd) end
							do
								local block = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
								local condition = _g.sling.model.TypeCheckExpressionNode:instance(_vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(type), '_isType.sling.common.DataTypeNode'), _g.sling.model.SymbolExpressionNode:forBoundName("o", vd, nil), false)
								local value = _g.sling.model.StaticCastExpressionNode:instance(_vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(type), '_isType.sling.common.DataTypeNode'), _g.sling.model.SymbolExpressionNode:forBoundName("o", vd, nil))
								do block:addNode(_g.sling.model.IfStatementNode:forStatement(condition, _g.sling.model.ReturnStatementNode:forExpression(value))) end
								do block:addNode(_g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()))) end
								do fd:setBody(block, false) end
								do
									local fdx = _g.sling.model.FunctionDeclarationExpressionNode:forDeclaration(fd)
									do fdx:setSource(nn:getSource()) end
									do
										local fc = _g.sling.model.FunctionCallExpressionNode:forExpression(fdx)
										do fc:setSource(nn:getSource()) end
										do fc:addToParameters(xpr) end
										do fc:setResolvedDataType(_g.sling.util.DataTypeUtil:dupAsDataType(type), false) end
										do nn:replaceWith(fc, false) end
									end
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

function sling.op.CommonOps:changeContinueToGoto(ctx, node)
	local counter = 1
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.ContinueStatementNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local nn = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ContinueStatementNode')
				if nn ~= nil then
					local lp = _g.sling.util.FindUtil:findNearestLoop(nn)
					if not (lp ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No enclosing loop", nn, nil))
					end
					do
						local block = lp:getBlock()
						if not (block ~= nil) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No block", _vm:to_table_with_key(lp, '_isType.sling.common.NodeObject'), nil))
						end
						do
							local last = block:getLastNode()
							local labelname = nil
							if last ~= nil and (_vm:to_table_with_key(last, '_isType.sling.model.LabeledStatementNode') ~= nil) then
								labelname = last:getName()
							end
							if _g.jk.lang.String:isEmpty(labelname) then
								labelname = "_continue" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger((function() local v = counter counter = counter + 1 return v end)()))
								do block:addNode(_g.sling.model.LabeledStatementNode:forLabel(labelname)) end
							end
							do
								local _goto = _g.sling.model.GoToLabelStatementNode._construct0(_g.sling.model.GoToLabelStatementNode._create())
								do _goto:setTarget(_g.sling.model.SymbolExpressionNode:forName(labelname), false) end
								do nn:replaceWith(_goto, false) end
							end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:wrapAssignmentsInExpressions(ctx, node)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.AssignmentExpressionNode", true, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local nn = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.AssignmentExpressionNode')
				if nn ~= nil then
					local pp = nn:getParent()
					if pp ~= nil and (_vm:to_table_with_key(pp, '_isType.sling.model.BlockNode') ~= nil) then
						goto _continue9
					end
					do
						local fc = _g.sling.model.FunctionCallExpressionNode._construct0(_g.sling.model.FunctionCallExpressionNode._create())
						do _g.sling.util.NodeUtil:replaceAndExport(nn, fc) end
						do
							local fd = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
							do _g.sling.util.FunctionUtil:addStatement(fd, nn) end
							do
								local left = _g.sling.util.ExpressionUtil:dupAsExpression(nn:getLeft())
								local type = _g.sling.util.ExpressionUtil:tryGetExpressionDataType(left, nil)
								do _g.sling.util.FunctionUtil:addStatement(fd, _g.sling.model.ReturnStatementNode:forExpression(left)) end
								if type ~= nil then
									do fd:setReturnType(_g.sling.util.DataTypeUtil:dupAsDataType(type), false) end
									do fc:setResolvedDataType(_g.sling.util.DataTypeUtil:dupAsDataType(type), false) end
								end
								do fc:setExpression(_g.sling.model.FunctionDeclarationExpressionNode:forDeclaration(fd), false) end
								do fc:setSource(nn:getSource()) end
							end
						end
					end
				end
				::_continue9::
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:switchContainsUnsupportedCase(statement, supportedCaseBlocks)
	local cases = statement:getBlocks()
	if _g.jk.lang.Vector:isEmpty(cases) then
		do return false end
	end
	if _g.jk.lang.Array:isEmpty(supportedCaseBlocks) then
		do return true end
	end
	if cases ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(cases)
		do
			n = 0
			while n < m do
				local block = _vm:to_table_with_key(cases[n + 1], '_isType.sling.model.CaseBlockNode')
				if block ~= nil then
					local tinfo = _vm:get_datatype_info(block)
					local isnot = true
					if supportedCaseBlocks ~= nil then
						local n2 = 0
						local m2 = #supportedCaseBlocks
						do
							n2 = 0
							while n2 < m2 do
								local info = supportedCaseBlocks[n2 + 1]
								if info ~= nil then
									if tinfo == info then
										isnot = false
										do break end
									end
								end
								do n2 = n2 + 1 end
							end
						end
					end
					if isnot then
						do return true end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return false end
end

function sling.op.CommonOps:convertSwitchToIf(ctx, node, blocks)
	local supportedCaseBlocks = blocks
	if not (supportedCaseBlocks ~= nil) then
		supportedCaseBlocks = {
			"class:sling.model.CaseEqualsBlockNode",
			"class:sling.model.CaseDefaultBlockNode"
		}
	end
	do
		local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.SwitchStatementNode", false, true, false)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local ss = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.SwitchStatementNode')
					if ss ~= nil then
						if not _g.sling.op.CommonOps:switchContainsUnsupportedCase(ss, supportedCaseBlocks) then
							goto _continue10
						end
						do
							local xpr = ss:exportExpression()
							if not (xpr ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No expression in switch statement", ss, nil))
							end
							do
								local varname = _g.sling.util.FunctionUtil:findUniqueVariableNameForNode(ss, "v")
								local body = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
								local vd = _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create()), varname, xpr)
								do body:addNode(vd) end
								do
									local prev = nil
									local defaultBlock = nil
									local array2 = ss:getBlocks()
									if array2 ~= nil then
										local n2 = 0
										local m2 = _g.jk.lang.Vector:getSize(array2)
										do
											n2 = 0
											while n2 < m2 do
												local block = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.CaseBlockNode')
												if block ~= nil then
													local ifs = nil
													if (_vm:to_table_with_key(block, '_isType.sling.model.CaseDefaultBlockNode') ~= nil) then
														if defaultBlock ~= nil then
															_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Duplicate default block in switch statement", block, nil))
														end
														defaultBlock = block:exportBlock()
													elseif (_vm:to_table_with_key(block, '_isType.sling.model.CaseEqualsBlockNode') ~= nil) then
														ifs = _g.sling.model.IfStatementNode._construct0(_g.sling.model.IfStatementNode._create())
														do
															local eqx = _g.sling.model.EqualsExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), block:exportExpression())
															do ifs:setCondition(eqx, false) end
															do ifs:setIfBlock(block:exportBlock(), false) end
														end
													elseif (_vm:to_table_with_key(block, '_isType.sling.model.CaseLessThanBlockNode') ~= nil) then
														ifs = _g.sling.model.IfStatementNode._construct0(_g.sling.model.IfStatementNode._create())
														do
															local lsx = _g.sling.model.LessThanExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), block:exportExpression())
															do ifs:setCondition(lsx, false) end
															do ifs:setIfBlock(block:exportBlock(), false) end
														end
													elseif (_vm:to_table_with_key(block, '_isType.sling.model.CaseLessOrEqualBlockNode') ~= nil) then
														ifs = _g.sling.model.IfStatementNode._construct0(_g.sling.model.IfStatementNode._create())
														do
															local loe = _g.sling.model.LessOrEqualExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), block:exportExpression())
															do ifs:setCondition(loe, false) end
															do ifs:setIfBlock(block:exportBlock(), false) end
														end
													elseif (_vm:to_table_with_key(block, '_isType.sling.model.CaseNotEqualsBlockNode') ~= nil) then
														ifs = _g.sling.model.IfStatementNode._construct0(_g.sling.model.IfStatementNode._create())
														do
															local lnt = _g.sling.model.NotEqualsExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), block:exportExpression())
															do ifs:setCondition(lnt, false) end
															do ifs:setIfBlock(block:exportBlock(), false) end
														end
													elseif (_vm:to_table_with_key(block, '_isType.sling.model.CaseGreaterThanBlockNode') ~= nil) then
														ifs = _g.sling.model.IfStatementNode._construct0(_g.sling.model.IfStatementNode._create())
														do
															local gtx = _g.sling.model.GreaterThanExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), block:exportExpression())
															do ifs:setCondition(gtx, false) end
															do ifs:setIfBlock(block:exportBlock(), false) end
														end
													elseif (_vm:to_table_with_key(block, '_isType.sling.model.CaseGreaterOrEqualBlockNode') ~= nil) then
														ifs = _g.sling.model.IfStatementNode._construct0(_g.sling.model.IfStatementNode._create())
														do
															local goe = _g.sling.model.GreaterOrEqualExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), block:exportExpression())
															do ifs:setCondition(goe, false) end
															do ifs:setIfBlock(block:exportBlock(), false) end
														end
													elseif (_vm:to_table_with_key(block, '_isType.sling.model.CaseRangeBlockNode') ~= nil) then
														ifs = _g.sling.model.IfStatementNode._construct0(_g.sling.model.IfStatementNode._create())
														do
															local range = block
															local cond1 = nil
															local cond2 = nil
															local xtype = range:getExclusionType()
															if xtype == _g.sling.model.RangeExpressionNode.TYPE_EXCLUDE_BOTH_BOUNDS then
																cond1 = _g.sling.model.GreaterThanExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), range:exportLowerBound())
																cond2 = _g.sling.model.LessThanExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), range:exportUpperBound())
															elseif xtype == _g.sling.model.RangeExpressionNode.TYPE_EXCLUDE_UPPER_BOUND then
																cond1 = _g.sling.model.GreaterOrEqualExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), range:exportLowerBound())
																cond2 = _g.sling.model.LessThanExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), range:exportUpperBound())
															elseif xtype == _g.sling.model.RangeExpressionNode.TYPE_EXCLUDE_LOWER_BOUND then
																cond1 = _g.sling.model.GreaterThanExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), range:exportLowerBound())
																cond2 = _g.sling.model.LessOrEqualExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), range:exportUpperBound())
															else
																cond1 = _g.sling.model.GreaterOrEqualExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), range:exportLowerBound())
																cond2 = _g.sling.model.LessOrEqualExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), range:exportUpperBound())
															end
															do ifs:setCondition(_g.sling.model.LogicalAndExpressionNode:instance(cond1, cond2), false) end
															do ifs:setIfBlock(block:exportBlock(), false) end
														end
													elseif (_vm:to_table_with_key(block, '_isType.sling.model.CaseMultipleEqualsBlockNode') ~= nil) then
														ifs = _g.sling.model.IfStatementNode._construct0(_g.sling.model.IfStatementNode._create())
														do
															local con = nil
															local array3 = block:exportExpressions()
															if array3 ~= nil then
																local n3 = 0
																local m3 = _g.jk.lang.Vector:getSize(array3)
																do
																	n3 = 0
																	while n3 < m3 do
																		local exp = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.model.ExpressionNode')
																		if exp ~= nil then
																			local com = nil
																			if (_vm:to_table_with_key(exp, '_isType.sling.model.RangeExpressionNode') ~= nil) then
																				local range = exp
																				local cond1 = nil
																				local cond2 = nil
																				local xtype = range:getExclusionType()
																				if xtype == _g.sling.model.RangeExpressionNode.TYPE_EXCLUDE_BOTH_BOUNDS then
																					cond1 = _g.sling.model.GreaterThanExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), range:exportLowerBound())
																					cond2 = _g.sling.model.LessThanExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), range:exportUpperBound())
																				elseif xtype == _g.sling.model.RangeExpressionNode.TYPE_EXCLUDE_UPPER_BOUND then
																					cond1 = _g.sling.model.GreaterOrEqualExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), range:exportLowerBound())
																					cond2 = _g.sling.model.LessThanExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), range:exportUpperBound())
																				elseif xtype == _g.sling.model.RangeExpressionNode.TYPE_EXCLUDE_LOWER_BOUND then
																					cond1 = _g.sling.model.GreaterThanExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), range:exportLowerBound())
																					cond2 = _g.sling.model.LessOrEqualExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), range:exportUpperBound())
																				else
																					cond1 = _g.sling.model.GreaterOrEqualExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), range:exportLowerBound())
																					cond2 = _g.sling.model.LessOrEqualExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), range:exportUpperBound())
																				end
																				com = _g.sling.model.LogicalAndExpressionNode:instance(cond1, cond2)
																			else
																				com = _g.sling.model.EqualsExpressionNode:instance(_g.sling.model.SymbolExpressionNode:forName(varname), exp)
																			end
																			if con ~= nil then
																				con = _g.sling.model.LogicalOrExpressionNode:instance(con, com)
																			else
																				con = com
																			end
																		end
																		do n3 = n3 + 1 end
																	end
																end
															end
															do ifs:setCondition(con, false) end
															do ifs:setIfBlock(block:exportBlock(), false) end
														end
													elseif (_vm:to_table_with_key(block, '_isType.sling.model.CaseTypePatternBlockNode') ~= nil) then
														ifs = _g.sling.model.IfStatementNode._construct0(_g.sling.model.IfStatementNode._create())
														do
															local ctp = block
															local type = ctp:exportType()
															local tc = _g.sling.model.TypeCheckExpressionNode:instance(type, _g.sling.model.SymbolExpressionNode:forName(varname), false)
															do ifs:setCondition(tc, false) end
															do
																local cast = _g.sling.model.DynamicCastExpressionNode:instance(type, _g.sling.model.SymbolExpressionNode:forName(varname))
																local eb = block:exportBlock()
																do eb:prependNode(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create()), ctp:getName(), cast)) end
																do ifs:setIfBlock(eb, false) end
															end
														end
													else
														_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported case block node", block, nil))
													end
													if prev ~= nil then
														do prev:setElseBlock(_g.sling.model.BlockNode:forStatement(ifs), false) end
													else
														do body:addNode(ifs) end
													end
													if ifs ~= nil then
														prev = ifs
													end
												end
												do n2 = n2 + 1 end
											end
										end
									end
									if defaultBlock ~= nil then
										if prev ~= nil then
											do prev:setElseBlock(defaultBlock, false) end
										else
											do body:addNode(defaultBlock) end
										end
									end
									do _g.sling.util.NodeUtil:replaceNode(ss, body) end
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
end

function sling.op.CommonOps:addReturnToMainFunction(ctx, node)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.MainFunctionDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local mainf = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.MainFunctionDeclarationNode')
				if mainf ~= nil then
					local body = mainf:getBody()
					if body ~= nil then
						local found = false
						local array2 = body:getNodes()
						if array2 ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(array2)
							do
								n2 = 0
								while n2 < m2 do
									local rr = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.ReturnStatementNode')
									if rr ~= nil then
										found = true
										do break end
									end
									do n2 = n2 + 1 end
								end
							end
						end
						if not found then
							do body:addNode(_g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.IntegerLiteralExpressionNode:forValue(0))) end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:expandStubFunctions(ctx, root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.FunctionDeclarationBaseNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FunctionDeclarationBaseNode')
				if node ~= nil then
					if not _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.model.Modifier.STUB) then
						goto _continue11
					end
					if _vm:to_table_with_key(node:getParent(), '_isType.sling.model.InterfaceDeclarationNode') ~= nil and _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.model.Modifier.STATIC) == false then
						goto _continue11
					end
					if _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.model.Modifier.ABSTRACT) then
						goto _continue11
					end
					if node:getBody() ~= nil then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Stub function already has a body. Either remove the modifier or the body.", node, nil))
					end
					do
						local block = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
						local eename = nil
						local ffname = nil
						local ee = _g.sling.util.FindUtil:findNearestEntity(node)
						if ee ~= nil then
							eename = _g.sling.util.NodeUtil:getQualifiedNameString(ee, 46)
							if _g.jk.lang.String:isEmpty(eename) then
								eename = "UNNAMED_ENTITY"
							end
						else
							eename = "NO_ENTITY"
						end
						if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
							ffname = node:getName()
						elseif (_vm:to_table_with_key(node, '_isType.sling.model.ConstructorDeclarationNode') ~= nil) then
							ffname = "(constructor)"
						elseif (_vm:to_table_with_key(node, '_isType.sling.model.DestructorDeclarationNode') ~= nil) then
							ffname = "(destructor)"
						end
						if _g.jk.lang.String:isEmpty(ffname) then
							ffname = "UNKNOWN_FUNCTION"
						end
						do
							local lit = _g.sling.model.StringLiteralExpressionNode:forValue("--- stub --- " .. _g.jk.lang.String:safeString(eename) .. " :: " .. _g.jk.lang.String:safeString(ffname))
							do block:addNode(_g.sling.model.PrintLineStatementNode:forExpression(lit)) end
							do
								local rf = nil
								if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
									rf = _g.sling.util.DataTypeUtil:createDefaultValue(node:getReturnType())
								end
								if rf ~= nil then
									do block:addNode(_g.sling.model.ReturnStatementNode:forExpression(rf)) end
								end
								do node:setBody(block, false) end
								do _g.sling.util.ModifierUtil:removeCommonModifier(node, _g.sling.model.Modifier.STUB) end
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

function sling.op.CommonOps:fixInheritanceTypes(ctx, tr, root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.BaseTypeNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.BaseTypeNode')
				if node ~= nil then
					if node:getInheritType() == _g.sling.model.BaseTypeNode.INHERIT_AUTO then
						do node:setInheritType(tr:getRealInheritType(node)) end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:setDefaultValuesInVariableDeclarations(ctx, root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.VariableDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.VariableDeclarationNode')
				if node ~= nil then
					if node:getInitializer() ~= nil then
						goto _continue12
					end
					do
						local pp = node:getParent()
						if (_vm:to_table_with_key(pp, '_isType.sling.model.EntityDeclarationNode') ~= nil) == false and (_vm:to_table_with_key(pp, '_isType.sling.model.BlockNode') ~= nil) == false then
							goto _continue12
						end
						do node:setInitializer(_g.sling.model.DataTypeDefaultValueExpressionNode:forType(_g.sling.util.DataTypeUtil:dupAsDataType(node:getType())), false) end
					end
				end
				::_continue12::
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:createDefaultConstructors(ctx, root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.ClassDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ClassDeclarationNode')
				if node ~= nil then
					if (_vm:to_table_with_key(node, '_isType.sling.model.TemplateDeclarationNode') ~= nil) then
						goto _continue13
					end
					do
						local found = false
						local array2 = node:getNodes()
						if array2 ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(array2)
							do
								n2 = 0
								while n2 < m2 do
									local nd = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.common.NodeObject')
									if nd ~= nil then
										if (_vm:to_table_with_key(nd, '_isType.sling.model.ConstructorDeclarationNode') ~= nil) == false then
											goto _continue14
										end
										do
											local params = nd:getParameters()
											if _g.jk.lang.Vector:isEmpty(params) then
												found = true
												do break end
											end
										end
									end
									::_continue14::
									do n2 = n2 + 1 end
								end
							end
						end
						if found == false then
							local nc = _g.sling.model.ConstructorDeclarationNode._construct0(_g.sling.model.ConstructorDeclarationNode._create())
							do _g.sling.util.ModifierUtil:addCommonModifier(nc, _g.sling.model.Modifier.PUBLIC) end
							do nc:setBody(_g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create()), false) end
							do node:prependNode(nc) end
						end
					end
				end
				::_continue13::
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:handleMainFunctionsForAllScripts(ctx, root, generateMainCall, argSymbolName)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.common.CodeFileNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local script = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.CodeFileNode')
				if script ~= nil then
					local lastMainFunction = nil
					local array2 = _g.sling.util.NodeFinder:findCompatibleNodes(script, "class:sling.model.MainFunctionDeclarationNode", false, true, false)
					if array2 ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(array2)
						do
							n2 = 0
							while n2 < m2 do
								local mainf = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.MainFunctionDeclarationNode')
								if mainf ~= nil then
									if lastMainFunction ~= nil then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Duplicate main function declaration inside a script", mainf, nil))
									end
									do
										local name = mainf:getArgumentArrayName()
										if _g.jk.lang.String:isEmpty(name) then
											name = "args"
										end
										do
											local fd = _g.sling.model.FunctionDeclarationNode:forName("_main", false)
											do _g.sling.util.ModifierUtil:addCommonModifier(fd, _g.sling.model.Modifier.PUBLIC) end
											do _g.sling.util.ModifierUtil:addCommonModifier(fd, _g.sling.model.Modifier.STATIC) end
											do
												local adt = _g.sling.model.StaticArrayDataTypeNode:forPrimaryType(_g.sling.model.StringDataTypeNode._construct0(_g.sling.model.StringDataTypeNode._create()), nil)
												do fd:addToParameters(_g.sling.model.VariableDeclarationNode:instance(adt, name, nil)) end
												do fd:setReturnType(_g.sling.model.IntegerDataTypeNode._construct0(_g.sling.model.IntegerDataTypeNode._create()), false) end
												do fd:setBody(mainf:exportBody(), false) end
												do _g.sling.util.NodeUtil:replaceNode(mainf, fd) end
												lastMainFunction = fd
											end
										end
									end
								end
								do n2 = n2 + 1 end
							end
						end
					end
					if lastMainFunction ~= nil then
						local qs = _g.sling.util.NodeUtil:getQualifiedNameString(lastMainFunction, 46)
						if not (qs == "_main") then
							local fd = _g.sling.model.FunctionDeclarationNode:forName("_main", false)
							do _g.sling.util.ModifierUtil:addCommonModifier(fd, _g.sling.model.Modifier.PUBLIC) end
							do _g.sling.util.ModifierUtil:addCommonModifier(fd, _g.sling.model.Modifier.STATIC) end
							do
								local adt = _g.sling.model.StaticArrayDataTypeNode:forPrimaryType(_g.sling.model.StringDataTypeNode._construct0(_g.sling.model.StringDataTypeNode._create()), nil)
								do fd:addToParameters(_g.sling.model.VariableDeclarationNode:instance(adt, "args", nil)) end
								do fd:setReturnType(_g.sling.util.DataTypeUtil:dupAsDataType(lastMainFunction:getReturnType()), false) end
								do
									local xpr = _g.sling.model.FunctionCallExpressionNode:forExpression(_g.sling.model.SymbolExpressionNode:forBinding(lastMainFunction, nil))
									do xpr:addToParameters(_g.sling.model.SymbolExpressionNode:forName("args")) end
									do _g.sling.util.FunctionUtil:addStatement(fd, _g.sling.model.ReturnStatementNode:forExpression(xpr)) end
									do script:addToNodes(fd) end
									lastMainFunction = fd
								end
							end
						end
					end
					if generateMainCall and lastMainFunction ~= nil then
						local ms = _g.sling.model.SymbolExpressionNode:forBinding(lastMainFunction, nil)
						local fc = _g.sling.model.FunctionCallExpressionNode:forExpression(ms)
						if argSymbolName ~= nil then
							do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forName(argSymbolName)) end
						end
						do script:addToNodes(fc) end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:determineAccessType(node)
	local left = node:getParentExpression()
	if not (left ~= nil) then
		do return _g.sling.model.MemberAccessExpressionNode.TYPE_AUTO end
	end
	do
		local v = _g.sling.model.MemberAccessExpressionNode.TYPE_INSTANCE
		if (_vm:to_table_with_key(left, '_isType.sling.model.SymbolExpressionNode') ~= nil) then
			local bound = _g.sling.util.SymbolUtil:tryGetSymbolBindingForExpression(left)
			if bound ~= nil and ((_vm:to_table_with_key(bound, '_isType.sling.model.EntityDeclarationNode') ~= nil) or (_vm:to_table_with_key(bound, '_isType.sling.model.NamespaceNode') ~= nil)) then
				v = _g.sling.model.MemberAccessExpressionNode.TYPE_STATIC
			end
		end
		do
			local right = _vm:to_table_with_key(node:getChildExpression(), '_isType.sling.model.SymbolExpressionNode')
			if right ~= nil then
				local bound = _g.sling.util.SymbolUtil:tryGetSymbolBindingForExpression(right)
				if bound ~= nil then
					if (_vm:to_table_with_key(bound, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
						if v == _g.sling.model.MemberAccessExpressionNode.TYPE_STATIC then
							do return _g.sling.model.MemberAccessExpressionNode.TYPE_STATIC_VARIABLE end
						else
							do return _g.sling.model.MemberAccessExpressionNode.TYPE_INSTANCE_VARIABLE end
						end
					elseif (_vm:to_table_with_key(bound, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
						if v == _g.sling.model.MemberAccessExpressionNode.TYPE_STATIC then
							do return _g.sling.model.MemberAccessExpressionNode.TYPE_STATIC_FUNCTION end
						else
							do return _g.sling.model.MemberAccessExpressionNode.TYPE_INSTANCE_FUNCTION end
						end
					end
				end
			end
			do return v end
		end
	end
end

function sling.op.CommonOps:determineAndSetAccessType(node)
	do node:setAccessType(_g.sling.op.CommonOps:determineAccessType(node)) end
end

function sling.op.CommonOps:setMemberAccessExpressionTypes(ctx, root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.MemberAccessExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local max = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.MemberAccessExpressionNode')
				if max ~= nil then
					if max:getAccessType() == _g.sling.model.MemberAccessExpressionNode.TYPE_AUTO then
						do _g.sling.op.CommonOps:determineAndSetAccessType(max) end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:forceUnresolveSymbols(root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.SymbolNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local symbol = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.SymbolNode')
				if symbol ~= nil then
					if _g.jk.lang.Vector:isNotEmpty(symbol:getComponents()) then
						do symbol:setBinding(nil, nil) end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do
		local array2 = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.FunctionDeclarationNode", false, true, false)
		if array2 ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(array2)
			do
				n2 = 0
				while n2 < m2 do
					local ff = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.FunctionDeclarationNode')
					if ff ~= nil then
						do ff:setBaseClassDeclaration(nil, nil) end
						do ff:setOverridingDeclarations(nil) end
						do ff:setImplementedDeclarations(nil) end
					end
					do n2 = n2 + 1 end
				end
			end
		end
		do
			local array3 = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.ExpressionNode", false, true, false)
			if array3 ~= nil then
				local n3 = 0
				local m3 = _g.jk.lang.Vector:getSize(array3)
				do
					n3 = 0
					while n3 < m3 do
						local xpr = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.model.ExpressionNode')
						if xpr ~= nil then
							do xpr:setResolvedDataType(nil, false) end
						end
						do n3 = n3 + 1 end
					end
				end
			end
		end
	end
end

function sling.op.CommonOps:isLastSymbolInMemberAccessExpressionWithOnlySymbols(xpr)
	if not (xpr ~= nil) then
		do return false end
	end
	do
		local pp = _vm:to_table_with_key(xpr:getParent(), '_isType.sling.model.MemberAccessExpressionNode')
		if not (pp ~= nil) then
			do return false end
		end
		do
			local last = pp:getLastNode()
			if not (last ~= nil) then
				do return false end
			end
			if not (last == xpr) then
				do return false end
			end
			do
				local cc = last
				while cc ~= nil do
					if (_vm:to_table_with_key(not (cc ~= nil), '_isType.sling.model.SymbolExpressionNode') ~= nil) then
						do return false end
					end
					cc = _g.sling.model.MemberAccessExpressionNode:getPreviousNode(cc)
				end
				do return true end
			end
		end
	end
end

function sling.op.CommonOps:nodeHasCommonModifier(node, mod)
	do return _g.sling.util.ModifierUtil:hasCommonModifier(node, mod) end
end

function sling.op.CommonOps:unresolveSymbols(ctx, root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.SymbolNode", true, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local symbol = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.SymbolNode')
				if symbol ~= nil then
					if not (symbol:getParent() ~= nil) then
						goto _continue15
					end
					do
						local binding = symbol:getBinding()
						if not (binding ~= nil) then
							goto _continue15
						end
						if (_vm:to_table_with_key(binding, '_isType.sling.model.MagicalClassDeclarationNode') ~= nil) then
							goto _continue15
						end
						do
							local sxpr = _vm:to_table_with_key(symbol:getParent(), '_isType.sling.model.SymbolExpressionNode')
							if sxpr ~= nil and ((_vm:to_table_with_key(binding, '_isType.sling.model.EntityDeclarationNode') ~= nil) or _g.sling.op.CommonOps:nodeHasCommonModifier(binding, _g.sling.model.Modifier.STATIC)) and _g.sling.op.CommonOps:isLastSymbolInMemberAccessExpressionWithOnlySymbols(sxpr) then
								local comps = _g.sling.util.SymbolUtil:getSymbolComponents(symbol)
								if _g.jk.lang.Vector:isEmpty(comps) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Empty symbol components when unresolving (4)", symbol, nil))
								end
								do symbol:setBinding(nil, nil) end
								do symbol:clearComponents() end
								if comps ~= nil then
									local n2 = 0
									local m2 = _g.jk.lang.Vector:getSize(comps)
									do
										n2 = 0
										while n2 < m2 do
											local comp = _vm:to_table_with_key(comps[n2 + 1], '_isType.sling.model.SymbolNameComponentNode')
											if comp ~= nil then
												do symbol:addToComponents(comp) end
											end
											do n2 = n2 + 1 end
										end
									end
								end
								do _g.sling.util.ModifierUtil:addCommonModifier(symbol, _g.sling.model.Modifier.GLOBAL) end
								do
									local root = _g.sling.model.MemberAccessExpressionNode:findFromChild(sxpr)
									if not (root ~= nil) then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to find root member access expression", sxpr, nil))
									end
									do _g.sling.util.NodeUtil:exportNode(sxpr) end
									do _g.sling.util.NodeUtil:replaceNode(root, sxpr) end
								end
							elseif sxpr ~= nil and _g.sling.model.MemberAccessExpressionNode:isChild(sxpr) then
								local name = _g.sling.util.SymbolUtil:getSymbolName(symbol)
								if _g.jk.lang.String:isEmpty(name) then
									local re = _g.sling.common.ReferenceError:forMessage("Empty name when unresolving (1)", symbol, nil)
									local binding = symbol:getBinding()
									if binding ~= nil then
										do re:addRelatedMessage("Symbol is bound to this", binding) end
									end
									_vm:throw_error(re)
								end
								do symbol:setBinding(nil, nil) end
								do symbol:clearComponents() end
								do symbol:addToComponents(_g.sling.model.SymbolNameComponentNode:forName(name)) end
							elseif (_vm:to_table_with_key(binding, '_isType.sling.model.EntityDeclarationNode') ~= nil) == false and _g.sling.op.CommonOps:nodeHasCommonModifier(binding, _g.sling.model.Modifier.STATIC) == false then
								local name = _g.sling.util.SymbolUtil:getSymbolName(symbol)
								if _g.jk.lang.String:isEmpty(name) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Empty name when unresolving (3)", symbol, nil))
								end
								do symbol:setBinding(nil, nil) end
								do symbol:clearComponents() end
								do symbol:addToComponents(_g.sling.model.SymbolNameComponentNode:forName(name)) end
							else
								local comps = _g.sling.util.SymbolUtil:getSymbolComponents(symbol)
								if _g.jk.lang.Vector:isEmpty(comps) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Empty symbol components when unresolving (4)", symbol, nil))
								end
								do symbol:setBinding(nil, nil) end
								do symbol:clearComponents() end
								if comps ~= nil then
									local n3 = 0
									local m3 = _g.jk.lang.Vector:getSize(comps)
									do
										n3 = 0
										while n3 < m3 do
											local comp = _vm:to_table_with_key(comps[n3 + 1], '_isType.sling.model.SymbolNameComponentNode')
											if comp ~= nil then
												do symbol:addToComponents(comp) end
											end
											do n3 = n3 + 1 end
										end
									end
								end
								if (_vm:to_table_with_key(binding, '_isType.sling.model.TemplateDeclarationNode') ~= nil) == false then
									do _g.sling.util.ModifierUtil:addCommonModifier(symbol, _g.sling.model.Modifier.GLOBAL) end
								end
							end
						end
					end
				end
				::_continue15::
				do n = n + 1 end
			end
		end
	end
	do
		local array2 = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.FunctionDeclarationNode", false, true, false)
		if array2 ~= nil then
			local n4 = 0
			local m4 = _g.jk.lang.Vector:getSize(array2)
			do
				n4 = 0
				while n4 < m4 do
					local ff = _vm:to_table_with_key(array2[n4 + 1], '_isType.sling.model.FunctionDeclarationNode')
					if ff ~= nil then
						do ff:setBaseClassDeclaration(nil, nil) end
						do ff:setOverridingDeclarations(nil) end
						do ff:setImplementedDeclarations(nil) end
					end
					do n4 = n4 + 1 end
				end
			end
		end
		do
			local array3 = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.ExpressionNode", false, true, false)
			if array3 ~= nil then
				local n5 = 0
				local m5 = _g.jk.lang.Vector:getSize(array3)
				do
					n5 = 0
					while n5 < m5 do
						local xpr = _vm:to_table_with_key(array3[n5 + 1], '_isType.sling.model.ExpressionNode')
						if xpr ~= nil then
							do xpr:setResolvedDataType(nil, false) end
						end
						do n5 = n5 + 1 end
					end
				end
			end
		end
	end
end

function sling.op.CommonOps:isSelfEntity(symentity, binentity, tr)
	if symentity == binentity then
		do return true end
	end
	if tr:isBaseTypeOf(symentity, binentity) then
		do return true end
	end
	do return false end
end

function sling.op.CommonOps:addExplicitCurrentObjectExpressions(ctx, tr, root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.SymbolExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local sex = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.SymbolExpressionNode')
				if sex ~= nil then
					local pax = _vm:to_table_with_key(sex:getParent(), '_isType.sling.model.MemberAccessExpressionNode')
					if pax ~= nil then
						if pax:getParentExpression() == sex and (_vm:to_table_with_key(pax:getParent(), '_isType.sling.model.MemberAccessExpressionNode') ~= nil) == false then
						else
							goto _continue16
						end
					end
					do
						local symbol = sex:getSymbol()
						if not (symbol ~= nil) then
							goto _continue16
						end
						do
							local binding = symbol:getBinding()
							if not (binding ~= nil) then
								goto _continue16
							end
							if _g.sling.op.CommonOps:nodeHasCommonModifier(binding, _g.sling.model.Modifier.STATIC) then
								goto _continue16
							end
							do
								local symentity = _g.sling.util.FindUtil:findNearestEntity(symbol)
								if not (symentity ~= nil) then
									goto _continue16
								end
								do
									local binentity = binding:getParent()
									if not _g.sling.op.CommonOps:isSelfEntity(symentity, binentity, tr) then
										goto _continue16
									end
									do
										local max = _g.sling.model.MemberAccessExpressionNode._construct0(_g.sling.model.MemberAccessExpressionNode._create())
										do _g.sling.util.NodeUtil:replaceAndExport(sex, max) end
										do max:setParentExpression(_g.sling.model.CurrentObjectExpressionNode._construct0(_g.sling.model.CurrentObjectExpressionNode._create()), false) end
										do max:setChildExpression(sex, false) end
										do max:setSource(sex:getSource()) end
										do
											local xx = _g.sling.util.ExpressionUtil:tryGetExpressionDataType(sex, nil)
											if xx ~= nil then
												do max:setResolvedDataType(_g.sling.util.DataTypeUtil:dupAsDataType(xx), false) end
											else
												do tr:execute(max) end
											end
										end
									end
								end
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

function sling.op.CommonOps:addBaseCallsToConstructors(ctx, resolver, root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.ConstructorDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local ct = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ConstructorDeclarationNode')
				if ct ~= nil then
					do _g.sling.util.FunctionUtil:addBaseClassCallParameters(resolver, ct, false, false) end
				end
				do n = n + 1 end
			end
		end
	end
end

sling.op.CommonOps.ProcessedTracker = {}
sling.op.CommonOps.ProcessedTracker.__index = sling.op.CommonOps.ProcessedTracker
_vm:set_metatable(sling.op.CommonOps.ProcessedTracker, {})

function sling.op.CommonOps.ProcessedTracker._create()
	local v = _vm:set_metatable({}, sling.op.CommonOps.ProcessedTracker)
	return v
end

function sling.op.CommonOps.ProcessedTracker:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.op.CommonOps.ProcessedTracker'
	self['_isType.sling.op.CommonOps.ProcessedTracker'] = true
	self.data = nil
end

function sling.op.CommonOps.ProcessedTracker:_construct0()
	sling.op.CommonOps.ProcessedTracker._init(self)
	return self
end

function sling.op.CommonOps.ProcessedTracker:add(name)
	if not (self.data ~= nil) then
		self.data = {}
	end
	do _g.jk.lang.Map:setValue(self.data, name, {}) end
end

function sling.op.CommonOps.ProcessedTracker:addFunctionCalls(name, call)
	if not (self.data ~= nil) then
		self.data = {}
	end
	do
		local fcxs = _g.jk.lang.Map:getValue(self.data, name)
		if not (fcxs ~= nil) then
			fcxs = {}
			do _g.jk.lang.Map:setValue(self.data, name, fcxs) end
		end
		do _g.jk.lang.Vector:append(fcxs, call) end
	end
end

function sling.op.CommonOps.ProcessedTracker:contains(name)
	do return _g.jk.lang.Map:containsKey(self.data, name) end
end

function sling.op.CommonOps.ProcessedTracker:getFunctionCalls(name)
	do return _g.jk.lang.Map:getValue(self.data, name) end
end

function sling.op.CommonOps:addAwaitAndAsyncModifiers(node)
	local processed = _g.sling.op.CommonOps.ProcessedTracker._construct0(_g.sling.op.CommonOps.ProcessedTracker._create())
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.FunctionDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local fdec = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FunctionDeclarationNode')
				if fdec ~= nil then
					do _g.sling.op.CommonOps:doAddAwaitAndAsyncModifiers(fdec, processed, nil) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:doAddAwaitAndAsyncModifiers(fdec, processed, fcex)
	local name = _g.sling.util.NodeUtil:getQualifiedNameString(fdec, 46)
	if processed:contains(name) then
		if fcex ~= nil then
			do processed:addFunctionCalls(name, fcex) end
		end
		do return _g.sling.util.ModifierUtil:hasCommonModifier(fdec, _g.sling.model.Modifier.ASYNCHRONOUS) end
	end
	do processed:add(name) end
	do
		local array = _g.sling.util.FindUtil:findNodesOfType(fdec:getBody(), "class:sling.model.FunctionCallExpressionNode", false, true, false)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local call = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FunctionCallExpressionNode')
					if call ~= nil then
						local ndec = _g.sling.util.FindUtil:findNearestFunction(call)
						if not (ndec ~= nil) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No containing function declaration found", call, nil))
						end
						if (_vm:to_table_with_key(call:getParent(), '_isType.sling.model.PromiseExpressionNode') ~= nil) then
							goto _continue17
						end
						if (_vm:to_table_with_key(call:getParent(), '_isType.sling.model.AwaitExpressionNode') ~= nil) then
							if not _g.sling.util.ModifierUtil:hasCommonModifier(ndec, _g.sling.model.Modifier.ASYNCHRONOUS) then
								do _g.sling.util.ModifierUtil:addCommonModifier(ndec, _g.sling.model.Modifier.ASYNCHRONOUS) end
							end
							goto _continue17
						end
						do
							local odec = _g.sling.util.FunctionUtil:getResolvedDeclaration(call)
							if not (odec ~= nil) then
								goto _continue17
							end
							if _g.sling.op.CommonOps:doAddAwaitAndAsyncModifiers(odec, processed, call) then
								if not _g.sling.util.ModifierUtil:hasCommonModifier(ndec, _g.sling.model.Modifier.ASYNCHRONOUS) then
									do _g.sling.util.ModifierUtil:addCommonModifier(ndec, _g.sling.model.Modifier.ASYNCHRONOUS) end
								end
								do _g.sling.op.CommonOps:replaceCallWithAwait(call) end
							end
						end
					end
					::_continue17::
					do n = n + 1 end
				end
			end
		end
		do
			local v = _g.sling.util.ModifierUtil:hasCommonModifier(fdec, _g.sling.model.Modifier.ASYNCHRONOUS)
			if v then
				local array2 = processed:getFunctionCalls(name)
				if array2 ~= nil then
					local n2 = 0
					local m2 = _g.jk.lang.Vector:getSize(array2)
					do
						n2 = 0
						while n2 < m2 do
							local call = array2[n2 + 1]
							if call ~= nil then
								if (_vm:to_table_with_key(call:getParent(), '_isType.sling.model.AwaitExpressionNode') ~= nil) then
									goto _continue18
								end
								do _g.sling.op.CommonOps:replaceCallWithAwait(call) end
							end
							::_continue18::
							do n2 = n2 + 1 end
						end
					end
				end
			end
			do return v end
		end
	end
end

function sling.op.CommonOps:replaceCallWithAwait(call)
	local awen = _g.sling.model.AwaitExpressionNode._construct0(_g.sling.model.AwaitExpressionNode._create())
	do _g.sling.util.NodeUtil:replaceAndExport(call, awen) end
	do awen:setExpression(call, false) end
	do call:setResolvedDataType(nil, false) end
end

function sling.op.CommonOps:isEmptyNamespace(node)
	local nsn = _vm:to_table_with_key(node, '_isType.sling.model.NamespaceNode')
	if not (nsn ~= nil) then
		do return false end
	end
	do
		local array = nsn:getNodes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local child = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
					if child ~= nil then
						if not _g.sling.op.CommonOps:isEmptyNamespace(child) then
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

function sling.op.CommonOps:removeEmptyNamespaces(ctx, root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.NamespaceNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local ns = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.NamespaceNode')
				if ns ~= nil then
					if _g.sling.op.CommonOps:isEmptyNamespace(ns) then
						do _g.sling.util.NodeUtil:removeNode(ns) end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:convertToOneBasedIndexing(ctx, root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.SubscriptExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.SubscriptExpressionNode')
				if node ~= nil then
					local xpr = node:getChild()
					if not (xpr ~= nil) then
						goto _continue19
					end
					do
						local xprdt = _g.sling.util.ExpressionUtil:getExpressionDataType(xpr, nil)
						if (_vm:to_table_with_key(xprdt, '_isType.sling.model.StaticArrayDataTypeNode') ~= nil) or (_vm:to_table_with_key(xprdt, '_isType.sling.model.VectorDataTypeNode') ~= nil) or (_vm:to_table_with_key(xprdt, '_isType.sling.model.BufferDataTypeNode') ~= nil) then
							local array2 = node:exportSubscripts()
							if array2 ~= nil then
								local n2 = 0
								local m2 = _g.jk.lang.Vector:getSize(array2)
								do
									n2 = 0
									while n2 < m2 do
										local ss = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.ExpressionNode')
										if ss ~= nil then
											do node:addToSubscripts(_g.sling.model.AdditionExpressionNode:instance(ss, _g.sling.model.IntegerLiteralExpressionNode:forValue(1))) end
										end
										do n2 = n2 + 1 end
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
end

function sling.op.CommonOps:cleanReturnStatementsInFunctions(ctx, root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.FunctionDeclarationBaseNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local _function = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FunctionDeclarationBaseNode')
				if _function ~= nil then
					local array2 = _g.sling.util.NodeFinder:findCompatibleNodes(_function, "class:sling.model.BlockNode", false, true, false)
					if array2 ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(array2)
						do
							n2 = 0
							while n2 < m2 do
								local block = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.BlockNode')
								if block ~= nil then
									local toremove = nil
									local array3 = block:getNodes()
									if array3 ~= nil then
										local n3 = 0
										local m3 = _g.jk.lang.Vector:getSize(array3)
										do
											n3 = 0
											while n3 < m3 do
												local node = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.common.NodeObject')
												if node ~= nil then
													if toremove == nil and (_vm:to_table_with_key(node, '_isType.sling.model.ReturnStatementNode') ~= nil) then
														toremove = {}
														goto _continue20
													end
													if (_vm:to_table_with_key(node, '_isType.sling.model.LabeledStatementNode') ~= nil) then
														goto _continue20
													end
													if toremove ~= nil then
														do _g.jk.lang.Vector:append(toremove, node) end
													end
												end
												::_continue20::
												do n3 = n3 + 1 end
											end
										end
									end
									if toremove ~= nil then
										local n4 = 0
										local m4 = _g.jk.lang.Vector:getSize(toremove)
										do
											n4 = 0
											while n4 < m4 do
												local rem = toremove[n4 + 1]
												if rem ~= nil then
													do _g.sling.util.NodeUtil:removeNode(rem) end
												end
												do n4 = n4 + 1 end
											end
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

function sling.op.CommonOps:sortEntitiesByDependencies(ctx, resolver, root)
	do _g.sling.op.EntitySorter._construct0(_g.sling.op.EntitySorter._create()):setResolver(resolver):execute(ctx, root) end
end

function sling.op.CommonOps:renameOverloadedMethods(ctx, resolver, root, ignoreStatic)
	do _g.sling.op.OverloadedMethodRenamer._construct0(_g.sling.op.OverloadedMethodRenamer._create()):setResolver(resolver):setIgnoreStatic(ignoreStatic):execute(ctx, root) end
end

function sling.op.CommonOps:addDefaultParameterValuesToFunctionCalls(ctx, root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.FunctionCallExpressionNode", false, true, false)
	if array ~= nil then
		local n2 = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n2 = 0
			while n2 < m do
				local fc = _vm:to_table_with_key(array[n2 + 1], '_isType.sling.model.FunctionCallExpressionNode')
				if fc ~= nil then
					local decl = _g.sling.util.FunctionUtil:getResolvedDeclaration(fc)
					if not (decl ~= nil) then
						goto _continue21
					end
					do
						local dparams = decl:getParameters()
						local cparams = fc:getParameters()
						local dpsz = _g.jk.lang.Vector:getSize(dparams)
						local cpsz = _g.jk.lang.Vector:getSize(cparams)
						if cpsz >= dpsz then
							goto _continue21
						end
						do
							local n = cpsz
							while n < dpsz do
								local pdecl = _vm:to_table_with_key(_g.jk.lang.Vector:get(dparams, n), '_isType.sling.model.VariableDeclarationNode')
								if not (pdecl ~= nil) then
									do break end
								end
								do
									local init = pdecl:getInitializer()
									if not (init ~= nil) then
										do break end
									end
									do
										local addxpr = _g.sling.util.ExpressionUtil:dupAsExpression(init)
										do fc:addToParameters(addxpr) end
									end
								end
								do n = n + 1 end
							end
						end
					end
				end
				::_continue21::
				do n2 = n2 + 1 end
			end
		end
	end
end

function sling.op.CommonOps:wrapFunctionReferencesToFunctionDeclarationExpressions(ctx, root, tr)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.SymbolExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local sxpr = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.SymbolExpressionNode')
				if sxpr ~= nil then
					if tr ~= nil then
						do tr:resolveExpression(sxpr) end
					end
					do
						local binding = _vm:to_table_with_key(_g.sling.util.SymbolUtil:tryGetSymbolBindingForExpression(sxpr), '_isType.sling.model.FunctionDeclarationNode')
						if not (binding ~= nil) then
							goto _continue22
						end
						do
							local xpr = _vm:to_table_with_key(sxpr, '_isType.sling.model.ExpressionNode')
							while (_vm:to_table_with_key(xpr:getParent(), '_isType.sling.model.MemberAccessExpressionNode') ~= nil) do
								xpr = _vm:to_table_with_key(xpr:getParent(), '_isType.sling.model.ExpressionNode')
							end
							do
								local pfcx = _vm:to_table_with_key(xpr:getParent(), '_isType.sling.model.FunctionCallExpressionNode')
								if pfcx ~= nil and pfcx:getExpression() == xpr then
									goto _continue22
								end
								do
									local fd = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
									do fd:setReturnType(_g.sling.util.DataTypeUtil:dupAsDataType(binding:getReturnType()), false) end
									do
										local pc = 0
										local array2 = binding:getParameters()
										if array2 ~= nil then
											local n2 = 0
											local m2 = _g.jk.lang.Vector:getSize(array2)
											do
												n2 = 0
												while n2 < m2 do
													local param = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.common.NodeObject')
													if param ~= nil then
														local pvd = _vm:to_table_with_key(param, '_isType.sling.model.VariableDeclarationNode')
														if not (pvd ~= nil) then
															_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Referenced function parameter is not a variable. Don't know what to do with it.", param, nil))
														end
														do
															local nvd = _g.sling.util.NodeUtil:dupAsVariableDeclaration(pvd)
															do nvd:setName("_p" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(pc))) end
															do pc = pc + 1 end
															do fd:addToParameters(nvd) end
														end
													end
													do n2 = n2 + 1 end
												end
											end
										end
										do
											local body = fd:getCreateBody()
											local xpr2 = _g.sling.util.ExpressionUtil:dupAsExpression(xpr)
											local fcx = _g.sling.model.FunctionCallExpressionNode:forExpression(xpr2)
											local array3 = fd:getParameters()
											if array3 ~= nil then
												local n3 = 0
												local m3 = _g.jk.lang.Vector:getSize(array3)
												do
													n3 = 0
													while n3 < m3 do
														local param = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.model.VariableDeclarationNode')
														if param ~= nil then
															do fcx:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(param, nil)) end
														end
														do n3 = n3 + 1 end
													end
												end
											end
											do body:addNode(fcx) end
											do
												local fdx = _g.sling.model.FunctionDeclarationExpressionNode:forDeclaration(fd)
												do _g.sling.util.NodeUtil:replaceNode(xpr, fdx) end
											end
										end
									end
								end
							end
						end
					end
				end
				::_continue22::
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:convertMultipleExpressionsToFunctionExpression(root)
	local array = _g.sling.util.NodeFinder:findNodesOfType(root, "class:sling.model.MultipleExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.MultipleExpressionNode')
				if node ~= nil then
					local fdec = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
					do fdec:setReturnType(_g.sling.util.DataTypeUtil:dupAsDataType(_g.sling.util.ExpressionUtil:tryGetExpressionDataType(node, nil)), false) end
					do
						local xprs = node:exportExpressions()
						local size = _g.jk.lang.Vector:getSize(xprs)
						do
							local i = 0
							while i < size do
								local expr = _vm:to_table_with_key(_g.jk.lang.Vector:get(xprs, i), '_isType.sling.model.ExpressionNode')
								if i == size - 1 then
									do _g.sling.util.FunctionUtil:addStatement(fdec, _g.sling.model.ReturnStatementNode:forExpression(expr)) end
								else
									local name = _g.sling.util.FunctionUtil:findUniqueVariableNameInFunction(fdec, "_mx")
									do _g.sling.util.FunctionUtil:addStatement(fdec, _g.sling.model.VariableDeclarationNode:forAutomatic(name, expr)) end
								end
								do i = i + 1 end
							end
						end
						do _g.sling.util.NodeUtil:replaceNode(node, _g.sling.model.FunctionCallExpressionNode:forExpression(_g.sling.model.FunctionDeclarationExpressionNode:forDeclaration(fdec))) end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:removeExpressionDataTypeNodes(ctx, node)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.ExpressionDataTypeNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local an = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ExpressionDataTypeNode')
				if an ~= nil then
					local xpr = an:getExpression()
					local dt = nil
					if xpr ~= nil then
						dt = _g.sling.util.DataTypeUtil:dupAsDataType(_g.sling.util.ExpressionUtil:getExpressionDataType(xpr, nil))
					end
					if not (dt ~= nil) then
						dt = _g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create())
					end
					do _g.sling.util.NodeUtil:replaceNode(an, dt) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:handleBlock(block)
	local start = true
	local array = block:getNodes()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
				if node ~= nil then
					if (_vm:to_table_with_key(node, '_isType.sling.model.VariableDeclarationNode') ~= nil) and start then
						goto _continue23
					end
					start = false
					if (_vm:to_table_with_key(node, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
						local nodes = block:exportNodes()
						local ns1 = {}
						local ns2 = {}
						local p = 0
						if nodes ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(nodes)
							do
								n2 = 0
								while n2 < m2 do
									local nn = nodes[n2 + 1]
									if nn ~= nil then
										if p == 0 then
											if nn == node then
												do p = p + 1 end
												do _g.jk.lang.Vector:append(ns2, nn) end
											else
												do _g.jk.lang.Vector:append(ns1, nn) end
											end
										else
											do _g.jk.lang.Vector:append(ns2, nn) end
										end
									end
									do n2 = n2 + 1 end
								end
							end
						end
						do
							local b2 = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
							do b2:setNodes(ns2) end
							do _g.jk.lang.Vector:append(ns1, b2) end
							do block:setNodes(ns1) end
							do _g.sling.op.CommonOps:handleBlock(b2) end
							do break end
						end
					end
				end
				::_continue23::
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:surroundLocalVariablesInBlocks(ctx, node)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(node, "class:sling.model.BlockNode", true, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local block = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.BlockNode')
				if block ~= nil then
					do _g.sling.op.CommonOps:handleBlock(block) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:removeIntegerToIntegerCasts(ctx, node)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(node, "class:sling.model.StaticCastExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local cast = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.StaticCastExpressionNode')
				if cast ~= nil then
					local type = cast:getType()
					if not (type ~= nil) then
						goto _continue24
					end
					do
						local xpr = cast:getExpression()
						if not (xpr ~= nil) then
							goto _continue24
						end
						do
							local xprdt = _g.sling.util.ExpressionUtil:tryGetExpressionDataType(xpr, nil)
							if not (xprdt ~= nil) then
								goto _continue24
							end
							if (_vm:to_table_with_key(type, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and (_vm:to_table_with_key(xprdt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
								local nxpr = cast:exportExpression()
								do _g.sling.util.NodeUtil:replaceNode(cast, nxpr) end
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

sling.op.CommonOps.HeaderFinder = _g.sling.common.NodeVisitor._create()
sling.op.CommonOps.HeaderFinder.__index = sling.op.CommonOps.HeaderFinder
_vm:set_metatable(sling.op.CommonOps.HeaderFinder, {
	__index = _g.sling.common.NodeVisitor
})

function sling.op.CommonOps.HeaderFinder._create()
	local v = _vm:set_metatable({}, sling.op.CommonOps.HeaderFinder)
	return v
end

function sling.op.CommonOps.HeaderFinder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.op.CommonOps.HeaderFinder'
	self['_isType.sling.op.CommonOps.HeaderFinder'] = true
	self.results = {}
end

function sling.op.CommonOps.HeaderFinder:_construct0()
	sling.op.CommonOps.HeaderFinder._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.op.CommonOps.HeaderFinder:visit(node)
	if node ~= nil and _g.sling.op.CommonOps:nodeHasCommonModifier(node, _g.sling.model.Modifier.HEADER) then
		do _g.jk.lang.Vector:append(self.results, node) end
		do self:setSkipChildren(true) end
		do return true end
	end
	do return true end
end

function sling.op.CommonOps.HeaderFinder:getResults()
	do return self.results end
end

function sling.op.CommonOps.HeaderFinder:setResults(v)
	self.results = v
	do return self end
end

function sling.op.CommonOps:removeHeaderDeclarations(ctx, node)
	local hf = _g.sling.op.CommonOps.HeaderFinder._construct0(_g.sling.op.CommonOps.HeaderFinder._create())
	do node:accept(hf) end
	do
		local array = hf:getResults()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local node = array[n + 1]
					if node ~= nil then
						do _g.sling.util.NodeUtil:removeNode(node) end
					end
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.op.CommonOps:convertScriptsToClassDeclarations(node)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.ScriptDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local sdec = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ScriptDeclarationNode')
				if sdec ~= nil then
					local cdec = _g.sling.model.ClassDeclarationNode._construct0(_g.sling.model.ClassDeclarationNode._create())
					local array2 = sdec:exportNodes()
					if array2 ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(array2)
						do
							n2 = 0
							while n2 < m2 do
								local nobj = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.common.NodeObject')
								if nobj ~= nil then
									local nn = _vm:to_table_with_key(nobj, '_isType.sling.model.NodeWithModifiers')
									if nn ~= nil then
										do _g.sling.util.ModifierUtil:addCommonModifier(nn, _g.sling.model.Modifier.STATIC) end
									end
									do cdec:addNode(nobj) end
								end
								do n2 = n2 + 1 end
							end
						end
					end
					do cdec:setName(sdec:getNodeName()) end
					do cdec:setModifiers(sdec:exportModifiers(), false) end
					do _g.sling.util.NodeUtil:replaceAndExport(sdec, cdec) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.CommonOps:convertEnumsToClassDeclarations(node)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.EnumDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local edec = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.EnumDeclarationNode')
				if edec ~= nil then
					local cdec = _g.sling.model.ClassDeclarationNode._construct0(_g.sling.model.ClassDeclarationNode._create())
					local array2 = edec:getNodes()
					if array2 ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(array2)
						do
							n2 = 0
							while n2 < m2 do
								local enum = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.EnumValueNode')
								if enum ~= nil then
									local name = enum:getName()
									local type = enum:exportType()
									local eval = enum:exportValue()
									if not (eval ~= nil) then
										eval = _g.sling.model.CreateObjectExpressionNode:forType(_g.sling.model.ReferenceDataTypeNode:forNode(cdec, nil))
									end
									if not (type ~= nil) then
										type = _g.sling.model.ReferenceDataTypeNode:forNode(cdec, nil)
									end
									do
										local vdec = _g.sling.model.VariableDeclarationNode:instance(type, name, eval)
										do _g.sling.util.ModifierUtil:addCommonModifier(vdec, _g.sling.model.Modifier.PUBLIC) end
										do _g.sling.util.ModifierUtil:addCommonModifier(vdec, _g.sling.model.Modifier.STATIC) end
										do _g.sling.util.ModifierUtil:addCommonModifier(vdec, _g.sling.model.Modifier.FINAL) end
										do cdec:addNode(vdec) end
									end
								end
								do n2 = n2 + 1 end
							end
						end
					end
					do cdec:setName(edec:getNodeName()) end
					do _g.sling.util.NodeUtil:replaceAndExport(edec, cdec) end
				end
				do n = n + 1 end
			end
		end
	end
end

sling.op.OverloadedMethodRenamer = {}
sling.op.OverloadedMethodRenamer.__index = sling.op.OverloadedMethodRenamer
_vm:set_metatable(sling.op.OverloadedMethodRenamer, {})

function sling.op.OverloadedMethodRenamer._create()
	local v = _vm:set_metatable({}, sling.op.OverloadedMethodRenamer)
	return v
end

function sling.op.OverloadedMethodRenamer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.op.OverloadedMethodRenamer'
	self['_isType.sling.op.OverloadedMethodRenamer'] = true
	self.resolver = nil
	self.ignoreStatic = false
end

function sling.op.OverloadedMethodRenamer:_construct0()
	sling.op.OverloadedMethodRenamer._init(self)
	return self
end

function sling.op.OverloadedMethodRenamer:addToMap(ee, ignore, ht, skipStatic)
	if not (ee ~= nil) then
		do return end
	end
	do
		local array = ee:getNodes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local fd = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FunctionDeclarationNode')
					if fd ~= nil then
						if self.ignoreStatic then
							if skipStatic and _g.sling.util.ModifierUtil:hasCommonModifier(fd, _g.sling.model.Modifier.STATIC) then
								goto _continue25
							end
						end
						do
							local name = fd:getNodeName()
							if _g.jk.lang.String:isEmpty(name) then
								goto _continue25
							end
							do
								local fdqn = _g.sling.util.NodeUtil:getQualifiedNameString(fd, 46)
								if fdqn ~= nil and ignore:contains(fdqn) then
									goto _continue25
								end
								do
									local cc = _g.jk.lang.Map:get(ht, name)
									if not (cc ~= nil) then
										cc = {}
										ht[name] = cc
									end
									do _g.jk.lang.Vector:append(cc, fd) end
								end
							end
						end
					end
					::_continue25::
					do n = n + 1 end
				end
			end
		end
		do
			local bc = self.resolver:getBaseClass(ee)
			if bc ~= nil then
				do self:addToMap(bc, ignore, ht, true) end
			end
		end
	end
end

function sling.op.OverloadedMethodRenamer:handleEntity(ctx, ee, handled)
	if (_vm:to_table_with_key(ee, '_isType.sling.model.ClassDeclarationNode') ~= nil) == false and (_vm:to_table_with_key(ee, '_isType.sling.model.InterfaceDeclarationNode') ~= nil) == false then
		do return end
	end
	do
		local eename = _g.sling.util.NodeUtil:getQualifiedNameString(ee, 46)
		if not (eename ~= nil) then
			do return end
		end
		if handled:contains(eename) then
			do return end
		end
		do handled:add(eename) end
		do
			local bc = self.resolver:getBaseClass(ee)
			if bc ~= nil then
				do self:handleEntity(ctx, bc, handled) end
			end
			do
				local isHeader = _g.sling.util.ModifierUtil:hasCommonModifier(ee, _g.sling.model.Modifier.HEADER)
				local ht = {}
				local ignore = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
				local array = ee:getNodes()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local fd = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FunctionDeclarationNode')
							if fd ~= nil then
								if self.ignoreStatic and _g.sling.util.ModifierUtil:hasCommonModifier(fd, _g.sling.model.Modifier.STATIC) then
									goto _continue26
								end
								do
									local bd = fd:getBaseClassDeclaration()
									if bd ~= nil then
										local bdname = _g.sling.util.NodeUtil:getQualifiedNameString(bd, 46)
										if bdname ~= nil then
											do ignore:add(bdname) end
										end
									end
								end
							end
							::_continue26::
							do n = n + 1 end
						end
					end
				end
				do self:addToMap(ee, ignore, ht, false) end
				do
					local keys = _g.jk.lang.Map:getKeys(ht)
					if keys ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(keys)
						do
							n2 = 0
							while n2 < m2 do
								local key = keys[n2 + 1]
								if key ~= nil then
									local cc = _g.jk.lang.Map:get(ht, key)
									if cc == nil then
										goto _continue27
									end
									do
										local counter = 1
										local hasDuplicates = _g.jk.lang.Vector:getSize(cc) > 1
										if cc ~= nil then
											local n3 = 0
											local m3 = _g.jk.lang.Vector:getSize(cc)
											do
												n3 = 0
												while n3 < m3 do
													local fd = cc[n3 + 1]
													if fd ~= nil then
														if fd:getParent() ~= ee then
															goto _continue28
														end
														if self.ignoreStatic == false or not _g.sling.util.ModifierUtil:hasCommonModifier(fd, _g.sling.model.Modifier.STATIC) then
															local bdecl = fd:getBaseClassDeclaration()
															if bdecl ~= nil then
																do fd:renameNode(bdecl:getNodeName()) end
																goto _continue28
															end
														end
														if hasDuplicates then
															local impf = self.resolver:findImplementedInterfaceMethod(fd)
															if impf ~= nil then
																goto _continue28
															end
															if not isHeader then
																do _g.sling.common.RefLog:warning(ctx, "Renaming overloaded method. This works, but does not produce a good API in the target language.", fd) end
															end
															while true do
																local nname = _g.jk.lang.String:safeString(fd:getNodeName()) .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger((function() local v = counter counter = counter + 1 return v end)()))
																if _g.jk.lang.Vector:getSize(_g.jk.lang.Map:get(ht, nname)) > 0 then
																	goto _continue29
																end
																do fd:renameNode(nname) end
																do break end
																::_continue29::
															end
														end
													end
													::_continue28::
													do n3 = n3 + 1 end
												end
											end
										end
									end
								end
								::_continue27::
								do n2 = n2 + 1 end
							end
						end
					end
				end
			end
		end
	end
end

function sling.op.OverloadedMethodRenamer:execute(ctx, node)
	local handled = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(node, "class:sling.model.EntityDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local ee = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.EntityDeclarationNode')
				if ee ~= nil then
					do self:handleEntity(ctx, ee, handled) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.op.OverloadedMethodRenamer:getResolver()
	do return self.resolver end
end

function sling.op.OverloadedMethodRenamer:setResolver(v)
	self.resolver = v
	do return self end
end

function sling.op.OverloadedMethodRenamer:getIgnoreStatic()
	do return self.ignoreStatic end
end

function sling.op.OverloadedMethodRenamer:setIgnoreStatic(v)
	self.ignoreStatic = v
	do return self end
end
