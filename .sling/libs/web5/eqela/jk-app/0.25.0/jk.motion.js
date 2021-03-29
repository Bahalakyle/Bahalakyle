let JkMotionEntity = function() {
	this.index = -1;
	this.scene = null;
};

JkMotionEntity.prototype._t = { "JkMotionEntity" : true };
JkMotionEntity.prototype._tobj = JkMotionEntity;

JkMotionEntity.NEW = function() {
	var v = new JkMotionEntity;
	return v.CTOR_JkMotionEntity();
};

JkMotionEntity.prototype.CTOR_JkMotionEntity = function() {
	this.scene = null;
	this.index = -1;
	return this;
};

JkMotionEntity.prototype.setScene = function(scene) {
	this.scene = scene;
};

JkMotionEntity.prototype.getScene = function() {
	return this.scene;
};

JkMotionEntity.prototype.initialize = function() {
};

JkMotionEntity.prototype.cleanup = function() {
};

JkMotionEntity.prototype.tick = function(gameTime, delta) {
};

JkMotionEntity.prototype.remove = function() {
	var ss = this.scene;
	if(ss != null) {
		ss.removeEntity(this);
	}
};

JkMotionEntity.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionEntity"] === true;
};

let JkMotionSprite = {};

JkMotionSprite.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionSprite"] === true;
};

let JkMotionTextureSheetProperties = function() {
	this.cols = -1;
	this.rows = -1;
	this.sourceSkipX = 0;
	this.sourceSkipY = 0;
	this.sourceImageWidth = -1;
	this.sourceImageHeight = -1;
	this.maxImages = -1;
	this.resizeToWidth = -1;
	this.resizeToHeight = -1;
};

JkMotionTextureSheetProperties.prototype._t = { "JkMotionTextureSheetProperties" : true };
JkMotionTextureSheetProperties.prototype._tobj = JkMotionTextureSheetProperties;

JkMotionTextureSheetProperties.NEW = function() {
	var v = new JkMotionTextureSheetProperties;
	return v.CTOR_JkMotionTextureSheetProperties();
};

JkMotionTextureSheetProperties.prototype.CTOR_JkMotionTextureSheetProperties = function() {
	this.resizeToHeight = -1;
	this.resizeToWidth = -1;
	this.maxImages = -1;
	this.sourceImageHeight = -1;
	this.sourceImageWidth = -1;
	this.sourceSkipY = 0;
	this.sourceSkipX = 0;
	this.rows = -1;
	this.cols = -1;
	return this;
};

JkMotionTextureSheetProperties.forColsRows = function(cols, rows, maxImages) {
	var v = JkMotionTextureSheetProperties.NEW();
	v.setCols(cols);
	v.setRows(rows);
	v.setMaxImages(maxImages);
	return v;
};

JkMotionTextureSheetProperties.forWidthHeight = function(width, height, maxImages) {
	var v = JkMotionTextureSheetProperties.NEW();
	v.setSourceImageWidth(width);
	v.setSourceImageHeight(height);
	v.setMaxImages(maxImages);
	return v;
};

JkMotionTextureSheetProperties.prototype.getCols = function() {
	return this.cols;
};

JkMotionTextureSheetProperties.prototype.setCols = function(v) {
	this.cols = v;
	return this;
};

JkMotionTextureSheetProperties.prototype.getRows = function() {
	return this.rows;
};

JkMotionTextureSheetProperties.prototype.setRows = function(v) {
	this.rows = v;
	return this;
};

JkMotionTextureSheetProperties.prototype.getSourceSkipX = function() {
	return this.sourceSkipX;
};

JkMotionTextureSheetProperties.prototype.setSourceSkipX = function(v) {
	this.sourceSkipX = v;
	return this;
};

JkMotionTextureSheetProperties.prototype.getSourceSkipY = function() {
	return this.sourceSkipY;
};

JkMotionTextureSheetProperties.prototype.setSourceSkipY = function(v) {
	this.sourceSkipY = v;
	return this;
};

JkMotionTextureSheetProperties.prototype.getSourceImageWidth = function() {
	return this.sourceImageWidth;
};

JkMotionTextureSheetProperties.prototype.setSourceImageWidth = function(v) {
	this.sourceImageWidth = v;
	return this;
};

JkMotionTextureSheetProperties.prototype.getSourceImageHeight = function() {
	return this.sourceImageHeight;
};

JkMotionTextureSheetProperties.prototype.setSourceImageHeight = function(v) {
	this.sourceImageHeight = v;
	return this;
};

JkMotionTextureSheetProperties.prototype.getMaxImages = function() {
	return this.maxImages;
};

JkMotionTextureSheetProperties.prototype.setMaxImages = function(v) {
	this.maxImages = v;
	return this;
};

JkMotionTextureSheetProperties.prototype.getResizeToWidth = function() {
	return this.resizeToWidth;
};

JkMotionTextureSheetProperties.prototype.setResizeToWidth = function(v) {
	this.resizeToWidth = v;
	return this;
};

JkMotionTextureSheetProperties.prototype.getResizeToHeight = function() {
	return this.resizeToHeight;
};

JkMotionTextureSheetProperties.prototype.setResizeToHeight = function(v) {
	this.resizeToHeight = v;
	return this;
};

JkMotionTextureSheetProperties.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionTextureSheetProperties"] === true;
};

let JkMotionTextProperties = function() {
	this.text = null;
	this.textColor = null;
	this.backgroundColor = null;
	this.fontFamily = null;
	this.fontResource = null;
	this.fontFile = null;
	this.fontIsItalic = false;
	this.fontIsBold = false;
	this.fontSizeRelative = 0.0;
	this.fontSizeAbsolute = 1.0;
	this.fontSizeDescription = null;
};

JkMotionTextProperties.prototype._t = { "JkMotionTextProperties" : true };
JkMotionTextProperties.prototype._tobj = JkMotionTextProperties;

JkMotionTextProperties.NEW = function() {
	var v = new JkMotionTextProperties;
	return v.CTOR_JkMotionTextProperties();
};

JkMotionTextProperties.prototype.CTOR_JkMotionTextProperties = function() {
	this.fontSizeDescription = null;
	this.fontSizeAbsolute = 1.0;
	this.fontSizeRelative = 0.0;
	this.fontIsBold = false;
	this.fontIsItalic = false;
	this.fontFile = null;
	this.fontResource = null;
	this.fontFamily = null;
	this.backgroundColor = null;
	this.textColor = null;
	this.text = null;
	this.textColor = JkGfxColor.black();
	return this;
};

JkMotionTextProperties.forText = function(tt) {
	var v = JkMotionTextProperties.NEW();
	v.setText(tt);
	return v;
};

JkMotionTextProperties.prototype.getText = function() {
	return this.text;
};

JkMotionTextProperties.prototype.setText = function(v) {
	this.text = v;
	return this;
};

JkMotionTextProperties.prototype.getTextColor = function() {
	return this.textColor;
};

JkMotionTextProperties.prototype.setTextColor = function(v) {
	this.textColor = v;
	return this;
};

JkMotionTextProperties.prototype.getBackgroundColor = function() {
	return this.backgroundColor;
};

JkMotionTextProperties.prototype.setBackgroundColor = function(v) {
	this.backgroundColor = v;
	return this;
};

JkMotionTextProperties.prototype.getFontFamily = function() {
	return this.fontFamily;
};

JkMotionTextProperties.prototype.setFontFamily = function(v) {
	this.fontFamily = v;
	return this;
};

JkMotionTextProperties.prototype.getFontResource = function() {
	return this.fontResource;
};

JkMotionTextProperties.prototype.setFontResource = function(v) {
	this.fontResource = v;
	return this;
};

JkMotionTextProperties.prototype.getFontFile = function() {
	return this.fontFile;
};

JkMotionTextProperties.prototype.setFontFile = function(v) {
	this.fontFile = v;
	return this;
};

JkMotionTextProperties.prototype.getFontIsItalic = function() {
	return this.fontIsItalic;
};

JkMotionTextProperties.prototype.setFontIsItalic = function(v) {
	this.fontIsItalic = v;
	return this;
};

JkMotionTextProperties.prototype.getFontIsBold = function() {
	return this.fontIsBold;
};

JkMotionTextProperties.prototype.setFontIsBold = function(v) {
	this.fontIsBold = v;
	return this;
};

JkMotionTextProperties.prototype.getFontSizeRelative = function() {
	return this.fontSizeRelative;
};

JkMotionTextProperties.prototype.setFontSizeRelative = function(v) {
	this.fontSizeRelative = v;
	return this;
};

JkMotionTextProperties.prototype.getFontSizeAbsolute = function() {
	return this.fontSizeAbsolute;
};

JkMotionTextProperties.prototype.setFontSizeAbsolute = function(v) {
	this.fontSizeAbsolute = v;
	return this;
};

JkMotionTextProperties.prototype.getFontSizeDescription = function() {
	return this.fontSizeDescription;
};

JkMotionTextProperties.prototype.setFontSizeDescription = function(v) {
	this.fontSizeDescription = v;
	return this;
};

JkMotionTextProperties.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionTextProperties"] === true;
};

let JkMotionSpriteLayer = {};

JkMotionSpriteLayer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionSpriteLayer"] === true;
};

let JkMotionScene = function() {
	this.manager = null;
	this.backend = null;
	this.context = null;
};

JkMotionScene.prototype._t = { "JkMotionScene" : true };
JkMotionScene.prototype._tobj = JkMotionScene;

JkMotionScene.NEW = function() {
	var v = new JkMotionScene;
	return v.CTOR_JkMotionScene();
};

JkMotionScene.prototype.CTOR_JkMotionScene = function() {
	this.context = null;
	this.backend = null;
	this.manager = null;
	return this;
};

JkMotionScene.prototype.setContext = function(value) {
	this.context = value;
};

JkMotionScene.prototype.setManager = function(value) {
	this.manager = value;
	return this;
};

JkMotionScene.prototype.getManager = function() {
	return this.manager;
};

JkMotionScene.prototype.setBackend = function(value) {
	this.backend = value;
	return this;
};

JkMotionScene.prototype.getBackend = function() {
	return this.backend;
};

JkMotionScene.prototype.onPreInitialize = function(context) {
};

JkMotionScene.prototype.initialize = function() {
};

JkMotionScene.prototype.start = function() {
};

JkMotionScene.prototype.onKeyEvent = function(event) {
};

JkMotionScene.prototype.onPointerEvent = function(event) {
};

JkMotionScene.prototype.tick = function(gameTime, delta) {
};

JkMotionScene.prototype.stop = function() {
};

JkMotionScene.prototype.cleanup = function() {
};

JkMotionScene.prototype.createImageFromResource = function(name) {
	var v = this.backend.createImageFromResource(name);
	if(!(v != null)) {
		JkLogLog.error(this.context, "Failed to create image from resource: `" + (JkLangString.safeString(name)) + ("'"));
		return null;
	}
	return v;
};

JkMotionScene.prototype.createTextureForImageResource = function(name) {
	var v = this.backend.createTextureForImageResource(name);
	if(!(v != null)) {
		JkLogLog.error(this.context, "Failed to create image for image resource: `" + (JkLangString.safeString(name)) + ("'"));
		return null;
	}
	return v;
};

JkMotionScene.prototype.createTextureForImage = function(image) {
	var v = this.backend.createTextureForImage(image);
	if(!(v != null)) {
		JkLogLog.error(this.context, "Failed to create texture for image");
		return null;
	}
	return v;
};

JkMotionScene.prototype.createTextureForColor = function(color) {
	return this.backend.createTextureForColor(color);
};

JkMotionScene.prototype.deleteTexture = function(texture) {
	this.backend.deleteTexture(texture);
};

JkMotionScene.prototype.replaceScene = function(scene) {
	if(this.manager != null) {
		this.manager.replaceScene(scene);
	}
};

JkMotionScene.prototype.pushScene = function(scene) {
	if(this.manager != null) {
		this.manager.pushScene(scene);
	}
};

JkMotionScene.prototype.popScene = function() {
	if(this.manager != null) {
		this.manager.popScene();
	}
};

JkMotionScene.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionScene"] === true;
};

let JkMotionSceneManager = function() {
	this.sceneStack = null;
	this.isInitialized = false;
	this.isStarted = false;
	this.backend = null;
	this.context = null;
};

JkMotionSceneManager.prototype._t = { "JkMotionSceneManager" : true };
JkMotionSceneManager.prototype._tobj = JkMotionSceneManager;

JkMotionSceneManager.NEW = function() {
	var v = new JkMotionSceneManager;
	return v.CTOR_JkMotionSceneManager();
};

