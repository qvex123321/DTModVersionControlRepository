return {
	key = "credits_cosmetics_store_zealot",
	refresh_on_expiry = true,
	setting_id = "cache_item_credits_cosmetics_store",
	hooks = {
		{ obj = "Store", method = "get_zealot_credits_cosmetics_store" }
	},
	cb_fetch = function()
		return Managers.backend.interfaces.store:get_zealot_credits_cosmetics_store(
			Application.time_since_launch(), DC.get_current_char_id())
	end,
	cb_response = function(cache_item, data)
		if not (data and data.current_rotation_end) then return end
		cache_item.expires_at_time = tonumber(data.current_rotation_end)
	end
}
