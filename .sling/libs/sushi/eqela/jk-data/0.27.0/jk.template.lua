jk = jk or {}

jk.template = jk.template or {}

jk.template.RichTextParagraph = {}
jk.template.RichTextParagraph.__index = jk.template.RichTextParagraph
_vm:set_metatable(jk.template.RichTextParagraph, {})

function jk.template.RichTextParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextParagraph)
	return v
end

function jk.template.RichTextParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextParagraph'
	self['_isType.jk.template.RichTextParagraph'] = true
end

function jk.template.RichTextParagraph:_construct0()
	jk.template.RichTextParagraph._init(self)
	return self
end

function jk.template.RichTextParagraph:toMarkup()
	do return nil end
end

function jk.template.RichTextParagraph:toText()
	do return nil end
end

function jk.template.RichTextParagraph:toJson()
	do return nil end
end

function jk.template.RichTextParagraph:toHtml(refs)
	do return nil end
end

jk.template.DynamicText = {}
jk.template.DynamicText.__index = jk.template.DynamicText
_vm:set_metatable(jk.template.DynamicText, {})

function jk.template.DynamicText._create()
	local v = _vm:set_metatable({}, jk.template.DynamicText)
	return v
end

function jk.template.DynamicText:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.DynamicText'
	self['_isType.jk.template.DynamicText'] = true
	self['_isType.jk.lang.StringObject'] = true
	self._data = nil
	self.dataMapValue = nil
end

function jk.template.DynamicText:_construct0()
	jk.template.DynamicText._init(self)
	return self
end

function jk.template.DynamicText:forString(data)
	local v = _g.jk.template.DynamicText._construct0(_g.jk.template.DynamicText._create())
	do v:setData(data) end
	do return v end
end

function jk.template.DynamicText:setValue(key, value)
	do self:getDataMap():setString(key, value) end
end

function jk.template.DynamicText:getValue(key)
	do return self:getDataMap():getString(key, nil) end
end

function jk.template.DynamicText:toHtml(language, resolver)
	local map = self:getDataMap()
	local text = nil
	local format = map:getString("format", nil)
	if language ~= nil then
		text = map:getString("data_" .. _g.jk.lang.String:safeString(language), nil)
	end
	if not (text ~= nil) then
		text = map:getString("data", nil)
	end
	if not (text ~= nil) then
		do return nil end
	end
	if not (format ~= nil) then
		format = "markup"
	end
	if format == "html" then
		do return text end
	end
	if format == "text" then
		do return "<pre>" .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(text)) .. "</pre>" end
	end
	if format == "markup" then
		local rtd = _g.jk.template.RichTextDocument:forWikiMarkupString(text)
		do return rtd:toHtml(resolver) end
	end
	do _g.jk.lang.Error:throw("unsupportedContentFormat", format) end
	do return nil end
end

function jk.template.DynamicText:toString()
	do return _g.jk.json.JSONEncoder:toCompactString(self:getDataMap()) end
end

function jk.template.DynamicText:getData()
	do return self._data end
end

function jk.template.DynamicText:doSetData(value)
	self._data = value
end

function jk.template.DynamicText:setData(v)
	do self:doSetData(v) end
	do return v end
end

function jk.template.DynamicText:getDataMap()
	if not (self.dataMapValue ~= nil) then
		if _g.jk.lang.String:startsWith(self:getData(), "{", 0) then
			self.dataMapValue = _vm:to_table_with_key(_g.jk.json.JSONParser:parseString(self:getData()), '_isType.jk.lang.DynamicMap')
		end
		if not (self.dataMapValue ~= nil) then
			self.dataMapValue = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
			do self.dataMapValue:setString("data", self:getData()) end
		end
	end
	do return self.dataMapValue end
end

function jk.template.DynamicText:doSetDataMap(value)
	self.dataMapValue = value
end

function jk.template.DynamicText:setDataMap(v)
	do self:doSetDataMap(v) end
	do return v end
end

jk.template.RichTextBlockParagraph = _g.jk.template.RichTextParagraph._create()
jk.template.RichTextBlockParagraph.__index = jk.template.RichTextBlockParagraph
_vm:set_metatable(jk.template.RichTextBlockParagraph, {
	__index = _g.jk.template.RichTextParagraph
})

function jk.template.RichTextBlockParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextBlockParagraph)
	return v
end

function jk.template.RichTextBlockParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextBlockParagraph'
	self['_isType.jk.template.RichTextBlockParagraph'] = true
	self.id = nil
	self.text = nil
end

function jk.template.RichTextBlockParagraph:_construct0()
	jk.template.RichTextBlockParagraph._init(self)
	do _g.jk.template.RichTextParagraph._construct0(self) end
	return self
end

function jk.template.RichTextBlockParagraph:toMarkup()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local delim = nil
	if _g.jk.lang.String:isEmpty(self.id) then
		delim = "-- "
	else
		delim = "-- " .. _g.jk.lang.String:safeString(self.id) .. " --"
	end
	do sb:appendString(delim) end
	do sb:appendCharacter(10) end
	if self.text ~= nil then
		do sb:appendString(self.text) end
		if _g.jk.lang.String:endsWith(self.text, "\n") == false then
			do sb:appendCharacter(10) end
		end
	end
	do sb:appendString(delim) end
	do return sb:toString() end
end

function jk.template.RichTextBlockParagraph:toText()
	do return self.text end
end

function jk.template.RichTextBlockParagraph:toJson()
	local map = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do map:setString("type", "block") end
	do map:setString("id", self.id) end
	do map:setString("text", self.text) end
	do return map end
end

function jk.template.RichTextBlockParagraph:toHtml(refs)
	local ids = ""
	if _g.jk.lang.String:isEmpty(self.id) == false then
		ids = " " .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(self.id))
	end
	do
		local content = _g.jk.template.RichTextStyledParagraph:forString(self.text)
		do return "<div class=\"block" .. _g.jk.lang.String:safeString(ids) .. "\">" .. _g.jk.lang.String:safeString(content:toHtml(refs)) .. "</div>" end
	end
end

function jk.template.RichTextBlockParagraph:getId()
	do return self.id end
end

function jk.template.RichTextBlockParagraph:setId(v)
	self.id = v
	do return self end
end

function jk.template.RichTextBlockParagraph:getText()
	do return self.text end
end

function jk.template.RichTextBlockParagraph:setText(v)
	self.text = v
	do return self end
end

jk.template.TextTemplateManager = {}
jk.template.TextTemplateManager.__index = jk.template.TextTemplateManager
_vm:set_metatable(jk.template.TextTemplateManager, {})

function jk.template.TextTemplateManager._create()
	local v = _vm:set_metatable({}, jk.template.TextTemplateManager)
	return v
end

function jk.template.TextTemplateManager:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.TextTemplateManager'
	self['_isType.jk.template.TextTemplateManager'] = true
	self.templates = nil
end

function jk.template.TextTemplateManager:_construct0()
	jk.template.TextTemplateManager._init(self)
	return self
end

function jk.template.TextTemplateManager:forDirectory(dir, cached)
	if not (dir ~= nil and dir:isDirectory()) then
		do return nil end
	end
	do
		local it = dir:entries()
		if not (it ~= nil) then
			do return nil end
		end
		do
			local v = {}
			while true do
				local f = it:next()
				if not (f ~= nil) then
					do break end
				end
				if f:isFile() then
					if cached then
						local b = f:getContentsUTF8()
						if not (b ~= nil) then
							do return nil end
						end
						do _g.jk.lang.Map:set(v, f:getBasename(), b) end
						goto _continue1
					end
					do _g.jk.lang.Map:set(v, f:getBasename(), f) end
				end
				::_continue1::
			end
			do return _g.jk.template.TextTemplateManager:forTemplates(v) end
		end
	end
end

function jk.template.TextTemplateManager:forTemplates(data)
	local v = _g.jk.template.TextTemplateManager._construct0(_g.jk.template.TextTemplateManager._create())
	do v:setTemplates(data) end
	do return v end
end

function jk.template.TextTemplateManager:getTemplateData(name)
	if not (name ~= nil) then
		do return nil end
	end
	if not (self.templates ~= nil) then
		do return nil end
	end
	do
		local o = _g.jk.lang.Map:get(self.templates, name)
		if not (o ~= nil) then
			do return nil end
		end
		if (_vm:get_variable_type(o) == 'string') then
			do return o end
		end
		if _util:is_buffer(o) then
			do return _g.jk.lang.String:forUTF8Buffer(o) end
		end
		if (_vm:to_table_with_key(o, '_isType.jk.fs.File') ~= nil) then
			do return o:getContentsUTF8() end
		end
		do return nil end
	end
end

function jk.template.TextTemplateManager:getText(name, vars)
	local td = self:getTemplateData(name)
	if not (td ~= nil) then
		do return nil end
	end
	do
		local vv = vars
		if not (vv ~= nil) then
			vv = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		end
		do
			local tt = _g.jk.template.TextTemplate:forHTMLString(td, nil, self.templates, nil)
			if not (tt ~= nil) then
				do return nil end
			end
			do return tt:execute(vv, nil) end
		end
	end
end

function jk.template.TextTemplateManager:getTemplates()
	do return self.templates end
end

function jk.template.TextTemplateManager:setTemplates(v)
	self.templates = v
	do return self end
end

jk.template.RichTextListParagraph = _g.jk.template.RichTextParagraph._create()
jk.template.RichTextListParagraph.__index = jk.template.RichTextListParagraph
_vm:set_metatable(jk.template.RichTextListParagraph, {
	__index = _g.jk.template.RichTextParagraph
})

function jk.template.RichTextListParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextListParagraph)
	return v
end

function jk.template.RichTextListParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextListParagraph'
	self['_isType.jk.template.RichTextListParagraph'] = true
	self.type = nil
	self.list = nil
end

function jk.template.RichTextListParagraph:_construct0()
	jk.template.RichTextListParagraph._init(self)
	do _g.jk.template.RichTextParagraph._construct0(self) end
	return self
end

function jk.template.RichTextListParagraph:toJson()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("type", self.type) end
	do v:setObject("list", self.list) end
	do return v end
end

function jk.template.RichTextListParagraph:processList(refs, v)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if v ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(v)
		do
			n = 0
			while n < m do
				local str = v[n + 1]
				if str ~= nil then
					do sb:appendString("<li>") end
					do
						local cc = _g.jk.template.RichTextStyledParagraph:forString(str)
						if cc ~= nil then
							do sb:appendString(cc:toHtml(refs)) end
						end
						do sb:appendString("</li>") end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return sb:toString() end
end

function jk.template.RichTextListParagraph:toHtml(refs)
	local tag = ""
	if _g.jk.lang.String:equals("unordered", self.type) then
		tag = "ul"
	elseif _g.jk.lang.String:equals("ordered", self.type) then
		tag = "ol"
	end
	do return "<" .. _g.jk.lang.String:safeString(tag) .. " class=\"list\">" .. _g.jk.lang.String:safeString(self:processList(refs, self.list)) .. "</" .. _g.jk.lang.String:safeString(tag) .. ">" end
end

function jk.template.RichTextListParagraph:getType()
	do return self.type end
end

function jk.template.RichTextListParagraph:setType(v)
	self.type = v
	do return self end
end

function jk.template.RichTextListParagraph:getList()
	do return self.list end
end

function jk.template.RichTextListParagraph:setList(v)
	self.list = v
	do return self end
end

jk.template.RichTextContentParagraph = _g.jk.template.RichTextParagraph._create()
jk.template.RichTextContentParagraph.__index = jk.template.RichTextContentParagraph
_vm:set_metatable(jk.template.RichTextContentParagraph, {
	__index = _g.jk.template.RichTextParagraph
})

function jk.template.RichTextContentParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextContentParagraph)
	return v
end

function jk.template.RichTextContentParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextContentParagraph'
	self['_isType.jk.template.RichTextContentParagraph'] = true
	self.contentId = nil
end

function jk.template.RichTextContentParagraph:_construct0()
	jk.template.RichTextContentParagraph._init(self)
	do _g.jk.template.RichTextParagraph._construct0(self) end
	return self
