let JkTemplateRichTextParagraph = function() {};

JkTemplateRichTextParagraph.prototype._t = { "JkTemplateRichTextParagraph" : true };
JkTemplateRichTextParagraph.prototype._tobj = JkTemplateRichTextParagraph;

JkTemplateRichTextParagraph.NEW = function() {
	var v = new JkTemplateRichTextParagraph;
	return v.CTOR_JkTemplateRichTextParagraph();
};

JkTemplateRichTextParagraph.prototype.CTOR_JkTemplateRichTextParagraph = function() {
	return this;
};

JkTemplateRichTextParagraph.prototype.toMarkup = function() {
	return null;
};

JkTemplateRichTextParagraph.prototype.toText = function() {
	return null;
};

JkTemplateRichTextParagraph.prototype.toJson = function() {
	return null;
};

JkTemplateRichTextParagraph.prototype.toHtml = function(refs) {
	return null;
};

JkTemplateRichTextParagraph.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTemplateRichTextParagraph"] === true;
};

let JkTemplateTextTemplateTagData = function() {
	this.words = null;
};

JkTemplateTextTemplateTagData.prototype._t = { "JkTemplateTextTemplateTagData" : true };
JkTemplateTextTemplateTagData.prototype._tobj = JkTemplateTextTemplateTagData;

JkTemplateTextTemplateTagData.NEW_Vector = function(words) {
	var v = new JkTemplateTextTemplateTagData;
	return v.CTOR_JkTemplateTextTemplateTagData_Vector(words);
};

JkTemplateTextTemplateTagData.prototype.CTOR_JkTemplateTextTemplateTagData_Vector = function(words) {
	this.words = null;
	this.words = words;
	return this;
};

JkTemplateTextTemplateTagData.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTemplateTextTemplateTagData"] === true;
};

let JkTemplateTextTemplate = function() {
	this.tokens = null;
	this.text = null;
	this.markerBegin = null;
	this.markerEnd = null;
	this.logContext = null;
	this.type = JkTemplateTextTemplate.TYPE_GENERIC;
	this.languagePreferences = null;
	this.includeDirs = null;
	this.includeFileData = null;
};

JkTemplateTextTemplate.prototype._t = { "JkTemplateTextTemplate" : true };
JkTemplateTextTemplate.prototype._tobj = JkTemplateTextTemplate;

JkTemplateTextTemplate.NEW = function() {
	var v = new JkTemplateTextTemplate;
	return v.CTOR_JkTemplateTextTemplate();
};

JkTemplateTextTemplate.prototype.CTOR_JkTemplateTextTemplate = function() {
	this.includeFileData = null;
	this.includeDirs = null;
	this.languagePreferences = null;
	this.type = JkTemplateTextTemplate.TYPE_GENERIC;
	this.logContext = null;
	this.markerEnd = null;
	this.markerBegin = null;
	this.text = null;
	this.tokens = null;
	return this;
};

JkTemplateTextTemplate.processFile = function(file, markerBegin, markerEnd, vars) {
	var v = JkTemplateTextTemplate.forFile(file, markerBegin, markerEnd, 0, null, null, null);
	if(!(v != null)) {
		return null;
	}
	return v.execute(vars, null);
};

JkTemplateTextTemplate.processString = function(text, markerBegin, markerEnd, vars) {
	var v = JkTemplateTextTemplate.forString(text, markerBegin, markerEnd, 0, null, null, null);
	if(!(v != null)) {
		return null;
	}
	return v.execute(vars, null);
};

JkTemplateTextTemplate.forFile = function(file, markerBegin, markerEnd, type, includeDirs, includeFileData, logContext) {
	if(!(file != null)) {
		return null;
	}
	var text = file.getContentsUTF8();
	if(!(text != null)) {
		return null;
	}
	var ids = includeDirs;
	if(!(ids != null)) {
		ids = new Array;
		ids.push(file.getParent());
	}
	return JkTemplateTextTemplate.forString(text, markerBegin, markerEnd, type, ids, includeFileData, logContext);
};

JkTemplateTextTemplate.forHTMLFile = function(file, includeDirs, includeFileData, logContext) {
	return JkTemplateTextTemplate.forFile(file, "<%", "%>", JkTemplateTextTemplate.TYPE_HTML, includeDirs, includeFileData, logContext);
};

JkTemplateTextTemplate.forString = function(text, markerBegin, markerEnd, type, includeDirs, includeFileData, logContext) {
	var v = JkTemplateTextTemplate.NEW();
	v.setLogContext(logContext);
	v.setText(text);
	v.setType(type);
	v.setMarkerBegin(markerBegin);
	v.setMarkerEnd(markerEnd);
	v.setIncludeDirs(includeDirs);
	v.setIncludeFileData(includeFileData);
	if(v.prepare() == false) {
		v = null;
	}
	return v;
};

JkTemplateTextTemplate.forHTMLString = function(text, includeDirs, includeFileData, logContext) {
	var v = JkTemplateTextTemplate.NEW();
	v.setLogContext(logContext);
	v.setText(text);
	v.setType(JkTemplateTextTemplate.TYPE_HTML);
	v.setMarkerBegin("<%");
	v.setMarkerEnd("%>");
	v.setIncludeDirs(includeDirs);
	v.setIncludeFileData(includeFileData);
	if(v.prepare() == false) {
		v = null;
	}
	return v;
};

JkTemplateTextTemplate.forJSONString = function(text, includeDirs, includeFileData, logContext) {
	var v = JkTemplateTextTemplate.NEW();
	v.setLogContext(logContext);
	v.setText(text);
	v.setType(JkTemplateTextTemplate.TYPE_JSON);
	v.setMarkerBegin("{{");
	v.setMarkerEnd("}}");
	v.setIncludeDirs(includeDirs);
	v.setIncludeFileData(includeFileData);
	if(v.prepare() == false) {
		v = null;
	}
	return v;
};

JkTemplateTextTemplate.prototype.setLanguagePreference = function(language) {
	this.languagePreferences = new Array;
	if(language != null) {
		this.languagePreferences.push(language);
	}
};

JkTemplateTextTemplate.prototype.getIncludeFileContent = function(fileName) {
	if(!(fileName != null)) {
		return null;
	}
	var ff = null;
	if(this.includeFileData != null) {
		var o = JkLangMap.get(this.includeFileData, fileName);
		if(o != null) {
			if(typeof(o) === 'string') {
				return o;
			}
			if(o instanceof ArrayBuffer) {
				return JkLangString.forUTF8Buffer(o);
			}
			if(JkFsFile.IS_INSTANCE && JkFsFile.IS_INSTANCE(o)) {
				ff = o;
			}
		}
	}
	if(!(ff != null)) {
		if(JkFsPathInfo.isAbsolutePath(fileName)) {
			ff = JkFsFile.forPath(fileName);
		}
	}
	if(!(ff != null)) {
		if(this.includeDirs != null) {
			var n = 0;
			var m = this.includeDirs.length;
			for(n = 0 ; n < m ; n++) {
				var includeDir = this.includeDirs[n];
				if(includeDir != null) {
					var x = JkFsFile.forRelativePath(fileName, includeDir, false);
					if(x.isFile()) {
						ff = x;
						break;
					}
				}
			}
		}
	}
	if(!(ff != null && ff.isFile())) {
		JkLogLog.warning(this.logContext, "Included file was not found: `" + (JkLangString.safeString(fileName)) + ("'"));
		return null;
	}
	var cc = ff.getContentsUTF8();
	if(!(cc != null)) {
		JkLogLog.warning(this.logContext, "Failed to read included file: `" + (JkLangString.safeString((ff.getPath()))) + ("'"));
	}
	return cc;
};

JkTemplateTextTemplate.prototype.tokenizeString = function(inputdata) {
	if(this.markerBegin == null || this.markerEnd == null) {
		JkLogLog.error(this.logContext, "No template markers were given");
		return null;
	}
	if(JkLangString.getLength(this.markerBegin) != 2 || JkLangString.getLength(this.markerEnd) != 2) {
		JkLogLog.error(this.logContext, "Invalid template markers: `" + (JkLangString.safeString(this.markerBegin)) + ("' and `") + (JkLangString.safeString(this.markerEnd)) + ("'"));
		return null;
	}
	var mb1 = JkLangString.getChar(this.markerBegin, 0);
	var mb2 = JkLangString.getChar(this.markerBegin, 1);
	var me1 = JkLangString.getChar(this.markerEnd, 0);
	var me2 = JkLangString.getChar(this.markerEnd, 1);
	var pc = '\0'.charCodeAt();
	var tag = null;
	var data = null;
	var it = JkLangString.iterate(inputdata);
	var v = new Array;
	while(it != null){
		var c = it.getNextChar();
		if(c <= 0) {
			break;
		}
		if(tag != null) {
			if(pc == me1 && tag.count() > 2) {
				tag.appendCharacter(pc);
				tag.appendCharacter(c);
				if(c == me2) {
					var tt = tag.toString();
					var tts = JkLangString.strip((JkLangString.getSubString(tt, 2, (JkLangString.getLength(tt) - 4))));
					var words = JkTextStringUtil.quotedStringToVector(tts, ' '.charCodeAt(), true, '\\'.charCodeAt());
					if(JkLangVector.get(words, 0) == "include") {
						var fileName = JkLangVector.get(words, 1);
						if(JkLangString.isEmpty(fileName)) {
							JkLogLog.warning(this.logContext, "Include tag with empty filename. Ignoring it.");
						}
						else {
							var cc = this.getIncludeFileContent(fileName);
							if(cc != null) {
								var nt = JkTemplateTextTemplate.forString(cc, this.markerBegin, this.markerEnd, this.type, this.includeDirs, this.includeFileData, null);
								if(nt == null) {
									JkLogLog.warning(this.logContext, "Failed to process included template file: `" + (JkLangString.safeString(fileName)) + ("'"));
								}
								else {
									var array = nt.getTokens();
									if(array != null) {
										var n = 0;
										var m = array.length;
										for(n = 0 ; n < m ; n++) {
											var token = array[n];
											if(token != null) {
												v.push(token);
											}
										}
									}
								}
							}
							else {
								JkLogLog.warning(this.logContext, "Failed to get include file content: `" + (JkLangString.safeString(fileName)) + ("'"));
							}
						}
					}
					else {
						v.push(JkTemplateTextTemplateTagData.NEW_Vector(words));
					}
					tag = null;
				}
			}
			else if(c != me1) {
				tag.appendCharacter(c);
			}
		}
		else if(pc == mb1) {
			if(c == mb2) {
				if(data != null) {
					v.push(data);
					data = null;
				}
				tag = JkLangStringBuilder.NEW();
				tag.appendCharacter(pc);
				tag.appendCharacter(c);
			}
			else {
				if(data == null) {
					data = JkLangStringBuilder.NEW();
				}
				data.appendCharacter(pc);
				data.appendCharacter(c);
			}
		}
		else if(c != mb1) {
			if(data == null) {
				data = JkLangStringBuilder.NEW();
			}
			data.appendCharacter(c);
		}
		pc = c;
	}
	if(pc == mb1) {
		if(data == null) {
			data = JkLangStringBuilder.NEW();
		}
		data.appendCharacter(pc);
	}
	if(data != null) {
		v.push(data);
		data = null;
	}
	if(tag != null) {
		JkLogLog.error(this.logContext, "Unfinished tag: `" + (JkLangString.safeString((tag.toString()))) + ("'"));
		return null;
	}
	return v;
};

JkTemplateTextTemplate.prototype.prepare = function() {
	var str = this.text;
	if(!(str != null)) {
		JkLogLog.error(this.logContext, "No input string was specified.");
		return false;
	}
	if(!((this.tokens = this.tokenizeString(str)) != null)) {
		return false;
	}
	return true;
};

JkTemplateTextTemplate.prototype.execute = function(vars, importDirs) {
	if(!(this.tokens != null)) {
		JkLogLog.error(this.logContext, "TextTemplate has not been prepared");
		return null;
	}
	var result = JkLangStringBuilder.NEW();
	if(!this.doExecute(this.tokens, vars, result, importDirs)) {
		return null;
	}
	return result.toString();
};

JkTemplateTextTemplate.prototype.substituteVariables = function(orig, vars) {
	if(orig == null) {
		return orig;
	}
	if(JkLangString.getIndexOfString(orig, "${", 0) < 0) {
		return orig;
	}
	var sb = JkLangStringBuilder.NEW();
	var varbuf = null;
	var flag = false;
	var it = JkLangString.iterate(orig);
	while(it != null){
		var c = it.getNextChar();
		if(c <= 0) {
			break;
		}
		if(varbuf != null) {
			if(c == '}'.charCodeAt()) {
				var varname = varbuf.toString();
				if(vars != null) {
					var varcut = null;
					if(JkLangString.getIndexOfCharacter(varname, '!'.charCodeAt(), 0) > 0) {
						var sp = JkLangVector.iterate((JkLangString.split(varname, '!'.charCodeAt(), 2)));
						varname = sp.next();
						varcut = sp.next();
					}
					var r = this.getVariableValueString(vars, varname);
					if(JkLangString.isEmpty(varcut) == false) {
						var itc = JkLangString.iterate(varcut);
						var cx = '\0'.charCodeAt();
						while((cx = itc.getNextChar()) > 0){
							var n = JkLangString.getLastIndexOfCharacter(r, cx, (-1));
							if(n < 0) {
								break;
							}
							r = JkLangString.getSubString(r, 0, n);
						}
					}
					sb.appendString(r);
				}
				varbuf = null;
			}
			else {
				varbuf.appendCharacter(c);
			}
			continue;
		}
		if(flag == true) {
			flag = false;
			if(c == '{'.charCodeAt()) {
				varbuf = JkLangStringBuilder.NEW();
			}
			else {
				sb.appendCharacter('$'.charCodeAt());
				sb.appendCharacter(c);
			}
			continue;
		}
		if(c == '$'.charCodeAt()) {
			flag = true;
			continue;
		}
		sb.appendCharacter(c);
	}
	return sb.toString();
};

