--[[
    Author: Igromanru
    Date: 30.11.2024
    Mod Name: Transparent Shield
]]
local mod = get_mod("TransparentShield")
local SettingNames = mod:io_dofile("TransparentShield/scripts/setting_names")

return {
	name = mod:localize("mod_name"),
	description = mod:localize("mod_description"),
	is_togglable = true,
	allow_rehooking = true,
	options = {
		widgets = {
			{
				setting_id = SettingNames.EnableMod,
				type = "checkbox",
				default_value = true
			},
			{
				setting_id = SettingNames.Opacity,
				type = "numeric",
				default_value = 0.8,
				range = {0.0, 1.0},
				decimals_number = 2
			},
			{
				setting_id = SettingNames.BlockOpacity,
				type = "numeric",
				default_value = 0.8,
				range = {0.0, 1.0},
				decimals_number = 2
			},
		}
	},
}
