jk = jk or {}

jk.server = jk.server or {}

jk.server.blog = jk.server.blog or {}

jk.server.blog.Category = _g.jk.json.JSONObjectAdapter._create()
jk.server.blog.Category.__index = jk.server.blog.Category
_vm:set_metatable(jk.server.blog.Category, {
	__index = _g.jk.json.JSONObjectAdapter
})

function jk.server.blog.Category._create()
	local v = _vm:set_metatable({}, jk.server.blog.Category)
	return v
end

function jk.server.blog.Category:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.blog.Category'
	self['_isType.jk.server.blog.Category'] = true
	self['_isType.jk.lang.StringObject'] = true
	self._id = nil
	self._title = nil
	self._slogan = nil
	self._intro = nil
	self._banner = nil
end

function jk.server.blog.Category:_construct0()
	jk.server.blog.Category._init(self)
	do _g.jk.json.JSONObjectAdapter._construct0(self) end
	return self
end

function jk.server.blog.Category:setId(value)
	self._id = value
	do return self end
end

function jk.server.blog.Category:getId()
	do return self._id end
end

function jk.server.blog.Category:setTitle(value)
	self._title = value
	do return self end
end

function jk.server.blog.Category:getTitle()
	do return self._title end
end

function jk.server.blog.Category:setSlogan(value)
	self._slogan = value
	do return self end
end

function jk.server.blog.Category:getSlogan()
	do return self._slogan end
end

function jk.server.blog.Category:setIntro(value)
	self._intro = value
	do return self end
end

function jk.server.blog.Category:getIntro()
	do return self._intro end
end

function jk.server.blog.Category:setBanner(value)
	self._banner = value
	do return self end
end

function jk.server.blog.Category:getBanner()
	do return self._banner end
end

function jk.server.blog.Category:toJsonObject()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	if self._id ~= nil then
		do v:setObject("id", self:asJsonValue(self._id)) end
	end
	if self._title ~= nil then
		do v:setObject("title", self:asJsonValue(self._title)) end
	end
	if self._slogan ~= nil then
		do v:setObject("slogan", self:asJsonValue(self._slogan)) end
	end
	if self._intro ~= nil then
		do v:setObject("intro", self:asJsonValue(self._intro)) end
	end
	if self._banner ~= nil then
		do v:setObject("banner", self:asJsonValue(self._banner)) end
	end
	do return v end
end

function jk.server.blog.Category:fromJsonObject(o)
	local v = _vm:to_table_with_key(o, '_isType.jk.lang.DynamicMap')
	if not (v ~= nil) then
		do return false end
	end
	self._id = v:getString("id", nil)
	self._title = v:getString("title", nil)
	self._slogan = v:getString("slogan", nil)
	self._intro = v:getString("intro", nil)
	self._banner = v:getString("banner", nil)
	do return true end
end

function jk.server.blog.Category:fromJsonString(o)
	do return self:fromJsonObject(_g.jk.json.JSONParser:parse(o)) end
end

function jk.server.blog.Category:toJsonString()
	do return _g.jk.json.JSONEncoder:encode(self:toJsonObject(), true, false) end
end

function jk.server.blog.Category:toString()
	do return self:toJsonString() end
end

function jk.server.blog.Category:forJsonString(o)
	local v = _g.jk.server.blog.Category._construct0(_g.jk.server.blog.Category._create())
	if not v:fromJsonString(o) then
		do return nil end
	end
	do return v end
end

function jk.server.blog.Category:forJsonObject(o)
	local v = _g.jk.server.blog.Category._construct0(_g.jk.server.blog.Category._create())
	if not v:fromJsonObject(o) then
		do return nil end
	end
	do return v end
end

jk.server.blog.BlogServer = _g.jk.server.web.WebServer._create()
jk.server.blog.BlogServer.__index = jk.server.blog.BlogServer
_vm:set_metatable(jk.server.blog.BlogServer, {
	__index = _g.jk.server.web.WebServer
})

function jk.server.blog.BlogServer._create()
	local v = _vm:set_metatable({}, jk.server.blog.BlogServer)
	return v
end

function jk.server.blog.BlogServer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.blog.BlogServer'
	self['_isType.jk.server.blog.BlogServer'] = true
	self._serverName = nil
	self._themeDirectory = nil
	self._articleDirectory = nil
	self.variables = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
end

function jk.server.blog.BlogServer:_construct0()
	jk.server.blog.BlogServer._init(self)
	do _g.jk.server.web.WebServer._construct0(self) end
	return self
end

function jk.server.blog.BlogServer:setVariable(key, value)
	if _g.jk.lang.String:isNotEmpty(key) then
		do self.variables:setString(key, value) end
	end
end

function jk.server.blog.BlogServer:configure(key, value, relativeTo, error)
	if _g.jk.lang.String:startsWith(key, "V", 0) then
		do self:setVariable(_g.jk.lang.String:getEndOfString(key, 1), value) end
		do return true end
	end
	do return _g.jk.server.web.WebServer.configure(self, key, value, relativeTo, error) end
end

