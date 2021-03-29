let JkWidgetFormFormDeclarationElement = function() {
	this.properties = null;
	this.children = null;
};

JkWidgetFormFormDeclarationElement.prototype._t = { "JkWidgetFormFormDeclarationElement" : true };
JkWidgetFormFormDeclarationElement.prototype._tobj = JkWidgetFormFormDeclarationElement;

JkWidgetFormFormDeclarationElement.NEW = function() {
	var v = new JkWidgetFormFormDeclarationElement;
	return v.CTOR_JkWidgetFormFormDeclarationElement();
};

JkWidgetFormFormDeclarationElement.prototype.CTOR_JkWidgetFormFormDeclarationElement = function() {
	this.children = null;
	this.properties = null;
	return this;
};

JkWidgetFormFormDeclarationElement.forType = function(type) {
	var v = JkWidgetFormFormDeclarationElement.NEW();
	v.setProperty1("type", type);
	return v;
};

JkWidgetFormFormDeclarationElement.forProperties = function(properties) {
	var v = JkWidgetFormFormDeclarationElement.NEW();
	v.setProperties(properties);
	return v;
};

JkWidgetFormFormDeclarationElement.prototype.getId = function() {
	if(!(this.properties != null)) {
		return null;
	}
	return this.properties.getString("id", null);
};

JkWidgetFormFormDeclarationElement.prototype.getType = function() {
	if(!(this.properties != null)) {
		return null;
	}
	return this.properties.getString("type", null);
};

JkWidgetFormFormDeclarationElement.prototype.getLabel = function() {
	if(!(this.properties != null)) {
		return null;
	}
	return this.properties.getString("label", null);
};

JkWidgetFormFormDeclarationElement.prototype.isType = function(type) {
	if(!(this.properties != null)) {
		return false;
	}
	if(!(type != null)) {
		return false;
	}
	if(this.properties.getString("type", null) == type) {
		return true;
	}
	return false;
};

JkWidgetFormFormDeclarationElement.prototype.setProperty1 = function(key, value) {
	if(!(key != null)) {
		return;
	}
	if(!(this.properties != null)) {
		this.properties = JkLangDynamicMap.NEW();
	}
	this.properties.setObject(key, value);
};

JkWidgetFormFormDeclarationElement.prototype.setProperty2 = function(key, value) {
	this.setProperty1(key, (JkLangString.forInteger(value)));
};

JkWidgetFormFormDeclarationElement.prototype.setProperty3 = function(key, value) {
	this.setProperty1(key, (JkLangString.forDouble(value)));
};

JkWidgetFormFormDeclarationElement.prototype.setProperty4 = function(key, value) {
	this.setProperty1(key, (JkLangString.forBoolean(value)));
};

JkWidgetFormFormDeclarationElement.prototype.getPropertyObject = function(key) {
	if(!(this.properties != null)) {
		return null;
	}
	return this.properties.get(key);
};

JkWidgetFormFormDeclarationElement.prototype.getPropertyDynamicVector = function(key) {
	if(!(this.properties != null)) {
		return null;
	}
	return this.properties.getDynamicVector(key);
};

JkWidgetFormFormDeclarationElement.prototype.getPropertyVector = function(key) {
	if(!(this.properties != null)) {
		return null;
	}
	return this.properties.getVector(key);
};

JkWidgetFormFormDeclarationElement.prototype.getPropertyString = function(key) {
	if(!(this.properties != null)) {
		return null;
	}
	return this.properties.getString(key, null);
};

JkWidgetFormFormDeclarationElement.prototype.getPropertyInteger = function(key) {
	if(!(this.properties != null)) {
		return 0;
	}
	return this.properties.getInteger(key, 0);
};

JkWidgetFormFormDeclarationElement.prototype.getPropertyDouble = function(key) {
	if(!(this.properties != null)) {
		return 0.0;
	}
	return this.properties.getDouble(key, 0.0);
};

JkWidgetFormFormDeclarationElement.prototype.getPropertyBoolean = function(key) {
	if(!(this.properties != null)) {
		return false;
	}
	return this.properties.getBoolean(key, false);
};

JkWidgetFormFormDeclarationElement.prototype.addToChildren = function(element) {
	if(!(element != null)) {
		return;
	}
	if(!(this.children != null)) {
		this.children = new Array;
	}
	this.children.push(element);
};

JkWidgetFormFormDeclarationElement.prototype.getProperties = function() {
	return this.properties;
};

JkWidgetFormFormDeclarationElement.prototype.setProperties = function(v) {
	this.properties = v;
	return this;
};

JkWidgetFormFormDeclarationElement.prototype.getChildren = function() {
	return this.children;
};

JkWidgetFormFormDeclarationElement.prototype.setChildren = function(v) {
	this.children = v;
	return this;
};

JkWidgetFormFormDeclarationElement.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetFormFormDeclarationElement"] === true;
};

let JkWidgetFormFormDeclaration = function() {
	this.root = null;
	this.stack = null;
};

JkWidgetFormFormDeclaration.prototype._t = { "JkWidgetFormFormDeclaration" : true };
JkWidgetFormFormDeclaration.prototype._tobj = JkWidgetFormFormDeclaration;

JkWidgetFormFormDeclaration.NEW = function() {
	var v = new JkWidgetFormFormDeclaration;
	return v.CTOR_JkWidgetFormFormDeclaration();
};

JkWidgetFormFormDeclaration.prototype.CTOR_JkWidgetFormFormDeclaration = function() {
	this.stack = null;
	this.root = null;
	this.clear();
	return this;
};

JkWidgetFormFormDeclaration.forDescription = function(context, desc) {
	var v = JkWidgetFormFormDeclaration.NEW();
	if(!v.parseDescription(context, desc)) {
		return null;
	}
	return v;
};

JkWidgetFormFormDeclaration.prototype.clear = function() {
	this.stack = JkLangStack.NEW();
	this.root = this.startVerticalContainer();
};

JkWidgetFormFormDeclaration.prototype.getRoot = function() {
	return this.root;
};

JkWidgetFormFormDeclaration.prototype.addElement = function(element) {
	var current = this.stack.peek();
	if(current != null) {
		current.addToChildren(element);
	}
	return element;
};

JkWidgetFormFormDeclaration.prototype.startVerticalContainer = function() {
	var v = JkWidgetFormFormDeclarationElement.forType("VerticalContainer");
	this.addElement(v);
	this.stack.push(v);
	return v;
};

