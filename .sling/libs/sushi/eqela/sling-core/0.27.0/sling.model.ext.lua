sling = sling or {}

sling.model = sling.model or {}

sling.model.ext = sling.model.ext or {}

sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration = _g.sling.common.NodeObject._create()
sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration.__index = sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration
_vm:set_metatable(sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration, {
	__index = _g.sling.common.NodeObject
})

function sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration._create()
	local v = _vm:set_metatable({}, sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration)
	return v
end

function sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration'
	self['_isType.sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration'] = true
	self.path = nil
	self.expression = nil
end

function sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration:_construct0()
	sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration._init(self)
	do _g.sling.common.NodeObject._construct0(self) end
	return self
end

function sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration:getNodeTypeName()
	do return "NSlingWebApiRequestHandlerObjectDeclaration" end
end

function sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration:createNew()
	do return _g.sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration._construct0(_g.sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration._create()) end
end

function sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration:copyTo(o)
	if _g.sling.common.NodeObject.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration')
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
		n.path = self.path
		do return true end
	end
end

function sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration:replaceChild(oldnode, newnode, doExport)
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
	do return _g.sling.common.NodeObject.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration:acceptVisitor(visitor)
	if _g.sling.common.NodeObject.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self.expression ~= nil then
		if self.expression:accept(visitor) == false then
			do return false end
		end
	end
	do return true end
end

function sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration:destroy()
	do _g.sling.common.NodeObject.destroy(self) end
	if self.expression ~= nil then
		do self.expression:destroy() end
		self.expression = nil
	end
end

function sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration:setExpression(v, doExport)
	if self.expression ~= nil and doExport == false then
		do self.expression:destroy() end
	end
	self.expression = v
	if self.expression ~= nil then
		do self.expression:setParent(self) end
	end
end

function sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration:getExpression()
	do return self.expression end
end

function sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration:exportExpression()
	local v = self.expression
	self.expression = nil
	do return v end
end

function sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration:setPath(v)
	self.path = v
end

function sling.model.ext.NSlingWebApiRequestHandlerObjectDeclaration:getPath()
	do return self.path end
end

sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration = _g.sling.model.FunctionDeclarationBaseNode._create()
sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration.__index = sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration
_vm:set_metatable(sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration, {
	__index = _g.sling.model.FunctionDeclarationBaseNode
})

function sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration._create()
	local v = _vm:set_metatable({}, sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration)
	return v
end

function sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration'
	self['_isType.sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration'] = true
	self.method = nil
	self.path = nil
end

function sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration:_construct0()
	sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration._init(self)
	do _g.sling.model.FunctionDeclarationBaseNode._construct0(self) end
	return self
end

function sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration:getNodeTypeName()
	do return "NSlingWebApiRequestHandlerFunctionDeclaration" end
end

function sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration:createNew()
	do return _g.sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration._construct0(_g.sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration._create()) end
end

function sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration:copyTo(o)
	if _g.sling.model.FunctionDeclarationBaseNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration')
		if n == nil then
			do return true end
		end
		n.method = self.method
		n.path = self.path
		do return true end
	end
end

function sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.model.FunctionDeclarationBaseNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration:acceptVisitor(visitor)
	if _g.sling.model.FunctionDeclarationBaseNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration:destroy()
	do _g.sling.model.FunctionDeclarationBaseNode.destroy(self) end
end

function sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration:setMethod(v)
	self.method = v
end

function sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration:getMethod()
	do return self.method end
end

function sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration:setPath(v)
	self.path = v
end

function sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration:getPath()
	do return self.path end
end

sling.model.ext.NSlingWebApiStatement = _g.sling.common.NodeObject._create()
sling.model.ext.NSlingWebApiStatement.__index = sling.model.ext.NSlingWebApiStatement
_vm:set_metatable(sling.model.ext.NSlingWebApiStatement, {
	__index = _g.sling.common.NodeObject
})

function sling.model.ext.NSlingWebApiStatement._create()
	local v = _vm:set_metatable({}, sling.model.ext.NSlingWebApiStatement)
	return v
end

function sling.model.ext.NSlingWebApiStatement:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.model.ext.NSlingWebApiStatement'
	self['_isType.sling.model.ext.NSlingWebApiStatement'] = true
end

function sling.model.ext.NSlingWebApiStatement:_construct0()
	sling.model.ext.NSlingWebApiStatement._init(self)
	do _g.sling.common.NodeObject._construct0(self) end
	return self
end

function sling.model.ext.NSlingWebApiStatement:getNodeTypeName()
	do return "NSlingWebApiStatement" end
end

function sling.model.ext.NSlingWebApiStatement:createNew()
	do return _g.sling.model.ext.NSlingWebApiStatement._construct0(_g.sling.model.ext.NSlingWebApiStatement._create()) end
end

function sling.model.ext.NSlingWebApiStatement:copyTo(o)
	if _g.sling.common.NodeObject.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.model.ext.NSlingWebApiStatement')
		if n == nil then
			do return true end
		end
		do return true end
	end
end

function sling.model.ext.NSlingWebApiStatement:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.common.NodeObject.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.model.ext.NSlingWebApiStatement:acceptVisitor(visitor)
	if _g.sling.common.NodeObject.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.model.ext.NSlingWebApiStatement:destroy()
	do _g.sling.common.NodeObject.destroy(self) end
end

sling.model.ext.NSlingWebApiSampleResponse = _g.sling.model.ext.NSlingWebApiStatement._create()
sling.model.ext.NSlingWebApiSampleResponse.__index = sling.model.ext.NSlingWebApiSampleResponse
_vm:set_metatable(sling.model.ext.NSlingWebApiSampleResponse, {
	__index = _g.sling.model.ext.NSlingWebApiStatement
})

function sling.model.ext.NSlingWebApiSampleResponse._create()
	local v = _vm:set_metatable({}, sling.model.ext.NSlingWebApiSampleResponse)
	return v
end

function sling.model.ext.NSlingWebApiSampleResponse:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.model.ext.NSlingWebApiSampleResponse'
	self['_isType.sling.model.ext.NSlingWebApiSampleResponse'] = true
	self.title = nil
	self.content = nil
end

function sling.model.ext.NSlingWebApiSampleResponse:_construct0()
	sling.model.ext.NSlingWebApiSampleResponse._init(self)
	do _g.sling.model.ext.NSlingWebApiStatement._construct0(self) end
	return self
end

function sling.model.ext.NSlingWebApiSampleResponse:getNodeTypeName()
	do return "NSlingWebApiSampleResponse" end
end

function sling.model.ext.NSlingWebApiSampleResponse:createNew()
	do return _g.sling.model.ext.NSlingWebApiSampleResponse._construct0(_g.sling.model.ext.NSlingWebApiSampleResponse._create()) end
end

function sling.model.ext.NSlingWebApiSampleResponse:copyTo(o)
	if _g.sling.model.ext.NSlingWebApiStatement.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.model.ext.NSlingWebApiSampleResponse')
		if n == nil then
			do return true end
		end
		n.title = self.title
		n.content = self.content
		do return true end
	end
end

function sling.model.ext.NSlingWebApiSampleResponse:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.model.ext.NSlingWebApiStatement.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.model.ext.NSlingWebApiSampleResponse:acceptVisitor(visitor)
	if _g.sling.model.ext.NSlingWebApiStatement.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.model.ext.NSlingWebApiSampleResponse:destroy()
	do _g.sling.model.ext.NSlingWebApiStatement.destroy(self) end
end

function sling.model.ext.NSlingWebApiSampleResponse:setTitle(v)
	self.title = v
end

function sling.model.ext.NSlingWebApiSampleResponse:getTitle()
	do return self.title end
end

function sling.model.ext.NSlingWebApiSampleResponse:setContent(v)
	self.content = v
end

function sling.model.ext.NSlingWebApiSampleResponse:getContent()
	do return self.content end
end

sling.model.ext.NSlingWebApiInPathStatement = _g.sling.model.ext.NSlingWebApiStatement._create()
sling.model.ext.NSlingWebApiInPathStatement.__index = sling.model.ext.NSlingWebApiInPathStatement
_vm:set_metatable(sling.model.ext.NSlingWebApiInPathStatement, {
	__index = _g.sling.model.ext.NSlingWebApiStatement
})

function sling.model.ext.NSlingWebApiInPathStatement._create()
	local v = _vm:set_metatable({}, sling.model.ext.NSlingWebApiInPathStatement)
	return v
end

function sling.model.ext.NSlingWebApiInPathStatement:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.model.ext.NSlingWebApiInPathStatement'
	self['_isType.sling.model.ext.NSlingWebApiInPathStatement'] = true
	self.name = nil
	self.type = nil
	self.description = nil
end

function sling.model.ext.NSlingWebApiInPathStatement:_construct0()
	sling.model.ext.NSlingWebApiInPathStatement._init(self)
	do _g.sling.model.ext.NSlingWebApiStatement._construct0(self) end
	return self
end

function sling.model.ext.NSlingWebApiInPathStatement:getNodeTypeName()
	do return "NSlingWebApiInPathStatement" end
