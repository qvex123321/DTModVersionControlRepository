local mod = get_mod("ScoreboardTagCounter")

return {
	name = mod:localize("mod_name"),
	description = mod:localize("mod_description"),
	is_togglable = true,
	options = {
		widgets = {
			{
				setting_id = "option_enemies_tagged",
				type = "checkbox",
				default_value = true,
			},
		}
	},
}
