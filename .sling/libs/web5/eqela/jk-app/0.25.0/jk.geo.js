let JkGeoGeoCoder = {};

JkGeoGeoCoder.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGeoGeoCoder"] === true;
};

let JkGeoGeoLocation = function() {
	this.latitude = 0.0;
	this.longitude = 0.0;
};

JkGeoGeoLocation.prototype._t = {
	"JkJsonJSONObject" : true,
	"JkGeoGeoLocation" : true
};
JkGeoGeoLocation.prototype._tobj = JkGeoGeoLocation;

JkGeoGeoLocation.NEW = function() {
	var v = new JkGeoGeoLocation;
	return v.CTOR_JkGeoGeoLocation();
};

JkGeoGeoLocation.prototype.CTOR_JkGeoGeoLocation = function() {
	this.longitude = 0.0;
	this.latitude = 0.0;
	return this;
};

JkGeoGeoLocation.prototype.fromJsonObject = function(v) {
	if(!(v != null)) {
		return false;
	}
	var data = (function(o) {
		if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(v);
	this.setLatitude((data.getDouble("latitude", 0.0)));
	this.setLongitude((data.getDouble("longitude", 0.0)));
	return true;
};

JkGeoGeoLocation.prototype.toJsonObject = function() {
	var data = JkLangDynamicMap.NEW();
	data.setDouble("latitude", this.latitude);
	data.setDouble("longitude", this.longitude);
	return data;
};

JkGeoGeoLocation.prototype.getLatitude = function() {
	return this.latitude;
};

JkGeoGeoLocation.prototype.setLatitude = function(v) {
	this.latitude = v;
	return this;
};

JkGeoGeoLocation.prototype.getLongitude = function() {
	return this.longitude;
};

JkGeoGeoLocation.prototype.setLongitude = function(v) {
	this.longitude = v;
	return this;
};

JkGeoGeoLocation.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGeoGeoLocation"] === true;
};

let JkGeoRoadForGoogleMapsAPI = function() {
	this.apiKey = null;
	this.baseUrl = "https://roads.googleapis.com/v1";
	this.client = null;
};

JkGeoRoadForGoogleMapsAPI.prototype._t = { "JkGeoRoadForGoogleMapsAPI" : true };
JkGeoRoadForGoogleMapsAPI.prototype._tobj = JkGeoRoadForGoogleMapsAPI;

JkGeoRoadForGoogleMapsAPI.NEW = function() {
	var v = new JkGeoRoadForGoogleMapsAPI;
	return v.CTOR_JkGeoRoadForGoogleMapsAPI();
};

JkGeoRoadForGoogleMapsAPI.prototype.CTOR_JkGeoRoadForGoogleMapsAPI = function() {
	this.client = null;
	this.baseUrl = "https://roads.googleapis.com/v1";
	this.apiKey = null;
	this.client = JkWebNativeWebClient.instance();
	return this;
};

JkGeoRoadForGoogleMapsAPI.forAPIKey = function(key) {
	if(!JkLangString.isNotEmpty(key)) {
		return null;
	}
	return JkGeoRoadForGoogleMapsAPI.NEW().setApiKey(key);
};

JkGeoRoadForGoogleMapsAPI.prototype.queryNearestRoads = function(points, callback) {
	if(!(callback != null)) {
		return false;
	}
	if(!(this.client != null)) {
		callback(null, (JkLangError.forCode("noWebClientInstance", null)));
		return false;
	}
	if(!(points != null)) {
		callback(null, (JkLangError.forCode("noPointsSupplied", null)));
		return false;
	}
	var cb = callback;
	var sb = JkLangStringBuilder.NEW();
	var first = true;
	if(points != null) {
		var n = 0;
		var m = points.length;
		for(n = 0 ; n < m ; n++) {
			var point = points[n];
			if(point != null) {
				if(!first) {
					sb.appendString("|");
				}
				sb.appendString((point.getString("latitude", null)));
				sb.appendString(",");
				sb.appendString((point.getString("longitude", null)));
				if(first) {
					first = false;
				}
			}
		}
	}
	this.client.query("GET", (JkLangString.safeString(this.baseUrl)) + ("/nearestRoads?key=") + (JkLangString.safeString(this.apiKey)) + ("&points=") + (JkLangString.safeString((sb.toString()))), null, null, (function(statusCode1, headers1, body1) {
		var data = (function(o) {
			if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))((JkJsonJSONParser.parseBuffer(body1)));
		if(!(data != null)) {
			cb(null, (JkLangError.forCode("invalidServerResponse", null)));
			return;
		}
		var snappedPoints = data.getDynamicVector("snappedPoints");
		if(!(snappedPoints != null)) {
			return;
		}
		if(!(snappedPoints != null) || snappedPoints.getSize() < 0) {
			cb(null, (JkLangError.forCode("noSnappedPointsFound", null)));
		}
		var sp = new Array;
		var array = snappedPoints.toVector();
		if(array != null) {
			var n1 = 0;
			var m1 = array.length;
			for(n1 = 0 ; n1 < m1 ; n1++) {
				var point1 = (function(o1) {
					if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o1)) {
						return o1;
					}
					return null;
				}.bind(this))(array[n1]);
				if(point1 != null) {
					var p = JkGeoSnappedPoint.forJsonObject(point1);
					if(!(p != null)) {
						continue;
					}
					sp.push(p);
				}
			}
		}
		cb(sp, null);
	}.bind(this)));
	return true;
};