end

function sling.model.ext.NSlingWebApiInPathStatement:createNew()
	do return _g.sling.model.ext.NSlingWebApiInPathStatement._construct0(_g.sling.model.ext.NSlingWebApiInPathStatement._create()) end
end

function sling.model.ext.NSlingWebApiInPathStatement:copyTo(o)
	if _g.sling.model.ext.NSlingWebApiStatement.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.model.ext.NSlingWebApiInPathStatement')
		if n == nil then
			do return true end
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
		n.name = self.name
		n.description = self.description
		do return true end
	end
end

function sling.model.ext.NSlingWebApiInPathStatement:replaceChild(oldnode, newnode, doExport)
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
	do return _g.sling.model.ext.NSlingWebApiStatement.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.model.ext.NSlingWebApiInPathStatement:acceptVisitor(visitor)
	if _g.sling.model.ext.NSlingWebApiStatement.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self.type ~= nil then
		if self.type:accept(visitor) == false then
			do return false end
		end
	end
	do return true end
end

function sling.model.ext.NSlingWebApiInPathStatement:destroy()
	do _g.sling.model.ext.NSlingWebApiStatement.destroy(self) end
	if self.type ~= nil then
		do self.type:destroy() end
		self.type = nil
	end
end

function sling.model.ext.NSlingWebApiInPathStatement:setType(v, doExport)
	if self.type ~= nil and doExport == false then
		do self.type:destroy() end
	end
	self.type = v
	if self.type ~= nil then
		do self.type:setParent(self) end
	end
end

function sling.model.ext.NSlingWebApiInPathStatement:getType()
	do return self.type end
end

function sling.model.ext.NSlingWebApiInPathStatement:exportType()
	local v = self.type
	self.type = nil
	do return v end
end

function sling.model.ext.NSlingWebApiInPathStatement:setName(v)
	self.name = v
end

function sling.model.ext.NSlingWebApiInPathStatement:getName()
	do return self.name end
end

function sling.model.ext.NSlingWebApiInPathStatement:setDescription(v)
	self.description = v
end

function sling.model.ext.NSlingWebApiInPathStatement:getDescription()
	do return self.description end
end

sling.model.ext.NSlingWebApiOutErrorStatement = _g.sling.model.ext.NSlingWebApiStatement._create()
sling.model.ext.NSlingWebApiOutErrorStatement.__index = sling.model.ext.NSlingWebApiOutErrorStatement
_vm:set_metatable(sling.model.ext.NSlingWebApiOutErrorStatement, {
	__index = _g.sling.model.ext.NSlingWebApiStatement
})

function sling.model.ext.NSlingWebApiOutErrorStatement._create()
	local v = _vm:set_metatable({}, sling.model.ext.NSlingWebApiOutErrorStatement)
	return v
end

function sling.model.ext.NSlingWebApiOutErrorStatement:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.model.ext.NSlingWebApiOutErrorStatement'
	self['_isType.sling.model.ext.NSlingWebApiOutErrorStatement'] = true
	self.code = nil
	self.data = nil
end

function sling.model.ext.NSlingWebApiOutErrorStatement:_construct0()
	sling.model.ext.NSlingWebApiOutErrorStatement._init(self)
	do _g.sling.model.ext.NSlingWebApiStatement._construct0(self) end
	return self
end

function sling.model.ext.NSlingWebApiOutErrorStatement:getNodeTypeName()
	do return "NSlingWebApiOutErrorStatement" end
end

function sling.model.ext.NSlingWebApiOutErrorStatement:createNew()
	do return _g.sling.model.ext.NSlingWebApiOutErrorStatement._construct0(_g.sling.model.ext.NSlingWebApiOutErrorStatement._create()) end
end

function sling.model.ext.NSlingWebApiOutErrorStatement:copyTo(o)
	if _g.sling.model.ext.NSlingWebApiStatement.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.model.ext.NSlingWebApiOutErrorStatement')
		if n == nil then
			do return true end
		end
		if n.code ~= nil then
			do n.code:destroy() end
			n.code = nil
		end
		if self.code ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.code), '_isType.sling.model.ExpressionNode')
			if pcp == nil then
				do return false end
			end
			n.code = pcp
			do n.code:setParent(n) end
		end
		if n.data ~= nil then
			do n.data:destroy() end
			n.data = nil
		end
		if self.data ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.data), '_isType.sling.model.ExpressionNode')
			if pcp == nil then
				do return false end
			end
			n.data = pcp
			do n.data:setParent(n) end
		end
		do return true end
	end
end

function sling.model.ext.NSlingWebApiOutErrorStatement:replaceChild(oldnode, newnode, doExport)
	if oldnode == self.code then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.code:destroy() end
		end
		self.code = _vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode')
		if self.code ~= nil then
			do self.code:setParent(self) end
		end
		do return true end
	end
	if oldnode == self.data then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.data:destroy() end
		end
		self.data = _vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode')
		if self.data ~= nil then
			do self.data:setParent(self) end
		end
		do return true end
	end
	do return _g.sling.model.ext.NSlingWebApiStatement.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.model.ext.NSlingWebApiOutErrorStatement:acceptVisitor(visitor)
	if _g.sling.model.ext.NSlingWebApiStatement.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self.code ~= nil then
		if self.code:accept(visitor) == false then
			do return false end
		end
	end
	if self.data ~= nil then
		if self.data:accept(visitor) == false then
			do return false end
		end
	end
	do return true end
end

function sling.model.ext.NSlingWebApiOutErrorStatement:destroy()
	do _g.sling.model.ext.NSlingWebApiStatement.destroy(self) end
	if self.code ~= nil then
		do self.code:destroy() end
		self.code = nil
	end
	if self.data ~= nil then
		do self.data:destroy() end
		self.data = nil
	end
end

function sling.model.ext.NSlingWebApiOutErrorStatement:setCode(v, doExport)
	if self.code ~= nil and doExport == false then
		do self.code:destroy() end
	end
	self.code = v
	if self.code ~= nil then
		do self.code:setParent(self) end
	end
end

function sling.model.ext.NSlingWebApiOutErrorStatement:getCode()
	do return self.code end
end

function sling.model.ext.NSlingWebApiOutErrorStatement:exportCode()
	local v = self.code
	self.code = nil
	do return v end
end

function sling.model.ext.NSlingWebApiOutErrorStatement:setData(v, doExport)
	if self.data ~= nil and doExport == false then
		do self.data:destroy() end
	end
	self.data = v
	if self.data ~= nil then
		do self.data:setParent(self) end
	end
end

function sling.model.ext.NSlingWebApiOutErrorStatement:getData()
	do return self.data end
end

function sling.model.ext.NSlingWebApiOutErrorStatement:exportData()
	local v = self.data
	self.data = nil
	do return v end
end

sling.model.ext.NSlingUnitSettings = _g.sling.common.CodeUnitSettingsNode._create()
sling.model.ext.NSlingUnitSettings.__index = sling.model.ext.NSlingUnitSettings
_vm:set_metatable(sling.model.ext.NSlingUnitSettings, {
	__index = _g.sling.common.CodeUnitSettingsNode
})

function sling.model.ext.NSlingUnitSettings._create()
	local v = _vm:set_metatable({}, sling.model.ext.NSlingUnitSettings)
	return v
end

function sling.model.ext.NSlingUnitSettings:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.model.ext.NSlingUnitSettings'
	self['_isType.sling.model.ext.NSlingUnitSettings'] = true
	self.isMainUnit = false
	self.vendorId = nil
	self.projectVersion = nil
	self.projectId = nil
	self.projectTitle = nil
	self.projectDescription = nil
	self.projectCopyright = nil
	self.projectLicense = nil
	self.moduleId = nil
	self.moduleTitle = nil
	self.moduleDescription = nil
	self.useJkop = false
	self.imports = nil
	self.resources = nil
	self.defines = nil
	self.ignoreModuleIdInNamespace = false
	self.libraries = nil
	self.androidProjectId = nil
	self.androidVersion = nil
	self.androidPackageName = nil
	self.androidMinSdkVersion = 0
	self.androidTargetSdkVersion = 0
	self.androidToolsVersion = nil
	self.androidGradlePluginVersion = nil
	self.androidKotlinVersion = nil
	self.androidEnableAndroidJackForLibraries = false
	self.androidKeyStore = nil
	self.androidKeyStorePassword = nil
	self.androidKeyAlias = nil
	self.androidKeyAliasPassword = nil
	self.androidGoogleServicesVersion = nil
	self.androidMetaData = nil
	self.androidManifestCustomXmls = nil
	self.androidManifestApplicationCustomXmls = nil
	self.androidPermissions = nil
	self.androidFeatures = nil
	self.androidGradleDepends = nil
	self.androidGradleHeap = nil
	self.iosProjectName = nil
	self.iosVersion = nil
	self.iosDisplayName = nil
	self.iosCflags = nil
	self.iosLinkMethod = nil
	self.iosDeploymentTarget = nil
	self.iosResultType = nil
	self.iosPods = nil
	self.iosFrameworks = nil
	self.iosLinkLibs = nil
	self.iosLdFlags = nil
	self.iosPlists = nil
	self.iosInfoPlistData = nil
	self.iosScreenOrientation = nil
	self.mavenArtifactId = nil
	self.mavenGroupId = nil
	self.mavenVersion = nil
	self.mavenName = nil
	self.npmPackageJson = nil
	self.npmAngularJson = nil
	self.npmTsconfigJson = nil
	self.npmTslintJson = nil
