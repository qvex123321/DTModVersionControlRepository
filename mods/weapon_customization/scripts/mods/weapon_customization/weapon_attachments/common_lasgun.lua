local mod = get_mod("weapon_customization")

-- ##### ┌┬┐┌─┐┌┬┐┌─┐ #################################################################################################
-- #####  ││├─┤ │ ├─┤ #################################################################################################
-- ##### ─┴┘┴ ┴ ┴ ┴ ┴ #################################################################################################

local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"

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

return {
    barrel_attachments = function(default)
        local attachments = {
            {id = "barrel_01", name = "Infantry Lasgun 1"},
            {id = "barrel_02", name = "Infantry Lasgun 2"},
            {id = "barrel_03", name = "Infantry Lasgun 3"},
            {id = "barrel_04", name = "Infantry Lasgun 4"},
            {id = "barrel_05", name = "Infantry Lasgun 5"},
            {id = "barrel_06", name = "Infantry Lasgun 6"},
            {id = "barrel_07", name = "Infantry Lasgun 7"},
            {id = "barrel_08", name = "Infantry Lasgun 8"},
            {id = "barrel_09", name = "Helbore Lasgun 1"},
            {id = "barrel_10", name = "Helbore Lasgun 2"},
            {id = "barrel_11", name = "Helbore Lasgun 3"},
            {id = "barrel_12", name = "Helbore Lasgun 4"},
            {id = "barrel_13", name = "Helbore Lasgun 5"},
            {id = "barrel_14", name = "Recon Lasgun 1"},
            {id = "barrel_15", name = "Recon Lasgun 2"},
            {id = "barrel_16", name = "Recon Lasgun 3"},
            {id = "barrel_17", name = "Recon Lasgun 4"},
            {id = "barrel_18", name = "Recon Lasgun 5"},
        }
        if default == nil then default = true end
        if default then return table.icombine(
            {{id = "barrel_default", name = mod:localize("mod_attachment_default")}},
            attachments)
        else return attachments end
    end,
    barrel_models = function(parent, angle, move, remove, type, no_support, automatic_equip, hide_mesh, mesh_move, special_resolve)
        if mesh_move == nil then mesh_move = false end
        return table.model_table({
            {name = "barrel_default", model = ""},
            {name = "barrel_01",      model = _item_ranged.."/barrels/lasgun_rifle_barrel_01"},
            {name = "barrel_02",      model = _item_ranged.."/barrels/lasgun_rifle_barrel_02"},
            {name = "barrel_03",      model = _item_ranged.."/barrels/lasgun_rifle_barrel_03"},
            {name = "barrel_04",      model = _item_ranged.."/barrels/lasgun_rifle_barrel_04"},
            {name = "barrel_05",      model = _item_ranged.."/barrels/lasgun_rifle_barrel_05"},
            {name = "barrel_06",      model = _item_ranged.."/barrels/lasgun_rifle_barrel_06"},
            {name = "barrel_07",      model = _item_ranged.."/barrels/lasgun_rifle_barrel_07"},
            {name = "barrel_08",      model = _item_ranged.."/barrels/lasgun_rifle_barrel_08"},
            {name = "barrel_09",      model = _item_ranged.."/barrels/lasgun_rifle_krieg_barrel_01"},
            {name = "barrel_10",      model = _item_ranged.."/barrels/lasgun_rifle_krieg_barrel_02"},
            {name = "barrel_11",      model = _item_ranged.."/barrels/lasgun_rifle_krieg_barrel_04"},
            {name = "barrel_12",      model = _item_ranged.."/barrels/lasgun_rifle_krieg_barrel_05"},
            {name = "barrel_13",      model = _item_ranged.."/barrels/lasgun_rifle_krieg_barrel_06"},
            {name = "barrel_14",      model = _item_ranged.."/barrels/lasgun_rifle_elysian_barrel_01"},
            {name = "barrel_15",      model = _item_ranged.."/barrels/lasgun_rifle_elysian_barrel_02"},
            {name = "barrel_16",      model = _item_ranged.."/barrels/lasgun_rifle_elysian_barrel_03"},
            {name = "barrel_17",      model = _item_ranged.."/barrels/lasgun_rifle_elysian_barrel_04"},
            {name = "barrel_18",      model = _item_ranged.."/barrels/lasgun_rifle_elysian_barrel_05"},
        }, parent, angle, move, remove, type or "barrel", no_support, automatic_equip, hide_mesh, mesh_move, special_resolve)
    end,
    muzzle_attachments = function(default)
        local attachments = {
            {id = "muzzle_01", name = "Infantry Lasgun 1"},
            {id = "muzzle_02", name = "Infantry Lasgun 2"},
            {id = "muzzle_03", name = "Infantry Lasgun 3"},
            {id = "muzzle_04", name = "Helbore Lasgun 1"},
            {id = "muzzle_05", name = "Helbore Lasgun 2"},
            {id = "muzzle_06", name = "Helbore Lasgun 3"},
            {id = "muzzle_07", name = "Recon Lasgun 1"},
            {id = "muzzle_08", name = "Recon Lasgun 2"},
            {id = "muzzle_09", name = "Recon Lasgun 3"},
        }
        if default == nil then default = true end
        if default then return table.icombine(
            {{id = "muzzle_default", name = mod:localize("mod_attachment_default")}},
            attachments)
        else return attachments end
    end,
    muzzle_models = function(parent, angle, move, remove, type, no_support, automatic_equip, hide_mesh, mesh_move, special_resolve)
        if mesh_move == nil then mesh_move = false end
        return table.model_table({
            {name = "muzzle_default", model = ""},
            {name = "muzzle_01",      model = _item_ranged.."/muzzles/lasgun_rifle_muzzle_01"},
            {name = "muzzle_02",      model = _item_ranged.."/muzzles/lasgun_rifle_muzzle_02"},
            {name = "muzzle_03",      model = _item_ranged.."/muzzles/lasgun_rifle_muzzle_03"},
            {name = "muzzle_04",      model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02"},
            {name = "muzzle_05",      model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_04"},
            {name = "muzzle_06",      model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_05"},
            {name = "muzzle_07",      model = _item_ranged.."/muzzles/lasgun_rifle_elysian_muzzle_01"},
            {name = "muzzle_08",      model = _item_ranged.."/muzzles/lasgun_rifle_elysian_muzzle_02"},
            {name = "muzzle_09",      model = _item_ranged.."/muzzles/lasgun_rifle_elysian_muzzle_03"},
        }, parent, angle, move, remove, type or "muzzle", no_support, automatic_equip, hide_mesh, mesh_move, special_resolve)
    end,
    rail_attachments = function(default)
        local attachments = {
            {id = "rail_01", name = "Rail 1"},
            {id = "rail_02", name = "Rail 2"},
        }
        if default == nil then default = true end
        if default then return table.icombine(
            {{id = "rail_default", name = mod:localize("mod_attachment_default")}},
            attachments)
        else return attachments end
    end,
    rail_models = function(parent, angle, move, remove, type, no_support, automatic_equip, hide_mesh, mesh_move, special_resolve)
        if mesh_move == nil then mesh_move = false end
        return table.model_table({
            {name = "rail_default", model = ""},
            {name = "rail_01",      model = _item_ranged.."/rails/lasgun_rifle_rail_01"},
            {name = "rail_02",      model = _item_ranged.."/rails/lasgun_pistol_rail_01"},
        }, parent, angle, move, remove, type or "rail", no_support, automatic_equip, hide_mesh, mesh_move, special_resolve)
    end,
    magazine_attachments = function(default)
        local attachments = {
            {id = "magazine_01", name = "Magazine 1"},
        }
        if default == nil then default = true end
        if default then return table.icombine(
            {{id = "magazine_default", name = mod:localize("mod_attachment_default")}},
            attachments)
        else return attachments end
    end,
    magazine_models = function(parent, angle, move, remove, type, no_support, automatic_equip, hide_mesh, mesh_move, special_resolve)
        if mesh_move == nil then mesh_move = false end
        return table.model_table({
            {name = "magazine_default", model = ""},
            {name = "magazine_01",      model = _item_ranged.."/magazines/lasgun_rifle_magazine_01"},
        }, parent, angle, move, remove, type or "magazine", no_support, automatic_equip, hide_mesh, mesh_move, special_resolve)
    end
}