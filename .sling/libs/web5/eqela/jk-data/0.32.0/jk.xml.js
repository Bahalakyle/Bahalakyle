let JkXmlXMLDOM = function() {};

JkXmlXMLDOM.prototype._t = { "JkXmlXMLDOM" : true };
JkXmlXMLDOM.prototype._tobj = JkXmlXMLDOM;

JkXmlXMLDOM.NEW = function() {
	var v = new JkXmlXMLDOM;
	return v.CTOR_JkXmlXMLDOM();
};

JkXmlXMLDOM.prototype.CTOR_JkXmlXMLDOM = function() {
	return this;
};

JkXmlXMLDOM.parseAsTreeObject = function(xml, ignoreWhiteSpace) {
	var root = null;
	var stack = JkLangStack.NEW();
	var pp = JkXmlXMLParser.forString(xml);
	pp.setIgnoreWhiteSpace(ignoreWhiteSpace);
	while(true){
		var o = pp.next();
		if(o == null) {
			break;
		}
		if(JkXmlMarkupLanguageParserStartElement.IS_INSTANCE && JkXmlMarkupLanguageParserStartElement.IS_INSTANCE(o)) {
			var name = o.getName();
			if(root == null && name == "?xml") {
				continue;
			}
			var dn = JkXmlXMLDOMNode.NEW();
			dn.name = name;
			dn.attributes = o.getParams();
			if(root == null) {
				root = dn;
				stack.push(dn);
			}
			else {
				var current = stack.peek();
				if(current == null) {
					current = root;
				}
				var children = current.children;
				if(children == null) {
					children = new Array;
					current.children = children;
				}
				children.push(dn);
				stack.push(dn);
			}
		}
		else if(JkXmlMarkupLanguageParserEndElement.IS_INSTANCE && JkXmlMarkupLanguageParserEndElement.IS_INSTANCE(o)) {
			stack.pop();
		}
		else if(JkXmlMarkupLanguageParserCharacterData.IS_INSTANCE && JkXmlMarkupLanguageParserCharacterData.IS_INSTANCE(o)) {
			var current1 = stack.peek();
			if(current1 != null) {
				var children1 = current1.children;
				if(children1 == null) {
					children1 = new Array;
					current1.children = children1;
				}
				var dn1 = JkXmlXMLDOMNode.NEW();
				dn1.name = "cdata";
				dn1.data = o.getData();
				children1.push(dn1);
			}
		}
		else if(JkXmlMarkupLanguageParserTextData.IS_INSTANCE && JkXmlMarkupLanguageParserTextData.IS_INSTANCE(o)) {
			var current2 = stack.peek();
			if(current2 != null) {
				current2.data = o.getData();
			}
		}
	}
	return root;
};

JkXmlXMLDOM.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlXMLDOM"] === true;
};

let JkXmlHTMLString = function() {};

JkXmlHTMLString.prototype._t = { "JkXmlHTMLString" : true };
JkXmlHTMLString.prototype._tobj = JkXmlHTMLString;

JkXmlHTMLString.NEW = function() {
	var v = new JkXmlHTMLString;
	return v.CTOR_JkXmlHTMLString();
};

JkXmlHTMLString.prototype.CTOR_JkXmlHTMLString = function() {
	return this;
};

JkXmlHTMLString.sanitize = function(str) {
	if(!(str != null)) {
		return null;
	}
	if(JkLangString.getIndexOfCharacter(str, '<'.charCodeAt(), 0) < 0 && JkLangString.getIndexOfCharacter(str, '>'.charCodeAt(), 0) < 0 && JkLangString.getIndexOfCharacter(str, '&'.charCodeAt(), 0) < 0) {
		return str;
	}
	var it = JkLangString.iterate(str);
	if(!(it != null)) {
		return null;
	}
	var sb = JkLangStringBuilder.NEW();
	var c = '\0'.charCodeAt();
	while((c = it.getNextChar()) > 0){
		if(c == '<'.charCodeAt()) {
			sb.appendString("&lt;");
		}
		else if(c == '>'.charCodeAt()) {
			sb.appendString("&gt;");
		}
		else if(c == '&'.charCodeAt()) {
			sb.appendString("&amp;");
		}
		else {
			sb.appendCharacter(c);
		}
	}
	return sb.toString();
};

JkXmlHTMLString.toQuotedString = function(str) {
	var sb = JkLangStringBuilder.NEW();
	sb.appendCharacter('\"'.charCodeAt());
	if(str != null) {
		var it = JkLangString.iterate(str);
		while(it != null){
			var c = it.getNextChar();
			if(c < 1) {
				break;
			}
			if(c == '\"'.charCodeAt()) {
				sb.appendCharacter('\\'.charCodeAt());
				sb.appendCharacter('\"'.charCodeAt());
			}
			else {
				sb.appendCharacter(c);
			}
		}
	}
	sb.appendCharacter('\"'.charCodeAt());
	return sb.toString();
};

JkXmlHTMLString.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlHTMLString"] === true;
};

let JkXmlXMLDOMNode = function() {
	this.name = null;
	this.data = null;
	this.attributes = null;
	this.children = null;
};

JkXmlXMLDOMNode.prototype._t = { "JkXmlXMLDOMNode" : true };
JkXmlXMLDOMNode.prototype._tobj = JkXmlXMLDOMNode;

JkXmlXMLDOMNode.NEW = function() {
	var v = new JkXmlXMLDOMNode;
	return v.CTOR_JkXmlXMLDOMNode();
};

JkXmlXMLDOMNode.prototype.CTOR_JkXmlXMLDOMNode = function() {
	this.children = null;
	this.attributes = null;
	this.data = null;
	this.name = null;
	return this;
};

JkXmlXMLDOMNode.prototype.getDOMNodesByName = function(name) {
	if(!(this.children != null && this.children.length > 0)) {
		return null;
	}
	var elements = new Array;
	if(this.children != null) {
		var n = 0;
		var m = this.children.length;
		for(n = 0 ; n < m ; n++) {
			var child = this.children[n];
			if(child != null) {
				if(JkLangString.equals(child.name, name)) {
					elements.push(child);
				}
			}
		}
	}
	return elements;
};

JkXmlXMLDOMNode.prototype.getAttribute = function(name) {
	if(!(this.attributes != null)) {
		return null;
	}
	return this.attributes.getString(name, null);
};

JkXmlXMLDOMNode.prototype.toString = function(tabCount) {
	var sb = JkLangStringBuilder.NEW();
	var tb = tabCount;
	if(tb < 0) {
		tb = 0;
	}
	var i = 0;
	while(i < tb){
		sb.appendString("\t");
		i++;
	}
	if(JkLangString.equals(this.name, "cdata")) {
		sb.appendString("<![CDATA[");
		sb.appendString(this.data);
		sb.appendString("]]>");
		return sb.toString();
	}
	sb.appendString("<");
	sb.appendString(this.name);
	if(this.attributes != null) {
		var array = this.attributes.getKeys();
		if(array != null) {
			var n = 0;
			var m = array.length;
			for(n = 0 ; n < m ; n++) {
				var name = array[n];
				if(name != null) {
					sb.appendString(" " + (JkLangString.safeString(name)) + ("=\"") + (JkLangString.safeString((this.attributes.getString(name, null)))) + ("\""));
				}
			}
		}
	}
	sb.appendString(">");
	if(this.children != null && this.children.length > 0) {
		if(this.children != null) {
			var n2 = 0;
			var m2 = this.children.length;
			for(n2 = 0 ; n2 < m2 ; n2++) {
				var child = this.children[n2];
				if(child != null) {
					sb.appendString("\n");
					sb.appendString((child.toString((tb + 1))));
				}
			}
		}
		sb.appendString("\n");
		i = 0;
		while(i < tb){
			sb.appendString("\t");
			i++;
		}
	}
	else {
		sb.appendString(this.data);
	}
	sb.appendString("</");
	sb.appendString(this.name);
	sb.appendString(">");
	return sb.toString();
};

JkXmlXMLDOMNode.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlXMLDOMNode"] === true;
};

let JkXmlMarkupLanguageParser = function() {
	this.it = null;
	this.nextQueue = null;
	this.cdataStart = "![CDATA[";
	this.commentStart = "!--";
	this.tag = null;
	this.def = null;
	this.cdata = null;
	this.comment = null;
	this.ignoreWhiteSpace = false;
	this.currentPosition = 0;
};

JkXmlMarkupLanguageParser.prototype._t = { "JkXmlMarkupLanguageParser" : true };
JkXmlMarkupLanguageParser.prototype._tobj = JkXmlMarkupLanguageParser;

JkXmlMarkupLanguageParser.NEW = function() {
	var v = new JkXmlMarkupLanguageParser;
	return v.CTOR_JkXmlMarkupLanguageParser();
};

JkXmlMarkupLanguageParser.prototype.CTOR_JkXmlMarkupLanguageParser = function() {
	this.currentPosition = 0;
	this.ignoreWhiteSpace = false;
	this.comment = null;
	this.cdata = null;
	this.def = null;
	this.tag = null;
	this.commentStart = "!--";
	this.cdataStart = "![CDATA[";
	this.nextQueue = null;
	this.it = null;
	return this;
};

