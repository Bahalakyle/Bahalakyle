let JkModelDynamicModel = function() {
	this.dataValue = null;
	this.fieldsValue = null;
};

JkModelDynamicModel.prototype._t = {
	"JkJsonJSONObject" : true,
	"JkModelDynamicModel" : true,
	"JkLangStringObject" : true
};
JkModelDynamicModel.prototype._tobj = JkModelDynamicModel;

JkModelDynamicModel.NEW_JkModelDynamicModelJkLangDynamicMap = function(data, mapping) {
	var v = new JkModelDynamicModel;
	return v.CTOR_JkModelDynamicModel_JkModelDynamicModelJkLangDynamicMap(data, mapping);
};

JkModelDynamicModel.prototype.CTOR_JkModelDynamicModel_JkModelDynamicModelJkLangDynamicMap = function(data, mapping) {
	this.fieldsValue = null;
	this.dataValue = null;
	this.setData(null);
	this.copyFrom(data, mapping);
	return this;
};

JkModelDynamicModel.NEW_JkLangDynamicMap = function(data) {
	var v = new JkModelDynamicModel;
	return v.CTOR_JkModelDynamicModel_JkLangDynamicMap(data);
};

JkModelDynamicModel.prototype.CTOR_JkModelDynamicModel_JkLangDynamicMap = function(data) {
	this.fieldsValue = null;
	this.dataValue = null;
	this.setData(data);
	return this;
};

JkModelDynamicModel.NEW = function() {
	var v = new JkModelDynamicModel;
	return v.CTOR_JkModelDynamicModel();
};

JkModelDynamicModel.prototype.CTOR_JkModelDynamicModel = function() {
	this.fieldsValue = null;
	this.dataValue = null;
	this.setData(null);
	return this;
};

JkModelDynamicModel.asDynamicMap = function(object) {
	if(!(object != null)) {
		return null;
	}
	return object.toDynamicMap();
};

JkModelDynamicModel.prototype.toString = function() {
	return JkJsonJSONEncoder.toString((this.toDynamicMap()));
};

JkModelDynamicModel.prototype.toDynamicMap = function() {
	return this.getData();
};

JkModelDynamicModel.prototype.fromDynamicMap = function(data) {
	this.setData(data);
};

JkModelDynamicModel.prototype.toJsonObject = function() {
	return this.toDynamicMap();
};

JkModelDynamicModel.prototype.setField = function(name, value) {
	this.getData().setObject(name, value);
};

JkModelDynamicModel.prototype.getField = function(name) {
	return this.getData().get(name);
};

JkModelDynamicModel.prototype.getOrCreateFieldAsDynamicVector = function(name) {
	var v = this.getData().getDynamicVector(name);
	if(!(v != null)) {
		v = JkLangDynamicVector.NEW();
		this.getData().setObject(name, v);
	}
	return v;
};

JkModelDynamicModel.prototype.getFieldAsDynamicVector = function(name) {
	return this.getData().getDynamicVector(name);
};

JkModelDynamicModel.prototype.getFieldAsStringVector = function(name) {
	var v = this.getFieldAsDynamicVector(name);
	if(!(v != null)) {
		return null;
	}
	return v.toVectorOfStrings();
};

JkModelDynamicModel.prototype.getFieldAsIntegerVector = function(name) {
	var vector = this.getFieldAsDynamicVector(name);
	if(!(vector != null)) {
		return null;
	}
	var v = new Array;
	{
		var _vl = vector;
		if(_vl != null) {
			var _it = _vl.iterate();
			while(_it != null && _it.hasNext()){
				var o = _it.next();
				if(o == null) {
					continue;
				}
				v.push(JkLangInteger.asInteger(o));
			}
		}
	}
	return v;
};

JkModelDynamicModel.prototype.getFieldAsLongIntegerVector = function(name) {
	var vector = this.getFieldAsDynamicVector(name);
	if(!(vector != null)) {
		return null;
	}
	var v = new Array;
	{
		var _vl = vector;
		if(_vl != null) {
			var _it = _vl.iterate();
			while(_it != null && _it.hasNext()){
				var o = _it.next();
				if(o == null) {
					continue;
				}
				v.push(JkLangLongInteger.asLong(o));
			}
		}
	}
	return v;
};