end

function jk.template.RichTextContentParagraph:toMarkup()
	do return "@content " .. _g.jk.lang.String:safeString(self.contentId) .. "\n" end
end

function jk.template.RichTextContentParagraph:toText()
	do return "[content:" .. _g.jk.lang.String:safeString(self.contentId) .. "]\n" end
end

function jk.template.RichTextContentParagraph:toJson()
	local map = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do map:setString("type", "content") end
	do map:setString("id", self.contentId) end
	do return map end
end

function jk.template.RichTextContentParagraph:toHtml(refs)
	local cc = nil
	if refs ~= nil and self.contentId ~= nil then
		cc = refs:getContentString(self.contentId)
	end
	if cc == nil then
		cc = ""
	end
	do return cc end
end

function jk.template.RichTextContentParagraph:getContentId()
	do return self.contentId end
end

function jk.template.RichTextContentParagraph:setContentId(v)
	self.contentId = v
	do return self end
end

jk.template.RichTextSeparatorParagraph = _g.jk.template.RichTextParagraph._create()
jk.template.RichTextSeparatorParagraph.__index = jk.template.RichTextSeparatorParagraph
_vm:set_metatable(jk.template.RichTextSeparatorParagraph, {
	__index = _g.jk.template.RichTextParagraph
})

function jk.template.RichTextSeparatorParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextSeparatorParagraph)
	return v
end

function jk.template.RichTextSeparatorParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextSeparatorParagraph'
	self['_isType.jk.template.RichTextSeparatorParagraph'] = true
end

function jk.template.RichTextSeparatorParagraph:_construct0()
	jk.template.RichTextSeparatorParagraph._init(self)
	do _g.jk.template.RichTextParagraph._construct0(self) end
	return self
end

function jk.template.RichTextSeparatorParagraph:toMarkup()
	do return "-" end
end

function jk.template.RichTextSeparatorParagraph:toText()
	do return "----------" end
end

function jk.template.RichTextSeparatorParagraph:toJson()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("type", "separator") end
	do return v end
end

function jk.template.RichTextSeparatorParagraph:toHtml(refs)
	do return "<hr />\n" end
end

jk.template.RichTextPreformattedParagraph = _g.jk.template.RichTextParagraph._create()
jk.template.RichTextPreformattedParagraph.__index = jk.template.RichTextPreformattedParagraph
_vm:set_metatable(jk.template.RichTextPreformattedParagraph, {
	__index = _g.jk.template.RichTextParagraph
})

function jk.template.RichTextPreformattedParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextPreformattedParagraph)
	return v
end

function jk.template.RichTextPreformattedParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextPreformattedParagraph'
	self['_isType.jk.template.RichTextPreformattedParagraph'] = true
	self.id = nil
	self.text = nil
end

function jk.template.RichTextPreformattedParagraph:_construct0()
	jk.template.RichTextPreformattedParagraph._init(self)
	do _g.jk.template.RichTextParagraph._construct0(self) end
	return self
end

function jk.template.RichTextPreformattedParagraph:toMarkup()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local delim = nil
	if _g.jk.lang.String:isEmpty(self.id) then
		delim = "---"
	else
		delim = "--- " .. _g.jk.lang.String:safeString(self.id) .. " ---"
	end
	do sb:appendString(delim) end
	do sb:appendCharacter(10) end
	if self.text ~= nil then
		do sb:appendString(self.text) end
		if _g.jk.lang.String:endsWith(self.text, "\n") == false then
			do sb:appendCharacter(10) end
		end
	end
	do sb:appendString(delim) end
	do return sb:toString() end
end

function jk.template.RichTextPreformattedParagraph:toText()
	do return self.text end
end

function jk.template.RichTextPreformattedParagraph:toJson()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("type", "preformatted") end
	do v:setString("id", self.id) end
	do v:setString("text", self.text) end
	do return v end
end

function jk.template.RichTextPreformattedParagraph:toHtml(refs)
	local ids = ""
	if _g.jk.lang.String:isEmpty(self.id) == false then
		ids = " id=\"" .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(self.id)) .. "\""
	end
	do
		local codeo = ""
		local codec = ""
		if _g.jk.lang.String:equals("code", self.id) then
			codeo = "<code>"
			codec = "</code>"
		end
		do return "<pre" .. _g.jk.lang.String:safeString(ids) .. ">" .. _g.jk.lang.String:safeString(codeo) .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(self.text)) .. _g.jk.lang.String:safeString(codec) .. "</pre>" end
	end
end

function jk.template.RichTextPreformattedParagraph:getId()
	do return self.id end
end

function jk.template.RichTextPreformattedParagraph:setId(v)
	self.id = v
	do return self end
end

function jk.template.RichTextPreformattedParagraph:getText()
	do return self.text end
end

function jk.template.RichTextPreformattedParagraph:setText(v)
	self.text = v
	do return self end
end

jk.template.RichTextReferenceParagraph = _g.jk.template.RichTextParagraph._create()
jk.template.RichTextReferenceParagraph.__index = jk.template.RichTextReferenceParagraph
_vm:set_metatable(jk.template.RichTextReferenceParagraph, {
	__index = _g.jk.template.RichTextParagraph
})

function jk.template.RichTextReferenceParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextReferenceParagraph)
	return v
end

function jk.template.RichTextReferenceParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextReferenceParagraph'
	self['_isType.jk.template.RichTextReferenceParagraph'] = true
	self.reference = nil
	self.text = nil
end

function jk.template.RichTextReferenceParagraph:_construct0()
	jk.template.RichTextReferenceParagraph._init(self)
	do _g.jk.template.RichTextParagraph._construct0(self) end
	return self
end

function jk.template.RichTextReferenceParagraph:toMarkup()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString("@reference ") end
	do sb:appendString(self.reference) end
	if _g.jk.lang.String:isEmpty(self.text) == false then
		do sb:appendCharacter(32) end
		do sb:appendCharacter(34) end
		do sb:appendString(self.text) end
		do sb:appendCharacter(34) end
	end
	do return sb:toString() end
end

function jk.template.RichTextReferenceParagraph:toText()
	local v = self.text
	if _g.jk.lang.String:isEmpty(self.text) then
		v = self.reference
	end
	do return v end
end

function jk.template.RichTextReferenceParagraph:toJson()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("type", "reference") end
	do v:setString("reference", self.reference) end
	do v:setString("text", self.text) end
	do return v end
end

function jk.template.RichTextReferenceParagraph:toHtml(refs)
	local reftitle = nil
	local href = nil
	if _g.jk.lang.String:isEmpty(self.text) == false then
		reftitle = self.text
	end
	if _g.jk.lang.String:isEmpty(reftitle) then
		if refs ~= nil then
			reftitle = refs:getReferenceTitle(self.reference)
		else
			reftitle = self.reference
		end
	end
	if refs ~= nil then
		href = refs:getReferenceHref(self.reference)
	else
		href = self.reference
	end
	if _g.jk.lang.String:isEmpty(href) then
		do return "" end
	end
	if _g.jk.lang.String:isEmpty(reftitle) then
		reftitle = href
	end
	do return "<p class=\"reference\"><a href=\"" .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(href)) .. "\">" .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(reftitle)) .. "</a></p>\n" end
end

function jk.template.RichTextReferenceParagraph:getReference()
	do return self.reference end
end

function jk.template.RichTextReferenceParagraph:setReference(v)
	self.reference = v
	do return self end
end

function jk.template.RichTextReferenceParagraph:getText()
	do return self.text end
end

function jk.template.RichTextReferenceParagraph:setText(v)
	self.text = v
	do return self end
end

jk.template.RichTextImageParagraph = _g.jk.template.RichTextParagraph._create()
jk.template.RichTextImageParagraph.__index = jk.template.RichTextImageParagraph
_vm:set_metatable(jk.template.RichTextImageParagraph, {
	__index = _g.jk.template.RichTextParagraph
})

function jk.template.RichTextImageParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextImageParagraph)
	return v
end

function jk.template.RichTextImageParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextImageParagraph'
	self['_isType.jk.template.RichTextImageParagraph'] = true
	self.filename = nil
	self.width = 100
end

function jk.template.RichTextImageParagraph:_construct0()
	jk.template.RichTextImageParagraph._init(self)
	do _g.jk.template.RichTextParagraph._construct0(self) end
	return self
end

function jk.template.RichTextImageParagraph:toMarkup()
	if self.width >= 100 then
		do return "@image " .. _g.jk.lang.String:safeString(self.filename) .. "\n" end
	end
	if self.width >= 75 then
		do return "@image75 " .. _g.jk.lang.String:safeString(self.filename) .. "\n" end
	end
	if self.width >= 50 then
		do return "@image50 " .. _g.jk.lang.String:safeString(self.filename) .. "\n" end
	end
	do return "@image25 " .. _g.jk.lang.String:safeString(self.filename) .. "\n" end
end

function jk.template.RichTextImageParagraph:toText()
	do return "[image:" .. _g.jk.lang.String:safeString(self.filename) .. "]\n" end
end

function jk.template.RichTextImageParagraph:toJson()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("type", "image") end
	do v:setInteger("width", self.width) end
	do v:setString("filename", self.filename) end
	do return v end
end

function jk.template.RichTextImageParagraph:toHtml(refs)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if self.width >= 100 then
		do sb:appendString("<div class=\"img100\">") end
	elseif self.width >= 75 then
		do sb:appendString("<div class=\"img75\">") end
	elseif self.width >= 50 then
		do sb:appendString("<div class=\"img50\">") end
	else
		do sb:appendString("<div class=\"img25\">") end
	end
	do sb:appendString("<img src=\"" .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(self.filename)) .. "\" />") end
	do sb:appendString("</div>\n") end
	do return sb:toString() end
end

function jk.template.RichTextImageParagraph:getFilename()
	do return self.filename end
end

function jk.template.RichTextImageParagraph:setFilename(v)
	self.filename = v
	do return self end
end

function jk.template.RichTextImageParagraph:getWidth()
	do return self.width end
end

function jk.template.RichTextImageParagraph:setWidth(v)
	self.width = v
	do return self end
end

jk.template.RichTextDocument = {}
jk.template.RichTextDocument.__index = jk.template.RichTextDocument
_vm:set_metatable(jk.template.RichTextDocument, {})

function jk.template.RichTextDocument._create()
	local v = _vm:set_metatable({}, jk.template.RichTextDocument)
	return v
end

function jk.template.RichTextDocument:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextDocument'
	self['_isType.jk.template.RichTextDocument'] = true
	self.metadata = nil
	self.paragraphs = nil
end

function jk.template.RichTextDocument:forWikiMarkupFile(file)
	do return _g.jk.template.RichTextWikiMarkupParser:parseFile(file) end
end

function jk.template.RichTextDocument:forWikiMarkupString(str)
	do return _g.jk.template.RichTextWikiMarkupParser:parseString(str) end
end

function jk.template.RichTextDocument:_construct0()
	jk.template.RichTextDocument._init(self)
	self.metadata = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	return self
end

function jk.template.RichTextDocument:getTitle()
	do return self.metadata:getString("title", nil) end
end

function jk.template.RichTextDocument:setTitle(v)
	do self.metadata:setString("title", v) end
	do return self end
end

function jk.template.RichTextDocument:getAllMetadata()
	do return self.metadata end
end

function jk.template.RichTextDocument:getMetadata(k)
	do return self.metadata:getString(k, nil) end
end

function jk.template.RichTextDocument:setMetadata(k, v)
	do self.metadata:setString(k, v) end
	do return self end
end

function jk.template.RichTextDocument:addParagraph(rtp)
	if rtp == nil then
		do return self end
	end
	if self.paragraphs == nil then
		self.paragraphs = {}
	end
	do _g.jk.lang.Vector:append(self.paragraphs, rtp) end
	if self:getTitle() == nil and (_vm:to_table_with_key(rtp, '_isType.jk.template.RichTextStyledParagraph') ~= nil) and _vm:to_table_with_key(rtp, '_isType.jk.template.RichTextStyledParagraph'):getHeading() == 1 then
		do self:setTitle(_vm:to_table_with_key(rtp, '_isType.jk.template.RichTextStyledParagraph'):getTextContent()) end
	end
	do return self end