JkWidgetFormFormDeclaration.prototype.endVerticalContainer = function() {
	var cc = this.stack.peek();
	if(cc != null && cc.isType("VerticalContainer")) {
		this.stack.pop();
	}
	return cc;
};

JkWidgetFormFormDeclaration.prototype.startHorizontalContainer = function() {
	var v = JkWidgetFormFormDeclarationElement.forType("HorizontalContainer");
	this.addElement(v);
	this.stack.push(v);
	return v;
};

JkWidgetFormFormDeclaration.prototype.endHorizontalContainer = function() {
	var cc = this.stack.peek();
	if(cc != null && cc.isType("HorizontalContainer")) {
		this.stack.pop();
	}
	return cc;
};

JkWidgetFormFormDeclaration.prototype.startGroup = function(id, title, description) {
	var v = JkWidgetFormFormDeclarationElement.forType("GroupContainer");
	v.setProperty1("id", id);
	v.setProperty1("title", title);
	v.setProperty1("description", description);
	this.addElement(v);
	this.stack.push(v);
	return v;
};

JkWidgetFormFormDeclaration.prototype.endGroup = function() {
	var cc = this.stack.peek();
	if(cc != null && cc.isType("GroupContainer")) {
		this.stack.pop();
	}
	return cc;
};

JkWidgetFormFormDeclaration.prototype.startTab = function(id, label) {
	var v = JkWidgetFormFormDeclarationElement.forType("TabContainer");
	v.setProperty1("id", id);
	v.setProperty1("label", label);
	this.addElement(v);
	this.stack.push(v);
	return v;
};

JkWidgetFormFormDeclaration.prototype.endTab = function() {
	var cc = this.stack.peek();
	if(cc != null && cc.isType("TabContainer")) {
		this.stack.pop();
	}
	return cc;
};

JkWidgetFormFormDeclaration.prototype.addTextInput = function(id, label, description) {
	var v = JkWidgetFormFormDeclarationElement.forType("TextInput");
	v.setProperty1("id", id);
	v.setProperty1("label", label);
	v.setProperty1("description", description);
	return this.addElement(v);
};

JkWidgetFormFormDeclaration.prototype.addRawTextInput = function(id, label, description) {
	var v = JkWidgetFormFormDeclarationElement.forType("RawTextInput");
	v.setProperty1("id", id);
	v.setProperty1("label", label);
	v.setProperty1("description", description);
	return this.addElement(v);
};

JkWidgetFormFormDeclaration.prototype.addPasswordInput = function(id, label, description) {
	var v = JkWidgetFormFormDeclarationElement.forType("PasswordInput");
	v.setProperty1("id", id);
	v.setProperty1("label", label);
	v.setProperty1("description", description);
	return this.addElement(v);
};

JkWidgetFormFormDeclaration.prototype.addNameInput = function(id, label, description) {
	var v = JkWidgetFormFormDeclarationElement.forType("NameInput");
	v.setProperty1("id", id);
	v.setProperty1("label", label);
	v.setProperty1("description", description);
	return this.addElement(v);
};

JkWidgetFormFormDeclaration.prototype.addEmailAddressInput = function(id, label, description) {
	var v = JkWidgetFormFormDeclarationElement.forType("EmailAddressInput");
	v.setProperty1("id", id);
	v.setProperty1("label", label);
	v.setProperty1("description", description);
	return this.addElement(v);
};

JkWidgetFormFormDeclaration.prototype.addPhoneNumberInput = function(id, label, description) {
	var v = JkWidgetFormFormDeclarationElement.forType("PhoneNumberInput");
	v.setProperty1("id", id);
	v.setProperty1("label", label);
	v.setProperty1("description", description);
	return this.addElement(v);
};

JkWidgetFormFormDeclaration.prototype.addStreetAddressInput = function(id, label, description) {
	var v = JkWidgetFormFormDeclarationElement.forType("StreetAddressInput");
	v.setProperty1("id", id);
	v.setProperty1("label", label);
	v.setProperty1("description", description);
	return this.addElement(v);
};

JkWidgetFormFormDeclaration.prototype.addMultipleChoiceInput1 = function(id, label, description, values) {
	var vvs = JkLangKeyValueList.NEW();
	if(values != null) {
		var n = 0;
		var m = values.length;
		for(n = 0 ; n < m ; n++) {
			var value = values[n];
			if(value != null) {
				var comps = JkLangString.split(value, ':'.charCodeAt(), 2);
				var kk = JkLangVector.get(comps, 0);
				var vv = JkLangVector.get(comps, 1);
				if(vv == null) {
					vv = kk;
				}
				vvs.add(kk, vv);
			}
		}
	}
	return this.addMultipleChoiceInput2(id, label, description, vvs);
};

JkWidgetFormFormDeclaration.prototype.addMultipleChoiceInput2 = function(id, label, description, values) {
	var v = JkWidgetFormFormDeclarationElement.forType("MultipleChoiceInput");
	v.setProperty1("id", id);
	v.setProperty1("label", label);
	v.setProperty1("description", description);
	var vv = JkLangDynamicVector.NEW();
	var it = values.iterate();
	while(it != null){
		var kvp = it.next();
		if(!(kvp != null)) {
			break;
		}
		var m = JkLangDynamicMap.NEW();
		m.setString("key", kvp.key);
		m.setString("value", kvp.value);
		vv.appendObject(m);
	}
	v.setProperty1("values", vv);
	return this.addElement(v);
};

JkWidgetFormFormDeclaration.prototype.addDateInput = function(id, label, description, skipYears) {
	var v = JkWidgetFormFormDeclarationElement.forType("DateInput");
	v.setProperty1("id", id);
	v.setProperty1("label", label);
	v.setProperty1("description", description);
	v.setProperty2("skipYears", skipYears);
	return this.addElement(v);
};

JkWidgetFormFormDeclaration.prototype.addPhotoCaptureInput = function(id, label, description, defImage) {
	var v = JkWidgetFormFormDeclarationElement.forType("PhotoCaptureInput");
	v.setProperty1("id", id);
	v.setProperty1("label", label);
	v.setProperty1("description", description);
	v.setProperty1("defaultImage", defImage);
	return this.addElement(v);
};

JkWidgetFormFormDeclaration.prototype.addCodeInput = function(id, label, description, rows) {
	var v = JkWidgetFormFormDeclarationElement.forType("CodeInput");
	v.setProperty1("id", id);
	v.setProperty1("label", label);
	v.setProperty1("description", description);
	v.setProperty2("rows", rows);
	return this.addElement(v);
};

