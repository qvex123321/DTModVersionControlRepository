local mod = get_mod("weapon_customization")

-- ##### ┬─┐┌─┐┌─┐ ┬ ┬┬┬─┐┌─┐ #########################################################################################
-- ##### ├┬┘├┤ │─┼┐│ ││├┬┘├┤  #########################################################################################
-- ##### ┴└─└─┘└─┘└└─┘┴┴└─└─┘ #########################################################################################

local ScriptCamera = mod:original_require("scripts/foundation/utilities/script_camera")
local Crouch = mod:original_require("scripts/extension_systems/character_state_machine/character_states/utilities/crouch")
local Recoil = mod:original_require("scripts/utilities/recoil")
local ScriptViewport = mod:original_require("scripts/foundation/utilities/script_viewport")
local ScriptWorld = mod:original_require("scripts/foundation/utilities/script_world")

-- ##### ┌─┐┌─┐┬─┐┌─┐┌─┐┬─┐┌┬┐┌─┐┌┐┌┌─┐┌─┐ ############################################################################
-- ##### ├─┘├┤ ├┬┘├┤ │ │├┬┘│││├─┤││││  ├┤  ############################################################################
-- ##### ┴  └─┘┴└─└  └─┘┴└─┴ ┴┴ ┴┘└┘└─┘└─┘ ############################################################################

--#region Local functions
    local Unit = Unit
    local math = math
    local type = type
    local table = table
    local World = World
    local pairs = pairs
    local CLASS = CLASS
    local class = class
    local Camera = Camera
    local vector3 = Vector3
    local wc_perf = wc_perf
    local math_rad = math.rad
    local managers = Managers
    local Viewport = Viewport
    local Matrix4x4 = Matrix4x4
    local math_lerp = math.lerp
    local Quaternion = Quaternion
    local unit_alive = Unit.alive
    local math_clamp = math.clamp
    local vector3_box = Vector3Box
    local script_unit = ScriptUnit
    local vector3_zero = vector3.zero
    local vector3_lerp = vector3.lerp
    local math_clamp01 = math.clamp01
    local unit_get_data = Unit.get_data
    local table_contains = table.contains
    local vector3_unbox = vector3_box.unbox
    local math_easeInCubic = math.easeInCubic
    local ShadingEnvironment = ShadingEnvironment
    local matrix4x4_transform = Matrix4x4.transform
    local camera_vertical_fov = Camera.vertical_fov
    local unit_world_position = Unit.world_position
    local unit_local_position = Unit.local_position
    local unit_local_rotation = Unit.local_rotation
    local quaternion_matrix4x4 = Quaternion.matrix4x4
    local unit_set_local_scale = Unit.set_local_scale
    local camera_world_position = Camera.world_position
    local script_unit_extension = script_unit.extension
    local world_create_particles = World.create_particles
    local camera_set_vertical_fov = Camera.set_vertical_fov
    local unit_set_local_position = Unit.set_local_position
    local unit_set_local_rotation = Unit.set_local_rotation
    local world_destroy_particles = World.destroy_particles
    local unit_set_unit_visibility = Unit.set_unit_visibility
    local script_unit_has_extension = script_unit.has_extension
    local camera_custom_vertical_fov = Camera.custom_vertical_fov
    local world_stop_spawning_particles = World.stop_spawning_particles
    local shading_environment_set_scalar = ShadingEnvironment.set_scalar
    local camera_set_custom_vertical_fov = Camera.set_custom_vertical_fov
    local world_update_unit_and_children = World.update_unit_and_children
    local quaternion_from_euler_angles_xyz = Quaternion.from_euler_angles_xyz
--#endregion

-- ##### ┌┬┐┌─┐┌┬┐┌─┐ #################################################################################################
-- #####  ││├─┤ │ ├─┤ #################################################################################################
-- ##### ─┴┘┴ ┴ ┴ ┴ ┴ #################################################################################################

