let JkCsvCSVGenerator = function() {
	this.table = new Array;
	this.fields = new Array;
};

JkCsvCSVGenerator.prototype._t = {
	"JkLangStringObject" : true,
	"JkCsvCSVGenerator" : true
};
JkCsvCSVGenerator.prototype._tobj = JkCsvCSVGenerator;

JkCsvCSVGenerator.NEW = function() {
	var v = new JkCsvCSVGenerator;
	return v.CTOR_JkCsvCSVGenerator();
};

JkCsvCSVGenerator.prototype.CTOR_JkCsvCSVGenerator = function() {
	this.fields = new Array;
	this.table = new Array;
	return this;
};

JkCsvCSVGenerator.prototype.setFields = function(data) {
	this.fields = new Array;
	if(data != null) {
		var n = 0;
		var m = data.length;
		for(n = 0 ; n < m ; n++) {
			var field = data[n];
			if(field != null) {
				this.fields.push(field);
			}
		}
	}
};

JkCsvCSVGenerator.prototype.addHeaderFields = function(data) {
	if(!(this.fields != null)) {
		return;
	}
	if(!JkLangVector.isEmpty(this.table)) {
		return;
	}
	var row = new Array;
	this.fields = new Array;
	if(data != null) {
		var n = 0;
		var m = data.length;
		for(n = 0 ; n < m ; n++) {
			var field = data[n];
			if(field != null) {
				row.push(field);
				this.fields.push(field);
			}
		}
	}
	this.addRow(row);
};

JkCsvCSVGenerator.prototype.addHeaderFromModel = function(record) {
	if(!(record != null)) {
		return;
	}
	if(!JkLangVector.isEmpty(this.table)) {
		return;
	}
	var row = new Array;
	this.fields = new Array;
	var array = record.getFieldInformation();
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var hdr = array[n];
			if(hdr != null) {
				var val = hdr.getName();
				if(!(val != null)) {
					val = "";
				}
				row.push(val);
				this.fields.push(val);
			}
		}
	}
	this.addRow(row);
};

JkCsvCSVGenerator.prototype.addRecordFromModel = function(record) {
	if(!(record != null)) {
		return;
	}
	this.addRecordFromDynamicMap((record.getData()));
};

JkCsvCSVGenerator.prototype.addRecordFromDynamicMap = function(data) {
	if(!(data != null)) {
		return;
	}
	var row = new Array;
	if(this.fields != null) {
		var n = 0;
		var m = this.fields.length;
		for(n = 0 ; n < m ; n++) {
			var field = this.fields[n];
			if(field != null) {
				var val = data.getString(field, null);
				if(!(val != null)) {
					val = "";
				}
				row.push(val);
			}
		}
	}
	this.addRow(row);
};

JkCsvCSVGenerator.prototype.addRow = function(data) {
	if(!(data != null)) {
		return;
	}
	this.table.push(data);
};

JkCsvCSVGenerator.prototype.escapeCellContents = function(value) {
	if(!(value != null)) {
		return "";
	}
	if(JkLangString.contains(value, ",") == false) {
		return value;
	}
	var sb = JkLangStringBuilder.NEW();
	sb.appendCharacter('\"'.charCodeAt());
	var it = JkLangString.iterate(value);
	while(it != null){
		var c = it.getNextChar();
		if(JkLangCharacter.isEOF(c)) {
			break;
		}
		if(c == '\"'.charCodeAt()) {
			sb.appendCharacter('\"'.charCodeAt());
			sb.appendCharacter('\"'.charCodeAt());
		}
		else {
			sb.appendCharacter(c);
		}
	}
	sb.appendCharacter('\"'.charCodeAt());
	return sb.toString();
};

JkCsvCSVGenerator.prototype.toString = function() {
	var sb = JkLangStringBuilder.NEW();
	if(this.table != null) {
		var n = 0;
		var m = this.table.length;
		for(n = 0 ; n < m ; n++) {
			var row = this.table[n];
			if(row != null) {
				var first = true;
				if(row != null) {
					var n2 = 0;
					var m2 = row.length;
					for(n2 = 0 ; n2 < m2 ; n2++) {
						var cell = row[n2];
						if(cell != null) {
							if(!first) {
								sb.appendCharacter(','.charCodeAt());
							}
							first = false;
							sb.appendString((this.escapeCellContents(cell)));
						}
					}
				}
				sb.appendCharacter('\n'.charCodeAt());
			}
		}
	}
	return sb.toString();
};

