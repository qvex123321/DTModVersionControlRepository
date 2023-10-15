function DC.init_general(init_current_char)
	DC.current_char_id = nil -- Required for compatibility with CharWallets mod.
	DC.settings.build_cache() -- Settings cache
	DC.settings.update_command_access()
	DC.build_agnostic_cache()

	if init_current_char then
		DC.build_char_cache()
	end

	DC.update_hub_caching_hooks()
	DC.update_all_caches_enabledness()
end

DC.mod:hook_safe("Account", "set_selected_character", function(_, char_id)
	DC.force_no_current_char = false
	DC.current_char_id = char_id
	DC.build_char_cache(char_id)
	DC.update_all_caches_enabledness()
end)

DC.mod:hook_safe("MainMenuView", "init", function()
	DC.force_no_current_char = true
	DC.init_general()
end)

local cached_data_fetch = function(cache, cache_item_key, fetch_func, ...)
	if not cache then
		return fetch_func(...)
	end

	local item = cache:get(cache_item_key)

	if not item or item.fetching then
		return fetch_func(...)
	end

	local data = item:try_get_data()

	if not data then
		return fetch_func(...)
	end

	if cache_item_key == "premium_store_account_update" then
		DC.queue_notification("{#color(255,0,0)}WARNING{#reset()}: DarkCache has a known issue where premium store offers can appear free when not.", 2)
		DC.queue_notification("Please keep this in mind when considering making a purchase!", 3)
		DC.queue_notification("If need be, you can disable premium store caching in the DarkCache mod options.", 3)
	end

	return data
end

