DarkCache = DarkCache or {}
DC = DarkCache
DC.mod = get_mod("DarkCache")

-- linter shut up please
Promise = Promise or {}
Mods = Mods or {}
Managers = Managers or {}

DC.update_interval = 0.25 -- seconds
DC.update_delta = 0
DC.storeview_account_items = {}
DC.main_time = 0
DC.server_time = 0
DC.agnostic_cache = nil
DC.char_caches = {}
DC.mod_path = "DarkCache/"
DC.ext_mod_path = "./../mods/DarkCache/"
DC.force_no_current_char = false

local redtools = Mods.file.dofile(DC.mod_path .. "redtools/main")
DC.rt = redtools.new("DarkCache")

local templates = Mods.file.dofile(DC.mod_path .. "template_list")

Mods.file.dofile(DC.mod_path .. "settings")
Mods.file.dofile(DC.mod_path .. "classes/cache_item")
Mods.file.dofile(DC.mod_path .. "classes/cache")
Mods.file.dofile(DC.mod_path .. "hooks")
Mods.file.dofile(DC.mod_path .. "hub_caching")
Mods.file.dofile(DC.mod_path .. "icon_caching")
Mods.file.dofile(DC.mod_path .. "commands")

DC.update_caches = function()
	if DC.agnostic_cache then
		DC.agnostic_cache:update()
	end

	-- Only update current character's cache.
	local cache = DC.get_current_char_cache()

	if cache then
		cache:update()
	end

	DC.refresh_happened = false
end

DC.get_current_char_id = function()
	if DC.force_no_current_char then
		return
	end

	if DC.current_char_id then
		return DC.current_char_id
	end

	if Managers and
			Managers.player and
			Managers.player.local_player_backend_profile then
		local profile = Managers.player:local_player_backend_profile()
		return profile and profile.character_id
	end
end

DC.get_current_char_cache = function()
	local char_id = DC.get_current_char_id()
	if not char_id then return nil end
	return DC.char_caches[char_id]
end

function DC.add_premium_store_items_to_cache(cache)
	cache:add(DC.CacheItem.new(templates.premium_store_account_update))
	cache:add(DC.CacheItem.new(templates.premium_store_featured))
	cache:add(DC.CacheItem.new(templates.premium_store_skins_veteran))
	cache:add(DC.CacheItem.new(templates.premium_store_skins_zealot))
	cache:add(DC.CacheItem.new(templates.premium_store_skins_ogryn))
	cache:add(DC.CacheItem.new(templates.premium_store_skins_psyker))
	cache:add(DC.CacheItem.new(templates.hard_currency_store))
end

DC.build_agnostic_cache = function(force)
	if not force and DC.agnostic_cache then
		DC.rt:print("Agnostic cache exists; build skipped.")
		return nil
	end

	local cache = DC.Cache.new()
	DC.rt:print("New Cache: Agnostic")
	DC.add_premium_store_items_to_cache(cache)
	cache:add(DC.CacheItem.new(templates.mission_board))
	DC.agnostic_cache = cache
	return cache
end

DC.build_char_cache = function(char_id)
	if not char_id then
		char_id = DC.get_current_char_id()
	end

	if not char_id then
		DC.rt:print("build_char_cache failed: No character id.")
		return
	end

	local cache = DC.Cache.new()
	DC.rt:print("New Char Cache: " .. char_id)

	cache:add(DC.CacheItem.new(templates.credits_store))
	cache:add(DC.CacheItem.new(templates.credits_goods_store))
	cache:add(DC.CacheItem.new(templates.credits_cosmetics_store_veteran))
	cache:add(DC.CacheItem.new(templates.credits_cosmetics_store_zealot))
	cache:add(DC.CacheItem.new(templates.credits_cosmetics_store_ogryn))
	cache:add(DC.CacheItem.new(templates.credits_cosmetics_store_psyker))
	cache:add(DC.CacheItem.new(templates.credits_weapon_cosmetics_store_veteran))
	cache:add(DC.CacheItem.new(templates.credits_weapon_cosmetics_store_zealot))
	cache:add(DC.CacheItem.new(templates.credits_weapon_cosmetics_store_ogryn))
	cache:add(DC.CacheItem.new(templates.credits_weapon_cosmetics_store_psyker))
	cache:add(DC.CacheItem.new(templates.marks_store))
	cache:add(DC.CacheItem.new(templates.marks_store_temporary))
	cache:add(DC.CacheItem.new(templates.contracts_list))

	DC.char_caches = DC.char_caches or {}
	DC.char_caches[char_id] = cache
end

local notification_queue = {}

DC.queue_notification = function(text, delay_after_prior)
	table.insert(notification_queue, {
		text = text,
		timer = delay_after_prior or 0
	})
end

DC.update_notification_queue = function(dt)
	if #notification_queue > 0 then
		local item = notification_queue[1]
		item.timer = item.timer - dt

		if item.timer < 0 then
			DC.mod:notify(item.text)
			table.remove(notification_queue, 1)
		end
	end
end

DC.mod.update = function(dt)
	DC.update_delta = DC.update_delta + dt

	if DC.update_delta < DC.update_interval or
			DC.rt.utils.player_in_mission() then
		return
	end

	DC.main_time = Managers.time:time("main")
	DC.server_time = Managers.backend:get_server_time(DC.main_time)
	DC.update_notification_queue(DC.update_delta)
	DC.update_delta = 0
	DC.update_caches()
end

function DC.mod.on_game_state_changed(status, state_name)
	-- When entering mission, expire contracts list. When entering hub, refresh
	-- contracts list data.
	if status == "enter" and state_name == "GameplayStateRun" then

		local cache = DC.get_current_char_cache()
		if not cache then return end
		local contracts_item = cache:get("contracts_list")

		if contracts_item then
			if DC.rt.utils.player_in_mission() then
				contracts_item:expire()
			elseif DC.rt.utils.player_in_hub() then
				contracts_item:try_get_data()
			end
		end
	end
end

function DC.get_all_caches()
	local result = { DC.agnostic_cache }

	for _, v in pairs(DC.char_caches) do
		table.insert(result, v)
	end

	return result
end

function DC.update_all_caches_enabledness()
	for _, cache in pairs(DC.get_all_caches()) do
		cache:update_enabledness()
	end
end
