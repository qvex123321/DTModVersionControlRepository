local mod = get_mod("weapon_customization")

-- ##### ┬─┐┌─┐┌─┐ ┬ ┬┬┬─┐┌─┐ #########################################################################################
-- ##### ├┬┘├┤ │─┼┐│ ││├┬┘├┤  #########################################################################################
-- ##### ┴└─└─┘└─┘└└─┘┴┴└─└─┘ #########################################################################################

local _common = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/common")
local _common_melee = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/common_melee")

-- ##### ┌┬┐┌─┐┌┬┐┌─┐ #################################################################################################
-- #####  ││├─┤ │ ├─┤ #################################################################################################
-- ##### ─┴┘┴ ┴ ┴ ┴ ┴ #################################################################################################

local _item = "content/items/weapons/player"
local _item_melee = _item.."/melee"

-- ##### ┌─┐┌─┐┬─┐┌─┐┌─┐┬─┐┌┬┐┌─┐┌┐┌┌─┐┌─┐ ############################################################################
-- ##### ├─┘├┤ ├┬┘├┤ │ │├┬┘│││├─┤││││  ├┤  ############################################################################
-- ##### ┴  └─┘┴└─└  └─┘┴└─┴ ┴┴ ┴┘└┘└─┘└─┘ ############################################################################

--#region local functions
    local string = string
    local string_find = string.find
    local vector3_box = Vector3Box
    local table = table
    local pairs = pairs
    local ipairs = ipairs
    local type = type
--#endregion

-- ##### ┌─┐┬ ┬┌┐┌┌─┐┌┬┐┬┌─┐┌┐┌┌─┐ ####################################################################################
-- ##### ├┤ │ │││││   │ ││ ││││└─┐ ####################################################################################
-- ##### └  └─┘┘└┘└─┘ ┴ ┴└─┘┘└┘└─┘ ####################################################################################

local functions = {
    grip_attachments = function(default)
        local attachments = {
            {id = "knife_grip_01",      name = "Combat Knife 1"},
            {id = "knife_grip_02",      name = "Combat Knife 2"},
            {id = "knife_grip_03",      name = "Combat Knife 3"},
            {id = "knife_grip_04",      name = "Combat Knife 4"},
            {id = "knife_grip_05",      name = "Combat Knife 5"},
            {id = "knife_grip_06",      name = "Combat Knife 6"},
            {id = "knife_grip_07",      name = "Combat Knife 7"},
        }
        if default == nil then default = true end
        if default then return table.icombine(
            {{id = "knife_grip_default", name = mod:localize("mod_attachment_default")}},
            attachments)
        else return attachments end
    end,
    grip_models = function(parent, angle, move, remove, type, no_support, automatic_equip, hide_mesh, mesh_move, special_resolve)
        if mesh_move == nil then mesh_move = false end
        return table.model_table({
            {name = "knife_grip_default", model = ""},
            {name = "knife_grip_01",      model = _item_melee.."/grips/combat_knife_grip_01"},
            {name = "knife_grip_02",      model = _item_melee.."/grips/combat_knife_grip_02"},
            {name = "knife_grip_03",      model = _item_melee.."/grips/combat_knife_grip_03"},
            {name = "knife_grip_04",      model = _item_melee.."/grips/combat_knife_grip_04"},
            {name = "knife_grip_05",      model = _item_melee.."/grips/combat_knife_grip_05"},
            {name = "knife_grip_06",      model = _item_melee.."/grips/combat_knife_grip_06"},
            {name = "knife_grip_07",      model = _item_melee.."/grips/combat_knife_grip_07"},
        }, parent, angle, move, remove, type or "grip", no_support, automatic_equip, hide_mesh, mesh_move, special_resolve)
    end,
    body_attachments = function(default)
        local attachments = {
            {id = "knife_body_01",      name = "Combat Knife 1"},
            {id = "knife_body_02",      name = "Combat Knife 2"},
            {id = "knife_body_03",      name = "Combat Knife 3"},
            {id = "knife_body_04",      name = "Combat Knife 4"},
            {id = "knife_body_05",      name = "Combat Knife 5"},
            {id = "knife_body_06",      name = "Combat Knife 6"},
            {id = "knife_body_07",      name = "Combat Knife 7"},
        }
        if default == nil then default = true end
        if default then return table.icombine(
            {{id = "knife_body_default", name = mod:localize("mod_attachment_default")}},
            attachments)
        else return attachments end
    end,
    body_models = function(parent, angle, move, remove, type, no_support, automatic_equip, hide_mesh, mesh_move, special_resolve)
        if mesh_move == nil then mesh_move = false end
        return table.model_table({
            {name = "knife_body_default", model = ""},
            {name = "knife_body_01",      model = _item_melee.."/blades/combat_knife_blade_01"},
            {name = "knife_body_02",      model = _item_melee.."/blades/combat_knife_blade_02"},
            {name = "knife_body_03",      model = _item_melee.."/blades/combat_knife_blade_03"},
            {name = "knife_body_04",      model = _item_melee.."/blades/combat_knife_blade_04"},
            {name = "knife_body_05",      model = _item_melee.."/blades/combat_knife_blade_05"},
            {name = "knife_body_06",      model = _item_melee.."/blades/combat_knife_blade_06"},
            {name = "knife_body_07",      model = _item_melee.."/blades/combat_knife_blade_07"},
        }, parent, angle, move, remove, type or "body", no_support, automatic_equip, hide_mesh, mesh_move, special_resolve)
    end,
}

-- ##### ┌┬┐┌─┐┌─┐┬┌┐┌┬┌┬┐┬┌─┐┌┐┌┌─┐ ##################################################################################
-- #####  ││├┤ ├┤ │││││ │ ││ ││││└─┐ ##################################################################################
-- ##### ─┴┘└─┘└  ┴┘└┘┴ ┴ ┴└─┘┘└┘└─┘ ##################################################################################

return table.combine(
    functions,
    {
        attachments = {
            trinket_hook = _common.trinket_hook_attachments(),
            emblem_right = _common.emblem_right_attachments(),
            emblem_left = _common.emblem_left_attachments(),
            grip = functions.grip_attachments(),
            body = functions.body_attachments(),
        },
        models = table.combine(
            _common.emblem_right_models("head", 0, vector3_box(0, 0, 0), vector3_box(0, 0, 0)),
            _common.emblem_left_models("head", -3, vector3_box(0, 0, 0), vector3_box(0, 0, 0)),
            _common.trinket_hook_models(nil, 0, vector3_box(0, 0, 0), vector3_box(0, 0, 0)),
            functions.grip_models(nil, 0, vector3_box(0, 0, 0), vector3_box(0, 0, -.2)),
            functions.body_models(nil, 0, vector3_box(0, 0, 0), vector3_box(0, 0, .2))
        ),
        anchors = {

        },
    }
)