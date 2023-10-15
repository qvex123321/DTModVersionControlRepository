return {
	key = "hard_currency_store",
	setting_id = "cache_item_premium_store",
	hooks = {
		{ obj = "StoreService", method = "get_premium_store" }
	},
	cb_fetch = function()
		return Managers.data_service.store:get_premium_store("hard_currency_store")
	end
}
