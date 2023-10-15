-- Armoury - Brunt's
return {
	key = "credits_goods_store",
	setting_id = "cache_item_credits_goods_store",
	hooks = {
		{ obj = "StoreService", method = "get_credits_goods_store" }
	},
	cb_fetch = function()
		return Managers.data_service.store:get_credits_goods_store()
	end
}