end

function sling.model.ext.NSlingUnitSettings:_construct0()
	sling.model.ext.NSlingUnitSettings._init(self)
	do _g.sling.common.CodeUnitSettingsNode._construct0(self) end
	return self
end

function sling.model.ext.NSlingUnitSettings:getNodeTypeName()
	do return "NSlingUnitSettings" end
end

function sling.model.ext.NSlingUnitSettings:createNew()
	do return _g.sling.model.ext.NSlingUnitSettings._construct0(_g.sling.model.ext.NSlingUnitSettings._create()) end
end

function sling.model.ext.NSlingUnitSettings:copyTo(o)
	if _g.sling.common.CodeUnitSettingsNode.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.model.ext.NSlingUnitSettings')
		if n == nil then
			do return true end
		end
		n.isMainUnit = self.isMainUnit
		n.vendorId = self.vendorId
		n.projectVersion = self.projectVersion
		n.projectId = self.projectId
		n.projectTitle = self.projectTitle
		n.projectDescription = self.projectDescription
		n.projectCopyright = self.projectCopyright
		n.projectLicense = self.projectLicense
		n.moduleId = self.moduleId
		n.moduleTitle = self.moduleTitle
		n.moduleDescription = self.moduleDescription
		n.useJkop = self.useJkop
		n.defines = self.defines
		n.ignoreModuleIdInNamespace = self.ignoreModuleIdInNamespace
		n.androidProjectId = self.androidProjectId
		n.androidVersion = self.androidVersion
		n.androidPackageName = self.androidPackageName
		n.androidMinSdkVersion = self.androidMinSdkVersion
		n.androidTargetSdkVersion = self.androidTargetSdkVersion
		n.androidToolsVersion = self.androidToolsVersion
		n.androidGradlePluginVersion = self.androidGradlePluginVersion
		n.androidKotlinVersion = self.androidKotlinVersion
		n.androidEnableAndroidJackForLibraries = self.androidEnableAndroidJackForLibraries
		n.androidKeyStore = self.androidKeyStore
		n.androidKeyStorePassword = self.androidKeyStorePassword
		n.androidKeyAlias = self.androidKeyAlias
		n.androidKeyAliasPassword = self.androidKeyAliasPassword
		n.androidGoogleServicesVersion = self.androidGoogleServicesVersion
		n.androidMetaData = self.androidMetaData
		n.androidGradleHeap = self.androidGradleHeap
		n.iosProjectName = self.iosProjectName
		n.iosVersion = self.iosVersion
		n.iosDisplayName = self.iosDisplayName
		n.iosCflags = self.iosCflags
		n.iosLinkMethod = self.iosLinkMethod
		n.iosDeploymentTarget = self.iosDeploymentTarget
		n.iosResultType = self.iosResultType
		n.iosScreenOrientation = self.iosScreenOrientation
		n.mavenArtifactId = self.mavenArtifactId
		n.mavenGroupId = self.mavenGroupId
		n.mavenVersion = self.mavenVersion
		n.mavenName = self.mavenName
		n.npmPackageJson = self.npmPackageJson
		n.npmAngularJson = self.npmAngularJson
		n.npmTsconfigJson = self.npmTsconfigJson
		n.npmTslintJson = self.npmTslintJson
		n.imports = {}
		if self.imports ~= nil then
			local n2 = 0
			local m = _g.jk.lang.Vector:getSize(self.imports)
			do
				n2 = 0
				while n2 < m do
					local value = self.imports[n2 + 1]
					if value ~= nil then
						do _g.jk.lang.Vector:append(n.imports, value) end
					end
					do n2 = n2 + 1 end
				end
			end
		end
		do
			local array = n.resources
			if array ~= nil then
				local n3 = 0
				local m2 = _g.jk.lang.Vector:getSize(array)
				do
					n3 = 0
					while n3 < m2 do
						local xx = _vm:to_table_with_key(array[n3 + 1], '_isType.sling.common.NodeObject')
						if xx ~= nil then
							do xx:destroy() end
						end
						do n3 = n3 + 1 end
					end
				end
			end
			n.resources = nil
			if self.resources ~= nil then
				local n4 = 0
				local m3 = _g.jk.lang.Vector:getSize(self.resources)
				do
					n4 = 0
					while n4 < m3 do
						local nod = _vm:to_table_with_key(self.resources[n4 + 1], '_isType.sling.common.NodeObject')
						if nod ~= nil then
							local ndup = _vm:to_table_with_key(nod:dup(), '_isType.sling.common.NodeObject')
							if ndup == nil then
								do return false end
							end
							if n.resources == nil then
								n.resources = {}
							end
							do _g.jk.lang.Vector:append(n.resources, ndup) end
							do ndup:setParent(n) end
						end
						do n4 = n4 + 1 end
					end
				end
			end
			n.libraries = {}
			if self.libraries ~= nil then
				local n5 = 0
				local m4 = _g.jk.lang.Vector:getSize(self.libraries)
				do
					n5 = 0
					while n5 < m4 do
						local value = self.libraries[n5 + 1]
						if value ~= nil then
							do _g.jk.lang.Vector:append(n.libraries, value) end
						end
						do n5 = n5 + 1 end
					end
				end
			end
			n.androidManifestCustomXmls = {}
			if self.androidManifestCustomXmls ~= nil then
				local n6 = 0
				local m5 = _g.jk.lang.Vector:getSize(self.androidManifestCustomXmls)
				do
					n6 = 0
					while n6 < m5 do
						local value = self.androidManifestCustomXmls[n6 + 1]
						if value ~= nil then
							do _g.jk.lang.Vector:append(n.androidManifestCustomXmls, value) end
						end
						do n6 = n6 + 1 end
					end
				end
			end
			n.androidManifestApplicationCustomXmls = {}
			if self.androidManifestApplicationCustomXmls ~= nil then
				local n7 = 0
				local m6 = _g.jk.lang.Vector:getSize(self.androidManifestApplicationCustomXmls)
				do
					n7 = 0
					while n7 < m6 do
						local value = self.androidManifestApplicationCustomXmls[n7 + 1]
						if value ~= nil then
							do _g.jk.lang.Vector:append(n.androidManifestApplicationCustomXmls, value) end
						end
						do n7 = n7 + 1 end
					end
				end
			end
			n.androidPermissions = {}
			if self.androidPermissions ~= nil then
				local n8 = 0
				local m7 = _g.jk.lang.Vector:getSize(self.androidPermissions)
				do
					n8 = 0
					while n8 < m7 do
						local value = self.androidPermissions[n8 + 1]
						if value ~= nil then
							do _g.jk.lang.Vector:append(n.androidPermissions, value) end
						end
						do n8 = n8 + 1 end
					end
				end
			end
			n.androidFeatures = {}
			if self.androidFeatures ~= nil then
				local n9 = 0
				local m8 = _g.jk.lang.Vector:getSize(self.androidFeatures)
				do
					n9 = 0
					while n9 < m8 do
						local value = self.androidFeatures[n9 + 1]
						if value ~= nil then
							do _g.jk.lang.Vector:append(n.androidFeatures, value) end
						end
						do n9 = n9 + 1 end
					end
				end
			end
			n.androidGradleDepends = {}
			if self.androidGradleDepends ~= nil then
				local n10 = 0
				local m9 = _g.jk.lang.Vector:getSize(self.androidGradleDepends)
				do
					n10 = 0
					while n10 < m9 do
						local value = self.androidGradleDepends[n10 + 1]
						if value ~= nil then
							do _g.jk.lang.Vector:append(n.androidGradleDepends, value) end
						end
						do n10 = n10 + 1 end
					end
				end
			end
			n.iosPods = {}
			if self.iosPods ~= nil then
				local n11 = 0
				local m10 = _g.jk.lang.Vector:getSize(self.iosPods)
				do
					n11 = 0
					while n11 < m10 do
						local value = self.iosPods[n11 + 1]
						if value ~= nil then
							do _g.jk.lang.Vector:append(n.iosPods, value) end
						end
						do n11 = n11 + 1 end
					end
				end
			end
			n.iosFrameworks = {}
			if self.iosFrameworks ~= nil then
				local n12 = 0
				local m11 = _g.jk.lang.Vector:getSize(self.iosFrameworks)
				do
					n12 = 0
					while n12 < m11 do
						local value = self.iosFrameworks[n12 + 1]
						if value ~= nil then
							do _g.jk.lang.Vector:append(n.iosFrameworks, value) end
						end
						do n12 = n12 + 1 end
					end
				end
			end
			n.iosLinkLibs = {}
			if self.iosLinkLibs ~= nil then
				local n13 = 0
				local m12 = _g.jk.lang.Vector:getSize(self.iosLinkLibs)
				do
					n13 = 0
					while n13 < m12 do
						local value = self.iosLinkLibs[n13 + 1]
						if value ~= nil then
							do _g.jk.lang.Vector:append(n.iosLinkLibs, value) end
						end
						do n13 = n13 + 1 end
					end
				end
			end
			n.iosLdFlags = {}
			if self.iosLdFlags ~= nil then
				local n14 = 0
				local m13 = _g.jk.lang.Vector:getSize(self.iosLdFlags)
				do
					n14 = 0
					while n14 < m13 do
						local value = self.iosLdFlags[n14 + 1]
						if value ~= nil then
							do _g.jk.lang.Vector:append(n.iosLdFlags, value) end
						end
						do n14 = n14 + 1 end
					end
				end
			end
			n.iosPlists = {}
			if self.iosPlists ~= nil then
				local n15 = 0
				local m14 = _g.jk.lang.Vector:getSize(self.iosPlists)
				do
					n15 = 0
					while n15 < m14 do
						local value = self.iosPlists[n15 + 1]
						if value ~= nil then
							do _g.jk.lang.Vector:append(n.iosPlists, value) end
						end
						do n15 = n15 + 1 end
					end
				end
			end
			n.iosInfoPlistData = {}
			if self.iosInfoPlistData ~= nil then
				local n16 = 0
				local m15 = _g.jk.lang.Vector:getSize(self.iosInfoPlistData)
				do
					n16 = 0
					while n16 < m15 do
						local value = self.iosInfoPlistData[n16 + 1]
						if value ~= nil then
							do _g.jk.lang.Vector:append(n.iosInfoPlistData, value) end
						end
						do n16 = n16 + 1 end
					end
				end
			end
			do return true end
		end
	end
