local mod = get_mod("LoadoutMonitor")
local lid = Application.user_setting("language_id")
local tactical_overlay_definitions = require("scripts/ui/hud/elements/tactical_overlay/hud_element_tactical_overlay_definitions")
local left_panel = tactical_overlay_definitions.scenegraph_definition.left_panel
local position_y = left_panel.position[2]
local weapon_name_lenghth_lid = {
	en = 29,
	["zh-cn"] = 38,
	ja = 38,
	fr = 30,
}
local weapon_name_size_multiplier_lid = {
	en = 87,
	["zh-cn"] = 90,
	ja = 70,
	fr = 90,
}
local perk_offset_lid = {
	en = 55,
	ja = 110,
	es = 60,
}

return {
	name = mod:localize("mod_name"),
	--description = mod:localize("mod_description"),
	is_togglable = true,
	options = {
		widgets = {
			{
				setting_id = "lobby_exhibition",
				type = "group",
				sub_widgets = {
					{
						setting_id = "lobby_exhibition_weapons",
						type = "checkbox",
						default_value = true,
					},
					{
						setting_id = "lobby_weapon_font_size",
						title = "lobby_weapon_font_size",
						type = "numeric",
						default_value = 17,
						range = { 1, 50 },
					},
					{
						setting_id = "lobby_weapon_offset",
						title = "lobby_weapon_offset",
						type = "numeric",
						default_value = 238,
						range = { -250, 250 },
					},
					{
						setting_id = "lobby_weapon_gap",
						title = "lobby_weapon_gap",
						type = "numeric",
						default_value = 35,
						range = { 1, 100 },
					},
					{
						setting_id = "lobby_exhibition_Keystone",
						type = "checkbox",
						default_value = true,
					},
					{
						setting_id = "lobby_Keystone_font_size",
						title = "setting_font_size",
						type = "numeric",
						default_value = 35,
						range = { 1, 50 },
					},
					{
						setting_id = "lobby_talent_offset",
						title = "setting_offset_x",
						type = "numeric",
						default_value = 125,
						range = { -250, 300 },
					},
					{
						setting_id = "lobby_talent_offset_y",
						title = "setting_offset_y",
						type = "numeric",
						default_value = 190,
						range = { -250, 300 },
					},
				},
				
			},
			{
				setting_id = "setting_player_name_group",
				type = "group",
				sub_widgets = {
					{
						setting_id = "display_player_name",
						type = "checkbox",
						default_value = false,
					},
					{
						setting_id = "player_name_font_size",
						title = "setting_font_size",
						type = "numeric",
						default_value = 18,
						range = { 1, 50 },
					},
					{
						setting_id = "player_name_offset_x",
						title = "setting_offset_x",
						type = "numeric",
						default_value = 300,
						range = { 0, 500 },
					},
					{
						setting_id = "player_name_offset_y",
						title = "setting_offset_y",
						type = "numeric",
						default_value = 6.5,
						range = { -25, 25 },
						decimals_number = 1,
					},
				},
			},
			{
				setting_id = "setting_player_feats_group",
				type = "group",
				sub_widgets = {
					{
						setting_id = "display_player_feats",
						title = "setting_display",
						type = "checkbox",
						default_value = true,
					},
					{
						setting_id = "player_feats_font_size",
						title = "setting_font_size",
						type = "numeric",
						default_value = 18,
						range = { 1, 50 },
					},
					{
						setting_id = "player_feats_offset_x",
						title = "setting_offset_x",
						type = "numeric",
						default_value = 0,
						range = { 0, 500 },
					},
					{
						setting_id = "player_feats_offset_y",
						title = "setting_offset_y",
						type = "numeric",
						default_value = 11.5,
						range = { -25, 25 },
						decimals_number = 1,
					},
					{
						setting_id = "player_Feats_order_1",
						title = "player_Feats_order_1",
						type = "dropdown",
						default_value = "Ability",
						options = {
							{text = "setting_Feats_order_Ability", value = "Ability"},
							{text = "setting_Feats_order_Blitz", value = "Blitz"},
							{text = "setting_Feats_order_Aura", value = "Aura"},
							{text = "setting_Feats_order_Keystone", value = "Keystone"},
							{text = "setting_hide", value = "Disable"},
						},
					},
					{
						setting_id = "player_Feats_order_2",
						title = "player_Feats_order_2",
						type = "dropdown",
						default_value = "Blitz",
						options = {
							{text = "setting_Feats_order_Ability", value = "Ability"},
							{text = "setting_Feats_order_Blitz", value = "Blitz"},
							{text = "setting_Feats_order_Aura", value = "Aura"},
							{text = "setting_Feats_order_Keystone", value = "Keystone"},
							{text = "setting_hide", value = "Disable"},
						},
					},
					{
						setting_id = "player_Feats_order_3",
						title = "player_Feats_order_3",
						type = "dropdown",
						default_value = "Aura",
						options = {
							{text = "setting_Feats_order_Ability", value = "Ability"},
							{text = "setting_Feats_order_Blitz", value = "Blitz"},
							{text = "setting_Feats_order_Aura", value = "Aura"},
							{text = "setting_Feats_order_Keystone", value = "Keystone"},
							{text = "setting_hide", value = "Disable"},
						},
					},
					{
						setting_id = "player_Feats_order_4",
						title = "player_Feats_order_4",
						type = "dropdown",
						default_value = "Keystone",
						options = {
							{text = "setting_Feats_order_Ability", value = "Ability"},
							{text = "setting_Feats_order_Blitz", value = "Blitz"},
							{text = "setting_Feats_order_Aura", value = "Aura"},
							{text = "setting_Feats_order_Keystone", value = "Keystone"},
							{text = "setting_hide", value = "Disable"},
						},
					},
				},
			},
			{
				setting_id = "setting_player_notable_talents",
				type = "group",
				sub_widgets = {
					{
						setting_id = "display_notable_talents",
						title = "setting_display",
						type = "checkbox",
						default_value = true,
					},
					{
						setting_id = "notable_talents_icon_size",
						title = "setting_icon_size",
						type = "numeric",
						default_value = 40,
						range = { 1, 75 },
					},
					{
						setting_id = "notable_talents_intensity",
						title = "notable_talents_intensity",
						type = "numeric",
						default_value = 0.05,
						range = { -1, 1 },
						decimals_number = 2
					},
					{
						setting_id = "notable_talents_offset_x",
						title = "setting_offset_x",
						type = "numeric",
						default_value = 200,
						range = { 0, 500 },
					},
					{
						setting_id = "notable_talents_offset_y",
						title = "setting_offset_y",
						type = "numeric",
						default_value = -4.5,
						range = { -25, 25 },
						decimals_number = 1,
					},
					{
						setting_id = "notable_talents_separation",
						title = "setting_separation",
						type = "numeric",
						default_value = 30,
						range = { 0, 50 },
						decimals_number = 1,
					},
				},
			},
			{
				setting_id = "setting_player_class_group",
				type = "group",
				sub_widgets = {
					{
						setting_id = "display_main_class",
						type = "dropdown",
						default_value = "name",
						options = {
							{text = "by_name", value = "name"},
							{text = "by_symbol", value = "symbol"},
							{text = "by_both", value = "both"},
							{text = "setting_hide", value = "hide"},
						},
					},
					{
						setting_id = "player_class_font_size",
						title = "setting_font_size",
						type = "numeric",
						default_value = 18,
						range = { 1, 50 },
					},
					{
						setting_id = "player_class_offset_x",
						title = "setting_offset_x",
						type = "numeric",
						default_value = 105,
						range = { 0, 500 },
					},
					{
						setting_id = "player_class_offset_y",
						title = "setting_offset_y",
						type = "numeric",
						default_value = 6.5,
						range = { -25, 25 },
						decimals_number = 1,
					},
				},
			},
			{
				setting_id = "setting_weapon_name_group",
				type = "group",
				sub_widgets = {
					{
						setting_id = "display_player_weapon",
						title = "setting_display",
						type = "checkbox",
						default_value = true,
					},
					{
						setting_id = "user_weapon_name_size",
						tooltip = "user_weapon_name_lenghth_tip",
						type = "numeric",
						default_value = 20,
						range = { 10, 30 },
					},
					{
						setting_id = "user_weapon_name_lenghth",
						tooltip = "user_weapon_name_lenghth_tip",
						type = "numeric",
						default_value = weapon_name_lenghth_lid[lid] or 30,
						range = { 20, 50 },
					},
					{
						setting_id = "user_weapon_name_multiplier",
						type = "numeric",
						default_value = weapon_name_size_multiplier_lid[lid] or 85,
						range = { 1, 100 },
					},
				},
			},
			{
				setting_id = "setting_perk_blessing_group",
				type = "group",
				sub_widgets = {
					{
						setting_id = "blessing_level_rule",
						type = "dropdown",
						default_value = "number",
						options = {
							{text = "by_number", value = "number"},
							{text = "by_color", value = "color"},
							{text = "by_both", value = "both"},
							{text = "setting_hide", value = "hide"},
						},
					},
					{
						setting_id = "perk_level_rule",
						type = "dropdown",
						default_value = "number",
						options = {
							{text = "by_number", value = "number"},
							{text = "by_color", value = "color"},
							{text = "by_both", value = "both"},
							{text = "setting_hide", value = "hide"},
						},
					},
					{
						setting_id = "user_bless_perk_font_size",
						title = "setting_font_size",
						type = "numeric",
						default_value = 14,
						range = { 1, 50 },
					},
					{
						setting_id = "user_bless_offset",
						type = "numeric",
						default_value = 0,
						range = { 0, 200 },
					},
					{
						setting_id = "user_perk_offset",
						type = "numeric",
						default_value = perk_offset_lid[lid] or 0,
						range = { 0, 200 },
					},
				},
			},
			{
				setting_id = "setting_other_group",
				type = "group",
				sub_widgets = {
					{
						setting_id = "left_panel_lift",
						tooltip = "left_panel_lift_tip",
						type = "numeric",
						default_value = position_y + 120,
						range = { position_y - 500, position_y + 500 },
					},
					{
						setting_id = "endview_scoreboard_weapons",
						tooltip = "endview_scoreboard",
						type = "checkbox",
						default_value = true,
					},
					{
						setting_id = "endview_scoreboard_weapons_perk",
						tooltip = "endview_scoreboard",
						type = "checkbox",
						default_value = true,
					},
					{
						setting_id = "endview_scoreboard_weapons_blessing",
						tooltip = "endview_scoreboard",
						type = "checkbox",
						default_value = true,
					},
					{
						setting_id = "endview_scoreboard_feat",
						tooltip = "endview_scoreboard",
						type = "checkbox",
						default_value = true,
					},
					{
						setting_id = "endview_scoreboard_blank",
						tooltip = "endview_scoreboard",
						type = "checkbox",
						default_value = false,
					},
					{
						setting_id = "endview_scoreboard_length",
						type = "numeric",
						default_value = 30,
						range = { 10, 50 },
					},
				},
			},
			
		},
	},
}
