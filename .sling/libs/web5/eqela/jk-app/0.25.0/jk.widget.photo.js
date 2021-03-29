let JkWidgetPhotoPhotoSelector = function() {
	this.context = null;
};

JkWidgetPhotoPhotoSelector.prototype._t = { "JkWidgetPhotoPhotoSelector" : true };
JkWidgetPhotoPhotoSelector.prototype._tobj = JkWidgetPhotoPhotoSelector;

JkWidgetPhotoPhotoSelector.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetPhotoPhotoSelector;
	return v.CTOR_JkWidgetPhotoPhotoSelector_JkUiGuiApplicationContext(context);
};

JkWidgetPhotoPhotoSelector.prototype.CTOR_JkWidgetPhotoPhotoSelector_JkUiGuiApplicationContext = function(context) {
	this.context = null;
	this.context = context;
	return this;
};

JkWidgetPhotoPhotoSelector.prototype.openPhotoDialog = function(widget, callback) {
	var cb = callback;
	var img = null;
	var m = null;
	var fileSelector = document.createElement('input');
	fileSelector.setAttribute('type', "file");
	fileSelector.setAttribute('accept', "image/*");
	fileSelector.addEventListener("change", function handleFiles() {
		var files = fileSelector.files;
		if(typeof files === "undefined" || files === null) {
			console.log("undefined files");
			return;
		}
		var file = files[0];
		if(typeof file === "undefined" || file === null) {
			console.log("undefined file");
			return;
		}
		var reader = new FileReader();
		m = new Image();
		reader.onload = function(event) {
			if(reader.readyState === 2) {
				m.src = event.target.result;
				m.onload = function() {
					img = JkUiImageForBrowser.NEW();
					img.image = m;
					var path = fileSelector.value;
					var filename = path.substring(path.lastIndexOf("\\")+1);
					console.log("Filename: " + filename);
					if(cb != null) {
						CaveHTMLDOM.remove(fileSelector);
						if(filename == null) {
							cb(null, null, Error.forCode("no_file_data"))
						}
						else {
							cb(img, filename, null)
						}
					}
				}
			}
		};
		reader.readAsDataURL(file);
	});
	fileSelector.click();
	CaveHTMLDOM.appendToBody(fileSelector);
	;
};

JkWidgetPhotoPhotoSelector.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetPhotoPhotoSelector"] === true;
};
