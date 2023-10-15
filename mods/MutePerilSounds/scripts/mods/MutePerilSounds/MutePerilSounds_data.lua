local mod = get_mod("MutePerilSounds")

return {
	name = "MutePerilSounds",
	description = mod:localize("mod_description"),
	is_togglable = true,
	options = {
		widgets = {
			{
				setting_id = "mute_peril_sounds",
				type = "checkbox",
				default_value = true
			}
		}
	}
}
