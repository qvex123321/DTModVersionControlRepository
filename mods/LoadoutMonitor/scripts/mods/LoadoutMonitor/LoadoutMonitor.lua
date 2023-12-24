local mod = get_mod("LoadoutMonitor")

-- Your mod code goes here.
-- https://vmf-docs.verminti.de

local UIWidget = require("scripts/managers/ui/ui_widget")
local MasterItems = require("scripts/backend/master_items")
local ItemUtils = require("scripts/utilities/items")
local lid = Application.user_setting("language_id")
local function get_local_player()
	return Managers.player:local_player(1)
end
local scoreboard = get_mod("scoreboard")
local default_feats_order = {"Ability","Blitz","Aura","Keystone"}
local feats_symbol = {
	Ability = "("..mod:localize("player_Feats_symbol_Ability")..")",
	Blitz = "("..mod:localize("player_Feats_symbol_Blitz")..")",
	Aura = "("..mod:localize("player_Feats_symbol_Aura")..")",
	Keystone = "("..mod:localize("player_Feats_symbol_Keystone")..")",
}
local weapon_slot = {Melee = "slot_primary", Range = "slot_secondary"}
mod.teamatesloadout = {}
mod.left_panel_lift = 0 - mod:get("left_panel_lift")
mod.text_color = {255,239,238,238}

mod.init = function(self)
	mod.display = {
		player_Feats = mod:get("display_player_feats"),
		player_Feats_order = {},
		player_Feats_default_order = true,
		notable_talents = mod:get("display_notable_talents"),
		player_name = mod:get("display_player_name"),
		main_class = mod:get("display_main_class"),
	}
	mod.offsets = {
		lobby = {mod:get("lobby_talent_offset"),mod:get("lobby_weapon_offset"),mod:get("lobby_weapon_gap")},
		notable_talents = {mod:get("notable_talents_offset_x"),mod:get("notable_talents_offset_y"),mod:get("notable_talents_separation")},
		PlayerName = { mod:get("player_name_offset_x"), mod:get("player_name_offset_y"),},
		Feats = { mod:get("player_feats_offset_x"), mod:get("player_feats_offset_y"),},
		Class = { mod:get("player_class_offset_x"), mod:get("player_class_offset_y"),},
	}
	mod.font_size = {
		lobby = mod:get("lobby_weapon_font_size"),
		feats = mod:get("player_feats_font_size"),
		notable_talents = {mod:get("notable_talents_icon_size"),mod:get("notable_talents_icon_size")},
		PlayerName = mod:get("player_name_font_size"),
		Feats = mod:get("player_feats_font_size"),
		Class = mod:get("player_class_font_size"),
	}
	
	mod.weapon_enable = mod:get("display_player_weapon")
	mod.weapon_name_lenghth = mod:get("user_weapon_name_lenghth")
	mod.weapon_name_size = mod:get("user_weapon_name_size")
	mod.weapon_name_multiplier = mod:get("user_weapon_name_multiplier") / 100
	
	mod.trait_display_by = {
		bless = mod:get("blessing_level_rule"),
		bless_offset = mod:get("user_bless_offset"),
		perk = mod:get("perk_level_rule"),
		perk_offset = mod:get("user_perk_offset"),
		font_size = mod:get("user_bless_perk_font_size")
	}
	mod.load_package("packages/ui/views/talents_view/talents_view")
	mod.SHUD = get_mod("SpectatorHUD") and true
	scoreboard = get_mod("scoreboard")
	mod.left_panel_lift = 0 - mod:get("left_panel_lift")
	mod.lobby_exhibition = { weapon = mod:get("lobby_exhibition_weapons")}
	mod.endview_scoreboard_length = mod:get("endview_scoreboard_length")
	mod.notable_talents_intensity = mod:get("notable_talents_intensity")
	mod.teamatesloadout = {}
	for i =1,#default_feats_order do
		mod.display.player_Feats_order[i] = mod:get(string.format("player_Feats_order_%s",i))
		mod.display.player_Feats_default_order = mod.display.player_Feats_order[i] == default_feats_order[i] and mod.display.player_Feats_default_order ~= false
	end
end

local function player_career(profile)
	local archetype = profile.archetype
	local archetypename = archetype.archetype_name
	local subclass = profile.specialization
	local subclassname = archetype.specializations[subclass].title
	local symbol = archetype.string_symbol
	return Localize(archetypename),Localize(subclassname),symbol
end


