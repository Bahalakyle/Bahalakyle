let JkWidgetGoogleMapsStreetViewWidget = function() {
	JkWidgetWidget.call(this);
	this.context = null;
};

JkWidgetGoogleMapsStreetViewWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetGoogleMapsStreetViewWidget.prototype.constructor = JkWidgetGoogleMapsStreetViewWidget;
JkWidgetGoogleMapsStreetViewWidget.prototype._t = {
	"JkWidgetWidget" : true,
	"JkWidgetGoogleMapsStreetViewWidget" : true,
	"JkWidgetScreenAwareWidget" : true
};
JkWidgetGoogleMapsStreetViewWidget.prototype._tobj = JkWidgetGoogleMapsStreetViewWidget;

JkWidgetGoogleMapsStreetViewWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetGoogleMapsStreetViewWidget;
	return v.CTOR_JkWidgetGoogleMapsStreetViewWidget_JkUiGuiApplicationContext(context);
};

JkWidgetGoogleMapsStreetViewWidget.prototype.CTOR_JkWidgetGoogleMapsStreetViewWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.context = null;
	this.context = context;
	return this;
};

JkWidgetGoogleMapsStreetViewWidget.prototype.onWidgetAddedToScreen = function(screen) {
};

JkWidgetGoogleMapsStreetViewWidget.prototype.onWidgetRemovedFromScreen = function(screen) {
};

JkWidgetGoogleMapsStreetViewWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetGoogleMapsStreetViewWidget"] === true;
};

let JkWidgetGoogleMapsMapMarker = {};

JkWidgetGoogleMapsMapMarker.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetGoogleMapsMapMarker"] === true;
};

let JkWidgetGoogleMapsMapWidgetMyMapSettings = function() {
	this.canZoom = true;
	this.canTilt = true;
	this.canRotate = true;
	this.mapHasMyLocation = false;
	this.settingObject = null;
	this.mapObject = null;
};

JkWidgetGoogleMapsMapWidgetMyMapSettings.prototype._t = { "JkWidgetGoogleMapsMapWidgetMyMapSettings" : true };
JkWidgetGoogleMapsMapWidgetMyMapSettings.prototype._tobj = JkWidgetGoogleMapsMapWidgetMyMapSettings;

JkWidgetGoogleMapsMapWidgetMyMapSettings.NEW = function() {
	var v = new JkWidgetGoogleMapsMapWidgetMyMapSettings;
	return v.CTOR_JkWidgetGoogleMapsMapWidgetMyMapSettings();
};

JkWidgetGoogleMapsMapWidgetMyMapSettings.prototype.CTOR_JkWidgetGoogleMapsMapWidgetMyMapSettings = function() {
	this.mapObject = null;
	this.settingObject = null;
	this.mapHasMyLocation = false;
	this.canRotate = true;
	this.canTilt = true;
	this.canZoom = true;
	return this;
};

JkWidgetGoogleMapsMapWidgetMyMapSettings.prototype.setCanZoom = function(enable) {
	this.canZoom = enable;
	if(this.settingObject != null) {
		console.log("[jk.widget.google.maps.MapWidget.MyMapSettings.setCanZoom] (MapWidget.sling:995:5): Not implemented");
	}
};

JkWidgetGoogleMapsMapWidgetMyMapSettings.prototype.setCanTilt = function(enable) {
	this.canTilt = enable;
	if(this.settingObject != null) {
		console.log("[jk.widget.google.maps.MapWidget.MyMapSettings.setCanTilt] (MapWidget.sling:1027:5): Not implemented");
	}
};

JkWidgetGoogleMapsMapWidgetMyMapSettings.prototype.setCanRotate = function(enable) {
	this.canRotate = enable;
	if(this.settingObject != null) {
		console.log("[jk.widget.google.maps.MapWidget.MyMapSettings.setCanRotate] (MapWidget.sling:1059:5): Not implemented");
	}
};

JkWidgetGoogleMapsMapWidgetMyMapSettings.prototype.setMapHasMyLocation = function(enable) {
	this.mapHasMyLocation = enable;
	if(this.settingObject != null) {
		console.log("[jk.widget.google.maps.MapWidget.MyMapSettings.setMapHasMyLocation] (MapWidget.sling:1096:5): Not implemented");
	}
};

