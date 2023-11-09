local mod = get_mod("more_characters_and_loadouts")

local ViewElementProfilePresetsSettings = require("scripts/ui/view_elements/view_element_profile_presets/view_element_profile_presets_settings")
local MainMenuViewSettings = require("scripts/ui/views/main_menu_view/main_menu_view_settings")

mod.on_all_mods_loaded = function()
	ViewElementProfilePresetsSettings.max_profile_presets = 12
	MainMenuViewSettings.max_num_characters = 8
end
