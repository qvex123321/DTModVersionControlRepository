local mod = get_mod("smaller_talent_tree")

return {
	name = mod:localize("mod_name"),
	description = mod:localize("mod_description"),
	is_togglable = true,
	options = {
		widgets =
		{
			{
				setting_id = "veteran_tree_factor",
				type = "numeric",
				default_value = 1,
				range = {0.5, 1},
				decimals_number = 2
			},
			{
				setting_id = "veteran_tree_factor_x",
				type = "numeric",
				default_value = 1,
				range = {0.5, 1},
				decimals_number = 2
			},
			{
				setting_id = "zealot_tree_factor",
				type = "numeric",
				default_value = 1,
				range = {0.5, 1},
				decimals_number = 2
			},
			{
				setting_id = "zealot_tree_factor_x",
				type = "numeric",
				default_value = 1,
				range = {0.5, 1},
				decimals_number = 2
			},
			{
				setting_id = "ogryn_tree_factor",
				type = "numeric",
				default_value = 1,
				range = {0.5, 1},
				decimals_number = 2
			},
			{
				setting_id = "ogryn_tree_factor_x",
				type = "numeric",
				default_value = 1,
				range = {0.5, 1},
				decimals_number = 2
			},
			{
				setting_id = "psyker_tree_factor",
				type = "numeric",
				default_value = 1,
				range = {0.5, 1},
				decimals_number = 2
			},
			{
				setting_id = "psyker_tree_factor_x",
				type = "numeric",
				default_value = 1,
				range = {0.5, 1},
				decimals_number = 2
			},
			{
				setting_id = "adamant_tree_factor",
				type = "numeric",
				default_value = 1,
				range = {0.5, 1},
				decimals_number = 2
			},
			{
				setting_id = "adamant_tree_factor_x",
				type = "numeric",
				default_value = 1,
				range = {0.5, 1},
				decimals_number = 2
			},
			{
				setting_id = "broker_tree_factor",
				type = "numeric",
				default_value = 1,
				range = {0.5, 1},
				decimals_number = 2
			},
			{
				setting_id = "broker_tree_factor_x",
				type = "numeric",
				default_value = 1,
				range = {0.5, 1},
				decimals_number = 2
			},
		},
	},
}
