sling = sling or {}

sling.util = sling.util or {}

sling.util.SymbolUtil = {}
sling.util.SymbolUtil.__index = sling.util.SymbolUtil
_vm:set_metatable(sling.util.SymbolUtil, {})

function sling.util.SymbolUtil._create()
	local v = _vm:set_metatable({}, sling.util.SymbolUtil)
	return v
end

function sling.util.SymbolUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.SymbolUtil'
	self['_isType.sling.util.SymbolUtil'] = true
end

function sling.util.SymbolUtil:_construct0()
	sling.util.SymbolUtil._init(self)
	return self
end

function sling.util.SymbolUtil:mergeSymbols(s1, s2)
	if not (s1 ~= nil or s2 ~= nil) then
		do return nil end
	end
	if s1 ~= nil and s2 == nil then
		do return s1 end
	end
	if s1 == nil and s2 ~= nil then
		do return s2 end
	end
	do
		local v = _g.sling.model.SymbolNode._construct0(_g.sling.model.SymbolNode._create())
		local comps = {}
		local array = _g.sling.util.SymbolUtil:getSymbolComponents(s1)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local comp = array[n + 1]
					if comp ~= nil then
						do _g.jk.lang.Vector:append(comps, comp) end
					end
					do n = n + 1 end
				end
			end
		end
		do
			local array2 = _g.sling.util.SymbolUtil:getSymbolComponents(s2)
			if array2 ~= nil then
				local n2 = 0
				local m2 = _g.jk.lang.Vector:getSize(array2)
				do
					n2 = 0
					while n2 < m2 do
						local comp = array2[n2 + 1]
						if comp ~= nil then
							do _g.jk.lang.Vector:append(comps, comp) end
						end
						do n2 = n2 + 1 end
					end
				end
			end
			if comps ~= nil then
				local n3 = 0
				local m3 = _g.jk.lang.Vector:getSize(comps)
				do
					n3 = 0
					while n3 < m3 do
						local comp = comps[n3 + 1]
						if comp ~= nil then
							if (_vm:get_variable_type(comp) == 'string') then
								do _g.sling.util.SymbolUtil:pushName(v, comp) end
							elseif (_vm:to_table_with_key(comp, '_isType.sling.model.SymbolNameComponentNode') ~= nil) then
								local nc = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(comp), '_isType.sling.model.SymbolNameComponentNode')
								if nc ~= nil then
									do _g.sling.util.SymbolUtil:pushComponent(v, nc) end
								end
							end
						end
						do n3 = n3 + 1 end
					end
				end
			end
			do return v end
		end
	end
end

function sling.util.SymbolUtil:tryGetSymbolBindingForExpression(xpr)
	if not (xpr ~= nil) then
		do return nil end
	end
	do
		local sym = xpr:getSymbol()
		if not (sym ~= nil) then
			do return nil end
		end
		do return sym:getBinding() end
	end
end

function sling.util.SymbolUtil:tryGetSymbolBinding(sym)
	if not (sym ~= nil) then
		do return nil end
	end
	do return sym:getBinding() end
end