JkModelDynamicModel.prototype.getFieldAsDoubleVector = function(name) {
	var vector = this.getFieldAsDynamicVector(name);
	if(!(vector != null)) {
		return null;
	}
	var v = new Array;
	{
		var _vl = vector;
		if(_vl != null) {
			var _it = _vl.iterate();
			while(_it != null && _it.hasNext()){
				var o = _it.next();
				if(o == null) {
					continue;
				}
				v.push(JkLangDouble.asDouble(o));
			}
		}
	}
	return v;
};

JkModelDynamicModel.prototype.getFieldAsBooleanVector = function(name) {
	var vector = this.getFieldAsDynamicVector(name);
	if(!(vector != null)) {
		return null;
	}
	var v = new Array;
	{
		var _vl = vector;
		if(_vl != null) {
			var _it = _vl.iterate();
			while(_it != null && _it.hasNext()){
				var o = _it.next();
				if(o == null) {
					continue;
				}
				v.push(JkLangBoolean.asBoolean(o, false));
			}
		}
	}
	return v;
};

JkModelDynamicModel.prototype.addStringToVectorField = function(field, value) {
	this.getOrCreateFieldAsDynamicVector(field).appendString(value);
};

JkModelDynamicModel.prototype.addIntegerToVectorField = function(field, value) {
	this.getOrCreateFieldAsDynamicVector(field).appendInteger(value);
};

JkModelDynamicModel.prototype.addLongIntegerToVectorField = function(field, value) {
	this.getOrCreateFieldAsDynamicVector(field).appendLong(value);
};

JkModelDynamicModel.prototype.addDoubleToVectorField = function(field, value) {
	this.getOrCreateFieldAsDynamicVector(field).appendDouble(value);
};

JkModelDynamicModel.prototype.addBooleanToVectorField = function(field, value) {
	this.getOrCreateFieldAsDynamicVector(field).appendBoolean(value);
};

JkModelDynamicModel.prototype.addBufferToVectorField = function(field, value) {
	this.getOrCreateFieldAsDynamicVector(field).appendObject(value);
};

JkModelDynamicModel.prototype.addObjectToVectorField = function(field, value) {
	var vv = this.getOrCreateFieldAsDynamicVector(field);
	if(value != null && (JkModelDynamicModel.IS_INSTANCE && JkModelDynamicModel.IS_INSTANCE(value))) {
		vv.appendObject((value.toDynamicMap()));
	}
	else {
		vv.appendObject(value);
	}
};

JkModelDynamicModel.prototype.fromJsonObject = function(o1) {
	var data = (function(o) {
		if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(o1);
	if(data != null) {
		this.fromDynamicMap(data);
	}
	else {
		this.clear();
	}
	return true;
};

JkModelDynamicModel.prototype.containsField = function(field) {
	if(!(field != null)) {
		return false;
	}
	var array = this.getFields();
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var ff = array[n];
			if(ff != null) {
				if(JkLangString.equals((ff.getName()), field)) {
					return true;
				}
			}
		}
	}
	return false;
};

JkModelDynamicModel.prototype.hasValue = function(key) {
	if(!(key != null)) {
		return false;
	}
	return this.getData().containsKey(key);
};

JkModelDynamicModel.prototype.removeNullValues = function() {
	if(this.dataValue != null) {
		this.dataValue.removeNullValues();
	}
};

JkModelDynamicModel.prototype.clear = function() {
	this.dataValue = null;
};

JkModelDynamicModel.prototype.setAllFields = function() {
	var array = this.getFields();
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var field = array[n];
			if(field != null) {
				if(!this.getData().containsKey((field.getName()))) {
					this.getData().setObject((field.getName()), null);
				}
			}
		}
	}
};

JkModelDynamicModel.prototype.getModelMetadata = function() {
	return null;
};

JkModelDynamicModel.prototype.getFieldInformation = function() {
	return null;
};

JkModelDynamicModel.prototype.copyFrom = function(other, mapping) {
	if(!(other != null)) {
		return;
	}
	var array = this.getFields();
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var field = array[n];
			if(field != null) {
				var fname = field.getName();
				var oname = null;
				if(mapping != null && mapping.containsKey(fname)) {
					oname = mapping.getString(fname, null);
				}
				else {
					oname = fname;
				}
				if(oname != null && other.hasValue(oname)) {
					this.setField(fname, (other.getField(oname)));
				}
			}
		}
	}
};

JkModelDynamicModel.prototype.getData = function() {
	if(!(this.dataValue != null)) {
		this.dataValue = JkLangDynamicMap.NEW();
	}
	return this.dataValue;
};