local REFERENCE = "weapon_customization"
local EFFECT_OPTION = "mod_option_scopes_particle"
local EFFECT = "content/fx/particles/screenspace/screen_ogryn_dash"
local SOUND_OPTION = "mod_option_scopes_sound"
local SOUND = "wwise/events/weapon/play_lasgun_p3_mag_button"
-- local SIGHT_A = "#ID[7abb5fc7a4e06dcb]"
-- local SIGHT_B = "#ID[21bfd951c3d1b9fe]"
-- local LENS_A = "#ID[827a5604cb4ec7ff]"
-- local LENS_B = "#ID[c54f4d16d170cfdb]"

local SIGHT = "sight_2"
local LENS_A = "lens"
local LENS_B = "lens_2"
local SCOPE_OFFSET = "scope_offset"
local NO_SCOPE_OFFSET = "no_scope_offset"
local SLOT_SECONDARY = "slot_secondary"
local SLOT_UNARMED = "slot_unarmed"

-- ##### ┌─┐┬┌─┐┬ ┬┌┬┐┌─┐  ┌─┐─┐ ┬┌┬┐┌─┐┌┐┌┌─┐┬┌─┐┌┐┌ #################################################################
-- ##### └─┐││ ┬├─┤ │ └─┐  ├┤ ┌┴┬┘ │ ├┤ │││└─┐││ ││││ #################################################################
-- ##### └─┘┴└─┘┴ ┴ ┴ └─┘  └─┘┴ └─ ┴ └─┘┘└┘└─┘┴└─┘┘└┘ #################################################################

local SightExtension = class("SightExtension", "WeaponCustomizationExtension")

-- ##### ┌─┐┌─┐┌┬┐┬ ┬┌─┐ ##############################################################################################
-- ##### └─┐├┤  │ │ │├─┘ ##############################################################################################
-- ##### └─┘└─┘ ┴ └─┘┴   ##############################################################################################

SightExtension.init = function(self, extension_init_context, unit, extension_init_data)
    SightExtension.super.init(self, extension_init_context, unit, extension_init_data)

    self.wielded_slot = extension_init_data.wielded_slot or SLOT_UNARMED
    self.ranged_weapon = extension_init_data.ranged_weapon
    self.is_starting_aim = nil
    self._is_aiming = nil
    self.aim_timer = nil
    self.position_offset = nil
    self.rotation_offset = nil
    self.default_vertical_fov = nil
    self.vertical_fov = nil
    self.default_custom_vertical_fov = nil
    self.custom_vertical_fov = nil
    self.offset = nil
    self.sights = {}
    self.lenses = {}
    self.sniper_recoil_template = nil
    self.sniper_sway_template = nil

    managers.event:register(self, "weapon_customization_settings_changed", "on_settings_changed")
    managers.event:register(self, "weapon_customization_update_zoom", "update_zoom")

    self:on_settings_changed()
    self:set_weapon_values()
    
    self.initialized = true
end

SightExtension.delete = function(self)
    managers.event:unregister(self, "weapon_customization_settings_changed")
    managers.event:unregister(self, "weapon_customization_update_zoom")
    self.initialized = false
    self.offset = vector3_zero()
    SightExtension.super.delete(self)
end

-- ##### ┌─┐┬ ┬┌┐┌┌─┐┌┬┐┬┌─┐┌┐┌┌─┐ ####################################################################################
-- ##### ├┤ │ │││││   │ ││ ││││└─┐ ####################################################################################
-- ##### └  └─┘┘└┘└─┘ ┴ ┴└─┘┘└┘└─┘ ####################################################################################

SightExtension.is_braced = function(self)
    -- Check cache
    if self._is_braced == nil then
        -- Get value
        local template = self.ranged_weapon.weapon_template
        local alt_fire = template and template.alternate_fire_settings
        self._is_braced = alt_fire and alt_fire.start_anim_event == "to_braced"
    end
    -- Return cache
    return self._is_braced
end

