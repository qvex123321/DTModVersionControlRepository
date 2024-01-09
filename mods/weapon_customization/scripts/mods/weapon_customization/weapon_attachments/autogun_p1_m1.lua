local mod = get_mod("weapon_customization")

-- ##### ┬─┐┌─┐┌─┐ ┬ ┬┬┬─┐┌─┐ #########################################################################################
-- ##### ├┬┘├┤ │─┼┐│ ││├┬┘├┤  #########################################################################################
-- ##### ┴└─└─┘└─┘└└─┘┴┴└─└─┘ #########################################################################################

local _common = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/common")
local _autogun_p1_m1 = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/functions/autogun_p1_m1")
local _common_ranged = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/common_ranged")
local _common_lasgun = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/common_lasgun")

-- ##### ┌┬┐┌─┐┌┬┐┌─┐ #################################################################################################
-- #####  ││├─┤ │ ├─┤ #################################################################################################
-- ##### ─┴┘┴ ┴ ┴ ┴ ┴ #################################################################################################

local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"
local _lense_default = "scope_lens_default"
local _sight_default = "sight_default"
local _braced_barrels = "barrel_07|barrel_08|barrel_09|barrel_10|barrel_13|barrel_14|barrel_18|barrel_19"
local _infantry_barrels = "barrel_01|barrel_02|barrel_03|barrel_04|barrel_05|barrel_06"
local _infantry_and_braced_barrels = _infantry_barrels.."|".._braced_barrels

-- ##### ┌─┐┌─┐┬─┐┌─┐┌─┐┬─┐┌┬┐┌─┐┌┐┌┌─┐┌─┐ ############################################################################
-- ##### ├─┘├┤ ├┬┘├┤ │ │├┬┘│││├─┤││││  ├┤  ############################################################################
-- ##### ┴  └─┘┴└─└  └─┘┴└─┴ ┴┴ ┴┘└┘└─┘└─┘ ############################################################################

--#region local functions
    local table = table
    local vector3_box = Vector3Box
    local table_combine = table.combine
    local table_icombine = table.icombine
--#endregion

-- ##### ┌┬┐┌─┐┌─┐┬┌┐┌┬┌┬┐┬┌─┐┌┐┌┌─┐ ##################################################################################
-- #####  ││├┤ ├┤ │││││ │ ││ ││││└─┐ ##################################################################################
-- ##### ─┴┘└─┘└  ┴┘└┘┴ ┴ ┴└─┘┘└┘└─┘ ##################################################################################

