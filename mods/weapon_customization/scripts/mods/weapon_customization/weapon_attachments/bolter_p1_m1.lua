local mod = get_mod("weapon_customization")

-- ##### ┬─┐┌─┐┌─┐ ┬ ┬┬┬─┐┌─┐ #########################################################################################
-- ##### ├┬┘├┤ │─┼┐│ ││├┬┘├┤  #########################################################################################
-- ##### ┴└─└─┘└─┘└└─┘┴┴└─└─┘ #########################################################################################

--#region Require
	local _common = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/common")
	local _common_ranged = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/common_ranged")
	local _common_lasgun = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/common_lasgun")
	local _bolter_p1_m1 = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/functions/bolter_p1_m1")
	local _autopistol_p1_m1 = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/autopistol_p1_m1")
	local _ogryn_rippergun_p1_m1 = mod:io_dofile("weapon_customization/scripts/mods/weapon_customization/weapon_attachments/ogryn_rippergun_p1_m1")
--#endregion

-- ##### ┌┬┐┌─┐┌┬┐┌─┐ #################################################################################################
-- #####  ││├─┤ │ ├─┤ #################################################################################################
-- ##### ─┴┘┴ ┴ ┴ ┴ ┴ #################################################################################################

--#region Data
	local _sights = "bolter_sight_01|bolter_sight_02"
	local _barrels = "bolter_barrel_01|bolter_barrel_02"
	local _magazines = "bolter_magazine_01|bolter_magazine_02"
	local _underbarrels = "underbarrel_01|underbarrel_02|underbarrel_03"
	local _receivers = "receiver_01|receiver_02|receiver_03|receiver_04|receiver_05"
--#endregion

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

