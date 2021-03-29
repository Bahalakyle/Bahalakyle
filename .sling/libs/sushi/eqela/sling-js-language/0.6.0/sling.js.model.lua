sling = sling or {}

sling.js = sling.js or {}

sling.js.model = sling.js.model or {}

sling.js.model.DestructuredParameterDeclarationNode = _g.sling.model.ExpressionNode._create()
sling.js.model.DestructuredParameterDeclarationNode.__index = sling.js.model.DestructuredParameterDeclarationNode
_vm:set_metatable(sling.js.model.DestructuredParameterDeclarationNode, {
	__index = _g.sling.model.ExpressionNode
})

function sling.js.model.DestructuredParameterDeclarationNode._create()
	local v = _vm:set_metatable({}, sling.js.model.DestructuredParameterDeclarationNode)
	return v
end

function sling.js.model.DestructuredParameterDeclarationNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.DestructuredParameterDeclarationNode'
	self['_isType.sling.js.model.DestructuredParameterDeclarationNode'] = true
	self['_isType.sling.model.NodeWithModifiers'] = true
	self.binding = nil
	self.initializer = nil
	self.modifiers = nil
end

function sling.js.model.DestructuredParameterDeclarationNode:_construct0()
	sling.js.model.DestructuredParameterDeclarationNode._init(self)
	do _g.sling.model.ExpressionNode._construct0(self) end
	return self
end

function sling.js.model.DestructuredParameterDeclarationNode:forBinding(value)
	local v = _g.sling.js.model.DestructuredParameterDeclarationNode._construct0(_g.sling.js.model.DestructuredParameterDeclarationNode._create())
	do v:setBinding(value, false) end
	do return v end
end

function sling.js.model.DestructuredParameterDeclarationNode:getNodeTypeName()
	do return "DestructuredParameterDeclarationNode" end
end

function sling.js.model.DestructuredParameterDeclarationNode:createNew()
	do return _g.sling.js.model.DestructuredParameterDeclarationNode._construct0(_g.sling.js.model.DestructuredParameterDeclarationNode._create()) end
end

function sling.js.model.DestructuredParameterDeclarationNode:copyTo(o)
	if _g.sling.model.ExpressionNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.DestructuredParameterDeclarationNode')
		if n == nil then
			do return true end
		end
		if n.binding ~= nil then
			do n.binding:destroy() end
			n.binding = nil
		end
		if self.binding ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.binding), '_isType.sling.model.ExpressionNode')
			if pcp == nil then
				do return false end
			end
			n.binding = pcp
			do n.binding:setParent(n) end
		end
		if n.initializer ~= nil then
			do n.initializer:destroy() end
			n.initializer = nil
		end
		if self.initializer ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.initializer), '_isType.sling.model.ExpressionNode')
			if pcp == nil then
				do return false end
			end
			n.initializer = pcp
			do n.initializer:setParent(n) end
		end
		do
			local array = n.modifiers
			if array ~= nil then
				local n2 = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n2 = 0
					while n2 < m do
						local xx = _vm:to_table_with_key(array[n2 + 1], '_isType.sling.common.NodeObject')
						if xx ~= nil then
							do xx:destroy() end
						end
						do n2 = n2 + 1 end
					end
				end
			end
			n.modifiers = nil
			if self.modifiers ~= nil then
				local n3 = 0
				local m2 = _g.jk.lang.Vector:getSize(self.modifiers)
				do
					n3 = 0
					while n3 < m2 do
						local nod = _vm:to_table_with_key(self.modifiers[n3 + 1], '_isType.sling.common.NodeObject')
						if nod ~= nil then
							local ndup = _vm:to_table_with_key(nod:dup(), '_isType.sling.common.NodeObject')
							if ndup == nil then
								do return false end
							end
							if n.modifiers == nil then
								n.modifiers = {}
							end
							do _g.jk.lang.Vector:append(n.modifiers, ndup) end
							do ndup:setParent(n) end
						end
						do n3 = n3 + 1 end
					end
				end
			end
			do return true end
		end
	end
end

function sling.js.model.DestructuredParameterDeclarationNode:replaceChild(oldnode, newnode, doExport)
	if oldnode == self.binding then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.binding:destroy() end
		end
		self.binding = _vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode')
		if self.binding ~= nil then
			do self.binding:setParent(self) end
		end
		do return true end
	end
	if oldnode == self.initializer then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.initializer:destroy() end
		end
		self.initializer = _vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode')
		if self.initializer ~= nil then
			do self.initializer:setParent(self) end
		end
		do return true end
	end
	if self:replaceNodeInVector(self.modifiers, oldnode, newnode, doExport) then
		do return true end
	end
	do return _g.sling.model.ExpressionNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.DestructuredParameterDeclarationNode:acceptVisitor(visitor)
	if _g.sling.model.ExpressionNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self.binding ~= nil then
		if self.binding:accept(visitor) == false then
			do return false end
		end
	end
	if self.initializer ~= nil then
		if self.initializer:accept(visitor) == false then
			do return false end
		end
	end
	if self:visitVector(self.modifiers, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.DestructuredParameterDeclarationNode:destroy()
	do _g.sling.model.ExpressionNode.destroy(self) end
	if self.binding ~= nil then
		do self.binding:destroy() end
		self.binding = nil
	end
	if self.initializer ~= nil then
		do self.initializer:destroy() end
		self.initializer = nil
	end
	if self.modifiers ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.modifiers)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.modifiers[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	self.modifiers = nil
end

function sling.js.model.DestructuredParameterDeclarationNode:setBinding(v, doExport)
	if self.binding ~= nil and doExport == false then
		do self.binding:destroy() end
	end
	self.binding = v
	if self.binding ~= nil then
		do self.binding:setParent(self) end
	end
end

function sling.js.model.DestructuredParameterDeclarationNode:getBinding()
	do return self.binding end
end

function sling.js.model.DestructuredParameterDeclarationNode:exportBinding()
	local v = self.binding
	self.binding = nil
	do return v end
end

function sling.js.model.DestructuredParameterDeclarationNode:setInitializer(v, doExport)
	if self.initializer ~= nil and doExport == false then
		do self.initializer:destroy() end
	end
	self.initializer = v
	if self.initializer ~= nil then
		do self.initializer:setParent(self) end
	end
end

function sling.js.model.DestructuredParameterDeclarationNode:getInitializer()
	do return self.initializer end
end

function sling.js.model.DestructuredParameterDeclarationNode:exportInitializer()
	local v = self.initializer
	self.initializer = nil
	do return v end
end

function sling.js.model.DestructuredParameterDeclarationNode:setModifiers(v, doExport)
	if self.modifiers ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.modifiers)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.modifiers[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	if v == nil then
		self.modifiers = nil
	else
		self.modifiers = {}
		if v ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(v)
			do
				n2 = 0
				while n2 < m2 do
					local vv = _vm:to_table_with_key(v[n2 + 1], '_isType.sling.common.NodeObject')
					if vv ~= nil then
						do _g.jk.lang.Vector:append(self.modifiers, vv) end
						do vv:setParent(self) end
					end
					do n2 = n2 + 1 end
				end
			end
		end
	end
end

function sling.js.model.DestructuredParameterDeclarationNode:getModifiers()
	do return self.modifiers end
end

function sling.js.model.DestructuredParameterDeclarationNode:exportModifiers()
	local v = self.modifiers
	self.modifiers = nil
	do return v end
end

function sling.js.model.DestructuredParameterDeclarationNode:addToModifiers(v)
	if v == nil then
		do return end
	end
	if self.modifiers == nil then
		self.modifiers = {}
	end
	do _g.jk.lang.Vector:append(self.modifiers, v) end
	do v:setParent(self) end
end

function sling.js.model.DestructuredParameterDeclarationNode:clearModifiers()
	if self.modifiers ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.modifiers)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.modifiers[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	self.modifiers = nil
end

sling.js.model.DebuggerStatementNode = _g.sling.common.NodeObject._create()
sling.js.model.DebuggerStatementNode.__index = sling.js.model.DebuggerStatementNode
_vm:set_metatable(sling.js.model.DebuggerStatementNode, {
	__index = _g.sling.common.NodeObject
})

function sling.js.model.DebuggerStatementNode._create()
	local v = _vm:set_metatable({}, sling.js.model.DebuggerStatementNode)
	return v
end

function sling.js.model.DebuggerStatementNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.DebuggerStatementNode'
	self['_isType.sling.js.model.DebuggerStatementNode'] = true
end

function sling.js.model.DebuggerStatementNode:_construct0()
	sling.js.model.DebuggerStatementNode._init(self)
	do _g.sling.common.NodeObject._construct0(self) end
	return self
end

function sling.js.model.DebuggerStatementNode:getNodeTypeName()
	do return "DebuggerStatementNode" end
end

function sling.js.model.DebuggerStatementNode:createNew()
	do return _g.sling.js.model.DebuggerStatementNode._construct0(_g.sling.js.model.DebuggerStatementNode._create()) end
end

function sling.js.model.DebuggerStatementNode:copyTo(o)
	if _g.sling.common.NodeObject.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.DebuggerStatementNode')
		if n == nil then
			do return true end
		end
		do return true end
	end
end

function sling.js.model.DebuggerStatementNode:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.common.NodeObject.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.DebuggerStatementNode:acceptVisitor(visitor)
	if _g.sling.common.NodeObject.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.DebuggerStatementNode:destroy()
	do _g.sling.common.NodeObject.destroy(self) end
end

sling.js.model.ExportStatementNode = _g.sling.common.NodeObject._create()
sling.js.model.ExportStatementNode.__index = sling.js.model.ExportStatementNode
_vm:set_metatable(sling.js.model.ExportStatementNode, {
	__index = _g.sling.common.NodeObject
})

function sling.js.model.ExportStatementNode._create()
	local v = _vm:set_metatable({}, sling.js.model.ExportStatementNode)
	return v
end

function sling.js.model.ExportStatementNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.ExportStatementNode'
	self['_isType.sling.js.model.ExportStatementNode'] = true
end

function sling.js.model.ExportStatementNode:_construct0()
	sling.js.model.ExportStatementNode._init(self)
	do _g.sling.common.NodeObject._construct0(self) end
	return self
end

function sling.js.model.ExportStatementNode:getNodeTypeName()
	do return "ExportStatementNode" end
end

function sling.js.model.ExportStatementNode:copyTo(o)
	if _g.sling.common.NodeObject.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.ExportStatementNode')
		if n == nil then
			do return true end
		end
		do return true end
	end
end

function sling.js.model.ExportStatementNode:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.common.NodeObject.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.ExportStatementNode:acceptVisitor(visitor)
	if _g.sling.common.NodeObject.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.ExportStatementNode:destroy()
	do _g.sling.common.NodeObject.destroy(self) end
end

sling.js.model.ExportAllStaticMembersStatementNode = _g.sling.js.model.ExportStatementNode._create()
sling.js.model.ExportAllStaticMembersStatementNode.__index = sling.js.model.ExportAllStaticMembersStatementNode
_vm:set_metatable(sling.js.model.ExportAllStaticMembersStatementNode, {
	__index = _g.sling.js.model.ExportStatementNode
})

function sling.js.model.ExportAllStaticMembersStatementNode._create()
	local v = _vm:set_metatable({}, sling.js.model.ExportAllStaticMembersStatementNode)
	return v
end

function sling.js.model.ExportAllStaticMembersStatementNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.ExportAllStaticMembersStatementNode'
	self['_isType.sling.js.model.ExportAllStaticMembersStatementNode'] = true
	self.container = nil
end

function sling.js.model.ExportAllStaticMembersStatementNode:_construct0()
	sling.js.model.ExportAllStaticMembersStatementNode._init(self)
	do _g.sling.js.model.ExportStatementNode._construct0(self) end
	return self
end

function sling.js.model.ExportAllStaticMembersStatementNode:getNodeTypeName()
	do return "ExportAllStaticMembersStatementNode" end
end

function sling.js.model.ExportAllStaticMembersStatementNode:createNew()
	do return _g.sling.js.model.ExportAllStaticMembersStatementNode._construct0(_g.sling.js.model.ExportAllStaticMembersStatementNode._create()) end
end

function sling.js.model.ExportAllStaticMembersStatementNode:copyTo(o)
	if _g.sling.js.model.ExportStatementNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.ExportAllStaticMembersStatementNode')
		if n == nil then
			do return true end
		end
		if n.container ~= nil then
			do n.container:destroy() end
			n.container = nil
		end
		if self.container ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.container), '_isType.sling.model.SymbolNode')
			if pcp == nil then
				do return false end
			end
			n.container = pcp
			do n.container:setParent(n) end
		end
		do return true end
	end
