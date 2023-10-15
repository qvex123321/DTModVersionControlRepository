local expiry_from_rotation_end = function(cache_item, data)
	if not (data and data.current_rotation_end) then return end
	cache_item.expires_at_time = tonumber(data.current_rotation_end)
end

-- Armoury - Requisition
return {
	key = "credits_store",
	refresh_on_expiry = true,
	setting_id = "cache_item_credits_store",
	hooks = {
		{ obj = "StoreService", method = "get_credits_store" }
	},
	cb_fetch = function()
		return Managers.data_service.store:get_credits_store()
	end,
	cb_response = expiry_from_rotation_end
}