SightExtension.is_hiding_crosshair = function(self)
    -- Check cache
    -- if self._is_hiding_crosshair == nil then
    -- Get value
    local laser = self.deactivate_crosshair_laser and mod:execute_extension(self.player_unit, "laser_pointer_system", "is_active")
    local sniper_or_scope = self:is_sniper() or self:is_scope()
    local aiming = self.deactivate_crosshair_aiming and self._is_aiming and sniper_or_scope
    self._is_hiding_crosshair = laser or aiming
    -- end
    -- Return cache
    return self._is_hiding_crosshair
end

SightExtension.is_aiming = function(self)
    return self.alternate_fire_component and self.alternate_fire_component.is_active
end

SightExtension.is_scope = function(self)
    -- Check cache
    if self._is_scope == nil then
        -- Get value
        self._is_scope = table_contains(mod.reflex_sights, self.sight_name)
    end
    -- Return cache
    return self._is_scope
end

SightExtension.is_sight = function(self)
    return not self:is_scope() and not self:is_sniper()
end

SightExtension.is_sniper = function(self)
    -- Check cache
    if self._is_sniper == nil then
        -- Get value
        self._is_sniper = table_contains(mod.scopes, self.sight_name) and not self:is_braced()
    end
    -- Return cache
    return self._is_sniper
end

SightExtension.is_sniper_or_scope = function(self)
    return self:is_scope() or self:is_sniper()
end

SightExtension.is_wielded = function(self)
    return self.wielded_slot and self.wielded_slot.name == SLOT_SECONDARY
end

-- ##### ┌┬┐┌─┐┌┬┐┬ ┬┌─┐┌┬┐┌─┐ ########################################################################################
-- ##### │││├┤  │ ├─┤│ │ ││└─┐ ########################################################################################
-- ##### ┴ ┴└─┘ ┴ ┴ ┴└─┘─┴┘└─┘ ########################################################################################

SightExtension.set_spectated = function(self, spectated)
    self.spectated = spectated
end

SightExtension.set_aiming = function(self, aiming, t)
    if aiming and not self._is_aiming then
        self:on_aim_start(t)
    elseif not aiming and self._is_aiming then
        self:on_aim_stop(t)
    end
end

SightExtension.set_lens_scales = function(self)
    local lens_2 = mod:_apply_anchor_fixes(self.ranged_weapon.item, "lens_2")
    local lens = mod:_apply_anchor_fixes(self.ranged_weapon.item, "lens")
    self.lens_scales = {
        lens_2 and lens_2.scale or vector3_box(vector3_zero()),
        lens and lens.scale or vector3_box(vector3_zero()),
    }
end

SightExtension.set_weapon_values = function(self)
    self.is_starting_aim = nil
    self._is_aiming = nil
    self.aim_timer = nil
    self.position_offset = nil
    self.rotation_offset = nil
    self.default_vertical_fov = nil
    self.vertical_fov = nil
    self.default_custom_vertical_fov = nil
    self.custom_vertical_fov = nil
    self.sights = {
        mod:_recursive_find_attachment(self.ranged_weapon.item.attachments, "sight"),
        mod:_recursive_find_attachment(self.ranged_weapon.item.attachments, "sight_2"),
    }
    self.lenses = {
        mod:_recursive_find_attachment(self.ranged_weapon.item.attachments, "scope_lens_01"),
        mod:_recursive_find_attachment(self.ranged_weapon.item.attachments, "scope_lens_02"),
    }
    self:set_lens_units()
    -- self.sight_unit = mod:get_attachment_slot_in_attachments(self.ranged_weapon)
    self.sight = self.sights[2] or self.sights[1] --self:get_sight()
    self.sight_name = self.sights[1] and mod:item_name_from_content_string(self.sights[1].item)
    self.offset = nil
    if self:is_scope() or self:is_sniper() then
        self:set_sight_offset()
    elseif self:is_sight() then
        self:set_sight_offset(NO_SCOPE_OFFSET)
    end
    self.sniper_zoom = nil
    if self:is_sniper() then
        self.sniper_zoom = mod.sniper_zoom_levels[self.sight_name] or 7
        self:set_sniper_scope_unit()
    end
    self:set_lens_scales()
    self.start_time = self.ranged_weapon.weapon_template.actions.action_zoom
        and self.ranged_weapon.weapon_template.actions.action_zoom.total_time
        or self.ranged_weapon.weapon_template.actions.action_wield.total_time
    self.reset_time = self.ranged_weapon.weapon_template.actions.action_unzoom 
        and self.ranged_weapon.weapon_template.actions.action_unzoom.total_time
        or self.ranged_weapon.weapon_template.actions.action_wield.total_time