end

function sling.model.ext.NSlingUnitSettings:replaceChild(oldnode, newnode, doExport)
	if self:replaceNodeInVector(self.resources, oldnode, newnode, doExport) then
		do return true end
	end
	do return _g.sling.common.CodeUnitSettingsNode.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.model.ext.NSlingUnitSettings:acceptVisitor(visitor)
	if _g.sling.common.CodeUnitSettingsNode.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self:visitVector(self.resources, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.model.ext.NSlingUnitSettings:destroy()
	do _g.sling.common.CodeUnitSettingsNode.destroy(self) end
	if self.resources ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.resources)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.resources[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	self.resources = nil
end

function sling.model.ext.NSlingUnitSettings:setIsMainUnit(v)
	self.isMainUnit = v
end

function sling.model.ext.NSlingUnitSettings:getIsMainUnit()
	do return self.isMainUnit end
end

function sling.model.ext.NSlingUnitSettings:setVendorId(v)
	self.vendorId = v
end

function sling.model.ext.NSlingUnitSettings:getVendorId()
	do return self.vendorId end
end

function sling.model.ext.NSlingUnitSettings:setProjectVersion(v)
	self.projectVersion = v
end

function sling.model.ext.NSlingUnitSettings:getProjectVersion()
	do return self.projectVersion end
end

function sling.model.ext.NSlingUnitSettings:setProjectId(v)
	self.projectId = v
end

function sling.model.ext.NSlingUnitSettings:getProjectId()
	do return self.projectId end
end

function sling.model.ext.NSlingUnitSettings:setProjectTitle(v)
	self.projectTitle = v
end

function sling.model.ext.NSlingUnitSettings:getProjectTitle()
	do return self.projectTitle end
end

function sling.model.ext.NSlingUnitSettings:setProjectDescription(v)
	self.projectDescription = v
end

function sling.model.ext.NSlingUnitSettings:getProjectDescription()
	do return self.projectDescription end
end

function sling.model.ext.NSlingUnitSettings:setProjectCopyright(v)
	self.projectCopyright = v
end

function sling.model.ext.NSlingUnitSettings:getProjectCopyright()
	do return self.projectCopyright end
end

function sling.model.ext.NSlingUnitSettings:setProjectLicense(v)
	self.projectLicense = v
end

function sling.model.ext.NSlingUnitSettings:getProjectLicense()
	do return self.projectLicense end
end

function sling.model.ext.NSlingUnitSettings:setModuleId(v)
	self.moduleId = v
end

function sling.model.ext.NSlingUnitSettings:getModuleId()
	do return self.moduleId end
end

function sling.model.ext.NSlingUnitSettings:setModuleTitle(v)
	self.moduleTitle = v
end

function sling.model.ext.NSlingUnitSettings:getModuleTitle()
	do return self.moduleTitle end
end

function sling.model.ext.NSlingUnitSettings:setModuleDescription(v)
	self.moduleDescription = v
end

function sling.model.ext.NSlingUnitSettings:getModuleDescription()
	do return self.moduleDescription end
end

function sling.model.ext.NSlingUnitSettings:setUseJkop(v)
	self.useJkop = v
end

function sling.model.ext.NSlingUnitSettings:getUseJkop()
	do return self.useJkop end
end

function sling.model.ext.NSlingUnitSettings:setDefines(v)
	self.defines = v
end

function sling.model.ext.NSlingUnitSettings:getDefines()
	do return self.defines end
end

function sling.model.ext.NSlingUnitSettings:setIgnoreModuleIdInNamespace(v)
	self.ignoreModuleIdInNamespace = v
end

function sling.model.ext.NSlingUnitSettings:getIgnoreModuleIdInNamespace()
	do return self.ignoreModuleIdInNamespace end
end

function sling.model.ext.NSlingUnitSettings:setAndroidProjectId(v)
	self.androidProjectId = v
end

function sling.model.ext.NSlingUnitSettings:getAndroidProjectId()
	do return self.androidProjectId end
end

function sling.model.ext.NSlingUnitSettings:setAndroidVersion(v)
	self.androidVersion = v
end

function sling.model.ext.NSlingUnitSettings:getAndroidVersion()
	do return self.androidVersion end
end

function sling.model.ext.NSlingUnitSettings:setAndroidPackageName(v)
	self.androidPackageName = v
end

function sling.model.ext.NSlingUnitSettings:getAndroidPackageName()
	do return self.androidPackageName end
end

function sling.model.ext.NSlingUnitSettings:setAndroidMinSdkVersion(v)
	self.androidMinSdkVersion = v
end

function sling.model.ext.NSlingUnitSettings:getAndroidMinSdkVersion()
	do return self.androidMinSdkVersion end
end

function sling.model.ext.NSlingUnitSettings:setAndroidTargetSdkVersion(v)
	self.androidTargetSdkVersion = v
end

function sling.model.ext.NSlingUnitSettings:getAndroidTargetSdkVersion()
	do return self.androidTargetSdkVersion end
end

function sling.model.ext.NSlingUnitSettings:setAndroidToolsVersion(v)
	self.androidToolsVersion = v
end

function sling.model.ext.NSlingUnitSettings:getAndroidToolsVersion()
	do return self.androidToolsVersion end
end

function sling.model.ext.NSlingUnitSettings:setAndroidGradlePluginVersion(v)
	self.androidGradlePluginVersion = v
end

function sling.model.ext.NSlingUnitSettings:getAndroidGradlePluginVersion()
	do return self.androidGradlePluginVersion end
end

function sling.model.ext.NSlingUnitSettings:setAndroidKotlinVersion(v)
	self.androidKotlinVersion = v
end

function sling.model.ext.NSlingUnitSettings:getAndroidKotlinVersion()
	do return self.androidKotlinVersion end
end

function sling.model.ext.NSlingUnitSettings:setAndroidEnableAndroidJackForLibraries(v)
	self.androidEnableAndroidJackForLibraries = v
end

function sling.model.ext.NSlingUnitSettings:getAndroidEnableAndroidJackForLibraries()
	do return self.androidEnableAndroidJackForLibraries end
end

function sling.model.ext.NSlingUnitSettings:setAndroidKeyStore(v)
	self.androidKeyStore = v
end

function sling.model.ext.NSlingUnitSettings:getAndroidKeyStore()
	do return self.androidKeyStore end
end

function sling.model.ext.NSlingUnitSettings:setAndroidKeyStorePassword(v)
	self.androidKeyStorePassword = v
end

function sling.model.ext.NSlingUnitSettings:getAndroidKeyStorePassword()
	do return self.androidKeyStorePassword end
end

function sling.model.ext.NSlingUnitSettings:setAndroidKeyAlias(v)
	self.androidKeyAlias = v
end

function sling.model.ext.NSlingUnitSettings:getAndroidKeyAlias()
	do return self.androidKeyAlias end
end

function sling.model.ext.NSlingUnitSettings:setAndroidKeyAliasPassword(v)
	self.androidKeyAliasPassword = v
end

function sling.model.ext.NSlingUnitSettings:getAndroidKeyAliasPassword()
	do return self.androidKeyAliasPassword end
end

function sling.model.ext.NSlingUnitSettings:setAndroidGoogleServicesVersion(v)
	self.androidGoogleServicesVersion = v
end

function sling.model.ext.NSlingUnitSettings:getAndroidGoogleServicesVersion()
	do return self.androidGoogleServicesVersion end
end

function sling.model.ext.NSlingUnitSettings:setAndroidMetaData(v)
	self.androidMetaData = v
end

function sling.model.ext.NSlingUnitSettings:getAndroidMetaData()
	do return self.androidMetaData end
end

function sling.model.ext.NSlingUnitSettings:setAndroidGradleHeap(v)
	self.androidGradleHeap = v
end

function sling.model.ext.NSlingUnitSettings:getAndroidGradleHeap()
	do return self.androidGradleHeap end
end

function sling.model.ext.NSlingUnitSettings:setIosProjectName(v)
	self.iosProjectName = v
end

function sling.model.ext.NSlingUnitSettings:getIosProjectName()
	do return self.iosProjectName end
end

function sling.model.ext.NSlingUnitSettings:setIosVersion(v)
	self.iosVersion = v
end

function sling.model.ext.NSlingUnitSettings:getIosVersion()
	do return self.iosVersion end
end

function sling.model.ext.NSlingUnitSettings:setIosDisplayName(v)
	self.iosDisplayName = v
end

function sling.model.ext.NSlingUnitSettings:getIosDisplayName()
	do return self.iosDisplayName end
end

function sling.model.ext.NSlingUnitSettings:setIosCflags(v)
	self.iosCflags = v
end

function sling.model.ext.NSlingUnitSettings:getIosCflags()
	do return self.iosCflags end
end

function sling.model.ext.NSlingUnitSettings:setIosLinkMethod(v)
	self.iosLinkMethod = v
end

function sling.model.ext.NSlingUnitSettings:getIosLinkMethod()
	do return self.iosLinkMethod end
end

function sling.model.ext.NSlingUnitSettings:setIosDeploymentTarget(v)
	self.iosDeploymentTarget = v
end

function sling.model.ext.NSlingUnitSettings:getIosDeploymentTarget()
	do return self.iosDeploymentTarget end
end

function sling.model.ext.NSlingUnitSettings:setIosResultType(v)
	self.iosResultType = v
end

function sling.model.ext.NSlingUnitSettings:getIosResultType()
	do return self.iosResultType end
end

function sling.model.ext.NSlingUnitSettings:setIosScreenOrientation(v)
	self.iosScreenOrientation = v
end

function sling.model.ext.NSlingUnitSettings:getIosScreenOrientation()
	do return self.iosScreenOrientation end
end

function sling.model.ext.NSlingUnitSettings:setMavenArtifactId(v)
	self.mavenArtifactId = v
end

function sling.model.ext.NSlingUnitSettings:getMavenArtifactId()
	do return self.mavenArtifactId end
end

function sling.model.ext.NSlingUnitSettings:setMavenGroupId(v)
	self.mavenGroupId = v
end

function sling.model.ext.NSlingUnitSettings:getMavenGroupId()
	do return self.mavenGroupId end
end

function sling.model.ext.NSlingUnitSettings:setMavenVersion(v)
	self.mavenVersion = v
end

function sling.model.ext.NSlingUnitSettings:getMavenVersion()
	do return self.mavenVersion end
end

function sling.model.ext.NSlingUnitSettings:setMavenName(v)
	self.mavenName = v
end

function sling.model.ext.NSlingUnitSettings:getMavenName()
	do return self.mavenName end
end

function sling.model.ext.NSlingUnitSettings:setNpmPackageJson(v)
	self.npmPackageJson = v
end

function sling.model.ext.NSlingUnitSettings:getNpmPackageJson()
	do return self.npmPackageJson end
end

function sling.model.ext.NSlingUnitSettings:setNpmAngularJson(v)
	self.npmAngularJson = v
end

function sling.model.ext.NSlingUnitSettings:getNpmAngularJson()
	do return self.npmAngularJson end
end

function sling.model.ext.NSlingUnitSettings:setNpmTsconfigJson(v)
	self.npmTsconfigJson = v
end

function sling.model.ext.NSlingUnitSettings:getNpmTsconfigJson()
	do return self.npmTsconfigJson end
end

function sling.model.ext.NSlingUnitSettings:setNpmTslintJson(v)
	self.npmTslintJson = v
end

function sling.model.ext.NSlingUnitSettings:getNpmTslintJson()
	do return self.npmTslintJson end
end

function sling.model.ext.NSlingUnitSettings:setImports(v)
	self.imports = {}
	if v ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(v)
		do
			n = 0
			while n < m do
				local value = v[n + 1]
				if value ~= nil then
					do _g.jk.lang.Vector:append(self.imports, value) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.model.ext.NSlingUnitSettings:getImports()
	do return self.imports end
end

function sling.model.ext.NSlingUnitSettings:addToImports(v)
	if v == nil then
		do return end
	end
	if self.imports == nil then
		self.imports = {}
	end
	do _g.jk.lang.Vector:append(self.imports, v) end
end

function sling.model.ext.NSlingUnitSettings:clearImports()
	self.imports = nil
end

function sling.model.ext.NSlingUnitSettings:setResources(v, doExport)
	if self.resources ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.resources)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.resources[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	if v == nil then
		self.resources = nil
	else
		self.resources = {}
		if v ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(v)
			do
				n2 = 0
				while n2 < m2 do
					local vv = _vm:to_table_with_key(v[n2 + 1], '_isType.sling.common.NodeObject')
					if vv ~= nil then
						do _g.jk.lang.Vector:append(self.resources, vv) end
						do vv:setParent(self) end
					end
					do n2 = n2 + 1 end
				end
			end
		end
	end
end

function sling.model.ext.NSlingUnitSettings:getResources()
	do return self.resources end
end

function sling.model.ext.NSlingUnitSettings:exportResources()
	local v = self.resources
	self.resources = nil
	do return v end
end

function sling.model.ext.NSlingUnitSettings:addToResources(v)
	if v == nil then
		do return end
	end
	if self.resources == nil then
		self.resources = {}
	end
	do _g.jk.lang.Vector:append(self.resources, v) end
	do v:setParent(self) end
end

function sling.model.ext.NSlingUnitSettings:clearResources()
	if self.resources ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.resources)
		do
			n = 0
			while n < m do
				local nx = _vm:to_table_with_key(self.resources[n + 1], '_isType.sling.common.NodeObject')
				if nx ~= nil then
					do nx:destroy() end
				end
				do n = n + 1 end
			end
		end
	end
	self.resources = nil