end

function sling.js.model.ExportAllStaticMembersStatementNode:replaceChild(oldnode, newnode, doExport)
	if oldnode == self.container then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.model.SymbolNode') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.container:destroy() end
		end
		self.container = _vm:to_table_with_key(newnode, '_isType.sling.model.SymbolNode')
		if self.container ~= nil then
			do self.container:setParent(self) end
		end
		do return true end
	end
	do return _g.sling.js.model.ExportStatementNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.ExportAllStaticMembersStatementNode:acceptVisitor(visitor)
	if _g.sling.js.model.ExportStatementNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self.container ~= nil then
		if self.container:accept(visitor) == false then
			do return false end
		end
	end
	do return true end
end

function sling.js.model.ExportAllStaticMembersStatementNode:destroy()
	do _g.sling.js.model.ExportStatementNode.destroy(self) end
	if self.container ~= nil then
		do self.container:destroy() end
		self.container = nil
	end
end

function sling.js.model.ExportAllStaticMembersStatementNode:setContainer(v, doExport)
	if self.container ~= nil and doExport == false then
		do self.container:destroy() end
	end
	self.container = v
	if self.container ~= nil then
		do self.container:setParent(self) end
	end
end

function sling.js.model.ExportAllStaticMembersStatementNode:getContainer()
	do return self.container end
end

function sling.js.model.ExportAllStaticMembersStatementNode:exportContainer()
	local v = self.container
	self.container = nil
	do return v end
end

sling.js.model.JavascriptImportStatementNode = _g.sling.common.NodeObject._create()
sling.js.model.JavascriptImportStatementNode.__index = sling.js.model.JavascriptImportStatementNode
_vm:set_metatable(sling.js.model.JavascriptImportStatementNode, {
	__index = _g.sling.common.NodeObject
})

function sling.js.model.JavascriptImportStatementNode._create()
	local v = _vm:set_metatable({}, sling.js.model.JavascriptImportStatementNode)
	return v
end

function sling.js.model.JavascriptImportStatementNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.JavascriptImportStatementNode'
	self['_isType.sling.js.model.JavascriptImportStatementNode'] = true
	self.defaultExport = nil
	self.exportName = nil
	self.namespaceContainer = nil
	self.moduleName = nil
end

function sling.js.model.JavascriptImportStatementNode:_construct0()
	sling.js.model.JavascriptImportStatementNode._init(self)
	do _g.sling.common.NodeObject._construct0(self) end
	return self
end

function sling.js.model.JavascriptImportStatementNode:getNodeTypeName()
	do return "JavascriptImportStatementNode" end
end

function sling.js.model.JavascriptImportStatementNode:createNew()
	do return _g.sling.js.model.JavascriptImportStatementNode._construct0(_g.sling.js.model.JavascriptImportStatementNode._create()) end
end

function sling.js.model.JavascriptImportStatementNode:copyTo(o)
	if _g.sling.common.NodeObject.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.JavascriptImportStatementNode')
		if n == nil then
			do return true end
		end
		n.defaultExport = self.defaultExport
		n.exportName = self.exportName
		n.namespaceContainer = self.namespaceContainer
		n.moduleName = self.moduleName
		do return true end
	end
end

function sling.js.model.JavascriptImportStatementNode:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.common.NodeObject.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.JavascriptImportStatementNode:acceptVisitor(visitor)
	if _g.sling.common.NodeObject.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.JavascriptImportStatementNode:destroy()
	do _g.sling.common.NodeObject.destroy(self) end
end

function sling.js.model.JavascriptImportStatementNode:setDefaultExport(v)
	self.defaultExport = v
end

function sling.js.model.JavascriptImportStatementNode:getDefaultExport()
	do return self.defaultExport end
end

function sling.js.model.JavascriptImportStatementNode:setExportName(v)
	self.exportName = v
end

function sling.js.model.JavascriptImportStatementNode:getExportName()
	do return self.exportName end
end

function sling.js.model.JavascriptImportStatementNode:setNamespaceContainer(v)
	self.namespaceContainer = v
end

function sling.js.model.JavascriptImportStatementNode:getNamespaceContainer()
	do return self.namespaceContainer end
end

function sling.js.model.JavascriptImportStatementNode:setModuleName(v)
	self.moduleName = v
end

function sling.js.model.JavascriptImportStatementNode:getModuleName()
	do return self.moduleName end
end

sling.js.model.YieldToGeneratorExpressionNode = _g.sling.model.UnaryExpressionNode._create()
sling.js.model.YieldToGeneratorExpressionNode.__index = sling.js.model.YieldToGeneratorExpressionNode
_vm:set_metatable(sling.js.model.YieldToGeneratorExpressionNode, {
	__index = _g.sling.model.UnaryExpressionNode
})

function sling.js.model.YieldToGeneratorExpressionNode._create()
	local v = _vm:set_metatable({}, sling.js.model.YieldToGeneratorExpressionNode)
	return v
end

function sling.js.model.YieldToGeneratorExpressionNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.YieldToGeneratorExpressionNode'
	self['_isType.sling.js.model.YieldToGeneratorExpressionNode'] = true
end

function sling.js.model.YieldToGeneratorExpressionNode:_construct0()
	sling.js.model.YieldToGeneratorExpressionNode._init(self)
	do _g.sling.model.UnaryExpressionNode._construct0(self) end
	return self
end

function sling.js.model.YieldToGeneratorExpressionNode:getNodeTypeName()
	do return "YieldToGeneratorExpressionNode" end
end

function sling.js.model.YieldToGeneratorExpressionNode:createNew()
	do return _g.sling.js.model.YieldToGeneratorExpressionNode._construct0(_g.sling.js.model.YieldToGeneratorExpressionNode._create()) end
end

function sling.js.model.YieldToGeneratorExpressionNode:copyTo(o)
	if _g.sling.model.UnaryExpressionNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.YieldToGeneratorExpressionNode')
		if n == nil then
			do return true end
		end
		do return true end
	end
end

function sling.js.model.YieldToGeneratorExpressionNode:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.model.UnaryExpressionNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.YieldToGeneratorExpressionNode:acceptVisitor(visitor)
	if _g.sling.model.UnaryExpressionNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.YieldToGeneratorExpressionNode:destroy()
	do _g.sling.model.UnaryExpressionNode.destroy(self) end
end

sling.js.model.PropertyFunctionDeclarationNode = _g.sling.model.FunctionDeclarationBaseNode._create()
sling.js.model.PropertyFunctionDeclarationNode.__index = sling.js.model.PropertyFunctionDeclarationNode
_vm:set_metatable(sling.js.model.PropertyFunctionDeclarationNode, {
	__index = _g.sling.model.FunctionDeclarationBaseNode
})

sling.js.model.PropertyFunctionDeclarationNode.DIRECTION_DEF = 0
sling.js.model.PropertyFunctionDeclarationNode.DIRECTION_GET = 1
sling.js.model.PropertyFunctionDeclarationNode.DIRECTION_SET = 2
sling.js.model.PropertyFunctionDeclarationNode.DIRECTION_LET = 3

function sling.js.model.PropertyFunctionDeclarationNode._create()
	local v = _vm:set_metatable({}, sling.js.model.PropertyFunctionDeclarationNode)
	return v
end

function sling.js.model.PropertyFunctionDeclarationNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.PropertyFunctionDeclarationNode'
	self['_isType.sling.js.model.PropertyFunctionDeclarationNode'] = true
	self['_isType.sling.common.NamedNode'] = true
	self.direction = 0
	self.returnType = nil
	self.name = nil
	self.expression = nil
end

function sling.js.model.PropertyFunctionDeclarationNode:_construct0()
	sling.js.model.PropertyFunctionDeclarationNode._init(self)
	do _g.sling.model.FunctionDeclarationBaseNode._construct0(self) end
	return self
end

function sling.js.model.PropertyFunctionDeclarationNode:forName(name)
	local v = _g.sling.js.model.PropertyFunctionDeclarationNode._construct0(_g.sling.js.model.PropertyFunctionDeclarationNode._create())
	do v:setName(name) end
	do return v end
end

function sling.js.model.PropertyFunctionDeclarationNode:forExpression(exp)
	local v = _g.sling.js.model.PropertyFunctionDeclarationNode._construct0(_g.sling.js.model.PropertyFunctionDeclarationNode._create())
	do v:setExpression(exp, false) end
	do return v end
end

function sling.js.model.PropertyFunctionDeclarationNode:getNodeName()
	do return self.name end
end

function sling.js.model.PropertyFunctionDeclarationNode:renameNode(name)
	do self:setName(name) end
end

function sling.js.model.PropertyFunctionDeclarationNode:setName(name)
	self.name = name
	do self:onIndexPropertiesChanged() end
end

function sling.js.model.PropertyFunctionDeclarationNode:getNodeTypeName()
	do return "PropertyFunctionDeclarationNode" end
end

function sling.js.model.PropertyFunctionDeclarationNode:createNew()
	do return _g.sling.js.model.PropertyFunctionDeclarationNode._construct0(_g.sling.js.model.PropertyFunctionDeclarationNode._create()) end
end

function sling.js.model.PropertyFunctionDeclarationNode:copyTo(o)
	if _g.sling.model.FunctionDeclarationBaseNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.PropertyFunctionDeclarationNode')
		if n == nil then
			do return true end
		end
		if n.returnType ~= nil then
			do n.returnType:destroy() end
			n.returnType = nil
		end
		if self.returnType ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.returnType), '_isType.sling.common.DataTypeNode')
			if pcp == nil then
				do return false end
			end
			n.returnType = pcp
			do n.returnType:setParent(n) end
		end
		if n.expression ~= nil then
			do n.expression:destroy() end
			n.expression = nil
		end
		if self.expression ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.expression), '_isType.sling.model.ExpressionNode')
			if pcp == nil then
				do return false end
			end
			n.expression = pcp
			do n.expression:setParent(n) end
		end
		n.direction = self.direction
		n.name = self.name
		do return true end
	end
end