JkWidgetFormFormDeclaration.prototype.addTextAreaInput = function(id, label, description, rows) {
	var v = JkWidgetFormFormDeclarationElement.forType("TextAreaInput");
	v.setProperty1("id", id);
	v.setProperty1("label", label);
	v.setProperty1("description", description);
	v.setProperty2("rows", rows);
	return this.addElement(v);
};

JkWidgetFormFormDeclaration.prototype.addStaticTextElement = function(id, label, description) {
	var v = JkWidgetFormFormDeclarationElement.forType("StaticTextElement");
	v.setProperty1("id", id);
	v.setProperty1("label", label);
	v.setProperty1("description", description);
	return this.addElement(v);
};

JkWidgetFormFormDeclaration.prototype.addRadioGroupInput = function(id, label, description, groupname, items) {
	var v = JkWidgetFormFormDeclarationElement.forType("RadioGroupInput");
	v.setProperty1("id", id);
	v.setProperty1("label", label);
	v.setProperty1("description", description);
	v.setProperty1("groupName", groupname);
	v.setProperty1("items", (JkLangDynamicVector.forStringVector(items)));
	return this.addElement(v);
};

JkWidgetFormFormDeclaration.prototype.addCheckBoxInput = function(id, label, description, isChecked) {
	var v = JkWidgetFormFormDeclarationElement.forType("CheckBoxInput");
	v.setProperty1("id", id);
	v.setProperty1("label", label);
	v.setProperty1("description", description);
	v.setProperty4("isChecked", isChecked);
	return this.addElement(v);
};

JkWidgetFormFormDeclaration.prototype.addStringListInput = function(id, label, description) {
	var v = JkWidgetFormFormDeclarationElement.forType("StringListInput");
	v.setProperty1("id", id);
	v.setProperty1("label", label);
	v.setProperty1("description", description);
	return this.addElement(v);
};

JkWidgetFormFormDeclaration.prototype.addFieldsTo = function(context, fields, element) {
	if(!(fields != null)) {
		return false;
	}
	if(fields != null) {
		var n = 0;
		var m = fields.length;
		for(n = 0 ; n < m ; n++) {
			var field = (function(o) {
				if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
					return o;
				}
				return null;
			}.bind(this))(fields[n]);
			if(field != null) {
				JkLogLog.debug(context, "Form field: `" + (JkLangString.safeString((JkJsonJSONEncoder.encode(field, true, false)))) + ("'"));
				var e = JkWidgetFormFormDeclarationElement.forProperties(field);
				var childFields = e.getPropertyVector("fields");
				if(childFields != null) {
					this.addFieldsTo(context, childFields, e);
				}
				element.addToChildren(e);
			}
		}
	}
	return true;
};

JkWidgetFormFormDeclaration.prototype.parseDescription = function(context, desc) {
	this.clear();
	var data = (function(o) {
		if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((JkJsonJSONParser.parseString(desc)));
	if(!(data != null)) {
		JkLogLog.error(context, "Failed to parse form description: `" + (JkLangString.safeString(desc)) + ("'"));
		return false;
	}
	if(!this.addFieldsTo(context, (data.getVector("fields")), this.root)) {
		JkLogLog.error(context, "Failed to generate form from field list");
		return false;
	}
	return true;
};

JkWidgetFormFormDeclaration.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetFormFormDeclaration"] === true;
};

let JkWidgetFormFormWidgetStaticTextWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.backgroundColor = null;
	this.textColor = null;
	this.label = null;
	this.labeltext = null;
};

JkWidgetFormFormWidgetStaticTextWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetFormFormWidgetStaticTextWidget.prototype.constructor = JkWidgetFormFormWidgetStaticTextWidget;
JkWidgetFormFormWidgetStaticTextWidget.prototype._t = {
	"JkWidgetContainerWidget" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetWidgetWithValue" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetFormFormWidgetStaticTextWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetFormFormWidgetStaticTextWidget.prototype._tobj = JkWidgetFormFormWidgetStaticTextWidget;

JkWidgetFormFormWidgetStaticTextWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetFormFormWidgetStaticTextWidget;
	return v.CTOR_JkWidgetFormFormWidgetStaticTextWidget_JkUiGuiApplicationContext(context);
};

JkWidgetFormFormWidgetStaticTextWidget.prototype.CTOR_JkWidgetFormFormWidgetStaticTextWidget_JkUiGuiApplicationContext = function(context) {
	this.labeltext = null;
	this.label = null;
	this.textColor = null;
	this.backgroundColor = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetFormFormWidgetStaticTextWidget.forText = function(context, text) {
	var v = JkWidgetFormFormWidgetStaticTextWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetValue(text);
	return v;
};

JkWidgetFormFormWidgetStaticTextWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	this.label = JkWidgetLabelWidget.forText(this.context, this.labeltext);
	var color = this.textColor;
	if(color == null) {
		if(this.backgroundColor.isLightColor()) {
			color = JkGfxColor.forRGB(0, 0, 0);
		}
		else {
			color = JkGfxColor.forRGB(0xff, 0xff, 0xff);
		}
	}
	this.label.setWidgetTextColor(color);
	this.addWidget((JkWidgetCanvasWidget.forColor(this.context, this.backgroundColor)));
	this.addWidget((JkWidgetLayerWidget.forWidget(this.context, this.label, (this.context.getHeightValue("1500um")))));
};

JkWidgetFormFormWidgetStaticTextWidget.prototype.setWidgetValue = function(value) {
	this.labeltext = JkLangString.asString(value);
	if(this.label != null) {
		this.label.setWidgetText(this.labeltext);
	}
};

JkWidgetFormFormWidgetStaticTextWidget.prototype.getWidgetValue = function() {
	if(!(this.label != null)) {
		return null;
	}
	return this.label.getWidgetText();
};

JkWidgetFormFormWidgetStaticTextWidget.prototype.getBackgroundColor = function() {
	return this.backgroundColor;
};

JkWidgetFormFormWidgetStaticTextWidget.prototype.setBackgroundColor = function(v) {
	this.backgroundColor = v;
	return this;
};

JkWidgetFormFormWidgetStaticTextWidget.prototype.getTextColor = function() {
	return this.textColor;
};

JkWidgetFormFormWidgetStaticTextWidget.prototype.setTextColor = function(v) {
	this.textColor = v;
	return this;
};

JkWidgetFormFormWidgetStaticTextWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetFormFormWidgetStaticTextWidget"] === true;
};

let JkWidgetFormFormWidgetMyStringListInputWidget = function() {
	JkWidgetCommonTextInputWidget.call(this);
};

JkWidgetFormFormWidgetMyStringListInputWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetCommonTextInputWidget.prototype);
JkWidgetFormFormWidgetMyStringListInputWidget.prototype.constructor = JkWidgetFormFormWidgetMyStringListInputWidget;
JkWidgetFormFormWidgetMyStringListInputWidget.prototype._t = {
	"JkWidgetFormFormWidgetMyStringListInputWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetCommonTextInputWidget" : true,
	"JkWidgetWidgetWithValue" : true
};
JkWidgetFormFormWidgetMyStringListInputWidget.prototype._tobj = JkWidgetFormFormWidgetMyStringListInputWidget;

JkWidgetFormFormWidgetMyStringListInputWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetFormFormWidgetMyStringListInputWidget;
	return v.CTOR_JkWidgetFormFormWidgetMyStringListInputWidget_JkUiGuiApplicationContext(context);
};

JkWidgetFormFormWidgetMyStringListInputWidget.prototype.CTOR_JkWidgetFormFormWidgetMyStringListInputWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetCommonTextInputWidget.prototype.CTOR_JkWidgetCommonTextInputWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetFormFormWidgetMyStringListInputWidget.prototype.setWidgetValue = function(value) {
	var vv = (function(o) {
		if(JkLangDynamicVector.IS_INSTANCE && JkLangDynamicVector.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(value);
	if(vv == null) {
		return;
	}
	var sb = JkLangStringBuilder.NEW();
	var array = vv.toVector();
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var v = (function(o1) {
				if(typeof(o1) === 'string') {
					return o1;
				}
				return null;
			}.bind(this))(array[n]);
			if(v != null) {
				if(sb.count() > 0) {
					sb.appendString(", ");
				}
				sb.appendString(v);
			}
		}
	}
	this.setWidgetText((sb.toString()));
};

JkWidgetFormFormWidgetMyStringListInputWidget.prototype.getWidgetValue = function() {
	var v = JkLangDynamicVector.NEW();
	var array = JkLangString.split((this.getWidgetText()), ','.charCodeAt(), 0);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var string = array[n];
			if(string != null) {
				v.appendObject((JkLangString.strip(string)));
			}
		}
	}
	return v;
};

JkWidgetFormFormWidgetMyStringListInputWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetFormFormWidgetMyStringListInputWidget"] === true;
};

let JkWidgetFormFormWidgetAction = function() {
	this.label = null;
	this.handler = null;
};

JkWidgetFormFormWidgetAction.prototype._t = { "JkWidgetFormFormWidgetAction" : true };
JkWidgetFormFormWidgetAction.prototype._tobj = JkWidgetFormFormWidgetAction;

JkWidgetFormFormWidgetAction.NEW = function() {
	var v = new JkWidgetFormFormWidgetAction;
	return v.CTOR_JkWidgetFormFormWidgetAction();
};

JkWidgetFormFormWidgetAction.prototype.CTOR_JkWidgetFormFormWidgetAction = function() {
	this.handler = null;
	this.label = null;
	return this;
};

JkWidgetFormFormWidgetAction.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetFormFormWidgetAction"] === true;
};

let JkWidgetFormFormWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.formDeclaration = null;
	this.fieldsById = null;
	this.actions = null;
	this.elementSpacing = 0;
	this.formMargin = 0;
	this.alignWidget = null;
	this.enableFieldLabels = true;
	this.fieldLabelBelow = false;
	this.formWidth = 0;
	this.fieldLabelFontSize = 0;
	this.fieldLabelFontFamily = null;
	this.fieldLabelFontResource = null;
	this.customFooterWidget = null;
	this.queueData = null;
	this.widgetBackgroundColor = null;
	this.enableScrolling = true;
	this.fillContainerWidget = false;
	this.preservedFormData = null;
	this.preserveUnknownValuesForQueuedData = false;
	this.actionHandlers = null;
};

JkWidgetFormFormWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetFormFormWidget.prototype.constructor = JkWidgetFormFormWidget;
JkWidgetFormFormWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetWidgetWithLayout" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetFormFormWidget" : true
};
JkWidgetFormFormWidget.prototype._tobj = JkWidgetFormFormWidget;

JkWidgetFormFormWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetFormFormWidget;
	return v.CTOR_JkWidgetFormFormWidget_JkUiGuiApplicationContext(context);
};

JkWidgetFormFormWidget.prototype.CTOR_JkWidgetFormFormWidget_JkUiGuiApplicationContext = function(context) {
	this.actionHandlers = null;
	this.preserveUnknownValuesForQueuedData = false;
	this.preservedFormData = null;
	this.fillContainerWidget = false;
	this.enableScrolling = true;
	this.widgetBackgroundColor = null;
	this.queueData = null;
	this.customFooterWidget = null;
	this.fieldLabelFontResource = null;
	this.fieldLabelFontFamily = null;
	this.fieldLabelFontSize = 0;
	this.formWidth = 0;
	this.fieldLabelBelow = false;
	this.enableFieldLabels = true;
	this.alignWidget = null;
	this.formMargin = 0;
	this.elementSpacing = 0;
	this.actions = null;
	this.fieldsById = null;
	this.formDeclaration = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	this.fieldsById = new Map;
	this.formMargin = context.getHeightValue("1mm");
	this.formWidth = context.getWidthValue("120mm");
	this.fieldLabelFontSize = context.getHeightValue("2000um");
	this.fieldLabelFontFamily = "Arial";
	this.elementSpacing = this.formMargin;
	this.customFooterWidget = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(context);
	this.widgetBackgroundColor = JkGfxColor.forString("#EEEEEE");
	return this;
};

JkWidgetFormFormWidget.forDeclaration = function(context, form) {
	var v = JkWidgetFormFormWidget.NEW_JkUiGuiApplicationContext(context);
	v.setFormDeclaration(form);
	return v;
};

JkWidgetFormFormWidget.prototype.getCustomFooterWidget = function() {
	return this.customFooterWidget;
};

JkWidgetFormFormWidget.prototype.getFormDeclaration = function() {
	return this.formDeclaration;
};

JkWidgetFormFormWidget.prototype.setFormDeclaration = function(value) {
	this.formDeclaration = value;
	return this;
};