JkXmlMarkupLanguageParser.prototype.onTagString = function(tagstring, pos) {
	if(JkLangString.getChar(tagstring, 0) == '/'.charCodeAt()) {
		var v = JkXmlMarkupLanguageParserEndElement.NEW();
		v.setPosition(pos);
		v.setName((JkLangString.getEndOfString(tagstring, 1)));
		return v;
	}
	var element = JkLangStringBuilder.NEW();
	var params = JkLangDynamicMap.NEW();
	var it = JkLangCharacterIteratorForString.forString(tagstring);
	var c = '\0'.charCodeAt();
	while((c = it.getNextChar()) > 0){
		if(c == ' '.charCodeAt() || c == '\t'.charCodeAt() || c == '\n'.charCodeAt() || c == '\r'.charCodeAt() || c == '/'.charCodeAt()) {
			if(element.count() > 0) {
				break;
			}
		}
		else {
			element.appendCharacter(c);
		}
	}
	while(c > 0 && c != '/'.charCodeAt()){
		if(c == ' '.charCodeAt() || c == '\t'.charCodeAt() || c == '\n'.charCodeAt() || c == '\r'.charCodeAt()) {
			c = it.getNextChar();
			continue;
		}
		var pname = JkLangStringBuilder.NEW();
		var pval = JkLangStringBuilder.NEW();
		while(c > 0 && c != ' '.charCodeAt() && c != '\t'.charCodeAt() && c != '\n'.charCodeAt() && c != '\r'.charCodeAt() && c != '='.charCodeAt()){
			pname.appendCharacter(c);
			c = it.getNextChar();
		}
		while(c == ' '.charCodeAt() || c == '\t'.charCodeAt() || c == '\n'.charCodeAt() || c == '\r'.charCodeAt()){
			c = it.getNextChar();
		}
		if(c != '='.charCodeAt()) {
			;
		}
		else {
			c = it.getNextChar();
			while(c == ' '.charCodeAt() || c == '\t'.charCodeAt() || c == '\n'.charCodeAt() || c == '\r'.charCodeAt()){
				c = it.getNextChar();
			}
			if(c != '\"'.charCodeAt()) {
				;
				while(c > 0 && c != ' '.charCodeAt() && c != '\t'.charCodeAt() && c != '\n'.charCodeAt() && c != '\r'.charCodeAt()){
					pval.appendCharacter(c);
					c = it.getNextChar();
				}
				while(c == ' '.charCodeAt() || c == '\t'.charCodeAt() || c == '\n'.charCodeAt() || c == '\r'.charCodeAt()){
					c = it.getNextChar();
				}
			}
			else {
				c = it.getNextChar();
				while(c > 0 && c != '\"'.charCodeAt()){
					pval.appendCharacter(c);
					c = it.getNextChar();
				}
				if(c != '\"'.charCodeAt()) {
					;
				}
				else {
					c = it.getNextChar();
				}
				while(c == ' '.charCodeAt() || c == '\t'.charCodeAt() || c == '\n'.charCodeAt() || c == '\r'.charCodeAt()){
					c = it.getNextChar();
				}
			}
		}
		var pnamestr = pname.toString();
		var pvalstr = this.sanitizeAttributeValue((pval.toString()));
		params.setString(pnamestr, pvalstr);
	}
	var els = element.toString();
	if(c == '/'.charCodeAt()) {
		var e = JkXmlMarkupLanguageParserEndElement.NEW();
		e.setName(els);
		e.setPosition(pos);
		this.nextQueue = e;
	}
	var v1 = JkXmlMarkupLanguageParserStartElement.NEW();
	v1.setPosition(pos);
	v1.setName(els);
	v1.setParams(params);
	return v1;
};

JkXmlMarkupLanguageParser.prototype.sanitizeAttributeValue = function(str) {
	if(!JkLangString.contains(str, "&quot;")) {
		return str;
	}
	return JkLangString.replaceString(str, "&quot;", "\"");
};

JkXmlMarkupLanguageParser.prototype.isOnlyWhiteSpace = function(str) {
	if(str == null) {
		return true;
	}
	var array = JkLangString.toCharArray(str);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var c = array[n];
			if(c == ' '.charCodeAt() || c == '\t'.charCodeAt() || c == '\n'.charCodeAt() || c == '\r'.charCodeAt()) {
				;
			}
			else {
				return false;
			}
		}
	}
	return true;
};

JkXmlMarkupLanguageParser.prototype.getNextChar = function() {
	if(!(this.it != null)) {
		return '\0'.charCodeAt();
	}
	var v = this.it.getNextChar();
	if(v > 0) {
		this.currentPosition++;
	}
	return v;
};

JkXmlMarkupLanguageParser.prototype.moveToPreviousChar = function() {
	if(!(this.it != null)) {
		return;
	}
	if(this.currentPosition > 0) {
		this.currentPosition--;
		this.it.moveToPreviousChar();
	}
};

JkXmlMarkupLanguageParser.prototype.peek = function() {
	if(this.nextQueue != null) {
		return this.nextQueue;
	}
	this.nextQueue = this.next();
	return this.nextQueue;
};

JkXmlMarkupLanguageParser.prototype.next = function() {
	if(this.nextQueue != null) {
		var v = this.nextQueue;
		this.nextQueue = null;
		return v;
	}
	var pos = this.currentPosition;
	var qot = false;
	while(this.it.hasEnded() == false){
		var cbp = this.currentPosition;
		var nxb = this.getNextChar();
		if(nxb < 1) {
			continue;
		}
		if(this.tag != null) {
			if(nxb == '>'.charCodeAt() && !qot) {
				var ts = this.tag.toString();
				this.tag = null;
				var st = this.onTagString(ts, pos);
				if(JkXmlMarkupLanguageParserStartElement.IS_INSTANCE && JkXmlMarkupLanguageParserStartElement.IS_INSTANCE(st) && this.nextQueue == null && this.isSelfClosing((st.getName()))) {
					var e = JkXmlMarkupLanguageParserEndElement.NEW();
					e.setName((st.getName()));
					e.setPosition((this.it.getCurrentPosition()));
					this.nextQueue = e;
				}
				return st;
			}
			this.tag.appendCharacter(nxb);
			if(nxb == '\"'.charCodeAt()) {
				if(qot) {
					qot = false;
				}
				else {
					qot = true;
				}
			}
			if(nxb == '['.charCodeAt() && this.tag.count() == JkLangString.getLength(this.cdataStart) && JkLangString.equals(this.cdataStart, (this.tag.toString()))) {
				this.tag = null;
				this.cdata = JkLangStringBuilder.NEW();
			}
			else if(nxb == '-'.charCodeAt() && this.tag.count() == JkLangString.getLength(this.commentStart) && JkLangString.equals(this.commentStart, (this.tag.toString()))) {
				this.tag = null;
				this.comment = JkLangStringBuilder.NEW();
			}
		}
		else if(this.cdata != null) {
			var c0 = nxb;
			var c1 = '\0'.charCodeAt();
			var c2 = '\0'.charCodeAt();
			if(c0 == ']'.charCodeAt()) {
				c1 = this.getNextChar();
				if(c1 == ']'.charCodeAt()) {
					c2 = this.getNextChar();
					if(c2 == '>'.charCodeAt()) {
						var dd = this.cdata.toString();
						this.cdata = null;
						var v1 = JkXmlMarkupLanguageParserCharacterData.NEW();
						v1.setPosition(pos);
						v1.setData(dd);
						return v1;
					}
					else {
						this.moveToPreviousChar();
						this.moveToPreviousChar();
						this.cdata.appendCharacter(c0);
					}
				}
				else {
					this.moveToPreviousChar();
					this.cdata.appendCharacter(c0);
				}
			}
			else {
				this.cdata.appendCharacter(c0);
			}
		}
		else if(this.comment != null) {
			var c01 = nxb;
			var c11 = '\0'.charCodeAt();
			var c21 = '\0'.charCodeAt();
			if(c01 == '-'.charCodeAt()) {
				c11 = this.getNextChar();
				if(c11 == '-'.charCodeAt()) {
					c21 = this.getNextChar();
					if(c21 == '>'.charCodeAt()) {
						var ct = this.comment.toString();
						this.comment = null;
						var v2 = JkXmlMarkupLanguageParserComment.NEW();
						v2.setPosition(pos);
						v2.setText(ct);
						return v2;
					}
					else {
						this.moveToPreviousChar();
						this.moveToPreviousChar();
						this.comment.appendCharacter(c01);
					}
				}
				else {
					this.moveToPreviousChar();
					this.comment.appendCharacter(c01);
				}
			}
			else {
				this.comment.appendCharacter(c01);
			}
		}
		else if(nxb == '<'.charCodeAt()) {
			if(this.def != null) {
				var cd = this.def.toString();
				this.def = null;
				if(this.ignoreWhiteSpace && cd != null) {
					if(this.isOnlyWhiteSpace(cd)) {
						cd = null;
						pos = cbp;
					}
				}
				if(cd != null) {
					this.moveToPreviousChar();
					var v3 = JkXmlMarkupLanguageParserTextData.NEW();
					v3.setPosition(pos);
					v3.setData(cd);
					return v3;
				}
			}
			this.tag = JkLangStringBuilder.NEW();
		}
		else {
			if(this.def == null) {
				this.def = JkLangStringBuilder.NEW();
			}
			this.def.appendCharacter(nxb);
		}
	}
	return null;
};

JkXmlMarkupLanguageParser.prototype.isSelfClosing = function(tag) {
	return false;
};

JkXmlMarkupLanguageParser.prototype.getIgnoreWhiteSpace = function() {
	return this.ignoreWhiteSpace;
};

JkXmlMarkupLanguageParser.prototype.setIgnoreWhiteSpace = function(v) {
	this.ignoreWhiteSpace = v;
	return this;
};

JkXmlMarkupLanguageParser.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlMarkupLanguageParser"] === true;
};