local function player_feats(profile)
	local talents_index = {
		veteran = {
			Ability = {"veteran_combat_ability_elite_and_special_outlines","veteran_combat_ability_stagger_nearby_enemies","veteran_invisibility_on_combat_ability"},
			Blitz = {"veteran_grenade_apply_bleed","veteran_krak_grenade","veteran_smoke_grenade"},
			Aura = {"veteran_aura_gain_ammo_on_elite_kill_improved","veteran_increased_damage_coherency","veteran_movement_speed_coherency"},
			Keystone = {"veteran_snipers_focus","veteran_improved_tag","veteran_weapon_switch_passive"},
		},
		zealot = {
			Ability = {"zealot_attack_speed_post_ability","zealot_bolstering_prayer","zealot_stealth"},
			Blitz = {"zealot_improved_stun_grenade","zealot_flame_grenade","zealot_throwing_knives"},
			Aura = {"zealot_toughness_damage_reduction_coherency_improved","zealot_corruption_healing_coherency_improved","zealot_always_in_coherency"},
			Keystone = {"zealot_fanatic_rage","zealot_martyrdom","zealot_quickness_passive"},
		},
		psyker = {
			Ability = {"psyker_shout_vent_warp_charge","psyker_combat_ability_force_field","psyker_combat_ability_stance"},
			Blitz = {"psyker_brain_burst_improved","psyker_grenade_chain_lightning","psyker_grenade_throwing_knives"},
			Aura = {"psyker_aura_damage_vs_elites","psyker_cooldown_aura_improved","psyker_aura_crit_chance_aura"},
			Keystone = {"psyker_passive_souls_from_elite_kills","psyker_empowered_ability","psyker_new_mark_passive"},
		},
		ogryn = {
			Ability = {"ogryn_longer_charge","ogryn_taunt_shout","ogryn_special_ammo"},
			Blitz = {"ogryn_grenade_friend_rock","ogryn_box_explodes","ogryn_grenade_frag"},
			Aura = {"ogryn_melee_damage_coherency_improved","ogryn_toughness_regen_aura","ogryn_damage_vs_suppressed_coherency"},
			Keystone = {"ogryn_passive_heavy_hitter","ogryn_carapace_armor","ogryn_leadbelcher_no_ammo_chance"},
		},
	}
	local archetype = profile.archetype.name
	local talents = profile.talents
	
    if mod.display.player_Feats then
		local slots = 0
		local feats = {}
		if talents_index[archetype] then
			for i = 1,#default_feats_order do
				if mod.display.player_Feats_order[i] ~= "Disable" then
					slots = slots + 1
					local current = talents_index[archetype][mod.display.player_Feats_order[i]]
					for o = 1,#current do
						if talents[current[o]] then
							feats[slots] = tostring(o)
							break
						end
					end
					feats[slots] = feats[slots] or "X"
					if not mod.display.player_Feats_default_order then
						feats[slots] = feats[slots]..feats_symbol[mod.display.player_Feats_order[i]]
					end
				end
			end
		end
		return table.concat(feats,"-")
	end
    return ""
end

local function notable_talents(profile,style)
	if not mod.display.notable_talents then
		for i = 1,5 do
			style["loadout_intel_icon_"..tostring(i)].color[1] = 0
		end
		return
	end	
	local archetype = profile.archetype.name
	local talents = profile.talents
	local talents_index = {
		veteran = {
			{
				"veteran_better_deployables",
				"content/ui/textures/icons/talents/veteran/veteran_better_deployables",
			},
			{
				"veteran_movement_speed_towards_downed",
				"content/ui/textures/icons/talents/veteran/veteran_movement_speed_towards_downed",
			},
			{
				"veteran_allies_in_coherency_share_toughness_gain",
				"content/ui/textures/icons/talents/veteran/veteran_allies_in_coherency_share_toughness_gain",
			},
			{
				"veteran_combat_ability_revive_nearby_allies",
				"content/ui/textures/icons/talents/veteran/veteran_combat_ability_revive_nearby_allies",
				Color.salmon(255, true),
				-0.03
			},
			{
				"veteran_reduced_threat_after_combat_ability",
				"content/ui/textures/icons/talents/veteran/veteran_reduced_threat_when_still",
				Color.salmon(255, true),
			},
			{
				"veteran_combat_ability_melee_and_ranged_damage_to_coherency",
				"content/ui/textures/icons/talents/veteran/veteran_combat_ability_melee_and_ranged_damage_to_coherency",
				Color.salmon(255, true),
			},
		},
		zealot = {
			{
				"zealot_ally_damage_taken_reduced",
				"content/ui/textures/icons/talents/zealot/zealot_ally_damage_taken_reduced",
			},
			{
				"zealot_channel_grants_toughness_damage_reduction",
				"content/ui/textures/icons/talents/zealot/zealot_channel_grants_toughness_damage_reduction",
				Color.salmon(255, true),
			},
			{
				"zealot_channel_grants_damage",
				"content/ui/textures/icons/talents/zealot/zealot_channel_grants_damage",
				Color.salmon(255, true),
			},
		},
		psyker = {
			{
				"psyker_elite_kills_add_warpfire",
				"content/ui/textures/icons/talents/psyker/psyker_2_tier_2_name_3",
			},
			{
				"psyker_2_tier_3_name_2",
				"content/ui/textures/icons/talents/psyker/psyker_2_tier_3_name_2",
			},
		},
		ogryn = {
			{
				"ogryn_taunt_damage_taken_increase",
				"content/ui/textures/icons/talents/ogryn/ogryn_taunt_damage_taken_increase",
				Color.salmon(255, true),
			},
		},	
	}
	
	if talents_index[archetype] then
		local num = 1
		for i = 1, #talents_index[archetype] do
			local current = talents_index[archetype][i]
			if talents[current[1]] then
				local slot = "loadout_intel_icon_"..tostring(num)
				style[slot].material_values.icon_texture = current[2]
				style[slot].material_values.intensity = mod.notable_talents_intensity + (current[4] or 0)
				style[slot].color = current[3] or Color.turquoise(255, true)
				style[slot].size = mod.font_size.notable_talents
				style[slot].offset[1] = mod.offsets.notable_talents[1] + mod.offsets.notable_talents[3] * (num - 1)
				style[slot].offset[2] = mod.offsets.notable_talents[2]
				num = num + 1
			end
		end
		if num < 6 then
			for i = 5, num, -1 do
				style["loadout_intel_icon_"..tostring(i)].color[1] = 0
			end
		end
	end