JkTemplateTextTemplate.prototype.getVariableValue = function(vars, varname) {
	if(vars == null || varname == null) {
		return null;
	}
	var vv = vars.get(varname);
	if(vv != null) {
		return vv;
	}
	var ll = JkLangString.split(varname, '.'.charCodeAt(), 0);
	if(JkLangVector.getSize(ll) < 2) {
		return null;
	}
	var nvar = (function(o) {
		if(typeof(o) === 'string') {
			return o;
		}
		return null;
	}.bind(this))((JkLangVector.get(ll, (JkLangVector.getSize(ll) - 1))));
	JkLangVector.removeLast(ll);
	var cc = vars;
	if(ll != null) {
		var n = 0;
		var m = ll.length;
		for(n = 0 ; n < m ; n++) {
			var vv2 = ll[n];
			if(vv2 != null) {
				if(cc == null) {
					return null;
				}
				var vv2o = cc.get(vv2);
				cc = (function(o1) {
					if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o1)) {
						return o1;
					}
					return null;
				}.bind(this))(vv2o);
				if(cc == null && vv2o != null && (JkJsonJSONObject.IS_INSTANCE && JkJsonJSONObject.IS_INSTANCE(vv2o))) {
					cc = (function(o2) {
						if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o2)) {
							return o2;
						}
						return null;
					}.bind(this))((vv2o.toJsonObject()));
				}
			}
		}
	}
	if(cc != null) {
		return cc.get(nvar);
	}
	return null;
};

JkTemplateTextTemplate.prototype.getVariableValueString = function(vars, varname) {
	var v = this.getVariableValue(vars, varname);
	if(!(v != null)) {
		return null;
	}
	if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(v)) {
		if(this.languagePreferences != null) {
			if(this.languagePreferences != null) {
				var n = 0;
				var m = this.languagePreferences.length;
				for(n = 0 ; n < m ; n++) {
					var language = this.languagePreferences[n];
					if(language != null) {
						var s = v.getString(language, null);
						if(s != null) {
							return s;
						}
					}
				}
			}
		}
		else {
			var s1 = v.getString("en", null);
			if(s1 != null) {
				return s1;
			}
		}
		return null;
	}
	return JkLangString.asString(v);
};

JkTemplateTextTemplate.prototype.getVariableValueVector = function(vars, varname) {
	var v = this.getVariableValue(vars, varname);
	if(!(v != null)) {
		return null;
	}
	if(v instanceof Array) {
		return v;
	}
	if(JkLangVectorObject.IS_INSTANCE && JkLangVectorObject.IS_INSTANCE(v)) {
		var vo = v;
		var vv = vo.toVector();
		return vv;
	}
	if(JkLangArrayObject.IS_INSTANCE && JkLangArrayObject.IS_INSTANCE(v)) {
		var vo1 = (function(o) {
			if(JkLangArrayObject.IS_INSTANCE && JkLangArrayObject.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))(v);
		var vv1 = vo1.toArray();
		var vvx = JkLangVector.forArray(vv1);
		return vvx;
	}
	if(JkLangDynamicVector.IS_INSTANCE && JkLangDynamicVector.IS_INSTANCE(v)) {
		var dv = v;
		return dv.toVector();
	}
	return null;
};

JkTemplateTextTemplate.prototype.handleBlock = function(vars, tag, data, result, importDirs) {
	if(!(tag != null)) {
		return false;
	}
	var tagname = JkLangVector.get(tag, 0);
	if(JkLangString.isEmpty(tagname)) {
		return false;
	}
	if(tagname == "for") {
		var varname = JkLangVector.get(tag, 1);
		var inword = JkLangVector.get(tag, 2);
		var origvar = this.substituteVariables((JkLangVector.get(tag, 3)), vars);
		if(JkLangString.isEmpty(varname) || JkLangString.isEmpty(origvar) || !(inword == "in")) {
			JkLogLog.error(this.logContext, "Invalid for tag: `" + (JkLangString.safeString((JkTextStringUtil.combine(tag, ' '.charCodeAt(), false, 0)))) + ("'"));
			return false;
		}
		var index = 0;
		vars.setString("__for_first", "true");
		var vv = this.getVariableValueVector(vars, origvar);
		if(vv != null) {
			var n = 0;
			var m = vv.length;
			for(n = 0 ; n < m ; n++) {
				var o = vv[n];
				if(o != null) {
					if(index % 2 == 0) {
						vars.setString("__for_parity", "even");
					}
					else {
						vars.setString("__for_parity", "odd");
					}
					vars.setObject(varname, o);
					if(this.doExecute(data, vars, result, importDirs) == false) {
						return false;
					}
					if(index == 0) {
						vars.setString("__for_first", "false");
					}
					index++;
				}
			}
		}
		vars.remove("__for_first");
		vars.remove("__for_parity");
		return true;
	}
	if(tagname == "if") {
		var lvalue = JkLangVector.get(tag, 1);
		if(lvalue == null) {
			return true;
		}
		var operator = JkLangVector.get(tag, 2);
		if(operator == null) {
			var varval = this.getVariableValue(vars, lvalue);
			if(varval == null) {
				return true;
			}
			if(JkLangVectorObject.IS_INSTANCE && JkLangVectorObject.IS_INSTANCE(varval)) {
				if(JkLangVector.isEmpty((varval.toVector()))) {
					return true;
				}
			}
			if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(varval)) {
				var value = varval;
				if(value.getCount() < 1) {
					return true;
				}
			}
			if(typeof(varval) === 'string') {
				if(JkLangString.isEmpty(varval)) {
					return true;
				}
			}
			if(JkLangStringObject.IS_INSTANCE && JkLangStringObject.IS_INSTANCE(varval)) {
				if(JkLangString.isEmpty((varval.toString()))) {
					return true;
				}
			}
			if(this.doExecute(data, vars, result, importDirs) == false) {
				return false;
			}
			return true;
		}
		lvalue = this.substituteVariables(lvalue, vars);
		var rvalue = JkLangVector.get(tag, 3);
		if(rvalue != null) {
			rvalue = this.substituteVariables(rvalue, vars);
		}
		if(lvalue == null || JkLangString.isEmpty(operator) || rvalue == null) {
			JkLogLog.error(this.logContext, "Invalid if tag: `" + (JkLangString.safeString((JkTextStringUtil.combine(tag, ' '.charCodeAt(), false, 0)))) + ("'"));
			return false;
		}
		if(operator == "==" || operator == "=" || operator == "is") {
			if(!(rvalue == lvalue)) {
				return true;
			}
			if(this.doExecute(data, vars, result, importDirs) == false) {
				return false;
			}
			return true;
		}
		if(operator == "!=" || operator == "not") {
			if(rvalue == lvalue) {
				return true;
			}
			if(this.doExecute(data, vars, result, importDirs) == false) {
				return false;
			}
			return true;
		}
		JkLogLog.error(this.logContext, "Unknown operator `" + (JkLangString.safeString(operator)) + ("' in if tag: `") + (JkLangString.safeString((JkTextStringUtil.combine(tag, ' '.charCodeAt(), false, 0)))) + ("'"));
		return false;
	}
	return false;
};

