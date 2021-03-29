jk = jk or {}

jk.xml = jk.xml or {}

jk.xml.XMLMaker = {}
jk.xml.XMLMaker.__index = jk.xml.XMLMaker
_vm:set_metatable(jk.xml.XMLMaker, {})

function jk.xml.XMLMaker._create()
	local v = _vm:set_metatable({}, jk.xml.XMLMaker)
	return v
end

function jk.xml.XMLMaker:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLMaker'
	self['_isType.jk.xml.XMLMaker'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.elements = nil
	self.customHeader = nil
	self.singleLine = false
	self.header = nil
	self.indentWithTab = false
end

jk.xml.XMLMaker.CData = {}
jk.xml.XMLMaker.CData.__index = jk.xml.XMLMaker.CData
_vm:set_metatable(jk.xml.XMLMaker.CData, {})

function jk.xml.XMLMaker.CData._create()
	local v = _vm:set_metatable({}, jk.xml.XMLMaker.CData)
	return v
end

function jk.xml.XMLMaker.CData:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLMaker.CData'
	self['_isType.jk.xml.XMLMaker.CData'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.text = nil
	self.simple = false
	self.singleLine = false
end

function jk.xml.XMLMaker.CData:_construct0()
	jk.xml.XMLMaker.CData._init(self)
	return self
end

function jk.xml.XMLMaker.CData:_construct1(t)
	jk.xml.XMLMaker.CData._init(self)
	self.text = t
	return self
end

function jk.xml.XMLMaker.CData:toString()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if self.simple then
		do sb:appendString(self.text) end
	else
		do sb:appendString("<![CDATA[") end
		do sb:appendString(self.text) end
		do sb:appendString("]]>") end
	end
	do return sb:toString() end
end

function jk.xml.XMLMaker.CData:getText()
	do return self.text end
end

function jk.xml.XMLMaker.CData:setText(v)
	self.text = v
	do return self end
end

function jk.xml.XMLMaker.CData:getSimple()
	do return self.simple end
end

function jk.xml.XMLMaker.CData:setSimple(v)
	self.simple = v
	do return self end
end

function jk.xml.XMLMaker.CData:getSingleLine()
	do return self.singleLine end
end

function jk.xml.XMLMaker.CData:setSingleLine(v)
	self.singleLine = v
	do return self end
end

jk.xml.XMLMaker.StartElement = {}
jk.xml.XMLMaker.StartElement.__index = jk.xml.XMLMaker.StartElement
_vm:set_metatable(jk.xml.XMLMaker.StartElement, {})

function jk.xml.XMLMaker.StartElement._create()
	local v = _vm:set_metatable({}, jk.xml.XMLMaker.StartElement)
	return v
end

function jk.xml.XMLMaker.StartElement:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLMaker.StartElement'
	self['_isType.jk.xml.XMLMaker.StartElement'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.name = nil
	self.attributes = nil
	self.single = false
	self.singleLine = false
end

function jk.xml.XMLMaker.StartElement:_construct0()
	jk.xml.XMLMaker.StartElement._init(self)
	return self
end

function jk.xml.XMLMaker.StartElement:_construct1(n)
	jk.xml.XMLMaker.StartElement._init(self)
	self.name = n
	self.attributes = {}
	return self
end

function jk.xml.XMLMaker.StartElement:attribute(key, value)
	do _g.jk.lang.Map:setValue(self.attributes, key, value) end
	do return self end
end

function jk.xml.XMLMaker.StartElement:escapeAttribute(str)
	if str == nil then
		do return str end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local array = _g.jk.lang.String:toCharArray(str)
		if array ~= nil then
			local n = 0
			local m = #array
			do
				n = 0
				while n < m do
					local c = array[n + 1]
					if c == 38 then
						do sb:appendString("&amp;") end
					elseif c == 34 then
						do sb:appendString("&quot;") end
					elseif c == 60 then
						do sb:appendString("&lt;") end
					elseif c == 62 then
						do sb:appendString("&gt;") end
					else
						do sb:appendCharacter(c) end
					end
					do n = n + 1 end
				end
			end
		end
		do return sb:toString() end
	end
end

function jk.xml.XMLMaker.StartElement:toString()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendCharacter(60) end
	do sb:appendString(self.name) end
	do
		local keys = _g.jk.lang.Map:getKeys(self.attributes)
		if keys ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(keys)
			do
				n = 0
				while n < m do
					local key = keys[n + 1]
					if key ~= nil then
						do sb:appendCharacter(32) end
						do sb:appendString(key) end
						do sb:appendCharacter(61) end
						do sb:appendCharacter(34) end
						do
							local val = self:escapeAttribute(_g.jk.lang.Map:getValue(self.attributes, key))
							do sb:appendString(val) end
							do sb:appendCharacter(34) end
						end
					end
					do n = n + 1 end
				end
			end
		end
		if self.single then
			do sb:appendCharacter(32) end
			do sb:appendCharacter(47) end
		end
		do sb:appendCharacter(62) end
		do return sb:toString() end
	end
end

function jk.xml.XMLMaker.StartElement:getName()
	do return self.name end
end

function jk.xml.XMLMaker.StartElement:setName(v)
	self.name = v
	do return self end
end

function jk.xml.XMLMaker.StartElement:getAttributes()
	do return self.attributes end
end

function jk.xml.XMLMaker.StartElement:setAttributes(v)
	self.attributes = v
	do return self end
end

function jk.xml.XMLMaker.StartElement:getSingle()
	do return self.single end
end

function jk.xml.XMLMaker.StartElement:setSingle(v)
	self.single = v
	do return self end
end

function jk.xml.XMLMaker.StartElement:getSingleLine()
	do return self.singleLine end
end

function jk.xml.XMLMaker.StartElement:setSingleLine(v)
	self.singleLine = v
	do return self end
end

jk.xml.XMLMaker.EndElement = {}
jk.xml.XMLMaker.EndElement.__index = jk.xml.XMLMaker.EndElement
_vm:set_metatable(jk.xml.XMLMaker.EndElement, {})

function jk.xml.XMLMaker.EndElement._create()
	local v = _vm:set_metatable({}, jk.xml.XMLMaker.EndElement)
	return v
end

function jk.xml.XMLMaker.EndElement:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLMaker.EndElement'
	self['_isType.jk.xml.XMLMaker.EndElement'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.name = nil
end

function jk.xml.XMLMaker.EndElement:_construct0()
	jk.xml.XMLMaker.EndElement._init(self)
	return self
end

function jk.xml.XMLMaker.EndElement:_construct1(n)
	jk.xml.XMLMaker.EndElement._init(self)
	self.name = n
	return self
end

function jk.xml.XMLMaker.EndElement:toString()
	do return "</" .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(self:getName())) .. ">" end
end

function jk.xml.XMLMaker.EndElement:getName()
	do return self.name end
end

function jk.xml.XMLMaker.EndElement:setName(v)
	self.name = v
	do return self end
end

jk.xml.XMLMaker.Element = _g.jk.xml.XMLMaker.StartElement._create()
jk.xml.XMLMaker.Element.__index = jk.xml.XMLMaker.Element
_vm:set_metatable(jk.xml.XMLMaker.Element, {
	__index = _g.jk.xml.XMLMaker.StartElement
})

function jk.xml.XMLMaker.Element._create()
	local v = _vm:set_metatable({}, jk.xml.XMLMaker.Element)
	return v
end

function jk.xml.XMLMaker.Element:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLMaker.Element'
	self['_isType.jk.xml.XMLMaker.Element'] = true
end

function jk.xml.XMLMaker.Element:_construct0()
	jk.xml.XMLMaker.Element._init(self)
	do _g.jk.xml.XMLMaker.StartElement._construct0(self) end
	return self
end

function jk.xml.XMLMaker.Element:_construct1(name)
	jk.xml.XMLMaker.Element._init(self)
	do _g.jk.xml.XMLMaker.StartElement._construct1(self, name) end
	do self:setSingle(true) end
	return self
end

jk.xml.XMLMaker.CustomXML = {}
jk.xml.XMLMaker.CustomXML.__index = jk.xml.XMLMaker.CustomXML
_vm:set_metatable(jk.xml.XMLMaker.CustomXML, {})

function jk.xml.XMLMaker.CustomXML._create()
	local v = _vm:set_metatable({}, jk.xml.XMLMaker.CustomXML)
	return v
end

function jk.xml.XMLMaker.CustomXML:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLMaker.CustomXML'
	self['_isType.jk.xml.XMLMaker.CustomXML'] = true
	self.string = nil
end

function jk.xml.XMLMaker.CustomXML:_construct0()
	jk.xml.XMLMaker.CustomXML._init(self)
	return self
end

function jk.xml.XMLMaker.CustomXML:_construct1(s)
	jk.xml.XMLMaker.CustomXML._init(self)
	self.string = s
	return self
end

function jk.xml.XMLMaker.CustomXML:getString()
	do return self.string end
end

function jk.xml.XMLMaker.CustomXML:setString(v)
	self.string = v
	do return self end
end

function jk.xml.XMLMaker:_construct0()
	jk.xml.XMLMaker._init(self)
	self.elements = {}
	self.header = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
	return self
end

function jk.xml.XMLMaker:start1(element, singleLine)
	do self:add(_g.jk.xml.XMLMaker.StartElement._construct1(_g.jk.xml.XMLMaker.StartElement._create(), element):setSingleLine(singleLine)) end
	do return self end
end

function jk.xml.XMLMaker:start2(element, k1, v1, singleLine)
	local v = _g.jk.xml.XMLMaker.StartElement._construct1(_g.jk.xml.XMLMaker.StartElement._create(), element)
	do v:setSingleLine(singleLine) end
	if k1 ~= nil then
		do v:attribute(k1, v1) end
	end
	do self:add(v) end
	do return self end
end

function jk.xml.XMLMaker:start3(element, attrs, singleLine)
	local v = _g.jk.xml.XMLMaker.StartElement._construct1(_g.jk.xml.XMLMaker.StartElement._create(), element)
	do v:setSingleLine(singleLine) end
	if attrs ~= nil then
		local keys = _g.jk.lang.Map:getKeys(attrs)
		if keys ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(keys)
			do
				n = 0
				while n < m do
					local key = (function(o)
						if (_vm:get_variable_type(o) == 'string') then
							do return o end
						end
						do return nil end
					end)(keys[n + 1])
					if key ~= nil then
						local val = attrs[key]
						do v:attribute(key, _g.jk.lang.String:asString(val)) end
					end
					do n = n + 1 end
				end
			end
		end
	end
	do self:add(v) end
	do return self end
end

function jk.xml.XMLMaker:start4(element, attrs, singleLine)
	if attrs == nil then
		do return self:start3(element, nil, singleLine) end
	end
	do return self:start3(element, attrs:toObjectMap(), singleLine) end
end

function jk.xml.XMLMaker:element(element, attrs)
	local v = _g.jk.xml.XMLMaker.Element._construct1(_g.jk.xml.XMLMaker.Element._create(), element)
	if attrs ~= nil then
		local keys = _g.jk.lang.Map:getKeys(attrs)
		if keys ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(keys)
			do
				n = 0
				while n < m do
					local key = (function(o)
						if (_vm:get_variable_type(o) == 'string') then
							do return o end
						end
						do return nil end
					end)(keys[n + 1])
					if key ~= nil then
						local val = attrs[key]
						do v:attribute(key, _g.jk.lang.String:asString(val)) end
					end
					do n = n + 1 end
				end
			end
		end
	end
	do self:add(v) end
	do return self end
end

function jk.xml.XMLMaker:_end(element)
	do self:add(_g.jk.xml.XMLMaker.EndElement._construct1(_g.jk.xml.XMLMaker.EndElement._create(), element)) end
	do return self end
end

function jk.xml.XMLMaker:text(element)
	do self:add(element) end
	do return self end
end

function jk.xml.XMLMaker:cdata(element)
	do self:add(_g.jk.xml.XMLMaker.CData._construct1(_g.jk.xml.XMLMaker.CData._create(), element)) end
	do return self end
end

function jk.xml.XMLMaker:textElement(element, text, attrs)
	local se = _g.jk.xml.XMLMaker.StartElement._construct1(_g.jk.xml.XMLMaker.StartElement._create(), element)
	do se:setSingleLine(true) end
	if attrs ~= nil then
		local keys = _g.jk.lang.Map:getKeys(attrs)
		if keys ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(keys)
			do
				n = 0
				while n < m do
					local key = (function(o)
						if (_vm:get_variable_type(o) == 'string') then
							do return o end
						end
						do return nil end
					end)(keys[n + 1])
					if key ~= nil then
						local val = attrs[key]
						do se:attribute(key, _g.jk.lang.String:asString(val)) end
					end
					do n = n + 1 end
				end
			end
		end
	end
	do self:add(se) end
	do self:add(text) end
	do self:add(_g.jk.xml.XMLMaker.EndElement._construct1(_g.jk.xml.XMLMaker.EndElement._create(), element)) end
	do return self end
end

function jk.xml.XMLMaker:add(o)
	if o ~= nil then
		do _g.jk.lang.Vector:append(self.elements, o) end
	end
	do return self end
end

function jk.xml.XMLMaker:append(sb, level, str, noIndent, noNewLine)
	local n = 0
	if self.singleLine == false and noIndent == false then
		do
			n = 0
			while n < level do
				if self.indentWithTab then
					do sb:appendCharacter(9) end
				else
					do sb:appendCharacter(32) end
					do sb:appendCharacter(32) end
				end
				do n = n + 1 end
			end
		end
	end
	do sb:appendString(str) end
	if self.singleLine == false and noNewLine == false then
		do sb:appendCharacter(10) end
	end
end

function jk.xml.XMLMaker:escapeString(str)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if str ~= nil then
		local array = _g.jk.lang.String:toCharArray(str)
		if array ~= nil then
			local n = 0
			local m = #array
			do
				n = 0
				while n < m do
					local c = array[n + 1]
					if c == 34 then
						do sb:appendString("&quot;") end
					elseif c == 39 then
						do sb:appendString("&apos;") end
					elseif c == 60 then
						do sb:appendString("&lt;") end
					elseif c == 62 then
						do sb:appendString("&gt;") end
					elseif c == 38 then
						do sb:appendString("&amp;") end
					else
						do sb:appendCharacter(c) end
					end
					do n = n + 1 end
				end
			end
		end
	end
	do return sb:toString() end
end

function jk.xml.XMLMaker:toString()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local level = 0
	if self.header ~= nil then
		do self:append(sb, level, self.header, false, false) end
	end
	if self.customHeader ~= nil then
		do sb:appendString(self.customHeader) end
	end
	do
		local singleLine = false
		if self.elements ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self.elements)
			do
				n = 0
				while n < m do
					local o = self.elements[n + 1]
					if o ~= nil then
						if (_vm:to_table_with_key(o, '_isType.jk.xml.XMLMaker.Element') ~= nil) then
							do self:append(sb, level, o:toString(), singleLine, singleLine) end
						elseif (_vm:to_table_with_key(o, '_isType.jk.xml.XMLMaker.StartElement') ~= nil) then
							singleLine = o:getSingleLine()
							do self:append(sb, level, o:toString(), false, singleLine) end
							if o:getSingle() == false then
								do level = level + 1 end
							end
						elseif (_vm:to_table_with_key(o, '_isType.jk.xml.XMLMaker.EndElement') ~= nil) then
							do level = level - 1 end
							do self:append(sb, level, o:toString(), singleLine, false) end
							singleLine = false
						elseif (_vm:to_table_with_key(o, '_isType.jk.xml.XMLMaker.CustomXML') ~= nil) then
							do self:append(sb, level, o:getString(), singleLine, singleLine) end
						elseif (_vm:get_variable_type(o) == 'string') then
							do self:append(sb, level, self:escapeString(o), singleLine, singleLine) end
						elseif (_vm:to_table_with_key(o, '_isType.jk.xml.XMLMaker.CData') ~= nil) then
							do self:append(sb, level, o:toString(), singleLine, o:getSingleLine()) end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do return sb:toString() end
	end
end

function jk.xml.XMLMaker:getElements()
	do return self.elements end
end

function jk.xml.XMLMaker:setElements(v)
	self.elements = v
	do return self end
end

function jk.xml.XMLMaker:getCustomHeader()
	do return self.customHeader end
end

function jk.xml.XMLMaker:setCustomHeader(v)
	self.customHeader = v
	do return self end
end

function jk.xml.XMLMaker:getSingleLine()
	do return self.singleLine end
end

function jk.xml.XMLMaker:setSingleLine(v)
	self.singleLine = v
	do return self end
end

function jk.xml.XMLMaker:getHeader()
	do return self.header end
end

function jk.xml.XMLMaker:setHeader(v)
	self.header = v
	do return self end
end

function jk.xml.XMLMaker:getIndentWithTab()
	do return self.indentWithTab end
end

function jk.xml.XMLMaker:setIndentWithTab(v)
	self.indentWithTab = v
	do return self end
end

jk.xml.MarkupLanguageParser = {}
jk.xml.MarkupLanguageParser.__index = jk.xml.MarkupLanguageParser
_vm:set_metatable(jk.xml.MarkupLanguageParser, {})

function jk.xml.MarkupLanguageParser._create()
	local v = _vm:set_metatable({}, jk.xml.MarkupLanguageParser)
	return v
end

function jk.xml.MarkupLanguageParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.MarkupLanguageParser'
	self['_isType.jk.xml.MarkupLanguageParser'] = true
	self.it = nil
	self.nextQueue = nil
	self.cdataStart = "![CDATA["
	self.commentStart = "!--"
	self.tag = nil
	self.def = nil
	self.cdata = nil
	self.comment = nil
	self.ignoreWhiteSpace = false
	self.currentPosition = 0
end

function jk.xml.MarkupLanguageParser:_construct0()
	jk.xml.MarkupLanguageParser._init(self)
	return self
end

jk.xml.MarkupLanguageParser.Value = {}
jk.xml.MarkupLanguageParser.Value.__index = jk.xml.MarkupLanguageParser.Value
_vm:set_metatable(jk.xml.MarkupLanguageParser.Value, {})

function jk.xml.MarkupLanguageParser.Value._create()
	local v = _vm:set_metatable({}, jk.xml.MarkupLanguageParser.Value)
	return v
end

function jk.xml.MarkupLanguageParser.Value:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.MarkupLanguageParser.Value'
	self['_isType.jk.xml.MarkupLanguageParser.Value'] = true
	self.position = 0
end

function jk.xml.MarkupLanguageParser.Value:_construct0()
	jk.xml.MarkupLanguageParser.Value._init(self)
	return self
end

function jk.xml.MarkupLanguageParser.Value:getPosition()
	do return self.position end
end

function jk.xml.MarkupLanguageParser.Value:setPosition(v)
	self.position = v
	do return self end
end

jk.xml.MarkupLanguageParser.StartElement = _g.jk.xml.MarkupLanguageParser.Value._create()
jk.xml.MarkupLanguageParser.StartElement.__index = jk.xml.MarkupLanguageParser.StartElement
_vm:set_metatable(jk.xml.MarkupLanguageParser.StartElement, {
	__index = _g.jk.xml.MarkupLanguageParser.Value
})

function jk.xml.MarkupLanguageParser.StartElement._create()
	local v = _vm:set_metatable({}, jk.xml.MarkupLanguageParser.StartElement)
	return v
end

function jk.xml.MarkupLanguageParser.StartElement:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.MarkupLanguageParser.StartElement'
	self['_isType.jk.xml.MarkupLanguageParser.StartElement'] = true
	self.name = nil
	self.params = nil
end

function jk.xml.MarkupLanguageParser.StartElement:_construct0()
	jk.xml.MarkupLanguageParser.StartElement._init(self)
	do _g.jk.xml.MarkupLanguageParser.Value._construct0(self) end
	return self
end

function jk.xml.MarkupLanguageParser.StartElement:getParam(pname)
	if not (self.params ~= nil) then
		do return nil end
	end
	do return self.params:getString(pname, nil) end
end

function jk.xml.MarkupLanguageParser.StartElement:getName()
	do return self.name end
end

function jk.xml.MarkupLanguageParser.StartElement:setName(v)
	self.name = v
	do return self end
end

function jk.xml.MarkupLanguageParser.StartElement:getParams()
	do return self.params end
end

function jk.xml.MarkupLanguageParser.StartElement:setParams(v)
	self.params = v
	do return self end
end

jk.xml.MarkupLanguageParser.EndElement = _g.jk.xml.MarkupLanguageParser.Value._create()
jk.xml.MarkupLanguageParser.EndElement.__index = jk.xml.MarkupLanguageParser.EndElement
_vm:set_metatable(jk.xml.MarkupLanguageParser.EndElement, {
	__index = _g.jk.xml.MarkupLanguageParser.Value
})

function jk.xml.MarkupLanguageParser.EndElement._create()
	local v = _vm:set_metatable({}, jk.xml.MarkupLanguageParser.EndElement)
	return v
end

function jk.xml.MarkupLanguageParser.EndElement:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.MarkupLanguageParser.EndElement'
	self['_isType.jk.xml.MarkupLanguageParser.EndElement'] = true
	self.name = nil
end

function jk.xml.MarkupLanguageParser.EndElement:_construct0()
	jk.xml.MarkupLanguageParser.EndElement._init(self)
	do _g.jk.xml.MarkupLanguageParser.Value._construct0(self) end
	return self
end

function jk.xml.MarkupLanguageParser.EndElement:getName()
	do return self.name end
end

function jk.xml.MarkupLanguageParser.EndElement:setName(v)
	self.name = v
	do return self end
end

jk.xml.MarkupLanguageParser.CharacterData = _g.jk.xml.MarkupLanguageParser.Value._create()
jk.xml.MarkupLanguageParser.CharacterData.__index = jk.xml.MarkupLanguageParser.CharacterData
_vm:set_metatable(jk.xml.MarkupLanguageParser.CharacterData, {
	__index = _g.jk.xml.MarkupLanguageParser.Value
})

function jk.xml.MarkupLanguageParser.CharacterData._create()
	local v = _vm:set_metatable({}, jk.xml.MarkupLanguageParser.CharacterData)
	return v
end

function jk.xml.MarkupLanguageParser.CharacterData:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.MarkupLanguageParser.CharacterData'
	self['_isType.jk.xml.MarkupLanguageParser.CharacterData'] = true
	self.data = nil
end

function jk.xml.MarkupLanguageParser.CharacterData:_construct0()
	jk.xml.MarkupLanguageParser.CharacterData._init(self)
	do _g.jk.xml.MarkupLanguageParser.Value._construct0(self) end
	return self
end

function jk.xml.MarkupLanguageParser.CharacterData:getData()
	do return self.data end
end

function jk.xml.MarkupLanguageParser.CharacterData:setData(v)
	self.data = v
	do return self end
end

jk.xml.MarkupLanguageParser.TextData = _g.jk.xml.MarkupLanguageParser.Value._create()
jk.xml.MarkupLanguageParser.TextData.__index = jk.xml.MarkupLanguageParser.TextData
_vm:set_metatable(jk.xml.MarkupLanguageParser.TextData, {
	__index = _g.jk.xml.MarkupLanguageParser.Value
})

function jk.xml.MarkupLanguageParser.TextData._create()
	local v = _vm:set_metatable({}, jk.xml.MarkupLanguageParser.TextData)
	return v
end

function jk.xml.MarkupLanguageParser.TextData:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.MarkupLanguageParser.TextData'
	self['_isType.jk.xml.MarkupLanguageParser.TextData'] = true
	self.data = nil
end

function jk.xml.MarkupLanguageParser.TextData:_construct0()
	jk.xml.MarkupLanguageParser.TextData._init(self)
	do _g.jk.xml.MarkupLanguageParser.Value._construct0(self) end
	return self
end

function jk.xml.MarkupLanguageParser.TextData:getData()
	do return self.data end
end

function jk.xml.MarkupLanguageParser.TextData:setData(v)
	self.data = v
	do return self end
end

jk.xml.MarkupLanguageParser.Comment = _g.jk.xml.MarkupLanguageParser.Value._create()
jk.xml.MarkupLanguageParser.Comment.__index = jk.xml.MarkupLanguageParser.Comment
_vm:set_metatable(jk.xml.MarkupLanguageParser.Comment, {
	__index = _g.jk.xml.MarkupLanguageParser.Value
})

function jk.xml.MarkupLanguageParser.Comment._create()
	local v = _vm:set_metatable({}, jk.xml.MarkupLanguageParser.Comment)
	return v
end

function jk.xml.MarkupLanguageParser.Comment:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.MarkupLanguageParser.Comment'
	self['_isType.jk.xml.MarkupLanguageParser.Comment'] = true
	self.text = nil
end

function jk.xml.MarkupLanguageParser.Comment:_construct0()
	jk.xml.MarkupLanguageParser.Comment._init(self)
	do _g.jk.xml.MarkupLanguageParser.Value._construct0(self) end
	return self
end

function jk.xml.MarkupLanguageParser.Comment:getText()
	do return self.text end
end

function jk.xml.MarkupLanguageParser.Comment:setText(v)
	self.text = v
	do return self end
end

function jk.xml.MarkupLanguageParser:onTagString(tagstring, pos)
	if _g.jk.lang.String:getChar(tagstring, 0) == 47 then
		local v = _g.jk.xml.MarkupLanguageParser.EndElement._construct0(_g.jk.xml.MarkupLanguageParser.EndElement._create())
		do v:setPosition(pos) end
		do v:setName(_g.jk.lang.String:getEndOfString(tagstring, 1)) end
		do return v end
	end
	do
		local element = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local params = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		local it = _g.jk.lang.CharacterIteratorForString:forString(tagstring)
		local c = 0
		while (function()
			c = it:getNextChar()
			do return c end
		end)() > 0 do
			if c == 32 or c == 9 or c == 10 or c == 13 or c == 47 then
				if element:count() > 0 then
					do break end
				end
			else
				do element:appendCharacter(c) end
			end
		end
		while c > 0 and c ~= 47 do
			if c == 32 or c == 9 or c == 10 or c == 13 then
				c = it:getNextChar()
				goto _continue1
			end
			do
				local pname = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				local pval = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				while c > 0 and c ~= 32 and c ~= 9 and c ~= 10 and c ~= 13 and c ~= 61 do
					do pname:appendCharacter(c) end
					c = it:getNextChar()
				end
				while c == 32 or c == 9 or c == 10 or c == 13 do
					c = it:getNextChar()
				end
				if c ~= 61 then
				else
					c = it:getNextChar()
					while c == 32 or c == 9 or c == 10 or c == 13 do
						c = it:getNextChar()
					end
					if c ~= 34 then
						while c > 0 and c ~= 32 and c ~= 9 and c ~= 10 and c ~= 13 do
							do pval:appendCharacter(c) end
							c = it:getNextChar()
						end
						while c == 32 or c == 9 or c == 10 or c == 13 do
							c = it:getNextChar()
						end
					else
						c = it:getNextChar()
						while c > 0 and c ~= 34 do
							do pval:appendCharacter(c) end
							c = it:getNextChar()
						end
						if c ~= 34 then
						else
							c = it:getNextChar()
						end
						while c == 32 or c == 9 or c == 10 or c == 13 do
							c = it:getNextChar()
						end
					end
				end
				do
					local pnamestr = pname:toString()
					local pvalstr = self:sanitizeAttributeValue(pval:toString())
					do params:setString(pnamestr, pvalstr) end
				end
			end
			::_continue1::
		end
		do
			local els = element:toString()
			if c == 47 then
				local e = _g.jk.xml.MarkupLanguageParser.EndElement._construct0(_g.jk.xml.MarkupLanguageParser.EndElement._create())
				do e:setName(els) end
				do e:setPosition(pos) end
				self.nextQueue = e
			end
			do
				local v = _g.jk.xml.MarkupLanguageParser.StartElement._construct0(_g.jk.xml.MarkupLanguageParser.StartElement._create())
				do v:setPosition(pos) end
				do v:setName(els) end
				do v:setParams(params) end
				do return v end
			end
		end
	end
end

function jk.xml.MarkupLanguageParser:sanitizeAttributeValue(str)
	if not _g.jk.lang.String:contains(str, "&quot;") then
		do return str end
	end
	do return _g.jk.lang.String:replaceString(str, "&quot;", "\"") end
end

function jk.xml.MarkupLanguageParser:isOnlyWhiteSpace(str)
	if str == nil then
		do return true end
	end
	do
		local array = _g.jk.lang.String:toCharArray(str)
		if array ~= nil then
			local n = 0
			local m = #array
			do
				n = 0
				while n < m do
					local c = array[n + 1]
					if c == 32 or c == 9 or c == 10 or c == 13 then
					else
						do return false end
					end
					do n = n + 1 end
				end
			end
		end
		do return true end
	end
end

function jk.xml.MarkupLanguageParser:getNextChar()
	if not (self.it ~= nil) then
		do return 0 end
	end
	do
		local v = self.it:getNextChar()
		if v > 0 then
			do self.currentPosition = self.currentPosition + 1 end
		end
		do return v end
	end
end

function jk.xml.MarkupLanguageParser:moveToPreviousChar()
	if not (self.it ~= nil) then
		do return end
	end
	if self.currentPosition > 0 then
		do self.currentPosition = self.currentPosition - 1 end
		do self.it:moveToPreviousChar() end
	end
end

function jk.xml.MarkupLanguageParser:peek()
	if self.nextQueue ~= nil then
		do return self.nextQueue end
	end
	self.nextQueue = self:next()
	do return self.nextQueue end
end

function jk.xml.MarkupLanguageParser:next()
	if self.nextQueue ~= nil then
		local v = self.nextQueue
		self.nextQueue = nil
		do return v end
	end
	do
		local pos = self.currentPosition
		local qot = false
		while self.it:hasEnded() == false do
			local cbp = self.currentPosition
			local nxb = self:getNextChar()
			if nxb < 1 then
				goto _continue2
			end
			if self.tag ~= nil then
				if nxb == 62 and not qot then
					local ts = self.tag:toString()
					self.tag = nil
					do
						local st = self:onTagString(ts, pos)
						if (_vm:to_table_with_key(st, '_isType.jk.xml.MarkupLanguageParser.StartElement') ~= nil) and self.nextQueue == nil and self:isSelfClosing(st:getName()) then
							local e = _g.jk.xml.MarkupLanguageParser.EndElement._construct0(_g.jk.xml.MarkupLanguageParser.EndElement._create())
							do e:setName(st:getName()) end
							do e:setPosition(self.it:getCurrentPosition()) end
							self.nextQueue = e
						end
						do return st end
					end
				end
				do self.tag:appendCharacter(nxb) end
				if nxb == 34 then
					if qot then
						qot = false
					else
						qot = true
					end
				end
				if nxb == 91 and self.tag:count() == _g.jk.lang.String:getLength(self.cdataStart) and _g.jk.lang.String:equals(self.cdataStart, self.tag:toString()) then
					self.tag = nil
					self.cdata = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				elseif nxb == 45 and self.tag:count() == _g.jk.lang.String:getLength(self.commentStart) and _g.jk.lang.String:equals(self.commentStart, self.tag:toString()) then
					self.tag = nil
					self.comment = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				end
			elseif self.cdata ~= nil then
				local c0 = nxb
				local c1 = 0
				local c2 = 0
				if c0 == 93 then
					c1 = self:getNextChar()
					if c1 == 93 then
						c2 = self:getNextChar()
						if c2 == 62 then
							local dd = self.cdata:toString()
							self.cdata = nil
							do
								local v = _g.jk.xml.MarkupLanguageParser.CharacterData._construct0(_g.jk.xml.MarkupLanguageParser.CharacterData._create())
								do v:setPosition(pos) end
								do v:setData(dd) end
								do return v end
							end
						else
							do self:moveToPreviousChar() end
							do self:moveToPreviousChar() end
							do self.cdata:appendCharacter(c0) end
						end
					else
						do self:moveToPreviousChar() end
						do self.cdata:appendCharacter(c0) end
					end
				else
					do self.cdata:appendCharacter(c0) end
				end
			elseif self.comment ~= nil then
				local c0 = nxb
				local c1 = 0
				local c2 = 0
				if c0 == 45 then
					c1 = self:getNextChar()
					if c1 == 45 then
						c2 = self:getNextChar()
						if c2 == 62 then
							local ct = self.comment:toString()
							self.comment = nil
							do
								local v = _g.jk.xml.MarkupLanguageParser.Comment._construct0(_g.jk.xml.MarkupLanguageParser.Comment._create())
								do v:setPosition(pos) end
								do v:setText(ct) end
								do return v end
							end
						else
							do self:moveToPreviousChar() end
							do self:moveToPreviousChar() end
							do self.comment:appendCharacter(c0) end
						end
					else
						do self:moveToPreviousChar() end
						do self.comment:appendCharacter(c0) end
					end
				else
					do self.comment:appendCharacter(c0) end
				end
			elseif nxb == 60 then
				if self.def ~= nil then
					local cd = self.def:toString()
					self.def = nil
					if self.ignoreWhiteSpace and cd ~= nil then
						if self:isOnlyWhiteSpace(cd) then
							cd = nil
							pos = cbp
						end
					end
					if cd ~= nil then
						do self:moveToPreviousChar() end
						do
							local v = _g.jk.xml.MarkupLanguageParser.TextData._construct0(_g.jk.xml.MarkupLanguageParser.TextData._create())
							do v:setPosition(pos) end
							do v:setData(cd) end
							do return v end
						end
					end
				end
				self.tag = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			else
				if self.def == nil then
					self.def = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				end
				do self.def:appendCharacter(nxb) end
			end
			::_continue2::
		end
		do return nil end
	end
end

function jk.xml.MarkupLanguageParser:isSelfClosing(tag)
	do return false end
end

function jk.xml.MarkupLanguageParser:getIgnoreWhiteSpace()
	do return self.ignoreWhiteSpace end
end

function jk.xml.MarkupLanguageParser:setIgnoreWhiteSpace(v)
	self.ignoreWhiteSpace = v
	do return self end
end

jk.xml.HTMLParser = _g.jk.xml.MarkupLanguageParser._create()
jk.xml.HTMLParser.__index = jk.xml.HTMLParser
_vm:set_metatable(jk.xml.HTMLParser, {
	__index = _g.jk.xml.MarkupLanguageParser
})

function jk.xml.HTMLParser._create()
	local v = _vm:set_metatable({}, jk.xml.HTMLParser)
	return v
end

function jk.xml.HTMLParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.HTMLParser'
	self['_isType.jk.xml.HTMLParser'] = true
	self.emptyTags = nil
end

function jk.xml.HTMLParser:_construct0()
	jk.xml.HTMLParser._init(self)
	do _g.jk.xml.MarkupLanguageParser._construct0(self) end
	return self
end

function jk.xml.HTMLParser:forString(string)
	if not (string ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.xml.HTMLParser._construct0(_g.jk.xml.HTMLParser._create())
		v.it = _g.jk.lang.CharacterIteratorForString:forString(string)
		do return v end
	end
end

function jk.xml.HTMLParser:parseAsVectorObject(xml, ignoreWhiteSpace)
	local root = nil
	local stack = _g.jk.lang.Stack._construct0(_g.jk.lang.Stack._create())
	local pp = _g.jk.xml.HTMLParser:forString(xml)
	do pp:setIgnoreWhiteSpace(ignoreWhiteSpace) end
	while true do
		local o = pp:next()
		if o == nil then
			do break end
		end
		if (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.StartElement') ~= nil) then
			local name = o:getName()
			if name == "?xml" then
				goto _continue3
			end
			do
				local nn = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
				do nn:setString("name", name) end
				do nn:setObject("attributes", o:getParams()) end
				if stack:isEmpty() then
					do stack:push(nn) end
				else
					local current = stack:peek()
					local children = current:getDynamicVector("children")
					if children == nil then
						children = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
						do current:setObject("children", children) end
					end
					do children:appendObject(nn) end
					do stack:push(nn) end
				end
			end
		elseif (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.EndElement') ~= nil) then
			local e = stack:pop()
			if stack:isEmpty() then
				if root == nil then
					root = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
				end
				do root:appendObject(e) end
			end
		elseif (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.TextData') ~= nil) then
			local current = stack:peek()
			if current ~= nil then
				local children = current:getDynamicVector("children")
				if children == nil then
					children = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
					do current:setObject("children", children) end
				end
				do children:appendObject(o:getData()) end
			end
		end
		::_continue3::
	end
	do return root end
end

function jk.xml.HTMLParser:isSelfClosing(tag)
	if self.emptyTags == nil then
		self.emptyTags = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
		do self.emptyTags:add("!doctype") end
		do self.emptyTags:add("area") end
		do self.emptyTags:add("base") end
		do self.emptyTags:add("br") end
		do self.emptyTags:add("col") end
		do self.emptyTags:add("embed") end
		do self.emptyTags:add("hr") end
		do self.emptyTags:add("img") end
		do self.emptyTags:add("input") end
		do self.emptyTags:add("link") end
		do self.emptyTags:add("meta") end
		do self.emptyTags:add("param") end
		do self.emptyTags:add("source") end
		do self.emptyTags:add("track") end
		do self.emptyTags:add("wbr") end
	end
	do return self.emptyTags:contains(tag) end
end

jk.xml.XMLParserAdapter = {}
jk.xml.XMLParserAdapter.__index = jk.xml.XMLParserAdapter
_vm:set_metatable(jk.xml.XMLParserAdapter, {})

function jk.xml.XMLParserAdapter._create()
	local v = _vm:set_metatable({}, jk.xml.XMLParserAdapter)
	return v
end

function jk.xml.XMLParserAdapter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLParserAdapter'
	self['_isType.jk.xml.XMLParserAdapter'] = true
	self.fileName = nil
	self.xmlString = nil
	self.values = nil
	self.lines = nil
	self.currentPosition = 0
	self.autoSkipTextAndComments = true
	self.skipCommentsInText = true
end

function jk.xml.XMLParserAdapter:_construct0()
	jk.xml.XMLParserAdapter._init(self)
	return self
end

jk.xml.XMLParserAdapter.StringElement = {}
jk.xml.XMLParserAdapter.StringElement.__index = jk.xml.XMLParserAdapter.StringElement
_vm:set_metatable(jk.xml.XMLParserAdapter.StringElement, {})

function jk.xml.XMLParserAdapter.StringElement._create()
	local v = _vm:set_metatable({}, jk.xml.XMLParserAdapter.StringElement)
	return v
end

function jk.xml.XMLParserAdapter.StringElement:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLParserAdapter.StringElement'
	self['_isType.jk.xml.XMLParserAdapter.StringElement'] = true
	self.name = nil
	self.params = nil
	self.content = nil
end

function jk.xml.XMLParserAdapter.StringElement:_construct0()
	jk.xml.XMLParserAdapter.StringElement._init(self)
	return self
end

function jk.xml.XMLParserAdapter.StringElement:getName()
	do return self.name end
end

function jk.xml.XMLParserAdapter.StringElement:setName(v)
	self.name = v
	do return self end
end

function jk.xml.XMLParserAdapter.StringElement:getParams()
	do return self.params end
end

function jk.xml.XMLParserAdapter.StringElement:setParams(v)
	self.params = v
	do return self end
end

function jk.xml.XMLParserAdapter.StringElement:getContent()
	do return self.content end
end

function jk.xml.XMLParserAdapter.StringElement:setContent(v)
	self.content = v
	do return self end
end

jk.xml.XMLParserAdapter.Position = {}
jk.xml.XMLParserAdapter.Position.__index = jk.xml.XMLParserAdapter.Position
_vm:set_metatable(jk.xml.XMLParserAdapter.Position, {})

function jk.xml.XMLParserAdapter.Position._create()
	local v = _vm:set_metatable({}, jk.xml.XMLParserAdapter.Position)
	return v
end

function jk.xml.XMLParserAdapter.Position:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLParserAdapter.Position'
	self['_isType.jk.xml.XMLParserAdapter.Position'] = true
	self.row = 0
	self.column = 0
end

function jk.xml.XMLParserAdapter.Position:_construct0()
	jk.xml.XMLParserAdapter.Position._init(self)
	return self
end

function jk.xml.XMLParserAdapter.Position:getRow()
	do return self.row end
end

function jk.xml.XMLParserAdapter.Position:setRow(v)
	self.row = v
	do return self end
end

function jk.xml.XMLParserAdapter.Position:getColumn()
	do return self.column end
end

function jk.xml.XMLParserAdapter.Position:setColumn(v)
	self.column = v
	do return self end
end

function jk.xml.XMLParserAdapter:initializeForFile(file, fileName)
	if not (file ~= nil) then
		do return false end
	end
	do
		local fn = fileName
		if fn == nil then
			fn = file:getPath()
		end
		do
			local buffer = file:getContentsBuffer()
			if not (buffer ~= nil) then
				do return false end
			end
			do
				local text = _g.jk.text.StringBufferDecoder:decodeBufferWithBOM(buffer, false)
				if not (text ~= nil) then
					do return false end
				end
				do return self:initializeForString(text, fn) end
			end
		end
	end
end

function jk.xml.XMLParserAdapter:initializeForString(text, fileName)
	if not (text ~= nil) then
		do return false end
	end
	do
		local pp = _g.jk.xml.XMLParser:forString(text)
		if not (pp ~= nil) then
			do return false end
		end
		do self:setFileName(fileName) end
		do self:setXmlString(text) end
		do self:initialize(pp) end
		do return true end
	end
end

function jk.xml.XMLParserAdapter:executeForFile(ctx, file, fileName)
	if not (file ~= nil) then
		do _g.jk.log.Log:error(ctx, "null file") end
		do return false end
	end
	if not self:initializeForFile(file, fileName) then
		do _g.jk.log.Log:error(ctx, "Failed to process XML file: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'") end
		do return false end
	end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:execute() end
		end)
		if _err then
			if (_vm:to_table_with_key(_err, '_isType.jk.lang.ExceptionWithString') ~= nil) then
				local e = _err
				do _g.jk.log.Log:error(ctx, e:toString()) end
				do return false end
			else
				_vm:throw_error(_err)
			end
		end
	end
	do return true end
end

function jk.xml.XMLParserAdapter:executeForString(ctx, text, fileName)
	if not (text ~= nil) then
		do _g.jk.log.Log:error(ctx, "null text") end
		do return false end
	end
	if not self:initializeForString(text, fileName) then
		do _g.jk.log.Log:error(ctx, "Failed to process XML string") end
		do return false end
	end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:execute() end
		end)
		if _err then
			if (_vm:to_table_with_key(_err, '_isType.jk.lang.ExceptionWithString') ~= nil) then
				local e = _err
				do _g.jk.log.Log:error(ctx, e:toString()) end
				do return false end
			else
				_vm:throw_error(_err)
			end
		end
	end
	do return true end
end

function jk.xml.XMLParserAdapter:initialize(parser)
	self.values = {}
	if parser ~= nil then
		local first = true
		while true do
			local vv = parser:next()
			if not (vv ~= nil) then
				do break end
			end
			if first then
				if (_vm:to_table_with_key(vv, '_isType.jk.xml.MarkupLanguageParser.CharacterData') ~= nil) or (_vm:to_table_with_key(vv, '_isType.jk.xml.MarkupLanguageParser.Comment') ~= nil) or (_vm:to_table_with_key(vv, '_isType.jk.xml.MarkupLanguageParser.TextData') ~= nil) then
				elseif (_vm:to_table_with_key(vv, '_isType.jk.xml.MarkupLanguageParser.StartElement') ~= nil) and vv:getName() == "?xml" then
					first = false
					goto _continue4
				else
					first = false
				end
			end
			do _g.jk.lang.Vector:append(self.values, vv) end
			::_continue4::
		end
	end
	self.currentPosition = 0
end

function jk.xml.XMLParserAdapter:expect(text)
	do self:error("Expecting: " .. _g.jk.lang.String:safeString(text)) end
end

function jk.xml.XMLParserAdapter:unsupported(element)
	if element ~= nil then
		do self:error("Unsupported element inside `" .. _g.jk.lang.String:safeString(element:getName()) .. "'") end
	else
		do self:error("Unsupported element") end
	end
end

function jk.xml.XMLParserAdapter:error(message)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local value = self:parserPeek()
	if value ~= nil then
		local name = self:getFileName()
		local token = nil
		if (_vm:to_table_with_key(value, '_isType.jk.xml.MarkupLanguageParser.StartElement') ~= nil) then
			token = value:getName()
		elseif (_vm:to_table_with_key(value, '_isType.jk.xml.MarkupLanguageParser.EndElement') ~= nil) then
			token = "/" .. _g.jk.lang.String:safeString(value:getName())
		elseif (_vm:to_table_with_key(value, '_isType.jk.xml.MarkupLanguageParser.CharacterData') ~= nil) then
			token = value:getData()
		elseif (_vm:to_table_with_key(value, '_isType.jk.xml.MarkupLanguageParser.TextData') ~= nil) then
			token = value:getData()
		elseif (_vm:to_table_with_key(value, '_isType.jk.xml.MarkupLanguageParser.Comment') ~= nil) then
			token = "<!-- " .. _g.jk.lang.String:safeString(value:getText()) .. " -->"
		else
			token = "(unknown)"
		end
		do
			local pp = _g.jk.xml.XMLParserAdapter.Position._construct0(_g.jk.xml.XMLParserAdapter.Position._create())
			do self:calculatePosition(value:getPosition(), pp) end
			do
				local lineNumber = pp:getRow()
				local columnNumber = pp:getColumn()
				local contentLine = self:getContentLine(pp:getRow())
				do sb:appendString(name) end
				if lineNumber >= 0 then
					do sb:appendCharacter(58) end
					do sb:appendInteger(lineNumber + 1) end
					if columnNumber >= 0 then
						do sb:appendCharacter(58) end
						do sb:appendInteger(columnNumber + 1) end
					end
				end
				if _g.jk.lang.String:isEmpty(token) == false then
					do sb:appendString(" (`") end
					do sb:appendString(token) end
					do sb:appendString("')") end
				end
				do sb:appendString(": ") end
				do sb:appendString(message) end
				if contentLine ~= nil then
					do sb:appendCharacter(10) end
					do
						local it = _g.jk.lang.String:iterate(contentLine)
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
						if columnNumber >= 0 then
							do sb:appendCharacter(10) end
							do
								local n = 0
								do
									n = 0
									while n < columnNumber do
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
			end
		end
	else
		do sb:appendString(message) end
	end
	_vm:throw_error(_g.jk.lang.ExceptionWithString:forString(sb:toString(), false))
end

function jk.xml.XMLParserAdapter:isEmptyString(string)
	if _g.jk.lang.String:isEmpty(string) then
		do return true end
	end
	do
		local it = _g.jk.lang.String:iterate(string)
		while it ~= nil do
			local c = it:getNextChar()
			if c < 1 then
				do break end
			end
			if c == 32 or c == 9 or c == 13 or c == 10 then
				goto _continue5
			end
			do return false end
			::_continue5::
		end
		do return true end
	end
end

function jk.xml.XMLParserAdapter:parserPeek()
	if not (self.values ~= nil) then
		do return nil end
	end
	if not (self.currentPosition >= 0) then
		do return nil end
	end
	if not (self.currentPosition < _g.jk.lang.Vector:getSize(self.values)) then
		do return nil end
	end
	do return self.values[self.currentPosition + 1] end
end

function jk.xml.XMLParserAdapter:parserNext()
	local v = self:parserPeek()
	if v ~= nil then
		do self.currentPosition = self.currentPosition + 1 end
	end
	do return v end
end

function jk.xml.XMLParserAdapter:parserPrev()
	if self.currentPosition < 1 then
		do return nil end
	end
	do self.currentPosition = self.currentPosition - 1 end
	do return self:parserPeek() end
end

function jk.xml.XMLParserAdapter:acceptStartElement(name)
	local oo = self:getCurrentPosition()
	if self.autoSkipTextAndComments then
		do self:skipTextAndComments() end
	end
	do
		local nn = _vm:to_table_with_key(self:parserPeek(), '_isType.jk.xml.MarkupLanguageParser.StartElement')
		if not (nn ~= nil) then
			do return nil end
		end
		if name == nil or nn:getName() == name then
			do self:parserNext() end
			do return nn end
		end
		do self:setCurrentPosition(oo) end
		do return nil end
	end
end

function jk.xml.XMLParserAdapter:parseStartElement(name)
	local v = self:acceptStartElement(name)
	if not (v ~= nil) then
		if name ~= nil then
			do self:expect("Start element `" .. _g.jk.lang.String:safeString(name) .. "'") end
		else
			do self:expect("Start element") end
		end
	end
	do return v end
end

function jk.xml.XMLParserAdapter:acceptAnyEndElement()
	do return self:acceptEndElementWithName(nil) end
end

function jk.xml.XMLParserAdapter:acceptEndElementWithName(name)
	local oo = self:getCurrentPosition()
	if self.autoSkipTextAndComments then
		do self:skipTextAndComments() end
	end
	do
		local nn = _vm:to_table_with_key(self:parserPeek(), '_isType.jk.xml.MarkupLanguageParser.EndElement')
		if not (nn ~= nil) then
			do return nil end
		end
		if name == nil or nn:getName() == name then
			do self:parserNext() end
			do return nn end
		end
		do self:setCurrentPosition(oo) end
		do return nil end
	end
end

function jk.xml.XMLParserAdapter:acceptEndElement(element)
	if not (element ~= nil) then
		do return self:acceptEndElementWithName(nil) end
	end
	do return self:acceptEndElementWithName(element:getName()) end
end

function jk.xml.XMLParserAdapter:parseAnyEndElement()
	do return self:parseEndElementWithName(nil) end
end

function jk.xml.XMLParserAdapter:parseEndElementWithName(name)
	local v = self:acceptEndElementWithName(name)
	if not (v ~= nil) then
		if name ~= nil then
			do self:expect("End element `" .. _g.jk.lang.String:safeString(name) .. "'") end
		else
			do self:expect("End element") end
		end
	end
	do return v end
end

function jk.xml.XMLParserAdapter:parseEndElement(element)
	if not (element ~= nil) then
		do return self:parseEndElementWithName(nil) end
	end
	do return self:parseEndElementWithName(element:getName()) end
end

function jk.xml.XMLParserAdapter:acceptSingleElement(name)
	local oo = self:getCurrentPosition()
	local element = self:acceptStartElement(name)
	if not (element ~= nil) then
		do return nil end
	end
	if not (self:acceptEndElementWithName(name) ~= nil) then
		do self:setCurrentPosition(oo) end
		do return nil end
	end
	do return element end
end

function jk.xml.XMLParserAdapter:parseSingleElement(name)
	local v = self:acceptSingleElement(name)
	if not (v ~= nil) then
		if name ~= nil then
			do self:expect("Single element: `" .. _g.jk.lang.String:safeString(name) .. "'") end
		else
			do self:expect("Single element") end
		end
	end
	do return v end
end

function jk.xml.XMLParserAdapter:acceptStringElement(tagName)
	local oo = self:getCurrentPosition()
	local start = self:acceptStartElement(tagName)
	if not (start ~= nil) then
		do return nil end
	end
	do
		local str = self:acceptText(false)
		local _end = self:acceptEndElementWithName(start:getName())
		if not (_end ~= nil) then
			do self:setCurrentPosition(oo) end
			do return nil end
		end
		if not (str ~= nil) then
			str = ""
		end
		do
			local v = _g.jk.xml.XMLParserAdapter.StringElement._construct0(_g.jk.xml.XMLParserAdapter.StringElement._create())
			do v:setName(start:getName()) end
			do v:setParams(start:getParams()) end
			do v:setContent(str) end
			do return v end
		end
	end
end

function jk.xml.XMLParserAdapter:parseStringElement(tagName)
	local v = self:acceptStringElement(tagName)
	if not (v ~= nil) then
		do self:expect("String element") end
		do return nil end
	end
	do return v end
end

function jk.xml.XMLParserAdapter:acceptStringElementData(tagName)
	local v = self:acceptStringElement(tagName)
	if not (v ~= nil) then
		do return nil end
	end
	do return v:getContent() end
end

function jk.xml.XMLParserAdapter:parseStringElementData(tagName)
	local v = self:acceptStringElementData(tagName)
	if not (v ~= nil) then
		do self:expect("String element") end
		do return nil end
	end
	do return v end
end

function jk.xml.XMLParserAdapter:acceptElementTree(name, startHandler, childHandler)
	local element = self:acceptStartElement(name)
	if not (element ~= nil) then
		do return false end
	end
	if startHandler ~= nil then
		do startHandler(element) end
	end
	while true do
		if childHandler ~= nil and childHandler() then
			goto _continue6
		end
		if self:acceptEndElement(element) ~= nil then
			do break end
		end
		do self:unsupported(element) end
		::_continue6::
	end
	do return true end
end

function jk.xml.XMLParserAdapter:acceptText(force)
	local sb = nil
	while true do
		local cc = self:parserPeek()
		if not (cc ~= nil) then
			do break end
		end
		if self.skipCommentsInText then
			if (_vm:to_table_with_key(cc, '_isType.jk.xml.MarkupLanguageParser.Comment') ~= nil) then
				do self:parserNext() end
				goto _continue7
			end
		end
		if (_vm:to_table_with_key(cc, '_isType.jk.xml.MarkupLanguageParser.CharacterData') ~= nil) or (_vm:to_table_with_key(cc, '_isType.jk.xml.MarkupLanguageParser.TextData') ~= nil) then
			local txt = self:getTextData(cc)
			if _g.jk.lang.String:isNotEmpty(txt) then
				if sb == nil then
					sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				end
				do sb:appendString(txt) end
			end
			do self:parserNext() end
			goto _continue7
		end
		do break end
		::_continue7::
	end
	if sb == nil then
		if force then
			do return "" end
		end
		do return nil end
	end
	do
		local v = sb:toString()
		if v == nil and force then
			do return "" end
		end
		do return v end
	end
end

function jk.xml.XMLParserAdapter:parseText()
	local v = self:acceptText(false)
	if not (v ~= nil) then
		v = ""
	end
	do return v end
end

function jk.xml.XMLParserAdapter:skipTextAndComments()
	while true do
		local cc = self:parserPeek()
		if not (cc ~= nil) then
			do break end
		end
		if (_vm:to_table_with_key(cc, '_isType.jk.xml.MarkupLanguageParser.Comment') ~= nil) then
			do self:parserNext() end
			goto _continue8
		end
		if (_vm:to_table_with_key(cc, '_isType.jk.xml.MarkupLanguageParser.CharacterData') ~= nil) or (_vm:to_table_with_key(cc, '_isType.jk.xml.MarkupLanguageParser.TextData') ~= nil) then
			local txt = self:getTextData(cc)
			if self:isEmptyString(txt) then
				do self:parserNext() end
				goto _continue8
			end
		end
		do break end
		::_continue8::
	end
end

function jk.xml.XMLParserAdapter:acceptKeyValuePair()
	local oo = self:getCurrentPosition()
	local ss = self:acceptStartElement(nil)
	if not (ss ~= nil) then
		do self:setCurrentPosition(oo) end
		do return nil end
	end
	do
		local tt = self:acceptText(false)
		if not (tt ~= nil) then
			do self:setCurrentPosition(oo) end
			do return nil end
		end
		do
			local ee = self:acceptEndElementWithName(ss:getName())
			if not (ee ~= nil) then
				do self:setCurrentPosition(oo) end
				do return nil end
			end
			do
				local v = _g.jk.lang.KeyValuePair._construct0(_g.jk.lang.KeyValuePair._create())
				v.key = ss:getName()
				v.value = tt
				do return v end
			end
		end
	end
end

function jk.xml.XMLParserAdapter:parseKeyValuePair()
	local v = self:acceptKeyValuePair()
	if not (v ~= nil) then
		do self:expect("Key/value pair") end
	end
	do return v end
end

function jk.xml.XMLParserAdapter:calculatePosition(pos, result)
	if not (result ~= nil) then
		do return end
	end
	do result:setRow(0) end
	do result:setColumn(0) end
	do
		local text = self:getXmlString()
		if text ~= nil then
			local p = 0
			local nr = 0
			local nc = 0
			local it = _g.jk.lang.String:iterate(text)
			while it ~= nil do
				if p == pos then
					do result:setRow(nr) end
					do result:setColumn(nc) end
					do break end
				end
				do
					local c = it:getNextChar()
					if c < 1 then
						do break end
					end
					if c == 10 then
						do nr = nr + 1 end
						nc = 0
					else
						do nc = nc + 1 end
					end
					do p = p + 1 end
				end
			end
		end
	end
end

function jk.xml.XMLParserAdapter:getTextData(elem)
	if (_vm:to_table_with_key(elem, '_isType.jk.xml.MarkupLanguageParser.CharacterData') ~= nil) then
		do return elem:getData() end
	end
	if (_vm:to_table_with_key(elem, '_isType.jk.xml.MarkupLanguageParser.TextData') ~= nil) then
		do return elem:getData() end
	end
	do return nil end
end

function jk.xml.XMLParserAdapter:getLines()
	if not (self.lines ~= nil) then
		local text = self:getXmlString()
		if text ~= nil then
			self.lines = _g.jk.lang.String:split(text, 10, 0)
		end
	end
	do return self.lines end
end

function jk.xml.XMLParserAdapter:getContentLine(n)
	if n < 0 then
		do return nil end
	end
	do
		local lines = self:getLines()
		if not (lines ~= nil) then
			do return nil end
		end
		if n < 0 or n >= _g.jk.lang.Vector:getSize(lines) then
			do return nil end
		end
		do return lines[n + 1] end
	end
end

function jk.xml.XMLParserAdapter:execute()
end

function jk.xml.XMLParserAdapter:getFileName()
	do return self.fileName end
end

function jk.xml.XMLParserAdapter:setFileName(v)
	self.fileName = v
	do return self end
end

function jk.xml.XMLParserAdapter:getXmlString()
	do return self.xmlString end
end

function jk.xml.XMLParserAdapter:setXmlString(v)
	self.xmlString = v
	do return self end
end

function jk.xml.XMLParserAdapter:getCurrentPosition()
	do return self.currentPosition end
end

function jk.xml.XMLParserAdapter:setCurrentPosition(v)
	self.currentPosition = v
	do return self end
end

function jk.xml.XMLParserAdapter:getAutoSkipTextAndComments()
	do return self.autoSkipTextAndComments end
end

function jk.xml.XMLParserAdapter:setAutoSkipTextAndComments(v)
	self.autoSkipTextAndComments = v
	do return self end
end

function jk.xml.XMLParserAdapter:getSkipCommentsInText()
	do return self.skipCommentsInText end
end

function jk.xml.XMLParserAdapter:setSkipCommentsInText(v)
	self.skipCommentsInText = v
	do return self end
end

jk.xml.XMLParser = _g.jk.xml.MarkupLanguageParser._create()
jk.xml.XMLParser.__index = jk.xml.XMLParser
_vm:set_metatable(jk.xml.XMLParser, {
	__index = _g.jk.xml.MarkupLanguageParser
})

function jk.xml.XMLParser._create()
	local v = _vm:set_metatable({}, jk.xml.XMLParser)
	return v
end

function jk.xml.XMLParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLParser'
	self['_isType.jk.xml.XMLParser'] = true
end

function jk.xml.XMLParser:_construct0()
	jk.xml.XMLParser._init(self)
	do _g.jk.xml.MarkupLanguageParser._construct0(self) end
	return self
end

function jk.xml.XMLParser:forFile(file)
	if not (file ~= nil) then
		do return nil end
	end
	do
		local reader = file:read()
		if not (reader ~= nil) then
			do return nil end
		end
		do
			local v = _g.jk.xml.XMLParser._construct0(_g.jk.xml.XMLParser._create())
			v.it = _g.jk.io.CharacterIteratorForReader._construct1(_g.jk.io.CharacterIteratorForReader._create(), reader)
			do return v end
		end
	end
end

function jk.xml.XMLParser:forString(string)
	if not (string ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.xml.XMLParser._construct0(_g.jk.xml.XMLParser._create())
		v.it = _g.jk.lang.CharacterIteratorForString:forString(string)
		do return v end
	end
end

function jk.xml.XMLParser:forIterator(it)
	if not (it ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.xml.XMLParser._construct0(_g.jk.xml.XMLParser._create())
		v.it = it
		do return v end
	end
end

function jk.xml.XMLParser:parseAsTreeObject(xml, ignoreWhiteSpace)
	local root = nil
	local stack = _g.jk.lang.Stack._construct0(_g.jk.lang.Stack._create())
	local pp = _g.jk.xml.XMLParser:forString(xml)
	do pp:setIgnoreWhiteSpace(ignoreWhiteSpace) end
	while true do
		local o = pp:next()
		if o == nil then
			do break end
		end
		if (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.StartElement') ~= nil) then
			local name = o:getName()
			if root == nil and name == "?xml" then
				goto _continue9
			end
			do
				local nn = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
				do nn:setString("name", name) end
				do nn:setObject("attributes", o:getParams()) end
				if root == nil then
					root = nn
					do stack:push(nn) end
				else
					local current = stack:peek()
					if current == nil then
						current = root
					end
					do
						local children = current:getDynamicVector("children")
						if children == nil then
							children = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
							do current:setObject("children", children) end
						end
						do children:appendObject(nn) end
						do stack:push(nn) end
					end
				end
			end
		elseif (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.EndElement') ~= nil) then
			do stack:pop() end
		elseif (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.CharacterData') ~= nil) or (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.TextData') ~= nil) then
			local current = stack:peek()
			if current ~= nil then
				local children = current:getDynamicVector("children")
				if children == nil then
					children = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
					do current:setObject("children", children) end
				end
				do
					local data = nil
					if (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.CharacterData') ~= nil) then
						data = o:getData()
					else
						data = o:getData()
					end
					do children:appendObject(data) end
				end
			end
		end
		::_continue9::
	end
	do return root end
end

jk.xml.XMLDOMNode = {}
jk.xml.XMLDOMNode.__index = jk.xml.XMLDOMNode
_vm:set_metatable(jk.xml.XMLDOMNode, {})

function jk.xml.XMLDOMNode._create()
	local v = _vm:set_metatable({}, jk.xml.XMLDOMNode)
	return v
end

function jk.xml.XMLDOMNode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLDOMNode'
	self['_isType.jk.xml.XMLDOMNode'] = true
	self.name = nil
	self.data = nil
	self.attributes = nil
	self.children = nil
end

function jk.xml.XMLDOMNode:_construct0()
	jk.xml.XMLDOMNode._init(self)
	return self
end

function jk.xml.XMLDOMNode:getDOMNodesByName(name)
	if not (self.children ~= nil and _g.jk.lang.Vector:getSize(self.children) > 0) then
		do return nil end
	end
	do
		local elements = {}
		if self.children ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self.children)
			do
				n = 0
				while n < m do
					local child = self.children[n + 1]
					if child ~= nil then
						if _g.jk.lang.String:equals(child.name, name) then
							do _g.jk.lang.Vector:append(elements, child) end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do return elements end
	end
end

function jk.xml.XMLDOMNode:getAttribute(name)
	if not (self.attributes ~= nil) then
		do return nil end
	end
	do return self.attributes:getString(name, nil) end
end

function jk.xml.XMLDOMNode:toString(tabCount)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local tb = tabCount
	if tb < 0 then
		tb = 0
	end
	do
		local i = 0
		while i < tb do
			do sb:appendString("\t") end
			do i = i + 1 end
		end
		if _g.jk.lang.String:equals(self.name, "cdata") then
			do sb:appendString("<![CDATA[") end
			do sb:appendString(self.data) end
			do sb:appendString("]]>") end
			do return sb:toString() end
		end
		do sb:appendString("<") end
		do sb:appendString(self.name) end
		if self.attributes ~= nil then
			local array = self.attributes:getKeys()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local name = array[n + 1]
						if name ~= nil then
							do sb:appendString(" " .. _g.jk.lang.String:safeString(name) .. "=\"" .. _g.jk.lang.String:safeString(self.attributes:getString(name, nil)) .. "\"") end
						end
						do n = n + 1 end
					end
				end
			end
		end
		do sb:appendString(">") end
		if self.children ~= nil and _g.jk.lang.Vector:getSize(self.children) > 0 then
			if self.children ~= nil then
				local n2 = 0
				local m2 = _g.jk.lang.Vector:getSize(self.children)
				do
					n2 = 0
					while n2 < m2 do
						local child = self.children[n2 + 1]
						if child ~= nil then
							do sb:appendString("\n") end
							do sb:appendString(child:toString(tb + 1)) end
						end
						do n2 = n2 + 1 end
					end
				end
			end
			do sb:appendString("\n") end
			i = 0
			while i < tb do
				do sb:appendString("\t") end
				do i = i + 1 end
			end
		else
			do sb:appendString(self.data) end
		end
		do sb:appendString("</") end
		do sb:appendString(self.name) end
		do sb:appendString(">") end
		do return sb:toString() end
	end
end

jk.xml.HTMLString = {}
jk.xml.HTMLString.__index = jk.xml.HTMLString
_vm:set_metatable(jk.xml.HTMLString, {})

function jk.xml.HTMLString._create()
	local v = _vm:set_metatable({}, jk.xml.HTMLString)
	return v
end

function jk.xml.HTMLString:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.HTMLString'
	self['_isType.jk.xml.HTMLString'] = true
end

function jk.xml.HTMLString:_construct0()
	jk.xml.HTMLString._init(self)
	return self
end

function jk.xml.HTMLString:sanitize(str)
	if not (str ~= nil) then
		do return nil end
	end
	if _g.jk.lang.String:getIndexOfCharacter(str, 60, 0) < 0 and _g.jk.lang.String:getIndexOfCharacter(str, 62, 0) < 0 and _g.jk.lang.String:getIndexOfCharacter(str, 38, 0) < 0 then
		do return str end
	end
	do
		local it = _g.jk.lang.String:iterate(str)
		if not (it ~= nil) then
			do return nil end
		end
		do
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			local c = 0
			while (function()
				c = it:getNextChar()
				do return c end
			end)() > 0 do
				if c == 60 then
					do sb:appendString("&lt;") end
				elseif c == 62 then
					do sb:appendString("&gt;") end
				elseif c == 38 then
					do sb:appendString("&amp;") end
				else
					do sb:appendCharacter(c) end
				end
			end
			do return sb:toString() end
		end
	end
end

function jk.xml.HTMLString:toQuotedString(str)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendCharacter(34) end
	if str ~= nil then
		local it = _g.jk.lang.String:iterate(str)
		while it ~= nil do
			local c = it:getNextChar()
			if c < 1 then
				do break end
			end
			if c == 34 then
				do sb:appendCharacter(92) end
				do sb:appendCharacter(34) end
			else
				do sb:appendCharacter(c) end
			end
		end
	end
	do sb:appendCharacter(34) end
	do return sb:toString() end
end

jk.xml.XMLDOM = {}
jk.xml.XMLDOM.__index = jk.xml.XMLDOM
_vm:set_metatable(jk.xml.XMLDOM, {})

function jk.xml.XMLDOM._create()
	local v = _vm:set_metatable({}, jk.xml.XMLDOM)
	return v
end

function jk.xml.XMLDOM:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.xml.XMLDOM'
	self['_isType.jk.xml.XMLDOM'] = true
end

function jk.xml.XMLDOM:_construct0()
	jk.xml.XMLDOM._init(self)
	return self
end

function jk.xml.XMLDOM:parseAsTreeObject(xml, ignoreWhiteSpace)
	local root = nil
	local stack = _g.jk.lang.Stack._construct0(_g.jk.lang.Stack._create())
	local pp = _g.jk.xml.XMLParser:forString(xml)
	do pp:setIgnoreWhiteSpace(ignoreWhiteSpace) end
	while true do
		local o = pp:next()
		if o == nil then
			do break end
		end
		if (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.StartElement') ~= nil) then
			local name = o:getName()
			if root == nil and name == "?xml" then
				goto _continue10
			end
			do
				local dn = _g.jk.xml.XMLDOMNode._construct0(_g.jk.xml.XMLDOMNode._create())
				dn.name = name
				dn.attributes = o:getParams()
				if root == nil then
					root = dn
					do stack:push(dn) end
				else
					local current = stack:peek()
					if current == nil then
						current = root
					end
					do
						local children = current.children
						if children == nil then
							children = {}
							current.children = children
						end
						do _g.jk.lang.Vector:append(children, dn) end
						do stack:push(dn) end
					end
				end
			end
		elseif (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.EndElement') ~= nil) then
			do stack:pop() end
		elseif (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.CharacterData') ~= nil) then
			local current = stack:peek()
			if current ~= nil then
				local children = current.children
				if children == nil then
					children = {}
					current.children = children
				end
				do
					local dn = _g.jk.xml.XMLDOMNode._construct0(_g.jk.xml.XMLDOMNode._create())
					dn.name = "cdata"
					dn.data = o:getData()
					do _g.jk.lang.Vector:append(children, dn) end
				end
			end
		elseif (_vm:to_table_with_key(o, '_isType.jk.xml.MarkupLanguageParser.TextData') ~= nil) then
			local current = stack:peek()
			if current ~= nil then
				current.data = o:getData()
			end
		end
		::_continue10::
	end
	do return root end
end
