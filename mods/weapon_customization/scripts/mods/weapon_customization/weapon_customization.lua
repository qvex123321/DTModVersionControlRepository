local mod = get_mod("weapon_customization")

-- ##### ┌┬┐┌─┐┌┬┐┌─┐ #################################################################################################
-- #####  ││├─┤ │ ├─┤ #################################################################################################
-- ##### ─┴┘┴ ┴ ┴ ┴ ┴ #################################################################################################

local REFERENCE = "weapon_customization"

-- Persistent values
mod:persistent_table(REFERENCE, {
	flashlight_on = false,
	laser_pointer_on = 0,
	spawned_lasers = {},
	item_definitions = nil,
	player_equipment = {},
	attachment_slot_infos = {},
	loaded_packages = {
		visible_equipment = {},
		view_weapon_sounds = {},
		needed = {},
	},
	used_packages = {
		visible_equipment = {},
		view_weapon_sounds = {},
		needed = {},
		attachments = {},
	},
	input_hooked = false,
	weapon_templates = {},
})
mod.was_third_person = nil

-- ##### ┌─┐┌─┐┬─┐┌─┐┌─┐┬─┐┌┬┐┌─┐┌┐┌┌─┐┌─┐ ############################################################################
-- ##### ├─┘├┤ ├┬┘├┤ │ │├┬┘│││├─┤││││  ├┤  ############################################################################
-- ##### ┴  └─┘┴└─└  └─┘┴└─┴ ┴┴ ┴┘└┘└─┘└─┘ ############################################################################

--#region local functions
	local script_unit = ScriptUnit
	local managers = Managers
	local CLASS = CLASS
--#endregion

-- ##### ┌┬┐┌─┐┌┬┐  ┌─┐┬  ┬┌─┐┌┐┌┌┬┐┌─┐ ###############################################################################
-- ##### ││││ │ ││  ├┤ └┐┌┘├┤ │││ │ └─┐ ###############################################################################
-- ##### ┴ ┴└─┘─┴┘  └─┘ └┘ └─┘┘└┘ ┴ └─┘ ###############################################################################

-- Gamestate changed
function mod.on_game_state_changed(status, state_name)
	-- Reset flashlight state
	mod:reset_flashlight()
	mod:reset_laser_pointer()
	mod:recharge_battery()
	-- mod:release_slot_packages()
	mod:release_non_essential_packages()
end

-- Mod settings changed
function mod.on_setting_changed(setting_id)
	-- Update mod settings
	mod.update_option(setting_id)
	-- Update flashlight
	if setting_id == "mod_option_flashlight_shadows" or setting_id == "mod_option_flashlight_flicker" then
		if mod:has_flashlight_attachment() then mod:toggle_flashlight(true) end
		if mod:has_laser_pointer_attachment() then mod:toggle_laser(true) end
	end
	if setting_id == "mod_option_laser_pointer_wild" or setting_id == "mod_option_laser_pointer_weapon_dot" or setting_id == "mod_option_laser_pointer_weapon_flash" then
		if mod:has_laser_pointer_attachment() then mod:toggle_laser(true) end
	end
	if setting_id == "mod_option_visible_equipment" then
		mod:update_equipment_visibility()
	end
	if setting_id == "mod_option_visible_equipment" then
		mod.visible_equipment = mod:get("mod_option_visible_equipment")
	end
	if setting_id == "mod_option_visible_equipment_sounds" then
		mod.visible_equipment_sounds = mod:get("mod_option_visible_equipment_sounds")
	end
	if setting_id == "mod_option_visible_equipment_own_sounds_fp" then
		mod.visible_equipment_sounds_fp = mod:get("mod_option_visible_equipment_own_sounds_fp")
	end
	-- Debug
	mod._debug = mod:get("mod_option_debug")
end

-- Update loop
function mod.update(main_dt)
	mod:update_flicker()
	mod:update_battery()
	mod:update_equipment(main_dt)
	-- mod:update_crouch_aim()
end

function mod.on_all_mods_loaded()
	mod:recreate_hud()
end