JkTemplateTextTemplate.prototype.doExecute = function(data, avars, result, importDirs) {
	if(data == null) {
		return true;
	}
	var blockctr = 0;
	var blockdata = null;
	var blocktag = null;
	var vars = avars;
	if(vars == null) {
		vars = JkLangDynamicMap.NEW();
	}
	if(data != null) {
		var n2 = 0;
		var m = data.length;
		for(n2 = 0 ; n2 < m ; n2++) {
			var o = data[n2];
			if(o != null) {
				var tagname = null;
				var words = null;
				var tagData = (function(o1) {
					if(JkTemplateTextTemplateTagData.IS_INSTANCE && JkTemplateTextTemplateTagData.IS_INSTANCE(o1)) {
						return o1;
					}
					return null;
				}.bind(this))(o);
				if(tagData != null) {
					words = tagData.words;
					if(words != null) {
						tagname = JkLangVector.get(words, 0);
						if(JkLangString.isEmpty(tagname)) {
							JkLogLog.warning(this.logContext, "Empty tag encountered. Ignoring it.");
							continue;
						}
					}
				}
				if(tagname == "end") {
					blockctr--;
					if(blockctr == 0 && blockdata != null) {
						if(this.handleBlock(vars, blocktag, blockdata, result, importDirs) == false) {
							JkLogLog.error(this.logContext, "Handling of a block failed");
							continue;
						}
						blockdata = null;
						blocktag = null;
					}
				}
				if(blockctr > 0) {
					if(tagname == "for" || tagname == "if") {
						blockctr++;
					}
					if(blockdata == null) {
						blockdata = new Array;
					}
					blockdata.push(o);
					continue;
				}
				if(typeof(o) === 'string' || JkLangStringObject.IS_INSTANCE && JkLangStringObject.IS_INSTANCE(o)) {
					result.appendString((JkLangString.asString(o)));
					continue;
				}
				if(tagname == "=" || tagname == "printstring") {
					var varname = this.substituteVariables((JkLangVector.get(words, 1)), vars);
					if(JkLangString.isEmpty(varname) == false) {
						var vv = this.getVariableValueString(vars, varname);
						if(JkLangString.isEmpty(vv) == false) {
							if(this.type == JkTemplateTextTemplate.TYPE_HTML) {
								vv = JkXmlHTMLString.sanitize(vv);
							}
							result.appendString(vv);
						}
						else {
							var defaultvalue = this.substituteVariables((JkLangVector.get(words, 2)), vars);
							if(JkLangString.isEmpty(defaultvalue) == false) {
								if(this.type == JkTemplateTextTemplate.TYPE_HTML) {
									defaultvalue = JkXmlHTMLString.sanitize(defaultvalue);
								}
								result.appendString(defaultvalue);
							}
						}
					}
				}
				else if(tagname == "printRaw") {
					var varname1 = this.substituteVariables((JkLangVector.get(words, 1)), vars);
					if(JkLangString.isEmpty(varname1) == false) {
						var vv1 = this.getVariableValueString(vars, varname1);
						if(JkLangString.isEmpty(vv1) == false) {
							result.appendString(vv1);
						}
						else {
							var defaultvalue1 = this.substituteVariables((JkLangVector.get(words, 2)), vars);
							if(JkLangString.isEmpty(defaultvalue1) == false) {
								result.appendString(defaultvalue1);
							}
						}
					}
				}
				else if(tagname == "catPath") {
					var hasSlash = false;
					var n = 0;
					if(words != null) {
						var n3 = 0;
						var m2 = words.length;
						for(n3 = 0 ; n3 < m2 ; n3++) {
							var word = words[n3];
							if(word != null) {
								n++;
								if(n == 1) {
									continue;
								}
								word = this.substituteVariables(word, vars);
								var it = JkLangString.iterate(word);
								if(it == null) {
									continue;
								}
								if(n > 2 && hasSlash == false) {
									result.appendCharacter('/'.charCodeAt());
									hasSlash = true;
								}
								while(true){
									var c = it.getNextChar();
									if(c < 1) {
										break;
									}
									if(c == '/'.charCodeAt()) {
										if(hasSlash == false) {
											result.appendCharacter(c);
											hasSlash = true;
										}
									}
									else {
										result.appendCharacter(c);
										hasSlash = false;
									}
								}
							}
						}
					}
				}
				else if(tagname == "printJson") {
					var varname2 = this.substituteVariables((JkLangVector.get(words, 1)), vars);
					if(JkLangString.isEmpty(varname2) == false) {
						var vv2 = this.getVariableValue(vars, varname2);
						if(vv2 != null) {
							result.appendString((JkJsonJSONEncoder.encode(vv2, true, false)));
						}
					}
				}
				else if(tagname == "printRichText") {
					var markup = this.substituteVariables((JkLangVector.get(words, 1)), vars);
					if(JkLangString.isEmpty(markup) == false) {
						var doc = JkTemplateRichTextDocument.forWikiMarkupString(markup);
						if(doc != null) {
							result.appendString((doc.toHtml(null)));
						}
					}
				}
				else if(tagname == "printDate") {
					var timestamp = this.substituteVariables((JkLangVector.get(words, 1)), vars);
					var aslong = JkLangString.toLong(timestamp);
					var asstring = JkLangDateTime.forSeconds(aslong).toStringDate('/'.charCodeAt());
					result.appendString(asstring);
				}
				else if(tagname == "printTime") {
					var timestamp1 = this.substituteVariables((JkLangVector.get(words, 1)), vars);
					var aslong1 = JkLangString.toLong(timestamp1);
					var asstring1 = JkLangDateTime.forSeconds(aslong1).toStringTime(':'.charCodeAt());
					result.appendString(asstring1);
				}
				else if(tagname == "printDateTime") {
					var timestamp2 = this.substituteVariables((JkLangVector.get(words, 1)), vars);
					var aslong2 = JkLangString.toLong(timestamp2);
					var dt = JkLangDateTime.forSeconds(aslong2);
					result.appendString((dt.toStringDate('/'.charCodeAt())));
					result.appendCharacter(' '.charCodeAt());
					result.appendString((dt.toStringTime(':'.charCodeAt())));
				}
				else if(tagname == "import") {
					var type = JkLangVector.get(words, 1);
					var filename = this.substituteVariables((JkLangVector.get(words, 2)), vars);
					if(JkLangString.isEmpty(filename)) {
						JkLogLog.warning(this.logContext, "Invalid import tag with empty filename");
						continue;
					}
					var ff = null;
					if(importDirs != null) {
						var n4 = 0;
						var m3 = importDirs.length;
						for(n4 = 0 ; n4 < m3 ; n4++) {
							var dir = importDirs[n4];
							if(dir != null) {
								ff = JkFsFile.forRelativePath(filename, dir, false);
								if(ff != null && ff.isFile()) {
									break;
								}
							}
						}
					}
					if(ff == null || ff.isFile() == false) {
						JkLogLog.error(this.logContext, "Unable to find file to import: `" + (JkLangString.safeString(filename)) + ("'"));
						continue;
					}
					JkLogLog.debug(this.logContext, "Attempting to import file: `" + (JkLangString.safeString((ff.getPath()))) + ("'"));
					var content = ff.getContentsUTF8();
					if(JkLangString.isEmpty(content)) {
						JkLogLog.error(this.logContext, "Unable to read import file: `" + (JkLangString.safeString((ff.getPath()))) + ("'"));
						continue;
					}
					if(type == "html") {
						content = JkXmlHTMLString.sanitize(content);
					}
					else if(type == "template") {
						var t = JkTemplateTextTemplate.forString(content, this.markerBegin, this.markerEnd, this.type, importDirs, null, null);
						if(t == null) {
							JkLogLog.error(this.logContext, "Failed to parse imported template file: `" + (JkLangString.safeString((ff.getPath()))) + ("'"));
							continue;
						}
						if(this.doExecute((t.getTokens()), vars, result, importDirs) == false) {
							JkLogLog.error(this.logContext, "Failed to process imported template file: `" + (JkLangString.safeString((ff.getPath()))) + ("'"));
							continue;
						}
						content = null;
					}
					else if(type == "raw") {
						;
					}
					else {
						JkLogLog.error(this.logContext, "Unknown type for import: `" + (JkLangString.safeString(type)) + ("'. Ignoring the import."));
						continue;
					}
					if(JkLangString.isEmpty(content) == false) {
						result.appendString(content);
					}
				}
				else if(tagname == "escapeHtml") {
					var content1 = this.substituteVariables((JkLangVector.get(words, 1)), vars);
					if(JkLangString.isEmpty(content1) == false) {
						content1 = JkXmlHTMLString.sanitize(content1);
						if(JkLangString.isEmpty(content1) == false) {
							result.appendString(content1);
						}
					}
				}
				else if(tagname == "set") {
					if(JkLangVector.getSize(words) != 3) {
						JkLogLog.warning(this.logContext, "Invalid number of parameters for set tag encountered: " + (JkLangString.safeString((JkLangString.forInteger((JkLangVector.getSize(words)))))));
						continue;
					}
					var varname3 = this.substituteVariables((JkLangVector.get(words, 1)), vars);
					if(JkLangString.isEmpty(varname3)) {
						JkLogLog.warning(this.logContext, "Empty variable name in set tag encountered.");
						continue;
					}
					var newValue = this.substituteVariables((JkLangVector.get(words, 2)), vars);
					vars.setString(varname3, newValue);
				}
				else if(tagname == "assign") {
					if(JkLangVector.getSize(words) != 3) {
						JkLogLog.warning(this.logContext, "Invalid number of parameters for assign tag encountered: " + (JkLangString.safeString((JkLangString.forInteger((JkLangVector.getSize(words)))))));
						continue;
					}
					var varname4 = this.substituteVariables((JkLangVector.get(words, 1)), vars);
					if(JkLangString.isEmpty(varname4)) {
						JkLogLog.warning(this.logContext, "Empty variable name in assign tag encountered.");
						continue;
					}
					var vv3 = JkLangVector.get(words, 2);
					if(vv3 == "none") {
						vars.remove(varname4);
					}
					else {
						vars.setObject(varname4, (this.getVariableValue(vars, vv3)));
					}
				}
				else if(tagname == "for" || tagname == "if") {
					if(blockctr == 0) {
						blocktag = words;
					}
					blockctr++;
				}
				else if(tagname == "end") {
					;
				}
				else if(this.type == JkTemplateTextTemplate.TYPE_HTML) {
					this.onHTMLTag(vars, result, importDirs, tagname, words);
				}
				else if(this.type == JkTemplateTextTemplate.TYPE_JSON) {
					this.onJSONTag(vars, result, importDirs, tagname, words);
				}
				else {
					;
				}
			}
		}
	}
	return true;
};

JkTemplateTextTemplate.prototype.basename = function(path) {
	if(!(path != null)) {
		return null;
	}
	var v = "";
	var comps = JkLangVector.iterate((JkLangString.split(path, '/'.charCodeAt(), 0)));
	if(comps != null) {
		var comp = comps.next();
		while(comp != null){
			if(JkLangString.getLength(comp) > 0) {
				v = comp;
			}
			comp = comps.next();
		}
	}
	return v;
};

JkTemplateTextTemplate.prototype.onHTMLTag = function(vars, result, importDirs, tagname, words) {
	if(tagname == "link") {
		var path = this.substituteVariables((JkLangVector.get(words, 1)), vars);
		var text = this.substituteVariables((JkLangVector.get(words, 2)), vars);
		if(JkLangString.isEmpty(text)) {
			text = this.basename(path);
		}
		if(JkLangString.isEmpty(text)) {
			return;
		}
		result.appendString("<a href=\"" + (JkLangString.safeString(path)) + ("\"><span>") + (JkLangString.safeString(text)) + ("</span></a>"));
		return;
	}
};

JkTemplateTextTemplate.prototype.encodeJSONString = function(s, sb) {
	if(!(s != null)) {
		return;
	}
	var it = JkLangString.iterate(s);
	if(!(it != null)) {
		return;
	}
	var c = '\0'.charCodeAt();
	while((c = it.getNextChar()) > 0){
		if(c == '\"'.charCodeAt()) {
			sb.appendCharacter('\\'.charCodeAt());
		}
		else if(c == '\\'.charCodeAt()) {
			sb.appendCharacter('\\'.charCodeAt());
		}
		sb.appendCharacter(c);
	}
};

JkTemplateTextTemplate.prototype.onJSONTag = function(vars, result, importDirs, tagname, words) {
	if(tagname == "quotedstring") {
		var string = this.substituteVariables((JkLangVector.get(words, 1)), vars);
		this.encodeJSONString(string, result);
	}
};

JkTemplateTextTemplate.prototype.getTokens = function() {
	return this.tokens;
};

JkTemplateTextTemplate.prototype.setTokens = function(v) {
	this.tokens = v;
	return this;
};

JkTemplateTextTemplate.prototype.getText = function() {
	return this.text;
};

JkTemplateTextTemplate.prototype.setText = function(v) {
	this.text = v;
	return this;
};

JkTemplateTextTemplate.prototype.getMarkerBegin = function() {
	return this.markerBegin;
};

JkTemplateTextTemplate.prototype.setMarkerBegin = function(v) {
	this.markerBegin = v;
	return this;
};

JkTemplateTextTemplate.prototype.getMarkerEnd = function() {
	return this.markerEnd;
};

JkTemplateTextTemplate.prototype.setMarkerEnd = function(v) {
	this.markerEnd = v;
	return this;
};

JkTemplateTextTemplate.prototype.getLogContext = function() {
	return this.logContext;
};

JkTemplateTextTemplate.prototype.setLogContext = function(v) {
	this.logContext = v;
	return this;
};

JkTemplateTextTemplate.prototype.getType = function() {
	return this.type;
};

JkTemplateTextTemplate.prototype.setType = function(v) {
	this.type = v;
	return this;
};

JkTemplateTextTemplate.prototype.getLanguagePreferences = function() {
	return this.languagePreferences;
};

JkTemplateTextTemplate.prototype.setLanguagePreferences = function(v) {
	this.languagePreferences = v;
	return this;
};

JkTemplateTextTemplate.prototype.getIncludeDirs = function() {
	return this.includeDirs;
};

JkTemplateTextTemplate.prototype.setIncludeDirs = function(v) {
	this.includeDirs = v;
	return this;
};

JkTemplateTextTemplate.prototype.getIncludeFileData = function() {
	return this.includeFileData;
};

JkTemplateTextTemplate.prototype.setIncludeFileData = function(v) {
	this.includeFileData = v;
	return this;
};

JkTemplateTextTemplate.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTemplateTextTemplate"] === true;
};

JkTemplateTextTemplate.TYPE_GENERIC = 0;
JkTemplateTextTemplate.TYPE_HTML = 1;
JkTemplateTextTemplate.TYPE_JSON = 2;

let JkTemplateRichTextStyledParagraph = function() {
	JkTemplateRichTextParagraph.call(this);
	this.heading = 0;
	this.segments = null;
};

JkTemplateRichTextStyledParagraph.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTemplateRichTextParagraph.prototype);
JkTemplateRichTextStyledParagraph.prototype.constructor = JkTemplateRichTextStyledParagraph;
JkTemplateRichTextStyledParagraph.prototype._t = {
	"JkTemplateRichTextStyledParagraph" : true,
	"JkTemplateRichTextParagraph" : true
};
JkTemplateRichTextStyledParagraph.prototype._tobj = JkTemplateRichTextStyledParagraph;

JkTemplateRichTextStyledParagraph.NEW = function() {
	var v = new JkTemplateRichTextStyledParagraph;
	return v.CTOR_JkTemplateRichTextStyledParagraph();
};

JkTemplateRichTextStyledParagraph.prototype.CTOR_JkTemplateRichTextStyledParagraph = function() {
	this.segments = null;
	this.heading = 0;
	if(JkTemplateRichTextParagraph.prototype.CTOR_JkTemplateRichTextParagraph.call(this) == null) {
		return null;
	}
	return this;
};

JkTemplateRichTextStyledParagraph.forString = function(text) {
	var rtsp = JkTemplateRichTextStyledParagraph.NEW();
	return rtsp.parse(text);
};

JkTemplateRichTextStyledParagraph.prototype.isHeading = function() {
	if(this.heading > 0) {
		return true;
	}
	return false;
};

JkTemplateRichTextStyledParagraph.prototype.getTextContent = function() {
	var sb = JkLangStringBuilder.NEW();
	if(this.segments != null) {
		var n = 0;
		var m = this.segments.length;
		for(n = 0 ; n < m ; n++) {
			var segment = this.segments[n];
			if(segment != null) {
				sb.appendString((segment.getText()));
			}
		}
	}
	return sb.toString();
};

JkTemplateRichTextStyledParagraph.prototype.toJson = function() {
	var segs = new Array;
	if(this.segments != null) {
		var n = 0;
		var m = this.segments.length;
		for(n = 0 ; n < m ; n++) {
			var segment = this.segments[n];
			if(segment != null) {
				var segj = segment.toJson();
				if(segj != null) {
					JkLangVector.append(segs, segj);
				}
			}
		}
	}
	var v = JkLangDynamicMap.NEW();
	v.setString("type", "styled");
	v.setInteger("heading", this.heading);
	v.setObject("segments", segs);
	return v;
};

JkTemplateRichTextStyledParagraph.prototype.toText = function() {
	var sb = JkLangStringBuilder.NEW();
	if(this.segments != null) {
		var n = 0;
		var m = this.segments.length;
		for(n = 0 ; n < m ; n++) {
			var sg = this.segments[n];
			if(sg != null) {
				sb.appendString((sg.getText()));
				var link = sg.getLink();
				if(JkLangString.isEmpty(link) == false) {
					sb.appendString(" (" + (JkLangString.safeString(link)) + (")"));
				}
				var ref = sg.getReference();
				if(JkLangString.isEmpty(ref) == false) {
					sb.appendString(" {" + (JkLangString.safeString(ref)) + ("}"));
				}
			}
		}
	}
	return sb.toString();
};

