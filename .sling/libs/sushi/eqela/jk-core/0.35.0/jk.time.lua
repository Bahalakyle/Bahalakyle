jk = jk or {}

jk.time = jk.time or {}

jk.time.SystemClock = {}
jk.time.SystemClock.__index = jk.time.SystemClock
_vm:set_metatable(jk.time.SystemClock, {})

function jk.time.SystemClock._create()
	local v = _vm:set_metatable({}, jk.time.SystemClock)
	return v
end

function jk.time.SystemClock:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.time.SystemClock'
	self['_isType.jk.time.SystemClock'] = true
end

function jk.time.SystemClock:_construct0()
	jk.time.SystemClock._init(self)
	return self
end

function jk.time.SystemClock:asDateTimeUTC()
	do return _g.jk.lang.DateTime:forSeconds(_g.jk.time.SystemClock:asUTCSeconds()) end
end

function jk.time.SystemClock:asDateTimeLocal()
	local v = _g.jk.lang.DateTime:forSeconds(_g.jk.time.SystemClock:asSeconds())
	do v:setTimezoneOffset(_g.jk.time.SystemClock:getTimezoneOffsetAsSeconds()) end
	do return v end
end

function jk.time.SystemClock:getTimezoneOffsetAsSeconds()
	do return _os:get_system_timezone_seconds() end
end

function jk.time.SystemClock:asUTCSeconds()
	do return _g.jk.time.SystemClock:asSeconds() + _g.jk.time.SystemClock:getTimezoneOffsetAsSeconds() end
end

function jk.time.SystemClock:asSeconds()
	do return _os:get_system_time_seconds() end
end

function jk.time.SystemClock:asTimeValue()
	local v = _g.jk.lang.TimeValue._construct0(_g.jk.lang.TimeValue._create())
	do _g.jk.time.SystemClock:update(v) end
	do return v end
end

function jk.time.SystemClock:update(v)
	if not (v ~= nil) then
		do return end
	end
	do
		local millis = _os:get_system_time_milliseconds()
		local secs = _util:convert_to_integer(millis / 1000)
		local micros = (millis - secs * 1000) * 1000
		do v:setSeconds(secs) end
		do v:setMicroSeconds(micros) end
	end
end
