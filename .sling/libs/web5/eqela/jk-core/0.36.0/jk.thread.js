let JkThreadCriticalSection = function() {};

JkThreadCriticalSection.prototype._t = { "JkThreadCriticalSection" : true };
JkThreadCriticalSection.prototype._tobj = JkThreadCriticalSection;

JkThreadCriticalSection.NEW = function() {
	var v = new JkThreadCriticalSection;
	return v.CTOR_JkThreadCriticalSection();
};

JkThreadCriticalSection.prototype.CTOR_JkThreadCriticalSection = function() {
	return this;
};

JkThreadCriticalSection.execute = function(value, block) {
	var mutex = JkThreadMutex.forObject(value);
	if(mutex != null) {
		mutex.lockMutex();
	}
	if(block != null) {
		block();
	}
	if(mutex != null) {
		mutex.unlockMutex();
	}
};

JkThreadCriticalSection.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkThreadCriticalSection"] === true;
};

let JkThreadCurrentThread = function() {};

JkThreadCurrentThread.prototype._t = { "JkThreadCurrentThread" : true };
JkThreadCurrentThread.prototype._tobj = JkThreadCurrentThread;

JkThreadCurrentThread.NEW = function() {
	var v = new JkThreadCurrentThread;
	return v.CTOR_JkThreadCurrentThread();
};

JkThreadCurrentThread.prototype.CTOR_JkThreadCurrentThread = function() {
	return this;
};

JkThreadCurrentThread.sleepSeconds = function(seconds) {
	JkThreadCurrentThread.sleepMilliSeconds((seconds * 1000));
};

JkThreadCurrentThread.sleepMicroSeconds = function(uSeconds) {
	JkThreadCurrentThread.sleepMilliSeconds((uSeconds / 1000));
};

JkThreadCurrentThread.sleepMilliSeconds = function(mSeconds) {
	console.log("[jk.thread.CurrentThread.sleepMilliSeconds] (CurrentThread.sling:95:3): Not implemented");
};

JkThreadCurrentThread.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkThreadCurrentThread"] === true;
};

let JkThreadThreadPoolTaskRunner = function() {
	this.runnable = null;
	this.myParent = null;
};

JkThreadThreadPoolTaskRunner.prototype._t = {
	"JkThreadThreadPoolTaskRunner" : true,
	"JkLangRunnable" : true
};
JkThreadThreadPoolTaskRunner.prototype._tobj = JkThreadThreadPoolTaskRunner;

JkThreadThreadPoolTaskRunner.NEW = function() {
	var v = new JkThreadThreadPoolTaskRunner;
	return v.CTOR_JkThreadThreadPoolTaskRunner();
};

JkThreadThreadPoolTaskRunner.prototype.CTOR_JkThreadThreadPoolTaskRunner = function() {
	this.myParent = null;
	this.runnable = null;
	return this;
};

JkThreadThreadPoolTaskRunner.prototype.run = function() {
	while(true){
		this.runnable.run();
		var next = this.myParent.getTaskFromQueue();
		if(!(next != null)) {
			break;
		}
		this.runnable = next;
	}
};

JkThreadThreadPoolTaskRunner.prototype.getRunnable = function() {
	return this.runnable;
};

JkThreadThreadPoolTaskRunner.prototype.setRunnable = function(v) {
	this.runnable = v;
	return this;
};

JkThreadThreadPoolTaskRunner.prototype.getMyParent = function() {
	return this.myParent;
};

JkThreadThreadPoolTaskRunner.prototype.setMyParent = function(v) {
	this.myParent = v;
	return this;
};

JkThreadThreadPoolTaskRunner.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkThreadThreadPoolTaskRunner"] === true;
};

let JkThreadThreadPool = function() {
	this.maximumPoolSize = 0;
	this.queue = null;
	this.runningThreadsCount = 0;
	this.mutex = null;
};

JkThreadThreadPool.prototype._t = { "JkThreadThreadPool" : true };
JkThreadThreadPool.prototype._tobj = JkThreadThreadPool;

JkThreadThreadPool.NEW = function() {
	var v = new JkThreadThreadPool;
	return v.CTOR_JkThreadThreadPool();
};

