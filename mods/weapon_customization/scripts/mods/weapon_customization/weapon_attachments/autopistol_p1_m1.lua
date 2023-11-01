local mod = get_mod("weapon_customization")

-- ##### ┬─┐┌─┐┌─┐ ┬ ┬┬┬─┐┌─┐ #########################################################################################
-- ##### ├┬┘├┤ │─┼┐│ ││├┬┘├┤  #########################################################################################
-- ##### ┴└─└─┘└─┘└└─┘┴┴└─└─┘ #########################################################################################

local _common = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/common")
local _common_ranged = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/common_ranged")

-- ##### ┌┬┐┌─┐┌┬┐┌─┐ #################################################################################################
-- #####  ││├─┤ │ ├─┤ #################################################################################################
-- ##### ─┴┘┴ ┴ ┴ ┴ ┴ #################################################################################################

local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

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

local tv = function(t, i)
    local res = nil
    if type(t) == "table" then
        if #t >= i then
            res = t[i]
        elseif #t >= 1 then
            res = t[1]
        else
            return nil
        end
    else
        res = t
    end
    if res == "" then
        return nil
    end
    return res
end
table.combine = function(...)
    local arg = {...}
    local combined = {}
    for _, t in ipairs(arg) do
        for name, value in pairs(t) do
            combined[name] = value
        end
    end
    return combined