function sling.js.model.PropertyFunctionDeclarationNode:replaceChild(oldnode, newnode, doExport)
	if oldnode == self.returnType then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.common.DataTypeNode') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.returnType:destroy() end
		end
		self.returnType = _vm:to_table_with_key(newnode, '_isType.sling.common.DataTypeNode')
		if self.returnType ~= nil then
			do self.returnType:setParent(self) end
		end
		do return true end
	end
	if oldnode == self.expression then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.expression:destroy() end
		end
		self.expression = _vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode')
		if self.expression ~= nil then
			do self.expression:setParent(self) end
		end
		do return true end
	end
	do return _g.sling.model.FunctionDeclarationBaseNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.PropertyFunctionDeclarationNode:acceptVisitor(visitor)
	if _g.sling.model.FunctionDeclarationBaseNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self.returnType ~= nil then
		if self.returnType:accept(visitor) == false then
			do return false end
		end
	end
	if self.expression ~= nil then
		if self.expression:accept(visitor) == false then
			do return false end
		end
	end
	do return true end
end

function sling.js.model.PropertyFunctionDeclarationNode:destroy()
	do _g.sling.model.FunctionDeclarationBaseNode.destroy(self) end
	if self.returnType ~= nil then
		do self.returnType:destroy() end
		self.returnType = nil
	end
	if self.expression ~= nil then
		do self.expression:destroy() end
		self.expression = nil
	end
end

function sling.js.model.PropertyFunctionDeclarationNode:setReturnType(v, doExport)
	if self.returnType ~= nil and doExport == false then
		do self.returnType:destroy() end
	end
	self.returnType = v
	if self.returnType ~= nil then
		do self.returnType:setParent(self) end
	end
end

function sling.js.model.PropertyFunctionDeclarationNode:getReturnType()
	do return self.returnType end
end

function sling.js.model.PropertyFunctionDeclarationNode:exportReturnType()
	local v = self.returnType
	self.returnType = nil
	do return v end
end

function sling.js.model.PropertyFunctionDeclarationNode:setExpression(v, doExport)
	if self.expression ~= nil and doExport == false then
		do self.expression:destroy() end
	end
	self.expression = v
	if self.expression ~= nil then
		do self.expression:setParent(self) end
	end
end

function sling.js.model.PropertyFunctionDeclarationNode:getExpression()
	do return self.expression end
end

function sling.js.model.PropertyFunctionDeclarationNode:exportExpression()
	local v = self.expression
	self.expression = nil
	do return v end
end

function sling.js.model.PropertyFunctionDeclarationNode:setDirection(v)
	self.direction = v
end

function sling.js.model.PropertyFunctionDeclarationNode:getDirection()
	do return self.direction end
end

function sling.js.model.PropertyFunctionDeclarationNode:getName()
	do return self.name end
end

sling.js.model.JSModifier = {}
sling.js.model.JSModifier.__index = sling.js.model.JSModifier
_vm:set_metatable(sling.js.model.JSModifier, {})

sling.js.model.JSModifier.HOIST = "hoist"
sling.js.model.JSModifier.GENERATOR = "generator"
sling.js.model.JSModifier.AWAIT = "await"
sling.js.model.JSModifier.OPTIONAL = "optional"
sling.js.model.JSModifier.DEFAULT = "default"

function sling.js.model.JSModifier._create()
	local v = _vm:set_metatable({}, sling.js.model.JSModifier)
	return v
end

function sling.js.model.JSModifier:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.JSModifier'
	self['_isType.sling.js.model.JSModifier'] = true
end

function sling.js.model.JSModifier:_construct0()
	sling.js.model.JSModifier._init(self)
	return self
end

sling.js.model.ImportExpressionStatementNode = _g.sling.model.ImportStatementNode._create()
sling.js.model.ImportExpressionStatementNode.__index = sling.js.model.ImportExpressionStatementNode
_vm:set_metatable(sling.js.model.ImportExpressionStatementNode, {
	__index = _g.sling.model.ImportStatementNode
})

function sling.js.model.ImportExpressionStatementNode._create()
	local v = _vm:set_metatable({}, sling.js.model.ImportExpressionStatementNode)
	return v
end

function sling.js.model.ImportExpressionStatementNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.ImportExpressionStatementNode'
	self['_isType.sling.js.model.ImportExpressionStatementNode'] = true
	self.expression = nil
end

function sling.js.model.ImportExpressionStatementNode:_construct0()
	sling.js.model.ImportExpressionStatementNode._init(self)
	do _g.sling.model.ImportStatementNode._construct0(self) end
	return self
end

function sling.js.model.ImportExpressionStatementNode:getNodeTypeName()
	do return "ImportExpressionStatementNode" end
end

function sling.js.model.ImportExpressionStatementNode:createNew()
	do return _g.sling.js.model.ImportExpressionStatementNode._construct0(_g.sling.js.model.ImportExpressionStatementNode._create()) end
end

function sling.js.model.ImportExpressionStatementNode:copyTo(o)
	if _g.sling.model.ImportStatementNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.ImportExpressionStatementNode')
		if n == nil then
			do return true end
		end
		if n.expression ~= nil then
			do n.expression:destroy() end
			n.expression = nil
		end
		if self.expression ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.expression), '_isType.sling.model.ExpressionNode')
			if pcp == nil then
				do return false end
			end
			n.expression = pcp
			do n.expression:setParent(n) end
		end
		do return true end
	end
end

function sling.js.model.ImportExpressionStatementNode:replaceChild(oldnode, newnode, doExport)
	if oldnode == self.expression then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.expression:destroy() end
		end
		self.expression = _vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode')
		if self.expression ~= nil then
			do self.expression:setParent(self) end
		end
		do return true end
	end
	do return _g.sling.model.ImportStatementNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.ImportExpressionStatementNode:acceptVisitor(visitor)
	if _g.sling.model.ImportStatementNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self.expression ~= nil then
		if self.expression:accept(visitor) == false then
			do return false end
		end
	end
	do return true end
end

function sling.js.model.ImportExpressionStatementNode:destroy()
	do _g.sling.model.ImportStatementNode.destroy(self) end
	if self.expression ~= nil then
		do self.expression:destroy() end
		self.expression = nil
	end
end

function sling.js.model.ImportExpressionStatementNode:setExpression(v, doExport)
	if self.expression ~= nil and doExport == false then
		do self.expression:destroy() end
	end
	self.expression = v
	if self.expression ~= nil then
		do self.expression:setParent(self) end
	end
end

function sling.js.model.ImportExpressionStatementNode:getExpression()
	do return self.expression end
end

function sling.js.model.ImportExpressionStatementNode:exportExpression()
	local v = self.expression
	self.expression = nil
	do return v end
end

sling.js.model.HTMLUnitSettingsNode = _g.sling.common.CodeUnitSettingsNode._create()
sling.js.model.HTMLUnitSettingsNode.__index = sling.js.model.HTMLUnitSettingsNode
_vm:set_metatable(sling.js.model.HTMLUnitSettingsNode, {
	__index = _g.sling.common.CodeUnitSettingsNode
})

function sling.js.model.HTMLUnitSettingsNode._create()
	local v = _vm:set_metatable({}, sling.js.model.HTMLUnitSettingsNode)
	return v
end

function sling.js.model.HTMLUnitSettingsNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.HTMLUnitSettingsNode'
	self['_isType.sling.js.model.HTMLUnitSettingsNode'] = true
	self.projectName = nil
	self.projectVersion = nil
	self.displayName = nil
end

function sling.js.model.HTMLUnitSettingsNode:_construct0()
	sling.js.model.HTMLUnitSettingsNode._init(self)
	do _g.sling.common.CodeUnitSettingsNode._construct0(self) end
	return self
end

function sling.js.model.HTMLUnitSettingsNode:getNodeTypeName()
	do return "HTMLUnitSettingsNode" end
end

function sling.js.model.HTMLUnitSettingsNode:createNew()
	do return _g.sling.js.model.HTMLUnitSettingsNode._construct0(_g.sling.js.model.HTMLUnitSettingsNode._create()) end
end

function sling.js.model.HTMLUnitSettingsNode:copyTo(o)
	if _g.sling.common.CodeUnitSettingsNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.HTMLUnitSettingsNode')
		if n == nil then
			do return true end
		end
		n.projectName = self.projectName
		n.projectVersion = self.projectVersion
		n.displayName = self.displayName
		do return true end
	end
end

function sling.js.model.HTMLUnitSettingsNode:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.common.CodeUnitSettingsNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.HTMLUnitSettingsNode:acceptVisitor(visitor)
	if _g.sling.common.CodeUnitSettingsNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.HTMLUnitSettingsNode:destroy()
	do _g.sling.common.CodeUnitSettingsNode.destroy(self) end
end

function sling.js.model.HTMLUnitSettingsNode:setProjectName(v)
	self.projectName = v
end

function sling.js.model.HTMLUnitSettingsNode:getProjectName()
	do return self.projectName end
end

function sling.js.model.HTMLUnitSettingsNode:setProjectVersion(v)
	self.projectVersion = v
end

function sling.js.model.HTMLUnitSettingsNode:getProjectVersion()
	do return self.projectVersion end
end

function sling.js.model.HTMLUnitSettingsNode:setDisplayName(v)
	self.displayName = v
end

function sling.js.model.HTMLUnitSettingsNode:getDisplayName()
	do return self.displayName end
end

sling.js.model.NpmCodeUnitSettingsNode = _g.sling.common.CodeUnitSettingsNode._create()
sling.js.model.NpmCodeUnitSettingsNode.__index = sling.js.model.NpmCodeUnitSettingsNode
_vm:set_metatable(sling.js.model.NpmCodeUnitSettingsNode, {
	__index = _g.sling.common.CodeUnitSettingsNode
})

function sling.js.model.NpmCodeUnitSettingsNode._create()
	local v = _vm:set_metatable({}, sling.js.model.NpmCodeUnitSettingsNode)
	return v
end

function sling.js.model.NpmCodeUnitSettingsNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.NpmCodeUnitSettingsNode'
	self['_isType.sling.js.model.NpmCodeUnitSettingsNode'] = true
	self.packageJson = nil
	self.angularJson = nil
	self.tsconfigJson = nil
	self.tslintJson = nil
end

function sling.js.model.NpmCodeUnitSettingsNode:_construct0()
	sling.js.model.NpmCodeUnitSettingsNode._init(self)
	do _g.sling.common.CodeUnitSettingsNode._construct0(self) end
	return self
end

function sling.js.model.NpmCodeUnitSettingsNode:getNodeTypeName()
	do return "NpmCodeUnitSettingsNode" end
end

function sling.js.model.NpmCodeUnitSettingsNode:createNew()
	do return _g.sling.js.model.NpmCodeUnitSettingsNode._construct0(_g.sling.js.model.NpmCodeUnitSettingsNode._create()) end
end

function sling.js.model.NpmCodeUnitSettingsNode:copyTo(o)
	if _g.sling.common.CodeUnitSettingsNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.NpmCodeUnitSettingsNode')
		if n == nil then
			do return true end
		end
		n.packageJson = self.packageJson
		n.angularJson = self.angularJson
		n.tsconfigJson = self.tsconfigJson
		n.tslintJson = self.tslintJson
		do return true end
	end
end

function sling.js.model.NpmCodeUnitSettingsNode:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.common.CodeUnitSettingsNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.NpmCodeUnitSettingsNode:acceptVisitor(visitor)
	if _g.sling.common.CodeUnitSettingsNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.NpmCodeUnitSettingsNode:destroy()
	do _g.sling.common.CodeUnitSettingsNode.destroy(self) end
end

function sling.js.model.NpmCodeUnitSettingsNode:setPackageJson(v)
	self.packageJson = v
