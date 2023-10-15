local mod = get_mod("NoSkull")

return {
	name = mod:localize("mod_name"),
	description = mod:localize("mod_description"),
	is_togglable = true,
	options = {
		widgets = {
			{
				setting_id = "show_skull",
				type = "checkbox",
				default_value = true
			}, {
				setting_id = "fade_group",
				type = "group",
				sub_widgets = {
					{
						setting_id = "fade_distance_start",
						type = "numeric",
						range = { 1, 500 },
						default_value = 100
					}, {
						setting_id = "fade_distance_end",
						type = "numeric",
						range = { 1, 500 },
						default_value = 25
					}
				}
			}
		}
	}
}