let JkXmlXMLParserAdapterPosition = function() {
	this.row = 0;
	this.column = 0;
};

JkXmlXMLParserAdapterPosition.prototype._t = { "JkXmlXMLParserAdapterPosition" : true };
JkXmlXMLParserAdapterPosition.prototype._tobj = JkXmlXMLParserAdapterPosition;

JkXmlXMLParserAdapterPosition.NEW = function() {
	var v = new JkXmlXMLParserAdapterPosition;
	return v.CTOR_JkXmlXMLParserAdapterPosition();
};

JkXmlXMLParserAdapterPosition.prototype.CTOR_JkXmlXMLParserAdapterPosition = function() {
	this.column = 0;
	this.row = 0;
	return this;
};

JkXmlXMLParserAdapterPosition.prototype.getRow = function() {
	return this.row;
};

JkXmlXMLParserAdapterPosition.prototype.setRow = function(v) {
	this.row = v;
	return this;
};

JkXmlXMLParserAdapterPosition.prototype.getColumn = function() {
	return this.column;
};

JkXmlXMLParserAdapterPosition.prototype.setColumn = function(v) {
	this.column = v;
	return this;
};

JkXmlXMLParserAdapterPosition.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlXMLParserAdapterPosition"] === true;
};

let JkXmlXMLParserAdapterStringElement = function() {
	this.name = null;
	this.params = null;
	this.content = null;
};

JkXmlXMLParserAdapterStringElement.prototype._t = { "JkXmlXMLParserAdapterStringElement" : true };
JkXmlXMLParserAdapterStringElement.prototype._tobj = JkXmlXMLParserAdapterStringElement;

JkXmlXMLParserAdapterStringElement.NEW = function() {
	var v = new JkXmlXMLParserAdapterStringElement;
	return v.CTOR_JkXmlXMLParserAdapterStringElement();
};

JkXmlXMLParserAdapterStringElement.prototype.CTOR_JkXmlXMLParserAdapterStringElement = function() {
	this.content = null;
	this.params = null;
	this.name = null;
	return this;
};

JkXmlXMLParserAdapterStringElement.prototype.getName = function() {
	return this.name;
};

JkXmlXMLParserAdapterStringElement.prototype.setName = function(v) {
	this.name = v;
	return this;
};

JkXmlXMLParserAdapterStringElement.prototype.getParams = function() {
	return this.params;
};

JkXmlXMLParserAdapterStringElement.prototype.setParams = function(v) {
	this.params = v;
	return this;
};

JkXmlXMLParserAdapterStringElement.prototype.getContent = function() {
	return this.content;
};

JkXmlXMLParserAdapterStringElement.prototype.setContent = function(v) {
	this.content = v;
	return this;
};

JkXmlXMLParserAdapterStringElement.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlXMLParserAdapterStringElement"] === true;
};

let JkXmlXMLParserAdapter = function() {
	this.fileName = null;
	this.xmlString = null;
	this.values = null;
	this.lines = null;
	this.currentPosition = 0;
	this.autoSkipTextAndComments = true;
	this.skipCommentsInText = true;
};

JkXmlXMLParserAdapter.prototype._t = { "JkXmlXMLParserAdapter" : true };
JkXmlXMLParserAdapter.prototype._tobj = JkXmlXMLParserAdapter;

JkXmlXMLParserAdapter.NEW = function() {
	var v = new JkXmlXMLParserAdapter;
	return v.CTOR_JkXmlXMLParserAdapter();
};

JkXmlXMLParserAdapter.prototype.CTOR_JkXmlXMLParserAdapter = function() {
	this.skipCommentsInText = true;
	this.autoSkipTextAndComments = true;
	this.currentPosition = 0;
	this.lines = null;
	this.values = null;
	this.xmlString = null;
	this.fileName = null;
	return this;
};

JkXmlXMLParserAdapter.prototype.initializeForFile = function(file, fileName) {
	if(!(file != null)) {
		return false;
	}
	var fn = fileName;
	if(fn == null) {
		fn = file.getPath();
	}
	var buffer = file.getContentsBuffer();
	if(!(buffer != null)) {
		return false;
	}
	var text = JkTextStringBufferDecoder.decodeBufferWithBOM(buffer, false);
	if(!(text != null)) {
		return false;
	}
	return this.initializeForString(text, fn);
};

JkXmlXMLParserAdapter.prototype.initializeForString = function(text, fileName) {
	if(!(text != null)) {
		return false;
	}
	var pp = JkXmlXMLParser.forString(text);
	if(!(pp != null)) {
		return false;
	}
	this.setFileName(fileName);
	this.setXmlString(text);
	this.initialize(pp);
	return true;
};

JkXmlXMLParserAdapter.prototype.executeForFile = function(ctx, file, fileName) {
	if(!(file != null)) {
		JkLogLog.error(ctx, "null file");
		return false;
	}
	if(!this.initializeForFile(file, fileName)) {
		JkLogLog.error(ctx, "Failed to process XML file: `" + (JkLangString.safeString((file.getPath()))) + ("'"));
		return false;
	}
	try {
		this.execute();
	}
	catch(e) {
		JkLogLog.error(ctx, (e.toString()));
		return false;
	}
	return true;
};

JkXmlXMLParserAdapter.prototype.executeForString = function(ctx, text, fileName) {
	if(!(text != null)) {
		JkLogLog.error(ctx, "null text");
		return false;
	}
	if(!this.initializeForString(text, fileName)) {
		JkLogLog.error(ctx, "Failed to process XML string");
		return false;
	}
	try {
		this.execute();
	}
	catch(e) {
		JkLogLog.error(ctx, (e.toString()));
		return false;
	}
	return true;
};

JkXmlXMLParserAdapter.prototype.initialize = function(parser) {
	this.values = new Array;
	if(parser != null) {
		var first = true;
		while(true){
			var vv = parser.next();
			if(!(vv != null)) {
				break;
			}
			if(first) {
				if(JkXmlMarkupLanguageParserCharacterData.IS_INSTANCE && JkXmlMarkupLanguageParserCharacterData.IS_INSTANCE(vv) || JkXmlMarkupLanguageParserComment.IS_INSTANCE && JkXmlMarkupLanguageParserComment.IS_INSTANCE(vv) || JkXmlMarkupLanguageParserTextData.IS_INSTANCE && JkXmlMarkupLanguageParserTextData.IS_INSTANCE(vv)) {
					;
				}
				else if(JkXmlMarkupLanguageParserStartElement.IS_INSTANCE && JkXmlMarkupLanguageParserStartElement.IS_INSTANCE(vv) && vv.getName() == "?xml") {
					first = false;
					continue;
				}
				else {
					first = false;
				}
			}
			this.values.push(vv);
		}
	}
	this.currentPosition = 0;
};

JkXmlXMLParserAdapter.prototype.expect = function(text) {
	this.error("Expecting: " + (JkLangString.safeString(text)));
};

JkXmlXMLParserAdapter.prototype.unsupported = function(element) {
	if(element != null) {
		this.error("Unsupported element inside `" + (JkLangString.safeString((element.getName()))) + ("'"));
	}
	else {
		this.error("Unsupported element");
	}
};

JkXmlXMLParserAdapter.prototype.error = function(message) {
	var sb = JkLangStringBuilder.NEW();
	var value = this.parserPeek();
	if(value != null) {
		var name = this.getFileName();
		var token = null;
		if(JkXmlMarkupLanguageParserStartElement.IS_INSTANCE && JkXmlMarkupLanguageParserStartElement.IS_INSTANCE(value)) {
			token = value.getName();
		}
		else if(JkXmlMarkupLanguageParserEndElement.IS_INSTANCE && JkXmlMarkupLanguageParserEndElement.IS_INSTANCE(value)) {
			token = "/" + (JkLangString.safeString((value.getName())));
		}
		else if(JkXmlMarkupLanguageParserCharacterData.IS_INSTANCE && JkXmlMarkupLanguageParserCharacterData.IS_INSTANCE(value)) {
			token = value.getData();
		}
		else if(JkXmlMarkupLanguageParserTextData.IS_INSTANCE && JkXmlMarkupLanguageParserTextData.IS_INSTANCE(value)) {
			token = value.getData();
		}
		else if(JkXmlMarkupLanguageParserComment.IS_INSTANCE && JkXmlMarkupLanguageParserComment.IS_INSTANCE(value)) {
			token = "<!-- " + (JkLangString.safeString((value.getText()))) + (" -->");
		}
		else {
			token = "(unknown)";
		}
		var pp = JkXmlXMLParserAdapterPosition.NEW();
		this.calculatePosition((value.getPosition()), pp);
		var lineNumber = pp.getRow();
		var columnNumber = pp.getColumn();
		var contentLine = this.getContentLine((pp.getRow()));
		sb.appendString(name);
		if(lineNumber >= 0) {
			sb.appendCharacter(':'.charCodeAt());
			sb.appendInteger((lineNumber + 1));
			if(columnNumber >= 0) {
				sb.appendCharacter(':'.charCodeAt());
				sb.appendInteger((columnNumber + 1));
			}
		}
		if(JkLangString.isEmpty(token) == false) {
			sb.appendString(" (`");
			sb.appendString(token);
			sb.appendString("')");
		}
		sb.appendString(": ");
		sb.appendString(message);
		if(contentLine != null) {
			sb.appendCharacter('\n'.charCodeAt());
			var it = JkLangString.iterate(contentLine);
			var c = '\0'.charCodeAt();
			while((c = it.getNextChar()) > 0){
				if(c == '\t'.charCodeAt()) {
					sb.appendCharacter(' '.charCodeAt());
				}
				else {
					sb.appendCharacter(c);
				}
			}
			if(columnNumber >= 0) {
				sb.appendCharacter('\n'.charCodeAt());
				var n = 0;
				for(n = 0 ; n < columnNumber ; n++) {
					sb.appendCharacter(' '.charCodeAt());
				}
				sb.appendCharacter('^'.charCodeAt());
			}
		}
		else {
			sb.appendString("\n\t(no reference content)\n");
		}
	}
	else {
		sb.appendString(message);
	}
	throw JkLangExceptionWithString.forString((sb.toString()), false);
};