end

function sling.js.model.NpmCodeUnitSettingsNode:getPackageJson()
	do return self.packageJson end
end

function sling.js.model.NpmCodeUnitSettingsNode:setAngularJson(v)
	self.angularJson = v
end

function sling.js.model.NpmCodeUnitSettingsNode:getAngularJson()
	do return self.angularJson end
end

function sling.js.model.NpmCodeUnitSettingsNode:setTsconfigJson(v)
	self.tsconfigJson = v
end

function sling.js.model.NpmCodeUnitSettingsNode:getTsconfigJson()
	do return self.tsconfigJson end
end

function sling.js.model.NpmCodeUnitSettingsNode:setTslintJson(v)
	self.tslintJson = v
end

function sling.js.model.NpmCodeUnitSettingsNode:getTslintJson()
	do return self.tslintJson end
end

sling.js.model.ExportDeclarationStatementNode = _g.sling.js.model.ExportStatementNode._create()
sling.js.model.ExportDeclarationStatementNode.__index = sling.js.model.ExportDeclarationStatementNode
_vm:set_metatable(sling.js.model.ExportDeclarationStatementNode, {
	__index = _g.sling.js.model.ExportStatementNode
})

function sling.js.model.ExportDeclarationStatementNode._create()
	local v = _vm:set_metatable({}, sling.js.model.ExportDeclarationStatementNode)
	return v
end

function sling.js.model.ExportDeclarationStatementNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.ExportDeclarationStatementNode'
	self['_isType.sling.js.model.ExportDeclarationStatementNode'] = true
	self['_isType.sling.model.NodeWithModifiers'] = true
	self.declaration = nil
	self.modifiers = nil
end

function sling.js.model.ExportDeclarationStatementNode:_construct0()
	sling.js.model.ExportDeclarationStatementNode._init(self)
	do _g.sling.js.model.ExportStatementNode._construct0(self) end
	return self
end

function sling.js.model.ExportDeclarationStatementNode:getNodeTypeName()
	do return "ExportDeclarationStatementNode" end
end

function sling.js.model.ExportDeclarationStatementNode:createNew()
	do return _g.sling.js.model.ExportDeclarationStatementNode._construct0(_g.sling.js.model.ExportDeclarationStatementNode._create()) end
end

function sling.js.model.ExportDeclarationStatementNode:copyTo(o)
	if _g.sling.js.model.ExportStatementNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.ExportDeclarationStatementNode')
		if n == nil then
			do return true end
		end
		if n.declaration ~= nil then
			do n.declaration:destroy() end
			n.declaration = nil
		end
		if self.declaration ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.declaration), '_isType.sling.common.NodeObject')
			if pcp == nil then
				do return false end
			end
			n.declaration = pcp
			do n.declaration:setParent(n) end
		end
		do
			local array = n.modifiers
			if array ~= nil then
				local n2 = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n2 = 0
					while n2 < m do
						local xx = _vm:to_table_with_key(array[n2 + 1], '_isType.sling.common.NodeObject')
						if xx ~= nil then
							do xx:destroy() end
						end
						do n2 = n2 + 1 end
					end
				end
			end
			n.modifiers = nil
			if self.modifiers ~= nil then
				local n3 = 0
				local m2 = _g.jk.lang.Vector:getSize(self.modifiers)
				do
					n3 = 0
					while n3 < m2 do
						local nod = _vm:to_table_with_key(self.modifiers[n3 + 1], '_isType.sling.common.NodeObject')
						if nod ~= nil then
							local ndup = _vm:to_table_with_key(nod:dup(), '_isType.sling.common.NodeObject')
							if ndup == nil then
								do return false end
							end
							if n.modifiers == nil then
								n.modifiers = {}
							end
							do _g.jk.lang.Vector:append(n.modifiers, ndup) end
							do ndup:setParent(n) end
						end
						do n3 = n3 + 1 end
					end
				end
			end
			do return true end
		end
	end
end

function sling.js.model.ExportDeclarationStatementNode:replaceChild(oldnode, newnode, doExport)
	if oldnode == self.declaration then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.common.NodeObject') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.declaration:destroy() end
		end
		self.declaration = _vm:to_table_with_key(newnode, '_isType.sling.common.NodeObject')
		if self.declaration ~= nil then
			do self.declaration:setParent(self) end
		end
		do return true end
	end
	if self:replaceNodeInVector(self.modifiers, oldnode, newnode, doExport) then
		do return true end
	end
	do return _g.sling.js.model.ExportStatementNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.ExportDeclarationStatementNode:acceptVisitor(visitor)
	if _g.sling.js.model.ExportStatementNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self.declaration ~= nil then
		if self.declaration:accept(visitor) == false then
			do return false end
		end
	end
	if self:visitVector(self.modifiers, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.ExportDeclarationStatementNode:destroy()
	do _g.sling.js.model.ExportStatementNode.destroy(self) end
	if self.declaration ~= nil then
		do self.declaration:destroy() end
		self.declaration = nil
	end
	if self.modifiers ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.modifiers)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.modifiers[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	self.modifiers = nil
end

function sling.js.model.ExportDeclarationStatementNode:setDeclaration(v, doExport)
	if self.declaration ~= nil and doExport == false then
		do self.declaration:destroy() end
	end
	self.declaration = v
	if self.declaration ~= nil then
		do self.declaration:setParent(self) end
	end
end

function sling.js.model.ExportDeclarationStatementNode:getDeclaration()
	do return self.declaration end
end

function sling.js.model.ExportDeclarationStatementNode:exportDeclaration()
	local v = self.declaration
	self.declaration = nil
	do return v end
end

function sling.js.model.ExportDeclarationStatementNode:setModifiers(v, doExport)
	if self.modifiers ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.modifiers)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.modifiers[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	if v == nil then
		self.modifiers = nil
	else
		self.modifiers = {}
		if v ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(v)
			do
				n2 = 0
				while n2 < m2 do
					local vv = _vm:to_table_with_key(v[n2 + 1], '_isType.sling.common.NodeObject')
					if vv ~= nil then
						do _g.jk.lang.Vector:append(self.modifiers, vv) end
						do vv:setParent(self) end
					end
					do n2 = n2 + 1 end
				end
			end
		end
	end
end

function sling.js.model.ExportDeclarationStatementNode:getModifiers()
	do return self.modifiers end
end

function sling.js.model.ExportDeclarationStatementNode:exportModifiers()
	local v = self.modifiers
	self.modifiers = nil
	do return v end
end

function sling.js.model.ExportDeclarationStatementNode:addToModifiers(v)
	if v == nil then
		do return end
	end
	if self.modifiers == nil then
		self.modifiers = {}
	end
	do _g.jk.lang.Vector:append(self.modifiers, v) end
	do v:setParent(self) end
end

function sling.js.model.ExportDeclarationStatementNode:clearModifiers()
	if self.modifiers ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.modifiers)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.modifiers[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	self.modifiers = nil
end

sling.js.model.ClassDeclarationExpressionNode = _g.sling.model.ExpressionNode._create()
sling.js.model.ClassDeclarationExpressionNode.__index = sling.js.model.ClassDeclarationExpressionNode
_vm:set_metatable(sling.js.model.ClassDeclarationExpressionNode, {
	__index = _g.sling.model.ExpressionNode
})

function sling.js.model.ClassDeclarationExpressionNode._create()
	local v = _vm:set_metatable({}, sling.js.model.ClassDeclarationExpressionNode)
	return v
end

function sling.js.model.ClassDeclarationExpressionNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.ClassDeclarationExpressionNode'
	self['_isType.sling.js.model.ClassDeclarationExpressionNode'] = true
	self.declaration = nil
end

function sling.js.model.ClassDeclarationExpressionNode:_construct0()
	sling.js.model.ClassDeclarationExpressionNode._init(self)
	do _g.sling.model.ExpressionNode._construct0(self) end
	return self
end

function sling.js.model.ClassDeclarationExpressionNode:forDeclaration(decl)
	local v = _g.sling.js.model.ClassDeclarationExpressionNode._construct0(_g.sling.js.model.ClassDeclarationExpressionNode._create())
	do v:setDeclaration(decl, false) end
	do return v end
end

function sling.js.model.ClassDeclarationExpressionNode:getNodeTypeName()
	do return "ClassDeclarationExpressionNode" end
end

function sling.js.model.ClassDeclarationExpressionNode:createNew()
	do return _g.sling.js.model.ClassDeclarationExpressionNode._construct0(_g.sling.js.model.ClassDeclarationExpressionNode._create()) end
end

function sling.js.model.ClassDeclarationExpressionNode:copyTo(o)
	if _g.sling.model.ExpressionNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.ClassDeclarationExpressionNode')
		if n == nil then
			do return true end
		end
		if n.declaration ~= nil then
			do n.declaration:destroy() end
			n.declaration = nil
		end
		if self.declaration ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.declaration), '_isType.sling.model.ClassDeclarationNode')
			if pcp == nil then
				do return false end
			end
			n.declaration = pcp
			do n.declaration:setParent(n) end
		end
		do return true end
	end
end

function sling.js.model.ClassDeclarationExpressionNode:replaceChild(oldnode, newnode, doExport)
	if oldnode == self.declaration then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.model.ClassDeclarationNode') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.declaration:destroy() end
		end
		self.declaration = _vm:to_table_with_key(newnode, '_isType.sling.model.ClassDeclarationNode')
		if self.declaration ~= nil then
			do self.declaration:setParent(self) end
		end
		do return true end
	end
	do return _g.sling.model.ExpressionNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.ClassDeclarationExpressionNode:acceptVisitor(visitor)
	if _g.sling.model.ExpressionNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self.declaration ~= nil then
		if self.declaration:accept(visitor) == false then
			do return false end
		end
	end
	do return true end
end

function sling.js.model.ClassDeclarationExpressionNode:destroy()
	do _g.sling.model.ExpressionNode.destroy(self) end
	if self.declaration ~= nil then
		do self.declaration:destroy() end
		self.declaration = nil
	end
end

function sling.js.model.ClassDeclarationExpressionNode:setDeclaration(v, doExport)
	if self.declaration ~= nil and doExport == false then
		do self.declaration:destroy() end
	end
	self.declaration = v
	if self.declaration ~= nil then
		do self.declaration:setParent(self) end
	end
end

function sling.js.model.ClassDeclarationExpressionNode:getDeclaration()
	do return self.declaration end
end

function sling.js.model.ClassDeclarationExpressionNode:exportDeclaration()
	local v = self.declaration
	self.declaration = nil
	do return v end
end

sling.js.model.JavascriptFunctionDeclarationExpressionNode = _g.sling.model.ExpressionNode._create()
sling.js.model.JavascriptFunctionDeclarationExpressionNode.__index = sling.js.model.JavascriptFunctionDeclarationExpressionNode
_vm:set_metatable(sling.js.model.JavascriptFunctionDeclarationExpressionNode, {
	__index = _g.sling.model.ExpressionNode
})

function sling.js.model.JavascriptFunctionDeclarationExpressionNode._create()
	local v = _vm:set_metatable({}, sling.js.model.JavascriptFunctionDeclarationExpressionNode)
	return v
end

function sling.js.model.JavascriptFunctionDeclarationExpressionNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.JavascriptFunctionDeclarationExpressionNode'
	self['_isType.sling.js.model.JavascriptFunctionDeclarationExpressionNode'] = true
	self.declaration = nil
	self.type = nil