JkModelDynamicModel.prototype.doSetData = function(value) {
	this.dataValue = value;
};

JkModelDynamicModel.prototype.setData = function(v) {
	this.doSetData(v);
	return v;
};

JkModelDynamicModel.prototype.getFields = function() {
	if(!(this.fieldsValue != null)) {
		this.fieldsValue = new Array;
		var array = this.getFieldInformation();
		if(array != null) {
			var n = 0;
			var m = array.length;
			for(n = 0 ; n < m ; n++) {
				var name = array[n];
				if(name != null) {
					this.fieldsValue.push(name);
				}
			}
		}
	}
	return this.fieldsValue;
};

JkModelDynamicModel.prototype.doSetFields = function(value) {
	this.fieldsValue = value;
};

JkModelDynamicModel.prototype.setFields = function(v) {
	this.doSetFields(v);
	return v;
};

JkModelDynamicModel.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkModelDynamicModel"] === true;
};

let JkModelDynamicModelField = function() {
	this._name = null;
	this._encodedName = null;
	this._type = 0;
	this._description = null;
	this._tags = null;
};

JkModelDynamicModelField.prototype._t = { "JkModelDynamicModelField" : true };
JkModelDynamicModelField.prototype._tobj = JkModelDynamicModelField;

JkModelDynamicModelField.NEW = function() {
	var v = new JkModelDynamicModelField;
	return v.CTOR_JkModelDynamicModelField();
};

JkModelDynamicModelField.prototype.CTOR_JkModelDynamicModelField = function() {
	this._tags = null;
	this._description = null;
	this._type = 0;
	this._encodedName = null;
	this._name = null;
	return this;
};

JkModelDynamicModelField.prototype.hasTag = function(tag) {
	var array = this.getTags();
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var tt = array[n];
			if(tt != null) {
				if(tt == tag) {
					return true;
				}
			}
		}
	}
	return false;
};

JkModelDynamicModelField.prototype.addToTags = function(tag) {
	if(!(tag != null)) {
		return;
	}
	if(!(this.getTags() != null)) {
		this.setTags((new Array));
	}
	this.getTags().push(tag);
};

JkModelDynamicModelField.prototype.getName = function() {
	return this._name;
};

JkModelDynamicModelField.prototype.doSetName = function(value) {
	this._name = value;
};

JkModelDynamicModelField.prototype.setName = function(v) {
	this.doSetName(v);
	return v;
};

JkModelDynamicModelField.prototype.getEncodedName = function() {
	return this._encodedName;
};

JkModelDynamicModelField.prototype.doSetEncodedName = function(value) {
	this._encodedName = value;
};

JkModelDynamicModelField.prototype.setEncodedName = function(v) {
	this.doSetEncodedName(v);
	return v;
};

JkModelDynamicModelField.prototype.getType = function() {
	return this._type;
};

JkModelDynamicModelField.prototype.doSetType = function(value) {
	this._type = value;
};

JkModelDynamicModelField.prototype.setType = function(v) {
	this.doSetType(v);
	return v;
};

JkModelDynamicModelField.prototype.getDescription = function() {
	return this._description;
};

JkModelDynamicModelField.prototype.doSetDescription = function(value) {
	this._description = value;
};

JkModelDynamicModelField.prototype.setDescription = function(v) {
	this.doSetDescription(v);
	return v;
};

JkModelDynamicModelField.prototype.getTags = function() {
	return this._tags;
};

JkModelDynamicModelField.prototype.doSetTags = function(value) {
	this._tags = value;
};

JkModelDynamicModelField.prototype.setTags = function(v) {
	this.doSetTags(v);
	return v;
};

JkModelDynamicModelField.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkModelDynamicModelField"] === true;
};

JkModelDynamicModelField.TYPE_UNKNOWN = 0;
JkModelDynamicModelField.TYPE_OBJECT = 1;
JkModelDynamicModelField.TYPE_STRING = 2;
JkModelDynamicModelField.TYPE_BUFFER = 3;
JkModelDynamicModelField.TYPE_INTEGER = 4;
JkModelDynamicModelField.TYPE_LONG_INTEGER = 5;
JkModelDynamicModelField.TYPE_DOUBLE = 6;
JkModelDynamicModelField.TYPE_BOOLEAN = 7;
JkModelDynamicModelField.TYPE_VECTOR = 8;
JkModelDynamicModelField.TYPE_MAP = 9;