end

SightExtension.set_sight_offset = function(self, offset_type)
    local offset_type = offset_type or "scope_offset"
    local anchor = mod.anchors[self.ranged_weapon.weapon_template.name]
    local sight_offset = anchor and anchor[offset_type]
    self.offset = mod:_apply_anchor_fixes(self.ranged_weapon.item, offset_type) or sight_offset or vector3_zero()
end

SightExtension.set_sniper_scope_unit = function(self)
    if self.ranged_weapon.attachment_units then
        self.sniper_scope_unit = self:is_sniper() and mod:get_attachment_slot_in_attachments(self.ranged_weapon.attachment_units, "sight")
    end
end

SightExtension.set_lens_units = function(self)
    local reflex = {}
    mod:_recursive_find_unit_by_slot(self.ranged_weapon.weapon_unit, SIGHT, reflex)
    if #reflex >= 1 then
        local lenses = {}
        mod:_recursive_find_unit_by_slot(self.ranged_weapon.weapon_unit, LENS_A, lenses)
        mod:_recursive_find_unit_by_slot(self.ranged_weapon.weapon_unit, LENS_B, lenses)
        if #lenses >= 2 then
            local scope_sight = mod:_apply_anchor_fixes(self.ranged_weapon.item, "sight_2")
            self.default_reticle_position = scope_sight and scope_sight.position
            if unit_get_data(lenses[1], "lens") == 2 then
                self.lens_units = {lenses[1], lenses[2], reflex[1]}
            else
                self.lens_units = {lenses[2], lenses[1], reflex[1]}
            end
            unit_set_unit_visibility(reflex[1], false)
        end
    end
end

SightExtension.set_default_fov = function(self, default_vertical_fov, default_custom_vertical_fov)
    if not self.default_vertical_fov then self.default_vertical_fov = default_vertical_fov end
    if not self.default_custom_vertical_fov then self.default_custom_vertical_fov = default_custom_vertical_fov end
end

-- ##### ┌─┐┬  ┬┌─┐┌┐┌┌┬┐┌─┐ ##########################################################################################
-- ##### ├┤ └┐┌┘├┤ │││ │ └─┐ ##########################################################################################
-- ##### └─┘ └┘ └─┘┘└┘ ┴ └─┘ ##########################################################################################

SightExtension.on_aim_start = function(self, t)
    if self:is_wielded() then
        self._is_hiding_crosshair = nil
        self.is_starting_aim = true
        self._is_aiming = true
        self.aim_timer = t + self.start_time
        if self.sniper_zoom and self.lens_units then
            if self.lens_units[1] and unit_alive(self.lens_units[1]) and self.fx_extension and self.sniper_sound then
                self.fx_extension:trigger_wwise_event(SOUND, false, self.lens_units[1], 1)
            end
        end
    end
end

SightExtension.on_equip_slot = function(self, slot)
    self._is_aiming = nil
    self._is_scope = nil
    self._is_sniper = nil
    self._is_braced = nil
    self.sniper_recoil_template = nil
    self.sniper_sway_template = nil
end

SightExtension.on_wield_slot = function(self, slot)
    self._is_braced = nil
    self._is_scope = nil
    self._is_sniper = nil
    self.wielded_slot = slot
    if self._is_aiming then
        self._is_aiming = nil
        self.aim_timer = mod:game_time() + self.reset_time
    end
end