JkXmlXMLParserAdapter.prototype.isEmptyString = function(string) {
	if(JkLangString.isEmpty(string)) {
		return true;
	}
	var it = JkLangString.iterate(string);
	while(it != null){
		var c = it.getNextChar();
		if(c < 1) {
			break;
		}
		if(c == ' '.charCodeAt() || c == '\t'.charCodeAt() || c == '\r'.charCodeAt() || c == '\n'.charCodeAt()) {
			continue;
		}
		return false;
	}
	return true;
};

JkXmlXMLParserAdapter.prototype.parserPeek = function() {
	if(!(this.values != null)) {
		return null;
	}
	if(!(this.currentPosition >= 0)) {
		return null;
	}
	if(!(this.currentPosition < JkLangVector.getSize(this.values))) {
		return null;
	}
	return this.values[this.currentPosition];
};

JkXmlXMLParserAdapter.prototype.parserNext = function() {
	var v = this.parserPeek();
	if(v != null) {
		this.currentPosition++;
	}
	return v;
};

JkXmlXMLParserAdapter.prototype.parserPrev = function() {
	if(this.currentPosition < 1) {
		return null;
	}
	this.currentPosition--;
	return this.parserPeek();
};

JkXmlXMLParserAdapter.prototype.acceptStartElement = function(name) {
	var oo = this.getCurrentPosition();
	if(this.autoSkipTextAndComments) {
		this.skipTextAndComments();
	}
	var nn = (function(o) {
		if(JkXmlMarkupLanguageParserStartElement.IS_INSTANCE && JkXmlMarkupLanguageParserStartElement.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((this.parserPeek()));
	if(!(nn != null)) {
		return null;
	}
	if(name == null || nn.getName() == name) {
		this.parserNext();
		return nn;
	}
	this.setCurrentPosition(oo);
	return null;
};

JkXmlXMLParserAdapter.prototype.parseStartElement = function(name) {
	var v = this.acceptStartElement(name);
	if(!(v != null)) {
		if(name != null) {
			this.expect("Start element `" + (JkLangString.safeString(name)) + ("'"));
		}
		else {
			this.expect("Start element");
		}
	}
	return v;
};

JkXmlXMLParserAdapter.prototype.acceptAnyEndElement = function() {
	return this.acceptEndElementWithName(null);
};

JkXmlXMLParserAdapter.prototype.acceptEndElementWithName = function(name) {
	var oo = this.getCurrentPosition();
	if(this.autoSkipTextAndComments) {
		this.skipTextAndComments();
	}
	var nn = (function(o) {
		if(JkXmlMarkupLanguageParserEndElement.IS_INSTANCE && JkXmlMarkupLanguageParserEndElement.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((this.parserPeek()));
	if(!(nn != null)) {
		return null;
	}
	if(name == null || nn.getName() == name) {
		this.parserNext();
		return nn;
	}
	this.setCurrentPosition(oo);
	return null;
};

JkXmlXMLParserAdapter.prototype.acceptEndElement = function(element) {
	if(!(element != null)) {
		return this.acceptEndElementWithName(null);
	}
	return this.acceptEndElementWithName((element.getName()));
};

JkXmlXMLParserAdapter.prototype.parseAnyEndElement = function() {
	return this.parseEndElementWithName(null);
};

JkXmlXMLParserAdapter.prototype.parseEndElementWithName = function(name) {
	var v = this.acceptEndElementWithName(name);
	if(!(v != null)) {
		if(name != null) {
			this.expect("End element `" + (JkLangString.safeString(name)) + ("'"));
		}
		else {
			this.expect("End element");
		}
	}
	return v;
};

JkXmlXMLParserAdapter.prototype.parseEndElement = function(element) {
	if(!(element != null)) {
		return this.parseEndElementWithName(null);
	}
	return this.parseEndElementWithName((element.getName()));
};

JkXmlXMLParserAdapter.prototype.acceptSingleElement = function(name) {
	var oo = this.getCurrentPosition();
	var element = this.acceptStartElement(name);
	if(!(element != null)) {
		return null;
	}
	if(!(this.acceptEndElementWithName(name) != null)) {
		this.setCurrentPosition(oo);
		return null;
	}
	return element;
};

JkXmlXMLParserAdapter.prototype.parseSingleElement = function(name) {
	var v = this.acceptSingleElement(name);
	if(!(v != null)) {
		if(name != null) {
			this.expect("Single element: `" + (JkLangString.safeString(name)) + ("'"));
		}
		else {
			this.expect("Single element");
		}
	}
	return v;
};

JkXmlXMLParserAdapter.prototype.acceptStringElement = function(tagName) {
	var oo = this.getCurrentPosition();
	var start = this.acceptStartElement(tagName);
	if(!(start != null)) {
		return null;
	}
	var str = this.acceptText(false);
	var end = this.acceptEndElementWithName((start.getName()));
	if(!(end != null)) {
		this.setCurrentPosition(oo);
		return null;
	}
	if(!(str != null)) {
		str = "";
	}
	var v = JkXmlXMLParserAdapterStringElement.NEW();
	v.setName((start.getName()));
	v.setParams((start.getParams()));
	v.setContent(str);
	return v;
};

JkXmlXMLParserAdapter.prototype.parseStringElement = function(tagName) {
	var v = this.acceptStringElement(tagName);
	if(!(v != null)) {
		this.expect("String element");
		return null;
	}
	return v;
};

JkXmlXMLParserAdapter.prototype.acceptStringElementData = function(tagName) {
	var v = this.acceptStringElement(tagName);
	if(!(v != null)) {
		return null;
	}
	return v.getContent();
};

JkXmlXMLParserAdapter.prototype.parseStringElementData = function(tagName) {
	var v = this.acceptStringElementData(tagName);
	if(!(v != null)) {
		this.expect("String element");
		return null;
	}
	return v;
};

JkXmlXMLParserAdapter.prototype.acceptElementTree = function(name, startHandler, childHandler) {
	var element = this.acceptStartElement(name);
	if(!(element != null)) {
		return false;
	}
	if(startHandler != null) {
		startHandler(element);
	}
	while(true){
		if(childHandler != null && childHandler()) {
			continue;
		}
		if(this.acceptEndElement(element) != null) {
			break;
		}
		this.unsupported(element);
	}
	return true;
};

JkXmlXMLParserAdapter.prototype.acceptText = function(force) {
	var sb = null;
	while(true){
		var cc = this.parserPeek();
		if(!(cc != null)) {
			break;
		}
		if(this.skipCommentsInText) {
			if(JkXmlMarkupLanguageParserComment.IS_INSTANCE && JkXmlMarkupLanguageParserComment.IS_INSTANCE(cc)) {
				this.parserNext();
				continue;
			}
		}
		if(JkXmlMarkupLanguageParserCharacterData.IS_INSTANCE && JkXmlMarkupLanguageParserCharacterData.IS_INSTANCE(cc) || JkXmlMarkupLanguageParserTextData.IS_INSTANCE && JkXmlMarkupLanguageParserTextData.IS_INSTANCE(cc)) {
			var txt = this.getTextData(cc);
			if(JkLangString.isNotEmpty(txt)) {
				if(sb == null) {
					sb = JkLangStringBuilder.NEW();
				}
				sb.appendString(txt);
			}
			this.parserNext();
			continue;
		}
		break;
	}
	if(sb == null) {
		if(force) {
			return "";
		}
		return null;
	}
	var v = sb.toString();
	if(v == null && force) {
		return "";
	}
	return v;
};

JkXmlXMLParserAdapter.prototype.parseText = function() {
	var v = this.acceptText(false);
	if(!(v != null)) {
		v = "";
	}
	return v;
};

JkXmlXMLParserAdapter.prototype.skipTextAndComments = function() {
	while(true){
		var cc = this.parserPeek();
		if(!(cc != null)) {
			break;
		}
		if(JkXmlMarkupLanguageParserComment.IS_INSTANCE && JkXmlMarkupLanguageParserComment.IS_INSTANCE(cc)) {
			this.parserNext();
			continue;
		}
		if(JkXmlMarkupLanguageParserCharacterData.IS_INSTANCE && JkXmlMarkupLanguageParserCharacterData.IS_INSTANCE(cc) || JkXmlMarkupLanguageParserTextData.IS_INSTANCE && JkXmlMarkupLanguageParserTextData.IS_INSTANCE(cc)) {
			var txt = this.getTextData(cc);
			if(this.isEmptyString(txt)) {
				this.parserNext();
				continue;
			}
		}
		break;
	}
};

JkXmlXMLParserAdapter.prototype.acceptKeyValuePair = function() {
	var oo = this.getCurrentPosition();
	var ss = this.acceptStartElement(null);
	if(!(ss != null)) {
		this.setCurrentPosition(oo);
		return null;
	}
	var tt = this.acceptText(false);
	if(!(tt != null)) {
		this.setCurrentPosition(oo);
		return null;
	}
	var ee = this.acceptEndElementWithName((ss.getName()));
	if(!(ee != null)) {
		this.setCurrentPosition(oo);
		return null;
	}
	var v = JkLangKeyValuePair.NEW();
	v.key = ss.getName();
	v.value = tt;
	return v;
};

JkXmlXMLParserAdapter.prototype.parseKeyValuePair = function() {
	var v = this.acceptKeyValuePair();
	if(!(v != null)) {
		this.expect("Key/value pair");
	}
	return v;
};

JkXmlXMLParserAdapter.prototype.calculatePosition = function(pos, result) {
	if(!(result != null)) {
		return;
	}
	result.setRow(0);
	result.setColumn(0);
	var text = this.getXmlString();
	if(text != null) {
		var p = 0;
		var nr = 0;
		var nc = 0;
		var it = JkLangString.iterate(text);
		while(it != null){
			if(p == pos) {
				result.setRow(nr);
				result.setColumn(nc);
				break;
			}
			var c = it.getNextChar();
			if(c < 1) {
				break;
			}
			if(c == '\n'.charCodeAt()) {
				nr++;
				nc = 0;
			}
			else {
				nc++;
			}
			p++;
		}
	}
};

JkXmlXMLParserAdapter.prototype.getTextData = function(elem) {
	if(JkXmlMarkupLanguageParserCharacterData.IS_INSTANCE && JkXmlMarkupLanguageParserCharacterData.IS_INSTANCE(elem)) {
		return elem.getData();
	}
	if(JkXmlMarkupLanguageParserTextData.IS_INSTANCE && JkXmlMarkupLanguageParserTextData.IS_INSTANCE(elem)) {
		return elem.getData();
	}
	return null;
};

JkXmlXMLParserAdapter.prototype.getLines = function() {
	if(!(this.lines != null)) {
		var text = this.getXmlString();
		if(text != null) {
			this.lines = JkLangString.split(text, '\n'.charCodeAt(), 0);
		}
	}
	return this.lines;
};

JkXmlXMLParserAdapter.prototype.getContentLine = function(n) {
	if(n < 0) {
		return null;
	}
	var lines = this.getLines();
	if(!(lines != null)) {
		return null;
	}
	if(n < 0 || n >= JkLangVector.getSize(lines)) {
		return null;
	}
	return lines[n];
};

JkXmlXMLParserAdapter.prototype.execute = function() {};

JkXmlXMLParserAdapter.prototype.getFileName = function() {
	return this.fileName;
};

JkXmlXMLParserAdapter.prototype.setFileName = function(v) {
	this.fileName = v;
	return this;
};

JkXmlXMLParserAdapter.prototype.getXmlString = function() {
	return this.xmlString;
};

JkXmlXMLParserAdapter.prototype.setXmlString = function(v) {
	this.xmlString = v;
	return this;
};

JkXmlXMLParserAdapter.prototype.getCurrentPosition = function() {
	return this.currentPosition;
};

JkXmlXMLParserAdapter.prototype.setCurrentPosition = function(v) {
	this.currentPosition = v;
	return this;
};

JkXmlXMLParserAdapter.prototype.getAutoSkipTextAndComments = function() {
	return this.autoSkipTextAndComments;
};

JkXmlXMLParserAdapter.prototype.setAutoSkipTextAndComments = function(v) {
	this.autoSkipTextAndComments = v;
	return this;
};

JkXmlXMLParserAdapter.prototype.getSkipCommentsInText = function() {
	return this.skipCommentsInText;
};

JkXmlXMLParserAdapter.prototype.setSkipCommentsInText = function(v) {
	this.skipCommentsInText = v;
	return this;
};

JkXmlXMLParserAdapter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlXMLParserAdapter"] === true;
};

let JkXmlHTMLParser = function() {
	JkXmlMarkupLanguageParser.call(this);
	this.emptyTags = null;
};

JkXmlHTMLParser.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkXmlMarkupLanguageParser.prototype);
JkXmlHTMLParser.prototype.constructor = JkXmlHTMLParser;
JkXmlHTMLParser.prototype._t = {
	"JkXmlMarkupLanguageParser" : true,
	"JkXmlHTMLParser" : true
};
JkXmlHTMLParser.prototype._tobj = JkXmlHTMLParser;

JkXmlHTMLParser.NEW = function() {
	var v = new JkXmlHTMLParser;
	return v.CTOR_JkXmlHTMLParser();
};

JkXmlHTMLParser.prototype.CTOR_JkXmlHTMLParser = function() {
	this.emptyTags = null;
	if(JkXmlMarkupLanguageParser.prototype.CTOR_JkXmlMarkupLanguageParser.call(this) == null) {
		return null;
	}
	return this;
};

JkXmlHTMLParser.forString = function(string) {
	if(!(string != null)) {
		return null;
	}
	var v = JkXmlHTMLParser.NEW();
	v.it = JkLangCharacterIteratorForString.forString(string);
	return v;
};

JkXmlHTMLParser.parseAsVectorObject = function(xml, ignoreWhiteSpace) {
	var root = null;
	var stack = JkLangStack.NEW();
	var pp = JkXmlHTMLParser.forString(xml);
	pp.setIgnoreWhiteSpace(ignoreWhiteSpace);
	while(true){
		var o = pp.next();
		if(o == null) {
			break;
		}
		if(JkXmlMarkupLanguageParserStartElement.IS_INSTANCE && JkXmlMarkupLanguageParserStartElement.IS_INSTANCE(o)) {
			var name = o.getName();
			if(name == "?xml") {
				continue;
			}
			var nn = JkLangDynamicMap.NEW();
			nn.setString("name", name);
			nn.setObject("attributes", (o.getParams()));
			if(stack.isEmpty()) {
				stack.push(nn);
			}
			else {
				var current = stack.peek();
				var children = current.getDynamicVector("children");
				if(children == null) {
					children = JkLangDynamicVector.NEW();
					current.setObject("children", children);
				}
				children.appendObject(nn);
				stack.push(nn);
			}
		}
		else if(JkXmlMarkupLanguageParserEndElement.IS_INSTANCE && JkXmlMarkupLanguageParserEndElement.IS_INSTANCE(o)) {
			var e = stack.pop();
			if(stack.isEmpty()) {
				if(root == null) {
					root = JkLangDynamicVector.NEW();
				}
				root.appendObject(e);
			}
		}
		else if(JkXmlMarkupLanguageParserTextData.IS_INSTANCE && JkXmlMarkupLanguageParserTextData.IS_INSTANCE(o)) {
			var current1 = stack.peek();
			if(current1 != null) {
				var children1 = current1.getDynamicVector("children");
				if(children1 == null) {
					children1 = JkLangDynamicVector.NEW();
					current1.setObject("children", children1);
				}
				children1.appendObject((o.getData()));
			}
		}
	}
	return root;
};

JkXmlHTMLParser.prototype.isSelfClosing = function(tag) {
	if(this.emptyTags == null) {
		this.emptyTags = JkLangStringSet.NEW();
		this.emptyTags.add("!doctype");
		this.emptyTags.add("area");
		this.emptyTags.add("base");
		this.emptyTags.add("br");
		this.emptyTags.add("col");
		this.emptyTags.add("embed");
		this.emptyTags.add("hr");
		this.emptyTags.add("img");
		this.emptyTags.add("input");
		this.emptyTags.add("link");
		this.emptyTags.add("meta");
		this.emptyTags.add("param");
		this.emptyTags.add("source");
		this.emptyTags.add("track");
		this.emptyTags.add("wbr");
	}
	return this.emptyTags.contains(tag);
};

JkXmlHTMLParser.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlHTMLParser"] === true;
};

let JkXmlMarkupLanguageParserValue = function() {
	this.position = 0;
};

JkXmlMarkupLanguageParserValue.prototype._t = { "JkXmlMarkupLanguageParserValue" : true };
JkXmlMarkupLanguageParserValue.prototype._tobj = JkXmlMarkupLanguageParserValue;

JkXmlMarkupLanguageParserValue.NEW = function() {
	var v = new JkXmlMarkupLanguageParserValue;
	return v.CTOR_JkXmlMarkupLanguageParserValue();
};

JkXmlMarkupLanguageParserValue.prototype.CTOR_JkXmlMarkupLanguageParserValue = function() {
	this.position = 0;
	return this;
};

JkXmlMarkupLanguageParserValue.prototype.getPosition = function() {
	return this.position;
};

JkXmlMarkupLanguageParserValue.prototype.setPosition = function(v) {
	this.position = v;
	return this;
};

JkXmlMarkupLanguageParserValue.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlMarkupLanguageParserValue"] === true;
};

let JkXmlMarkupLanguageParserTextData = function() {
	JkXmlMarkupLanguageParserValue.call(this);
	this.data = null;
};

JkXmlMarkupLanguageParserTextData.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkXmlMarkupLanguageParserValue.prototype);
JkXmlMarkupLanguageParserTextData.prototype.constructor = JkXmlMarkupLanguageParserTextData;
JkXmlMarkupLanguageParserTextData.prototype._t = {
	"JkXmlMarkupLanguageParserTextData" : true,
	"JkXmlMarkupLanguageParserValue" : true
};
JkXmlMarkupLanguageParserTextData.prototype._tobj = JkXmlMarkupLanguageParserTextData;

JkXmlMarkupLanguageParserTextData.NEW = function() {
	var v = new JkXmlMarkupLanguageParserTextData;
	return v.CTOR_JkXmlMarkupLanguageParserTextData();
};

JkXmlMarkupLanguageParserTextData.prototype.CTOR_JkXmlMarkupLanguageParserTextData = function() {
	this.data = null;
	if(JkXmlMarkupLanguageParserValue.prototype.CTOR_JkXmlMarkupLanguageParserValue.call(this) == null) {
		return null;
	}
	return this;
};

JkXmlMarkupLanguageParserTextData.prototype.getData = function() {
	return this.data;
};

JkXmlMarkupLanguageParserTextData.prototype.setData = function(v) {
	this.data = v;
	return this;
};

JkXmlMarkupLanguageParserTextData.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlMarkupLanguageParserTextData"] === true;
};