JkTemplateRichTextStyledParagraph.prototype.toHtml = function(refs) {
	var sb = JkLangStringBuilder.NEW();
	var tag = "p";
	if(this.heading > 0) {
		tag = "h" + (JkLangString.safeString((JkLangString.forInteger(this.heading))));
	}
	sb.appendString("<");
	sb.appendString(tag);
	sb.appendString(">");
	if(this.segments != null) {
		var n = 0;
		var m = this.segments.length;
		for(n = 0 ; n < m ; n++) {
			var sg = this.segments[n];
			if(sg != null) {
				sb.appendString((sg.toHtml(refs)));
			}
		}
	}
	sb.appendString("</" + (JkLangString.safeString(tag)) + (">"));
	return sb.toString();
};

JkTemplateRichTextStyledParagraph.prototype.addSegment = function(rts) {
	if(rts == null) {
		return this;
	}
	if(this.segments == null) {
		this.segments = new Array;
	}
	JkLangVector.append(this.segments, rts);
	return this;
};

JkTemplateRichTextStyledParagraph.prototype.setSegmentLink = function(seg, alink) {
	if(alink == null) {
		seg.setLink(null);
		return;
	}
	var link = alink;
	if(JkLangString.startsWith(link, ">", 0)) {
		seg.setIsInline(true);
		link = JkLangString.getEndOfString(link, 1);
	}
	if(JkLangString.startsWith(link, "!", 0)) {
		seg.setLinkPopup(false);
		link = JkLangString.getEndOfString(link, 1);
	}
	else {
		seg.setLinkPopup(true);
	}
	seg.setLink(link);
};

JkTemplateRichTextStyledParagraph.prototype.parseSegments = function(txt) {
	if(!(txt != null)) {
		return;
	}
	var segmentsb = null;
	var linksb = null;
	var sb = JkLangStringBuilder.NEW();
	var it = JkLangString.iterate(txt);
	var c = '\0'.charCodeAt();
	var pc = 0;
	var seg = JkTemplateRichTextSegment.NEW();
	while((c = it.getNextChar()) > 0){
		if(pc == '['.charCodeAt()) {
			if(c == '['.charCodeAt()) {
				sb.appendCharacter(c);
				pc = 0;
				continue;
			}
			if(sb.count() > 0) {
				seg.setText((sb.toString()));
				sb.clear();
				this.addSegment(seg);
			}
			seg = JkTemplateRichTextSegment.NEW();
			linksb = JkLangStringBuilder.NEW();
			linksb.appendCharacter(c);
			pc = c;
			continue;
		}
		if(linksb != null) {
			if(c == '|'.charCodeAt()) {
				this.setSegmentLink(seg, (linksb.toString()));
				linksb.clear();
				pc = c;
				continue;
			}
			if(c == ']'.charCodeAt()) {
				var xt = linksb.toString();
				if(seg.getLink() == null) {
					this.setSegmentLink(seg, xt);
				}
				else {
					seg.setText(xt);
				}
				if(JkLangString.isEmpty((seg.getText()))) {
					var ll = xt;
					if(JkLangString.startsWith(ll, "http://", 0)) {
						ll = JkLangString.getEndOfString(ll, 7);
					}
					seg.setText(ll);
				}
				this.addSegment(seg);
				seg = JkTemplateRichTextSegment.NEW();
				linksb = null;
			}
			else {
				linksb.appendCharacter(c);
			}
			pc = c;
			continue;
		}
		if(pc == '{'.charCodeAt()) {
			if(c == '{'.charCodeAt()) {
				sb.appendCharacter(c);
				pc = 0;
				continue;
			}
			if(sb.count() > 0) {
				seg.setText((sb.toString()));
				sb.clear();
				this.addSegment(seg);
			}
			seg = JkTemplateRichTextSegment.NEW();
			segmentsb = JkLangStringBuilder.NEW();
			segmentsb.appendCharacter(c);
			pc = c;
			continue;
		}
		if(segmentsb != null) {
			if(c == '|'.charCodeAt()) {
				seg.setReference((segmentsb.toString()));
				segmentsb.clear();
				pc = c;
				continue;
			}
			if(c == '}'.charCodeAt()) {
				var xt1 = segmentsb.toString();
				if(seg.getReference() == null) {
					seg.setReference(xt1);
				}
				else {
					seg.setText(xt1);
				}
				this.addSegment(seg);
				seg = JkTemplateRichTextSegment.NEW();
				segmentsb = null;
			}
			else {
				segmentsb.appendCharacter(c);
			}
			pc = c;
			continue;
		}
		if(pc == '*'.charCodeAt()) {
			if(c == '*'.charCodeAt()) {
				if(sb.count() > 0) {
					seg.setText((sb.toString()));
					sb.clear();
					this.addSegment(seg);
				}
				if(seg.getBold()) {
					seg = JkTemplateRichTextSegment.NEW().setBold(false);
				}
				else {
					seg = JkTemplateRichTextSegment.NEW().setBold(true);
				}
			}
			else {
				sb.appendCharacter(pc);
				sb.appendCharacter(c);
			}
			pc = 0;
			continue;
		}
		if(pc == '_'.charCodeAt()) {
			if(c == '_'.charCodeAt()) {
				if(sb.count() > 0) {
					seg.setText((sb.toString()));
					sb.clear();
					this.addSegment(seg);
				}
				if(seg.getUnderline()) {
					seg = JkTemplateRichTextSegment.NEW().setUnderline(false);
				}
				else {
					seg = JkTemplateRichTextSegment.NEW().setUnderline(true);
				}
			}
			else {
				sb.appendCharacter(pc);
				sb.appendCharacter(c);
			}
			pc = 0;
			continue;
		}
		if(pc == '\''.charCodeAt()) {
			if(c == '\''.charCodeAt()) {
				if(sb.count() > 0) {
					seg.setText((sb.toString()));
					sb.clear();
					this.addSegment(seg);
				}
				if(seg.getItalic()) {
					seg = JkTemplateRichTextSegment.NEW().setItalic(false);
				}
				else {
					seg = JkTemplateRichTextSegment.NEW().setItalic(true);
				}
			}
			else {
				sb.appendCharacter(pc);
				sb.appendCharacter(c);
			}
			pc = 0;
			continue;
		}
		if(c != '*'.charCodeAt() && c != '_'.charCodeAt() && c != '\''.charCodeAt() && c != '{'.charCodeAt() && c != '['.charCodeAt()) {
			sb.appendCharacter(c);
		}
		pc = c;
	}
	if(pc == '*'.charCodeAt() || pc == '_'.charCodeAt() || pc == '\''.charCodeAt() && pc != '{'.charCodeAt() && pc != '['.charCodeAt()) {
		sb.appendCharacter(pc);
	}
	if(sb.count() > 0) {
		seg.setText((sb.toString()));
		sb.clear();
		this.addSegment(seg);
	}
};

JkTemplateRichTextStyledParagraph.prototype.parse = function(text) {
	if(text == null) {
		return this;
	}
	var txt = text;
	var prefixes = ["=", "==", "===", "====", "====="];
	var n = 0;
	for(n = 0 ; n < prefixes.length ; n++) {
		var key = prefixes[n];
		if(JkLangString.startsWith(txt, (JkLangString.safeString(key)) + (" "), 0) && JkLangString.endsWith(txt, " " + (JkLangString.safeString(key)))) {
			this.setHeading((n + 1));
			txt = JkLangString.getSubString(txt, (JkLangString.getLength(key) + 1), (JkLangString.getLength(txt) - JkLangString.getLength(key) * 2 - 2));
			if(txt != null) {
				txt = JkLangString.strip(txt);
			}
			break;
		}
	}
	this.parseSegments(txt);
	return this;
};

JkTemplateRichTextStyledParagraph.prototype.toMarkup = function() {
	var ident = null;
	if(this.heading == 1) {
		ident = "=";
	}
	else if(this.heading == 2) {
		ident = "==";
	}
	else if(this.heading == 3) {
		ident = "===";
	}
	else if(this.heading == 4) {
		ident = "====";
	}
	else if(this.heading == 5) {
		ident = "=====";
	}
	var sb = JkLangStringBuilder.NEW();
	if(JkLangString.isEmpty(ident) == false) {
		sb.appendString(ident);
		sb.appendCharacter(' '.charCodeAt());
	}
	if(this.segments != null) {
		var n = 0;
		var m = this.segments.length;
		for(n = 0 ; n < m ; n++) {
			var segment = this.segments[n];
			if(segment != null) {
				sb.appendString((segment.toMarkup()));
			}
		}
	}
	if(JkLangString.isEmpty(ident) == false) {
		sb.appendCharacter(' '.charCodeAt());
		sb.appendString(ident);
	}
	return sb.toString();
};

JkTemplateRichTextStyledParagraph.prototype.getHeading = function() {
	return this.heading;
};

JkTemplateRichTextStyledParagraph.prototype.setHeading = function(v) {
	this.heading = v;
	return this;
};

JkTemplateRichTextStyledParagraph.prototype.getSegments = function() {
	return this.segments;
};

JkTemplateRichTextStyledParagraph.prototype.setSegments = function(v) {
	this.segments = v;
	return this;
};

JkTemplateRichTextStyledParagraph.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTemplateRichTextStyledParagraph"] === true;
};

let JkTemplateRichTextSegment = function() {
	this.text = null;
	this.bold = false;
	this.italic = false;
	this.underline = false;
	this.color = null;
	this.link = null;
	this.reference = null;
	this.isInline = false;
	this.linkPopup = false;
};

JkTemplateRichTextSegment.prototype._t = { "JkTemplateRichTextSegment" : true };
JkTemplateRichTextSegment.prototype._tobj = JkTemplateRichTextSegment;

JkTemplateRichTextSegment.NEW = function() {
	var v = new JkTemplateRichTextSegment;
	return v.CTOR_JkTemplateRichTextSegment();
};

JkTemplateRichTextSegment.prototype.CTOR_JkTemplateRichTextSegment = function() {
	this.linkPopup = false;
	this.isInline = false;
	this.reference = null;
	this.link = null;
	this.color = null;
	this.underline = false;
	this.italic = false;
	this.bold = false;
	this.text = null;
	return this;
};

JkTemplateRichTextSegment.prototype.addMarkupModifiers = function(sb) {
	if(this.bold) {
		sb.appendString("**");
	}
	if(this.italic) {
		sb.appendString("''");
	}
	if(this.underline) {
		sb.appendString("__");
	}
};

JkTemplateRichTextSegment.prototype.toMarkup = function() {
	var sb = JkLangStringBuilder.NEW();
	this.addMarkupModifiers(sb);
	if(JkLangString.isEmpty(this.link) == false) {
		sb.appendCharacter('['.charCodeAt());
		if(this.isInline) {
			sb.appendCharacter('>'.charCodeAt());
		}
		sb.appendString(this.link);
		if(JkLangString.isEmpty(this.text) == false) {
			sb.appendCharacter('|'.charCodeAt());
			sb.appendString(this.text);
		}
		sb.appendCharacter(']'.charCodeAt());
	}
	else if(JkLangString.isEmpty(this.reference) == false) {
		sb.appendCharacter('{'.charCodeAt());
		if(this.isInline) {
			sb.appendCharacter('>'.charCodeAt());
		}
		sb.appendString(this.reference);
		if(JkLangString.isEmpty(this.text) == false) {
			sb.appendCharacter('|'.charCodeAt());
			sb.appendString(this.text);
		}
		sb.appendCharacter('}'.charCodeAt());
	}
	else {
		sb.appendString(this.text);
	}
	this.addMarkupModifiers(sb);
	return sb.toString();
};

JkTemplateRichTextSegment.prototype.toJson = function() {
	var v = JkLangDynamicMap.NEW();
	v.setString("text", this.text);
	if(this.isInline) {
		v.setBoolean("inline", this.isInline);
	}
	if(this.bold) {
		v.setBoolean("bold", this.bold);
	}
	if(this.italic) {
		v.setBoolean("italic", this.italic);
	}
	if(this.underline) {
		v.setBoolean("underline", this.underline);
	}
	if(JkLangString.isEmpty(this.color) == false) {
		v.setString("color", this.color);
	}
	if(JkLangString.isEmpty(this.link) == false) {
		v.setString("link", this.link);
	}
	if(JkLangString.isEmpty(this.reference) == false) {
		v.setString("reference", this.reference);
	}
	return v;
};