SightExtension.on_aim_stop = function(self, t)
    if self:is_wielded() then
        self._is_hiding_crosshair = nil
        self.is_starting_aim = nil
        self._is_aiming = nil
        self.aim_timer = t + self.reset_time
        if self.particle_effect then
            if self.particle_effect > 0 then
                world_stop_spawning_particles(self.world, self.particle_effect)
                world_destroy_particles(self.world, self.particle_effect)
            end
            self.particle_effect = nil
        end
    end
end

SightExtension.on_unaim_start = function(self, t)
    if self:is_wielded() then
        self._is_hiding_crosshair = nil
        self.is_starting_aim = nil
        self._is_aiming = nil
        self.aim_timer = t + self.reset_time
    end
end

SightExtension.on_settings_changed = function(self)
    self.reticle_size = mod:get("mod_option_scopes_reticle_size")
    self.sniper_sound = mod:get("mod_option_scopes_sound")
    self.sniper_effect = mod:get("mod_option_scopes_particle")
    self.deactivate_crosshair_laser = mod:get("mod_option_deactivate_crosshair_laser")
    self.deactivate_crosshair_aiming = mod:get("mod_option_deactivate_crosshair_aiming")
    self.scopes_recoil = mod:get("mod_option_scopes_recoil")
    self.scopes_sway = mod:get("mod_option_scopes_sway")
    self.weapon_dof = mod:get("mod_option_misc_weapon_dof")
    self.sniper_recoil_template = nil
    self.sniper_sway_template = nil
end

-- ##### ┬ ┬┌─┐┌┬┐┌─┐┌┬┐┌─┐ ###########################################################################################
-- ##### │ │├─┘ ││├─┤ │ ├┤  ###########################################################################################
-- ##### └─┘┴  ─┴┘┴ ┴ ┴ └─┘ ###########################################################################################

