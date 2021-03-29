let JkJkopJkop = function() {};

JkJkopJkop.prototype._t = { "JkJkopJkop" : true };
JkJkopJkop.prototype._tobj = JkJkopJkop;

JkJkopJkop.NEW = function() {
	var v = new JkJkopJkop;
	return v.CTOR_JkJkopJkop();
};

JkJkopJkop.prototype.CTOR_JkJkopJkop = function() {
	return this;
};

JkJkopJkop.getVersion = function() {
	return "0.36.0";
};

JkJkopJkop.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkJkopJkop"] === true;
};