JkGeoRoadForGoogleMapsAPI.prototype.getApiKey = function() {
	return this.apiKey;
};

JkGeoRoadForGoogleMapsAPI.prototype.setApiKey = function(v) {
	this.apiKey = v;
	return this;
};

JkGeoRoadForGoogleMapsAPI.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGeoRoadForGoogleMapsAPI"] === true;
};

let JkGeoGeoCoderAddressListener = {};

JkGeoGeoCoderAddressListener.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGeoGeoCoderAddressListener"] === true;
};

let JkGeoSnapToRoadForGoogleMapsAPI = function() {
	this.apiKey = null;
	this.baseUrl = "https://roads.googleapis.com/v1/snapToRoads?";
	this.client = null;
};

JkGeoSnapToRoadForGoogleMapsAPI.prototype._t = { "JkGeoSnapToRoadForGoogleMapsAPI" : true };
JkGeoSnapToRoadForGoogleMapsAPI.prototype._tobj = JkGeoSnapToRoadForGoogleMapsAPI;

JkGeoSnapToRoadForGoogleMapsAPI.NEW = function() {
	var v = new JkGeoSnapToRoadForGoogleMapsAPI;
	return v.CTOR_JkGeoSnapToRoadForGoogleMapsAPI();
};

JkGeoSnapToRoadForGoogleMapsAPI.prototype.CTOR_JkGeoSnapToRoadForGoogleMapsAPI = function() {
	this.client = null;
	this.baseUrl = "https://roads.googleapis.com/v1/snapToRoads?";
	this.apiKey = null;
	this.client = JkWebNativeWebClient.instance();
	return this;
};

JkGeoSnapToRoadForGoogleMapsAPI.forAPIKey = function(key) {
	if(!JkLangString.isNotEmpty(key)) {
		return null;
	}
	return JkGeoSnapToRoadForGoogleMapsAPI.NEW().setApiKey(key);
};

JkGeoSnapToRoadForGoogleMapsAPI.prototype.querySnapToRoads1 = function(point1, point2, callback, interpolate) {
	var v = new Array;
	v.push(point1);
	v.push(point2);
	this.querySnapToRoads2(v, callback, interpolate);
};

