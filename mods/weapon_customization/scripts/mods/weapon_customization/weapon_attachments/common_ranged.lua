local mod = get_mod("weapon_customization")

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

return {
    flashlights_attachments = function()
        return {
            {id = "default",       name = mod:localize("mod_attachment_default"),},
            {id = "flashlight_01", name = mod:localize("mod_attachment_flashlight_01")},
            {id = "flashlight_02", name = mod:localize("mod_attachment_flashlight_02")},
            {id = "flashlight_03", name = mod:localize("mod_attachment_flashlight_03")},
            {id = "flashlight_04", name = mod:localize("mod_attachment_flashlight_04")},
            {id = "laser_pointer", name = mod:localize("mod_attachment_laser_pointer")},
        }
    end,
    flashlight_models = function(parent, angle, move, remove, mesh_move)
        local a = angle or 0
        local m = move or vector3_box(0, 0, 0)
        local r = remove or vector3_box(0, 0, 0)
        return {
            default =       {model = "",                                         type = "flashlight", parent = tv(parent, 1), angle = a, move = tv(m, 1), remove = tv(r, 1), mesh_move = false},
            flashlight_01 = {model = _item_ranged.."/flashlights/flashlight_01", type = "flashlight", parent = tv(parent, 2), angle = a, move = tv(m, 2), remove = tv(r, 2), mesh_move = false},
            flashlight_02 = {model = _item_ranged.."/flashlights/flashlight_02", type = "flashlight", parent = tv(parent, 3), angle = a, move = tv(m, 3), remove = tv(r, 3), mesh_move = false},
            flashlight_03 = {model = _item_ranged.."/flashlights/flashlight_03", type = "flashlight", parent = tv(parent, 4), angle = a, move = tv(m, 4), remove = tv(r, 4), mesh_move = false},
            flashlight_04 = {model = _item_ranged.."/flashlights/flashlight_05", type = "flashlight", parent = tv(parent, 5), angle = a, move = tv(m, 5), remove = tv(r, 5), mesh_move = false},
            laser_pointer = {model = _item_ranged.."/flashlights/flashlight_05", type = "flashlight", parent = tv(parent, 6), angle = a, move = tv(m, 6), remove = tv(r, 6), mesh_move = false},
        }
    end,
    grip_attachments = function()
        return {
            {id = "grip_default", name = mod:localize("mod_attachment_default")},
            {id = "grip_01", name = "Grip 1"},
            {id = "grip_02", name = "Grip 2"},
            {id = "grip_03", name = "Grip 3"},
            {id = "grip_04", name = "Grip 4"},
            {id = "grip_05", name = "Grip 5"},
            {id = "grip_06", name = "Autogun 1"},
            {id = "grip_07", name = "Autogun 2"},
            {id = "grip_08", name = "Autogun 3"},
            {id = "grip_09", name = "Braced Autogun 1"},
            {id = "grip_10", name = "Braced Autogun 2"},
            {id = "grip_11", name = "Braced Autogun 3"},
            {id = "grip_12", name = "Headhunter Autogun"},
            {id = "grip_13", name = "Boltgun 1"},
            {id = "grip_14", name = "Boltgun 2"},
            {id = "grip_15", name = "Boltgun 3"},
            {id = "grip_19", name = "Laspistol 1"},
            {id = "grip_20", name = "Laspistol 2"},
            {id = "grip_21", name = "Laspistol 3"},
            {id = "grip_22", name = "Lasgun 1"},
            {id = "grip_23", name = "Lasgun 2"},
            {id = "grip_24", name = "Lasgun 3"},
            {id = "grip_25", name = "Lasgun 4"},
            {id = "grip_26", name = "Lasgun 5"},
            {id = "grip_27", name = "Flamer 1"},
            {id = "grip_28", name = "Flamer 2"},
            {id = "grip_29", name = "Flamer 3"},
            {id = "grip_30", name = "Boltgun Pistol 1"},
            {id = "grip_31", name = "Braced Autogun 4"},
            {id = "grip_32", name = "Braced Autogun 5"},
            {id = "grip_33", name = "Laspistol 4"},
        }
    end,
    grip_models = function(parent, angle, move, remove, type, no_support, automatic_equip)
        local a = angle or 0
        local m = move or vector3_box(0, 0, 0)
        local r = remove or vector3_box(0, 0, 0)
        local t = type or "grip"
        local n = no_support or {}
        local ae = automatic_equip or {}
        return {
            grip_default = {model = "",                                                    type = t, parent = tv(parent, 1), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 1), no_support = tv(n, 1)},
            grip_01 =      {model = _item_ranged.."/grips/grip_01",                        type = t, parent = tv(parent, 2), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 2), no_support = tv(n, 2)},
            grip_02 =      {model = _item_ranged.."/grips/grip_02",                        type = t, parent = tv(parent, 3), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 3), no_support = tv(n, 3)},
            grip_03 =      {model = _item_ranged.."/grips/grip_03",                        type = t, parent = tv(parent, 4), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 4), no_support = tv(n, 4)},
            grip_04 =      {model = _item_ranged.."/grips/grip_04",                        type = t, parent = tv(parent, 5), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 5), no_support = tv(n, 5)},
            grip_05 =      {model = _item_ranged.."/grips/grip_05",                        type = t, parent = tv(parent, 6), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 6), no_support = tv(n, 6)},
            grip_06 =      {model = _item_ranged.."/grips/autogun_rifle_grip_01",          type = t, parent = tv(parent, 7), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 7), no_support = tv(n, 7)},
            grip_07 =      {model = _item_ranged.."/grips/autogun_rifle_grip_02",          type = t, parent = tv(parent, 8), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 8), no_support = tv(n, 8)},
            grip_08 =      {model = _item_ranged.."/grips/autogun_rifle_grip_03",          type = t, parent = tv(parent, 9), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 9), no_support = tv(n, 9)},
            grip_09 =      {model = _item_ranged.."/grips/autogun_rifle_grip_ak_01",       type = t, parent = tv(parent, 10), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 10), no_support = tv(n, 10)},
            grip_10 =      {model = _item_ranged.."/grips/autogun_rifle_grip_ak_02",       type = t, parent = tv(parent, 11), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 11), no_support = tv(n, 11)},
            grip_11 =      {model = _item_ranged.."/grips/autogun_rifle_grip_ak_03",       type = t, parent = tv(parent, 12), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 12), no_support = tv(n, 12)},
            grip_12 =      {model = _item_ranged.."/grips/autogun_rifle_grip_killshot_01", type = t, parent = tv(parent, 13), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 13), no_support = tv(n, 13)},
            grip_13 =      {model = _item_ranged.."/grips/boltgun_rifle_grip_01",          type = t, parent = tv(parent, 14), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 14), no_support = tv(n, 14)},
            grip_14 =      {model = _item_ranged.."/grips/boltgun_rifle_grip_02",          type = t, parent = tv(parent, 15), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 15), no_support = tv(n, 15)},
            grip_15 =      {model = _item_ranged.."/grips/boltgun_rifle_grip_03",          type = t, parent = tv(parent, 16), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 16), no_support = tv(n, 16)},
            grip_19 =      {model = _item_ranged.."/grips/lasgun_pistol_grip_01",          type = t, parent = tv(parent, 17), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 17), no_support = tv(n, 17)},
            grip_20 =      {model = _item_ranged.."/grips/lasgun_pistol_grip_02",          type = t, parent = tv(parent, 18), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 18), no_support = tv(n, 18)},
            grip_21 =      {model = _item_ranged.."/grips/lasgun_pistol_grip_03",          type = t, parent = tv(parent, 19), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 19), no_support = tv(n, 19)},
            grip_22 =      {model = _item_ranged.."/grips/lasgun_rifle_grip_01",           type = t, parent = tv(parent, 20), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 20), no_support = tv(n, 20)},
            grip_23 =      {model = _item_ranged.."/grips/lasgun_rifle_grip_02",           type = t, parent = tv(parent, 21), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 21), no_support = tv(n, 21)},
            grip_24 =      {model = _item_ranged.."/grips/lasgun_rifle_grip_03",           type = t, parent = tv(parent, 22), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 22), no_support = tv(n, 22)},
            grip_25 =      {model = _item_ranged.."/grips/lasgun_rifle_elysian_grip_02",   type = t, parent = tv(parent, 23), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 23), no_support = tv(n, 23)},
            grip_26 =      {model = _item_ranged.."/grips/lasgun_rifle_elysian_grip_03",   type = t, parent = tv(parent, 24), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 24), no_support = tv(n, 24)},
            grip_27 =      {model = _item_ranged.."/grips/flamer_rifle_grip_01",           type = t, parent = tv(parent, 25), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 25), no_support = tv(n, 25)},
            grip_28 =      {model = _item_ranged.."/grips/flamer_rifle_grip_02",           type = t, parent = tv(parent, 26), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 26), no_support = tv(n, 26)},
            grip_29 =      {model = _item_ranged.."/grips/flamer_rifle_grip_03",           type = t, parent = tv(parent, 27), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 27), no_support = tv(n, 27)},
            grip_30 =      {model = _item_ranged.."/grips/boltgun_pistol_grip_01",         type = t, parent = tv(parent, 28), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 28), no_support = tv(n, 28)},
            grip_31 =      {model = _item_ranged.."/grips/autogun_rifle_grip_ak_04",       type = t, parent = tv(parent, 29), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 29), no_support = tv(n, 29)},
            grip_32 =      {model = _item_ranged.."/grips/autogun_rifle_grip_ak_05",       type = t, parent = tv(parent, 30), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 30), no_support = tv(n, 30)},
            grip_33 =      {model = _item_ranged.."/grips/lasgun_pistol_grip_04",          type = t, parent = tv(parent, 31), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 31), no_support = tv(n, 31)},
        }
    end,
    bayonet_attachments = function()
        return {
            {id = "autogun_bayonet_default",    name = mod:localize("mod_attachment_default")},
            {id = "autogun_bayonet_01",         name = "Bayonet 1"},
            {id = "autogun_bayonet_02",         name = "Bayonet 2"},
            {id = "autogun_bayonet_03",         name = "Bayonet 3"},
        }
    end,
    bayonet_models = function(parent, angle, move, remove)
        local a = angle or 0
        local m = move or vector3_box(0, 0, 0)
        local r = remove or vector3_box(0, 0, 0)
        return {
            autogun_bayonet_default = {model = "",                                   type = "bayonet", parent = tv(parent, 1), angle = a, move = m, remove = tv(r, 1), mesh_move = false},
            autogun_bayonet_01 =      {model = _item_ranged.."/bayonets/bayonet_01", type = "bayonet", parent = tv(parent, 2), angle = a, move = m, remove = tv(r, 2), mesh_move = false},
            autogun_bayonet_02 =      {model = _item_ranged.."/bayonets/bayonet_02", type = "bayonet", parent = tv(parent, 3), angle = a, move = m, remove = tv(r, 3), mesh_move = false},
            autogun_bayonet_03 =      {model = _item_ranged.."/bayonets/bayonet_03", type = "bayonet", parent = tv(parent, 4), angle = a, move = m, remove = tv(r, 4), mesh_move = false},
        }
    end,
    reflex_sights_attachments = function()
        return {
            {id = "reflex_sight_01", name = "Reflex Sight 1"},
            {id = "reflex_sight_02", name = "Reflex Sight 2"},
            {id = "reflex_sight_03", name = "Reflex Sight 3"},
            -- {id = "scope", name = "Scope", sounds = {_magazine_sound}},
        }
    end,
    reflex_sights_models = function(parent, angle, move, remove, type, no_support, automatic_equip, hide_mesh)
        local a = angle or 0
        local m = move or vector3_box(0, 0, 0)
        local r = remove or vector3_box(0, 0, 0)
        local t = type or "sight"
        local n = no_support or {}
        local ae = automatic_equip or {
            {rail = "rail_default"},
            {rail = "rail_01"},
        }
        local h = hide_mesh or {}
        return {
            sight_default =   {model = "",                                      type = t, parent = tv(parent, 1), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 1), no_support = tv(n, 1), hide_mesh = tv(h, 1)},
            reflex_sight_01 = {model = _item_ranged.."/sights/reflex_sight_01", type = t, parent = tv(parent, 2), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 2), no_support = tv(n, 2), hide_mesh = tv(h, 2)},
            reflex_sight_02 = {model = _item_ranged.."/sights/reflex_sight_02", type = t, parent = tv(parent, 3), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 3), no_support = tv(n, 3), hide_mesh = tv(h, 3)},
            reflex_sight_03 = {model = _item_ranged.."/sights/reflex_sight_03", type = t, parent = tv(parent, 4), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 4), no_support = tv(n, 4), hide_mesh = tv(h, 4)},
            sight_none =      {model = "",                                      type = t, parent = tv(parent, 5), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 5), no_support = tv(n, 5), hide_mesh = tv(h, 5)},
            -- scope =           {model = _item_ranged.."/sights/scope_01", type = t, parent = tv(parent, 6), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 6), no_support = tv(n, 6),
            --     hide_mesh = table.icombine(
            --         tv(h, 6),
            --         {"sight", 1}
            --     )},
        }
    end,
    sight_default = function()
        return {
            {id = "sight_default",  name = mod:localize("mod_attachment_default")}
        }
    end,
    sights_attachments = function()
        return {
            {id = "autogun_rifle_sight_01", name = "Autogun"},
            {id = "autogun_rifle_ak_sight_01", name = "Braced Autogun"},
            {id = "autogun_rifle_killshot_sight_01", name = "Headhunter Autogun"},
            {id = "lasgun_rifle_sight_01", name = "Lasgun"},
        }
    end,
    sights_models = function(parent, angle, move, remove, type, no_support, automatic_equip, hide_mesh)
        local a = angle or 0
        local m = move or vector3_box(0, 0, 0)
        local r = remove or vector3_box(0, 0, 0)
        local t = type or "sight"
        local n = no_support or {}
        local ae = automatic_equip or {
            {rail = "rail_default"},
            {rail = "rail_01"},
        }
        local h = hide_mesh or {}
        return {
            sight_default =                   {model = "",                                                      type = t, parent = tv(parent, 1), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 1), no_support = tv(n, 1), hide_mesh = tv(h, 1)},
            autogun_rifle_ak_sight_01 =       {model = _item_ranged.."/sights/autogun_rifle_ak_sight_01",       type = t, parent = tv(parent, 2), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 2), no_support = tv(n, 2), hide_mesh = tv(h, 2)},
            autogun_rifle_sight_01 =          {model = _item_ranged.."/sights/autogun_rifle_sight_01",          type = t, parent = tv(parent, 3), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 3), no_support = tv(n, 3), hide_mesh = tv(h, 3)},
            autogun_rifle_killshot_sight_01 = {model = _item_ranged.."/sights/autogun_rifle_killshot_sight_01", type = t, parent = tv(parent, 4), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 4), no_support = tv(n, 4), hide_mesh = tv(h, 4)},
            lasgun_rifle_sight_01 =           {model = _item_ranged.."/sights/lasgun_rifle_sight_01",           type = t, parent = tv(parent, 5), angle = a, move = m, remove = r, mesh_move = false, automatic_equip = tv(ae, 5), no_support = tv(n, 5), hide_mesh = tv(h, 5)},
        }
    end,
    stock_attachments = function()
        return {
            {id = "no_stock", name = mod:localize("mod_attachment_no_stock")},
            {id = "stock_01", name = "Stock 1"},
            {id = "stock_02", name = "Stock 2"},
            {id = "stock_03", name = "Stock 3"},
            {id = "stock_04", name = "Stock 4"},
            {id = "stock_05", name = "Stock 5"},
            {id = "autogun_rifle_stock_01", name = "Infantry Autogun 1"},
            {id = "autogun_rifle_stock_02", name = "Infantry Autogun 2"},
            {id = "autogun_rifle_stock_03", name = "Infantry Autogun 3"},
            {id = "autogun_rifle_stock_04", name = "Infantry Autogun 4"},
            {id = "autogun_rifle_stock_05", name = "Braced Autogun 1"},
            {id = "autogun_rifle_stock_06", name = "Braced Autogun 2"},
            {id = "autogun_rifle_stock_07", name = "Braced Autogun 3"},
            {id = "autogun_rifle_stock_08", name = "Headhunter Autogun 1"},
            {id = "autogun_rifle_stock_09", name = "Headhunter Autogun 2"},
            {id = "lasgun_stock_01", name = "Infantry Lasgun 1"},
            {id = "lasgun_stock_02", name = "Infantry Lasgun 2"},
            {id = "lasgun_stock_03", name = "Infantry Lasgun 3"},
            {id = "autogun_rifle_stock_10", name = "Braced Autogun 4"},
            {id = "autogun_rifle_stock_11", name = "Braced Autogun 5"},
            {id = "lasgun_stock_04", name = "Infantry Lasgun 4"},
        }
    end,
    stock_models = function(parent, angle, move, remove, type)
        local a = angle or 0
        local m = move or vector3_box(0, 0, 0)
        local r = remove or vector3_box(0, 0, 0)
        local t = type or "stock"
        return {
            stock_default =          {model = "",                                                      type = t, parent = tv(parent, 1), angle = a, move = m, remove = r, mesh_move = false},
            no_stock =               {model = "",                                                      type = t, parent = tv(parent, 2), angle = a, move = m, remove = r, mesh_move = false},
            stock_01 =               {model = _item_ranged.."/stocks/stock_01",                        type = t, parent = tv(parent, 3), angle = a, move = m, remove = r, mesh_move = false},
            stock_02 =               {model = _item_ranged.."/stocks/stock_02",                        type = t, parent = tv(parent, 4), angle = a, move = m, remove = r, mesh_move = false},
            stock_03 =               {model = _item_ranged.."/stocks/stock_03",                        type = t, parent = tv(parent, 5), angle = a, move = m, remove = r, mesh_move = false},
            stock_04 =               {model = _item_ranged.."/stocks/stock_04",                        type = t, parent = tv(parent, 6), angle = a, move = m, remove = r, mesh_move = false},
            stock_05 =               {model = _item_ranged.."/stocks/stock_05",                        type = t, parent = tv(parent, 7), angle = a, move = m, remove = r, mesh_move = false},
            autogun_rifle_stock_01 = {model = _item_ranged.."/stocks/autogun_rifle_stock_01",          type = t, parent = tv(parent, 8), angle = a, move = m, remove = r, mesh_move = false},
            autogun_rifle_stock_02 = {model = _item_ranged.."/stocks/autogun_rifle_stock_02",          type = t, parent = tv(parent, 9), angle = a, move = m, remove = r, mesh_move = false},
            autogun_rifle_stock_03 = {model = _item_ranged.."/stocks/autogun_rifle_stock_03",          type = t, parent = tv(parent, 10), angle = a, move = m, remove = r, mesh_move = false},
            autogun_rifle_stock_04 = {model = _item_ranged.."/stocks/autogun_rifle_stock_04",          type = t, parent = tv(parent, 11), angle = a, move = m, remove = r, mesh_move = false},
            autogun_rifle_stock_05 = {model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01",       type = t, parent = tv(parent, 12), angle = a, move = m, remove = r, mesh_move = false},
            autogun_rifle_stock_06 = {model = _item_ranged.."/stocks/autogun_rifle_ak_stock_02",       type = t, parent = tv(parent, 13), angle = a, move = m, remove = r, mesh_move = false},
            autogun_rifle_stock_07 = {model = _item_ranged.."/stocks/autogun_rifle_ak_stock_03",       type = t, parent = tv(parent, 14), angle = a, move = m, remove = r, mesh_move = false},
            autogun_rifle_stock_08 = {model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_01", type = t, parent = tv(parent, 15), angle = a, move = m, remove = r, mesh_move = false},
            autogun_rifle_stock_09 = {model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_02", type = t, parent = tv(parent, 16), angle = a, move = m, remove = r, mesh_move = false},
            lasgun_stock_01 =        {model = _item_ranged.."/stocks/lasgun_rifle_stock_01",           type = t, parent = tv(parent, 17), angle = a, move = m, remove = r, mesh_move = false},
            lasgun_stock_02 =        {model = _item_ranged.."/stocks/lasgun_rifle_stock_02",           type = t, parent = tv(parent, 18), angle = a, move = m, remove = r, mesh_move = false},
            lasgun_stock_03 =        {model = _item_ranged.."/stocks/lasgun_rifle_stock_03",           type = t, parent = tv(parent, 19), angle = a, move = m, remove = r, mesh_move = false},
            autogun_rifle_stock_10 = {model = _item_ranged.."/stocks/autogun_rifle_ak_stock_04",       type = t, parent = tv(parent, 20), angle = a, move = m, remove = r, mesh_move = false},
            autogun_rifle_stock_11 = {model = _item_ranged.."/stocks/autogun_rifle_ak_stock_05",       type = t, parent = tv(parent, 21), angle = a, move = m, remove = r, mesh_move = false},
            lasgun_stock_04 =        {model = _item_ranged.."/stocks/lasgun_rifle_stock_04",           type = t, parent = tv(parent, 22), angle = a, move = m, remove = r, mesh_move = false},
        }
    end,
    ogryn_bayonet_attachments = function()
        return {
            {id = "bayonet_default",    name = mod:localize("mod_attachment_default")},
            {id = "bayonet_01",         name = "Bayonet 1"},
            {id = "bayonet_02",         name = "Bayonet 2"},
            {id = "bayonet_03",         name = "Bayonet 3"},
            {id = "bayonet_04",         name = "Bayonet 4"},
            {id = "bayonet_blade_01",   name = "Blade"},
        }
    end,
    ogryn_bayonet_models = function(parent, angle, move, remove)
        local a = angle or 0
        local m = move or vector3_box(0, 0, 0)
        local r = remove or vector3_box(0, 0, 0)
        return {
            bayonet_default =  {model = "",                                                   type = "bayonet", parent = tv(parent, 1), angle = a, move = m, remove = tv(r, 1), mesh_move = false},
            bayonet_01 =       {model = _item_ranged.."/bayonets/rippergun_rifle_bayonet_01", type = "bayonet", parent = tv(parent, 2), angle = a, move = m, remove = tv(r, 2), mesh_move = false},
            bayonet_02 =       {model = _item_ranged.."/bayonets/rippergun_rifle_bayonet_02", type = "bayonet", parent = tv(parent, 3), angle = a, move = m, remove = tv(r, 3), mesh_move = false},
            bayonet_03 =       {model = _item_ranged.."/bayonets/rippergun_rifle_bayonet_03", type = "bayonet", parent = tv(parent, 4), angle = a, move = m, remove = tv(r, 4), mesh_move = false},
            bayonet_04 =       {model = _item_ranged.."/bayonets/rippergun_rifle_bayonet_04", type = "bayonet", parent = tv(parent, 5), angle = a, move = m, remove = tv(r, 5), mesh_move = false},
            bayonet_blade_01 = {model = _item_melee.."/blades/combat_sword_blade_01",         type = "bayonet", parent = tv(parent, 6), angle = a, move = m, remove = tv(r, 6), mesh_move = false},
        }
    end,
    magazine_attachments = function()
        return {
            {id = "magazine_01",             name = "Autogun 1"},
            {id = "magazine_02",             name = "Autogun 2"},
            {id = "magazine_03",             name = "Autogun 3"},
            {id = "magazine_04",             name = "Braced Autogun 4"},
            {id = "auto_pistol_magazine_01", name = "Magazine 1"},
            {id = "bolter_magazine_01",      name = "Bolter Magazine A"},
            {id = "bolter_magazine_02",      name = "Bolter Magazine B"},
            -- {id = "bolter_magazine_03",      name = "Boltgun Pistol A"},
        }
    end,
    magazine_models = function(parent, angle, move, remove, type)
        local a = angle or 0
        local m = move or vector3_box(0, 0, 0)
        local r = remove or vector3_box(0, 0, 0)
        local t = type or "magazine"
        return {
            magazine_default =        {model = "",                                                      type = t, parent = tv(parent, 1), angle = a, move = m, remove = r, mesh_move = false},
            magazine_01 =             {model = _item_ranged.."/magazines/autogun_rifle_magazine_01",    type = t, parent = tv(parent, 2), angle = a, move = m, remove = r, mesh_move = false},
            magazine_02 =             {model = _item_ranged.."/magazines/autogun_rifle_magazine_02",    type = t, parent = tv(parent, 3), angle = a, move = m, remove = r, mesh_move = false},
            magazine_03 =             {model = _item_ranged.."/magazines/autogun_rifle_magazine_03",    type = t, parent = tv(parent, 4), angle = a, move = m, remove = r, mesh_move = false},
            magazine_04 =             {model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = t, parent = tv(parent, 5), angle = a, move = m, remove = r, mesh_move = false},
            auto_pistol_magazine_01 = {model = _item_ranged.."/magazines/autogun_pistol_magazine_01",   type = t, parent = tv(parent, 6), angle = a, move = m, remove = r, mesh_move = false},
            bolter_magazine_01 =      {model = _item_ranged.."/magazines/boltgun_rifle_magazine_01",    type = t, parent = tv(parent, 7), angle = a, move = m, remove = r},
            bolter_magazine_02 =      {model = _item_ranged.."/magazines/boltgun_rifle_magazine_02",    type = t, parent = tv(parent, 8), angle = a, move = m, remove = r},
            -- bolter_magazine_03 =      {model = _item_ranged.."/magazines/boltgun_pistol_magazine_01",    type = t, parent = tv(parent, 9), angle = a, move = m, remove = r},
        }
    end,
}