JkMotionSceneManager.prototype.CTOR_JkMotionSceneManager = function() {
	this.context = null;
	this.backend = null;
	this.isStarted = false;
	this.isInitialized = false;
	this.sceneStack = null;
	this.sceneStack = JkLangStack.NEW();
	return this;
};

JkMotionSceneManager.forScene = function(scene, backend) {
	var v = JkMotionSceneManager.NEW();
	v.setBackend(backend);
	v.pushScene(scene);
	return v;
};

JkMotionSceneManager.prototype.initialize = function() {
	this.isInitialized = true;
	var scene = this.sceneStack.peek();
	if(scene != null) {
		scene.initialize();
	}
};

JkMotionSceneManager.prototype.start = function() {
	this.isStarted = true;
	var scene = this.sceneStack.peek();
	if(scene != null) {
		scene.start();
	}
};

JkMotionSceneManager.prototype.stop = function() {
	this.isStarted = false;
	var scene = this.sceneStack.peek();
	if(scene != null) {
		scene.stop();
	}
};

JkMotionSceneManager.prototype.cleanup = function() {
	this.isInitialized = false;
	while(this.doPopScene()){
		;
	}
};

JkMotionSceneManager.prototype.onNewCurrentScene = function() {
	var scene = this.sceneStack.peek();
	if(!(scene != null)) {
		return;
	}
	if(this.isInitialized) {
		scene.initialize();
	}
	if(this.isStarted) {
		scene.start();
	}
};

JkMotionSceneManager.prototype.getCurrentScene = function() {
	return this.sceneStack.peek();
};

JkMotionSceneManager.prototype.replaceScene = function(next) {
	this.doReplaceCurrentScene(next);
};

JkMotionSceneManager.prototype.doReplaceCurrentScene = function(next) {
	this.popScene();
	this.pushScene(next);
};

JkMotionSceneManager.prototype.pushScene = function(scene) {
	var currentScene = this.sceneStack.peek();
	if(currentScene != null) {
		if(this.isStarted) {
			currentScene.stop();
		}
		if(this.isInitialized) {
			currentScene.cleanup();
		}
	}
	if(scene != null) {
		scene.setContext(this.context);
		scene.setBackend(this.backend);
		scene.setManager(this);
		this.sceneStack.push(scene);
		this.onNewCurrentScene();
	}
};

JkMotionSceneManager.prototype.popScene = function() {
	this.doPopScene();
};

JkMotionSceneManager.prototype.doPopScene = function() {
	var currentScene = this.sceneStack.pop();
	if(currentScene != null) {
		if(this.isStarted) {
			currentScene.stop();
		}
		if(this.isInitialized) {
			currentScene.cleanup();
		}
		currentScene.setManager(null);
		currentScene.setBackend(null);
		this.onNewCurrentScene();
		return true;
	}
	return false;
};

JkMotionSceneManager.prototype.getBackend = function() {
	return this.backend;
};

JkMotionSceneManager.prototype.setBackend = function(v) {
	this.backend = v;
	return this;
};

JkMotionSceneManager.prototype.getContext = function() {
	return this.context;
};

JkMotionSceneManager.prototype.setContext = function(v) {
	this.context = v;
	return this;
};

JkMotionSceneManager.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionSceneManager"] === true;
};

let JkMotionTextSprite = {};

JkMotionTextSprite.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionTextSprite"] === true;
};

let JkMotionMultiSpriteEntity = function() {
	JkMotionEntity.call(this);
	this.layer = null;
	this.x = 0.0;
	this.y = 0.0;
};

JkMotionMultiSpriteEntity.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkMotionEntity.prototype);
JkMotionMultiSpriteEntity.prototype.constructor = JkMotionMultiSpriteEntity;
JkMotionMultiSpriteEntity.prototype._t = {
	"JkMotionMultiSpriteEntity" : true,
	"JkMotionEntity" : true
};
JkMotionMultiSpriteEntity.prototype._tobj = JkMotionMultiSpriteEntity;

JkMotionMultiSpriteEntity.NEW = function() {
	var v = new JkMotionMultiSpriteEntity;
	return v.CTOR_JkMotionMultiSpriteEntity();
};

JkMotionMultiSpriteEntity.prototype.CTOR_JkMotionMultiSpriteEntity = function() {
	this.y = 0.0;
	this.x = 0.0;
	this.layer = null;
	if(JkMotionEntity.prototype.CTOR_JkMotionEntity.call(this) == null) {
		return null;
	}
	return this;
};

JkMotionMultiSpriteEntity.prototype.layoutSprites = function(x, y) {
	;
};

JkMotionMultiSpriteEntity.prototype.initialize = function() {
	JkMotionEntity.prototype.initialize.call(this);
	if(this.layer == null) {
		this.layer = (function(o) {
			if(JkMotionSpriteLayer.IS_INSTANCE && JkMotionSpriteLayer.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))(this.scene);
	}
};

JkMotionMultiSpriteEntity.prototype.cleanup = function() {
	JkMotionEntity.prototype.cleanup.call(this);
	this.layer = null;
};

JkMotionMultiSpriteEntity.prototype.move = function(x, y) {
	this.x = x;
	this.y = y;
	this.layoutSprites(x, y);
};

JkMotionMultiSpriteEntity.prototype.onLayout = function() {
	this.layoutSprites(this.x, this.y);
};

JkMotionMultiSpriteEntity.prototype.getX = function() {
	return this.x;
};

JkMotionMultiSpriteEntity.prototype.getY = function() {
	return this.y;
};

JkMotionMultiSpriteEntity.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionMultiSpriteEntity"] === true;
};

let JkMotionContainerSprite = {};

JkMotionContainerSprite.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionContainerSprite"] === true;
};

let JkMotionSpriteScene = function() {
	JkMotionScene.call(this);
	this.layer = null;
	this.backgroundColor = null;
	this.backgroundTexture = null;
	this.backgroundSprite = null;
};

JkMotionSpriteScene.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkMotionScene.prototype);
JkMotionSpriteScene.prototype.constructor = JkMotionSpriteScene;
JkMotionSpriteScene.prototype._t = {
	"JkMotionScene" : true,
	"JkMotionSpriteLayer" : true,
	"JkMotionSpriteScene" : true
};
JkMotionSpriteScene.prototype._tobj = JkMotionSpriteScene;

JkMotionSpriteScene.NEW = function() {
	var v = new JkMotionSpriteScene;
	return v.CTOR_JkMotionSpriteScene();
};

JkMotionSpriteScene.prototype.CTOR_JkMotionSpriteScene = function() {
	this.backgroundSprite = null;
	this.backgroundTexture = null;
	this.backgroundColor = null;
	this.layer = null;
	if(JkMotionScene.prototype.CTOR_JkMotionScene.call(this) == null) {
		return null;
	}
	return this;
};

JkMotionSpriteScene.prototype.getLayer = function() {
	return this.layer;
};

JkMotionSpriteScene.prototype.setBackgroundColor = function(color) {
	this.backgroundColor = color;
	this.updateBackgroundColor();
};

JkMotionSpriteScene.prototype.getBackgroundTexture = function() {
	if(this.backgroundTexture != null) {
		return this.backgroundTexture;
	}
	if(this.backgroundColor != null) {
		return this.createTextureForColor(this.backgroundColor);
	}
	return null;
};

JkMotionSpriteScene.prototype.updateBackgroundColor = function() {
	if(this.backgroundSprite == null) {
		if(this.layer != null) {
			var txt = this.getBackgroundTexture();
			if(txt != null) {
				this.backgroundSprite = this.layer.addTextureSpriteForSize(txt, (this.layer.getReferenceWidth()), (this.layer.getReferenceHeight()));
				this.backgroundSprite.move(0, 0);
			}
		}
	}
	else {
		var txt1 = this.getBackgroundTexture();
		if(txt1 != null) {
			this.backgroundSprite.setTexture(txt1);
		}
	}
};

JkMotionSpriteScene.prototype.initialize = function() {
	JkMotionScene.prototype.initialize.call(this);
	this.layer = this.backend.createSpriteLayer();
	this.updateBackgroundColor();
};

JkMotionSpriteScene.prototype.cleanup = function() {
	JkMotionScene.prototype.cleanup.call(this);
	this.layer.removeAllSprites();
	this.backend.deleteSpriteLayer(this.layer);
	this.layer = null;
	this.backgroundSprite = null;
};

JkMotionSpriteScene.prototype.onPointerEvent = function(event) {
	if(this.layer != null) {
		event.x = event.x * this.layer.getReferenceWidth();
		event.y = event.y * this.layer.getReferenceHeight();
	}
};

JkMotionSpriteScene.prototype.addTextureSpriteForSize = function(texture, width, height) {
	return this.layer.addTextureSpriteForSize(texture, width, height);
};

JkMotionSpriteScene.prototype.addTextSprite = function(text) {
	return this.layer.addTextSprite(text);
};

JkMotionSpriteScene.prototype.addContainerSprite = function(width, height) {
	return this.layer.addContainerSprite(width, height);
};

JkMotionSpriteScene.prototype.removeSprite = function(sprite) {
	this.layer.removeSprite(sprite);
};

JkMotionSpriteScene.prototype.removeAllSprites = function() {
	this.layer.removeAllSprites();
};

JkMotionSpriteScene.prototype.setReferenceWidth = function(referenceWidth) {
	this.layer.setReferenceWidth(referenceWidth);
};

JkMotionSpriteScene.prototype.setReferenceHeight = function(referenceHeight) {
	this.layer.setReferenceHeight(referenceHeight);
};

JkMotionSpriteScene.prototype.getReferenceWidth = function() {
	return this.layer.getReferenceWidth();
};

JkMotionSpriteScene.prototype.getReferenceHeight = function() {
	return this.layer.getReferenceHeight();
};

JkMotionSpriteScene.prototype.getHeightValue = function(spec) {
	return this.layer.getHeightValue(spec);
};

JkMotionSpriteScene.prototype.getWidthValue = function(spec) {
	return this.layer.getWidthValue(spec);
};

JkMotionSpriteScene.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionSpriteScene"] === true;
};

let JkMotionSpriteEntity = function() {
	JkMotionEntity.call(this);
	this.sprite = null;
	this.layer = null;
};

JkMotionSpriteEntity.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkMotionEntity.prototype);
JkMotionSpriteEntity.prototype.constructor = JkMotionSpriteEntity;
JkMotionSpriteEntity.prototype._t = {
	"JkMotionSprite" : true,
	"JkMotionEntity" : true,
	"JkMotionSpriteEntity" : true
};
JkMotionSpriteEntity.prototype._tobj = JkMotionSpriteEntity;

JkMotionSpriteEntity.NEW = function() {
	var v = new JkMotionSpriteEntity;
	return v.CTOR_JkMotionSpriteEntity();
};

JkMotionSpriteEntity.prototype.CTOR_JkMotionSpriteEntity = function() {
	this.layer = null;
	this.sprite = null;
	if(JkMotionEntity.prototype.CTOR_JkMotionEntity.call(this) == null) {
		return null;
	}
	return this;
};

JkMotionSpriteEntity.prototype.createSprite = function() {
	return null;
};