JkGeoSnapToRoadForGoogleMapsAPI.prototype.querySnapToRoads2 = function(points, callback, interpolate) {
	if(!(callback != null)) {
		return;
	}
	if(!(this.client != null)) {
		callback(null, (JkLangError.forCode("noWebClientInstance", null)));
		return;
	}
	if(!(points != null)) {
		callback(null, (JkLangError.forCode("noPointsSupplied", null)));
		return;
	}
	var sb = JkLangStringBuilder.NEW();
	sb.appendString(this.baseUrl);
	sb.appendString("key=");
	sb.appendString(this.apiKey);
	sb.appendString("&path=");
	var first = true;
	if(points != null) {
		var n = 0;
		var m = points.length;
		for(n = 0 ; n < m ; n++) {
			var point = points[n];
			if(point != null) {
				if(!first) {
					sb.appendString("|");
				}
				else {
					first = false;
				}
				sb.appendDouble((point.getLatitude()));
				sb.appendString(",");
				sb.appendDouble((point.getLongitude()));
			}
		}
	}
	if(interpolate) {
		sb.appendString("&interpolate=true");
	}
	var cb = callback;
	this.client.query("GET", (sb.toString()), null, null, (function(statusCode1, headers1, body1) {
		var data = (function(o) {
			if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))((JkJsonJSONParser.parseBuffer(body1)));
		if(!(data != null)) {
			cb(null, (JkLangError.forCode("invalidServerResponse", null)));
			return;
		}
		var snappedPoints = data.getDynamicVector("snappedPoints");
		if(!(snappedPoints != null)) {
			return;
		}
		if(!(snappedPoints != null) || snappedPoints.getSize() < 0) {
			cb(null, (JkLangError.forCode("noSnappedPointsFound", null)));
		}
		var sp = new Array;
		var array = snappedPoints.toVector();
		if(array != null) {
			var n1 = 0;
			var m1 = array.length;
			for(n1 = 0 ; n1 < m1 ; n1++) {
				var point1 = (function(o1) {
					if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o1)) {
						return o1;
					}
					return null;
				}.bind(this))(array[n1]);
				if(point1 != null) {
					var p = JkGeoSnappedPoint.forJsonObject(point1);
					if(!(p != null)) {
						continue;
					}
					sp.push(p);
				}
			}
		}
		cb(sp, null);
	}.bind(this)));
};

JkGeoSnapToRoadForGoogleMapsAPI.prototype.getApiKey = function() {
	return this.apiKey;
};

JkGeoSnapToRoadForGoogleMapsAPI.prototype.setApiKey = function(v) {
	this.apiKey = v;
	return this;
};

JkGeoSnapToRoadForGoogleMapsAPI.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGeoSnapToRoadForGoogleMapsAPI"] === true;
};

let JkGeoGeoCoderForGoogleMapsAPI = function() {
	this.apiKey = null;
	this.host = "https://maps.googleapis.com/maps/api/geocode/json?key=";
	this.client = null;
};

JkGeoGeoCoderForGoogleMapsAPI.prototype._t = {
	"JkGeoGeoCoder" : true,
	"JkGeoGeoCoderForGoogleMapsAPI" : true
};
JkGeoGeoCoderForGoogleMapsAPI.prototype._tobj = JkGeoGeoCoderForGoogleMapsAPI;

JkGeoGeoCoderForGoogleMapsAPI.NEW = function() {
	var v = new JkGeoGeoCoderForGoogleMapsAPI;
	return v.CTOR_JkGeoGeoCoderForGoogleMapsAPI();
};

JkGeoGeoCoderForGoogleMapsAPI.prototype.CTOR_JkGeoGeoCoderForGoogleMapsAPI = function() {
	this.client = null;
	this.host = "https://maps.googleapis.com/maps/api/geocode/json?key=";
	this.apiKey = null;
	this.client = JkWebNativeWebClient.instance();
	return this;
};

JkGeoGeoCoderForGoogleMapsAPI.forAPIKey = function(apiKey) {
	if(!JkLangString.isNotEmpty(apiKey)) {
		return null;
	}
	return JkGeoGeoCoderForGoogleMapsAPI.NEW().setApiKey(apiKey);
};