end

local function perk_blessing(profile,weapon_type,trait_type)
	local item = profile.loadout[weapon_slot[weapon_type]]
	local traits = item[trait_type]
	local subjects = {" "," "," "," ",}
	if traits then
		for i = 1, 2 do
			if traits[i] then
				local id = traits[i].id
				local MasterItem = MasterItems.get_item(id)
				if trait_type == "traits" then
					subjects[i] = ItemUtils.display_name(MasterItem)
				elseif trait_type == "perks" then
					local perk = mod:localize(string.format("trait_%s",MasterItem.trait))
					if string.find(perk,"<") then perk = "????" end
					subjects[i] = perk
				end
				subjects[i+2] = traits[i].rarity
			end
		end
	end
	return subjects
end

local function weapon_display_name(profile,slot)
	local loadout = profile.loadout
	local weapon = loadout[weapon_slot[slot]]
	local name = " "
	if not slot or not weapon_slot[slot] then
		return name
	else		
		name = ItemUtils.display_name(weapon) or " "
	end
	return string.trim(name)
end

local trait_offsets = {
	bless = {280,},
	perk = {370,},
}

mod.get_playerloadout_intel = function(profile,widget)
	local player_name = profile.name
	local Melee, Range = profile.loadout["slot_primary"], profile.loadout["slot_secondary"]
	local content = widget.content
	local style = widget.style
	local class,career,symbol = player_career(profile)
	local main_class_method = {hide = "",name = class, symbol = symbol, both = symbol..class}
	local weapons = {
		Melee = {
			name = weapon_display_name(profile,"Melee"),
			bless = perk_blessing(profile,"Melee","traits"),
			perk = perk_blessing(profile,"Melee","perks"),
			name_offset = 29.5,
			--template = Melee.weapon_template,
		},
		Range = {
			name = weapon_display_name(profile,"Range"),
			bless = perk_blessing(profile,"Range","traits"),
			perk = perk_blessing(profile,"Range","perks"),
			name_offset = 59.5
			--template = Range.weapon_template,
		},
	}
	-- feats class name
	content.loadout_intel_Feats = player_feats(profile)
	content.loadout_intel_Class = main_class_method[mod.display.main_class] or main_class_method.symbol
	content.loadout_intel_PlayerName = mod.display.player_name and player_name or " "
	notable_talents(profile,style)
	for k,part in pairs({"Feats","Class","PlayerName"}) do
		table.merge(style["loadout_intel_"..part].offset,mod.offsets[part])
		style["loadout_intel_"..part].font_size = mod.font_size[part]
	end
	if mod.weapon_enable then
		-- weapon perk blessing
		for weapon_type,value in pairs(weapons) do

			-- display name
			content["loadout_intel_"..weapon_type] = value.name
			
			-- Thunder hammer
			--local name_bug = mod["name_bug_"..value.template] or 0
			local weapon_style = style["loadout_intel_"..weapon_type]
			weapon_style.offset[2] = value.name_offset
			weapon_style.font_size = mod.weapon_name_size * (string.len(value.name) >= mod.weapon_name_lenghth and mod.weapon_name_multiplier or 1)
			
			
			for _,trait_type in pairs({"perk","bless"}) do
				for i = 1,2 do
					local id = string.format("loadout_intel_%s_%s_%s",weapon_type,trait_type,i)
					local text = value[trait_type][i]
					if text == " " or not value[trait_type][i + 2] or mod.trait_display_by[trait_type] == "hide" then
						style[id].text_color = Color["item_rarity_1"](255,true)
						text = ""
					else
						if mod.trait_display_by[trait_type] == "number" or mod.trait_display_by[trait_type] == "both" then
							text = string.format("%s(%s)",text,value[trait_type][i+2])
						end
						if mod.trait_display_by[trait_type] == "color" or mod.trait_display_by[trait_type] == "both" then
							style[id].text_color = Color["item_rarity_"..tostring(value[trait_type][i+2])](255,true)
						else
							style[id].text_color = mod.text_color
						end
					end
					content[id] = text
					style[id].offset[1] = trait_offsets[trait_type][1] + (mod.trait_display_by[trait_type.."_offset"] or 0)
					style[id].font_size = mod.trait_display_by.font_size
				end
			end
		end
	end