end

function sling.js.model.JavascriptFunctionDeclarationExpressionNode:_construct0()
	sling.js.model.JavascriptFunctionDeclarationExpressionNode._init(self)
	do _g.sling.model.ExpressionNode._construct0(self) end
	return self
end

function sling.js.model.JavascriptFunctionDeclarationExpressionNode:forDeclaration(decl)
	local v = _g.sling.js.model.JavascriptFunctionDeclarationExpressionNode._construct0(_g.sling.js.model.JavascriptFunctionDeclarationExpressionNode._create())
	do v:setDeclaration(decl, false) end
	do return v end
end

function sling.js.model.JavascriptFunctionDeclarationExpressionNode:getNodeTypeName()
	do return "JavascriptFunctionDeclarationExpressionNode" end
end

function sling.js.model.JavascriptFunctionDeclarationExpressionNode:createNew()
	do return _g.sling.js.model.JavascriptFunctionDeclarationExpressionNode._construct0(_g.sling.js.model.JavascriptFunctionDeclarationExpressionNode._create()) end
end

function sling.js.model.JavascriptFunctionDeclarationExpressionNode:copyTo(o)
	if _g.sling.model.ExpressionNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.JavascriptFunctionDeclarationExpressionNode')
		if n == nil then
			do return true end
		end
		if n.declaration ~= nil then
			do n.declaration:destroy() end
			n.declaration = nil
		end
		if self.declaration ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.declaration), '_isType.sling.model.FunctionDeclarationNode')
			if pcp == nil then
				do return false end
			end
			n.declaration = pcp
			do n.declaration:setParent(n) end
		end
		if n.type ~= nil then
			do n.type:destroy() end
			n.type = nil
		end
		if self.type ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.type), '_isType.sling.common.DataTypeNode')
			if pcp == nil then
				do return false end
			end
			n.type = pcp
			do n.type:setParent(n) end
		end
		do return true end
	end
end

function sling.js.model.JavascriptFunctionDeclarationExpressionNode:replaceChild(oldnode, newnode, doExport)
	if oldnode == self.declaration then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.model.FunctionDeclarationNode') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.declaration:destroy() end
		end
		self.declaration = _vm:to_table_with_key(newnode, '_isType.sling.model.FunctionDeclarationNode')
		if self.declaration ~= nil then
			do self.declaration:setParent(self) end
		end
		do return true end
	end
	if oldnode == self.type then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.common.DataTypeNode') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.type:destroy() end
		end
		self.type = _vm:to_table_with_key(newnode, '_isType.sling.common.DataTypeNode')
		if self.type ~= nil then
			do self.type:setParent(self) end
		end
		do return true end
	end
	do return _g.sling.model.ExpressionNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.JavascriptFunctionDeclarationExpressionNode:acceptVisitor(visitor)
	if _g.sling.model.ExpressionNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self.declaration ~= nil then
		if self.declaration:accept(visitor) == false then
			do return false end
		end
	end
	if self.type ~= nil then
		if self.type:accept(visitor) == false then
			do return false end
		end
	end
	do return true end
end

function sling.js.model.JavascriptFunctionDeclarationExpressionNode:destroy()
	do _g.sling.model.ExpressionNode.destroy(self) end
	if self.declaration ~= nil then
		do self.declaration:destroy() end
		self.declaration = nil
	end
	if self.type ~= nil then
		do self.type:destroy() end
		self.type = nil
	end
end

function sling.js.model.JavascriptFunctionDeclarationExpressionNode:setDeclaration(v, doExport)
	if self.declaration ~= nil and doExport == false then
		do self.declaration:destroy() end
	end
	self.declaration = v
	if self.declaration ~= nil then
		do self.declaration:setParent(self) end
	end
end

function sling.js.model.JavascriptFunctionDeclarationExpressionNode:getDeclaration()
	do return self.declaration end
end

function sling.js.model.JavascriptFunctionDeclarationExpressionNode:exportDeclaration()
	local v = self.declaration
	self.declaration = nil
	do return v end
end

function sling.js.model.JavascriptFunctionDeclarationExpressionNode:setType(v, doExport)
	if self.type ~= nil and doExport == false then
		do self.type:destroy() end
	end
	self.type = v
	if self.type ~= nil then
		do self.type:setParent(self) end
	end
end

function sling.js.model.JavascriptFunctionDeclarationExpressionNode:getType()
	do return self.type end
end

function sling.js.model.JavascriptFunctionDeclarationExpressionNode:exportType()
	local v = self.type
	self.type = nil
	do return v end
end

sling.js.model.DeleteExpressionNode = _g.sling.model.UnaryExpressionNode._create()
sling.js.model.DeleteExpressionNode.__index = sling.js.model.DeleteExpressionNode
_vm:set_metatable(sling.js.model.DeleteExpressionNode, {
	__index = _g.sling.model.UnaryExpressionNode
})

function sling.js.model.DeleteExpressionNode._create()
	local v = _vm:set_metatable({}, sling.js.model.DeleteExpressionNode)
	return v
end

function sling.js.model.DeleteExpressionNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.DeleteExpressionNode'
	self['_isType.sling.js.model.DeleteExpressionNode'] = true
end

function sling.js.model.DeleteExpressionNode:_construct0()
	sling.js.model.DeleteExpressionNode._init(self)
	do _g.sling.model.UnaryExpressionNode._construct0(self) end
	return self
end

function sling.js.model.DeleteExpressionNode:getNodeTypeName()
	do return "DeleteExpressionNode" end
end

function sling.js.model.DeleteExpressionNode:createNew()
	do return _g.sling.js.model.DeleteExpressionNode._construct0(_g.sling.js.model.DeleteExpressionNode._create()) end
end

function sling.js.model.DeleteExpressionNode:copyTo(o)
	if _g.sling.model.UnaryExpressionNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.DeleteExpressionNode')
		if n == nil then
			do return true end
		end
		do return true end
	end
end

function sling.js.model.DeleteExpressionNode:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.model.UnaryExpressionNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.DeleteExpressionNode:acceptVisitor(visitor)
	if _g.sling.model.UnaryExpressionNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.DeleteExpressionNode:destroy()
	do _g.sling.model.UnaryExpressionNode.destroy(self) end
end

sling.js.model.VoidExpressionNode = _g.sling.model.UnaryExpressionNode._create()
sling.js.model.VoidExpressionNode.__index = sling.js.model.VoidExpressionNode
_vm:set_metatable(sling.js.model.VoidExpressionNode, {
	__index = _g.sling.model.UnaryExpressionNode
})

function sling.js.model.VoidExpressionNode._create()
	local v = _vm:set_metatable({}, sling.js.model.VoidExpressionNode)
	return v
end

function sling.js.model.VoidExpressionNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.VoidExpressionNode'
	self['_isType.sling.js.model.VoidExpressionNode'] = true
end

function sling.js.model.VoidExpressionNode:_construct0()
	sling.js.model.VoidExpressionNode._init(self)
	do _g.sling.model.UnaryExpressionNode._construct0(self) end
	return self
end

function sling.js.model.VoidExpressionNode:getNodeTypeName()
	do return "VoidExpressionNode" end
end

function sling.js.model.VoidExpressionNode:createNew()
	do return _g.sling.js.model.VoidExpressionNode._construct0(_g.sling.js.model.VoidExpressionNode._create()) end
end

function sling.js.model.VoidExpressionNode:copyTo(o)
	if _g.sling.model.UnaryExpressionNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.VoidExpressionNode')
		if n == nil then
			do return true end
		end
		do return true end
	end
end

function sling.js.model.VoidExpressionNode:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.model.UnaryExpressionNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.VoidExpressionNode:acceptVisitor(visitor)
	if _g.sling.model.UnaryExpressionNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.VoidExpressionNode:destroy()
	do _g.sling.model.UnaryExpressionNode.destroy(self) end
end

sling.js.model.SpreadExpressionNode = _g.sling.model.UnaryExpressionNode._create()
sling.js.model.SpreadExpressionNode.__index = sling.js.model.SpreadExpressionNode
_vm:set_metatable(sling.js.model.SpreadExpressionNode, {
	__index = _g.sling.model.UnaryExpressionNode
})

function sling.js.model.SpreadExpressionNode._create()
	local v = _vm:set_metatable({}, sling.js.model.SpreadExpressionNode)
	return v
end

function sling.js.model.SpreadExpressionNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.SpreadExpressionNode'
	self['_isType.sling.js.model.SpreadExpressionNode'] = true
end

function sling.js.model.SpreadExpressionNode:_construct0()
	sling.js.model.SpreadExpressionNode._init(self)
	do _g.sling.model.UnaryExpressionNode._construct0(self) end
	return self
end

function sling.js.model.SpreadExpressionNode:forExpression(expression)
	local v = _g.sling.js.model.SpreadExpressionNode._construct0(_g.sling.js.model.SpreadExpressionNode._create())
	do v:setExpression(expression, false) end
	do return v end
end

function sling.js.model.SpreadExpressionNode:getNodeTypeName()
	do return "SpreadExpressionNode" end
end

function sling.js.model.SpreadExpressionNode:createNew()
	do return _g.sling.js.model.SpreadExpressionNode._construct0(_g.sling.js.model.SpreadExpressionNode._create()) end
end

function sling.js.model.SpreadExpressionNode:copyTo(o)
	if _g.sling.model.UnaryExpressionNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.SpreadExpressionNode')
		if n == nil then
			do return true end
		end
		do return true end
	end
end

function sling.js.model.SpreadExpressionNode:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.model.UnaryExpressionNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.SpreadExpressionNode:acceptVisitor(visitor)
	if _g.sling.model.UnaryExpressionNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.SpreadExpressionNode:destroy()
	do _g.sling.model.UnaryExpressionNode.destroy(self) end
end

sling.js.model.PipeExpressionNode = _g.sling.model.BinaryExpressionNode._create()
sling.js.model.PipeExpressionNode.__index = sling.js.model.PipeExpressionNode
_vm:set_metatable(sling.js.model.PipeExpressionNode, {
	__index = _g.sling.model.BinaryExpressionNode
})

function sling.js.model.PipeExpressionNode._create()
	local v = _vm:set_metatable({}, sling.js.model.PipeExpressionNode)
	return v
end

function sling.js.model.PipeExpressionNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.PipeExpressionNode'
	self['_isType.sling.js.model.PipeExpressionNode'] = true
end

function sling.js.model.PipeExpressionNode:_construct0()
	sling.js.model.PipeExpressionNode._init(self)
	do _g.sling.model.BinaryExpressionNode._construct0(self) end
	return self
end

function sling.js.model.PipeExpressionNode:instance(left, right)
	local v = _g.sling.js.model.PipeExpressionNode._construct0(_g.sling.js.model.PipeExpressionNode._create())
	do v:setLeft(left, false) end
	do v:setRight(right, false) end
	do return v end
end

function sling.js.model.PipeExpressionNode:getNodeTypeName()
	do return "PipeExpressionNode" end
end

function sling.js.model.PipeExpressionNode:createNew()
	do return _g.sling.js.model.PipeExpressionNode._construct0(_g.sling.js.model.PipeExpressionNode._create()) end
end

function sling.js.model.PipeExpressionNode:copyTo(o)
	if _g.sling.model.BinaryExpressionNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.PipeExpressionNode')
		if n == nil then
			do return true end
		end
		do return true end
	end
end