JkGeoGeoCoderForGoogleMapsAPI.prototype.queryAddress = function(latitude, longitude, listener) {
	if(!(listener != null)) {
		return false;
	}
	if(!(this.client != null)) {
		listener.onQueryAddressErrorReceived((JkLangError.forCode("noWebClientInstance", null)));
		return false;
	}
	var list = listener;
	this.client.query("GET", (JkLangString.safeString(this.host)) + (JkLangString.safeString(this.apiKey)) + ("&latlng=") + (JkLangString.safeString((JkLangString.forDouble(latitude)))) + (",") + (JkLangString.safeString((JkLangString.forDouble(longitude)))), null, null, (function(statusCode1, headers1, body1) {
		var data = (function(o) {
			if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))((JkJsonJSONParser.parseBuffer(body1)));
		if(!(data != null)) {
			list.onQueryAddressErrorReceived((JkLangError.forCode("invalidResponseFromGoogleMapsAPI", null)));
			return;
		}
		var results = data.getDynamicVector("results");
		if(!(results != null) || results.getSize() < 1) {
			list.onQueryAddressErrorReceived((JkLangError.forCode("noResultFound", null)));
			return;
		}
		var array = results.toVector();
		if(array != null) {
			var n = 0;
			var m = array.length;
			for(n = 0 ; n < m ; n++) {
				var result = (function(o1) {
					if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o1)) {
						return o1;
					}
					return null;
				}.bind(this))(array[n]);
				if(result != null) {
					if(!(result != null)) {
						continue;
					}
					var addressComponents = result.getDynamicVector("address_components");
					if(!(addressComponents != null) || addressComponents.getSize() < 1) {
						list.onQueryAddressErrorReceived((JkLangError.forCode("noaddressComponentsFound", null)));
						return;
					}
					var v = JkGeoPhysicalAddress.NEW();
					var array2 = addressComponents.toVector();
					if(array2 != null) {
						var n2 = 0;
						var m2 = array2.length;
						for(n2 = 0 ; n2 < m2 ; n2++) {
							var addressComponent = (function(o2) {
								if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o2)) {
									return o2;
								}
								return null;
							}.bind(this))(array2[n2]);
							if(addressComponent != null) {
								if(!(addressComponent != null)) {
									continue;
								}
								var types = addressComponent.getDynamicVector("types");
								if(!(types != null) || types.getSize() < 1) {
									continue;
								}
								var array3 = types.toVector();
								if(array3 != null) {
									var n3 = 0;
									var m3 = array3.length;
									for(n3 = 0 ; n3 < m3 ; n3++) {
										var type = (function(o3) {
											if(typeof(o3) === 'string') {
												return o3;
											}
											return null;
										}.bind(this))(array3[n3]);
										if(type != null) {
											if(!(type != null)) {
												continue;
											}
											if(JkLangString.equals("street_number", type)) {
												v.setStreetAddressDetail((addressComponent.getString("long_name", null)));
												break;
											}
											if(JkLangString.equals("route", type)) {
												v.setStreetAddress((addressComponent.getString("long_name", null)));
												break;
											}
											if(JkLangString.equals("locality", type)) {
												v.setLocality((addressComponent.getString("long_name", null)));
												break;
											}
											if(JkLangString.equals("sublocality", type)) {
												v.setSubLocality((addressComponent.getString("long_name", null)));
												break;
											}
											if(JkLangString.equals("administrative_area_level_2", type)) {
												v.setSubAdministrativeArea((addressComponent.getString("long_name", null)));
												break;
											}
											if(JkLangString.equals("administrative_area_level_1", type)) {
												v.setAdministrativeArea((addressComponent.getString("long_name", null)));
												break;
											}
											if(JkLangString.equals("country", type)) {
												v.setCountry((addressComponent.getString("long_name", null)));
												v.setCountryCode((addressComponent.getString("short_name", null)));
												break;
											}
											if(JkLangString.equals("postal_code", type)) {
												v.setPostalCode((addressComponent.getString("long_name", null)));
												break;
											}
										}
									}
								}
							}
						}
					}
					v.setCompleteAddress((result.getString("formatted_address", null)));
					var geometry = result.getDynamicMap("geometry");
					if(!(geometry != null)) {
						continue;
					}
					var location = geometry.getDynamicMap("location");
					if(!(location != null)) {
						continue;
					}
					v.setLatitude((location.getDouble("lat", 0.0)));
					v.setLongitude((location.getDouble("lng", 0.0)));
					list.onQueryAddressCompleted(v);
					return;
				}
			}
		}
		list.onQueryAddressErrorReceived((JkLangError.forCode("invalidResult", null)));
	}.bind(this)));
	return true;
};