end

function jk.template.RichTextDocument:getAllReferences()
	local v = {}
	if self.paragraphs ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.paragraphs)
		do
			n = 0
			while n < m do
				local paragraph = self.paragraphs[n + 1]
				if paragraph ~= nil then
					if (_vm:to_table_with_key(paragraph, '_isType.jk.template.RichTextReferenceParagraph') ~= nil) then
						local ref = paragraph:getReference()
						if _g.jk.lang.String:isEmpty(ref) == false then
							do _g.jk.lang.Vector:append(v, ref) end
						end
					elseif (_vm:to_table_with_key(paragraph, '_isType.jk.template.RichTextStyledParagraph') ~= nil) then
						local array = paragraph:getSegments()
						if array ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(array)
							do
								n2 = 0
								while n2 < m2 do
									local segment = array[n2 + 1]
									if segment ~= nil then
										local ref = segment:getReference()
										if _g.jk.lang.String:isEmpty(ref) == false then
											do _g.jk.lang.Vector:append(v, ref) end
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
	do return v end
end

function jk.template.RichTextDocument:getAllLinks()
	local v = {}
	if self.paragraphs ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.paragraphs)
		do
			n = 0
			while n < m do
				local paragraph = self.paragraphs[n + 1]
				if paragraph ~= nil then
					if (_vm:to_table_with_key(paragraph, '_isType.jk.template.RichTextLinkParagraph') ~= nil) then
						local link = paragraph:getLink()
						if _g.jk.lang.String:isEmpty(link) == false then
							do _g.jk.lang.Vector:append(v, link) end
						end
					elseif (_vm:to_table_with_key(paragraph, '_isType.jk.template.RichTextStyledParagraph') ~= nil) then
						local array = paragraph:getSegments()
						if array ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(array)
							do
								n2 = 0
								while n2 < m2 do
									local segment = array[n2 + 1]
									if segment ~= nil then
										local link = segment:getLink()
										if _g.jk.lang.String:isEmpty(link) == false then
											do _g.jk.lang.Vector:append(v, link) end
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
	do return v end
end

function jk.template.RichTextDocument:toJson()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setObject("metadata", self.metadata) end
	do v:setString("title", self:getTitle()) end
	do
		local pp = {}
		if self.paragraphs ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self.paragraphs)
			do
				n = 0
				while n < m do
					local par = self.paragraphs[n + 1]
					if par ~= nil then
						local pj = par:toJson()
						if pj ~= nil then
							do _g.jk.lang.Vector:append(pp, pj) end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do v:setObject("paragraphs", pp) end
		do return v end
	end
end

function jk.template.RichTextDocument:toHtml(refs)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local array = self:getParagraphs()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local paragraph = array[n + 1]
				if paragraph ~= nil then
					local html = paragraph:toHtml(refs)
					if _g.jk.lang.String:isEmpty(html) == false then
						do sb:appendString(html) end
						do sb:appendCharacter(10) end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return sb:toString() end
end

function jk.template.RichTextDocument:getParagraphs()
	do return self.paragraphs end
end

function jk.template.RichTextDocument:setParagraphs(v)
	self.paragraphs = v
	do return self end
end

jk.template.RichTextDocumentReferenceResolver = {}

jk.template.RichTextWikiMarkupParser = {}
jk.template.RichTextWikiMarkupParser.__index = jk.template.RichTextWikiMarkupParser
_vm:set_metatable(jk.template.RichTextWikiMarkupParser, {})

function jk.template.RichTextWikiMarkupParser._create()
	local v = _vm:set_metatable({}, jk.template.RichTextWikiMarkupParser)
	return v
end

function jk.template.RichTextWikiMarkupParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextWikiMarkupParser'
	self['_isType.jk.template.RichTextWikiMarkupParser'] = true
	self.file = nil
	self.data = nil
	self.allowInclude = true
end

function jk.template.RichTextWikiMarkupParser:_construct0()
	jk.template.RichTextWikiMarkupParser._init(self)
	return self
end

function jk.template.RichTextWikiMarkupParser:parseFile(file)
	do return _g.jk.template.RichTextWikiMarkupParser._construct0(_g.jk.template.RichTextWikiMarkupParser._create()):setFile(file):parse() end
end

function jk.template.RichTextWikiMarkupParser:parseString(data)
	do return _g.jk.template.RichTextWikiMarkupParser._construct0(_g.jk.template.RichTextWikiMarkupParser._create()):setData(data):parse() end
end

function jk.template.RichTextWikiMarkupParser:skipEmptyLines(pr)
	local line = nil
	while not ((function()
		line = pr:readLine()
		do return line end
	end)() == nil) do
		line = _g.jk.lang.String:strip(line)
		if line ~= nil and _g.jk.lang.String:startsWith(line, "#", 0) then
			goto _continue2
		end
		if _g.jk.lang.String:isEmpty(line) == false then
			do break end
		end
		::_continue2::
	end
	do return line end
end

function jk.template.RichTextWikiMarkupParser:readPreformattedParagraph(id, pr)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local line = nil
	while not ((function()
		line = pr:readLine()
		do return line end
	end)() == nil) do
		local sline = _g.jk.lang.String:strip(line)
		if _g.jk.lang.String:startsWith(sline, "---", 0) and _g.jk.lang.String:endsWith(sline, "---") then
			local lid = _g.jk.lang.String:strip(_g.jk.lang.String:getSubString(line, 3, _g.jk.lang.String:getLength(line) - 6))
			if _g.jk.lang.String:isEmpty(id) then
				if _g.jk.lang.String:isEmpty(lid) then
					do break end
				end
			elseif _g.jk.lang.String:equals(id, lid) then
				do break end
			end
		end
		do sb:appendString(line) end
		do sb:appendCharacter(10) end
	end
	do return _g.jk.template.RichTextPreformattedParagraph._construct0(_g.jk.template.RichTextPreformattedParagraph._create()):setId(id):setText(sb:toString()) end
end

function jk.template.RichTextWikiMarkupParser:readBlockParagraph(id, pr)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local line = nil
	while not ((function()
		line = pr:readLine()
		do return line end
	end)() == nil) do
		if _g.jk.lang.String:startsWith(line, "--", 0) and _g.jk.lang.String:endsWith(line, "--") then
			local lid = _g.jk.lang.String:strip(_g.jk.lang.String:getSubString(line, 2, _g.jk.lang.String:getLength(line) - 4))
			if _g.jk.lang.String:isEmpty(id) then
				if _g.jk.lang.String:isEmpty(lid) then
					do break end
				end
			elseif _g.jk.lang.String:equals(id, lid) then
				do break end
			end
		end
		do sb:appendString(line) end
		do sb:appendCharacter(10) end
	end
	do return _g.jk.template.RichTextBlockParagraph._construct0(_g.jk.template.RichTextBlockParagraph._create()):setId(id):setText(sb:toString()) end
end

function jk.template.RichTextWikiMarkupParser:readListParagraph(type, l, pr)
	local line = l
	local prefix = _g.jk.lang.String:getSubString(line, 0, 2)
	local list = {}
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	repeat
		line = _g.jk.lang.String:strip(line)
		if _g.jk.lang.String:startsWith(line, prefix, 0) == false then
			do break end
		end
		line = _g.jk.lang.String:getEndOfString(line, 2)
		do
			local it = _g.jk.lang.String:iterate(line)
			local c = 0
			local pc = 0
			while (function()
				c = it:getNextChar()
				do return c end
			end)() > 0 do
				if c == 32 or c == 9 or c == 13 or c == 10 then
					if pc == 32 then
						goto _continue3
					end
					c = 32
				end
				do sb:appendCharacter(c) end
				pc = c
				::_continue3::
			end
			if sb:count() > 0 then
				do _g.jk.lang.Vector:append(list, sb:toString()) end
				do sb:clear() end
			end
		end
	until not not ((function()
		line = pr:readLine()
		do return line end
	end)() == nil)
	do return _g.jk.template.RichTextListParagraph._construct0(_g.jk.template.RichTextListParagraph._create()):setList(list):setType(type) end
end

function jk.template.RichTextWikiMarkupParser:processInput(pr, cwd, doc)
	local line = self:skipEmptyLines(pr)
	if not (line ~= nil) then
		do return false end
	end
	if line == "-" then
		do doc:addParagraph(_g.jk.template.RichTextSeparatorParagraph._construct0(_g.jk.template.RichTextSeparatorParagraph._create())) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "@content ", 0) then
		local id = _g.jk.lang.String:strip(_g.jk.lang.String:getEndOfString(line, 9))
		do doc:addParagraph(_g.jk.template.RichTextContentParagraph._construct0(_g.jk.template.RichTextContentParagraph._create()):setContentId(id)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "@image ", 0) then
		local ref = _g.jk.lang.String:strip(_g.jk.lang.String:getEndOfString(line, 7))
		do doc:addParagraph(_g.jk.template.RichTextImageParagraph._construct0(_g.jk.template.RichTextImageParagraph._create()):setFilename(ref)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "@image100 ", 0) then
		local ref = _g.jk.lang.String:strip(_g.jk.lang.String:getEndOfString(line, 10))
		do doc:addParagraph(_g.jk.template.RichTextImageParagraph._construct0(_g.jk.template.RichTextImageParagraph._create()):setFilename(ref)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "@image75 ", 0) then
		local ref = _g.jk.lang.String:strip(_g.jk.lang.String:getEndOfString(line, 9))
		do doc:addParagraph(_g.jk.template.RichTextImageParagraph._construct0(_g.jk.template.RichTextImageParagraph._create()):setFilename(ref):setWidth(75)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "@image50 ", 0) then
		local ref = _g.jk.lang.String:strip(_g.jk.lang.String:getEndOfString(line, 9))
		do doc:addParagraph(_g.jk.template.RichTextImageParagraph._construct0(_g.jk.template.RichTextImageParagraph._create()):setFilename(ref):setWidth(50)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "@image25 ", 0) then
		local ref = _g.jk.lang.String:strip(_g.jk.lang.String:getEndOfString(line, 9))
		do doc:addParagraph(_g.jk.template.RichTextImageParagraph._construct0(_g.jk.template.RichTextImageParagraph._create()):setFilename(ref):setWidth(25)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "@reference ", 0) then
		local ref = _g.jk.lang.String:strip(_g.jk.lang.String:getEndOfString(line, 11))
		local sq = _g.jk.text.StringUtil:quotedStringToVector(ref, 32, true, 92)
		local rrf = _g.jk.lang.Vector:getAt(sq, 0)
		local txt = _g.jk.lang.Vector:getAt(sq, 1)
		do doc:addParagraph(_g.jk.template.RichTextReferenceParagraph._construct0(_g.jk.template.RichTextReferenceParagraph._create()):setReference(rrf):setText(txt)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "@set ", 0) then
		local link = _g.jk.lang.String:strip(_g.jk.lang.String:getEndOfString(line, 5))
		local sq = _g.jk.text.StringUtil:quotedStringToVector(link, 32, true, 92)
		local key = _g.jk.lang.Vector:getAt(sq, 0)
		local val = _g.jk.lang.Vector:getAt(sq, 1)
		if _g.jk.lang.String:isEmpty(key) then
			do return true end
		end
		do doc:setMetadata(key, val) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "@link ", 0) then
		local link = _g.jk.lang.String:strip(_g.jk.lang.String:getEndOfString(line, 6))
		local sq = _g.jk.text.StringUtil:quotedStringToVector(link, 32, true, 92)
		local url = _g.jk.lang.Vector:getAt(sq, 0)
		local txt = _g.jk.lang.Vector:getAt(sq, 1)
		local flags = _g.jk.lang.Vector:getAt(sq, 2)
		if _g.jk.lang.String:isEmpty(txt) then
			txt = url
		end
		do
			local v = _g.jk.template.RichTextLinkParagraph._construct0(_g.jk.template.RichTextLinkParagraph._create())
			do v:setLink(url) end
			do v:setText(txt) end
			if _g.jk.lang.String:equals("internal", flags) then
				do v:setPopup(false) end
			else
				do v:setPopup(true) end
			end
			do doc:addParagraph(v) end
			do return true end
		end
	end
	if _g.jk.lang.String:startsWith(line, "@include ", 0) then
		local filename = _g.jk.lang.String:getEndOfString(line, 9)
		if _g.jk.lang.String:isEmpty(filename) then
			do return true end
		end
		if cwd ~= nil and self.allowInclude then
			local ff = cwd
			local array = _g.jk.lang.String:split(_g.jk.lang.String:replaceCharacter(filename, 92, 47), 47, 0)
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local comp = array[n + 1]
						if comp ~= nil then
							if comp == "." or _g.jk.lang.String:startsWith(comp, "..", 0) then
								goto _continue4
							end
							ff = ff:entry(comp)
						end
						::_continue4::
						do n = n + 1 end
					end
				end
			end
			do
				local prx = _g.jk.io.PrintReader:forReader(ff:read())
				if prx ~= nil then
					do self:parseToDocument(prx, ff:getParent(), doc) end
					do prx:close() end
				end
			end
		end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "---", 0) and _g.jk.lang.String:endsWith(line, "---") then
		local id = _g.jk.lang.String:strip(_g.jk.lang.String:getSubString(line, 3, _g.jk.lang.String:getLength(line) - 6))
		if _g.jk.lang.String:isEmpty(id) then
			id = nil
		end
		do doc:addParagraph(self:readPreformattedParagraph(id, pr)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "--", 0) and _g.jk.lang.String:endsWith(line, "--") then
		local id = _g.jk.lang.String:strip(_g.jk.lang.String:getSubString(line, 2, _g.jk.lang.String:getLength(line) - 4))
		if _g.jk.lang.String:isEmpty(id) then
			id = nil
		end
		do doc:addParagraph(self:readBlockParagraph(id, pr)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "* ", 0) then
		do doc:addParagraph(self:readListParagraph("unordered", line, pr)) end
		do return true end
	end
	if _g.jk.lang.String:startsWith(line, "+ ", 0) then
		do doc:addParagraph(self:readListParagraph("ordered", line, pr)) end
		do return true end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local pc = 0
		repeat
			line = _g.jk.lang.String:strip(line)
			if _g.jk.lang.String:isEmpty(line) then
				do break end
			end
			if _g.jk.lang.String:startsWith(line, "#", 0) == false then
				local it = _g.jk.lang.String:iterate(line)
				local c = 0
				if sb:count() > 0 and pc ~= 32 then
					do sb:appendCharacter(32) end
					pc = 32
				end
				while (function()
					c = it:getNextChar()
					do return c end
				end)() > 0 do
					if c == 32 or c == 9 or c == 13 or c == 10 then
						if pc == 32 then
							goto _continue5
						end
						c = 32
					end
					do sb:appendCharacter(c) end
					pc = c
					::_continue5::
				end
			end
		until not not ((function()
			line = pr:readLine()
			do return line end
		end)() == nil)
		do
			local s = sb:toString()
			if _g.jk.lang.String:isEmpty(s) then
				do return false end
			end
			do doc:addParagraph(_g.jk.template.RichTextStyledParagraph:forString(s)) end
			do return true end
		end
	end