end

mod.lobby_loadout = function (self, dt, t, input_service)
	local spawn_slots = self._spawn_slots

	for i = 1, #spawn_slots do
		local slot = spawn_slots[i]

		if slot.occupied then
			local panel_widget = slot.panel_widget
			local panel_content = panel_widget.content
			local panel_style = panel_widget.style
			local profile = slot.player:profile()
			if not mod.lobby_exhibition.weapon then
				panel_content.loadout_intel_Melee = ""
				panel_content.loadout_intel_Range = ""
			else
				local offset_M = mod.offsets.lobby[2]
				local offset_gap = mod.offsets.lobby[3]
				panel_content.loadout_intel_Melee = weapon_display_name(profile,"Melee")
				panel_content.loadout_intel_Range = weapon_display_name(profile,"Range")
				panel_style.loadout_intel_Melee.offset[2] = offset_M
				panel_style.loadout_intel_Range.offset[2] = offset_M + offset_gap
				panel_style.loadout_intel_Melee.font_size = mod.font_size.lobby or 17
				panel_style.loadout_intel_Range.font_size = mod.font_size.lobby or 17
			end
		end
	end
end

local function spectating_hud_tactical_overlay()
	local me = get_local_player()
	local camera = me.camera_handler
	if mod.SHUD and (camera._is_hogtied or camera._mode == "dead" or camera._mode == "observer") then
		if Managers.input and Managers.input:get_input_service("Ingame") and Managers.input:get_input_service("Ingame"):get("tactical_overlay_hold") then
			return true
		end
	end
	return false
end

mod.player_loaded = function(player,widget)
	local psyroom = Managers.state and Managers.state.game_mode and Managers.state.game_mode:game_mode_name() == "shooting_range"
	if psyroom then
		return false
	end
	
	local account = player._account_id
	local profile = player._profile
	local Melee, Range = weapon_display_name(profile,"Melee"), weapon_display_name(profile,"Range")
	if mod.teamatesloadout[account] then
		local gears = mod.teamatesloadout[account].Melee == Melee and mod.teamatesloadout[account].Range == Range
		local intel = mod.weapon_enable and widget.content.loadout_intel_Melee ~= " " and widget.content.loadout_intel_Range ~= " "
		return  gears and intel
	end
	return false
end

mod.update_loadout = function(self, dt, t, player, ui_renderer)
	if not player:is_human_controlled() then
		return
	end
	
	local tactical_active = Managers.ui and Managers.ui._hud and Managers.ui._hud._tactical_overlay_active or spectating_hud_tactical_overlay()
	local profile = player._profile
	local account = player._account_id
	local widget = self._widgets_by_name.playerloadout_intel
	if not mod.player_loaded(player,widget) and tactical_active then
		mod.get_playerloadout_intel(profile,widget)
		mod.teamatesloadout[account] = {
			Melee = widget.content.loadout_intel_Melee,
			Range = widget.content.loadout_intel_Range,
			--scenegraph = self._ui_scenegraph.player_loadout
		}
		--self._position_scenegraphs
	end
	self:_set_widget_visible(widget,tactical_active,ui_renderer)
end
mod:hook_safe("HudElementPersonalPlayerPanel", "_update_player_features", mod.update_loadout)
mod:hook_safe("HudElementTeamPlayerPanel", "_update_player_features", mod.update_loadout)


-- overlap with P1/P2
mod:hook_safe("HudElementTacticalOverlay","_update_left_panel_elements",function(self, ui_renderer)
	self:set_scenegraph_position("left_panel",nil,mod.left_panel_lift)
end)

mod:hook_safe("CameraHandler","_switch_follow_target",function (self, new_unit)
	mod.teamatesloadout = {}
end)


mod.on_all_mods_loaded = function()
	mod:init()
end
mod.on_game_state_changed = function(status,state_name)
	mod.teamatesloadout = {}
end