let JkXmlMarkupLanguageParserCharacterData = function() {
	JkXmlMarkupLanguageParserValue.call(this);
	this.data = null;
};

JkXmlMarkupLanguageParserCharacterData.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkXmlMarkupLanguageParserValue.prototype);
JkXmlMarkupLanguageParserCharacterData.prototype.constructor = JkXmlMarkupLanguageParserCharacterData;
JkXmlMarkupLanguageParserCharacterData.prototype._t = {
	"JkXmlMarkupLanguageParserValue" : true,
	"JkXmlMarkupLanguageParserCharacterData" : true
};
JkXmlMarkupLanguageParserCharacterData.prototype._tobj = JkXmlMarkupLanguageParserCharacterData;

JkXmlMarkupLanguageParserCharacterData.NEW = function() {
	var v = new JkXmlMarkupLanguageParserCharacterData;
	return v.CTOR_JkXmlMarkupLanguageParserCharacterData();
};

JkXmlMarkupLanguageParserCharacterData.prototype.CTOR_JkXmlMarkupLanguageParserCharacterData = function() {
	this.data = null;
	if(JkXmlMarkupLanguageParserValue.prototype.CTOR_JkXmlMarkupLanguageParserValue.call(this) == null) {
		return null;
	}
	return this;
};

JkXmlMarkupLanguageParserCharacterData.prototype.getData = function() {
	return this.data;
};