JkCsvCSVGenerator.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkCsvCSVGenerator"] === true;
};

let JkCsvCSVParser = function() {
	this.iterator = null;
};

JkCsvCSVParser.prototype._t = { "JkCsvCSVParser" : true };
JkCsvCSVParser.prototype._tobj = JkCsvCSVParser;

JkCsvCSVParser.NEW = function() {
	var v = new JkCsvCSVParser;
	return v.CTOR_JkCsvCSVParser();
};

JkCsvCSVParser.prototype.CTOR_JkCsvCSVParser = function() {
	this.iterator = null;
	return this;
};

JkCsvCSVParser.parse1 = function(buffer) {
	if(!(buffer != null)) {
		return null;
	}
	return JkCsvCSVParser.forBuffer(buffer).acceptRows();
};

JkCsvCSVParser.parse2 = function(str) {
	if(JkLangString.isEmpty(str)) {
		return null;
	}
	return JkCsvCSVParser.forString(str).acceptRows();
};

JkCsvCSVParser.parse3 = function(file) {
	if(!(file != null)) {
		return null;
	}
	return JkCsvCSVParser.parse2((file.getContentsUTF8()));
};

JkCsvCSVParser.forString = function(str) {
	var v = JkCsvCSVParser.NEW();
	v.setDataString(str);
	return v;
};

JkCsvCSVParser.forBuffer = function(buffer) {
	var v = JkCsvCSVParser.NEW();
	v.setDataBuffer(buffer);
	return v;
};

JkCsvCSVParser.prototype.setDataString = function(str) {
	this.iterator = JkLangCharacterIteratorForString.forString(str);
	this.iterator.moveToNextChar();
};

JkCsvCSVParser.prototype.setDataBuffer = function(buffer) {
	this.iterator = JkLangCharacterIteratorForBuffer.forBuffer(buffer);
	this.iterator.moveToNextChar();
};

JkCsvCSVParser.prototype.acceptRows = function() {
	var records = JkLangDynamicVector.NEW();
	while(true){
		var record = JkLangDynamicVector.NEW();
		while(true){
			var column = this.acceptColumn();
			record.appendObject(column);
			var c = this.iterator.getCurrentChar();
			if(c == ','.charCodeAt()) {
				this.iterator.moveToNextChar();
			}
			else if(c == '\n'.charCodeAt()) {
				this.iterator.moveToNextChar();
				break;
			}
			if(this.iterator.hasEnded()) {
				break;
			}
		}
		records.appendObject(record);
		if(this.iterator.hasEnded()) {
			break;
		}
	}
	return records;
};

JkCsvCSVParser.prototype.acceptColumn = function() {
	var ss = this.iterator.getCurrentChar();
	var insideQuotes = ss == '\''.charCodeAt() || ss == '\"'.charCodeAt();
	var sb = JkLangStringBuilder.NEW();
	if(!insideQuotes) {
		if(ss < 1) {
			return null;
		}
		if(ss == ','.charCodeAt() || ss == '\n'.charCodeAt()) {
			return sb.toString();
		}
		sb.appendCharacter(ss);
	}
	var i = 0;
	while(true){
		var c = this.iterator.getNextChar();
		i++;
		if(c < 1) {
			for(var n = 0 ; n < i ; n++) {
				this.iterator.moveToPreviousChar();
			}
			return null;
		}
		if(insideQuotes) {
			if(c == ss) {
				var x = this.iterator.getNextChar();
				if(x == ','.charCodeAt() || x == '\n'.charCodeAt()) {
					break;
				}
				sb.appendCharacter('\\'.charCodeAt());
			}
		}
		else if(c == ','.charCodeAt() || c == '\n'.charCodeAt()) {
			break;
		}
		sb.appendCharacter(c);
	}
	return sb.toString();
};

JkCsvCSVParser.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkCsvCSVParser"] === true;
};
