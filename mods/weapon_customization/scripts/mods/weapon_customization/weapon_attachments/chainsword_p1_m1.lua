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
            {id = "chain_sword_grip_01",      name = "Grip 1"},
            {id = "chain_sword_grip_02",      name = "Grip 2"},
            {id = "chain_sword_grip_03",      name = "Grip 3"},
            {id = "chain_sword_grip_04",      name = "Grip 4"},
            {id = "chain_sword_grip_05",      name = "Grip 5"},
            {id = "chain_sword_grip_06",      name = "Grip 6"},
            {id = "chain_sword_grip_07",      name = "Grip 7"},
            {id = "chain_sword_grip_08",      name = "Grip 8"},
        }
        if default == nil then default = true end
        if default then return table.icombine(
            {{id = "chain_sword_grip_default", name = mod:localize("mod_attachment_default")}},
            attachments)
        else return attachments end
    end,
    grip_models = function(parent, angle, move, remove, type, no_support, automatic_equip, hide_mesh, mesh_move, special_resolve)
        if mesh_move == nil then mesh_move = false end
        return table.model_table({
            {name = "chain_sword_grip_default", model = ""},
            {name = "chain_sword_grip_01",      model = _item_melee.."/grips/chain_sword_grip_01"},
            {name = "chain_sword_grip_02",      model = _item_melee.."/grips/chain_sword_grip_02"},
            {name = "chain_sword_grip_03",      model = _item_melee.."/grips/chain_sword_grip_03"},
            {name = "chain_sword_grip_04",      model = _item_melee.."/grips/chain_sword_grip_04"},
            {name = "chain_sword_grip_05",      model = _item_melee.."/grips/chain_sword_grip_05"},
            {name = "chain_sword_grip_06",      model = _item_melee.."/grips/chain_sword_grip_06"},
            {name = "chain_sword_grip_07",      model = _item_melee.."/grips/chain_sword_grip_07"},
            {name = "chain_sword_grip_08",      model = _item_melee.."/grips/chain_sword_grip_08"},
        }, parent, angle, move, remove, type or "grip", no_support, automatic_equip, hide_mesh, mesh_move, special_resolve)
    end,
    body_attachments = function(default)
        local attachments = {
            {id = "chain_sword_body_01",      name = "Body 1"},
            {id = "chain_sword_body_02",      name = "Body 2"},
            {id = "chain_sword_body_03",      name = "Body 3"},
            {id = "chain_sword_body_04",      name = "Body 4"}, --buggy
            {id = "chain_sword_body_05",      name = "Body 5"}, --buggy
            {id = "chain_sword_body_06",      name = "Body 6"},
            {id = "chain_sword_body_07",      name = "Body 7"},
            {id = "chain_sword_body_08",      name = "Body 8"},
            {id = "chain_sword_body_09",      name = "Body 9"},
        }
        if default == nil then default = true end
        if default then return table.icombine(
            {{id = "chain_sword_body_default", name = mod:localize("mod_attachment_default")}},
            attachments)
        else return attachments end
    end,
    body_models = function(parent, angle, move, remove, type, no_support, automatic_equip, hide_mesh, mesh_move, special_resolve)
        if mesh_move == nil then mesh_move = false end
        return table.model_table({
            {name = "chain_sword_body_default", model = ""},
            {name = "chain_sword_body_01",      model = _item_melee.."/full/chain_sword_full_01"},
            {name = "chain_sword_body_02",      model = _item_melee.."/full/chain_sword_full_02"},
            {name = "chain_sword_body_03",      model = _item_melee.."/full/chain_sword_full_03"},
            {name = "chain_sword_body_04",      model = _item_melee.."/full/chain_sword_full_04"},
            {name = "chain_sword_body_05",      model = _item_melee.."/full/chain_sword_full_05"},
            {name = "chain_sword_body_06",      model = _item_melee.."/full/chain_sword_full_06"},
            {name = "chain_sword_body_07",      model = _item_melee.."/full/chain_sword_full_07"},
            {name = "chain_sword_body_08",      model = _item_melee.."/full/chain_sword_full_08"},
            {name = "chain_sword_body_09",      model = _item_melee.."/full/chain_sword_full_09"},
        }, parent, angle, move, remove, type or "body", no_support, automatic_equip, hide_mesh, mesh_move, special_resolve)
    end,
    chain_attachments = function(default)
        local attachments = {
            {id = "chain_sword_chain_01",      name = "Chain 1"},
        }
        if default == nil then default = true end
        if default then return table.icombine(
            {{id = "chain_sword_chain_default", name = mod:localize("mod_attachment_default")}},
            attachments)
        else return attachments end
    end,
    chain_models = function(parent, angle, move, remove, type, no_support, automatic_equip, hide_mesh, mesh_move, special_resolve)
        if mesh_move == nil then mesh_move = false end
        return table.model_table({
            {name = "chain_sword_chain_default", model = ""},
            {name = "chain_sword_chain_01",      model = _item_melee.."/chains/chain_sword_chain_01"},
        }, parent, angle, move, remove, type or "chain", no_support, automatic_equip, hide_mesh, mesh_move, special_resolve)
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
            chain = functions.chain_attachments(),
        },
        models = table.combine(
            _common.emblem_right_models("head", 0, vector3_box(0, 0, 0), vector3_box(0, 0, 0)),
            _common.emblem_left_models("head", -3, vector3_box(0, 0, 0), vector3_box(0, 0, 0)),
            _common.trinket_hook_models(nil, 0, vector3_box(0, 0, 0), vector3_box(0, 0, 0)),
            functions.chain_models(nil, 0, vector3_box(0, 0, 0), vector3_box(0, 0, 0)),
            functions.body_models(nil, 0, vector3_box(0, 0, 0), vector3_box(0, 0, .2)),
            functions.grip_models(nil, 0, vector3_box(0, 0, 0), vector3_box(0, 0, -.2))
        ),
        anchors = {

        },
    }
)