JkWidgetGoogleMapsMapWidgetMyMapSettings.prototype.getCanZoom = function() {
	return this.canZoom;
};

JkWidgetGoogleMapsMapWidgetMyMapSettings.prototype.getCanTilt = function() {
	return this.canTilt;
};

JkWidgetGoogleMapsMapWidgetMyMapSettings.prototype.getCanRotate = function() {
	return this.canRotate;
};

JkWidgetGoogleMapsMapWidgetMyMapSettings.prototype.getMapHasMyLocation = function() {
	return this.mapHasMyLocation;
};

JkWidgetGoogleMapsMapWidgetMyMapSettings.prototype.getSettingObject = function() {
	return this.settingObject;
};

JkWidgetGoogleMapsMapWidgetMyMapSettings.prototype.setSettingObject = function(v) {
	this.settingObject = v;
	return this;
};

JkWidgetGoogleMapsMapWidgetMyMapSettings.prototype.getMapObject = function() {
	return this.mapObject;
};

JkWidgetGoogleMapsMapWidgetMyMapSettings.prototype.setMapObject = function(v) {
	this.mapObject = v;
	return this;
};

JkWidgetGoogleMapsMapWidgetMyMapSettings.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetGoogleMapsMapWidgetMyMapSettings"] === true;
};

let JkWidgetGoogleMapsMapWidgetMapCamera = function() {
	this.angle = 0.0;
	this.bearing = 0.0;
	this.zoom = 0.0;
	this.latitude = 0.0;
	this.longitude = 0.0;
};

JkWidgetGoogleMapsMapWidgetMapCamera.prototype._t = { "JkWidgetGoogleMapsMapWidgetMapCamera" : true };
JkWidgetGoogleMapsMapWidgetMapCamera.prototype._tobj = JkWidgetGoogleMapsMapWidgetMapCamera;

JkWidgetGoogleMapsMapWidgetMapCamera.NEW = function() {
	var v = new JkWidgetGoogleMapsMapWidgetMapCamera;
	return v.CTOR_JkWidgetGoogleMapsMapWidgetMapCamera();
};

JkWidgetGoogleMapsMapWidgetMapCamera.prototype.CTOR_JkWidgetGoogleMapsMapWidgetMapCamera = function() {
	this.longitude = 0.0;
	this.latitude = 0.0;
	this.zoom = 0.0;
	this.bearing = 0.0;
	this.angle = 0.0;
	return this;
};

JkWidgetGoogleMapsMapWidgetMapCamera.prototype.getAngle = function() {
	return this.angle;
};

JkWidgetGoogleMapsMapWidgetMapCamera.prototype.setAngle = function(v) {
	this.angle = v;
	return this;
};

JkWidgetGoogleMapsMapWidgetMapCamera.prototype.getBearing = function() {
	return this.bearing;
};

JkWidgetGoogleMapsMapWidgetMapCamera.prototype.setBearing = function(v) {
	this.bearing = v;
	return this;
};

JkWidgetGoogleMapsMapWidgetMapCamera.prototype.getZoom = function() {
	return this.zoom;
};

JkWidgetGoogleMapsMapWidgetMapCamera.prototype.setZoom = function(v) {
	this.zoom = v;
	return this;
};

JkWidgetGoogleMapsMapWidgetMapCamera.prototype.getLatitude = function() {
	return this.latitude;
};

JkWidgetGoogleMapsMapWidgetMapCamera.prototype.setLatitude = function(v) {
	this.latitude = v;
	return this;
};

JkWidgetGoogleMapsMapWidgetMapCamera.prototype.getLongitude = function() {
	return this.longitude;
};

JkWidgetGoogleMapsMapWidgetMapCamera.prototype.setLongitude = function(v) {
	this.longitude = v;
	return this;
};

JkWidgetGoogleMapsMapWidgetMapCamera.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetGoogleMapsMapWidgetMapCamera"] === true;
};

