--[[
    Author: Igromanru
    Date: 30.11.2024
    Mod Name: Transparent Shield
    Version: 1.2.0
]]
local mod = get_mod("TransparentShield")
local SettingNames = mod:io_dofile("TransparentShield/scripts/setting_names")

local cooldown = 0.0 ---@type number
local last_weapon_unit = nil ---@type Unit

---@return boolean
local function is_mod_enabled()
    return mod:get(SettingNames.EnableMod)
end

---@param is_blocking boolean? # Default: `false`
---@return number
local function get_opacity_setting(is_blocking)
    if is_blocking then
        return mod:get(SettingNames.BlockOpacity)
    end
    return mod:get(SettingNames.Opacity)
end

---@return FadeSystem?
local function get_fade_system()
    if not Managers.state or not Managers.state.extension then return nil end
    return Managers.state.extension:system("fade_system")
end

---@param opacity number? # Default value `get_opacity_setting()`. 1.0 = max visibility, 0.0 = invisible
---@return number fade_strength # 0.0 max visibility, 1.0 = invisible
local function opacity_to_fade_strength(opacity)
    opacity = opacity or get_opacity_setting()
    if type(opacity) == "number" and opacity >= 0.0 and opacity <= 1.0 then
        return 1.0 - opacity
    end
    return 0.0
end

---@param is_blocking boolean? # Default: false
---@return number fade_strength # 0.0 max visibility, 1.0 = invisible
local function get_fade_strength(is_blocking)
    return opacity_to_fade_strength(get_opacity_setting(is_blocking))
end

---@param weapon_unit Unit
---@param fade_strength number?
local function set_weapon_fade(weapon_unit, fade_strength)
    weapon_unit = weapon_unit or last_weapon_unit
    if not weapon_unit or not Unit.alive(weapon_unit) then return end

    local fade_system = get_fade_system()
    if fade_system then
        fade_strength = fade_strength or get_fade_strength()
        if fade_system._unit_to_extension_map[weapon_unit] then
            pcall(fade_system.set_min_fade, fade_system, weapon_unit, fade_strength)
        else
            local world = Managers.world:world("level_world")
            if world then
                if pcall(fade_system.on_add_extension, fade_system, world, weapon_unit) then
                    pcall(fade_system.set_min_fade, fade_system, weapon_unit, fade_strength)
                end
            end
        end
    end
end

---@param weapon_unit Unit
---@param fade_system FadeSystem?
local function remove_weapon_fade(weapon_unit, fade_system)
    if not weapon_unit or not Unit.alive(weapon_unit) then return end
    fade_system = fade_system or get_fade_system()

    if fade_system and fade_system._unit_to_extension_map[weapon_unit] then
        pcall(fade_system.on_remove_extension, fade_system, weapon_unit)
    end
end


---@return HumanPlayer?
local function get_local_player()
    if not Managers.player then return nil end
    return Managers.player:local_player_safe(1)
end

---@return Unit?
local function get_local_player_unit()
    local local_player = get_local_player()
    return local_player and local_player.player_unit
end

mod:hook_safe(CLASS.PlayerUnitWeaponExtension, "on_slot_wielded", function(self, slot_name, t, skip_wield_action)
    if not is_mod_enabled() or not self._weapons or slot_name ~= "slot_primary" or self._player ~= get_local_player() then return end

    local weapon = self._weapons[slot_name]
    if weapon and weapon.weapon_template then
        local weapon_name = weapon.weapon_template.name
        if weapon_name and string.find(string.lower(weapon_name), "slabshield") then
            last_weapon_unit = weapon.weapon_unit
            set_weapon_fade(last_weapon_unit)
        end
    end
end)

---@param setting_id string
function mod.on_setting_changed(setting_id)
    if is_mod_enabled() then
        set_weapon_fade(last_weapon_unit)
    elseif setting_id == SettingNames.EnableMod then
        remove_weapon_fade(last_weapon_unit)
    end
end

---@param dt number # delta time
function mod.update(dt)
    if cooldown > 0 then
        cooldown = cooldown - dt
    else
        cooldown = 0.25
        if is_mod_enabled() then
            local local_player_unit = get_local_player_unit()
            if local_player_unit then
                local unit_data_system_ext = ScriptUnit.has_extension(local_player_unit, "unit_data_system")
                if unit_data_system_ext then
                    local block_component = unit_data_system_ext:read_component("block")
                    local fade_value = get_fade_strength(block_component and block_component.is_blocking)
                    set_weapon_fade(last_weapon_unit, fade_value)
                end
            end
        end
    end
end