function sling.js.model.PipeExpressionNode:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.model.BinaryExpressionNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.PipeExpressionNode:acceptVisitor(visitor)
	if _g.sling.model.BinaryExpressionNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.PipeExpressionNode:destroy()
	do _g.sling.model.BinaryExpressionNode.destroy(self) end
end

sling.js.model.DestructuredVariableDeclarationNode = _g.sling.common.NodeObject._create()
sling.js.model.DestructuredVariableDeclarationNode.__index = sling.js.model.DestructuredVariableDeclarationNode
_vm:set_metatable(sling.js.model.DestructuredVariableDeclarationNode, {
	__index = _g.sling.common.NodeObject
})

function sling.js.model.DestructuredVariableDeclarationNode._create()
	local v = _vm:set_metatable({}, sling.js.model.DestructuredVariableDeclarationNode)
	return v
end

function sling.js.model.DestructuredVariableDeclarationNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.DestructuredVariableDeclarationNode'
	self['_isType.sling.js.model.DestructuredVariableDeclarationNode'] = true
	self['_isType.sling.model.NodeWithModifiers'] = true
	self.expression = nil
	self.initializer = nil
	self.type = nil
	self.modifiers = nil
end

function sling.js.model.DestructuredVariableDeclarationNode:_construct0()
	sling.js.model.DestructuredVariableDeclarationNode._init(self)
	do _g.sling.common.NodeObject._construct0(self) end
	return self
end

function sling.js.model.DestructuredVariableDeclarationNode:forExpression(expression, initializer, type)
	local v = _g.sling.js.model.DestructuredVariableDeclarationNode._construct0(_g.sling.js.model.DestructuredVariableDeclarationNode._create())
	do v:setExpression(expression, false) end
	do v:setInitializer(initializer, false) end
	do v:setType(type, false) end
	do return v end
end

function sling.js.model.DestructuredVariableDeclarationNode:getNodeTypeName()
	do return "DestructuredVariableDeclarationNode" end
end

function sling.js.model.DestructuredVariableDeclarationNode:createNew()
	do return _g.sling.js.model.DestructuredVariableDeclarationNode._construct0(_g.sling.js.model.DestructuredVariableDeclarationNode._create()) end
end

function sling.js.model.DestructuredVariableDeclarationNode:copyTo(o)
	if _g.sling.common.NodeObject.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.DestructuredVariableDeclarationNode')
		if n == nil then
			do return true end
		end
		if n.expression ~= nil then
			do n.expression:destroy() end
			n.expression = nil
		end
		if self.expression ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.expression), '_isType.sling.model.ExpressionNode')
			if pcp == nil then
				do return false end
			end
			n.expression = pcp
			do n.expression:setParent(n) end
		end
		if n.initializer ~= nil then
			do n.initializer:destroy() end
			n.initializer = nil
		end
		if self.initializer ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.initializer), '_isType.sling.model.ExpressionNode')
			if pcp == nil then
				do return false end
			end
			n.initializer = pcp
			do n.initializer:setParent(n) end
		end
		if n.type ~= nil then
			do n.type:destroy() end
			n.type = nil
		end
		if self.type ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.type), '_isType.sling.common.DataTypeNode')
			if pcp == nil then
				do return false end
			end
			n.type = pcp
			do n.type:setParent(n) end
		end
		do
			local array = n.modifiers
			if array ~= nil then
				local n2 = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n2 = 0
					while n2 < m do
						local xx = _vm:to_table_with_key(array[n2 + 1], '_isType.sling.common.NodeObject')
						if xx ~= nil then
							do xx:destroy() end
						end
						do n2 = n2 + 1 end
					end
				end
			end
			n.modifiers = nil
			if self.modifiers ~= nil then
				local n3 = 0
				local m2 = _g.jk.lang.Vector:getSize(self.modifiers)
				do
					n3 = 0
					while n3 < m2 do
						local nod = _vm:to_table_with_key(self.modifiers[n3 + 1], '_isType.sling.common.NodeObject')
						if nod ~= nil then
							local ndup = _vm:to_table_with_key(nod:dup(), '_isType.sling.common.NodeObject')
							if ndup == nil then
								do return false end
							end
							if n.modifiers == nil then
								n.modifiers = {}
							end
							do _g.jk.lang.Vector:append(n.modifiers, ndup) end
							do ndup:setParent(n) end
						end
						do n3 = n3 + 1 end
					end
				end
			end
			do return true end
		end
	end
end

function sling.js.model.DestructuredVariableDeclarationNode:replaceChild(oldnode, newnode, doExport)
	if oldnode == self.expression then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.expression:destroy() end
		end
		self.expression = _vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode')
		if self.expression ~= nil then
			do self.expression:setParent(self) end
		end
		do return true end
	end
	if oldnode == self.initializer then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.initializer:destroy() end
		end
		self.initializer = _vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode')
		if self.initializer ~= nil then
			do self.initializer:setParent(self) end
		end
		do return true end
	end
	if oldnode == self.type then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.common.DataTypeNode') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.type:destroy() end
		end
		self.type = _vm:to_table_with_key(newnode, '_isType.sling.common.DataTypeNode')
		if self.type ~= nil then
			do self.type:setParent(self) end
		end
		do return true end
	end
	if self:replaceNodeInVector(self.modifiers, oldnode, newnode, doExport) then
		do return true end
	end
	do return _g.sling.common.NodeObject.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.DestructuredVariableDeclarationNode:acceptVisitor(visitor)
	if _g.sling.common.NodeObject.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self.expression ~= nil then
		if self.expression:accept(visitor) == false then
			do return false end
		end
	end
	if self.initializer ~= nil then
		if self.initializer:accept(visitor) == false then
			do return false end
		end
	end
	if self.type ~= nil then
		if self.type:accept(visitor) == false then
			do return false end
		end
	end
	if self:visitVector(self.modifiers, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.DestructuredVariableDeclarationNode:destroy()
	do _g.sling.common.NodeObject.destroy(self) end
	if self.expression ~= nil then
		do self.expression:destroy() end
		self.expression = nil
	end
	if self.initializer ~= nil then
		do self.initializer:destroy() end
		self.initializer = nil
	end
	if self.type ~= nil then
		do self.type:destroy() end
		self.type = nil
	end
	if self.modifiers ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.modifiers)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.modifiers[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	self.modifiers = nil
end

function sling.js.model.DestructuredVariableDeclarationNode:setExpression(v, doExport)
	if self.expression ~= nil and doExport == false then
		do self.expression:destroy() end
	end
	self.expression = v
	if self.expression ~= nil then
		do self.expression:setParent(self) end
	end
end

function sling.js.model.DestructuredVariableDeclarationNode:getExpression()
	do return self.expression end
end

function sling.js.model.DestructuredVariableDeclarationNode:exportExpression()
	local v = self.expression
	self.expression = nil
	do return v end
end

function sling.js.model.DestructuredVariableDeclarationNode:setInitializer(v, doExport)
	if self.initializer ~= nil and doExport == false then
		do self.initializer:destroy() end
	end
	self.initializer = v
	if self.initializer ~= nil then
		do self.initializer:setParent(self) end
	end
end

function sling.js.model.DestructuredVariableDeclarationNode:getInitializer()
	do return self.initializer end
end

function sling.js.model.DestructuredVariableDeclarationNode:exportInitializer()
	local v = self.initializer
	self.initializer = nil
	do return v end
end

function sling.js.model.DestructuredVariableDeclarationNode:setType(v, doExport)
	if self.type ~= nil and doExport == false then
		do self.type:destroy() end
	end
	self.type = v
	if self.type ~= nil then
		do self.type:setParent(self) end
	end
end

function sling.js.model.DestructuredVariableDeclarationNode:getType()
	do return self.type end
end

function sling.js.model.DestructuredVariableDeclarationNode:exportType()
	local v = self.type
	self.type = nil
	do return v end
end

function sling.js.model.DestructuredVariableDeclarationNode:setModifiers(v, doExport)
	if self.modifiers ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.modifiers)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.modifiers[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	if v == nil then
		self.modifiers = nil
	else
		self.modifiers = {}
		if v ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(v)
			do
				n2 = 0
				while n2 < m2 do
					local vv = _vm:to_table_with_key(v[n2 + 1], '_isType.sling.common.NodeObject')
					if vv ~= nil then
						do _g.jk.lang.Vector:append(self.modifiers, vv) end
						do vv:setParent(self) end
					end
					do n2 = n2 + 1 end
				end
			end
		end
	end
end

function sling.js.model.DestructuredVariableDeclarationNode:getModifiers()
	do return self.modifiers end
end

function sling.js.model.DestructuredVariableDeclarationNode:exportModifiers()
	local v = self.modifiers
	self.modifiers = nil
	do return v end
end

function sling.js.model.DestructuredVariableDeclarationNode:addToModifiers(v)
	if v == nil then
		do return end
	end
	if self.modifiers == nil then
		self.modifiers = {}
	end
	do _g.jk.lang.Vector:append(self.modifiers, v) end
	do v:setParent(self) end
end

function sling.js.model.DestructuredVariableDeclarationNode:clearModifiers()
	if self.modifiers ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.modifiers)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.modifiers[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	self.modifiers = nil
end

sling.js.model.RegularExpressionLiteralExpressionNode = _g.sling.model.LiteralExpressionNode._create()
sling.js.model.RegularExpressionLiteralExpressionNode.__index = sling.js.model.RegularExpressionLiteralExpressionNode
_vm:set_metatable(sling.js.model.RegularExpressionLiteralExpressionNode, {
	__index = _g.sling.model.LiteralExpressionNode
})

function sling.js.model.RegularExpressionLiteralExpressionNode._create()
	local v = _vm:set_metatable({}, sling.js.model.RegularExpressionLiteralExpressionNode)
	return v
end

function sling.js.model.RegularExpressionLiteralExpressionNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.RegularExpressionLiteralExpressionNode'
	self['_isType.sling.js.model.RegularExpressionLiteralExpressionNode'] = true
	self.value = nil
	self.regexFlag = nil
end

function sling.js.model.RegularExpressionLiteralExpressionNode:forValue(value)
	local v = _g.sling.js.model.RegularExpressionLiteralExpressionNode._construct0(_g.sling.js.model.RegularExpressionLiteralExpressionNode._create())
	do v:setValue(value) end
	do return v end
end

function sling.js.model.RegularExpressionLiteralExpressionNode:_construct0()
	sling.js.model.RegularExpressionLiteralExpressionNode._init(self)
	do _g.sling.model.LiteralExpressionNode._construct0(self) end
	do self:setDefaultDataType(_g.sling.model.StringDataTypeNode._construct0(_g.sling.model.StringDataTypeNode._create()), false) end
	return self
end

function sling.js.model.RegularExpressionLiteralExpressionNode:getNodeTypeName()
	do return "RegularExpressionLiteralExpressionNode" end
end

function sling.js.model.RegularExpressionLiteralExpressionNode:createNew()
	do return _g.sling.js.model.RegularExpressionLiteralExpressionNode._construct0(_g.sling.js.model.RegularExpressionLiteralExpressionNode._create()) end
end

function sling.js.model.RegularExpressionLiteralExpressionNode:copyTo(o)
	if _g.sling.model.LiteralExpressionNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.RegularExpressionLiteralExpressionNode')
		if n == nil then
			do return true end
		end
		n.value = self.value
		n.regexFlag = self.regexFlag
		do return true end
	end
end

function sling.js.model.RegularExpressionLiteralExpressionNode:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.model.LiteralExpressionNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.RegularExpressionLiteralExpressionNode:acceptVisitor(visitor)
	if _g.sling.model.LiteralExpressionNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.RegularExpressionLiteralExpressionNode:destroy()
	do _g.sling.model.LiteralExpressionNode.destroy(self) end
end

function sling.js.model.RegularExpressionLiteralExpressionNode:setValue(v)
	self.value = v
end

function sling.js.model.RegularExpressionLiteralExpressionNode:getValue()
	do return self.value end
end

function sling.js.model.RegularExpressionLiteralExpressionNode:setRegexFlag(v)
	self.regexFlag = v
end

function sling.js.model.RegularExpressionLiteralExpressionNode:getRegexFlag()
	do return self.regexFlag end
end

sling.js.model.ObjectLiteralExpressionNode = _g.sling.model.LiteralExpressionNode._create()
sling.js.model.ObjectLiteralExpressionNode.__index = sling.js.model.ObjectLiteralExpressionNode
_vm:set_metatable(sling.js.model.ObjectLiteralExpressionNode, {
	__index = _g.sling.model.LiteralExpressionNode
})

function sling.js.model.ObjectLiteralExpressionNode._create()
	local v = _vm:set_metatable({}, sling.js.model.ObjectLiteralExpressionNode)
	return v
end

function sling.js.model.ObjectLiteralExpressionNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.ObjectLiteralExpressionNode'
	self['_isType.sling.js.model.ObjectLiteralExpressionNode'] = true
	self.values = nil
end

function sling.js.model.ObjectLiteralExpressionNode:_construct0()
	sling.js.model.ObjectLiteralExpressionNode._init(self)
	do _g.sling.model.LiteralExpressionNode._construct0(self) end
	do self:setDefaultDataType(_g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create()), false) end
	return self