end
table.icombine = function(...)
    local arg = {...}
    local combined = {}
    for _, t in ipairs(arg) do
        for _, value in pairs(t) do
            combined[#combined+1] = value
        end
    end
    return combined
end

local functions = {
    receiver_attachments = function()
        return {
            {id = "receiver_default",   name = mod:localize("mod_attachment_default")},
            {id = "receiver_01",        name = "Receiver 1"},
            {id = "receiver_02",        name = "Receiver 2"},
            {id = "receiver_03",        name = "Receiver 3"},
            {id = "receiver_04",        name = "Receiver 4"},
            {id = "receiver_05",        name = "Receiver 2"},
        }
    end,
    receiver_models = function(parent, angle, move, remove)
        local a = angle or 0
        local m = move or vector3_box(0, 0, 0)
        local r = remove or vector3_box(0, 0, 0)
        return {
            receiver_default = {model = "",                                                    type = "receiver", parent = tv(parent, 1), angle = a, move = m, remove = r},
            receiver_01 =      {model = _item_ranged.."/recievers/autogun_pistol_receiver_01", type = "receiver", parent = tv(parent, 2), angle = a, move = m, remove = r},
            receiver_05 =      {model = _item_ranged.."/recievers/autogun_pistol_receiver_05", type = "receiver", parent = tv(parent, 3), angle = a, move = m, remove = r},
            receiver_02 =      {model = _item_ranged.."/recievers/autogun_pistol_receiver_02", type = "receiver", parent = tv(parent, 4), angle = a, move = m, remove = r},
            receiver_03 =      {model = _item_ranged.."/recievers/autogun_pistol_receiver_03", type = "receiver", parent = tv(parent, 5), angle = a, move = m, remove = r},
            receiver_04 =      {model = _item_ranged.."/recievers/autogun_pistol_receiver_04", type = "receiver", parent = tv(parent, 6), angle = a, move = m, remove = r},
        }
    end,
    barrel_attachments = function()
        return {
            {id = "barrel_default", name = mod:localize("mod_attachment_default")},
            {id = "barrel_01",      name = "Barrel 1"},
            {id = "barrel_02",      name = "Barrel 2"},
            {id = "barrel_03",      name = "Barrel 3"},
            {id = "barrel_04",      name = "Barrel 4"},
            {id = "barrel_05",      name = "Barrel 5"},
        }
    end,
    barrel_models = function(parent, angle, move, remove)
        local a = angle or 0
        local m = move or vector3_box(0, 0, 0)
        local r = remove or vector3_box(0, 0, 0)
        return {
            barrel_default = {model = "",                                                type = "barrel", parent = tv(parent, 1), angle = a, move = m, remove = r, mesh_move = false},
            barrel_01 =      {model = _item_ranged.."/barrels/autogun_pistol_barrel_01", type = "barrel", parent = tv(parent, 2), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = {trinket_hook = "trinket_hook_empty"}, no_support = {"trinket_hook"}},
            barrel_02 =      {model = _item_ranged.."/barrels/autogun_pistol_barrel_02", type = "barrel", parent = tv(parent, 3), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = {trinket_hook = "trinket_hook_empty"}, no_support = {"trinket_hook"}},
            barrel_03 =      {model = _item_ranged.."/barrels/autogun_pistol_barrel_03", type = "barrel", parent = tv(parent, 4), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = {trinket_hook = "trinket_hook_01"}, no_support = {"trinket_hook_empty"}},
            barrel_04 =      {model = _item_ranged.."/barrels/autogun_pistol_barrel_04", type = "barrel", parent = tv(parent, 5), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = {trinket_hook = "trinket_hook_empty"}, no_support = {"trinket_hook"}},
            barrel_05 =      {model = _item_ranged.."/barrels/autogun_pistol_barrel_05", type = "barrel", parent = tv(parent, 6), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = {trinket_hook = "trinket_hook_empty"}, no_support = {"trinket_hook"}},
        }
    end,
    magazine_attachments = function()
        return {
            -- {id = "magazine_default",   name = mod:localize("mod_attachment_default"),       sounds = {UISoundEvents.apparel_equip}},
            {id = "auto_pistol_magazine_01",        name = "Magazine 1"},
        }
    end,
    magazine_models = function(parent, angle, move, remove)
        local a = angle or 0
        local m = move or vector3_box(0, 0, 0)
        local r = remove or vector3_box(0, 0, 0)
        return {
            magazine_default =        {model = "",                                                    type = "magazine", parent = tv(parent, 1), angle = a, move = m, remove = r, mesh_move = false},
            auto_pistol_magazine_01 = {model = _item_ranged.."/magazines/autogun_pistol_magazine_01", type = "magazine", parent = tv(parent, 2), angle = a, move = m, remove = r, mesh_move = false},
        }
    end,
    muzzle_attachments = function()
        return {
            {id = "muzzle_default", name = mod:localize("mod_attachment_default")},
            {id = "muzzle_01",      name = "Autopistol Muzzle A"},
            {id = "muzzle_02",      name = "Autopistol Muzzle B"},
            {id = "muzzle_03",      name = "Autopistol Muzzle C"},
            {id = "muzzle_04",      name = "Autopistol Muzzle D"},
            {id = "muzzle_05",      name = "Autopistol Muzzle E"},
        }
    end,
    muzzle_models = function(parent, angle, move, remove)
        local a = angle or 0
        local m = move or vector3_box(0, 0, 0)
        local r = remove or vector3_box(0, 0, 0)
        return {
            muzzle_default = {model = "",                                                type = "muzzle", parent = tv(parent, 1), angle = a, move = m, remove = r},
            muzzle_01 =      {model = _item_ranged.."/muzzles/autogun_pistol_muzzle_01", type = "muzzle", parent = tv(parent, 2), angle = a, move = m, remove = r},
            muzzle_02 =      {model = _item_ranged.."/muzzles/autogun_pistol_muzzle_02", type = "muzzle", parent = tv(parent, 3), angle = a, move = m, remove = r},
            muzzle_03 =      {model = _item_ranged.."/muzzles/autogun_pistol_muzzle_03", type = "muzzle", parent = tv(parent, 4), angle = a, move = m, remove = r},
            muzzle_04 =      {model = _item_ranged.."/muzzles/autogun_pistol_muzzle_04", type = "muzzle", parent = tv(parent, 5), angle = a, move = m, remove = r},
            muzzle_05 =      {model = _item_ranged.."/muzzles/autogun_pistol_muzzle_05", type = "muzzle", parent = tv(parent, 6), angle = a, move = m, remove = r},
        }
    end,
    sight_attachments = function()
        return {
            {id = "sight_01",       name = "Sight 1"},
        }
    end,
    sight_models = function(parent, angle, move, remove, type)
        local a = angle or 0
        local m = move or vector3_box(0, 0, 0)
        local r = remove or vector3_box(0, 0, 0)
        local t = type or "sight"
        return {
            sight_default = {model = "",                                              type = t, parent = tv(parent, 1), angle = a, move = m, remove = r},
            sight_01 =      {model = _item_ranged.."/sights/autogun_pistol_sight_01", type = t, parent = tv(parent, 2), angle = a, move = m, remove = r},
        }
    end,
}

return table.combine(
    functions,
    {
        attachments = { -- Done 12.9.2023
            flashlight = _common_ranged.flashlights_attachments(),
            trinket_hook = _common.trinket_hook_attachments(),
            grip = _common_ranged.grip_attachments(),
            stock = _common_ranged.stock_attachments(),
            bayonet = _common_ranged.bayonet_attachments(),
            emblem_right = _common.emblem_right_attachments(),
            emblem_left = _common.emblem_left_attachments(),
            receiver = functions.receiver_attachments(),
            barrel = functions.barrel_attachments(),
            magazine = table.icombine(
                {{id = "magazine_default", name = mod:localize("mod_attachment_default")}},
                _common_ranged.magazine_attachments()
            ),
            muzzle = functions.muzzle_attachments(),
            sight_2 = table.icombine(
                _common_ranged.sight_default(),
                functions.sight_attachments(),
                _common_ranged.reflex_sights_attachments(),
                _common_ranged.sights_attachments()
            ),
        },
        models = table.combine( -- Done 12.9.2023
            _common_ranged.flashlight_models(nil, -2.5, vector3_box(0, -3, 0), vector3_box(.2, 0, 0)),
            _common.emblem_right_models("receiver", -3, vector3_box(0, -4, 0), vector3_box(.2, 0, 0)),
            _common.emblem_left_models("receiver", 0, vector3_box(0, -4, 0), vector3_box(-.2, 0, 0)),
            _common_ranged.bayonet_models({"barrel", "barrel", "barrel", "muzzle"}, -.5, vector3_box(.3, -4, 0), vector3_box(0, .4, -.034)),
            _common_ranged.grip_models(nil, -.1, vector3_box(-.3, -4, 0), vector3_box(0, -.1, -.1)),
            _common_ranged.stock_models("receiver", 0, vector3_box(-.4, -4, 0), vector3_box(0, -.2, 0)),
            _common.trinket_hook_models("barrel", -.2, vector3_box(.1, -4, .2), vector3_box(0, 0, -.2)),
            functions.receiver_models(nil, 0, vector3_box(0, 0, 0), vector3_box(0, 0, -.00001)),
            functions.barrel_models(nil, -.5, vector3_box(.2, -2, 0), vector3_box(0, .2, 0)),
            -- functions.magazine_models(nil, 0, vector3_box(0, -3, .1), vector3_box(0, 0, -.2)),
            functions.muzzle_models(nil, -.5, vector3_box(.2, -2, 0), vector3_box(0, .2, 0)),
            functions.sight_models("receiver", -.5, vector3_box(-.3, -4, -.2), vector3_box(0, -.2, 0)),
            _common_ranged.reflex_sights_models("receiver", -.5, vector3_box(-.3, -4, -.2), vector3_box(0, -.2, 0), "sight_2", {}, {
                {rail = "rail_default"},
                {rail = "rail_01"},
                {rail = "rail_01"},
                {rail = "rail_01"},
            }),
            _common_ranged.magazine_models(nil, 0, vector3_box(0, -3, .1), vector3_box(0, 0, -.2)),
            _common_ranged.sights_models("receiver", -.5, vector3_box(-.3, -4, -.2), vector3_box(0, -.2, 0))
        ),
        anchors = { -- Done 12.9.2023
            fixes = {
                {dependencies = {"grip_27|grip_28|grip_29"}, -- Grip
                    grip = {offset = true, position = vector3_box(0, .01, -.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"laser_pointer"}, -- Laser Pointer
                    flashlight = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"reflex_sight_01"}, -- Sight
                    sight = {offset = true, position = vector3_box(0, -.05, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"reflex_sight_02"}, -- Sight
                    sight = {offset = true, position = vector3_box(0, -.05, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"reflex_sight_03"}, -- Sight
                    sight = {offset = true, position = vector3_box(0, -.05, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"magazine_01"}, -- Magazine
                    magazine = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, .6, 1)}},
                {dependencies = {"magazine_02"}, -- Magazine
                    magazine = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, .6, 1)}},
                {dependencies = {"magazine_03"}, -- Magazine
                    magazine = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, .6, 1)}},
                {dependencies = {"magazine_04"}, -- Magazine
                    magazine = {offset = true, position = vector3_box(0, 0, -.06), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, .6, .6)}},
                {dependencies = {"emblem_left_02"}, -- Emblem
                    emblem_left = {parent = "receiver", position = vector3_box(-.0257, .08, .09), rotation = vector3_box(0, 10, 180), scale = vector3_box(1, -1, 1)}},
                {emblem_left = {parent = "receiver", position = vector3_box(-.0257, .08, .09), rotation = vector3_box(0, 10, 180), scale = vector3_box(1, 1, 1)}},
                {stock = {parent = "receiver", position = vector3_box(0, -.095, .065), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"barrel_01", "autogun_bayonet_01"}, -- Bayonet
                    bayonet = {parent = "barrel", position = vector3_box(0, .105, -.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"barrel_01", "autogun_bayonet_02"}, -- Bayonet
                    bayonet = {parent = "barrel", position = vector3_box(0, .105, -.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"muzzle_01", "autogun_bayonet_03"}, -- Bayonet
                    bayonet = {parent = "muzzle", position = vector3_box(0, .009, -.0275), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"barrel_02", "autogun_bayonet_01"}, -- Bayonet
                    bayonet = {parent = "barrel", position = vector3_box(0, .105, -.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"barrel_02", "autogun_bayonet_02"}, -- Bayonet
                    bayonet = {parent = "barrel", position = vector3_box(0, .105, -.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"muzzle_02", "autogun_bayonet_03"}, -- Bayonet
                    bayonet = {parent = "muzzle", position = vector3_box(0, .02, -.0275), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"barrel_03", "autogun_bayonet_01"}, -- Bayonet
                    bayonet = {parent = "barrel", position = vector3_box(0, .13, -.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"barrel_03", "autogun_bayonet_02"}, -- Bayonet
                    bayonet = {parent = "barrel", position = vector3_box(0, .13, -.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"muzzle_03", "autogun_bayonet_03"}, -- Bayonet
                    bayonet = {parent = "muzzle", position = vector3_box(0, .009, -.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"barrel_04", "autogun_bayonet_01"}, -- Bayonet
                    bayonet = {parent = "barrel", position = vector3_box(0, .14, -.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"barrel_04", "autogun_bayonet_02"}, -- Bayonet
                    bayonet = {parent = "barrel", position = vector3_box(0, .14, -.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"muzzle_04", "autogun_bayonet_03"}, -- Bayonet
                    bayonet = {parent = "muzzle", position = vector3_box(0, .009, -.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"barrel_05", "autogun_bayonet_01"}, -- Bayonet
                    bayonet = {parent = "barrel", position = vector3_box(0, .14, -.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"barrel_05", "autogun_bayonet_02"}, -- Bayonet
                    bayonet = {parent = "barrel", position = vector3_box(0, .14, -.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                {dependencies = {"muzzle_05", "autogun_bayonet_03"}, -- Bayonet
                    bayonet = {parent = "muzzle", position = vector3_box(0, .052, -.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
            },
        },
    }
)