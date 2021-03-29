let JkTimeSystemClock = function() {};

JkTimeSystemClock.prototype._t = { "JkTimeSystemClock" : true };
JkTimeSystemClock.prototype._tobj = JkTimeSystemClock;

JkTimeSystemClock.NEW = function() {
	var v = new JkTimeSystemClock;
	return v.CTOR_JkTimeSystemClock();
};

JkTimeSystemClock.prototype.CTOR_JkTimeSystemClock = function() {
	return this;
};

JkTimeSystemClock.asDateTimeUTC = function() {
	return JkLangDateTime.forSeconds((JkTimeSystemClock.asUTCSeconds()));
};

JkTimeSystemClock.asDateTimeLocal = function() {
	var v = JkLangDateTime.forSeconds((JkTimeSystemClock.asSeconds()));
	v.setTimezoneOffset((JkTimeSystemClock.getTimezoneOffsetAsSeconds()));
	return v;
};

JkTimeSystemClock.getTimezoneOffsetAsSeconds = function() {
	var v = 0;
	v = -(new Date().getTimezoneOffset());
	;
	return v * 60;
};

JkTimeSystemClock.asUTCSeconds = function() {
	return JkTimeSystemClock.asSeconds() + JkTimeSystemClock.getTimezoneOffsetAsSeconds();
};

JkTimeSystemClock.asSeconds = function() {
	var v = 0;
	v = new Date().getTime() / 1000;
	;
	v -= JkTimeSystemClock.getTimezoneOffsetAsSeconds();
	return v;
};

JkTimeSystemClock.asTimeValue = function() {
	var v = JkLangTimeValue.NEW();
	JkTimeSystemClock.update(v);
	return v;
};

JkTimeSystemClock.update = function(v) {
	if(!(v != null)) {
		return;
	}
	var ct = new Date().getTime();
	var ms = ct % 1000;
	v.setSeconds(parseInt(ct/1000));
	v.setMicroSeconds(parseInt(ms * 1000));
	;
};

JkTimeSystemClock.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTimeSystemClock"] === true;
};