local definitions = table_combine(
    _autogun_p1_m1,
    {
        attachments = {
            -- Native
            receiver = _autogun_p1_m1.receiver_attachments(),
            barrel = _autogun_p1_m1.barrel_attachments(),
            muzzle = _autogun_p1_m1.muzzle_attachments(),
            -- Ranged
            flashlight = _common_ranged.flashlights_attachments(),
            grip = _common_ranged.grip_attachments(),
            stock = table_icombine(
                _common_ranged.stock_attachments()
            ),
            magazine = table_icombine(
                _common_ranged.magazine_attachments()
            ),
            sight = table_icombine(
                _common_ranged.reflex_sights_attachments(),
                _common_ranged.sights_attachments(false)
            ),
            bayonet = _common_ranged.bayonet_attachments(),
            -- Common
            emblem_right = _common.emblem_right_attachments(),
            emblem_left = _common.emblem_left_attachments(),
            trinket_hook = _common.trinket_hook_attachments(),
        },
        models = table_combine(
            {customization_default_position = vector3_box(0, -.5, 0)},
            -- Native
            _autogun_p1_m1.braced_barrel_models(nil, -.3, vector3_box(.2, -2, 0), vector3_box(0, .1, 0)),
            _autogun_p1_m1.headhunter_barrel_models(nil, -.3, vector3_box(.2, -2, 0), vector3_box(0, .1, 0), nil, {
                {"trinket_hook"},
            }, {
                {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"},
            }),
            _autogun_p1_m1.muzzle_models(nil, -.5, vector3_box(.4, -3, 0), vector3_box(0, .1, 0)),
            _autogun_p1_m1.receiver_models(nil, 0, vector3_box(0, 0, 0), vector3_box(0, 0, -.00001)),
            _autogun_p1_m1.infantry_barrel_models(nil, -.3, vector3_box(.2, -2, 0), vector3_box(0, .1, 0), nil, {
                {"trinket_hook_empty"},
            }, {
                {trinket_hook = "trinket_hook_empty|trinket_hook_default"},
            }),
            -- Ranged
            _common_ranged.flashlight_models(nil, -2.5, vector3_box(-.6, -3, 0), vector3_box(.1, 0, 0)),
            _common_ranged.bayonet_models({"barrel", "barrel", "barrel", "muzzle"}, -.5, vector3_box(0, .1, 0), vector3_box(0, .4, -.034)),
            _common_ranged.grip_models(nil, .4, vector3_box(-.4, -4, .1), vector3_box(0, -.1, -.1)),
            _common_ranged.reflex_sights_models(nil, .2, vector3_box(-.3, -4, -.2), vector3_box(0, -.2, 0), "sight", {}, {
                {rail = "rail_default", sight_2 = _sight_default, lens = _lense_default, lens_2 = _lense_default},
                {rail = "rail_01",      sight_2 = _sight_default, lens = _lense_default, lens_2 = _lense_default},
                {rail = "rail_01",      sight_2 = _sight_default, lens = _lense_default, lens_2 = _lense_default},
                {rail = "rail_01",      sight_2 = _sight_default, lens = _lense_default, lens_2 = _lense_default},
            }),
            _common_ranged.scope_sights_models("sight", .2, vector3_box(-.3, -4, -.2), vector3_box(0, 0, 0), "sight_2", {}, {
                {rail = "rail_default"},
                {rail = "rail_default"},
                {rail = "rail_default"},
            }),
            _common_ranged.scope_lens_models("sight_2", .2, vector3_box(-.3, -4, -.2), vector3_box(0, 0, 0)),
            _common_ranged.scope_lens_2_models("sight_2", .2, vector3_box(-.3, -4, -.2), vector3_box(0, 0, 0)),
            _common_ranged.sights_models(nil, .35, vector3_box(-.3, -4, -.2), {
                vector3_box(0, 0, .2),
                vector3_box(0, -.2, 0),
                vector3_box(0, -.2, 0),
                vector3_box(0, -.2, 0),
                vector3_box(0, 0, .2),
                vector3_box(0, -.2, 0),
                vector3_box(0, -.2, 0),
                vector3_box(0, -.2, 0),
                vector3_box(0, -.2, 0),
            }, nil, nil, {
                {rail = "rail_default", sight_2 = _sight_default,   lens = _lense_default,  lens_2 = _lense_default},
                {rail = "rail_01",      sight_2 = _sight_default,   lens = _lense_default,  lens_2 = _lense_default},
                {rail = "rail_default", sight_2 = _sight_default,   lens = _lense_default,  lens_2 = _lense_default},
                {rail = "rail_01",      sight_2 = _sight_default,   lens = _lense_default,  lens_2 = _lense_default},
                {rail = "rail_default", sight_2 = _sight_default,   lens = _lense_default,  lens_2 = _lense_default},
                {rail = "rail_default", sight_2 = "scope_sight_03", lens = "scope_lens_02", lens_2 = "scope_lens_2_02"},
                {rail = "rail_default", sight_2 = "scope_sight_02", lens = "scope_lens_02", lens_2 = "scope_lens_2_02"},
                {rail = "rail_default", sight_2 = "scope_sight_03", lens = "scope_lens_02", lens_2 = "scope_lens_2_02"},
                {rail = "rail_default", sight_2 = _sight_default,   lens = _lense_default,  lens_2 = _lense_default},
            }, {
                {}, {}, {}, {}, {{"sight", 1}}, {}, {}, {}, {},
            }),
            _common_ranged.stock_models(nil, .5, vector3_box(-.6, -4, 0), vector3_box(0, -.1, -.1)),
            _common_ranged.magazine_models(nil, .2, vector3_box(-.2, -3, .1), vector3_box(0, 0, -.2)),
            -- Lasgun
            _common_lasgun.rail_models("receiver", 0, vector3_box(0, 0, 0), vector3_box(0, 0, .1)),
            -- Common
            _common.trinket_hook_models(nil, 0, vector3_box(.1, -4, .2), vector3_box(0, 0, -.1)),
            _common.emblem_right_models("receiver", -3, vector3_box(-.2, -4, 0), vector3_box(.1, 0, 0)),
            _common.emblem_left_models("receiver", 0, vector3_box(-.2, -4, 0), vector3_box(-.1, 0, 0))
        ),
        anchors = { -- Done 24.9.2023
            -- scope_offset = vector3_box(0, 0, .009),
            fixes = {
                --#region Receiver
                    {receiver = {offset = true, animation_wait_detach = {"barrel"}}},
                --#endregion
                --#region Grips
                    {dependencies = {"grip_27|grip_28|grip_29"}, -- Grip
                        grip = {offset = true, position = vector3_box(0, .01, -.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                --#endregion
                --#region Bayonets
                    {dependencies = {"barrel_01", "autogun_bayonet_01"}, -- Bayonet 1
                        bayonet = {offset = true, position = vector3_box(0, .115, .06), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"barrel_02", "autogun_bayonet_01"}, -- Bayonet 1
                        bayonet = {offset = true, position = vector3_box(0, .115, .06), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"barrel_03", "autogun_bayonet_01"}, -- Bayonet 1
                        bayonet = {offset = true, position = vector3_box(0, .145, .06), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"barrel_04", "autogun_bayonet_01"}, -- Bayonet 1
                        bayonet = {offset = true, position = vector3_box(0, .115, .06), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"barrel_06", "autogun_bayonet_01"}, -- Bayonet 1
                        bayonet = {offset = true, position = vector3_box(0, .12, .055), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"barrel_11", "autogun_bayonet_01"}, -- Bayonet 1
                        bayonet = {offset = true, position = vector3_box(0, .173, .0675), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"barrel_12", "autogun_bayonet_01"}, -- Bayonet 1
                        bayonet = {offset = true, position = vector3_box(0, .09, .041), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"barrel_15", "autogun_bayonet_01"}, -- Bayonet 1
                        bayonet = {offset = true, position = vector3_box(0, .17, .088), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"barrel_16", "autogun_bayonet_01"}, -- Bayonet 1
                        bayonet = {offset = true, position = vector3_box(0, .19, .076), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"barrel_01", "autogun_bayonet_02"}, -- Bayonet 2
                        bayonet = {offset = true, position = vector3_box(0, .115, .06), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"barrel_02", "autogun_bayonet_02"}, -- Bayonet 2
                        bayonet = {offset = true, position = vector3_box(0, .115, .06), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"barrel_03", "autogun_bayonet_02"}, -- Bayonet 2
                        bayonet = {offset = true, position = vector3_box(0, .145, .06), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"barrel_04", "autogun_bayonet_02"}, -- Bayonet 2
                        bayonet = {offset = true, position = vector3_box(0, .115, .06), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"barrel_06", "autogun_bayonet_02"}, -- Bayonet 2
                        bayonet = {offset = true, position = vector3_box(0, .12, .055), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"barrel_11", "autogun_bayonet_02"}, -- Bayonet 2
                        bayonet = {offset = true, position = vector3_box(0, .173, .0675), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"barrel_12", "autogun_bayonet_02"}, -- Bayonet 2
                        bayonet = {offset = true, position = vector3_box(0, .09, .041), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"barrel_15", "autogun_bayonet_02"}, -- Bayonet 2
                        bayonet = {offset = true, position = vector3_box(0, .17, .088), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"barrel_16", "autogun_bayonet_02"}, -- Bayonet 2
                        bayonet = {offset = true, position = vector3_box(0, .19, .076), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"muzzle_01", "autogun_bayonet_03"}, -- Bayonet 3
                        bayonet = {offset = true, position = vector3_box(0, .045, -.025), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"muzzle_02", "autogun_bayonet_03"}, -- Bayonet 3
                        bayonet = {offset = true, position = vector3_box(0, .075, -.025), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"muzzle_03", "autogun_bayonet_03"}, -- Bayonet 3
                        bayonet = {offset = true, position = vector3_box(0, .045, -.025), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"muzzle_04", "autogun_bayonet_03"}, -- Bayonet 3
                        bayonet = {offset = true, position = vector3_box(0, .045, -.025), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"muzzle_05", "autogun_bayonet_03"}, -- Bayonet 3
                        bayonet = {offset = true, position = vector3_box(0, .055, -.025), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"muzzle_06", "autogun_bayonet_03"}, -- Bayonet 3
                        bayonet = {offset = true, position = vector3_box(0, .075, -.025), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"muzzle_07", "autogun_bayonet_03"}, -- Bayonet 3
                        bayonet = {offset = true, position = vector3_box(0, .05, -.025), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"muzzle_08", "autogun_bayonet_03"}, -- Bayonet 3
                        bayonet = {offset = true, position = vector3_box(0, .07, -.025), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"muzzle_09", "autogun_bayonet_03"}, -- Bayonet 3
                        bayonet = {offset = true, position = vector3_box(0, .09, -.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"muzzle_10", "autogun_bayonet_03"}, -- Bayonet 3
                        bayonet = {offset = true, position = vector3_box(0, .1, -.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                --#endregion
                --#region Scope
                    -- Ranger's Vigil
                    {dependencies = {"scope_03"},
                        sight = {parent = "receiver", position = vector3_box(0, -.09, .143), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
                            animation_wait_attach = {"rail"}
                        },
                        lens = {parent = "sight", position = vector3_box(0, .033, .002), rotation = vector3_box(0, 0, 0), scale = vector3_box(.9, .4, .9), data = {lens = 1}},
                        lens_2 = {parent = "sight", position = vector3_box(0, .085, .002), rotation = vector3_box(180, 0, 0), scale = vector3_box(.9, .4, .9), data = {lens = 2}},
                        sight_2 = {parent = "sight", position = vector3_box(0, 0, -.0425), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.5, .4, 1.35), hide_mesh = {{"sight_2", 5}},
                            animation_wait_attach = {"rail"}
                        },
                        scope_offset = {position = vector3_box(0, .025, .009), rotation = vector3_box(.6, 0, 0)}},
                    -- Martyr's Gaze
                    {dependencies = {"scope_01"},
                        sight = {parent = "receiver", position = vector3_box(0, -.09, .15), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1),
                            animation_wait_attach = {"rail"}
                        },
                        lens = {parent = "sight", position = vector3_box(0, .105, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, .275, 1), data = {lens = 1}},
                        lens_2 = {parent = "sight", position = vector3_box(0, .065, 0), rotation = vector3_box(180, 0, 0), scale = vector3_box(1, .3, 1), data = {lens = 2}},
                        sight_2 = {parent = "sight", position = vector3_box(0, .07, -.045), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.5, .4, 1.35), hide_mesh = {{"sight_2", 5}},
                            animation_wait_attach = {"rail"}
                        },
                        scope_offset = {position = vector3_box(0, .015, .0135), rotation = vector3_box(.6, 0, 0)}},
                    -- Exterminatus Lens
                    {dependencies = {"scope_02"},
                        sight = {parent = "receiver", position = vector3_box(0, -.09, .15), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 3, 1),
                            animation_wait_attach = {"rail"}
                        },
                        lens = {parent = "sight", position = vector3_box(0, .075, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(.9, .15, .9), data = {lens = 1}},
                        lens_2 = {parent = "sight", position = vector3_box(0, .022, 0), rotation = vector3_box(180, 0, 0), scale = vector3_box(.9, .1, .9), data = {lens = 2}},
                        sight_2 = {parent = "sight", position = vector3_box(0, .07, -.048), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.5, .4, 1.35), hide_mesh = {{"sight_2", 3, 4, 5}},
                            animation_wait_attach = {"rail"}
                        },
                        scope_offset = {position = vector3_box(0, .17, .01), rotation = vector3_box(.6, 0, 0)}},
                    {sight_2 = {parent = "receiver", position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0, 0, 0)}},
                    {lens = {parent = "sight", position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0, 0, 0)}},
                    {lens_2 = {parent = "sight", position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0, 0, 0)}},
                --#endregion
                --#region Sights
                    --#region Infantry receiver
                        {dependencies = {"lasgun_rifle_sight_01", "receiver_01"}, -- Lasgun sight
                            sight = {offset = true, position = vector3_box(0, -.028, .0265), rotation = vector3_box(0, 0, 0),
                            animation_wait_attach = {"rail"}
                        }},
                    --#endregion
                    --#region Headhunter receiver
                        {dependencies = {"autogun_rifle_sight_01", "receiver_02|receiver_04|receiver_05"}, -- Infantry sight
                            sight = {offset = true, position = vector3_box(0, -.006, -.005), rotation = vector3_box(0, 0, 0), scale = vector3_box(.9, 1, 1),
                            animation_wait_attach = {"rail"}
                        }},
                        {dependencies = {"autogun_rifle_ak_sight_01", "receiver_02|receiver_04|receiver_05"}, -- Braced sight
                            sight = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
                            animation_wait_attach = {"rail"}
                        }},
                        {dependencies = {"autogun_rifle_killshot_sight_01", "receiver_02|receiver_04|receiver_05"}, -- Headhunter sight
                            sight = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
                            animation_wait_attach = {"rail"}
                        }},
                        {dependencies = {"lasgun_rifle_sight_01", "receiver_02|receiver_04|receiver_05"}, -- Headhunter sight
                            sight = {offset = true, position = vector3_box(0, -.028, .026), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
                            animation_wait_attach = {"rail"}
                        }},
                    --#endregion
                    -- Braced receiver
                        {dependencies = {"autogun_rifle_sight_01", "receiver_03|receiver_06|receiver_07"}, -- Infantry sight
                            sight = {offset = true, position = vector3_box(0, .03, .0005), rotation = vector3_box(0, 0, 0), scale = vector3_box(.9, 1, 1),
                            animation_wait_attach = {"rail"}
                        }},
                        {dependencies = {"autogun_rifle_ak_sight_01", "receiver_03|receiver_06|receiver_07"}, -- Braced sight
                            sight = {offset = true, position = vector3_box(0, .01, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
                            animation_wait_attach = {"rail"}
                        }},
                        {dependencies = {"autogun_rifle_killshot_sight_01", "receiver_03|receiver_06|receiver_07"}, -- Headhunter sight
                            sight = {offset = true, position = vector3_box(0, .01, .001), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
                            animation_wait_attach = {"rail"}
                        }},
                        {dependencies = {"lasgun_rifle_sight_01", "receiver_03|receiver_06|receiver_07"}, -- Headhunter sight
                            sight = {offset = true, position = vector3_box(0, -.01, .026), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, .65, 1),
                            animation_wait_attach = {"rail"}
                        }},
                        {dependencies = {"receiver_02|receiver_04|receiver_05"}, -- Sight
                            sight = {offset = true, position = vector3_box(0, -.045, 0), rotation = vector3_box(0, 0, 0),
                            animation_wait_attach = {"rail"}
                        }},
                        {dependencies = {"receiver_03|receiver_06|receiver_07"}, -- Sight
                            sight = {offset = true, position = vector3_box(0, -.035, 0), rotation = vector3_box(0, 0, 0),
                            animation_wait_attach = {"rail"}
                        }},
                    --#endregion
                    {sight = {offset = true, animation_wait_attach = {"rail"}}},
                --#endregion
                --#region Barrels
                    {dependencies = {"barrel_13|barrel_14", "receiver_01"}, -- Barrel 7
                        barrel = {offset = true, position = vector3_box(0, 0, -.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
                            animation_wait_detach = {"rail"}, trigger_move = {"rail"},
                    }},
                    {dependencies = {_braced_barrels, "receiver_01|receiver_02|receiver_04|receiver_05"}, -- Barrel 7
                        barrel = {offset = true, position = vector3_box(0, 0, -.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
                    }},
                    {dependencies = {"barrel_01|barrel_02|barrel_03|barrel_04|barrel_05|barrel_06|barrel_11|barrel_12|barrel_15|barrel_16", "receiver_03|receiver_06|receiver_07"}, -- Barrel 7
                        barrel = {offset = true, position = vector3_box(0, 0, .034), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
                    }},
                    {dependencies = {"barrel_01|barrel_03|barrel_05|barrel_06", "receiver_01"}, -- Barrel 7
                        barrel = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
                            animation_wait_detach = {"rail"}, trigger_move = {"rail"},
                    }},
                --#endregion
                --#region Rails
                    -- Infantry receiver
                    {dependencies = {"rail_01", "receiver_01", "barrel_01|barrel_03"}, -- Bigger than receiver
                        rail = {offset = true, position = vector3_box(0, -.02, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 2.2, 1),
                            animation_wait_detach = {"sight", "sight_2"}, trigger_move = {"sight", "sight_2"},
                            animation_wait_attach = {"barrel"}
                    }},
                    {dependencies = {"rail_01", "receiver_01", "barrel_02|barrel_04|barrel_11|barrel_12|barrel_15|barrel_16"},
                        rail = {offset = true, position = vector3_box(0, -.05, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.3, 1),
                            animation_wait_detach = {"sight", "sight_2"}, trigger_move = {"sight", "sight_2"},
                    }},
                    {dependencies = {"rail_01", "receiver_01", "barrel_05|barrel_06"}, -- Bigger than receiver
                        rail = {offset = true, position = vector3_box(0, -.03, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 2, 1),
                            animation_wait_detach = {"sight", "sight_2"}, trigger_move = {"sight", "sight_2"},
                            animation_wait_attach = {"barrel"}
                    }},
                    {dependencies = {"rail_01", "receiver_01", "barrel_07|barrel_08|barrel_09|barrel_10|barrel_18|barrel_19"},
                        rail = {offset = true, position = vector3_box(0, -.05, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.1, 1),
                    }},
                    {dependencies = {"rail_01", "receiver_01", "barrel_13"}, -- Bigger than receiver
                        rail = {offset = true, position = vector3_box(0, -.04, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.7, 1),
                            animation_wait_detach = {"sight", "sight_2"}, trigger_move = {"sight", "sight_2"},
                            animation_wait_attach = {"barrel"}
                    }},
                    {dependencies = {"rail_01", "receiver_01", "barrel_14"}, -- Bigger than receiver
                        rail = {offset = true, position = vector3_box(0, -.04, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1),
                            animation_wait_detach = {"sight", "sight_2"}, trigger_move = {"sight", "sight_2"},
                            animation_wait_attach = {"barrel"}
                    }},
                    {dependencies = {"rail_01", "!receiver_01"},
                        rail = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0, 0, 0),
                            animation_wait_detach = {"sight", "sight_2"}, trigger_move = {"sight", "sight_2"},
                    }},
                --#endregion
                --#region Sight offsets
                    -- Infantry receiver / Infantry barrels
                    -- Braced sight
                    {dependencies = {"barrel_01|barrel_02|barrel_03|barrel_04|barrel_05|barrel_06", "autogun_rifle_ak_sight_01", "receiver_01"},
                        no_scope_offset = {position = vector3_box(0, 0, -.002), rotation = vector3_box(-.3, 0, 0)}},
                    -- Headhunter sight
                    {dependencies = {"barrel_01|barrel_02|barrel_03|barrel_04|barrel_05|barrel_06", "autogun_rifle_killshot_sight_01", "receiver_01"},
                        no_scope_offset = {position = vector3_box(0, 0, -.001), rotation = vector3_box(-.2, 0, 0)}},
                    -- Lasgun sight
                    {dependencies = {"barrel_01|barrel_02|barrel_03|barrel_04|barrel_05|barrel_06", "lasgun_rifle_sight_01", "receiver_01"},
                        no_scope_offset = {position = vector3_box(0, 0, -.0075), rotation = vector3_box(-.55, 0, 0)}},

                    -- Infantry receiver / Braced barrels
                    -- Infantry sight
                    {dependencies = {_braced_barrels, "autogun_rifle_sight_01", "receiver_01"},
                        no_scope_offset = {position = vector3_box(0, 0, -.00075), rotation = vector3_box(.75, 0, 0)}},
                    -- Braced sight
                    {dependencies = {_braced_barrels, "autogun_rifle_ak_sight_01", "receiver_01"},
                        no_scope_offset = {position = vector3_box(0, 0, -.003), rotation = vector3_box(.4, 0, 0)}},
                    -- Headhunter sight
                    {dependencies = {_braced_barrels, "autogun_rifle_killshot_sight_01", "receiver_01"},
                        no_scope_offset = {position = vector3_box(0, 0, -.002), rotation = vector3_box(.75, 0, 0)}},
                    -- Lasgun sight
                    {dependencies = {_braced_barrels, "lasgun_rifle_sight_01", "receiver_01"},
                        no_scope_offset = {position = vector3_box(0, 0, -.008), rotation = vector3_box(-.1, 0, 0)}},

                    -- Infantry receiver / Headhunter barrels
                    -- Infantry sight
                    {dependencies = {"barrel_16", "autogun_rifle_sight_01", "receiver_01"},
                        no_scope_offset = {position = vector3_box(0, 0, -.001), rotation = vector3_box(.7, 0, 0)}},
                    -- Braced sight
                    {dependencies = {"barrel_16", "autogun_rifle_ak_sight_01", "receiver_01"},
                        no_scope_offset = {position = vector3_box(0, 0, -.003), rotation = vector3_box(.5, 0, 0)}},
                    {dependencies = {"barrel_11|barrel_12|barrel_15", "autogun_rifle_ak_sight_01", "receiver_01"},
                        no_scope_offset = {position = vector3_box(0, 0, -.0025), rotation = vector3_box(-.3, 0, 0)}},
                    -- Headhunter sight
                    {dependencies = {"barrel_16", "autogun_rifle_killshot_sight_01", "receiver_01"},
                        no_scope_offset = {position = vector3_box(0, 0, -.002), rotation = vector3_box(.7, 0, 0)}},
                    {dependencies = {"barrel_11|barrel_12|barrel_15", "autogun_rifle_killshot_sight_01", "receiver_01"},
                        no_scope_offset = {position = vector3_box(0, 0, -.001), rotation = vector3_box(-.1, 0, 0)}},
                    -- Lasgun sight
                    {dependencies = {"barrel_16", "lasgun_rifle_sight_01", "receiver_01"},
                        no_scope_offset = {position = vector3_box(0, 0, -.008), rotation = vector3_box(-.1, 0, 0)}},
                    {dependencies = {"barrel_11|barrel_12|barrel_15", "lasgun_rifle_sight_01", "receiver_01"}, 
                        no_scope_offset = {position = vector3_box(0, 0, -.0075), rotation = vector3_box(-.5, 0, 0)}},

                    -- Headhunter receiver / Infantry barrels
                    -- Infantry sight
                    {dependencies = {"barrel_01|barrel_02|barrel_03|barrel_04|barrel_05|barrel_06", "autogun_rifle_sight_01", "receiver_02|receiver_04|receiver_05"},
                        no_scope_offset = {position = vector3_box(0, 0, -.0035), rotation = vector3_box(-.1, 0, 0)}},
                    -- Braced sight
                    {dependencies = {"barrel_01|barrel_02|barrel_03|barrel_04|barrel_05|barrel_06", "autogun_rifle_ak_sight_01", "receiver_02|receiver_04|receiver_05"},
                        no_scope_offset = {position = vector3_box(0, 0, -.001), rotation = vector3_box(-.25, 0, 0)}},
                    -- Headhunter sight
                    {dependencies = {"barrel_01|barrel_02|barrel_03|barrel_04|barrel_05|barrel_06", "autogun_rifle_killshot_sight_01", "receiver_02|receiver_04|receiver_05"},
                        no_scope_offset = {position = vector3_box(0, 0, .001), rotation = vector3_box(-.1, 0, 0)}},
                    -- Lasgun sight
                    {dependencies = {"barrel_01|barrel_02|barrel_03|barrel_04|barrel_05|barrel_06", "lasgun_rifle_sight_01", "receiver_02|receiver_04|receiver_05"},
                        no_scope_offset = {position = vector3_box(0, 0, -.0065), rotation = vector3_box(-.55, 0, 0)}},

                    -- Headhunter receiver / Braced barrels
                    -- Infantry sight
                    {dependencies = {_braced_barrels, "autogun_rifle_sight_01", "receiver_02|receiver_04|receiver_05"},
                        no_scope_offset = {position = vector3_box(0, 0, -.004), rotation = vector3_box(.4, 0, 0)}},
                    -- Braced sight
                    {dependencies = {_braced_barrels, "autogun_rifle_ak_sight_01", "receiver_02|receiver_04|receiver_05"},
                        no_scope_offset = {position = vector3_box(0, 0, -.002), rotation = vector3_box(.5, 0, 0)}},
                    -- Headhunter sight
                    {dependencies = {_braced_barrels, "autogun_rifle_killshot_sight_01", "receiver_02|receiver_04|receiver_05"},
                        no_scope_offset = {position = vector3_box(0, 0, 0), rotation = vector3_box(.75, 0, 0)}},
                    -- Lasgun sight
                    {dependencies = {_braced_barrels, "lasgun_rifle_sight_01", "receiver_02|receiver_04|receiver_05"},
                        no_scope_offset = {position = vector3_box(0, 0, -.007), rotation = vector3_box(0, 0, 0)}},

                    -- Headhunter receiver / Headhunter barrels
                    -- Infantry sight
                    {dependencies = {"barrel_16", "autogun_rifle_sight_01", "receiver_02|receiver_04|receiver_05"}, -- Barrel 16
                        no_scope_offset = {position = vector3_box(0, 0, -.004), rotation = vector3_box(.3, 0, 0)}},
                    {dependencies = {"barrel_11|barrel_12|barrel_15", "autogun_rifle_sight_01", "receiver_02|receiver_04|receiver_05"},
                        no_scope_offset = {position = vector3_box(0, 0, -.003), rotation = vector3_box(-.2, 0, 0)}},
                    -- Braced sight
                    {dependencies = {"barrel_16", "autogun_rifle_ak_sight_01", "receiver_02|receiver_04|receiver_05"}, -- Barrel 16
                        no_scope_offset = {position = vector3_box(0, 0, -.0015), rotation = vector3_box(.5, 0, 0)}},
                    {dependencies = {"barrel_11|barrel_12|barrel_15", "autogun_rifle_ak_sight_01", "receiver_02|receiver_04|receiver_05"},
                        no_scope_offset = {position = vector3_box(0, 0, -.001), rotation = vector3_box(-.1, 0, 0)}},
                    -- Headhunter sight
                    {dependencies = {"barrel_16", "autogun_rifle_killshot_sight_01", "receiver_02|receiver_04|receiver_05"}, -- Barrel 16
                        no_scope_offset = {position = vector3_box(0, 0, 0), rotation = vector3_box(.7, 0, 0)}},
                    {dependencies = {"barrel_11|barrel_12|barrel_15", "autogun_rifle_killshot_sight_01", "receiver_02|receiver_04|receiver_05"}, 
                        no_scope_offset = {position = vector3_box(0, 0, .001), rotation = vector3_box(0, 0, 0)}},
                    -- Lasgun sight
                    {dependencies = {"barrel_16", "lasgun_rifle_sight_01", "receiver_02|receiver_04|receiver_05"}, -- Barrel 16
                        no_scope_offset = {position = vector3_box(0, 0, -.007), rotation = vector3_box(-.1, 0, 0)}},
                    {dependencies = {"barrel_11|barrel_12|barrel_15", "lasgun_rifle_sight_01", "receiver_02|receiver_04|receiver_05"}, 
                        no_scope_offset = {position = vector3_box(0, 0, -.0065), rotation = vector3_box(-.5, 0, 0)}},

                    -- Braced receiver / Infantry barrels
                    -- Infantry sight
                    {dependencies = {"barrel_01|barrel_02|barrel_03|barrel_04|barrel_05|barrel_06", "autogun_rifle_sight_01", "receiver_03|receiver_06|receiver_07"},
                        no_scope_offset = {position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0)}},
                    -- Braced sight
                    {dependencies = {"barrel_01|barrel_02|barrel_03|barrel_04|barrel_05|barrel_06", "autogun_rifle_ak_sight_01", "receiver_03|receiver_06|receiver_07"},
                        no_scope_offset = {position = vector3_box(0, 0, -.002), rotation = vector3_box(-.25, 0, 0)}},
                    -- Headhunter sight
                    {dependencies = {"barrel_01|barrel_02|barrel_03|barrel_04|barrel_05|barrel_06", "autogun_rifle_killshot_sight_01", "receiver_03|receiver_06|receiver_07"},
                        no_scope_offset = {position = vector3_box(0, 0, 0), rotation = vector3_box(-.1, 0, 0)}},
                    -- Lasgun sight
                    {dependencies = {"barrel_01|barrel_02|barrel_03|barrel_04|barrel_05|barrel_06", "lasgun_rifle_sight_01", "receiver_03|receiver_06|receiver_07"},
                        no_scope_offset = {position = vector3_box(0, 0, -.009), rotation = vector3_box(-.9, 0, 0)}},

                    -- Braced receiver / Braced barrels
                    -- Infantry sight
                    {dependencies = {_braced_barrels, "autogun_rifle_sight_01", "receiver_03|receiver_06|receiver_07"},
                        no_scope_offset = {position = vector3_box(0, 0, 0), rotation = vector3_box(.8, 0, 0)}},
                    -- Braced sight
                    {dependencies = {_braced_barrels, "autogun_rifle_ak_sight_01", "receiver_03|receiver_06|receiver_07"},
                        no_scope_offset = {position = vector3_box(0, 0, -.003), rotation = vector3_box(.5, 0, 0)}},
                    -- Headhunter sight
                    {dependencies = {_braced_barrels, "autogun_rifle_killshot_sight_01", "receiver_03|receiver_06|receiver_07"},
                        no_scope_offset = {position = vector3_box(0, 0, -.001), rotation = vector3_box(.75, 0, 0)}},
                    -- Lasgun sight
                    {dependencies = {_braced_barrels, "lasgun_rifle_sight_01", "receiver_03|receiver_06|receiver_07"},
                        no_scope_offset = {position = vector3_box(0, 0, -.009), rotation = vector3_box(0, 0, 0)}},

                    -- Braced receiver / Headhunter barrels
                    -- Infantry sight
                    {dependencies = {"barrel_16", "autogun_rifle_sight_01", "receiver_03|receiver_06|receiver_07"}, -- Barrel 16
                        no_scope_offset = {position = vector3_box(0, 0, 0), rotation = vector3_box(.5, 0, 0)}},
                    {dependencies = {"barrel_11|barrel_12|barrel_15", "autogun_rifle_sight_01", "receiver_03|receiver_06|receiver_07"}, 
                        no_scope_offset = {position = vector3_box(0, 0, 0), rotation = vector3_box(-.1, 0, 0)}},
                    -- Braced sight
                    {dependencies = {"barrel_16", "autogun_rifle_ak_sight_01", "receiver_03|receiver_06|receiver_07"}, -- Barrel 16
                        no_scope_offset = {position = vector3_box(0, 0, -.0025), rotation = vector3_box(.2, 0, 0)}},
                    {dependencies = {"barrel_11|barrel_12|barrel_15", "autogun_rifle_ak_sight_01", "receiver_03|receiver_06|receiver_07"},
                        no_scope_offset = {position = vector3_box(0, 0, -.003), rotation = vector3_box(-.1, 0, 0)}},
                    -- Headhunter sight
                    {dependencies = {"barrel_16", "autogun_rifle_killshot_sight_01", "receiver_03|receiver_06|receiver_07"}, -- Barrel 16
                        no_scope_offset = {position = vector3_box(0, 0, -.001), rotation = vector3_box(.7, 0, 0)}},
                    {dependencies = {"barrel_11|barrel_12|barrel_15", "autogun_rifle_killshot_sight_01", "receiver_03|receiver_06|receiver_07"},
                        no_scope_offset = {position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0)}},
                    -- Lasgun sight
                    {dependencies = {"barrel_16", "lasgun_rifle_sight_01", "receiver_03|receiver_06|receiver_07"}, -- Barrel 16
                        no_scope_offset = {position = vector3_box(0, 0, -.009), rotation = vector3_box(-.3, 0, 0)}},
                    {dependencies = {"barrel_11|barrel_12|barrel_15", "lasgun_rifle_sight_01", "receiver_03|receiver_06|receiver_07"},
                        no_scope_offset = {position = vector3_box(0, 0, -.009), rotation = vector3_box(-.7, 0, 0)}},
                    -- Default
                    {dependencies = {"lasgun_rifle_sight_01"},
                        no_scope_offset = {position = vector3_box(0, 0, -.008), rotation = vector3_box(-.1, 0, 0)}},
                --#endregion
                --#region Default values
                    {dependencies = {"receiver_01"}, -- Scope Offset
                        scope_offset = {position = vector3_box(0, 0, .0085)}},
                    {dependencies = {"receiver_02|receiver_04|receiver_05"}, -- Scope Offset
                        scope_offset = {position = vector3_box(0, 0, .01025)}},
                    {dependencies = {"receiver_03|receiver_06|receiver_07"}, -- Scope Offset
                        scope_offset = {position = vector3_box(0, 0, .009)}},
                --#endregion
                --#region Emblems
                    {dependencies = {"receiver_01", "emblem_left_02"}, -- Emblems
                        emblem_left = {parent = "receiver", position = vector3_box(-.027, .21, .07), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, -1, 1)}},
                    {dependencies = {"receiver_01"}, -- Emblems
                        emblem_left = {parent = "receiver", position = vector3_box(-.027, .21, .07), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1, 1)},
                        emblem_right = {parent = "receiver", position = vector3_box(.027, .21, .07), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
                    {dependencies = {"receiver_02", "emblem_left_02"}, -- Emblems
                        emblem_left = {parent = "receiver", position = vector3_box(-.029, -.02, .07), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.8, -1.8, 1.8)}},
                    {dependencies = {"receiver_02"}, -- Emblems
                        emblem_left = {parent = "receiver", position = vector3_box(-.029, -.02, .07), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.8, 1.8, 1.8)},
                        emblem_right = {parent = "receiver", position = vector3_box(.029, -.02, .07), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.8, 1.8, 1.8)}},
                    {dependencies = {"receiver_03|receiver_06|receiver_07", "emblem_left_02"}, -- Emblems
                        emblem_left = {parent = "receiver", position = vector3_box(-.0215, .11, .102), rotation = vector3_box(0, 20, 180), scale = vector3_box(1, -1, 1)}},
                    {dependencies = {"receiver_03|receiver_06|receiver_07"}, -- Emblems
                        emblem_left = {parent = "receiver", position = vector3_box(-.0215, .11, .102), rotation = vector3_box(0, 20, 180), scale = vector3_box(1, 1, 1)},
                        emblem_right = {parent = "receiver", position = vector3_box(.029, -.02, .06), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.5, 1.5, 1.5)}},
                    {dependencies = {"receiver_04", "emblem_left_02"}, -- Emblems
                        emblem_left = {parent = "receiver", position = vector3_box(-.03, .1575, .057), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, -1, 1)}},
                    {dependencies = {"receiver_04"}, -- Emblems
                        emblem_left = {parent = "receiver", position = vector3_box(-.03, .1575, .057), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1, 1)},
                        emblem_right = {parent = "receiver", position = vector3_box(.03, .19, .04), rotation = vector3_box(0, 0, 0), scale = vector3_box(.7, .7, .7)}},
                    {dependencies = {"receiver_05", "emblem_left_02"}, -- Emblems
                        emblem_left = {parent = "receiver", position = vector3_box(-.03, .135, .06), rotation = vector3_box(0, 0, 180), scale = vector3_box(.7, -.7, .7)}},
                    {dependencies = {"receiver_05"}, -- Emblems
                        emblem_left = {parent = "receiver", position = vector3_box(-.03, .135, .06), rotation = vector3_box(0, 0, 180), scale = vector3_box(.7, .7, .7)},
                        emblem_right = {parent = "receiver", position = vector3_box(.03, .19, .04), rotation = vector3_box(0, 0, 0), scale = vector3_box(.7, .7, .7)}},
                --#endregion
                --#region Trinket hooks
                    {dependencies = {"grip_01", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.115, -.15), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"}}},
                    {dependencies = {"grip_02", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.12, -.165), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"}}},
                    {dependencies = {"grip_03", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.155, -.125), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"}}},
                    {dependencies = {"grip_04", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.132, -.136), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"}}},
                    {dependencies = {"grip_05", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.145, -.120), rotation = vector3_box(-35, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook_empty"}, automatic_equip = {trinket_hook = "trinket_hook_empty|trinket_hook_02"}}},
                    {dependencies = {"grip_06", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.12, -.145), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"}}},
                    {dependencies = {"grip_07", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.132, -.136), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"}}},
                    {dependencies = {"grip_08", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.145, -.120), rotation = vector3_box(-35, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook_empty"}, automatic_equip = {trinket_hook = "trinket_hook_empty|trinket_hook_02"}}},
                    {dependencies = {"grip_09|grip_10|grip_11|grip_31|grip_32", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", parent_node = 5, position = vector3_box(.018, 0, 0), rotation = vector3_box(90, 0, -90), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "trinket_hook_empty"}}},
                    {dependencies = {"grip_12", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.155, -.13), rotation = vector3_box(-35, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook_empty"}, automatic_equip = {trinket_hook = "trinket_hook_empty|trinket_hook_02"}}},
                    {dependencies = {"grip_14", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.165, -.115), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"}}},
                    {dependencies = {"grip_13|grip_15|grip_34", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.145, -.12), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook_empty"}, automatic_equip = {trinket_hook = "trinket_hook_empty|trinket_hook_02"}}},
                    {dependencies = {"grip_30", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.125, -.12), rotation = vector3_box(-35, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook_empty"}, automatic_equip = {trinket_hook = "trinket_hook_empty|trinket_hook_02"}}},
                    {dependencies = {"grip_19|grip_33", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.115, -.14), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"}}},
                    {dependencies = {"grip_20", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.125, -.15), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"}}},
                    {dependencies = {"grip_21", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.12, -.15), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"}}},
                    {dependencies = {"grip_22", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.12, -.145), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"}}},
                    {dependencies = {"grip_23", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.12, -.145), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"}}},
                    {dependencies = {"grip_24", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.135, -.15), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"}}},
                    {dependencies = {"grip_25", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.165, -.11), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"}}},
                    {dependencies = {"grip_26", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.165, -.11), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"}}},
                    {dependencies = {"grip_27|grip_28|grip_29", _infantry_and_braced_barrels}, -- Trinket
                        trinket_hook = {parent = "grip", position = vector3_box(0, -.17, -.11), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook_empty"}, automatic_equip = {trinket_hook = "trinket_hook_empty|trinket_hook_02"}}},

                    {dependencies = {"barrel_11"}, -- Trinket
                        trinket_hook = {parent = "barrel", position = vector3_box(0, .25, -.105), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"}}},
                    {dependencies = {"barrel_15"}, -- Trinket
                        trinket_hook = {parent = "barrel", position = vector3_box(0, .255, -.12), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"}}},
                    {dependencies = {"barrel_16"}, -- Trinket
                        trinket_hook = {parent = "barrel", position = vector3_box(0, .23, -.11), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"}}},
                    {dependencies = {"barrel_12"}, -- Trinket
                        trinket_hook = {parent = "barrel", parent_node = 3, position = vector3_box(.029, 0, 0), rotation = vector3_box(90, 0, -45), scale = vector3_box(1, 1, 1),
                        no_support = {"trinket_hook"}, automatic_equip = {trinket_hook = "!trinket_hook_empty|trinket_hook_empty"}}},
                --#endregion
                --#region Magazines
                    {dependencies = {"receiver_02|receiver_04|receiver_05", "auto_pistol_magazine_01"}, -- Magazine
                        magazine = {offset = true, position = vector3_box(0, .01, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.6, 1.6)}},
                    {dependencies = {"auto_pistol_magazine_01"}, -- Magazine
                        magazine = {offset = true, position = vector3_box(0, .0025, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.6, 1.6)}},
                    {dependencies = {"receiver_02|receiver_04|receiver_05", "bolter_magazine_01"}, -- Magazine
                        magazine = {offset = true, position = vector3_box(0, .005, -.035), rotation = vector3_box(0, 0, 0), scale = vector3_box(.7, 1, 1)}},
                    {dependencies = {"bolter_magazine_01"}, -- Magazine
                        magazine = {offset = true, position = vector3_box(0, 0, -.035), rotation = vector3_box(0, 0, 0), scale = vector3_box(.7, 1, 1)}},
                    {dependencies = {"receiver_02|receiver_04|receiver_05", "bolter_magazine_02"}, -- Magazine
                        magazine = {offset = true, position = vector3_box(0, .005, -.035), rotation = vector3_box(0, 0, 0), scale = vector3_box(.7, 1, 1)}},
                    {dependencies = {"bolter_magazine_02"}, -- Magazine
                        magazine = {offset = true, position = vector3_box(0, 0, -.035), rotation = vector3_box(0, 0, 0), scale = vector3_box(.7, 1, 1)}},
                    {dependencies = {"bolter_magazine_03"}, -- Magazine
                        magazine = {offset = true, position = vector3_box(0, 0, -.05), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.2, 1.2)}},
                --#endregion
            },
        },
    }
)

return definitions