mod.playerloadout_definition = function(instance)
	instance.scenegraph_definition.player_loadout = {
		parent = "background",
		vertical_alignment = "top",
		horizontal_alignment = "left",
		size = {500,100},
		position = {33,	-12,2}
	}
	
	instance.widget_definitions.playerloadout_intel = UIWidget.create_definition(
		{
			{
				pass_type = "text",
				value_id = "loadout_intel_Feats",
				style_id = "loadout_intel_Feats",
				value = " ",
				style = {
					vertical_alignment = "top",
					text_vertical_alignment = "top",
					horizontal_alignment = "left",
					text_horizontal_alignment = "left",
					offset = {0, 11.5, 150},
					size = {500, 100},
					text_color = Color.golden_rod(255, true),
					font_size = 18,
				},	
				
			},
			{
				pass_type = "texture",
				value_id = "loadout_intel_icon_1",
				style_id = "loadout_intel_icon_1",
				value = "content/ui/materials/icons/talents/talent_icon_container",
                style = {
					vertical_alignment = "top",
					horizontal_alignment = "left",
					offset = {200, 0, 150},
                    size = { 36, 36 },
					color = Color.aqua(0, true),
					material_values = {
						icon_texture = "",
						intensity = 1,
					},
                },
            },
			{
				pass_type = "texture",
				value_id = "loadout_intel_icon_2",
				style_id = "loadout_intel_icon_2",
				value = "content/ui/materials/icons/talents/talent_icon_container",
                style = {
					vertical_alignment = "top",
					horizontal_alignment = "left",
					offset = {200, 0, 150},
                    size = { 36, 36 },
					color = Color.aqua(0, true),
					material_values = {
						icon_texture = "",
						intensity = 1,
					},
                },
            },
			{
				pass_type = "texture",
				value_id = "loadout_intel_icon_3",
				style_id = "loadout_intel_icon_3",
				value = "content/ui/materials/icons/talents/talent_icon_container",
                style = {
					vertical_alignment = "top",
					horizontal_alignment = "left",
					offset = {200, 0, 150},
                    size = { 36, 36 },
					color = Color.aqua(0, true),
					material_values = {
						icon_texture = "",
						intensity = 1,
					},
                },
            },
			{
				pass_type = "texture",
				value_id = "loadout_intel_icon_4",
				style_id = "loadout_intel_icon_4",
				value = "content/ui/materials/icons/talents/talent_icon_container",
                style = {
					vertical_alignment = "top",
					horizontal_alignment = "left",
					offset = {200, 0, 150},
                    size = { 36, 36 },
					color = Color.aqua(0, true),
					material_values = {
						icon_texture = "",
						intensity = 1,
					},
                },
            },
			{
				pass_type = "texture",
				value_id = "loadout_intel_icon_5",
				style_id = "loadout_intel_icon_5",
				value = "content/ui/materials/icons/talents/talent_icon_container",
                style = {
					vertical_alignment = "top",
					horizontal_alignment = "left",
					offset = {200, 0, 150},
                    size = { 36, 36 },
					color = Color.aqua(0, true),
					material_values = {
						icon_texture = "",
						intensity = 1,
					},
                },
            },
			{
				pass_type = "text",
				value_id = "loadout_intel_Class",
				style_id = "loadout_intel_Class",
				value = " ",
				style = {
					vertical_alignment = "top",
					text_vertical_alignment = "top",
					horizontal_alignment = "left",
					text_horizontal_alignment = "left",
					offset = {105, 6.5, 150},
					size = {500, 100},
					text_color = Color.golden_rod(255, true),
					font_size = 18,
				},
				
			},
			{
				pass_type = "text",
				value_id = "loadout_intel_PlayerName",
				style_id = "loadout_intel_PlayerName",
				value = " ",
				style = {
					vertical_alignment = "top",
					text_vertical_alignment = "top",
					horizontal_alignment = "left",
					text_horizontal_alignment = "left",
					offset = {300, 6.5, 150},
					size = {500, 100},
					text_color = Color.golden_rod(255, true),
					font_size = 18,
				},
				
			},		
			{
				pass_type = "text",
				value_id = "loadout_intel_Melee",
				style_id = "loadout_intel_Melee",
				value = " ",
				style = {
					vertical_alignment = "top",
					text_vertical_alignment = "top",
					horizontal_alignment = "left",
					text_horizontal_alignment = "left",
					offset = {0, 29.5, 200},
					size = {275, 100},
					text_color = mod.text_color,
					font_size = 20,
					line_spacing = 0.8,
				},
				
			},
			{
				pass_type = "text",
				value_id = "loadout_intel_Melee_bless_1",
				style_id = "loadout_intel_Melee_bless_1",
				value = " ",
				style = {
					vertical_alignment = "top",
					text_vertical_alignment = "top",
					horizontal_alignment = "left",
					text_horizontal_alignment = "left",
					offset = {trait_offsets.bless[1], 22.5, 200},
					size = {500, 100},
					text_color = mod.text_color,
					font_size = 14,
				},
				
			},
			{
				pass_type = "text",
				value_id = "loadout_intel_Melee_bless_2",
				style_id = "loadout_intel_Melee_bless_2",
				value = " ",
				style = {
					vertical_alignment = "top",
					text_vertical_alignment = "top",
					horizontal_alignment = "left",
					text_horizontal_alignment = "left",
					offset = {trait_offsets.bless[1], 38.5, 200},
					size = {500, 100},
					text_color = mod.text_color,
					font_size = 14,
				},
				
			},
			{
				pass_type = "text",
				value_id = "loadout_intel_Melee_perk_1",
				style_id = "loadout_intel_Melee_perk_1",
				value = " ",
				style = {
					vertical_alignment = "top",
					text_vertical_alignment = "top",
					horizontal_alignment = "left",
					text_horizontal_alignment = "left",
					offset = {370, 23, 200},
					size = {275, 100},
					text_color = mod.text_color,
					font_size = 14,
				},
				
			},
			{
				pass_type = "text",
				value_id = "loadout_intel_Melee_perk_2",
				style_id = "loadout_intel_Melee_perk_2",
				value = " ",
				style = {
					vertical_alignment = "top",
					text_vertical_alignment = "top",
					horizontal_alignment = "left",
					text_horizontal_alignment = "left",
					offset = {370, 39, 200},
					size = {500, 100},
					text_color = mod.text_color,
					font_size = 14,
				},
				
			},
			{
				pass_type = "text",
				value_id = "loadout_intel_Range",
				style_id = "loadout_intel_Range",
				value = " ",
				style = {
					vertical_alignment = "top",
					text_vertical_alignment = "top",
					horizontal_alignment = "left",
					text_horizontal_alignment = "left",
					offset = {0, 59.5, 200},
					size = {275, 100},
					text_color = mod.text_color,
					font_size = 20,
					line_spacing = 0.8,
				},
				
			},
			{
				pass_type = "text",
				value_id = "loadout_intel_Range_bless_1",
				style_id = "loadout_intel_Range_bless_1",
				value = " ",
				style = {
					vertical_alignment = "top",
					text_vertical_alignment = "top",
					horizontal_alignment = "left",
					text_horizontal_alignment = "left",
					offset = {trait_offsets.bless[1], 57, 200},
					size = {500, 100},
					text_color = mod.text_color,
					font_size = 14,
				},
				
			},
			{
				pass_type = "text",
				value_id = "loadout_intel_Range_bless_2",
				style_id = "loadout_intel_Range_bless_2",
				value = " ",
				style = {
					vertical_alignment = "top",
					text_vertical_alignment = "top",
					horizontal_alignment = "left",
					text_horizontal_alignment = "left",
					offset = {trait_offsets.bless[1], 72, 200},
					size = {500, 100},
					text_color = mod.text_color,
					font_size = 14,
				},
				
			},
			{
				pass_type = "text",
				value_id = "loadout_intel_Range_perk_1",
				style_id = "loadout_intel_Range_perk_1",
				value = " ",
				style = {
					vertical_alignment = "top",
					text_vertical_alignment = "top",
					horizontal_alignment = "left",
					text_horizontal_alignment = "left",
					offset = {370, 57, 200},
					size = {500, 100},
					text_color = mod.text_color,
					font_size = 14,
				},
				
			},
			{
				pass_type = "text",
				value_id = "loadout_intel_Range_perk_2",
				style_id = "loadout_intel_Range_perk_2",
				value = " ",
				style = {
					vertical_alignment = "top",
					text_vertical_alignment = "top",
					horizontal_alignment = "left",
					text_horizontal_alignment = "left",
					offset = {370, 72, 200},
					size = {500, 100},
					text_color = mod.text_color,
					font_size = 14,
				},
				
			},
		},"player_loadout")
		--},"player_icon")
