local expiry_from_rotation_end = function(cache_item, data)
	if not (data and data.current_rotation_end) then return end
	cache_item.expires_at_time = tonumber(data.current_rotation_end)
end

-- Melk - Limited Acquisitions
return {
	key = "marks_store_temporary",
	refresh_on_expiry = true,
	setting_id = "cache_item_marks_store_temporary",
	hooks = {
		{ obj = "StoreService", method = "get_marks_store_temporary" }
	},
	cb_fetch = function()
		return Managers.data_service.store:get_marks_store_temporary()
	end,
	cb_response = expiry_from_rotation_end
}
