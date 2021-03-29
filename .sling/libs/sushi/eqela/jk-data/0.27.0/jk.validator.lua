jk = jk or {}

jk.validator = jk.validator or {}

jk.validator.DataValidator = {}
jk.validator.DataValidator.__index = jk.validator.DataValidator
_vm:set_metatable(jk.validator.DataValidator, {})

function jk.validator.DataValidator._create()
	local v = _vm:set_metatable({}, jk.validator.DataValidator)
	return v
end

function jk.validator.DataValidator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.validator.DataValidator'
	self['_isType.jk.validator.DataValidator'] = true
end

function jk.validator.DataValidator:_construct0()
	jk.validator.DataValidator._init(self)
	return self
end

function jk.validator.DataValidator:isEmailAddressValid(emailAddress)
	if _g.jk.lang.String:isEmpty(emailAddress) then
		do return false end
	end
	if _g.jk.lang.String:getLength(emailAddress) > 254 then
		do return false end
	end
	do
		local ci = _g.jk.lang.String:iterate(emailAddress)
		if not (ci ~= nil) then
			do return false end
		end
		do
			local insideQuotation = false
			local outsideQuotation = false
			local dotPreceded = false
			local isFirstCharacter = true
			local containsAtCharacter = false
			local i = -1
			while true do
				do i = i + 1 end
				do
					local c = ci:getNextChar()
					if c < 1 then
						do break end
					end
					if outsideQuotation then
						if c ~= 46 and c ~= 64 then
							do return false end
						end
					end
					if c >= 65 and c <= 90 then
					elseif c >= 97 and c <= 122 then
					elseif c >= 48 and c <= 57 then
					elseif c == 33 then
					elseif c >= 35 and c <= 39 then
					elseif c == 42 then
					elseif c == 43 then
					elseif c == 45 then
					elseif c == 47 then
					elseif c == 61 then
					elseif c == 63 then
					elseif c >= 94 and c <= 96 then
					elseif c >= 123 and c <= 126 then
					elseif c == 46 then
						if isFirstCharacter then
							do return false end
						end
						if dotPreceded and not insideQuotation then
							do return false end
						end
						dotPreceded = true
						goto _continue1
					elseif c == 32 then
						if not insideQuotation then
							do return false end
						end
					elseif c == 34 then
						if insideQuotation then
							insideQuotation = false
							outsideQuotation = true
						else
							if not isFirstCharacter and not dotPreceded then
								do return false end
							end
							insideQuotation = true
							outsideQuotation = false
						end
					elseif c == 40 then
						if not insideQuotation then
							do return false end
						end
					elseif c == 41 then
						if not insideQuotation then
							do return false end
						end
					elseif c == 44 then
						if not insideQuotation then
							do return false end
						end
					elseif c == 58 then
						if not insideQuotation then
							do return false end
						end
					elseif c == 59 then
						if not insideQuotation then
							do return false end
						end
					elseif c == 60 then
						if not insideQuotation then
							do return false end
						end
					elseif c == 62 then
						if not insideQuotation then
							do return false end
						end
					elseif c == 64 then
						if isFirstCharacter then
							do return false end
						end
						if not insideQuotation then
							if dotPreceded then
								do return false end
							end
							containsAtCharacter = true
							do break end
						end
					elseif c == 91 then
						if not insideQuotation then
							do return false end
						end
					elseif c == 92 then
						if not insideQuotation then
							do return false end
						end
					elseif c == 93 then
						if not insideQuotation then
							do return false end
						end
					else
						do return false end
					end
					isFirstCharacter = false
					dotPreceded = false
				end
				::_continue1::
			end
			if i < 0 then
				do return false end
			end
			if i > 64 then
				do return false end
			end
			if not containsAtCharacter then
				do return false end
			end
			do
				local domain = _g.jk.lang.String:getEndOfString(emailAddress, i + 1)
				if _g.jk.lang.String:isEmpty(domain) then
					do return false end
				end
				if _g.jk.lang.String:getLength(domain) > 253 then
					do return false end
				end
				if _g.jk.lang.String:startsWith(domain, "[", 0) then
					if not _g.jk.lang.String:endsWith(domain, "]") then
						do return false end
					end
					do
						local ip = _g.jk.lang.String:getSubString(domain, 1, _g.jk.lang.String:getLength(domain) - 2)
						if _g.jk.lang.String:isEmpty(ip) then
							do return false end
						end
						do
							local nodes = _g.jk.lang.String:split(ip, 46, 0)
							if not (nodes ~= nil) or _g.jk.lang.Vector:getSize(nodes) ~= 4 then
								do return false end
							end
							if nodes ~= nil then
								local n2 = 0
								local m = _g.jk.lang.Vector:getSize(nodes)
								do
									n2 = 0
									while n2 < m do
										local node = nodes[n2 + 1]
										if node ~= nil then
											ci = _g.jk.lang.String:iterate(node)
											while true do
												local c = ci:getNextChar()
												if c < 1 then
													do break end
												end
												if c >= 48 and c <= 57 then
												else
													do return false end
												end
											end
											do
												local n = _g.jk.lang.String:toInteger(node)
												if n < 0 or n > 255 then
													do return false end
												end
											end
										end
										do n2 = n2 + 1 end
									end
								end
							end
							do return false end
						end
					end
				end
				do
					local domains = _g.jk.lang.String:split(domain, 46, 0)
					if _g.jk.lang.Vector:getSize(domains) <= 1 then
						do return false end
					end
					if domains ~= nil then
						local n3 = 0
						local m2 = _g.jk.lang.Vector:getSize(domains)
						do
							n3 = 0
							while n3 < m2 do
								local label = domains[n3 + 1]
								if label ~= nil then
									if _g.jk.lang.String:isEmpty(label) then
										do return false end
									end
									if _g.jk.lang.String:getLength(label) > 63 then
										do return false end
									end
									ci = _g.jk.lang.String:iterate(label)
									if not (ci ~= nil) then
										do return false end
									end
									do
										local hyphenPreceded = false
										isFirstCharacter = true
										while true do
											local c = ci:getNextChar()
											if c < 1 then
												do break end
											end
											if c >= 65 and c <= 90 then
											elseif c >= 97 and c <= 122 then
											elseif c >= 48 and c <= 57 then
											elseif c == 45 then
												if isFirstCharacter then
													do return false end
												end
												hyphenPreceded = true
												isFirstCharacter = false
												goto _continue2
											else
												do return false end
											end
											hyphenPreceded = false
											isFirstCharacter = false
											::_continue2::
										end
										if hyphenPreceded then
											do return false end
										end
									end
								end
								do n3 = n3 + 1 end
							end
						end
					end
					do return true end
				end
			end
		end
	end