JkWidgetFormFormWidget.prototype.addActions = function() {
	;
};

JkWidgetFormFormWidget.prototype.addAction = function(label, handler) {
	if(!(label != null)) {
		return;
	}
	if(!(this.actions != null)) {
		this.actions = new Array;
	}
	var v = JkWidgetFormFormWidgetAction.NEW();
	v.label = label;
	v.handler = handler;
	this.actions.push(v);
};

JkWidgetFormFormWidget.prototype.setStyleForTextInputWidget = function(widget, allowReplace) {
	widget.setWidgetBackgroundColor((JkGfxColor.white()));
	widget.setWidgetPadding1((this.context.getHeightValue("1500um")));
	widget.setWidgetFontSize((this.context.getHeightValue("3000um")));
	return widget;
};

JkWidgetFormFormWidget.prototype.setStyleForTextButtonWidget = function(widget, allowReplace) {
	widget.setWidgetBackgroundColor((JkGfxColor.forString("blue")));
	JkWidgetWidget.setAlpha(widget, 0.9);
	return widget;
};

JkWidgetFormFormWidget.prototype.setStyleForSelectWidget = function(widget, allowReplace) {
	widget.setWidgetBackgroundColor((JkGfxColor.white()));
	widget.setWidgetPadding((this.context.getHeightValue("1500um")));
	widget.setWidgetFontSize((this.context.getHeightValue("3000um")));
	return widget;
};

JkWidgetFormFormWidget.prototype.setStyleForTextAreaWidget = function(widget, allowReplace) {
	widget.setWidgetBackgroundColor((JkGfxColor.white()));
	widget.setWidgetPadding1((this.context.getHeightValue("1500um")));
	widget.setWidgetFontSize((this.context.getHeightValue("3000um")));
	return widget;
};

JkWidgetFormFormWidget.prototype.setStyleForDateSelectorWidget = function(widget, allowReplace) {
	var array = JkWidgetWidget.getChildren(widget);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				this.setStyleForWidget(child, false);
			}
		}
	}
	return widget;
};

JkWidgetFormFormWidget.prototype.setStyleForRadioButtonGroupWidget = function(widget, allowReplace) {
	if(!allowReplace) {
		return widget;
	}
	return JkWidgetLayerWidget.forWidget(this.context, widget, (this.context.getHeightValue("1500um")));
};

JkWidgetFormFormWidget.prototype.setStyleForCheckBoxWidget = function(widget, allowReplace) {
	if(!allowReplace) {
		return widget;
	}
	return JkWidgetLayerWidget.forWidget(this.context, widget, (this.context.getHeightValue("1500um")));
};

JkWidgetFormFormWidget.prototype.setStyleForWidget = function(widget, allowReplace) {
	if(JkWidgetCommonTextInputWidget.IS_INSTANCE && JkWidgetCommonTextInputWidget.IS_INSTANCE(widget)) {
		return this.setStyleForTextInputWidget(widget, allowReplace);
	}
	if(JkWidgetCommonTextButtonWidget.IS_INSTANCE && JkWidgetCommonTextButtonWidget.IS_INSTANCE(widget)) {
		return this.setStyleForTextButtonWidget(widget, allowReplace);
	}
	if(JkWidgetCommonSelectWidget.IS_INSTANCE && JkWidgetCommonSelectWidget.IS_INSTANCE(widget)) {
		return this.setStyleForSelectWidget(widget, allowReplace);
	}
	if(JkWidgetCommonTextAreaWidget.IS_INSTANCE && JkWidgetCommonTextAreaWidget.IS_INSTANCE(widget)) {
		return this.setStyleForTextAreaWidget(widget, allowReplace);
	}
	if(JkWidgetCommonDateSelectorWidget.IS_INSTANCE && JkWidgetCommonDateSelectorWidget.IS_INSTANCE(widget)) {
		return this.setStyleForDateSelectorWidget(widget, allowReplace);
	}
	if(JkWidgetCommonRadioButtonGroupWidget.IS_INSTANCE && JkWidgetCommonRadioButtonGroupWidget.IS_INSTANCE(widget)) {
		return this.setStyleForRadioButtonGroupWidget(widget, allowReplace);
	}
	if(JkWidgetCommonCheckBoxWidget.IS_INSTANCE && JkWidgetCommonCheckBoxWidget.IS_INSTANCE(widget)) {
		return this.setStyleForCheckBoxWidget(widget, allowReplace);
	}
	var array = JkWidgetWidget.getChildren(widget);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				this.setStyleForWidget(child, false);
			}
		}
	}
	return widget;
};

JkWidgetFormFormWidget.prototype.asPlaceHolder = function(str) {
	if(this.enableFieldLabels) {
		return null;
	}
	return str;
};

JkWidgetFormFormWidget.prototype.getBackgroundColorForElement = function(element) {
	if(element.isType("GroupContainer")) {
		return JkGfxColor.black();
	}
	return JkGfxColor.white();
};

JkWidgetFormFormWidget.prototype.getForegroundColorForElement = function(element) {
	return null;
};

JkWidgetFormFormWidget.prototype.getAdjustedForegroundColor = function(element, backgroundColor) {
	var v = this.getForegroundColorForElement(element);
	if(v != null) {
		return v;
	}
	if(!(backgroundColor != null)) {
		return JkGfxColor.black();
	}
	if(backgroundColor.isWhite()) {
		return JkGfxColor.forRGB(100, 100, 100);
	}
	if(backgroundColor.isDarkColor()) {
		return JkGfxColor.white();
	}
	return JkGfxColor.black();
};

JkWidgetFormFormWidget.prototype.setActionHandlers = function(handlers) {
	if(!(handlers != null)) {
		return;
	}
	this.actionHandlers = new Map;
	var keys = JkLangMap.iterateKeys(handlers);
	if(!(keys != null)) {
		return;
	}
	while(true){
		var key = keys.next();
		if(!(key != null)) {
			break;
		}
		if(typeof(key) === 'string') {
			this.actionHandlers.set(key, (JkLangMap.get(handlers, key)));
		}
	}
};

JkWidgetFormFormWidget.prototype.setActionHandler = function(actionName, handler) {
	if(!(actionName != null)) {
		return;
	}
	if(!(handler != null)) {
		return;
	}
	if(!(this.actionHandlers != null)) {
		this.actionHandlers = new Map;
	}
	this.actionHandlers.set(actionName, handler);
};