JkTemplateRichTextSegment.prototype.toHtml = function(refs) {
	var sb = JkLangStringBuilder.NEW();
	var aOpen = false;
	var text = this.getText();
	var link = this.getLink();
	if(JkLangString.isEmpty(link) == false) {
		if(this.getIsInline()) {
			sb.appendString("<img src=\"" + (JkLangString.safeString((JkXmlHTMLString.sanitize(link)))) + ("\" />"));
		}
		else {
			var targetblank = "";
			if(this.getLinkPopup()) {
				targetblank = " target=\"_blank\"";
			}
			sb.appendString("<a" + (JkLangString.safeString(targetblank)) + (" class=\"urlLink\" href=\"") + (JkLangString.safeString((JkXmlHTMLString.sanitize(link)))) + ("\">"));
			aOpen = true;
		}
	}
	if(JkLangString.isEmpty((this.getReference())) == false) {
		var ref = this.getReference();
		var href = null;
		if(refs != null) {
			href = refs.getReferenceHref(ref);
			if(JkLangString.isEmpty(text)) {
				text = refs.getReferenceTitle(ref);
			}
		}
		if(JkLangString.isEmpty(href) == false) {
			if(JkLangString.isEmpty(text)) {
				text = ref;
			}
			sb.appendString("<a class=\"referenceLink\" href=\"" + (JkLangString.safeString((JkXmlHTMLString.sanitize(href)))) + ("\">"));
			aOpen = true;
		}
	}
	if(this.getIsInline() == false) {
		if(this.getBold()) {
			sb.appendString("<b>");
		}
		if(this.getItalic()) {
			sb.appendString("<i>");
		}
		if(this.getUnderline()) {
			sb.appendString("<u>");
		}
		if(JkLangString.isEmpty((this.getColor())) == false) {
			sb.appendString("<span style=\"color: " + (JkLangString.safeString((JkXmlHTMLString.sanitize((this.getColor()))))) + (";\">"));
		}
		sb.appendString((JkXmlHTMLString.sanitize(text)));
		if(JkLangString.isEmpty((this.getColor())) == false) {
			sb.appendString("</span>");
		}
		if(this.getUnderline()) {
			sb.appendString("</u>");
		}
		if(this.getItalic()) {
			sb.appendString("</i>");
		}
		if(this.getBold()) {
			sb.appendString("</b>");
		}
	}
	if(aOpen) {
		sb.appendString("</a>");
	}
	return sb.toString();
};

JkTemplateRichTextSegment.prototype.getText = function() {
	return this.text;
};

JkTemplateRichTextSegment.prototype.setText = function(v) {
	this.text = v;
	return this;
};

JkTemplateRichTextSegment.prototype.getBold = function() {
	return this.bold;
};

JkTemplateRichTextSegment.prototype.setBold = function(v) {
	this.bold = v;
	return this;
};

JkTemplateRichTextSegment.prototype.getItalic = function() {
	return this.italic;
};

JkTemplateRichTextSegment.prototype.setItalic = function(v) {
	this.italic = v;
	return this;
};

JkTemplateRichTextSegment.prototype.getUnderline = function() {
	return this.underline;
};

JkTemplateRichTextSegment.prototype.setUnderline = function(v) {
	this.underline = v;
	return this;
};

JkTemplateRichTextSegment.prototype.getColor = function() {
	return this.color;
};

JkTemplateRichTextSegment.prototype.setColor = function(v) {
	this.color = v;
	return this;
};

JkTemplateRichTextSegment.prototype.getLink = function() {
	return this.link;
};

JkTemplateRichTextSegment.prototype.setLink = function(v) {
	this.link = v;
	return this;
};

JkTemplateRichTextSegment.prototype.getReference = function() {
	return this.reference;
};

JkTemplateRichTextSegment.prototype.setReference = function(v) {
	this.reference = v;
	return this;
};

JkTemplateRichTextSegment.prototype.getIsInline = function() {
	return this.isInline;
};

JkTemplateRichTextSegment.prototype.setIsInline = function(v) {
	this.isInline = v;
	return this;
};

JkTemplateRichTextSegment.prototype.getLinkPopup = function() {
	return this.linkPopup;
};

JkTemplateRichTextSegment.prototype.setLinkPopup = function(v) {
	this.linkPopup = v;
	return this;
};

JkTemplateRichTextSegment.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTemplateRichTextSegment"] === true;
};

let JkTemplateRichTextWikiMarkupParser = function() {
	this.file = null;
	this.data = null;
	this.allowInclude = true;
};

JkTemplateRichTextWikiMarkupParser.prototype._t = { "JkTemplateRichTextWikiMarkupParser" : true };
JkTemplateRichTextWikiMarkupParser.prototype._tobj = JkTemplateRichTextWikiMarkupParser;

JkTemplateRichTextWikiMarkupParser.NEW = function() {
	var v = new JkTemplateRichTextWikiMarkupParser;
	return v.CTOR_JkTemplateRichTextWikiMarkupParser();
};

JkTemplateRichTextWikiMarkupParser.prototype.CTOR_JkTemplateRichTextWikiMarkupParser = function() {
	this.allowInclude = true;
	this.data = null;
	this.file = null;
	return this;
};

JkTemplateRichTextWikiMarkupParser.parseFile = function(file) {
	return JkTemplateRichTextWikiMarkupParser.NEW().setFile(file).parse();
};

JkTemplateRichTextWikiMarkupParser.parseString = function(data) {
	return JkTemplateRichTextWikiMarkupParser.NEW().setData(data).parse();
};

JkTemplateRichTextWikiMarkupParser.prototype.skipEmptyLines = function(pr) {
	var line = null;
	while(!((line = pr.readLine()) == null)){
		line = JkLangString.strip(line);
		if(line != null && JkLangString.startsWith(line, "#", 0)) {
			continue;
		}
		if(JkLangString.isEmpty(line) == false) {
			break;
		}
	}
	return line;
};

JkTemplateRichTextWikiMarkupParser.prototype.readPreformattedParagraph = function(id, pr) {
	var sb = JkLangStringBuilder.NEW();
	var line = null;
	while(!((line = pr.readLine()) == null)){
		var sline = JkLangString.strip(line);
		if(JkLangString.startsWith(sline, "---", 0) && JkLangString.endsWith(sline, "---")) {
			var lid = JkLangString.strip((JkLangString.getSubString(line, 3, (JkLangString.getLength(line) - 6))));
			if(JkLangString.isEmpty(id)) {
				if(JkLangString.isEmpty(lid)) {
					break;
				}
			}
			else if(JkLangString.equals(id, lid)) {
				break;
			}
		}
		sb.appendString(line);
		sb.appendCharacter('\n'.charCodeAt());
	}
	return JkTemplateRichTextPreformattedParagraph.NEW().setId(id).setText((sb.toString()));
};

JkTemplateRichTextWikiMarkupParser.prototype.readBlockParagraph = function(id, pr) {
	var sb = JkLangStringBuilder.NEW();
	var line = null;
	while(!((line = pr.readLine()) == null)){
		if(JkLangString.startsWith(line, "--", 0) && JkLangString.endsWith(line, "--")) {
			var lid = JkLangString.strip((JkLangString.getSubString(line, 2, (JkLangString.getLength(line) - 4))));
			if(JkLangString.isEmpty(id)) {
				if(JkLangString.isEmpty(lid)) {
					break;
				}
			}
			else if(JkLangString.equals(id, lid)) {
				break;
			}
		}
		sb.appendString(line);
		sb.appendCharacter('\n'.charCodeAt());
	}
	return JkTemplateRichTextBlockParagraph.NEW().setId(id).setText((sb.toString()));
};

JkTemplateRichTextWikiMarkupParser.prototype.readListParagraph = function(type, l, pr) {
	var line = l;
	var prefix = JkLangString.getSubString(line, 0, 2);
	var list = new Array;
	var sb = JkLangStringBuilder.NEW();
	do {
		line = JkLangString.strip(line);
		if(JkLangString.startsWith(line, prefix, 0) == false) {
			break;
		}
		line = JkLangString.getEndOfString(line, 2);
		var it = JkLangString.iterate(line);
		var c = '\0'.charCodeAt();
		var pc = 0;
		while((c = it.getNextChar()) > 0){
			if(c == ' '.charCodeAt() || c == '\t'.charCodeAt() || c == '\r'.charCodeAt() || c == '\n'.charCodeAt()) {
				if(pc == ' '.charCodeAt()) {
					continue;
				}
				c = ' '.charCodeAt();
			}
			sb.appendCharacter(c);
			pc = c;
		}
		if(sb.count() > 0) {
			list.push(sb.toString());
			sb.clear();
		}
	}
	while(!((line = pr.readLine()) == null));
	return JkTemplateRichTextListParagraph.NEW().setList(list).setType(type);
};

JkTemplateRichTextWikiMarkupParser.prototype.processInput = function(pr, cwd, doc) {
	var line = this.skipEmptyLines(pr);
	if(!(line != null)) {
		return false;
	}
	if(line == "-") {
		doc.addParagraph((JkTemplateRichTextSeparatorParagraph.NEW()));
		return true;
	}
	if(JkLangString.startsWith(line, "@content ", 0)) {
		var id = JkLangString.strip((JkLangString.getEndOfString(line, 9)));
		doc.addParagraph((JkTemplateRichTextContentParagraph.NEW().setContentId(id)));
		return true;
	}
	if(JkLangString.startsWith(line, "@image ", 0)) {
		var ref = JkLangString.strip((JkLangString.getEndOfString(line, 7)));
		doc.addParagraph((JkTemplateRichTextImageParagraph.NEW().setFilename(ref)));
		return true;
	}
	if(JkLangString.startsWith(line, "@image100 ", 0)) {
		var ref1 = JkLangString.strip((JkLangString.getEndOfString(line, 10)));
		doc.addParagraph((JkTemplateRichTextImageParagraph.NEW().setFilename(ref1)));
		return true;
	}
	if(JkLangString.startsWith(line, "@image75 ", 0)) {
		var ref2 = JkLangString.strip((JkLangString.getEndOfString(line, 9)));
		doc.addParagraph((JkTemplateRichTextImageParagraph.NEW().setFilename(ref2).setWidth(75)));
		return true;
	}
	if(JkLangString.startsWith(line, "@image50 ", 0)) {
		var ref3 = JkLangString.strip((JkLangString.getEndOfString(line, 9)));
		doc.addParagraph((JkTemplateRichTextImageParagraph.NEW().setFilename(ref3).setWidth(50)));
		return true;
	}
	if(JkLangString.startsWith(line, "@image25 ", 0)) {
		var ref4 = JkLangString.strip((JkLangString.getEndOfString(line, 9)));
		doc.addParagraph((JkTemplateRichTextImageParagraph.NEW().setFilename(ref4).setWidth(25)));
		return true;
	}
	if(JkLangString.startsWith(line, "@reference ", 0)) {
		var ref5 = JkLangString.strip((JkLangString.getEndOfString(line, 11)));
		var sq = JkTextStringUtil.quotedStringToVector(ref5, ' '.charCodeAt(), true, '\\'.charCodeAt());
		var rrf = JkLangVector.getAt(sq, 0);
		var txt = JkLangVector.getAt(sq, 1);
		doc.addParagraph((JkTemplateRichTextReferenceParagraph.NEW().setReference(rrf).setText(txt)));
		return true;
	}
	if(JkLangString.startsWith(line, "@set ", 0)) {
		var link = JkLangString.strip((JkLangString.getEndOfString(line, 5)));
		var sq1 = JkTextStringUtil.quotedStringToVector(link, ' '.charCodeAt(), true, '\\'.charCodeAt());
		var key = JkLangVector.getAt(sq1, 0);
		var val = JkLangVector.getAt(sq1, 1);
		if(JkLangString.isEmpty(key)) {
			return true;
		}
		doc.setMetadata(key, val);
		return true;
	}
	if(JkLangString.startsWith(line, "@link ", 0)) {
		var link1 = JkLangString.strip((JkLangString.getEndOfString(line, 6)));
		var sq2 = JkTextStringUtil.quotedStringToVector(link1, ' '.charCodeAt(), true, '\\'.charCodeAt());
		var url = JkLangVector.getAt(sq2, 0);
		var txt1 = JkLangVector.getAt(sq2, 1);
		var flags = JkLangVector.getAt(sq2, 2);
		if(JkLangString.isEmpty(txt1)) {
			txt1 = url;
		}
		var v = JkTemplateRichTextLinkParagraph.NEW();
		v.setLink(url);
		v.setText(txt1);
		if(JkLangString.equals("internal", flags)) {
			v.setPopup(false);
		}
		else {
			v.setPopup(true);
		}
		doc.addParagraph(v);
		return true;
	}
	if(JkLangString.startsWith(line, "@include ", 0)) {
		var filename = JkLangString.getEndOfString(line, 9);
		if(JkLangString.isEmpty(filename)) {
			return true;
		}
		if(cwd != null && this.allowInclude) {
			var ff = cwd;
			var array = JkLangString.split((JkLangString.replaceCharacter(filename, '\\'.charCodeAt(), '/'.charCodeAt())), '/'.charCodeAt(), 0);
			if(array != null) {
				var n = 0;
				var m = array.length;
				for(n = 0 ; n < m ; n++) {
					var comp = array[n];
					if(comp != null) {
						if(comp == "." || JkLangString.startsWith(comp, "..", 0)) {
							continue;
						}
						ff = ff.entry(comp);
					}
				}
			}
			var prx = JkIoPrintReader.forReader((ff.read()));
			if(prx != null) {
				this.parseToDocument(prx, (ff.getParent()), doc);
				prx.close();
			}
		}
		return true;
	}
	if(JkLangString.startsWith(line, "---", 0) && JkLangString.endsWith(line, "---")) {
		var id1 = JkLangString.strip((JkLangString.getSubString(line, 3, (JkLangString.getLength(line) - 6))));
		if(JkLangString.isEmpty(id1)) {
			id1 = null;
		}
		doc.addParagraph((this.readPreformattedParagraph(id1, pr)));
		return true;
	}
	if(JkLangString.startsWith(line, "--", 0) && JkLangString.endsWith(line, "--")) {
		var id2 = JkLangString.strip((JkLangString.getSubString(line, 2, (JkLangString.getLength(line) - 4))));
		if(JkLangString.isEmpty(id2)) {
			id2 = null;
		}
		doc.addParagraph((this.readBlockParagraph(id2, pr)));
		return true;
	}
	if(JkLangString.startsWith(line, "* ", 0)) {
		doc.addParagraph((this.readListParagraph("unordered", line, pr)));
		return true;
	}
	if(JkLangString.startsWith(line, "+ ", 0)) {
		doc.addParagraph((this.readListParagraph("ordered", line, pr)));
		return true;
	}
	var sb = JkLangStringBuilder.NEW();
	var pc = 0;
	do {
		line = JkLangString.strip(line);
		if(JkLangString.isEmpty(line)) {
			break;
		}
		if(JkLangString.startsWith(line, "#", 0) == false) {
			var it = JkLangString.iterate(line);
			var c = '\0'.charCodeAt();
			if(sb.count() > 0 && pc != ' '.charCodeAt()) {
				sb.appendCharacter(' '.charCodeAt());
				pc = ' '.charCodeAt();
			}
			while((c = it.getNextChar()) > 0){
				if(c == ' '.charCodeAt() || c == '\t'.charCodeAt() || c == '\r'.charCodeAt() || c == '\n'.charCodeAt()) {
					if(pc == ' '.charCodeAt()) {
						continue;
					}
					c = ' '.charCodeAt();
				}
				sb.appendCharacter(c);
				pc = c;
			}
		}
	}
	while(!((line = pr.readLine()) == null));
	var s = sb.toString();
	if(JkLangString.isEmpty(s)) {
		return false;
	}
	doc.addParagraph((JkTemplateRichTextStyledParagraph.forString(s)));
	return true;
};

