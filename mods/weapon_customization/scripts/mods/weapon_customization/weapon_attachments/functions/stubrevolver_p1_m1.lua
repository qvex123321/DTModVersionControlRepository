local mod = get_mod("weapon_customization")

-- ##### ┬─┐┌─┐┌─┐ ┬ ┬┬┬─┐┌─┐ #########################################################################################
-- ##### ├┬┘├┤ │─┼┐│ ││├┬┘├┤  #########################################################################################
-- ##### ┴└─└─┘└─┘└└─┘┴┴└─└─┘ #########################################################################################

local _common = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/common")
local _common_ranged = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/common_ranged")
local _common_lasgun = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/common_lasgun")
local _shotgun_p1_m1 = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/shotgun_p1_m1")
local _laspistol_p1_m1 = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/laspistol_p1_m1")
local _autogun_p1_m1 = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/autogun_p1_m1")

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

-- ##### ┌┬┐┌─┐┌┬┐┌─┐ #################################################################################################
-- #####  ││├─┤ │ ├─┤ #################################################################################################
-- ##### ─┴┘┴ ┴ ┴ ┴ ┴ #################################################################################################

local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"

-- ##### ┌─┐┬ ┬┌┐┌┌─┐┌┬┐┬┌─┐┌┐┌┌─┐ ####################################################################################
-- ##### ├┤ │ │││││   │ ││ ││││└─┐ ####################################################################################
-- ##### └  └─┘┘└┘└─┘ ┴ ┴└─┘┘└┘└─┘ ####################################################################################

local functions = {
    body_attachments = function(default)
        local attachments = {
            {id = "body_01",        name = "Body 1"},
            {id = "body_02",        name = "Body 2"},
        }
        if default == nil then default = true end
        if default then return table.icombine(
            {{id = "body_default", name = mod:localize("mod_attachment_default")}},
            attachments)
        else return attachments end
    end,
    body_models = function(parent, angle, move, remove, type, no_support, automatic_equip, hide_mesh, mesh_move)
        if mesh_move == nil then mesh_move = false end
        return table.model_table({
            {name = "body_default", model = ""},
            {name = "body_01",      model = _item_melee.."/full/stubgun_pistol_full_01"},
            {name = "body_02",      model = _item_ranged.."/recievers/stubgun_pistol_receiver_02"}
        }, parent, angle, move, remove, type or "body", no_support, automatic_equip, hide_mesh, mesh_move)
    end,
    barrel_attachments = function(default)
        local attachments = {
            {id = "barrel_01",      name = "Barrel 1"},
            {id = "barrel_02",      name = "Barrel 2"},
            {id = "barrel_03",      name = "Barrel 3"},
            {id = "barrel_04",      name = "Barrel 4"},
            {id = "barrel_05",      name = "Barrel 5"},
        }
        if default == nil then default = true end
        if default then return table.icombine(
            {{id = "barrel_default", name = mod:localize("mod_attachment_default")}},
            attachments)
        else return attachments end
    end,
    barrel_models = function(parent, angle, move, remove, type, no_support, automatic_equip, hide_mesh, mesh_move)
        if mesh_move == nil then mesh_move = false end
        return table.model_table({
            {name = "barrel_default", model = ""},
            {name = "barrel_01",      model = _item_ranged.."/barrels/stubgun_pistol_barrel_01"},
            {name = "barrel_02",      model = _item_ranged.."/barrels/stubgun_pistol_barrel_02"},
            {name = "barrel_03",      model = _item_ranged.."/barrels/stubgun_pistol_barrel_03"},
            {name = "barrel_04",      model = _item_ranged.."/barrels/stubgun_pistol_barrel_04"},
            {name = "barrel_05",      model = _item_ranged.."/barrels/stubgun_pistol_barrel_05"},
        }, parent, angle, move, remove, type or "barrel", no_support, automatic_equip, hide_mesh, mesh_move)
    end,
    rail_attachments = function(default)
        local attachments = {
            {id = "rail_01",        name = "Rail 1"},
        }
        if default == nil then default = true end
        if default then return table.icombine(
            {{id = "rail_default", name = mod:localize("mod_attachment_default")}},
            attachments)
        else return attachments end
    end,
    rail_models = function(parent, angle, move, remove, type, no_support, automatic_equip, hide_mesh, mesh_move)
        if mesh_move == nil then mesh_move = false end
        return table.model_table({
            {name = "rail_default", model = ""},
            {name = "rail_01",      model = _item_ranged.."/rails/stubgun_pistol_rail_off"},
        }, parent, angle, move, remove, type or "barrel", no_support, automatic_equip, hide_mesh, mesh_move)
    end,
    speed_loader_attachments = function(default)
        local attachments = {
            {id = "speedloader_01",        name = "Speedloader"},
        }
        if default == nil then default = true end
        if default then return table.icombine(
            {{id = "speedloader_default", name = mod:localize("mod_attachment_default")}},
            attachments)
        else return attachments end
    end,
    speed_loader_models = function(parent, angle, move, remove, type, no_support, automatic_equip, hide_mesh, mesh_move)
        if mesh_move == nil then mesh_move = false end
        return table.model_table({
            {name = "speedloader_default", model = ""},
            {name = "speedloader_01",      model = _item_ranged.."/bullets/stubgun_pistol_bullet_speedloader"},
        }, parent, angle, move, remove, type or "barrel", no_support, automatic_equip, hide_mesh, mesh_move)
    end,
}