end

function sling.model.ext.NSlingUnitSettings:setLibraries(v)
	self.libraries = {}
	if v ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(v)
		do
			n = 0
			while n < m do
				local value = v[n + 1]
				if value ~= nil then
					do _g.jk.lang.Vector:append(self.libraries, value) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.model.ext.NSlingUnitSettings:getLibraries()
	do return self.libraries end
end

function sling.model.ext.NSlingUnitSettings:addToLibraries(v)
	if v == nil then
		do return end
	end
	if self.libraries == nil then
		self.libraries = {}
	end
	do _g.jk.lang.Vector:append(self.libraries, v) end
end

function sling.model.ext.NSlingUnitSettings:clearLibraries()
	self.libraries = nil
end

function sling.model.ext.NSlingUnitSettings:setAndroidManifestCustomXmls(v)
	self.androidManifestCustomXmls = {}
	if v ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(v)
		do
			n = 0
			while n < m do
				local value = v[n + 1]
				if value ~= nil then
					do _g.jk.lang.Vector:append(self.androidManifestCustomXmls, value) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.model.ext.NSlingUnitSettings:getAndroidManifestCustomXmls()
	do return self.androidManifestCustomXmls end
end

function sling.model.ext.NSlingUnitSettings:addToAndroidManifestCustomXmls(v)
	if v == nil then
		do return end
	end
	if self.androidManifestCustomXmls == nil then
		self.androidManifestCustomXmls = {}
	end
	do _g.jk.lang.Vector:append(self.androidManifestCustomXmls, v) end
end

function sling.model.ext.NSlingUnitSettings:clearAndroidManifestCustomXmls()
	self.androidManifestCustomXmls = nil
end

function sling.model.ext.NSlingUnitSettings:setAndroidManifestApplicationCustomXmls(v)
	self.androidManifestApplicationCustomXmls = {}
	if v ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(v)
		do
			n = 0
			while n < m do
				local value = v[n + 1]
				if value ~= nil then
					do _g.jk.lang.Vector:append(self.androidManifestApplicationCustomXmls, value) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.model.ext.NSlingUnitSettings:getAndroidManifestApplicationCustomXmls()
	do return self.androidManifestApplicationCustomXmls end
end

function sling.model.ext.NSlingUnitSettings:addToAndroidManifestApplicationCustomXmls(v)
	if v == nil then
		do return end
	end
	if self.androidManifestApplicationCustomXmls == nil then
		self.androidManifestApplicationCustomXmls = {}
	end
	do _g.jk.lang.Vector:append(self.androidManifestApplicationCustomXmls, v) end
end

function sling.model.ext.NSlingUnitSettings:clearAndroidManifestApplicationCustomXmls()
	self.androidManifestApplicationCustomXmls = nil
end

function sling.model.ext.NSlingUnitSettings:setAndroidPermissions(v)
	self.androidPermissions = {}
	if v ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(v)
		do
			n = 0
			while n < m do
				local value = v[n + 1]
				if value ~= nil then
					do _g.jk.lang.Vector:append(self.androidPermissions, value) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.model.ext.NSlingUnitSettings:getAndroidPermissions()
	do return self.androidPermissions end