function jk.server.blog.BlogServer:initializeServer(server)
	if not _g.jk.server.web.WebServer.initializeServer(self, server) then
		do return false end
	end
	do server:setServerName(self:getServerName()) end
	do
		local articleDir = _g.jk.fs.File:asFile(self:getArticleDirectory())
		if not (articleDir ~= nil and articleDir:isDirectory()) then
			do _g.jk.log.Log:error(self.ctx, "Invalid articleDirectory: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(self:getArticleDirectory())) .. "'") end
			do return false end
		end
		do
			local repository = _g.jk.server.blog.ArticleRepositoryDirectory:forDirectory(self.ctx, articleDir)
			if not (repository ~= nil) then
				do _g.jk.log.Log:error(self.ctx, "Failed to create article repository for data directory: `" .. _g.jk.lang.String:safeString(articleDir:getPath()) .. "'") end
				do return false end
			end
			do
				local templateData = self.variables
				local handler = _g.jk.server.blog.ArticleWebHandler:forRepository(repository)
				do handler:setDefaultCategory("articles") end
				do handler:setTemplateData(templateData) end
				do
					local themeDir = _g.jk.fs.File:asFile(self:getThemeDirectory())
					if not (themeDir ~= nil and themeDir:isDirectory()) then
						do _g.jk.log.Log:error(self.ctx, "Invalid themeDirectory: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(self:getThemeDirectory())) .. "'") end
						do return false end
					end
					do handler:setTemplateStorage(_g.jk.server.blog.TemplateStorageUsingFiles:forHTMLTemplateDirectory(themeDir)) end
					do server:pushRequestHandler2(handler) end
					do
						local themeStaticHandler = _g.jk.http.server.fs.HTTPServerDirectoryHandler:forDirectory(themeDir)
						do themeStaticHandler:setTemplateData(templateData) end
						do themeStaticHandler:setListDirectories(false) end
						do themeStaticHandler:setProcessTemplateFiles(true) end
						do themeStaticHandler:setIndexFiles({
							"index.html",
							"index.html.t"
						}) end
						do server:pushRequestHandler2(themeStaticHandler) end
						do server:pushRequestHandler1(function(req, next)
							local nf = themeDir:entry("notfound.html.t")
							local str = nf:getContentsUTF8()
							if _g.jk.lang.String:isNotEmpty(str) then
								local dirs = {}
								do _g.jk.lang.Vector:append(dirs, themeDir) end
								do
									local tt = _g.jk.template.TextTemplate:forHTMLString(str, dirs, nil, self.ctx)
									if tt ~= nil then
										local dd = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
										do dd:mergeFrom(templateData) end
										do
											local cc = tt:execute(dd, nil)
											if cc ~= nil then
												do req:sendHTMLString(cc) end
												do return end
											end
										end
									end
								end
							end
							do next() end
						end) end
						do return true end
					end
				end
			end
		end
	end
end

function jk.server.blog.BlogServer:_main(args)
	do return _g.jk.server.blog.BlogServer._construct0(_g.jk.server.blog.BlogServer._create()):executeMain(args) end
end

function jk.server.blog.BlogServer:getServerName()
	do return self._serverName end
end

function jk.server.blog.BlogServer:doSetServerName(value)
	self._serverName = value
end

function jk.server.blog.BlogServer:setServerName(v)
	do self:doSetServerName(v) end
	do return v end
end

function jk.server.blog.BlogServer:getThemeDirectory()
	do return self._themeDirectory end
end

function jk.server.blog.BlogServer:doSetThemeDirectory(value)
	self._themeDirectory = value
end

function jk.server.blog.BlogServer:setThemeDirectory(v)
	do self:doSetThemeDirectory(v) end
	do return v end
end

function jk.server.blog.BlogServer:getArticleDirectory()
	do return self._articleDirectory end
end

function jk.server.blog.BlogServer:doSetArticleDirectory(value)
	self._articleDirectory = value
end

function jk.server.blog.BlogServer:setArticleDirectory(v)
	do self:doSetArticleDirectory(v) end
	do return v end
end

jk.server.blog.Article = _g.jk.json.JSONObjectAdapter._create()
jk.server.blog.Article.__index = jk.server.blog.Article
_vm:set_metatable(jk.server.blog.Article, {
	__index = _g.jk.json.JSONObjectAdapter
})

function jk.server.blog.Article._create()
	local v = _vm:set_metatable({}, jk.server.blog.Article)
	return v
end

function jk.server.blog.Article:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.blog.Article'
	self['_isType.jk.server.blog.Article'] = true
	self['_isType.jk.lang.StringObject'] = true
	self._id = nil
	self._title = nil
	self._slogan = nil
	self._author = nil
	self._introMarkup = nil
	self._introHtml = nil
	self._date = nil
	self._timeStamp = nil
	self._redirect = nil
	self._banner = nil
	self._shareImage = nil
	self._shareDescription = nil
	self._categories = nil
	self._parent = nil
	self._contentMarkup = nil
	self._contentHtml = nil
	self._priority = nil
	self._description = nil
	self._introPhoto = nil
	self._fbImage = nil
	self._tags = nil
end

function jk.server.blog.Article:_construct0()
	jk.server.blog.Article._init(self)
	do _g.jk.json.JSONObjectAdapter._construct0(self) end
	return self
end

function jk.server.blog.Article:setId(value)
	self._id = value
	do return self end
end

function jk.server.blog.Article:getId()
	do return self._id end
end

function jk.server.blog.Article:setTitle(value)
	self._title = value
	do return self end
end

function jk.server.blog.Article:getTitle()
	do return self._title end
end

function jk.server.blog.Article:setSlogan(value)
	self._slogan = value
	do return self end
end

function jk.server.blog.Article:getSlogan()
	do return self._slogan end
end

function jk.server.blog.Article:setAuthor(value)
	self._author = value
	do return self end
end

function jk.server.blog.Article:getAuthor()
	do return self._author end
end

function jk.server.blog.Article:setIntroMarkup(value)
	self._introMarkup = value
	do return self end
end

function jk.server.blog.Article:getIntroMarkup()
	do return self._introMarkup end
end

function jk.server.blog.Article:setIntroHtml(value)
	self._introHtml = value
	do return self end
end

function jk.server.blog.Article:getIntroHtml()
	do return self._introHtml end
end

function jk.server.blog.Article:setDate(value)
	self._date = value
	do return self end
end

function jk.server.blog.Article:getDate()
	do return self._date end
end

function jk.server.blog.Article:setTimeStampValue(value)
	do return self:setTimeStamp(_g.jk.lang.LongInteger:asObject(value)) end
end

function jk.server.blog.Article:getTimeStampValue()
	do return _g.jk.lang.LongInteger:asLong(self._timeStamp) end
end

function jk.server.blog.Article:setTimeStamp(value)
	self._timeStamp = value
	do return self end
end

function jk.server.blog.Article:getTimeStamp()
	do return self._timeStamp end
end

function jk.server.blog.Article:setRedirect(value)
	self._redirect = value
	do return self end
end

function jk.server.blog.Article:getRedirect()
	do return self._redirect end
end

function jk.server.blog.Article:setBanner(value)
	self._banner = value
	do return self end
end

function jk.server.blog.Article:getBanner()
	do return self._banner end
end

function jk.server.blog.Article:setShareImage(value)
	self._shareImage = value
	do return self end
end

function jk.server.blog.Article:getShareImage()
	do return self._shareImage end
end

function jk.server.blog.Article:setShareDescription(value)
	self._shareDescription = value
	do return self end
end

function jk.server.blog.Article:getShareDescription()
	do return self._shareDescription end
end

function jk.server.blog.Article:setCategories(value)
	self._categories = value
	do return self end
end

function jk.server.blog.Article:getCategories()
	do return self._categories end
end

function jk.server.blog.Article:setParent(value)
	self._parent = value
	do return self end
end

function jk.server.blog.Article:getParent()
	do return self._parent end
end

function jk.server.blog.Article:setContentMarkup(value)
	self._contentMarkup = value
	do return self end
end

function jk.server.blog.Article:getContentMarkup()
	do return self._contentMarkup end
end

function jk.server.blog.Article:setContentHtml(value)
	self._contentHtml = value
	do return self end
end

function jk.server.blog.Article:getContentHtml()
	do return self._contentHtml end
end

function jk.server.blog.Article:setPriorityValue(value)
	do return self:setPriority(_g.jk.lang.Integer:asObject(value)) end
end

function jk.server.blog.Article:getPriorityValue()
	do return _g.jk.lang.Integer:asInteger(self._priority) end
end

function jk.server.blog.Article:setPriority(value)
	self._priority = value
	do return self end
end

function jk.server.blog.Article:getPriority()
	do return self._priority end
end

function jk.server.blog.Article:setDescription(value)
	self._description = value
	do return self end
end

function jk.server.blog.Article:getDescription()
	do return self._description end
end

function jk.server.blog.Article:setIntroPhoto(value)
	self._introPhoto = value
	do return self end
end

function jk.server.blog.Article:getIntroPhoto()
	do return self._introPhoto end
end

function jk.server.blog.Article:setFbImage(value)
	self._fbImage = value
	do return self end
end

function jk.server.blog.Article:getFbImage()
	do return self._fbImage end
end

function jk.server.blog.Article:setTags(value)
	self._tags = value
	do return self end
end

function jk.server.blog.Article:getTags()
	do return self._tags end
end

function jk.server.blog.Article:toJsonObject()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	if self._id ~= nil then
		do v:setObject("id", self:asJsonValue(self._id)) end
	end
	if self._title ~= nil then
		do v:setObject("title", self:asJsonValue(self._title)) end
	end
	if self._slogan ~= nil then
		do v:setObject("slogan", self:asJsonValue(self._slogan)) end
	end
	if self._author ~= nil then
		do v:setObject("author", self:asJsonValue(self._author)) end
	end
	if self._introMarkup ~= nil then
		do v:setObject("introMarkup", self:asJsonValue(self._introMarkup)) end
	end
	if self._introHtml ~= nil then
		do v:setObject("introHtml", self:asJsonValue(self._introHtml)) end
	end
	if self._date ~= nil then
		do v:setObject("date", self:asJsonValue(self._date)) end
	end
	if self._timeStamp ~= nil then
		do v:setObject("timeStamp", self:asJsonValue(self._timeStamp)) end
	end
	if self._redirect ~= nil then
		do v:setObject("redirect", self:asJsonValue(self._redirect)) end
	end
	if self._banner ~= nil then
		do v:setObject("banner", self:asJsonValue(self._banner)) end
	end
	if self._shareImage ~= nil then
		do v:setObject("shareImage", self:asJsonValue(self._shareImage)) end
	end
	if self._shareDescription ~= nil then
		do v:setObject("shareDescription", self:asJsonValue(self._shareDescription)) end
	end
	if self._categories ~= nil then
		local ss = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
		if self._categories ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self._categories)
			do
				n = 0
				while n < m do
					local vv = self._categories[n + 1]
					if vv ~= nil then
						do ss:appendObject(self:asJsonValue(vv)) end
					end
					do n = n + 1 end
				end
			end
		end
		do v:setObject("categories", ss) end
	end
	if self._parent ~= nil then
		do v:setObject("parent", self:asJsonValue(self._parent)) end
	end
	if self._contentMarkup ~= nil then
		do v:setObject("contentMarkup", self:asJsonValue(self._contentMarkup)) end
	end
	if self._contentHtml ~= nil then
		do v:setObject("contentHtml", self:asJsonValue(self._contentHtml)) end
	end
	if self._priority ~= nil then
		do v:setObject("priority", self:asJsonValue(self._priority)) end
	end
	if self._description ~= nil then
		do v:setObject("description", self:asJsonValue(self._description)) end
	end
	if self._introPhoto ~= nil then
		do v:setObject("introPhoto", self:asJsonValue(self._introPhoto)) end
	end
	if self._fbImage ~= nil then
		do v:setObject("fbImage", self:asJsonValue(self._fbImage)) end
	end
	if self._tags ~= nil then
		local ss = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
		if self._tags ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(self._tags)
			do
				n2 = 0
				while n2 < m2 do
					local vv = self._tags[n2 + 1]
					if vv ~= nil then
						do ss:appendObject(self:asJsonValue(vv)) end
					end
					do n2 = n2 + 1 end
				end
			end
		end
		do v:setObject("tags", ss) end
	end
	do return v end
end

function jk.server.blog.Article:fromJsonObject(o)
	local v = _vm:to_table_with_key(o, '_isType.jk.lang.DynamicMap')
	if not (v ~= nil) then
		do return false end
	end
	self._id = v:getString("id", nil)
	self._title = v:getString("title", nil)
	self._slogan = v:getString("slogan", nil)
	self._author = v:getString("author", nil)
	self._introMarkup = v:getString("introMarkup", nil)
	self._introHtml = v:getString("introHtml", nil)
	self._date = v:getString("date", nil)
	if v:get("timeStamp") ~= nil then
		self._timeStamp = _g.jk.lang.LongInteger:asObject(v:getLongInteger("timeStamp", 0))
	end
	self._redirect = v:getString("redirect", nil)
	self._banner = v:getString("banner", nil)
	self._shareImage = v:getString("shareImage", nil)
	self._shareDescription = v:getString("shareDescription", nil)
	do
		local ss = v:getVector("categories")
		if not (ss ~= nil) then
			local v1 = _vm:to_table_with_key(_g.jk.json.JSONParser:parseString(v:getString("categories", nil)), '_isType.jk.lang.DynamicVector')
			if v1 ~= nil then
				ss = v1:toVector()
			end
		end
		if ss ~= nil then
			self._categories = {}
			if ss ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(ss)
				do
					n = 0
					while n < m do
						local s = ss[n + 1]
						if s ~= nil then
							local so = _g.jk.lang.String:asString(s)
							if so ~= nil then
								do _g.jk.lang.Vector:append(self._categories, so) end
							end
						end
						do n = n + 1 end
					end
				end
			end
		end
	end
	self._parent = v:getString("parent", nil)
	self._contentMarkup = v:getString("contentMarkup", nil)
	self._contentHtml = v:getString("contentHtml", nil)
	if v:get("priority") ~= nil then
		self._priority = _g.jk.lang.Integer:asObject(v:getInteger("priority", 0))
	end
	self._description = v:getString("description", nil)
	self._introPhoto = v:getString("introPhoto", nil)
	self._fbImage = v:getString("fbImage", nil)
	do
		local ss = v:getVector("tags")
		if not (ss ~= nil) then
			local v1 = _vm:to_table_with_key(_g.jk.json.JSONParser:parseString(v:getString("tags", nil)), '_isType.jk.lang.DynamicVector')
			if v1 ~= nil then
				ss = v1:toVector()
			end
		end
		if ss ~= nil then
			self._tags = {}
			if ss ~= nil then
				local n2 = 0
				local m2 = _g.jk.lang.Vector:getSize(ss)
				do
					n2 = 0
					while n2 < m2 do
						local s = ss[n2 + 1]
						if s ~= nil then
							local so = _g.jk.lang.String:asString(s)
							if so ~= nil then
								do _g.jk.lang.Vector:append(self._tags, so) end
							end
						end
						do n2 = n2 + 1 end
					end
				end
			end
		end
	end
	do return true end
end

function jk.server.blog.Article:fromJsonString(o)
	do return self:fromJsonObject(_g.jk.json.JSONParser:parse(o)) end
end

function jk.server.blog.Article:toJsonString()
	do return _g.jk.json.JSONEncoder:encode(self:toJsonObject(), true, false) end
end

function jk.server.blog.Article:toString()
	do return self:toJsonString() end
end

function jk.server.blog.Article:forJsonString(o)
	local v = _g.jk.server.blog.Article._construct0(_g.jk.server.blog.Article._create())
	if not v:fromJsonString(o) then
		do return nil end
	end
	do return v end
end

function jk.server.blog.Article:forJsonObject(o)
	local v = _g.jk.server.blog.Article._construct0(_g.jk.server.blog.Article._create())
	if not v:fromJsonObject(o) then
		do return nil end
	end
	do return v end
end

jk.server.blog.ArticleRepository = {}
jk.server.blog.ArticleRepository.__index = jk.server.blog.ArticleRepository
_vm:set_metatable(jk.server.blog.ArticleRepository, {})

function jk.server.blog.ArticleRepository._create()
	local v = _vm:set_metatable({}, jk.server.blog.ArticleRepository)
	return v
end

function jk.server.blog.ArticleRepository:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.blog.ArticleRepository'
	self['_isType.jk.server.blog.ArticleRepository'] = true
end

function jk.server.blog.ArticleRepository:_construct0()
	jk.server.blog.ArticleRepository._init(self)
	return self
end

function jk.server.blog.ArticleRepository:getCategories(callback)
end

function jk.server.blog.ArticleRepository:getArticleCount(category, callback)
end

function jk.server.blog.ArticleRepository:getArticles(category, offset, limit, callback)
end

function jk.server.blog.ArticleRepository:getArticleById(id, callback)
end

function jk.server.blog.ArticleRepository:getArticleTitleSync(id)
end

function jk.server.blog.ArticleRepository:getCategoryTitleSync(id)
end

function jk.server.blog.ArticleRepository:getArticleAttachment(id, name, callback)
end

function jk.server.blog.ArticleRepository:getIntroHtml(article, resolver)
	if not (article ~= nil) then
		do return nil end
	end
	do
		local html = article:getIntroHtml()
		if html ~= nil then
			do return html end
		end
		do
			local markup = article:getIntroMarkup()
			if _g.jk.lang.String:isEmpty(markup) then
				do return "" end
			end
			do
				local doc = _g.jk.template.RichTextDocument:forWikiMarkupString(markup)
				if not (doc ~= nil) then
					do return nil end
				end
				do return doc:toHtml(resolver) end
			end
		end
	end
end

function jk.server.blog.ArticleRepository:getContentHtml(article, resolver)
	if not (article ~= nil) then
		do return nil end
	end
	do
		local html = article:getContentHtml()
		if html ~= nil then
			do return html end
		end
		do
			local markup = article:getContentMarkup()
			if _g.jk.lang.String:isEmpty(markup) then
				do return "" end
			end
			do
				local doc = _g.jk.template.RichTextDocument:forWikiMarkupString(markup)
				if not (doc ~= nil) then
					do return nil end
				end
				do return doc:toHtml(resolver) end
			end
		end
	end
end

jk.server.blog.TemplateStorage = {}

jk.server.blog.ArticleWebHandler = _g.jk.http.server.HTTPServerRequestHandlerAdapter._create()
jk.server.blog.ArticleWebHandler.__index = jk.server.blog.ArticleWebHandler
_vm:set_metatable(jk.server.blog.ArticleWebHandler, {
	__index = _g.jk.http.server.HTTPServerRequestHandlerAdapter
})

function jk.server.blog.ArticleWebHandler._create()
	local v = _vm:set_metatable({}, jk.server.blog.ArticleWebHandler)
	return v
end

function jk.server.blog.ArticleWebHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.blog.ArticleWebHandler'
	self['_isType.jk.server.blog.ArticleWebHandler'] = true
	self['_isType.jk.template.RichTextDocumentReferenceResolver'] = true
	self.repository = nil
	self.articlesPerPage = 10
	self.templateStorage = nil
	self.templateData = nil
	self.templatePrefix = nil
	self.languages = nil
	self.enableCategoryList = false
	self.categoryPathSuffix = nil
	self.defaultCategory = nil
end

function jk.server.blog.ArticleWebHandler:_construct0()
	jk.server.blog.ArticleWebHandler._init(self)
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter._construct0(self) end
	return self
end

function jk.server.blog.ArticleWebHandler:forRepository(repository)
	local v = _g.jk.server.blog.ArticleWebHandler._construct0(_g.jk.server.blog.ArticleWebHandler._create())
	do v:setRepository(repository) end
	do return v end
end

function jk.server.blog.ArticleWebHandler:getReferenceHref(refid)
	local urlPrefix = nil
	if self.templateData ~= nil then
		urlPrefix = self.templateData:getString("urlPrefix", nil)
	end
	if urlPrefix == nil then
		do return "/" .. _g.jk.lang.String:safeString(refid) end
	end
	do return _g.jk.lang.String:safeString(urlPrefix) .. "/" .. _g.jk.lang.String:safeString(refid) end
end

function jk.server.blog.ArticleWebHandler:getReferenceTitle(refid)
	if self.repository ~= nil then
		local v = self.repository:getArticleTitleSync(refid)
		if v ~= nil then
			do return v end
		end
		do
			local catId = refid
			if self.categoryPathSuffix ~= nil then
				if _g.jk.lang.String:endsWith(catId, self.categoryPathSuffix) then
					catId = _g.jk.lang.String:getSubString(catId, 0, _g.jk.lang.String:getLength(catId) - _g.jk.lang.String:getLength(self.categoryPathSuffix))
				else
					catId = nil
				end
			end
			if catId ~= nil then
				local v = self.repository:getCategoryTitleSync(catId)
				if v ~= nil then
					do return v end
				end
			end
		end
	end
	do return refid end
end

function jk.server.blog.ArticleWebHandler:getContentString(cid)
	local tsf = _vm:to_table_with_key(self.templateStorage, '_isType.jk.server.blog.TemplateStorageUsingFiles')
	if not (tsf ~= nil) then
		do _g.jk.log.Log:error(self.logContext, "Only implemented for TemplateStorageUsingFiles") end
		do return nil end
	end
	do
		local dir = tsf:getDirectory()
		if not (dir ~= nil) then
			do return nil end
		end
		do
			local file = dir:entry("content"):entry(_g.jk.lang.String:safeString(cid) .. ".html")
			if not file:isFile() then
				do return nil end
			end
			do return file:getContentsUTF8() end
		end
	end
end

function jk.server.blog.ArticleWebHandler:isResponseHTML(req)
	if not (self.templateStorage ~= nil) then
		do return false end
	end
	if not not (req:getQueryParameter("format") == "json") then
		do return false end
	end
	do return true end
end

function jk.server.blog.ArticleWebHandler:onGETCategoryList(req, next)
	do self.repository:getCategories(function(results)
		if not (results ~= nil) then
			do self:sendResponse(req, "error", _g.jk.http.server.HTTPServerJSONResponse:forErrorCode("queryFailed")) end
			do return end
		end
		do
			local v = {}
			if results ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(results)
				do
					n = 0
					while n < m do
						local result = results[n + 1]
						if result ~= nil then
							do _g.jk.lang.Vector:append(v, result:toJsonObject()) end
						end
						do n = n + 1 end
					end
				end
			end
			do
				local data = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
				do data:setObject("categories", v) end
				do self:sendResponse(req, "categorylist", data) end
			end
		end
	end) end
end

function jk.server.blog.ArticleWebHandler:processTimeStamp(values)
	local timeStamp = values:getLongInteger("timeStamp", 0)
	if timeStamp > 0 then
		local date = _g.jk.time.format.VerboseDateTimeString:getDateStringForDateTime(_g.jk.lang.DateTime:forSeconds(timeStamp))
		local time = _g.jk.time.format.VerboseDateTimeString:getTimeStringForDateTime(_g.jk.lang.DateTime:forSeconds(timeStamp), false)
		do values:setString("date", date) end
		do values:setString("time", time) end
		do values:setString("dateTime", _g.jk.lang.String:safeString(date) .. " " .. _g.jk.lang.String:safeString(time)) end
	end
end

function jk.server.blog.ArticleWebHandler:onGETCategoryArticles(req, next)
	local catId = req:peekResource()
	if catId ~= nil and self.categoryPathSuffix ~= nil then
		if not _g.jk.lang.String:endsWith(catId, self.categoryPathSuffix) then
			do next() end
			do return end
		end
		catId = _g.jk.lang.String:getSubString(catId, 0, _g.jk.lang.String:getLength(catId) - _g.jk.lang.String:getLength(self.categoryPathSuffix))
	end
	do
		local pp = 0
		local spage = req:getQueryParameter("page")
		if spage ~= nil then
			pp = _g.jk.lang.String:toInteger(spage) - 1
		end
		if pp < 0 then
			pp = 0
		end
		do
			local myObject = self
			if _g.jk.lang.String:isEmpty(catId) and self.defaultCategory ~= nil then
				catId = self.defaultCategory
			end
			do self.repository:getArticleCount(catId, function(count)
				if not (count >= 0) then
					do next() end
					do return end
				end
				do req:popResource() end
				if req:hasMoreResources() then
					do req:unpopResource() end
					do next() end
					do return end
				end
				if req:isForDirectory() == false then
					do req:sendRedirectAsDirectory() end
					do return end
				end
				do
					local pages = _util:convert_to_integer(count / self.articlesPerPage)
					if _util:convert_to_integer(count % self.articlesPerPage) > 0 then
						do pages = pages + 1 end
					end
					if pages < 1 then
						pages = 1
					end
					do self.repository:getArticles(catId, pp * self.articlesPerPage, self.articlesPerPage, function(category, results)
						if not (results ~= nil) then
							do self:sendResponse(req, "error", _g.jk.http.server.HTTPServerJSONResponse:forErrorCode("queryFailed")) end
							do return end
						end
						do
							local v = {}
							local resultCount = _g.jk.lang.Vector:getSize(results)
							local doSendResponse = function()
								local data = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
								local cat = category
								if cat == nil then
									cat = _g.jk.server.blog.Category._construct0(_g.jk.server.blog.Category._create())
									do cat:setId(catId) end
									do cat:setTitle(catId) end
								end
								do
									local intro = cat:getIntro()
									if intro == nil then
										intro = ""
									end
									do data:setString("intro", intro) end
									do data:setString("description", intro) end
									do data:setObject("articles", v) end
									do data:setObject("category", cat:toJsonObject()) end
									if pp > 0 then
										do data:setInteger("previousPage", pp) end
									end
									if pp + 2 <= pages then
										do data:setInteger("nextPage", pp + 2) end
									end
									do data:setInteger("currentPage", pp + 1) end
									do data:setInteger("pageCount", pages) end
									do self:sendResponse(req, "articlelist", data) end
								end
							end
							if resultCount < 1 then
								do doSendResponse() end
								do return end
							end
							do
								local resultCounter = 0
								local onIntroHtmlRetrieved = function()
									do resultCounter = resultCounter + 1 end
									if resultCounter == resultCount then
										do doSendResponse() end
									end
								end
								if results ~= nil then
									local n = 0
									local m = _g.jk.lang.Vector:getSize(results)
									do
										n = 0
										while n < m do
											local result = results[n + 1]
											if result ~= nil then
												local map = _vm:to_table_with_key(result:toJsonObject(), '_isType.jk.lang.DynamicMap')
												if not (map ~= nil) then
													map = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
												end
												do self:processTimeStamp(map) end
												do _g.jk.lang.Vector:append(v, map) end
												do
													local html = self.repository:getIntroHtml(result, myObject)
													do map:setString("introHtml", html) end
													do onIntroHtmlRetrieved() end
												end
											end
											do n = n + 1 end
										end
									end
								end
							end
						end
					end) end
				end
			end) end
		end
	end
end

function jk.server.blog.ArticleWebHandler:getBreadcrumbs(article)
	if not (article ~= nil) then
		do return nil end
	end
	do
		local parent = article:getParent()
		if not _g.jk.lang.String:isNotEmpty(parent) then
			do return nil end
		end
		do
			local v = {}
			local o = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
			do o:setObject("reference", parent) end
			do o:setString("text", self.repository:getArticleTitleSync(parent)) end
			do _g.jk.lang.Vector:append(v, o) end
			do return v end
		end
	end
end

function jk.server.blog.ArticleWebHandler:onGETArticle(req, next)
	local pageId = req:peekResource()
	if not _g.jk.lang.String:isNotEmpty(pageId) then
		do next() end
		do return end
	end
	do
		local myObject = self
		do self.repository:getArticleById(pageId, function(article)
			if not (article ~= nil) then
				do next() end
				do return end
			end
			do req:popResource() end
			if req:hasMoreResources() then
				local attachmentFileName = req:popResource()
				if req:isForDirectory() or req:hasMoreResources() then
					do req:unpopResource() end
					do req:unpopResource() end
					do next() end
					do return end
				end
				do self.repository:getArticleAttachment(article:getId(), attachmentFileName, function(mimeType, data)
					if data == nil then
						do req:unpopResource() end
						do req:unpopResource() end
						do next() end
						do return end
					end
					do
						local resp = _g.jk.http.server.HTTPServerResponse:forBuffer(data, mimeType)
						do req:sendResponse(resp) end
					end
				end) end
				do return end
			end
			do
				local redirect = article:getRedirect()
				if _g.jk.lang.String:isNotEmpty(redirect) then
					do req:sendRedirect(redirect) end
					do return end
				end
				if req:isForDirectory() == false then
					do req:sendRedirectAsDirectory() end
					do return end
				end
				do
					local map = _vm:to_table_with_key(article:toJsonObject(), '_isType.jk.lang.DynamicMap')
					if not (map ~= nil) then
						map = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
					end
					if _g.jk.lang.String:isEmpty(map:getString("shareDescription", nil)) then
						do map:setString("shareDescription", map:getString("slogan", nil)) end
					end
					do
						local introHtml = self.repository:getIntroHtml(article, myObject)
						do map:setString("introHtml", introHtml) end
						do
							local contentHtml = self.repository:getContentHtml(article, myObject)
							do map:setString("contentHtml", contentHtml) end
							do map:setObject("breadcrumbs", self:getBreadcrumbs(article)) end
							do self:processTimeStamp(map) end
							do self:sendResponse(req, "article", map) end
						end
					end
				end
			end
		end) end
	end
end

function jk.server.blog.ArticleWebHandler:sendResponse(req, type, content)
	local rdata = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do rdata:setString("type", type) end
	do rdata:setObject("content", content) end
	do
		local rq = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do rq:setString("path", req:getURLPath()) end
		do rdata:setObject("request", rq) end
		if self.templateData ~= nil then
			do rdata:mergeFrom(self.templateData) end
		end
		if self:isResponseHTML(req) then
			local tp = self.templatePrefix
			if tp == nil then
				tp = ""
			end
			do
				local templateName = _g.jk.lang.String:safeString(tp) .. _g.jk.lang.String:safeString(type)
				do self.templateStorage:getTemplate(templateName, function(template)
					if not (template ~= nil) then
						do req:sendJSONObject(rdata) end
						do return end
					end
					do self:sendHTMLResponse(req, rdata, template) end
				end) end
			end
		else
			do rdata:remove("site") end
			do rdata:remove("request") end
			do req:sendJSONObject(rdata) end
		end
	end
end

function jk.server.blog.ArticleWebHandler:sendHTMLResponse(req, data, tt)
	local includeDirs = {}
	local tsf = _vm:to_table_with_key(self.templateStorage, '_isType.jk.server.blog.TemplateStorageUsingFiles')
	if tsf ~= nil then
		do _g.jk.lang.Vector:append(includeDirs, tsf:getDirectory()) end
	end
	do
		local template = _g.jk.template.TextTemplate:forHTMLString(tt, includeDirs, nil, nil)
		if not (template ~= nil) then
			do req:sendInternalError("Text template parsing") end
			do return end
		end
		do template:setLanguagePreferences(self.languages) end
		do
			local str = template:execute(data, includeDirs)
			if not (str ~= nil) then
				do req:sendInternalError("Text template execution") end
				do return end
			end
			do req:sendHTMLString(str) end
		end
	end
end

function jk.server.blog.ArticleWebHandler:onGET2(req, next)
	if not (self.repository ~= nil) then
		do next() end
		do return end
	end
	if req:hasMoreResources() == false then
		if req:isForDirectory() == false then
			do req:sendRedirectAsDirectory() end
			do return end
		end
		do self:onGETCategoryArticles(req, next) end
		do return end
	end
	do
		local resource = req:peekResource()
		if resource == "articles" then
			local path = _g.jk.lang.String:getEndOfString(req:getURLPath(), 9)
			if _g.jk.lang.String:isEmpty(path) then
				path = "/"
			end
			do req:sendRedirect(path) end
			do return end
		end
		if self.enableCategoryList and resource == "categories" then
			do req:popResource() end
			if req:hasMoreResources() then
				do next() end
				do return end
			end
			if req:isForDirectory() == false then
				do req:sendRedirectAsDirectory() end
				do return end
			end
			do self:onGETCategoryList(req, next) end
			do return end
		end
		if _g.jk.server.blog.ArticleUtil:isValidIdentifier(resource) == false then
			do next() end
			do return end
		end
		do self:onGETArticle(req, function()
			do self:onGETCategoryArticles(req, next) end
		end) end
	end
end

function jk.server.blog.ArticleWebHandler:getRepository()
	do return self.repository end
end

function jk.server.blog.ArticleWebHandler:setRepository(v)
	self.repository = v
	do return self end
end

function jk.server.blog.ArticleWebHandler:getArticlesPerPage()
	do return self.articlesPerPage end
end

function jk.server.blog.ArticleWebHandler:setArticlesPerPage(v)
	self.articlesPerPage = v
	do return self end
end

function jk.server.blog.ArticleWebHandler:getTemplateStorage()
	do return self.templateStorage end
end

function jk.server.blog.ArticleWebHandler:setTemplateStorage(v)
	self.templateStorage = v
	do return self end
end

function jk.server.blog.ArticleWebHandler:getTemplateData()
	do return self.templateData end
end

function jk.server.blog.ArticleWebHandler:setTemplateData(v)
	self.templateData = v
	do return self end
end

function jk.server.blog.ArticleWebHandler:getTemplatePrefix()
	do return self.templatePrefix end
end

function jk.server.blog.ArticleWebHandler:setTemplatePrefix(v)
	self.templatePrefix = v
	do return self end
end

function jk.server.blog.ArticleWebHandler:getLanguages()
	do return self.languages end
end

function jk.server.blog.ArticleWebHandler:setLanguages(v)
	self.languages = v
	do return self end
end

function jk.server.blog.ArticleWebHandler:getEnableCategoryList()
	do return self.enableCategoryList end
end

function jk.server.blog.ArticleWebHandler:setEnableCategoryList(v)
	self.enableCategoryList = v
	do return self end
end

function jk.server.blog.ArticleWebHandler:getCategoryPathSuffix()
	do return self.categoryPathSuffix end
end

function jk.server.blog.ArticleWebHandler:setCategoryPathSuffix(v)
	self.categoryPathSuffix = v
	do return self end
end

function jk.server.blog.ArticleWebHandler:getDefaultCategory()
	do return self.defaultCategory end
end

function jk.server.blog.ArticleWebHandler:setDefaultCategory(v)
	self.defaultCategory = v
	do return self end
end

jk.server.blog.TemplateStorageUsingFiles = {}
jk.server.blog.TemplateStorageUsingFiles.__index = jk.server.blog.TemplateStorageUsingFiles
_vm:set_metatable(jk.server.blog.TemplateStorageUsingFiles, {})

function jk.server.blog.TemplateStorageUsingFiles._create()
	local v = _vm:set_metatable({}, jk.server.blog.TemplateStorageUsingFiles)
	return v
end

function jk.server.blog.TemplateStorageUsingFiles:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.blog.TemplateStorageUsingFiles'
	self['_isType.jk.server.blog.TemplateStorageUsingFiles'] = true
	self['_isType.jk.server.blog.TemplateStorage'] = true
	self.directory = nil
	self.suffix = nil
end

function jk.server.blog.TemplateStorageUsingFiles:forDirectory(dir)
	local v = _g.jk.server.blog.TemplateStorageUsingFiles._construct0(_g.jk.server.blog.TemplateStorageUsingFiles._create())
	do v:setDirectory(dir) end
	do return v end
end

function jk.server.blog.TemplateStorageUsingFiles:forHTMLTemplateDirectory(dir)
	local v = _g.jk.server.blog.TemplateStorageUsingFiles._construct0(_g.jk.server.blog.TemplateStorageUsingFiles._create())
	do v:setDirectory(dir) end
	do v:setSuffix(".html.t") end
	do return v end
end

function jk.server.blog.TemplateStorageUsingFiles:_construct0()
	jk.server.blog.TemplateStorageUsingFiles._init(self)
	self.suffix = ".txt"
	return self
end

function jk.server.blog.TemplateStorageUsingFiles:getTemplate(id, callback)
	if not (callback ~= nil) then
		do return end
	end
	if self.directory == nil or _g.jk.lang.String:isEmpty(id) or _g.jk.lang.String:getIndexOfCharacter(id, 47, 0) >= 0 or _g.jk.lang.String:getIndexOfCharacter(id, 92, 0) >= 0 then
		do callback(nil) end
		do return end
	end
	do
		local ff = self.directory:entry(_g.jk.lang.String:safeString(id) .. _g.jk.lang.String:safeString(self.suffix))
		if ff:isFile() == false then
			do callback(nil) end
			do return end
		end
		do callback(ff:getContentsUTF8()) end
	end
end

function jk.server.blog.TemplateStorageUsingFiles:getDirectory()
	do return self.directory end
end

function jk.server.blog.TemplateStorageUsingFiles:setDirectory(v)
	self.directory = v
	do return self end
end

function jk.server.blog.TemplateStorageUsingFiles:getSuffix()
	do return self.suffix end
end

function jk.server.blog.TemplateStorageUsingFiles:setSuffix(v)
	self.suffix = v
	do return self end
end

jk.server.blog.TemplateStorageUsingSQLDatabase = {}
jk.server.blog.TemplateStorageUsingSQLDatabase.__index = jk.server.blog.TemplateStorageUsingSQLDatabase
_vm:set_metatable(jk.server.blog.TemplateStorageUsingSQLDatabase, {})

function jk.server.blog.TemplateStorageUsingSQLDatabase._create()
	local v = _vm:set_metatable({}, jk.server.blog.TemplateStorageUsingSQLDatabase)
	return v
end

function jk.server.blog.TemplateStorageUsingSQLDatabase:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.blog.TemplateStorageUsingSQLDatabase'
	self['_isType.jk.server.blog.TemplateStorageUsingSQLDatabase'] = true
	self['_isType.jk.server.blog.TemplateStorage'] = true
	self.database = nil
	self.table = nil
	self.idColumn = nil
	self.contentColumn = nil
end

function jk.server.blog.TemplateStorageUsingSQLDatabase:forDatabase(db, table, idColumn, contentColumn)
	local v = _g.jk.server.blog.TemplateStorageUsingSQLDatabase._construct0(_g.jk.server.blog.TemplateStorageUsingSQLDatabase._create())
	do v:setDatabase(db) end
	if table ~= nil then
		do v:setTable(table) end
	end
	if idColumn ~= nil then
		do v:setIdColumn(idColumn) end
	end
	if contentColumn ~= nil then
		do v:setContentColumn(contentColumn) end
	end
	do return v end
end

function jk.server.blog.TemplateStorageUsingSQLDatabase:_construct0()
	jk.server.blog.TemplateStorageUsingSQLDatabase._init(self)
	self.table = "templates"
	self.idColumn = "id"
	self.contentColumn = "content"
	return self
end

function jk.server.blog.TemplateStorageUsingSQLDatabase:getTemplate(id, callback)
	if not (callback ~= nil) then
		do return end
	end
	if self.database == nil or _g.jk.lang.String:isEmpty(self.table) or _g.jk.lang.String:isEmpty(id) then
		do callback(nil) end
		do return end
	end
	do
		local stmt = self.database:prepareSync("SELECT content FROM " .. _g.jk.lang.String:safeString(self.table) .. " WHERE " .. _g.jk.lang.String:safeString(self.idColumn) .. " = ?;")
		if stmt == nil then
			do callback(nil) end
			do return end
		end
		do stmt:addParamString(id) end
		do
			local cb = callback
			do self.database:querySingleRow(stmt, function(data)
				if data == nil then
					do cb(nil) end
					do return end
				end
				do cb(data:getString("content", nil)) end
			end) end
		end
	end
end

function jk.server.blog.TemplateStorageUsingSQLDatabase:getDatabase()
	do return self.database end
end

function jk.server.blog.TemplateStorageUsingSQLDatabase:setDatabase(v)
	self.database = v
	do return self end
end

function jk.server.blog.TemplateStorageUsingSQLDatabase:getTable()
	do return self.table end
end

function jk.server.blog.TemplateStorageUsingSQLDatabase:setTable(v)
	self.table = v
	do return self end
end

function jk.server.blog.TemplateStorageUsingSQLDatabase:getIdColumn()
	do return self.idColumn end
end

function jk.server.blog.TemplateStorageUsingSQLDatabase:setIdColumn(v)
	self.idColumn = v
	do return self end
end

function jk.server.blog.TemplateStorageUsingSQLDatabase:getContentColumn()
	do return self.contentColumn end
end

function jk.server.blog.TemplateStorageUsingSQLDatabase:setContentColumn(v)
	self.contentColumn = v
	do return self end
end

jk.server.blog.ArticleRepositoryDirectory = _g.jk.server.blog.ArticleRepository._create()
jk.server.blog.ArticleRepositoryDirectory.__index = jk.server.blog.ArticleRepositoryDirectory
_vm:set_metatable(jk.server.blog.ArticleRepositoryDirectory, {
	__index = _g.jk.server.blog.ArticleRepository
})

function jk.server.blog.ArticleRepositoryDirectory._create()
	local v = _vm:set_metatable({}, jk.server.blog.ArticleRepositoryDirectory)
	return v
end

function jk.server.blog.ArticleRepositoryDirectory:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.blog.ArticleRepositoryDirectory'
	self['_isType.jk.server.blog.ArticleRepositoryDirectory'] = true
	self.context = nil
	self.directory = nil
	self.articles = nil
	self.articleLists = nil
	self.staticArticleLists = nil
	self.categoryMap = nil
	self.categoryMapTimestamp = 0
end

function jk.server.blog.ArticleRepositoryDirectory:_construct0()
	jk.server.blog.ArticleRepositoryDirectory._init(self)
	do _g.jk.server.blog.ArticleRepository._construct0(self) end
	return self
end

jk.server.blog.ArticleRepositoryDirectory.MyArticle = _g.jk.server.blog.Article._create()
jk.server.blog.ArticleRepositoryDirectory.MyArticle.__index = jk.server.blog.ArticleRepositoryDirectory.MyArticle
_vm:set_metatable(jk.server.blog.ArticleRepositoryDirectory.MyArticle, {
	__index = _g.jk.server.blog.Article
})

function jk.server.blog.ArticleRepositoryDirectory.MyArticle._create()
	local v = _vm:set_metatable({}, jk.server.blog.ArticleRepositoryDirectory.MyArticle)
	return v
end

function jk.server.blog.ArticleRepositoryDirectory.MyArticle:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.blog.ArticleRepositoryDirectory.MyArticle'
	self['_isType.jk.server.blog.ArticleRepositoryDirectory.MyArticle'] = true
	self.lastModifiedTimeStamp = 0
end

function jk.server.blog.ArticleRepositoryDirectory.MyArticle:_construct0()
	jk.server.blog.ArticleRepositoryDirectory.MyArticle._init(self)
	do _g.jk.server.blog.Article._construct0(self) end
	return self
end

function jk.server.blog.ArticleRepositoryDirectory.MyArticle:mergeToCategories(categories)
	if not (categories ~= nil) then
		do return end
	end
	do
		local cc = {}
		if _g.jk.lang.Vector:isEmpty(categories) == false then
			if categories ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(categories)
				do
					n = 0
					while n < m do
						local category = categories[n + 1]
						if category ~= nil then
							do _g.jk.lang.Vector:append(cc, category) end
						end
						do n = n + 1 end
					end
				end
			end
			do
				local array = self:getCategories()
				if array ~= nil then
					local n2 = 0
					local m2 = _g.jk.lang.Vector:getSize(array)
					do
						n2 = 0
						while n2 < m2 do
							local category = array[n2 + 1]
							if category ~= nil then
								do _g.jk.lang.Vector:append(cc, category) end
							end
							do n2 = n2 + 1 end
						end
					end
				end
			end
		end
		do self:setCategories(cc) end
	end
end

function jk.server.blog.ArticleRepositoryDirectory.MyArticle:mergeToTags(tags)
	if not (tags ~= nil) then
		do return end
	end
	do
		local cc = {}
		if _g.jk.lang.Vector:isEmpty(tags) == false then
			if tags ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(tags)
				do
					n = 0
					while n < m do
						local tag = tags[n + 1]
						if tag ~= nil then
							do _g.jk.lang.Vector:append(cc, tag) end
						end
						do n = n + 1 end
					end
				end
			end
			do
				local array = self:getTags()
				if array ~= nil then
					local n2 = 0
					local m2 = _g.jk.lang.Vector:getSize(array)
					do
						n2 = 0
						while n2 < m2 do
							local tag = array[n2 + 1]
							if tag ~= nil then
								do _g.jk.lang.Vector:append(cc, tag) end
							end
							do n2 = n2 + 1 end
						end
					end
				end
			end
		end
		do self:setTags(cc) end
	end
end

function jk.server.blog.ArticleRepositoryDirectory.MyArticle:getLastModifiedTimeStamp()
	do return self.lastModifiedTimeStamp end
end

function jk.server.blog.ArticleRepositoryDirectory.MyArticle:setLastModifiedTimeStamp(v)
	self.lastModifiedTimeStamp = v
	do return self end
end

function jk.server.blog.ArticleRepositoryDirectory:forDirectory(ctx, dir)
	local v = _g.jk.server.blog.ArticleRepositoryDirectory._construct0(_g.jk.server.blog.ArticleRepositoryDirectory._create())
	do v:setContext(ctx) end
	do v:setDirectory(dir) end
	do v:refreshArticles() end
	do return v end
end

function jk.server.blog.ArticleRepositoryDirectory:refreshArticles()
	self.articles = {}
	if self.directory ~= nil then
		do _g.jk.log.Log:debug(self.context, "Refreshing articles: `" .. _g.jk.lang.String:safeString(self.directory:getPath()) .. "' ..") end
		do
			local it = self.directory:entries()
			while it ~= nil do
				local file = it:next()
				if not (file ~= nil) then
					do break end
				end
				if not file:hasExtension("article") then
					goto _continue1
				end
				do
					local article = self:doReadArticleFile(file)
					if not (article ~= nil) then
						goto _continue1
					end
					do
						local id = article:getId()
						if _g.jk.lang.String:isEmpty(id) then
							goto _continue1
						end
						self.articles[id] = article
					end
				end
				::_continue1::
			end
			do _g.jk.log.Log:debug(self.context, "DONE refreshing articles.") end
		end
	else
		do _g.jk.log.Log:debug(self.context, "No directory specified. Cannot refresh articles.") end
	end
	do self:updateArticleLists() end
end

function jk.server.blog.ArticleRepositoryDirectory:sortArticleLists()
	do _g.jk.log.Log:debug(self.context, "Sorting article lists ..") end
	do
		local it = _g.jk.lang.Map:iterateValues(self.articleLists)
		while it ~= nil do
			local list = it:next()
			if not (list ~= nil) then
				do break end
			end
			do _g.jk.lang.Vector:sort(list, function(a, b)
				local aa = _g.jk.lang.Map:get(self.articles, a)
				local ab = _g.jk.lang.Map:get(self.articles, b)
				if not (aa ~= nil) and not (ab ~= nil) then
					do return 0 end
				end
				if not (aa ~= nil) then
					do return 1 end
				end
				if not (ab ~= nil) then
					do return -1 end
				end
				do
					local aprio = aa:getPriorityValue()
					local bprio = ab:getPriorityValue()
					if aprio > 0 and aprio > bprio then
						do return -1 end
					end
					if bprio > 0 and bprio > aprio then
						do return 1 end
					end
					do
						local ats = aa:getTimeStampValue()
						local bts = ab:getTimeStampValue()
						if ats < bts then
							do return 1 end
						end
						if ats > bts then
							do return -1 end
						end
						do return 0 end
					end
				end
			end) end
		end
		do _g.jk.log.Log:debug(self.context, "Done sorting article lists ..") end
	end
end

function jk.server.blog.ArticleRepositoryDirectory:updateArticleLists()
	do _g.jk.log.Log:debug(self.context, "Updating article lists ..") end
	self.articleLists = {}
	do
		local it = _g.jk.lang.Map:iterateValues(self.articles)
		while it ~= nil do
			local article = it:next()
			if not (article ~= nil) then
				do break end
			end
			do
				local id = article:getId()
				if _g.jk.lang.String:isEmpty(id) then
					goto _continue2
				end
				do
					local array = article:getCategories()
					if array ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(array)
						do
							n = 0
							while n < m do
								local category = array[n + 1]
								if category ~= nil then
									local list = _g.jk.lang.Map:get(self.articleLists, category)
									if not (list ~= nil) then
										list = {}
										self.articleLists[category] = list
									end
									do _g.jk.lang.Vector:append(list, id) end
								end
								do n = n + 1 end
							end
						end
					end
				end
			end
			::_continue2::
		end
		do self:sortArticleLists() end
		do _g.jk.log.Log:debug(self.context, "DONE updating article lists.") end
	end
end

function jk.server.blog.ArticleRepositoryDirectory:addArticleToCategory(article, category)
	if not (article ~= nil and category ~= nil) then
		do return end
	end
	if not (self.staticArticleLists ~= nil) then
		self.staticArticleLists = {}
	end
	do
		local list = _g.jk.lang.Map:get(self.staticArticleLists, category)
		if not (list ~= nil) then
			list = {}
			self.staticArticleLists[category] = list
		end
		do _g.jk.lang.Vector:append(list, article) end
	end
end

function jk.server.blog.ArticleRepositoryDirectory:getCategoryMap()
	if self.directory ~= nil then
		local file = self.directory:entry("categories.json")
		if not file:isFile() then
			self.categoryMap = nil
		elseif file:hasChangedSince(self.categoryMapTimestamp) then
			self.categoryMap = {}
			self.categoryMapTimestamp = file:getLastModifiedTimeStamp()
			do
				local data = _vm:to_table_with_key(_g.jk.json.JSONParser:parse(file:getContentsUTF8()), '_isType.jk.lang.DynamicMap')
				if data ~= nil then
					local it = data:iterateKeys()
					while it ~= nil do
						local id = it:next()
						if id == nil then
							do break end
						end
						do
							local c = _g.jk.server.blog.Category:forJsonObject(data:getDynamicMap(id))
							do c:setId(id) end
							self.categoryMap[id] = c
						end
					end
				end
			end
		end
	end
	do return self.categoryMap end
end

function jk.server.blog.ArticleRepositoryDirectory:getCategoryById(id)
	if not (id ~= nil) then
		do return nil end
	end
	do
		local cats = self:getCategoryMap()
		if not (cats ~= nil) then
			do return nil end
		end
		do return _g.jk.lang.Map:get(cats, id) end
	end
end

function jk.server.blog.ArticleRepositoryDirectory:getArticleListForCategory(categoryName)
	if not (categoryName ~= nil) then
		do return nil end
	end
	do
		local slist = _g.jk.lang.Map:get(self.staticArticleLists, categoryName)
		if slist ~= nil then
			do return slist end
		end
		do return _g.jk.lang.Map:get(self.articleLists, categoryName) end
	end
end

function jk.server.blog.ArticleRepositoryDirectory:getCategories(callback)
	local map = self:getCategoryMap()
	if not (map ~= nil) then
		do callback(nil) end
		do return end
	end
	do
		local v = {}
		local it = _g.jk.lang.Map:iterateValues(map)
		while it ~= nil do
			local cat = it:next()
			if not (cat ~= nil) then
				do break end
			end
			do _g.jk.lang.Vector:append(v, cat) end
		end
		do callback(v) end
	end
end

function jk.server.blog.ArticleRepositoryDirectory:getArticleCount(category, callback)
	local names = self:getArticleListForCategory(category)
	if not (names ~= nil and _g.jk.lang.Vector:getSize(names) >= 0) then
		do callback(-1) end
		do return end
	end
	do callback(_g.jk.lang.Vector:getSize(names)) end
end

function jk.server.blog.ArticleRepositoryDirectory:getArticles(category, offset, limit, callback)
	local v = {}
	local names = self:getArticleListForCategory(category)
	if names ~= nil then
		do
			local n = 0
			while n < limit do
				local name = _g.jk.lang.Vector:getAt(names, offset + n)
				if name == nil then
					do break end
				end
				do
					local a = self:doGetArticleById(name)
					if a == nil then
						local ma = _g.jk.server.blog.Article._construct0(_g.jk.server.blog.Article._create())
						do ma:setTitle(name) end
						a = ma
						do
							local catname = category
							if catname == nil then
								catname = "[null]"
							end
							do _g.jk.log.Log:warning(self.context, "Invalid article id in category `" .. _g.jk.lang.String:safeString(catname) .. "': `" .. _g.jk.lang.String:safeString(name) .. "'") end
						end
					end
					do _g.jk.lang.Vector:append(v, a) end
				end
				do n = n + 1 end
			end
		end
	end
	do
		local cat = self:getCategoryById(category)
		if cat == nil then
			cat = _g.jk.server.blog.Category._construct0(_g.jk.server.blog.Category._create())
			do cat:setId(category) end
			do cat:setTitle(category) end
		end
		do callback(cat, v) end
	end
end

function jk.server.blog.ArticleRepositoryDirectory:doReadArticleFile(file)
	if not (file ~= nil) then
		do return nil end
	end
	do
		local reader = _g.jk.io.PrintReader:forReader(file:read())
		if not (reader ~= nil) then
			do _g.jk.log.Log:error(self.context, "Failed to read article file: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'") end
			do return nil end
		end
		do
			local v = _g.jk.server.blog.ArticleRepositoryDirectory.MyArticle._construct0(_g.jk.server.blog.ArticleRepositoryDirectory.MyArticle._create())
			do v:setLastModifiedTimeStamp(file:getLastModifiedTimeStamp()) end
			do v:setId(file:getBasenameWithoutExtension()) end
			do _g.jk.log.Log:debug(self.context, "Reading article file: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "' ..") end
			while true do
				local line = reader:readLine()
				if not (line ~= nil) then
					do break end
				end
				line = _g.jk.lang.String:strip(line)
				if _g.jk.lang.String:isEmpty(line) then
					do break end
				end
				if _g.jk.lang.String:startsWith(line, "#", 0) then
					goto _continue3
				end
				while _g.jk.lang.String:endsWith(line, "\\") do
					line = _g.jk.lang.String:getSubString(line, 0, _g.jk.lang.String:getLength(line) - 1)
					do
						local nl = reader:readLine()
						if not (nl ~= nil) then
							do break end
						end
						nl = _g.jk.lang.String:stripFromStart(nl)
						if _g.jk.lang.String:endsWith(line, " ") == false then
							line = _g.jk.lang.String:safeString(line) .. " "
						end
						line = _g.jk.lang.String:safeString(line) .. _g.jk.lang.String:safeString(nl)
					end
				end
				if _g.jk.lang.String:startsWith(line, "include ", 0) then
					local toinclude = _g.jk.lang.String:getEndOfString(line, 8)
					if _g.jk.lang.String:isEmpty(toinclude) then
						do _g.jk.log.Log:warning(self.context, "Empty include directive: `" .. _g.jk.lang.String:safeString(line) .. "'") end
						goto _continue3
					end
					if _g.jk.lang.String:contains(toinclude, "/") or _g.jk.lang.String:contains(toinclude, "\\") then
						do _g.jk.log.Log:warning(self.context, "Invalid characters in include filename: `" .. _g.jk.lang.String:safeString(toinclude) .. "'") end
						goto _continue3
					end
					do
						local ifile = file:getSibling(toinclude)
						if ifile:isFile() == false then
							do _g.jk.log.Log:warning(self.context, "Include file does not exist: `" .. _g.jk.lang.String:safeString(toinclude) .. "'") end
							goto _continue3
						end
						do
							local iarticle = self:doReadArticleFile(ifile)
							if iarticle ~= nil then
								do v:setTitle(iarticle:getTitle()) end
								do v:setSlogan(iarticle:getSlogan()) end
								do v:setAuthor(iarticle:getAuthor()) end
								do v:setIntroMarkup(iarticle:getIntroMarkup()) end
								do v:setDate(iarticle:getDate()) end
								do v:setRedirect(iarticle:getRedirect()) end
								do v:setBanner(iarticle:getBanner()) end
								do v:mergeToCategories(iarticle:getCategories()) end
								do v:setShareImage(iarticle:getShareImage()) end
								do v:setParent(iarticle:getParent()) end
								do v:setShareDescription(iarticle:getShareDescription()) end
								do v:setTimeStamp(iarticle:getTimeStamp()) end
								do v:setPriority(iarticle:getPriority()) end
								do v:setDescription(iarticle:getDescription()) end
								do v:setIntroPhoto(iarticle:getIntroPhoto()) end
								do v:setFbImage(iarticle:getFbImage()) end
								do v:mergeToTags(iarticle:getTags()) end
							end
							goto _continue3
						end
					end
				end
				if _g.jk.lang.String:getIndexOfCharacter(line, 58, 0) > 0 then
					local comps = _g.jk.lang.String:split(line, 58, 2)
					local key = _g.jk.lang.String:strip(_g.jk.lang.Vector:get(comps, 0))
					local value = _g.jk.lang.String:strip(_g.jk.lang.Vector:get(comps, 1))
					if _g.jk.server.blog.ArticleUtil:isValidIdentifier(key) then
						if key == "title" then
							do v:setTitle(value) end
						elseif key == "slogan" then
							do v:setSlogan(value) end
						elseif key == "author" then
							do v:setAuthor(value) end
						elseif key == "intro" then
							do v:setIntroMarkup(value) end
						elseif key == "date" then
							do v:setDate(value) end
						elseif key == "redirect" then
							do v:setRedirect(value) end
						elseif key == "banner" then
							do v:setBanner(value) end
						elseif key == "shareImage" then
							do v:setShareImage(value) end
						elseif key == "shareDescription" then
							do v:setShareDescription(value) end
						elseif key == "parent" then
							do v:setParent(value) end
						elseif key == "timeStamp" then
							local tsv = _g.jk.lang.String:toLong(value)
							if tsv < 10000 then
								do _g.jk.log.Log:warning(self.context, "Invalid timestamp value: `" .. _g.jk.lang.String:safeString(value) .. "'") end
							end
							do v:setTimeStampValue(tsv) end
						elseif key == "priority" then
							do v:setPriorityValue(_g.jk.lang.String:toInteger(value)) end
						elseif key == "description" then
							do v:setDescription(value) end
						elseif key == "introPhoto" then
							do v:setIntroPhoto(value) end
						elseif key == "fbImage" then
							do v:setFbImage(value) end
						elseif key == "categories" then
							local vc = {}
							local cats = _g.jk.lang.String:split(value, 32, 0)
							if cats ~= nil then
								local n = 0
								local m = _g.jk.lang.Vector:getSize(cats)
								do
									n = 0
									while n < m do
										local cat = cats[n + 1]
										if cat ~= nil then
											local cc = _g.jk.lang.String:strip(cat)
											if _g.jk.lang.String:isNotEmpty(cc) then
												do _g.jk.lang.Vector:append(vc, cc) end
											end
										end
										do n = n + 1 end
									end
								end
							end
							do v:setCategories(vc) end
						elseif key == "tags" then
							local vc = {}
							local cats = _g.jk.lang.String:split(value, 32, 0)
							if cats ~= nil then
								local n2 = 0
								local m2 = _g.jk.lang.Vector:getSize(cats)
								do
									n2 = 0
									while n2 < m2 do
										local cat = cats[n2 + 1]
										if cat ~= nil then
											local cc = _g.jk.lang.String:strip(cat)
											if _g.jk.lang.String:isNotEmpty(cc) then
												do _g.jk.lang.Vector:append(vc, cc) end
											end
										end
										do n2 = n2 + 1 end
									end
								end
							end
							do v:setTags(vc) end
						else
							do _g.jk.log.Log:warning(self.context, "Unsupported header value in file `" .. _g.jk.lang.String:safeString(file:getPath()) .. "': `" .. _g.jk.lang.String:safeString(key) .. "'") end
						end
					end
				else
					do _g.jk.log.Log:warning(self.context, "Invalid header line in file `" .. _g.jk.lang.String:safeString(file:getPath()) .. "': `" .. _g.jk.lang.String:safeString(line) .. "'") end
				end
				::_continue3::
			end
			do
				local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				while true do
					local line = reader:readLine()
					if not (line ~= nil) then
						do break end
					end
					if sb:count() > 0 then
						do sb:appendCharacter(10) end
					end
					do sb:appendString(line) end
				end
				do v:setContentMarkup(sb:toString()) end
				do _g.jk.log.Log:debug(self.context, "DONE reading article file: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'.") end
				do reader:close() end
				do return v end
			end
		end
	end
end

function jk.server.blog.ArticleRepositoryDirectory:doGetArticleById(id)
	if not (id ~= nil and self.articles ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.lang.Map:get(self.articles, id)
		if self.directory ~= nil then
			local file = self.directory:entry(_g.jk.lang.String:safeString(id) .. ".article")
			if file:isFile() then
				if v == nil or file:hasChangedSince(v:getLastModifiedTimeStamp()) then
					local nv = self:doReadArticleFile(file)
					if nv ~= nil then
						v = nv
						do _g.jk.lang.Map:set(self.articles, id, v) end
						do self:updateArticleLists() end
					end
				end
			elseif v ~= nil then
				do _g.jk.lang.Map:remove(self.articles, id) end
				do self:updateArticleLists() end
				v = nil
			end
		end
		do return v end
	end
end

function jk.server.blog.ArticleRepositoryDirectory:getArticleById(id, callback)
	do callback(self:doGetArticleById(id)) end
end

function jk.server.blog.ArticleRepositoryDirectory:getArticleTitleSync(id)
	local article = self:doGetArticleById(id)
	if article ~= nil then
		do return article:getTitle() end
	end
	do return nil end
end

function jk.server.blog.ArticleRepositoryDirectory:getCategoryTitleSync(id)
	local category = self:getCategoryById(id)
	if category ~= nil then
		do return category:getTitle() end
	end
	do return nil end
end

function jk.server.blog.ArticleRepositoryDirectory:getArticleAttachment(id, name, callback)
	if not (id ~= nil and name ~= nil and self.directory ~= nil) then
		do callback(nil, nil) end
		do return end
	end
	do
		local f = self.directory:entry(id):entry(name)
		if not f:isFile() then
			do callback(nil, nil) end
			do return end
		end
		do callback(_g.jk.mime.MimeTypeRegistry:getSharedInstance():getTypeForFile(f), f:getContentsBuffer()) end
	end
end

function jk.server.blog.ArticleRepositoryDirectory:getContext()
	do return self.context end
end

function jk.server.blog.ArticleRepositoryDirectory:setContext(v)
	self.context = v
	do return self end
end

function jk.server.blog.ArticleRepositoryDirectory:getDirectory()
	do return self.directory end
end

function jk.server.blog.ArticleRepositoryDirectory:setDirectory(v)
	self.directory = v
	do return self end
end

jk.server.blog.ArticleUtil = {}
jk.server.blog.ArticleUtil.__index = jk.server.blog.ArticleUtil
_vm:set_metatable(jk.server.blog.ArticleUtil, {})

function jk.server.blog.ArticleUtil._create()
	local v = _vm:set_metatable({}, jk.server.blog.ArticleUtil)
	return v
end

function jk.server.blog.ArticleUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.blog.ArticleUtil'
	self['_isType.jk.server.blog.ArticleUtil'] = true
end

function jk.server.blog.ArticleUtil:_construct0()
	jk.server.blog.ArticleUtil._init(self)
	return self
end

function jk.server.blog.ArticleUtil:isValidIdentifier(name)
	if not (name ~= nil) then
		do return false end
	end
	if _g.jk.lang.String:getLength(name) < 1 then
		do return false end
	end
	do
		local it = _g.jk.lang.String:iterate(name)
		while it ~= nil do
			local c = it:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				do break end
			end
			if c >= 97 and c <= 122 then
			elseif c >= 65 and c <= 90 then
			elseif c >= 48 and c <= 57 then
			elseif c == 45 or c == 95 or c == 46 then
			else
				do return false end
			end
		end
		do return true end
	end
end

function _main(args)
	do return jk.server.blog.BlogServer:_main(args) end
end
