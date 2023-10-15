return {
	key = "premium_store_account_update",
	setting_id = "cache_item_premium_store",
	hooks = {
		-- { obj = "StoreView", method = "_update_account_items" },
		{ obj = "StoreService", method = "get_premium_store" }
	},
	cb_fetch = function()
		return DC.premium_store_fetch_wrap()
	end
}