SightExtension.update = function(self, unit, dt, t)
    local perf = wc_perf.start("SightExtension.update", 2)
    if self.initialized then
        -- local rotation = self.lens_units[3] and unit_local_rotation(self.lens_units[3], 1)

        if self.sniper_zoom and self.lens_units and self.lens_units[3] and self.default_reticle_position
                and not self.is_starting_aim and not self._is_aiming then
            local default_offset = vector3_unbox(self.default_reticle_position)
            unit_set_local_position(self.lens_units[3], 1, default_offset)
        end

        if self.is_starting_aim then
            if self.aim_timer and t <= self.aim_timer then
                local time_in_action = math_clamp01(self.start_time - (self.aim_timer - t))
                local progress = time_in_action / self.start_time
                local anim_progress = math.ease_sine(progress)
                if self.sniper_zoom and self.default_vertical_fov and self.default_custom_vertical_fov then
                    local apply_fov = math_rad(self.sniper_zoom)
                    self.custom_vertical_fov = math_lerp(self.default_custom_vertical_fov, apply_fov, anim_progress)
                    self.vertical_fov = math_lerp(self.default_vertical_fov, apply_fov, anim_progress)
                end
                if self.offset then
                    if self.offset.position then
                        local position = vector3_lerp(vector3_zero(), vector3_unbox(self.offset.position), anim_progress)
                        self.position_offset = vector3_box(position)
                        if self.sniper_zoom and self.lens_units and self.lens_units[3] and self.default_reticle_position then
                            local default_offset = vector3_unbox(self.default_reticle_position)
                            local rotation = unit_local_rotation(self.lens_units[3], 1)
                            local forward = Quaternion.forward(rotation)
                            local max = forward * 1
                            local current_reticle_offset = max - (forward * self.reticle_size)
                            local reticle_offset = vector3_lerp(default_offset, default_offset + current_reticle_offset, anim_progress)
                            unit_set_local_position(self.lens_units[3], 1, reticle_offset)
                            unit_set_unit_visibility(self.lens_units[3], true)
                        end
                    end
                    if self.offset.rotation then
                        local rotation = vector3_lerp(vector3_zero(), vector3_unbox(self.offset.rotation), anim_progress)
                        self.rotation_offset = vector3_box(rotation)
                    end
                end
            elseif self.aim_timer and t > self.aim_timer then
                self.is_starting_aim = nil
                if self.sniper_zoom then
                    if self.sniper_zoom and self.lens_units and self.lens_units[3] and self.default_reticle_position then
                        local default_offset = vector3_unbox(self.default_reticle_position)
                        local rotation = unit_local_rotation(self.lens_units[3], 1)
                        local forward = Quaternion.forward(rotation)
                        local max = forward * 1
                        local current_reticle_offset = max - (forward * self.reticle_size)
                        unit_set_local_position(self.lens_units[3], 1, default_offset + current_reticle_offset)
                    end
                    local apply_fov = math_rad(self.sniper_zoom)
                    self.custom_vertical_fov = apply_fov
                    self.vertical_fov = apply_fov
                end
                if self.offset then
                    if self.offset.position then self.position_offset = self.offset.position end
                    if self.offset.rotation then self.rotation_offset = self.offset.rotation end
                end
                self.aim_timer = nil
            end
        else
            if self.aim_timer and t <= self.aim_timer then
                local time_in_action = math_clamp01(self.reset_time - (self.aim_timer - t))
                local progress = time_in_action / self.reset_time
                local anim_progress = math.ease_sine(progress)
                if self.sniper_zoom and self.default_vertical_fov and self.default_custom_vertical_fov then
                    local apply_fov = math_rad(self.sniper_zoom)
                    self.custom_vertical_fov = math_lerp(apply_fov, self.default_custom_vertical_fov, anim_progress)
                    self.vertical_fov = math_lerp(apply_fov, self.default_vertical_fov, anim_progress)
                end
                if self.offset then
                    if self.offset.position then
                        local position = vector3_lerp(vector3_unbox(self.offset.position), vector3_zero(), anim_progress)
                        self.position_offset = vector3_box(position)
                        if self.sniper_zoom and self.lens_units and self.lens_units[3] and self.default_reticle_position then
                            local default_offset = vector3_unbox(self.default_reticle_position)
                            local rotation = unit_local_rotation(self.lens_units[3], 1)
                            local forward = Quaternion.forward(rotation)
                            local max = forward * 1
                            local current_reticle_offset = max - (forward * self.reticle_size)
                            local reticle_offset = vector3_lerp(default_offset + current_reticle_offset, default_offset, anim_progress)
                            unit_set_local_position(self.lens_units[3], 1, reticle_offset)
                        end
                    end
                    if self.offset.rotation then
                        local rotation = vector3_lerp(vector3_unbox(self.offset.rotation), vector3_zero(), anim_progress)
                        self.rotation_offset = vector3_box(rotation)
                    end
                end
            elseif self.aim_timer and t > self.aim_timer then
                if self.sniper_zoom and self.lens_units and self.lens_units[3] and self.default_reticle_position then
                    local default_offset = vector3_unbox(self.default_reticle_position)
                    unit_set_unit_visibility(self.lens_units[3], false)
                    unit_set_local_position(self.lens_units[3], 1, default_offset)
                end
                self.custom_vertical_fov = nil
                self.vertical_fov = nil
                self.position_offset = nil
                self.rotation_offset = nil
                self.aim_timer = nil
            end
        end

        self:update_scope_lenses()
    end
    wc_perf.stop(perf)
end

SightExtension.update_position_and_rotation = function(self)
    if self:get_first_person() then
        if self.position_offset and self.first_person_unit and unit_alive(self.first_person_unit) then
            local position = unit_local_position(self.first_person_unit, 1)
            local rotation = unit_local_rotation(self.first_person_unit, 1)
            local mat = quaternion_matrix4x4(rotation)
            local rotated_pos = matrix4x4_transform(mat, vector3_unbox(self.position_offset))
            unit_set_local_position(self.first_person_unit, 1, position - rotated_pos)
            world_update_unit_and_children(self.world, self.first_person_unit)
        end

        if self.rotation_offset then
            local weapon_unit = self.ranged_weapon.weapon_unit
            if weapon_unit and unit_alive(weapon_unit) then
                local rot = vector3_unbox(self.rotation_offset)
                local rotation = quaternion_from_euler_angles_xyz(rot[1], rot[2], rot[3])
                unit_set_local_rotation(weapon_unit, 1, rotation)
            end
        end
    end