JkXmlMarkupLanguageParserCharacterData.prototype.setData = function(v) {
	this.data = v;
	return this;
};

JkXmlMarkupLanguageParserCharacterData.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlMarkupLanguageParserCharacterData"] === true;
};

let JkXmlMarkupLanguageParserEndElement = function() {
	JkXmlMarkupLanguageParserValue.call(this);
	this.name = null;
};

JkXmlMarkupLanguageParserEndElement.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkXmlMarkupLanguageParserValue.prototype);
JkXmlMarkupLanguageParserEndElement.prototype.constructor = JkXmlMarkupLanguageParserEndElement;
JkXmlMarkupLanguageParserEndElement.prototype._t = {
	"JkXmlMarkupLanguageParserEndElement" : true,
	"JkXmlMarkupLanguageParserValue" : true
};
JkXmlMarkupLanguageParserEndElement.prototype._tobj = JkXmlMarkupLanguageParserEndElement;

JkXmlMarkupLanguageParserEndElement.NEW = function() {
	var v = new JkXmlMarkupLanguageParserEndElement;
	return v.CTOR_JkXmlMarkupLanguageParserEndElement();
};

JkXmlMarkupLanguageParserEndElement.prototype.CTOR_JkXmlMarkupLanguageParserEndElement = function() {
	this.name = null;
	if(JkXmlMarkupLanguageParserValue.prototype.CTOR_JkXmlMarkupLanguageParserValue.call(this) == null) {
		return null;
	}
	return this;
};

JkXmlMarkupLanguageParserEndElement.prototype.getName = function() {
	return this.name;
};

JkXmlMarkupLanguageParserEndElement.prototype.setName = function(v) {
	this.name = v;
	return this;
};

JkXmlMarkupLanguageParserEndElement.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlMarkupLanguageParserEndElement"] === true;
};

let JkXmlMarkupLanguageParserStartElement = function() {
	JkXmlMarkupLanguageParserValue.call(this);
	this.name = null;
	this.params = null;
};

JkXmlMarkupLanguageParserStartElement.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkXmlMarkupLanguageParserValue.prototype);
JkXmlMarkupLanguageParserStartElement.prototype.constructor = JkXmlMarkupLanguageParserStartElement;
JkXmlMarkupLanguageParserStartElement.prototype._t = {
	"JkXmlMarkupLanguageParserStartElement" : true,
	"JkXmlMarkupLanguageParserValue" : true
};
JkXmlMarkupLanguageParserStartElement.prototype._tobj = JkXmlMarkupLanguageParserStartElement;

JkXmlMarkupLanguageParserStartElement.NEW = function() {
	var v = new JkXmlMarkupLanguageParserStartElement;
	return v.CTOR_JkXmlMarkupLanguageParserStartElement();
};

JkXmlMarkupLanguageParserStartElement.prototype.CTOR_JkXmlMarkupLanguageParserStartElement = function() {
	this.params = null;
	this.name = null;
	if(JkXmlMarkupLanguageParserValue.prototype.CTOR_JkXmlMarkupLanguageParserValue.call(this) == null) {
		return null;
	}
	return this;
};

JkXmlMarkupLanguageParserStartElement.prototype.getParam = function(pname) {
	if(!(this.params != null)) {
		return null;
	}
	return this.params.getString(pname, null);
};

JkXmlMarkupLanguageParserStartElement.prototype.getName = function() {
	return this.name;
};

JkXmlMarkupLanguageParserStartElement.prototype.setName = function(v) {
	this.name = v;
	return this;
};

JkXmlMarkupLanguageParserStartElement.prototype.getParams = function() {
	return this.params;
};

JkXmlMarkupLanguageParserStartElement.prototype.setParams = function(v) {
	this.params = v;
	return this;
};

JkXmlMarkupLanguageParserStartElement.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlMarkupLanguageParserStartElement"] === true;
};

let JkXmlMarkupLanguageParserComment = function() {
	JkXmlMarkupLanguageParserValue.call(this);
	this.text = null;
};

JkXmlMarkupLanguageParserComment.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkXmlMarkupLanguageParserValue.prototype);
JkXmlMarkupLanguageParserComment.prototype.constructor = JkXmlMarkupLanguageParserComment;
JkXmlMarkupLanguageParserComment.prototype._t = {
	"JkXmlMarkupLanguageParserValue" : true,
	"JkXmlMarkupLanguageParserComment" : true
};
JkXmlMarkupLanguageParserComment.prototype._tobj = JkXmlMarkupLanguageParserComment;

JkXmlMarkupLanguageParserComment.NEW = function() {
	var v = new JkXmlMarkupLanguageParserComment;
	return v.CTOR_JkXmlMarkupLanguageParserComment();
};

JkXmlMarkupLanguageParserComment.prototype.CTOR_JkXmlMarkupLanguageParserComment = function() {
	this.text = null;
	if(JkXmlMarkupLanguageParserValue.prototype.CTOR_JkXmlMarkupLanguageParserValue.call(this) == null) {
		return null;
	}
	return this;
};

JkXmlMarkupLanguageParserComment.prototype.getText = function() {
	return this.text;
};

JkXmlMarkupLanguageParserComment.prototype.setText = function(v) {
	this.text = v;
	return this;
};

JkXmlMarkupLanguageParserComment.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlMarkupLanguageParserComment"] === true;
};

let JkXmlXMLParser = function() {
	JkXmlMarkupLanguageParser.call(this);
};

JkXmlXMLParser.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkXmlMarkupLanguageParser.prototype);
JkXmlXMLParser.prototype.constructor = JkXmlXMLParser;
JkXmlXMLParser.prototype._t = {
	"JkXmlXMLParser" : true,
	"JkXmlMarkupLanguageParser" : true
};
JkXmlXMLParser.prototype._tobj = JkXmlXMLParser;

JkXmlXMLParser.NEW = function() {
	var v = new JkXmlXMLParser;
	return v.CTOR_JkXmlXMLParser();
};

JkXmlXMLParser.prototype.CTOR_JkXmlXMLParser = function() {
	if(JkXmlMarkupLanguageParser.prototype.CTOR_JkXmlMarkupLanguageParser.call(this) == null) {
		return null;
	}
	return this;
};

JkXmlXMLParser.forFile = function(file) {
	if(!(file != null)) {
		return null;
	}
	var reader = file.read();
	if(!(reader != null)) {
		return null;
	}
	var v = JkXmlXMLParser.NEW();
	v.it = JkIoCharacterIteratorForReader.NEW_JkIoReader(reader);
	return v;
};

JkXmlXMLParser.forString = function(string) {
	if(!(string != null)) {
		return null;
	}
	var v = JkXmlXMLParser.NEW();
	v.it = JkLangCharacterIteratorForString.forString(string);
	return v;
};

JkXmlXMLParser.forIterator = function(it) {
	if(!(it != null)) {
		return null;
	}
	var v = JkXmlXMLParser.NEW();
	v.it = it;
	return v;
};