DC.premium_store_fetch_wrap = function(wrapped, promise)
	if not wrapped then
		DC.storeview_account_items = {}
		local promise_inner = Promise.new()

		Managers.data_service.gear:fetch_account_items_paged(100):next(function(wrapped_inner)
			DC.premium_store_fetch_wrap(wrapped_inner, promise_inner)
		end)

		return promise_inner
	else
		for _, item in pairs(wrapped.items) do
			DC.storeview_account_items[#DC.storeview_account_items + 1] = item
		end

		if wrapped.has_next then
			wrapped.next_page():next(function(wrapped_inner)
				DC.premium_store_fetch_wrap(wrapped_inner, promise)
			end)
		else
			promise:resolve()
		end
	end
end

-- Creates a wrapper around the function that updates and returns account
-- info for the premium store view so that the total data package that results
-- from the function's default recursive logic can be captured and cached.
DC.mod:hook("StoreView", "_update_account_items", function(func, self,
		wrapped, promise)
	-- If setting is disabled, proceed as with unmodded.
	if not DC.settings.cache.cache_item_premium_store then
		return func(self, wrapped, promise)
	end

	local returned_promise = cached_data_fetch(DC.agnostic_cache,
		"premium_store_account_update", func, self, wrapped, promise)

	if returned_promise and returned_promise.is_promise then
		returned_promise:next(function()
			self._account_items = DC.storeview_account_items
		end)
	end

	return returned_promise
end)

DC.mod:hook("StoreService", "get_credits_store", function(...)
	return cached_data_fetch(DC.get_current_char_cache(),
		"credits_store", ...)
end)

-- Brunt's Armoury
DC.mod:hook("StoreService", "get_credits_goods_store", function(...)
	return cached_data_fetch(DC.get_current_char_cache(),
		"credits_goods_store", ...)
end)

DC.mod:hook("Store", "get_veteran_credits_cosmetics_store", function(...)
	return cached_data_fetch(DC.get_current_char_cache(),
		"credits_cosmetics_store_veteran", ...)
end)

DC.mod:hook("Store", "get_zealot_credits_cosmetics_store", function(...)
	return cached_data_fetch(DC.get_current_char_cache(),
		"credits_cosmetics_store_zealot", ...)
end)

DC.mod:hook("Store", "get_ogryn_credits_cosmetics_store", function(...)
	return cached_data_fetch(DC.get_current_char_cache(),
		"credits_cosmetics_store_ogryn", ...)
end)

DC.mod:hook("Store", "get_psyker_credits_cosmetics_store", function(...)
	return cached_data_fetch(DC.get_current_char_cache(),
		"credits_cosmetics_store_psyker", ...)
end)

DC.mod:hook("Store", "get_veteran_credits_weapon_cosmetics_store", function(...)
	return cached_data_fetch(DC.get_current_char_cache(),
		"credits_weapon_cosmetics_store_veteran", ...)
end)

DC.mod:hook("Store", "get_zealot_credits_weapon_cosmetics_store", function(...)
	return cached_data_fetch(DC.get_current_char_cache(),
		"credits_weapon_cosmetics_store_zealot", ...)
end)

DC.mod:hook("Store", "get_ogryn_credits_weapon_cosmetics_store", function(...)
	return cached_data_fetch(DC.get_current_char_cache(),
		"credits_weapon_cosmetics_store_ogryn", ...)
end)

DC.mod:hook("Store", "get_psyker_credits_weapon_cosmetics_store", function(...)
	return cached_data_fetch(DC.get_current_char_cache(),
		"credits_weapon_cosmetics_store_psyker", ...)
end)

DC.mod:hook("StoreService", "get_credits_weapon_cosmetics_store", function(...)
	return cached_data_fetch(DC.get_current_char_cache(),
		"credits_weapon_cosmetics_store", ...)
end)

DC.mod:hook("StoreService", "get_marks_store", function(...)
	return cached_data_fetch(DC.get_current_char_cache(),
		"marks_store", ...)
end)

DC.mod:hook("StoreService", "get_marks_store_temporary", function(...)
	return cached_data_fetch(DC.get_current_char_cache(),
		"marks_store_temporary", ...)
end)

DC.mod:hook("StoreService", "get_premium_store", function(func, self, storefront)
	return cached_data_fetch(DC.agnostic_cache, storefront, func, self, storefront)
end)

DC.mod:hook("Contracts", "get_current_contract", function(...)
	return cached_data_fetch(DC.get_current_char_cache(), "contracts_list", ...)
end)

-- Expire contracts cache when completing and rerolling tasks.
local refresh_contracts = function(func, ...)
	local promise = func(...)

	-- Wait for request to complete before trying to update cache with new data.
	promise:next(function()
		local cache = DC.get_current_char_cache()

		if cache then
			local item = cache:get("contracts_list")

			if item then
				item:expire()
				item:try_get_data()
			end
		end
	end)

	return promise
end

DC.mod:hook("Contracts", "complete_contract", refresh_contracts)
DC.mod:hook("Contracts", "reroll_task", refresh_contracts)

DC.mod:hook("MissionBoardService", "fetch", function(...)
	return cached_data_fetch(DC.agnostic_cache, "mission_board", ...)
end)

-- Expire stores when purchases are made so that the displayed item listings
-- reflect the purchase.
local cause_store_update = function(store_cache_id)
	local cache = DC.get_current_char_cache()
	if not cache then return end
	local item = cache:get(store_cache_id)
	if not item then return end
	item:expire()
	item:try_get_data()
end

DC.mod:hook_safe("CreditsVendorView", "_on_purchase_complete", function(self, items)
	cause_store_update("credits_store")
end)

DC.mod:hook_safe("CosmeticsVendorView", "_on_purchase_complete", function()
	cause_store_update("credits_cosmetics_store_veteran")
	cause_store_update("credits_cosmetics_store_zealot")
	cause_store_update("credits_cosmetics_store_ogryn")
	cause_store_update("credits_cosmetics_store_psyker")
	cause_store_update("credits_weapon_cosmetics_store_veteran")
	cause_store_update("credits_weapon_cosmetics_store_zealot")
	cause_store_update("credits_weapon_cosmetics_store_ogryn")
	cause_store_update("credits_weapon_cosmetics_store_psyker")
end)

DC.mod:hook_safe("MarksVendorView", "_on_purchase_complete", function()
	cause_store_update("marks_store_temporary")
end)

DC.mod:hook_safe("MarksGoodsVendorView", "_on_purchase_complete", function()
	cause_store_update("marks_store")
end)