end

function jk.template.RichTextWikiMarkupParser:parseToDocument(pr, cwd, v)
	if not (pr ~= nil) then
		do return end
	end
	while self:processInput(pr, cwd, v) do
	end
end

function jk.template.RichTextWikiMarkupParser:parse()
	local pr = nil
	local cwd = nil
	if self.file ~= nil then
		pr = _g.jk.io.PrintReader:forReader(self.file:read())
		cwd = self.file:getParent()
	elseif self.data ~= nil then
		pr = _g.jk.io.StringLineReader._construct1(_g.jk.io.StringLineReader._create(), self.data)
		cwd = nil
	end
	do
		local v = _g.jk.template.RichTextDocument._construct0(_g.jk.template.RichTextDocument._create())
		do self:parseToDocument(pr, cwd, v) end
		do return v end
	end
end

function jk.template.RichTextWikiMarkupParser:getFile()
	do return self.file end
end

function jk.template.RichTextWikiMarkupParser:setFile(v)
	self.file = v
	do return self end
end

function jk.template.RichTextWikiMarkupParser:getData()
	do return self.data end
end

function jk.template.RichTextWikiMarkupParser:setData(v)
	self.data = v
	do return self end
end

function jk.template.RichTextWikiMarkupParser:getAllowInclude()
	do return self.allowInclude end
end

function jk.template.RichTextWikiMarkupParser:setAllowInclude(v)
	self.allowInclude = v
	do return self end
end

jk.template.RichTextSegment = {}
jk.template.RichTextSegment.__index = jk.template.RichTextSegment
_vm:set_metatable(jk.template.RichTextSegment, {})

function jk.template.RichTextSegment._create()
	local v = _vm:set_metatable({}, jk.template.RichTextSegment)
	return v
end

function jk.template.RichTextSegment:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextSegment'
	self['_isType.jk.template.RichTextSegment'] = true
	self.text = nil
	self.bold = false
	self.italic = false
	self.underline = false
	self.color = nil
	self.link = nil
	self.reference = nil
	self.isInline = false
	self.linkPopup = false
end

function jk.template.RichTextSegment:_construct0()
	jk.template.RichTextSegment._init(self)
	return self
end

function jk.template.RichTextSegment:addMarkupModifiers(sb)
	if self.bold then
		do sb:appendString("**") end
	end
	if self.italic then
		do sb:appendString("''") end
	end
	if self.underline then
		do sb:appendString("__") end
	end
end

function jk.template.RichTextSegment:toMarkup()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do self:addMarkupModifiers(sb) end
	if _g.jk.lang.String:isEmpty(self.link) == false then
		do sb:appendCharacter(91) end
		if self.isInline then
			do sb:appendCharacter(62) end
		end
		do sb:appendString(self.link) end
		if _g.jk.lang.String:isEmpty(self.text) == false then
			do sb:appendCharacter(124) end
			do sb:appendString(self.text) end
		end
		do sb:appendCharacter(93) end
	elseif _g.jk.lang.String:isEmpty(self.reference) == false then
		do sb:appendCharacter(123) end
		if self.isInline then
			do sb:appendCharacter(62) end
		end
		do sb:appendString(self.reference) end
		if _g.jk.lang.String:isEmpty(self.text) == false then
			do sb:appendCharacter(124) end
			do sb:appendString(self.text) end
		end
		do sb:appendCharacter(125) end
	else
		do sb:appendString(self.text) end
	end
	do self:addMarkupModifiers(sb) end
	do return sb:toString() end
end

function jk.template.RichTextSegment:toJson()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("text", self.text) end
	if self.isInline then
		do v:setBoolean("inline", self.isInline) end
	end
	if self.bold then
		do v:setBoolean("bold", self.bold) end
	end
	if self.italic then
		do v:setBoolean("italic", self.italic) end
	end
	if self.underline then
		do v:setBoolean("underline", self.underline) end
	end
	if _g.jk.lang.String:isEmpty(self.color) == false then
		do v:setString("color", self.color) end
	end
	if _g.jk.lang.String:isEmpty(self.link) == false then
		do v:setString("link", self.link) end
	end
	if _g.jk.lang.String:isEmpty(self.reference) == false then
		do v:setString("reference", self.reference) end
	end
	do return v end
end

function jk.template.RichTextSegment:toHtml(refs)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local aOpen = false
	local text = self:getText()
	local link = self:getLink()
	if _g.jk.lang.String:isEmpty(link) == false then
		if self:getIsInline() then
			do sb:appendString("<img src=\"" .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(link)) .. "\" />") end
		else
			local targetblank = ""
			if self:getLinkPopup() then
				targetblank = " target=\"_blank\""
			end
			do sb:appendString("<a" .. _g.jk.lang.String:safeString(targetblank) .. " class=\"urlLink\" href=\"" .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(link)) .. "\">") end
			aOpen = true
		end
	end
	if _g.jk.lang.String:isEmpty(self:getReference()) == false then
		local ref = self:getReference()
		local href = nil
		if refs ~= nil then
			href = refs:getReferenceHref(ref)
			if _g.jk.lang.String:isEmpty(text) then
				text = refs:getReferenceTitle(ref)
			end
		end
		if _g.jk.lang.String:isEmpty(href) == false then
			if _g.jk.lang.String:isEmpty(text) then
				text = ref
			end
			do sb:appendString("<a class=\"referenceLink\" href=\"" .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(href)) .. "\">") end
			aOpen = true
		end
	end
	if self:getIsInline() == false then
		if self:getBold() then
			do sb:appendString("<b>") end
		end
		if self:getItalic() then
			do sb:appendString("<i>") end
		end
		if self:getUnderline() then
			do sb:appendString("<u>") end
		end
		if _g.jk.lang.String:isEmpty(self:getColor()) == false then
			do sb:appendString("<span style=\"color: " .. _g.jk.lang.String:safeString(_g.jk.xml.HTMLString:sanitize(self:getColor())) .. ";\">") end
		end
		do sb:appendString(_g.jk.xml.HTMLString:sanitize(text)) end
		if _g.jk.lang.String:isEmpty(self:getColor()) == false then
			do sb:appendString("</span>") end
		end
		if self:getUnderline() then
			do sb:appendString("</u>") end
		end
		if self:getItalic() then
			do sb:appendString("</i>") end
		end
		if self:getBold() then
			do sb:appendString("</b>") end
		end
	end
	if aOpen then
		do sb:appendString("</a>") end
	end
	do return sb:toString() end
end

function jk.template.RichTextSegment:getText()
	do return self.text end
end

function jk.template.RichTextSegment:setText(v)
	self.text = v
	do return self end
end

function jk.template.RichTextSegment:getBold()
	do return self.bold end
end

function jk.template.RichTextSegment:setBold(v)
	self.bold = v
	do return self end
end

function jk.template.RichTextSegment:getItalic()
	do return self.italic end
end

function jk.template.RichTextSegment:setItalic(v)
	self.italic = v
	do return self end
end

function jk.template.RichTextSegment:getUnderline()
	do return self.underline end
end

function jk.template.RichTextSegment:setUnderline(v)
	self.underline = v
	do return self end
end

function jk.template.RichTextSegment:getColor()
	do return self.color end
end

function jk.template.RichTextSegment:setColor(v)
	self.color = v
	do return self end
end

function jk.template.RichTextSegment:getLink()
	do return self.link end
end

function jk.template.RichTextSegment:setLink(v)
	self.link = v
	do return self end
end

function jk.template.RichTextSegment:getReference()
	do return self.reference end
end

function jk.template.RichTextSegment:setReference(v)
	self.reference = v
	do return self end
end

function jk.template.RichTextSegment:getIsInline()
	do return self.isInline end
end

function jk.template.RichTextSegment:setIsInline(v)
	self.isInline = v
	do return self end
end

function jk.template.RichTextSegment:getLinkPopup()
	do return self.linkPopup end
end

function jk.template.RichTextSegment:setLinkPopup(v)
	self.linkPopup = v
	do return self end
end

jk.template.RichTextStyledParagraph = _g.jk.template.RichTextParagraph._create()
jk.template.RichTextStyledParagraph.__index = jk.template.RichTextStyledParagraph
_vm:set_metatable(jk.template.RichTextStyledParagraph, {
	__index = _g.jk.template.RichTextParagraph
})

function jk.template.RichTextStyledParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextStyledParagraph)
	return v
end

function jk.template.RichTextStyledParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextStyledParagraph'
	self['_isType.jk.template.RichTextStyledParagraph'] = true
	self.heading = 0
	self.segments = nil
end

function jk.template.RichTextStyledParagraph:_construct0()
	jk.template.RichTextStyledParagraph._init(self)
	do _g.jk.template.RichTextParagraph._construct0(self) end
	return self
end

function jk.template.RichTextStyledParagraph:forString(text)
	local rtsp = _g.jk.template.RichTextStyledParagraph._construct0(_g.jk.template.RichTextStyledParagraph._create())
	do return rtsp:parse(text) end