let JkWidgetGoogleMapsMapWidgetMyMapMarker = function() {
	this.lat = 0.0;
	this.lon = 0.0;
	this.rotation = 0.0;
	this.anchorX = 0.0;
	this.anchorY = 0.0;
	this.label = null;
	this.title = null;
	this.icon = null;
	this.removed = false;
	this.clickHandler = null;
	this.infoWindowWidget = null;
	this.infoWindowClickHandler = null;
	this.markerObject = null;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype._t = {
	"JkWidgetGoogleMapsMapMarker" : true,
	"JkWidgetGoogleMapsMapWidgetMyMapMarker" : true
};
JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype._tobj = JkWidgetGoogleMapsMapWidgetMyMapMarker;

JkWidgetGoogleMapsMapWidgetMyMapMarker.NEW = function() {
	var v = new JkWidgetGoogleMapsMapWidgetMyMapMarker;
	return v.CTOR_JkWidgetGoogleMapsMapWidgetMyMapMarker();
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.CTOR_JkWidgetGoogleMapsMapWidgetMyMapMarker = function() {
	this.markerObject = null;
	this.infoWindowClickHandler = null;
	this.infoWindowWidget = null;
	this.clickHandler = null;
	this.removed = false;
	this.icon = null;
	this.title = null;
	this.label = null;
	this.anchorY = 0.0;
	this.anchorX = 0.0;
	this.rotation = 0.0;
	this.lon = 0.0;
	this.lat = 0.0;
	return this;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.move = function(lat, lon) {
	this.lat = lat;
	this.lon = lon;
	if(this.markerObject != null) {
		this.markerObject.setPosition({ lat: lat, lng: lon });
		;
	}
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.remove = function() {
	if(this.markerObject != null) {
		this.markerObject.setMap(null);
		;
	}
	this.removed = true;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.rotate = function(deg) {
	this.rotation = deg;
	if(this.markerObject != null) {
	}
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.setAnchor = function(x, y) {
	this.anchorX = x;
	this.anchorY = y;
	if(this.markerObject != null) {
		console.log("[jk.widget.google.maps.MapWidget.MyMapMarker.setAnchor] (MapWidget.sling:920:5): Not yet implemented");
	}
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.setInfoWindowWidget = function(window) {
	this.infoWindowWidget = window;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.getInfoWindowWidget = function() {
	return this.infoWindowWidget;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.setInfoWindowClickHandler = function(handler) {
	this.infoWindowClickHandler = handler;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.setClickHandler = function(handler) {
	this.clickHandler = handler;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.onMapMarkerClicked = function() {
	if(this.clickHandler != null) {
		this.clickHandler();
	}
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.onInfoWindowClicked = function() {
	if(this.infoWindowClickHandler != null) {
		this.infoWindowClickHandler();
	}
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.getLat = function() {
	return this.lat;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.setLat = function(v) {
	this.lat = v;
	return this;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.getLon = function() {
	return this.lon;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.setLon = function(v) {
	this.lon = v;
	return this;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.getRotation = function() {
	return this.rotation;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.setRotation = function(v) {
	this.rotation = v;
	return this;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.getAnchorX = function() {
	return this.anchorX;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.setAnchorX = function(v) {
	this.anchorX = v;
	return this;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.getAnchorY = function() {
	return this.anchorY;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.setAnchorY = function(v) {
	this.anchorY = v;
	return this;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.getLabel = function() {
	return this.label;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.setLabel = function(v) {
	this.label = v;
	return this;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.getTitle = function() {
	return this.title;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.setTitle = function(v) {
	this.title = v;
	return this;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.getIcon = function() {
	return this.icon;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.setIcon = function(v) {
	this.icon = v;
	return this;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.getRemoved = function() {
	return this.removed;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.prototype.setRemoved = function(v) {
	this.removed = v;
	return this;
};

JkWidgetGoogleMapsMapWidgetMyMapMarker.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetGoogleMapsMapWidgetMyMapMarker"] === true;
};

let JkWidgetGoogleMapsMapWidget = function() {
	JkWidgetWidget.call(this);
	this.myId = null;
	this.mapObject = null;
	this.webApiKey = null;
	this.centerLat = 0.0;
	this.centerLon = 0.0;
	this.defaultZoomLevel = 14;
	this.zoomInCenter = true;
	this.streetViewEnabled = false;
	this.markerSize = 0;
	this.widgetMapCameraStartMovingHandler = null;
	this.widgetMapCameraMovingHandler = null;
	this.widgetMapCameraStopMovingHandler = null;
	this.context = null;
	this.mapClickHandler = null;
	this.mapMarkers = null;
	this.markerQueue = null;
	this.coordinateQueue = null;
	this.coordinateQueueMoveWithAnimation = false;
	this.centerQueue = null;
	this.centerQueueMoveWithAnimation = false;
	this.mapSettings = null;
	this.mapInitialized = false;
};

JkWidgetGoogleMapsMapWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetGoogleMapsMapWidget.prototype.constructor = JkWidgetGoogleMapsMapWidget;
JkWidgetGoogleMapsMapWidget.prototype._t = {
	"JkGeoGeoCoder" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetGoogleMapsMapWidget" : true
};
JkWidgetGoogleMapsMapWidget.prototype._tobj = JkWidgetGoogleMapsMapWidget;

JkWidgetGoogleMapsMapWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetGoogleMapsMapWidget;
	return v.CTOR_JkWidgetGoogleMapsMapWidget_JkUiGuiApplicationContext(context);
};

JkWidgetGoogleMapsMapWidget.prototype.CTOR_JkWidgetGoogleMapsMapWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.mapInitialized = false;
	this.mapSettings = null;
	this.centerQueueMoveWithAnimation = false;
	this.centerQueue = null;
	this.coordinateQueueMoveWithAnimation = false;
	this.coordinateQueue = null;
	this.markerQueue = null;
	this.mapMarkers = null;
	this.mapClickHandler = null;
	this.context = null;
	this.widgetMapCameraStopMovingHandler = null;
	this.widgetMapCameraMovingHandler = null;
	this.widgetMapCameraStartMovingHandler = null;
	this.markerSize = 0;
	this.streetViewEnabled = false;
	this.zoomInCenter = true;
	this.defaultZoomLevel = 14;
	this.centerLon = 0.0;
	this.centerLat = 0.0;
	this.webApiKey = null;
	this.mapObject = null;
	this.myId = null;
	this.context = context;
	this.markerSize = context.getHeightValue("6mm");
	this.mapSettings = JkWidgetGoogleMapsMapWidgetMyMapSettings.NEW();
	return this;
};

JkWidgetGoogleMapsMapWidget.prototype.initializeHtmlWidget = function() {
	this.myId = "GoogleMapWidget" + (JkLangString.safeString((JkLangString.forInteger((JkWidgetGoogleMapsMapWidget.mapCounter++)))));
	JkUiHTMLDOM.setAttribute(this.element, "id", this.myId);
	if(JkWidgetGoogleMapsMapWidget.sdkLoaded) {
		this.context.startTimer(5, (function() {
			this.initializeMapForWidget();
		}.bind(this)));
	}
	else {
		if(JkWidgetGoogleMapsMapWidget.sdkIncluded) {
			console.log("Google Maps SDK included but not yet loaded. Cannot proceed.");
			return;
		}
		JkWidgetGoogleMapsMapWidget.mapViewWaiting = this;
		var googleScript = JkUiHTMLDOM.createElement("script");
		JkUiHTMLDOM.setAttribute(googleScript, "src", "https://maps.googleapis.com/maps/api/js?key=" + (JkLangString.safeString((JkUrlURLEncoder.encode(this.webApiKey, false, true)))) + ("&callback=JkWidgetGoogleMapsMapWidget.onGoogleMapLoaded"));
		JkUiHTMLDOM.setAttribute(googleScript, "async", "");
		JkUiHTMLDOM.setAttribute(googleScript, "defer", "");
		JkUiHTMLDOM.appendChild((JkUiHTMLDOM.getDocumentBody()), googleScript);
		JkWidgetGoogleMapsMapWidget.sdkIncluded = true;
	}
};

JkWidgetGoogleMapsMapWidget.onGoogleMapLoaded = function() {
	JkWidgetGoogleMapsMapWidget.sdkLoaded = true;
	var vv = JkWidgetGoogleMapsMapWidget.mapViewWaiting;
	JkWidgetGoogleMapsMapWidget.mapViewWaiting = null;
	if(vv != null) {
		vv.initializeMapForWidget();
		if(!(JkWidgetGoogleMapsMapWidget.addressQueryWaiting == null)) {
			vv.queryLocation(JkWidgetGoogleMapsMapWidget.addressQueryWaiting, JkWidgetGoogleMapsMapWidget.addressQueryWaitingListener);
			JkWidgetGoogleMapsMapWidget.addressQueryWaiting = null;
			JkWidgetGoogleMapsMapWidget.addressQueryWaitingListener = null;
		}
	}
};

JkWidgetGoogleMapsMapWidget.prototype.physicalAddressForResults = function(results) {
	var v = JkGeoPhysicalAddress.NEW();
	var result = results[0];
	v.setCompleteAddress(result.formatted_address);
	var comps = result.address_components;
	for(var n=0; n < comps.length; n++) {
		var comp = comps[n];
		var types = comp.types;
		for(var m=0; m < types.length; m++) {
			var type = types[m];
			if(type === "street_number") {
				v.setStreetAddressDetail(comp.long_name);
			}
			else if(type === "route") {
				v.setStreetAddress(comp.long_name);
			}
			else if(type === "sublocality") {
				v.setSubLocality(comp.long_name);
			}
			else if(type === "locality") {
				v.setLocality(comp.long_name);
			}
			else if(type === "country") {
				v.setCountry(comp.long_name);
				v.setCountryCode(comp.short_name);
			}
			else if(type === "postal_code") {
				v.setPostalCode(comp.long_name);
			}
			else if(type === "administrative_area_level_1") {
				v.setAdministrativeArea(comp.long_name);
			}
			else if(type === "administrative_area_level_2") {
				v.setSubAdministrativeArea(comp.long_name);
			}
		}
	}
	;
	return v;
};

JkWidgetGoogleMapsMapWidget.prototype.queryAddress = function(latitude, longitude, listener) {
	if(listener == null) {
		return false;
	}
	var error = JkLangError.forCode("geocoding_failed", null);
	var myObject = this;
	var geoCoder = new google.maps.Geocoder();
	geoCoder.geocode({'location': { lat: latitude, lng : longitude }}, function(results, status) {
		if(status != "OK" || !results) {
			listener.onQueryAddressErrorReceived(error);
		}
		else {
			console.log(JSON.stringify(results, null, 4));
			var pa = myObject.physicalAddressForResults(results);
			pa.setLatitude(latitude);
			pa.setLongitude(longitude);
			listener.onQueryAddressCompleted(pa);
		}
	});
	;
	return true;
};

JkWidgetGoogleMapsMapWidget.prototype.queryLocation = function(address, listener) {
	if(listener == null) {
		return false;
	}
	if(JkWidgetGoogleMapsMapWidget.sdkLoaded == false) {
		JkWidgetGoogleMapsMapWidget.addressQueryWaiting = address;
		JkWidgetGoogleMapsMapWidget.addressQueryWaitingListener = listener;
		return true;
	}
	var error = JkLangError.forCode("geocoding_failed", null);
	var r = JkGeoGeoLocation.NEW();
	var geoCoder = new google.maps.Geocoder();
	geoCoder.geocode({'address': address }, function(results, status) {
		if(status != "OK" || !results) {
			listener.onQueryLocationErrorReceived(error);
		}
		else {
			console.log(JSON.stringify(results, null, 4));
			r.setLatitude(results[0].geometry.location.lat());
			r.setLongitude(results[0].geometry.location.lng());
			listener.onQueryLocationCompleted(r);
		}
	});
	;
	return true;
};

JkWidgetGoogleMapsMapWidget.prototype.initializeMapForWidget = function() {
	if(this.mapInitialized) {
		return;
	}
	var myObject = this;
	var map = new google.maps.Map(document.getElementById(this.myId), {
		zoom: this.defaultZoomLevel,
		center: { lat: this.centerLat, lng: this.centerLon }
});
this.mapObject = map;
var dragging = false;
google.maps.event.addListener(map, 'click', function(evt) {
	myObject.onMapClicked(evt.latLng.lat(), evt.latLng.lng());
});
google.maps.event.addListener(map, 'dragstart', function() {
	dragging = true;
	myObject.onCameraStartMoving(true);
});
google.maps.event.addListener(map, 'drag', function() {
	myObject.onCameraMoving();
});
google.maps.event.addListener(map, 'dragend', function() {
	dragging = false;
	myObject.onCameraStopMoving();
});
google.maps.event.addListener(map, 'center_changed', function() {
	if(dragging == true) {
		return;
	}
	myObject.onCameraStopMoving();
});
;
this.mapInitialized = true;
this.placeQueuedMarkers();
if(this.coordinateQueue != null) {
	this.doZoomToCoordinates();
}
if(this.centerQueue != null) {
	this.doMoveToCenter();
}
};

JkWidgetGoogleMapsMapWidget.forApiKeys = function(context, webApiKey, iosApiKey) {
	var v = JkWidgetGoogleMapsMapWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWebApiKey(webApiKey);
	return v;
};

JkWidgetGoogleMapsMapWidget.prototype.onWidgetAddingToParent = function() {
	;
};

JkWidgetGoogleMapsMapWidget.prototype.onWidgetAddedToParent = function() {
	this.initializeHtmlWidget();
};

JkWidgetGoogleMapsMapWidget.prototype.onWidgetRemovedFromParent = function() {
	;
};

JkWidgetGoogleMapsMapWidget.prototype.onMarkerClicked = function(marker) {
	if(!(marker != null)) {
		return;
	}
	var myMarker = null;
	console.log("[jk.widget.google.maps.MapWidget.onMarkerClicked] (MapWidget.sling:1280:3): Not yet implemented");
	if(!(myMarker != null)) {
		return;
	}
	myMarker.onMapMarkerClicked();
};

JkWidgetGoogleMapsMapWidget.prototype.onMapClicked = function(lat, lon) {
	if(this.mapClickHandler != null) {
		this.mapClickHandler(lat, lon);
	}
};

JkWidgetGoogleMapsMapWidget.prototype.addMapClickHandler = function(handler) {
	this.mapClickHandler = handler;
};

JkWidgetGoogleMapsMapWidget.prototype.addMapMarker = function(lat, lon, label, title, icon) {
	var v = JkWidgetGoogleMapsMapWidgetMyMapMarker.NEW();
	v.setLat(lat);
	v.setLon(lon);
	v.setLabel(label);
	v.setTitle(title);
	v.setIcon(icon);
	if(this.mapInitialized) {
		this.doAddMapMarker(v);
	}
	else {
		if(this.markerQueue == null) {
			this.markerQueue = new Array;
		}
		this.markerQueue.push(v);
	}
	return v;
};

JkWidgetGoogleMapsMapWidget.prototype.placeQueuedMarkers = function() {
	if(this.markerQueue != null) {
		var n = 0;
		var m = this.markerQueue.length;
		for(n = 0 ; n < m ; n++) {
			var marker = this.markerQueue[n];
			if(marker != null) {
				if(marker.getRemoved() == false) {
					this.doAddMapMarker(marker);
				}
			}
		}
	}
	this.markerQueue = null;
};

JkWidgetGoogleMapsMapWidget.prototype.doAddMapMarker = function(marker) {
	var ico = (function(o) {
		if(JkUiImageForBrowser.IS_INSTANCE && JkUiImageForBrowser.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((marker.getIcon()));
	var msz = this.markerSize;
	var mkropt = { position: { lat: marker.getLat(), lng: marker.getLon() },
	map: this.mapObject,
	title : marker.getTitle(),
	label : marker.getLabel()
};
if(ico != null) {
	var icon = { url: ico.getSource(),
	scaledSize: { width: msz, height: msz}
};
mkropt.icon = icon;
}
var mo = new google.maps.Marker(mkropt);
google.maps.event.addListener(mo, 'click', function(evt) {
marker.onMapMarkerClicked();
/* Default behavior when marker is clicked */
var pos = mo.getPosition();
this.moveToCenter(pos.lat(), pos.lng(), true);
var iww = marker.getInfoWindowWidget();
if(iww !== null) {
	JkWidgetWidget.setWidgetClickHandler(iww, function() {
		marker.onInfoWindowClicked();
	});
	var inf = new google.maps.InfoWindow({
		content : iww.element
	});
	google.maps.event.addListener(inf, 'domready', function() {
		iww.onWidgetAddingToParent();
		iww.onWidgetAddedToParent();
		iww.scheduleLayout();
	});
	inf.open(this.mapObject, mo);
}
}.bind(this));
marker.markerObject = mo;
;
if(!(this.mapMarkers != null)) {
	this.mapMarkers = new Array;
}
this.mapMarkers.push(marker);
};

JkWidgetGoogleMapsMapWidget.prototype.moveToCenter = function(lat, lon, animated) {
	this.centerQueue = JkGeoGeoLocation.NEW().setLatitude(lat).setLongitude(lon);
	this.centerQueueMoveWithAnimation = animated;
	if(this.mapInitialized) {
		this.doMoveToCenter();
	}
};

JkWidgetGoogleMapsMapWidget.prototype.doMoveToCenter = function() {
	if(!(this.centerQueue != null)) {
		return;
	}
	this.moveCamera((JkWidgetGoogleMapsMapWidgetMapCamera.NEW().setLatitude((this.centerQueue.getLatitude())).setLongitude((this.centerQueue.getLongitude())).setZoom(this.defaultZoomLevel).setAngle(45).setBearing(0)), this.centerQueueMoveWithAnimation);
};

JkWidgetGoogleMapsMapWidget.prototype.moveCamera = function(camera, animated) {
	if(!(camera != null)) {
		return;
	}
	var latlon = { "lat" : camera.getLatitude(), "lng" : camera.getLongitude() };
	if(animated) {
		this.mapObject.panTo(latlon);
	}
	else {
		this.mapObject.setCenter(latlon);
	}
	;
};

JkWidgetGoogleMapsMapWidget.prototype.zoomToCoordinates = function(coors, animated) {
	if(this.mapInitialized) {
		this.coordinateQueue = coors;
		this.coordinateQueueMoveWithAnimation = animated;
		this.doZoomToCoordinates();
	}
	else {
		this.coordinateQueue = coors;
	}
};

JkWidgetGoogleMapsMapWidget.prototype.doZoomToCoordinates = function() {
	var bounds = new google.maps.LatLngBounds();
	for(var i = 0; i < this.coordinateQueue.length; i++) {
		var bound = this.coordinateQueue[i];
		var latlon = new google.maps.LatLng({ lat: bound.getDouble("latitude"), lng: bound.getDouble("longitude")});
		bounds.extend(latlon);
	}
	this.mapObject.fitBounds(bounds);
	;
};

JkWidgetGoogleMapsMapWidget.prototype.getMapCenterLatitude = function() {
	var lat = 0.0;
	if(this.mapObject) {
		lat = this.mapObject.getCenter().lat();
	}
	;
	return lat;
};

JkWidgetGoogleMapsMapWidget.prototype.getMapCenterLongitude = function() {
	var lng = 0.0;
	if(this.mapObject) {
		lng = this.mapObject.getCenter().lng();
	}
	;
	return lng;
};

JkWidgetGoogleMapsMapWidget.prototype.getMapZoom = function() {
	var zoom = 0.0;
	if(this.mapObject) {
		zoom = this.mapObject.getZoom();
	}
	;
	return zoom;
};

JkWidgetGoogleMapsMapWidget.prototype.getMapBearing = function() {
	var zoom = 0.0;
	if(this.mapObject) {
		zoom = this.mapObject.getHeading();
	}
	;
	return zoom;
};

JkWidgetGoogleMapsMapWidget.prototype.getMapTilt = function() {
	var zoom = 0.0;
	if(this.mapObject) {
		zoom = this.mapObject.getTilt();
	}
	;
	return zoom;
};

JkWidgetGoogleMapsMapWidget.prototype.clearMapMarkers = function() {
	if(this.mapMarkers != null) {
		var n = 0;
		var m = this.mapMarkers.length;
		for(n = 0 ; n < m ; n++) {
			var marker = this.mapMarkers[n];
			if(marker != null) {
				marker.remove();
			}
		}
	}
};

JkWidgetGoogleMapsMapWidget.prototype.getMapCenterLocationAsDynamicMap = function() {
	return JkLangDynamicMap.NEW().setDouble("latitude", (this.getMapCenterLatitude())).setDouble("longitude", (this.getMapCenterLongitude()));
};

JkWidgetGoogleMapsMapWidget.prototype.onCameraStartMoving = function(dueToGesture) {
	if(this.widgetMapCameraStartMovingHandler != null) {
		this.widgetMapCameraStartMovingHandler(dueToGesture);
	}
};

JkWidgetGoogleMapsMapWidget.prototype.onCameraMoving = function() {
	if(this.widgetMapCameraMovingHandler != null) {
		this.widgetMapCameraMovingHandler();
	}
};

JkWidgetGoogleMapsMapWidget.prototype.onCameraStopMoving = function() {
	if(this.widgetMapCameraStopMovingHandler != null) {
		this.widgetMapCameraStopMovingHandler();
	}
};

JkWidgetGoogleMapsMapWidget.prototype.setMapCanBeZoom = function(enable) {
	this.mapSettings.setCanZoom(enable);
};

JkWidgetGoogleMapsMapWidget.prototype.setMapCanBeTilt = function(enable) {
	this.mapSettings.setCanTilt(enable);
};

JkWidgetGoogleMapsMapWidget.prototype.setMapCanBeRotate = function(enable) {
	this.mapSettings.setCanRotate(enable);
};

JkWidgetGoogleMapsMapWidget.prototype.setMapHasMyLocation = function(enable) {
	this.mapSettings.setMapHasMyLocation(enable);
};

JkWidgetGoogleMapsMapWidget.prototype.getWebApiKey = function() {
	return this.webApiKey;
};

JkWidgetGoogleMapsMapWidget.prototype.setWebApiKey = function(v) {
	this.webApiKey = v;
	return this;
};

JkWidgetGoogleMapsMapWidget.prototype.getCenterLat = function() {
	return this.centerLat;
};

JkWidgetGoogleMapsMapWidget.prototype.setCenterLat = function(v) {
	this.centerLat = v;
	return this;
};

JkWidgetGoogleMapsMapWidget.prototype.getCenterLon = function() {
	return this.centerLon;
};

JkWidgetGoogleMapsMapWidget.prototype.setCenterLon = function(v) {
	this.centerLon = v;
	return this;
};

JkWidgetGoogleMapsMapWidget.prototype.getDefaultZoomLevel = function() {
	return this.defaultZoomLevel;
};

JkWidgetGoogleMapsMapWidget.prototype.setDefaultZoomLevel = function(v) {
	this.defaultZoomLevel = v;
	return this;
};

JkWidgetGoogleMapsMapWidget.prototype.getZoomInCenter = function() {
	return this.zoomInCenter;
};

JkWidgetGoogleMapsMapWidget.prototype.setZoomInCenter = function(v) {
	this.zoomInCenter = v;
	return this;
};

JkWidgetGoogleMapsMapWidget.prototype.getStreetViewEnabled = function() {
	return this.streetViewEnabled;
};

JkWidgetGoogleMapsMapWidget.prototype.setStreetViewEnabled = function(v) {
	this.streetViewEnabled = v;
	return this;
};

JkWidgetGoogleMapsMapWidget.prototype.getMarkerSize = function() {
	return this.markerSize;
};

JkWidgetGoogleMapsMapWidget.prototype.setMarkerSize = function(v) {
	this.markerSize = v;
	return this;
};

JkWidgetGoogleMapsMapWidget.prototype.getWidgetMapCameraStartMovingHandler = function() {
	return this.widgetMapCameraStartMovingHandler;
};

JkWidgetGoogleMapsMapWidget.prototype.setWidgetMapCameraStartMovingHandler = function(v) {
	this.widgetMapCameraStartMovingHandler = v;
	return this;
};

JkWidgetGoogleMapsMapWidget.prototype.getWidgetMapCameraMovingHandler = function() {
	return this.widgetMapCameraMovingHandler;
};

JkWidgetGoogleMapsMapWidget.prototype.setWidgetMapCameraMovingHandler = function(v) {
	this.widgetMapCameraMovingHandler = v;
	return this;
};

JkWidgetGoogleMapsMapWidget.prototype.getWidgetMapCameraStopMovingHandler = function() {
	return this.widgetMapCameraStopMovingHandler;
};

JkWidgetGoogleMapsMapWidget.prototype.setWidgetMapCameraStopMovingHandler = function(v) {
	this.widgetMapCameraStopMovingHandler = v;
	return this;
};

JkWidgetGoogleMapsMapWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetGoogleMapsMapWidget"] === true;
};

JkWidgetGoogleMapsMapWidget.mapCounter = 0;
JkWidgetGoogleMapsMapWidget.sdkIncluded = false;
JkWidgetGoogleMapsMapWidget.sdkLoaded = false;
JkWidgetGoogleMapsMapWidget.mapViewWaiting = null;
JkWidgetGoogleMapsMapWidget.addressQueryWaiting = null;
JkWidgetGoogleMapsMapWidget.addressQueryWaitingListener = null;
