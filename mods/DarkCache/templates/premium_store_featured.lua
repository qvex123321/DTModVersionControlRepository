return {
	key = "premium_store_featured",
	setting_id = "cache_item_premium_store",
	hooks = {
		{ obj = "StoreService", method = "get_premium_store" }
	},
	cb_fetch = function()
		return Managers.data_service.store:get_premium_store("premium_store_featured")
	end
}