JkTemplateRichTextWikiMarkupParser.prototype.parseToDocument = function(pr, cwd, v) {
	if(!(pr != null)) {
		return;
	}
	while(this.processInput(pr, cwd, v)){
		;
	}
};

JkTemplateRichTextWikiMarkupParser.prototype.parse = function() {
	var pr = null;
	var cwd = null;
	if(this.file != null) {
		pr = JkIoPrintReader.forReader((this.file.read()));
		cwd = this.file.getParent();
	}
	else if(this.data != null) {
		pr = JkIoStringLineReader.NEW_String(this.data);
		cwd = null;
	}
	var v = JkTemplateRichTextDocument.NEW();
	this.parseToDocument(pr, cwd, v);
	return v;
};

JkTemplateRichTextWikiMarkupParser.prototype.getFile = function() {
	return this.file;
};

JkTemplateRichTextWikiMarkupParser.prototype.setFile = function(v) {
	this.file = v;
	return this;
};

JkTemplateRichTextWikiMarkupParser.prototype.getData = function() {
	return this.data;
};

JkTemplateRichTextWikiMarkupParser.prototype.setData = function(v) {
	this.data = v;
	return this;
};

JkTemplateRichTextWikiMarkupParser.prototype.getAllowInclude = function() {
	return this.allowInclude;
};

JkTemplateRichTextWikiMarkupParser.prototype.setAllowInclude = function(v) {
	this.allowInclude = v;
	return this;
};

JkTemplateRichTextWikiMarkupParser.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTemplateRichTextWikiMarkupParser"] === true;
};

let JkTemplateRichTextDocumentReferenceResolver = {};

JkTemplateRichTextDocumentReferenceResolver.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTemplateRichTextDocumentReferenceResolver"] === true;
};

let JkTemplateRichTextDocument = function() {
	this.metadata = null;
	this.paragraphs = null;
};

JkTemplateRichTextDocument.prototype._t = { "JkTemplateRichTextDocument" : true };
JkTemplateRichTextDocument.prototype._tobj = JkTemplateRichTextDocument;

JkTemplateRichTextDocument.NEW = function() {
	var v = new JkTemplateRichTextDocument;
	return v.CTOR_JkTemplateRichTextDocument();
};

JkTemplateRichTextDocument.prototype.CTOR_JkTemplateRichTextDocument = function() {
	this.paragraphs = null;
	this.metadata = null;
	this.metadata = JkLangDynamicMap.NEW();
	return this;
};

JkTemplateRichTextDocument.forWikiMarkupFile = function(file) {
	return JkTemplateRichTextWikiMarkupParser.parseFile(file);
};

JkTemplateRichTextDocument.forWikiMarkupString = function(str) {
	return JkTemplateRichTextWikiMarkupParser.parseString(str);
};

JkTemplateRichTextDocument.prototype.getTitle = function() {
	return this.metadata.getString("title", null);
};

JkTemplateRichTextDocument.prototype.setTitle = function(v) {
	this.metadata.setString("title", v);
	return this;
};

JkTemplateRichTextDocument.prototype.getAllMetadata = function() {
	return this.metadata;
};

JkTemplateRichTextDocument.prototype.getMetadata = function(k) {
	return this.metadata.getString(k, null);
};

JkTemplateRichTextDocument.prototype.setMetadata = function(k, v) {
	this.metadata.setString(k, v);
	return this;
};

JkTemplateRichTextDocument.prototype.addParagraph = function(rtp) {
	if(rtp == null) {
		return this;
	}
	if(this.paragraphs == null) {
		this.paragraphs = new Array;
	}
	JkLangVector.append(this.paragraphs, rtp);
	if(this.getTitle() == null && (JkTemplateRichTextStyledParagraph.IS_INSTANCE && JkTemplateRichTextStyledParagraph.IS_INSTANCE(rtp)) && (function(o) {
		if(JkTemplateRichTextStyledParagraph.IS_INSTANCE && JkTemplateRichTextStyledParagraph.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(rtp).getHeading() == 1) {
		this.setTitle(((function(o1) {
			if(JkTemplateRichTextStyledParagraph.IS_INSTANCE && JkTemplateRichTextStyledParagraph.IS_INSTANCE(o1)) {
				return o1;
			}
			return null;
		}.bind(this))(rtp).getTextContent()));
	}
	return this;
};

JkTemplateRichTextDocument.prototype.getAllReferences = function() {
	var v = new Array;
	if(this.paragraphs != null) {
		var n = 0;
		var m = this.paragraphs.length;
		for(n = 0 ; n < m ; n++) {
			var paragraph = this.paragraphs[n];
			if(paragraph != null) {
				if(JkTemplateRichTextReferenceParagraph.IS_INSTANCE && JkTemplateRichTextReferenceParagraph.IS_INSTANCE(paragraph)) {
					var ref = paragraph.getReference();
					if(JkLangString.isEmpty(ref) == false) {
						v.push(ref);
					}
				}
				else if(JkTemplateRichTextStyledParagraph.IS_INSTANCE && JkTemplateRichTextStyledParagraph.IS_INSTANCE(paragraph)) {
					var array = paragraph.getSegments();
					if(array != null) {
						var n2 = 0;
						var m2 = array.length;
						for(n2 = 0 ; n2 < m2 ; n2++) {
							var segment = array[n2];
							if(segment != null) {
								var ref1 = segment.getReference();
								if(JkLangString.isEmpty(ref1) == false) {
									v.push(ref1);
								}
							}
						}
					}
				}
			}
		}
	}
	return v;
};

JkTemplateRichTextDocument.prototype.getAllLinks = function() {
	var v = new Array;
	if(this.paragraphs != null) {
		var n = 0;
		var m = this.paragraphs.length;
		for(n = 0 ; n < m ; n++) {
			var paragraph = this.paragraphs[n];
			if(paragraph != null) {
				if(JkTemplateRichTextLinkParagraph.IS_INSTANCE && JkTemplateRichTextLinkParagraph.IS_INSTANCE(paragraph)) {
					var link = paragraph.getLink();
					if(JkLangString.isEmpty(link) == false) {
						v.push(link);
					}
				}
				else if(JkTemplateRichTextStyledParagraph.IS_INSTANCE && JkTemplateRichTextStyledParagraph.IS_INSTANCE(paragraph)) {
					var array = paragraph.getSegments();
					if(array != null) {
						var n2 = 0;
						var m2 = array.length;
						for(n2 = 0 ; n2 < m2 ; n2++) {
							var segment = array[n2];
							if(segment != null) {
								var link1 = segment.getLink();
								if(JkLangString.isEmpty(link1) == false) {
									v.push(link1);
								}
							}
						}
					}
				}
			}
		}
	}
	return v;
};

JkTemplateRichTextDocument.prototype.toJson = function() {
	var v = JkLangDynamicMap.NEW();
	v.setObject("metadata", this.metadata);
	v.setString("title", (this.getTitle()));
	var pp = new Array;
	if(this.paragraphs != null) {
		var n = 0;
		var m = this.paragraphs.length;
		for(n = 0 ; n < m ; n++) {
			var par = this.paragraphs[n];
			if(par != null) {
				var pj = par.toJson();
				if(pj != null) {
					JkLangVector.append(pp, pj);
				}
			}
		}
	}
	v.setObject("paragraphs", pp);
	return v;
};

JkTemplateRichTextDocument.prototype.toHtml = function(refs) {
	var sb = JkLangStringBuilder.NEW();
	var array = this.getParagraphs();
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var paragraph = array[n];
			if(paragraph != null) {
				var html = paragraph.toHtml(refs);
				if(JkLangString.isEmpty(html) == false) {
					sb.appendString(html);
					sb.appendCharacter('\n'.charCodeAt());
				}
			}
		}
	}
	return sb.toString();
};

JkTemplateRichTextDocument.prototype.getParagraphs = function() {
	return this.paragraphs;
};

JkTemplateRichTextDocument.prototype.setParagraphs = function(v) {
	this.paragraphs = v;
	return this;
};

JkTemplateRichTextDocument.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTemplateRichTextDocument"] === true;
};

let JkTemplateRichTextImageParagraph = function() {
	JkTemplateRichTextParagraph.call(this);
	this.filename = null;
	this.width = 100;
};

JkTemplateRichTextImageParagraph.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTemplateRichTextParagraph.prototype);
JkTemplateRichTextImageParagraph.prototype.constructor = JkTemplateRichTextImageParagraph;
JkTemplateRichTextImageParagraph.prototype._t = {
	"JkTemplateRichTextImageParagraph" : true,
	"JkTemplateRichTextParagraph" : true
};
JkTemplateRichTextImageParagraph.prototype._tobj = JkTemplateRichTextImageParagraph;

JkTemplateRichTextImageParagraph.NEW = function() {
	var v = new JkTemplateRichTextImageParagraph;
	return v.CTOR_JkTemplateRichTextImageParagraph();
};

JkTemplateRichTextImageParagraph.prototype.CTOR_JkTemplateRichTextImageParagraph = function() {
	this.width = 100;
	this.filename = null;
	if(JkTemplateRichTextParagraph.prototype.CTOR_JkTemplateRichTextParagraph.call(this) == null) {
		return null;
	}
	return this;
};

JkTemplateRichTextImageParagraph.prototype.toMarkup = function() {
	if(this.width >= 100) {
		return "@image " + (JkLangString.safeString(this.filename)) + ("\n");
	}
	if(this.width >= 75) {
		return "@image75 " + (JkLangString.safeString(this.filename)) + ("\n");
	}
	if(this.width >= 50) {
		return "@image50 " + (JkLangString.safeString(this.filename)) + ("\n");
	}
	return "@image25 " + (JkLangString.safeString(this.filename)) + ("\n");
};

JkTemplateRichTextImageParagraph.prototype.toText = function() {
	return "[image:" + (JkLangString.safeString(this.filename)) + ("]\n");
};

JkTemplateRichTextImageParagraph.prototype.toJson = function() {
	var v = JkLangDynamicMap.NEW();
	v.setString("type", "image");
	v.setInteger("width", this.width);
	v.setString("filename", this.filename);
	return v;
};

JkTemplateRichTextImageParagraph.prototype.toHtml = function(refs) {
	var sb = JkLangStringBuilder.NEW();
	if(this.width >= 100) {
		sb.appendString("<div class=\"img100\">");
	}
	else if(this.width >= 75) {
		sb.appendString("<div class=\"img75\">");
	}
	else if(this.width >= 50) {
		sb.appendString("<div class=\"img50\">");
	}
	else {
		sb.appendString("<div class=\"img25\">");
	}
	sb.appendString("<img src=\"" + (JkLangString.safeString((JkXmlHTMLString.sanitize(this.filename)))) + ("\" />"));
	sb.appendString("</div>\n");
	return sb.toString();
};

JkTemplateRichTextImageParagraph.prototype.getFilename = function() {
	return this.filename;
};

JkTemplateRichTextImageParagraph.prototype.setFilename = function(v) {
	this.filename = v;
	return this;
};

JkTemplateRichTextImageParagraph.prototype.getWidth = function() {
	return this.width;
};

JkTemplateRichTextImageParagraph.prototype.setWidth = function(v) {
	this.width = v;
	return this;
};

JkTemplateRichTextImageParagraph.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTemplateRichTextImageParagraph"] === true;
};

let JkTemplateRichTextReferenceParagraph = function() {
	JkTemplateRichTextParagraph.call(this);
	this.reference = null;
	this.text = null;
};

