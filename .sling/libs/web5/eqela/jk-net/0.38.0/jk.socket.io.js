let JkSocketIoIOManager = function() {};

JkSocketIoIOManager.prototype._t = {
	"JkSocketIoIOManager" : true,
	"JkLangEventLoop" : true
};
JkSocketIoIOManager.prototype._tobj = JkSocketIoIOManager;

JkSocketIoIOManager.NEW = function() {
	var v = new JkSocketIoIOManager;
	return v.CTOR_JkSocketIoIOManager();
};

JkSocketIoIOManager.prototype.CTOR_JkSocketIoIOManager = function() {
	return this;
};

JkSocketIoIOManager.createDefault = function() {
	return null;
};

JkSocketIoIOManager.setCurrent = function(iomgr) {
	JkThreadThread.setLocalValue("__IOManager", iomgr);
};

JkSocketIoIOManager.getCurrent = function() {
	return (function(o) {
		if(JkSocketIoIOManager.IS_INSTANCE && JkSocketIoIOManager.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((JkThreadThread.getLocalValue("__IOManager")));
};

JkSocketIoIOManager.prototype.addWithReadListener = function(o, rrl) {
	var v = this.add(o);
	if(v != null) {
		v.setReadListener(rrl);
	}
	return v;
};

JkSocketIoIOManager.prototype.addWithWriteListener = function(o, wrl) {
	var v = this.add(o);
	if(v != null) {
		v.setWriteListener(wrl);
	}
	return v;
};

JkSocketIoIOManager.prototype.execute = function(ctx) {
	JkSocketIoIOManager.setCurrent(this);
	var v = this.doExecute(ctx);
	JkThreadThread.removeLocalValue("__IOManager");
	return v;
};

JkSocketIoIOManager.prototype.add = function(o) {};

JkSocketIoIOManager.prototype.startTimer = function(delay, handler) {};

JkSocketIoIOManager.prototype.stop = function() {};

JkSocketIoIOManager.prototype.doExecute = function(ctx) {};

JkSocketIoIOManager.prototype.runScheduled = function(timeout, runnable) {
	if(!(timeout >= 0)) {
		return;
	}
	var rr = runnable;
	if(!(rr != null)) {
		return;
	}
	this.startTimer(timeout, (function() {
		rr.run();
		return false;
	}.bind(this)));
};

JkSocketIoIOManager.prototype.runInBackground = function(runnable) {
	if(!(runnable != null)) {
		return;
	}
	JkThreadThread.start(runnable);
};

JkSocketIoIOManager.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSocketIoIOManager"] === true;
};

let JkSocketIoIOManagerEntry = {};

JkSocketIoIOManagerEntry.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSocketIoIOManagerEntry"] === true;
};

let JkSocketIoIOManagerTimer = {};

JkSocketIoIOManagerTimer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSocketIoIOManagerTimer"] === true;
};