end

function jk.template.RichTextStyledParagraph:isHeading()
	if self.heading > 0 then
		do return true end
	end
	do return false end
end

function jk.template.RichTextStyledParagraph:getTextContent()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if self.segments ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.segments)
		do
			n = 0
			while n < m do
				local segment = self.segments[n + 1]
				if segment ~= nil then
					do sb:appendString(segment:getText()) end
				end
				do n = n + 1 end
			end
		end
	end
	do return sb:toString() end
end

function jk.template.RichTextStyledParagraph:toJson()
	local segs = {}
	if self.segments ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.segments)
		do
			n = 0
			while n < m do
				local segment = self.segments[n + 1]
				if segment ~= nil then
					local segj = segment:toJson()
					if segj ~= nil then
						do _g.jk.lang.Vector:append(segs, segj) end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do
		local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do v:setString("type", "styled") end
		do v:setInteger("heading", self.heading) end
		do v:setObject("segments", segs) end
		do return v end
	end
end

function jk.template.RichTextStyledParagraph:toText()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if self.segments ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.segments)
		do
			n = 0
			while n < m do
				local sg = self.segments[n + 1]
				if sg ~= nil then
					do sb:appendString(sg:getText()) end
					do
						local link = sg:getLink()
						if _g.jk.lang.String:isEmpty(link) == false then
							do sb:appendString(" (" .. _g.jk.lang.String:safeString(link) .. ")") end
						end
						do
							local ref = sg:getReference()
							if _g.jk.lang.String:isEmpty(ref) == false then
								do sb:appendString(" {" .. _g.jk.lang.String:safeString(ref) .. "}") end
							end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return sb:toString() end
end

function jk.template.RichTextStyledParagraph:toHtml(refs)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local tag = "p"
	if self.heading > 0 then
		tag = "h" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.heading))
	end
	do sb:appendString("<") end
	do sb:appendString(tag) end
	do sb:appendString(">") end
	if self.segments ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.segments)
		do
			n = 0
			while n < m do
				local sg = self.segments[n + 1]
				if sg ~= nil then
					do sb:appendString(sg:toHtml(refs)) end
				end
				do n = n + 1 end
			end
		end
	end
	do sb:appendString("</" .. _g.jk.lang.String:safeString(tag) .. ">") end
	do return sb:toString() end
end

function jk.template.RichTextStyledParagraph:addSegment(rts)
	if rts == nil then
		do return self end
	end
	if self.segments == nil then
		self.segments = {}
	end
	do _g.jk.lang.Vector:append(self.segments, rts) end
	do return self end
end

function jk.template.RichTextStyledParagraph:setSegmentLink(seg, alink)
	if alink == nil then
		do seg:setLink(nil) end
		do return end
	end
	do
		local link = alink
		if _g.jk.lang.String:startsWith(link, ">", 0) then
			do seg:setIsInline(true) end
			link = _g.jk.lang.String:getEndOfString(link, 1)
		end
		if _g.jk.lang.String:startsWith(link, "!", 0) then
			do seg:setLinkPopup(false) end
			link = _g.jk.lang.String:getEndOfString(link, 1)
		else
			do seg:setLinkPopup(true) end
		end
		do seg:setLink(link) end
	end
end

function jk.template.RichTextStyledParagraph:parseSegments(txt)
	if not (txt ~= nil) then
		do return end
	end
	do
		local segmentsb = nil
		local linksb = nil
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local it = _g.jk.lang.String:iterate(txt)
		local c = 0
		local pc = 0
		local seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create())
		while (function()
			c = it:getNextChar()
			do return c end
		end)() > 0 do
			if pc == 91 then
				if c == 91 then
					do sb:appendCharacter(c) end
					pc = 0
					goto _continue6
				end
				if sb:count() > 0 then
					do seg:setText(sb:toString()) end
					do sb:clear() end
					do self:addSegment(seg) end
				end
				seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create())
				linksb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				do linksb:appendCharacter(c) end
				pc = c
				goto _continue6
			end
			if linksb ~= nil then
				if c == 124 then
					do self:setSegmentLink(seg, linksb:toString()) end
					do linksb:clear() end
					pc = c
					goto _continue6
				end
				if c == 93 then
					local xt = linksb:toString()
					if seg:getLink() == nil then
						do self:setSegmentLink(seg, xt) end
					else
						do seg:setText(xt) end
					end
					if _g.jk.lang.String:isEmpty(seg:getText()) then
						local ll = xt
						if _g.jk.lang.String:startsWith(ll, "http://", 0) then
							ll = _g.jk.lang.String:getEndOfString(ll, 7)
						end
						do seg:setText(ll) end
					end
					do self:addSegment(seg) end
					seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create())
					linksb = nil
				else
					do linksb:appendCharacter(c) end
				end
				pc = c
				goto _continue6
			end
			if pc == 123 then
				if c == 123 then
					do sb:appendCharacter(c) end
					pc = 0
					goto _continue6
				end
				if sb:count() > 0 then
					do seg:setText(sb:toString()) end
					do sb:clear() end
					do self:addSegment(seg) end
				end
				seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create())
				segmentsb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				do segmentsb:appendCharacter(c) end
				pc = c
				goto _continue6
			end
			if segmentsb ~= nil then
				if c == 124 then
					do seg:setReference(segmentsb:toString()) end
					do segmentsb:clear() end
					pc = c
					goto _continue6
				end
				if c == 125 then
					local xt = segmentsb:toString()
					if seg:getReference() == nil then
						do seg:setReference(xt) end
					else
						do seg:setText(xt) end
					end
					do self:addSegment(seg) end
					seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create())
					segmentsb = nil
				else
					do segmentsb:appendCharacter(c) end
				end
				pc = c
				goto _continue6
			end
			if pc == 42 then
				if c == 42 then
					if sb:count() > 0 then
						do seg:setText(sb:toString()) end
						do sb:clear() end
						do self:addSegment(seg) end
					end
					if seg:getBold() then
						seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create()):setBold(false)
					else
						seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create()):setBold(true)
					end
				else
					do sb:appendCharacter(pc) end
					do sb:appendCharacter(c) end
				end
				pc = 0
				goto _continue6
			end
			if pc == 95 then
				if c == 95 then
					if sb:count() > 0 then
						do seg:setText(sb:toString()) end
						do sb:clear() end
						do self:addSegment(seg) end
					end
					if seg:getUnderline() then
						seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create()):setUnderline(false)
					else
						seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create()):setUnderline(true)
					end
				else
					do sb:appendCharacter(pc) end
					do sb:appendCharacter(c) end
				end
				pc = 0
				goto _continue6
			end
			if pc == 39 then
				if c == 39 then
					if sb:count() > 0 then
						do seg:setText(sb:toString()) end
						do sb:clear() end
						do self:addSegment(seg) end
					end
					if seg:getItalic() then
						seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create()):setItalic(false)
					else
						seg = _g.jk.template.RichTextSegment._construct0(_g.jk.template.RichTextSegment._create()):setItalic(true)
					end
				else
					do sb:appendCharacter(pc) end
					do sb:appendCharacter(c) end
				end
				pc = 0
				goto _continue6
			end
			if c ~= 42 and c ~= 95 and c ~= 39 and c ~= 123 and c ~= 91 then
				do sb:appendCharacter(c) end
			end
			pc = c
			::_continue6::
		end
		if pc == 42 or pc == 95 or (pc == 39 and pc ~= 123 and pc ~= 91) then
			do sb:appendCharacter(pc) end
		end
		if sb:count() > 0 then
			do seg:setText(sb:toString()) end
			do sb:clear() end
			do self:addSegment(seg) end
		end
	end
end

function jk.template.RichTextStyledParagraph:parse(text)
	if text == nil then
		do return self end
	end
	do
		local txt = text
		local prefixes = {
			"=",
			"==",
			"===",
			"====",
			"====="
		}
		local n = 0
		do
			n = 0
			while n < #prefixes do
				local key = prefixes[n + 1]
				if _g.jk.lang.String:startsWith(txt, _g.jk.lang.String:safeString(key) .. " ", 0) and _g.jk.lang.String:endsWith(txt, " " .. _g.jk.lang.String:safeString(key)) then
					do self:setHeading(n + 1) end
					txt = _g.jk.lang.String:getSubString(txt, _g.jk.lang.String:getLength(key) + 1, _g.jk.lang.String:getLength(txt) - _g.jk.lang.String:getLength(key) * 2 - 2)
					if txt ~= nil then
						txt = _g.jk.lang.String:strip(txt)
					end
					do break end
				end
				do n = n + 1 end
			end
		end
		do self:parseSegments(txt) end
		do return self end
	end
end

function jk.template.RichTextStyledParagraph:toMarkup()
	local ident = nil
	if self.heading == 1 then
		ident = "="
	elseif self.heading == 2 then
		ident = "=="
	elseif self.heading == 3 then
		ident = "==="
	elseif self.heading == 4 then
		ident = "===="
	elseif self.heading == 5 then
		ident = "====="
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		if _g.jk.lang.String:isEmpty(ident) == false then
			do sb:appendString(ident) end
			do sb:appendCharacter(32) end
		end
		if self.segments ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self.segments)
			do
				n = 0
				while n < m do
					local segment = self.segments[n + 1]
					if segment ~= nil then
						do sb:appendString(segment:toMarkup()) end
					end
					do n = n + 1 end
				end
			end
		end
		if _g.jk.lang.String:isEmpty(ident) == false then
			do sb:appendCharacter(32) end
			do sb:appendString(ident) end
		end
		do return sb:toString() end
	end
end

function jk.template.RichTextStyledParagraph:getHeading()
	do return self.heading end
end

function jk.template.RichTextStyledParagraph:setHeading(v)
	self.heading = v
	do return self end
end

function jk.template.RichTextStyledParagraph:getSegments()
	do return self.segments end
end

function jk.template.RichTextStyledParagraph:setSegments(v)
	self.segments = v
	do return self end
end

jk.template.TextTemplate = {}
jk.template.TextTemplate.__index = jk.template.TextTemplate
_vm:set_metatable(jk.template.TextTemplate, {})

jk.template.TextTemplate.TYPE_GENERIC = 0
jk.template.TextTemplate.TYPE_HTML = 1
jk.template.TextTemplate.TYPE_JSON = 2

function jk.template.TextTemplate._create()
	local v = _vm:set_metatable({}, jk.template.TextTemplate)
	return v
end

function jk.template.TextTemplate:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.TextTemplate'
	self['_isType.jk.template.TextTemplate'] = true
	self.tokens = nil
	self.text = nil
	self.markerBegin = nil
	self.markerEnd = nil
	self.logContext = nil
	self.type = _g.jk.template.TextTemplate.TYPE_GENERIC
	self.languagePreferences = nil
	self.includeDirs = nil
	self.includeFileData = nil
end

function jk.template.TextTemplate:_construct0()
	jk.template.TextTemplate._init(self)
	return self
end

jk.template.TextTemplate.TagData = {}
jk.template.TextTemplate.TagData.__index = jk.template.TextTemplate.TagData
_vm:set_metatable(jk.template.TextTemplate.TagData, {})

function jk.template.TextTemplate.TagData._create()
	local v = _vm:set_metatable({}, jk.template.TextTemplate.TagData)
	return v
end

function jk.template.TextTemplate.TagData:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.TextTemplate.TagData'
	self['_isType.jk.template.TextTemplate.TagData'] = true
	self.words = nil
end

function jk.template.TextTemplate.TagData:_construct0()
	jk.template.TextTemplate.TagData._init(self)
	return self
end

function jk.template.TextTemplate.TagData:_construct1(words)
	jk.template.TextTemplate.TagData._init(self)
	self.words = words
	return self
end

function jk.template.TextTemplate:processFile(file, markerBegin, markerEnd, vars)
	local v = _g.jk.template.TextTemplate:forFile(file, markerBegin, markerEnd, 0, nil, nil, nil)
	if not (v ~= nil) then
		do return nil end
	end
	do return v:execute(vars, nil) end
end