JkGeoGeoCoderForGoogleMapsAPI.prototype.queryLocation = function(address, listener) {
	if(!(listener != null)) {
		return false;
	}
	if(!(this.client != null)) {
		listener.onQueryLocationErrorReceived((JkLangError.forCode("noWebClientInstance", null)));
		return false;
	}
	var list = listener;
	this.client.query("GET", (JkLangString.safeString(this.host)) + (JkLangString.safeString(this.apiKey)) + ("&address=") + (JkLangString.safeString((JkUrlURLEncoder.encode(address, false, true)))), null, null, (function(statusCode1, headers1, body1) {
		var data = (function(o) {
			if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))((JkJsonJSONParser.parseBuffer(body1)));
		if(!(data != null)) {
			list.onQueryLocationErrorReceived((JkLangError.forCode("invalidResponseFromGoogleMapsAPI", null)));
			return;
		}
		var results = data.getDynamicVector("results");
		if(!(results != null) || results.getSize() < 1) {
			list.onQueryLocationErrorReceived((JkLangError.forCode("noResultFound", null)));
			return;
		}
		var array = results.toVector();
		if(array != null) {
			var n = 0;
			var m = array.length;
			for(n = 0 ; n < m ; n++) {
				var result = (function(o1) {
					if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o1)) {
						return o1;
					}
					return null;
				}.bind(this))(array[n]);
				if(result != null) {
					if(!(result != null)) {
						continue;
					}
					var geometry = result.getDynamicMap("geometry");
					if(!(geometry != null)) {
						continue;
					}
					var location = geometry.getDynamicMap("location");
					if(!(location != null)) {
						continue;
					}
					list.onQueryLocationCompleted((JkGeoGeoLocation.NEW().setLatitude((location.getDouble("lat", 0.0))).setLongitude((location.getDouble("lng", 0.0)))));
					return;
				}
			}
		}
		list.onQueryLocationErrorReceived((JkLangError.forCode("invalidResult", null)));
	}.bind(this)));
	return true;
};

JkGeoGeoCoderForGoogleMapsAPI.prototype.getApiKey = function() {
	return this.apiKey;
};

JkGeoGeoCoderForGoogleMapsAPI.prototype.setApiKey = function(v) {
	this.apiKey = v;
	return this;
};

JkGeoGeoCoderForGoogleMapsAPI.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGeoGeoCoderForGoogleMapsAPI"] === true;
};

let JkGeoGeoLocationManager = function() {
	this.listeners = null;
};

JkGeoGeoLocationManager.prototype._t = { "JkGeoGeoLocationManager" : true };
JkGeoGeoLocationManager.prototype._tobj = JkGeoGeoLocationManager;

JkGeoGeoLocationManager.NEW = function() {
	var v = new JkGeoGeoLocationManager;
	return v.CTOR_JkGeoGeoLocationManager();
};

JkGeoGeoLocationManager.prototype.CTOR_JkGeoGeoLocationManager = function() {
	this.listeners = null;
	this.listeners = new Array;
	return this;
};

JkGeoGeoLocationManager.forApplicationContext = function(context) {
	return JkGeoGeoLocationManagerForBrowser.getInstance();
};

JkGeoGeoLocationManager.prototype.addListener = function(l) {
	this.listeners.push(l);
};

JkGeoGeoLocationManager.prototype.removeListener = function(l) {
	JkLangVector.removeValue(this.listeners, l);
};

JkGeoGeoLocationManager.prototype.removeAllListeners = function() {
	JkLangVector.clear(this.listeners);
};

JkGeoGeoLocationManager.prototype.notifyListeners = function(location) {
	if(this.listeners != null) {
		var n = 0;
		var m = this.listeners.length;
		for(n = 0 ; n < m ; n++) {
			var listener = this.listeners[n];
			if(listener != null) {
				if(listener != null) {
					listener(location);
				}
			}
		}
	}
};

JkGeoGeoLocationManager.prototype.isLocationServiceEnabled = function() {};

JkGeoGeoLocationManager.prototype.startLocationUpdates = function(callback) {};

JkGeoGeoLocationManager.prototype.stopLocationUpdates = function() {};

JkGeoGeoLocationManager.prototype.getLastLocation = function(callback) {};

JkGeoGeoLocationManager.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGeoGeoLocationManager"] === true;
};

let JkGeoSnappedPoint = function() {
	JkJsonJSONObjectAdapter.call(this);
	this._placeId = null;
	this._originalIndex = null;
	this._location = null;
};

JkGeoSnappedPoint.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkJsonJSONObjectAdapter.prototype);
JkGeoSnappedPoint.prototype.constructor = JkGeoSnappedPoint;
JkGeoSnappedPoint.prototype._t = {
	"JkGeoSnappedPoint" : true,
	"JkJsonJSONObjectAdapter" : true,
	"JkJsonJSONObject" : true,
	"JkLangStringObject" : true
};
JkGeoSnappedPoint.prototype._tobj = JkGeoSnappedPoint;

JkGeoSnappedPoint.NEW = function() {
	var v = new JkGeoSnappedPoint;
	return v.CTOR_JkGeoSnappedPoint();
};

