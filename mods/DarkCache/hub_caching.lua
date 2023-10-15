-- Make linter happy
table.clear = table.clear or function(...) end
table.enum = table.enum or function(...) return #{...} end
APPLICATION_SETTINGS = APPLICATION_SETTINGS or {}

local ItemPackage = require("scripts/foundation/managers/package/utilities/item_package")
local ThemePackage = require("scripts/foundation/managers/package/utilities/theme_package")
local BreedResourceDependencies = require("scripts/utilities/breed_resource_dependencies")
local Breeds = require("scripts/settings/breed/breeds")
local MasterItems = require("scripts/backend/master_items")

local LOAD_STATES = table.enum("none", "level_load", "packages_load", "done")
local cleanup_states = { was_hub = 0, was_other = 1, was_nothing = 2 }
local hub_mission_name = "hub_ship"
local loading_mission_name = ""
local last_loaded_mission_name = ""
local loading_hub = false
local loading_done = false
local loading_start_time = -1
local total_preload_items = 0
local preload_data_dir = DC.ext_mod_path .. "hub_preload_data"
local level_resnames_path = preload_data_dir .. "/level_resource_names"
local breed_resnames_path = preload_data_dir .. "/breed_resource_names"
local late_load_package_names = {}

local hub_names = {
	mission = "hub_ship",
	editor = "content/levels/hub/hub_ship/missions/hub_ship",
	circumstance = "default",
	level = "content/levels/hub/hub_ship/missions/hub_ship"
}

local new_loader_metadata = function(name)
	local self = {}
	self.name = name
	self.cached = false
	return self
end

local loader_data = {
	view = new_loader_metadata("ViewLoader"),
	level = new_loader_metadata("LevelLoader"),
	breed = new_loader_metadata("BreedLoader")
}

DC.hub_caching_hooks = {
	{ obj = "LocalLoadersState", method = "init" },
	{ obj = "LocalLoadersState", method = "update" },
	{ obj = "ViewLoader", method = "is_loading_done" },
	{ obj = "ViewLoader", method = "cleanup" },
	-- { obj = "BreedLoader", method = "is_loading_done" },
	{ obj = "BreedLoader", method = "cleanup" },
	{ obj = "LevelLoader", method = "is_loading_done" },
	{ obj = "LevelLoader", method = "cleanup" },
}

DC.mod:hook("LocalLoadersState", "init", function(func, self, state_machine, shared_state)
	loading_mission_name = shared_state.mission_name
	loading_hub = loading_mission_name == hub_mission_name
	loading_done = false
	loading_start_time = os.time()

	return func(self, state_machine, shared_state)
end)

DC.mod:hook("LocalLoadersState", "update", function(func, self, dt)
	local value = func(self, dt)

	if not loading_done and value == "load_done" then
		if loading_hub then
			DC.generate_level_resource_names_file()
			DC.generate_breed_resource_names_file()
			DC.mod:set("last_load_game_version", APPLICATION_SETTINGS.game_version)
		end

		last_loaded_mission_name = loading_mission_name
		loading_mission_name = ""
		loading_done = true
		loading_hub = false
		local elapsed = os.time() - loading_start_time
		loading_start_time = -1
		DC.rt:print("Loaded in " .. elapsed .. " seconds.")
	end

	return value
end)

local is_loading_done = function(loader, func, ...)
	if loading_hub and loader.cached then
		return true
	end

	local done = func(...)

	if loading_hub and done then
		loader.cached = true
		return true
	end

	return done
end

DC.mod:hook("ViewLoader", "is_loading_done", function(func, ...)
	return is_loading_done(loader_data.view, func, ...)
end)

DC.mod:hook("LevelLoader", "is_loading_done", function(func, ...)
	return is_loading_done(loader_data.level, func, ...)
end)

DC.mod:hook("BreedLoader", "is_loading_done", function(func, self, ...)
	if self._load_state == LOAD_STATES.done then
		while #late_load_package_names > 0 do
			DC.rt:print("Late-Loading: " .. late_load_package_names[1])
			Managers.package:load(late_load_package_names[1], "BreedLoader")
			table.remove(late_load_package_names, 1)
		end
	end

	if DC.settings.cache.hub_preloading then
		return is_loading_done(loader_data.breed, func, self, ...)
	end

	return func(self, ...)
end)

local cleanup_hub_check = function(loader)
	if #last_loaded_mission_name == 0 then
		return cleanup_states.was_nothing
	end

	if last_loaded_mission_name == hub_mission_name then
		DC.rt:print(loader.name .. " did hub cleanup.")
		return cleanup_states.was_hub
	end

	return cleanup_states.was_other
end

DC.mod:hook("ViewLoader", "cleanup", function(func, self)
	local state = cleanup_hub_check(loader_data.view)

	if state == cleanup_states.was_nothing or state == cleanup_states.was_other then
		return func(self)
	end

	for view_name, _ in pairs(self._loading_views or {}) do
		self._loading_views[view_name] = nil
	end

	self._loading_views = nil
	self._load_done = false
end)