function jk.template.TextTemplate:processString(text, markerBegin, markerEnd, vars)
	local v = _g.jk.template.TextTemplate:forString(text, markerBegin, markerEnd, 0, nil, nil, nil)
	if not (v ~= nil) then
		do return nil end
	end
	do return v:execute(vars, nil) end
end

function jk.template.TextTemplate:forFile(file, markerBegin, markerEnd, type, includeDirs, includeFileData, logContext)
	if not (file ~= nil) then
		do return nil end
	end
	do
		local text = file:getContentsUTF8()
		if not (text ~= nil) then
			do return nil end
		end
		do
			local ids = includeDirs
			if not (ids ~= nil) then
				ids = {}
				do _g.jk.lang.Vector:append(ids, file:getParent()) end
			end
			do return _g.jk.template.TextTemplate:forString(text, markerBegin, markerEnd, type, ids, includeFileData, logContext) end
		end
	end
end

function jk.template.TextTemplate:forHTMLFile(file, includeDirs, includeFileData, logContext)
	do return _g.jk.template.TextTemplate:forFile(file, "<%", "%>", _g.jk.template.TextTemplate.TYPE_HTML, includeDirs, includeFileData, logContext) end
end

function jk.template.TextTemplate:forString(text, markerBegin, markerEnd, type, includeDirs, includeFileData, logContext)
	local v = _g.jk.template.TextTemplate._construct0(_g.jk.template.TextTemplate._create())
	do v:setLogContext(logContext) end
	do v:setText(text) end
	do v:setType(type) end
	do v:setMarkerBegin(markerBegin) end
	do v:setMarkerEnd(markerEnd) end
	do v:setIncludeDirs(includeDirs) end
	do v:setIncludeFileData(includeFileData) end
	if v:prepare() == false then
		v = nil
	end
	do return v end
end

function jk.template.TextTemplate:forHTMLString(text, includeDirs, includeFileData, logContext)
	local v = _g.jk.template.TextTemplate._construct0(_g.jk.template.TextTemplate._create())
	do v:setLogContext(logContext) end
	do v:setText(text) end
	do v:setType(_g.jk.template.TextTemplate.TYPE_HTML) end
	do v:setMarkerBegin("<%") end
	do v:setMarkerEnd("%>") end
	do v:setIncludeDirs(includeDirs) end
	do v:setIncludeFileData(includeFileData) end
	if v:prepare() == false then
		v = nil
	end
	do return v end
end

function jk.template.TextTemplate:forJSONString(text, includeDirs, includeFileData, logContext)
	local v = _g.jk.template.TextTemplate._construct0(_g.jk.template.TextTemplate._create())
	do v:setLogContext(logContext) end
	do v:setText(text) end
	do v:setType(_g.jk.template.TextTemplate.TYPE_JSON) end
	do v:setMarkerBegin("{{") end
	do v:setMarkerEnd("}}") end
	do v:setIncludeDirs(includeDirs) end
	do v:setIncludeFileData(includeFileData) end
	if v:prepare() == false then
		v = nil
	end
	do return v end
end

function jk.template.TextTemplate:setLanguagePreference(language)
	self.languagePreferences = {}
	if language ~= nil then
		do _g.jk.lang.Vector:append(self.languagePreferences, language) end
	end
end

function jk.template.TextTemplate:getIncludeFileContent(fileName)
	if not (fileName ~= nil) then
		do return nil end
	end
	do
		local ff = nil
		if self.includeFileData ~= nil then
			local o = _g.jk.lang.Map:get(self.includeFileData, fileName)
			if o ~= nil then
				if (_vm:get_variable_type(o) == 'string') then
					do return o end
				end
				if _util:is_buffer(o) then
					do return _g.jk.lang.String:forUTF8Buffer(o) end
				end
				if (_vm:to_table_with_key(o, '_isType.jk.fs.File') ~= nil) then
					ff = o
				end
			end
		end
		if not (ff ~= nil) then
			if _g.jk.fs.PathInfo:isAbsolutePath(fileName) then
				ff = _g.jk.fs.File:forPath(fileName)
			end
		end
		if not (ff ~= nil) then
			if self.includeDirs ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(self.includeDirs)
				do
					n = 0
					while n < m do
						local includeDir = self.includeDirs[n + 1]
						if includeDir ~= nil then
							local x = _g.jk.fs.File:forRelativePath(fileName, includeDir, false)
							if x:isFile() then
								ff = x
								do break end
							end
						end
						do n = n + 1 end
					end
				end
			end
		end
		if not (ff ~= nil and ff:isFile()) then
			do _g.jk.log.Log:warning(self.logContext, "Included file was not found: `" .. _g.jk.lang.String:safeString(fileName) .. "'") end
			do return nil end
		end
		do
			local cc = ff:getContentsUTF8()
			if not (cc ~= nil) then
				do _g.jk.log.Log:warning(self.logContext, "Failed to read included file: `" .. _g.jk.lang.String:safeString(ff:getPath()) .. "'") end
			end
			do return cc end
		end
	end
end

function jk.template.TextTemplate:tokenizeString(inputdata)
	if self.markerBegin == nil or self.markerEnd == nil then
		do _g.jk.log.Log:error(self.logContext, "No template markers were given") end
		do return nil end
	end
	if _g.jk.lang.String:getLength(self.markerBegin) ~= 2 or _g.jk.lang.String:getLength(self.markerEnd) ~= 2 then
		do _g.jk.log.Log:error(self.logContext, "Invalid template markers: `" .. _g.jk.lang.String:safeString(self.markerBegin) .. "' and `" .. _g.jk.lang.String:safeString(self.markerEnd) .. "'") end
		do return nil end
	end
	do
		local mb1 = _g.jk.lang.String:getChar(self.markerBegin, 0)
		local mb2 = _g.jk.lang.String:getChar(self.markerBegin, 1)
		local me1 = _g.jk.lang.String:getChar(self.markerEnd, 0)
		local me2 = _g.jk.lang.String:getChar(self.markerEnd, 1)
		local pc = 0
		local tag = nil
		local data = nil
		local it = _g.jk.lang.String:iterate(inputdata)
		local v = {}
		while it ~= nil do
			local c = it:getNextChar()
			if c <= 0 then
				do break end
			end
			if tag ~= nil then
				if pc == me1 and tag:count() > 2 then
					do tag:appendCharacter(pc) end
					do tag:appendCharacter(c) end
					if c == me2 then
						local tt = tag:toString()
						local tts = _g.jk.lang.String:strip(_g.jk.lang.String:getSubString(tt, 2, _g.jk.lang.String:getLength(tt) - 4))
						local words = _g.jk.text.StringUtil:quotedStringToVector(tts, 32, true, 92)
						if _g.jk.lang.Vector:get(words, 0) == "include" then
							local fileName = _g.jk.lang.Vector:get(words, 1)
							if _g.jk.lang.String:isEmpty(fileName) then
								do _g.jk.log.Log:warning(self.logContext, "Include tag with empty filename. Ignoring it.") end
							else
								local cc = self:getIncludeFileContent(fileName)
								if cc ~= nil then
									local nt = _g.jk.template.TextTemplate:forString(cc, self.markerBegin, self.markerEnd, self.type, self.includeDirs, self.includeFileData, nil)
									if nt == nil then
										do _g.jk.log.Log:warning(self.logContext, "Failed to process included template file: `" .. _g.jk.lang.String:safeString(fileName) .. "'") end
									else
										local array = nt:getTokens()
										if array ~= nil then
											local n = 0
											local m = _g.jk.lang.Vector:getSize(array)
											do
												n = 0
												while n < m do
													local token = array[n + 1]
													if token ~= nil then
														do _g.jk.lang.Vector:append(v, token) end
													end
													do n = n + 1 end
												end
											end
										end
									end
								else
									do _g.jk.log.Log:warning(self.logContext, "Failed to get include file content: `" .. _g.jk.lang.String:safeString(fileName) .. "'") end
								end
							end
						else
							do _g.jk.lang.Vector:append(v, _g.jk.template.TextTemplate.TagData._construct1(_g.jk.template.TextTemplate.TagData._create(), words)) end
						end
						tag = nil
					end
				elseif c ~= me1 then
					do tag:appendCharacter(c) end
				end
			elseif pc == mb1 then
				if c == mb2 then
					if data ~= nil then
						do _g.jk.lang.Vector:append(v, data) end
						data = nil
					end
					tag = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					do tag:appendCharacter(pc) end
					do tag:appendCharacter(c) end
				else
					if data == nil then
						data = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					end
					do data:appendCharacter(pc) end
					do data:appendCharacter(c) end
				end
			elseif c ~= mb1 then
				if data == nil then
					data = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				end
				do data:appendCharacter(c) end
			end
			pc = c
		end
		if pc == mb1 then
			if data == nil then
				data = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			end
			do data:appendCharacter(pc) end
		end
		if data ~= nil then
			do _g.jk.lang.Vector:append(v, data) end
			data = nil
		end
		if tag ~= nil then
			do _g.jk.log.Log:error(self.logContext, "Unfinished tag: `" .. _g.jk.lang.String:safeString(tag:toString()) .. "'") end
			do return nil end
		end
		do return v end
	end
end

function jk.template.TextTemplate:prepare()
	local str = self.text
	if not (str ~= nil) then
		do _g.jk.log.Log:error(self.logContext, "No input string was specified.") end
		do return false end
	end
	if not ((function()
		self.tokens = self:tokenizeString(str)
		do return self.tokens end
	end)() ~= nil) then
		do return false end
	end
	do return true end
end

function jk.template.TextTemplate:execute(vars, importDirs)
	if not (self.tokens ~= nil) then
		do _g.jk.log.Log:error(self.logContext, "TextTemplate has not been prepared") end
		do return nil end
	end
	do
		local result = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		if not self:doExecute(self.tokens, vars, result, importDirs) then
			do return nil end
		end
		do return result:toString() end
	end
end

function jk.template.TextTemplate:substituteVariables(orig, vars)
	if orig == nil then
		do return orig end
	end
	if _g.jk.lang.String:getIndexOfString(orig, "${", 0) < 0 then
		do return orig end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local varbuf = nil
		local flag = false
		local it = _g.jk.lang.String:iterate(orig)
		while it ~= nil do
			local c = it:getNextChar()
			if c <= 0 then
				do break end
			end
			if varbuf ~= nil then
				if c == 125 then
					local varname = varbuf:toString()
					if vars ~= nil then
						local varcut = nil
						if _g.jk.lang.String:getIndexOfCharacter(varname, 33, 0) > 0 then
							local sp = _g.jk.lang.Vector:iterate(_g.jk.lang.String:split(varname, 33, 2))
							varname = sp:next()
							varcut = sp:next()
						end
						do
							local r = self:getVariableValueString(vars, varname)
							if _g.jk.lang.String:isEmpty(varcut) == false then
								local itc = _g.jk.lang.String:iterate(varcut)
								local cx = 0
								while (function()
									cx = itc:getNextChar()
									do return cx end
								end)() > 0 do
									local n = _g.jk.lang.String:getLastIndexOfCharacter(r, cx, -1)
									if n < 0 then
										do break end
									end
									r = _g.jk.lang.String:getSubString(r, 0, n)
								end
							end
							do sb:appendString(r) end
						end
					end
					varbuf = nil
				else
					do varbuf:appendCharacter(c) end
				end
				goto _continue7
			end
			if flag == true then
				flag = false
				if c == 123 then
					varbuf = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				else
					do sb:appendCharacter(36) end
					do sb:appendCharacter(c) end
				end
				goto _continue7
			end
			if c == 36 then
				flag = true
				goto _continue7
			end
			do sb:appendCharacter(c) end
			::_continue7::
		end
		do return sb:toString() end
	end
end