JkXmlXMLParser.parseAsTreeObject = function(xml, ignoreWhiteSpace) {
	var root = null;
	var stack = JkLangStack.NEW();
	var pp = JkXmlXMLParser.forString(xml);
	pp.setIgnoreWhiteSpace(ignoreWhiteSpace);
	while(true){
		var o = pp.next();
		if(o == null) {
			break;
		}
		if(JkXmlMarkupLanguageParserStartElement.IS_INSTANCE && JkXmlMarkupLanguageParserStartElement.IS_INSTANCE(o)) {
			var name = o.getName();
			if(root == null && name == "?xml") {
				continue;
			}
			var nn = JkLangDynamicMap.NEW();
			nn.setString("name", name);
			nn.setObject("attributes", (o.getParams()));
			if(root == null) {
				root = nn;
				stack.push(nn);
			}
			else {
				var current = stack.peek();
				if(current == null) {
					current = root;
				}
				var children = current.getDynamicVector("children");
				if(children == null) {
					children = JkLangDynamicVector.NEW();
					current.setObject("children", children);
				}
				children.appendObject(nn);
				stack.push(nn);
			}
		}
		else if(JkXmlMarkupLanguageParserEndElement.IS_INSTANCE && JkXmlMarkupLanguageParserEndElement.IS_INSTANCE(o)) {
			stack.pop();
		}
		else if(JkXmlMarkupLanguageParserCharacterData.IS_INSTANCE && JkXmlMarkupLanguageParserCharacterData.IS_INSTANCE(o) || JkXmlMarkupLanguageParserTextData.IS_INSTANCE && JkXmlMarkupLanguageParserTextData.IS_INSTANCE(o)) {
			var current1 = stack.peek();
			if(current1 != null) {
				var children1 = current1.getDynamicVector("children");
				if(children1 == null) {
					children1 = JkLangDynamicVector.NEW();
					current1.setObject("children", children1);
				}
				var data = null;
				if(JkXmlMarkupLanguageParserCharacterData.IS_INSTANCE && JkXmlMarkupLanguageParserCharacterData.IS_INSTANCE(o)) {
					data = o.getData();
				}
				else {
					data = o.getData();
				}
				children1.appendObject(data);
			}
		}
	}
	return root;
};

JkXmlXMLParser.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlXMLParser"] === true;
};

let JkXmlXMLMakerCustomXML = function() {
	this.string = null;
};

JkXmlXMLMakerCustomXML.prototype._t = { "JkXmlXMLMakerCustomXML" : true };
JkXmlXMLMakerCustomXML.prototype._tobj = JkXmlXMLMakerCustomXML;

JkXmlXMLMakerCustomXML.NEW_String = function(s) {
	var v = new JkXmlXMLMakerCustomXML;
	return v.CTOR_JkXmlXMLMakerCustomXML_String(s);
};

JkXmlXMLMakerCustomXML.prototype.CTOR_JkXmlXMLMakerCustomXML_String = function(s) {
	this.string = null;
	this.string = s;
	return this;
};

JkXmlXMLMakerCustomXML.prototype.getString = function() {
	return this.string;
};

JkXmlXMLMakerCustomXML.prototype.setString = function(v) {
	this.string = v;
	return this;
};

JkXmlXMLMakerCustomXML.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlXMLMakerCustomXML"] === true;
};

let JkXmlXMLMakerStartElement = function() {
	this.name = null;
	this.attributes = null;
	this.single = false;
	this.singleLine = false;
};

JkXmlXMLMakerStartElement.prototype._t = {
	"JkLangStringObject" : true,
	"JkXmlXMLMakerStartElement" : true
};
JkXmlXMLMakerStartElement.prototype._tobj = JkXmlXMLMakerStartElement;

JkXmlXMLMakerStartElement.NEW_String = function(n) {
	var v = new JkXmlXMLMakerStartElement;
	return v.CTOR_JkXmlXMLMakerStartElement_String(n);
};

JkXmlXMLMakerStartElement.prototype.CTOR_JkXmlXMLMakerStartElement_String = function(n) {
	this.singleLine = false;
	this.single = false;
	this.attributes = null;
	this.name = null;
	this.name = n;
	this.attributes = new Map;
	return this;
};

JkXmlXMLMakerStartElement.prototype.attribute = function(key, value) {
	JkLangMap.setValue(this.attributes, key, value);
	return this;
};

JkXmlXMLMakerStartElement.prototype.escapeAttribute = function(str) {
	if(str == null) {
		return str;
	}
	var sb = JkLangStringBuilder.NEW();
	var array = JkLangString.toCharArray(str);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var c = array[n];
			if(c == '&'.charCodeAt()) {
				sb.appendString("&amp;");
			}
			else if(c == '\"'.charCodeAt()) {
				sb.appendString("&quot;");
			}
			else if(c == '<'.charCodeAt()) {
				sb.appendString("&lt;");
			}
			else if(c == '>'.charCodeAt()) {
				sb.appendString("&gt;");
			}
			else {
				sb.appendCharacter(c);
			}
		}
	}
	return sb.toString();
};

JkXmlXMLMakerStartElement.prototype.toString = function() {
	var sb = JkLangStringBuilder.NEW();
	sb.appendCharacter('<'.charCodeAt());
	sb.appendString(this.name);
	var keys = JkLangMap.getKeys(this.attributes);
	if(keys != null) {
		var n = 0;
		var m = keys.length;
		for(n = 0 ; n < m ; n++) {
			var key = keys[n];
			if(key != null) {
				sb.appendCharacter(' '.charCodeAt());
				sb.appendString(key);
				sb.appendCharacter('='.charCodeAt());
				sb.appendCharacter('\"'.charCodeAt());
				var val = this.escapeAttribute((JkLangMap.getValue(this.attributes, key)));
				sb.appendString(val);
				sb.appendCharacter('\"'.charCodeAt());
			}
		}
	}
	if(this.single) {
		sb.appendCharacter(' '.charCodeAt());
		sb.appendCharacter('/'.charCodeAt());
	}
	sb.appendCharacter('>'.charCodeAt());
	return sb.toString();
};

JkXmlXMLMakerStartElement.prototype.getName = function() {
	return this.name;
};

JkXmlXMLMakerStartElement.prototype.setName = function(v) {
	this.name = v;
	return this;
};

JkXmlXMLMakerStartElement.prototype.getAttributes = function() {
	return this.attributes;
};

JkXmlXMLMakerStartElement.prototype.setAttributes = function(v) {
	this.attributes = v;
	return this;
};

JkXmlXMLMakerStartElement.prototype.getSingle = function() {
	return this.single;
};

JkXmlXMLMakerStartElement.prototype.setSingle = function(v) {
	this.single = v;
	return this;
};

JkXmlXMLMakerStartElement.prototype.getSingleLine = function() {
	return this.singleLine;
};

JkXmlXMLMakerStartElement.prototype.setSingleLine = function(v) {
	this.singleLine = v;
	return this;
};

JkXmlXMLMakerStartElement.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlXMLMakerStartElement"] === true;
};

let JkXmlXMLMakerEndElement = function() {
	this.name = null;
};

JkXmlXMLMakerEndElement.prototype._t = {
	"JkXmlXMLMakerEndElement" : true,
	"JkLangStringObject" : true
};
JkXmlXMLMakerEndElement.prototype._tobj = JkXmlXMLMakerEndElement;

JkXmlXMLMakerEndElement.NEW_String = function(n) {
	var v = new JkXmlXMLMakerEndElement;
	return v.CTOR_JkXmlXMLMakerEndElement_String(n);
};

JkXmlXMLMakerEndElement.prototype.CTOR_JkXmlXMLMakerEndElement_String = function(n) {
	this.name = null;
	this.name = n;
	return this;
};

JkXmlXMLMakerEndElement.prototype.toString = function() {
	return "</" + (JkLangString.safeString((JkLangString.safeString((this.getName()))))) + (">");
};

JkXmlXMLMakerEndElement.prototype.getName = function() {
	return this.name;
};

JkXmlXMLMakerEndElement.prototype.setName = function(v) {
	this.name = v;
	return this;
};

JkXmlXMLMakerEndElement.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlXMLMakerEndElement"] === true;
};

let JkXmlXMLMakerElement = function() {
	JkXmlXMLMakerStartElement.call(this);
};

JkXmlXMLMakerElement.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkXmlXMLMakerStartElement.prototype);
JkXmlXMLMakerElement.prototype.constructor = JkXmlXMLMakerElement;
JkXmlXMLMakerElement.prototype._t = {
	"JkXmlXMLMakerElement" : true,
	"JkLangStringObject" : true,
	"JkXmlXMLMakerStartElement" : true
};
JkXmlXMLMakerElement.prototype._tobj = JkXmlXMLMakerElement;

JkXmlXMLMakerElement.NEW_String = function(name) {
	var v = new JkXmlXMLMakerElement;
	return v.CTOR_JkXmlXMLMakerElement_String(name);
};

JkXmlXMLMakerElement.prototype.CTOR_JkXmlXMLMakerElement_String = function(name) {
	if(JkXmlXMLMakerStartElement.prototype.CTOR_JkXmlXMLMakerStartElement_String.call(this, name) == null) {
		return null;
	}
	this.setSingle(true);
	return this;
};

JkXmlXMLMakerElement.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlXMLMakerElement"] === true;
};

let JkXmlXMLMakerCData = function() {
	this.text = null;
	this.simple = false;
	this.singleLine = false;
};

JkXmlXMLMakerCData.prototype._t = {
	"JkXmlXMLMakerCData" : true,
	"JkLangStringObject" : true
};
JkXmlXMLMakerCData.prototype._tobj = JkXmlXMLMakerCData;

JkXmlXMLMakerCData.NEW_String = function(t) {
	var v = new JkXmlXMLMakerCData;
	return v.CTOR_JkXmlXMLMakerCData_String(t);
};

JkXmlXMLMakerCData.prototype.CTOR_JkXmlXMLMakerCData_String = function(t) {
	this.singleLine = false;
	this.simple = false;
	this.text = null;
	this.text = t;
	return this;
};

JkXmlXMLMakerCData.prototype.toString = function() {
	var sb = JkLangStringBuilder.NEW();
	if(this.simple) {
		sb.appendString(this.text);
	}
	else {
		sb.appendString("<![CDATA[");
		sb.appendString(this.text);
		sb.appendString("]]>");
	}
	return sb.toString();
};