end

function sling.model.ext.NSlingUnitSettings:addToAndroidPermissions(v)
	if v == nil then
		do return end
	end
	if self.androidPermissions == nil then
		self.androidPermissions = {}
	end
	do _g.jk.lang.Vector:append(self.androidPermissions, v) end
end

function sling.model.ext.NSlingUnitSettings:clearAndroidPermissions()
	self.androidPermissions = nil
end

function sling.model.ext.NSlingUnitSettings:setAndroidFeatures(v)
	self.androidFeatures = {}
	if v ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(v)
		do
			n = 0
			while n < m do
				local value = v[n + 1]
				if value ~= nil then
					do _g.jk.lang.Vector:append(self.androidFeatures, value) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.model.ext.NSlingUnitSettings:getAndroidFeatures()
	do return self.androidFeatures end
end

function sling.model.ext.NSlingUnitSettings:addToAndroidFeatures(v)
	if v == nil then
		do return end
	end
	if self.androidFeatures == nil then
		self.androidFeatures = {}
	end
	do _g.jk.lang.Vector:append(self.androidFeatures, v) end
end

function sling.model.ext.NSlingUnitSettings:clearAndroidFeatures()
	self.androidFeatures = nil
end

function sling.model.ext.NSlingUnitSettings:setAndroidGradleDepends(v)
	self.androidGradleDepends = {}
	if v ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(v)
		do
			n = 0
			while n < m do
				local value = v[n + 1]
				if value ~= nil then
					do _g.jk.lang.Vector:append(self.androidGradleDepends, value) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.model.ext.NSlingUnitSettings:getAndroidGradleDepends()
	do return self.androidGradleDepends end
end

function sling.model.ext.NSlingUnitSettings:addToAndroidGradleDepends(v)
	if v == nil then
		do return end
	end
	if self.androidGradleDepends == nil then
		self.androidGradleDepends = {}
	end
	do _g.jk.lang.Vector:append(self.androidGradleDepends, v) end
end

function sling.model.ext.NSlingUnitSettings:clearAndroidGradleDepends()
	self.androidGradleDepends = nil
end

function sling.model.ext.NSlingUnitSettings:setIosPods(v)
	self.iosPods = {}
	if v ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(v)
		do
			n = 0
			while n < m do
				local value = v[n + 1]
				if value ~= nil then
					do _g.jk.lang.Vector:append(self.iosPods, value) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.model.ext.NSlingUnitSettings:getIosPods()
	do return self.iosPods end
end

function sling.model.ext.NSlingUnitSettings:addToIosPods(v)
	if v == nil then
		do return end
	end
	if self.iosPods == nil then
		self.iosPods = {}
	end
	do _g.jk.lang.Vector:append(self.iosPods, v) end
end

function sling.model.ext.NSlingUnitSettings:clearIosPods()
	self.iosPods = nil
end

function sling.model.ext.NSlingUnitSettings:setIosFrameworks(v)
	self.iosFrameworks = {}
	if v ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(v)
		do
			n = 0
			while n < m do
				local value = v[n + 1]
				if value ~= nil then
					do _g.jk.lang.Vector:append(self.iosFrameworks, value) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.model.ext.NSlingUnitSettings:getIosFrameworks()
	do return self.iosFrameworks end
end

function sling.model.ext.NSlingUnitSettings:addToIosFrameworks(v)
	if v == nil then
		do return end
	end
	if self.iosFrameworks == nil then
		self.iosFrameworks = {}
	end
	do _g.jk.lang.Vector:append(self.iosFrameworks, v) end
end

function sling.model.ext.NSlingUnitSettings:clearIosFrameworks()
	self.iosFrameworks = nil
end

function sling.model.ext.NSlingUnitSettings:setIosLinkLibs(v)
	self.iosLinkLibs = {}
	if v ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(v)
		do
			n = 0
			while n < m do
				local value = v[n + 1]
				if value ~= nil then
					do _g.jk.lang.Vector:append(self.iosLinkLibs, value) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.model.ext.NSlingUnitSettings:getIosLinkLibs()
	do return self.iosLinkLibs end
end

function sling.model.ext.NSlingUnitSettings:addToIosLinkLibs(v)
	if v == nil then
		do return end
	end
	if self.iosLinkLibs == nil then
		self.iosLinkLibs = {}
	end
	do _g.jk.lang.Vector:append(self.iosLinkLibs, v) end
end

function sling.model.ext.NSlingUnitSettings:clearIosLinkLibs()
	self.iosLinkLibs = nil
end

function sling.model.ext.NSlingUnitSettings:setIosLdFlags(v)
	self.iosLdFlags = {}
	if v ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(v)
		do
			n = 0
			while n < m do
				local value = v[n + 1]
				if value ~= nil then
					do _g.jk.lang.Vector:append(self.iosLdFlags, value) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.model.ext.NSlingUnitSettings:getIosLdFlags()
	do return self.iosLdFlags end
end

function sling.model.ext.NSlingUnitSettings:addToIosLdFlags(v)
	if v == nil then
		do return end
	end
	if self.iosLdFlags == nil then
		self.iosLdFlags = {}
	end
	do _g.jk.lang.Vector:append(self.iosLdFlags, v) end
end

function sling.model.ext.NSlingUnitSettings:clearIosLdFlags()
	self.iosLdFlags = nil
end

function sling.model.ext.NSlingUnitSettings:setIosPlists(v)
	self.iosPlists = {}
	if v ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(v)
		do
			n = 0
			while n < m do
				local value = v[n + 1]
				if value ~= nil then
					do _g.jk.lang.Vector:append(self.iosPlists, value) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.model.ext.NSlingUnitSettings:getIosPlists()
	do return self.iosPlists end
end

function sling.model.ext.NSlingUnitSettings:addToIosPlists(v)
	if v == nil then
		do return end
	end
	if self.iosPlists == nil then
		self.iosPlists = {}
	end
	do _g.jk.lang.Vector:append(self.iosPlists, v) end
end

function sling.model.ext.NSlingUnitSettings:clearIosPlists()
	self.iosPlists = nil
end

function sling.model.ext.NSlingUnitSettings:setIosInfoPlistData(v)
	self.iosInfoPlistData = {}
	if v ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(v)
		do
			n = 0
			while n < m do
				local value = v[n + 1]
				if value ~= nil then
					do _g.jk.lang.Vector:append(self.iosInfoPlistData, value) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.model.ext.NSlingUnitSettings:getIosInfoPlistData()
	do return self.iosInfoPlistData end
end

function sling.model.ext.NSlingUnitSettings:addToIosInfoPlistData(v)
	if v == nil then
		do return end
	end
	if self.iosInfoPlistData == nil then
		self.iosInfoPlistData = {}
	end
	do _g.jk.lang.Vector:append(self.iosInfoPlistData, v) end
end

function sling.model.ext.NSlingUnitSettings:clearIosInfoPlistData()
	self.iosInfoPlistData = nil
end

sling.model.ext.NSlingWebApiSampleRequest = _g.sling.model.ext.NSlingWebApiStatement._create()
sling.model.ext.NSlingWebApiSampleRequest.__index = sling.model.ext.NSlingWebApiSampleRequest
_vm:set_metatable(sling.model.ext.NSlingWebApiSampleRequest, {
	__index = _g.sling.model.ext.NSlingWebApiStatement
})

function sling.model.ext.NSlingWebApiSampleRequest._create()
	local v = _vm:set_metatable({}, sling.model.ext.NSlingWebApiSampleRequest)
	return v
end

function sling.model.ext.NSlingWebApiSampleRequest:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.model.ext.NSlingWebApiSampleRequest'
	self['_isType.sling.model.ext.NSlingWebApiSampleRequest'] = true
	self.title = nil
	self.content = nil
end

function sling.model.ext.NSlingWebApiSampleRequest:_construct0()
	sling.model.ext.NSlingWebApiSampleRequest._init(self)
	do _g.sling.model.ext.NSlingWebApiStatement._construct0(self) end
	return self
end

function sling.model.ext.NSlingWebApiSampleRequest:getNodeTypeName()
	do return "NSlingWebApiSampleRequest" end
end

function sling.model.ext.NSlingWebApiSampleRequest:createNew()
	do return _g.sling.model.ext.NSlingWebApiSampleRequest._construct0(_g.sling.model.ext.NSlingWebApiSampleRequest._create()) end
end

function sling.model.ext.NSlingWebApiSampleRequest:copyTo(o)
	if _g.sling.model.ext.NSlingWebApiStatement.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.model.ext.NSlingWebApiSampleRequest')
		if n == nil then
			do return true end
		end
		n.title = self.title
		n.content = self.content
		do return true end
	end
end

function sling.model.ext.NSlingWebApiSampleRequest:replaceChild(oldnode, newnode, doExport)
	do return _g.sling.model.ext.NSlingWebApiStatement.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.model.ext.NSlingWebApiSampleRequest:acceptVisitor(visitor)
	if _g.sling.model.ext.NSlingWebApiStatement.acceptVisitor(self, visitor) == false then
		do return false end
	end
	do return true end
end

