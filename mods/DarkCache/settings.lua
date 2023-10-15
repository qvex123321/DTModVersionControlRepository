DC = DC or {}
DC.settings = DC.settings or {}
local s = DC.settings -- (s)cope alias
local gold = { 255, 186, 9 }
local green = { 0, 255, 0 }
local grey = { 128, 128, 128 }
local reset = "{#reset()}"

local function colorise(colour, str)
	return "{#color(" .. colour[1] .. "," .. colour[2] .. "," .. colour[3] ..
		")}" .. str .. reset
end

s.get_setting_names = function(data)
	-- Correct starting point in case of passing in wrong table.
	if data.options then
		data = data.options.widgets
	elseif data.widgets then
		data = data.widgets
	end

	local result = {}

	for i = 1, #data do

		-- If it's not a group, add its setting_id.
		if data[i].type ~= "group" and data[i].setting_id then
			table.insert(result, data[i].setting_id)
		end

		-- If it has any subwidgets, process them (recursively).
		if data[i].sub_widgets then
			local sub_result = s.get_setting_names(data[i].sub_widgets)

			for j = 1, #sub_result do
				if sub_result[j] then
					table.insert(result, sub_result[j])
				end
			end
		end

	end

	return result
end

s.build_cache = function()
	local cache = {}

	for _, v in ipairs(s.get_setting_names(DC.mod.data)) do
		cache[v] = DC.mod:get(v)
	end

	s.cache = cache
	return cache
end

s.announce = function(setting_id)
	local loc_name = DC.mod:localize(setting_id)
	local value = s.cache[setting_id]

	if not loc_name or value == nil then
		return
	end

	local str = colorise(gold, loc_name)

	if string.sub(setting_id, 1, #"cache_item_") == "cache_item_" then
		str = str .. " caching"
	end

	 str = str .. " " .. (value and
	 	colorise(green, DC.mod:localize("enabled")) or
	 	colorise(grey, DC.mod:localize("disabled"))) .. "."
	 DC.mod:echo(str)

	local addendum = s.get_explanation_text(setting_id, value)

	if #addendum > 0 then
		DC.mod:echo(addendum)
	end
end

s.get_explanation_text = function(setting_id, value)
	if setting_id == "hub_caching" then
		return value and DC.mod:localize("hub_caching_enabled") or ""
	end

	return ""
end

s.update_command_access = function()
	(s.cache.dev_mode and
		DC.mod.enable_all_commands or
		DC.mod.disable_all_commands)(DC.mod)
end

DC.mod.on_setting_changed = function(setting_id)
	DC.settings.cache[setting_id] = DC.mod:get(setting_id)

	if setting_id == "dev_mode" then
		DC.settings.update_command_access()
	elseif string.sub(setting_id, 1, #"cache_item_") == "cache_item_" then
		DC.update_all_caches_enabledness()
	elseif setting_id == "hub_caching" then
		DC.update_hub_caching_hooks()
	elseif setting_id == "icon_caching" then
		DC.icon_caching.update_hooks()
	end

	DC.settings.announce(setting_id)
end

DC.mod.on_enabled = function(initial_call)
	if initial_call then
		DC.settings.build_cache()
		DC.update_hub_caching_hooks()
		DC.icon_caching.update_hooks()

		if DC.rt:dev_mode() then
			print("[DarkCache] Developer Mode is enabled and will be print()ing some text. Disable it if you don't want that!")
		end

		if DC.settings.cache.hub_caching and DC.settings.cache.hub_preloading then
			DC.preload_hub()
		end
	end
end