JkWidgetFormFormWidget.prototype.getActionHandler = function(actionName) {
	if(!(this.actionHandlers != null)) {
		return null;
	}
	if(!(actionName != null)) {
		return null;
	}
	return JkLangMap.get(this.actionHandlers, actionName);
};

JkWidgetFormFormWidget.prototype.createWidgetForElement = function(element) {
	if(!(element != null)) {
		return null;
	}
	if(element.isType("TextInput")) {
		return JkWidgetCommonTextInputWidget.forType(this.context, JkWidgetCommonTextInputWidget.TYPE_DEFAULT, (this.asPlaceHolder((element.getLabel()))));
	}
	if(element.isType("TextButton")) {
		return JkWidgetCommonTextButtonWidget.forText(this.context, (element.getPropertyString("text")), (this.getActionHandler((element.getPropertyString("action")))));
	}
	if(element.isType("RawTextInput")) {
		return JkWidgetCommonTextInputWidget.forType(this.context, JkWidgetCommonTextInputWidget.TYPE_NONASSISTED, (this.asPlaceHolder((element.getLabel()))));
	}
	if(element.isType("PasswordInput")) {
		return JkWidgetCommonTextInputWidget.forType(this.context, JkWidgetCommonTextInputWidget.TYPE_PASSWORD, (this.asPlaceHolder((element.getLabel()))));
	}
	if(element.isType("NameInput")) {
		return JkWidgetCommonTextInputWidget.forType(this.context, JkWidgetCommonTextInputWidget.TYPE_NAME, (this.asPlaceHolder((element.getLabel()))));
	}
	if(element.isType("EmailAddressInput")) {
		return JkWidgetCommonTextInputWidget.forType(this.context, JkWidgetCommonTextInputWidget.TYPE_EMAIL_ADDRESS, (this.asPlaceHolder((element.getLabel()))));
	}
	if(element.isType("PhoneNumberInput")) {
		return JkWidgetCommonTextInputWidget.forType(this.context, JkWidgetCommonTextInputWidget.TYPE_PHONE_NUMBER, (this.asPlaceHolder((element.getLabel()))));
	}
	if(element.isType("StreetAddressInput")) {
		return JkWidgetCommonTextInputWidget.forType(this.context, JkWidgetCommonTextInputWidget.TYPE_STREET_ADDRESS, (this.asPlaceHolder((element.getLabel()))));
	}
	if(element.isType("TextAreaInput")) {
		return JkWidgetCommonTextAreaWidget.forPlaceholder(this.context, (this.asPlaceHolder((element.getLabel()))), (element.getPropertyInteger("rows")));
	}
	if(element.isType("CodeInput")) {
		var v = JkWidgetCommonTextAreaWidget.forPlaceholder(this.context, (this.asPlaceHolder((element.getLabel()))), (element.getPropertyInteger("rows")));
		v.configureMonospaceFont();
		return v;
	}
	if(element.isType("StaticTextElement")) {
		var st = JkWidgetFormFormWidgetStaticTextWidget.forText(this.context, (this.asPlaceHolder((element.getLabel()))));
		var bgc = this.getBackgroundColorForElement(element);
		var fgc = this.getAdjustedForegroundColor(element, bgc);
		st.setBackgroundColor(bgc);
		st.setTextColor(fgc);
		return st;
	}
	if(element.isType("RadioGroupInput")) {
		var items = element.getPropertyDynamicVector("items");
		if(!(items != null)) {
			items = JkLangDynamicVector.NEW();
		}
		return JkWidgetCommonRadioButtonGroupWidget.forGroup(this.context, (element.getPropertyString("groupName")), (items.toVectorOfStrings()), JkWidgetCommonRadioButtonGroupWidget.HORIZONTAL);
	}
	if(element.isType("MultipleChoiceInput")) {
		var kvl = JkLangKeyValueList.NEW();
		var values = element.getPropertyVector("values");
		if(values != null) {
			var n = 0;
			var m = values.length;
			for(n = 0 ; n < m ; n++) {
				var value = (function(o) {
					if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
						return o;
					}
					return null;
				}.bind(this))(values[n]);
				if(value != null) {
					var key = value.getString("key", null);
					var val = value.getString("value", null);
					if(key != null) {
						kvl.add(key, val);
					}
				}
			}
		}
		return JkWidgetCommonSelectWidget.forKeyValueList(this.context, kvl);
	}
	if(element.isType("CheckBoxInput")) {
		var cbx = JkWidgetCommonCheckBoxWidget.forText(this.context, (element.getPropertyString("text")));
		cbx.setWidgetChecked((element.getPropertyBoolean("isChecked")));
		return cbx;
	}
	if(element.isType("DateInput")) {
		var v1 = JkWidgetCommonDateSelectorWidget.forContext(this.context);
		v1.setSkipYears((element.getPropertyInteger("skipYears")));
		return v1;
	}
	if(element.isType("StringListInput")) {
		var v2 = JkWidgetFormFormWidgetMyStringListInputWidget.NEW_JkUiGuiApplicationContext(this.context);
		v2.setWidgetPlaceholder((element.getLabel()));
		return v2;
	}
	var container = null;
	if(element.isType("VerticalContainer")) {
		var vb = JkWidgetVerticalBoxWidget.forContext(this.context, 0, 0);
		if(this.formWidth > 0) {
			vb.setWidgetWidthRequest(this.formWidth);
		}
		vb.setWidgetSpacing(this.elementSpacing);
		var mgn = element.getPropertyString("margin");
		if(JkLangString.isNotEmpty(mgn)) {
			vb.setWidgetMargin((this.context.getHeightValue(mgn)));
		}
		container = vb;
	}
	else if(element.isType("HorizontalContainer")) {
		var hb = JkWidgetHorizontalBoxWidget.forContext(this.context, 0, 0);
		hb.setWidgetSpacing(this.elementSpacing);
		container = hb;
	}
	else if(element.isType("GroupContainer")) {
		var vb1 = JkWidgetVerticalBoxWidget.forContext(this.context, 0, 0);
		if(this.formWidth > 0) {
			vb1.setWidgetWidthRequest(this.formWidth);
		}
		vb1.setWidgetSpacing(this.elementSpacing);
		var wlayer = JkWidgetLayerWidget.forContext(this.context);
		var bgc1 = this.getBackgroundColorForElement(element);
		wlayer.addWidget((JkWidgetCanvasWidget.forColor(this.context, bgc1)));
		var groupLabel = JkWidgetLabelWidget.forText(this.context, (element.getPropertyString("title")));
		groupLabel.setWidgetTextColor((this.getAdjustedForegroundColor(element, bgc1)));
		wlayer.addWidget((JkWidgetLayerWidget.forWidget(this.context, groupLabel, (this.context.getHeightValue("2mm")))));
		vb1.addWidget(wlayer);
		container = vb1;
	}
	if(!(container != null)) {
		console.log("Unsupported form declaration container encountered: `" + (JkLangString.safeString((element.getType()))) + ("'"));
		return null;
	}
	var array = element.getChildren();
	if(array != null) {
		var n2 = 0;
		var m2 = array.length;
		for(n2 = 0 ; n2 < m2 ; n2++) {
			var child = array[n2];
			if(child != null) {
				var ww = this.createAndRegisterWidget(child);
				if(!(ww != null)) {
					continue;
				}
				var label = child.getLabel();
				if(this.enableFieldLabels && !JkLangString.isEmpty(label)) {
					var wlayer1 = JkWidgetLayerWidget.forContext(this.context);
					var bgc2 = this.getBackgroundColorForElement(child);
					wlayer1.addWidget((JkWidgetCanvasWidget.forColor(this.context, bgc2)));
					var wbox = JkWidgetVerticalBoxWidget.forContext(this.context, 0, 0);
					var lw = JkWidgetLabelWidget.forText(this.context, label);
					lw.setWidgetTextColor((this.getAdjustedForegroundColor(child, bgc2)));
					lw.setWidgetFontSize(this.fieldLabelFontSize);
					if(this.fieldLabelFontResource != null) {
						lw.setWidgetFontResource(this.fieldLabelFontResource);
					}
					else {
						lw.setWidgetFontFamily(this.fieldLabelFontFamily);
					}
					var ss = this.context.getHeightValue("1mm");
					if(!this.fieldLabelBelow) {
						wbox.addWidget((JkWidgetLayerWidget.forWidget(this.context, lw, 0).setWidgetMarginLeft(ss).setWidgetMarginRight(ss).setWidgetMarginTop(ss)));
						wbox.addWidget1(ww, (child.getPropertyDouble("weight")));
					}
					else {
						wbox.addWidget1(ww, (child.getPropertyDouble("weight")));
						wbox.addWidget((JkWidgetLayerWidget.forWidget(this.context, lw, 0).setWidgetMarginLeft(ss).setWidgetMarginRight(ss).setWidgetMarginTop(ss)));
					}
					wlayer1.addWidget(wbox);
					this.addToContainerWithWeight(container, wlayer1, (child.getPropertyDouble("weight")));
				}
				else {
					this.addToContainerWithWeight(container, ww, (child.getPropertyDouble("weight")));
				}
			}
		}
	}
	return container;
};