end


mod:hook_safe("LobbyView","_update_player_slots",mod.lobby_loadout)
local personal_player_panel_definition_path = "scripts/ui/hud/elements/personal_player_panel/hud_element_personal_player_panel_definitions"
local team_player_panel_definition_path = "scripts/ui/hud/elements/team_player_panel/hud_element_team_player_panel_definitions"
local lobby_view_definition_path = "scripts/ui/views/lobby_view/lobby_view_definitions"
mod:hook_require(personal_player_panel_definition_path,mod.playerloadout_definition)
mod:hook_require(team_player_panel_definition_path,mod.playerloadout_definition)
mod:hook_require(lobby_view_definition_path,function(instance)
	local extra = {
			{
				pass_type = "text",
				value_id = "loadout_intel_Melee",
				style_id = "loadout_intel_Melee",
				value = "",
				style = {
					vertical_alignment = "top",
					text_vertical_alignment = "top",
					horizontal_alignment = "center",
					text_horizontal_alignment = "center",
					offset = {0, 165, 1},
					size = {250, 100},
					text_color = mod.text_color,
					font_size = 17,
					line_spacing = 0.95,
				},
				
			},
			{
				pass_type = "text",
				value_id = "loadout_intel_Range",
				style_id = "loadout_intel_Range",
				value = "",
				style = {
					vertical_alignment = "top",
					text_vertical_alignment = "top",
					horizontal_alignment = "center",
					text_horizontal_alignment = "center",
					offset = {0, 200, 1},
					size = {250, 100},
					text_color = mod.text_color,
					font_size = 17,
					line_spacing = 0.95,
				},
			},
			{
				pass_type = "text",
				value_id = "loadout_intel_Feats",
				style_id = "loadout_intel_Feats",
				value = "",
				style = {
					vertical_alignment = "top",
					text_vertical_alignment = "top",
					horizontal_alignment = "center",
					text_horizontal_alignment = "center",
					offset = {0, 235, 1},
					size = {250, 100},
					text_color = mod.text_color,
					font_size = 17,
					line_spacing = 0.95,
				},
			},
	}
	for i = 1,#extra do
		UIWidget.add_definition_pass(instance.panel_definition,extra[i])
	end
end)
-- Make tactical overlay available in meat grinder
mod:hook_require("scripts/ui/hud/hud_elements_player_onboarding", function(instance)
    local found = false
    -- Check if another mod already added tactical overlay
    for _, entry in pairs(instance) do
        if entry.class_name == "HudElementTacticalOverlay" then
			found = true
			break
		end
    end
    if not found then
        -- Add tactical overlay
        instance[#instance+1] = {
            package = "packages/ui/hud/tactical_overlay/tactical_overlay",
            use_hud_scale = false,
            class_name = "HudElementTacticalOverlay",
            filename = "scripts/ui/hud/elements/tactical_overlay/hud_element_tactical_overlay",
            visibility_groups = {
                "tactical_overlay",
                "alive",
            }
        }
    end
end)