function jk.template.TextTemplate:getVariableValue(vars, varname)
	if vars == nil or varname == nil then
		do return nil end
	end
	do
		local vv = vars:get(varname)
		if vv ~= nil then
			do return vv end
		end
		do
			local ll = _g.jk.lang.String:split(varname, 46, 0)
			if _g.jk.lang.Vector:getSize(ll) < 2 then
				do return nil end
			end
			do
				local nvar = (function(o)
					if (_vm:get_variable_type(o) == 'string') then
						do return o end
					end
					do return nil end
				end)(_g.jk.lang.Vector:get(ll, _g.jk.lang.Vector:getSize(ll) - 1))
				do _g.jk.lang.Vector:removeLast(ll) end
				do
					local cc = vars
					if ll ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(ll)
						do
							n = 0
							while n < m do
								local vv2 = ll[n + 1]
								if vv2 ~= nil then
									if cc == nil then
										do return nil end
									end
									do
										local vv2o = cc:get(vv2)
										cc = _vm:to_table_with_key(vv2o, '_isType.jk.lang.DynamicMap')
										if cc == nil and vv2o ~= nil and (_vm:to_table_with_key(vv2o, '_isType.jk.json.JSONObject') ~= nil) then
											cc = _vm:to_table_with_key(vv2o:toJsonObject(), '_isType.jk.lang.DynamicMap')
										end
									end
								end
								do n = n + 1 end
							end
						end
					end
					if cc ~= nil then
						do return cc:get(nvar) end
					end
					do return nil end
				end
			end
		end
	end
end

function jk.template.TextTemplate:getVariableValueString(vars, varname)
	local v = self:getVariableValue(vars, varname)
	if not (v ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(v, '_isType.jk.lang.DynamicMap') ~= nil) then
		if self.languagePreferences ~= nil then
			if self.languagePreferences ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(self.languagePreferences)
				do
					n = 0
					while n < m do
						local language = self.languagePreferences[n + 1]
						if language ~= nil then
							local s = v:getString(language, nil)
							if s ~= nil then
								do return s end
							end
						end
						do n = n + 1 end
					end
				end
			end
		else
			local s = v:getString("en", nil)
			if s ~= nil then
				do return s end
			end
		end
		do return nil end
	end
	do return _g.jk.lang.String:asString(v) end
end

function jk.template.TextTemplate:getVariableValueVector(vars, varname)
	local v = self:getVariableValue(vars, varname)
	if not (v ~= nil) then
		do return nil end
	end
	if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(v) then
		do return v end
	end
	if (_vm:to_table_with_key(v, '_isType.jk.lang.VectorObject') ~= nil) then
		local vo = v
		local vv = vo:toVector()
		do return vv end
	end
	if (_vm:to_table_with_key(v, '_isType.jk.lang.ArrayObject') ~= nil) then
		local vo = _vm:to_table_with_key(v, '_isType.jk.lang.ArrayObject')
		local vv = vo:toArray()
		local vvx = _g.jk.lang.Vector:forArray(vv)
		do return vvx end
	end
	if (_vm:to_table_with_key(v, '_isType.jk.lang.DynamicVector') ~= nil) then
		local dv = v
		do return dv:toVector() end
	end
	do return nil end
end

function jk.template.TextTemplate:handleBlock(vars, tag, data, result, importDirs)
	if not (tag ~= nil) then
		do return false end
	end
	do
		local tagname = _g.jk.lang.Vector:get(tag, 0)
		if _g.jk.lang.String:isEmpty(tagname) then
			do return false end
		end
		if tagname == "for" then
			local varname = _g.jk.lang.Vector:get(tag, 1)
			local inword = _g.jk.lang.Vector:get(tag, 2)
			local origvar = self:substituteVariables(_g.jk.lang.Vector:get(tag, 3), vars)
			if _g.jk.lang.String:isEmpty(varname) or _g.jk.lang.String:isEmpty(origvar) or not (inword == "in") then
				do _g.jk.log.Log:error(self.logContext, "Invalid for tag: `" .. _g.jk.lang.String:safeString(_g.jk.text.StringUtil:combine(tag, 32, false, 0)) .. "'") end
				do return false end
			end
			do
				local index = 0
				do vars:setString("__for_first", "true") end
				do
					local vv = self:getVariableValueVector(vars, origvar)
					if vv ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(vv)
						do
							n = 0
							while n < m do
								local o = vv[n + 1]
								if o ~= nil then
									if _util:convert_to_integer(index % 2) == 0 then
										do vars:setString("__for_parity", "even") end
									else
										do vars:setString("__for_parity", "odd") end
									end
									do vars:setObject(varname, o) end
									if self:doExecute(data, vars, result, importDirs) == false then
										do return false end
									end
									if index == 0 then
										do vars:setString("__for_first", "false") end
									end
									do index = index + 1 end
								end
								do n = n + 1 end
							end
						end
					end
					do vars:remove("__for_first") end
					do vars:remove("__for_parity") end
					do return true end
				end
			end
		end
		if tagname == "if" then
			local lvalue = _g.jk.lang.Vector:get(tag, 1)
			if lvalue == nil then
				do return true end
			end
			do
				local operator = _g.jk.lang.Vector:get(tag, 2)
				if operator == nil then
					local varval = self:getVariableValue(vars, lvalue)
					if varval == nil then
						do return true end
					end
					if (_vm:to_table_with_key(varval, '_isType.jk.lang.VectorObject') ~= nil) then
						if _g.jk.lang.Vector:isEmpty(varval:toVector()) then
							do return true end
						end
					end
					if (_vm:to_table_with_key(varval, '_isType.jk.lang.DynamicMap') ~= nil) then
						local value = varval
						if value:getCount() < 1 then
							do return true end
						end
					end
					if (_vm:get_variable_type(varval) == 'string') then
						if _g.jk.lang.String:isEmpty(varval) then
							do return true end
						end
					end
					if (_vm:to_table_with_key(varval, '_isType.jk.lang.StringObject') ~= nil) then
						if _g.jk.lang.String:isEmpty(varval:toString()) then
							do return true end
						end
					end
					if self:doExecute(data, vars, result, importDirs) == false then
						do return false end
					end
					do return true end
				end
				lvalue = self:substituteVariables(lvalue, vars)
				do
					local rvalue = _g.jk.lang.Vector:get(tag, 3)
					if rvalue ~= nil then
						rvalue = self:substituteVariables(rvalue, vars)
					end
					if lvalue == nil or _g.jk.lang.String:isEmpty(operator) or rvalue == nil then
						do _g.jk.log.Log:error(self.logContext, "Invalid if tag: `" .. _g.jk.lang.String:safeString(_g.jk.text.StringUtil:combine(tag, 32, false, 0)) .. "'") end
						do return false end
					end
					if operator == "==" or operator == "=" or operator == "is" then
						if not (rvalue == lvalue) then
							do return true end
						end
						if self:doExecute(data, vars, result, importDirs) == false then
							do return false end
						end
						do return true end
					end
					if operator == "!=" or operator == "not" then
						if rvalue == lvalue then
							do return true end
						end
						if self:doExecute(data, vars, result, importDirs) == false then
							do return false end
						end
						do return true end
					end
					do _g.jk.log.Log:error(self.logContext, "Unknown operator `" .. _g.jk.lang.String:safeString(operator) .. "' in if tag: `" .. _g.jk.lang.String:safeString(_g.jk.text.StringUtil:combine(tag, 32, false, 0)) .. "'") end
					do return false end
				end
			end
		end
		do return false end
	end
end