JkWidgetFormFormWidget.prototype.addToContainerWithWeight = function(container, child, weight) {
	if(weight <= 0.0) {
		container.addWidget(child);
	}
	else if(JkWidgetHorizontalBoxWidget.IS_INSTANCE && JkWidgetHorizontalBoxWidget.IS_INSTANCE(container)) {
		container.addWidget1(child, weight);
	}
	else if(JkWidgetVerticalBoxWidget.IS_INSTANCE && JkWidgetVerticalBoxWidget.IS_INSTANCE(container)) {
		container.addWidget1(child, weight);
	}
	else {
		console.log("[jk.widget.form.FormWidget.addToContainerWithWeight] (FormWidget.sling:486:3): Tried to add a widget with weight to a container that is not a box. Ignoring weight.");
		container.addWidget(child);
	}
};

JkWidgetFormFormWidget.prototype.createAndRegisterWidget = function(element) {
	var v = this.createWidgetForElement(element);
	if(!(v != null)) {
		return null;
	}
	var vv = this.setStyleForWidget(v, true);
	var id = element.getId();
	if(!JkLangString.isEmpty(id)) {
		this.fieldsById.set(id, v);
	}
	return vv;
};

JkWidgetFormFormWidget.prototype.computeWidgetLayout = function(widthConstraint) {
	if(this.alignWidget != null) {
		if(widthConstraint >= this.context.getWidthValue("120mm")) {
			this.alignWidget.setAlignForIndex(0, 0.5, 0.5);
		}
		else {
			this.alignWidget.setAlignForIndex(0, 0.5, 0);
		}
	}
	JkWidgetLayerWidget.prototype.computeWidgetLayout.call(this, widthConstraint);
};

JkWidgetFormFormWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	var declaration = this.getFormDeclaration();
	if(!(declaration != null)) {
		return;
	}
	var root = declaration.getRoot();
	if(!(root != null)) {
		return;
	}
	if(this.widgetBackgroundColor != null) {
		this.addWidget((JkWidgetCanvasWidget.forColor(this.context, this.widgetBackgroundColor)));
	}
	var box = JkWidgetVerticalBoxWidget.forContext(this.context, 0, 0);
	box.setWidgetMargin(this.formMargin);
	box.setWidgetSpacing(this.formMargin);
	var topWidget = this.createAndRegisterWidget(root);
	if(topWidget != null) {
		box.addWidget1(topWidget, 1.0);
	}
	if(this.queueData != null) {
		this.setFormData(this.queueData, this.preserveUnknownValuesForQueuedData);
	}
	if(!(this.actions != null)) {
		this.addActions();
	}
	if(this.actions != null) {
		var hbox = JkWidgetHorizontalBoxWidget.forContext(this.context, 0, 0);
		hbox.setWidgetSpacing((this.context.getHeightValue("1mm")));
		if(this.actions != null) {
			var n = 0;
			var m = this.actions.length;
			for(n = 0 ; n < m ; n++) {
				var action = this.actions[n];
				if(action != null) {
					var button = JkWidgetCommonTextButtonWidget.forText(this.context, action.label, action.handler);
					var bb = this.setStyleForTextButtonWidget(button, true);
					hbox.addWidget1(bb, 1);
				}
			}
		}
		box.addWidget(hbox);
	}
	box.addWidget(this.customFooterWidget);
	var finalWidget = null;
	if(this.fillContainerWidget) {
		finalWidget = box;
	}
	else {
		this.alignWidget = JkWidgetAlignWidget.forWidget(this.context, box, 0.5, 0.5, 0);
		finalWidget = this.alignWidget;
	}
	if(this.enableScrolling) {
		var scroller = JkWidgetVerticalScrollerWidget.forWidget(this.context, finalWidget);
		this.addWidget(scroller);
	}
	else {
		this.addWidget(finalWidget);
	}
};

