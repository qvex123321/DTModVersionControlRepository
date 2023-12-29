local mod = get_mod("weapon_customization")

-- ##### ┌─┐┌─┐┬─┐┌─┐┌─┐┬─┐┌┬┐┌─┐┌┐┌┌─┐┌─┐ ############################################################################
-- ##### ├─┘├┤ ├┬┘├┤ │ │├┬┘│││├─┤││││  ├┤  ############################################################################
-- ##### ┴  └─┘┴└─└  └─┘┴└─┴ ┴┴ ┴┘└┘└─┘└─┘ ############################################################################

--#region Local functions
    local math = math
    local math_abs = math.abs
    local vector3 = Vector3
    local vector3_zero = vector3.zero
    local script_unit = ScriptUnit
    local script_unit_has_extension = script_unit.has_extension
    local script_unit_extension = script_unit.extension
    local script_unit_remove_extension = script_unit.remove_extension
    local script_unit_add_extension = script_unit.add_extension
    local world = World
    local world_physics_world = world.physics_world
    local managers = Managers
    local pairs = pairs
    local class = class
    local wc_perf = wc_perf
--#endregion

-- ##### ┌┬┐┌─┐┌┬┐┌─┐ #################################################################################################
-- #####  ││├─┤ │ ├─┤ #################################################################################################
-- ##### ─┴┘┴ ┴ ┴ ┴ ┴ #################################################################################################

local REFERENCE = "weapon_customization"

mod.systems = {
    FlashlightExtension       = "flashlight_system",
    LaserPointerExtension     = "laser_pointer_system",
    BatteryExtension          = "battery_system",
    CrouchAnimationExtension  = "crouch_system",
    SwayAnimationExtension    = "sway_system",
    SightExtension            = "sight_system",
    VisibleEquipmentExtension = "visible_equipment_system",
    WeaponAnimationExtension  = "weapon_animation_system",
    DependencyExtension       = "dependency_system",
}
mod.extensions = {
    flashlight_system        = "FlashlightExtension",
    laser_pointer_system     = "LaserPointerExtension",
    battery_system           = "BatteryExtension",
    crouch_system            = "CrouchAnimationExtension",
    sway_system              = "SwayAnimationExtension",
    sight_system             = "SightExtension",
    visible_equipment_system = "VisibleEquipmentExtension",
    weapon_animation_system  = "WeaponAnimationExtension",
    dependency_system        = "DependencyExtension",
}

-- ##### ┌┐ ┌─┐┌─┐┌─┐  ┌─┐─┐ ┬┌┬┐┌─┐┌┐┌┌─┐┬┌─┐┌┐┌ #####################################################################
-- ##### ├┴┐├─┤└─┐├┤   ├┤ ┌┴┬┘ │ ├┤ │││└─┐││ ││││ #####################################################################
-- ##### └─┘┴ ┴└─┘└─┘  └─┘┴ └─ ┴ └─┘┘└┘└─┘┴└─┘┘└┘ #####################################################################

local WeaponCustomizationExtension = class("WeaponCustomizationExtension")

WeaponCustomizationExtension.perf = wc_perf

-- ##### ┌─┐┌─┐┌┬┐┬ ┬┌─┐ ##############################################################################################
-- ##### └─┐├┤  │ │ │├─┘ ##############################################################################################
-- ##### └─┘└─┘ ┴ └─┘┴   ##############################################################################################

-- Initialize
WeaponCustomizationExtension.init = function(self, extension_init_context, unit, extension_init_data)
    self.world = extension_init_context.world
    self.physics_world = self.world and world_physics_world(self.world)
    self.player = extension_init_data.player
    self.player_unit = extension_init_data.player_unit
    self.is_local_unit = extension_init_data.is_local_unit

    self.visual_loadout_extension = script_unit_extension(self.player_unit, "visual_loadout_system")
    self.fx_extension = script_unit_extension(self.player_unit, "fx_system")
    self.weapon_extension = script_unit_extension(self.player_unit, "weapon_system")
    self.unit_data = script_unit_extension(self.player_unit, "unit_data_system")
    self.character_state_extension = script_unit_extension(self.player_unit, "character_state_machine_system")
    self.first_person_extension = script_unit_extension(self.player_unit, "first_person_system")
    self.locomotion_ext = script_unit_extension(self.player_unit, "locomotion_system")

    self.first_person_unit = self.first_person_extension and self.first_person_extension:first_person_unit()
    
    self.movement_state_component = self.unit_data and self.unit_data:read_component("movement_state")
    self.alternate_fire_component = self.unit_data and self.unit_data:read_component("alternate_fire")
    self.sprint_character_state_component = self.unit_data and self.unit_data:read_component("sprint_character_state")
    self.hub_jog_character_state = self.unit_data and self.unit_data:read_component("hub_jog_character_state")

    self.event_manager = managers.event
    self.side_extension = managers.state.extension and managers.state.extension:system("side_system")

    self.sub_extensions = {}
    self.syncronized_calls = {}
    self.events = {}
end

-- Delete
WeaponCustomizationExtension.delete = function(self)
    -- Remove sub extensions
    for system, extension in pairs(self.sub_extensions) do
        mod:remove_extension(self.player_unit, system)
    end
    -- Remove events
    self:unregister_all_events()
    -- Remove synchronized calls
    self:unregister_all_synchronized_calls()
end

-- ##### ┬ ┬┌─┐┌┬┐┌─┐┌┬┐┌─┐ ###########################################################################################
-- ##### │ │├─┘ ││├─┤ │ ├┤  ###########################################################################################
-- ##### └─┘┴  ─┴┘┴ ┴ ┴ └─┘ ###########################################################################################