JkGeoSnappedPoint.prototype.CTOR_JkGeoSnappedPoint = function() {
	this._location = null;
	this._originalIndex = null;
	this._placeId = null;
	if(JkJsonJSONObjectAdapter.prototype.CTOR_JkJsonJSONObjectAdapter.call(this) == null) {
		return null;
	}
	return this;
};

JkGeoSnappedPoint.prototype.setPlaceId = function(value) {
	this._placeId = value;
	return this;
};

JkGeoSnappedPoint.prototype.getPlaceId = function() {
	return this._placeId;
};

JkGeoSnappedPoint.prototype.setOriginalIndexValue = function(value) {
	return this.setOriginalIndex((JkLangInteger.asObject(value)));
};

JkGeoSnappedPoint.prototype.getOriginalIndexValue = function() {
	return JkLangInteger.asInteger(this._originalIndex);
};

JkGeoSnappedPoint.prototype.setOriginalIndex = function(value) {
	this._originalIndex = value;
	return this;
};

JkGeoSnappedPoint.prototype.getOriginalIndex = function() {
	return this._originalIndex;
};

JkGeoSnappedPoint.prototype.setLocation = function(value) {
	this._location = value;
	return this;
};

JkGeoSnappedPoint.prototype.getLocation = function() {
	return this._location;
};

JkGeoSnappedPoint.prototype.toJsonObject = function() {
	var v = JkLangDynamicMap.NEW();
	if(this._placeId != null) {
		v.setObject("placeId", (this.asJsonValue(this._placeId)));
	}
	if(this._originalIndex != null) {
		v.setObject("originalIndex", (this.asJsonValue(this._originalIndex)));
	}
	if(this._location != null) {
		v.setObject("location", (this.asJsonValue(this._location)));
	}
	return v;
};

JkGeoSnappedPoint.prototype.fromJsonObject = function(o2) {
	var v = (function(o) {
		if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(o2);
	if(!(v != null)) {
		return false;
	}
	this._placeId = v.getString("placeId", null);
	if(v.get("originalIndex") != null) {
		this._originalIndex = JkLangInteger.asObject((v.getInteger("originalIndex", 0)));
	}
	{
		var values = v.getDynamicMap("location");
		if(!(values != null)) {
			values = (function(o1) {
				if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o1)) {
					return o1;
				}
				return null;
			}.bind(this))((JkJsonJSONParser.parseString((v.getString("location", null)))));
		}
		if(values != null) {
			var oo = JkGeoGeoLocation.NEW();
			if(oo.fromJsonObject(values)) {
				this._location = oo;
			}
		}
	}
	return true;
};

JkGeoSnappedPoint.prototype.fromJsonString = function(o) {
	return this.fromJsonObject((JkJsonJSONParser.parse(o)));
};

JkGeoSnappedPoint.prototype.toJsonString = function() {
	return JkJsonJSONEncoder.encode((this.toJsonObject()), true, false);
};

JkGeoSnappedPoint.prototype.toString = function() {
	return this.toJsonString();
};

JkGeoSnappedPoint.forJsonString = function(o) {
	var v = JkGeoSnappedPoint.NEW();
	if(!v.fromJsonString(o)) {
		return null;
	}
	return v;
};

JkGeoSnappedPoint.forJsonObject = function(o) {
	var v = JkGeoSnappedPoint.NEW();
	if(!v.fromJsonObject(o)) {
		return null;
	}
	return v;
};

JkGeoSnappedPoint.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGeoSnappedPoint"] === true;
};

let JkGeoPhysicalAddress = function() {
	this.latitude = 0.0;
	this.longitude = 0.0;
	this.completeAddress = null;
	this.country = null;
	this.countryCode = null;
	this.administrativeArea = null;
	this.subAdministrativeArea = null;
	this.locality = null;
	this.subLocality = null;
	this.streetAddress = null;
	this.streetAddressDetail = null;
	this.postalCode = null;
};

JkGeoPhysicalAddress.prototype._t = {
	"JkGeoPhysicalAddress" : true,
	"JkLangStringObject" : true
};
JkGeoPhysicalAddress.prototype._tobj = JkGeoPhysicalAddress;

JkGeoPhysicalAddress.NEW = function() {
	var v = new JkGeoPhysicalAddress;
	return v.CTOR_JkGeoPhysicalAddress();
};