JkWidgetFormFormWidget.prototype.setFormData = function(data, preserveUnknownValues) {
	if(JkLangMap.count(this.fieldsById) < 1) {
		this.queueData = data;
		this.preserveUnknownValuesForQueuedData = preserveUnknownValues;
	}
	else {
		var keys = JkLangMap.getKeys(this.fieldsById);
		if(keys != null) {
			var n = 0;
			var m = keys.length;
			for(n = 0 ; n < m ; n++) {
				var key = keys[n];
				if(key != null) {
					var value = null;
					if(data != null) {
						value = data.get(key);
					}
					this.setFieldData(key, value);
				}
			}
		}
		if(preserveUnknownValues && data != null) {
			this.preservedFormData = data.duplicateMap();
			this.preserveUnknownValuesForQueuedData = false;
		}
	}
};

JkWidgetFormFormWidget.prototype.setFieldData = function(id, value) {
	var widget = (function(o) {
		if(JkWidgetWidgetWithValue.IS_INSTANCE && JkWidgetWidgetWithValue.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((JkLangMap.get(this.fieldsById, id)));
	if(!(widget != null)) {
		return;
	}
	widget.setWidgetValue(value);
};

JkWidgetFormFormWidget.prototype.getFormDataTo = function(data) {
	if(!(data != null)) {
		return;
	}
	if(this.preservedFormData != null) {
		var keys = this.preservedFormData.getKeys();
		if(keys != null) {
			var n = 0;
			var m = keys.length;
			for(n = 0 ; n < m ; n++) {
				var key = keys[n];
				if(key != null) {
					data.setObject(key, (this.preservedFormData.get(key)));
				}
			}
		}
	}
	var keys1 = JkLangMap.getKeys(this.fieldsById);
	if(keys1 != null) {
		var n2 = 0;
		var m2 = keys1.length;
		for(n2 = 0 ; n2 < m2 ; n2++) {
			var key1 = keys1[n2];
			if(key1 != null) {
				var widget = (function(o) {
					if(JkWidgetWidgetWithValue.IS_INSTANCE && JkWidgetWidgetWithValue.IS_INSTANCE(o)) {
						return o;
					}
					return null;
				}.bind(this))((JkLangMap.get(this.fieldsById, key1)));
				if(!(widget != null)) {
					continue;
				}
				data.setObject(key1, (widget.getWidgetValue()));
			}
		}
	}
};

JkWidgetFormFormWidget.prototype.getFormData = function() {
	var v = JkLangDynamicMap.NEW();
	this.getFormDataTo(v);
	return v;
};

JkWidgetFormFormWidget.prototype.clearFormData = function() {
	var clearData = JkLangDynamicMap.NEW();
	var keys = JkLangMap.getKeys(this.fieldsById);
	if(keys != null) {
		var n = 0;
		var m = keys.length;
		for(n = 0 ; n < m ; n++) {
			var key = keys[n];
			if(key != null) {
				clearData.setObject(key, null);
			}
		}
	}
	this.setFormData(clearData, false);
};

JkWidgetFormFormWidget.prototype.getElementAsWidget = function(id) {
	if(!(id != null)) {
		return null;
	}
	var widget = JkLangMap.get(this.fieldsById, id);
	if(!(widget != null)) {
		return null;
	}
	return widget;
};

JkWidgetFormFormWidget.prototype.getElementSpacing = function() {
	return this.elementSpacing;
};

JkWidgetFormFormWidget.prototype.setElementSpacing = function(v) {
	this.elementSpacing = v;
	return this;
};

JkWidgetFormFormWidget.prototype.getFormMargin = function() {
	return this.formMargin;
};

JkWidgetFormFormWidget.prototype.setFormMargin = function(v) {
	this.formMargin = v;
	return this;
};

JkWidgetFormFormWidget.prototype.getEnableFieldLabels = function() {
	return this.enableFieldLabels;
};

JkWidgetFormFormWidget.prototype.setEnableFieldLabels = function(v) {
	this.enableFieldLabels = v;
	return this;
};

JkWidgetFormFormWidget.prototype.getFieldLabelBelow = function() {
	return this.fieldLabelBelow;
};

JkWidgetFormFormWidget.prototype.setFieldLabelBelow = function(v) {
	this.fieldLabelBelow = v;
	return this;
};

JkWidgetFormFormWidget.prototype.getFormWidth = function() {
	return this.formWidth;
};

JkWidgetFormFormWidget.prototype.setFormWidth = function(v) {
	this.formWidth = v;
	return this;
};

JkWidgetFormFormWidget.prototype.getFieldLabelFontSize = function() {
	return this.fieldLabelFontSize;
};

JkWidgetFormFormWidget.prototype.setFieldLabelFontSize = function(v) {
	this.fieldLabelFontSize = v;
	return this;
};

JkWidgetFormFormWidget.prototype.getFieldLabelFontFamily = function() {
	return this.fieldLabelFontFamily;
};

JkWidgetFormFormWidget.prototype.setFieldLabelFontFamily = function(v) {
	this.fieldLabelFontFamily = v;
	return this;
};

JkWidgetFormFormWidget.prototype.getFieldLabelFontResource = function() {
	return this.fieldLabelFontResource;
};

JkWidgetFormFormWidget.prototype.setFieldLabelFontResource = function(v) {
	this.fieldLabelFontResource = v;
	return this;
};

JkWidgetFormFormWidget.prototype.getWidgetBackgroundColor = function() {
	return this.widgetBackgroundColor;
};

JkWidgetFormFormWidget.prototype.setWidgetBackgroundColor = function(v) {
	this.widgetBackgroundColor = v;
	return this;
};

JkWidgetFormFormWidget.prototype.getEnableScrolling = function() {
	return this.enableScrolling;
};

JkWidgetFormFormWidget.prototype.setEnableScrolling = function(v) {
	this.enableScrolling = v;
	return this;
};

JkWidgetFormFormWidget.prototype.getFillContainerWidget = function() {
	return this.fillContainerWidget;
};

JkWidgetFormFormWidget.prototype.setFillContainerWidget = function(v) {
	this.fillContainerWidget = v;
	return this;
};

JkWidgetFormFormWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetFormFormWidget"] === true;
};