function jk.template.TextTemplate:doExecute(data, avars, result, importDirs)
	if data == nil then
		do return true end
	end
	do
		local blockctr = 0
		local blockdata = nil
		local blocktag = nil
		local vars = avars
		if vars == nil then
			vars = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		end
		if data ~= nil then
			local n2 = 0
			local m = _g.jk.lang.Vector:getSize(data)
			do
				n2 = 0
				while n2 < m do
					local o = data[n2 + 1]
					if o ~= nil then
						local tagname = nil
						local words = nil
						local tagData = _vm:to_table_with_key(o, '_isType.jk.template.TextTemplate.TagData')
						if tagData ~= nil then
							words = tagData.words
							if words ~= nil then
								tagname = _g.jk.lang.Vector:get(words, 0)
								if _g.jk.lang.String:isEmpty(tagname) then
									do _g.jk.log.Log:warning(self.logContext, "Empty tag encountered. Ignoring it.") end
									goto _continue8
								end
							end
						end
						if tagname == "end" then
							do blockctr = blockctr - 1 end
							if blockctr == 0 and blockdata ~= nil then
								if self:handleBlock(vars, blocktag, blockdata, result, importDirs) == false then
									do _g.jk.log.Log:error(self.logContext, "Handling of a block failed") end
									goto _continue8
								end
								blockdata = nil
								blocktag = nil
							end
						end
						if blockctr > 0 then
							if tagname == "for" or tagname == "if" then
								do blockctr = blockctr + 1 end
							end
							if blockdata == nil then
								blockdata = {}
							end
							do _g.jk.lang.Vector:append(blockdata, o) end
							goto _continue8
						end
						if (_vm:get_variable_type(o) == 'string') or (_vm:to_table_with_key(o, '_isType.jk.lang.StringObject') ~= nil) then
							do result:appendString(_g.jk.lang.String:asString(o)) end
							goto _continue8
						end
						if tagname == "=" or tagname == "printstring" then
							local varname = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
							if _g.jk.lang.String:isEmpty(varname) == false then
								local vv = self:getVariableValueString(vars, varname)
								if _g.jk.lang.String:isEmpty(vv) == false then
									if self.type == _g.jk.template.TextTemplate.TYPE_HTML then
										vv = _g.jk.xml.HTMLString:sanitize(vv)
									end
									do result:appendString(vv) end
								else
									local defaultvalue = self:substituteVariables(_g.jk.lang.Vector:get(words, 2), vars)
									if _g.jk.lang.String:isEmpty(defaultvalue) == false then
										if self.type == _g.jk.template.TextTemplate.TYPE_HTML then
											defaultvalue = _g.jk.xml.HTMLString:sanitize(defaultvalue)
										end
										do result:appendString(defaultvalue) end
									end
								end
							end
						elseif tagname == "printRaw" then
							local varname = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
							if _g.jk.lang.String:isEmpty(varname) == false then
								local vv = self:getVariableValueString(vars, varname)
								if _g.jk.lang.String:isEmpty(vv) == false then
									do result:appendString(vv) end
								else
									local defaultvalue = self:substituteVariables(_g.jk.lang.Vector:get(words, 2), vars)
									if _g.jk.lang.String:isEmpty(defaultvalue) == false then
										do result:appendString(defaultvalue) end
									end
								end
							end
						elseif tagname == "catPath" then
							local hasSlash = false
							local n = 0
							if words ~= nil then
								local n3 = 0
								local m2 = _g.jk.lang.Vector:getSize(words)
								do
									n3 = 0
									while n3 < m2 do
										local word = words[n3 + 1]
										if word ~= nil then
											do n = n + 1 end
											if n == 1 then
												goto _continue9
											end
											word = self:substituteVariables(word, vars)
											do
												local it = _g.jk.lang.String:iterate(word)
												if it == nil then
													goto _continue9
												end
												if n > 2 and hasSlash == false then
													do result:appendCharacter(47) end
													hasSlash = true
												end
												while true do
													local c = it:getNextChar()
													if c < 1 then
														do break end
													end
													if c == 47 then
														if hasSlash == false then
															do result:appendCharacter(c) end
															hasSlash = true
														end
													else
														do result:appendCharacter(c) end
														hasSlash = false
													end
												end
											end
										end
										::_continue9::
										do n3 = n3 + 1 end
									end
								end
							end
						elseif tagname == "printJson" then
							local varname = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
							if _g.jk.lang.String:isEmpty(varname) == false then
								local vv = self:getVariableValue(vars, varname)
								if vv ~= nil then
									do result:appendString(_g.jk.json.JSONEncoder:encode(vv, true, false)) end
								end
							end
						elseif tagname == "printRichText" then
							local markup = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
							if _g.jk.lang.String:isEmpty(markup) == false then
								local doc = _g.jk.template.RichTextDocument:forWikiMarkupString(markup)
								if doc ~= nil then
									do result:appendString(doc:toHtml(nil)) end
								end
							end
						elseif tagname == "printDate" then
							local timestamp = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
							local aslong = _g.jk.lang.String:toLong(timestamp)
							local asstring = _g.jk.lang.DateTime:forSeconds(aslong):toStringDate(47)
							do result:appendString(asstring) end
						elseif tagname == "printTime" then
							local timestamp = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
							local aslong = _g.jk.lang.String:toLong(timestamp)
							local asstring = _g.jk.lang.DateTime:forSeconds(aslong):toStringTime(58)
							do result:appendString(asstring) end
						elseif tagname == "printDateTime" then
							local timestamp = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
							local aslong = _g.jk.lang.String:toLong(timestamp)
							local dt = _g.jk.lang.DateTime:forSeconds(aslong)
							do result:appendString(dt:toStringDate(47)) end
							do result:appendCharacter(32) end
							do result:appendString(dt:toStringTime(58)) end
						elseif tagname == "import" then
							local type = _g.jk.lang.Vector:get(words, 1)
							local filename = self:substituteVariables(_g.jk.lang.Vector:get(words, 2), vars)
							if _g.jk.lang.String:isEmpty(filename) then
								do _g.jk.log.Log:warning(self.logContext, "Invalid import tag with empty filename") end
								goto _continue8
							end
							do
								local ff = nil
								if importDirs ~= nil then
									local n4 = 0
									local m3 = _g.jk.lang.Vector:getSize(importDirs)
									do
										n4 = 0
										while n4 < m3 do
											local dir = importDirs[n4 + 1]
											if dir ~= nil then
												ff = _g.jk.fs.File:forRelativePath(filename, dir, false)
												if ff ~= nil and ff:isFile() then
													do break end
												end
											end
											do n4 = n4 + 1 end
										end
									end
								end
								if ff == nil or ff:isFile() == false then
									do _g.jk.log.Log:error(self.logContext, "Unable to find file to import: `" .. _g.jk.lang.String:safeString(filename) .. "'") end
									goto _continue8
								end
								do _g.jk.log.Log:debug(self.logContext, "Attempting to import file: `" .. _g.jk.lang.String:safeString(ff:getPath()) .. "'") end
								do
									local content = ff:getContentsUTF8()
									if _g.jk.lang.String:isEmpty(content) then
										do _g.jk.log.Log:error(self.logContext, "Unable to read import file: `" .. _g.jk.lang.String:safeString(ff:getPath()) .. "'") end
										goto _continue8
									end
									if type == "html" then
										content = _g.jk.xml.HTMLString:sanitize(content)
									elseif type == "template" then
										local t = _g.jk.template.TextTemplate:forString(content, self.markerBegin, self.markerEnd, self.type, importDirs, nil, nil)
										if t == nil then
											do _g.jk.log.Log:error(self.logContext, "Failed to parse imported template file: `" .. _g.jk.lang.String:safeString(ff:getPath()) .. "'") end
											goto _continue8
										end
										if self:doExecute(t:getTokens(), vars, result, importDirs) == false then
											do _g.jk.log.Log:error(self.logContext, "Failed to process imported template file: `" .. _g.jk.lang.String:safeString(ff:getPath()) .. "'") end
											goto _continue8
										end
										content = nil
									elseif type == "raw" then
									else
										do _g.jk.log.Log:error(self.logContext, "Unknown type for import: `" .. _g.jk.lang.String:safeString(type) .. "'. Ignoring the import.") end
										goto _continue8
									end
									if _g.jk.lang.String:isEmpty(content) == false then
										do result:appendString(content) end
									end
								end
							end
						elseif tagname == "escapeHtml" then
							local content = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
							if _g.jk.lang.String:isEmpty(content) == false then
								content = _g.jk.xml.HTMLString:sanitize(content)
								if _g.jk.lang.String:isEmpty(content) == false then
									do result:appendString(content) end
								end
							end
						elseif tagname == "set" then
							if _g.jk.lang.Vector:getSize(words) ~= 3 then
								do _g.jk.log.Log:warning(self.logContext, "Invalid number of parameters for set tag encountered: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(_g.jk.lang.Vector:getSize(words)))) end
								goto _continue8
							end
							do
								local varname = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
								if _g.jk.lang.String:isEmpty(varname) then
									do _g.jk.log.Log:warning(self.logContext, "Empty variable name in set tag encountered.") end
									goto _continue8
								end
								do
									local newValue = self:substituteVariables(_g.jk.lang.Vector:get(words, 2), vars)
									do vars:setString(varname, newValue) end
								end
							end
						elseif tagname == "assign" then
							if _g.jk.lang.Vector:getSize(words) ~= 3 then
								do _g.jk.log.Log:warning(self.logContext, "Invalid number of parameters for assign tag encountered: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(_g.jk.lang.Vector:getSize(words)))) end
								goto _continue8
							end
							do
								local varname = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
								if _g.jk.lang.String:isEmpty(varname) then
									do _g.jk.log.Log:warning(self.logContext, "Empty variable name in assign tag encountered.") end
									goto _continue8
								end
								do
									local vv = _g.jk.lang.Vector:get(words, 2)
									if vv == "none" then
										do vars:remove(varname) end
									else
										do vars:setObject(varname, self:getVariableValue(vars, vv)) end
									end
								end
							end
						elseif tagname == "for" or tagname == "if" then
							if blockctr == 0 then
								blocktag = words
							end
							do blockctr = blockctr + 1 end
						elseif tagname == "end" then
						elseif self.type == _g.jk.template.TextTemplate.TYPE_HTML then
							do self:onHTMLTag(vars, result, importDirs, tagname, words) end
						elseif self.type == _g.jk.template.TextTemplate.TYPE_JSON then
							do self:onJSONTag(vars, result, importDirs, tagname, words) end
						else
						end
					end
					::_continue8::
					do n2 = n2 + 1 end
				end
			end
		end
		do return true end
	end
end

function jk.template.TextTemplate:basename(path)
	if not (path ~= nil) then
		do return nil end
	end
	do
		local v = ""
		local comps = _g.jk.lang.Vector:iterate(_g.jk.lang.String:split(path, 47, 0))
		if comps ~= nil then
			local comp = comps:next()
			while comp ~= nil do
				if _g.jk.lang.String:getLength(comp) > 0 then
					v = comp
				end
				comp = comps:next()
			end
		end
		do return v end
	end
end

function jk.template.TextTemplate:onHTMLTag(vars, result, importDirs, tagname, words)
	if tagname == "link" then
		local path = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
		local text = self:substituteVariables(_g.jk.lang.Vector:get(words, 2), vars)
		if _g.jk.lang.String:isEmpty(text) then
			text = self:basename(path)
		end
		if _g.jk.lang.String:isEmpty(text) then
			do return end
		end
		do result:appendString("<a href=\"" .. _g.jk.lang.String:safeString(path) .. "\"><span>" .. _g.jk.lang.String:safeString(text) .. "</span></a>") end
		do return end
	end
end

function jk.template.TextTemplate:encodeJSONString(s, sb)
	if not (s ~= nil) then
		do return end
	end
	do
		local it = _g.jk.lang.String:iterate(s)
		if not (it ~= nil) then
			do return end
		end
		do
			local c = 0
			while (function()
				c = it:getNextChar()
				do return c end
			end)() > 0 do
				if c == 34 then
					do sb:appendCharacter(92) end
				elseif c == 92 then
					do sb:appendCharacter(92) end
				end
				do sb:appendCharacter(c) end
			end
		end
	end
end

function jk.template.TextTemplate:onJSONTag(vars, result, importDirs, tagname, words)
	if tagname == "quotedstring" then
		local string = self:substituteVariables(_g.jk.lang.Vector:get(words, 1), vars)
		do self:encodeJSONString(string, result) end
	end
end

function jk.template.TextTemplate:getTokens()
	do return self.tokens end
end

function jk.template.TextTemplate:setTokens(v)
	self.tokens = v
	do return self end
end

function jk.template.TextTemplate:getText()
	do return self.text end
end

function jk.template.TextTemplate:setText(v)
	self.text = v
	do return self end
end

function jk.template.TextTemplate:getMarkerBegin()
	do return self.markerBegin end
end

function jk.template.TextTemplate:setMarkerBegin(v)
	self.markerBegin = v
	do return self end
end

function jk.template.TextTemplate:getMarkerEnd()
	do return self.markerEnd end
end

function jk.template.TextTemplate:setMarkerEnd(v)
	self.markerEnd = v
	do return self end
end

function jk.template.TextTemplate:getLogContext()
	do return self.logContext end
end

function jk.template.TextTemplate:setLogContext(v)
	self.logContext = v
	do return self end
end

function jk.template.TextTemplate:getType()
	do return self.type end
end

function jk.template.TextTemplate:setType(v)
	self.type = v
	do return self end
end

function jk.template.TextTemplate:getLanguagePreferences()
	do return self.languagePreferences end
end

function jk.template.TextTemplate:setLanguagePreferences(v)
	self.languagePreferences = v
	do return self end
end

function jk.template.TextTemplate:getIncludeDirs()
	do return self.includeDirs end
end

function jk.template.TextTemplate:setIncludeDirs(v)
	self.includeDirs = v
	do return self end
end

function jk.template.TextTemplate:getIncludeFileData()
	do return self.includeFileData end
end

function jk.template.TextTemplate:setIncludeFileData(v)
	self.includeFileData = v
	do return self end
end

jk.template.RichTextLinkParagraph = _g.jk.template.RichTextParagraph._create()
jk.template.RichTextLinkParagraph.__index = jk.template.RichTextLinkParagraph
_vm:set_metatable(jk.template.RichTextLinkParagraph, {
	__index = _g.jk.template.RichTextParagraph
})

function jk.template.RichTextLinkParagraph._create()
	local v = _vm:set_metatable({}, jk.template.RichTextLinkParagraph)
	return v
end

function jk.template.RichTextLinkParagraph:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.template.RichTextLinkParagraph'
	self['_isType.jk.template.RichTextLinkParagraph'] = true
	self.link = nil
	self.text = nil
	self.popup = false
end

function jk.template.RichTextLinkParagraph:_construct0()
	jk.template.RichTextLinkParagraph._init(self)
	do _g.jk.template.RichTextParagraph._construct0(self) end
	return self
end

function jk.template.RichTextLinkParagraph:toMarkup()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString("@link ") end
	do sb:appendString(self.link) end
	do sb:appendCharacter(32) end
	do sb:appendCharacter(34) end
	if _g.jk.lang.String:isEmpty(self.text) == false then
		do sb:appendString(self.text) end
	end
	do sb:appendCharacter(34) end
	if self.popup then
		do sb:appendString(" popup") end
	end
	do return sb:toString() end
end

function jk.template.RichTextLinkParagraph:toText()
	local v = self.text
	if _g.jk.lang.String:isEmpty(v) then
		v = self.link
	end
	do return v end
end

function jk.template.RichTextLinkParagraph:toJson()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("type", "link") end
	do v:setString("link", self.link) end
	do v:setString("text", self.text) end
	do return v end
end

function jk.template.RichTextLinkParagraph:toHtml(refs)
	local href = _g.jk.xml.HTMLString:sanitize(self.link)
	local tt = self.text
	if _g.jk.lang.String:isEmpty(tt) then
		tt = href
	end
	if _g.jk.lang.String:isEmpty(tt) then
		tt = "(empty link)"
	end
	do
		local targetblank = ""
		if self.popup then
			targetblank = " target=\"_blank\""
		end
		do return "<p class=\"link\"><a href=\"" .. _g.jk.lang.String:safeString(href) .. "\"" .. _g.jk.lang.String:safeString(targetblank) .. ">" .. _g.jk.lang.String:safeString(tt) .. "</a></p>\n" end
	end
end

function jk.template.RichTextLinkParagraph:getLink()
	do return self.link end
end

function jk.template.RichTextLinkParagraph:setLink(v)
	self.link = v
	do return self end
end

function jk.template.RichTextLinkParagraph:getText()
	do return self.text end
end

function jk.template.RichTextLinkParagraph:setText(v)
	self.text = v
	do return self end
end

function jk.template.RichTextLinkParagraph:getPopup()
	do return self.popup end
end

function jk.template.RichTextLinkParagraph:setPopup(v)
	self.popup = v
	do return self end
end
