jk = jk or {}

jk.slon = jk.slon or {}

jk.slon.convert = jk.slon.convert or {}

jk.slon.convert.ToJson = {}
jk.slon.convert.ToJson.__index = jk.slon.convert.ToJson
_vm:set_metatable(jk.slon.convert.ToJson, {})

function jk.slon.convert.ToJson._create()
	local v = _vm:set_metatable({}, jk.slon.convert.ToJson)
	return v
end

function jk.slon.convert.ToJson:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.slon.convert.ToJson'
	self['_isType.jk.slon.convert.ToJson'] = true
end

function jk.slon.convert.ToJson:_construct0()
	jk.slon.convert.ToJson._init(self)
	return self
end

function jk.slon.convert.ToJson:_main(args)
	local src = args[0 + 1]
	if _g.jk.lang.String:isEmpty(src) then
		do return 1 end
	end
	do
		local dst = args[1 + 1]
		do
			local _rval = nil
			local _status, _err = _vm:execute_protected_call(function()
				local data = _g.jk.slon.SLONParser:forFile(_g.jk.fs.File:forPath(src)):acceptObject()
				if not (data ~= nil) then
					_rval = {}
					_rval.value = 1
					do return end
				end
				do
					local dstr = _g.jk.json.JSONEncoder:toString(data)
					if _g.jk.lang.String:isNotEmpty(dst) then
						local dstf = _g.jk.fs.File:forPath(dst)
						if not dstf:setContentsUTF8(dstr) then
							do _g.jk.lang.Error:throw("failedToWrite", dstf) end
						end
					else
						_io:write_to_stdout(dstr .. "\n")
					end
					_rval = {}
					_rval.value = 0
					do return end
				end
			end)
			if _err then
				local e = _err
				_io:write_to_stdout("ERROR: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(e)) .. "\n")
			end
			if _rval then
				do return _rval.value end
			end
		end
		do return 1 end
	end
end

function _main(args)
	do return jk.slon.convert.ToJson:_main(args) end
end