JkTemplateRichTextReferenceParagraph.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTemplateRichTextParagraph.prototype);
JkTemplateRichTextReferenceParagraph.prototype.constructor = JkTemplateRichTextReferenceParagraph;
JkTemplateRichTextReferenceParagraph.prototype._t = {
	"JkTemplateRichTextParagraph" : true,
	"JkTemplateRichTextReferenceParagraph" : true
};
JkTemplateRichTextReferenceParagraph.prototype._tobj = JkTemplateRichTextReferenceParagraph;

JkTemplateRichTextReferenceParagraph.NEW = function() {
	var v = new JkTemplateRichTextReferenceParagraph;
	return v.CTOR_JkTemplateRichTextReferenceParagraph();
};

JkTemplateRichTextReferenceParagraph.prototype.CTOR_JkTemplateRichTextReferenceParagraph = function() {
	this.text = null;
	this.reference = null;
	if(JkTemplateRichTextParagraph.prototype.CTOR_JkTemplateRichTextParagraph.call(this) == null) {
		return null;
	}
	return this;
};

JkTemplateRichTextReferenceParagraph.prototype.toMarkup = function() {
	var sb = JkLangStringBuilder.NEW();
	sb.appendString("@reference ");
	sb.appendString(this.reference);
	if(JkLangString.isEmpty(this.text) == false) {
		sb.appendCharacter(' '.charCodeAt());
		sb.appendCharacter('\"'.charCodeAt());
		sb.appendString(this.text);
		sb.appendCharacter('\"'.charCodeAt());
	}
	return sb.toString();
};

JkTemplateRichTextReferenceParagraph.prototype.toText = function() {
	var v = this.text;
	if(JkLangString.isEmpty(this.text)) {
		v = this.reference;
	}
	return v;
};

JkTemplateRichTextReferenceParagraph.prototype.toJson = function() {
	var v = JkLangDynamicMap.NEW();
	v.setString("type", "reference");
	v.setString("reference", this.reference);
	v.setString("text", this.text);
	return v;
};

JkTemplateRichTextReferenceParagraph.prototype.toHtml = function(refs) {
	var reftitle = null;
	var href = null;
	if(JkLangString.isEmpty(this.text) == false) {
		reftitle = this.text;
	}
	if(JkLangString.isEmpty(reftitle)) {
		if(refs != null) {
			reftitle = refs.getReferenceTitle(this.reference);
		}
		else {
			reftitle = this.reference;
		}
	}
	if(refs != null) {
		href = refs.getReferenceHref(this.reference);
	}
	else {
		href = this.reference;
	}
	if(JkLangString.isEmpty(href)) {
		return "";
	}
	if(JkLangString.isEmpty(reftitle)) {
		reftitle = href;
	}
	return "<p class=\"reference\"><a href=\"" + (JkLangString.safeString((JkXmlHTMLString.sanitize(href)))) + ("\">") + (JkLangString.safeString((JkXmlHTMLString.sanitize(reftitle)))) + ("</a></p>\n");
};

JkTemplateRichTextReferenceParagraph.prototype.getReference = function() {
	return this.reference;
};

JkTemplateRichTextReferenceParagraph.prototype.setReference = function(v) {
	this.reference = v;
	return this;
};

JkTemplateRichTextReferenceParagraph.prototype.getText = function() {
	return this.text;
};

JkTemplateRichTextReferenceParagraph.prototype.setText = function(v) {
	this.text = v;
	return this;
};

JkTemplateRichTextReferenceParagraph.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTemplateRichTextReferenceParagraph"] === true;
};

let JkTemplateRichTextPreformattedParagraph = function() {
	JkTemplateRichTextParagraph.call(this);
	this.id = null;
	this.text = null;
};

JkTemplateRichTextPreformattedParagraph.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTemplateRichTextParagraph.prototype);
JkTemplateRichTextPreformattedParagraph.prototype.constructor = JkTemplateRichTextPreformattedParagraph;
JkTemplateRichTextPreformattedParagraph.prototype._t = {
	"JkTemplateRichTextParagraph" : true,
	"JkTemplateRichTextPreformattedParagraph" : true
};
JkTemplateRichTextPreformattedParagraph.prototype._tobj = JkTemplateRichTextPreformattedParagraph;

JkTemplateRichTextPreformattedParagraph.NEW = function() {
	var v = new JkTemplateRichTextPreformattedParagraph;
	return v.CTOR_JkTemplateRichTextPreformattedParagraph();
};

JkTemplateRichTextPreformattedParagraph.prototype.CTOR_JkTemplateRichTextPreformattedParagraph = function() {
	this.text = null;
	this.id = null;
	if(JkTemplateRichTextParagraph.prototype.CTOR_JkTemplateRichTextParagraph.call(this) == null) {
		return null;
	}
	return this;
};

JkTemplateRichTextPreformattedParagraph.prototype.toMarkup = function() {
	var sb = JkLangStringBuilder.NEW();
	var delim = null;
	if(JkLangString.isEmpty(this.id)) {
		delim = "---";
	}
	else {
		delim = "--- " + (JkLangString.safeString(this.id)) + (" ---");
	}
	sb.appendString(delim);
	sb.appendCharacter('\n'.charCodeAt());
	if(this.text != null) {
		sb.appendString(this.text);
		if(JkLangString.endsWith(this.text, "\n") == false) {
			sb.appendCharacter('\n'.charCodeAt());
		}
	}
	sb.appendString(delim);
	return sb.toString();
};

JkTemplateRichTextPreformattedParagraph.prototype.toText = function() {
	return this.text;
};

JkTemplateRichTextPreformattedParagraph.prototype.toJson = function() {
	var v = JkLangDynamicMap.NEW();
	v.setString("type", "preformatted");
	v.setString("id", this.id);
	v.setString("text", this.text);
	return v;
};

JkTemplateRichTextPreformattedParagraph.prototype.toHtml = function(refs) {
	var ids = "";
	if(JkLangString.isEmpty(this.id) == false) {
		ids = " id=\"" + (JkLangString.safeString((JkXmlHTMLString.sanitize(this.id)))) + ("\"");
	}
	var codeo = "";
	var codec = "";
	if(JkLangString.equals("code", this.id)) {
		codeo = "<code>";
		codec = "</code>";
	}
	return "<pre" + (JkLangString.safeString(ids)) + (">") + (JkLangString.safeString(codeo)) + (JkLangString.safeString((JkXmlHTMLString.sanitize(this.text)))) + (JkLangString.safeString(codec)) + ("</pre>");
};

JkTemplateRichTextPreformattedParagraph.prototype.getId = function() {
	return this.id;
};

JkTemplateRichTextPreformattedParagraph.prototype.setId = function(v) {
	this.id = v;
	return this;
};

JkTemplateRichTextPreformattedParagraph.prototype.getText = function() {
	return this.text;
};

JkTemplateRichTextPreformattedParagraph.prototype.setText = function(v) {
	this.text = v;
	return this;
};

JkTemplateRichTextPreformattedParagraph.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTemplateRichTextPreformattedParagraph"] === true;
};

let JkTemplateRichTextSeparatorParagraph = function() {
	JkTemplateRichTextParagraph.call(this);
};

JkTemplateRichTextSeparatorParagraph.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTemplateRichTextParagraph.prototype);
JkTemplateRichTextSeparatorParagraph.prototype.constructor = JkTemplateRichTextSeparatorParagraph;
JkTemplateRichTextSeparatorParagraph.prototype._t = {
	"JkTemplateRichTextParagraph" : true,
	"JkTemplateRichTextSeparatorParagraph" : true
};
JkTemplateRichTextSeparatorParagraph.prototype._tobj = JkTemplateRichTextSeparatorParagraph;

JkTemplateRichTextSeparatorParagraph.NEW = function() {
	var v = new JkTemplateRichTextSeparatorParagraph;
	return v.CTOR_JkTemplateRichTextSeparatorParagraph();
};

JkTemplateRichTextSeparatorParagraph.prototype.CTOR_JkTemplateRichTextSeparatorParagraph = function() {
	if(JkTemplateRichTextParagraph.prototype.CTOR_JkTemplateRichTextParagraph.call(this) == null) {
		return null;
	}
	return this;
};

JkTemplateRichTextSeparatorParagraph.prototype.toMarkup = function() {
	return "-";
};

JkTemplateRichTextSeparatorParagraph.prototype.toText = function() {
	return "----------";
};

JkTemplateRichTextSeparatorParagraph.prototype.toJson = function() {
	var v = JkLangDynamicMap.NEW();
	v.setString("type", "separator");
	return v;
};

JkTemplateRichTextSeparatorParagraph.prototype.toHtml = function(refs) {
	return "<hr />\n";
};

JkTemplateRichTextSeparatorParagraph.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTemplateRichTextSeparatorParagraph"] === true;
};

let JkTemplateRichTextLinkParagraph = function() {
	JkTemplateRichTextParagraph.call(this);
	this.link = null;
	this.text = null;
	this.popup = false;
};

JkTemplateRichTextLinkParagraph.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTemplateRichTextParagraph.prototype);
JkTemplateRichTextLinkParagraph.prototype.constructor = JkTemplateRichTextLinkParagraph;
JkTemplateRichTextLinkParagraph.prototype._t = {
	"JkTemplateRichTextParagraph" : true,
	"JkTemplateRichTextLinkParagraph" : true
};
JkTemplateRichTextLinkParagraph.prototype._tobj = JkTemplateRichTextLinkParagraph;

JkTemplateRichTextLinkParagraph.NEW = function() {
	var v = new JkTemplateRichTextLinkParagraph;
	return v.CTOR_JkTemplateRichTextLinkParagraph();
};

JkTemplateRichTextLinkParagraph.prototype.CTOR_JkTemplateRichTextLinkParagraph = function() {
	this.popup = false;
	this.text = null;
	this.link = null;
	if(JkTemplateRichTextParagraph.prototype.CTOR_JkTemplateRichTextParagraph.call(this) == null) {
		return null;
	}
	return this;
};

JkTemplateRichTextLinkParagraph.prototype.toMarkup = function() {
	var sb = JkLangStringBuilder.NEW();
	sb.appendString("@link ");
	sb.appendString(this.link);
	sb.appendCharacter(' '.charCodeAt());
	sb.appendCharacter('\"'.charCodeAt());
	if(JkLangString.isEmpty(this.text) == false) {
		sb.appendString(this.text);
	}
	sb.appendCharacter('\"'.charCodeAt());
	if(this.popup) {
		sb.appendString(" popup");
	}
	return sb.toString();
};

JkTemplateRichTextLinkParagraph.prototype.toText = function() {
	var v = this.text;
	if(JkLangString.isEmpty(v)) {
		v = this.link;
	}
	return v;
};

JkTemplateRichTextLinkParagraph.prototype.toJson = function() {
	var v = JkLangDynamicMap.NEW();
	v.setString("type", "link");
	v.setString("link", this.link);
	v.setString("text", this.text);
	return v;
};

JkTemplateRichTextLinkParagraph.prototype.toHtml = function(refs) {
	var href = JkXmlHTMLString.sanitize(this.link);
	var tt = this.text;
	if(JkLangString.isEmpty(tt)) {
		tt = href;
	}
	if(JkLangString.isEmpty(tt)) {
		tt = "(empty link)";
	}
	var targetblank = "";
	if(this.popup) {
		targetblank = " target=\"_blank\"";
	}
	return "<p class=\"link\"><a href=\"" + (JkLangString.safeString(href)) + ("\"") + (JkLangString.safeString(targetblank)) + (">") + (JkLangString.safeString(tt)) + ("</a></p>\n");
};

JkTemplateRichTextLinkParagraph.prototype.getLink = function() {
	return this.link;
};

JkTemplateRichTextLinkParagraph.prototype.setLink = function(v) {
	this.link = v;
	return this;
};

JkTemplateRichTextLinkParagraph.prototype.getText = function() {
	return this.text;
};

JkTemplateRichTextLinkParagraph.prototype.setText = function(v) {
	this.text = v;
	return this;
};

JkTemplateRichTextLinkParagraph.prototype.getPopup = function() {
	return this.popup;
};

JkTemplateRichTextLinkParagraph.prototype.setPopup = function(v) {
	this.popup = v;
	return this;
};

JkTemplateRichTextLinkParagraph.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTemplateRichTextLinkParagraph"] === true;
};

let JkTemplateRichTextListParagraph = function() {
	JkTemplateRichTextParagraph.call(this);
	this.type = null;
	this.list = null;
};

JkTemplateRichTextListParagraph.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTemplateRichTextParagraph.prototype);
JkTemplateRichTextListParagraph.prototype.constructor = JkTemplateRichTextListParagraph;
JkTemplateRichTextListParagraph.prototype._t = {
	"JkTemplateRichTextParagraph" : true,
	"JkTemplateRichTextListParagraph" : true
};
JkTemplateRichTextListParagraph.prototype._tobj = JkTemplateRichTextListParagraph;

JkTemplateRichTextListParagraph.NEW = function() {
	var v = new JkTemplateRichTextListParagraph;
	return v.CTOR_JkTemplateRichTextListParagraph();
};

JkTemplateRichTextListParagraph.prototype.CTOR_JkTemplateRichTextListParagraph = function() {
	this.list = null;
	this.type = null;
	if(JkTemplateRichTextParagraph.prototype.CTOR_JkTemplateRichTextParagraph.call(this) == null) {
		return null;
	}
	return this;
};