end

function sling.js.model.ObjectLiteralExpressionNode:getNodeTypeName()
	do return "ObjectLiteralExpressionNode" end
end

function sling.js.model.ObjectLiteralExpressionNode:createNew()
	do return _g.sling.js.model.ObjectLiteralExpressionNode._construct0(_g.sling.js.model.ObjectLiteralExpressionNode._create()) end
end

function sling.js.model.ObjectLiteralExpressionNode:copyTo(o)
	if _g.sling.model.LiteralExpressionNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.ObjectLiteralExpressionNode')
		if n == nil then
			do return true end
		end
		do
			local array = n.values
			if array ~= nil then
				local n2 = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n2 = 0
					while n2 < m do
						local xx = _vm:to_table_with_key(array[n2 + 1], '_isType.sling.common.NodeObject')
						if xx ~= nil then
							do xx:destroy() end
						end
						do n2 = n2 + 1 end
					end
				end
			end
			n.values = nil
			if self.values ~= nil then
				local n3 = 0
				local m2 = _g.jk.lang.Vector:getSize(self.values)
				do
					n3 = 0
					while n3 < m2 do
						local nod = _vm:to_table_with_key(self.values[n3 + 1], '_isType.sling.common.NodeObject')
						if nod ~= nil then
							local ndup = _vm:to_table_with_key(nod:dup(), '_isType.sling.common.NodeObject')
							if ndup == nil then
								do return false end
							end
							if n.values == nil then
								n.values = {}
							end
							do _g.jk.lang.Vector:append(n.values, ndup) end
							do ndup:setParent(n) end
						end
						do n3 = n3 + 1 end
					end
				end
			end
			do return true end
		end
	end
end

function sling.js.model.ObjectLiteralExpressionNode:replaceChild(oldnode, newnode, doExport)
	if self:replaceNodeInVector(self.values, oldnode, newnode, doExport) then
		do return true end
	end
	do return _g.sling.model.LiteralExpressionNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.ObjectLiteralExpressionNode:acceptVisitor(visitor)
	if _g.sling.model.LiteralExpressionNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self:visitVector(self.values, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.ObjectLiteralExpressionNode:destroy()
	do _g.sling.model.LiteralExpressionNode.destroy(self) end
	if self.values ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.values)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.values[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	self.values = nil
end

function sling.js.model.ObjectLiteralExpressionNode:setValues(v, doExport)
	if self.values ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.values)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.values[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	if v == nil then
		self.values = nil
	else
		self.values = {}
		if v ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(v)
			do
				n2 = 0
				while n2 < m2 do
					local vv = _vm:to_table_with_key(v[n2 + 1], '_isType.sling.common.NodeObject')
					if vv ~= nil then
						do _g.jk.lang.Vector:append(self.values, vv) end
						do vv:setParent(self) end
					end
					do n2 = n2 + 1 end
				end
			end
		end
	end
end

function sling.js.model.ObjectLiteralExpressionNode:getValues()
	do return self.values end
end

function sling.js.model.ObjectLiteralExpressionNode:exportValues()
	local v = self.values
	self.values = nil
	do return v end
end

function sling.js.model.ObjectLiteralExpressionNode:addToValues(v)
	if v == nil then
		do return end
	end
	if self.values == nil then
		self.values = {}
	end
	do _g.jk.lang.Vector:append(self.values, v) end
	do v:setParent(self) end
end

function sling.js.model.ObjectLiteralExpressionNode:clearValues()
	if self.values ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.values)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.values[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	self.values = nil
end

sling.js.model.NumberDataTypeNode = _g.sling.model.PrimitiveDataTypeNode._create()
sling.js.model.NumberDataTypeNode.__index = sling.js.model.NumberDataTypeNode
_vm:set_metatable(sling.js.model.NumberDataTypeNode, {
	__index = _g.sling.model.PrimitiveDataTypeNode
})

function sling.js.model.NumberDataTypeNode._create()
	local v = _vm:set_metatable({}, sling.js.model.NumberDataTypeNode)
	return v
end

function sling.js.model.NumberDataTypeNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.NumberDataTypeNode'
	self['_isType.sling.js.model.NumberDataTypeNode'] = true
end

function sling.js.model.NumberDataTypeNode:_construct0()
	sling.js.model.NumberDataTypeNode._init(self)
	do _g.sling.model.PrimitiveDataTypeNode._construct0(self) end
	return self
end

function sling.js.model.NumberDataTypeNode:getNodeTypeName()
	do return "NumberDataTypeNode" end
end

function sling.js.model.NumberDataTypeNode:createNew()
	do return _g.sling.js.model.NumberDataTypeNode._construct0(_g.sling.js.model.NumberDataTypeNode._create()) end
end

function sling.js.model.NumberDataTypeNode:copyTo(o)
	if _g.sling.model.PrimitiveDataTypeNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.NumberDataTypeNode')
		if n == nil then
			do return true end
		end
		do return true end
	end
end

function sling.js.model.NumberDataTypeNode:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.model.PrimitiveDataTypeNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.NumberDataTypeNode:acceptVisitor(visitor)
	if _g.sling.model.PrimitiveDataTypeNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.NumberDataTypeNode:destroy()
	do _g.sling.model.PrimitiveDataTypeNode.destroy(self) end
end

sling.js.model.UndefinedDataTypeNode = _g.sling.common.DataTypeNode._create()
sling.js.model.UndefinedDataTypeNode.__index = sling.js.model.UndefinedDataTypeNode
_vm:set_metatable(sling.js.model.UndefinedDataTypeNode, {
	__index = _g.sling.common.DataTypeNode
})

function sling.js.model.UndefinedDataTypeNode._create()
	local v = _vm:set_metatable({}, sling.js.model.UndefinedDataTypeNode)
	return v
end

function sling.js.model.UndefinedDataTypeNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.UndefinedDataTypeNode'
	self['_isType.sling.js.model.UndefinedDataTypeNode'] = true
end

function sling.js.model.UndefinedDataTypeNode:_construct0()
	sling.js.model.UndefinedDataTypeNode._init(self)
	do _g.sling.common.DataTypeNode._construct0(self) end
	return self
end

function sling.js.model.UndefinedDataTypeNode:getNodeTypeName()
	do return "UndefinedDataTypeNode" end
end

function sling.js.model.UndefinedDataTypeNode:createNew()
	do return _g.sling.js.model.UndefinedDataTypeNode._construct0(_g.sling.js.model.UndefinedDataTypeNode._create()) end
end

function sling.js.model.UndefinedDataTypeNode:copyTo(o)
	if _g.sling.common.DataTypeNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.UndefinedDataTypeNode')
		if n == nil then
			do return true end
		end
		do return true end
	end
end

function sling.js.model.UndefinedDataTypeNode:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.common.DataTypeNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.UndefinedDataTypeNode:acceptVisitor(visitor)
	if _g.sling.common.DataTypeNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.UndefinedDataTypeNode:destroy()
	do _g.sling.common.DataTypeNode.destroy(self) end
end

sling.js.model.ImportMultipleStaticMembersStatementNode = _g.sling.model.ImportStatementNode._create()
sling.js.model.ImportMultipleStaticMembersStatementNode.__index = sling.js.model.ImportMultipleStaticMembersStatementNode
_vm:set_metatable(sling.js.model.ImportMultipleStaticMembersStatementNode, {
	__index = _g.sling.model.ImportStatementNode
})

sling.js.model.ImportMultipleStaticMembersStatementNode.TYPE_UNKNOWN = 0
sling.js.model.ImportMultipleStaticMembersStatementNode.TYPE_FUNCTION = 1
sling.js.model.ImportMultipleStaticMembersStatementNode.TYPE_CONSTANT = 2

function sling.js.model.ImportMultipleStaticMembersStatementNode._create()
	local v = _vm:set_metatable({}, sling.js.model.ImportMultipleStaticMembersStatementNode)
	return v
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.ImportMultipleStaticMembersStatementNode'
	self['_isType.sling.js.model.ImportMultipleStaticMembersStatementNode'] = true
	self.container = nil
	self.members = nil
	self.defaultExport = nil
	self.type = 0
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:_construct0()
	sling.js.model.ImportMultipleStaticMembersStatementNode._init(self)
	do _g.sling.model.ImportStatementNode._construct0(self) end
	return self
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:getNodeTypeName()
	do return "ImportMultipleStaticMembersStatementNode" end
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:createNew()
	do return _g.sling.js.model.ImportMultipleStaticMembersStatementNode._construct0(_g.sling.js.model.ImportMultipleStaticMembersStatementNode._create()) end
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:copyTo(o)
	if _g.sling.model.ImportStatementNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.ImportMultipleStaticMembersStatementNode')
		if n == nil then
			do return true end
		end
		if n.container ~= nil then
			do n.container:destroy() end
			n.container = nil
		end
		if self.container ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.container), '_isType.sling.model.SymbolNode')
			if pcp == nil then
				do return false end
			end
			n.container = pcp
			do n.container:setParent(n) end
		end
		n.defaultExport = self.defaultExport
		n.type = self.type
		do
			local array = n.members
			if array ~= nil then
				local n2 = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n2 = 0
					while n2 < m do
						local xx = _vm:to_table_with_key(array[n2 + 1], '_isType.sling.common.NodeObject')
						if xx ~= nil then
							do xx:destroy() end
						end
						do n2 = n2 + 1 end
					end
				end
			end
			n.members = nil
			if self.members ~= nil then
				local n3 = 0
				local m2 = _g.jk.lang.Vector:getSize(self.members)
				do
					n3 = 0
					while n3 < m2 do
						local nod = _vm:to_table_with_key(self.members[n3 + 1], '_isType.sling.common.NodeObject')
						if nod ~= nil then
							local ndup = _vm:to_table_with_key(nod:dup(), '_isType.sling.common.NodeObject')
							if ndup == nil then
								do return false end
							end
							if n.members == nil then
								n.members = {}
							end
							do _g.jk.lang.Vector:append(n.members, ndup) end
							do ndup:setParent(n) end
						end
						do n3 = n3 + 1 end
					end
				end
			end
			do return true end
		end
	end
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:replaceChild(oldnode, newnode, doExport)
	if oldnode == self.container then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.model.SymbolNode') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.container:destroy() end
		end
		self.container = _vm:to_table_with_key(newnode, '_isType.sling.model.SymbolNode')
		if self.container ~= nil then
			do self.container:setParent(self) end
		end
		do return true end
	end
	if self:replaceNodeInVector(self.members, oldnode, newnode, doExport) then
		do return true end
	end
	do return _g.sling.model.ImportStatementNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:acceptVisitor(visitor)
	if _g.sling.model.ImportStatementNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self.container ~= nil then
		if self.container:accept(visitor) == false then
			do return false end
		end
	end
	if self:visitVector(self.members, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:destroy()
	do _g.sling.model.ImportStatementNode.destroy(self) end
	if self.container ~= nil then
		do self.container:destroy() end
		self.container = nil
	end
	if self.members ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.members)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.members[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	self.members = nil
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:setContainer(v, doExport)
	if self.container ~= nil and doExport == false then
		do self.container:destroy() end
	end
	self.container = v
	if self.container ~= nil then
		do self.container:setParent(self) end
	end
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:getContainer()
	do return self.container end
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:exportContainer()
	local v = self.container
	self.container = nil
	do return v end
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:setDefaultExport(v)
	self.defaultExport = v
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:getDefaultExport()
	do return self.defaultExport end
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:setType(v)
	self.type = v
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:getType()
	do return self.type end
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:setMembers(v, doExport)
	if self.members ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.members)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.members[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	if v == nil then
		self.members = nil
	else
		self.members = {}
		if v ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(v)
			do
				n2 = 0
				while n2 < m2 do
					local vv = _vm:to_table_with_key(v[n2 + 1], '_isType.sling.common.NodeObject')
					if vv ~= nil then
						do _g.jk.lang.Vector:append(self.members, vv) end
						do vv:setParent(self) end
					end
					do n2 = n2 + 1 end
				end
			end
		end
	end
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:getMembers()
	do return self.members end
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:exportMembers()
	local v = self.members
	self.members = nil
	do return v end
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:addToMembers(v)
	if v == nil then
		do return end
	end
	if self.members == nil then
		self.members = {}
	end
	do _g.jk.lang.Vector:append(self.members, v) end
	do v:setParent(self) end
end

function sling.js.model.ImportMultipleStaticMembersStatementNode:clearMembers()
	if self.members ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.members)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.members[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	self.members = nil
end

sling.js.model.ExportMultipleStaticMembersStatementNode = _g.sling.js.model.ExportStatementNode._create()
sling.js.model.ExportMultipleStaticMembersStatementNode.__index = sling.js.model.ExportMultipleStaticMembersStatementNode
_vm:set_metatable(sling.js.model.ExportMultipleStaticMembersStatementNode, {
	__index = _g.sling.js.model.ExportStatementNode
})

function sling.js.model.ExportMultipleStaticMembersStatementNode._create()
	local v = _vm:set_metatable({}, sling.js.model.ExportMultipleStaticMembersStatementNode)
	return v
end

function sling.js.model.ExportMultipleStaticMembersStatementNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.ExportMultipleStaticMembersStatementNode'
	self['_isType.sling.js.model.ExportMultipleStaticMembersStatementNode'] = true
	self.container = nil
	self.members = nil
end

function sling.js.model.ExportMultipleStaticMembersStatementNode:_construct0()
	sling.js.model.ExportMultipleStaticMembersStatementNode._init(self)
	do _g.sling.js.model.ExportStatementNode._construct0(self) end
	return self
end

function sling.js.model.ExportMultipleStaticMembersStatementNode:getNodeTypeName()
	do return "ExportMultipleStaticMembersStatementNode" end
end

function sling.js.model.ExportMultipleStaticMembersStatementNode:createNew()
	do return _g.sling.js.model.ExportMultipleStaticMembersStatementNode._construct0(_g.sling.js.model.ExportMultipleStaticMembersStatementNode._create()) end
end

function sling.js.model.ExportMultipleStaticMembersStatementNode:copyTo(o)
	if _g.sling.js.model.ExportStatementNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.ExportMultipleStaticMembersStatementNode')
		if n == nil then
			do return true end
		end
		if n.container ~= nil then
			do n.container:destroy() end
			n.container = nil
		end
		if self.container ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.container), '_isType.sling.model.SymbolNode')
			if pcp == nil then
				do return false end
			end
			n.container = pcp
			do n.container:setParent(n) end
		end
		do
			local array = n.members
			if array ~= nil then
				local n2 = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n2 = 0
					while n2 < m do
						local xx = _vm:to_table_with_key(array[n2 + 1], '_isType.sling.common.NodeObject')
						if xx ~= nil then
							do xx:destroy() end
						end
						do n2 = n2 + 1 end
					end
				end
			end
			n.members = nil
			if self.members ~= nil then
				local n3 = 0
				local m2 = _g.jk.lang.Vector:getSize(self.members)
				do
					n3 = 0
					while n3 < m2 do
						local nod = _vm:to_table_with_key(self.members[n3 + 1], '_isType.sling.common.NodeObject')
						if nod ~= nil then
							local ndup = _vm:to_table_with_key(nod:dup(), '_isType.sling.common.NodeObject')
							if ndup == nil then
								do return false end
							end
							if n.members == nil then
								n.members = {}
							end
							do _g.jk.lang.Vector:append(n.members, ndup) end
							do ndup:setParent(n) end
						end
						do n3 = n3 + 1 end
					end
				end
			end
			do return true end
		end
	end