DC.mod:hook("LevelLoader", "cleanup", function(func, self)
	local state = cleanup_hub_check(loader_data.level)

	if state == cleanup_states.was_nothing or state == cleanup_states.was_other then
		return func(self)
	end

	Managers.world_level_despawn:flush()
	table.clear(self._package_ids or {})
	table.clear(self._packages_to_load or {})

	if self._level_package_id then
		self._level_loaded = false
		self._level_package_id = nil
		self._level_name = nil
	end

	self._theme_tag = nil
	self._load_state = LOAD_STATES.none
end)

DC.mod:hook("BreedLoader", "cleanup", function(func, self)
	local state = cleanup_hub_check(loader_data.breed)

	if state == cleanup_states.was_nothing or state == cleanup_states.was_other then
		return func(self)
	end

	for id, _ in pairs(self._package_ids or {}) do
		self._package_ids[id] = nil
	end

	self._load_state = LOAD_STATES.none
	table.clear(self._packages_to_load or {})
end)

DC.update_hub_caching_hooks = function()
	local toggle_func = DC.settings.cache.hub_caching and
		DC.mod.hook_enable or DC.mod.hook_disable

	for _, v in ipairs(DC.hub_caching_hooks) do
		toggle_func(DC.mod, v.obj, v.method)
	end
end

DC.generate_level_resource_names_file = function()
	DC.rt:print("Generating Level resource names file...")

	local item_packages = ItemPackage.level_resource_dependency_packages(MasterItems.get_cached(), hub_names.level)
	local theme_packages = ThemePackage.level_resource_dependency_packages(hub_names.level, "default")
	local f = Mods.lua.io.open(level_resnames_path, "w")
	local str = ""

	for k, _ in pairs(item_packages) do
		str = str .. k .. "\n"
	end

	for _, v in pairs(theme_packages) do
		str = str .. v .. "\n"
	end

	f:write(str)
	f:close()
end

DC.generate_breed_resource_names_file = function()
	DC.rt:print("Generating Breed resource names file...")

	local breeds = BreedResourceDependencies.generate(Breeds, MasterItems.get_cached())
	local f = Mods.lua.io.open(breed_resnames_path, "w")
	local str = ""

	for k, _ in pairs(breeds) do
		str = str .. k .. "\n"
	end

	f:write(str)
	f:close()
end

local has_version_changed = function()
	local current_version = APPLICATION_SETTINGS.game_version
	local last_version = DC.mod:get("last_load_game_version")
	return current_version ~= last_version
end

DC.preload_hub = function()
	if DC.rt.utils.player_in_hub() or
			DC.rt.utils.player_in_mission() or
			not DC.settings.cache["hub_preloading"] then
		return
	end

	DC.rt:print("Darktide Version: " .. APPLICATION_SETTINGS.game_version)
	DC.rt:print("Last Hub Load Version: " ..
		(DC.mod:get("last_load_game_version") or "nil"))

	local echo_generate_explanation = function()
		DC.mod:echo(DC.mod:localize("preload_generate_data_explanation"))
	end

	if not DC.settings.cache.suppress_cache_regen_notification and
			has_version_changed() then
		return echo_generate_explanation()
	end

	local level_resnames_file = Mods.lua.io.open(level_resnames_path, "r")
	local breed_resnames_file = Mods.lua.io.open(breed_resnames_path, "r")
	local skip = false

	if not level_resnames_file then
		DC.rt:print("Level resource names file missing. Preloading skipped.")
		skip = true
	end

	if not breed_resnames_file then
		DC.rt:print("Breed resource names file missing. Preloading skipped.")
		skip = true
	end

	if skip then
		return echo_generate_explanation()
	end

	DC.rt:print("Preloading hub...")

	local pkg_mgr = Managers.package
	local level_ref_name = "LevelLoader (hub_ship)"
	local line

	-- Load breed resources.
	line = breed_resnames_file:read()

	while(line) do
		total_preload_items = total_preload_items + 1

		if Application.can_get_resource("package", line) then
			pkg_mgr:load(line, "BreedLoader", function() end)
		else
			DC.rt:print("(Preloading) Resource package \"" .. line ..
					"\" is unexpectedly unavailable and will be loaded later.")
			table.insert(late_load_package_names, line)
		end

		line = breed_resnames_file:read()
	end

	breed_resnames_file:close()

	-- Load level resources.
	pkg_mgr:load(hub_names.level, level_ref_name, function() end)
	line = level_resnames_file:read()

	while(line) do
		total_preload_items = total_preload_items + 1
		pkg_mgr:load(line, level_ref_name, function() end)
		line = level_resnames_file:read()
	end

	level_resnames_file:close()
end

-- This is a bit hacky but the hook was being delayed beyond when it was
-- required. Basically just storing the original reference to the original
-- BreedResourceDependencies.generate method so I can non-dmf "hook" it
-- and remove unavailable resources from the list of packages to load before
-- BreedLoader has a chance to load them.
local old_func = nil

DC.mod:hook("BreedLoader", "start_loading", function(func, ...)
	if not old_func then
		old_func = BreedResourceDependencies.generate
	end

	BreedResourceDependencies.generate = function(breeds, item_defs)
		local result = old_func(breeds, item_defs)

		for k, _ in pairs(result) do
			if not Application.can_get_resource("package", k) then
				DC.rt:print("(Dependency Generation) Resource package \"" .. k ..
					"\" is unexpectedly unavailable and will be loaded later.")
				table.insert(late_load_package_names, k)
				result[k] = nil
			end
		end

		return result
	end

	return func(...)
end)