JkMotionSpriteEntity.prototype.initialize = function() {
	JkMotionEntity.prototype.initialize.call(this);
	if(this.layer == null) {
		this.layer = (function(o) {
			if(JkMotionSpriteLayer.IS_INSTANCE && JkMotionSpriteLayer.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))(this.scene);
	}
	this.initializeSprite();
};

JkMotionSpriteEntity.prototype.initializeSprite = function() {
	if(this.sprite == null && this.layer != null) {
		this.sprite = this.createSprite();
	}
};

JkMotionSpriteEntity.prototype.cleanup = function() {
	JkMotionEntity.prototype.cleanup.call(this);
	this.cleanupSprite();
	this.layer = null;
};

JkMotionSpriteEntity.prototype.cleanupSprite = function() {
	if(this.sprite != null) {
		this.sprite.removeFromContainer();
		this.sprite = null;
	}
};

JkMotionSpriteEntity.prototype.onMoved = function(x, y) {
};

JkMotionSpriteEntity.prototype.move = function(x, y) {
	if(this.sprite != null) {
		this.sprite.move(x, y);
	}
	this.onMoved(x, y);
};

JkMotionSpriteEntity.prototype.resize = function(w, h) {
	var ts = (function(o) {
		if(JkMotionTextureSprite.IS_INSTANCE && JkMotionTextureSprite.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(this.sprite);
	if(ts != null) {
		ts.resize(w, h);
	}
};

JkMotionSpriteEntity.prototype.scale = function(scalex, scaley) {
	if(this.sprite != null) {
		this.sprite.scale(scalex, scaley);
	}
};

JkMotionSpriteEntity.prototype.setRotation = function(angle) {
	if(this.sprite != null) {
		this.sprite.setRotation(angle);
	}
};

JkMotionSpriteEntity.prototype.setAlpha = function(alpha) {
	if(this.sprite != null) {
		this.sprite.setAlpha(alpha);
	}
};

JkMotionSpriteEntity.prototype.getX = function() {
	if(this.sprite != null) {
		return this.sprite.getX();
	}
	return 0.0;
};

JkMotionSpriteEntity.prototype.getY = function() {
	if(this.sprite != null) {
		return this.sprite.getY();
	}
	return 0.0;
};

JkMotionSpriteEntity.prototype.getWidth = function() {
	if(this.sprite != null) {
		return this.sprite.getWidth();
	}
	return 0.0;
};

JkMotionSpriteEntity.prototype.getHeight = function() {
	if(this.sprite != null) {
		return this.sprite.getHeight();
	}
	return 0.0;
};

JkMotionSpriteEntity.prototype.getRotation = function() {
	if(this.sprite != null) {
		return this.sprite.getRotation();
	}
	return 0.0;
};

JkMotionSpriteEntity.prototype.getAlpha = function() {
	if(this.sprite != null) {
		return this.sprite.getAlpha();
	}
	return 0.0;
};

JkMotionSpriteEntity.prototype.getScaleX = function() {
	if(this.sprite != null) {
		return this.sprite.getScaleX();
	}
	return 0.0;
};

JkMotionSpriteEntity.prototype.getScaleY = function() {
	if(this.sprite != null) {
		return this.sprite.getScaleY();
	}
	return 0.0;
};

JkMotionSpriteEntity.prototype.removeFromContainer = function() {
	this.remove();
};

JkMotionSpriteEntity.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionSpriteEntity"] === true;
};

let JkMotionAudioClip = {};

JkMotionAudioClip.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionAudioClip"] === true;
};

let JkMotionEntityScene = {};

JkMotionEntityScene.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionEntityScene"] === true;
};

let JkMotionSpriteUtil = function() {};

JkMotionSpriteUtil.prototype._t = { "JkMotionSpriteUtil" : true };
JkMotionSpriteUtil.prototype._tobj = JkMotionSpriteUtil;

JkMotionSpriteUtil.NEW = function() {
	var v = new JkMotionSpriteUtil;
	return v.CTOR_JkMotionSpriteUtil();
};

JkMotionSpriteUtil.prototype.CTOR_JkMotionSpriteUtil = function() {
	return this;
};

JkMotionSpriteUtil.addColorSprite1 = function(scene, layer, color, width) {
	return JkMotionSpriteUtil.addColorSprite2(scene, layer, color, width, 0.0);
};

JkMotionSpriteUtil.addColorSprite2 = function(scene, layer, color, width, height) {
	var text = scene.createTextureForColor(color);
	if(!(text != null)) {
		return null;
	}
	return layer.addTextureSpriteForSize(text, width, height);
};

JkMotionSpriteUtil.addTextureSpriteForWidth = function(scene, layer, texture, width) {
	return layer.addTextureSpriteForSize(texture, width, 0.0);
};

JkMotionSpriteUtil.addTextureSpriteForHeight = function(scene, layer, texture, height) {
	return layer.addTextureSpriteForSize(texture, 0.0, height);
};

JkMotionSpriteUtil.addTextureSpriteForSize = function(scene, layer, texture, width, height) {
	return layer.addTextureSpriteForSize(texture, width, height);
};

JkMotionSpriteUtil.addTextSprite = function(scene, layer, text) {
	return layer.addTextSprite((JkMotionTextProperties.forText(text)));
};

JkMotionSpriteUtil.addTextSpriteWithAbsoluteSize = function(scene, layer, text, size) {
	var tp = JkMotionTextProperties.forText(text);
	tp.setFontSizeAbsolute(size);
	return layer.addTextSprite(tp);
};

JkMotionSpriteUtil.addTextSpriteWithRelativeSize = function(scene, layer, text, size) {
	var tp = JkMotionTextProperties.forText(text);
	tp.setFontSizeRelative(size);
	return layer.addTextSprite(tp);
};

JkMotionSpriteUtil.getAspectWidth = function(owidth, oheight, nwidth, nheight) {
	if(nwidth > 0.0) {
		return nwidth;
	}
	if(oheight == 0.0) {
		return 0.001;
	}
	return owidth * nheight / oheight;
};

JkMotionSpriteUtil.getAspectHeight = function(owidth, oheight, nwidth, nheight) {
	if(nheight > 0.0) {
		return nheight;
	}
	if(owidth == 0.0) {
		return 0.001;
	}
	return oheight * nwidth / owidth;
};

JkMotionSpriteUtil.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionSpriteUtil"] === true;
};

let JkMotionTextureSprite = {};

JkMotionTextureSprite.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionTextureSprite"] === true;
};

let JkMotionAudioStream = {};

JkMotionAudioStream.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionAudioStream"] === true;
};

let JkMotionAudioManagerForHTML5MyAudioClip = function() {
	this.id = null;
};

JkMotionAudioManagerForHTML5MyAudioClip.prototype._t = {
	"JkMotionAudioManagerForHTML5MyAudioClip" : true,
	"JkMotionAudioClip" : true
};
JkMotionAudioManagerForHTML5MyAudioClip.prototype._tobj = JkMotionAudioManagerForHTML5MyAudioClip;

JkMotionAudioManagerForHTML5MyAudioClip.NEW = function() {
	var v = new JkMotionAudioManagerForHTML5MyAudioClip;
	return v.CTOR_JkMotionAudioManagerForHTML5MyAudioClip();
};

JkMotionAudioManagerForHTML5MyAudioClip.prototype.CTOR_JkMotionAudioManagerForHTML5MyAudioClip = function() {
	this.id = null;
	return this;
};

JkMotionAudioManagerForHTML5MyAudioClip.prototype.play = function() {
	var v = false;
	var fnp = this.id;
	var audioElement = null;
	audioElement = document.createElement('audio');
	audioElement.setAttribute("preload", "auto");
	var srcmp3 = document.createElement('source');
	srcmp3.type = 'audio/mpeg';
	srcmp3.src = fnp + '.mp3';
	audioElement.appendChild(srcmp3);
	var srcogg = document.createElement('source');
	srcogg.type = 'audio/ogg';
	srcogg.src = fnp + '.ogg';
	audioElement.appendChild(srcogg);
	var srcm4a = document.createElement('source');
	srcm4a.type = 'audio/mp4';
	srcm4a.src = fnp + '.m4a';
	audioElement.appendChild(srcm4a);
	var srcwav = document.createElement('source');
	srcwav.type = 'audio/wav';
	srcwav.src = fnp + '.wav';
	audioElement.appendChild(srcwav);
	document.body.appendChild(audioElement);
	audioElement.load();
	try {
		audioElement.play();
		audioElement.addEventListener('ended', function() {
			audioElement.parentNode.removeChild(audioElement);
			audioElement = null;
		});
		v = true;
	}
	catch(e) {}
;
return v;
};

JkMotionAudioManagerForHTML5MyAudioClip.prototype.getId = function() {
	return this.id;
};

JkMotionAudioManagerForHTML5MyAudioClip.prototype.setId = function(v) {
	this.id = v;
	return this;
};

JkMotionAudioManagerForHTML5MyAudioClip.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionAudioManagerForHTML5MyAudioClip"] === true;
};

let JkMotionAudioManager = function() {};

JkMotionAudioManager.prototype._t = { "JkMotionAudioManager" : true };
JkMotionAudioManager.prototype._tobj = JkMotionAudioManager;

JkMotionAudioManager.NEW = function() {
	var v = new JkMotionAudioManager;
	return v.CTOR_JkMotionAudioManager();
};

JkMotionAudioManager.prototype.CTOR_JkMotionAudioManager = function() {
	return this;
};

