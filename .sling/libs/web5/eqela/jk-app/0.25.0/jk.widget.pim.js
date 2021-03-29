let JkWidgetPimContact = function() {
	this.name = null;
	this.phoneNumbers = null;
};

JkWidgetPimContact.prototype._t = { "JkWidgetPimContact" : true };
JkWidgetPimContact.prototype._tobj = JkWidgetPimContact;

JkWidgetPimContact.NEW = function() {
	var v = new JkWidgetPimContact;
	return v.CTOR_JkWidgetPimContact();
};

JkWidgetPimContact.prototype.CTOR_JkWidgetPimContact = function() {
	this.phoneNumbers = null;
	this.name = null;
	return this;
};

JkWidgetPimContact.prototype.addToPhoneNumbers = function(value) {
	if(value == null) {
		return this;
	}
	if(this.phoneNumbers == null) {
		this.phoneNumbers = new Array;
	}
	this.phoneNumbers.push(value);
	return this;
};

JkWidgetPimContact.prototype.getPhoneNumberString = function() {
	if(this.phoneNumbers == null || JkLangVector.getSize(this.phoneNumbers) < 1) {
		return null;
	}
	var sb = JkLangStringBuilder.NEW();
	if(this.phoneNumbers != null) {
		var n = 0;
		var m = this.phoneNumbers.length;
		for(n = 0 ; n < m ; n++) {
			var phoneNumber = this.phoneNumbers[n];
			if(phoneNumber != null) {
				if(sb.count() > 0) {
					sb.appendString(", ");
				}
				sb.appendString(phoneNumber);
			}
		}
	}
	return sb.toString();
};

JkWidgetPimContact.prototype.getName = function() {
	return this.name;
};

JkWidgetPimContact.prototype.setName = function(v) {
	this.name = v;
	return this;
};

JkWidgetPimContact.prototype.getPhoneNumbers = function() {
	return this.phoneNumbers;
};

JkWidgetPimContact.prototype.setPhoneNumbers = function(v) {
	this.phoneNumbers = v;
	return this;
};

JkWidgetPimContact.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetPimContact"] === true;
};

let JkWidgetPimContactPicker = function() {
	this.context = null;
};

JkWidgetPimContactPicker.prototype._t = { "JkWidgetPimContactPicker" : true };
JkWidgetPimContactPicker.prototype._tobj = JkWidgetPimContactPicker;

JkWidgetPimContactPicker.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetPimContactPicker;
	return v.CTOR_JkWidgetPimContactPicker_JkUiGuiApplicationContext(context);
};

JkWidgetPimContactPicker.prototype.CTOR_JkWidgetPimContactPicker_JkUiGuiApplicationContext = function(context) {
	this.context = null;
	this.context = context;
	return this;
};

JkWidgetPimContactPicker.isSupported = function() {
	return false;
};

JkWidgetPimContactPicker.prototype.pickOneContact = function(widget, callback) {
	var cb = callback;
	console.log("[jk.widget.pim.ContactPicker.pickOneContact] (ContactPicker.sling:333:3): Not implemented");
	if(cb != null) {
		cb(null, (JkLangError.forCode("notSupported", null)));
	}
};

JkWidgetPimContactPicker.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetPimContactPicker"] === true;
};