mod.load_package = function(package_name)
    if not Managers.package:is_loading(package_name) and not Managers.package:has_loaded(package_name) then
        return Managers.package:load(package_name, "loadout_monitor", nil, true)
    end
end

mod.on_setting_changed = function(setting_name)
	mod:init()
end
mod:command("lom",mod:localize("echo_team_loadout_brief"),function(...)
	local key = {...}
	if key[1] == "reset" then
		mod.teamatesloadout = {}
	elseif key[1] == "weapon" then
		local me_loadout = get_local_player()._profile.loadout
		local templates = {
			me_loadout["slot_primary"].weapon_template or "????",
			me_loadout["slot_secondary"].weapon_template or "????",			
		}
		mod:echo("\n"..templates[1].."\n"..templates[2])
	elseif table.is_empty(key) then
		local brief = "\n"
		local players = Managers.player and Managers.player:players()
		if players then
			for k,player in pairs(players) do
				if player:is_human_controlled() then
					local profile = player._profile
					local name = profile.name
					local Melee, Range = weapon_display_name(profile,"Melee"),weapon_display_name(profile,"Range")
					brief = string.format("%s%s:\n%s\n%s\n",brief,name,Melee,Range)
				end
			end
			mod:echo(brief)
		end
	end
end)


-- Define rows
mod.scoreboard_rows = {
	{name = "row_scoreboard_weapon_Melee_1",
		text = "row_scoreboard_weapon_melee",
		group = "offense",
		setting = "Loadout_weapons",
		is_text = true,
		validation = "ASC",
	},
	{name = "row_scoreboard_weapon_Melee_2",
		text = "row_scoreboard_blank",
		group = "offense",
		setting = "Loadout_weapons",
		is_text = true,
		validation = "ASC",
	},
	{name = "row_scoreboard_weapon_Melee_perk",
		text = "row_scoreboard_perk",
		group = "offense",
		setting = "Loadout_weapons_perk",
		is_text = true,
		validation = "ASC",
	},
	{name = "row_scoreboard_weapon_Melee_blessing_1",
		text = "row_scoreboard_blessing",
		group = "offense",
		setting = "Loadout_weapons_blessing",
		is_text = true,
		validation = "ASC",
	},
	{name = "row_scoreboard_weapon_Melee_blessing_2",
		text = "row_scoreboard_blank",
		group = "offense",
		setting = "Loadout_weapons_blessing",
		is_text = true,
		validation = "ASC",
	},
	{name = "row_scoreboard_weapon_Range_1",
		text = "row_scoreboard_weapon_range",
		group = "offense",
		setting = "Loadout_weapons",
		is_text = true,
		validation = "ASC",
	},
	{name = "row_scoreboard_weapon_Range_2",
		text = "row_scoreboard_blank",
		group = "offense",
		setting = "Loadout_weapons",
		is_text = true,
		validation = "ASC",
	},
	{name = "row_scoreboard_weapon_Range_perk",
		text = "row_scoreboard_perk",
		group = "offense",
		setting = "Loadout_weapons_perk",
		is_text = true,
		validation = "ASC",
	},
	{name = "row_scoreboard_weapon_Range_blessing_1",
		text = "row_scoreboard_blessing",
		group = "offense",
		setting = "Loadout_weapons_blessing",
		is_text = true,
		validation = "ASC",
	},
	{name = "row_scoreboard_weapon_Range_blessing_2",
		text = "row_scoreboard_blank",
		group = "offense",
		setting = "Loadout_weapons_blessing",
		is_text = true,
		validation = "ASC",
	},
	{name = "row_scoreboard_player_feat",
		text = "row_scoreboard_player_feat",
		group = "offense",
		setting = "Loadout_feat",
		is_text = true,
		validation = "ASC",
	},
	{name = "row_scoreboard_blank_1",
		text = "row_scoreboard_blank",
		group = "offense",
		setting = "Loadout_scoreboard_blank",
		is_text = true,
		big = true,
		validation = "ASC",
	},
}