JkGeoPhysicalAddress.prototype.CTOR_JkGeoPhysicalAddress = function() {
	this.postalCode = null;
	this.streetAddressDetail = null;
	this.streetAddress = null;
	this.subLocality = null;
	this.locality = null;
	this.subAdministrativeArea = null;
	this.administrativeArea = null;
	this.countryCode = null;
	this.country = null;
	this.completeAddress = null;
	this.longitude = 0.0;
	this.latitude = 0.0;
	return this;
};

JkGeoPhysicalAddress.forString = function(str) {
	var v = JkGeoPhysicalAddress.NEW();
	v.fromString(str);
	return v;
};

JkGeoPhysicalAddress.prototype.fromString = function(str) {
	var data = null;
	if(str != null) {
		data = (function(o) {
			if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))((JkJsonJSONParser.parseString(str)));
	}
	if(data == null) {
		data = JkLangDynamicMap.NEW();
	}
	this.latitude = data.getDouble("latitude", 0.0);
	this.longitude = data.getDouble("longitude", 0.0);
	this.completeAddress = data.getString("completeAddress", null);
	this.country = data.getString("country", null);
	this.countryCode = data.getString("countryCode", null);
	this.administrativeArea = data.getString("administrativeArea", null);
	this.subAdministrativeArea = data.getString("subAdministrativeArea", null);
	this.locality = data.getString("locality", null);
	this.subLocality = data.getString("subLocality", null);
	this.streetAddress = data.getString("streetAddress", null);
	this.streetAddressDetail = data.getString("streetAddressDetail", null);
	this.postalCode = data.getString("postalCode", null);
};

JkGeoPhysicalAddress.prototype.toString = function() {
	var v = JkLangDynamicMap.NEW();
	v.setDouble("latitude", this.latitude);
	v.setDouble("longitude", this.longitude);
	v.setString("completeAddress", this.completeAddress);
	v.setString("country", this.country);
	v.setString("countryCode", this.countryCode);
	v.setString("administrativeArea", this.administrativeArea);
	v.setString("subAdministrativeArea", this.subAdministrativeArea);
	v.setString("locality", this.locality);
	v.setString("subLocality", this.subLocality);
	v.setString("streetAddress", this.streetAddress);
	v.setString("streetAddressDetail", this.streetAddressDetail);
	v.setString("postalCode", this.postalCode);
	return JkJsonJSONEncoder.encode(v, false, false);
};

JkGeoPhysicalAddress.prototype.getLatitude = function() {
	return this.latitude;
};

JkGeoPhysicalAddress.prototype.setLatitude = function(v) {
	this.latitude = v;
	return this;
};

JkGeoPhysicalAddress.prototype.getLongitude = function() {
	return this.longitude;
};

JkGeoPhysicalAddress.prototype.setLongitude = function(v) {
	this.longitude = v;
	return this;
};

JkGeoPhysicalAddress.prototype.getCompleteAddress = function() {
	return this.completeAddress;
};

JkGeoPhysicalAddress.prototype.setCompleteAddress = function(v) {
	this.completeAddress = v;
	return this;
};

JkGeoPhysicalAddress.prototype.getCountry = function() {
	return this.country;
};

JkGeoPhysicalAddress.prototype.setCountry = function(v) {
	this.country = v;
	return this;
};

JkGeoPhysicalAddress.prototype.getCountryCode = function() {
	return this.countryCode;
};

JkGeoPhysicalAddress.prototype.setCountryCode = function(v) {
	this.countryCode = v;
	return this;
};

JkGeoPhysicalAddress.prototype.getAdministrativeArea = function() {
	return this.administrativeArea;
};

JkGeoPhysicalAddress.prototype.setAdministrativeArea = function(v) {
	this.administrativeArea = v;
	return this;
};

JkGeoPhysicalAddress.prototype.getSubAdministrativeArea = function() {
	return this.subAdministrativeArea;
};

JkGeoPhysicalAddress.prototype.setSubAdministrativeArea = function(v) {
	this.subAdministrativeArea = v;
	return this;
};

JkGeoPhysicalAddress.prototype.getLocality = function() {
	return this.locality;
};

JkGeoPhysicalAddress.prototype.setLocality = function(v) {
	this.locality = v;
	return this;
};

JkGeoPhysicalAddress.prototype.getSubLocality = function() {
	return this.subLocality;
};

JkGeoPhysicalAddress.prototype.setSubLocality = function(v) {
	this.subLocality = v;
	return this;
};

JkGeoPhysicalAddress.prototype.getStreetAddress = function() {
	return this.streetAddress;
};