-- ##### ┬ ┬┌─┐┌─┐┬┌─┌─┐ ##############################################################################################
-- ##### ├─┤│ ││ │├┴┐└─┐ ##############################################################################################
-- ##### ┴ ┴└─┘└─┘┴ ┴└─┘ ##############################################################################################

-- Player visual extension initialized
mod:hook(CLASS.PlayerUnitVisualLoadoutExtension, "extensions_ready", function(func, self, world, unit, ...)
	func(self, world, unit, ...)
	-- Initialize
	mod:init()
	-- Update used packages
    mod:update_modded_packages()
end)

-- Player visual extension destroyed
mod:hook(CLASS.PlayerUnitVisualLoadoutExtension, "destroy", function(func, self, ...)
	if self._unit == mod.player_unit then
		-- Set reinitialization
		mod.initialized = false
	end
	return func(self, ...)
end)

mod:hook(CLASS.PlayerUnitFirstPersonExtension, "_update_first_person_mode", function(func, self, t, ...)
	local show_1p_equipment, wants_1p_camera = func(self, t, ...)
	if mod.initialized then
		-- Update flashlight / laser pointer
		if mod:has_flashlight_attachment() then mod:update_flashlight_view() end
		if mod:has_laser_pointer_attachment() then mod:update_laser_pointer() end
		-- mod:daemon_host_update(t)
		-- Cache values
		mod.was_third_person = mod:_is_in_third_person()
		mod.last_character_state = mod:_character_state()
	end
	return show_1p_equipment, wants_1p_camera
end)

-- Update flashlight state
mod:hook(CLASS.InventoryView, "on_exit", function(func, self, ...)
	func(self, ...)
	-- Update flashlight
	if mod._update_flashlight then
		if mod:has_flashlight_attachment() then mod:toggle_flashlight(true) end
		if mod:has_laser_pointer_attachment() then mod:toggle_laser(true) end
	end
end)

-- ##### ┬┌┐┌┬┌┬┐┬┌─┐┬  ┬┌─┐┌─┐ #######################################################################################
-- ##### │││││ │ │├─┤│  │┌─┘├┤  #######################################################################################
-- ##### ┴┘└┘┴ ┴ ┴┴ ┴┴─┘┴└─┘└─┘ #######################################################################################

mod.init = function(self)
	self.ui_manager = managers.ui
	self.player_manager = managers.player
	self.package_manager = managers.package
	self.player = self.player_manager:local_player(1)
	self.peer_id = self.player:peer_id()
	self.local_player_id = self.player:local_player_id()
	self.player_unit = self.player.player_unit
	self.fx_extension = script_unit.extension(self.player_unit, "fx_system")
	self.weapon_extension = script_unit.extension(self.player_unit, "weapon_system")
	self.character_state_machine_extension = script_unit.extension(self.player_unit, "character_state_machine_system")
	self.unit_data = script_unit.extension(self.player_unit, "unit_data_system")
	self.visual_loadout_extension = script_unit.extension(self.player_unit, "visual_loadout_system")
	self.inventory_component = self.unit_data:read_component("inventory")
	self.first_person_component = self.unit_data:read_component("first_person")
	self.first_person_extension = script_unit.extension(self.player_unit, "first_person_system")
	self.first_person_unit = self.first_person_extension:first_person_unit()
	self.time_manager = managers.time
	self.initialized = true
	self._next_check_at_t = 0
	self:print("Initialized")
end

-- Import mod files
-- mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_customization_crouch_aim")
-- mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_customization_bolt_pistol")
mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_customization_gear")
mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_customization_utilities")
mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_customization_visible_equipment")
mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_customization_flashlight")
mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_customization_laser_pointer")
mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_customization_daemon_host")
mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_customization_visual_loadout")
mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_customization_fix")
mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_customization_anchors")
mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_customization_debug")
mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_customization_patch")
mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_customization_sights")
mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_customization_view")
mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_customization_mod_options")

-- Reinitialize on mod reload
if managers and managers.player._game_state ~= nil then
	mod:init()
	mod:setup_item_definitions()
end

mod:load_needed_packages()
-- mod:find_attachment_entries()