JkThreadThreadPool.prototype.CTOR_JkThreadThreadPool = function() {
	this.mutex = null;
	this.runningThreadsCount = 0;
	this.queue = null;
	this.maximumPoolSize = 0;
	this.queue = new Array;
	this.mutex = JkThreadMutex.create();
	return this;
};

JkThreadThreadPool.forMaxPoolSize = function(maximumPoolSize) {
	var v = JkThreadThreadPool.NEW();
	v.maximumPoolSize = maximumPoolSize;
	return v;
};

JkThreadThreadPool.prototype.getRunningThreadsCount = function() {
	return this.runningThreadsCount;
};

JkThreadThreadPool.prototype.submitTask = function(task) {
	this.execute(task);
};

JkThreadThreadPool.prototype.submitTasks = function(tasks) {
	if(tasks != null) {
		var n = 0;
		var m = tasks.length;
		for(n = 0 ; n < m ; n++) {
			var task = tasks[n];
			if(task != null) {
				this.execute(task);
			}
		}
	}
};

JkThreadThreadPool.prototype.execute = function(task) {
	if(!(task != null)) {
		return;
	}
	this.mutex.lockMutex();
	if(this.runningThreadsCount < this.maximumPoolSize) {
		var runner = JkThreadThreadPoolTaskRunner.NEW();
		runner.setMyParent(this);
		runner.setRunnable(task);
		if(JkThreadThread.start(runner) != null) {
			this.runningThreadsCount++;
		}
		else {
			this.queue.push(task);
		}
	}
	else {
		this.queue.push(task);
	}
	this.mutex.unlockMutex();
};

JkThreadThreadPool.prototype.getTaskFromQueue = function() {
	this.mutex.lockMutex();
	var item = (function(o) {
		if(JkLangRunnable.IS_INSTANCE && JkLangRunnable.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((JkLangVector.popFirst(this.queue)));
	if(!(item != null)) {
		this.runningThreadsCount--;
	}
	this.mutex.unlockMutex();
	return item;
};

JkThreadThreadPool.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkThreadThreadPool"] === true;
};

let JkThreadThread = function() {};

JkThreadThread.prototype._t = { "JkThreadThread" : true };
JkThreadThread.prototype._tobj = JkThreadThread;

JkThreadThread.NEW = function() {
	var v = new JkThreadThread;
	return v.CTOR_JkThreadThread();
};

JkThreadThread.prototype.CTOR_JkThreadThread = function() {
	return this;
};

JkThreadThread.setLocalValue = function(id, value) {
	console.log("[jk.thread.Thread.setLocalValue] (Thread.sling:227:3): Not implemented.");
};

JkThreadThread.getLocalValue = function(id) {
	console.log("[jk.thread.Thread.getLocalValue] (Thread.sling:252:3): Not implemented.");
	return null;
};

JkThreadThread.removeLocalValue = function(id) {
	console.log("[jk.thread.Thread.removeLocalValue] (Thread.sling:280:3): Not implemented.");
};

JkThreadThread.start = function(runnable) {
	if(!(runnable != null)) {
		return null;
	}
	console.log("[jk.thread.Thread.start] (Thread.sling:359:3): Not implemented");
	return null;
};

JkThreadThread.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkThreadThread"] === true;
};

let JkThreadRunningThread = {};

JkThreadRunningThread.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkThreadRunningThread"] === true;
};

let JkThreadMutex = function() {};

JkThreadMutex.prototype._t = { "JkThreadMutex" : true };
JkThreadMutex.prototype._tobj = JkThreadMutex;

JkThreadMutex.NEW = function() {
	var v = new JkThreadMutex;
	return v.CTOR_JkThreadMutex();
};

JkThreadMutex.prototype.CTOR_JkThreadMutex = function() {
	return this;
};

JkThreadMutex.create = function() {
	console.log("[jk.thread.Mutex.create] (Mutex.sling:48:3): Not implemented");
	return null;
};

JkThreadMutex.forObject = function(value) {
	console.log("[jk.thread.Mutex.forObject] (Mutex.sling:55:2): Not implemented");
	return null;
};

JkThreadMutex.prototype.lockMutex = function() {};

JkThreadMutex.prototype.unlockMutex = function() {};

JkThreadMutex.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkThreadMutex"] === true;
};