mod.scoreboard_weaponname = function(profile,weapon_type)
	local disname = weapon_display_name(profile,weapon_type)
	local length = string.len(disname)
	local line = {" "," "}
	local all_remainders = {
			["zh-cn"] = 3,
			ja = 3,
		}
	local function get_charas(str)
		local count = 0
		if str then
			for chara in string.gmatch(str,"[%.%w ]") do
				count = count + 1
			end
		end
		return count
	end
	
	if length >= (mod.endview_scoreboard_length or 30) then
		length = math.floor(length / 2)
		if all_remainders[lid] then
			local charas = get_charas(string.sub(disname,1,length))
			local remainder = (length - charas) % all_remainders[lid]
			if remainder > 0 then
				length = length + all_remainders[lid] - remainder
			end
		end
		line[1] = string.sub(disname,1,length)
		line[2] = string.sub(disname,length + 1, -1)
	else
		line[1] = disname
	end
	return line
end

mod.update_scoreboard = function(t)
	if t == "on" then
		if scoreboard then
			local players = Managers.player and Managers.player:players()
			if players then
				local update_weapon = mod:get("endview_scoreboard_weapons")
				mod:set("Loadout_weapons",update_weapon)
				mod:set("Loadout_weapons_perk",update_weapon and mod:get("endview_scoreboard_weapons_perk"))
				mod:set("Loadout_weapons_blessing",update_weapon and mod:get("endview_scoreboard_weapons_blessing"))
				mod:set("Loadout_feat",mod:get("endview_scoreboard_feat"))
				mod:set("Loadout_scoreboard_blank",mod:get("endview_scoreboard_blank"))
				for k,player in pairs(players) do
					local profile = player._profile
					local account_id = player:account_id() or player:name()
					local human = player:is_human_controlled()
					for k,weapon_type in pairs({"Melee","Range"}) do
						local line = {"",""}
						local traits_text = {perk = {"",""},blessing = {"",""}}
						if human then
							local traits = {perk = perk_blessing(profile,weapon_type,"perks"),blessing = perk_blessing(profile,weapon_type,"traits")}
							line = mod.scoreboard_weaponname(profile,weapon_type)
							for i = 1,2 do
								for k,v in pairs(traits) do
									if v[i] ~= " " then
										traits_text[k][i] = string.format("%s(%s)",v[i],v[i + 2])
									end
								end
							end
							traits_text.perk = traits_text.perk[1]..(traits_text.perk[2] ~= "" and " "..traits_text.perk[2] or "")
						end
						scoreboard:update_stat("row_scoreboard_weapon_"..weapon_type.."_perk",account_id,traits_text.perk)
						for i =1,2 do
							scoreboard:update_stat(string.format("row_scoreboard_weapon_%s_%s",weapon_type,i), account_id, line[i])
							scoreboard:update_stat(string.format("row_scoreboard_weapon_%s_blessing_%s",weapon_type,i), account_id, traits_text.blessing[i])
						end
					end
					local feats = human and player_feats(profile) or " "
					scoreboard:update_stat("row_scoreboard_player_feat", account_id, feats)
					scoreboard:update_stat("row_scoreboard_blank_1", account_id, " ")
				end
			end
		end
	elseif t == "off" then
		mod:set("Loadout_weapons",false)
		mod:set("Loadout_weapons_perk",false)
		mod:set("Loadout_weapons_blessing",false)
		mod:set("Loadout_feat",false)
		mod:set("Loadout_scoreboard_blank",false)
	end
end
mod:hook_safe(CLASS.EndView, "on_enter", function(...)
	mod.update_scoreboard("on")
end)
mod:hook_safe(CLASS.EndView, "on_exit", function(...)
	mod.update_scoreboard("off")
end)