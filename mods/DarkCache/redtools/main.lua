-- # RedTools - Generally useful code.
local version = 3
local redtools = {}
redtools.__index = redtools
local s = redtools

-- Instantiates RedTools for a given mod, which is important for contextualising
-- logging output and maybe other things later.
-- # mod_name: Name of mod that can be passed to DMF's get_mod function.
s.new = function(mod_name)
	local self = {}
	setmetatable(self, s)

	self.mod = get_mod(mod_name)
	self.version = version
	self.print_prefix = "[" .. mod_name .. "] "

	local rt_path = mod_name .. "/redtools/"
	self.utils = Mods.file.dofile(rt_path .. "utils")

	Mods.file.dofile(rt_path .. "extensions")

	return self
end

local internal_print = function(self, msg)
	print(self.print_prefix .. msg)
end

local internal_print_table = function(self, tbl)
	local count = self.utils.len(tbl)
	local i = 1
	local str = "{ "

	for k, v in pairs(tbl) do
		str = str .. tostring(k) .. " = " .. tostring(v)
		if i ~= count then str = str .. ", " end
		i = i + 1
	end

	str = str .. " }"
	internal_print(self, str)
end

local function internal_print_error(self, msg)
	print(self.print_prefix .. "ERROR: " .. msg)
end

function s:dev_mode()
	return self.mod and self.mod:get("dev_mode")
end

function s:print(o)
	if not self:dev_mode() then return end
	local type_str = type(o)

	if type_str == "string" then
		internal_print(self, o)
	elseif type_str == "number" then
		internal_print(self, tostring(o))
	elseif type_str == "table" then
		internal_print_table(self, o)
	elseif o == nil then
		internal_print(self, "nil")
	end
end

function s:notify(msg)
	if not self:dev_mode() then return end
	self.mod:notify(msg)
end

function s:error(msg)
	if not self:dev_mode() then return end
	internal_print_error(self, msg)
end

return redtools