-- ##### ┌┬┐┌─┐┌─┐┬┌┐┌┬┌┬┐┬┌─┐┌┐┌┌─┐ ##################################################################################
-- #####  ││├┤ ├┤ │││││ │ ││ ││││└─┐ ##################################################################################
-- ##### ─┴┘└─┘└  ┴┘└┘┴ ┴ ┴└─┘┘└┘└─┘ ##################################################################################

return table.combine(
    functions,
    {
        attachments = {
            -- Native
            body = functions.body_attachments(),
            barrel = functions.barrel_attachments(),
            -- speedloader = functions.speed_loader_attachments(),
            -- rail = functions.rail_attachments(),
            muzzle = _autogun_p1_m1.muzzle_attachments();
            -- Ranged
            flashlight = _common_ranged.flashlights_attachments(),
            sight = table.icombine(
                _common_ranged.reflex_sights_attachments(),
                _common_ranged.scopes_attachments(false)
            ),
            -- Lasgun
            -- rail = _common_lasgun.rail_attachments(),
            -- Shotgun
            stock_3 = _shotgun_p1_m1.stock_attachments(),
            -- Common
            emblem_right = _common.emblem_right_attachments(),
            emblem_left = _common.emblem_left_attachments(),
        },
        models = table.combine(
            {customization_default_position = vector3_box(0, 0, 0)},
            -- Native
            functions.body_models(nil, 0, vector3_box(0, 0, 0), vector3_box(0, 0, -.00001)),
            functions.barrel_models(nil, -.5, vector3_box(0, -2, 0), vector3_box(0, .1, 0), nil, nil, nil, nil, true),
            -- functions.speed_loader_models(nil, -.5, vector3_box(.2, -2, 0), vector3_box(0, .2, 0), nil, nil, nil, nil, true),
            -- functions.rail_models(nil, 0, vector3_box(0, 0, 0), vector3_box(0, 0, .2)),
            -- Ranged
            _common_ranged.reflex_sights_models("body", -.5, vector3_box(0, -4, -.2), vector3_box(0, -.1, 0), "sight", {}, {
                {rail = "rail_default", sight_2 = "sight_default", lens = "scope_lens_default", lens_2 = "scope_lens_default"},
                {rail = "rail_01", sight_2 = "sight_default", lens = "scope_lens_default", lens_2 = "scope_lens_default"},
                {rail = "rail_01", sight_2 = "sight_default", lens = "scope_lens_default", lens_2 = "scope_lens_default"},
                {rail = "rail_01", sight_2 = "sight_default", lens = "scope_lens_default", lens_2 = "scope_lens_default"},
            }, {
                {},
                {{"barrel", 8}},
                {{"barrel", 8}},
                {{"barrel", 8}},
            }),
            _common_ranged.flashlight_models("body", -2.5, vector3_box(0, -3, 0), vector3_box(.1, 0, 0)),
            _common_ranged.sights_models("body", .35, vector3_box(0, -4, -.2), {
                vector3_box(-.2, 0, 0),
                vector3_box(0, -.2, 0),
                vector3_box(0, -.2, 0),
                vector3_box(0, -.2, 0),
                vector3_box(-.2, 0, 0),
                vector3_box(0, -.3, 0),
                vector3_box(0, -.4, 0),
                vector3_box(0, -.15, 0),
                vector3_box(0, -.2, 0),
            }, "sight", {}, {
                {rail = "rail_default", sight_2 = "sight_default", lens = "scope_lens_default", lens_2 = "scope_lens_default"},
                {rail = "rail_01", sight_2 = "sight_default", lens = "scope_lens_default", lens_2 = "scope_lens_default"},
                {rail = "rail_default", sight_2 = "sight_default", lens = "scope_lens_default", lens_2 = "scope_lens_default"},
                {rail = "rail_01", sight_2 = "sight_default", lens = "scope_lens_default", lens_2 = "scope_lens_default"},
                {rail = "rail_default", sight_2 = "sight_default", lens = "scope_lens_default", lens_2 = "scope_lens_default"},
                {rail = "rail_01", sight_2 = "scope_sight_03", lens = "scope_lens_02", lens_2 = "scope_lens_2_02"},
                {rail = "rail_01", sight_2 = "scope_sight_02", lens = "scope_lens_02", lens_2 = "scope_lens_2_02"},
                {rail = "rail_01", sight_2 = "scope_sight_03", lens = "scope_lens_02", lens_2 = "scope_lens_2_02"},
                {rail = "rail_default", sight_2 = "sight_default", lens = "scope_lens_default", lens_2 = "scope_lens_default"},
            }, {
                {},
                {},
                {},
                {},
                {{"sight", 1}},
                {{"barrel", 8}},
                {{"barrel", 8}},
                {{"barrel", 8}},
                {},
            }, {
                true,
                true,
                false,
                false,
                true,
                false,
                false,
                false,
                false,
            }),
            _common_ranged.scope_sights_models("sight", .2, vector3_box(0, -4, -.2), vector3_box(0, 0, 0), "sight_2", {}, {
                {rail = "rail_default", sight_2 = "sight_default", lens = "scope_lens_default", lens_2 = "scope_lens_default"},
                {rail = "rail_01"},
                {rail = "rail_01"},
                {rail = "rail_01"},
                {rail = "rail_default", sight_2 = "sight_default", lens = "scope_lens_default", lens_2 = "scope_lens_default"},
            }, {
                {},
                {{"barrel", 8}},
                {{"barrel", 8}},
                {{"barrel", 8}},
                {},
            }),
            _common_ranged.scope_lens_models("sight", .2, vector3_box(0, -4, -.2), vector3_box(0, 0, 0)),
            _common_ranged.scope_lens_2_models("sight", .2, vector3_box(0, -4, -.2), vector3_box(0, 0, 0)),
            -- Lasgun
            _common_lasgun.rail_models("body", 0, vector3_box(0, 0, 0), vector3_box(0, 0, .1)),
            -- Shotgun
            _shotgun_p1_m1.stock_models("body", 0, vector3_box(-.4, -4, 0), vector3_box(0, -.1, -.055), "stock_3"),
            -- Autogun
            _autogun_p1_m1.muzzle_models("barrel", -.5, vector3_box(.2, -3, 0), vector3_box(0, .2, 0)),
            -- Common
            _common.emblem_right_models("body", -3, vector3_box(0, -4, 0), vector3_box(.1, 0, 0)),
            _common.emblem_left_models("body", 0, vector3_box(0, -4, 0), vector3_box(-.1, 0, 0))
        ),
        anchors = {
            scope_offset = {position = vector3_box(0, .1, .03)},
            fixes = {
                --#region Scopes
                    -- Ranger's Vigil
                    {dependencies = {"scope_03", "barrel_04"},
                        sight = {parent = "barrel", parent_node = 10, position = vector3_box(0, -.02, .05), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"barrel", 9}},
                            animation_wait_attach = {"rail"},
                        }
                    },
                    {dependencies = {"scope_03"},
                        sight = {parent = "barrel", parent_node = 9, position = vector3_box(0, 0, .05), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
                            animation_wait_attach = {"rail"},
                        },
                        lens = {parent = "sight", position = vector3_box(0, .033, .002), rotation = vector3_box(0, 0, 0), scale = vector3_box(.9, .4, .9), data = {lens = 1}},
                        lens_2 = {parent = "sight", position = vector3_box(0, .085, .002), rotation = vector3_box(180, 0, 0), scale = vector3_box(.9, .4, .9), data = {lens = 2}},
                        sight_2 = {parent = "sight", position = vector3_box(0, 0, -.0425), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.5, .4, 1.35), hide_mesh = {{"sight_2", 5}}},
                        scope_offset = {position = vector3_box(0, .22, .033)}},
                    -- Martyr's Gaze
                    {dependencies = {"scope_01", "barrel_04"},
                        sight = {parent = "barrel", parent_node = 10, position = vector3_box(0, -.03, .05), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1), hide_mesh = {{"barrel", 9}},
                            animation_wait_attach = {"rail"},
                        }
                    },
                    {dependencies = {"scope_01"},
                        sight = {parent = "barrel", parent_node = 9, position = vector3_box(0, -.02, .05), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1),
                            animation_wait_attach = {"rail"},
                        },
                        lens = {parent = "sight", position = vector3_box(0, .105, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, .275, 1), data = {lens = 1}},
                        lens_2 = {parent = "sight", position = vector3_box(0, .065, 0), rotation = vector3_box(180, 0, 0), scale = vector3_box(1, .3, 1), data = {lens = 2}},
                        sight_2 = {parent = "sight", position = vector3_box(0, .07, -.0425), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.5, .4, 1.35), hide_mesh = {{"sight_2", 5}}},
                        scope_offset = {position = vector3_box(0, .175, .033)}},
                    -- Extermination Lense
                    {dependencies = {"scope_02", "barrel_04"},
                        sight = {parent = "barrel", parent_node = 10, position = vector3_box(0, -.07, .05), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 3, 1), hide_mesh = {{"barrel", 9}},
                            animation_wait_attach = {"rail"},
                        }
                    },
                    {dependencies = {"scope_02"},
                        sight = {parent = "barrel", parent_node = 9, position = vector3_box(0, -.05, .05), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 3, 1),
                            animation_wait_attach = {"rail"},
                        },
                        lens = {parent = "sight", position = vector3_box(0, .075, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(.9, .15, .9), data = {lens = 1}},
                        lens_2 = {parent = "sight", position = vector3_box(0, .022, 0), rotation = vector3_box(180, 0, 0), scale = vector3_box(.9, .1, .9), data = {lens = 2}},
                        sight_2 = {parent = "sight", position = vector3_box(0, .07, -.048), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.5, .4, 1.35), hide_mesh = {{"sight_2", 3, 4, 5}}},
                        scope_offset = {position = vector3_box(0, .35, .028)}},
                    
                    {sight_2 = {parent = "barrel", parent_node = 9, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0, 0, 0)}},
                    {lens = {parent = "sight", position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0, 0, 0)}},
                    {lens_2 = {parent = "sight", position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0, 0, 0)}},

                    {dependencies = {"barrel_04|barrel_05"},
                        no_scope_offset = {position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0)}},

                --#endregion
                --#region Muzzle
                    {dependencies = {"barrel_01"},
                        muzzle = {parent = "barrel", parent_node = 9, position = vector3_box(0, .2, -.0225), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
                            animation_wait_attach = {"barrel"},
                        },
                    },
                    {dependencies = {"barrel_02"},
                        muzzle = {parent = "barrel", parent_node = 9, position = vector3_box(0, .24, -.025), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
                            animation_wait_attach = {"barrel"},
                        },
                    },
                    {dependencies = {"barrel_03"},
                        muzzle = {parent = "barrel", parent_node = 9, position = vector3_box(0, .22, -.023), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
                            animation_wait_attach = {"barrel"},
                        },
                    },
                    {dependencies = {"barrel_04"},
                        muzzle = {parent = "barrel", parent_node = 9, position = vector3_box(0, .1375, -.0425), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
                            animation_wait_attach = {"barrel"},
                        },
                    },
                    {dependencies = {"barrel_05"},
                        muzzle = {parent = "barrel", parent_node = 9, position = vector3_box(0, .2225, -.02075), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
                            animation_wait_attach = {"barrel"},
                        },
                    },
                --#endregion
                --#region Grip
                    {dependencies = {"grip_27|grip_28|grip_29"},
                        grip = {offset = true, position = vector3_box(0, .01, -.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                --#endregion
                --#region Laser Pointer / Flashlight
                    {dependencies = {"laser_pointer"}, 
                        flashlight = {position = vector3_box(.01, .07, .01), rotation = vector3_box(0, 0, 0), scale = vector3_box(.5, .5, .5)}},
                    {flashlight = {position = vector3_box(.01, .07, .01), rotation = vector3_box(0, 0, 0), scale = vector3_box(.5, .5, .5)}},
                --#endregion
                --#region Emblems
                    {dependencies = {"emblem_left_02"},
                        emblem_left = {parent = "body", position = vector3_box(-.011, .045, .0095), rotation = vector3_box(0, 0, 180), scale = vector3_box(.65, -.65, .65)}},
                    {emblem_left = {parent = "body", position = vector3_box(-.011, .045, .0095), rotation = vector3_box(0, 0, 180), scale = vector3_box(.65, .65, .65)},
                        emblem_right = {parent = "body", position = vector3_box(.011, .045, .0095), rotation = vector3_box(0, 0, 0), scale = vector3_box(.65, .65, .65)}},
                --#endregion
                --#region Barrel
                    {dependencies = {"barrel_04"},
                        -- body = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(1.5, 0, 0), rotation_node = 1, scale = vector3_box(1, 1, 1)},
                        barrel = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), rotation_node = 2, scale = vector3_box(1, 1, 1),
                            trigger_move = {"muzzle", "rail"}, animation_wait_detach = {"rail", "muzzle"},
                        }
                    },
                    {dependencies = {"barrel_05"},
                        barrel = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), rotation_node = 2, scale = vector3_box(1, 1, 1),
                            trigger_move = {"muzzle", "rail"}, animation_wait_detach = {"rail", "muzzle"},
                        }
                    },
                    {barrel = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), rotation_node = 2, scale = vector3_box(1, 1, 1),
                        trigger_move = {"muzzle", "rail"}, animation_wait_detach = {"rail", "muzzle"},
                        }
                    },
                --#endregion
                --#region Rail
                    {dependencies = {"barrel_04", "scope_01|scope_02|scope_03|reflex_sight_01|reflex_sight_02|reflex_sight_03"},
                        rail = {parent = "barrel", parent_node = 9, position = vector3_box(0, -.06, -.0015), rotation = vector3_box(0, 0, 0), scale = vector3_box(.8, .75, 1),
                            trigger_move = {"sight"}, animation_wait_attach = {"barrel"}, animation_wait_detach = {"sight"}},
                        },
                    {dependencies = {"barrel_05", "scope_01|scope_02|scope_03|reflex_sight_01|reflex_sight_02|reflex_sight_03"},
                        rail = {parent = "barrel", parent_node = 9, position = vector3_box(0, .02, .015), rotation = vector3_box(0, 0, 0), scale = vector3_box(.8, .85, 1),
                            trigger_move = {"sight"}, animation_wait_attach = {"barrel"}, animation_wait_detach = {"sight"}},
                        },
                    {dependencies = {"scope_01|scope_02|scope_03|reflex_sight_01|reflex_sight_02|reflex_sight_03"},
                        rail = {parent = "barrel", parent_node = 9, position = vector3_box(0, .02, .015), rotation = vector3_box(0, 0, 0), scale = vector3_box(.8, .75, 1),
                            trigger_move = {"sight"}, animation_wait_attach = {"barrel"}, animation_wait_detach = {"sight"}},
                        },
                    {rail = {parent = "barrel", parent_node = 9, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0, 0, 0),
                        trigger_move = {"sight"}, animation_wait_attach = {"barrel"}, animation_wait_detach = {"sight"}},
                    },
                --#endregion
                --#regin Reflex sights
                    {dependencies = {"barrel_04"},
                        sight = {parent = "barrel", parent_node = 9, position = vector3_box(0, -.05, -.0015), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, .75, 1), hide_mesh = {{"barrel", 9}},
                            animation_wait_attach = {"rail"},
                        },
                    },
                    {dependencies = {"barrel_05"},
                        sight = {parent = "barrel", parent_node = 9, position = vector3_box(0, .022, .015), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, .75, 1),
                            animation_wait_attach = {"rail"},
                        },
                    },
                    {sight = {parent = "barrel", parent_node = 9, position = vector3_box(0, .022, .015), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, .75, 1),
                        animation_wait_attach = {"rail"}},
                    },
                --#endregion
                --#region Stock
                    {stock_3 = {parent = "body", position = vector3_box(0, -.09, -.11), rotation = vector3_box(-10, 0, 0), scale = vector3_box(1, 1, 1)}},
                --#endregion
            }
        },
    }
)