end

SightExtension.update_scope_lenses = function(self)
    local scales = {vector3_zero(), vector3_zero()}
    if not self._is_aiming and self.aim_timer == nil and self.lens_scales then
        scales = {
            self.lens_scales[1] and vector3_unbox(self.lens_scales[1]) or vector3_zero(),
            self.lens_scales[2] and vector3_unbox(self.lens_scales[2]) or vector3_zero(),
        }
    end
    if self.sniper_zoom and self.lens_units then
        if self.lens_units[1] and unit_alive(self.lens_units[1]) then
            unit_set_local_scale(self.lens_units[1], 1, scales[1])
        end
        if self.lens_units[2] and unit_alive(self.lens_units[2]) then
            unit_set_local_scale(self.lens_units[2], 1, scales[2])
        end
    elseif self.sniper_zoom and not self.lens_units then
        self:set_lens_units()
    end
    if self.sniper_effect and self:get_first_person() and self._is_aiming and self.sniper_zoom then
        if not self.particle_effect then
            self.particle_effect = world_create_particles(self.world, EFFECT, vector3(0, 0, 1))
        end
    elseif self.particle_effect then
        if self.particle_effect > 0 then
            world_stop_spawning_particles(self.world, self.particle_effect)
            world_destroy_particles(self.world, self.particle_effect)
        end
        self.particle_effect = nil
    end
end

SightExtension.update_zoom = function(self)
    if self.initialized and self:get_first_person() then
        local viewport = ScriptWorld.viewport(self.world, self.player.viewport_name)
        local camera = viewport and ScriptViewport.camera(viewport)
        if camera then
            self:set_default_fov(camera_vertical_fov(camera), camera_custom_vertical_fov(camera))
            if self.custom_vertical_fov then camera_set_custom_vertical_fov(camera, self.custom_vertical_fov) end
            if self.vertical_fov then camera_set_vertical_fov(camera, self.vertical_fov) end
        end
    end
end

-- SightExtension.apply_weapon_dof = function(self, shading_env)
--     local scale = 5
--     local is_aiming = self:is_aiming()
--     local is_sniper_or_scope = self:is_sniper_or_scope()
--     local scale = (is_aiming and not is_sniper_or_scope and .5) or (is_aiming and is_sniper_or_scope and 2.5) or 3.5

--     ShadingEnvironment.set_scalar(shading_env, "dof_enabled", 1)
--     ShadingEnvironment.set_scalar(shading_env, "dof_focal_distance", .5)
--     ShadingEnvironment.set_scalar(shading_env, "dof_focal_region", 50)
--     ShadingEnvironment.set_scalar(shading_env, "dof_focal_region_start", -1)
--     ShadingEnvironment.set_scalar(shading_env, "dof_focal_region_end", 49)
--     ShadingEnvironment.set_scalar(shading_env, "dof_focal_near_scale", scale)
--     ShadingEnvironment.set_scalar(shading_env, "dof_focal_far_scale", .5)
-- end