JkXmlXMLMakerCData.prototype.getText = function() {
	return this.text;
};

JkXmlXMLMakerCData.prototype.setText = function(v) {
	this.text = v;
	return this;
};

JkXmlXMLMakerCData.prototype.getSimple = function() {
	return this.simple;
};

JkXmlXMLMakerCData.prototype.setSimple = function(v) {
	this.simple = v;
	return this;
};

JkXmlXMLMakerCData.prototype.getSingleLine = function() {
	return this.singleLine;
};

JkXmlXMLMakerCData.prototype.setSingleLine = function(v) {
	this.singleLine = v;
	return this;
};

JkXmlXMLMakerCData.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlXMLMakerCData"] === true;
};

let JkXmlXMLMaker = function() {
	this.elements = null;
	this.customHeader = null;
	this.singleLine = false;
	this.header = null;
	this.indentWithTab = false;
};

JkXmlXMLMaker.prototype._t = {
	"JkLangStringObject" : true,
	"JkXmlXMLMaker" : true
};
JkXmlXMLMaker.prototype._tobj = JkXmlXMLMaker;

JkXmlXMLMaker.NEW = function() {
	var v = new JkXmlXMLMaker;
	return v.CTOR_JkXmlXMLMaker();
};

JkXmlXMLMaker.prototype.CTOR_JkXmlXMLMaker = function() {
	this.indentWithTab = false;
	this.header = null;
	this.singleLine = false;
	this.customHeader = null;
	this.elements = null;
	this.elements = new Array;
	this.header = "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
	return this;
};

JkXmlXMLMaker.prototype.start1 = function(element, singleLine) {
	this.add((JkXmlXMLMakerStartElement.NEW_String(element).setSingleLine(singleLine)));
	return this;
};

JkXmlXMLMaker.prototype.start2 = function(element, k1, v1, singleLine) {
	var v = JkXmlXMLMakerStartElement.NEW_String(element);
	v.setSingleLine(singleLine);
	if(k1 != null) {
		v.attribute(k1, v1);
	}
	this.add(v);
	return this;
};

JkXmlXMLMaker.prototype.start3 = function(element, attrs, singleLine) {
	var v = JkXmlXMLMakerStartElement.NEW_String(element);
	v.setSingleLine(singleLine);
	if(attrs != null) {
		var keys = JkLangMap.getKeys(attrs);
		if(keys != null) {
			var n = 0;
			var m = keys.length;
			for(n = 0 ; n < m ; n++) {
				var key = (function(o) {
					if(typeof(o) === 'string') {
						return o;
					}
					return null;
				}.bind(this))(keys[n]);
				if(key != null) {
					var val = attrs.get(key);
					v.attribute(key, (JkLangString.asString(val)));
				}
			}
		}
	}
	this.add(v);
	return this;
};

JkXmlXMLMaker.prototype.start4 = function(element, attrs, singleLine) {
	if(attrs == null) {
		return this.start3(element, null, singleLine);
	}
	return this.start3(element, (attrs.toObjectMap()), singleLine);
};

JkXmlXMLMaker.prototype.element = function(element, attrs) {
	var v = JkXmlXMLMakerElement.NEW_String(element);
	if(attrs != null) {
		var keys = JkLangMap.getKeys(attrs);
		if(keys != null) {
			var n = 0;
			var m = keys.length;
			for(n = 0 ; n < m ; n++) {
				var key = (function(o) {
					if(typeof(o) === 'string') {
						return o;
					}
					return null;
				}.bind(this))(keys[n]);
				if(key != null) {
					var val = attrs.get(key);
					v.attribute(key, (JkLangString.asString(val)));
				}
			}
		}
	}
	this.add(v);
	return this;
};

JkXmlXMLMaker.prototype.end = function(element) {
	this.add((JkXmlXMLMakerEndElement.NEW_String(element)));
	return this;
};

JkXmlXMLMaker.prototype.text = function(element) {
	this.add(element);
	return this;
};

JkXmlXMLMaker.prototype.cdata = function(element) {
	this.add((JkXmlXMLMakerCData.NEW_String(element)));
	return this;
};

JkXmlXMLMaker.prototype.textElement = function(element, text, attrs) {
	var se = JkXmlXMLMakerStartElement.NEW_String(element);
	se.setSingleLine(true);
	if(attrs != null) {
		var keys = JkLangMap.getKeys(attrs);
		if(keys != null) {
			var n = 0;
			var m = keys.length;
			for(n = 0 ; n < m ; n++) {
				var key = (function(o) {
					if(typeof(o) === 'string') {
						return o;
					}
					return null;
				}.bind(this))(keys[n]);
				if(key != null) {
					var val = attrs.get(key);
					se.attribute(key, (JkLangString.asString(val)));
				}
			}
		}
	}
	this.add(se);
	this.add(text);
	this.add((JkXmlXMLMakerEndElement.NEW_String(element)));
	return this;
};

JkXmlXMLMaker.prototype.add = function(o) {
	if(o != null) {
		JkLangVector.append(this.elements, o);
	}
	return this;
};

JkXmlXMLMaker.prototype.append = function(sb, level, str, noIndent, noNewLine) {
	var n = 0;
	if(this.singleLine == false && noIndent == false) {
		for(n = 0 ; n < level ; n++) {
			if(this.indentWithTab) {
				sb.appendCharacter('\t'.charCodeAt());
			}
			else {
				sb.appendCharacter(' '.charCodeAt());
				sb.appendCharacter(' '.charCodeAt());
			}
		}
	}
	sb.appendString(str);
	if(this.singleLine == false && noNewLine == false) {
		sb.appendCharacter('\n'.charCodeAt());
	}
};

JkXmlXMLMaker.prototype.escapeString = function(str) {
	var sb = JkLangStringBuilder.NEW();
	if(str != null) {
		var array = JkLangString.toCharArray(str);
		if(array != null) {
			var n = 0;
			var m = array.length;
			for(n = 0 ; n < m ; n++) {
				var c = array[n];
				if(c == '\"'.charCodeAt()) {
					sb.appendString("&quot;");
				}
				else if(c == '\''.charCodeAt()) {
					sb.appendString("&apos;");
				}
				else if(c == '<'.charCodeAt()) {
					sb.appendString("&lt;");
				}
				else if(c == '>'.charCodeAt()) {
					sb.appendString("&gt;");
				}
				else if(c == '&'.charCodeAt()) {
					sb.appendString("&amp;");
				}
				else {
					sb.appendCharacter(c);
				}
			}
		}
	}
	return sb.toString();
};

JkXmlXMLMaker.prototype.toString = function() {
	var sb = JkLangStringBuilder.NEW();
	var level = 0;
	if(this.header != null) {
		this.append(sb, level, this.header, false, false);
	}
	if(this.customHeader != null) {
		sb.appendString(this.customHeader);
	}
	var singleLine = false;
	if(this.elements != null) {
		var n = 0;
		var m = this.elements.length;
		for(n = 0 ; n < m ; n++) {
			var o = this.elements[n];
			if(o != null) {
				if(JkXmlXMLMakerElement.IS_INSTANCE && JkXmlXMLMakerElement.IS_INSTANCE(o)) {
					this.append(sb, level, (o.toString()), singleLine, singleLine);
				}
				else if(JkXmlXMLMakerStartElement.IS_INSTANCE && JkXmlXMLMakerStartElement.IS_INSTANCE(o)) {
					singleLine = o.getSingleLine();
					this.append(sb, level, (o.toString()), false, singleLine);
					if(o.getSingle() == false) {
						level++;
					}
				}
				else if(JkXmlXMLMakerEndElement.IS_INSTANCE && JkXmlXMLMakerEndElement.IS_INSTANCE(o)) {
					level--;
					this.append(sb, level, (o.toString()), singleLine, false);
					singleLine = false;
				}
				else if(JkXmlXMLMakerCustomXML.IS_INSTANCE && JkXmlXMLMakerCustomXML.IS_INSTANCE(o)) {
					this.append(sb, level, (o.getString()), singleLine, singleLine);
				}
				else if(typeof(o) === 'string') {
					this.append(sb, level, (this.escapeString(o)), singleLine, singleLine);
				}
				else if(JkXmlXMLMakerCData.IS_INSTANCE && JkXmlXMLMakerCData.IS_INSTANCE(o)) {
					this.append(sb, level, (o.toString()), singleLine, (o.getSingleLine()));
				}
			}
		}
	}
	return sb.toString();
};

JkXmlXMLMaker.prototype.getElements = function() {
	return this.elements;
};

JkXmlXMLMaker.prototype.setElements = function(v) {
	this.elements = v;
	return this;
};

JkXmlXMLMaker.prototype.getCustomHeader = function() {
	return this.customHeader;
};

JkXmlXMLMaker.prototype.setCustomHeader = function(v) {
	this.customHeader = v;
	return this;
};

JkXmlXMLMaker.prototype.getSingleLine = function() {
	return this.singleLine;
};

JkXmlXMLMaker.prototype.setSingleLine = function(v) {
	this.singleLine = v;
	return this;
};

JkXmlXMLMaker.prototype.getHeader = function() {
	return this.header;
};

JkXmlXMLMaker.prototype.setHeader = function(v) {
	this.header = v;
	return this;
};

JkXmlXMLMaker.prototype.getIndentWithTab = function() {
	return this.indentWithTab;
};

JkXmlXMLMaker.prototype.setIndentWithTab = function(v) {
	this.indentWithTab = v;
	return this;
};

JkXmlXMLMaker.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkXmlXMLMaker"] === true;
};
