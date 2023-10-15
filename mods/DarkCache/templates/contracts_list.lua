return {
	key = "contracts_list",
	setting_id = "cache_item_contracts_list",
	hooks = {
		{ obj = "Contracts", method = "get_current_contract" },
		{ obj = "Contracts", method = "complete_contract" },
		{ obj = "Contracts", method = "reroll_task" }
	},
	cb_fetch = function()
		return Managers.backend.interfaces.contracts:get_current_contract(
			DC.get_current_char_id())
	end
}