function sling.util.SymbolUtil:getQualifiedSymbolNameComponents(node, typeParameters)
	local v = {}
	local nn = node
	local tpidx = 0
	while nn ~= nil do
		if (_vm:to_table_with_key(nn, '_isType.sling.common.CodeFileNode') ~= nil) then
		elseif (_vm:to_table_with_key(nn, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
			do _g.jk.lang.Vector:prepend(v, _g.sling.model.SymbolNameComponentNode:forName(nn:getNodeName())) end
		elseif (_vm:to_table_with_key(nn, '_isType.sling.model.NamespaceNode') ~= nil) then
			local name = nn:getNodeName()
			if _g.jk.lang.String:isEmpty(name) then
				do break end
			end
			do _g.jk.lang.Vector:prepend(v, _g.sling.model.SymbolNameComponentNode:forName(name)) end
		elseif (_vm:to_table_with_key(nn, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
			do _g.jk.lang.Vector:prepend(v, _g.sling.model.SymbolNameComponentNode:forName(nn:getNodeName())) end
		elseif (_vm:to_table_with_key(nn, '_isType.sling.model.EntityDeclarationNode') ~= nil) then
			local cc = _g.sling.model.SymbolNameComponentNode:forName(nn:getNodeName())
			if (_vm:to_table_with_key(nn, '_isType.sling.model.GenericCapableEntityDeclarationNode') ~= nil) then
				local types = nn:getGenericTypes()
				if types ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(types)
					do
						n = 0
						while n < m do
							local type = _vm:to_table_with_key(types[n + 1], '_isType.sling.model.TemplateDeclarationNode')
							if type ~= nil then
								local tt = _vm:to_table_with_key(_g.jk.lang.Vector:get(typeParameters, (function() local v = tpidx tpidx = tpidx + 1 return v end)()), '_isType.sling.common.DataTypeNode')
								if tt ~= nil then
									do cc:addToTypeParameters(_g.sling.util.DataTypeUtil:dupAsDataType(tt)) end
									goto _continue1
								end
								do cc:addToTypeParameters(_g.sling.model.ReferenceDataTypeNode:forNode(type, nil)) end
							end
							::_continue1::
							do n = n + 1 end
						end
					end
				end
			end
			do _g.jk.lang.Vector:prepend(v, cc) end
		else
			do break end
		end
		nn = nn:getParent()
	end
	do return v end
end

function sling.util.SymbolUtil:generateSymbolComponentsForBinding(symbol, binding)
	if not (binding ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(binding, '_isType.sling.model.TemplateDeclarationNode') ~= nil) then
		local v = {}
		do _g.jk.lang.Vector:append(v, _g.sling.model.SymbolNameComponentNode:forName(binding:getName())) end
		do return v end
	end
	if (_vm:to_table_with_key(binding, '_isType.sling.model.VariableDeclarationNode') ~= nil) or (_vm:to_table_with_key(binding, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
		if _g.sling.util.NodeUtil:isStatic(binding) then
			do return _g.sling.util.SymbolUtil:getQualifiedSymbolNameComponents(binding, symbol:getTypeParameters()) end
		else
			local n = _vm:to_table_with_key(binding, '_isType.sling.common.NamedNode')
			local v = {}
			do _g.jk.lang.Vector:append(v, _g.sling.model.SymbolNameComponentNode:forName(n:getNodeName())) end
			do return v end
		end
	end
	if (_vm:to_table_with_key(binding, '_isType.sling.model.EntityDeclarationNode') ~= nil) then
		do return _g.sling.util.SymbolUtil:getQualifiedSymbolNameComponents(binding, symbol:getTypeParameters()) end
	end
	if (_vm:to_table_with_key(binding, '_isType.sling.model.NamespaceNode') ~= nil) then
		do return _g.sling.util.SymbolUtil:getQualifiedSymbolNameComponents(binding, symbol:getTypeParameters()) end
	end
	if (_vm:to_table_with_key(binding, '_isType.sling.common.NamedNode') ~= nil) then
		local v = {}
		do _g.jk.lang.Vector:append(v, _g.sling.model.SymbolNameComponentNode:forName(binding:getNodeName())) end
		do return v end
	end
	do return nil end
end

function sling.util.SymbolUtil:getSymbolComponents(symbol)
	if not (symbol ~= nil) then
		do return nil end
	end
	do
		local binding = symbol:getBinding()
		if binding ~= nil then
			if (_vm:to_table_with_key(binding, '_isType.sling.model.MagicalClassDeclarationNode') ~= nil) then
				local ss = binding:getSymbol()
				if ss ~= nil then
					do return symbol:getComponents() end
				end
			end
			do
				local v = self:generateSymbolComponentsForBinding(symbol, binding)
				if v ~= nil then
					do return v end
				end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("getSymbolComponents: Not implemented for node type `" .. _g.jk.lang.String:safeString(binding:getNodeTypeName()) .. "'", binding, nil):addRelatedMessage("Original symbol", symbol))
				do return nil end
			end
		end
		do return symbol:getComponents() end
	end
end

function sling.util.SymbolUtil:getSymbolNames(symbol)
	local comps = _g.sling.util.SymbolUtil:getSymbolComponents(symbol)
	if not (comps ~= nil) then
		do return nil end
	end
	do
		local v = {}
		if comps ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(comps)
			do
				n = 0
				while n < m do
					local comp = _vm:to_table_with_key(comps[n + 1], '_isType.sling.model.SymbolNameComponentNode')
					if comp ~= nil then
						do _g.jk.lang.Vector:append(v, comp:getName()) end
					end
					do n = n + 1 end
				end
			end
		end
		do return v end
	end
end

function sling.util.SymbolUtil:getSymbolNamesString(symbol, delim)
	local names = _g.sling.util.SymbolUtil:getSymbolNames(symbol)
	if not (names ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		if names ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(names)
			do
				n = 0
				while n < m do
					local name = names[n + 1]
					if name ~= nil then
						if sb:count() > 0 then
							do sb:appendCharacter(delim) end
						end
						do sb:appendString(name) end
					end
					do n = n + 1 end
				end
			end
		end
		do return sb:toString() end
	end
end

function sling.util.SymbolUtil:getSymbolName(symbol)
	if not (symbol ~= nil) then
		do return nil end
	end
	do
		local components = _g.sling.util.SymbolUtil:getSymbolComponents(symbol)
		if not (components ~= nil) then
			do return nil end
		end
		do
			local comp = _vm:to_table_with_key(_g.jk.lang.Vector:getLast(components), '_isType.sling.model.SymbolNameComponentNode')
			if not (comp ~= nil) then
				do return nil end
			end
			do return comp:getName() end
		end
	end
end

function sling.util.SymbolUtil:getFirstComponent(symbol)
	if not (symbol ~= nil) then
		do return nil end
	end
	do
		local components = _g.sling.util.SymbolUtil:getSymbolComponents(symbol)
		if not (components ~= nil) then
			do return nil end
		end
		do
			local comp = _vm:to_table_with_key(_g.jk.lang.Vector:getFirst(components), '_isType.sling.model.SymbolNameComponentNode')
			if not (comp ~= nil) then
				do return nil end
			end
			do return comp:getName() end
		end
	end
end

function sling.util.SymbolUtil:setFirstComponent(symbol, component)
	if not (symbol ~= nil) then
		do return end
	end
	if not (component ~= nil) then
		do return end
	end
	do
		local components = _g.sling.util.SymbolUtil:getSymbolComponents(symbol)
		if not (components ~= nil) then
			do return end
		end
		do _g.jk.lang.Vector:set(components, 0, component) end
		do _g.sling.util.SymbolUtil:setNames(symbol, components) end
	end
end

function sling.util.SymbolUtil:setName(symbol, name)
	if not (symbol ~= nil) then
		do return end
	end
	do symbol:clearComponents() end
	do symbol:setBinding(nil, nil) end
	do _g.sling.util.SymbolUtil:pushName(symbol, name) end
end

function sling.util.SymbolUtil:setNames(symbol, names)
	if not (symbol ~= nil) then
		do return end
	end
	do symbol:clearComponents() end
	do symbol:setBinding(nil, nil) end
	if names ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(names)
		do
			n = 0
			while n < m do
				local name = names[n + 1]
				if name ~= nil then
					do _g.sling.util.SymbolUtil:addObjectToComponents(symbol, name) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.util.SymbolUtil:addObjectToComponents(symbol, name)
	if not (symbol ~= nil) then
		do return end
	end
	if not (name ~= nil) then
		do return end
	end
	do symbol:setBinding(nil, nil) end
	if (_vm:get_variable_type(name) == 'string') then
		do _g.sling.util.SymbolUtil:pushName(symbol, name) end
	elseif (_vm:to_table_with_key(name, '_isType.sling.model.SymbolNameComponentNode') ~= nil) then
		do _g.sling.util.SymbolUtil:pushComponent(symbol, name) end
	end
end

function sling.util.SymbolUtil:pushComponent(symbol, comp)
	if not (symbol ~= nil) then
		do return end
	end
	if not (comp ~= nil) then
		do return end
	end
	do _g.sling.util.SymbolUtil:unbind(symbol) end
	do symbol:addToComponents(comp) end
end

function sling.util.SymbolUtil:pushName(symbol, name)
	do _g.sling.util.SymbolUtil:pushComponent(symbol, _g.sling.model.SymbolNameComponentNode:forName(name)) end
end

function sling.util.SymbolUtil:unbind(symbol)
end

function sling.util.SymbolUtil:processExpressionToSymbolNames(xpr, v)
	if (_vm:to_table_with_key(xpr, '_isType.sling.model.MemberAccessExpressionNode') ~= nil) then
		local ma = xpr
		if not _g.sling.util.SymbolUtil:processExpressionToSymbolNames(ma:getParentExpression(), v) then
			do return false end
		end
		if not _g.sling.util.SymbolUtil:processExpressionToSymbolNames(ma:getChildExpression(), v) then
			do return false end
		end
		do return true end
	end
	if (_vm:to_table_with_key(xpr, '_isType.sling.model.SymbolExpressionNode') ~= nil) then
		local symbol = xpr:getSymbol()
		if not (symbol ~= nil) then
			do return false end
		end
		do
			local names = _g.sling.util.SymbolUtil:getSymbolNames(symbol)
			if not (names ~= nil) then
				do return false end
			end
			if names ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(names)
				do
					n = 0
					while n < m do
						local name = names[n + 1]
						if name ~= nil then
							do _g.jk.lang.Vector:append(v, name) end
						end
						do n = n + 1 end
					end
				end
			end
			do return true end
		end
	end
	do return false end
end

function sling.util.SymbolUtil:expressionToSymbolNames(xpr)
	if not (xpr ~= nil) then
		do return nil end
	end
	do
		local v = {}
		if not _g.sling.util.SymbolUtil:processExpressionToSymbolNames(xpr, v) then
			do return nil end
		end
		do return v end
	end
end

sling.util.ExpressionUtil = {}
sling.util.ExpressionUtil.__index = sling.util.ExpressionUtil
_vm:set_metatable(sling.util.ExpressionUtil, {})

function sling.util.ExpressionUtil._create()
	local v = _vm:set_metatable({}, sling.util.ExpressionUtil)
	return v
end

function sling.util.ExpressionUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.ExpressionUtil'
	self['_isType.sling.util.ExpressionUtil'] = true
end

function sling.util.ExpressionUtil:_construct0()
	sling.util.ExpressionUtil._init(self)
	return self
end

function sling.util.ExpressionUtil:dupAsExpression(node)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("dupAsExpression: null node", nil, nil))
	end
	do
		local nnode = node:dup()
		if not (nnode ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to duplicate", node, nil))
		end
		do
			local v = _vm:to_table_with_key(nnode, '_isType.sling.model.ExpressionNode')
			if not (v ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Not an expression", node, nil))
			end
			do return v end
		end
	end
end

function sling.util.ExpressionUtil:tryGetExpressionDataType(xpr, resolver)
	do
		local _rval = nil
		local _status, _err = _vm:execute_protected_call(function()
			_rval = {}
			_rval.value = _g.sling.util.ExpressionUtil:getExpressionDataType(xpr, resolver)
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

function sling.util.ExpressionUtil:getExpressionDataType(xpr, resolver)
	if not (xpr ~= nil) then
		do return nil end
	end
	do
		local rdtref = _vm:to_table_with_key(xpr:getResolvedDataType(), '_isType.sling.model.ReferenceDataTypeNode')
		if rdtref ~= nil and _g.sling.util.DataTypeUtil:isReferenceValid(rdtref) == false then
			do xpr:setResolvedDataType(nil, false) end
		end
		if resolver ~= nil then
			do resolver:resolveExpression(xpr) end
		end
		do
			local rdt = xpr:getResolvedDataType()
			if rdt ~= nil then
				do return rdt end
			end
			do
				local ddt = xpr:getDefaultDataType()
				if ddt ~= nil then
					do return ddt end
				end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Expression data type is not known", xpr, nil))
				do return nil end
			end
		end
	end
end

sling.util.EntityUtil = {}
sling.util.EntityUtil.__index = sling.util.EntityUtil
_vm:set_metatable(sling.util.EntityUtil, {})

function sling.util.EntityUtil._create()
	local v = _vm:set_metatable({}, sling.util.EntityUtil)
	return v
end

function sling.util.EntityUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.EntityUtil'
	self['_isType.sling.util.EntityUtil'] = true
end

function sling.util.EntityUtil:_construct0()
	sling.util.EntityUtil._init(self)
	return self
end

function sling.util.EntityUtil:getBaseClassTypeForEntity(entity)
	if not (entity ~= nil) then
		do return nil end
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
						local type = basetype:getInheritType()
						if type == _g.sling.model.BaseTypeNode.INHERIT_EXTEND then
							do return basetype:getReferenceType() end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do return nil end
	end
end

function sling.util.EntityUtil:methodExists(entity, name)
	local array = entity:getNodes()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local method = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FunctionDeclarationNode')
				if method ~= nil then
					if method:getName() == name then
						do return true end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return false end
end

function sling.util.EntityUtil:doesEntityImportNamespace(entity, nsname)
	if not (entity ~= nil) then
		do return false end
	end
	if not _g.jk.lang.String:isNotEmpty(nsname) then
		do return false end
	end
	do
		local array = entity:getImportNamespaces()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local symbol = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.SymbolNode')
					if symbol ~= nil then
						local symname = _g.sling.util.SymbolUtil:getSymbolNamesString(symbol, 46)
						if symname ~= nil and symname == nsname then
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

function sling.util.EntityUtil:addToImportNamespacesUnique(entity, symbol)
	if not (entity ~= nil) then
		do return end
	end
	if not (symbol ~= nil) then
		do return end
	end
	do
		local symname = _g.sling.util.SymbolUtil:getSymbolNamesString(symbol, 46)
		if not _g.jk.lang.String:isNotEmpty(symname) then
			do return end
		end
		if _g.sling.util.EntityUtil:doesEntityImportNamespace(entity, symname) == false then
			do entity:addToImportNamespaces(symbol) end
		end
	end
end

function sling.util.EntityUtil:addImportToEntity(entity, importStatement)
	if not (entity ~= nil and importStatement ~= nil) then
		do return end
	end
	if (_vm:to_table_with_key(importStatement, '_isType.sling.model.ImportEntityStatementNode') ~= nil) then
		do entity:addToImportEntities(importStatement) end
	elseif (_vm:to_table_with_key(importStatement, '_isType.sling.model.ImportPackageStatementNode') ~= nil) then
		do _g.sling.util.EntityUtil:addToImportNamespacesUnique(entity, importStatement:exportPackage()) end
	elseif (_vm:to_table_with_key(importStatement, '_isType.sling.model.ImportStaticMemberStatementNode') ~= nil) then
		do entity:addToImportStaticNamespaces(importStatement) end
	else
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported import statement being added to entity", importStatement, nil))
	end
end

sling.util.NodeFinder = {}
sling.util.NodeFinder.__index = sling.util.NodeFinder
_vm:set_metatable(sling.util.NodeFinder, {})

function sling.util.NodeFinder._create()
	local v = _vm:set_metatable({}, sling.util.NodeFinder)
	return v
end

function sling.util.NodeFinder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.NodeFinder'
	self['_isType.sling.util.NodeFinder'] = true
end

function sling.util.NodeFinder:_construct0()
	sling.util.NodeFinder._init(self)
	return self
end

sling.util.NodeFinder.NodeTypeFinder = _g.sling.common.NodeVisitor._create()
sling.util.NodeFinder.NodeTypeFinder.__index = sling.util.NodeFinder.NodeTypeFinder
_vm:set_metatable(sling.util.NodeFinder.NodeTypeFinder, {
	__index = _g.sling.common.NodeVisitor
})

function sling.util.NodeFinder.NodeTypeFinder._create()
	local v = _vm:set_metatable({}, sling.util.NodeFinder.NodeTypeFinder)
	return v
end

function sling.util.NodeFinder.NodeTypeFinder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.NodeFinder.NodeTypeFinder'
	self['_isType.sling.util.NodeFinder.NodeTypeFinder'] = true
	self.searchForTypes = {}
	self.results = {}
	self.ignoreMacros = true
	self.ignoreHeaders = true
end

function sling.util.NodeFinder.NodeTypeFinder:_construct0()
	sling.util.NodeFinder.NodeTypeFinder._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.util.NodeFinder.NodeTypeFinder:addToSearchForTypes(type)
	do _g.jk.lang.Vector:append(self.searchForTypes, type) end
end

function sling.util.NodeFinder.NodeTypeFinder:visit(node)
	if node ~= nil then
		if self.ignoreMacros and _g.sling.util.ModifierUtil:hasAnnotationModifier(node, "macro") then
			do self:setSkipChildren(true) end
			do return true end
		end
		if self.ignoreHeaders and _g.sling.util.ModifierUtil:hasCommonModifier(node, "header") then
			do self:setSkipChildren(true) end
			do return true end
		end
		do
			local nti = _vm:get_datatype_info(node)
			if self.searchForTypes ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(self.searchForTypes)
				do
					n = 0
					while n < m do
						local searchForType = self.searchForTypes[n + 1]
						if searchForType ~= nil then
							if nti == searchForType then
								do _g.jk.lang.Vector:append(self.results, node) end
								do break end
							end
						end
						do n = n + 1 end
					end
				end
			end
		end
	end
	do return true end
end

function sling.util.NodeFinder.NodeTypeFinder:getSearchForTypes()
	do return self.searchForTypes end
end

function sling.util.NodeFinder.NodeTypeFinder:setSearchForTypes(v)
	self.searchForTypes = v
	do return self end
end

function sling.util.NodeFinder.NodeTypeFinder:getResults()
	do return self.results end
end

function sling.util.NodeFinder.NodeTypeFinder:setResults(v)
	self.results = v
	do return self end
end

function sling.util.NodeFinder.NodeTypeFinder:getIgnoreMacros()
	do return self.ignoreMacros end
end

function sling.util.NodeFinder.NodeTypeFinder:setIgnoreMacros(v)
	self.ignoreMacros = v
	do return self end
end

function sling.util.NodeFinder.NodeTypeFinder:getIgnoreHeaders()
	do return self.ignoreHeaders end
end

function sling.util.NodeFinder.NodeTypeFinder:setIgnoreHeaders(v)
	self.ignoreHeaders = v
	do return self end
end

function sling.util.NodeFinder:findNodesOfType(node, type, reverse, ignoreMacros, ignoreHeaders)
	local ff = _g.sling.util.NodeFinder.NodeTypeFinder._construct0(_g.sling.util.NodeFinder.NodeTypeFinder._create())
	do ff:setIgnoreMacros(ignoreMacros) end
	do ff:setIgnoreHeaders(ignoreHeaders) end
	if node ~= nil and type ~= nil then
		do ff:addToSearchForTypes(type) end
		do node:accept(ff) end
	end
	do
		local v = ff:getResults()
		if reverse then
			do _g.jk.lang.Vector:reverse(v) end
		end
		do return v end
	end
end

function sling.util.NodeFinder:findNodesOfTypes(node, types, reverse, ignoreMacros, ignoreHeaders)
	local ff = _g.sling.util.NodeFinder.NodeTypeFinder._construct0(_g.sling.util.NodeFinder.NodeTypeFinder._create())
	do ff:setIgnoreMacros(ignoreMacros) end
	do ff:setIgnoreHeaders(ignoreHeaders) end
	if node ~= nil and types ~= nil then
		if types ~= nil then
			local n = 0
			local m = #types
			do
				n = 0
				while n < m do
					local type = types[n + 1]
					if type ~= nil then
						do ff:addToSearchForTypes(type) end
					end
					do n = n + 1 end
				end
			end
		end
		do node:accept(ff) end
	end
	do
		local v = ff:getResults()
		if reverse then
			do _g.jk.lang.Vector:reverse(v) end
		end
		do return v end
	end
end

sling.util.NodeFinder.NodeBaseTypeFinder = _g.sling.common.NodeVisitor._create()
sling.util.NodeFinder.NodeBaseTypeFinder.__index = sling.util.NodeFinder.NodeBaseTypeFinder
_vm:set_metatable(sling.util.NodeFinder.NodeBaseTypeFinder, {
	__index = _g.sling.common.NodeVisitor
})

function sling.util.NodeFinder.NodeBaseTypeFinder._create()
	local v = _vm:set_metatable({}, sling.util.NodeFinder.NodeBaseTypeFinder)
	return v
end

function sling.util.NodeFinder.NodeBaseTypeFinder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.NodeFinder.NodeBaseTypeFinder'
	self['_isType.sling.util.NodeFinder.NodeBaseTypeFinder'] = true
	self.searchForTypes = {}
	self.results = {}
	self.ignoreMacros = true
	self.ignoreHeaders = true
end

function sling.util.NodeFinder.NodeBaseTypeFinder:_construct0()
	sling.util.NodeFinder.NodeBaseTypeFinder._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.util.NodeFinder.NodeBaseTypeFinder:addToSearchForTypes(type)
	do _g.jk.lang.Vector:append(self.searchForTypes, type) end
end

function sling.util.NodeFinder.NodeBaseTypeFinder:visit(node)
	if node ~= nil then
		if self.ignoreMacros and _g.sling.util.ModifierUtil:hasAnnotationModifier(node, "macro") then
			do self:setSkipChildren(true) end
			do return true end
		end
		if self.ignoreHeaders and _g.sling.util.ModifierUtil:hasCommonModifier(node, "header") then
			do self:setSkipChildren(true) end
			do return true end
		end
		if self.searchForTypes ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self.searchForTypes)
			do
				n = 0
				while n < m do
					local searchForType = self.searchForTypes[n + 1]
					if searchForType ~= nil then
						if _g.jk.lang.Reflection:isInstanceOf(node, searchForType) then
							do _g.jk.lang.Vector:append(self.results, node) end
							do break end
						end
					end
					do n = n + 1 end
				end
			end
		end
	end
	do return true end
end

function sling.util.NodeFinder.NodeBaseTypeFinder:getSearchForTypes()
	do return self.searchForTypes end
end

function sling.util.NodeFinder.NodeBaseTypeFinder:setSearchForTypes(v)
	self.searchForTypes = v
	do return self end
end

function sling.util.NodeFinder.NodeBaseTypeFinder:getResults()
	do return self.results end
end

function sling.util.NodeFinder.NodeBaseTypeFinder:setResults(v)
	self.results = v
	do return self end
end

function sling.util.NodeFinder.NodeBaseTypeFinder:getIgnoreMacros()
	do return self.ignoreMacros end
end

function sling.util.NodeFinder.NodeBaseTypeFinder:setIgnoreMacros(v)
	self.ignoreMacros = v
	do return self end
end

function sling.util.NodeFinder.NodeBaseTypeFinder:getIgnoreHeaders()
	do return self.ignoreHeaders end
end

function sling.util.NodeFinder.NodeBaseTypeFinder:setIgnoreHeaders(v)
	self.ignoreHeaders = v
	do return self end
end

function sling.util.NodeFinder:findCompatibleNodes(node, type, reverse, ignoreMacros, ignoreHeaders)
	local ff = _g.sling.util.NodeFinder.NodeBaseTypeFinder._construct0(_g.sling.util.NodeFinder.NodeBaseTypeFinder._create())
	do ff:setIgnoreMacros(ignoreMacros) end
	do ff:setIgnoreHeaders(ignoreHeaders) end
	if node ~= nil and type ~= nil then
		do ff:addToSearchForTypes(type) end
		do node:accept(ff) end
	end
	do
		local v = ff:getResults()
		if reverse then
			do _g.jk.lang.Vector:reverse(v) end
		end
		do return v end
	end
end

function sling.util.NodeFinder:findCompatibleNodesForTypes(node, types, reverse, ignoreMacros, ignoreHeaders)
	local ff = _g.sling.util.NodeFinder.NodeBaseTypeFinder._construct0(_g.sling.util.NodeFinder.NodeBaseTypeFinder._create())
	do ff:setIgnoreMacros(ignoreMacros) end
	do ff:setIgnoreHeaders(ignoreHeaders) end
	if node ~= nil and types ~= nil then
		if types ~= nil then
			local n = 0
			local m = #types
			do
				n = 0
				while n < m do
					local type = types[n + 1]
					if type ~= nil then
						do ff:addToSearchForTypes(type) end
					end
					do n = n + 1 end
				end
			end
		end
		do node:accept(ff) end
	end
	do
		local v = ff:getResults()
		if reverse then
			do _g.jk.lang.Vector:reverse(v) end
		end
		do return v end
	end
end

sling.util.NodeFinder.CustomNodeVisitor = _g.sling.common.NodeVisitor._create()
sling.util.NodeFinder.CustomNodeVisitor.__index = sling.util.NodeFinder.CustomNodeVisitor
_vm:set_metatable(sling.util.NodeFinder.CustomNodeVisitor, {
	__index = _g.sling.common.NodeVisitor
})

function sling.util.NodeFinder.CustomNodeVisitor._create()
	local v = _vm:set_metatable({}, sling.util.NodeFinder.CustomNodeVisitor)
	return v
end

function sling.util.NodeFinder.CustomNodeVisitor:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.NodeFinder.CustomNodeVisitor'
	self['_isType.sling.util.NodeFinder.CustomNodeVisitor'] = true
	self._function = nil
end

function sling.util.NodeFinder.CustomNodeVisitor:_construct0()
	sling.util.NodeFinder.CustomNodeVisitor._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.util.NodeFinder.CustomNodeVisitor:visit(node)
	if self._function ~= nil then
		do self._function(node) end
	end
	do return true end
end

function sling.util.NodeFinder.CustomNodeVisitor:getFunction()
	do return self._function end
end

function sling.util.NodeFinder.CustomNodeVisitor:setFunction(v)
	self._function = v
	do return self end
end

function sling.util.NodeFinder:visitAllNodes(node, visitor)
	if not (node ~= nil) then
		do return end
	end
	do
		local cnv = _g.sling.util.NodeFinder.CustomNodeVisitor._construct0(_g.sling.util.NodeFinder.CustomNodeVisitor._create())
		do cnv:setFunction(visitor) end
		do node:accept(cnv) end
	end
end

sling.util.ProjectUtil = {}
sling.util.ProjectUtil.__index = sling.util.ProjectUtil
_vm:set_metatable(sling.util.ProjectUtil, {})

function sling.util.ProjectUtil._create()
	local v = _vm:set_metatable({}, sling.util.ProjectUtil)
	return v
end

function sling.util.ProjectUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.ProjectUtil'
	self['_isType.sling.util.ProjectUtil'] = true
end

function sling.util.ProjectUtil:_construct0()
	sling.util.ProjectUtil._init(self)
	return self
end

function sling.util.ProjectUtil:findResourcesForTree(node)
	local v = {}
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.ResourceFileNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local rs = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ResourceFileNode')
				if rs ~= nil then
					do _g.jk.lang.Vector:append(v, rs) end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function sling.util.ProjectUtil:copyTreeResourcesToDirectory(ctx, tree, outputDirectory)
	local array = _g.sling.util.ProjectUtil:findResourcesForTree(tree)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local resource = array[n + 1]
				if resource ~= nil then
					local file = resource:getFile()
					if not (file ~= nil) then
						goto _continue2
					end
					do
						local baseName = file:getBasename()
						if not outputDirectory:isDirectory() then
							do outputDirectory:createDirectoryRecursive() end
						end
						do
							local dest = outputDirectory:entry(baseName)
							do _g.jk.log.Log:debug(ctx, "Copying resource file `" .. _g.jk.lang.String:safeString(file:getPath()) .. "' -> `" .. _g.jk.lang.String:safeString(dest:getPath()) .. "'") end
							if not file:copyFileTo(dest) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to copy resource: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "' to `" .. _g.jk.lang.String:safeString(dest:getPath()) .. "'", resource, nil))
							end
						end
					end
				end
				::_continue2::
				do n = n + 1 end
			end
		end
	end
end

sling.util.ModifierUtil = {}
sling.util.ModifierUtil.__index = sling.util.ModifierUtil
_vm:set_metatable(sling.util.ModifierUtil, {})

function sling.util.ModifierUtil._create()
	local v = _vm:set_metatable({}, sling.util.ModifierUtil)
	return v
end

function sling.util.ModifierUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.ModifierUtil'
	self['_isType.sling.util.ModifierUtil'] = true
end

function sling.util.ModifierUtil:_construct0()
	sling.util.ModifierUtil._init(self)
	return self
end

function sling.util.ModifierUtil:removeModifiers(node)
	local nn = _vm:to_table_with_key(node, '_isType.sling.model.NodeWithModifiers')
	if not (nn ~= nil) then
		do return end
	end
	do nn:setModifiers(nil, false) end
end

function sling.util.ModifierUtil:removeCommonModifier(node, mod)
	if not (mod ~= nil) then
		do return false end
	end
	do
		local nn = _vm:to_table_with_key(node, '_isType.sling.model.NodeWithModifiers')
		if not (nn ~= nil) then
			do return false end
		end
		do
			local modifiers = nn:getModifiers()
			if not (modifiers ~= nil) then
				do return false end
			end
			do
				local toremove = nil
				if modifiers ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(modifiers)
					do
						n = 0
						while n < m do
							local mm = _vm:to_table_with_key(modifiers[n + 1], '_isType.sling.model.CommonModifierNode')
							if mm ~= nil then
								if mm:getType() == mod then
									if not (toremove ~= nil) then
										toremove = {}
									end
									do _g.jk.lang.Vector:append(toremove, mm) end
								end
							end
							do n = n + 1 end
						end
					end
				end
				do
					local v = false
					if toremove ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(toremove)
						do
							n2 = 0
							while n2 < m2 do
								local rem = toremove[n2 + 1]
								if rem ~= nil then
									do _g.sling.util.NodeUtil:removeNode(rem) end
									v = true
								end
								do n2 = n2 + 1 end
							end
						end
					end
					do return v end
				end
			end
		end
	end
end

function sling.util.ModifierUtil:removeAnnotationModifier(node, mod)
	if not (mod ~= nil) then
		do return false end
	end
	do
		local nn = _vm:to_table_with_key(node, '_isType.sling.model.NodeWithModifiers')
		if not (nn ~= nil) then
			do return false end
		end
		do
			local modifiers = nn:getModifiers()
			if not (modifiers ~= nil) then
				do return false end
			end
			do
				local toremove = nil
				if modifiers ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(modifiers)
					do
						n = 0
						while n < m do
							local mm = _vm:to_table_with_key(modifiers[n + 1], '_isType.sling.model.AnnotationModifierNode')
							if mm ~= nil then
								if mm:getText() == mod then
									if not (toremove ~= nil) then
										toremove = {}
									end
									do _g.jk.lang.Vector:append(toremove, mm) end
								end
							end
							do n = n + 1 end
						end
					end
				end
				do
					local v = false
					if toremove ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(toremove)
						do
							n2 = 0
							while n2 < m2 do
								local rem = toremove[n2 + 1]
								if rem ~= nil then
									do _g.sling.util.NodeUtil:removeNode(rem) end
									v = true
								end
								do n2 = n2 + 1 end
							end
						end
					end
					do return v end
				end
			end
		end
	end
end

function sling.util.ModifierUtil:addCommonModifier(node, mod)
	if not (node ~= nil and mod ~= nil) then
		do return end
	end
	if not _g.sling.util.ModifierUtil:hasCommonModifier(node, mod) then
		do _g.sling.util.ModifierUtil:addModifierNode(node, _g.sling.model.CommonModifierNode:forType(mod)) end
	end
end

function sling.util.ModifierUtil:addAnnotationModifier(node, mod)
	if not (mod ~= nil) then
		do return end
	end
	do _g.sling.util.ModifierUtil:addModifierNode(node, _g.sling.model.AnnotationModifierNode:forText(mod)) end
end

function sling.util.ModifierUtil:addModifierNode(node, mod)
	if not (node ~= nil and mod ~= nil) then
		do return end
	end
	do node:addToModifiers(mod) end
end

function sling.util.ModifierUtil:addModifierNodes(node, mods)
	if mods ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(mods)
		do
			n = 0
			while n < m do
				local mod = _vm:to_table_with_key(mods[n + 1], '_isType.sling.common.NodeObject')
				if mod ~= nil then
					do node:addToModifiers(mod) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.util.ModifierUtil:setModifierNodes(node, mods)
	if not (node ~= nil) then
		do return end
	end
	do node:setModifiers(nil, false) end
	if mods ~= nil then
		do _g.sling.util.ModifierUtil:addModifierNodes(node, mods) end
	end
end

function sling.util.ModifierUtil:getCommonModifiers(node)
	if not (node ~= nil) then
		do return nil end
	end
	do
		local v = nil
		local array = node:getModifiers()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local mod = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.CommonModifierNode')
					if mod ~= nil then
						if not (v ~= nil) then
							v = {}
						end
						do _g.jk.lang.Vector:append(v, mod:getType()) end
					end
					do n = n + 1 end
				end
			end
		end
		do return v end
	end
end

function sling.util.ModifierUtil:getAnnotationModifiers(node)
	if not (node ~= nil) then
		do return nil end
	end
	do
		local v = nil
		local array = node:getModifiers()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local mod = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.AnnotationModifierNode')
					if mod ~= nil then
						if not (v ~= nil) then
							v = {}
						end
						do _g.jk.lang.Vector:append(v, mod:getText()) end
					end
					do n = n + 1 end
				end
			end
		end
		do return v end
	end
end

function sling.util.ModifierUtil:getModifierNodes(node)
	if not (node ~= nil) then
		do return nil end
	end
	do return node:getModifiers() end
end

function sling.util.ModifierUtil:exportModifierNodes(node)
	if not (node ~= nil) then
		do return nil end
	end
	do return node:exportModifiers() end
end

function sling.util.ModifierUtil:hasCommonModifier(node, name)
	if not (name ~= nil) then
		do return false end
	end
	do
		local nn = _vm:to_table_with_key(node, '_isType.sling.model.NodeWithModifiers')
		if not (nn ~= nil) then
			do return false end
		end
		do
			local array = nn:getModifiers()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local mod = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.CommonModifierNode')
						if mod ~= nil then
							if mod:getType() == name then
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
end

function sling.util.ModifierUtil:hasAnnotationModifier(node, name)
	if not (name ~= nil) then
		do return false end
	end
	do
		local nn = _vm:to_table_with_key(node, '_isType.sling.model.NodeWithModifiers')
		if not (nn ~= nil) then
			do return false end
		end
		do
			local array = nn:getModifiers()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local mod = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.AnnotationModifierNode')
						if mod ~= nil then
							if mod:getText() == name then
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
end

function sling.util.ModifierUtil:copyModifiers(from, to)
	if not (to ~= nil) then
		do return end
	end
	do to:setModifiers(nil, false) end
	do
		local fnn = _vm:to_table_with_key(from, '_isType.sling.model.NodeWithModifiers')
		if not (fnn ~= nil) then
			do return end
		end
		do
			local array = fnn:getModifiers()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local mod = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
						if mod ~= nil then
							local mdup = mod:dup()
							if mdup ~= nil then
								do to:addToModifiers(mdup) end
							end
						end
						do n = n + 1 end
					end
				end
			end
		end
	end
end

sling.util.PropertyUtil = {}
sling.util.PropertyUtil.__index = sling.util.PropertyUtil
_vm:set_metatable(sling.util.PropertyUtil, {})

function sling.util.PropertyUtil._create()
	local v = _vm:set_metatable({}, sling.util.PropertyUtil)
	return v
end

function sling.util.PropertyUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.PropertyUtil'
	self['_isType.sling.util.PropertyUtil'] = true
end

function sling.util.PropertyUtil:_construct0()
	sling.util.PropertyUtil._init(self)
	return self
end

function sling.util.PropertyUtil:getGetFunction(property)
	if not (property ~= nil) then
		do return nil end
	end
	do
		local body = property:getBody()
		if not (body ~= nil) then
			do return nil end
		end
		do
			local array = body:getNodes()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.PropertyGetFunctionDeclarationNode')
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
end

function sling.util.PropertyUtil:getSetFunction(property)
	if not (property ~= nil) then
		do return nil end
	end
	do
		local body = property:getBody()
		if not (body ~= nil) then
			do return nil end
		end
		do
			local array = body:getNodes()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.PropertySetFunctionDeclarationNode')
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
end

function sling.util.PropertyUtil:getWillSetFunction(property)
	if not (property ~= nil) then
		do return nil end
	end
	do
		local body = property:getBody()
		if not (body ~= nil) then
			do return nil end
		end
		do
			local array = body:getNodes()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.PropertyWillSetFunctionDeclarationNode')
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
end

function sling.util.PropertyUtil:getDidSetFunction(property)
	if not (property ~= nil) then
		do return nil end
	end
	do
		local body = property:getBody()
		if not (body ~= nil) then
			do return nil end
		end
		do
			local array = body:getNodes()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.PropertyDidSetFunctionDeclarationNode')
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
end

function sling.util.PropertyUtil:getInitializeFunction(property)
	if not (property ~= nil) then
		do return nil end
	end
	do
		local body = property:getBody()
		if not (body ~= nil) then
			do return nil end
		end
		do
			local array = body:getNodes()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.PropertyInitializeFunctionDeclarationNode')
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
end

function sling.util.PropertyUtil:getBodyNodes(property)
	if not (property ~= nil) then
		do return nil end
	end
	do
		local body = property:getBody()
		if not (body ~= nil) then
			do return nil end
		end
		do return body:getNodes() end
	end
end

sling.util.FindUtil = {}
sling.util.FindUtil.__index = sling.util.FindUtil
_vm:set_metatable(sling.util.FindUtil, {})

function sling.util.FindUtil._create()
	local v = _vm:set_metatable({}, sling.util.FindUtil)
	return v
end

function sling.util.FindUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.FindUtil'
	self['_isType.sling.util.FindUtil'] = true
end

function sling.util.FindUtil:_construct0()
	sling.util.FindUtil._init(self)
	return self
end

function sling.util.FindUtil:findRootNamespace(node)
	local pp = node
	while pp ~= nil do
		if not (pp ~= nil) then
			do break end
		end
		do
			local ns = _vm:to_table_with_key(pp, '_isType.sling.model.NamespaceNode')
			if ns ~= nil and _g.jk.lang.String:isEmpty(ns:getNodeName()) then
				do return ns end
			end
			pp = pp:getParent()
		end
	end
	do return nil end
end

function sling.util.FindUtil:findNearestNamespace(node)
	if not (node ~= nil) then
		do return nil end
	end
	do
		local pp = node:getParent()
		while true do
			if not (pp ~= nil) then
				do break end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.NamespaceNode') ~= nil) then
				do return pp end
			end
			pp = pp:getParent()
		end
		do return nil end
	end
end

function sling.util.FindUtil:findNearestCodeFile(node)
	if not (node ~= nil) then
		do return nil end
	end
	do
		local pp = node:getParent()
		while true do
			if not (pp ~= nil) then
				do break end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.common.CodeFileNode') ~= nil) then
				do return pp end
			end
			pp = pp:getParent()
		end
		do return nil end
	end
end

function sling.util.FindUtil:findNearestCodeUnit(node)
	if not (node ~= nil) then
		do return nil end
	end
	do
		local pp = node:getParent()
		while true do
			if not (pp ~= nil) then
				do break end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.common.CodeUnitNode') ~= nil) then
				do return pp end
			end
			pp = pp:getParent()
		end
		do return nil end
	end
end

function sling.util.FindUtil:findNearestClass(node)
	if not (node ~= nil) then
		do return nil end
	end
	do
		local pp = node:getParent()
		while true do
			if not (pp ~= nil) then
				do break end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.ClassDeclarationNode') ~= nil) then
				do return pp end
			end
			pp = pp:getParent()
		end
		do return nil end
	end
end

function sling.util.FindUtil:findNearestEntity(node)
	if not (node ~= nil) then
		do return nil end
	end
	do
		local pp = node:getParent()
		while true do
			if not (pp ~= nil) then
				do break end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.EntityDeclarationNode') ~= nil) then
				do return pp end
			end
			pp = pp:getParent()
		end
		do return nil end
	end
end

function sling.util.FindUtil:findNearestFunctionBase(node)
	if not (node ~= nil) then
		do return nil end
	end
	do
		local pp = node:getParent()
		while true do
			if not (pp ~= nil) then
				do break end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.FunctionDeclarationBaseNode') ~= nil) then
				do return pp end
			end
			pp = pp:getParent()
		end
		do return nil end
	end
end

function sling.util.FindUtil:findNearestLoop(node)
	if not (node ~= nil) then
		do return nil end
	end
	do
		local pp = node:getParent()
		while true do
			if not (pp ~= nil) then
				do break end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.LoopStatementNode') ~= nil) then
				do return pp end
			end
			pp = pp:getParent()
		end
		do return nil end
	end
end

function sling.util.FindUtil:findNearestFunction(node)
	if not (node ~= nil) then
		do return nil end
	end
	do
		local pp = node:getParent()
		while true do
			if not (pp ~= nil) then
				do break end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
				do return pp end
			end
			pp = pp:getParent()
		end
		do return nil end
	end
end

function sling.util.FindUtil:findNearestBlock(node)
	if not (node ~= nil) then
		do return nil end
	end
	do
		local pp = node:getParent()
		while true do
			if not (pp ~= nil) then
				do break end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.BlockNode') ~= nil) then
				do return pp end
			end
			pp = pp:getParent()
		end
		do return nil end
	end
end

function sling.util.FindUtil:findTopmostEntity(node)
	local v = node
	while true do
		local x = _g.sling.util.FindUtil:findNearestEntity(v)
		if x == nil then
			do break end
		end
		v = x
	end
	do return _vm:to_table_with_key(v, '_isType.sling.model.EntityDeclarationNode') end
end

function sling.util.FindUtil:findNodesOfType(node, type, reverse, ignoreMacros, ignoreHeaders)
	do return _g.sling.util.NodeFinder:findNodesOfType(node, type, reverse, ignoreMacros, ignoreHeaders) end
end

function sling.util.FindUtil:findNodesOfTypes(node, types, reverse, ignoreMacros, ignoreHeaders)
	do return _g.sling.util.NodeFinder:findNodesOfTypes(node, types, reverse, ignoreMacros, ignoreHeaders) end
end

function sling.util.FindUtil:findCompatibleNodes(node, type, reverse, ignoreMacros, ignoreHeaders)
	do return _g.sling.util.NodeFinder:findCompatibleNodes(node, type, reverse, ignoreMacros, ignoreHeaders) end
end

function sling.util.FindUtil:findCompatibleNodesForTypes(node, types, reverse, ignoreMacros, ignoreHeaders)
	do return _g.sling.util.NodeFinder:findCompatibleNodesForTypes(node, types, reverse, ignoreMacros, ignoreHeaders) end
end

function sling.util.FindUtil:visitAllNodes(node, visitor)
	do return _g.sling.util.NodeFinder:visitAllNodes(node, visitor) end
end

sling.util.FindUtil.NodeAnyModifierFinder = _g.sling.common.NodeVisitor._create()
sling.util.FindUtil.NodeAnyModifierFinder.__index = sling.util.FindUtil.NodeAnyModifierFinder
_vm:set_metatable(sling.util.FindUtil.NodeAnyModifierFinder, {
	__index = _g.sling.common.NodeVisitor
})

function sling.util.FindUtil.NodeAnyModifierFinder._create()
	local v = _vm:set_metatable({}, sling.util.FindUtil.NodeAnyModifierFinder)
	return v
end

function sling.util.FindUtil.NodeAnyModifierFinder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.FindUtil.NodeAnyModifierFinder'
	self['_isType.sling.util.FindUtil.NodeAnyModifierFinder'] = true
	self.searchForModifier = {}
	self.results = {}
end

function sling.util.FindUtil.NodeAnyModifierFinder:_construct0()
	sling.util.FindUtil.NodeAnyModifierFinder._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.util.FindUtil.NodeAnyModifierFinder:addToSearchForModifier(mod)
	do _g.jk.lang.Vector:append(self.searchForModifier, mod) end
end

function sling.util.FindUtil.NodeAnyModifierFinder:visit(node)
	if node ~= nil then
		if self.searchForModifier ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self.searchForModifier)
			do
				n = 0
				while n < m do
					local mod = self.searchForModifier[n + 1]
					if mod ~= nil then
						if _g.sling.util.ModifierUtil:hasCommonModifier(node, mod) then
							do _g.jk.lang.Vector:append(self.results, node) end
						end
					end
					do n = n + 1 end
				end
			end
		end
	end
	do return true end
end

function sling.util.FindUtil.NodeAnyModifierFinder:getSearchForModifier()
	do return self.searchForModifier end
end

function sling.util.FindUtil.NodeAnyModifierFinder:setSearchForModifier(v)
	self.searchForModifier = v
	do return self end
end

function sling.util.FindUtil.NodeAnyModifierFinder:getResults()
	do return self.results end
end

function sling.util.FindUtil.NodeAnyModifierFinder:setResults(v)
	self.results = v
	do return self end
end

function sling.util.FindUtil:findNodesWithAnyModifier(node, mods)
	local ff = _g.sling.util.FindUtil.NodeAnyModifierFinder._construct0(_g.sling.util.FindUtil.NodeAnyModifierFinder._create())
	if node ~= nil and mods ~= nil then
		if mods ~= nil then
			local n = 0
			local m = #mods
			do
				n = 0
				while n < m do
					local mod = mods[n + 1]
					if mod ~= nil then
						do ff:addToSearchForModifier(mod) end
					end
					do n = n + 1 end
				end
			end
		end
		do node:accept(ff) end
	end
	do return ff:getResults() end
end

sling.util.FindUtil.NodeAllModifierFinder = _g.sling.common.NodeVisitor._create()
sling.util.FindUtil.NodeAllModifierFinder.__index = sling.util.FindUtil.NodeAllModifierFinder
_vm:set_metatable(sling.util.FindUtil.NodeAllModifierFinder, {
	__index = _g.sling.common.NodeVisitor
})

function sling.util.FindUtil.NodeAllModifierFinder._create()
	local v = _vm:set_metatable({}, sling.util.FindUtil.NodeAllModifierFinder)
	return v
end

function sling.util.FindUtil.NodeAllModifierFinder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.FindUtil.NodeAllModifierFinder'
	self['_isType.sling.util.FindUtil.NodeAllModifierFinder'] = true
	self.searchForModifier = {}
	self.results = {}
end

function sling.util.FindUtil.NodeAllModifierFinder:_construct0()
	sling.util.FindUtil.NodeAllModifierFinder._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.util.FindUtil.NodeAllModifierFinder:addToSearchForModifier(mod)
	do _g.jk.lang.Vector:append(self.searchForModifier, mod) end
end

function sling.util.FindUtil.NodeAllModifierFinder:visit(node)
	if node ~= nil then
		local v = true
		if self.searchForModifier ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self.searchForModifier)
			do
				n = 0
				while n < m do
					local mod = self.searchForModifier[n + 1]
					if mod ~= nil then
						if _g.sling.util.ModifierUtil:hasCommonModifier(node, mod) == false then
							v = false
							do break end
						end
					end
					do n = n + 1 end
				end
			end
		end
		if v then
			do _g.jk.lang.Vector:append(self.results, node) end
		end
	end
	do return true end
end

function sling.util.FindUtil.NodeAllModifierFinder:getSearchForModifier()
	do return self.searchForModifier end
end

function sling.util.FindUtil.NodeAllModifierFinder:setSearchForModifier(v)
	self.searchForModifier = v
	do return self end
end

function sling.util.FindUtil.NodeAllModifierFinder:getResults()
	do return self.results end
end

function sling.util.FindUtil.NodeAllModifierFinder:setResults(v)
	self.results = v
	do return self end
end

function sling.util.FindUtil:findNodesWithAllModifiers(node, mods)
	local ff = _g.sling.util.FindUtil.NodeAllModifierFinder._construct0(_g.sling.util.FindUtil.NodeAllModifierFinder._create())
	if node ~= nil and mods ~= nil then
		if mods ~= nil then
			local n = 0
			local m = #mods
			do
				n = 0
				while n < m do
					local mod = mods[n + 1]
					if mod ~= nil then
						do ff:addToSearchForModifier(mod) end
					end
					do n = n + 1 end
				end
			end
		end
		do node:accept(ff) end
	end
	do return ff:getResults() end
end

function sling.util.FindUtil:findEntityByName(root, name)
	if not (name ~= nil) then
		do return nil end
	end
	do
		local array = _g.sling.util.FindUtil:findCompatibleNodes(root, "class:sling.model.EntityDeclarationNode", false, true, false)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local ee = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.EntityDeclarationNode')
					if ee ~= nil then
						local qn = _g.sling.util.NodeUtil:getQualifiedNameString(ee, 46)
						if qn == name then
							do return ee end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do return nil end
	end
end

sling.util.ResolveResult = {}
sling.util.ResolveResult.__index = sling.util.ResolveResult
_vm:set_metatable(sling.util.ResolveResult, {})

function sling.util.ResolveResult._create()
	local v = _vm:set_metatable({}, sling.util.ResolveResult)
	return v
end

function sling.util.ResolveResult:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.ResolveResult'
	self['_isType.sling.util.ResolveResult'] = true
	self.node = nil
	self.typemap = nil
	self.typeParameters = nil
end

function sling.util.ResolveResult:_construct0()
	sling.util.ResolveResult._init(self)
	return self
end

function sling.util.ResolveResult:forNode(node)
	local v = _g.sling.util.ResolveResult._construct0(_g.sling.util.ResolveResult._create())
	do v:setNode(node) end
	do return v end
end

function sling.util.ResolveResult:getNode()
	do return self.node end
end

function sling.util.ResolveResult:setNode(v)
	self.node = v
	do return self end
end

function sling.util.ResolveResult:getTypemap()
	do return self.typemap end
end

function sling.util.ResolveResult:setTypemap(v)
	self.typemap = v
	do return self end
end

function sling.util.ResolveResult:getTypeParameters()
	do return self.typeParameters end
end

function sling.util.ResolveResult:setTypeParameters(v)
	self.typeParameters = v
	do return self end
end

sling.util.FunctionUtil = {}
sling.util.FunctionUtil.__index = sling.util.FunctionUtil
_vm:set_metatable(sling.util.FunctionUtil, {})

function sling.util.FunctionUtil._create()
	local v = _vm:set_metatable({}, sling.util.FunctionUtil)
	return v
end

function sling.util.FunctionUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.FunctionUtil'
	self['_isType.sling.util.FunctionUtil'] = true
end

function sling.util.FunctionUtil:_construct0()
	sling.util.FunctionUtil._init(self)
	return self
end

function sling.util.FunctionUtil:prependStatement(fd, stmt)
	if not (fd ~= nil and stmt ~= nil) then
		do return end
	end
	do
		local block = fd:getBody()
		if not (block ~= nil) then
			block = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
			do fd:setBody(block, false) end
		end
		do block:prependNode(stmt) end
	end
end

function sling.util.FunctionUtil:addStatement(fd, stmt)
	if not (fd ~= nil and stmt ~= nil) then
		do return end
	end
	do
		local block = fd:getBody()
		if not (block ~= nil) then
			block = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
			do fd:setBody(block, false) end
		end
		do block:addNode(stmt) end
	end
end

function sling.util.FunctionUtil:createBaseCallForFunction(fd)
	if not (fd ~= nil) then
		do return nil end
	end
	do
		local xpr = nil
		if (_vm:to_table_with_key(fd, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
			xpr = _g.sling.model.MemberAccessExpressionNode:forNodes(_g.sling.model.BaseClassAccessExpressionNode._construct0(_g.sling.model.BaseClassAccessExpressionNode._create()), _g.sling.model.SymbolExpressionNode:forName(fd:getName()))
		else
			xpr = _g.sling.model.BaseClassAccessExpressionNode._construct0(_g.sling.model.BaseClassAccessExpressionNode._create())
		end
		do
			local fc = _g.sling.model.FunctionCallExpressionNode:forExpression(xpr)
			local array = fd:getParameters()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local param = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.VariableDeclarationNode')
						if param ~= nil then
							do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(param, nil)) end
						end
						do n = n + 1 end
					end
				end
			end
			do return fc end
		end
	end
end

function sling.util.FunctionUtil:hasBaseCall(fd)
	if not (fd ~= nil) then
		do return false end
	end
	do
		local body = fd:getBody()
		if not (body ~= nil) then
			do return false end
		end
		do
			local name = nil
			if (_vm:to_table_with_key(fd, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
				name = fd:getName()
			end
			do
				local array = body:getNodes()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local fc = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FunctionCallExpressionNode')
							if fc ~= nil then
								if name ~= nil then
									local max = _vm:to_table_with_key(fc:getExpression(), '_isType.sling.model.MemberAccessExpressionNode')
									if max ~= nil and (_vm:to_table_with_key(max:getParentExpression(), '_isType.sling.model.BaseClassAccessExpressionNode') ~= nil) then
										local cc = _vm:to_table_with_key(max:getChildExpression(), '_isType.sling.model.SymbolExpressionNode')
										if cc ~= nil and _g.jk.lang.String:equals(_g.sling.util.SymbolUtil:getSymbolName(cc:getSymbol()), name) then
											do return true end
										end
									end
								elseif (_vm:to_table_with_key(fc:getExpression(), '_isType.sling.model.BaseClassAccessExpressionNode') ~= nil) then
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
	end
end

function sling.util.FunctionUtil:addBaseCall(fd, force)
	if force or _g.sling.util.FunctionUtil:hasBaseCall(fd) == false then
		do _g.sling.util.FunctionUtil:prependStatement(fd, _g.sling.util.FunctionUtil:createBaseCallForFunction(fd)) end
	end
end

sling.util.FunctionUtil.VariableFinderVisitor = _g.sling.common.NodeVisitor._create()
sling.util.FunctionUtil.VariableFinderVisitor.__index = sling.util.FunctionUtil.VariableFinderVisitor
_vm:set_metatable(sling.util.FunctionUtil.VariableFinderVisitor, {
	__index = _g.sling.common.NodeVisitor
})

function sling.util.FunctionUtil.VariableFinderVisitor._create()
	local v = _vm:set_metatable({}, sling.util.FunctionUtil.VariableFinderVisitor)
	return v
end

function sling.util.FunctionUtil.VariableFinderVisitor:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.FunctionUtil.VariableFinderVisitor'
	self['_isType.sling.util.FunctionUtil.VariableFinderVisitor'] = true
	self.names = nil
	self.lookfor = nil
end

function sling.util.FunctionUtil.VariableFinderVisitor:_construct0()
	sling.util.FunctionUtil.VariableFinderVisitor._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.util.FunctionUtil.VariableFinderVisitor:visit(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
		local nn = node:getName()
		if nn ~= nil and _g.jk.lang.String:startsWith(nn, self.lookfor, 0) then
			do self.names:setBoolean(nn, true) end
		end
	end
	do return true end
end

function sling.util.FunctionUtil.VariableFinderVisitor:getNames()
	do return self.names end
end

function sling.util.FunctionUtil.VariableFinderVisitor:setNames(v)
	self.names = v
	do return self end
end

function sling.util.FunctionUtil.VariableFinderVisitor:getLookfor()
	do return self.lookfor end
end

function sling.util.FunctionUtil.VariableFinderVisitor:setLookfor(v)
	self.lookfor = v
	do return self end
end

function sling.util.FunctionUtil:findUniqueVariableNameInFunction(_function, name)
	if not (name ~= nil) then
		do return nil end
	end
	do
		local names = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		local body = _function:getBody()
		if body ~= nil then
			do body:accept(_g.sling.util.FunctionUtil.VariableFinderVisitor._construct0(_g.sling.util.FunctionUtil.VariableFinderVisitor._create()):setNames(names):setLookfor(name)) end
		end
		do
			local array = _function:getParameters()
			if array ~= nil then
				local n2 = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n2 = 0
					while n2 < m do
						local pp = _vm:to_table_with_key(array[n2 + 1], '_isType.sling.model.VariableDeclarationNode')
						if pp ~= nil then
							local nn = pp:getName()
							if nn ~= nil and _g.jk.lang.String:startsWith(nn, name, 0) then
								do names:setBoolean(nn, true) end
							end
						end
						do n2 = n2 + 1 end
					end
				end
			end
			do
				local pe = _vm:to_table_with_key(_function:getParent(), '_isType.sling.model.EntityDeclarationNode')
				if pe ~= nil then
					local array2 = pe:getNodes()
					if array2 ~= nil then
						local n3 = 0
						local m2 = _g.jk.lang.Vector:getSize(array2)
						do
							n3 = 0
							while n3 < m2 do
								local mv = _vm:to_table_with_key(array2[n3 + 1], '_isType.sling.model.VariableDeclarationNode')
								if mv ~= nil then
									local nn = mv:getName()
									if _g.jk.lang.String:startsWith(nn, name, 0) then
										do names:setBoolean(nn, true) end
									end
								end
								do n3 = n3 + 1 end
							end
						end
					end
				end
				if not (names:get(name) ~= nil) then
					do return name end
				end
				do
					local n = 2
					while n < 1000000 do
						local nn = _g.jk.lang.String:safeString(name) .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(n))
						if not (names:get(nn) ~= nil) then
							do return nn end
						end
						do n = n + 1 end
					end
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unable to find unique variable name: `" .. _g.jk.lang.String:safeString(name) .. "'", _function, nil))
					do return nil end
				end
			end
		end
	end
end

function sling.util.FunctionUtil:findUniqueVariableNameInContainer(container, name)
	if not (name ~= nil) then
		do return nil end
	end
	do
		local names = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		if container ~= nil then
			do container:accept(_g.sling.util.FunctionUtil.VariableFinderVisitor._construct0(_g.sling.util.FunctionUtil.VariableFinderVisitor._create()):setNames(names):setLookfor(name)) end
		end
		if not (names:get(name) ~= nil) then
			do return name end
		end
		do
			local n = 2
			while n < 1000000 do
				local nn = _g.jk.lang.String:safeString(name) .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(n))
				if not (names:get(nn) ~= nil) then
					do return nn end
				end
				do n = n + 1 end
			end
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unable to find unique variable name: `" .. _g.jk.lang.String:safeString(name) .. "'", container, nil))
			do return nil end
		end
	end
end

function sling.util.FunctionUtil:findUniqueVariableNameForNode(node, name)
	if not (node ~= nil) then
		do return nil end
	end
	if not (name ~= nil) then
		do return nil end
	end
	do
		local ff = _g.sling.util.FindUtil:findNearestFunctionBase(node)
		if ff ~= nil then
			do return _g.sling.util.FunctionUtil:findUniqueVariableNameInFunction(ff, name) end
		end
		do
			local pp = _vm:to_table_with_key(node:getParent(), '_isType.sling.common.ContainerNode')
			if pp ~= nil then
				do return _g.sling.util.FunctionUtil:findUniqueVariableNameInContainer(pp, name) end
			end
			do return name end
		end
	end
end

function sling.util.FunctionUtil:addBaseClassCallParameters(resolver, decl, force, findExact)
	if not (decl ~= nil) then
		do return end
	end
	if decl:getNext() ~= nil then
		do return end
	end
	do
		local body = decl:getBody()
		if body ~= nil then
			local array = body:getNodes()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local nod = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
						if nod ~= nil then
							if (_vm:to_table_with_key(nod, '_isType.sling.model.FunctionCallExpressionNode') ~= nil) then
								local mx = nod:getExpression()
								if mx ~= nil and ((_vm:to_table_with_key(mx, '_isType.sling.model.BaseClassAccessExpressionNode') ~= nil) or (_vm:to_table_with_key(mx, '_isType.sling.model.CurrentObjectExpressionNode') ~= nil)) then
									do return end
								end
							end
						end
						do n = n + 1 end
					end
				end
			end
		end
		do
			local myclass = _g.sling.util.FindUtil:findNearestClass(decl)
			if not (myclass ~= nil) then
				do return end
			end
			do
				local fc = _g.sling.model.FunctionCallExpressionNode:forExpression(_g.sling.model.BaseClassAccessExpressionNode._construct0(_g.sling.model.BaseClassAccessExpressionNode._create()))
				local baseclass = resolver:getBaseClass(myclass)
				if baseclass ~= nil and (_vm:to_table_with_key(baseclass, '_isType.sling.model.MagicalClassDeclarationNode') ~= nil) == false then
					local params = {}
					local array2 = decl:getParameters()
					if array2 ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(array2)
						do
							n2 = 0
							while n2 < m2 do
								local vd = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.VariableDeclarationNode')
								if vd ~= nil then
									do _g.jk.lang.Vector:append(params, _g.sling.model.SymbolExpressionNode:forBinding(vd, nil)) end
								end
								do n2 = n2 + 1 end
							end
						end
					end
					if findExact then
						if not (resolver:getMatchingConstructor(baseclass, params, nil) ~= nil) then
							do return end
						end
					else
						while not _g.jk.lang.Vector:isEmpty(params) do
							if resolver:getMatchingConstructor(baseclass, params, nil) ~= nil then
								if params ~= nil then
									local n3 = 0
									local m3 = _g.jk.lang.Vector:getSize(params)
									do
										n3 = 0
										while n3 < m3 do
											local xpr = _vm:to_table_with_key(params[n3 + 1], '_isType.sling.model.ExpressionNode')
											if xpr ~= nil then
												do fc:addToParameters(xpr) end
											end
											do n3 = n3 + 1 end
										end
									end
								end
								do decl:setNext(fc, false) end
								do return end
							end
							do _g.jk.lang.Vector:removeLast(params) end
						end
					end
					do decl:setNext(fc, false) end
					do return end
				end
				if force then
					do decl:setNext(fc, false) end
				end
			end
		end
	end
end

function sling.util.FunctionUtil:copySignatureTo(from, to)
	if not (from ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("copySignatureTo: null from", nil, nil))
	end
	if not (to ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("copySignatureTo: null to", nil, nil))
	end
	do
		local array = from:getParameters()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local nd = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
					if nd ~= nil then
						do to:addToParameters(_g.sling.util.NodeUtil:dupAsNode(nd)) end
					end
					do n = n + 1 end
				end
			end
		end
		if (_vm:to_table_with_key(from, '_isType.sling.model.FunctionDeclarationNode') ~= nil) and (_vm:to_table_with_key(to, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
			local dd = from:getReturnType()
			if not (dd ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No return type", from, nil))
			end
			do to:setReturnType(_g.sling.util.DataTypeUtil:dupAsDataType(dd), false) end
		end
	end
end

function sling.util.FunctionUtil:isFunctionCallExpressionChild(node)
	local pp = _vm:to_table_with_key(node:getParent(), '_isType.sling.model.FunctionCallExpressionNode')
	if not (pp ~= nil) then
		do return false end
	end
	if not (pp:getExpression() == node) then
		do return false end
	end
	do return true end
end

function sling.util.FunctionUtil:getFunctionNameForExpression(xpr)
	if not (xpr ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(xpr, '_isType.sling.model.MemberAccessExpressionNode') ~= nil) then
		xpr = xpr:getLastNode()
	end
	if (_vm:to_table_with_key(xpr, '_isType.sling.model.SymbolExpressionNode') ~= nil) then
		do return _g.sling.util.SymbolUtil:getSymbolName(xpr:getSymbol()) end
	end
	do return nil end
end

function sling.util.FunctionUtil:getResolvedDeclarationForExpression(xpr)
	local symxpr = _vm:to_table_with_key(xpr, '_isType.sling.model.SymbolExpressionNode')
	if symxpr ~= nil then
		local symbol = symxpr:getSymbol()
		if symbol ~= nil then
			local bdecl = _vm:to_table_with_key(symbol:getBinding(), '_isType.sling.model.FunctionDeclarationNode')
			if bdecl ~= nil then
				do return bdecl end
			end
		end
		do return nil end
	end
	do
		local max = _vm:to_table_with_key(xpr, '_isType.sling.model.MemberAccessExpressionNode')
		if max ~= nil then
			do return _g.sling.util.FunctionUtil:getResolvedDeclarationForExpression(max:getLastNode()) end
		end
		do return nil end
	end
end

function sling.util.FunctionUtil:getResolvedDeclaration(fc)
	if not (fc ~= nil) then
		do return nil end
	end
	do return _g.sling.util.FunctionUtil:getResolvedDeclarationForExpression(fc:getExpression()) end
end

sling.util.FunctionUtil.DeclarationWithTypemap = {}
sling.util.FunctionUtil.DeclarationWithTypemap.__index = sling.util.FunctionUtil.DeclarationWithTypemap
_vm:set_metatable(sling.util.FunctionUtil.DeclarationWithTypemap, {})

function sling.util.FunctionUtil.DeclarationWithTypemap._create()
	local v = _vm:set_metatable({}, sling.util.FunctionUtil.DeclarationWithTypemap)
	return v
end

function sling.util.FunctionUtil.DeclarationWithTypemap:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.FunctionUtil.DeclarationWithTypemap'
	self['_isType.sling.util.FunctionUtil.DeclarationWithTypemap'] = true
	self.declaration = nil
	self.typemap = nil
end

function sling.util.FunctionUtil.DeclarationWithTypemap:_construct0()
	sling.util.FunctionUtil.DeclarationWithTypemap._init(self)
	return self
end

function sling.util.FunctionUtil.DeclarationWithTypemap:getDeclaration()
	do return self.declaration end
end

function sling.util.FunctionUtil.DeclarationWithTypemap:setDeclaration(v)
	self.declaration = v
	do return self end
end

function sling.util.FunctionUtil.DeclarationWithTypemap:getTypemap()
	do return self.typemap end
end

function sling.util.FunctionUtil.DeclarationWithTypemap:setTypemap(v)
	self.typemap = v
	do return self end
end

function sling.util.FunctionUtil:getResolvedDeclarationForExpressionWithTypemap(xpr)
	local symxpr = _vm:to_table_with_key(xpr, '_isType.sling.model.SymbolExpressionNode')
	if symxpr ~= nil then
		local symbol = symxpr:getSymbol()
		if symbol ~= nil then
			local bdecl = _vm:to_table_with_key(symbol:getBinding(), '_isType.sling.model.FunctionDeclarationNode')
			if bdecl ~= nil then
				local v = _g.sling.util.FunctionUtil.DeclarationWithTypemap._construct0(_g.sling.util.FunctionUtil.DeclarationWithTypemap._create())
				do v:setDeclaration(bdecl) end
				do v:setTypemap(symbol:getBindingTypemap()) end
				do return v end
			end
		end
		do return nil end
	end
	do
		local max = _vm:to_table_with_key(xpr, '_isType.sling.model.MemberAccessExpressionNode')
		if max ~= nil then
			do return _g.sling.util.FunctionUtil:getResolvedDeclarationForExpressionWithTypemap(max:getLastNode()) end
		end
		do return nil end
	end
end

function sling.util.FunctionUtil:getResolvedDeclarationWithTypemap(fc)
	if not (fc ~= nil) then
		do return nil end
	end
	do return _g.sling.util.FunctionUtil:getResolvedDeclarationForExpressionWithTypemap(fc:getExpression()) end
end

sling.util.NodeUtil = {}
sling.util.NodeUtil.__index = sling.util.NodeUtil
_vm:set_metatable(sling.util.NodeUtil, {})

function sling.util.NodeUtil._create()
	local v = _vm:set_metatable({}, sling.util.NodeUtil)
	return v
end

function sling.util.NodeUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.NodeUtil'
	self['_isType.sling.util.NodeUtil'] = true
end

function sling.util.NodeUtil:_construct0()
	sling.util.NodeUtil._init(self)
	return self
end

function sling.util.NodeUtil:getQualifiedNameComponents(node, skipCodeFile)
	local v = {}
	local nn = node
	while nn ~= nil do
		if (_vm:to_table_with_key(nn, '_isType.sling.common.CodeUnitNode') ~= nil) and _g.jk.lang.String:isEmpty(nn:getNodeName()) then
			do break end
		end
		if (_vm:to_table_with_key(nn, '_isType.sling.model.NamespaceNode') ~= nil) and _g.jk.lang.String:isEmpty(nn:getNodeName()) then
			do break end
		end
		if skipCodeFile and (_vm:to_table_with_key(nn, '_isType.sling.common.CodeFileNode') ~= nil) then
			nn = nn:getParent()
			goto _continue3
		end
		do
			local str = nil
			if (_vm:to_table_with_key(nn, '_isType.sling.model.ConstructorDeclarationNode') ~= nil) then
				str = "[ctor]"
			elseif (_vm:to_table_with_key(nn, '_isType.sling.model.DestructorDeclarationNode') ~= nil) then
				str = "[dtor]"
			elseif (_vm:to_table_with_key(nn, '_isType.sling.model.MainFunctionDeclarationNode') ~= nil) then
				str = "[main]"
			elseif (_vm:to_table_with_key(nn, '_isType.sling.common.NamedNode') ~= nil) then
				str = nn:getNodeName()
			else
				do break end
			end
			if _g.jk.lang.String:isEmpty(str) then
				str = "[" .. _g.jk.lang.String:safeString(nn:getNodeTypeName()) .. "]"
			end
			do _g.jk.lang.Vector:prepend(v, str) end
			nn = nn:getParent()
		end
		::_continue3::
	end
	do return v end
end

function sling.util.NodeUtil:getParent(node)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null node in getParent", nil, nil))
	end
	do
		local pr = node:getParent()
		if not (pr ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Node of type `" .. _g.jk.lang.String:safeString(node:getNodeTypeName()) .. "' has no parent!", node, nil))
		end
		do return pr end
	end
end

function sling.util.NodeUtil:getQualifiedNameString(node, delim)
	local comps = _g.sling.util.NodeUtil:getQualifiedNameComponents(node, true)
	if not (comps ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		if comps ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(comps)
			do
				n = 0
				while n < m do
					local comp = (function(o)
						if (_vm:get_variable_type(o) == 'string') then
							do return o end
						end
						do return nil end
					end)(comps[n + 1])
					if comp ~= nil then
						if sb:count() > 0 then
							do sb:appendCharacter(delim) end
						end
						do sb:appendString(comp) end
					end
					do n = n + 1 end
				end
			end
		end
		do return sb:toString() end
	end
end

function sling.util.NodeUtil:dupAsNode(node)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("dupAsNode: null node", nil, nil))
	end
	do
		local nnode = node:dup()
		if not (nnode ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to duplicate", node, nil))
		end
		do return nnode end
	end
end

function sling.util.NodeUtil:dupAsVariableDeclaration(node)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("dupAsVariableDeclaration: null node", nil, nil))
	end
	do
		local nnode = node:dup()
		if not (nnode ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to duplicate", node, nil))
		end
		do
			local v = _vm:to_table_with_key(nnode, '_isType.sling.model.VariableDeclarationNode')
			if not (v ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Not a variable", node, nil))
			end
			do return v end
		end
	end
end

function sling.util.NodeUtil:dupBlock(node)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("dupBlock: null node", nil, nil))
	end
	do
		local nnode = node:dup()
		if not (nnode ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to duplicate", node, nil))
		end
		do
			local v = _vm:to_table_with_key(nnode, '_isType.sling.model.BlockNode')
			if not (v ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Not a block", node, nil))
			end
			do return v end
		end
	end
end

function sling.util.NodeUtil:exportNode(node)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("exportNode: null node", nil, nil))
	end
	if not node:exportNode() then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to export node", node, nil))
	end
end

function sling.util.NodeUtil:exportLeftAsVariableDeclaration(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.ForEachStatementNode') ~= nil) then
		local v = node
		local left = v:getLeft()
		if (_vm:to_table_with_key(left, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
			do v:exportLeft() end
			do return left end
		end
	end
	do return nil end
end

function sling.util.NodeUtil:removeNode(node)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("removeNode: null node", nil, nil))
	end
	if node:getParent() ~= nil then
		if not node:remove() then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to remove node", node, nil))
		end
	end
end

function sling.util.NodeUtil:replaceNode(node, newnode)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("replaceNode: null node", nil, nil))
	end
	if not node:replaceWith(newnode, false) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to replace node", node, nil))
	end
end

function sling.util.NodeUtil:replaceAndExport(node, newnode)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("replaceAndExport: null node", nil, nil))
	end
	if not node:replaceWith(newnode, true) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to replace node", node, nil))
	end
end

function sling.util.NodeUtil:isStatic(node)
	do return _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.model.Modifier.STATIC) end
end

function sling.util.NodeUtil:insertAboveNode(existingnode, newnode)
	if not (newnode ~= nil) then
		do return end
	end
	if not (existingnode ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unable to insert node above null node", newnode, nil))
	end
	do
		local pp = _vm:to_table_with_key(existingnode:getParent(), '_isType.sling.common.ContainerNode')
		if not (pp ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Node has no container parent! Unable to insert above node.", existingnode, nil))
		end
		if not pp:insertAboveNode(newnode, existingnode) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to insert node above the given node.", existingnode, nil))
		end
	end
end

function sling.util.NodeUtil:replaceWithNodes(original, replace)
	if not (original ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("replaceWithNodes: null original", nil, nil))
	end
	do
		local ip = original:getInsertionPoint()
		if not (ip ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("replaceWithNodes: Failed to get insertion point", original, nil))
		end
		if replace ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(replace)
			do
				n = 0
				while n < m do
					local stmt = replace[n + 1]
					if stmt ~= nil then
						if not ip:insertBefore(stmt) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("replaceWithNodes: Failed to insert before", stmt, nil))
						end
					end
					do n = n + 1 end
				end
			end
		end
		if not original:remove() then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("replaceWithNodes: Failed to remove node", original, nil))
		end
	end
end

function sling.util.NodeUtil:addChild(parent, child)
	if not (child ~= nil) then
		do return end
	end
	if not (parent ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("addChild: null parent", nil, nil))
	end
	do
		local pcont = _vm:to_table_with_key(parent, '_isType.sling.common.ContainerNode')
		if not (pcont ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("addChild: parent is not a container", parent, nil))
		end
		do pcont:addNode(child) end
	end
end

function sling.util.NodeUtil:getOrCreateNamespaceForArray(parent, names)
	if not (parent ~= nil and names ~= nil) then
		do return nil end
	end
	do
		local nsc = parent
		if names ~= nil then
			local n = 0
			local m = #names
			do
				n = 0
				while n < m do
					local name = names[n + 1]
					if name ~= nil then
						nsc = _g.sling.util.NodeUtil:getOrCreateNamespace(nsc, name)
					end
					do n = n + 1 end
				end
			end
		end
		do return nsc end
	end
end

function sling.util.NodeUtil:getOrCreateNamespace(parent, childName)
	if not (parent ~= nil and childName ~= nil) then
		do return nil end
	end
	do
		local nodes = parent:getNodeIndexForName(childName)
		if nodes ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(nodes)
			do
				n = 0
				while n < m do
					local node = _vm:to_table_with_key(nodes[n + 1], '_isType.sling.model.NamespaceNode')
					if node ~= nil then
						if node:getNodeName() == childName then
							do return node end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do
			local nns = _g.sling.model.NamespaceNode:forName(childName)
			do parent:addNode(nns) end
			do return nns end
		end
	end
end

function sling.util.NodeUtil:describeNode(node)
	if not (node ~= nil) then
		do return "NullNode" end
	end
	do
		local v = node:getNodeTypeName()
		if (_vm:to_table_with_key(node, '_isType.sling.common.NamedNode') ~= nil) then
			v = _g.jk.lang.String:safeString(v) .. " name=`" .. _g.jk.lang.String:safeString(node:getNodeName()) .. "'"
		end
		do return v end
	end
end

sling.util.NodeUtil.DumpTreeHelper = _g.sling.common.NodeVisitor._create()
sling.util.NodeUtil.DumpTreeHelper.__index = sling.util.NodeUtil.DumpTreeHelper
_vm:set_metatable(sling.util.NodeUtil.DumpTreeHelper, {
	__index = _g.sling.common.NodeVisitor
})

function sling.util.NodeUtil.DumpTreeHelper._create()
	local v = _vm:set_metatable({}, sling.util.NodeUtil.DumpTreeHelper)
	return v
end

function sling.util.NodeUtil.DumpTreeHelper:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.NodeUtil.DumpTreeHelper'
	self['_isType.sling.util.NodeUtil.DumpTreeHelper'] = true
	self.ctx = nil
end

function sling.util.NodeUtil.DumpTreeHelper:_construct0()
	sling.util.NodeUtil.DumpTreeHelper._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	return self
end

function sling.util.NodeUtil.DumpTreeHelper:visit(node)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do
		local n = 0
		while n < self:getLevel() do
			do sb:appendString("  ") end
			do n = n + 1 end
		end
	end
	do sb:appendString(_g.sling.util.NodeUtil:describeNode(node)) end
	do _g.jk.log.Log:info(self.ctx, sb:toString()) end
	do return true end
end

function sling.util.NodeUtil.DumpTreeHelper:getCtx()
	do return self.ctx end
end

function sling.util.NodeUtil.DumpTreeHelper:setCtx(v)
	self.ctx = v
	do return self end
end

function sling.util.NodeUtil:dumpTree(ctx, tree)
	if not (tree ~= nil) then
		do return end
	end
	do
		local helper = _g.sling.util.NodeUtil.DumpTreeHelper._construct0(_g.sling.util.NodeUtil.DumpTreeHelper._create())
		do helper:setCtx(ctx) end
		do tree:accept(helper) end
	end
end

function sling.util.NodeUtil:getVisibilityModifier(node)
	if _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.model.Modifier.PUBLIC) then
		do return _g.sling.model.Modifier.PUBLIC end
	end
	if _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.model.Modifier.PROTECTED) then
		do return _g.sling.model.Modifier.PROTECTED end
	end
	if _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.model.Modifier.PRIVATE) then
		do return _g.sling.model.Modifier.PRIVATE end
	end
	if _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.model.Modifier.NAMESPACEPRIVATE) then
		do return _g.sling.model.Modifier.NAMESPACEPRIVATE end
	end
	do return nil end
end

function sling.util.NodeUtil:hasVisibilityModifier(node)
	if _g.sling.util.NodeUtil:getVisibilityModifier(node) ~= nil then
		do return true end
	end
	do return false end
end

sling.util.TypeResolver = {}
sling.util.TypeResolver.__index = sling.util.TypeResolver
_vm:set_metatable(sling.util.TypeResolver, {})

function sling.util.TypeResolver._create()
	local v = _vm:set_metatable({}, sling.util.TypeResolver)
	return v
end

function sling.util.TypeResolver:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.TypeResolver'
	self['_isType.sling.util.TypeResolver'] = true
end

function sling.util.TypeResolver:_construct0()
	sling.util.TypeResolver._init(self)
	return self
end

function sling.util.TypeResolver:resolveName(context, name)
end

function sling.util.TypeResolver:resolveNames(context, names)
end

function sling.util.TypeResolver:tryResolveNames(context, names)
end

function sling.util.TypeResolver:resolveExpression(xpr)
end

function sling.util.TypeResolver:resolveDataType(rdt)
end

function sling.util.TypeResolver:execute(node)
end

function sling.util.TypeResolver:getMatchingConstructor(entity, parameters, typemap)
end

function sling.util.TypeResolver:findImplementedInterfaceMethod(fdecl)
end

function sling.util.TypeResolver:isSame(primary, other, typemap)
end

function sling.util.TypeResolver:resolveFunctionSignature(decl, tr)
	if not (decl ~= nil) then
		do return end
	end
	if not (tr ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("resolveFunctionSignature: no type resolver", decl, nil))
	end
	do
		local array = decl:getParameters()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local param = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.VariableDeclarationNode')
					if param ~= nil then
						local pdt = _vm:to_table_with_key(param:getType(), '_isType.sling.model.ReferenceDataTypeNode')
						if pdt ~= nil then
							do tr:resolveDataType(pdt) end
						end
					end
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.util.TypeResolver:resolveExpressions(node)
	local array = _g.sling.util.FindUtil:findCompatibleNodes(node, "class:sling.model.ExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local xpr = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ExpressionNode')
				if xpr ~= nil then
					do self:resolveExpression(xpr) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.util.TypeResolver:getBaseClass(entity)
	if not (entity ~= nil) then
		do return nil end
	end
	do
		local bdt = self:getBaseClassType(entity)
		if not (bdt ~= nil) then
			do return nil end
		end
		do self:resolveDataType(bdt) end
		do return _g.sling.util.TypeResolver:getAndRequireBoundClass(bdt) end
	end
end

function sling.util.TypeResolver:getBaseClassType(entity)
	if not (entity ~= nil) then
		do return nil end
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
						local type = self:getRealInheritType(basetype)
						if type == _g.sling.model.BaseTypeNode.INHERIT_EXTEND then
							do return basetype:getReferenceType() end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do return nil end
	end
end

function sling.util.TypeResolver:getRealInheritType(basetype)
	if not (basetype ~= nil) then
		do return _g.sling.model.BaseTypeNode.INHERIT_UNKNOWN end
	end
	do
		local dt = basetype:getInheritType()
		if dt ~= _g.sling.model.BaseTypeNode.INHERIT_AUTO then
			do return dt end
		end
		do
			local rdt = basetype:getReferenceType()
			if not (rdt ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No reference type for auto-inherit base type", basetype, nil))
			end
			do self:resolveDataType(rdt) end
			do
				local entity = _g.sling.util.TypeResolver:getAndRequireBoundEntity(rdt)
				if (_vm:to_table_with_key(entity, '_isType.sling.model.ClassDeclarationNode') ~= nil) then
					do return _g.sling.model.BaseTypeNode.INHERIT_EXTEND end
				end
				if (_vm:to_table_with_key(entity, '_isType.sling.model.InterfaceDeclarationNode') ~= nil) then
					do return _g.sling.model.BaseTypeNode.INHERIT_IMPLEMENT end
				end
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported base type entity: `" .. _g.jk.lang.String:safeString(entity:getNodeTypeName()) .. "'", entity, nil))
				do return _g.sling.model.BaseTypeNode.INHERIT_UNKNOWN end
			end
		end
	end
end

function sling.util.TypeResolver:getAllGenericTypes(entity)
	local v = {}
	local bc = self:getBaseClass(entity)
	if bc ~= nil then
		local array = self:getAllGenericTypes(bc)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local bcv = array[n + 1]
					if bcv ~= nil then
						do _g.jk.lang.Vector:append(v, bcv) end
					end
					do n = n + 1 end
				end
			end
		end
	end
	do
		local gce = _vm:to_table_with_key(entity, '_isType.sling.model.GenericCapableEntityDeclarationNode')
		if gce ~= nil then
			local array2 = gce:getGenericTypes()
			if array2 ~= nil then
				local n2 = 0
				local m2 = _g.jk.lang.Vector:getSize(array2)
				do
					n2 = 0
					while n2 < m2 do
						local gt = array2[n2 + 1]
						if gt ~= nil then
							do _g.jk.lang.Vector:append(v, gt) end
						end
						do n2 = n2 + 1 end
					end
				end
			end
		end
		do return v end
	end
end

function sling.util.TypeResolver:getActualType(node)
	if not (node ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ExpressionDataTypeNode') ~= nil) then
		do return _g.sling.util.ExpressionUtil:getExpressionDataType(node:getExpression(), nil) end
	end
	do return node end
end

function sling.util.TypeResolver:getBoundNode(dt)
	if not (dt ~= nil) then
		do return nil end
	end
	do self:resolveDataType(dt) end
	do
		local rdt = _vm:to_table_with_key(dt, '_isType.sling.model.ReferenceDataTypeNode')
		if not (rdt ~= nil) then
			do return nil end
		end
		if (_vm:to_table_with_key(rdt, '_isType.sling.model.ThisDataTypeNode') ~= nil) then
			local v = _g.sling.util.FindUtil:findNearestEntity(rdt)
			if not (v ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No enclosing entity", rdt, nil))
			end
			do return v end
		end
		do
			local symbol = rdt:getSymbol()
			if not (symbol ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Reference data type has no symbol", rdt, nil))
			end
			if rdt:getMagical() then
				local v = _g.sling.model.MagicalClassDeclarationNode._construct0(_g.sling.model.MagicalClassDeclarationNode._create())
				do v:setName(_g.sling.util.SymbolUtil:getSymbolName(symbol)) end
				do v:setSymbol(symbol, false) end
				do return v end
			end
			do
				local binding = symbol:getBinding()
				if not (binding ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Symbol `" .. _g.jk.lang.String:safeString(_g.sling.util.SymbolUtil:getSymbolName(symbol)) .. "' has no binding: Unable to find referenced node", symbol, nil))
				end
				do return binding end
			end
		end
	end
end

function sling.util.TypeResolver:getAndRequireBoundNode(dt)
	local v = self:getBoundNode(dt)
	if not (v ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Data type does not have a reference", dt, nil))
	end
	do return v end
end

function sling.util.TypeResolver:getBoundContainer(dt)
	do return _vm:to_table_with_key(self:getBoundNode(dt), '_isType.sling.common.ContainerNode') end
end

function sling.util.TypeResolver:getAndRequireBoundContainer(dt)
	local v = self:getAndRequireBoundNode(dt)
	local vv = _vm:to_table_with_key(v, '_isType.sling.common.ContainerNode')
	if not (vv ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Data type does not reference a container", dt, nil):addRelatedMessage("It references this", v))
	end
	do return vv end
end

function sling.util.TypeResolver:getBoundEntity(dt)
	do return _vm:to_table_with_key(self:getBoundNode(dt), '_isType.sling.model.EntityDeclarationNode') end
end

function sling.util.TypeResolver:getAndRequireBoundEntity(dt)
	local v = self:getAndRequireBoundNode(dt)
	local vv = _vm:to_table_with_key(v, '_isType.sling.model.EntityDeclarationNode')
	if not (vv ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Data type does not reference an entity", dt, nil):addRelatedMessage("It references this", v))
	end
	do return vv end
end

function sling.util.TypeResolver:getBoundClass(dt)
	do return _vm:to_table_with_key(self:getBoundNode(dt), '_isType.sling.model.ClassDeclarationNode') end
end

function sling.util.TypeResolver:getAndRequireBoundClass(dt)
	local v = self:getAndRequireBoundNode(dt)
	local vv = _vm:to_table_with_key(v, '_isType.sling.model.ClassDeclarationNode')
	if not (vv ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Data type does not reference a class", dt, nil):addRelatedMessage("It references this", v))
	end
	do return vv end
end

function sling.util.TypeResolver:getBoundInterface(dt)
	do return _vm:to_table_with_key(self:getBoundNode(dt), '_isType.sling.model.InterfaceDeclarationNode') end
end

function sling.util.TypeResolver:getAndRequireBoundInterface(dt)
	local v = self:getAndRequireBoundNode(dt)
	local vv = _vm:to_table_with_key(v, '_isType.sling.model.InterfaceDeclarationNode')
	if not (vv ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Data type does not reference an interface", dt, nil):addRelatedMessage("It references this", v))
	end
	do return vv end
end

function sling.util.TypeResolver:namesMatch(pname, oname)
	if not _g.jk.lang.Vector:isNotEmpty(pname) then
		do return false end
	end
	if not _g.jk.lang.Array:isNotEmpty(oname) then
		do return false end
	end
	do
		local sz1 = _g.jk.lang.Vector:getSize(pname)
		local sz2 = #oname
		if not (sz1 == sz2) then
			do return false end
		end
		do
			local i = 0
			while i < sz1 do
				if _g.jk.lang.String:isNotEqual((function(o)
					if (_vm:get_variable_type(o) == 'string') then
						do return o end
					end
					do return nil end
				end)(pname[i + 1]), oname[i + 1]) then
					do return false end
				end
				do i = i + 1 end
			end
		end
		do return true end
	end
end

function sling.util.TypeResolver:getImplementedInterfaceReference(entity, inames)
	if not (entity ~= nil) then
		do return nil end
	end
	if not _g.jk.lang.Array:isNotEmpty(inames) then
		do return nil end
	end
	do
		local exts = {}
		local array = entity:getBaseTypes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local btn = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.BaseTypeNode')
					if btn ~= nil then
						local inh = self:getRealInheritType(btn)
						local ref = btn:getReferenceType()
						if inh == _g.sling.model.BaseTypeNode.INHERIT_EXTEND then
							do _g.jk.lang.Vector:append(exts, ref) end
						elseif inh == _g.sling.model.BaseTypeNode.INHERIT_IMPLEMENT then
							local bnd = self:getAndRequireBoundInterface(ref)
							local qlf = _g.sling.util.NodeUtil:getQualifiedNameComponents(bnd, true)
							if _g.sling.util.TypeResolver:namesMatch(qlf, inames) then
								do return ref end
							end
						end
					end
					do n = n + 1 end
				end
			end
		end
		if exts ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(exts)
			do
				n2 = 0
				while n2 < m2 do
					local ext = exts[n2 + 1]
					if ext ~= nil then
						local intf = self:getImplementedInterfaceReference(_g.sling.util.TypeResolver:getAndRequireBoundEntity(ext), inames)
						if intf ~= nil then
							do return intf end
						end
					end
					do n2 = n2 + 1 end
				end
			end
		end
		do return nil end
	end
end

function sling.util.TypeResolver:isBaseTypeOf(original, candidate)
	if not (original ~= nil and candidate ~= nil) then
		do return false end
	end
	do
		local array = original:getBaseTypes()
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
							goto _continue4
						end
						if candidate == bound then
							do return true end
						end
						if self:isBaseTypeOf(bound, candidate) then
							do return true end
						end
					end
					::_continue4::
					do n = n + 1 end
				end
			end
		end
		do return false end
	end
end

function sling.util.TypeResolver:getTypeParametersForNode(node)
	if not (node ~= nil) then
		do return nil end
	end
	do
		local sym = _vm:to_table_with_key(node, '_isType.sling.model.SymbolNode')
		if sym ~= nil then
			local tps = sym:getTypeParameters()
			if tps ~= nil then
				do return tps end
			end
			do
				local v = nil
				local array = _g.sling.util.SymbolUtil:getSymbolComponents(sym)
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local nwtp = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.SymbolNameComponentNode')
							if nwtp ~= nil then
								local x = nwtp:getTypeParameters()
								if _g.jk.lang.Vector:isEmpty(x) then
									goto _continue5
								end
								if v == nil then
									v = {}
								end
								if x ~= nil then
									local n2 = 0
									local m2 = _g.jk.lang.Vector:getSize(x)
									do
										n2 = 0
										while n2 < m2 do
											local dtn = _vm:to_table_with_key(x[n2 + 1], '_isType.sling.common.NodeObject')
											if dtn ~= nil then
												do _g.jk.lang.Vector:append(v, dtn) end
											end
											do n2 = n2 + 1 end
										end
									end
								end
							end
							::_continue5::
							do n = n + 1 end
						end
					end
				end
				do return v end
			end
		end
		do
			local fdt = _vm:to_table_with_key(node, '_isType.sling.model.FunctionDataTypeNode')
			if fdt ~= nil then
				local v = {}
				local array2 = fdt:getFunctionParameters()
				if array2 ~= nil then
					local n3 = 0
					local m3 = _g.jk.lang.Vector:getSize(array2)
					do
						n3 = 0
						while n3 < m3 do
							local p = _vm:to_table_with_key(array2[n3 + 1], '_isType.sling.model.VariableDeclarationNode')
							if p ~= nil then
								do _g.jk.lang.Vector:append(v, p:getType()) end
							end
							do n3 = n3 + 1 end
						end
					end
				end
				do
					local r = fdt:getFunctionReturnType()
					if r ~= nil then
						do _g.jk.lang.Vector:append(v, r) end
					end
					do return v end
				end
			end
			do
				local map = _vm:to_table_with_key(node, '_isType.sling.model.MapDataTypeNode')
				if map ~= nil then
					local v = {}
					do _g.jk.lang.Vector:append(v, map:getKeyType()) end
					do _g.jk.lang.Vector:append(v, map:getValueType()) end
					do return v end
				end
				do
					local ref = _vm:to_table_with_key(node, '_isType.sling.model.ReferenceDataTypeNode')
					if ref ~= nil then
						local symbol = ref:getSymbol()
						if symbol ~= nil then
							do return self:getTypeParametersForNode(symbol) end
						end
						do return nil end
					end
					do
						local set = _vm:to_table_with_key(node, '_isType.sling.model.SetDataTypeNode')
						if set ~= nil then
							local valueType = set:getPrimaryType()
							if valueType ~= nil then
								local v = {}
								do _g.jk.lang.Vector:append(v, valueType) end
								do return v end
							end
							do return nil end
						end
						do
							local dex = _vm:to_table_with_key(node, '_isType.sling.model.DataTypeExtenderNode')
							if dex ~= nil then
								local pt = dex:getPrimaryType()
								if pt ~= nil then
									local v = {}
									do _g.jk.lang.Vector:append(v, pt) end
									do return v end
								end
								do return nil end
							end
							do return nil end
						end
					end
				end
			end
		end
	end
end

function sling.util.TypeResolver:mapMainType(dt, map)
	if not (map ~= nil) then
		do return dt end
	end
	do
		local rdt = _vm:to_table_with_key(dt, '_isType.sling.model.ReferenceDataTypeNode')
		if not (rdt ~= nil) then
			do return dt end
		end
		do
			local ref = _vm:to_table_with_key(self:getBoundNode(rdt), '_isType.sling.model.TemplateDeclarationNode')
			if not (ref ~= nil) then
				do return dt end
			end
			do
				local nn = _g.sling.util.NodeUtil:getQualifiedNameString(ref, 46)
				if not (nn ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Template declaration has no qualified name!", ref, nil))
				end
				do
					local r = map:get(nn)
					if not (r ~= nil) then
						do return dt end
					end
					do return r end
				end
			end
		end
	end
end

function sling.util.TypeResolver:mapType(dt, typemap)
	if not (dt ~= nil) then
		do return nil end
	end
	do
		local changed = false
		local ttm = typemap
		if (_vm:to_table_with_key(dt, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
			local sym = dt:getSymbol()
			if sym ~= nil then
				local btm = sym:getBindingTypemap()
				if btm ~= nil then
					if not (ttm ~= nil) then
						ttm = btm
					else
						ttm = ttm:dup()
						do ttm:copyFrom(btm) end
					end
				end
			end
		end
		do
			local r = self:mapMainType(dt, ttm)
			if r ~= dt then
				changed = true
			end
			do
				local rdup = _g.sling.util.DataTypeUtil:dupAsDataType(r)
				local tps = self:getTypeParametersForNode(rdup)
				if _g.jk.lang.Vector:isEmpty(tps) == false then
					if tps ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(tps)
						do
							n = 0
							while n < m do
								local tp = _vm:to_table_with_key(tps[n + 1], '_isType.sling.common.DataTypeNode')
								if tp ~= nil then
									local ntp = self:mapType(tp, typemap)
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
				if changed == false then
					do return r end
				end
				do return rdup end
			end
		end
	end
end

function sling.util.TypeResolver:getExpectedExpressionDataType(node)
	if not (node ~= nil) then
		do return nil end
	end
	do
		local pp = node:getParent()
		if not (pp ~= nil) then
			do return nil end
		end
		if (_vm:to_table_with_key(pp, '_isType.sling.model.IfStatementNode') ~= nil) and pp:getCondition() == node then
			do return _g.sling.model.BooleanDataTypeNode._construct0(_g.sling.model.BooleanDataTypeNode._create()) end
		end
		if (_vm:to_table_with_key(pp, '_isType.sling.model.ForStatementNode') ~= nil) and pp:getCondition() == node then
			do return _g.sling.model.BooleanDataTypeNode._construct0(_g.sling.model.BooleanDataTypeNode._create()) end
		end
		if (_vm:to_table_with_key(pp, '_isType.sling.model.LogicalExpressionNode') ~= nil) then
			do return _g.sling.model.BooleanDataTypeNode._construct0(_g.sling.model.BooleanDataTypeNode._create()) end
		end
		if (_vm:to_table_with_key(pp, '_isType.sling.model.LogicalNotExpressionNode') ~= nil) then
			do return _g.sling.model.BooleanDataTypeNode._construct0(_g.sling.model.BooleanDataTypeNode._create()) end
		end
		if (_vm:to_table_with_key(pp, '_isType.sling.model.WhileStatementNode') ~= nil) and pp:getCondition() == node then
			do return _g.sling.model.BooleanDataTypeNode._construct0(_g.sling.model.BooleanDataTypeNode._create()) end
		end
		if (_vm:to_table_with_key(pp, '_isType.sling.model.ArrayLiteralExpressionNode') ~= nil) then
			do return pp:getType() end
		end
		if (_vm:to_table_with_key(pp, '_isType.sling.model.FunctionCallExpressionNode') ~= nil) then
			local fc = pp
			local rr = _g.sling.util.FunctionUtil:getResolvedDeclarationWithTypemap(fc)
			if not (rr ~= nil) then
				do return nil end
			end
			do
				local fd = rr:getDeclaration()
				if not (fd ~= nil) then
					do return nil end
				end
				do
					local sz = fc:getParameterCount()
					local ii = -1
					do
						local i = 0
						while i < sz do
							if fc:getParameter(i) == node then
								ii = i
							end
							do i = i + 1 end
						end
					end
					if not (ii > -1) then
						do return nil end
					end
					do
						local vd = _vm:to_table_with_key(fd:getParameter(ii), '_isType.sling.model.VariableDeclarationNode')
						if not (vd ~= nil) then
							do return nil end
						end
						do
							local vv = vd:getType()
							if not (vv ~= nil) then
								do return nil end
							end
							do
								local typemap = rr:getTypemap()
								if typemap ~= nil then
									vv = self:mapType(vv, typemap)
								end
								do return vv end
							end
						end
					end
				end
			end
		end
		if (_vm:to_table_with_key(pp, '_isType.sling.model.CreateObjectExpressionNode') ~= nil) then
			local co = pp
			local dt = co:getType()
			if not (dt ~= nil) then
				do return nil end
			end
			do
				local rf = self:getBoundClass(dt)
				if not (rf ~= nil) then
					do return nil end
				end
				do
					local pr = co:getParameters()
					local ct = self:getMatchingConstructor(rf, pr, nil)
					if not (ct ~= nil) then
						do return nil end
					end
					do
						local sz = _g.jk.lang.Vector:getSize(pr)
						local ii = -1
						do
							local i = 0
							while i < sz do
								if _g.jk.lang.Vector:get(pr, i) == node then
									ii = i
								end
								do i = i + 1 end
							end
						end
						if not (ii > -1) then
							do return nil end
						end
						do
							local vd = _vm:to_table_with_key(ct:getParameter(ii), '_isType.sling.model.VariableDeclarationNode')
							if not (vd ~= nil) then
								do return nil end
							end
							do return vd:getType() end
						end
					end
				end
			end
		end
		if (_vm:to_table_with_key(pp, '_isType.sling.model.StringConcatenationExpressionNode') ~= nil) then
			do return _g.sling.model.StringDataTypeNode._construct0(_g.sling.model.StringDataTypeNode._create()) end
		end
		if (_vm:to_table_with_key(pp, '_isType.sling.model.AssignmentExpressionBaseNode') ~= nil) then
			local left = pp:getLeft()
			local right = pp:getRight()
			if (_vm:to_table_with_key(pp, '_isType.sling.model.AdditionAssignmentExpressionNode') ~= nil) then
				if node == left then
					do return nil end
				end
				do return _g.sling.util.ExpressionUtil:tryGetExpressionDataType(left, nil) end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.AssignmentExpressionNode') ~= nil) then
				if node == left then
					do return nil end
				end
				do return _g.sling.util.ExpressionUtil:tryGetExpressionDataType(left, nil) end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.BitwiseAndAssignmentExpressionNode') ~= nil) or (_vm:to_table_with_key(pp, '_isType.sling.model.BitwiseOrAssignmentExpressionNode') ~= nil) or (_vm:to_table_with_key(pp, '_isType.sling.model.BitwiseXorAssignmentExpressionNode') ~= nil) then
				do return _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_ANY) end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.DivisionAssignmentExpressionNode') ~= nil) then
				do return _g.sling.model.DoubleDataTypeNode._construct0(_g.sling.model.DoubleDataTypeNode._create()) end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.ExponentAssignmentExpressionNode') ~= nil) then
				do return _g.sling.model.DoubleDataTypeNode._construct0(_g.sling.model.DoubleDataTypeNode._create()) end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.FloorDivisionAssignmentExpressionNode') ~= nil) then
				do return _g.sling.model.DoubleDataTypeNode._construct0(_g.sling.model.DoubleDataTypeNode._create()) end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.ModuloAssignmentExpressionNode') ~= nil) then
				do return _g.sling.model.DoubleDataTypeNode._construct0(_g.sling.model.DoubleDataTypeNode._create()) end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.MultiplicationAssignmentExpressionNode') ~= nil) then
				do return _g.sling.model.DoubleDataTypeNode._construct0(_g.sling.model.DoubleDataTypeNode._create()) end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.NullCoalescingAssignmentExpressionNode') ~= nil) then
				if node == left then
					do return nil end
				end
				do return _g.sling.util.ExpressionUtil:tryGetExpressionDataType(left, nil) end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.ShiftLeftAssignmentExpressionNode') ~= nil) or (_vm:to_table_with_key(pp, '_isType.sling.model.ShiftRightAssignmentExpressionNode') ~= nil) then
				do return _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_ANY) end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.StringConcatenationAssignmentExpressionNode') ~= nil) then
				do return _g.sling.model.StringDataTypeNode._construct0(_g.sling.model.StringDataTypeNode._create()) end
			end
			if _g.sling.model.SubtractionAssignmentExpressionNode ~= nil then
				if node == left then
					do return nil end
				end
				do return _g.sling.util.ExpressionUtil:tryGetExpressionDataType(left, nil) end
			end
			do return nil end
		end
		if (_vm:to_table_with_key(pp, '_isType.sling.model.BinaryExpressionNode') ~= nil) then
			local left = pp:getLeft()
			local right = pp:getRight()
			if (_vm:to_table_with_key(pp, '_isType.sling.model.AdditionExpressionNode') ~= nil) then
				if node == left then
					do return _g.sling.model.DoubleDataTypeNode._construct0(_g.sling.model.DoubleDataTypeNode._create()) end
				end
				do return _g.sling.util.ExpressionUtil:tryGetExpressionDataType(left, nil) end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.DivisionExpressionNode') ~= nil) then
				do return _g.sling.model.DoubleDataTypeNode._construct0(_g.sling.model.DoubleDataTypeNode._create()) end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.ExponentExpressionNode') ~= nil) then
				do return _g.sling.model.DoubleDataTypeNode._construct0(_g.sling.model.DoubleDataTypeNode._create()) end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.FloorDivisionExpressionNode') ~= nil) then
				do return _g.sling.model.DoubleDataTypeNode._construct0(_g.sling.model.DoubleDataTypeNode._create()) end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.ModuloExpressionNode') ~= nil) then
				do return _g.sling.model.DoubleDataTypeNode._construct0(_g.sling.model.DoubleDataTypeNode._create()) end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.MultiplicationExpressionNode') ~= nil) then
				do return _g.sling.model.DoubleDataTypeNode._construct0(_g.sling.model.DoubleDataTypeNode._create()) end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.SubtractionExpressionNode') ~= nil) then
				if node == left then
					do return _g.sling.model.DoubleDataTypeNode._construct0(_g.sling.model.DoubleDataTypeNode._create()) end
				end
				do return _g.sling.util.ExpressionUtil:tryGetExpressionDataType(left, nil) end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.BitwiseAndExpressionNode') ~= nil) or (_vm:to_table_with_key(pp, '_isType.sling.model.BitwiseOrExpressionNode') ~= nil) or (_vm:to_table_with_key(pp, '_isType.sling.model.BitwiseXorExpressionNode') ~= nil) then
				do return _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_ANY) end
			end
			if (_vm:to_table_with_key(pp, '_isType.sling.model.ShiftLeftExpressionNode') ~= nil) or (_vm:to_table_with_key(pp, '_isType.sling.model.ShiftRightExpressionNode') ~= nil) then
				do return _g.sling.model.IntegerDataTypeNode:forType(_g.sling.model.IntegerDataTypeNode.TYPE_ANY) end
			end
			do return nil end
		end
		if (_vm:to_table_with_key(pp, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
			do return pp:getType() end
		end
		if (_vm:to_table_with_key(pp, '_isType.sling.model.ReturnStatementNode') ~= nil) then
			local pr = node:getParent()
			while true do
				if not (pr ~= nil) then
					do break end
				end
				if (_vm:to_table_with_key(pr, '_isType.sling.model.PromiseLiteralExpressionNode') ~= nil) then
					do break end
				end
				if (_vm:to_table_with_key(pr, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
					do break end
				end
				pr = pr:getParent()
			end
			if (_vm:to_table_with_key(pr, '_isType.sling.model.PromiseLiteralExpressionNode') ~= nil) then
				do return pr:getType() end
			elseif (_vm:to_table_with_key(pr, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
				do return pr:getReturnType() end
			end
		end
		do return nil end
	end
end

sling.util.DataTypeUtil = {}
sling.util.DataTypeUtil.__index = sling.util.DataTypeUtil
_vm:set_metatable(sling.util.DataTypeUtil, {})

function sling.util.DataTypeUtil._create()
	local v = _vm:set_metatable({}, sling.util.DataTypeUtil)
	return v
end

function sling.util.DataTypeUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.util.DataTypeUtil'
	self['_isType.sling.util.DataTypeUtil'] = true
end

function sling.util.DataTypeUtil:_construct0()
	sling.util.DataTypeUtil._init(self)
	return self
end

function sling.util.DataTypeUtil:dupAsReferenceDataType(node)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("dupAsReferenceDataType: null node", nil, nil))
	end
	do
		local nnode = node:dup()
		if not (nnode ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to duplicate", node, nil))
		end
		do
			local v = _vm:to_table_with_key(nnode, '_isType.sling.model.ReferenceDataTypeNode')
			if not (v ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Not a reference data type", node, nil))
			end
			do return v end
		end
	end
end

function sling.util.DataTypeUtil:dupAsDataType(node)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("dupAsDataType: null node", nil, nil))
	end
	do
		local nnode = node:dup()
		if not (nnode ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to duplicate", node, nil))
		end
		do
			local v = _vm:to_table_with_key(nnode, '_isType.sling.common.DataTypeNode')
			if not (v ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Not a data type", node, nil))
			end
			do return v end
		end
	end
end

function sling.util.DataTypeUtil:getSymbolName(dt)
	local refdt = _vm:to_table_with_key(dt, '_isType.sling.model.ReferenceDataTypeNode')
	if not (refdt ~= nil) then
		do return nil end
	end
	do return _g.sling.util.SymbolUtil:getSymbolName(refdt:getSymbol()) end
end

function sling.util.DataTypeUtil:isReferenceValid(dt)
	if not (dt ~= nil) then
		do return false end
	end
	do
		local symbol = dt:getSymbol()
		if not (symbol ~= nil) then
			do return false end
		end
		do
			local binding = symbol:getBinding()
			if not (binding ~= nil) then
				do return false end
			end
			if (_vm:to_table_with_key(binding, '_isType.sling.model.MagicalClassDeclarationNode') ~= nil) == false then
				if not (binding:getParent() ~= nil) then
					do return false end
				end
			end
			do return true end
		end
	end
end

function sling.util.DataTypeUtil:createDefaultValue(type)
	if not (type ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("createDefaultValue: null type", nil, nil))
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
		do return _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.VectorDataTypeNode') ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.MapDataTypeNode') ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.SetDataTypeNode') ~= nil) then
		do return _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.StaticArrayDataTypeNode') ~= nil) then
		do return _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.PointerDataTypeNode') ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.BufferDataTypeNode') ~= nil) then
		do return _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.ThisDataTypeNode') ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.ParentDataTypeNode') ~= nil) then
		do return _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.ObjectDataTypeNode') ~= nil) then
		do return _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.DynamicDataTypeNode') ~= nil) then
		do return _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.CharacterDataTypeNode') ~= nil) then
		do return _g.sling.model.CharacterLiteralExpressionNode:forValue(0) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
		local v = _g.sling.model.IntegerLiteralExpressionNode:forValue(0)
		do v:setType(type:getType()) end
		do return v end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
		do return _g.sling.model.DoubleLiteralExpressionNode:forValue(0.0) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.FloatDataTypeNode') ~= nil) then
		do return _g.sling.model.FloatLiteralExpressionNode:forValue(0.0) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.BooleanDataTypeNode') ~= nil) then
		do return _g.sling.model.BooleanLiteralExpressionNode:forValue(false) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.StringDataTypeNode') ~= nil) then
		do return _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.TupleDataTypeNode') ~= nil) then
		do return _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.DateTimeDataTypeNode') ~= nil) then
		do return _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.DecimalDataTypeNode') ~= nil) then
		do return _g.sling.model.DecimalLiteralExpressionNode:forValue("0.0") end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.ExceptionDataTypeNode') ~= nil) then
		do return _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.FunctionDataTypeNode') ~= nil) then
		do return _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.ConstrainedDataTypeNode') ~= nil) then
		do return _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.VoidDataTypeNode') ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.TypeInfoDataTypeNode') ~= nil) then
		do return _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()) end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.PromiseDataTypeNode') ~= nil) then
		do return _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()) end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unable to determine default value for unsupported data type: `" .. _g.jk.lang.String:safeString(type:getNodeTypeName()) .. "'", type, nil))
	do return nil end
end

function sling.util.DataTypeUtil:getDataTypeName(node)
	if not (node ~= nil) then
		do return "unknown" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
		local symbol = _g.sling.util.SymbolUtil:getSymbolNamesString(node:getSymbol(), 46)
		if _g.jk.lang.String:isEmpty(symbol) then
			symbol = "unknown"
		end
		do return "class:" .. _g.jk.lang.String:safeString(symbol) end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PromiseDataTypeNode') ~= nil) then
		do return "promise" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PointerDataTypeNode') ~= nil) then
		do return "pointer" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.VariableReferenceDataTypeNode') ~= nil) then
		do return "reference" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ExpressionDataTypeNode') ~= nil) then
		do return "expression" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.TypeInfoDataTypeNode') ~= nil) then
		do return "typeinfo" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ThisDataTypeNode') ~= nil) then
		do return "this" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ParentDataTypeNode') ~= nil) then
		do return "parent" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StaticArrayDataTypeNode') ~= nil) then
		do return "array" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.UnknownDataTypeNode') ~= nil) then
		do return "unknown" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DynamicDataTypeNode') ~= nil) then
		do return "dynamic" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.AutomaticDataTypeNode') ~= nil) then
		do return "automatic" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.CharacterDataTypeNode') ~= nil) then
		do return "character" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
		do return "integer" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
		do return "double" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FloatDataTypeNode') ~= nil) then
		do return "float" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.VoidDataTypeNode') ~= nil) then
		do return "void" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BooleanDataTypeNode') ~= nil) then
		do return "boolean" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StringDataTypeNode') ~= nil) then
		do return "string" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ObjectDataTypeNode') ~= nil) then
		do return "object" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BufferDataTypeNode') ~= nil) then
		do return "buffer" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.TupleDataTypeNode') ~= nil) then
		do return "tuple" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DateTimeDataTypeNode') ~= nil) then
		do return "datetime" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DecimalDataTypeNode') ~= nil) then
		do return "decimal" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ExceptionDataTypeNode') ~= nil) then
		do return "exception" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDataTypeNode') ~= nil) then
		do return "function" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.MapDataTypeNode') ~= nil) then
		do return "map" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.SetDataTypeNode') ~= nil) then
		do return "set" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.VectorDataTypeNode') ~= nil) then
		do return "vector" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.OptionalDataTypeNode') ~= nil) then
		do return "optional" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ConstrainedDataTypeNode') ~= nil) then
		do return "constrained" end
	end
	do return "unknown" end
end