-- Update
WeaponCustomizationExtension.update = function(self, ...)
    local perf = wc_perf.start("WeaponCustomizationExtension.update", 2)
    for system, extension in pairs(self.sub_extensions) do
        mod:execute_extension(self.player_unit, system, "update", ...)
    end
    wc_perf.stop(perf)
end

-- ##### ┌─┐┬  ┬┌─┐┌┐┌┌┬┐┌─┐ ##########################################################################################
-- ##### ├┤ └┐┌┘├┤ │││ │ └─┐ ##########################################################################################
-- ##### └─┘ └┘ └─┘┘└┘ ┴ └─┘ ##########################################################################################

WeaponCustomizationExtension.register_event = function(self, event_name, function_name)
    self.event_manager:register(self, event_name, function_name)
    self.events[event_name] = function_name
end

WeaponCustomizationExtension.unregister_event = function(self, event_name)
    self.event_manager:unregister(self, event_name)
    self.events[event_name] = nil
end

WeaponCustomizationExtension.unregister_all_events = function(self)
    for event_name, function_name in pairs(self.events) do
        self:unregister_event(event_name)
    end
end

-- ##### ┌─┐┬ ┬┌┐┌┌─┐┬ ┬┬─┐┌─┐┌┐┌┬┌─┐┌─┐┌┬┐  ┌─┐┌─┐┬  ┬  ┌─┐ ##########################################################
-- ##### └─┐└┬┘││││  ├─┤├┬┘│ │││││┌─┘├┤  ││  │  ├─┤│  │  └─┐ ##########################################################
-- ##### └─┘ ┴ ┘└┘└─┘┴ ┴┴└─└─┘┘└┘┴└─┘└─┘─┴┘  └─┘┴ ┴┴─┘┴─┘└─┘ ##########################################################

WeaponCustomizationExtension.register_synchronized_call = function(self, function_name)
    WeaponCustomizationExtension[function_name] = function(self, ...)
        for system, extension in pairs(self.sub_extensions) do
            mod:execute_extension(self.player_unit, system, function_name, ...)
        end
    end
    self.syncronized_calls[function_name] = self[function_name]
end

WeaponCustomizationExtension.unregister_synchronized_call = function(self, function_name)
    self[function_name] = nil
    self.syncronized_calls[function_name] = nil
end

WeaponCustomizationExtension.unregister_all_synchronized_calls = function(self)
    for function_name, func in pairs(self.syncronized_calls) do
        self:unregister_synchronized_call(function_name)
    end
end

-- ##### ┌─┐┬ ┬┌┐   ┌─┐─┐ ┬┌┬┐┌─┐┌┐┌┌─┐┬┌─┐┌┐┌┌─┐ #####################################################################
-- ##### └─┐│ │├┴┐  ├┤ ┌┴┬┘ │ ├┤ │││└─┐││ ││││└─┐ #####################################################################
-- ##### └─┘└─┘└─┘  └─┘┴ └─ ┴ └─┘┘└┘└─┘┴└─┘┘└┘└─┘ #####################################################################

WeaponCustomizationExtension.add_extension = function(self, unit, system, extension_init_context, extension_init_data)
    self.sub_extensions[system] = mod:add_extension(unit, system, extension_init_context, extension_init_data)
    return self.sub_extensions[system]
end

WeaponCustomizationExtension.remove_extension = function(self, unit, system)
    self.sub_extensions[system] = nil
    return mod:remove_extension(unit, system)
end

WeaponCustomizationExtension.execute_extension = function(self, unit, system, function_name, ...)
    return mod:execute_extension(unit, system, function_name, ...)
end

-- ##### ┌─┐┌─┐┌┬┐  ┬  ┬┌─┐┬  ┬ ┬┌─┐┌─┐ ###############################################################################
-- ##### │ ┬├┤  │   └┐┌┘├─┤│  │ │├┤ └─┐ ###############################################################################
-- ##### └─┘└─┘ ┴    └┘ ┴ ┴┴─┘└─┘└─┘└─┘ ###############################################################################

WeaponCustomizationExtension.get_first_person = function(self)
    local first_person_extension = self.first_person_extension
    local common = self.initialized and (self.is_local_unit or self.spectated)
    local no_cutscene = not self.cut_scene
    local first_person = first_person_extension and first_person_extension:is_in_first_person_mode()
    return common and no_cutscene and first_person
end

WeaponCustomizationExtension.get_vectors_almost_same = function(self, v1, v2, tolerance)
    local tolerance = tolerance or .5
    local v1 = v1 or vector3_zero()
    local v2 = v2 or vector3_zero()
    if math_abs(v1[1] - v2[1]) < tolerance and math_abs(v1[2] - v2[2]) < tolerance and math_abs(v1[3] - v2[3]) < tolerance then
        return true
    end
end

-- ##### ┌─┐┬  ┌─┐┌┐ ┌─┐┬   ###########################################################################################
-- ##### │ ┬│  │ │├┴┐├─┤│   ###########################################################################################
-- ##### └─┘┴─┘└─┘└─┘┴ ┴┴─┘ ###########################################################################################

mod.add_extension = function(self, unit, system, extension_init_context, extension_init_data)
    if not script_unit_has_extension(unit, system) then
        return script_unit_add_extension(extension_init_context, unit, self.extensions[system], system, extension_init_data)
    end
end

mod.remove_extension = function(self, unit, system)
    if script_unit_has_extension(unit, system) then
		return script_unit_remove_extension(unit, system)
	end
end

mod.execute_extension = function(self, unit, system, function_name, ...)
    if script_unit_has_extension(unit, system) then
        local extension = script_unit_extension(unit, system)
        if extension[function_name] then
            return extension[function_name](extension, ...)
        end
    end
end