JkMotionAudioManager.forApplication = function(context) {
	if(!(context != null)) {
		return null;
	}
	return JkMotionAudioManagerForHTML5.forApplication(((function(o) {
		if(JkAppApplicationContext.IS_INSTANCE && JkAppApplicationContext.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(context)));
};

JkMotionAudioManager.prototype.getClipForResource = function(id) {};

JkMotionAudioManager.prototype.getStreamForResource = function(id) {};

JkMotionAudioManager.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionAudioManager"] === true;
};

let JkMotionTextButtonEntity = function() {
	JkMotionMultiSpriteEntity.call(this);
	this.backgroundColor = null;
	this.pressedColor = null;
	this.text = null;
	this.boxSprite = null;
	this.textSprite = null;
	this.pressed = false;
	this.clickHandler = null;
};

JkMotionTextButtonEntity.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkMotionMultiSpriteEntity.prototype);
JkMotionTextButtonEntity.prototype.constructor = JkMotionTextButtonEntity;
JkMotionTextButtonEntity.prototype._t = {
	"JkMotionMultiSpriteEntity" : true,
	"JkUiPointerListener" : true,
	"JkMotionTextButtonEntity" : true,
	"JkMotionEntity" : true
};
JkMotionTextButtonEntity.prototype._tobj = JkMotionTextButtonEntity;

JkMotionTextButtonEntity.NEW = function() {
	var v = new JkMotionTextButtonEntity;
	return v.CTOR_JkMotionTextButtonEntity();
};

JkMotionTextButtonEntity.prototype.CTOR_JkMotionTextButtonEntity = function() {
	if(JkMotionMultiSpriteEntity.prototype.CTOR_JkMotionMultiSpriteEntity.call(this) == null) {
		return null;
	}
	this.clickHandler = null;
	this.pressed = false;
	this.textSprite = null;
	this.boxSprite = null;
	this.text = null;
	this.pressedColor = null;
	this.backgroundColor = null;
	this.backgroundColor = JkGfxColor.forRGB(128, 128, 128);
	this.pressedColor = JkGfxColor.white();
	return this;
};

JkMotionTextButtonEntity.forText = function(text) {
	var tp = JkMotionTextProperties.forText(text);
	tp.setFontSizeAbsolute(2.0);
	tp.setFontSizeDescription("5mm");
	return JkMotionTextButtonEntity.forTextProperties(tp);
};

JkMotionTextButtonEntity.forTextProperties = function(text) {
	var v = JkMotionTextButtonEntity.NEW();
	v.setText(text);
	return v;
};

JkMotionTextButtonEntity.prototype.initialize = function() {
	JkMotionMultiSpriteEntity.prototype.initialize.call(this);
	var tt = this.text;
	if(tt == null) {
		tt = JkMotionTextProperties.forText("Button");
		tt.setFontSizeAbsolute(2.0);
	}
	var bgc = this.backgroundColor;
	if(bgc == null) {
		bgc = JkGfxColor.forRGBA(0, 0, 0, 0);
	}
	this.boxSprite = JkMotionSpriteUtil.addColorSprite1(((function(o) {
		if(JkMotionScene.IS_INSTANCE && JkMotionScene.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(this.scene)), this.layer, bgc, 0.1);
	this.textSprite = this.layer.addTextSprite(this.text);
	var th = this.textSprite.getHeight();
	this.boxSprite.resize((this.textSprite.getWidth() + th), (th * 2));
	this.layoutSprites((this.getX()), (this.getY()));
};

JkMotionTextButtonEntity.prototype.resize = function(width, height) {
	if(this.boxSprite != null) {
		this.boxSprite.resize(width, height);
		this.onLayout();
	}
};

JkMotionTextButtonEntity.prototype.onPressedChanged = function() {
	if(this.pressed) {
		this.boxSprite.setTexture((this.scene.createTextureForColor(this.pressedColor)));
	}
	else {
		this.boxSprite.setTexture((this.scene.createTextureForColor(this.backgroundColor)));
	}
};

JkMotionTextButtonEntity.prototype.cleanup = function() {
	JkMotionMultiSpriteEntity.prototype.cleanup.call(this);
	if(this.boxSprite != null) {
		this.boxSprite.removeFromContainer();
		this.boxSprite = null;
	}
	if(this.textSprite != null) {
		this.textSprite.removeFromContainer();
		this.textSprite = null;
	}
};

JkMotionTextButtonEntity.prototype.getWidth = function() {
	if(this.boxSprite != null) {
		return this.boxSprite.getWidth();
	}
	return 0.0;
};

JkMotionTextButtonEntity.prototype.getHeight = function() {
	if(this.boxSprite != null) {
		return this.boxSprite.getHeight();
	}
	return 0.0;
};

JkMotionTextButtonEntity.prototype.layoutSprites = function(x, y) {
	this.boxSprite.move(x, y);
	this.textSprite.move((x + this.boxSprite.getWidth() / 2 - this.textSprite.getWidth() / 2), (y + this.boxSprite.getHeight() / 2 - this.textSprite.getHeight() / 2));
};

JkMotionTextButtonEntity.prototype.onClicked = function() {
	if(this.clickHandler != null) {
		this.clickHandler();
	}
};

JkMotionTextButtonEntity.prototype.onPointerEvent = function(event) {
	if(event.isInside((this.getX()), (this.getY()), (this.getWidth()), (this.getHeight())) == false) {
		if(this.pressed) {
			this.pressed = false;
			this.onPressedChanged();
		}
		return false;
	}
	if(this.pressed) {
		if(this.pressed && event.action == JkUiPointerEvent.CANCEL) {
			this.pressed = false;
			this.onPressedChanged();
			return false;
		}
		if(this.pressed && event.action == JkUiPointerEvent.UP) {
			this.pressed = false;
			this.onPressedChanged();
			this.onClicked();
			return false;
		}
		return true;
	}
	if(event.action == JkUiPointerEvent.DOWN) {
		this.pressed = true;
		this.onPressedChanged();
		return true;
	}
	return false;
};

JkMotionTextButtonEntity.prototype.getBackgroundColor = function() {
	return this.backgroundColor;
};

JkMotionTextButtonEntity.prototype.setBackgroundColor = function(v) {
	this.backgroundColor = v;
	return this;
};

JkMotionTextButtonEntity.prototype.getPressedColor = function() {
	return this.pressedColor;
};

JkMotionTextButtonEntity.prototype.setPressedColor = function(v) {
	this.pressedColor = v;
	return this;
};

JkMotionTextButtonEntity.prototype.getText = function() {
	return this.text;
};

JkMotionTextButtonEntity.prototype.setText = function(v) {
	this.text = v;
	return this;
};

JkMotionTextButtonEntity.prototype.getClickHandler = function() {
	return this.clickHandler;
};

JkMotionTextButtonEntity.prototype.setClickHandler = function(v) {
	this.clickHandler = v;
	return this;
};

JkMotionTextButtonEntity.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionTextButtonEntity"] === true;
};

let JkMotionAudioManagerForHTML5 = function() {
	JkMotionAudioManager.call(this);
	this.context = null;
};

JkMotionAudioManagerForHTML5.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkMotionAudioManager.prototype);
JkMotionAudioManagerForHTML5.prototype.constructor = JkMotionAudioManagerForHTML5;
JkMotionAudioManagerForHTML5.prototype._t = {
	"JkMotionAudioManager" : true,
	"JkMotionAudioManagerForHTML5" : true
};
JkMotionAudioManagerForHTML5.prototype._tobj = JkMotionAudioManagerForHTML5;

JkMotionAudioManagerForHTML5.NEW = function() {
	var v = new JkMotionAudioManagerForHTML5;
	return v.CTOR_JkMotionAudioManagerForHTML5();
};

JkMotionAudioManagerForHTML5.prototype.CTOR_JkMotionAudioManagerForHTML5 = function() {
	this.context = null;
	if(JkMotionAudioManager.prototype.CTOR_JkMotionAudioManager.call(this) == null) {
		return null;
	}
	return this;
};

JkMotionAudioManagerForHTML5.forApplication = function(context) {
	if(!(context != null)) {
		return null;
	}
	var v = JkMotionAudioManagerForHTML5.NEW();
	v.setContext(context);
	return v;
};

JkMotionAudioManagerForHTML5.prototype.getClipForResource = function(id) {
	var v = JkMotionAudioManagerForHTML5MyAudioClip.NEW();
	v.setId(id);
	return v;
};

JkMotionAudioManagerForHTML5.prototype.getStreamForResource = function(id) {
	return JkMotionAudioManagerForHTML5MyAudioStream.initialize(id);
};

JkMotionAudioManagerForHTML5.prototype.getContext = function() {
	return this.context;
};

JkMotionAudioManagerForHTML5.prototype.setContext = function(v) {
	this.context = v;
	return this;
};

JkMotionAudioManagerForHTML5.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionAudioManagerForHTML5"] === true;
};

let JkMotionBackendForHTMLElementsDomElementSprite = function() {
	this.element = null;
	this.parent = null;
	this.widthFactor = 0.0;
	this.heightFactor = 0.0;
	this.myx = -99999.89999999999418;
	this.myy = -99999.89999999999418;
	this.mywidth = 0.0;
	this.myheight = 0.0;
	this.myAngle = 0.0;
	this.myAlpha = 1.0;
	this.scaleX = 1.0;
	this.scaleY = 1.0;
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype._t = {
	"JkMotionSprite" : true,
	"JkMotionBackendForHTMLElementsDomElementSprite" : true
};
JkMotionBackendForHTMLElementsDomElementSprite.prototype._tobj = JkMotionBackendForHTMLElementsDomElementSprite;

JkMotionBackendForHTMLElementsDomElementSprite.NEW = function() {
	var v = new JkMotionBackendForHTMLElementsDomElementSprite;
	return v.CTOR_JkMotionBackendForHTMLElementsDomElementSprite();
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.CTOR_JkMotionBackendForHTMLElementsDomElementSprite = function() {
	this.scaleY = 1.0;
	this.scaleX = 1.0;
	this.myAlpha = 1.0;
	this.myAngle = 0.0;
	this.myheight = 0.0;
	this.mywidth = 0.0;
	this.myy = -99999.89999999999418;
	this.myx = -99999.89999999999418;
	this.heightFactor = 0.0;
	this.widthFactor = 0.0;
	this.parent = null;
	this.element = null;
	return this;
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.getElement = function() {
	return this.element;
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.setElement = function(value) {
	this.element = value;
	if(this.element != null) {
		this.element.style.position = "absolute";
		;
	}
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.setBackgroundColor = function(color) {
	var cc = JkUiHTMLDOM.colorToRGBA(color);
	if(cc != null) {
		this.element.style.backgroundColor = cc;
		;
	}
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.move = function(x, y) {
	if(x != this.myx || y != this.myy) {
		this.myx = x;
		this.myy = y;
		var rx = x * this.widthFactor;
		var ry = y * this.heightFactor;
		if(this.element != null) {
			this.element.style.left = ~~rx;
			this.element.style.top = ~~ry;
		}
		;
	}
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.updateSizeAsPixels = function(wpx, hpx) {
	this.mywidth = wpx / this.widthFactor;
	this.myheight = hpx / this.heightFactor;
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.updateTransform = function() {
	if(!(this.element != null)) {
		return;
	}
	var ang = this.myAngle * 180.0 / JkMathMath.M_PI;
	var str = "rotate(" + (JkLangString.safeString((JkLangString.safeString((JkLangString.forInteger((~(~ang)))))))) + ("deg) scale(") + (JkLangString.safeString((JkLangString.safeString((JkLangString.forDouble(this.scaleX)))))) + (",") + (JkLangString.safeString((JkLangString.safeString((JkLangString.forDouble(this.scaleY)))))) + (")");
	JkUiHTMLDOM.setStyle(this.element, "transform", str);
	JkUiHTMLDOM.setStyle(this.element, "webkitTransform", str);
	JkUiHTMLDOM.setStyle(this.element, "msTransform", str);
	JkUiHTMLDOM.setStyle(this.element, "oTransform", str);
	JkUiHTMLDOM.setStyle(this.element, "mozTransform", str);
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.setRotation = function(angle) {
	if(this.myAngle == angle) {
		return;
	}
	this.myAngle = angle;
	this.updateTransform();
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.setAlpha = function(alpha) {
	var f = alpha;
	if(f < 0) {
		f = 0;
	}
	if(f > 1) {
		f = 1;
	}
	if(f == this.myAlpha) {
		return;
	}
	this.element.style.opacity = f;
	;
	this.myAlpha = f;
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.scale = function(x, y) {
	if(x == this.scaleX && y == this.scaleY) {
		return;
	}
	this.scaleX = x;
	this.scaleY = y;
	this.updateTransform();
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.getX = function() {
	return this.myx;
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.getY = function() {
	return this.myy;
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.getWidth = function() {
	return this.mywidth;
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.getHeight = function() {
	return this.myheight;
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.getRotation = function() {
	return this.myAngle;
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.getAlpha = function() {
	return this.myAlpha;
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.getScaleX = function() {
	return this.scaleX;
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.getScaleY = function() {
	return this.scaleY;
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.removeFromContainer = function() {
	if(!(this.element != null)) {
		return;
	}
	JkUiHTMLDOM.remove(this.element);
	this.setElement(null);
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.getParent = function() {
	return this.parent;
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.setParent = function(v) {
	this.parent = v;
	return this;
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.getWidthFactor = function() {
	return this.widthFactor;
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.setWidthFactor = function(v) {
	this.widthFactor = v;
	return this;
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.getHeightFactor = function() {
	return this.heightFactor;
};

JkMotionBackendForHTMLElementsDomElementSprite.prototype.setHeightFactor = function(v) {
	this.heightFactor = v;
	return this;
};

JkMotionBackendForHTMLElementsDomElementSprite.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionBackendForHTMLElementsDomElementSprite"] === true;
};

let JkMotionBackendForHTMLElementsMyTextSprite = function() {
	JkMotionBackendForHTMLElementsDomElementSprite.call(this);
	this.context = null;
};

JkMotionBackendForHTMLElementsMyTextSprite.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkMotionBackendForHTMLElementsDomElementSprite.prototype);
JkMotionBackendForHTMLElementsMyTextSprite.prototype.constructor = JkMotionBackendForHTMLElementsMyTextSprite;
JkMotionBackendForHTMLElementsMyTextSprite.prototype._t = {
	"JkMotionSprite" : true,
	"JkMotionTextSprite" : true,
	"JkMotionBackendForHTMLElementsMyTextSprite" : true,
	"JkMotionBackendForHTMLElementsDomElementSprite" : true
};
JkMotionBackendForHTMLElementsMyTextSprite.prototype._tobj = JkMotionBackendForHTMLElementsMyTextSprite;

JkMotionBackendForHTMLElementsMyTextSprite.NEW = function() {
	var v = new JkMotionBackendForHTMLElementsMyTextSprite;
	return v.CTOR_JkMotionBackendForHTMLElementsMyTextSprite();
};

JkMotionBackendForHTMLElementsMyTextSprite.prototype.CTOR_JkMotionBackendForHTMLElementsMyTextSprite = function() {
	this.context = null;
	if(JkMotionBackendForHTMLElementsDomElementSprite.prototype.CTOR_JkMotionBackendForHTMLElementsDomElementSprite.call(this) == null) {
		return null;
	}
	return this;
};

JkMotionBackendForHTMLElementsMyTextSprite.prototype.setText = function(desc) {
	if(desc == null) {
		if(this.element != null) {
			JkUiHTMLDOM.setTextContent(this.element, "");
		}
		return;
	}
	if(this.element == null) {
		this.setElement((JkUiHTMLDOM.createElement("div")));
		JkUiHTMLDOM.setStyle(this.element, "cursor", "default");
		JkUiHTMLDOM.setStyle(this.element, "white-space", "nowrap");
		JkUiHTMLDOM.setStyle(this.element, "line-height", "1");
		JkUiHTMLDOM.appendChild(this.parent, this.element);
	}
	var textColor = desc.getTextColor();
	if(textColor != null) {
		var cc = JkUiHTMLDOM.colorToRGBA(textColor);
		this.element.style.color = cc;
		;
	}
	var fontFamily = desc.getFontFamily();
	if(JkLangString.isEmpty(fontFamily)) {
		fontFamily = "Arial";
	}
	if(JkLangString.isEmpty(fontFamily) == false) {
		this.element.style.fontFamily = fontFamily;
		;
	}
	var fontResource = desc.getFontResource();
	if(JkLangString.isEmpty(fontResource) == false) {
		console.log("[jk.motion.BackendForHTMLElements.MyTextSprite.setText] (BackendForHTMLElements@target_html.sling:291:4): Not implemented: font resource support");
	}
	var fontFile = desc.getFontFile();
	if(fontFile != null) {
		console.log("[jk.motion.BackendForHTMLElements.MyTextSprite.setText] (BackendForHTMLElements@target_html.sling:294:4): Not implemented: font file support");
	}
	if(desc.getFontIsBold()) {
		this.element.style.fontWeight = "bold";
		;
	}
	if(desc.getFontIsItalic()) {
		this.element.style.fontStyle = "italic";
		;
	}
	this.setBackgroundColor((desc.getBackgroundColor()));
	JkUiHTMLDOM.setTextContent(this.element, (desc.getText()));
	var hsz = 0.0;
	var fsDesc = desc.getFontSizeDescription();
	if(JkLangString.isEmpty(fsDesc) == false) {
		var density = 0;
		if(this.context != null) {
			density = this.context.getScreenDensity();
		}
		else {
			density = 96;
		}
		hsz = JkGfxLength.asPoints(fsDesc, density);
	}
	else {
		var fsRelative = desc.getFontSizeRelative();
		var fsAbsolute = desc.getFontSizeAbsolute();
		if(fsRelative > 0.0) {
			hsz = this.getHeightFactor() * fsRelative;
		}
		else {
			hsz = fsAbsolute * 18;
		}
	}
	this.element.style.fontSize = hsz;
	;
	var msw = 0;
	var msh = 0;
	msw = this.element.offsetWidth;
	msh = this.element.offsetHeight;
	;
	this.updateSizeAsPixels(msw, msh);
};

JkMotionBackendForHTMLElementsMyTextSprite.prototype.getContext = function() {
	return this.context;
};

JkMotionBackendForHTMLElementsMyTextSprite.prototype.setContext = function(v) {
	this.context = v;
	return this;
};

JkMotionBackendForHTMLElementsMyTextSprite.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionBackendForHTMLElementsMyTextSprite"] === true;
};

let JkMotionBackendForHTMLElementsMyTextureSprite = function() {
	JkMotionBackendForHTMLElementsDomElementSprite.call(this);
	this.layer = null;
};

JkMotionBackendForHTMLElementsMyTextureSprite.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkMotionBackendForHTMLElementsDomElementSprite.prototype);
JkMotionBackendForHTMLElementsMyTextureSprite.prototype.constructor = JkMotionBackendForHTMLElementsMyTextureSprite;
JkMotionBackendForHTMLElementsMyTextureSprite.prototype._t = {
	"JkMotionSprite" : true,
	"JkMotionBackendForHTMLElementsMyTextureSprite" : true,
	"JkMotionTextureSprite" : true,
	"JkMotionBackendForHTMLElementsDomElementSprite" : true
};
JkMotionBackendForHTMLElementsMyTextureSprite.prototype._tobj = JkMotionBackendForHTMLElementsMyTextureSprite;

JkMotionBackendForHTMLElementsMyTextureSprite.NEW = function() {
	var v = new JkMotionBackendForHTMLElementsMyTextureSprite;
	return v.CTOR_JkMotionBackendForHTMLElementsMyTextureSprite();
};

JkMotionBackendForHTMLElementsMyTextureSprite.prototype.CTOR_JkMotionBackendForHTMLElementsMyTextureSprite = function() {
	this.layer = null;
	if(JkMotionBackendForHTMLElementsDomElementSprite.prototype.CTOR_JkMotionBackendForHTMLElementsDomElementSprite.call(this) == null) {
		return null;
	}
	return this;
};

JkMotionBackendForHTMLElementsMyTextureSprite.prototype.resize = function(w, h) {
	if(w == this.mywidth && h == this.myheight) {
		return;
	}
	var wpx = w * ~(~this.widthFactor);
	var hpx = h * ~(~this.heightFactor);
	this.element.style.width = ~~wpx;
	this.element.style.height = ~~hpx;
	;
	this.mywidth = w;
	this.myheight = h;
};

JkMotionBackendForHTMLElementsMyTextureSprite.prototype.setTexture = function(texture) {
	this.setTextureWithSize(texture, (this.getWidth()), (this.getHeight()));
};

JkMotionBackendForHTMLElementsMyTextureSprite.prototype.setTextureWithSize = function(texture, width, height) {
	if(texture == null || width <= 0.0 && height <= 0.0) {
		return;
	}
	var w = JkMotionSpriteUtil.getAspectWidth((texture.getPixelWidth()), (texture.getPixelHeight()), width, height);
	var h = JkMotionSpriteUtil.getAspectHeight((texture.getPixelWidth()), (texture.getPixelHeight()), width, height);
	if(w <= 0.0) {
		w = height;
	}
	if(h <= 0.0) {
		h = width;
	}
	if(w <= 0.0 || h <= 0.0) {
		return;
	}
	if(JkMotionBackendForHTMLElementsMyColorTexture.IS_INSTANCE && JkMotionBackendForHTMLElementsMyColorTexture.IS_INSTANCE(texture)) {
		if(this.element == null) {
			this.setElement((JkUiHTMLDOM.createElement("div")));
			JkUiHTMLDOM.appendChild(this.parent, this.element);
		}
		this.resize(w, h);
		this.setBackgroundColor(texture.color);
		return;
	}
	if(JkMotionBackendForHTMLElementsMyImageTexture.IS_INSTANCE && JkMotionBackendForHTMLElementsMyImageTexture.IS_INSTANCE(texture)) {
		var img = (function(o) {
			if(JkUiImageForBrowser.IS_INSTANCE && JkUiImageForBrowser.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))(texture.image);
		if(!(img != null)) {
			return;
		}
		var bm = img.image;
		if(!(bm != null)) {
			return;
		}
		if(this.element == null) {
			this.setElement((JkUiHTMLDOM.createElement("img")));
			JkUiHTMLDOM.appendChild(this.parent, this.element);
			this.element.src = bm.src;
			;
		}
		this.resize(w, h);
		return;
	}
	console.log("[jk.motion.BackendForHTMLElements.MyTextureSprite.setTextureWithSize] (BackendForHTMLElements@target_html.sling:252:3): Unknown texture type");
};

JkMotionBackendForHTMLElementsMyTextureSprite.prototype.getLayer = function() {
	return this.layer;
};

JkMotionBackendForHTMLElementsMyTextureSprite.prototype.setLayer = function(v) {
	this.layer = v;
	return this;
};

JkMotionBackendForHTMLElementsMyTextureSprite.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionBackendForHTMLElementsMyTextureSprite"] === true;
};

let JkMotionBackendForHTMLElementsMySpriteLayer = function() {
	JkMotionBackendForHTMLElementsDomElementSprite.call(this);
	this.context = null;
	this.referenceWidth = 1.0;
	this.referenceHeight = 0.0;
	this.layerWidthFactor = 0.0;
	this.layerHeightFactor = 0.0;
	this.ppi = -1;
};

JkMotionBackendForHTMLElementsMySpriteLayer.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkMotionBackendForHTMLElementsDomElementSprite.prototype);
JkMotionBackendForHTMLElementsMySpriteLayer.prototype.constructor = JkMotionBackendForHTMLElementsMySpriteLayer;
JkMotionBackendForHTMLElementsMySpriteLayer.prototype._t = {
	"JkMotionSprite" : true,
	"JkMotionSpriteLayer" : true,
	"JkMotionBackendForHTMLElementsMySpriteLayer" : true,
	"JkMotionBackendForHTMLElementsDomElementSprite" : true
};
JkMotionBackendForHTMLElementsMySpriteLayer.prototype._tobj = JkMotionBackendForHTMLElementsMySpriteLayer;

JkMotionBackendForHTMLElementsMySpriteLayer.NEW = function() {
	var v = new JkMotionBackendForHTMLElementsMySpriteLayer;
	return v.CTOR_JkMotionBackendForHTMLElementsMySpriteLayer();
};

JkMotionBackendForHTMLElementsMySpriteLayer.prototype.CTOR_JkMotionBackendForHTMLElementsMySpriteLayer = function() {
	this.ppi = -1;
	this.layerHeightFactor = 0.0;
	this.layerWidthFactor = 0.0;
	this.referenceHeight = 0.0;
	this.referenceWidth = 1.0;
	this.context = null;
	if(JkMotionBackendForHTMLElementsDomElementSprite.prototype.CTOR_JkMotionBackendForHTMLElementsDomElementSprite.call(this) == null) {
		return null;
	}
	return this;
};

JkMotionBackendForHTMLElementsMySpriteLayer.prototype.getLayerWidthFactor = function() {
	if(this.layerWidthFactor == 0.0 && this.referenceWidth > 0.0) {
		var rwidth = 0.0;
		rwidth = this.element.offsetWidth;
		;
		this.layerWidthFactor = rwidth / this.referenceWidth;
	}
	return this.layerWidthFactor;
};

JkMotionBackendForHTMLElementsMySpriteLayer.prototype.getLayerHeightFactor = function() {
	if(this.layerHeightFactor == 0.0) {
		var rh = this.getReferenceHeight();
		if(rh > 0.0) {
			var rheight = 0.0;
			rheight = this.element.offsetHeight;
			;
			this.layerHeightFactor = rheight / rh;
		}
	}
	return this.layerHeightFactor;
};

JkMotionBackendForHTMLElementsMySpriteLayer.prototype.addTextureSpriteForSize = function(texture, width, height) {
	var v = JkMotionBackendForHTMLElementsMyTextureSprite.NEW();
	v.setParent(this.element);
	v.setWidthFactor((this.getLayerWidthFactor()));
	v.setHeightFactor((this.getLayerHeightFactor()));
	v.setLayer(this);
	v.setTextureWithSize(texture, width, height);
	return v;
};

JkMotionBackendForHTMLElementsMySpriteLayer.prototype.addTextSprite = function(text) {
	var v = JkMotionBackendForHTMLElementsMyTextSprite.NEW();
	v.setContext(this.context);
	v.setParent(this.element);
	v.setWidthFactor((this.getLayerWidthFactor()));
	v.setHeightFactor((this.getLayerHeightFactor()));
	v.setText(text);
	return v;
};

JkMotionBackendForHTMLElementsMySpriteLayer.prototype.addContainerSprite = function(width, height) {
	console.log("[jk.motion.BackendForHTMLElements.MySpriteLayer.addContainerSprite] (BackendForHTMLElements@target_html.sling:402:3): Not implemented");
	return null;
};

JkMotionBackendForHTMLElementsMySpriteLayer.prototype.removeSprite = function(sprite) {
	var sp = (function(o) {
		if(JkMotionBackendForHTMLElementsDomElementSprite.IS_INSTANCE && JkMotionBackendForHTMLElementsDomElementSprite.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(sprite);
	if(sp != null) {
		sp.removeFromContainer();
	}
};

JkMotionBackendForHTMLElementsMySpriteLayer.prototype.removeAllSprites = function() {
	JkUiHTMLDOM.setTextContent(this.element, "");
};

JkMotionBackendForHTMLElementsMySpriteLayer.prototype.setReferenceWidth = function(rw) {
	this.referenceWidth = rw;
};

JkMotionBackendForHTMLElementsMySpriteLayer.prototype.setReferenceHeight = function(rh) {
	this.referenceHeight = rh;
};

JkMotionBackendForHTMLElementsMySpriteLayer.prototype.getReferenceWidth = function() {
	return this.referenceWidth;
};

JkMotionBackendForHTMLElementsMySpriteLayer.prototype.getReferenceHeight = function() {
	if(this.referenceHeight > 0.0) {
		return this.referenceHeight;
	}
	var ww = 0.0;
	var hh = 0.0;
	ww = this.element.offsetWidth;
	hh = this.element.offsetHeight;
	;
	return hh * this.referenceWidth / ww;
};

JkMotionBackendForHTMLElementsMySpriteLayer.prototype.getPPI = function() {
	if(this.ppi < 0) {
		if(this.context != null) {
			this.ppi = this.context.getScreenDensity();
		}
		if(this.ppi < 0) {
			this.ppi = 96;
		}
	}
	return this.ppi;
};

JkMotionBackendForHTMLElementsMySpriteLayer.prototype.getHeightValue = function(spec) {
	return JkGfxLength.asPoints(spec, (this.getPPI())) / this.getLayerHeightFactor();
};

JkMotionBackendForHTMLElementsMySpriteLayer.prototype.getWidthValue = function(spec) {
	return JkGfxLength.asPoints(spec, (this.getPPI())) / this.getLayerWidthFactor();
};

JkMotionBackendForHTMLElementsMySpriteLayer.prototype.getContext = function() {
	return this.context;
};

JkMotionBackendForHTMLElementsMySpriteLayer.prototype.setContext = function(v) {
	this.context = v;
	return this;
};

JkMotionBackendForHTMLElementsMySpriteLayer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionBackendForHTMLElementsMySpriteLayer"] === true;
};

let JkMotionTexture = {};

JkMotionTexture.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionTexture"] === true;
};

let JkMotionBackendForHTMLElementsMyColorTexture = function() {
	this.color = null;
};

JkMotionBackendForHTMLElementsMyColorTexture.prototype._t = {
	"JkMotionTexture" : true,
	"JkMotionBackendForHTMLElementsMyColorTexture" : true
};
JkMotionBackendForHTMLElementsMyColorTexture.prototype._tobj = JkMotionBackendForHTMLElementsMyColorTexture;

JkMotionBackendForHTMLElementsMyColorTexture.NEW = function() {
	var v = new JkMotionBackendForHTMLElementsMyColorTexture;
	return v.CTOR_JkMotionBackendForHTMLElementsMyColorTexture();
};

JkMotionBackendForHTMLElementsMyColorTexture.prototype.CTOR_JkMotionBackendForHTMLElementsMyColorTexture = function() {
	this.color = null;
	return this;
};

JkMotionBackendForHTMLElementsMyColorTexture.prototype.getPixelWidth = function() {
	return 0;
};

JkMotionBackendForHTMLElementsMyColorTexture.prototype.getPixelHeight = function() {
	return 0;
};

JkMotionBackendForHTMLElementsMyColorTexture.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionBackendForHTMLElementsMyColorTexture"] === true;
};

let JkMotionBackend = function() {};

JkMotionBackend.prototype._t = { "JkMotionBackend" : true };
JkMotionBackend.prototype._tobj = JkMotionBackend;

JkMotionBackend.NEW = function() {
	var v = new JkMotionBackend;
	return v.CTOR_JkMotionBackend();
};

JkMotionBackend.prototype.CTOR_JkMotionBackend = function() {
	return this;
};

JkMotionBackend.prototype.createSpriteLayer = function() {};

JkMotionBackend.prototype.createImageFromResource = function(name) {};

JkMotionBackend.prototype.createTextureForImage = function(image) {};

JkMotionBackend.prototype.createTextureForColor = function(color) {};

JkMotionBackend.prototype.deleteSpriteLayer = function(layer) {};

JkMotionBackend.prototype.deleteTexture = function(texture) {};

JkMotionBackend.prototype.deleteTextureSheet = function(textures) {
	if(!(textures != null)) {
		return;
	}
	if(textures != null) {
		var n = 0;
		var m = textures.length;
		for(n = 0 ; n < m ; n++) {
			var texture = textures[n];
			if(texture != null) {
				this.deleteTexture(texture);
			}
		}
	}
	JkLangVector.clear(textures);
};

JkMotionBackend.prototype.createTextureForImageResource = function(name) {
	if(!(name != null)) {
		return null;
	}
	var img = this.createImageFromResource(name);
	if(!(img != null)) {
		return null;
	}
	var v = this.createTextureForImage(img);
	if(!(v != null)) {
		return null;
	}
	return v;
};

JkMotionBackend.prototype.createTextureSheet = function(resourceId, props) {
	var img = this.createImageFromResource(resourceId);
	if(!(img != null)) {
		return null;
	}
	var imgs = JkGfxUtilImageSheet.NEW();
	imgs.setSheet(img);
	imgs.setCols((props.getCols()));
	imgs.setRows((props.getRows()));
	imgs.setSourceSkipX((props.getSourceSkipX()));
	imgs.setSourceSkipY((props.getSourceSkipY()));
	imgs.setSourceImageWidth((props.getSourceImageWidth()));
	imgs.setSourceImageHeight((props.getSourceImageHeight()));
	imgs.setMaxImages((props.getMaxImages()));
	var images = imgs.toImages((props.getResizeToWidth()), (props.getResizeToHeight()));
	if(!(images != null)) {
		return null;
	}
	var v = new Array;
	if(images != null) {
		var n = 0;
		var m = images.length;
		for(n = 0 ; n < m ; n++) {
			var image = images[n];
			if(image != null) {
				var txt = this.createTextureForImage(image);
				if(txt != null) {
					v.push(txt);
				}
			}
		}
	}
	return v;
};

JkMotionBackend.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionBackend"] === true;
};

let JkMotionAnimatedSpriteEntity = function() {
	JkMotionSpriteEntity.call(this);
	this.imageSheet = null;
	this.currentFrame = -1;
	this.frameDelay = 0;
	this.timeVal = null;
	this.spriteWidth = 0.0;
	this.spriteHeight = 0.0;
	this.heightFactor = 0.0;
	this.xSpeed = 0.0;
	this.ySpeed = 0.0;
	this.rotateSpeed = 0.0;
};

JkMotionAnimatedSpriteEntity.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkMotionSpriteEntity.prototype);
JkMotionAnimatedSpriteEntity.prototype.constructor = JkMotionAnimatedSpriteEntity;
JkMotionAnimatedSpriteEntity.prototype._t = {
	"JkMotionSprite" : true,
	"JkMotionAnimatedSpriteEntity" : true,
	"JkMotionEntity" : true,
	"JkMotionSpriteEntity" : true
};
JkMotionAnimatedSpriteEntity.prototype._tobj = JkMotionAnimatedSpriteEntity;

JkMotionAnimatedSpriteEntity.NEW = function() {
	var v = new JkMotionAnimatedSpriteEntity;
	return v.CTOR_JkMotionAnimatedSpriteEntity();
};

JkMotionAnimatedSpriteEntity.prototype.CTOR_JkMotionAnimatedSpriteEntity = function() {
	this.rotateSpeed = 0.0;
	this.ySpeed = 0.0;
	this.xSpeed = 0.0;
	this.heightFactor = 0.0;
	this.spriteHeight = 0.0;
	this.spriteWidth = 0.0;
	this.timeVal = null;
	this.frameDelay = 0;
	this.currentFrame = -1;
	this.imageSheet = null;
	if(JkMotionSpriteEntity.prototype.CTOR_JkMotionSpriteEntity.call(this) == null) {
		return null;
	}
	return this;
};

JkMotionAnimatedSpriteEntity.prototype.initialize = function() {
	JkMotionSpriteEntity.prototype.initialize.call(this);
	this.timeVal = JkLangTimeValue.forSeconds(1);
};

JkMotionAnimatedSpriteEntity.prototype.setFrameImages = function(imgs, fps, width, height) {
	if(!(imgs != null)) {
		return false;
	}
	this.spriteWidth = width;
	this.spriteHeight = height;
	this.currentFrame = -1;
	this.imageSheet = new Array;
	this.heightFactor = 0.0;
	if(imgs != null) {
		var n = 0;
		var m = imgs.length;
		for(n = 0 ; n < m ; n++) {
			var txt = imgs[n];
			if(txt != null) {
				var texture = this.scene.createTextureForImage(txt);
				if(texture != null) {
					this.imageSheet.push(texture);
				}
				if(this.heightFactor <= 0.0) {
					this.heightFactor = txt.getPixelHeight() / txt.getPixelWidth();
				}
			}
		}
	}
	this.setFramesPerSecond((~(~fps)));
	return true;
};

JkMotionAnimatedSpriteEntity.prototype.setFrameTextures = function(imgs, fps, width, height) {
	if(!(imgs != null)) {
		return false;
	}
	this.spriteWidth = width;
	this.spriteHeight = height;
	this.currentFrame = -1;
	this.imageSheet = new Array;
	this.heightFactor = 0.0;
	if(imgs != null) {
		var n = 0;
		var m = imgs.length;
		for(n = 0 ; n < m ; n++) {
			var img = imgs[n];
			if(img != null) {
				this.imageSheet.push(img);
				if(this.heightFactor <= 0.0) {
					this.heightFactor = img.getPixelHeight() / img.getPixelWidth();
				}
			}
		}
	}
	this.setFramesPerSecond((~(~fps)));
	return true;
};

JkMotionAnimatedSpriteEntity.prototype.setRandomSpeed = function() {
	var d = this.layer.getReferenceWidth() / 10.0;
	var r = JkRandomRandom.getSharedInstance();
	this.xSpeed = d * r.nextDouble();
	this.ySpeed = d * r.nextDouble();
	this.rotateSpeed = r.nextDouble() * JkMathMath.M_PI;
};

JkMotionAnimatedSpriteEntity.prototype.setFramesPerSecond = function(fps) {
	var v = 1000 / fps;
	if(this.timeVal != null) {
		this.timeVal.setMicroSeconds((v * 1000));
	}
	this.frameDelay = v * 1000;
};

JkMotionAnimatedSpriteEntity.prototype.nextFrame = function() {
	this.currentFrame++;
	if(this.currentFrame >= this.imageSheet.length) {
		this.currentFrame = 0;
	}
	var texture = this.imageSheet[this.currentFrame];
	var textureSprite = (function(o) {
		if(JkMotionTextureSprite.IS_INSTANCE && JkMotionTextureSprite.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(this.sprite);
	var sh = this.spriteHeight;
	if(sh <= 0.0) {
		sh = this.heightFactor * this.spriteWidth;
	}
	if(!(textureSprite != null)) {
		if(this.sprite != null) {
			this.cleanupSprite();
		}
		this.sprite = this.layer.addTextureSpriteForSize(texture, this.spriteWidth, sh);
	}
	else {
		textureSprite.setTextureWithSize(this.imageSheet[this.currentFrame], this.spriteWidth, sh);
	}
	return true;
};

JkMotionAnimatedSpriteEntity.prototype.tick = function(gameTime, delta) {
	JkMotionSpriteEntity.prototype.tick.call(this, gameTime, delta);
	if(this.imageSheet != null && this.timeVal != null) {
		var timeDiff = JkLangTimeValue.diff(gameTime, this.timeVal) % 1000000;
		if(timeDiff >= this.frameDelay) {
			this.timeVal.setMicroSeconds((gameTime.getMicroSeconds()));
			this.timeVal.setSeconds((gameTime.getSeconds()));
			this.nextFrame();
		}
	}
	if(this.xSpeed != 0.0 || this.ySpeed != 0.0) {
		this.move((this.getX() + this.xSpeed * delta), (this.getY() + this.ySpeed * delta));
	}
	if(this.rotateSpeed != 0.0) {
		this.setRotation((this.getRotation() + this.rotateSpeed * delta));
	}
};

JkMotionAnimatedSpriteEntity.prototype.getXSpeed = function() {
	return this.xSpeed;
};

JkMotionAnimatedSpriteEntity.prototype.setXSpeed = function(v) {
	this.xSpeed = v;
	return this;
};

JkMotionAnimatedSpriteEntity.prototype.getYSpeed = function() {
	return this.ySpeed;
};

JkMotionAnimatedSpriteEntity.prototype.setYSpeed = function(v) {
	this.ySpeed = v;
	return this;
};

JkMotionAnimatedSpriteEntity.prototype.getRotateSpeed = function() {
	return this.rotateSpeed;
};

JkMotionAnimatedSpriteEntity.prototype.setRotateSpeed = function(v) {
	this.rotateSpeed = v;
	return this;
};

JkMotionAnimatedSpriteEntity.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionAnimatedSpriteEntity"] === true;
};

let JkMotionBackendForHTMLElementsMyImageTexture = function() {
	this.image = null;
};

JkMotionBackendForHTMLElementsMyImageTexture.prototype._t = {
	"JkMotionTexture" : true,
	"JkMotionBackendForHTMLElementsMyImageTexture" : true
};
JkMotionBackendForHTMLElementsMyImageTexture.prototype._tobj = JkMotionBackendForHTMLElementsMyImageTexture;

JkMotionBackendForHTMLElementsMyImageTexture.NEW = function() {
	var v = new JkMotionBackendForHTMLElementsMyImageTexture;
	return v.CTOR_JkMotionBackendForHTMLElementsMyImageTexture();
};

JkMotionBackendForHTMLElementsMyImageTexture.prototype.CTOR_JkMotionBackendForHTMLElementsMyImageTexture = function() {
	this.image = null;
	return this;
};

JkMotionBackendForHTMLElementsMyImageTexture.prototype.getPixelWidth = function() {
	if(!(this.image != null)) {
		return 0;
	}
	return this.image.getPixelWidth();
};

JkMotionBackendForHTMLElementsMyImageTexture.prototype.getPixelHeight = function() {
	if(!(this.image != null)) {
		return 0;
	}
	return this.image.getPixelHeight();
};

JkMotionBackendForHTMLElementsMyImageTexture.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionBackendForHTMLElementsMyImageTexture"] === true;
};

let JkMotionAudioManagerForHTML5MyAudioStream = function() {
	this.audioStream = null;
};

JkMotionAudioManagerForHTML5MyAudioStream.prototype._t = {
	"JkMotionAudioStream" : true,
	"JkMotionAudioManagerForHTML5MyAudioStream" : true
};
JkMotionAudioManagerForHTML5MyAudioStream.prototype._tobj = JkMotionAudioManagerForHTML5MyAudioStream;

JkMotionAudioManagerForHTML5MyAudioStream.NEW = function() {
	var v = new JkMotionAudioManagerForHTML5MyAudioStream;
	return v.CTOR_JkMotionAudioManagerForHTML5MyAudioStream();
};

JkMotionAudioManagerForHTML5MyAudioStream.prototype.CTOR_JkMotionAudioManagerForHTML5MyAudioStream = function() {
	this.audioStream = null;
	return this;
};

JkMotionAudioManagerForHTML5MyAudioStream.initialize = function(id) {
	var fnp = id;
	var audioElement = null;
	audioElement = document.createElement('audio');
	audioElement.setAttribute("preload", "auto");
	var srcmp3 = document.createElement('source');
	srcmp3.type = 'audio/mpeg';
	srcmp3.src = fnp + '.mp3';
	audioElement.appendChild(srcmp3);
	var srcogg = document.createElement('source');
	srcogg.type = 'audio/ogg';
	srcogg.src = fnp + '.ogg';
	audioElement.appendChild(srcogg);
	var srcm4a = document.createElement('source');
	srcm4a.type = 'audio/mp4';
	srcm4a.src = fnp + '.m4a';
	audioElement.appendChild(srcm4a);
	var srcwav = document.createElement('source');
	srcwav.type = 'audio/wav';
	srcwav.src = fnp + '.wav';
	audioElement.appendChild(srcwav);
	document.body.appendChild(audioElement);
	audioElement.load();
	;
	return JkMotionAudioManagerForHTML5MyAudioStream.NEW().setAudioStream(audioElement);
};

JkMotionAudioManagerForHTML5MyAudioStream.prototype.play = function() {
	var audioStream = this.audioStream;
	if(audioStream != null) {
		audioStream.play();
		;
		return true;
	}
	return false;
};

JkMotionAudioManagerForHTML5MyAudioStream.prototype.pause = function() {
	var audioStream = this.audioStream;
	if(audioStream != null) {
		audioStream.pause();
		;
		return true;
	}
	return false;
};

JkMotionAudioManagerForHTML5MyAudioStream.prototype.stop = function() {
	var audioStream = this.audioStream;
	if(audioStream != null) {
		audioStream.pause();
		audioStream.currentTime = 0;
		;
		return true;
	}
	return false;
};

JkMotionAudioManagerForHTML5MyAudioStream.prototype.seek = function(sec) {
	var audioStream = this.audioStream;
	if(sec >= 0 && audioStream != null) {
		audioStream.currentTime = sec;
		;
		return true;
	}
	return false;
};

JkMotionAudioManagerForHTML5MyAudioStream.prototype.getCurrentTime = function() {
	var ct = 0;
	var audioStream = this.audioStream;
	if(audioStream != null) {
		ct = audioStream.currentTime;
		;
	}
	return ct;
};

JkMotionAudioManagerForHTML5MyAudioStream.prototype.getDuration = function() {
	var d = 0.0;
	var audioStream = this.audioStream;
	if(audioStream != null) {
		d = audioStream.duration;
		;
	}
	return ~(~d);
};

JkMotionAudioManagerForHTML5MyAudioStream.prototype.setLooping = function(v) {
	var audioStream = this.audioStream;
	var shouldLoop = false;
	if(v != null && audioStream != null) {
		if(v) {
			audioStream.loop = true;
			;
			shouldLoop = true;
		}
		else {
			audioStream.loop = false;
			;
			shouldLoop = false;
		}
	}
	return shouldLoop;
};

JkMotionAudioManagerForHTML5MyAudioStream.prototype.setVolume = function(v) {
	var audioStream = this.audioStream;
	if(v != null && audioStream != null) {
		if(v <= 0.0) {
			audioStream.volume = 0.0;
			;
		}
		else if(v >= 1.0) {
			audioStream.volume = 1.0;
			;
		}
		else {
			audioStream.volume = v;
			;
		}
		return true;
	}
	return false;
};

JkMotionAudioManagerForHTML5MyAudioStream.prototype.getAudioStream = function() {
	return this.audioStream;
};

JkMotionAudioManagerForHTML5MyAudioStream.prototype.setAudioStream = function(v) {
	this.audioStream = v;
	return this;
};

JkMotionAudioManagerForHTML5MyAudioStream.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionAudioManagerForHTML5MyAudioStream"] === true;
};

let JkMotionSpriteSceneWithEntities = function() {
	JkMotionSpriteScene.call(this);
	this.entities = null;
	this.pointerListeners = new Array;
	this.keyListeners = new Array;
	this.highestIndex = -1;
	this.capturedPointerListener = null;
};

JkMotionSpriteSceneWithEntities.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkMotionSpriteScene.prototype);
JkMotionSpriteSceneWithEntities.prototype.constructor = JkMotionSpriteSceneWithEntities;
JkMotionSpriteSceneWithEntities.prototype._t = {
	"JkMotionScene" : true,
	"JkMotionSpriteScene" : true,
	"JkMotionSpriteSceneWithEntities" : true,
	"JkMotionSpriteLayer" : true,
	"JkMotionEntityScene" : true
};
JkMotionSpriteSceneWithEntities.prototype._tobj = JkMotionSpriteSceneWithEntities;

JkMotionSpriteSceneWithEntities.NEW = function() {
	var v = new JkMotionSpriteSceneWithEntities;
	return v.CTOR_JkMotionSpriteSceneWithEntities();
};

JkMotionSpriteSceneWithEntities.prototype.CTOR_JkMotionSpriteSceneWithEntities = function() {
	this.capturedPointerListener = null;
	this.highestIndex = -1;
	this.keyListeners = new Array;
	this.pointerListeners = new Array;
	this.entities = null;
	if(JkMotionSpriteScene.prototype.CTOR_JkMotionSpriteScene.call(this) == null) {
		return null;
	}
	return this;
};

JkMotionSpriteSceneWithEntities.prototype.cleanup = function() {
	JkMotionSpriteScene.prototype.cleanup.call(this);
	this.removeAllEntities();
};

JkMotionSpriteSceneWithEntities.prototype.tick = function(gameTime, delta) {
	JkMotionSpriteScene.prototype.tick.call(this, gameTime, delta);
	var n = 0;
	while(true){
		if(this.entities == null || n > this.highestIndex) {
			break;
		}
		var entity = this.entities[n];
		n++;
		if(entity == null) {
			continue;
		}
		entity.tick(gameTime, delta);
	}
};

JkMotionSpriteSceneWithEntities.prototype.onKeyEvent = function(event) {
	if(this.keyListeners != null) {
		var n = 0;
		var m = this.keyListeners.length;
		for(n = 0 ; n < m ; n++) {
			var keyListener = this.keyListeners[n];
			if(keyListener != null) {
				keyListener.onKeyEvent(event);
				if(event.isConsumed) {
					break;
				}
			}
		}
	}
};

JkMotionSpriteSceneWithEntities.prototype.onPointerEvent = function(event) {
	JkMotionSpriteScene.prototype.onPointerEvent.call(this, event);
	if(this.capturedPointerListener != null) {
		if(this.capturedPointerListener.onPointerEvent(event) == false) {
			this.capturedPointerListener = null;
		}
		event.consume();
		return;
	}
	if(this.pointerListeners != null) {
		var n = 0;
		var m = this.pointerListeners.length;
		for(n = 0 ; n < m ; n++) {
			var pointerListener = this.pointerListeners[n];
			if(pointerListener != null) {
				if(event.isConsumed) {
					break;
				}
				if(pointerListener.onPointerEvent(event)) {
					event.consume();
					this.capturedPointerListener = pointerListener;
					break;
				}
			}
		}
	}
};

JkMotionSpriteSceneWithEntities.prototype.grow = function() {
	var nsz = 0;
	if(this.entities == null) {
		nsz = 1024;
	}
	else {
		nsz = this.entities.length * 2;
	}
	var v = [];
	if(this.entities != null) {
		var osz = this.entities.length;
		for(var n = 0 ; n < osz ; n++) {
			v[n] = this.entities[n];
		}
	}
	this.entities = v;
};

JkMotionSpriteSceneWithEntities.prototype.addEntity = function(entity) {
	if(!(entity != null)) {
		return;
	}
	var thisIndex = this.highestIndex + 1;
	var count = 0;
	if(this.entities != null) {
		count = this.entities.length;
	}
	if(thisIndex >= count) {
		this.grow();
	}
	entity.setScene(this);
	this.entities[thisIndex] = entity;
	entity.index = thisIndex;
	this.highestIndex = thisIndex;
	if(JkUiPointerListener.IS_INSTANCE && JkUiPointerListener.IS_INSTANCE(entity)) {
		this.pointerListeners.push(entity);
	}
	if(JkUiKeyListener.IS_INSTANCE && JkUiKeyListener.IS_INSTANCE(entity)) {
		this.keyListeners.push(entity);
	}
	entity.initialize();
};

JkMotionSpriteSceneWithEntities.prototype.removeEntity = function(entity) {
	if(!(entity != null)) {
		return;
	}
	var eidx = entity.index;
	if(eidx < 0) {
		return;
	}
	if(JkUiPointerListener.IS_INSTANCE && JkUiPointerListener.IS_INSTANCE(entity)) {
		JkLangVector.removeValue(this.pointerListeners, entity);
	}
	if(JkUiKeyListener.IS_INSTANCE && JkUiKeyListener.IS_INSTANCE(entity)) {
		JkLangVector.removeValue(this.keyListeners, entity);
	}
	entity.cleanup();
	entity.setScene(null);
	entity.index = -1;
	if(this.highestIndex == eidx) {
		this.entities[eidx] = null;
	}
	else {
		var n = this.entities[this.highestIndex];
		this.entities[eidx] = n;
		if(n != null) {
			n.index = eidx;
		}
		this.entities[this.highestIndex] = null;
	}
	this.highestIndex--;
};

JkMotionSpriteSceneWithEntities.prototype.removeAllEntities = function() {
	if(!(this.entities != null)) {
		return;
	}
	var n = 0;
	while(true){
		if(this.entities == null || n > this.highestIndex) {
			break;
		}
		var entity = this.entities[n];
		n++;
		if(entity == null) {
			continue;
		}
		entity.cleanup();
		entity.setScene(null);
		entity.index = -1;
	}
	this.entities = null;
	this.highestIndex = -1;
};

JkMotionSpriteSceneWithEntities.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionSpriteSceneWithEntities"] === true;
};

let JkMotionBackendForHTMLElements = function() {
	JkMotionBackend.call(this);
	this.scene = null;
	this.context = null;
	this.domElement = null;
	this.sceneManager = null;
	this.gameTime = null;
	this.isStarted = false;
	this.lastFrame = 0.0;
	this.pointerEvent = JkUiPointerEvent.NEW();
	this.keyEvent = JkUiKeyEvent.NEW();
	this.isOpera = false;
	this.isWebkit = false;
};

JkMotionBackendForHTMLElements.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkMotionBackend.prototype);
JkMotionBackendForHTMLElements.prototype.constructor = JkMotionBackendForHTMLElements;
JkMotionBackendForHTMLElements.prototype._t = {
	"JkMotionBackendForHTMLElements" : true,
	"JkMotionBackend" : true
};
JkMotionBackendForHTMLElements.prototype._tobj = JkMotionBackendForHTMLElements;

JkMotionBackendForHTMLElements.NEW = function() {
	var v = new JkMotionBackendForHTMLElements;
	return v.CTOR_JkMotionBackendForHTMLElements();
};

JkMotionBackendForHTMLElements.prototype.CTOR_JkMotionBackendForHTMLElements = function() {
	this.isWebkit = false;
	this.isOpera = false;
	this.keyEvent = JkUiKeyEvent.NEW();
	this.pointerEvent = JkUiPointerEvent.NEW();
	this.lastFrame = 0.0;
	this.isStarted = false;
	this.gameTime = null;
	this.sceneManager = null;
	this.domElement = null;
	this.context = null;
	this.scene = null;
	if(JkMotionBackend.prototype.CTOR_JkMotionBackend.call(this) == null) {
		return null;
	}
	return this;
};

JkMotionBackendForHTMLElements.forScene = function(scene, context, domElement) {
	var v = JkMotionBackendForHTMLElements.NEW();
	v.setScene(scene);
	v.setContext(context);
	v.setDomElement(domElement);
	v.initialize();
	return v;
};

JkMotionBackendForHTMLElements.prototype.translateKeyCode = function(keycode, keychar, event) {
	var kc = 0;
	var sv = null;
	switch(keycode) {
		case 32:
			kc = JkUiKeyEvent.KEY_SPACE;
			sv = " ";
		case 13:
			kc = JkUiKeyEvent.KEY_ENTER;
			sv = "\n";
		case 9:
			kc = JkUiKeyEvent.KEY_TAB;
			sv = "\t";
		case 27:
			kc = JkUiKeyEvent.KEY_ESCAPE;
		case 8:
			kc = JkUiKeyEvent.KEY_BACKSPACE;
		case 16:
			kc = JkUiKeyEvent.KEY_SHIFT;
		case 17:
			kc = JkUiKeyEvent.KEY_CONTROL;
		case 18:
			kc = JkUiKeyEvent.KEY_ALT;
		case 20:
			kc = JkUiKeyEvent.KEY_CAPSLOCK;
		case 144:
			kc = JkUiKeyEvent.KEY_NUMLOCK;
		case 37:
			kc = JkUiKeyEvent.KEY_LEFT;
		case 38:
			kc = JkUiKeyEvent.KEY_UP;
		case 39:
			kc = JkUiKeyEvent.KEY_RIGHT;
		case 40:
			kc = JkUiKeyEvent.KEY_DOWN;
		case 45:
			kc = JkUiKeyEvent.KEY_INSERT;
		case 46:
			kc = JkUiKeyEvent.KEY_DELETE;
		case 36:
			kc = JkUiKeyEvent.KEY_HOME;
		case 35:
			kc = JkUiKeyEvent.KEY_END;
		case 33:
			kc = JkUiKeyEvent.KEY_PAGEUP;
		case 34:
			kc = JkUiKeyEvent.KEY_PAGEDOWN;
		case 112:
			kc = JkUiKeyEvent.KEY_F1;
		case 113:
			kc = JkUiKeyEvent.KEY_F2;
		case 114:
			kc = JkUiKeyEvent.KEY_F3;
		case 115:
			kc = JkUiKeyEvent.KEY_F4;
		case 116:
			kc = JkUiKeyEvent.KEY_F5;
		case 117:
			kc = JkUiKeyEvent.KEY_F6;
		case 118:
			kc = JkUiKeyEvent.KEY_F7;
		case 119:
			kc = JkUiKeyEvent.KEY_F8;
		case 120:
			kc = JkUiKeyEvent.KEY_F9;
		case 121:
			kc = JkUiKeyEvent.KEY_F10;
		case 122:
			kc = JkUiKeyEvent.KEY_F11;
		case 123:
			kc = JkUiKeyEvent.KEY_F12;
		case 224:
			kc = JkUiKeyEvent.KEY_SUPER;
		case 91:
			kc = JkUiKeyEvent.KEY_SUPER;
		case 92:
			kc = JkUiKeyEvent.KEY_SUPER;
		case 93:
			kc = JkUiKeyEvent.KEY_SUPER;
		default:
			kc = JkUiKeyEvent.KEY_NONE;
			sv = keychar;
	}
	event.setKeyCode(kc);
	event.setStringValue(sv);
};

JkMotionBackendForHTMLElements.prototype.onJSKeyDown = function(e) {
	var keycode = 0;
	var keychar = null;
	var shift = false;
	var alt = false;
	var ctrl = false;
	keychar = e.key;
	keycode = e.keyCode;
	shift = e.shiftKey;
	alt = e.altKey;
	ctrl = e.ctrlKey;
	;
	if(this.isWebkit && ctrl) {
		this.onJSKeyPress(e);
		return;
	}
	this.keyEvent.clear();
	this.keyEvent.setAction(JkUiKeyEvent.ACTION_DOWN);
	this.translateKeyCode(keycode, keychar, this.keyEvent);
	this.keyEvent.setShift(shift);
	this.keyEvent.setControl(ctrl);
	this.keyEvent.setAlt(alt);
	this.onKeyEvent(this.keyEvent);
	if(this.keyEvent.isConsumed) {
		if(e.preventDefault) {
			e.preventDefault();
		}
		;
	}
};

JkMotionBackendForHTMLElements.prototype.onJSKeyPress = function(e) {
	var keycode = 0;
	var charcode = 0;
	var shift = false;
	var alt = false;
	var ctrl = false;
	keycode = e.keyCode;
	if(this.isOpera) {
		charcode = e.which;
	}
	else if(this.isWebkit) {
		charcode = e.keyCode;
	}
	else {
		charcode = e.charCode;
	}
	shift = e.shiftKey;
	alt = e.altKey;
	ctrl = e.ctrlKey;
	;
	this.keyEvent.clear();
	this.keyEvent.setAction(JkUiKeyEvent.ACTION_DOWN);
	this.translateKeyCode(keycode, null, this.keyEvent);
	if(this.isOpera == false && this.isWebkit == false) {
		if(keycode > 0 && this.keyEvent.getKeyCode() != JkUiKeyEvent.KEY_NONE) {
			return;
		}
	}
	if(charcode == 32 || charcode == 9 || charcode == 8) {
		return;
	}
	if(charcode > 0) {
		var str = JkLangString.forCharacter(charcode);
		if(ctrl) {
			str = JkLangString.toLowerCase(str);
		}
		this.keyEvent.setStringValue(str);
		this.keyEvent.setShift(shift);
		this.keyEvent.setControl(ctrl);
		this.keyEvent.setAlt(alt);
		this.onKeyEvent(this.keyEvent);
		if(this.keyEvent.isConsumed) {
			if(e.preventDefault) {
				e.preventDefault();
			}
			;
		}
	}
};

JkMotionBackendForHTMLElements.prototype.onJSKeyUp = function(e) {
	var keycode = 0;
	var keychar = null;
	var shift = false;
	var alt = false;
	var ctrl = false;
	keychar = e.key;
	keycode = e.keyCode;
	shift = e.shiftKey;
	alt = e.altKey;
	ctrl = e.ctrlKey;
	;
	this.keyEvent.clear();
	this.keyEvent.setAction(JkUiKeyEvent.ACTION_UP);
	this.translateKeyCode(keycode, keychar, this.keyEvent);
	this.keyEvent.setShift(shift);
	this.keyEvent.setControl(ctrl);
	this.keyEvent.setAlt(alt);
	this.onKeyEvent(this.keyEvent);
	if(this.keyEvent.isConsumed) {
		if(e.preventDefault) {
			e.preventDefault();
		}
		;
	}
};

JkMotionBackendForHTMLElements.prototype.initialize = function() {
	if(navigator.userAgent.indexOf("Opera") >= 0) {
		this.isOpera = true;
	}
	if(navigator.userAgent.indexOf("WebKit") >= 0) {
		this.isWebkit = true;
	}
	;
	this.sceneManager = JkMotionSceneManager.NEW();
	this.sceneManager.setContext(this.context);
	this.sceneManager.setBackend(this);
	this.sceneManager.pushScene(this.scene);
	this.sceneManager.initialize();
	var onDown = function(event1) {
		var posx = 0;
		var posy = 0;
		posx = event.clientX;
		posy = event.clientY;
		;
		this.pointerEvent.isConsumed = false;
		this.pointerEvent.action = JkUiPointerEvent.DOWN;
		this.pointerEvent.pointerId = 0;
		this.pointerEvent.x = posx;
		this.pointerEvent.y = posy;
		this.onPointerEvent(this.pointerEvent);
		event.preventDefault();
		;
	}.bind(this);
	var onMove = function(event3) {
		var posx1 = 0;
		var posy1 = 0;
		posx = event.clientX;
		posy = event.clientY;
		;
		this.pointerEvent.isConsumed = false;
		this.pointerEvent.action = JkUiPointerEvent.MOVE;
		this.pointerEvent.pointerId = 0;
		this.pointerEvent.x = posx1;
		this.pointerEvent.y = posy1;
		this.onPointerEvent(this.pointerEvent);
		event.preventDefault();
		;
	}.bind(this);
	var onUp = function(event5) {
		var posx2 = 0;
		var posy2 = 0;
		posx = event.clientX;
		posy = event.clientY;
		;
		this.pointerEvent.isConsumed = false;
		this.pointerEvent.action = JkUiPointerEvent.UP;
		this.pointerEvent.pointerId = 0;
		this.pointerEvent.x = posx2;
		this.pointerEvent.y = posy2;
		this.onPointerEvent(this.pointerEvent);
		event.preventDefault();
		;
	}.bind(this);
	JkUiHTMLDOM.addEventListenerWithParameterInCallback(this.domElement, "touchstart", onDown);
	JkUiHTMLDOM.addEventListenerWithParameterInCallback(this.domElement, "touchmove", onMove);
	JkUiHTMLDOM.addEventListenerWithParameterInCallback(this.domElement, "touchend", onUp);
	JkUiHTMLDOM.addEventListenerWithParameterInCallback(this.domElement, "mousedown", onDown);
	JkUiHTMLDOM.addEventListenerWithParameterInCallback(this.domElement, "mousemove", onMove);
	JkUiHTMLDOM.addEventListenerWithParameterInCallback(this.domElement, "mouseup", onUp);
	window.addEventListener('keydown', function(event) {
		this.onJSKeyDown(event)
	}.bind(this), false);
	window.addEventListener('keypress', function(event) {
		this.onJSKeyPress(event)
	}.bind(this), false);
	window.addEventListener('keyup', function(event) {
		this.onJSKeyUp(event)
	}.bind(this), false);
	;
};

JkMotionBackendForHTMLElements.prototype.start = function() {
	this.isStarted = true;
	this.sceneManager.start();
	requestAnimationFrame(function(e) { this.onAnimationFrame(e); }.bind(this));
	;
};

JkMotionBackendForHTMLElements.prototype.stop = function() {
	this.sceneManager.stop();
	this.isStarted = false;
};

JkMotionBackendForHTMLElements.prototype.cleanup = function() {
	this.sceneManager.cleanup();
	this.sceneManager = null;
};

JkMotionBackendForHTMLElements.prototype.createSpriteLayer = function() {
	var ee = JkUiHTMLDOM.createElement("div");
	JkUiHTMLDOM.setStyle(ee, "position", "absolute");
	JkUiHTMLDOM.setStyle(ee, "top", "0");
	JkUiHTMLDOM.setStyle(ee, "left", "0");
	JkUiHTMLDOM.setStyle(ee, "width", "100%");
	JkUiHTMLDOM.setStyle(ee, "height", "100%");
	JkUiHTMLDOM.setStyle(ee, "overflow", "hidden");
	JkUiHTMLDOM.appendChild(this.domElement, ee);
	var v = JkMotionBackendForHTMLElementsMySpriteLayer.NEW();
	v.setContext(this.context);
	v.setElement(ee);
	return v;
};

JkMotionBackendForHTMLElements.prototype.createImageFromResource = function(name) {
	return this.context.getResourceImage(name);
};

JkMotionBackendForHTMLElements.prototype.createTextureForImage = function(image) {
	var v = JkMotionBackendForHTMLElementsMyImageTexture.NEW();
	v.image = image;
	return v;
};

JkMotionBackendForHTMLElements.prototype.createTextureForColor = function(color) {
	var v = JkMotionBackendForHTMLElementsMyColorTexture.NEW();
	v.color = color;
	return v;
};

JkMotionBackendForHTMLElements.prototype.deleteSpriteLayer = function(layer) {
	var l = (function(o) {
		if(JkMotionBackendForHTMLElementsMySpriteLayer.IS_INSTANCE && JkMotionBackendForHTMLElementsMySpriteLayer.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(layer);
	if(l != null) {
		l.removeFromContainer();
	}
};

JkMotionBackendForHTMLElements.prototype.deleteTexture = function(texture) {
};

JkMotionBackendForHTMLElements.prototype.onPointerEvent = function(event) {
	event.x = event.x / this.domElement.clientWidth;
	event.y = event.y / this.domElement.clientHeight;
	var scene = this.sceneManager.getCurrentScene();
	if(scene != null) {
		scene.onPointerEvent(event);
	}
};

JkMotionBackendForHTMLElements.prototype.onKeyEvent = function(event) {
	var scene = this.sceneManager.getCurrentScene();
	if(scene != null) {
		scene.onKeyEvent(event);
	}
};

JkMotionBackendForHTMLElements.prototype.onAnimationFrame = function(timeMilliSeconds) {
	if(this.lastFrame == 0) {
		this.lastFrame = timeMilliSeconds;
	}
	this.onTick((~(~timeMilliSeconds)), (~(~(timeMilliSeconds - this.lastFrame))));
	this.lastFrame = timeMilliSeconds;
	if(this.isStarted) {
		requestAnimationFrame(function(e) { this.onAnimationFrame(e); }.bind(this));
		;
	}
};

JkMotionBackendForHTMLElements.prototype.onTick = function(totalTime, deltaTime) {
	if(this.gameTime == null) {
		this.gameTime = JkLangTimeValue.NEW();
	}
	this.gameTime.setMilliSeconds(totalTime);
	var scene = this.sceneManager.getCurrentScene();
	if(scene != null) {
		scene.tick(this.gameTime, (deltaTime / 1000.0));
	}
};

JkMotionBackendForHTMLElements.prototype.getScene = function() {
	return this.scene;
};

JkMotionBackendForHTMLElements.prototype.setScene = function(v) {
	this.scene = v;
	return this;
};

JkMotionBackendForHTMLElements.prototype.getContext = function() {
	return this.context;
};

JkMotionBackendForHTMLElements.prototype.setContext = function(v) {
	this.context = v;
	return this;
};

JkMotionBackendForHTMLElements.prototype.getDomElement = function() {
	return this.domElement;
};

JkMotionBackendForHTMLElements.prototype.setDomElement = function(v) {
	this.domElement = v;
	return this;
};

JkMotionBackendForHTMLElements.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMotionBackendForHTMLElements"] === true;
};