function sling.model.ext.NSlingWebApiSampleRequest:destroy()
	do _g.sling.model.ext.NSlingWebApiStatement.destroy(self) end
end

function sling.model.ext.NSlingWebApiSampleRequest:setTitle(v)
	self.title = v
end

function sling.model.ext.NSlingWebApiSampleRequest:getTitle()
	do return self.title end
end

function sling.model.ext.NSlingWebApiSampleRequest:setContent(v)
	self.content = v
end

function sling.model.ext.NSlingWebApiSampleRequest:getContent()
	do return self.content end
end

sling.model.ext.NSlingWebApiOutOkStatement = _g.sling.model.ext.NSlingWebApiStatement._create()
sling.model.ext.NSlingWebApiOutOkStatement.__index = sling.model.ext.NSlingWebApiOutOkStatement
_vm:set_metatable(sling.model.ext.NSlingWebApiOutOkStatement, {
	__index = _g.sling.model.ext.NSlingWebApiStatement
})

function sling.model.ext.NSlingWebApiOutOkStatement._create()
	local v = _vm:set_metatable({}, sling.model.ext.NSlingWebApiOutOkStatement)
	return v
end

function sling.model.ext.NSlingWebApiOutOkStatement:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.model.ext.NSlingWebApiOutOkStatement'
	self['_isType.sling.model.ext.NSlingWebApiOutOkStatement'] = true
	self.data = nil
end

function sling.model.ext.NSlingWebApiOutOkStatement:_construct0()
	sling.model.ext.NSlingWebApiOutOkStatement._init(self)
	do _g.sling.model.ext.NSlingWebApiStatement._construct0(self) end
	return self
end

function sling.model.ext.NSlingWebApiOutOkStatement:getNodeTypeName()
	do return "NSlingWebApiOutOkStatement" end
end

function sling.model.ext.NSlingWebApiOutOkStatement:createNew()
	do return _g.sling.model.ext.NSlingWebApiOutOkStatement._construct0(_g.sling.model.ext.NSlingWebApiOutOkStatement._create()) end
end

function sling.model.ext.NSlingWebApiOutOkStatement:copyTo(o)
	if _g.sling.model.ext.NSlingWebApiStatement.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.model.ext.NSlingWebApiOutOkStatement')
		if n == nil then
			do return true end
		end
		if n.data ~= nil then
			do n.data:destroy() end
			n.data = nil
		end
		if self.data ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.data), '_isType.sling.model.ExpressionNode')
			if pcp == nil then
				do return false end
			end
			n.data = pcp
			do n.data:setParent(n) end
		end
		do return true end
	end
end

function sling.model.ext.NSlingWebApiOutOkStatement:replaceChild(oldnode, newnode, doExport)
	if oldnode == self.data then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.data:destroy() end
		end
		self.data = _vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode')
		if self.data ~= nil then
			do self.data:setParent(self) end
		end
		do return true end
	end
	do return _g.sling.model.ext.NSlingWebApiStatement.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.model.ext.NSlingWebApiOutOkStatement:acceptVisitor(visitor)
	if _g.sling.model.ext.NSlingWebApiStatement.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self.data ~= nil then
		if self.data:accept(visitor) == false then
			do return false end
		end
	end
	do return true end
end

function sling.model.ext.NSlingWebApiOutOkStatement:destroy()
	do _g.sling.model.ext.NSlingWebApiStatement.destroy(self) end
	if self.data ~= nil then
		do self.data:destroy() end
		self.data = nil
	end
end

function sling.model.ext.NSlingWebApiOutOkStatement:setData(v, doExport)
	if self.data ~= nil and doExport == false then
		do self.data:destroy() end
	end
	self.data = v
	if self.data ~= nil then
		do self.data:setParent(self) end
	end
end

function sling.model.ext.NSlingWebApiOutOkStatement:getData()
	do return self.data end
end

function sling.model.ext.NSlingWebApiOutOkStatement:exportData()
	local v = self.data
	self.data = nil
	do return v end
end

sling.model.ext.NSlingWebApiInQueryParameterStatement = _g.sling.model.ext.NSlingWebApiStatement._create()
sling.model.ext.NSlingWebApiInQueryParameterStatement.__index = sling.model.ext.NSlingWebApiInQueryParameterStatement
_vm:set_metatable(sling.model.ext.NSlingWebApiInQueryParameterStatement, {
	__index = _g.sling.model.ext.NSlingWebApiStatement
})

function sling.model.ext.NSlingWebApiInQueryParameterStatement._create()
	local v = _vm:set_metatable({}, sling.model.ext.NSlingWebApiInQueryParameterStatement)
	return v
end

function sling.model.ext.NSlingWebApiInQueryParameterStatement:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.model.ext.NSlingWebApiInQueryParameterStatement'
	self['_isType.sling.model.ext.NSlingWebApiInQueryParameterStatement'] = true
	self.name = nil
	self.type = nil
	self.optional = false
	self.description = nil
end

function sling.model.ext.NSlingWebApiInQueryParameterStatement:_construct0()
	sling.model.ext.NSlingWebApiInQueryParameterStatement._init(self)
	do _g.sling.model.ext.NSlingWebApiStatement._construct0(self) end
	return self
end

function sling.model.ext.NSlingWebApiInQueryParameterStatement:getNodeTypeName()
	do return "NSlingWebApiInQueryParameterStatement" end
end

function sling.model.ext.NSlingWebApiInQueryParameterStatement:createNew()
	do return _g.sling.model.ext.NSlingWebApiInQueryParameterStatement._construct0(_g.sling.model.ext.NSlingWebApiInQueryParameterStatement._create()) end
end

function sling.model.ext.NSlingWebApiInQueryParameterStatement:copyTo(o)
	if _g.sling.model.ext.NSlingWebApiStatement.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.model.ext.NSlingWebApiInQueryParameterStatement')
		if n == nil then
			do return true end
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
		n.name = self.name
		n.optional = self.optional
		n.description = self.description
		do return true end
	end
end

function sling.model.ext.NSlingWebApiInQueryParameterStatement:replaceChild(oldnode, newnode, doExport)
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
	do return _g.sling.model.ext.NSlingWebApiStatement.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.model.ext.NSlingWebApiInQueryParameterStatement:acceptVisitor(visitor)
	if _g.sling.model.ext.NSlingWebApiStatement.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self.type ~= nil then
		if self.type:accept(visitor) == false then
			do return false end
		end
	end
	do return true end
end

function sling.model.ext.NSlingWebApiInQueryParameterStatement:destroy()
	do _g.sling.model.ext.NSlingWebApiStatement.destroy(self) end
	if self.type ~= nil then
		do self.type:destroy() end
		self.type = nil
	end
end

function sling.model.ext.NSlingWebApiInQueryParameterStatement:setType(v, doExport)
	if self.type ~= nil and doExport == false then
		do self.type:destroy() end
	end
	self.type = v
	if self.type ~= nil then
		do self.type:setParent(self) end
	end
end

function sling.model.ext.NSlingWebApiInQueryParameterStatement:getType()
	do return self.type end
end

function sling.model.ext.NSlingWebApiInQueryParameterStatement:exportType()
	local v = self.type
	self.type = nil
	do return v end
end

function sling.model.ext.NSlingWebApiInQueryParameterStatement:setName(v)
	self.name = v
end

function sling.model.ext.NSlingWebApiInQueryParameterStatement:getName()
	do return self.name end
end

function sling.model.ext.NSlingWebApiInQueryParameterStatement:setOptional(v)
	self.optional = v
end

function sling.model.ext.NSlingWebApiInQueryParameterStatement:getOptional()
	do return self.optional end
end

function sling.model.ext.NSlingWebApiInQueryParameterStatement:setDescription(v)
	self.description = v
end

function sling.model.ext.NSlingWebApiInQueryParameterStatement:getDescription()
	do return self.description end
end

sling.model.ext.NSlingWebApiOutObjectStatement = _g.sling.model.ext.NSlingWebApiStatement._create()
sling.model.ext.NSlingWebApiOutObjectStatement.__index = sling.model.ext.NSlingWebApiOutObjectStatement
_vm:set_metatable(sling.model.ext.NSlingWebApiOutObjectStatement, {
	__index = _g.sling.model.ext.NSlingWebApiStatement
})

function sling.model.ext.NSlingWebApiOutObjectStatement._create()
	local v = _vm:set_metatable({}, sling.model.ext.NSlingWebApiOutObjectStatement)
	return v
end

function sling.model.ext.NSlingWebApiOutObjectStatement:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.model.ext.NSlingWebApiOutObjectStatement'
	self['_isType.sling.model.ext.NSlingWebApiOutObjectStatement'] = true
	self.data = nil
end

function sling.model.ext.NSlingWebApiOutObjectStatement:_construct0()
	sling.model.ext.NSlingWebApiOutObjectStatement._init(self)
	do _g.sling.model.ext.NSlingWebApiStatement._construct0(self) end
	return self
end

function sling.model.ext.NSlingWebApiOutObjectStatement:getNodeTypeName()
	do return "NSlingWebApiOutObjectStatement" end
end