end

function jk.validator.DataValidator:checkPassword(password, minimum, maximun)
	if _g.jk.lang.String:isEmpty(password) then
		do return _g.jk.lang.Error:forCode("noPassword", nil) end
	end
	do
		local min = minimum
		if min < 8 then
			min = 8
		end
		if _g.jk.lang.String:getLength(password) < min then
			do return _g.jk.lang.Error:forCode("passwordLengthLessThanMinimum", nil) end
		end
		do
			local max = maximun
			if max < 64 then
				max = 64
			end
			if _g.jk.lang.String:getLength(password) > max then
				do return _g.jk.lang.Error:forCode("passwordLengthMoreThanMaximum", nil) end
			end
			do
				local hasLowerAlpha = false
				local hasUpperAlpha = false
				local hasNumeric = false
				local hasSpecial = false
				local previousChar = 0
				local sChar = 0
				local count = 1
				local ci = _g.jk.lang.String:iterate(password)
				while true do
					local c = ci:getNextChar()
					if c < 1 then
						do break end
					end
					if c > 32 and c < 127 then
						if previousChar == c then
							do count = count + 1 end
							if count == 3 then
								do return _g.jk.lang.Error:forCode("passwordHasRepetitiveCharacters", nil) end
							end
							previousChar = c
						elseif c == previousChar + 1 then
							sChar = c
						elseif c == sChar + 1 then
							do return _g.jk.lang.Error:forCode("passwordHasSequentialCharacters", nil) end
						else
							previousChar = c
						end
						if c >= 65 and c <= 90 then
							hasUpperAlpha = true
						elseif c >= 97 and c <= 122 then
							hasLowerAlpha = true
						elseif c >= 48 and c <= 57 then
							hasNumeric = true
						else
							hasSpecial = true
						end
						goto _continue3
					end
					do return _g.jk.lang.Error:forCode("passwordHasUnknownCharacter", nil) end
					::_continue3::
				end
				if hasUpperAlpha and hasLowerAlpha == false and hasNumeric == false and hasSpecial == false then
					do return _g.jk.lang.Error:forCode("passwordHasNoAlphanumericCharacterCombination", nil) end
				elseif hasLowerAlpha and hasUpperAlpha and hasNumeric == false and hasSpecial == false then
					do return _g.jk.lang.Error:forCode("passwordHasNoNumericAndSpecialCharacterCombination", nil) end
				elseif hasNumeric == false then
					do return _g.jk.lang.Error:forCode("passwordHasNoNumericCharacter", nil) end
				elseif hasLowerAlpha == false then
					do return _g.jk.lang.Error:forCode("passwordHasNoLowercase", nil) end
				elseif hasUpperAlpha == false then
					do return _g.jk.lang.Error:forCode("passwordHasNoUppercase", nil) end
				elseif hasSpecial == false then
					do return _g.jk.lang.Error:forCode("passwordHasNoSpecialCharacter", nil) end
				else
					do return nil end
				end
			end
		end
	end
end

function jk.validator.DataValidator:isNameValid(name)
	if _g.jk.lang.String:isEmpty(name) then
		do return false end
	end
	do
		local ci = _g.jk.lang.String:iterate(name)
		local isFirstCharacter = true
		local spacePreceded = false
		local hyphenPreceded = false
		while true do
			local c = ci:getNextChar()
			if c < 1 then
				do break end
			end
			if c == 32 then
				if isFirstCharacter then
					do return false end
				end
				if spacePreceded then
					do return false end
				end
				spacePreceded = true
				goto _continue4
			end
			if c == 45 then
				if isFirstCharacter then
					do return false end
				end
				if hyphenPreceded then
					do return false end
				end
				hyphenPreceded = true
				goto _continue4
			end
			isFirstCharacter = false
			spacePreceded = false
			hyphenPreceded = false
			if c == 164 or c == 165 or (c >= 65 and c <= 90) or (c >= 97 and c <= 122) then
				goto _continue4
			end
			do return false end
			::_continue4::
		end
		if spacePreceded then
			do return false end
		end
		if hyphenPreceded then
			do return false end
		end
		do return true end
	end
end