local changes = {}
return table_combine(
	_bolter_p1_m1,
	{
		attachments = {
			-- Native
			receiver = _bolter_p1_m1.receiver_attachments(),
			barrel = _bolter_p1_m1.barrel_attachments(),
			underbarrel = _bolter_p1_m1.underbarrel_attachments(),
			sight = table_icombine(
				_bolter_p1_m1.sight_attachments(),
				_common_ranged.reflex_sights_attachments(false),
				_common_ranged.scopes_attachments(false)
			),
			-- Ranged
			flashlight = _common_ranged.flashlights_attachments(),
			magazine = table_icombine(
				_common_ranged.magazine_attachments()
			),
			bayonet = _common_ranged.bayonet_attachments(),
			grip = _common_ranged.grip_attachments(),
			stock = _common_ranged.stock_attachments(),
			-- Lasgun
			-- rail = _common_lasgun.rail_attachments(),
			-- Other
			muzzle = table_icombine(
				_autopistol_p1_m1.muzzle_attachments(),
				_ogryn_rippergun_p1_m1.barrel_attachments(false)
			),
			-- Common
			trinket_hook = _common.trinket_hook_attachments(),
			emblem_right = _common.emblem_right_attachments(),
			emblem_left = _common.emblem_left_attachments(),
		},
		models = table_combine(
			-- Native
			_bolter_p1_m1.receiver_models(nil, 0, vector3_box(0, 0, 0), vector3_box(0, 0, -.00001)),
			_bolter_p1_m1.barrel_models(nil, -.5, vector3_box(.2, -2, 0), vector3_box(0, .2, 0)),
			_bolter_p1_m1.underbarrel_models(nil, -.5, vector3_box(0, -4, 0), vector3_box(0, 0, -.2)),
			_bolter_p1_m1.sight_models(nil, -.5, vector3_box(-.3, -4, -.2), vector3_box(0, -.2, 0), "sight", {}, {
				{rail = "rail_default", sight_2 = "sight_default"},
				{rail = "rail_default", sight_2 = "sight_default"},
				{rail = "rail_default", sight_2 = "sight_default"},
				{rail = "rail_default", sight_2 = "sight_default"},
			}),
			-- Ranged
			_common_ranged.flashlight_models("receiver", -2.5, vector3_box(-.3, -3, 0), vector3_box(.2, 0, 0)),
			_common_ranged.grip_models(nil, -.1, vector3_box(-.4, -4, .2), vector3_box(0, -.1, -.1), "grip", {
				{"trinket_hook_empty"},
				{"trinket_hook"},
				{"trinket_hook"},
				{"trinket_hook"},
				{"trinket_hook"},
				{"trinket_hook_empty"},
				{"trinket_hook"},
				{"trinket_hook"},
				{"trinket_hook_empty"},
				{"trinket_hook"},
				{"trinket_hook"},
				{"trinket_hook"},
				{"trinket_hook_empty"},
				{"trinket_hook_empty"},
				{"trinket_hook"},
				{"trinket_hook_empty"},
				{"trinket_hook"},
				{"trinket_hook"},
				{"trinket_hook"},
				{"trinket_hook"},
				{"trinket_hook"},
				{"trinket_hook"},
				{"trinket_hook"},
				{"trinket_hook"},
			}, {
				{trinket_hook = "trinket_hook_empty|trinket_hook_default"},
				{trinket_hook = "trinket_hook_empty"},
				{trinket_hook = "trinket_hook_empty"},
				{trinket_hook = "trinket_hook_empty"},
				{trinket_hook = "trinket_hook_empty"},
				{trinket_hook = "trinket_hook_empty|trinket_hook_default"},
				{trinket_hook = "trinket_hook_empty"},
				{trinket_hook = "trinket_hook_empty"},
				{trinket_hook = "trinket_hook_empty|trinket_hook_default"},
				{trinket_hook = "trinket_hook_empty"},
				{trinket_hook = "trinket_hook_empty"},
				{trinket_hook = "trinket_hook_empty"},
				{trinket_hook = "trinket_hook_empty|trinket_hook_default"},
				{trinket_hook = "trinket_hook_empty|trinket_hook_default"},
				{trinket_hook = "trinket_hook_empty"},
				{trinket_hook = "trinket_hook_empty|trinket_hook_default"},
				{trinket_hook = "trinket_hook_empty"},
				{trinket_hook = "trinket_hook_empty"},
				{trinket_hook = "trinket_hook_empty"},
				{trinket_hook = "trinket_hook_empty"},
				{trinket_hook = "trinket_hook_empty"},
				{trinket_hook = "trinket_hook_empty"},
				{trinket_hook = "trinket_hook_empty"},
				{trinket_hook = "trinket_hook_empty"},
			}),
			_common_ranged.reflex_sights_models("receiver", -.5, vector3_box(-.3, -4, -.2), vector3_box(0, -.2, 0), "sight", {}, {
				{rail = "rail_default", sight_2 = "sight_default"},
				{rail = "rail_01", sight_2 = "sight_default"},
				{rail = "rail_01", sight_2 = "sight_default"},
				{rail = "rail_01", sight_2 = "sight_default"},
			}),
			_common_ranged.sights_models(nil, .35, vector3_box(-.3, -4, -.2), {
				vector3_box(-.2, 0, 0),
				vector3_box(0, -.2, 0),
				vector3_box(0, -.2, 0),
				vector3_box(0, -.2, 0),
				vector3_box(-.2, 0, 0),
				vector3_box(0, -.2, 0),
				vector3_box(0, -.2, 0),
				vector3_box(0, -.2, 0),
				vector3_box(0, -.2, 0),
			}, "sight", {}, {
				{rail = "rail_default", sight_2 = "sight_default"},
				{rail = "rail_01", sight_2 = "sight_default"},
				{rail = "rail_default", sight_2 = "sight_default"},
				{rail = "rail_01", sight_2 = "sight_default"},
				{rail = "rail_default", sight_2 = "sight_default"},
				{rail = "rail_default", sight_2 = "scope_sight_03", lens = "scope_lens_02", lens_2 = "scope_lens_2_02"},
				{rail = "rail_default", sight_2 = "scope_sight_02", lens = "scope_lens_02", lens_2 = "scope_lens_2_02"},
				{rail = "rail_default", sight_2 = "scope_sight_03", lens = "scope_lens_02", lens_2 = "scope_lens_2_02"},
				{rail = "rail_default", sight_2 = "sight_default"},
			}, {
				{},
				{},
				{},
				{},
				{{"sight", 1}},
				{},
				{},
				{},
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
			_common_ranged.scope_sights_models("sight", .2, vector3_box(-.3, -4, -.2), vector3_box(0, 0, 0), "sight_2", {}, {
				{rail = "rail_default"},
				{rail = "rail_01"},
				{rail = "rail_01"},
				{rail = "rail_01"},
				{rail = "rail_default"},
			}),
			_common_ranged.scope_lens_models("sight_2", .2, vector3_box(-.3, -4, -.2), vector3_box(0, 0, 0)),
			_common_ranged.scope_lens_2_models("sight_2", .2, vector3_box(-.3, -4, -.2), vector3_box(0, 0, 0)),
			_common_ranged.stock_models("receiver", 0, vector3_box(-.6, -4, 0), vector3_box(0, -.2, 0)),
			_common_ranged.magazine_models(nil, 0, vector3_box(-.2, -3, .1), vector3_box(0, 0, -.2)),
			_common_ranged.bayonet_models("barrel", -.5, vector3_box(.3, -4, 0), vector3_box(0, .4, 0)),
			-- Lasgun
			_common_lasgun.rail_models("receiver", 0, vector3_box(0, 0, 0), vector3_box(0, 0, .2)),
			-- Other
			_autopistol_p1_m1.muzzle_models("barrel", -.5, vector3_box(.2, -2, 0), vector3_box(0, .2, 0)),
			_ogryn_rippergun_p1_m1.barrel_models("receiver", -.5, vector3_box(.2, -2, 0), vector3_box(0, .3, 0), "muzzle"),
			-- Common
			_common.trinket_hook_models("grip", -.2, vector3_box(-.1, -4, .2), vector3_box(0, 0, -.2)),
			_common.emblem_right_models("receiver", -3, vector3_box(0, -4, 0), vector3_box(.2, 0, 0)),
			_common.emblem_left_models("receiver", 0, vector3_box(0, -4, 0), vector3_box(.2, 0, 0))
		),
		anchors = {
			-- scope_offset = {position = vector3_box(0, 0, .022)},
			trinket_slot = "slot_trinket_2",
			fixes = {

				{dependencies = {"bolter_magazine_03"}, -- Magazine
					magazine = {offset = true, position = vector3_box(0, -.01, -.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},




				{dependencies = {"scope_01"}, -- Lasgun sight
					sight = {offset = true, position = vector3_box(0, -.06, .19), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1)},
					lens = {offset = true, position = vector3_box(0, .12, .034), rotation = vector3_box(0, 0, 0), scale = vector3_box(.64, .6, .7), data = {lens = 1}},
					lens_2 = {offset = true, position = vector3_box(0, .01, .034), rotation = vector3_box(180, 0, 0), scale = vector3_box(.64, .85, .7), data = {lens = 2}},
					sight_2 = {offset = true, position = vector3_box(0, .07, -.046), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.5, .4, 1.35), hide_mesh = {{"sight_2", 5}}},
					scope_offset = {position = vector3_box(0, -.075, -.014), rotation = vector3_box(0, 0, 0), fov = 15, custom_fov = 27, fov_multiplier = 1.8, aim_scale = .65, lense_transparency = true},
					rail = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0, 0, 0)}},
					
				{dependencies = {"scope_02"}, -- Lasgun sight
					sight = {offset = true, position = vector3_box(0, -.08, .19), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 3, 1)},
					lens = {offset = true, position = vector3_box(0, -.02, .035), rotation = vector3_box(0, 0, 0), scale = vector3_box(.62, .4, .7), data = {lens = 1}},
					lens_2 = {offset = true, position = vector3_box(0, -.14, .035), rotation = vector3_box(180, 0, 0), scale = vector3_box(.62, .4, .7), data = {lens = 2}},
					sight_2 = {offset = true, position = vector3_box(0, .09, -.0475), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.5, .4, 1.35), hide_mesh = {{"sight_2", 3, 4, 5}}},
					scope_offset = {position = vector3_box(0, -.1, -.0165), rotation = vector3_box(0, 0, 0), fov = 9, custom_fov = 24, fov_multiplier = 2, aim_scale = .65, lense_transparency = true},
					rail = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0, 0, 0)}},

				{dependencies = {"scope_03"}, -- Lasgun sight
					sight = {offset = true, position = vector3_box(0, -.03, .19), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
					lens = {offset = true, position = vector3_box(0, .08, .034), rotation = vector3_box(0, 0, 0), scale = vector3_box(.62, 1, .62), data = {lens = 1}},
					lens_2 = {offset = true, position = vector3_box(0, .22, .034), rotation = vector3_box(180, 0, 0), scale = vector3_box(.62, 1, .62), data = {lens = 2}},
					sight_2 = {offset = true, position = vector3_box(0, 0, -.0425), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.5, .4, 1.35), hide_mesh = {{"sight_2", 5}}},
					scope_offset = {position = vector3_box(0, -.13, -.02), fov = 25, custom_fov = 32.5, custom_fov_multiplier = 1.3, aim_scale = .75, lense_transparency = true},
					rail = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0, 0, 0)}},

				{sight_2 = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0, 0, 0)}},
				{lens = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0, 0, 0)}},
				{lens_2 = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0, 0, 0)}},



				{dependencies = {"grip_27|grip_28|grip_29"}, -- Grip
					grip = {offset = true, position = vector3_box(0, .01, -.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},



				{dependencies = {"receiver_01", "emblem_left_02"}, -- Emblem
					emblem_left = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, -1, 1)}},
				{dependencies = {"receiver_02", "emblem_left_02"}, -- Emblem
					emblem_left = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, -1, 1)}},



				{dependencies = {"!trinket_hook"}, -- Sight
					trinket_hook = {parent = "underbarrel", position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},



				{dependencies = {"reflex_sight_01"}, -- Sight
					sight = {offset = true, position = vector3_box(0, .03, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"reflex_sight_02"}, -- Sight
					sight = {offset = true, position = vector3_box(0, .03, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"reflex_sight_03"}, -- Sight
					sight = {offset = true, position = vector3_box(0, .03, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},



				{dependencies = {"auto_pistol_magazine_01"}, -- Magazine
					magazine = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.4, 1.8, 1)}},
				{dependencies = {"magazine_01"}, -- Magazine
					magazine = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.4, 1, 1)}},
				{dependencies = {"magazine_02"}, -- Magazine
					magazine = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.4, 1, 1)}},
				{dependencies = {"magazine_03"}, -- Magazine
					magazine = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.4, 1, 1)}},
				{dependencies = {"magazine_04"}, -- Magazine
					magazine = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.4, 1, 1)}},



				{dependencies = {"laser_pointer"}, -- Laser Pointer
					flashlight = {parent = "receiver", position = vector3_box(.045, .3, .1), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
				{flashlight = {parent = "receiver", position = vector3_box(.045, .3, .1), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}}, -- Flashlight



				{stock = {parent = "receiver", position = vector3_box(0, -0.1, 0.08), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}}, -- Stocks



				{dependencies = {"reflex_sight_01|reflex_sight_02|reflex_sight_03"}, -- Grip
					scope_offset = {position = vector3_box(0, 0, -.022)},
					rail = {parent = "receiver", position = vector3_box(0, .025, .1625), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.35, 1.3)}},
				{rail = {parent = "receiver", position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0, 0, 0)}}, -- Rail



				{dependencies = {"autogun_bayonet_03"}, -- Bayonet
					bayonet = {parent = "barrel", position = vector3_box(0, .125, -.04), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
				{bayonet = {parent = "barrel", position = vector3_box(0, .2, -.045), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}}, -- Bayonet



				{dependencies = {"muzzle_02"}, -- Muzzle
					muzzle = {parent = "barrel", position = vector3_box(0, .21, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.4, 1.4, 1.4)}},
				{dependencies = {"muzzle_04"}, -- Muzzle
					muzzle = {parent = "barrel", position = vector3_box(0, .177, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.4, 1.4, 1.4)}},
				{dependencies = {"muzzle_05"}, -- Muzzle
					muzzle = {parent = "barrel", position = vector3_box(0, .177, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.4, 1.4, 1.4)}},
				{dependencies = {"barrel_01"}, -- Ripper muzzle
					muzzle = {parent = "barrel", position = vector3_box(0, -.08, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(.56, .56, .56)}},
				{dependencies = {"barrel_02"}, -- Ripper muzzle
					muzzle = {parent = "barrel", position = vector3_box(0, -.1, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(.56, .56, .56)}},
				{dependencies = {"barrel_03"}, -- Ripper muzzle
					muzzle = {parent = "barrel", position = vector3_box(0, -.1, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(.56, .56, .56)}},
				{dependencies = {"barrel_04"}, -- Ripper muzzle
					muzzle = {parent = "barrel", position = vector3_box(0, -.08, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(.56, .56, .56)}},
				{dependencies = {"barrel_05"}, -- Ripper muzzle
					muzzle = {parent = "barrel", position = vector3_box(0, -.08, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(.56, .56, .56)}},
				{dependencies = {"barrel_06"}, -- Ripper muzzle
					muzzle = {parent = "barrel", position = vector3_box(0, -.1, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(.56, .56, .56)}},
				{muzzle = {position = vector3_box(0, .21, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.4, 1.4, 1.4)}},



				-- {slot_trinket_2 = {parent = "trinket_hook", position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"grip_01"}, -- Trinket
					trinket_hook = {parent = "grip", position = vector3_box(0, -.115, -.15), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"grip_02"}, -- Trinket
					trinket_hook = {parent = "grip", position = vector3_box(0, -.12, -.165), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"grip_03"}, -- Trinket
					trinket_hook = {parent = "grip", position = vector3_box(0, -.155, -.125), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"grip_04"}, -- Trinket
					trinket_hook = {parent = "grip", position = vector3_box(0, -.132, -.136), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"grip_05"}, -- Trinket
					trinket_hook = {parent = "grip", position = vector3_box(0, -.145, -.120), rotation = vector3_box(-35, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"grip_06"}, -- Trinket
					trinket_hook = {parent = "grip", position = vector3_box(0, -.12, -.145), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"grip_07"}, -- Trinket
					trinket_hook = {parent = "grip", position = vector3_box(0, -.132, -.136), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"grip_08"}, -- Trinket
					trinket_hook = {parent = "grip", position = vector3_box(0, -.145, -.120), rotation = vector3_box(-35, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"grip_12"}, -- Trinket
					trinket_hook = {parent = "grip", position = vector3_box(0, -.155, -.13), rotation = vector3_box(-35, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"grip_14"}, -- Trinket
					trinket_hook = {parent = "grip", position = vector3_box(0, -.165, -.115), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"grip_19"}, -- Trinket
					trinket_hook = {parent = "grip", position = vector3_box(0, -.115, -.14), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"grip_20"}, -- Trinket
					trinket_hook = {parent = "grip", position = vector3_box(0, -.125, -.15), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"grip_21"}, -- Trinket
					trinket_hook = {parent = "grip", position = vector3_box(0, -.12, -.15), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"grip_22"}, -- Trinket
					trinket_hook = {parent = "grip", position = vector3_box(0, -.12, -.145), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"grip_23"}, -- Trinket
					trinket_hook = {parent = "grip", position = vector3_box(0, -.12, -.145), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"grip_24"}, -- Trinket
					trinket_hook = {parent = "grip", position = vector3_box(0, -.135, -.15), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"grip_25"}, -- Trinket
					trinket_hook = {parent = "grip", position = vector3_box(0, -.165, -.11), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1)}},
				{dependencies = {"grip_26"}, -- Trinket
					trinket_hook = {parent = "grip", position = vector3_box(0, -.165, -.11), rotation = vector3_box(-45, 0, 0), scale = vector3_box(1, 1, 1)}},
			},
		},
	}
)