JkGeoPhysicalAddress.prototype.setStreetAddress = function(v) {
	this.streetAddress = v;
	return this;
};

JkGeoPhysicalAddress.prototype.getStreetAddressDetail = function() {
	return this.streetAddressDetail;
};

JkGeoPhysicalAddress.prototype.setStreetAddressDetail = function(v) {
	this.streetAddressDetail = v;
	return this;
};

JkGeoPhysicalAddress.prototype.getPostalCode = function() {
	return this.postalCode;
};

JkGeoPhysicalAddress.prototype.setPostalCode = function(v) {
	this.postalCode = v;
	return this;
};

JkGeoPhysicalAddress.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGeoPhysicalAddress"] === true;
};

let JkGeoGeoCoderLocationListener = {};

JkGeoGeoCoderLocationListener.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGeoGeoCoderLocationListener"] === true;
};

let JkGeoGeoLocationManagerForBrowser = function() {
	JkGeoGeoLocationManager.call(this);
	this.locationManager = null;
	this.id = 0;
};

JkGeoGeoLocationManagerForBrowser.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkGeoGeoLocationManager.prototype);
JkGeoGeoLocationManagerForBrowser.prototype.constructor = JkGeoGeoLocationManagerForBrowser;
JkGeoGeoLocationManagerForBrowser.prototype._t = {
	"JkGeoGeoLocationManagerForBrowser" : true,
	"JkGeoGeoLocationManager" : true
};
JkGeoGeoLocationManagerForBrowser.prototype._tobj = JkGeoGeoLocationManagerForBrowser;

JkGeoGeoLocationManagerForBrowser.NEW = function() {
	var v = new JkGeoGeoLocationManagerForBrowser;
	return v.CTOR_JkGeoGeoLocationManagerForBrowser();
};

JkGeoGeoLocationManagerForBrowser.prototype.CTOR_JkGeoGeoLocationManagerForBrowser = function() {
	if(JkGeoGeoLocationManager.prototype.CTOR_JkGeoGeoLocationManager.call(this) == null) {
		return null;
	}
	this.id = 0;
	this.locationManager = null;
	if(navigator.geolocation) {
		this.locationManager = navigator.geolocation;
	}
	;
	return this;
};

JkGeoGeoLocationManagerForBrowser.getInstance = function() {
	if(JkGeoGeoLocationManagerForBrowser.instance == null) {
		JkGeoGeoLocationManagerForBrowser.instance = JkGeoGeoLocationManagerForBrowser.NEW();
	}
	return JkGeoGeoLocationManagerForBrowser.instance;
};

JkGeoGeoLocationManagerForBrowser.prototype.startLocationUpdates = function(callback) {
	if(this.locationManager == null) {
		callback(false);
	}
	this.id = this.locationManager.watchPosition(function(pos) {
		this.successHandler(pos);
	}.bind(this)
	, null
	, { enableHighAccuracy:true });
	;
	callback(true);
};

JkGeoGeoLocationManagerForBrowser.prototype.stopLocationUpdates = function() {
	if(this.locationManager == null) {
		return;
	}
	this.locationManager.clearWatch(this.id);
	;
};

JkGeoGeoLocationManagerForBrowser.prototype.getLastLocation = function(callback) {
	var error = JkLangError.forCode("failedToGetLastLocation", null);
	if(this.locationManager == null) {
		callback(null, error);
	}
	var location = null;
	this.locationManager.getCurrentPosition(function(pos) {
		location = JkGeoGeoLocation.NEW();
		location.setLatitude(pos.coords.latitude);
		location.setLongitude(pos.coords.longitude);
		callback(location, null);
	}, function(err) {
		callback(null, error);
	}, { enableHighAccuracy:true, timeout: 10000 });
	;
};

JkGeoGeoLocationManagerForBrowser.prototype.successHandler = function(loc) {
	var l = JkGeoGeoLocation.NEW();
	l.setLatitude(loc.coords.latitude);
	l.setLongitude(loc.coords.longitude);
	;
	this.notifyListeners(l);
};

JkGeoGeoLocationManagerForBrowser.prototype.isLocationServiceEnabled = function() {
	return this.locationManager != null;
};

JkGeoGeoLocationManagerForBrowser.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGeoGeoLocationManagerForBrowser"] === true;
};

JkGeoGeoLocationManagerForBrowser.instance = null;