-- mod:hook(CLASS.CameraManager, "shading_callback", function(func, self, world, shading_env, viewport, default_shading_environment_resource, ...)
--     -- Original function
--     local camera_data = self._viewport_camera_data[viewport] or self._viewport_camera_data[Viewport.get_data(viewport, "overridden_viewport")]
--     -- Extensions
--     if self._world == world then
--         -- local camera_shading_env_settings = camera_data.shading_environment
--         local viewport_name = Viewport.get_data(viewport, "name")
--         local camera_nodes = self._camera_nodes[viewport_name]
--         local current_node = self:_current_node(camera_nodes)
--         local root_unit = current_node:root_unit()
--         -- Sight
--         mod:execute_extension(root_unit, "sight_system", "apply_weapon_dof", shading_env)
--         -- local scale = 5
--         -- local is_aiming = mod:execute_extension(root_unit, "sight_system", "is_aiming")
--         -- local is_sniper_or_scope = mod:execute_extension(root_unit, "sight_system", "is_sniper_or_scope")
--         -- local scale = (is_aiming and not is_sniper_or_scope and .5) or (is_aiming and is_sniper_or_scope and 2.5) or 3.5

-- 		-- -- if camera_shading_env_settings.dof_enabled then
--         -- shading_environment_set_scalar(shading_env, "dof_enabled", 1)
--         -- shading_environment_set_scalar(shading_env, "dof_focal_distance", .5)
--         -- shading_environment_set_scalar(shading_env, "dof_focal_region", 40)
--         -- shading_environment_set_scalar(shading_env, "dof_focal_region_start", -1)
--         -- shading_environment_set_scalar(shading_env, "dof_focal_region_end", 39)
--         -- shading_environment_set_scalar(shading_env, "dof_focal_near_scale", scale)
--         -- shading_environment_set_scalar(shading_env, "dof_focal_far_scale", .5)
--         -- end
--     end
-- end)

-- ##### ┬─┐┌─┐┌─┐┌─┐┬┬    ┌─┐┌┐┌┌┬┐  ┌─┐┬ ┬┌─┐┬ ┬ ####################################################################
-- ##### ├┬┘├┤ │  │ │││    ├─┤│││ ││  └─┐│││├─┤└┬┘ ####################################################################
-- ##### ┴└─└─┘└─┘└─┘┴┴─┘  ┴ ┴┘└┘─┴┘  └─┘└┴┘┴ ┴ ┴  ####################################################################

SightExtension.get_sniper_sway_template = function(self, sway_template)
    if not self.sniper_sway_template and sway_template and self:is_sniper() then
        self.sniper_sway_template = table.clone(sway_template)
        for state, data in pairs(self.sniper_sway_template) do
            if data.max_sway then
                for angle_name, value in pairs(data.max_sway) do
                    local sway_state = self.sniper_sway_template[state]
                    local max_sway = sway_state.max_sway[angle_name]
                    self.sniper_sway_template[state].max_sway[angle_name] = value * self.scopes_sway
                end
            end
            if data.continuous_sway then
                for angle_name, value in pairs(data.continuous_sway) do
                    local sway_state = self.sniper_sway_template[state]
                    local continuous_sway = sway_state.continuous_sway[angle_name]
                    self.sniper_sway_template[state].continuous_sway[angle_name] = value * self.scopes_sway
                end
            end
        end
        return self.sniper_sway_template
    elseif self.sniper_sway_template and not self:is_sniper() then
        self.sniper_sway_template = nil
    elseif self.sniper_sway_template and self:is_sniper() and self._is_aiming then
        return self.sniper_sway_template
    end
    return sway_template
end

SightExtension.get_sniper_recoil_template = function(self, recoil_template)
    if not self.sniper_recoil_template and recoil_template and self:is_sniper() then
        self.sniper_recoil_template = table.clone(recoil_template)
        for state, data in pairs(self.sniper_recoil_template) do
            if data.offset_range then
                for offset_data_i, offset_data in pairs(data.offset_range) do
                    if offset_data.pitch then
                        for value_i, value in pairs(offset_data.pitch) do
                            local recoil_state = self.sniper_recoil_template[state]
                            local offset_range = recoil_state.offset_range[offset_data_i]
                            local pitch_value = offset_range.pitch[value_i]
                            self.sniper_recoil_template[state].offset_range[offset_data_i].pitch[value_i] = value * self.scopes_recoil
                        end
                    end
                end
            end
        end
        return self.sniper_recoil_template
    elseif self.sniper_recoil_template and not self:is_sniper() then
        self.sniper_recoil_template = nil
    elseif self.sniper_recoil_template and self:is_sniper() and self._is_aiming then
        return self.sniper_recoil_template
    end
    return recoil_template
end

return SightExtension