JkTemplateRichTextListParagraph.prototype.toJson = function() {
	var v = JkLangDynamicMap.NEW();
	v.setString("type", this.type);
	v.setObject("list", this.list);
	return v;
};

JkTemplateRichTextListParagraph.prototype.processList = function(refs, v) {
	var sb = JkLangStringBuilder.NEW();
	if(v != null) {
		var n = 0;
		var m = v.length;
		for(n = 0 ; n < m ; n++) {
			var str = v[n];
			if(str != null) {
				sb.appendString("<li>");
				var cc = JkTemplateRichTextStyledParagraph.forString(str);
				if(cc != null) {
					sb.appendString((cc.toHtml(refs)));
				}
				sb.appendString("</li>");
			}
		}
	}
	return sb.toString();
};

JkTemplateRichTextListParagraph.prototype.toHtml = function(refs) {
	var tag = "";
	if(JkLangString.equals("unordered", this.type)) {
		tag = "ul";
	}
	else if(JkLangString.equals("ordered", this.type)) {
		tag = "ol";
	}
	return "<" + (JkLangString.safeString(tag)) + (" class=\"list\">") + (JkLangString.safeString((this.processList(refs, this.list)))) + ("</") + (JkLangString.safeString(tag)) + (">");
};

JkTemplateRichTextListParagraph.prototype.getType = function() {
	return this.type;
};

JkTemplateRichTextListParagraph.prototype.setType = function(v) {
	this.type = v;
	return this;
};

JkTemplateRichTextListParagraph.prototype.getList = function() {
	return this.list;
};

JkTemplateRichTextListParagraph.prototype.setList = function(v) {
	this.list = v;
	return this;
};

JkTemplateRichTextListParagraph.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTemplateRichTextListParagraph"] === true;
};

let JkTemplateTextTemplateManager = function() {
	this.templates = null;
};

JkTemplateTextTemplateManager.prototype._t = { "JkTemplateTextTemplateManager" : true };
JkTemplateTextTemplateManager.prototype._tobj = JkTemplateTextTemplateManager;

JkTemplateTextTemplateManager.NEW = function() {
	var v = new JkTemplateTextTemplateManager;
	return v.CTOR_JkTemplateTextTemplateManager();
};

JkTemplateTextTemplateManager.prototype.CTOR_JkTemplateTextTemplateManager = function() {
	this.templates = null;
	return this;
};

JkTemplateTextTemplateManager.forDirectory = function(dir, cached) {
	if(!(dir != null && dir.isDirectory())) {
		return null;
	}
	var it = dir.entries();
	if(!(it != null)) {
		return null;
	}
	var v = new Map;
	while(true){
		var f = it.next();
		if(!(f != null)) {
			break;
		}
		if(f.isFile()) {
			if(cached) {
				var b = f.getContentsUTF8();
				if(!(b != null)) {
					return null;
				}
				JkLangMap.set(v, (f.getBasename()), b);
				continue;
			}
			JkLangMap.set(v, (f.getBasename()), f);
		}
	}
	return JkTemplateTextTemplateManager.forTemplates(v);
};

JkTemplateTextTemplateManager.forTemplates = function(data) {
	var v = JkTemplateTextTemplateManager.NEW();
	v.setTemplates(data);
	return v;
};

JkTemplateTextTemplateManager.prototype.getTemplateData = function(name) {
	if(!(name != null)) {
		return null;
	}
	if(!(this.templates != null)) {
		return null;
	}
	var o = JkLangMap.get(this.templates, name);
	if(!(o != null)) {
		return null;
	}
	if(typeof(o) === 'string') {
		return o;
	}
	if(o instanceof ArrayBuffer) {
		return JkLangString.forUTF8Buffer(o);
	}
	if(JkFsFile.IS_INSTANCE && JkFsFile.IS_INSTANCE(o)) {
		return o.getContentsUTF8();
	}
	return null;
};

JkTemplateTextTemplateManager.prototype.getText = function(name, vars) {
	var td = this.getTemplateData(name);
	if(!(td != null)) {
		return null;
	}
	var vv = vars;
	if(!(vv != null)) {
		vv = JkLangDynamicMap.NEW();
	}
	var tt = JkTemplateTextTemplate.forHTMLString(td, null, this.templates, null);
	if(!(tt != null)) {
		return null;
	}
	return tt.execute(vv, null);
};

JkTemplateTextTemplateManager.prototype.getTemplates = function() {
	return this.templates;
};

JkTemplateTextTemplateManager.prototype.setTemplates = function(v) {
	this.templates = v;
	return this;
};

JkTemplateTextTemplateManager.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTemplateTextTemplateManager"] === true;
};

let JkTemplateRichTextBlockParagraph = function() {
	JkTemplateRichTextParagraph.call(this);
	this.id = null;
	this.text = null;
};

JkTemplateRichTextBlockParagraph.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTemplateRichTextParagraph.prototype);
JkTemplateRichTextBlockParagraph.prototype.constructor = JkTemplateRichTextBlockParagraph;
JkTemplateRichTextBlockParagraph.prototype._t = {
	"JkTemplateRichTextBlockParagraph" : true,
	"JkTemplateRichTextParagraph" : true
};
JkTemplateRichTextBlockParagraph.prototype._tobj = JkTemplateRichTextBlockParagraph;

JkTemplateRichTextBlockParagraph.NEW = function() {
	var v = new JkTemplateRichTextBlockParagraph;
	return v.CTOR_JkTemplateRichTextBlockParagraph();
};

JkTemplateRichTextBlockParagraph.prototype.CTOR_JkTemplateRichTextBlockParagraph = function() {
	this.text = null;
	this.id = null;
	if(JkTemplateRichTextParagraph.prototype.CTOR_JkTemplateRichTextParagraph.call(this) == null) {
		return null;
	}
	return this;
};

JkTemplateRichTextBlockParagraph.prototype.toMarkup = function() {
	var sb = JkLangStringBuilder.NEW();
	var delim = null;
	if(JkLangString.isEmpty(this.id)) {
		delim = "-- ";
	}
	else {
		delim = "-- " + (JkLangString.safeString(this.id)) + (" --");
	}
	sb.appendString(delim);
	sb.appendCharacter('\n'.charCodeAt());
	if(this.text != null) {
		sb.appendString(this.text);
		if(JkLangString.endsWith(this.text, "\n") == false) {
			sb.appendCharacter('\n'.charCodeAt());
		}
	}
	sb.appendString(delim);
	return sb.toString();
};

JkTemplateRichTextBlockParagraph.prototype.toText = function() {
	return this.text;
};

JkTemplateRichTextBlockParagraph.prototype.toJson = function() {
	var map = JkLangDynamicMap.NEW();
	map.setString("type", "block");
	map.setString("id", this.id);
	map.setString("text", this.text);
	return map;
};

JkTemplateRichTextBlockParagraph.prototype.toHtml = function(refs) {
	var ids = "";
	if(JkLangString.isEmpty(this.id) == false) {
		ids = " " + (JkLangString.safeString((JkXmlHTMLString.sanitize(this.id))));
	}
	var content = JkTemplateRichTextStyledParagraph.forString(this.text);
	return "<div class=\"block" + (JkLangString.safeString(ids)) + ("\">") + (JkLangString.safeString((content.toHtml(refs)))) + ("</div>");
};

JkTemplateRichTextBlockParagraph.prototype.getId = function() {
	return this.id;
};

JkTemplateRichTextBlockParagraph.prototype.setId = function(v) {
	this.id = v;
	return this;
};

JkTemplateRichTextBlockParagraph.prototype.getText = function() {
	return this.text;
};

JkTemplateRichTextBlockParagraph.prototype.setText = function(v) {
	this.text = v;
	return this;
};

JkTemplateRichTextBlockParagraph.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTemplateRichTextBlockParagraph"] === true;
};

let JkTemplateDynamicText = function() {
	this._data = null;
	this.dataMapValue = null;
};

JkTemplateDynamicText.prototype._t = {
	"JkLangStringObject" : true,
	"JkTemplateDynamicText" : true
};
JkTemplateDynamicText.prototype._tobj = JkTemplateDynamicText;

JkTemplateDynamicText.NEW = function() {
	var v = new JkTemplateDynamicText;
	return v.CTOR_JkTemplateDynamicText();
};

JkTemplateDynamicText.prototype.CTOR_JkTemplateDynamicText = function() {
	this.dataMapValue = null;
	this._data = null;
	return this;
};

JkTemplateDynamicText.forString = function(data) {
	var v = JkTemplateDynamicText.NEW();
	v.setData(data);
	return v;
};

JkTemplateDynamicText.prototype.setValue = function(key, value) {
	this.getDataMap().setString(key, value);
};

JkTemplateDynamicText.prototype.getValue = function(key) {
	return this.getDataMap().getString(key, null);
};

JkTemplateDynamicText.prototype.toHtml = function(language, resolver) {
	var map = this.getDataMap();
	var text = null;
	var format = map.getString("format", null);
	if(language != null) {
		text = map.getString("data_" + (JkLangString.safeString(language)), null);
	}
	if(!(text != null)) {
		text = map.getString("data", null);
	}
	if(!(text != null)) {
		return null;
	}
	if(!(format != null)) {
		format = "markup";
	}
	if(format == "html") {
		return text;
	}
	if(format == "text") {
		return "<pre>" + (JkLangString.safeString((JkXmlHTMLString.sanitize(text)))) + ("</pre>");
	}
	if(format == "markup") {
		var rtd = JkTemplateRichTextDocument.forWikiMarkupString(text);
		return rtd.toHtml(resolver);
	}
	JkLangError._throw("unsupportedContentFormat", format);
	return null;
};

JkTemplateDynamicText.prototype.toString = function() {
	return JkJsonJSONEncoder.toCompactString((this.getDataMap()));
};

JkTemplateDynamicText.prototype.getData = function() {
	return this._data;
};

JkTemplateDynamicText.prototype.doSetData = function(value) {
	this._data = value;
};

JkTemplateDynamicText.prototype.setData = function(v) {
	this.doSetData(v);
	return v;
};

JkTemplateDynamicText.prototype.getDataMap = function() {
	if(!(this.dataMapValue != null)) {
		if(JkLangString.startsWith((this.getData()), "{", 0)) {
			this.dataMapValue = (function(o) {
				if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
					return o;
				}
				return null;
			}.bind(this))((JkJsonJSONParser.parseString((this.getData()))));
		}
		if(!(this.dataMapValue != null)) {
			this.dataMapValue = JkLangDynamicMap.NEW();
			this.dataMapValue.setString("data", (this.getData()));
		}
	}
	return this.dataMapValue;
};

JkTemplateDynamicText.prototype.doSetDataMap = function(value) {
	this.dataMapValue = value;
};

JkTemplateDynamicText.prototype.setDataMap = function(v) {
	this.doSetDataMap(v);
	return v;
};

JkTemplateDynamicText.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTemplateDynamicText"] === true;
};

let JkTemplateRichTextContentParagraph = function() {
	JkTemplateRichTextParagraph.call(this);
	this.contentId = null;
};

JkTemplateRichTextContentParagraph.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTemplateRichTextParagraph.prototype);
JkTemplateRichTextContentParagraph.prototype.constructor = JkTemplateRichTextContentParagraph;
JkTemplateRichTextContentParagraph.prototype._t = {
	"JkTemplateRichTextParagraph" : true,
	"JkTemplateRichTextContentParagraph" : true
};
JkTemplateRichTextContentParagraph.prototype._tobj = JkTemplateRichTextContentParagraph;

JkTemplateRichTextContentParagraph.NEW = function() {
	var v = new JkTemplateRichTextContentParagraph;
	return v.CTOR_JkTemplateRichTextContentParagraph();
};

JkTemplateRichTextContentParagraph.prototype.CTOR_JkTemplateRichTextContentParagraph = function() {
	this.contentId = null;
	if(JkTemplateRichTextParagraph.prototype.CTOR_JkTemplateRichTextParagraph.call(this) == null) {
		return null;
	}
	return this;
};

JkTemplateRichTextContentParagraph.prototype.toMarkup = function() {
	return "@content " + (JkLangString.safeString(this.contentId)) + ("\n");
};

JkTemplateRichTextContentParagraph.prototype.toText = function() {
	return "[content:" + (JkLangString.safeString(this.contentId)) + ("]\n");
};

JkTemplateRichTextContentParagraph.prototype.toJson = function() {
	var map = JkLangDynamicMap.NEW();
	map.setString("type", "content");
	map.setString("id", this.contentId);
	return map;
};

JkTemplateRichTextContentParagraph.prototype.toHtml = function(refs) {
	var cc = null;
	if(refs != null && this.contentId != null) {
		cc = refs.getContentString(this.contentId);
	}
	if(cc == null) {
		cc = "";
	}
	return cc;
};

JkTemplateRichTextContentParagraph.prototype.getContentId = function() {
	return this.contentId;
};

JkTemplateRichTextContentParagraph.prototype.setContentId = function(v) {
	this.contentId = v;
	return this;
};

JkTemplateRichTextContentParagraph.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTemplateRichTextContentParagraph"] === true;
};
