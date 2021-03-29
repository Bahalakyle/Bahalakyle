jk = jk or {}

jk.time = jk.time or {}

jk.time.format = jk.time.format or {}

jk.time.format.VerboseDateTimeString = {}
jk.time.format.VerboseDateTimeString.__index = jk.time.format.VerboseDateTimeString
_vm:set_metatable(jk.time.format.VerboseDateTimeString, {})

function jk.time.format.VerboseDateTimeString._create()
	local v = _vm:set_metatable({}, jk.time.format.VerboseDateTimeString)
	return v
end

function jk.time.format.VerboseDateTimeString:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.time.format.VerboseDateTimeString'
	self['_isType.jk.time.format.VerboseDateTimeString'] = true
end

function jk.time.format.VerboseDateTimeString:_construct0()
	jk.time.format.VerboseDateTimeString._init(self)
	return self
end

function jk.time.format.VerboseDateTimeString:forUTCNow()
	do return _g.jk.time.format.VerboseDateTimeString:forDateTime(_g.jk.time.SystemClock:asDateTimeUTC()) end
end

function jk.time.format.VerboseDateTimeString:forNow()
	do return _g.jk.time.format.VerboseDateTimeString:forDateTime(_g.jk.time.SystemClock:asDateTimeLocal()) end
end

function jk.time.format.VerboseDateTimeString:forDateTime(dd)
	if not (dd ~= nil) then
		do return "NODATE" end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString(_g.jk.time.format.VerboseDateTimeString:getShortDayName(dd:getWeekDay())) end
		do sb:appendString(", ") end
		do sb:appendString(_g.jk.lang.String:forInteger(dd:getDayOfMonth())) end
		do sb:appendCharacter(32) end
		do sb:appendString(_g.jk.time.format.VerboseDateTimeString:getShortMonthName(dd:getMonth())) end
		do sb:appendCharacter(32) end
		do sb:appendString(_g.jk.lang.String:forInteger(dd:getYear())) end
		do sb:appendCharacter(32) end
		do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(dd:getHours(), 2, "0")) end
		do sb:appendCharacter(58) end
		do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(dd:getMinutes(), 2, "0")) end
		do sb:appendCharacter(58) end
		do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(dd:getSeconds(), 2, "0")) end
		do
			local offset = dd:getTimezoneOffset()
			if offset == 0 then
				do sb:appendString(" +0000") end
			else
				local hr = _util:convert_to_integer(offset / 3600)
				local mm = _util:convert_to_integer((offset - hr * 3600) / 60)
				if hr <= 0 then
					do sb:appendString(" +") end
					hr = -hr
				else
					do sb:appendString(" -") end
				end
				do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(hr, 2, "0")) end
				do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(mm, 2, "0")) end
			end
			do return sb:toString() end
		end
	end
end

function jk.time.format.VerboseDateTimeString:getTimeStringForDateTime(dd, includeTimeZone)
	if not (dd ~= nil) then
		do return "NOTIME" end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(dd:getHours(), 2, "0")) end
		do sb:appendCharacter(58) end
		do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(dd:getMinutes(), 2, "0")) end
		do sb:appendCharacter(58) end
		do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(dd:getSeconds(), 2, "0")) end
		if includeTimeZone then
			do sb:appendString(" GMT") end
		end
		do return sb:toString() end
	end
end

function jk.time.format.VerboseDateTimeString:getDateStringForDateTime(dd)
	if not (dd ~= nil) then
		do return "NODATE" end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString(_g.jk.time.format.VerboseDateTimeString:getLongMonthName(dd:getMonth())) end
		do sb:appendCharacter(32) end
		do sb:appendString(_g.jk.lang.String:forInteger(dd:getDayOfMonth())) end
		do sb:appendString(", ") end
		do sb:appendString(_g.jk.lang.String:forInteger(dd:getYear())) end
		do return sb:toString() end
	end
end

function jk.time.format.VerboseDateTimeString:getShortDayName(n)
	do
		local v = n
		if v == 1 then
			do return "Sun" end
		elseif v == 2 then
			do return "Mon" end
		elseif v == 3 then
			do return "Tue" end
		elseif v == 4 then
			do return "Wed" end
		elseif v == 5 then
			do return "Thu" end
		elseif v == 6 then
			do return "Fri" end
		elseif v == 7 then
			do return "Sat" end
		end
	end
	do return nil end
end

function jk.time.format.VerboseDateTimeString:getLongDayName(n)
	do
		local v = n
		if v == 1 then
			do return "Sunday" end
		elseif v == 2 then
			do return "Monday" end
		elseif v == 3 then
			do return "Tuesday" end
		elseif v == 4 then
			do return "Wednesday" end
		elseif v == 5 then
			do return "Thursday" end
		elseif v == 6 then
			do return "Friday" end
		elseif v == 7 then
			do return "Saturday" end
		end
	end
	do return nil end
end

function jk.time.format.VerboseDateTimeString:getShortMonthName(n)
	do
		local v = n
		if v == 1 then
			do return "Jan" end
		elseif v == 2 then
			do return "Feb" end
		elseif v == 3 then
			do return "Mar" end
		elseif v == 4 then
			do return "Apr" end
		elseif v == 5 then
			do return "May" end
		elseif v == 6 then
			do return "Jun" end
		elseif v == 7 then
			do return "Jul" end
		elseif v == 8 then
			do return "Aug" end
		elseif v == 9 then
			do return "Sep" end
		elseif v == 10 then
			do return "Oct" end
		elseif v == 11 then
			do return "Nov" end
		elseif v == 12 then
			do return "Dec" end
		end
	end
	do return nil end
end

function jk.time.format.VerboseDateTimeString:getLongMonthName(n)
	do
		local v = n
		if v == 1 then
			do return "January" end
		elseif v == 2 then
			do return "February" end
		elseif v == 3 then
			do return "March" end
		elseif v == 4 then
			do return "April" end
		elseif v == 5 then
			do return "May" end
		elseif v == 6 then
			do return "June" end
		elseif v == 7 then
			do return "July" end
		elseif v == 8 then
			do return "August" end
		elseif v == 9 then
			do return "September" end
		elseif v == 10 then
			do return "October" end
		elseif v == 11 then
			do return "November" end
		elseif v == 12 then
			do return "December" end
		end
	end
	do return nil end
end
