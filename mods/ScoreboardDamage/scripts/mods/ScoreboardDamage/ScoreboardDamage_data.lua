local mod = get_mod("ScoreboardDamage")

return {
	name = mod:localize("mod_title"),
	description = mod:localize("mod_description"),
	is_togglable = true,
	options = {
		widgets = {
			{["setting_id"] = "plugin_enemy_data",
				["type"] = "dropdown",
				["default_value"] = 1,
				["options"] = {
					{["text"] = "plugin_enemy_data_full", ["value"] = 1, ["show_widgets"] = {}},
					{["text"] = "plugin_enemy_data_simple", ["value"] = 2, ["show_widgets"] = {}},
					{["text"] = "plugin_enemy_data_off", ["value"] = 3, ["show_widgets"] = {}},
				},
			},
			{
				setting_id = "plugin_melee_data",
				type = "checkbox",
				default_value = true,
			},
			{
				setting_id = "plugin_ranged_data",
				type = "checkbox",
				default_value = true,
			},
			{
				setting_id = "plugin_melee_data_special",
				type = "checkbox",
				default_value = true,
			},
			{
				setting_id = "plugin_ranged_data_special",
				type = "checkbox",
				default_value = true,
			},
		},
	},
}