function sling.model.ext.NSlingWebApiOutObjectStatement:createNew()
	do return _g.sling.model.ext.NSlingWebApiOutObjectStatement._construct0(_g.sling.model.ext.NSlingWebApiOutObjectStatement._create()) end
end

function sling.model.ext.NSlingWebApiOutObjectStatement:copyTo(o)
	if _g.sling.model.ext.NSlingWebApiStatement.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.model.ext.NSlingWebApiOutObjectStatement')
		if n == nil then
			do return true end
		end
		if n.data ~= nil then
			do n.data:destroy() end
			n.data = nil
		end
		if self.data ~= nil then
			local pcp = _vm:to_table_with_key(_g.sling.common.NodeObject:dupNode(self.data), '_isType.sling.model.ExpressionNode')
			if pcp == nil then
				do return false end
			end
			n.data = pcp
			do n.data:setParent(n) end
		end
		do return true end
	end
end

function sling.model.ext.NSlingWebApiOutObjectStatement:replaceChild(oldnode, newnode, doExport)
	if oldnode == self.data then
		if newnode ~= nil and (_vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode') ~= nil) == false then
			do return false end
		end
		if doExport == false then
			do self.data:destroy() end
		end
		self.data = _vm:to_table_with_key(newnode, '_isType.sling.model.ExpressionNode')
		if self.data ~= nil then
			do self.data:setParent(self) end
		end
		do return true end
	end
	do return _g.sling.model.ext.NSlingWebApiStatement.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.model.ext.NSlingWebApiOutObjectStatement:acceptVisitor(visitor)
	if _g.sling.model.ext.NSlingWebApiStatement.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self.data ~= nil then
		if self.data:accept(visitor) == false then
			do return false end
		end
	end
	do return true end
end

function sling.model.ext.NSlingWebApiOutObjectStatement:destroy()
	do _g.sling.model.ext.NSlingWebApiStatement.destroy(self) end
	if self.data ~= nil then
		do self.data:destroy() end
		self.data = nil
	end
end

function sling.model.ext.NSlingWebApiOutObjectStatement:setData(v, doExport)
	if self.data ~= nil and doExport == false then
		do self.data:destroy() end
	end
	self.data = v
	if self.data ~= nil then
		do self.data:setParent(self) end
	end
end

function sling.model.ext.NSlingWebApiOutObjectStatement:getData()
	do return self.data end
end

function sling.model.ext.NSlingWebApiOutObjectStatement:exportData()
	local v = self.data
	self.data = nil
	do return v end
end

sling.model.ext.NSlingWebApiInSessionStatement = _g.sling.model.ext.NSlingWebApiStatement._create()
sling.model.ext.NSlingWebApiInSessionStatement.__index = sling.model.ext.NSlingWebApiInSessionStatement
_vm:set_metatable(sling.model.ext.NSlingWebApiInSessionStatement, {
	__index = _g.sling.model.ext.NSlingWebApiStatement
})

function sling.model.ext.NSlingWebApiInSessionStatement._create()
	local v = _vm:set_metatable({}, sling.model.ext.NSlingWebApiInSessionStatement)
	return v
end

function sling.model.ext.NSlingWebApiInSessionStatement:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.model.ext.NSlingWebApiInSessionStatement'
	self['_isType.sling.model.ext.NSlingWebApiInSessionStatement'] = true
	self.name = nil
	self.type = nil
end

function sling.model.ext.NSlingWebApiInSessionStatement:_construct0()
	sling.model.ext.NSlingWebApiInSessionStatement._init(self)
	do _g.sling.model.ext.NSlingWebApiStatement._construct0(self) end
	return self
end

function sling.model.ext.NSlingWebApiInSessionStatement:getNodeTypeName()
	do return "NSlingWebApiInSessionStatement" end
end

function sling.model.ext.NSlingWebApiInSessionStatement:createNew()
	do return _g.sling.model.ext.NSlingWebApiInSessionStatement._construct0(_g.sling.model.ext.NSlingWebApiInSessionStatement._create()) end
end

function sling.model.ext.NSlingWebApiInSessionStatement:copyTo(o)
	if _g.sling.model.ext.NSlingWebApiStatement.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.model.ext.NSlingWebApiInSessionStatement')
		if n == nil then
			do return true end
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
		n.name = self.name
		do return true end
	end
end

function sling.model.ext.NSlingWebApiInSessionStatement:replaceChild(oldnode, newnode, doExport)
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
	do return _g.sling.model.ext.NSlingWebApiStatement.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.model.ext.NSlingWebApiInSessionStatement:acceptVisitor(visitor)
	if _g.sling.model.ext.NSlingWebApiStatement.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self.type ~= nil then
		if self.type:accept(visitor) == false then
			do return false end
		end
	end
	do return true end
end

function sling.model.ext.NSlingWebApiInSessionStatement:destroy()
	do _g.sling.model.ext.NSlingWebApiStatement.destroy(self) end
	if self.type ~= nil then
		do self.type:destroy() end
		self.type = nil
	end
end

function sling.model.ext.NSlingWebApiInSessionStatement:setType(v, doExport)
	if self.type ~= nil and doExport == false then
		do self.type:destroy() end
	end
	self.type = v
	if self.type ~= nil then
		do self.type:setParent(self) end
	end
end

function sling.model.ext.NSlingWebApiInSessionStatement:getType()
	do return self.type end
end

function sling.model.ext.NSlingWebApiInSessionStatement:exportType()
	local v = self.type
	self.type = nil
	do return v end
end

function sling.model.ext.NSlingWebApiInSessionStatement:setName(v)
	self.name = v
end

function sling.model.ext.NSlingWebApiInSessionStatement:getName()
	do return self.name end
end

sling.model.ext.NSlingWebApiInPostStatement = _g.sling.model.ext.NSlingWebApiStatement._create()
sling.model.ext.NSlingWebApiInPostStatement.__index = sling.model.ext.NSlingWebApiInPostStatement
_vm:set_metatable(sling.model.ext.NSlingWebApiInPostStatement, {
	__index = _g.sling.model.ext.NSlingWebApiStatement
})

function sling.model.ext.NSlingWebApiInPostStatement._create()
	local v = _vm:set_metatable({}, sling.model.ext.NSlingWebApiInPostStatement)
	return v
end

function sling.model.ext.NSlingWebApiInPostStatement:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.model.ext.NSlingWebApiInPostStatement'
	self['_isType.sling.model.ext.NSlingWebApiInPostStatement'] = true
	self.name = nil
	self.type = nil
	self.description = nil
end

function sling.model.ext.NSlingWebApiInPostStatement:_construct0()
	sling.model.ext.NSlingWebApiInPostStatement._init(self)
	do _g.sling.model.ext.NSlingWebApiStatement._construct0(self) end
	return self
end

function sling.model.ext.NSlingWebApiInPostStatement:getNodeTypeName()
	do return "NSlingWebApiInPostStatement" end
end

function sling.model.ext.NSlingWebApiInPostStatement:createNew()
	do return _g.sling.model.ext.NSlingWebApiInPostStatement._construct0(_g.sling.model.ext.NSlingWebApiInPostStatement._create()) end
end

function sling.model.ext.NSlingWebApiInPostStatement:copyTo(o)
	if _g.sling.model.ext.NSlingWebApiStatement.copyTo(self, o) == false then
		do return false end
	end
	do
		local n = _vm:to_table_with_key(o, '_isType.sling.model.ext.NSlingWebApiInPostStatement')
		if n == nil then
			do return true end
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
		n.name = self.name
		n.description = self.description
		do return true end
	end
end

function sling.model.ext.NSlingWebApiInPostStatement:replaceChild(oldnode, newnode, doExport)
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
	do return _g.sling.model.ext.NSlingWebApiStatement.replaceChild(self, oldnode, newnode, doExport) end
end

function sling.model.ext.NSlingWebApiInPostStatement:acceptVisitor(visitor)
	if _g.sling.model.ext.NSlingWebApiStatement.acceptVisitor(self, visitor) == false then
		do return false end
	end
	if self.type ~= nil then
		if self.type:accept(visitor) == false then
			do return false end
		end
	end
	do return true end
end

function sling.model.ext.NSlingWebApiInPostStatement:destroy()
	do _g.sling.model.ext.NSlingWebApiStatement.destroy(self) end
	if self.type ~= nil then
		do self.type:destroy() end
		self.type = nil
	end
end

function sling.model.ext.NSlingWebApiInPostStatement:setType(v, doExport)
	if self.type ~= nil and doExport == false then
		do self.type:destroy() end
	end
	self.type = v
	if self.type ~= nil then
		do self.type:setParent(self) end
	end
end

function sling.model.ext.NSlingWebApiInPostStatement:getType()
	do return self.type end
end

function sling.model.ext.NSlingWebApiInPostStatement:exportType()
	local v = self.type
	self.type = nil
	do return v end
end

function sling.model.ext.NSlingWebApiInPostStatement:setName(v)
	self.name = v
end

function sling.model.ext.NSlingWebApiInPostStatement:getName()
	do return self.name end
end

function sling.model.ext.NSlingWebApiInPostStatement:setDescription(v)
	self.description = v
end

function sling.model.ext.NSlingWebApiInPostStatement:getDescription()
	do return self.description end
end