end

function sling.js.model.ExportMultipleStaticMembersStatementNode:replaceChild(oldnode, newnode, doExport)
	if oldnode == self.container then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.model.SymbolNode') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.container:destroy() end
		end
		self.container = _vm:to_table_with_key(newnode, '_isType.sling.model.SymbolNode')
		if self.container ~= nil then
			do self.container:setParent(self) end
		end
		do return true end
	end
	if self:replaceNodeInVector(self.members, oldnode, newnode, doExport) then
		do return true end
	end
	do return _g.sling.js.model.ExportStatementNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.ExportMultipleStaticMembersStatementNode:acceptVisitor(visitor)
	if _g.sling.js.model.ExportStatementNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self.container ~= nil then
		if self.container:accept(visitor) == false then
			do return false end
		end
	end
	if self:visitVector(self.members, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.ExportMultipleStaticMembersStatementNode:destroy()
	do _g.sling.js.model.ExportStatementNode.destroy(self) end
	if self.container ~= nil then
		do self.container:destroy() end
		self.container = nil
	end
	if self.members ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.members)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.members[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	self.members = nil
end

function sling.js.model.ExportMultipleStaticMembersStatementNode:setContainer(v, doExport)
	if self.container ~= nil and doExport == false then
		do self.container:destroy() end
	end
	self.container = v
	if self.container ~= nil then
		do self.container:setParent(self) end
	end
end

function sling.js.model.ExportMultipleStaticMembersStatementNode:getContainer()
	do return self.container end
end

function sling.js.model.ExportMultipleStaticMembersStatementNode:exportContainer()
	local v = self.container
	self.container = nil
	do return v end
end

function sling.js.model.ExportMultipleStaticMembersStatementNode:setMembers(v, doExport)
	if self.members ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.members)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.members[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	if v == nil then
		self.members = nil
	else
		self.members = {}
		if v ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(v)
			do
				n2 = 0
				while n2 < m2 do
					local vv = _vm:to_table_with_key(v[n2 + 1], '_isType.sling.common.NodeObject')
					if vv ~= nil then
						do _g.jk.lang.Vector:append(self.members, vv) end
						do vv:setParent(self) end
					end
					do n2 = n2 + 1 end
				end
			end
		end
	end
end

function sling.js.model.ExportMultipleStaticMembersStatementNode:getMembers()
	do return self.members end
end

function sling.js.model.ExportMultipleStaticMembersStatementNode:exportMembers()
	local v = self.members
	self.members = nil
	do return v end
end

function sling.js.model.ExportMultipleStaticMembersStatementNode:addToMembers(v)
	if v == nil then
		do return end
	end
	if self.members == nil then
		self.members = {}
	end
	do _g.jk.lang.Vector:append(self.members, v) end
	do v:setParent(self) end
end

function sling.js.model.ExportMultipleStaticMembersStatementNode:clearMembers()
	if self.members ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.members)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.members[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	self.members = nil
end

sling.js.model.TemplateLiteralExpressionNode = _g.sling.model.LiteralExpressionNode._create()
sling.js.model.TemplateLiteralExpressionNode.__index = sling.js.model.TemplateLiteralExpressionNode
_vm:set_metatable(sling.js.model.TemplateLiteralExpressionNode, {
	__index = _g.sling.model.LiteralExpressionNode
})

function sling.js.model.TemplateLiteralExpressionNode._create()
	local v = _vm:set_metatable({}, sling.js.model.TemplateLiteralExpressionNode)
	return v
end

function sling.js.model.TemplateLiteralExpressionNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.js.model.TemplateLiteralExpressionNode'
	self['_isType.sling.js.model.TemplateLiteralExpressionNode'] = true
	self.value = nil
	self.tag = nil
end

function sling.js.model.TemplateLiteralExpressionNode:_construct0()
	sling.js.model.TemplateLiteralExpressionNode._init(self)
	do _g.sling.model.LiteralExpressionNode._construct0(self) end
	return self
end

function sling.js.model.TemplateLiteralExpressionNode:forValue(value)
	local v = _g.sling.js.model.TemplateLiteralExpressionNode._construct0(_g.sling.js.model.TemplateLiteralExpressionNode._create())
	do v:setValue(value) end
	do return v end
end

function sling.js.model.TemplateLiteralExpressionNode:getNodeTypeName()
	do return "TemplateLiteralExpressionNode" end
end

function sling.js.model.TemplateLiteralExpressionNode:createNew()
	do return _g.sling.js.model.TemplateLiteralExpressionNode._construct0(_g.sling.js.model.TemplateLiteralExpressionNode._create()) end
end

function sling.js.model.TemplateLiteralExpressionNode:copyTo(o)
	if _g.sling.model.LiteralExpressionNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.js.model.TemplateLiteralExpressionNode')
		if n == nil then
			do return true end
		end
		n.value = self.value
		n.tag = self.tag
		do return true end
	end
end

function sling.js.model.TemplateLiteralExpressionNode:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.model.LiteralExpressionNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.js.model.TemplateLiteralExpressionNode:acceptVisitor(visitor)
	if _g.sling.model.LiteralExpressionNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.js.model.TemplateLiteralExpressionNode:destroy()
	do _g.sling.model.LiteralExpressionNode.destroy(self) end
end

function sling.js.model.TemplateLiteralExpressionNode:setValue(v)
	self.value = v
end

function sling.js.model.TemplateLiteralExpressionNode:getValue()
	do return self.value end
end

function sling.js.model.TemplateLiteralExpressionNode:setTag(v)
	self.tag = v
end

function sling.js.model.TemplateLiteralExpressionNode:getTag()
	do return self.tag end
end
