---@diagnostic disable: undefined-global

-- Thanks to kuli and his Steam guides. Talents:
-- Psyker,	31.10.24, https://steamcommunity.com/sharedfiles/filedetails/?id=3094028505
-- Zealot,	31.10.24, https://steamcommunity.com/sharedfiles/filedetails/?id=3088553235
-- Ogryn,	31.10.24, https://steamcommunity.com/sharedfiles/filedetails/?id=3094034467
-- Veteran,	31.10.24, https://steamcommunity.com/sharedfiles/filedetails/?id=3094038976

local mod = get_mod("Enhanced_descriptions")

--[+ Loading colors of Keywords and Numbers +]--
COLORS_KWords = mod:io_dofile("Enhanced_descriptions/COLORS_KWords")
COLORS_Numbers = mod:io_dofile("Enhanced_descriptions/COLORS_Numbers")

--[+ Function to create a localization template +]--
local function create_template(id, loc_keys, locales, handle_func)
	return { id = id, loc_keys = loc_keys, locales = locales, handle_func = handle_func }
end

--[+ Define localization templates +]--
local localization_templates = {
	--[+ Fixes and overhauls by xsSplater +]--
	-- create_template("your_edit_id ", {"loc_TALENT_CODE"}, {"localization en|ru|zh-cn|ja|..."}, function(locale, value) return "NAME OR DESCRIPTION HERE" end),

--[+ ++TALENT TREE++ +]--
--[+ +MAIN+ +]--
	--[+ Passive +]--
	-- create_template("talent_tree_main_000_en", {"loc_glossary_talent_default"}, {"en"}, function(locale, value) return "Passive" end),
	--[+ Blitz +]--
	-- create_template("talent_tree_main_001_en", {"loc_glossary_term_tactical"}, {"en"}, function(locale, value) return "Blitz" end),
	--[+ Aura +]--
	-- create_template("talent_tree_main_002_en", {"loc_glossary_term_aura"}, {"en"}, function(locale, value) return "Aura" end),
	--[+ Ability +]--
	-- create_template("talent_tree_main_003_en", {"loc_glossary_term_class_ability"}, {"en"}, function(locale, value) return "Ability" end),
	--[+ Keystone  +]--
	-- create_template("talent_tree_main_004_en", {"loc_glossary_talent_keystone"}, {"en"}, function(locale, value) return "Keystone" end),
	--[+ (Lock) Locked +]--
	-- create_template("talent_tree_main_005_en", {"loc_talent_mechanic_locked"}, {"en"}, function(locale, value) return "Locked" end),
	--[+ [LMB] Activate +]--
	-- create_template("talent_tree_main_006_en", {"loc_talent_menu_tooltip_button_hint_first_level"}, {"en"}, function(locale, value) return "Activate" end),
	--[+ [RMB] Deactivate +]--
	-- create_template("talent_tree_main_007_en", {"loc_talent_menu_tooltip_button_hint_remove_level_first"}, {"en"}, function(locale, value) return "Deactivate" end),
	--[+ [V] View full build  +]--
	-- create_template("talent_tree_main_008_en", {"loc_alias_talent_builder_view_hotkey_summary"}, {"en"}, function(locale, value) return "View full build" end),
	--[+ Full build +]--
	-- create_template("talent_tree_main_009_en", {"loc_alias_talent_builder_view_popup_title_summary"}, {"en"}, function(locale, value) return "Full build" end),

--[+ +MODIFIERS+ +]--
	--[+ Operative Modifier +]--
	-- create_template("talent_tree_main_mods_000_en", {"loc_glossary_talent_stat"}, {"en"}, function(locale, value) return "Operative Modifier" end),
	--[+ Ability Modifier +]--
	-- create_template("talent_tree_main_mods_001_en", {"loc_glossary_talent_ability_modifier"}, {"en"}, function(locale, value) return "Ability Modifier" end),
	--[+ Keystone Modifier +]--
	-- create_template("talent_tree_main_mods_002_en", {"loc_glossary_talent_keystone_modifier"}, {"en"}, function(locale, value) return "Keystone Modifier" end),

--[+ +SELECTING THIS...+ +]--
	-- create_template("talent_tree_main_sel_000_en", {"loc_talent_mechanic_exclusive_tactical"}, {"en"}, function(locale, value) return "Selecting this Blitz locks all other Blitzes." end), -- Selecting this Blitz locks all other Blitzes.
	-- create_template("talent_tree_main_sel_001_en", {"loc_talent_mechanic_exclusive_aura"}, {"en"}, function(locale, value) return "Selecting this Aura locks all other Auras." end), -- Selecting this Aura locks all other Auras.
	-- create_template("talent_tree_main_sel_002_en", {"loc_talent_mechanic_exclusive_ability"}, {"en"}, function(locale, value) return "Selecting this Ability locks all other Abilities." end), -- Selecting this Ability locks all other Abilities.
	-- create_template("talent_tree_main_sel_003_en", {"loc_talent_mechanic_mutually_exclusive"}, {"en"}, function(locale, value) return "Selecting this Talent locks all other Talents." end), -- Selecting this Talent locks all other Talents.
	-- create_template("talent_tree_main_sel_004_en", {"loc_talent_mechanic_exclusive_keystone"}, {"en"}, function(locale, value) return "Selecting this Keystone locks all other Keystones." end), -- Selecting this Keystone locks all other Keystones.

--[+ +NODES+ +]--
	--[+ Critical Chance Boost +]--
		-- create_template("talent_tree_oper_mod_006_en", {"loc_talent_crit_chance_low"}, {"en"}, function(locale, value) return "Critical Chance Boost" end),
	create_template("talent_tree_oper_mod_006_desc_en", {"loc_talent_crit_chance_low_desc"}, {"en"}, function(locale, value) return "{crit_chance:%s} "..COLORS_KWords.Crit_hit_chance_rgb.."."..TALENTS_Enh_desc_nodes.ED_CritChncBst_rgb end), -- crit_chance:+5% -- Psyker, Veteran

	--[+ Health Boost Low +]--
		create_template("talent_tree_oper_mod_005_l_en", {"loc_talent_health_low"}, {"en"}, function(locale, value) return "Health Boost Low" end),
	create_template("talent_tree_oper_mod_005_l_desc_en", {"loc_talent_health_low_desc"}, {"en"}, function(locale, value) return "{health:%s} "..COLORS_KWords.Health_rgb.."."..TALENTS_Enh_desc_nodes.ED_HeathBst_L_rgb end), -- health:+5% -- Ogryn, Veteran

	--[+ Health Boost Medium +]--
		create_template("talent_tree_oper_mod_005_m_en", {"loc_talent_health_medium"}, {"en"}, function(locale, value) return "Health Boost Medium" end),
	create_template("talent_tree_oper_mod_005_m_desc_en", {"loc_talent_health_medium_desc"}, {"en"}, function(locale, value) return "{health:%s} "..COLORS_KWords.Health_rgb.."."..TALENTS_Enh_desc_nodes.ED_HeathBst_M_rgb end),  -- health:+10% -- Psyker, Ogryn, Zealot

	--[+ Heavy Melee Damage Boost Low +]--
		create_template("talent_tree_oper_mod_014_l_en", {"loc_talent_melee_heavy_damage_low"}, {"en"}, function(locale, value) return "Heavy Melee Damage Boost Low" end),
	create_template("talent_tree_oper_mod_014_l_desc_en", {"loc_talent_melee_heavy_damage_low_desc"}, {"en"}, function(locale, value) return "{melee_heavy_damage:%s} Heavy Melee "..COLORS_KWords.Damage_rgb.."."..TALENTS_Enh_desc_nodes.ED_HMeleeDmgBst_LM_rgb end), -- melee_heavy_damage:+5% -- Ogryn

	--[+ Heavy Melee Damage Boost Medium +]--
		create_template("talent_tree_oper_mod_014_m_en", {"loc_talent_melee_heavy_damage_medium"}, {"en"}, function(locale, value) return "Heavy Melee Damage Boost Medium" end),
	create_template("talent_tree_oper_mod_014_m_desc_en", {"loc_talent_melee_heavy_damage_medium_desc"}, {"en"}, function(locale, value) return "{melee_heavy_damage:%s} Heavy Melee "..COLORS_KWords.Damage_rgb.."."..TALENTS_Enh_desc_nodes.ED_HMeleeDmgBst_LM_rgb end), -- melee_heavy_damage:+10% -- Ogryn

	--[+ Inspiring Presence +]--
		-- create_template("talent_tree_oper_mod_003_en", {"loc_talent_coherency_regen_low"}, {"en"}, function(locale, value) return "Inspiring Presence" end),
	create_template("talent_tree_oper_mod_003_desc_en", {"loc_talent_coherency_regen_low_desc"}, {"en"}, function(locale, value) return "{coherency_regen:%s} "..COLORS_KWords.Toughness_rgb.." Replenishment for you and Allies in Coherency."..TALENTS_Enh_desc_nodes.ED_InspiringP_rgb end), -- coherency_regen:+10% -- Veteran

	--[+ Melee Damage Boost Low +]--
		create_template("talent_tree_oper_mod_008_en", {"loc_talent_melee_damage_boost_low"}, {"en"}, function(locale, value) return "Melee Damage Boost Low" end),
	create_template("talent_tree_oper_mod_008_desc_en", {"loc_talent_melee_damage_boost_low_desc"}, {"en"}, function(locale, value) return "{melee_damage:%s} Melee "..COLORS_KWords.Damage_rgb.."."..TALENTS_Enh_desc_nodes.ED_MeleeDmgBst_L_M_rgb end), -- melee_damage:+5% -- Ogryn, Veteran, Zealot

	--[+ Melee Damage Boost Medium +]--
		create_template("talent_tree_oper_mod_008_1_en", {"loc_talent_melee_damage_boost_medium"}, {"en"}, function(locale, value) return "Melee Damage Boost Medium" end),
	create_template("talent_tree_oper_mod_008_desc_en", {"loc_talent_melee_damage_boost_medium_desc"}, {"en"}, function(locale, value) return "{melee_damage:%s} Melee "..COLORS_KWords.Damage_rgb.."."..TALENTS_Enh_desc_nodes.ED_MeleeDmgBst_L_M_rgb end), -- melee_damage:+10% -- Veteran

	--[+ Movement Speed Boost +]--
		-- create_template("talent_tree_oper_mod_007_en",{"loc_talent_movement_speed_low"}, {"en"}, function(locale, value) return "Movement Speed Boost" end),
	create_template("talent_tree_oper_mod_007_desc_en", {"loc_talent_movement_speed_low_desc"}, {"en"}, function(locale, value) return "{movement_speed:%s} Movement Speed."..TALENTS_Enh_desc_nodes.ED_MoveSpdBst_rgb end), -- movement_speed:+5%. -- Psyker, Veteran, Zealot

	--[+ Peril Resistance +]--
		-- create_template("talent_tree_oper_mod_001_en",{"loc_talent_warp_charge_low"}, {"en"}, function(locale, value) return "Peril Resistance" end),
	create_template("talent_tree_oper_mod_001_desc_en", {"loc_talent_warp_charge_low_desc"}, {"en"}, function(locale, value) return "{warp_charge:%s} "..COLORS_KWords.Peril_rgb.." Generation."..TALENTS_Enh_desc_nodes.ED_PerilRes_rgb end), -- warp_charge:-5% -- Psyker

	--[+ Ranged Damage Boost +]--
		-- create_template("talent_tree_oper_mod_004_en", {"loc_talent_ranged_damage_low"}, {"en"}, function(locale, value) return "Ranged Damage Boost" end),
	create_template("talent_tree_oper_mod_004_desc_en", {"loc_talent_ranged_damage_low_desc"}, {"en"}, function(locale, value) return "{ranged_damage:%s} Ranged "..COLORS_KWords.Damage_rgb.."."..TALENTS_Enh_desc_nodes.ED_RangDmgBst_rgb end),  -- ranged_damage:+5% -- Psyker, Ogryn, Veteran

	--[+ Reload Boost +]--
		-- create_template("talent_tree_oper_mod_011_en", {"loc_talent_reload_speed_low"}, {"en"}, function(locale, value) return "Reload Boost" end),
	create_template("talent_tree_oper_mod_011_desc_en", {"loc_talent_reload_speed_low_desc"}, {"en"}, function(locale, value) return "{reload_speed:%s} Reload Speed."..TALENTS_Enh_desc_nodes.ED_ReloadBst_rgb end), -- reload_speed: +5% -- Ogryn, Veteran

	--[+ Rending Boost +]--
		-- create_template("talent_tree_oper_mod_013_en", {"loc_talent_armor_pen_low"}, {"en"}, function(locale, value) return "Rending Boost" end),
	create_template("talent_tree_oper_mod_013_desc_en", {"loc_talent_armor_pen_low_desc"}, {"en"}, function(locale, value) return "{rending:%s} "..COLORS_KWords.Rending_rgb.."."..TALENTS_Enh_desc_nodes.ED_RendingBst_rgb end), -- rending: +5% -- Ogryn

	--[+ Stamina Boost +]--
		-- create_template("talent_tree_oper_mod_009_en", {"loc_talent_stamina_low"}, {"en"}, function(locale, value) return "Stamina Boost" end),
	create_template("talent_tree_oper_mod_009_desc_en", {"loc_talent_stamina_low_desc"}, {"en"}, function(locale, value) return "{stamina:%s} "..COLORS_KWords.Stamina_rgb.."."..TALENTS_Enh_desc_nodes.ED_StaminaBst_rgb end), -- stamina: +1 -- Veteran, Zealot

	--[+ Stamina Regeneration Boost +]--
		-- create_template("talent_tree_oper_mod_012_en", {"loc_talent_stamina_regen_delay"}, {"en"}, function(locale, value) return "Stamina Regeneration Boost" end),
	create_template("talent_tree_oper_mod_012_desc_en", {"loc_talent_stamina_regen_delay_desc"}, {"en"}, function(locale, value) return "{duration:%s} seconds "..COLORS_KWords.Stamina_rgb.." Regeneration Delay Reduction."..TALENTS_Enh_desc_nodes.ED_StamRegenBst_rgb end), -- duration: 0.25 -- Veteran

	--[+ Suppression Boost +]--
		-- create_template("talent_tree_oper_mod_010_en", {"loc_talent_suppression_low"}, {"en"}, function(locale, value) return "Suppression Boost" end),
	create_template("talent_tree_oper_mod_010_desc_en", {"loc_talent_suppression_low_desc"}, {"en"}, function(locale, value) return "{suppression:%s} Suppression Dealt to enemies."..TALENTS_Enh_desc_nodes.ED_SuppressionBst_rgb end), -- suppression: +25% -- Ogryn, Veteran, Zealot

	--[+ Toughness Boost Low +]--
		create_template("talent_tree_oper_mod_000_l_en", {"loc_talent_toughness_boost_low"}, {"en"}, function(locale, value) return "Toughness Boost Low" end),
	create_template("talent_tree_oper_mod_000_l_desc_en", {"loc_talent_toughness_boost_low_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.."."..TALENTS_Enh_desc_nodes.ED_TghnsBst_L_rgb end), -- toughness: +15% -- Psyker, Ogryn, Veteran, Zealot

	--[+ Toughness Boost Medium +]--
		create_template("talent_tree_oper_mod_000_m_en", {"loc_talent_toughness_boost_medium"}, {"en"}, function(locale, value) return "Toughness Boost Medium" end),
	create_template("talent_tree_oper_mod_000_m_desc_en", {"loc_talent_toughness_boost_medium_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.."."..TALENTS_Enh_desc_nodes.ED_TghnsBst_M_rgb end), -- toughness:+25% -- Ogryn, Veteran,

	--[+ Toughness Damage Reduction Low +]--
		create_template("talent_tree_oper_mod_002_l_en", {"loc_talent_toughness_damage_reduction_low"}, {"en"}, function(locale, value) return "Toughness Damage Reduction Low" end),
	create_template("talent_tree_oper_mod_002_l_desc_en", {"loc_talent_toughness_damage_reduction_low_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_dmg_red_rgb.."."..TALENTS_Enh_desc_nodes.ED_TghnsDmgRed_LM_rgb end), -- toughness:+5% -- Psyker, Veteran, Zealot

	--[+ Toughness Damage Reduction Medium +]--
		create_template("talent_tree_oper_mod_002_m_en",{"loc_talent_toughness_damage_reduction_medium"}, {"en"}, function(locale, value) return "Toughness Damage Reduction Medium" end),
	create_template("talent_tree_oper_mod_002_m_desc_en",{"loc_talent_toughness_damage_reduction_medium_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_dmg_red_rgb.."."..TALENTS_Enh_desc_nodes.ED_TghnsDmgRed_LM_rgb end), -- toughness:+10% -- Ogryn, Veteran

--[+ ++PSYKER++ +]--
--[+ +BLITZ+ +]--
	--[+ Blitz 0 - Brain Burst +]--
		-- create_template("talent_tree_psy_blitz0_000_en", {"loc_ability_psyker_smite"}, {"en"}, function(locale, value) return "Brain Burst" end),
	create_template("talent_tree_psy_blitz0_000_desc_en", {"loc_ability_psyker_smite_description_new"}, {"en"}, function(locale, value) return "Charge up your Psychic Power and release it to deal high "..COLORS_KWords.Damage_rgb.." to a Single Enemy. Effective against Flak and Carapace Armoured Enemies."..TALENTS_Enh_desc.ED_PSY_Blitz_0_rgb end), -- & -> and -- colors

	--[+ Blitz 1 - Brain Rupture +]--
		-- create_template("talent_tree_psy_blitz1_000_en", {"loc_talent_psyker_brain_burst_improved"}, {"en"}, function(locale, value) return "Brain Rupture" end),
	create_template("talent_tree_psy_blitz1_000_desc_en", {"loc_talent_psyker_brain_burst_improved_description"}, {"en"}, function(locale, value) return "Charge up your Psychic Power and release it to deal immense "..COLORS_KWords.Damage_rgb.." to a Single Enemy. Effective against Flak and Carapace Armoured Enemies.\nThis is an augmented version of {talent_old:%s} dealing {damage:%s} "..COLORS_KWords.Damage_rgb.."."..TALENTS_Enh_desc.ED_PSY_Blitz_1_rgb end), -- talent_old: Brain Burst, damage: +50% -- & -> and -- colors

	--[+ Blitz 1-1 - Kinetic Resonance +]--
	   -- create_template("talent_tree_psy_blitz1_001_en", {"loc_talent_psyker_ability_increase_brain_burst_speed"}, {"en"}, function(locale, value) return "Kinetic Resonance" end),
	create_template("talent_tree_psy_blitz1_001_desc_en", {"loc_talent_psyker_ability_increase_brain_burst_speed_desc"}, {"en"}, function(locale, value) return "{smite_attack_speed:%s} faster charging of your {talent_name:%s} after using your "..COLORS_KWords.Combat_ability_rgb..", generating {warp_charge_cost:%s} less "..COLORS_KWords.Peril_rgb.." for {duration:%s} seconds."..TALENTS_Enh_desc.ED_PSY_Blitz_1_1_rgb end), -- talent_name: Brain Rupture, smite_attack_speed: +75%, warp_charge_cost: 50%, duration:10 -- s -> seconds -- colors

	--[+ Blitz 1-2 - Kinetic Flayer +]--
		-- create_template("talent_tree_psy_blitz1_002_en", {"loc_talent_psyker_smite_on_hit"}, {"en"}, function(locale, value) return "Kinetic Flayer" end),
	create_template("talent_tree_psy_blitz1_002_desc_en", {"loc_talent_psyker_smite_on_hit_special_elite_desc"}, {"en"}, function(locale, value) return "While below "..COLORS_Numbers.pc_97_rgb.." "..COLORS_KWords.Peril_rgb..", all Attacks against Speacials, Elites and Monstrosities, have {smite_chance:%s} chance to {talent_name:%s} the target on any of Psyker's damaging attacks. Cooldown {time:%s} seconds."..TALENTS_Enh_desc.ED_PSY_Blitz_1_2_rgb end), -- smite_chance: 10%, talent_name: Brain Rupture, time: 15 -- s -> seconds -- colors -- lil rewrite

	--[+ Blitz 2 - Smite +]--
		-- create_template("talent_tree_psy_blitz2_000_en", {"loc_ability_psyker_chain_lightning"}, {"en"}, function(locale, value) return "Smite" end),
	create_template("talent_tree_psy_blitz2_000_desc_en", {"loc_ability_psyker_chain_lightning_description"}, {"en"}, function(locale, value) return "You unleash a torrent of chain Bio-Lightning that slowly jumps between enemies, dealing low "..COLORS_KWords.Electrcuting_rgb.." "..COLORS_KWords.Damage_rgb.." over time and very High "..COLORS_KWords.Stagger_rgb.." to them.\nSecondary charged attack deals more "..COLORS_KWords.Damage_rgb.." when released and also jumps faster from enemy to enemy."..TALENTS_Enh_desc.ED_PSY_Blitz_2_rgb end), -- total rewrite -- colors

	--[+ Blitz 2-1 - Lightning Storm +]--
		-- create_template("talent_tree_psy_blitz2_001_en",{"loc_talent_psyker_increased_chain_lightning_size"}, {"en"}, function(locale, value) return "Lightning Storm" end),
	create_template("talent_tree_psy_blitz2_001_desc_en", {"loc_talent_psyker_increased_chain_lightning_size_description"}, {"en"}, function(locale, value) return "Increases the number of jumps of your {talent_name:%s} from "..COLORS_Numbers.n_1_rgb.." to "..COLORS_Numbers.n_2_rgb.."."..TALENTS_Enh_desc.ED_PSY_Blitz_2_1_rgb end), -- talent_name: Smite, max_jumps: +1 -- rewrite "by {max_jumps:%s}"

	--[+ Blitz 2-2 - Enfeeble +]--
		-- create_template("talent_tree_psy_blitz2_002_en", {"loc_talent_psyker_increased_chain_lightning_improved_target_buff"}, {"en"}, function(locale, value) return "Enfeeble" end),
	create_template("talent_tree_psy_blitz2_002_desc_en", {"loc_talent_psyker_chain_lightning_improved_target_buff_alt_description"}, {"en"}, function(locale, value) return "{damage:%s} increased Base "..COLORS_KWords.Damage_rgb.." from all sources is taken by enemies affected by the "..COLORS_KWords.Electrocute_rgb.." effect of your {talent_name:%s}."..TALENTS_Enh_desc.ED_PSY_Blitz_2_2_rgb end), -- talent_name: Smite, damage: +10% -- colors

	--[+ Blitz 2-3 - Charged Strike +]--
		-- create_template("talent_tree_psy_blitz2_003_en", {"loc_talent_psyker_chain_lightning_heavy_attacks"}, {"en"}, function(locale, value) return "Charged Strike" end),
	create_template("talent_tree_psy_blitz2_002_desc_en", {"loc_talent_psyker_chain_lightning_damage_heavy_attacks_desc"}, {"en"}, function(locale, value) return "Your Heavy Melee Attacks "..COLORS_KWords.Electrocute_rgb.." enemies hit, damaging them."..TALENTS_Enh_desc.ED_PSY_Blitz_2_3_rgb end), -- colors

	--[+ Blitz 3 - Assail +]--
		-- create_template("talent_tree_psy_blitz3_000_en", {"loc_ability_psyker_blitz_throwing_knives"}, {"en"}, function(locale, value) return "Assail" end),
	create_template("talent_tree_psy_blitz3_000_desc_en", {"loc_ability_psyker_blitz_throwing_knives_description"}, {"en"}, function(locale, value) return "You throw swift, homing projectiles formed of psychic energy that follows the player's crosshair for "..COLORS_Numbers.n_2_5_rgb.." seconds to the nearest Enemy. Deals "..COLORS_Numbers.n_200_rgb.." Base "..COLORS_KWords.Damage_rgb.." to the first target and cost "..COLORS_Numbers.pc_10_rgb.." "..COLORS_KWords.Peril_rgb..".\nSecondary attack throws a homing projectile that flies for "..COLORS_Numbers.n_3_rgb.." seconds and hitting enemies within a "..COLORS_Numbers.n_50_rgb.." meter radius with a guaranteed hit. Deals "..COLORS_Numbers.n_340_rgb.." Base "..COLORS_KWords.Damage_rgb.." and cost "..COLORS_Numbers.pc_25_rgb.." "..COLORS_KWords.Peril_rgb.."."..TALENTS_Enh_desc.ED_PSY_Blitz_3_rgb end), -- total rewrite -- colors

	--[+ Blitz 3-1 - Ethereal Shards +]--
		-- create_template("talent_tree_psy_blitz3_001_en", {"loc_talent_psyker_throwing_knives_pierce"}, {"en"}, function(locale, value) return "Ethereal Shards" end),
	create_template("talent_tree_psy_blitz3_001_desc_en", {"loc_talent_psyker_throwing_knives_pierce_description"}, {"en"}, function(locale, value) return "Projectiles from {talent_name:%s} now pierce additional targets, up from "..COLORS_Numbers.n_2_rgb.." to "..COLORS_Numbers.n_3_rgb.."."..TALENTS_Enh_desc.ED_PSY_Blitz_3_1_rgb end), -- talent_name: Assail -- colors

	--[+ Blitz 3-2 - Quick Shards +]--
		-- create_template("talent_tree_psy_blitz3_002_en", {"loc_talent_psyker_throwing_knives_reduced_cooldown"}, {"en"}, function(locale, value) return "Quick Shards" end),
	create_template("talent_tree_psy_blitz3_002_desc_en", {"loc_talent_psyker_throwing_knives_cast_speed_description"}, {"en"}, function(locale, value) return "{talent_name:%s} charges Replenish {recharge:%s} faster."..TALENTS_Enh_desc.ED_PSY_Blitz_3_2_rgb end), -- talent_name: Assail, recharge: 30%

--[+ +AURA+ +]--
	--[+ Aura 0 - The Quickening +]--
		-- create_template("talent_tree_psy_aura0_000_en", {"loc_talent_psyker_aura_reduced_ability_cooldown"}, {"en"}, function(locale, value) return "The Quickening" end),
	create_template("talent_tree_psy_aura0_000_desc_en", {"loc_talent_psyker_aura_reduced_ability_cooldown_description"}, {"en"}, function(locale, value) return "{cooldown_reduction:%s} "..COLORS_KWords.Ability_cd_rgb.." Reduction for you and Allies in Coherency."..TALENTS_Enh_desc.ED_PSY_Aura_0_rgb end), -- cooldown_reduction: +7.5% -- colors

	--[+ Aura 1 - Kinetic Presence +]--
		-- create_template("talent_tree_psy_aura1_000_en", {"loc_talent_psyker_base_3"}, {"en"}, function(locale, value) return "Kinetic Presence" end),
	create_template("talent_tree_psy_aura1_000_desc_en", {"loc_talent_psyker_base_3_description"}, {"en"}, function(locale, value) return "{damage:%s} "..COLORS_KWords.Damage_rgb.." against Elite Enemies for you and Allies in Coherency."..TALENTS_Enh_desc.ED_PSY_Aura_1_rgb end), -- damage: +7.5% -- colors

	--[+ Aura 2 - Seer's Presence +]--
		-- create_template("talent_tree_psy_aura2_000_en", {"loc_talent_psyker_cooldown_aura_improved"}, {"en"}, function(locale, value) return "Seer's Presence" end),
	create_template("talent_tree_psy_aura2_000_desc_en", {"loc_talent_psyker_cooldown_aura_improved_description"}, {"en"}, function(locale, value) return "{cooldown_reduction:%s} "..COLORS_KWords.Ability_cd_rgb.." Reduction for you and Allies in Coherency.\n\nThis is an augmented version of {talent_name:%s}."..TALENTS_Enh_desc.ED_PSY_Aura_2_rgb end), -- cooldown_reduction: +10%, talent_name: The Quickening -- colors

	--[+ Aura 3 - Prescience +]--
		-- create_template("talent_tree_psy_aura3_000_en", {"loc_ability_psyker_gunslinger_aura"}, {"en"}, function(locale, value) return "Prescience" end),
	create_template("talent_tree_psy_aura3_000_desc_en", {"loc_ability_psyker_gunslinger_aura_description"}, {"en"}, function(locale, value) return "You and Allies in Coherency gain {critical_strike_chance:%s} "..COLORS_KWords.Crit_hit_chance_rgb.."."..TALENTS_Enh_desc.ED_PSY_Aura_3_rgb end), -- critical_strike_chance: +5% -- colors

--[+ +ABILITIES+ +]--
	--[+ Ability 0 - Psykinetic's Wrath +]--
		-- create_template("talent_tree_psy_abil0_000_en", {"loc_talent_psyker_2_combat"}, {"en"}, function(locale, value) return "Psykinetic's Wrath" end),
	create_template("talent_tree_psy_abil0_000_desc_en", {"loc_talent_psyker_shout_ability_description"}, {"en"}, function(locale, value) return "Releases a cone-shaped shout in front of Psyker that "..COLORS_KWords.Staggers_rgb.." Enemies in front of you. Quells {warpcharge_vent:%s} "..COLORS_KWords.Peril_rgb..".\n\nBase Cooldown: {cooldown:%s} seconds."..TALENTS_Enh_desc.ED_PSY_Ability_0_rgb end), -- warpcharge_vent: 10%, cooldown: 30 -- rewrite -- s->seconds -- colors

	--[+ Ability 1 - Venting Shriek +]--
		-- create_template("talent_tree_psy_abil1_000_en", {"loc_talent_psyker_shout_vent_warp_charge"}, {"en"}, function(locale, value) return "Venting Shriek" end),
	create_template("talent_tree_psy_abil1_000_desc_en", {"loc_talent_psyker_shout_vent_warp_charge_description"}, {"en"}, function(locale, value) return "Releases a cone-shaped shout in front of Psyker that "..COLORS_KWords.Staggers_rgb.." Enemies in front of you. Quells {warpcharge_vent:%s} "..COLORS_KWords.Peril_rgb..".\n\nBase Cooldown: {cooldown:%s} seconds.\n\nThis is augmented version of {talent_name:%s}."..TALENTS_Enh_desc.ED_PSY_Ability_1_rgb end), -- warpcharge_vent: 50%, cooldown: 30, talent_name: Psykinetic's Wrath -- s->seconds -- colors

	--[+ Ability 1-1 - Becalming Eruption +]--
		-- create_template("talent_tree_psy_abil1_001_en", {"loc_talent_psyker_shout_reduces_warp_charge_generation"}, {"en"}, function(locale, value) return "Becalming Eruption" end),
	create_template("talent_tree_psy_abil1_001_desc_en", {"loc_talent_psyker_shout_reduces_warp_charge_generation_description"}, {"en"}, function(locale, value) return "{talent_name:%s} now decreases "..COLORS_KWords.Peril_rgb.." Generation by {warp_generation:%s} for each Enemy hit. Up to {max_stacks:%s}"..COLORS_Numbers.pc_rgb..". Lasts {duration:%s} seconds."..TALENTS_Enh_desc.ED_PSY_Ability_1_1_rgb end), -- talent_name: Venting Shriek, warp_generation: 1%, max_stacks: 25, duration: 5 -- s->seconds -- colors

	--[+ Ability 1-2 - Warp Rupture +]--
		-- create_template("talent_tree_psy_abil1_002_en", --  {"loc_talent_psyker_shout_damage_per_warp_charge"}, {"en"}, function(locale, value) return "Warp Rupture" end),
	create_template("talent_tree_psy_abil1_002_desc_en", {"loc_talent_psyker_shout_damage_per_warp_charge_description"}, {"en"}, function(locale, value) return "Your {talent_name:%s} now also deals {base_damage:%s}-{max_damage:%s} "..COLORS_KWords.Damage_rgb..", based off of your current "..COLORS_KWords.Peril_rgb.." percentage."..TALENTS_Enh_desc.ED_PSY_Ability_1_2_rgb end), -- talent_name: Venting Shriek, base_damage: 100, max_damage: 200 -- colors

	--[+ Ability 1-3 - Warp Creeping Flames +]--
		-- create_template("talent_tree_psy_abil1_003_en", {"loc_talent_psyker_warpfire_on_shout"}, {"en"}, function(locale, value) return "Creeping Flames" end),
	create_template("talent_tree_psy_abil1_003_desc_en", {"loc_talent_psyker_warpfire_on_shout_desc"}, {"en"}, function(locale, value) return "{talent_name:%s} applies {min_stacks:%s}{warpfire_stacks:%s} Stacks of "..COLORS_KWords.Soulblaze_rgb.." to targets Hit based on your current "..COLORS_KWords.Peril_rgb.."."..TALENTS_Enh_desc.ED_PSY_Ability_1_3_rgb end), -- talent_name: Venting Shriek, min_stacks: 1, warpfire_stacks: -6 -- Stack(s)->Stacks -- colors

	--[+ Ability 2 - Telekine Shield +]--
		-- create_template("talent_tree_psy_abil2_000_en", {"loc_talent_psyker_combat_ability_shield"}, {"en"}, function(locale, value) return "Telekine Shield" end),
	create_template("talent_tree_psy_abil2_000_desc_en", {"loc_talent_psyker_combat_ability_shield_description"}, {"en"}, function(locale, value) return "Spawns a psychic shield in front of you for {duration:%s} seconds. The shield blocks Enemy Ranged Attacks, while you and Allies can still shoot through.\nBase Cooldown: {cooldown:%s} seconds."..TALENTS_Enh_desc.ED_PSY_Ability_2_rgb end), -- duration: 17.5, cooldown: 40 -- s->seconds

	--[+ Ability 2-1 - Bolstered Shield +]--
		-- create_template("talent_tree_psy_abil2_001_en", {"loc_talent_psyker_force_field_charges"}, {"en"}, function(locale, value) return "Bolstered Shield" end),
	create_template("talent_tree_psy_abil2_001_desc_en", {"loc_talent_psyker_force_field_charges_description"}, {"en"}, function(locale, value) return "{talent_name:%s} now holds up to {max_charges:%s} charges."..TALENTS_Enh_desc.ED_PSY_Ability_2_1_rgb end), -- talent_name: Telekine Shield, max_charges: 2

	--[+ Ability 2-2 - Enervating Threshold +]--
		-- create_template("talent_tree_psy_abil2_002_en", {"loc_talent_psyker_force_field_stun_increased"}, {"en"}, function(locale, value) return "Enervating Threshold" end),
	create_template("talent_tree_psy_abil2_002_desc_en", {"loc_talent_psyker_force_field_stun_increased_description"}, {"en"}, function(locale, value) return "{ability:%s} has a {proc_chance:%s} chance to "..COLORS_KWords.Stun_rgb.." enemies that pass through it. Specialist enemies have a {special_proc_chance:%s} chance to get "..COLORS_KWords.Stunned_rgb.." but also damage the {ability:%s}."..TALENTS_Enh_desc.ED_PSY_Ability_2_2_rgb end), -- ability: Telekine Shield, proc_chance: 10%, special_proc_chance: 100% -- colors

	--[+ Ability 2-3 - Telekine Dome +]--
	   -- create_template("talent_tree_psy_abil2_003_en", {"loc_talent_psyker_force_field_dome"}, {"en"}, function(locale, value) return "Telekine Dome" end),
	create_template("talent_tree_psy_abil2_003_desc_en", {"loc_talent_psyker_force_field_dome_new_desc"}, {"en"}, function(locale, value) return "{talent_name:%s} now forms a spherical shield which lasts {duration:%s} seconds."..TALENTS_Enh_desc.ED_PSY_Ability_2_3_rgb end), -- talent_name: Telekine Shield, duration: 25 -- s->seconds

	--[+ Ability 2-4 - Sanctuary +]--
		-- create_template("talent_tree_psy_abil2_004_en", {"loc_talent_psyker_force_field_grants_toughness"}, {"en"}, function(locale, value) return "Sanctuary" end),
	create_template("talent_tree_psy_abil2_004_desc_en", {"loc_talent_psyker_force_field_grants_toughness_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." per second replenishes for Allies inside your {talent_name:%s}.\n{toughness_damage_reduction:%s} "..COLORS_KWords.Toughness_dmg_red_rgb.." for {duration:%s} seconds for all Allies inside your {talent_name:%s} when it dissipates."..TALENTS_Enh_desc.ED_PSY_Ability_2_4_rgb end), -- talent_name: Telekine Shield, toughness: 10%, toughness_damage_reduction: +50%, duration: 5 -- s->seconds -- colors

	--[+ Ability 3 - Scrier's Gaze +]--
		-- create_template("talent_tree_psy_abil3_000_en", {"loc_talent_psyker_combat_ability_overcharge_stance"}, {"en"}, function(locale, value) return "Scrier's Gaze" end),
	create_template("talent_tree_psy_abil3_000_desc_en", {"loc_talent_psyker_combat_ability_overcharge_stance_new_description"}, {"en"}, function(locale, value) return "You enter "..COLORS_Numbers.Scriers_gaze_rgb.." and gain {base_damage:%s} "..COLORS_KWords.Damage_rgb..", {crit_chance:%s} "..COLORS_KWords.Crit_chance_rgb.." and Suppression Immunity.\nFor every second in "..COLORS_Numbers.Scriers_gaze_rgb.." you gain {damage_per_stack:%s} "..COLORS_KWords.Damage_rgb..", up to a maximum of {max_damage:%s}. This effect lingers for {duration:%s} seconds after leaving "..COLORS_Numbers.Scriers_gaze_rgb..".\nWhile in "..COLORS_Numbers.Scriers_gaze_rgb.." you build up "..COLORS_KWords.Peril_rgb..". Killing enemies while overcharging slows down the auto "..COLORS_KWords.Peril_rgb.." generation by reducing the effective timer by "..COLORS_Numbers.n_033_rgb.." seconds per Kill.\nAt {max_peril:%s} "..COLORS_KWords.Peril_rgb.." Ability ends.\nBase Cooldown: {cooldown:%s} seconds."..TALENTS_Enh_desc.ED_PSY_Ability_3_rgb end), -- base_damage: +10%, crit_chance: +20%, damage_per_stack: +1%, max_damage: +30%, duration: 10, max_peril: 100%, cooldown: 25 -- rewrite -- s->seconds -- colors

	--[+ Ability 3-1 - Endurance +]--
		-- create_template("talent_tree_psy_abil3_001_en", {"loc_ability_psyker_overcharge_reduced_toughness_damage_taken"}, {"en"}, function(locale, value) return "Endurance" end),
	create_template("talent_tree_psy_abil3_001_desc_en", {"loc_ability_psyker_overcharge_reduced_toughness_damage_taken_description"}, {"en"}, function(locale, value) return "While overcharging, {talent_name:%s} grants {tdr:%s} "..COLORS_KWords.Toughness_dmg_red_rgb.."."..TALENTS_Enh_desc.ED_PSY_Ability_3_1_rgb end), -- talent_name: Scrier's Gaze, tdr: +20% -- colors

	--[+ Ability 3-2 - Precognition +]--
		-- create_template("talent_tree_psy_abil3_002_en", -- Precognition {"loc_ability_psyker_overcharge_weakspot"}, {"en"}, function(locale, value) return "Precognition" end),
	create_template("talent_tree_psy_abil3_002_desc_en", {"loc_ability_psyker_overcharge_weakspot_description"}, {"en"}, function(locale, value) return "While overcharging, makes "..COLORS_KWords.Weakspot_rgb.." kills generate {second:%s} additional Stack.\n\nFor each second spent in {talent_name:%s}, you now also gain {finesse_damage_per_stack:%s} "..COLORS_KWords.Finesse_dmg_rgb..", up to {max_finesse_damage:%s} Max, which lingers for {duration:%s} seconds after leaving {talent_name:%s}."..TALENTS_Enh_desc.ED_PSY_Ability_3_2_rgb end), -- second: 1, talent_name: Scrier's Gaze, finesse_damage_per_stack: +1%, max_finesse_damage: +30%, duration: 10 -- s->seconds -- colors

	--[+ Ability 3-3 - Warp Speed +]--
		-- create_template("talent_tree_psy_abil3_003_en", {"loc_ability_psyker_overcharge_movement_speed"}, {"en"}, function(locale, value) return "Warp Speed" end),
	create_template("talent_tree_psy_abil3_003_desc_en", {"loc_ability_psyker_overcharge_movement_speed_description"}, {"en"}, function(locale, value) return "While overcharging, {talent_name:%s} increases your Movement Speed by {movement_speed:%s}."..TALENTS_Enh_desc.ED_PSY_Ability_3_3_rgb end), -- talent_name: Scrier's Gaze, movement_speed: +20%

	--[+ Ability 3-4 - Reality Anchor +]--
		-- create_template("talent_tree_psy_abil3_004_en", {"loc_ability_psyker_overcharge_reduced_warp_charge"}, {"en"}, function(locale, value) return "Reality Anchor" end),
	create_template("talent_tree_psy_abil3_004_desc_en", {"loc_ability_psyker_overcharge_reduced_warp_charge_description"}, {"en"}, function(locale, value) return "While overcharging, {talent_name:%s} also reduces your "..COLORS_KWords.Peril_rgb.." Generated by {warp_charge:%s}."..TALENTS_Enh_desc.ED_PSY_Ability_3_4_rgb end), -- talent_name: Scrier's Gaze, warp_charge: -20% -- colors

	--[+ Ability 3-5 - Warp Unbound +]--
		-- create_template("talent_tree_psy_abil3_005_en", {"loc_talent_psyker_overcharge_infinite_casting"}, {"en"}, function(locale, value) return "Warp Unbound" end),
	create_template("talent_tree_psy_abil3_005_desc_en", {"loc_talent_psyker_overcharge_infinite_casting_desc"}, {"en"}, function(locale, value) return "{talent_name:%s} now also prevents overloading from "..COLORS_KWords.Perils_rgb.." of the Warp, during its lingering effect."..TALENTS_Enh_desc.ED_PSY_Ability_3_5_rgb end), -- talent_name: Scrier's Gaze

--[+ +KEYSTONES+ +]--
	--[+ Keystone 1 - Warp Siphon +]--
		-- create_template("talent_tree_psy_keys1_000_en", {"loc_talent_psyker_souls"}, {"en"}, function(locale, value) return "Warp Siphon" end),
	create_template("talent_tree_psy_keys1_000_desc_en", {"loc_talent_psyker_souls_desc"}, {"en"}, function(locale, value) return "Killing an Elite or Speacialist Enemy gains you a Warp Charge for {duration:%s} seconds, Stacking {stack:%s} times. Your next "..COLORS_KWords.Combat_ability_rgb.." spends all available Warp Charges to reduce the "..COLORS_KWords.Cd_rgb.." of that "..COLORS_KWords.Combat_ability_rgb.." by {cooldown_reduction:%s} per Warp Charge."..TALENTS_Enh_desc.ED_PSY_Keystone_1_rgb end), -- duration: 25, stack: 4, cooldown_reduction: 7.5% -- time(s)->times -- colors

	--[+ Keystone 1-1 - Inner Tranquility +]--
		-- create_template("talent_tree_psy_keys1_001_en", {"loc_talent_psyker_reduced_warp_charge_cost_venting_speed"}, {"en"}, function(locale, value) return "Inner Tranquility" end),
	create_template("talent_tree_psy_keys1_001_desc_en", {"loc_talent_psyker_reduced_warp_charge_cost_venting_speed_desc"}, {"en"}, function(locale, value) return "{warp_charge_amount:%s} "..COLORS_KWords.Peril_rgb.." Generation Reduction for each Warp Charge."..TALENTS_Enh_desc.ED_PSY_Keystone_1_1_rgb end), -- warp_charge_amount: -6% -- colors

	--[+ Keystone 1-2 - Essence Harvest +]--
		-- create_template("talent_tree_psy_keys1_002_en", {"loc_talent_psyker_toughness_regen_on_soul"}, {"en"}, function(locale, value) return "Essence Harvest" end),
	create_template("talent_tree_psy_keys1_002_desc_en", {"loc_talent_psyker_toughness_regen_on_soul_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.pc_6_rgb.." "..COLORS_KWords.Toughness_rgb.." is replenished per second for {time:%s} seconds after gaining Warp Charge, up to a Maximum of {toughness:%s}. Gaining a new Warp Charge during this time resets the timer."..TALENTS_Enh_desc.ED_PSY_Keystone_1_2_rgb end), -- toughness: 30%, time: 5 --  s->seconds -- colors

	--[+ Keystone 1-3 - Empyrean Empowerment +]--
		-- create_template("talent_tree_psy_keys1_003_en", {"loc_talent_psyker_souls_increase_damage"}, {"en"}, function(locale, value) return "Empyrean Empowerment" end),
	create_template("talent_tree_psy_keys1_003_desc_en", {"loc_talent_psyker_souls_increase_damage_desc"}, {"en"}, function(locale, value) return "{damage:%s} increase to all Base "..COLORS_KWords.Damage_rgb.." for each Warp Charge."..TALENTS_Enh_desc.ED_PSY_Keystone_1_3_rgb end), -- damage: +4% -- colors

	--[+ Keystone 1-4 - In Fire Reborn +]--
		-- create_template("talent_tree_psy_keys1_004_en", {"loc_talent_psyker_warpfire_generates_souls"}, {"en"}, function(locale, value) return "In Fire Reborn" end),
	create_template("talent_tree_psy_keys1_004_desc_en", {"loc_talent_psyker_warpfire_generates_souls_desc"}, {"en"}, function(locale, value) return "{chance:%s} chance to gain a Warp Charge when you or an Ally kill an enemy who is currently affected by "..COLORS_KWords.Soulblaze_rgb.."."..TALENTS_Enh_desc.ED_PSY_Keystone_1_4_rgb end), -- chance: 10% -- colors

	--[+ Keystone 1-5 - Psychic Vampire +]--
		-- create_template("talent_tree_psy_keys1_005_en", {"loc_talent_psyker_souls_on_kill_coop"}, {"en"}, function(locale, value) return "Psychic Vampire" end),
	create_template("talent_tree_psy_keys1_006_desc_en", {"loc_talent_psyker_souls_on_kill_coop_desc"}, {"en"}, function(locale, value) return "{soul_chance:%s} chance to gain a Warp Charge whenever you or an Ally in Coherency kills an enemy."..TALENTS_Enh_desc.ED_PSY_Keystone_1_5_rgb end), -- soul_chance: 4%

	--[+ Keystone 1-6 - Warp Battery +]--
		-- create_template("talent_tree_psy_keys1_006_en", {"loc_talent_psyker_increased_souls"}, {"en"}, function(locale, value) return "Warp Battery" end),
	create_template("talent_tree_psy_keys1_005_desc_en", {"loc_talent_psyker_increased_souls_desc"}, {"en"}, function(locale, value) return "You can store up to {soul_amount:%s} Warp Charges."..TALENTS_Enh_desc.ED_PSY_Keystone_1_6_rgb end), -- soul_amount: 6

	--[+ Keystone 2 - Empowered Psionics +]--
		-- create_template("talent_tree_psy_keys2_000_en", {"loc_talent_psyker_empowered_ability"}, {"en"}, function(locale, value) return "Empowered Psionics" end),
	create_template("talent_tree_psy_keys2_000_desc_en", {"loc_talent_psyker_empowered_ability_description"}, {"en"}, function(locale, value) return "Kills have a {chance:%s} chance to Empower your next Blitz.\nEmpowered {blitz_one:%s}:\n{smite_damage:%s} "..COLORS_KWords.Damage_rgb..",\n{smite_cost:%s} "..COLORS_KWords.Peril_rgb.." Cost Reduction,\n{smite_attack_speed:%s} Cast time Reduction."..TALENTS_Enh_desc.ED_PSY_Keystone_2_0_1_rgb.."\nEmpowered {blitz_two:%s}:\n{chain_lightning_damage:%s} "..COLORS_KWords.Damage_rgb..",\n{chain_lightning_jump_time_multiplier:%s} faster spread between Enemies."..TALENTS_Enh_desc.ED_PSY_Keystone_2_0_2_rgb.."\nEmpowered {blitz_three:%s}:\n{throwing_knives_cost:%s} "..COLORS_KWords.Peril_rgb.." Cost Reduction,\nBase "..COLORS_KWords.Damage_rgb.." increase from {throwing_knives_old_damage:%s} to {throwing_knives_new_damage:%s}.\nDoes not consume any charges."..TALENTS_Enh_desc.ED_PSY_Keystone_2_0_3_rgb end), -- chance: 7.5%, blitz_one: Brain Rupture, smite_cost: 100%, smite_attack_speed: 50%, smite_damage: +50%, blitz_two: Smite, chain_lightning_damage: +200%, chain_lightning_jump_time_multiplier: 50%, blitz_three: Assail, throwing_knives_cost: 100%, throwing_knives_old_damage: 100, throwing_knives_new_damage: 150 -- colors

	--[+ Keystone 2-1 - Bio-Lodestone +]--
		-- create_template("talent_tree_psy_keys2_001_en", {"loc_talent_psyker_increase_empower_chain_lighting_chance"}, {"en"}, function(locale, value) return "Bio-Lodestone" end),
	create_template("talent_tree_psy_keys2_001_desc_en", {"loc_talent_psyker_increase_empower_chain_lighting_chance_description"}, {"en"}, function(locale, value) return "Increases the chance to gain {talent_name:%s} on Kill from {proc_chance_before:%s} to {proc_chance_after:%s}." end), -- talent_name: Empowered Psionics, proc_chance_before: 7.5%, proc_chance_after: 12.5%

	--[+ Keystone 2-2 - Psychic Leeching +]--
	-- create_template("talent_tree_psy_keys2_002_en", {"loc_talent_psyker_empowered_chain_lightnings_replenish_toughness_to_allies"}, {"en"}, function(locale, value) return "Psychic Leeching" end),
	create_template("talent_tree_psy_keys2_002_desc_en", {"loc_talent_psyker_empowered_chain_lightnings_replenish_toughness_to_allies_description"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." Replenishment for you and Allies in Coherency when using your Blitz while {talent_name:%s} is active."..TALENTS_Enh_desc.ED_PSY_Keystone_2_2_rgb end), -- talent_name: Empowered Psionics, toughness: 15% -- colors

	--[+ Keystone 2-3 - Overpowering Souls +]--
		-- create_template("talent_tree_psy_keys2_003_en", {"loc_talent_psyker_empowered_ability_on_elite_kills"}, {"en"}, function(locale, value) return "Overpowering Souls" end),
	create_template("talent_tree_psy_keys2_003_desc_en", {"loc_talent_psyker_empowered_ability_on_elite_kills_description"}, {"en"}, function(locale, value) return "Guaranteed chance to gain {talent_name:%s} on Elite Kills." end), -- talent_name: Empowered Psionics

	--[+ Keystone 2-3 - Charged Up +]--
		-- create_template("talent_tree_psy_keys2_004_en", {"loc_talent_psyker_increased_empowered_chain_lightning_stacks"}, {"en"}, function(locale, value) return "Charged Up" end),
	create_template("talent_tree_psy_keys2_004_desc_en", {"loc_talent_psyker_increased_empowered_chain_lightning_stacks_description"}, {"en"}, function(locale, value) return "You can now hold up to {max_stacks:%s} Stacks of {talent_name:%s}." end), -- max_stacks: 3, talent_name: Empowered Psionics

	--[+ Keystone 3 - Disrupt Destiny +]--
		-- create_template("talent_tree_psy_keys3_000_en", {"loc_talent_psyker_marked_enemies_passive"}, {"en"}, function(locale, value) return "Disrupt Destiny" end),
	create_template("talent_tree_psy_keys3_000_desc_en", {"loc_talent_psyker_marked_enemies_passive_new_desc"}, {"en"}, function(locale, value) return "Every second, Enemies within "..COLORS_Numbers.n_40_rgb.." meters have a chance of being Marked. Killing a Marked Enemy Replenishes {toughness:%s} "..COLORS_KWords.Toughness_rgb..", grants {move_speed:%s} Movement Speed for {move_speed_duration:%s} seconds, and adds a "..COLORS_KWords.Precision_rgb.." Bonus for {bonus_duration} seconds.\nEach "..COLORS_KWords.Precision_rgb.." Bonus grants: {base_damage:%s} "..COLORS_KWords.Damage_rgb..", {crit_damage:%s} "..COLORS_KWords.Crit_dmg_r_rgb.." and {weakspot_damage:%s} "..COLORS_KWords.Weakspot_dmg_rgb..".\n"..COLORS_KWords.Precision_rgb.." Bonus Stacks {bonus_stacks:%s} times and when the duration ends, one Stack is removed and the duration is refreshed."..TALENTS_Enh_desc.ED_PSY_Keystone_3_rgb end), -- radius: 25->40, toughness: 10%, move_speed: +20%, move_speed_duration: 2.5, bonus_duration 4, base_damage: +1%, crit_damage: +2%, weakspot_damage: +2.5%, bonus_stacks: 15 -- m->meters -- s->seconds -- colors

	--[+ Keystone 3-1 - Perfectionism +]--
	-- create_template("talent_tree_psy_keys3_001_en", {"loc_talent_psyker_mark_increased_max_stacks"}, {"en"}, function(locale, value) return "Perfectionism" end),
	create_template("talent_tree_psy_keys3_001_desc_en", {"loc_talent_psyker_mark_increased_max_stacks_description"}, {"en"}, function(locale, value) return "Maximum "..COLORS_KWords.Precision_rgb.." Bonus Stacks are increased from {stacks_previous:%s} to {stacks_after:%s}." end), -- stacks_previous: 15, stacks_after: 25 -- colors

	--[+ Keystone 3-2 - Purloin Providence +]--
		-- create_template("talent_tree_psy_keys3_002_en", {"loc_talent_psyker_mark_kills_can_vent"}, {"en"}, function(locale, value) return "Purloin Providence" end),
	create_template("talent_tree_psy_keys3_002_desc_en", {"loc_talent_psyker_mark_kills_can_vent_description"}, {"en"}, function(locale, value) return "{chance:%s} chance to instantly Quell {warp_charge_percentage:%s} of your "..COLORS_KWords.Peril_rgb.." when killing enemies marked by {talent_name:%s}."..TALENTS_Enh_desc.ED_PSY_Keystone_3_2_rgb end), -- talent_name: Disrupt Destiny, chance: 20%, warp_charge_percentage: 15% -- colors

	--[+ Keystone 3-3 - Lingering Influence +]--
		-- create_template("talent_tree_psy_keys3_003_en", {"loc_talent_psyker_mark_increased_duration"}, {"en"}, function(locale, value) return "Lingering Influence" end),
	create_template("talent_tree_psy_keys3_003_desc_en", {"loc_talent_psyker_mark_increased_duration_description"}, {"en"}, function(locale, value) return "Increase the duration of {talent_name:%s} from {duration_previous:%s} to {duration_after:%s} seconds." end), -- talent_name: Disrupt Destiny, duration_previous: 15, duration_after: 10 -- s->seconds

	--[+ Keystone 3-4 - Cruel Fortune +]--
		-- create_template("talent_tree_psy_keys3_004_en", {"loc_talent_psyker_mark_weakspot_stacks"}, {"en"}, function(locale, value) return "Cruel Fortune" end),
	create_template("talent_tree_psy_keys3_004_desc_en", {"loc_talent_psyker_mark_weakspot_stacks_description"}, {"en"}, function(locale, value)
	return COLORS_KWords.Weakspot_rgb.." Kills grant {stacks:%s} additional Stacks of {talent_name:%s}."..TALENTS_Enh_desc.ED_PSY_Keystone_3_4_rgb end), -- stacks: 2 talent_name: Disrupt Destiny -- colors

--[+ +PASSIVES+ +]--
	--[+ Passive 1 - Soulstealer +]--
		-- create_template("talent_tree_psy_pas_001_en", {"loc_talent_psyker_toughness_on_warp_kill"}, {"en"}, function(locale, value) return "Soulstealer" end),
	create_template("talent_tree_psy_pas_001_desc_en", {"loc_talent_psyker_toughness_on_warp_kill_desc"}, {"en"}, function(locale, value) return "{toughness:%s} of Maximum "..COLORS_KWords.Toughness_rgb.." replenishes on killing an enemy with a Warp attack."..TALENTS_Enh_desc.ED_PSY_Passive_1_rgb end), -- toughness: 7.5%. -- colors

	--[+ Passive 2 - Mettle +]--
		-- create_template("talent_tree_psy_pas_002_en", {"loc_talent_psyker_crits_regen_tougness_and_movement_speed"}, {"en"}, function(locale, value) return "Mettle" end),
	create_template("talent_tree_psy_pas_002_desc_en", {"loc_talent_psyker_crits_regen_tougness_and_movement_speed_description"}, {"en"}, function(locale, value)
	return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." replenishes on "..COLORS_KWords.Crit_hits_rgb..".\n\nAlso grants {movement_speed:%s} increased Movement Speed for {seconds:%s} seconds. Stacks {stacks:%s} times."..TALENTS_Enh_desc.ED_PSY_Passive_2_rgb end), -- toughness: 5%, movement_speed: +5%, seconds: 4, stacks: 3 -- s->seconds -- colors

	--[+ Passive 3 - Quietude +]--
		-- create_template("talent_tree_psy_pas_003_en", {"loc_talent_psyker_toughness_from_vent"}, {"en"}, function(locale, value) return "Quietude" end),
	create_template("talent_tree_psy_pas_003_desc_en", {"loc_talent_psyker_toughness_from_vent_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." replenishes for each {warp_charge:%s} of "..COLORS_KWords.Peril_rgb.." Quelled."..TALENTS_Enh_desc.ED_PSY_Passive_3_rgb end), -- toughness: 5%, warp_charge: 10% -- colors

	--[+ Passive 4 - Warp Expenditure +]--
		-- create_template("talent_tree_psy_pas_004_en", {"loc_talent_psyker_warp_charge_generation_generates_toughness"}, {"en"}, function(locale, value) return "Warp Expenditure" end),
	create_template("talent_tree_psy_pas_004_desc_en", {"loc_talent_psyker_warp_charge_generation_generates_toughness_description"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." replenishes for every {warp_charge:%s} "..COLORS_KWords.Peril_rgb.." Generated."..TALENTS_Enh_desc.ED_PSY_Passive_4_rgb end), -- toughness: 2.5%, warp_charge: 10% -- colors

	--[+ Passive 5 - Perilous Combustion +]--
		-- create_template("talent_tree_psy_pas_005_en", {"loc_talent_psyker_elite_kills_add_warpfire"}, {"en"}, function(locale, value) return "Perilous Combustion" end),
	create_template("talent_tree_psy_pas_005_desc_en", {"loc_talent_psyker_elite_and_special_kills_add_warpfire_desc"}, {"en"}, function(locale, value) return "Killing an Elite or a Speacialist Enemy applies {stacks:%s} Stacks of "..COLORS_KWords.Soulblaze_rgb.." to nearby Enemies, causing "..COLORS_KWords.Damage_rgb.." over time."..TALENTS_Enh_desc.ED_PSY_Passive_5_rgb end), -- stacks: 3 -- stack(s)->Stacks  -- colors

	--[+ Passive 6 - Perfect Timing +]--
		-- create_template("talent_tree_psy_pas_006_en", {"loc_talent_psyker_crits_empower_next_attack"}, {"en"}, function(locale, value) return "Perfect Timing" end),
	create_template("talent_tree_psy_pas_006_desc_en", {"loc_talent_psyker_crits_empower_warp_description"}, {"en"}, function(locale, value) return "{damage:%s} Warp "..COLORS_KWords.Damage_rgb.." for {duration:%s} seconds on "..COLORS_KWords.Crit_hits_rgb..". Stacks {stacks:%s} times."..TALENTS_Enh_desc.ED_PSY_Passive_6_rgb end), -- damage: +3%, duration: 10, stacks: 5 -- s->seconds -- colors

	--[+ Passive 7 - Battle Meditation +]--
		-- create_template("talent_tree_psy_pas_007_en", {"loc_talent_psyker_base_2"}, {"en"}, function(locale, value) return "Battle Meditation" end),
	create_template("talent_tree_psy_pas_007_desc_en", {"loc_talent_psyker_base_2_description"}, {"en"}, function(locale, value) return "{chance:%s} chance to Quell {warp_charge_percent:%s} "..COLORS_KWords.Peril_rgb.." on Kill."..TALENTS_Enh_desc.ED_PSY_Passive_7_rgb end), -- chance: 10%, warp_charge_percent: 10% -- colors

	--[+ Passive 8 - Wildfire +]--
		-- create_template("talent_tree_psy_pas_008_en", {"loc_talent_psyker_warpfire_spread"}, {"en"}, function(locale, value) return "Wildfire" end),
	create_template("talent_tree_psy_pas_008_desc_en", {"loc_talent_psyker_warpfire_spread_desc"}, {"en"}, function(locale, value) return "When an Enemy dies while affected by your "..COLORS_KWords.Soulblaze_rgb..", nearby Enemies each gain up to {stacks:%s} Stacks of "..COLORS_KWords.Soulblaze_rgb..". They cannot gain more Stacks than the dying Enemy had."..TALENTS_Enh_desc.ED_PSY_Passive_8_rgb end), -- stacks: 4 -- colors

	--[+ Passive 9 - Psykinetic's Aura +]--
		-- create_template("talent_tree_psy_pas_009_en", {"loc_talent_psyker_elite_kills_give_combat_ability_cd_coherency"}, {"en"}, function(locale, value) return "Psykinetic's Aura" end),
	create_template("talent_tree_psy_pas_009_desc_en", {"loc_talent_psyker_elite_kills_give_combat_ability_cd_coherency_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.n_minus_rgb.."{cooldown:%s} "..COLORS_KWords.Ability_cd_rgb.." for you and Allies in Coherency on Elite or Specialist kill."..TALENTS_Enh_desc.ED_PSY_Passive_9_rgb end), -- cooldown: 5% -- colors

	--[+ Passive 10 - Mind in Motion +]--
		-- create_template("talent_tree_psy_pas_010_en", {"loc_talent_psyker_venting_doesnt_slow"}, {"en"}, function(locale, value) return "Mind in Motion" end),
	create_template("talent_tree_psy_pas_010_desc_en", {"loc_talent_psyker_venting_doesnt_slow_desc"}, {"en"}, function(locale, value) return "Your Movement Speed is not reduced while Quelling "..COLORS_KWords.Peril_rgb.."."..TALENTS_Enh_desc.ED_PSY_Passive_10_rgb end), -- colors

	--[+ Passive 11 - Malefic Momentum +]--
		-- create_template("talent_tree_psy_pas_011_en", {"loc_talent_psyker_kills_stack_other_weapon_damage"}, {"en"}, function(locale, value) return "Malefic Momentum" end),
	create_template("talent_tree_psy_pas_011_desc_en", {"loc_talent_psyker_kills_stack_other_weapon_damage_both_description"}, {"en"}, function(locale, value) return "{warp_damage:%s} "..COLORS_KWords.Damage_rgb.." to Warp Attacks for {duration:%s} seconds after a non-Warp based Kill. Stacks {stacks:%s} times.\n{non_warp_damage:%s} "..COLORS_KWords.Damage_rgb.." to non-Warp Attacks for {duration:%s} seconds after a Warp based Kill. Stacks {stacks:%s} times."..TALENTS_Enh_desc.ED_PSY_Passive_11_rgb end), -- warp_damage/non_warp_damage: +4%, duration: 8, stacks: 5 -- s->seconds -- colors

	--[+ Passive 12 - Channeled Force +]--
		-- create_template("talent_tree_psy_pas_012_en", {"loc_talent_psyker_force_staff_bonus"}, {"en"}, function(locale, value) return "Channeled Force" end),
	create_template("talent_tree_psy_pas_012_desc_en", {"loc_talent_psyker_force_staff_bonus_desc"}, {"en"}, function(locale, value) return "{damage:%s} "..COLORS_KWords.Damage_rgb.." to Force Staff's Primary Attacks after Fully Charged Force Staff Secondary Attacks. Lasts {time:%s} seconds."..TALENTS_Enh_desc.ED_PSY_Passive_12_rgb end), -- damage: +30%, time: 5 -- s->seconds -- colors

	--[+ Passive 13 - Perilous Assault +]--
		-- create_template("talent_tree_psy_pas_013_en", {"loc_talent_psyker_force_staff_melee_attack_bonus"}, {"en"}, function(locale, value) return "Perilous Assault" end),
	create_template("talent_tree_psy_pas_013_desc_en", {"loc_talent_psyker_force_staff_wield_speed_desc"}, {"en"}, function(locale, value) return "Up to {wield_speed:%s} Weapon Wield Speed, based on your current "..COLORS_KWords.Peril_rgb.."."..TALENTS_Enh_desc.ED_PSY_Passive_13_rgb end), -- wield_speed: 50% -- colors

	--[+ Passive 14 - Lightning Speed +]--
		-- create_template("talent_tree_psy_pas_014_en", {"loc_talent_psyker_melee_attack_speed"}, {"en"}, function(locale, value) return "Lightning Speed" end),
	create_template("talent_tree_psy_pas_014_desc_en", {"loc_talent_psyker_melee_attack_speed_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.n_plus_rgb.."{melee_attack_speed:%s} Melee Attack Speed."..TALENTS_Enh_desc.ED_PSY_Passive_14_rgb end), -- melee_attack_speed: 10% -- colors

	--[+ Passive 15 - Souldrinker +]--
		-- create_template("talent_tree_psy_pas_015_en", {"loc_talent_psyker_nearby_soulblaze_reduced_damage"}, {"en"}, function(locale, value) return "Souldrinker" end),
	create_template("talent_tree_psy_pas_015_desc_en", {"loc_talent_psyker_killing_enemy_with_warpfire_boosts_desc"}, {"en"}, function(locale, value) return "Killing an Enemy with "..COLORS_KWords.Soulblaze_rgb.." restores {toughness:%s} "..COLORS_KWords.Toughness_rgb.." and grants {crit_chance:%s} "..COLORS_KWords.Crit_hit_chance_rgb.." for {duration:%s} seconds."..TALENTS_Enh_desc.ED_PSY_Passive_15_rgb end), -- toughness: 5%, crit_chance: 5%, duration: 5 -- s->seconds -- colors

	--[+ Passive 16 - Empyric Shock +]--
		-- create_template("talent_tree_psy_pas_016_en", {"loc_talent_psyker_force_staff_quick_attack_bonus"}, {"en"}, function(locale, value) return "Empyric Shock" end),
	create_template("talent_tree_psy_pas_016_desc_en", {"loc_talent_psyker_force_staff_quick_attack_bonus_desc"}, {"en"}, function(locale, value) return "{damage_taken:%s} "..COLORS_KWords.Damagewrp_rgb.." Taken by victims of your Force Staff's Primary Attack. Max Stacks {max_stacks:%s}. Lasts {duration:%s} seconds."..TALENTS_Enh_desc.ED_PSY_Passive_16_rgb end), -- damage_taken: 6%, max_stacks: 5, duration: 10 -- s->seconds -- colors

	--[+ Passive 17 - By Crack of Bone +]--
		-- create_template("talent_tree_psy_pas_017_en", {"loc_talent_psyker_melee_weaving"}, {"en"}, function(locale, value) return "By Crack of Bone" end),
	create_template("talent_tree_psy_pas_017_desc_en", {"loc_talent_psyker_melee_weaving_desc"}, {"en"}, function(locale, value) return "{vent:%s} "..COLORS_KWords.Peril_rgb.." Quelling from Melee "..COLORS_KWords.Weakspot_rgb.." kills.\n{warp_generation:%s} Reduction in further "..COLORS_KWords.Peril_rgb.." Generation for {duration:%s} seconds."..TALENTS_Enh_desc.ED_PSY_Passive_17_rgb end), -- vent: 5%, warp_generation: 20%, duration: 4 -- s->seconds -- colors

	--[+ Passive 18 - Warp Splitting +]--
		-- create_template("talent_tree_psy_pas_018_en", {"loc_talent_psyker_cleave_from_peril"}, {"en"}, function(locale, value) return "Warp Splitting" end),
	create_template("talent_tree_psy_pas_018_desc_en", {"loc_talent_psyker_cleave_from_peril_desc"}, {"en"}, function(locale, value) return "Up to {max_cleave:%s} "..COLORS_KWords.Cleave_rgb..", based on "..COLORS_KWords.Peril_rgb.."."..TALENTS_Enh_desc.ED_PSY_Passive_18_rgb end), -- max_cleave: +100% -- colors

	--[+ Passive 19 - Unlucky for Some +]--
		-- create_template("talent_tree_psy_pas_019_en", {"loc_talent_psyker_restore_toughness_to_allies_when_ally_down"}, {"en"}, function(locale, value) return "Unlucky for Some" end),
	create_template("talent_tree_psy_pas_019_desc_en", {"loc_talent_psyker_restore_toughness_to_allies_when_ally_down_description"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." replenished to all other Allies in Coherency when an Ally in Coherency gets Knocked Down."..TALENTS_Enh_desc.ED_PSY_Passive_19_rgb end), -- toughness: 100% -- colors

	--[+ Passive 20 - One with the Warp +]--
		-- create_template("talent_tree_psy_pas_020_en", {"loc_talent_psyker_toughness_damage_reduction_from_warp_charge"}, {"en"}, function(locale, value) return "One with the Warp" end),
	create_template("talent_tree_psy_pas_020_desc_en", {"loc_talent_psyker_toughness_damage_reduction_from_warp_charge_desc"}, {"en"}, function(locale, value) return "{min_damage:%s} to {max_damage:%s} gain "..COLORS_KWords.Toughness_dmg_red_rgb.." based on your current "..COLORS_KWords.Peril_rgb.."."..TALENTS_Enh_desc.ED_PSY_Passive_20_rgb end), -- min_damage: +10.00%, max_damage: +33.00% -- colors

	--[+ Passive 21 - Empathic Evasion +]--
		-- create_template("talent_tree_psy_pas_21_en", {"loc_talent_psyker_dodge_after_crits"}, {"en"}, function(locale, value) return "Empathic Evasion" end),
	create_template("talent_tree_psy_pas_021_desc_en", {"loc_talent_psyker_dodge_after_crits_description"}, {"en"}, function(locale, value) return "A "..COLORS_KWords.Crit_hit_rgb.." makes you count as Dodging against Ranged Attacks for {duration:%s} second."..TALENTS_Enh_desc.ED_PSY_Passive_21_rgb end), -- duration: 1 -- s->second -- colors

	--[+ Passive 22 - Anticipation +]--
		-- create_template("talent_tree_psy_pas_022_en", {"loc_talent_psyker_improved_dodge"}, {"en"}, function(locale, value) return "Anticipation" end),
	create_template("talent_tree_psy_pas_022_desc_en", {"loc_talent_psyker_improved_dodge_description"}, {"en"}, function(locale, value) return "{dodge_linger_time:%s} Dodge duration. Increases the number of Dodges before Dodges starts becoming ineffective by {extra_consecutive_dodges:%s}."..TALENTS_Enh_desc.ED_PSY_Passive_22_rgb end), -- dodge_linger_time: +50%, extra_consecutive_dodges: 1

	--[+ Passive 23 - Solidity +]--
		-- create_template("talent_tree_psy_pas_023_en", {"loc_talent_psyker_increased_vent_speed"}, {"en"}, function(locale, value) return "Solidity" end),
	create_template("talent_tree_psy_pas_023_desc_en", {"loc_talent_psyker_increased_vent_speed_description"}, {"en"}, function(locale, value) return COLORS_Numbers.n_plus_rgb.."{vent_speed:%s} Quell Speed."..TALENTS_Enh_desc.ED_PSY_Passive_23_rgb end), -- vent_speed: 30%

	--[+ Passive 24 - Puppet Master +]--
		-- create_template("talent_tree_psy_pas_024_en", -- Puppet Master 16 {"loc_talent_psyker_coherency_size_increase"}, {"en"}, function(locale, value) return "Puppet Master" end),
	create_template("talent_tree_psy_pas_024_desc_en", {"loc_talent_psyker_coherency_size_increase_description"}, {"en"}, function(locale, value) return COLORS_Numbers.n_plus_rgb.."{radius_modifier:%s} Radius for your Coherency Aura."..TALENTS_Enh_desc.ED_PSY_Passive_24_rgb end), -- radius_modifier: 50% -- + -- colors

	--[+ Passive 25 - Warp Rider +]--
		-- create_template("talent_tree_psy_pas_025_en", {"loc_talent_psyker_damage_based_on_warp_charge"}, {"en"}, function(locale, value) return "Warp Rider" end),
	create_template("talent_tree_psy_pas_025_desc_en", {"loc_talent_psyker_damage_based_on_warp_charge_desc"}, {"en"}, function(locale, value) return "Up to {max_damage:%s} "..COLORS_KWords.Damage_rgb.." from all sources, based on your current "..COLORS_KWords.Peril_rgb.."."..TALENTS_Enh_desc.ED_PSY_Passive_25_rgb end), -- max_damage: +20% -- colors

	--[+ Passive 26 - Crystalline Will +]--
		-- create_template("talent_tree_psy_pas_027_en", {"loc_talent_psyker_alternative_peril_explosion"}, {"en"}, function(locale, value) return "Crystalline Will" end),
	create_template("talent_tree_psy_pas_027_desc_en", {"loc_talent_psyker_alternative_peril_explosion_desc"}, {"en"}, function(locale, value) return "Overloading through "..COLORS_KWords.Perils_rgb.." of the Warp no longer knocks you down, but you still take the appropriate "..COLORS_KWords.Corruptdmg_rgb.."."..TALENTS_Enh_desc.ED_PSY_Passive_26_rgb end), -- colors

	--[+ Passive 27 - Kinetic Deflection +]--
		-- create_template("talent_tree_psy_pas_027_en", {"loc_talent_psyker_block_costs_warp_charge"}, {"en"}, function(locale, value) return "Kinetic Deflection" end),
	create_template("talent_tree_psy_pas_027_desc_en", {"loc_talent_psyker_block_costs_warp_charge_desc"}, {"en"}, function(locale, value) return "While below 97% "..COLORS_KWords.Peril_rgb..", Blocking an attack causes you to gain "..COLORS_KWords.Peril_rgb.." instead of losing "..COLORS_KWords.Stamina_rgb..".\n\nGained "..COLORS_KWords.Peril_rgb.." is {warp_charge_block_cost:%s} of the blocked attacks "..COLORS_KWords.Stamina_rgb.." cost."..TALENTS_Enh_desc.ED_PSY_Passive_27_rgb end), -- warp_charge_block_cost: 25% -- colors

	--[+ Passive 28 - Tranquility Through Slaughter +]--
		-- create_template("talent_tree_psy_pas_028_en", {"loc_talent_psyker_ranged_crits_vent"}, {"en"}, function(locale, value) return "Tranquility Through Slaughter" end),
	-- create_template("talent_tree_psy_pas_028_desc_en", {"loc_talent_psyker_ranged_crits_vent_desc"}, {"en"}, function(locale, value) return "Non-Warp Ranged "..COLORS_KWords.Crit_hits_rgb.." Quell {percent:%s} "..COLORS_KWords.Peril_rgb.."."..TALENTS_Enh_desc.ED_PSY_Passive_28_rgb end), -- percent: 4% -- colors
	create_template("talent_tree_psy_pas_028_desc_en", {"loc_talent_psyker_ranged_crits_vent_desc"}, {"en"}, function(locale, value) return "{percent:%s} "..COLORS_KWords.Peril_rgb.." is Quells on Non-Warp Ranged "..COLORS_KWords.Crit_hits_rgb.."."..TALENTS_Enh_desc.ED_PSY_Passive_28_rgb end), -- percent: 4% -- colors

	--[+ Passive 29 - Empyric Resolve +]--
		-- create_template("talent_tree_psy_pas_029_en", {"loc_talent_psyker_warp_glass_cannon"}, {"en"}, function(locale, value) return "Empyric Resolve" end),
	create_template("talent_tree_psy_pas_029_desc_en", {"loc_talent_psyker_warp_glass_cannon_desc"}, {"en"}, function(locale, value) return "{peril_reduction:%s} "..COLORS_KWords.Peril_rgb.." Generation.\n{toughness_reduction:%s} "..COLORS_KWords.Toughness_rgb.." Replenished."..TALENTS_Enh_desc.ED_PSY_Passive_29_rgb end), -- peril_reduction: -40%,  toughness_reduction: -30% -- colors

	--[+ Passive 30 - Penetration of the Soul +]--
		-- create_template("talent_tree_psy_pas_030_en", {"loc_talent_psyker_warp_attacks_rending"}, {"en"} function(locale, value) return "Penetration of the Soul" end),
	create_template("talent_tree_psy_pas_030_desc_en", {"loc_talent_psyker_warp_attacks_rending_new_desc"}, {"en"}, function(locale, value) return "{rending:%s} "..COLORS_KWords.Rending_rgb.." on Warp-Attacks when above {threshold:%s} "..COLORS_KWords.Peril_rgb.."."..TALENTS_Enh_desc.ED_PSY_Passive_30_rgb end), --  rending: +10%, threshold: 75% -- colors

	--[+ Passive 31 - True Aim +]--
		-- create_template("talent_tree_psy_pas_031_en", {"loc_talent_psyker_weakspot_grants_crit"}, {"en"}, function(locale, value) return "True Aim" end),
	create_template("talent_tree_psy_pas_031_desc_en", {"loc_talent_psyker_weakspot_grants_crit_once_description"}, {"en"}, function(locale, value) return "Landing {weakspot_hits:%s} "..COLORS_KWords.Weakspothits_rgb.." grants your next Ranged Attack a guaranteed "..COLORS_KWords.Crit_rgb.."."..TALENTS_Enh_desc.ED_PSY_Passive_31_rgb end), -- weakspot_hits: 5 -- del "Can only trigger once per Attack." -- colors

	--[+ Passive 32 - Surety of Arms +]--
		-- create_template("talent_tree_psy_pas_032_en", {"loc_talent_psyker_reload_speed_warp"}, {"en"}, function(locale, value) return "Surety of Arms" end),
	create_template("talent_tree_psy_pas_032_desc_en", {"loc_talent_psyker_reload_speed_warp_desc"}, {"en"}, function(locale, value) return "{reload_speed:%s} Reload Speed while below {threshold:%s} "..COLORS_KWords.Peril_rgb..". On Reload, generate up to {warp_charge:%s} "..COLORS_KWords.Peril_rgb.." based on the Percentage of the Clip Restored."..TALENTS_Enh_desc.ED_PSY_Passive_32_rgb end), --  reload_speed: 25%, threshold: 75%, warp_charge: 25% -- colors

--[+ ++ZEALOT++ +]--
--[+ +BLITZ+ +]--
	--[+ Blitz 0 - Stun Grenade +]--
		-- create_template("talent_tree_zea_blitz0_000_en", {"loc_ability_shock_grenade"}, {"en"}, function(locale, value) return "Stun Grenade" end),
	create_template("talent_tree_zea_blitz0_000_desc_en", {"loc_ability_shock_grenade_description"}, {"en"}, function(locale, value) return "Throw a "..COLORS_Numbers.Stun_gren_rgb.." that "..COLORS_KWords.Electrocutes_rgb.." and "..COLORS_KWords.Stuns_rgb.." all Enemies within its blast radius."..TALENTS_Enh_desc.ED_ZEA_Blitz_0_rgb end), -- colors

	--[+ Blitz 1 - Stunstorm Grenade +]--
		-- create_template("talent_tree_zea_blitz1_000_en", -- Stunstorm Grenade {"loc_zealot_improved_stun_grenade"}, {"en"}, function(locale, value) return "Stunstorm Grenade" end),
	create_template("talent_tree_zea_blitz1_000_desc_en", {"loc_zealot_improved_stun_grenade_desc"}, {"en"}, function(locale, value) return "Throw a "..COLORS_Numbers.Stun_gren_rgb.." that explodes and applies a staggering "..COLORS_KWords.Electrocution_rgb.." effect to all enemies within its range.\n\nThis is an augmented version of {talent_name:%s} with {radius:%s} blast radius."..TALENTS_Enh_desc.ED_ZEA_Blitz_1_rgb end), -- talent_name: Stun Grenade, radius: +50% -- colors

	--[+ Blitz 2 - Immolation Grenade +]--
		-- create_template("talent_tree_zea_blitz2_000_en", {"loc_talent_ability_fire_grenade"}, {"en"}, function(locale, value) return "Immolation Grenade" end),
	create_template("talent_tree_zea_blitz2_000_desc_en", {"loc_talent_ability_fire_grenade_desc"}, {"en"}, function(locale, value) return "Throw a grenade that leaves a layer of flaming liquid, "..COLORS_KWords.Burning_rgb.." and "..COLORS_KWords.Staggering_rgb.." enemies, and barring their path. Most effective against Unarmoured Enemies."..TALENTS_Enh_desc.ED_ZEA_Blitz_2_rgb end), -- colors

	--[+ Blitz 3 - Blades of Faith +]--
		-- create_template("talent_tree_zea_blitz3_000_en", {"loc_ability_zealot_throwing_knifes"}, {"en"}, function(locale, value) return "Blades of Faith" end),
	create_template("talent_tree_zea_blitz3_000_desc_en", {"loc_ability_zealot_throwing_knifes_desc"}, {"en"}, function(locale, value) return "Throw a consecrated knife to deal High "..COLORS_KWords.Damage_rgb.." to a Single Enemy."..TALENTS_Enh_desc.ED_ZEA_Blitz_3_rgb end), -- colors Notice!

--[+ +AURA+ +]--
	--[+ Aura 0 - The Emperors's Will +]--
		-- create_template("talent_tree_zea_aura0_000_en", {"loc_talent_zealot_2_base_3"}, {"en"}, function(locale, value) return "The Emperors's Will" end),
	create_template("talent_tree_zea_aura0_000_desc_en", {"loc_talent_zealot_aura_toughness_damage_coherency_desc"}, {"en"}, function(locale, value) return "{damage_reduction:%s} "..COLORS_KWords.Toughness_dmg_red_rgb.." for you and Allies in Coherency."..TALENTS_Enh_desc.ED_ZEA_Aura_0_n_1_rgb end), -- damage_reduction: +7.5% - colors

	--[+ Aura 1 - Benediction +]--
		-- create_template("talent_tree_zea_aura_001_en", {"loc_talent_zealot_aura_efficiency"}, {"en"}, function(locale, value) return "Benediction" end),
	create_template("talent_tree_zea_aura_001_desc_en", {"loc_talent_zealot_toughness_aura_efficiency_desc"}, {"en"}, function(locale, value) return "{damage_reduction:%s} "..COLORS_KWords.Toughness_dmg_red_rgb.." for you and Allies in Coherency.\n\nThis is an augmented version of the base Aura - {talent_name:%s}."..TALENTS_Enh_desc.ED_ZEA_Aura_0_n_1_rgb end), -- damage_reduction: +15%. talent_name: The Emperor's Will -- colors

	--[+ Aura 2 - Beacon of Purity +]--
		-- create_template("talent_tree_zea_aura_002_en", {"loc_talent_zealot_corruption_healing_coherency_improved"}, {"en"}, function(locale, value) return "Beacon of Purity" end),
	create_template("talent_tree_zea_aura_002_desc_en", {"loc_talent_zealot_corruption_healing_coherency_improved_desc"}, {"en"}, function(locale, value) return "{corruption:%s} "..COLORS_KWords.Corruption_rgb.." heals from the current "..COLORS_KWords.Wound_rgb.." for you and Allies in Coherency every {interval:%s} second."..TALENTS_Enh_desc.ED_ZEA_Aura_2_rgb end), -- corruption: 1.5, interval: 1 -- s->second -- colors

	--[+ Aura 3 - Loner +]--
		-- create_template("talent_tree_zea_aura_003_en", {"loc_talent_zealot_always_in_coherency"}, {"en"}, function(locale, value) return "Loner" end),
	create_template("talent_tree_zea_aura_003_desc_en", {"loc_talent_zealot_always_in_coherency_description"}, {"en"}, function(locale, value) return "Makes Zealot count as being in Coherency with one Ally which enables the lowest rate of Coherency "..COLORS_KWords.Toughness_rgb.." Regeneration of "..COLORS_Numbers.n_3_75_rgb.." "..COLORS_KWords.Toughness_rgb.." per second."..TALENTS_Enh_desc.ED_ZEA_Aura_3_rgb end), -- coherency_min_stack:2.

--[+ +ABILITIES+ +]--
	--[+ Ability 0 - Chastise the Wicked +]--
		-- create_template("talent_tree_zea_abil0_000_en", {"loc_talent_zealot_2_combat"}, {"en"}, function(locale, value) return "Chastise the Wicked" end),
	create_template("talent_tree_zea_abil0_000_desc_en", {"loc_talent_zealot_2_combat_description_new"}, {"en"}, function(locale, value) return "Dash forward, Replenishing {toughness:%s} "..COLORS_KWords.Toughness_rgb..". Your next Melee Hit gains for "..COLORS_Numbers.n_3_rgb.." seconds {damage:%s} "..COLORS_KWords.Damage_rgb.." and is a guaranteed "..COLORS_KWords.Crit_hit_rgb..".\nBase Cooldown: {cooldown:%s} seconds."..TALENTS_Enh_desc.ED_ZEA_Ability_0_rgb end), -- toughness: 50%, damage: 25%, cooldown: 30 -- s->seconds -- colors

	--[+ Ability 1 - Fury of the Faithful +]--
		-- create_template("talent_tree_zea_abil1_000_en", {"loc_talent_maniac_attack_speed_after_dash"}, {"en"}, function(locale, value) return "Fury of the Faithful" end),
	create_template("talent_tree_zea_abil1_000_desc_en", {"loc_talent_zealot_attack_speed_after_dash_desc"}, {"en"}, function(locale, value) return "Dash forward, Replenishing {toughness:%s} "..COLORS_KWords.Toughness_rgb.." and gaining {attack_speed:%s} Attack Speed for {time:%s} seconds. Your next Melee Hit gains {damage:%s} "..COLORS_KWords.Damage_rgb.." and is a guaranteed "..COLORS_KWords.Crit_hit_rgb..".\nBase Cooldown: {cooldown:%s} seconds.\nThis is an augmented version of {talent_name:%s}."..TALENTS_Enh_desc.ED_ZEA_Ability_1_rgb end), -- toughness: 50%, attack_speed: +20%, time: 10, damage: +25%, cooldown: 30, talent_name: Chastise the Wicked -- &->and -- s->seconds -- colors

	--[+ Ability 1-1 - Redoubled Zeal +]--
		-- create_template("talent_tree_zea_abil1_001_en", {"loc_talent_zealot_dash_has_more_charges"}, {"en"}, function(locale, value) return "Redoubled Zeal" end),
	create_template("talent_tree_zea_abil1_001_desc_en", {"loc_talent_zealot_dash_has_more_charges_desc"}, {"en"}, function(locale, value) return "{talent_name:%s} now has {charges:%s} charges."..TALENTS_Enh_desc.ED_ZEA_Ability_1_1_rgb end), -- talent_name: Fury of the Faithful, charges: 2.

	--[+ Ability 1-2 - Invocation of Death +]--
		-- create_template("talent_tree_zea_abil1_002_en", {"loc_talent_maniac_cooldown_on_melee_crits"}, {"en"}, function(locale, value) return "Invocation of Death" end),
	create_template("talent_tree_zea_abil1_002_desc_en", {"loc_talent_maniac_cooldown_on_melee_crits_buff_desc"}, {"en"}, function(locale, value) return "{cooldown_regen:%s} "..COLORS_KWords.Ability_cd_rgb.." Regeneration for {duration:%s} seconds on Melee "..COLORS_KWords.Crit_hits_rgb.."."..TALENTS_Enh_desc.ED_ZEA_Ability_1_2_rgb end), -- cooldown_regen: +200%, duration: 4 -- s->seconds -- colors

	--[+ Ability 2 - Chorus of Spiritual Fortitude +]--
		-- create_template("talent_tree_zea_abil2_000_en", {"loc_talent_zealot_bolstering_prayer"}, {"en"}, function(locale, value) return "Chorus of Spiritual Fortitude" end),
	create_template("talent_tree_zea_abil2_000_desc_en", {"loc_talent_zealot_bolstering_prayer_variant_two_description"}, {"en"}, function(locale, value) return "Wield a Holy relic that releases pulses of energy "..COLORS_Numbers.n_7_rgb.." times every {interval:%s} seconds.\nEach pulse grants Zealot and Allies in Coherency immunity to "..COLORS_KWords.Stuns_rgb.." from both Melee and Ranged attacks and Invulnerability for "..COLORS_Numbers.n_1_5_rgb.." seconds.\nEach pulse Replenishes {toughness:%s} "..COLORS_KWords.Toughness_rgb.." to Allies in Coherency. If the Ally is at full "..COLORS_KWords.Toughness_rgb.." they instead gain {flat_toughness:%s} Max (yellow) "..COLORS_KWords.Toughness_rgb.." up to a total of {max_toughness:%s}.\nBase Cooldown: {cooldown:%s} seconds."..TALENTS_Enh_desc.ED_ZEA_Ability_2_rgb end), -- interval: 0.8, toughness: 45%, flat_toughness: +20, max_toughness: +100, cooldown: 60 -- s->seconds -- colors

	--[+ Ability 2-1 - Holy Cause +]--
		-- create_template("talent_tree_zea_abil2_001_en", {"loc_talent_zealot_zealot_channel_grants_defensive_buff"}, {"en"}, function(locale, value) return "Holy Cause" end),
	create_template("talent_tree_zea_abil2_001_desc_en", {"loc_talent_zealot_zealot_channel_grants_defensive_buff_desc"}, {"en"}, function(locale, value) return "After channeling {stacks:%s} pulses, grants {toughness:%s} "..COLORS_KWords.Toughness_dmg_red_rgb.." to you and Allies in Coherency. Lasts {duration:%s} seconds."..TALENTS_Enh_desc.ED_ZEA_Ability_2_1_rgb end), -- stacks: 5, toughness: +30%, duration: 10 -- s->seconds -- colors

	--[+ Ability 2-2 - Banishing Light +]--
		-- create_template("talent_tree_zea_abil2_002_en", {"loc_talent_zealot_channel_staggers"}, {"en"}, function(locale, value) return "Banishing Light" end),
	create_template("talent_tree_zea_abil2_002_desc_en", {"loc_talent_zealot_channel_staggers_desc"}, {"en"}, function(locale, value) return "Each pulse from {talent_name:%s} also "..COLORS_KWords.Staggers_rgb.." and Suppresses Enemies. Range increases with every pulse."..TALENTS_Enh_desc.ED_ZEA_Ability_2_2_rgb end), -- talent_name: Chorus of Spiritual Fortitude -- &->and -- colors

	--[+ Ability 2-3 - Ecclesiarch's Call +]--
		-- create_template("talent_tree_zea_abil2_003_en", {"loc_talent_zealot_zealot_channel_grants_offensive_buff"}, {"en"}, function(locale, value) return "Ecclesiarch's Call" end),
	create_template("talent_tree_zea_abil2_003_desc_en", {"loc_talent_zealot_zealot_channel_grants_offensive_buff_desc"}, {"en"}, function(locale, value) return "After channeling {stacks:%s} pulses, grants {damage:%s} "..COLORS_KWords.Damage_rgb.." to you and Allies in Coherency. Lasts {duration:%s} seconds."..TALENTS_Enh_desc.ED_ZEA_Ability_2_3_rgb end), -- stacks: 5, damage: +20%, duration: 10 -- s->seconds -- colors

	--[+ Ability 2-4 - Martyr's Purpose +]--
		-- create_template("talent_tree_zea_abil2_004_en", --  {"loc_talent_zealot_damage_taken_restores_cd"}, {"en"}, function(locale, value) return "Martyr's Purpose" end),
	create_template("talent_tree_zea_abil2_004_desc_en", {"loc_talent_zealot_damage_taken_restores_cd_description"}, {"en"}, function(locale, value) return "{cooldown_restore:%s} of "..COLORS_KWords.Health_rgb.." "..COLORS_KWords.Damage_rgb.." taken is converted to "..COLORS_KWords.Ability_cd_rgb.." Reduction."..TALENTS_Enh_desc.ED_ZEA_Ability_2_4_rgb end), -- stacks:5 damage:+20%. duration:10. -- s->seconds -- colors {stacks:%s}

	--[+ Ability 3 - Shroudfield +]--
		-- create_template("talent_tree_zea_abil3_000_en", {"loc_ability_zealot_stealth"}, {"en"}, function(locale, value) return "Shroudfield" end),
	create_template("talent_tree_zea_abil3_000_desc_en", {"loc_ability_zealot_stealth_description"}, {"en"}, function(locale, value) return "You enter "..COLORS_KWords.Stealth_rgb.." for {duration:%s} seconds and gain {movement_speed:%s} Movement Speed.\nYour next Melee Attack gain:\n{backstab_damage:%s} Backstab "..COLORS_KWords.Damage_rgb..",\n{finesse_damage:%s} "..COLORS_KWords.Finesse_dmg_rgb.." and\n{crit_chance:%s} "..COLORS_KWords.Crit_chance_rgb..".\nBase Cooldown: {cooldown:%s} seconds."..TALENTS_Enh_desc.ED_ZEA_Ability_3_rgb end), -- duration: 3, movement_speed: +20%, backstab_damage: +100%, finesse_damage: +100%, crit_chance: +100%, cooldown: 30 -- s->seconds -- &->and -- colors

	--[+ Ability 3-1 - Master-Crafted Shroudfield +]--
		-- create_template("talent_tree_zea_abil3_001_en", {"loc_talent_zealot_increased_stealth_duration"}, {"en"}, function(locale, value) return "Master-Crafted Shroudfield" end),
	create_template("talent_tree_zea_abil3_001_desc_en", {"loc_talent_zealot_increased_stealth_duration_description"}, {"en"}, function(locale, value) return COLORS_KWords.Stealth_rgb.." Duration is increased from "..COLORS_Numbers.n_3_rgb.." to {duration_2:%s} seconds." end), -- duration_2: 5 -- s->seconds -- colors

	--[+ Ability 3-2 - Perfectionist +]--
		-- create_template("talent_tree_zea_abil3_002_en", {"loc_talent_zealot_stealth_increased_damage"}, {"en"}, function(locale, value) return "Perfectionist" end),
	create_template("talent_tree_zea_abil3_002_desc_en", {"loc_talent_zealot_stealth_increased_damage_description"}, {"en"}, function(locale, value) return "{talent_name:%s} grants an additional:\n{damage_2:%s} Backstab "..COLORS_KWords.Damage_rgb.." and\n{damage:%s} "..COLORS_KWords.Finesse_dmg_rgb..", but increases "..COLORS_KWords.Ability_cd_rgb.." by {cooldown:%s}."..TALENTS_Enh_desc.ED_ZEA_Ability_3_2_rgb end), -- talent_name: Shroudfield, damage: +50%, damage_2: +50%, cooldown: 25% -- &->and -- colors

	--[+ Ability 3-3 - Invigorating Revelation +]--
		-- create_template("talent_tree_zea_abil3_003_en", {"loc_talent_zealot_leaving_stealth_restores_toughness"}, {"en"}, function(locale, value) return "Invigorating Revelation" end),
	create_template("talent_tree_zea_abil3_003_desc_en", {"loc_talent_zealot_leaving_stealth_restores_toughness_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." replenishes over {time:%s} seconds on leaving "..COLORS_KWords.Stealth_rgb..". Also gain {damage:%s} "..COLORS_KWords.Damage_rgb.." Reduction for {time:%s} seconds."..TALENTS_Enh_desc.ED_ZEA_Ability_3_3_rgb end), -- toughness: 40%, time: 5, damage: +20%, time: 5 -- s->seconds -- colors

	--[+ Ability 3-4 - Pious Cut-Throat +]--
		-- create_template("talent_tree_zea_abil3_004_en", {"loc_talent_zealot_backstab_kills_restore_cd"}, {"en"}, function(locale, value) return "Pious Cut-Throat" end),
	create_template("talent_tree_zea_abil3_004_desc_en", {"loc_talent_zealot_backstab_kills_restore_cd_description"}, {"en"}, function(locale, value) return COLORS_Numbers.n_minus_rgb.."{ability_cooldown:%s} "..COLORS_KWords.Ability_cd_rgb.." on Backstab kills."..TALENTS_Enh_desc.ED_ZEA_Ability_3_4_rgb end), -- ability_cooldown: 20% -- colors

--[+ +KEYSTONES+ +]--
	--[+ Keystone 1 - Blazing Piety +]--
		-- create_template("talent_tree_zea_keys1_000_en", {"loc_talent_zealot_fanatic_rage"}, {"en"}, function(locale, value) return "Blazing Piety" end),
	create_template("talent_tree_zea_keys1_000_desc_en", {"loc_talent_zealot_fanatic_rage_desc"}, {"en"}, function(locale, value) return "When {max_stacks:%s} Enemies have died within {radius:%s} meters of you, you enter "..COLORS_KWords.Fury_rgb.." and get {crit_chance:%s} "..COLORS_KWords.Crit_hit_chance_rgb.." for {duration:%s} seconds."..TALENTS_Enh_desc.ED_ZEA_Keystone_1_rgb end), -- crit_chance: +15%, duration: 8, max_stacks: 25, radius: 25 -- rewrite -- m->meters -- s->seconds -- colors

	--[+ Keystone 1-1 - Stalwart +]--
		-- create_template("talent_tree_zea_keys1_001_en", {"loc_talent_zealot_fanatic_rage_toughness"}, {"en"}, function(locale, value) return "Stalwart" end),
	create_template("talent_tree_zea_keys1_001_desc_en", {"loc_talent_zealot_fanatic_rage_toughness_reduction_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." is restored by triggering "..COLORS_KWords.Fury_rgb..". In addition, while "..COLORS_KWords.Fury_rgb.." is Active, you have {toughness_damage_reduction:%s} "..COLORS_KWords.Toughness_dmg_red_rgb.."."..TALENTS_Enh_desc.ED_ZEA_Keystone_1_1_rgb end), -- toughness: 50%, toughness_damage_reduction: +25% -- colors

	--[+ Keystone 1-2 - Fury Rising +]--
		-- create_template("talent_tree_zea_keys1_002_en", {"loc_talent_zealot_fanatic_rage_crits"}, {"en"}, function(locale, value) return "Fury Rising" end),
	create_template("talent_tree_zea_keys1_002_desc_en", {"loc_talent_zealot_fanatic_rage_crits_desc"}, {"en"}, function(locale, value) return "You gain one Stack of "..COLORS_KWords.Fury_rgb.." per Melee or Ranged "..COLORS_KWords.Crit_hit_rgb.."."..TALENTS_Enh_desc.ED_ZEA_Keystone_1_2_rgb end), -- colors

	--[+ Keystone 1-3 - Infectious Zeal +]--
		-- create_template("talent_tree_zea_keys1_003_en", {"loc_talent_zealot_shared_fanatic_rage"}, {"en"}, function(locale, value) return "Infectious Zeal" end),
	create_template("talent_tree_zea_keys1_003_desc_en", {"loc_talent_zealot_shared_fanatic_rage_desc"}, {"en"}, function(locale, value) return ""..COLORS_Numbers.pc_10_rgb.." "..COLORS_KWords.Crit_chance_rgb.." is spread to Allies in Coherency when you reach "..COLORS_Numbers.n_25_rgb.." Stacks of "..COLORS_KWords.Fury_rgb..". "..TALENTS_Enh_desc.ED_ZEA_Keystone_1_3_rgb end), -- crit_chance: +66%, talent_name: Blazing Piety -- colors {crit_chance:%s}

	--[+ Keystone 1-4 - Righteous Warrior +]--
		-- create_template("talent_tree_zea_keys1_004_en", {"loc_talent_zealot_fanatic_rage_improved"}, {"en"}, function(locale, value) return "Righteous Warrior" end),
	create_template("talent_tree_zea_keys1_004_desc_en", {"loc_talent_zealot_fanatic_rage_improved_desc"}, {"en"}, function(locale, value) return "{crit_chance:%s} "..COLORS_KWords.Crit_hit_chance_rgb.." from {talent_name:%s}."..TALENTS_Enh_desc.ED_ZEA_Keystone_1_4_rgb end), -- crit_chance: +10%, talent_name: Blazing Piety -- colors

	--[+ Keystone 2 - Martyrdom +]--
		-- create_template("talent_tree_zea_keys2_000_en", -- Martyrdom {"loc_talent_zealot_martyrdom"}, {"en"}, function(locale, value) return "Martyrdom" end),
	create_template("talent_tree_zea_keys2_000_desc_en", {"loc_talent_zealot_martyrdom_desc"}, {"en"}, function(locale, value) return "{damage:%s} Melee "..COLORS_KWords.Damage_rgb.." for each missing "..COLORS_KWords.Wound_rgb..", up to a Maximum {max_wounds:%s} missing "..COLORS_KWords.Wounds_rgb.."."..TALENTS_Enh_desc.ED_ZEA_Keystone_2_rgb end), -- damage: +8%, max_wounds: 7 -- colors

	--[+ Keystone 2-1 - I Shall Not Fall +]--
		-- create_template("talent_tree_zea_keys2_001_en", {"loc_talent_zealot_martyrdom_grants_toughness"}, {"en"}, function(locale, value) return "I Shall Not Fall" end),
	create_template("talent_tree_zea_keys2_001_desc_en", {"loc_talent_zealot_martyrdom_grants_toughness_desc"}, {"en"}, function(locale, value) return "{toughness_damage_reduction:%s} "..COLORS_KWords.Toughness_dmg_red_rgb.." is granted by {talent_name:%s} for each missing "..COLORS_KWords.Wound_rgb.."."..TALENTS_Enh_desc.ED_ZEA_Keystone_2_1_rgb end), -- talent_name: Martyrdom, toughness_damage_reduction: +6.5% -- colors

	--[+ Keystone 2-2 - Maniac +]--
		-- create_template("talent_tree_zea_keys2_002_en", {"loc_talent_zealot_attack_speed_per_martyrdom"}, {"en"}, function(locale, value) return "Maniac" end),
	create_template("talent_tree_zea_keys2_002_desc_en", {"loc_talent_zealot_attack_speed_per_martyrdom_desc"}, {"en"}, function(locale, value) return "{attack_speed:%s} Attack Speed is granted by {talent_name:%s} for each missing "..COLORS_KWords.Wound_rgb.."."..TALENTS_Enh_desc.ED_ZEA_Keystone_2_2_rgb end), -- talent_name: Martyrdom, attack_speed: +4% -- colors

	--[+ Keystone 3 - Inexorable Judgement +]--
		-- create_template("talent_tree_zea_keys3_000_en", {"loc_talent_zealot_quickness"}, {"en"}, function(locale, value) return "Inexorable Judgement" end),
	create_template("talent_tree_zea_keys3_000_desc_en", {"loc_talent_zealot_quickness_desc"}, {"en"}, function(locale, value) return "Moving grants you "..COLORS_KWords.Momentum_rgb..". Stacks {max_stacks:%s} times.\nWhen you Hit an Enemy, spend all "..COLORS_KWords.Momentum_rgb.." and gain per Stack for {duration:%s} seconds:\n{damage_modifier:%s} "..COLORS_KWords.Damage_rgb..",\n{melee_attack_speed:%s} Melee Attack Speed,\n{ranged_attack_speed:%s} Ranged Attack Speed."..TALENTS_Enh_desc.ED_ZEA_Keystone_3_rgb end), -- max_stacks: 15, melee_attack_speed: +1%, ranged_attack_speed: +1%, damage_modifier: +1%, duration: 6 -- rewrite colors Notice!

	--[+ Keystone 3-1 - Retributor's Stance +]--
		-- create_template("talent_tree_zea_keys3_001_en", {"loc_talent_zealot_quickness_toughness_per_stack"}, {"en"}, function(locale, value) return "Retributor's Stance" end),
	create_template("talent_tree_zea_keys3_001_desc_en", {"loc_talent_zealot_quickness_toughness_per_stack_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." is replenished for each spent Stack of "..COLORS_KWords.Momentum_rgb.."."..TALENTS_Enh_desc.ED_ZEA_Keystone_3_1_rgb end), -- toughness: 2% -- colors

	--[+ Keystone 3-2 - Inebriate's Poise +]--
		-- create_template("talent_tree_zea_keys3_002_en", {"loc_talent_zealot_quickness_dodge_stacks"}, {"en"}, function(locale, value) return "Inebriate's Poise" end),
	create_template("talent_tree_zea_keys3_002_desc_en", {"loc_talent_zealot_quickness_dodge_stacks_desc"}, {"en"}, function(locale, value) return "Gain {stacks:%s} Stacks of "..COLORS_KWords.Momentum_rgb.." on a successful Dodge."..TALENTS_Enh_desc.ED_ZEA_Keystone_3_2_rgb end), -- stacks: 3 -- colors

--[+ +PASSIVES+ +]--
	--[+ Passive 1 - Disdain +]--
		-- create_template("talent_tree_zea_pas_001_en", {"loc_talent_zealot_3_tier_2_ability_1"}, {"en"}, function(locale, value) return "Disdain" end),
	create_template("talent_tree_zea_pas_001_desc_en", {"loc_talent_zealot_3_tier_2_ability_1_description"}, {"en"}, function(locale, value) return "{damage:%s} "..COLORS_KWords.Damage_rgb.." for every Second Melee Attack you make for each enemy Hit by your previous Melee Attack. Stacks {max_stacks:%s} times."..TALENTS_Enh_desc.ED_ZEA_Passive_1_rgb end), -- damage: +5%, max_stacks: 5 -- rewrite -- colors

	--[+ Passive 2 - Backstabber +]--
		-- create_template("talent_tree_zea_pas_002_en", {"loc_talent_zealot_increased_backstab_damage"}, {"en"}, function(locale, value) return "Backstabber" end),
	create_template("talent_tree_zea_pas_002_desc_en", {"loc_talent_zealot_increased_backstab_damage_description"}, {"en"}, function(locale, value) return "{damage:%s} "..COLORS_KWords.Damage_rgb.." on Melee Backstab Hits."..TALENTS_Enh_desc.ED_ZEA_Passive_2_rgb end), -- damage: +20% -- colors

	--[+ Passive 3 - Anoint in Blood +]--
		-- create_template("talent_tree_zea_pas_003_en", {"loc_talent_zealot_ranged_damage_increased_to_close"}, {"en"}, function(locale, value) return "Anoint in Blood" end),
	create_template("talent_tree_zea_pas_003_desc_en", {"loc_talent_zealot_ranged_damage_increased_to_close_desc"}, {"en"}, function(locale, value) return "Up to {damage:%s} Base Ranged "..COLORS_KWords.Damage_rgb..", reduced the further you are from the target."..TALENTS_Enh_desc.ED_ZEA_Passive_3_rgb end), -- damage: +25% -- colors

	--[+ Passive 4 - Scourge +]--
		-- create_template("talent_tree_zea_pas_004_en", {"loc_talent_zealot_bleed_melee_crit_chance"}, {"en"}, function(locale, value) return "Scourge" end),
	create_template("talent_tree_zea_pas_004_desc_en", {"loc_talent_zealot_bleed_melee_crit_chance_desc"}, {"en"}, function(locale, value) return "Melee "..COLORS_KWords.Crit_hits_rgb.." apply "..COLORS_KWords.Bleed_rgb..", causing "..COLORS_KWords.Damage_rgb.." over time.\nMelee Hits on "..COLORS_KWords.Bleeding_rgb.." Enemies grant {crit_chance:%s} "..COLORS_KWords.Crit_chance_rgb.." for {duration:%s} seconds. Stacks {max_stacks:%s} times. Up to "..COLORS_Numbers.n_16_rgb.." Max Bleed Stacks on a target."..TALENTS_Enh_desc.ED_ZEA_Passive_4_rgb end), -- crit_chance: +10%, duration: 3, max_stacks: 3 -- s->seconds -- colors

	--[+ Passive 5 - Enemies Within, Enemies Without +]--
		-- create_template("talent_tree_zea_pas_005_en", {"loc_talent_zealot_toughness_regen_in_melee"}, {"en"}, function(locale, value) return "Enemies Within, Enemies Without" end),
	create_template("talent_tree_zea_pas_005_desc_en", {"loc_talent_zealot_toughness_regen_in_melee_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." replenishment per second while within {range:%s} meters of at least {num_enemies:%s} enemies."..TALENTS_Enh_desc.ED_ZEA_Passive_5_rgb end), -- toughness: 2.5%, range: 5, num_enemies: 3 - colors

	--[+ Passive 6 - Fortitude in Fellowship +]--
		-- create_template("talent_tree_zea_pas_006_en", {"loc_talent_zealot_increased_coherency_regen"}, {"en"}, function(locale, value) return "Fortitude in Fellowship" end),
	create_template("talent_tree_zea_pas_006_desc_en", {"loc_talent_zealot_increased_coherency_regen_desc"}, {"en"}, function(locale, value) return "{toughness:%s} Coherency "..COLORS_KWords.Toughness_rgb.." Regeneration."..TALENTS_Enh_desc.ED_ZEA_Passive_6_rgb end), -- toughness: +50% -- colors

	--[+ Passive 7 - Purge the Unclean +]--
		-- create_template("talent_tree_zea_pas_007_en", {"loc_talent_zealot_3_passive_2"}, {"en"}, function(locale, value) return "Purge the Unclean" end),
	create_template("talent_tree_zea_pas_007_desc_en", {"loc_talent_zealot_3_passive_2_description"}, {"en"}, function(locale, value) return "{damage:%s} Increased "..COLORS_KWords.Damage_rgb.." against Infested and Unyielding Enemies."..TALENTS_Enh_desc.ED_ZEA_Passive_7_rgb end), -- damage: +20% -- &->and -- colors

	--[+ Passive 8 - Blood Redemption +]--
		-- create_template("talent_tree_zea_pas_008_en", {"loc_talent_zealot_toughness_on_melee_kill"}, {"en"}, function(locale, value) return "Blood Redemption" end),
	create_template("talent_tree_zea_pas_008_desc_en", {"loc_talent_zealot_toughness_on_melee_kill_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." Replenishment on Melee Kill."..TALENTS_Enh_desc.ED_ZEA_Passive_8_rgb end), -- toughness:+50%. -- colors

	--[+ Passive 9 - Bleed for the Emperor +]--
		-- create_template("talent_tree_zea_pas_009_en", {"loc_talent_zealot_3_tier_3_ability_2"}, {"en"}, function(locale, value) return "Bleed for the Emperor" end),
	create_template("talent_tree_zea_pas_009_desc_en", {"loc_talent_zealot_3_tier_3_ability_2_description"}, {"en"}, function(locale, value) return COLORS_KWords.Damage_rgb.." that would take your "..COLORS_KWords.Health_rgb.." to the next "..COLORS_KWords.Wound_rgb.." is reduced by {damage_reduction:%s}."..TALENTS_Enh_desc.ED_ZEA_Passive_9_rgb end), -- damage_reduction: 40% -- colors

	--[+ Passive 10 - Vicious Offering +]--
		-- create_template("talent_tree_zea_pas_010_en", {"loc_talent_zealot_toughness_on_heavy_kills"}, {"en"}, function(locale, value) return "Vicious Offering" end),
	create_template("talent_tree_zea_pas_010_desc_en", {"loc_talent_zealot_toughness_on_heavy_kills_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." replenishment on Heavy Attack Kill."..TALENTS_Enh_desc.ED_ZEA_Passive_10_rgb end), -- toughness: 7.5% -- colors

	--[+ Passive 11 - The Voice of Terra +]--
		-- create_template("talent_tree_zea_pas_011_en", {"loc_talent_zealot_toughness_on_ranged_kill"}, {"en"}, function(locale, value) return "The Voice of Terra" end),
	create_template("talent_tree_zea_pas_011_desc_en", {"loc_talent_zealot_toughness_on_ranged_kill_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." replenishment on Ranged Kill."..TALENTS_Enh_desc.ED_ZEA_Passive_11_rgb end), -- toughness: 2.5% -- colors

	--[+ Passive 12 - Restoring Faith +]--
		-- create_template("talent_tree_zea_pas_012_en", {"loc_talent_zealot_heal_damage_taken"}, {"en"}, function(locale, value) return "Restoring Faith" end),
	create_template("talent_tree_zea_pas_012_desc_en", {"loc_talent_zealot_heal_damage_taken_desc"}, {"en"}, function(locale, value) return "On taking "..COLORS_KWords.Damage_rgb..", heal {damage_reduction:%s} of that "..COLORS_KWords.Damage_rgb..". Occurs over {time:%s} seconds."..TALENTS_Enh_desc.ED_ZEA_Passive_12_rgb end), -- damage_reduction: 25%, time: 5 -- s->seconds -- colors

	--[+ Passive 13 - Second Wind +]--
		-- create_template("talent_tree_zea_pas_013_en",   {"loc_talent_zealot_toughness_on_dodge"}, {"en"}, function(locale, value) return "Second Wind" end),
	create_template("talent_tree_zea_pas_013_desc_en", {"loc_talent_zealot_toughness_on_dodge_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." replenishment on a Successful Dodge."..TALENTS_Enh_desc.ED_ZEA_Passive_13_rgb end), -- toughness: 15% -- colors

	--[+ Passive 14 - Enduring Faith +]--
		-- create_template("talent_tree_zea_pas_014_en",   {"loc_talent_zealot_toughness_melee_effectiveness"}, {"en"}, function(locale, value) return "Enduring Faith" end),
	create_template("talent_tree_zea_pas_014_desc_en", {"loc_talent_zealot_toughness_melee_effectiveness_desc"}, {"en"}, function(locale, value) return "{toughness_damage_reduction:%s} "..COLORS_KWords.Toughness_dmg_red_rgb.." on "..COLORS_KWords.Crit_hit_rgb.." for {time:%s} seconds."..TALENTS_Enh_desc.ED_ZEA_Passive_14_rgb end), -- toughness_damage_reduction: +50%, time: 4 -- s->seconds -- colors

	--[+ Passive 15 - The Emperor's Bullet +]--
		-- create_template("talent_tree_zea_pas_015_en", {"loc_talent_zealot_improved_melee_after_no_ammo"}, {"en"}, function(locale, value) return "The Emperor's Bullet" end),
	create_template("talent_tree_zea_pas_015_desc_en", {"loc_talent_zealot_improved_melee_after_no_ammo_desc"}, {"en"}, function(locale, value) return "{impact:%s} "..COLORS_KWords.Impact_rgb.." strength and {attack_speed:%s} Attack speed for Melee attacks for {duration:%s} seconds after emptying your Ranged weapon."..TALENTS_Enh_desc.ED_ZEA_Passive_15_rgb end), -- impact: +30%, attack_speed: +10%, duration: 5 -- s->seconds -- &->and -- colors 

	--[+ Passive 16 - Dance of Death +]--
		-- create_template("talent_tree_zea_pas_016_en",   {"loc_talent_zealot_improved_spread_post_dodge"}, {"en"}, function(locale, value) return "Dance of Death" end),
	create_template("talent_tree_zea_pas_016_desc_en", {"loc_talent_zealot_improved_spread_post_dodge_desc"}, {"en"}, function(locale, value) return "{spread:%s} Spread and {recoil:%s} Recoil for {duration:%s} seconds on successful Dodge."..TALENTS_Enh_desc.ED_ZEA_Passive_16_rgb end), -- spread: -75%, recoil: -50%, duration: 3 -- s->seconds -- colors 

	--[+ Passive 17 - Duellist +]--
		-- create_template("talent_tree_zea_pas_017_en",   {"loc_talent_zealot_increased_finesse_post_dodge"}, {"en"}, function(locale, value) return "Duellist" end),
	create_template("talent_tree_zea_pas_017_desc_en", {"loc_talent_zealot_increased_finesse_post_dodge_description"}, {"en"}, function(locale, value) return "{damage:%s} "..COLORS_KWords.Weakspot_rgb.." and "..COLORS_KWords.Crit_hit_rgb.." "..COLORS_KWords.Damage_rgb.." for {duration:%s} seconds on successful Dodge."..TALENTS_Enh_desc.ED_ZEA_Passive_17_rgb end), -- damage: +50%, duration: 3 -- s->seconds -- colors

	--[+ Passive 18 - Until Death +]--
		-- create_template("talent_tree_zea_pas_018_en",  {"loc_talent_zealot_resist_death"}, {"en"}, function(locale, value) return "Until Death" end),
	create_template("talent_tree_zea_pas_018_desc_en", {"loc_talent_zealot_resist_death_desc"}, {"en"}, function(locale, value) return "Fatal "..COLORS_KWords.Damage_rgb.." instead grants you Invulnerability for {active_duration:%s} seconds. Occurs every {cooldown_duration:%s} seconds."..TALENTS_Enh_desc.ED_ZEA_Passive_18_rgb end), -- active_duration: 5, cooldown_duration: 120 -- s->seconds -- colors

	--[+ Passive 19 - Unremitting +]--
		-- create_template("talent_tree_zea_pas_019_en",   {"loc_talent_zealot_reduced_sprint_cost"}, {"en"}, function(locale, value) return "Unremitting" end),
	create_template("talent_tree_zea_pas_019_desc_en", {"loc_talent_zealot_reduced_sprint_cost_description"}, {"en"}, function(locale, value) return "{cost:%s} Sprint "..COLORS_KWords.Stamina_rgb.." cost."..TALENTS_Enh_desc.ED_ZEA_Passive_19_rgb end), -- cost: -20%

	--[+ Passive 20 - Shield of Contempt +]--
		-- create_template("talent_tree_zea_pas_020_en", {"loc_talent_zealot_3_tier_4_ability_3"}, {"en"}, function(locale, value) return "Shield of Contempt" end),
	create_template("talent_tree_zea_pas_020_desc_en", {"loc_talent_zealot_3_tier_4_ability_3_description"}, {"en"}, function(locale, value) return "{damage_reduction:%s} "..COLORS_KWords.Damage_rgb.." Reduction for {duration:%s} seconds when you or an ally in Coherency takes "..COLORS_KWords.Damage_rgb..". Triggers every {cooldown:%s} seconds."..TALENTS_Enh_desc.ED_ZEA_Passive_20_rgb end), -- damage_reduction: +60%, duration: 4, cooldown: 10 -- rewrite -- s->seconds -- colors

	--[+ Passive 21 - Thy Wrath be Swift +]--
		-- create_template("talent_tree_zea_pas_021_en",  {"loc_talent_zealot_movement_speed_on_damaged"}, {"en"}, function(locale, value) return "Thy Wrath be Swift" end),
	create_template("talent_tree_zea_pas_021_desc_en", {"loc_talent_zealot_movement_speed_on_damaged_desc"}, {"en"}, function(locale, value) return "{movement_speed:%s} Movement Speed for {time:%s} seconds on taking "..COLORS_KWords.Damage_rgb..". Enemy Melee Attacks cannot "..COLORS_KWords.Stun_rgb.." you."..TALENTS_Enh_desc.ED_ZEA_Passive_21_rgb end), -- movement_speed: +15%, time: 2 -- s->seconds -- colors

	--[+ Passive 22 - Good Balance +]--
		-- create_template("talent_tree_zea_pas_022_en",  {"loc_talent_reduced_damage_after_dodge"}, {"en"}, function(locale, value) return "Good Balance" end),
	create_template("talent_tree_zea_pas_022_desc_en", {"loc_talent_reduced_damage_after_dodge_description"}, {"en"}, function(locale, value) return "{damage:%s} "..COLORS_KWords.Damage_rgb.." Reduction for {duration:%s} seconds after a successful Dodge."..TALENTS_Enh_desc.ED_ZEA_Passive_22_rgb end), -- damage: +25%, duration: 2.5 -- s->seconds -- colors

	--[+ Passive 23 - Desperation +]--
		-- create_template("talent_tree_zea_pas_023_en", {"loc_talent_zealot_increased_damage_on_low_stamina"}, {"en"}, function(locale, value) return "Desperation" end),
	create_template("talent_tree_zea_pas_023_desc_en", {"loc_talent_zealot_increased_damage_on_low_stamina_description"}, {"en"}, function(locale, value) return "{damage:%s} Melee "..COLORS_KWords.Damage_rgb.." for {duration:%s} seconds when "..COLORS_KWords.Stamina_rgb.." is depleted."..TALENTS_Enh_desc.ED_ZEA_Passive_23_rgb end), -- damage: +20%, duration: 5 -- s->seconds -- colors

	--[+ Passive 24 - Holy Revenant +]--
		-- create_template("talent_tree_zea_pas_024_en", {"loc_talent_zealot_heal_during_resist_death"}, {"en"}, function(locale, value) return "Holy Revenant" end),
	create_template("talent_tree_zea_pas_024_desc_en", {"loc_talent_zealot_heal_during_resist_death_clamped_desc"}, {"en"}, function(locale, value) return "When {talent_name:%s} ends, you regain "..COLORS_KWords.Health_rgb.." based on the "..COLORS_KWords.Damage_rgb.." you dealt during {talent_name:%s}, to a Maximum of {max_health:%s} Max "..COLORS_KWords.Health_rgb..". Melee "..COLORS_KWords.Damage_rgb.." dealt Heals for {melee_multiplier:%s} times that amount."..TALENTS_Enh_desc.ED_ZEA_Passive_24_rgb end), -- talent_name: Until Death, max_health: 25%, melee_multiplier: 3 -- colors

	--[+ Passive 25 - Sainted Gunslinger +]--
		-- create_template("talent_tree_zea_pas_025_en", {"loc_talent_zealot_increased_reload_speed_on_melee_kills"}, {"en"}, function(locale, value) return "Sainted Gunslinger" end),
	create_template("talent_tree_zea_pas_025_desc_en", {"loc_talent_zealot_increased_reload_speed_on_melee_kills_desc"}, {"en"}, function(locale, value) return "{reload_speed:%s} Reload Speed on Melee Kill. Stacks {max_stacks:%s} times."..TALENTS_Enh_desc.ED_ZEA_Passive_25_rgb end), -- reload_speed: +3%, max_stacks: 10

	--[+ Passive 26 - Hammer of Faith +]--
		-- create_template("talent_tree_zea_pas_026_en", {"loc_talent_zealot_3_tier_1_ability_1"}, {"en"}, function(locale, value) return "Hammer of Faith" end),
	create_template("talent_tree_zea_pas_026_desc_en", {"loc_talent_zealot_3_tier_1_ability_1_description"}, {"en"}, function(locale, value) return "{stagger:%s} "..COLORS_KWords.Impact_rgb.." strength."..TALENTS_Enh_desc.ED_ZEA_Passive_26_rgb end), -- stagger: +30% -- colors

	--[+ Passive 27 - Grievous Wounds +]--
		-- create_template("talent_tree_zea_pas_027_en", {"loc_talent_zealot_increased_stagger_on_weakspot_melee"}, {"en"}, function(locale, value) return "Grievous Wounds" end),
	create_template("talent_tree_zea_pas_027_desc_en", {"loc_talent_zealot_increased_stagger_on_weakspot_melee_description"}, {"en"}, function(locale, value) return "{impact_modifier:%s} "..COLORS_KWords.Stagger_rgb.." on Melee "..COLORS_KWords.Weakspothits_rgb.."."..TALENTS_Enh_desc.ED_ZEA_Passive_27_rgb end), -- impact_modifier: +50% -- colors

	--[+ Passive 28 - Ambuscade +]--
		-- create_template("talent_tree_zea_pas_028_en", {"loc_talent_zealot_increased_flanking_damage"}, {"en"}, function(locale, value) return "Ambuscade" end),
	create_template("talent_tree_zea_pas_028_desc_en", {"loc_talent_zealot_increased_flanking_damage_description"}, {"en"}, function(locale, value) return "{damage:%s} "..COLORS_KWords.Damage_rgb.." to Ranged Backstab Attacks."..TALENTS_Enh_desc.ED_ZEA_Passive_28_rgb end), -- damage:+20%. -- colors

	--[+ Passive 29 - Punishment +]--
		-- create_template("talent_tree_zea_pas_029_en", {"loc_talent_zealot_multi_hits_increase_impact"}, {"en"}, function(locale, value) return "Punishment" end),
	create_template("talent_tree_zea_pas_029_desc_en", {"loc_talent_zealot_multi_hits_increase_impact_desc"}, {"en"}, function(locale, value) return "Melee Attacks that Hit at least {min_hits:%s} Enemies grant {impact_modifier:%s} "..COLORS_KWords.Impact_rgb.." strength for {time:%s} seconds. Stacks {max_stacks:%s} times. At max Stacks gain Uninterruptible."..TALENTS_Enh_desc.ED_ZEA_Passive_29_rgb end), -- min_hits: 3, impact_modifier: +30%, time: 5, max_stacks: 5 -- s->seconds -- colors

	--[+ Passive 30 - Faithful Frenzy +]--
		-- create_template("talent_tree_zea_pas_030_en", {"loc_talent_zealot_attack_speed"}, {"en"}, function(locale, value) return "Faithful Frenzy" end),
	create_template("talent_tree_zea_pas_030_desc_en", {"loc_talent_zealot_attack_speed_desc"}, {"en"}, function(locale, value) return "{attack_speed:%s} Melee Attack Speed."..TALENTS_Enh_desc.ED_ZEA_Passive_30_rgb end), -- attack_speed: +10%

	--[+ Passive 31 - Sustained Assault +]--
		-- create_template("talent_tree_zea_pas_031_en", {"loc_talent_zealot_increased_damage_stacks_on_hit"}, {"en"}, function(locale, value) return "Sustained Assault" end),
	create_template("talent_tree_zea_pas_031_desc_en", {"loc_talent_zealot_increased_damage_stacks_on_hit_desc"}, {"en"}, function(locale, value) return "{damage:%s} Melee "..COLORS_KWords.Damage_rgb.." for {time:%s} seconds on Hitting an Enemy with a Melee Attack. Stacks {amount:%s} times."..TALENTS_Enh_desc.ED_ZEA_Passive_31_rgb end), -- damage: +4%, time: 5, amount: 5 -- s->seconds -- colors

	--[+ Passive 32 - The Master's Retribution +]--
		-- create_template("talent_tree_zea_pas_032_en", {"loc_talent_zealot_3_tier_3_ability_1"}, {"en"}, function(locale, value) return "The Master's Retribution" end),
	create_template("talent_tree_zea_pas_032_desc_en", {"loc_talent_zealot_3_tier_3_ability_1_description"}, {"en"}, function(locale, value) return "Knock back the Attacker on taking a Melee Hit. Cooldown: {cooldown:%s} seconds."..TALENTS_Enh_desc.ED_ZEA_Passive_32_rgb end), -- cooldown: 10 -- s->seconds

	--[+ Passive 33 - Faith's Fortitude +]--
		-- create_template("talent_tree_zea_pas_033_en", {"loc_talent_zealot_3_tier_1_ability_3"}, {"en"}, function(locale, value) return "Faith's Fortitude" end),
	create_template("talent_tree_zea_pas_033_desc_en", {"loc_talent_zealot_3_tier_1_ability_3_description"}, {"en"}, function(locale, value) return "{health_segment:%s} "..COLORS_KWords.Wounds_rgb.."."..TALENTS_Enh_desc.ED_ZEA_Passive_33_rgb end), -- health_segment:+2.

	--[+ Passive 34 - Swift Certainty +]--
		-- create_template("talent_tree_zea_pas_034_en", {"loc_talent_zealot_improved_sprint"}, {"en"}, function(locale, value) return "Swift Certainty" end),
	create_template("talent_tree_zea_pas_034_desc_en", {"loc_talent_zealot_improved_sprint_description"}, {"en"}, function(locale, value) return "{speed:%s} increase to Sprint speed. In addition, always counts as Dodging while Sprinting, even if "..COLORS_KWords.Stamina_rgb.." is depleted."..TALENTS_Enh_desc.ED_ZEA_Passive_34_rgb end), -- speed: +5%

--[+ ++VETERAN++ +]--
--[+ +BLITZ+ +]--
	--[+ Blitz 0 - Frag Grenade +]--
		-- create_template("talent_tree_vet_blitz_000_en", {"loc_ability_frag_grenade"}, {"en"}, function(locale, value) return "Frag Grenade" end),
	create_template("talent_tree_vet_blitz_000_desc_en", {"loc_ability_frag_grenade_description"}, {"en"}, function(locale, value) return COLORS_Numbers.Fragmentation_gren_rgb.." that explodes after "..COLORS_Numbers.n_1_7_rgb.." seconds."..TALENTS_Enh_desc2.ED_VET_Blitz_0_rgb end), -- colors

	--[+ Blitz 1 - Shredder Frag Grenade +]--
		-- create_template("talent_tree_vet_blitz1_000_en", {"loc_talent_veteran_grenade_apply_bleed"}, {"en"}, function(locale, value) return "Shredder Frag Grenade" end),
	create_template("talent_tree_vet_blitz1_000_desc_en", {"loc_talent_veteran_grenade_apply_bleed_desc"}, {"en"}, function(locale, value) return "Throw a "..COLORS_Numbers.Frag_gren_rgb.." that explodes after "..COLORS_Numbers.n_1_7_rgb.." seconds. Applies {stacks:%s} Stacks of "..COLORS_KWords.Bleed_rgb.." to all Enemies Hit, causing "..COLORS_KWords.Damage_rgb.." over time. Up to "..COLORS_Numbers.n_16_rgb.." Max Stacks.\nThis is an augmented version of {talent_name:%s}."..TALENTS_Enh_desc2.ED_VET_Blitz_1_rgb end), -- stacks: 6, talent_name: Frag Grenade -- colors

	--[+ Blitz 2 - Krak Grenade +]--
		-- create_template("talent_tree_vet_blitz2_000_en", {"loc_talent_ability_krak_grenade"}, {"en"}, function(locale, value) return "Krak Grenade" end),
	create_template("talent_tree_vet_blitz2_000_desc_en", {"loc_talent_ability_krak_grenade_desc"}, {"en"}, function(locale, value) return "Throw a Grenade that explodes after "..COLORS_Numbers.n_2_rgb.." seconds and deals devastating "..COLORS_KWords.Damage_rgb..". Sticks to Flak Armoured, Carapace Armoured and Unyielding Enemies."..TALENTS_Enh_desc2.ED_VET_Blitz_2_rgb end), -- colors

	--[+ Blitz 3 - Smoke Grenade +]--
		-- create_template("talent_tree_vet_blitz3_000_en", {"loc_ability_smoke_grenade"}, {"en"}, function(locale, value) return "Smoke Grenade" end),
	create_template("talent_tree_vet_blitz3_000_desc_en", {"loc_ability_smoke_grenade_description"}, {"en"}, function(locale, value) return "Throw a Grenade that explodes after "..COLORS_Numbers.n_1_5_rgb.." seconds and creates a lingering Smoke cloud for {duration:%s} seconds. The cloud blocks line of sight for most enemies and reduces the sight range of enemies inside it."..TALENTS_Enh_desc2.ED_VET_Blitz_3_rgb end), -- duration: 15 -- colors

--[+ +AURA+ +]--
	--[+ Aura 0 - Scavenger +]--
		-- create_template("talent_tree_vet_aura_000_en", {"loc_talent_veteran_elite_kills_grant_ammo_coop"}, {"en"}, function(locale, value) return "Scavenger" end),
	create_template("talent_tree_vet_aura_000_desc_en", {"loc_talent_veteran_elite_kills_grant_ammo_coop_cd_desc"}, {"en"}, function(locale, value) return "Replenish {ammo:%s} Ammo for you and Allies in Coherency whenever any of you Kill an Elite or Specialist Enemy. This can occur once every {cooldown:%s} seconds."..TALENTS_Enh_desc2.ED_VET_Aura_0_rgb end), -- ammo: 0.75%, cooldown: 5

	--[+ Aura 1 - Survivalist +]--
		-- create_template("talent_tree_vet_aura_001_en", {"loc_talent_veteran_elite_kills_grant_ammo_coop_improved"}, {"en"}, function(locale, value) return "Survivalist" end),
	create_template("talent_tree_vet_aura_001_desc_en", {"loc_talent_veteran_elite_kills_grant_ammo_coop_improved_cd_desc"}, {"en"}, function(locale, value) return "Replenish {ammo_2:%s} Ammo for you and Allies in Coherency whenever any of you Kill an Elite or Specialist Enemy. This can occur once every {cooldown:%s} seconds.\n\nThis is an augmented version of {talent_name:%s}."..TALENTS_Enh_desc2.ED_VET_Aura_1_rgb end), -- ammo_2: 1%, cooldown: 5, talent_name: Scavenger

	--[+ Aura 2 - Fire Team +]--
		-- create_template("talent_tree_vet_aura_002_en", {"loc_talent_veteran_damage_coherency"}, {"en"}, function(locale, value) return "Fire Team" end),
	create_template("talent_tree_vet_aura_002_desc_en", {"loc_talent_veteran_damage_coherency_desc"}, {"en"}, function(locale, value) return "{damage:%s} "..COLORS_KWords.Damage_rgb.." for you and Allies in Coherency."..TALENTS_Enh_desc2.ED_VET_Aura_2_rgb end), -- damage: +5% -- colors

	--[+ Aura 3 - Close and Kill +]--
		-- create_template("talent_tree_vet_aura_003_en", {"loc_talent_veteran_movement_speed_coherency"}, {"en"}, function(locale, value) return "Close and Kill" end),
	create_template("talent_tree_vet_aura_003_desc_en", {"loc_talent_veteran_movement_speed_coherency_desc"}, {"en"}, function(locale, value) return "{movement_speed:%s} Movement Speed for your and Allies in Coherency."..TALENTS_Enh_desc2.ED_VET_Aura_3_rgb end), -- movement_speed: +5%

--[+ +ABILITIES+ +]--
	--[+ Ability 0 - Volley Fire +]--
		-- create_template("talent_tree_vet_abil_000_en", {"loc_talent_veteran_2_combat_ability"}, {"en"}, function(locale, value) return "Volley Fire" end),
	create_template("talent_tree_vet_abil_000_desc_en", {"loc_ability_veteran_base_ability_desc"}, {"en"}, function(locale, value) return "Enter Ranged Stance for {duration:%s} seconds. When in Ranged Stance you instantly equip your Ranged weapon and deal:\n{damage:%s} Ranged "..COLORS_KWords.Damage_rgb.." and\n{weakspot_damage:%s} Ranged "..COLORS_KWords.Weakspot_dmg_rgb..". Your Spread and Recoil are also greatly reduced.\nBase Cooldown: {cooldown:%s} seconds."..TALENTS_Enh_desc2.ED_VET_Ability_0_rgb end), -- duration: 5, damage: +25%, weakspot_damage: +25%, cooldown: 30 -- &->and -- s->seconds -- colors

	--[+ Ability 1 - Executioner's Stance +]--
		-- create_template("talent_tree_vet_abil1_000_en", {"loc_talent_veteran_combat_ability_elite_and_special_outlines"}, {"en"}, function(locale, value) return "Executioner's Stance" end),
	create_template("talent_tree_vet_abil1_000_desc_en", {"loc_talent_veteran_combat_ability_elite_and_special_outlines_refresh_description"}, {"en"}, function(locale, value) return "Enter Ranged Stance for {duration:%s} seconds. You instantly equip your Ranged weapon and deal:\n{damage:%s} Ranged "..COLORS_KWords.Damage_rgb..",\n{weakspot_damage:%s} Ranged "..COLORS_KWords.Weakspot_dmg_rgb..".\nHuman-sized Elite and Specialist Enemies within "..COLORS_Numbers.n_50_rgb.." meters of the Veteran are highlighted for {duration:%s} seconds.\nKilling an highlighted enemy refreshes the active duration by {refresh_duration:%s} seconds. This also refreshes the duration of outlines on enemies for Veteran.\nBase Cooldown: {cooldown:%s} seconds.\nThis is an augmented version of {old_talent_name:%s}."..TALENTS_Enh_desc2.ED_VET_Ability_1_rgb end), -- duration: 5, damage: +25%, weakspot_damage: +25%, duration: 5, cooldown: 30, old_talent_name: Volley Fire -- rewrite -- s->seconds -- colors

	--[+ Ability 1-1 - Enhanced Target Priority +]--
		-- create_template("talent_tree_vet_abil1_001_en", {"loc_talent_veteran_combat_ability_coherency_outlines"}, {"en"}, function(locale, value) return "Enhanced Target Priority" end),
	create_template("talent_tree_vet_abil1_001_desc_en", {"loc_talent_veteran_combat_ability_coherency_outlines_description"}, {"en"}, function(locale, value) return "{talent_name:%s} now outlines all human-sized Elite and Specialist Enemies for Allies in Coherency for {duration:%s} seconds."..TALENTS_Enh_desc2.ED_VET_Ability_1_1_rgb end), -- talent_name: Executioner's Stance, duration: 5 -- rewrite -- &->and -- s->seconds

	--[+ Ability 1-2 - Counter-Fire +]--
		-- create_template("talent_tree_vet_abil1_002_en", {"loc_talent_veteran_combat_ability_ranged_enemies_outlines"}, {"en"}, function(locale, value) return "Counter-Fire" end),
	create_template("talent_tree_vet_abil1_002_desc_en", {"loc_talent_veteran_combat_ability_ranged_enemies_outlines_description"}, {"en"}, function(locale, value) return "{talent_name:%s} now outlines Scab/Dreg Stalkers and Scab Shooters, additionally to all human-sized Elites and Specials." end), -- talent_name: Executioner's Stance -- rewrite

	--[+ Ability 1-3 - The Bigger they Are... +]--
		-- create_template("talent_tree_vet_abil1_003_en", {"loc_talent_ranger_volley_fire_big_game_hunter"}, {"en"}, function(locale, value) return "The Bigger they Are..." end),
	create_template("talent_tree_vet_abil1_003_desc_en", {"loc_talent_veteran_combat_ability_ogryn_outlines_description"}, {"en"}, function(locale, value) return "{talent_name:%s} now outlines Bulwarks, Crushers and Reapers, additionally to all human-sized Elites and Specials." end), -- talent_name: Executioner's Stance -- rewrite

	--[+ Ability 1-4 - Marksman +]--
		-- create_template("talent_tree_vet_abil1_004_en", {"loc_talent_veteran_ability_marksman"}, {"en"}, function(locale, value) return "Marksman" end),
	create_template("talent_tree_vet_abil1_004_desc_en", {"loc_talent_veteran_ability_marksman_desc"}, {"en"}, function(locale, value) return "{power:%s} "..COLORS_KWords.Strength_rgb.." for any "..COLORS_KWords.Weakspothits_rgb.." for {duration:%s} seconds after "..COLORS_KWords.Combat_ability_rgb.." use.\n\nWhen using {talent_name:%s}, this is applied after leaving "..COLORS_KWords.Stealth_rgb.."."..TALENTS_Enh_desc2.ED_VET_Ability_1_4_rgb end), -- duration: 10, power: +20%, talent_name: Infiltrate -- s->seconds -- colors

	--[+ Ability 2 - Voice of Command +]--
		-- create_template("talent_tree_vet_abil2_000_en", {"loc_talent_veteran_combat_ability_stagger_nearby_enemies"}, {"en"}, function(locale, value) return "Voice of Command" end),
	create_template("talent_tree_vet_abil2_000_desc_en", {"loc_talent_veteran_combat_ability_stagger_nearby_enemies_description"}, {"en"}, function(locale, value) return "Replenishes your "..COLORS_KWords.Toughness_rgb.." and "..COLORS_KWords.Staggers_rgb.." all Enemies within {range:%s} meters.\n\nBase Cooldown {cooldown:%s} seconds."..TALENTS_Enh_desc2.ED_VET_Ability_2_rgb end), -- range: 9, cooldown: 30 -- &->and -- m->meters -- s->seconds -- colors

	--[+ Ability 2-1 - Duty and Honour +]--
		-- create_template("talent_tree_vet_abil2_001_en", {"loc_talent_veteran_combat_ability_increase_and_restore_toughness_to_coherency"}, {"en"}, function(locale, value) return "Duty and Honour" end),
	create_template("talent_tree_vet_abil2_001_desc_en", {"loc_talent_veteran_combat_ability_increase_and_restore_toughness_to_coherency_description"}, {"en"}, function(locale, value) return "{talent_name:%s} now also provides you and Allies in Coherency with {toughness:%s} "..COLORS_KWords.Toughness_rgb.." for {duration:%s} seconds. This can exceed your Maximum "..COLORS_KWords.Toughness_rgb.."."..TALENTS_Enh_desc2.ED_VET_Ability_2_1_rgb end), -- talent_name: Voice of Command, toughness: +50, duration: 15 -- s->seconds -- colors

	--[+ Ability 2-2 - Only In Death Does Duty End +]--
		-- create_template("talent_tree_vet_abil2_002_en", {"loc_talent_veteran_combat_ability_revives"}, {"en"}, function(locale, value) return "Only In Death Does Duty End" end),
	create_template("talent_tree_vet_abil2_002_desc_en", {"loc_talent_veteran_combat_ability_revives_description"}, {"en"}, function(locale, value) return "{talent_name:%s} revives Knocked Down Allies within Radius, but also reduces that Radius by {range:%s} and increases your "..COLORS_KWords.Ability_cd_rgb.." by {ability_cooldown:%s}."..TALENTS_Enh_desc2.ED_VET_Ability_2_2_rgb end), -- talent_name: Voice of Command, range: 33%, ability_cooldown: 50% -- &->and -- colors

	--[+ Ability 2-3 - For the Emperor! +]--
		-- create_template("talent_tree_vet_abil2_003_en", {"loc_talent_veteran_combat_ability_melee_and_ranged_damage_to_coherency"}, {"en"}, function(locale, value) return "For the Emperor!" end),
	create_template("talent_tree_vet_abil2_003_desc_en", {"loc_talent_veteran_combat_ability_melee_and_ranged_damage_to_coherency_description"}, {"en"}, function(locale, value) return "Your "..COLORS_KWords.Combat_ability_rgb.." gives for {duration:%s} seconds you and Allies in Coherency:\n{melee_damage:%s} Melee Base "..COLORS_KWords.Damage_rgb.." and\n{ranged_damage:%s} Ranged Base "..COLORS_KWords.Damage_rgb.."."..TALENTS_Enh_desc2.ED_VET_Ability_2_3_rgb end), --  duration: 5, melee_damage: +10%, ranged_damage: +10% -- rewrite -- &->and -- s->seconds -- colors

	--[+ Ability 3 - Infiltrate +]--
		-- create_template("talent_tree_vet_abil3_000_en", {"loc_talent_veteran_invisibility_on_combat_ability"}, {"en"}, function(locale, value) return "Infiltrate" end),
	create_template("talent_tree_vet_abil3_000_desc_en", {"loc_talent_veteran_invisibility_on_combat_ability_desc"}, {"en"}, function(locale, value) return "Replenish all "..COLORS_KWords.Toughness_rgb.." and enter "..COLORS_KWords.Stealth_rgb.." for {duration:%s} seconds, gaining {movement_speed:%s} Movement Speed. Leaving "..COLORS_KWords.Stealth_rgb.." Suppresses nearby Enemies. Attacking makes you leave "..COLORS_KWords.Stealth_rgb..".\nBase Cooldown: {cooldown:%s} seconds."..TALENTS_Enh_desc2.ED_VET_Ability_3_rgb end), -- duration: 8, movement_speed: +25%, cooldown: 45 -- rewrite -- s->seconds -- colors

	--[+ Ability 3-1 - Low Profile +]--
		-- create_template("talent_tree_vet_abil3_001_en", {"loc_talent_veteran_reduced_threat_after_combat_ability"}, {"en"}, function(locale, value) return "Low Profile" end),
	create_template("talent_tree_vet_abil3_001_desc_en", {"loc_talent_veteran_reduced_threat_after_stealth_desc"}, {"en"}, function(locale, value) return "{threat_multiplier:%s} Threat for {duration:%s} seconds on leaving "..COLORS_KWords.Stealth_rgb.."."..TALENTS_Enh_desc2.ED_VET_Ability_3_1_rgb end), -- threat_multiplier: -90%, duration: 10 -- s->seconds -- colors

	--[+ Ability 3-2 - Overwatch +]--
		-- create_template("talent_tree_vet_abil3_002_en",{"loc_talent_veteran_combat_ability_extra_charge"}, {"en"}, function(locale, value) return "Overwatch" end),
	create_template("talent_tree_vet_abil3_002_desc_en", {"loc_talent_veteran_combat_ability_extra_charge_description"}, {"en"}, function(locale, value) return "Your "..COLORS_KWords.Combat_ability_rgb.." gains {charges:%s} charge, but {ability_cooldown:%s} "..COLORS_KWords.Cd_rgb.."."..TALENTS_Enh_desc2.ED_VET_Ability_3_2_rgb end), -- charges: +1, ability_cooldown: +33%

	--[+ Ability 3-3 - Hunter's Resolve +]--
		-- create_template("talent_tree_vet_abil3_003_en", {"loc_talent_veteran_toughness_bonus_leaving_invisibility"}, {"en"}, function(locale, value) return "Hunter's Resolve" end),
	create_template("talent_tree_vet_abil3_003_desc_en", {"loc_talent_veteran_toughness_bonus_leaving_invisibility_desc"}, {"en"}, function(locale, value) return "{tdr:%s} "..COLORS_KWords.Toughness_dmg_red_rgb.." is provided by {talent_name:%s} for {duration:%s} seconds upon leaving "..COLORS_KWords.Stealth_rgb.."."..TALENTS_Enh_desc2.ED_VET_Ability_3_3_rgb end), -- talent_name: Infiltrate, tdr: +50%, duration: 10 -- s->seconds -- colors

	--[+ Ability 3-4 - Surprise Attack +]--
		-- create_template("talent_tree_vet_abil3_004_en", {"loc_talent_veteran_damage_bonus_leaving_invisibility"}, {"en"}, function(locale, value) return "Surprise Attack" end),
	create_template("talent_tree_vet_abil3_004_desc_en", {"loc_talent_veteran_damage_bonus_leaving_invisibility_desc"}, {"en"}, function(locale, value) return "{damage:%s} "..COLORS_KWords.Damage_rgb.." is granted by {talent_name:%s} for {duration:%s} seconds upon leaving "..COLORS_KWords.Stealth_rgb.."."..TALENTS_Enh_desc2.ED_VET_Ability_3_4_rgb end), -- talent_name: Infiltrate, damage: +30%, duration: 5 -- s->seconds -- colors

	--[+ Ability 3-5 - Close Quarters Killzone +]--
		-- create_template("talent_tree_vet_abil3_005_en", {"loc_talent_veteran_ability_assault"}, {"en"}, function(locale, value) return "Close Quarters Killzone" end),
	create_template("talent_tree_vet_abil3_005_desc_en", {"loc_talent_veteran_ability_assault_desc"}, {"en"}, function(locale, value) return "{power:%s} Close "..COLORS_KWords.Damage_rgb.." for {duration:%s} seconds on "..COLORS_KWords.Combat_ability_rgb.." use.\n\nWhen using {talent_name:%s}, this begins on leaving "..COLORS_KWords.Stealth_rgb.."."..TALENTS_Enh_desc2.ED_VET_Ability_3_5_rgb end), -- power: +15%, duration: 10, talent_name: Infiltrate -- rewrite -- s->seconds -- colors

--[+ +KEYSTONES+ +]--
	--[+ Keystone 1 - Marksman's Focus +]--
		-- create_template("talent_tree_vet_keys1_000_en", {"loc_talent_veteran_snipers_focus"}, {"en"}, function(locale, value) return "Marksman's Focus" end),
	create_template("talent_tree_vet_keys1_000_desc_en", {"loc_talent_veteran_snipers_focus_alt_description"}, {"en"}, function(locale, value) return "Ranged "..COLORS_KWords.Weakspot_rgb.." kills grant {stacks:%s} Stacks of "..COLORS_KWords.Focus_rgb..". Up to {max_stacks} Max Stacks. Sprinting, Sliding and Walking removes Stacks.\nEach Stack of "..COLORS_KWords.Focus_rgb.." grants:\n{power:%s} Ranged "..COLORS_KWords.Finesse_rgb.." strength and\n{reload_speed:%s} Reload Speed.\nRanged "..COLORS_KWords.Weakspot_rgb.." kills let you move without losing Stacks for {grace_time:%s} seconds. Ranged "..COLORS_KWords.Weakspothits_rgb.." lets you move without losing Stacks for {grace_time_hit:%s} second."..TALENTS_Enh_desc2.ED_VET_Keystone_1_rgb end), -- stacks: 3, max_stacks: 10, power: +7.5%, reload_speed: +1%, grace_time: 6, grace_time_hit: 3 -- stack(s)->stacks -- s->second/seconds -- colors

	--[+ Keystone 1-1 - Chink in their Armour +]--
		-- create_template("talent_tree_vet_keys1_001_en", {"loc_talent_veteran_snipers_focus_rending_bonus"}, {"en"}, function(locale, value) return "Chink in their Armour" end),
	create_template("talent_tree_vet_keys1_001_desc_en", {"loc_talent_veteran_snipers_focus_rending_bonus_description"}, {"en"}, function(locale, value) return "{rending:%s} "..COLORS_KWords.Rending_rgb.." when at, or over, {stacks:%s} Stacks of "..COLORS_KWords.Focus_rgb.."."..TALENTS_Enh_desc2.ED_VET_Keystone_1_1_rgb end), -- rending: +10%, stacks: 10 -- colors

	--[+ Keystone 1-2 - Tunnel Vision +]--
		-- create_template("talent_tree_vet_keys1_002_en", {"loc_talent_veteran_snipers_focus_toughness_bonus"}, {"en"}, function(locale, value) return "Tunnel Vision" end),
	create_template("talent_tree_vet_keys1_002_desc_en", {"loc_talent_veteran_snipers_focus_stamina_bonus_desc"}, {"en"}, function(locale, value) return "{toughness_replenish_multiplier:%s} "..COLORS_KWords.Toughness_rgb.." Replenishment for each Stack of "..COLORS_KWords.Focus_rgb..". In addition, "..COLORS_KWords.Weakspot_rgb.." kills restore {stamina:%s} "..COLORS_KWords.Stamina_rgb.."."..TALENTS_Enh_desc2.ED_VET_Keystone_1_2_rgb end), -- toughness_replenish_multiplier: +5%, stamina: 10% -- colors

	--[+ Keystone 1-3 - Long Range Assassin +]--
		-- create_template("talent_tree_vet_keys1_003_en", {"loc_talent_veteran_snipers_focus_increased_stacks"}, {"en"}, function(locale, value) return "Long Range Assassin" end),
	create_template("talent_tree_vet_keys1_003_desc_en", {"loc_talent_veteran_snipers_focus_increased_stacks_description"}, {"en"}, function(locale, value) return "Increase Maximum Stacks of "..COLORS_KWords.Focus_rgb.." from {stacks:%s} to {new_stacks:%s}." end), -- stacks: 10, new_stacks: 15 -- colors

	--[+ Keystone 1-4 - Camouflage +]--
		-- create_template("talent_tree_vet_keys1_004_en", {"loc_talent_veteran_snipers_focus_stacks_on_still"}, {"en"}, function(locale, value) return "Camouflage" end),
	create_template("talent_tree_vet_keys1_004_desc_en", {"loc_talent_veteran_snipers_focus_stacks_on_still_description"}, {"en"}, function(locale, value) return "Gain {stack:%s} Stack of "..COLORS_KWords.Focus_rgb.." every {time:%s} seconds when Standing Still or Walking when Crouched." end), -- stack: 1, time: 0.75 -- stack(s)->stacks -- s->seconds -- colors

	--[+ Keystone 2 - Focus Target! +]--
		-- create_template("talent_tree_vet_keys2_000_en", {"loc_talent_veteran_improved_tag"}, {"en"}, function(locale, value) return "Focus Target!" end),
	create_template("talent_tree_vet_keys2_000_desc_en", {"loc_talent_veteran_improved_tag_description"}, {"en"}, function(locale, value) return "Gain "..COLORS_KWords.Focus_Target_rgb.." every {time:%s} seconds. Stacks {max_stacks:%s} times.\nTagging an Enemy applies the "..COLORS_KWords.Focus_Target_rgb.." Stacks to them, causing them to take {damage:%s} additional "..COLORS_KWords.Damage_rgb.." for each Stack, and resets your "..COLORS_KWords.Focus_Target_rgb.." Stacks to "..COLORS_Numbers.n_1_rgb.."."..TALENTS_Enh_desc2.ED_VET_Keystone_2_rgb end), -- time: 2, max_stacks: 5, damage: +4% -- -() -- s->seconds -- colors

	--[+ Keystone 2-1 - Target Down! +]--
		-- create_template("talent_tree_vet_keys2_001_en", {"loc_talent_veteran_improved_tag_dead_bonus"}, {"en"}, function(locale, value) return "Target Down!" end),
	create_template("talent_tree_vet_keys2_001_desc_en", {"loc_talent_veteran_improved_tag_dead_bonus_description"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." and {stamina:%s} "..COLORS_KWords.Stamina_rgb.." are replenished for each stack of "..COLORS_KWords.Focus_Target_rgb.." applied when an enemy you have Tagged dies, for you and Allies in Coherency."..TALENTS_Enh_desc2.ED_VET_Keystone_2_1_rgb end), -- toughness: 5%, stamina: 5% -- colors

	--[+ Keystone 2-2 - Redirect Fire! +]--
		-- create_template("talent_tree_vet_keys2_002_en", {"loc_talent_veteran_improved_tag_dead_coherency_bonus"}, {"en"}, function(locale, value) return "Redirect Fire!" end),
	create_template("talent_tree_vet_keys2_002_desc_en", {"loc_talent_veteran_improved_tag_dead_coherency_bonus_description"}, {"en"}, function(locale, value) return "{damage:%s} "..COLORS_KWords.Damage_rgb.." is granted for each Stack of "..COLORS_KWords.Focus_Target_rgb.." applied when an enemy you have Tagged dies, to you and Allies in Coherency. Lasts {duration:%s} seconds."..TALENTS_Enh_desc2.ED_VET_Keystone_2_2_rgb end), -- damage: +1.5%, duration: 10 -- s->seconds -- colors

	--[+ Keystone 2-3 - Focused Fire +]--
		-- create_template("talent_tree_vet_keys2_003_en", {"loc_talent_veteran_improved_tag_more_damage"}, {"en"}, function(locale, value) return "Focused Fire" end),
	create_template("talent_tree_vet_keys2_003_desc_en", {"loc_talent_veteran_improved_tag_more_damage_description"}, {"en"}, function(locale, value) return COLORS_KWords.Focus_Target_rgb.." Max Stacks increased from "..COLORS_Numbers.n_5_rgb.." to {max_stacks:%s}." end), -- max_stacks: 8 -- colors

	--[+ Keystone 3 - Weapons Specialist +]--
		-- create_template("talent_tree_vet_keys3_000_en", {"loc_talent_veteran_weapon_switch"}, {"en"}, function(locale, value) return "Weapons Specialist" end),
	create_template("talent_tree_vet_keys3_000_desc_en", {"loc_talent_veteran_weapon_switch_description"}, {"en"}, function(locale, value) return "Gain "..COLORS_KWords.Rangedspec_rgb.." on Melee kills. Stacks {ranged_stacks:%s} times.\nGain "..COLORS_KWords.Meleespec_rgb.." on Ranged kill. Stacks {melee_stacks:%s} times.\n\nWhen you wield your Ranged weapon, you activate your "..COLORS_KWords.Rangedspec_rgb.." effect, to gain:\n{ranged_attack_speed:%s} Ranged Attack Speed and\n{ranged_crit_chance:%s} Ranged "..COLORS_KWords.Crit_hit_rgb.." Chance on your next shot, per Stack. Lasts {ranged_duration:%s} seconds.\n\nWhen you wield your Melee weapon, you activate your "..COLORS_KWords.Meleespec_rgb.." effect, to gain:\n{melee_attack_speed:%s} Melee Attack Speed,\n"..COLORS_Numbers.n_plus_rgb.."{dodge_modifier:%s} Dodge Speed and Dodge Distance. Lasts {melee_duration:%s} seconds."..TALENTS_Enh_desc2.ED_VET_Keystone_3_rgb end), -- ranged_stacks: 10, melee_stacks: 1, ranged_attack_speed: +2%, ranged_crit_chance: +33%, ranged_duration: 5, melee_attack_speed: +15%, dodge_modifier: 10%, melee_duration: 10 -- -() --  s->seconds -- colors

	--[+ Keystone 3-1 - Always Prepared +]--
		-- create_template("talent_tree_vet_keys3_001_en", {"loc_talent_veteran_weapon_switch_replenish_ammo"}, {"en"}, function(locale, value) return "Always Prepared" end),
	create_template("talent_tree_vet_keys3_001_desc_en", {"loc_talent_veteran_weapon_switch_replenish_ammo_description"}, {"en"}, function(locale, value) return "Activating "..COLORS_KWords.Rangedspec_rgb.." replenishes up to {ammo:%s} of your missing ammo in your Clip from your Reserve, rounded up, for each Stack."..TALENTS_Enh_desc2.ED_VET_Keystone_3_1_rgb end), -- ammo: 3.3% -- colors

	--[+ Keystone 3-2 - Invigorated +]--
		-- create_template("talent_tree_vet_keys3_002_en", {"loc_talent_veteran_weapon_switch_replenish_stamina"}, {"en"}, function(locale, value) return "Invigorated" end),
	create_template("talent_tree_vet_keys3_002_desc_en", {"loc_talent_veteran_weapon_switch_replenish_stamina_description"}, {"en"}, function(locale, value) return "Activating "..COLORS_KWords.Meleespec_rgb.." restores {stamina:%s} "..COLORS_KWords.Stamina_rgb.."."..TALENTS_Enh_desc2.ED_VET_Keystone_3_2_rgb end), -- stamina: 20% -- colors

	--[+ Keystone 3-3 - On Your Toes +]--
		-- create_template("talent_tree_vet_keys3_003_en", {"loc_talent_veteran_weapon_switch_replenish_toughness"}, {"en"}, function(locale, value) return "On Your Toes" end),
	create_template("talent_tree_vet_keys3_003_desc_en", {"loc_talent_veteran_weapon_switch_replenish_toughness_description"}, {"en"}, function(locale, value) return "Activating "..COLORS_KWords.Meleespec_rgb.." and "..COLORS_KWords.Rangedspec_rgb.." replenishes {toughness:%s} "..COLORS_KWords.Toughness_rgb..". {cooldown:%s} seconds Cooldown for each."..TALENTS_Enh_desc2.ED_VET_Keystone_3_3_rgb end), -- toughness: 20%, cooldown: 3 -- s->seconds -- colors

	--[+ Keystone 3-4 - Fleeting Fire +]--
		-- create_template("talent_tree_vet_keys3_004_en", {"loc_talent_veteran_weapon_switch_reload_speed"}, {"en"}, function(locale, value) return "Fleeting Fire" end),
	create_template("talent_tree_vet_keys3_004_desc_en", {"loc_talent_veteran_weapon_switch_reload_speed_description"}, {"en"}, function(locale, value) return "Activating "..COLORS_KWords.Rangedspec_rgb.." grants {reload_speed:%s} Reload Speed for {duration:%s} seconds."..TALENTS_Enh_desc2.ED_VET_Keystone_3_4_rgb end), -- reload_speed: 20%, duration: 5 -- s->seconds -- colors

	--[+ Keystone 3-5 - Conditioning +]--
		-- create_template("talent_tree_vet_keys3_005_en", {"loc_talent_veteran_weapon_switch_stamina_reduction"}, {"en"}, function(locale, value) return "Conditioning" end),
	create_template("talent_tree_vet_keys3_005_desc_en", {"loc_talent_veteran_weapon_switch_stamina_reduction_description"}, {"en"}, function(locale, value) return "Activating "..COLORS_KWords.Meleespec_rgb.." grants {stamina_reduction:%s} "..COLORS_KWords.Stamina_rgb.." Cost Reduction for {duration:%s} seconds."..TALENTS_Enh_desc2.ED_VET_Keystone_3_5_rgb end), -- stamina_reduction: 25%, duration: 3 -- s->seconds -- colors

--[+ +PASSIVES+ +]--
	--[+ Passive 1 - Longshot +]--
		-- create_template("talent_tree_vet_pas_001_en", {"loc_talent_veteran_increased_damage_based_on_range"}, {"en"}, function(locale, value) return "Longshot" end),
	create_template("talent_tree_vet_pas_001_desc_en", {"loc_talent_veteran_increased_damage_based_on_range_desc"}, {"en"}, function(locale, value) return "Deal up to {max_damage:%s} Ranged Base "..COLORS_KWords.Damage_rgb..". Bonus is reduced the nearer the target."..TALENTS_Enh_desc2.ED_VET_Passive_1_rgb end), -- max_damage: +20% -- colors

	--[+ Passive 2 - Close Order Drill +]--
		-- create_template("talent_tree_vet_pas_002_en", {"loc_talent_veteran_toughness_damage_reduction_per_ally"}, {"en"}, function(locale, value) return "Close Order Drill" end),
	create_template("talent_tree_vet_pas_002_desc_en", {"loc_talent_veteran_toughness_damage_reduction_per_ally_description"}, {"en"}, function(locale, value) return COLORS_Numbers.n_plus_rgb..COLORS_Numbers.pc_11_rgb.." "..COLORS_KWords.Toughness_dmg_red_rgb.." per Ally in Coherency. Up to {toughness:%s}."..TALENTS_Enh_desc2.ED_VET_Passive_2_rgb end), -- toughness: +33% -- colors

	--[+ Passive 3 - One Motion +]--
		-- create_template("talent_tree_vet_pas_003_en", {"loc_talent_veteran_reduce_swap_time"}, {"en"}, function(locale, value) return "One Motion" end),
	create_template("talent_tree_vet_pas_003_desc_en", {"loc_talent_veteran_reduce_swap_time_desc"}, {"en"}, function(locale, value) return "{swap_speed} Weapon Swap Speed."..TALENTS_Enh_desc2.ED_VET_Passive_3_rgb end), -- swap_speed: +25%

	--[+ Passive 4 - Exhilarating Takedown +]--
		-- create_template("talent_tree_vet_pas_004_en", {"loc_talent_veteran_toughness_on_weakspot_kill"}, {"en"}, function(locale, value) return "Exhilarating Takedown" end),
	create_template("talent_tree_vet_pas_004_desc_en", {"loc_talent_veteran_toughness_on_weakspot_kill_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." is replenished and "..COLORS_Numbers.n_1_rgb.." Stack of {toughness_damage_reduction:%s} "..COLORS_KWords.Toughness_dmg_red_rgb.." is gained for {duration:%s} seconds on a Ranged "..COLORS_KWords.Weakspot_rgb.." kill. Stacks {stacks:%s} times."..TALENTS_Enh_desc2.ED_VET_Passive_4_rgb end), -- toughness: 15%, toughness_damage_reduction: +10%, duration: 8, stacks: 3 -- rewrite -- s->seconds -- colors

	--[+ Passive 5 - Volley Adept +]--
		-- create_template("talent_tree_vet_pas_005_en", {"loc_talent_veteran_reload_speed_on_elite_kill"}, {"en"}, function(locale, value) return "Volley Adept" end),
	create_template("talent_tree_vet_pas_005_desc_en", {"loc_talent_veteran_reload_speed_on_elite_kill_desc"}, {"en"}, function(locale, value) return "{reload_speed:%s} Reload Speed on Elite and Specialist Enemy Kill."..TALENTS_Enh_desc2.ED_VET_Passive_5_rgb end), -- reload_speed: +30% -- &->and

	--[+ Passive 6 - Charismatic +]--
		-- create_template("talent_tree_vet_pas_006_en", {"loc_talent_veteran_increased_aura_radius"}, {"en"}, function(locale, value) return "Charismatic" end),
	create_template("talent_tree_vet_pas_006_desc_en", {"loc_talent_veteran_increased_aura_radius_description"}, {"en"}, function(locale, value) return "{radius:%s} Aura radius."..TALENTS_Enh_desc2.ED_VET_Passive_6_rgb end), -- radius: +50%

	--[+ Passive 7 - Confirmed Kill +]--
		-- create_template("talent_tree_vet_pas_007_en", {"loc_talent_veteran_toughness_on_elite_kill"}, {"en"}, function(locale, value) return "Confirmed Kill" end),
	create_template("talent_tree_vet_pas_007_desc_en", {"loc_talent_veteran_toughness_on_elite_kill_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." is replenished on killing an Elite or Specialist Enemy, and a further {toughness_over_time:%s} "..COLORS_KWords.Toughness_rgb.." over {duration:%s} seconds."..TALENTS_Enh_desc2.ED_VET_Passive_7_rgb end), -- toughness: 10%, toughness_over_time: 20%, duration: 10 -- s->seconds -- colors

	--[+ Passive 8 - Tactical Reload +]--
		-- create_template("talent_tree_vet_pas_008_en", {"loc_talent_ranger_reload_speed_empty_mag"}, {"en"}, function(locale, value) return "Tactical Reload" end),
	create_template("talent_tree_vet_pas_008_desc_en", {"loc_talent_veteran_reload_speed_non_empty_mag_desc"}, {"en"}, function(locale, value) return "{reload_speed:%s} Reload Speed if your weapon contains Ammo."..TALENTS_Enh_desc2.ED_VET_Passive_8_rgb end), -- reload_speed: +25%

	--[+ Passive 9 - Out for Blood +]--
		-- create_template("talent_tree_vet_pas_009_en", {"loc_talent_veteran_all_kills_replenish_toughness"}, {"en"}, function(locale, value) return "Out for Blood" end),
	create_template("talent_tree_vet_pas_009_desc_en", {"loc_talent_veteran_all_kills_replenish_toughness_description"}, {"en"}, function(locale, value) return "{toughness:%s} additional "..COLORS_KWords.Toughness_rgb.." is replenished with each kill."..TALENTS_Enh_desc2.ED_VET_Passive_9_rgb end), -- toughness: 5% -- colors

	--[+ Passive 10 - Get Back in the Fight! +]--
		-- create_template("talent_tree_vet_pas_010_en", {"loc_talent_veteran_movement_speed_on_toughness_broken"}, {"en"}, function(locale, value) return "Get Back in the Fight!" end),
	create_template("talent_tree_vet_pas_010_desc_en", {"loc_talent_veteran_movement_bonus_on_toughness_broken_desc"}, {"en"}, function(locale, value) return "{stamina_percent:%s} "..COLORS_KWords.Stamina_rgb.." restored, along with "..COLORS_KWords.Stun_rgb.." and Slow Immunity, for {duration:%s} seconds when "..COLORS_KWords.Toughness_rgb.." is broken.\n\n{cooldown:%s} seconds Cooldown."..TALENTS_Enh_desc2.ED_VET_Passive_10_rgb end), -- duration: 6, stamina_percent: +50%, cooldown: 30 -- rewrite -- &->and -- s->seconds -- colors

	--[+ Passive 11 - Catch a Breath +]--
		-- create_template("talent_tree_vet_pas_011_en", {"loc_talent_veteran_replenish_toughness_outside_melee"}, {"en"}, function(locale, value) return "Catch a Breath" end),
	create_template("talent_tree_vet_pas_011_desc_en", {"loc_talent_veteran_replenish_toughness_outside_melee_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." replenished per second when there are no enemies within {range:%s} meters."..TALENTS_Enh_desc2.ED_VET_Passive_11_rgb end), -- toughness: 5%, range: 8 -- m->meters -- colors

	--[+ Passive 12 - Grenade Tinkerer +]--
		-- create_template("talent_tree_vet_pas_012_en", {"loc_talent_veteran_improved_grenades"}, {"en"}, function(locale, value) return "Grenade Tinkerer" end),
	create_template("talent_tree_vet_pas_012_desc_en", {"loc_talent_veteran_improved_grenades_desc"}, {"en"}, function(locale, value) return "Improve your chosen Grenade:\n{krak_grenade:%s}: {krak:%s} "..COLORS_KWords.Damage_rgb..".\n{frag_grenade:%s}: {frag_damage:%s} "..COLORS_KWords.Damage_rgb.." and Radius.\n{smoke_grenade:%s}: {smoke:%s} Duration."..TALENTS_Enh_desc2.ED_VET_Passive_12_rgb end), -- krak_grenade: Krak Grenade, krak: +50%, frag_grenade: Frag Grenade, frag_damage: +25%, smoke_grenade: Smoke Grenade, smoke: +100% -- &->and -- colors

	--[+ Passive 13 - Covering Fire +]--
		-- create_template("talent_tree_vet_pas_013_en", {"loc_talent_veteran_replenish_toughness_and_boost_allies"}, {"en"}, function(locale, value) return "Covering Fire" end),
	create_template("talent_tree_vet_pas_013_desc_en", {"loc_talent_veteran_replenish_toughness_and_boost_allies_desc"}, {"en"}, function(locale, value) return "When you kill an enemy with a Ranged Attack, Allies within {radius:%s} meters of the target Replenish {toughness:%s} "..COLORS_KWords.Toughness_rgb.." and receive {base_damage:%s} to all Base "..COLORS_KWords.Damage_rgb.." for {duration:%s} seconds."..TALENTS_Enh_desc2.ED_VET_Passive_13_rgb end), -- radius: 5, toughness: 15%, base_damage: +10%, duration: 3 -- &->and s->seconds -- colors

	--[+ Passive 14 - Serrated Blade +]--
		-- create_template("talent_tree_vet_pas_014_en", {"loc_talent_veteran_hits_cause_bleed"}, {"en"}, function(locale, value) return "Serrated Blade" end),
	create_template("talent_tree_vet_pas_014_desc_en", {"loc_talent_veteran_hits_cause_bleed_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.n_plus_rgb.."{stacks:%s} Stack of "..COLORS_KWords.Bleed_rgb.." to the target on Melee Hit. Up to "..COLORS_Numbers.n_16_rgb.."."..TALENTS_Enh_desc2.ED_VET_Passive_14_rgb end), -- stacks: 1 -- Stack(s)->Stacks -- colors

	--[+ Passive 15 - Agile Engagement +]--
		-- create_template("talent_tree_vet_pas_015_en", {"loc_talent_veteran_kill_grants_damage_to_other_slot"}, {"en"}, function(locale, value) return "Agile Engagement" end),
	create_template("talent_tree_vet_pas_015_desc_en", {"loc_talent_veteran_kill_grants_damage_to_other_slot_desc"}, {"en"}, function(locale, value) return "{damage:%s} Ranged "..COLORS_KWords.Damage_rgb.." on killing an enemy with a Melee attack.\n{damage:%s} Melee "..COLORS_KWords.Damage_rgb.." on killing an enemy with a Ranged attack.\nLasts {duration:%s} seconds."..TALENTS_Enh_desc2.ED_VET_Passive_15_rgb end), -- damage: +25%, duration: 5 -- s->seconds -- colors

	--[+ Passive 16 - Kill Zone +]--
		-- create_template("talent_tree_vet_pas_016_en", {"loc_talent_veteran_ranged_power_out_of_melee"}, {"en"}, function(locale, value) return "Kill Zone" end),
	create_template("talent_tree_vet_pas_016_desc_en", {"loc_talent_veteran_ranged_power_out_of_melee_desc"}, {"en"}, function(locale, value) return "{ranged_damage:%s} Base Ranged "..COLORS_KWords.Damage_rgb.." when there are no Enemies within {radius:%s} meters."..TALENTS_Enh_desc2.ED_VET_Passive_16_rgb end), -- ranged_damage: +20%, radius: 8 -- m->meters -- colors

	--[+ Passive 17 - Opening Salvo +]--
		-- create_template("talent_tree_vet_pas_017_en", {"loc_talent_veteran_bonus_crit_chance_on_ammo"}, {"en"}, function(locale, value) return "Opening Salvo" end),
	create_template("talent_tree_vet_pas_017_desc_en", {"loc_talent_veteran_bonus_crit_chance_on_ammo_desc"}, {"en"}, function(locale, value) return "The first {ammo:%s} Ammo after a Reload has {crit_chance:%s} Ranged "..COLORS_KWords.Crit_hit_rgb.." Chance."..TALENTS_Enh_desc2.ED_VET_Passive_17_rgb end), -- ammo: 20%, crit_chance: +10% -- colors

	--[+ Passive 18 - Field Improvisation +]--
		-- create_template("talent_tree_vet_pas_018_en", {"loc_talent_veteran_better_deployables"}, {"en"}, function(locale, value) return "Field Improvisation" end),
	create_template("talent_tree_vet_pas_018_desc_en", {"loc_talent_veteran_better_deployables_description"}, {"en"}, function(locale, value) return "Medi-Packs:\nHeal {damage_heal:%s} faster,\nReplenish {toughness:%s} "..COLORS_KWords.Toughness_rgb.." per second,\nCleanse "..COLORS_KWords.Corruption_rgb.." up to the next "..COLORS_KWords.Wound_rgb..".\n\nAmmo Crates also restore Grenades."..TALENTS_Enh_desc2.ED_VET_Passive_18_rgb end), -- damage_heal: +100%, toughness: 1% -- rewrite -- &->and -- colors

	--[+ Passive 19 - Twinned Blast +]--
		-- create_template("talent_tree_vet_pas_019_en", {"loc_talent_veteran_extra_grenade_throw_chance"}, {"en"}, function(locale, value) return "Twinned Blast" end),
	create_template("talent_tree_vet_pas_019_desc_en", {"loc_talent_veteran_extra_grenade_throw_chance_desc"}, {"en"}, function(locale, value) return "{chance:%s} chance to throw an additional Grenade but this still only consumes a single Grenade."..TALENTS_Enh_desc2.ED_VET_Passive_19_rgb end), -- chance: 20% -- -()

	--[+ Passive 20 - Demolition Stockpile +]--
		-- create_template("talent_tree_vet_pas_020_en", {"loc_talent_ranger_replenish_grenade"}, {"en"}, function(locale, value) return "Demolition Stockpile" end),
	create_template("talent_tree_vet_pas_020_desc_en", {"loc_talent_veteran_replenish_grenade_desc"}, {"en"}, function(locale, value) return "Replenish {amount:%s} Grenade every {time:%s} seconds."..TALENTS_Enh_desc2.ED_VET_Passive_20_rgb end), -- amount: 1, time: 60 -- Grenade(s)->Grenade -- s->seconds

	--[+ Passive 21 - Grenadier +]--
		-- create_template("talent_tree_vet_pas_021_en", {"loc_talent_veteran_extra_grenade"}, {"en"}, function(locale, value) return "Grenadier" end),
	create_template("talent_tree_vet_pas_021_desc_en", {"loc_talent_veteran_extra_grenade_description"}, {"en"}, function(locale, value) return "You can carry {ammo:%s} extra Grenade."..TALENTS_Enh_desc2.ED_VET_Passive_21_rgb end), -- ammo: 1 -- Grenade(s)->Grenade

	--[+ Passive 22 - Leave No One Behind +]--
		-- create_template("talent_tree_vet_pas_022_en", {"loc_talent_veteran_movement_speed_towards_downed"}, {"en"}, function(locale, value) return "Leave No One Behind" end),
	create_template("talent_tree_vet_pas_022_desc_en", {"loc_talent_veteran_movement_speed_towards_downed_description"}, {"en"}, function(locale, value) return "{revive_speed:%s} Assist Speed and Revive Speed. {movement_speed:%s} Movement Speed and "..COLORS_KWords.Stun_rgb.." Immunity when moving towards a Knocked Down or Incapacitated Ally. Whenever you Revive a Knocked Down Ally, they receive {damage_reduction:%s} "..COLORS_KWords.Damage_rgb.." Reduction for {duration:%s} seconds."..TALENTS_Enh_desc2.ED_VET_Passive_22_rgb end), -- revive_speed: +20%, movement_speed: +20%, damage_reduction: +33%, duration: 5 -- &->and -- s->seconds -- colors

	--[+ Passive 23 - Precision Strikes +]--
		-- create_template("talent_tree_vet_pas_023_en", {"loc_talent_veteran_increased_weakspot_damage"}, {"en"}, function(locale, value) return "Precision Strikes" end),
	create_template("talent_tree_vet_pas_023_desc_en", {"loc_talent_veteran_increased_weakspot_damage_desc"}, {"en"}, function(locale, value) return "{damage:%s} "..COLORS_KWords.Weakspot_dmg_rgb.." from Melee and Ranged attacks."..TALENTS_Enh_desc2.ED_VET_Passive_23_rgb end), -- damage: +30% -- colors

	--[+ Passive 24 - Determined +]--
		-- create_template("talent_tree_vet_pas_024_en", {"loc_talent_veteran_supression_immunity"}, {"en"}, function(locale, value) return "Determined" end),
	create_template("talent_tree_vet_pas_024_desc_en", {"loc_talent_veteran_supression_immunity_desc"}, {"en"}, function(locale, value) return "Grants Veteran immunity to Suppression dealt by Ranged enemies at all times." end),

	--[+ Passive 25 - Deadshot +]--
		-- create_template("talent_tree_vet_pas_025_en", {"loc_talent_ranged_ads_drains_stamina_boost"}, {"en"}, function(locale, value) return "Deadshot" end),
	create_template("talent_tree_vet_pas_025_desc_en", {"loc_talent_veteran_ads_drains_stamina_boost_desc"}, {"en"}, function(locale, value) return "While aiming and being above 0 "..COLORS_KWords.Stamina_rgb.." you Gain:\n{crit_chance:%s} "..COLORS_KWords.Crit_chance_rgb..",\n{sway_reduction:%s} Sway Reduction,\n"..COLORS_Numbers.pc_p19_rgb.." Spread Reduction and\n"..COLORS_Numbers.pc_p12_rgb.." Recoil Reduction,\nbut Drains:\n{stamina:%s} "..COLORS_KWords.Stamina_rgb.." per second and\n{stamina_per_shot:%s} an additional "..COLORS_KWords.Stamina_rgb.." per shot."..TALENTS_Enh_desc2.ED_VET_Passive_25_rgb end), -- crit_chance: +25%, sway_reduction: +60%, stamina: 0.75, stamina_per_shot: 0.25 -- rewrite on_Aim! -- &->and -- colors

	--[+ Passive 26 - Born Leader +]--
		-- create_template("talent_tree_vet_pas_026_en", {"loc_talent_veteran_allies_share_toughness"}, {"en"}, function(locale, value) return "Born Leader" end),
	create_template("talent_tree_vet_pas_026_desc_en", {"loc_talent_veteran_allies_share_toughness_description"}, {"en"}, function(locale, value) return "{toughness:%s} of any "..COLORS_KWords.Toughness_rgb.." you replenish is restored to Allies in Coherency."..TALENTS_Enh_desc2.ED_VET_Passive_26_rgb end), -- toughness: 15% -- rewrite -- colors

	--[+ Passive 27 - Keep Their Heads Down! +]--
		-- create_template("talent_tree_vet_pas_027_en", {"loc_talent_veteran_increase_suppression"}, {"en"}, function(locale, value) return "Keep Their Heads Down!" end),
	create_template("talent_tree_vet_pas_027_desc_en", {"loc_talent_veteran_increase_suppression_desc"}, {"en"}, function(locale, value) return "{suppression:%s} Ranged Attack Suppression."..TALENTS_Enh_desc2.ED_VET_Passive_27_rgb end), -- suppression: +50%

	--[+ Passive 28 - Reciprocity +]--
		-- create_template("talent_tree_vet_pas_028_en", {"loc_talent_veteran_dodging_grants_crit"}, {"en"}, function(locale, value) return "Reciprocity" end),
	create_template("talent_tree_vet_pas_028_desc_en", {"loc_talent_veteran_dodging_grants_crit_description"}, {"en"}, function(locale, value) return "{crit_chance:%s} "..COLORS_KWords.Crit_hit_rgb.." Chance for {duration:%s} seconds on successful Dodge. Stacks {stacks:%s} times."..TALENTS_Enh_desc2.ED_VET_Passive_28_rgb end), -- crit_chance: +5%, duration: 8, stacks: 5 -- s->seconds -- colors

	--[+ Passive 29 - Duck and Dive +]--
		-- create_template("talent_tree_vet_pas_029_en", {"loc_talent_ranger_stamina_on_ranged_dodge"}, {"en"}, function(locale, value) return "Duck and Dive" end),
	create_template("talent_tree_vet_pas_029_desc_en", {"loc_talent_veteran_stamina_on_ranged_dodge_desc"}, {"en"}, function(locale, value) return "{stamina:%s} of Max "..COLORS_KWords.Stamina_rgb.." on avoiding Ranged Attacks by Dodging, Sprinting or Sliding."..TALENTS_Enh_desc2.ED_VET_Passive_29_rgb end), -- stamina: +30%

	--[+ Passive 30 - Fully Loaded +]--
		-- create_template("talent_tree_vet_pas_030_en", {"loc_talent_veteran_ammo_increase"}, {"en"}, function(locale, value) return "Fully Loaded" end),
	create_template("talent_tree_vet_pas_030_desc_en", {"loc_talent_veteran_ammo_increase_desc"}, {"en"}, function(locale, value) return "{ammo:%s} Ammo."..TALENTS_Enh_desc2.ED_VET_Passive_30_rgb end), -- ammo: +25%

	--[+ Passive 31 - Tactical Awareness +]--
		-- create_template("talent_tree_vet_pas_031_en", {"loc_talent_veteran_elite_kills_reduce_cooldown"}, {"en"}, function(locale, value) return "Tactical Awareness" end),
	create_template("talent_tree_vet_pas_031_desc_en", {"loc_talent_veteran_elite_kills_reduce_cooldown_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.n_minus_rgb.."{duration:%s} seconds to "..COLORS_KWords.Combat_ability_cd_rgb.." on killing a Specialist enemy."..TALENTS_Enh_desc2.ED_VET_Passive_31_rgb end), -- duration: 6 -- rewrite -- s->seconds -- colors

	--[+ Passive 32 - Desperado +]--
		-- create_template("talent_tree_vet_pas_032_en", {"loc_talent_veteran_increased_melee_crit_chance_and_melee_finesse"}, {"en"}, function(locale, value) return "Desperado" end),
	create_template("talent_tree_vet_pas_032_desc_en", {"loc_talent_veteran_increased_melee_crit_chance_and_melee_finesse_desc"}, {"en"}, function(locale, value) return "{crit_chance:%s} Melee "..COLORS_KWords.Crit_hit_chance_rgb.." and\n{finesse:%s} Melee "..COLORS_KWords.Finesse_rgb.." Bonus."..TALENTS_Enh_desc2.ED_VET_Passive_32_rgb end), -- crit_chance: +10%, finesse: +25%, -- &->and -- colors

	--[+ Passive 33 - Shock Trooper +]--
		-- create_template("talent_tree_vet_pas_033_en", {"loc_talent_veteran_no_ammo_consumption_on_lasweapon_crit"}, {"en"}, function(locale, value) return "Shock Trooper" end),
	create_template("talent_tree_vet_pas_033_desc_en", {"loc_talent_veteran_no_ammo_consumption_on_lasweapon_crit_desc"}, {"en"}, function(locale, value) return COLORS_KWords.Crit_hits_rgb.." with Las-weapons consume no Ammo."..TALENTS_Enh_desc2.ED_VET_Passive_33_rgb end), -- colors

	--[+ Passive 34 - Superiority Complex +]--
		-- create_template("talent_tree_vet_pas_034_en", {"loc_talent_veteran_increase_damage_vs_elites"}, {"en"}, function(locale, value) return "Superiority Complex" end),
	create_template("talent_tree_vet_pas_034_desc_en", {"loc_talent_veteran_increase_damage_vs_elites_desc"}, {"en"}, function(locale, value) return "{damage:%s} Base "..COLORS_KWords.Damage_rgb.." to Elite Enemies."..TALENTS_Enh_desc2.ED_VET_Passive_34_rgb end), -- damage: +15% -- -() -- colors

	--[+ Passive 35 - Iron Will +]--
		-- create_template("talent_tree_vet_pas_035_en", {"loc_talent_veteran_block_break_gives_tdr"}, {"en"}, function(locale, value) return "Iron Will" end),
	create_template("talent_tree_vet_pas_035_desc_en", {"loc_talent_veteran_tdr_on_high_toughness_desc"}, {"en"}, function(locale, value) return "{toughness_damage_reduction:%s} "..COLORS_KWords.Toughness_dmg_red_rgb.." if above {toughness_percent:%s} "..COLORS_KWords.Toughness_rgb.."."..TALENTS_Enh_desc2.ED_VET_Passive_35_rgb end), -- toughness_damage_reduction: +50%, toughness_percent: 75% -- colors

	--[+ Passive 36 - Demolition Team +]--
		-- create_template("talent_tree_vet_pas_036_en", {"loc_talent_ranger_grenade_on_elite_kills_coop"}, {"en"}, function(locale, value) return "Demolition Team" end),
	create_template("talent_tree_vet_pas_036_desc_en", {"loc_talent_veteran_grenade_on_elite_kills_coop_desc"}, {"en"}, function(locale, value) return "{chance:%s} chance to replenish a Grenade when you or an Ally in Coherency kills an Elite or Specialist Enemy."..TALENTS_Enh_desc2.ED_VET_Passive_36_rgb end), -- chance: 5%

	--[+ Passive 37 - Exploit Weakness +]--
		-- create_template("talent_tree_vet_pas_037_en", {"loc_talent_veteran_crits_rend"}, {"en"}, function(locale, value) return "Exploit Weakness" end),
	create_template("talent_tree_vet_pas_037_desc_en", {"loc_talent_veteran_crits_rend_description"}, {"en"}, function(locale, value) return "{rending_multiplier:%s} "..COLORS_KWords.Brittleness_rgb.." is applied to the target by Melee "..COLORS_KWords.Crit_hits_rgb..". Stacks {max_stacks:%s} times and lasts {duration:%s} seconds."..TALENTS_Enh_desc2.ED_VET_Passive_37_rgb end), -- rending_multiplier: 10%, max_stacks: 2, duration: 5 -- s->seconds -- colors

	--[+ Passive 38 - Onslaught +]--
		-- create_template("talent_tree_vet_pas_038_en", --  {"loc_talent_veteran_continous_hits_apply_rending"}, {"en"}, function(locale, value) return "Onslaught" end),
	create_template("talent_tree_vet_pas_038_desc_en", {"loc_talent_veteran_continous_hits_apply_rending_description"}, {"en"}, function(locale, value) return "{rending_multiplier:%s} "..COLORS_KWords.Brittleness_rgb.." is applied to the target for {duration:%s} seconds by Continuous hits to a Single target. Stacks {max_stacks:%s} times."..TALENTS_Enh_desc2.ED_VET_Passive_38_rgb end), -- rending_multiplier: 2.5%, duration: 5, max_stacks: 16 -- rewrite -- colors

	--[+ Passive 39 - Trench Fighter Drill +]--
		-- create_template("talent_tree_vet_pas_039_en", {"loc_talent_veteran_attack_speed"}, {"en"}, function(locale, value) return "Trench Fighter Drill" end),
	create_template("talent_tree_vet_pas_039_desc_en", {"loc_talent_veteran_attack_speed_description"}, {"en"}, function(locale, value) return "{melee_attack_speed:%s} Melee Attack Speed."..TALENTS_Enh_desc2.ED_VET_Passive_39_rgb end), -- melee_attack_speed: +10%

	--[+ Passive 40 - Skirmisher +]--
		-- create_template("talent_tree_vet_pas_040_en", {"loc_talent_veteran_damage_damage_after_sprinting"}, {"en"}, function(locale, value) return "Skirmisher" end),
	create_template("talent_tree_vet_pas_040_desc_en", {"loc_talent_veteran_damage_damage_after_sprinting_desc"}, {"en"}, function(locale, value) return "{base_damage:%s} to all Base "..COLORS_KWords.Damage_rgb.." for {duration:%s} seconds after Sprinting. Stacks {stacks:%s} times."..TALENTS_Enh_desc2.ED_VET_Passive_40_rgb end), -- base_damage: +5%, duration: 8, stacks: 5 -- s->seconds -- colors

	--[+ Passive 41 - Competitive Urge +]--
		-- create_template("talent_tree_vet_pas_041_en", {"loc_talent_veteran_ally_kills_increase_damage"}, {"en"}, function(locale, value) return "Competitive Urge" end),
	create_template("talent_tree_vet_pas_041_desc_en", {"loc_talent_veteran_ally_kills_increase_damage_description"}, {"en"}, function(locale, value) return "Whenever an Ally kills an Enemy you have a {proc_chance:%s} chance to gain for {duration:%s} seconds:\n{damage:%s} Base "..COLORS_KWords.Damage_rgb..",\n{melee_impact:%s} Melee "..COLORS_KWords.Impact_rgb.." and\n{suppression:%s} Suppression dealt."..TALENTS_Enh_desc2.ED_VET_Passive_41_rgb end), -- proc_chance: 2.5%, damage: +20%, melee_impact: +20%, suppression: +20%, duration: 8 -- rewrite -- &->and -- s->seconds -- colors

	--[+ Passive 42 - Rending Strikes +]--
		-- create_template("talent_tree_vet_pas_042_en", {"loc_talent_veteran_rending_bonus"}, {"en"}, function(locale, value) return "Rending Strikes" end),
	create_template("talent_tree_vet_pas_042_desc_en", {"loc_talent_veteran_rending_bonus_desc"}, {"en"}, function(locale, value) return "{rending_multiplier:%s} "..COLORS_KWords.Rending_rgb.." to all weapons."..TALENTS_Enh_desc2.ED_VET_Passive_42_rgb end), -- rending_multiplier: +10% -- colors

	--[+ Passive 43 - Bring it Down! +]--
		-- create_template("talent_tree_vet_pas_043_en", {"loc_talent_veteran_big_game_hunter"}, {"en"}, function(locale, value) return "Bring it Down!" end),
	create_template("talent_tree_vet_pas_043_desc_en", {"loc_talent_veteran_big_game_hunter_description"}, {"en"}, function(locale, value) return "{damage:%s} "..COLORS_KWords.Damage_rgb.." to Ogryns and Monstrosities."..TALENTS_Enh_desc2.ED_VET_Passive_43_rgb end), -- damage: +20% -- &->and -- () -- colors

--[+ ++OGRYN++ +]--
--[+ +BLITZ+ +]--
	--[+ Blitz 0 - Big Box of Hurt +]--
		-- create_template("talent_tree_ogr_blitz0_000_en", {"loc_ability_ogryn_grenade_box"}, {"en"}, function(locale, value) return "Big Box of Hurt" end),
	create_template("talent_tree_ogr_blitz0_000_desc_en", {"loc_ability_ogryn_grenade_box_description"}, {"en"}, function(locale, value) return "Throw a box of Grenades with great strength and enthusiasm for High "..COLORS_KWords.Damage_rgb.." against a Single Enemy."..TALENTS_Enh_desc2.ED_OGR_Blitz_0_rgb end), -- colors

	--[+ Blitz 1 - Big Friendly Rock +]--
		-- create_template("talent_tree_ogr_blitz1_000_en", {"loc_ability_ogryn_friend_rock"}, {"en"}, function(locale, value) return "Big Friendly Rock" end),
	create_template("talent_tree_ogr_blitz1_000_desc_en", {"loc_ability_ogryn_friend_rock_desc"}, {"en"}, function(locale, value) return "Toss a big rock or hunk of junk at a Single Enemy. You pick up a new rock every {recharge:%s} seconds and can hold up to {max_charges:%s} rocks at a time."..TALENTS_Enh_desc2.ED_OGR_Blitz_1_rgb end), -- recharge: 45, max_charges: 4 -- rewrite -- s->seconds

	--[+ Blitz 2 - Bombs Away! +]--
		-- create_template("talent_tree_ogr_blitz2_000_en", {"loc_talent_bonebreaker_grenade_super_armor_explosion"}, {"en"}, function(locale, value) return "Bombs Away!" end),
	create_template("talent_tree_ogr_blitz2_000_desc_en", {"loc_talent_bonebreaker_grenade_super_armor_explosion_desc"}, {"en"}, function(locale, value) return "Throw a box of Grenades with great strength and enthusiasm to deal High "..COLORS_KWords.Damage_rgb.." to a Single Enemy.\nHitting an Enemy causes the box to break open, releasing {num_grenades:%s} grenades around the target.\nThis is an augmented version of {talent_name:%s}."..TALENTS_Enh_desc2.ED_OGR_Blitz_2_rgb end), -- num_grenades: 6, talent_name: Big Box of Hurt -- colors

	--[+ Blitz 3 - Frag Bomb +]--
		-- create_template("talent_tree_ogr_blitz3_000_en", {"loc_ability_ogryn_grenade_demolition"}, {"en"}, function(locale, value) return "Frag Bomb" end),
	create_template("talent_tree_ogr_blitz3_000_desc_en", {"loc_ability_ogryn_grenade_demolition_desc"}, {"en"}, function(locale, value) return "Throw an Ogryn-sized (the only proper kind!) "..COLORS_Numbers.Frag_gren_rgb.." with a {radius:%s} meters blast radius, dealing increased "..COLORS_KWords.Damage_rgb.." at the center."..TALENTS_Enh_desc2.ED_OGR_Blitz_3_rgb end), -- radius: 16 -- m->meters -- colors

--[+ +AURA+ +]--
	--[+ Aura 0 - Intimidating Presence +]--
		-- create_template("talent_tree_ogr_aura0_000_en", {"loc_talent_ogryn_2_base_4"}, {"en"}, function(locale, value) return "Intimidating Presence" end),
	create_template("talent_tree_ogr_aura0_000_desc_en", {"loc_talent_ogryn_2_base_4_description_new"}, {"en"}, function(locale, value) return "{damage:%s} Heavy Melee Attack "..COLORS_KWords.Damage_rgb.." for you and Allies in Coherency."..TALENTS_Enh_desc2.ED_OGR_Aura_0_rgb end), -- damage: +7.5% -- colors

	--[+ Aura 1 - Bonebreaker's Aura +]--
		-- create_template("talent_tree_ogr_aura1_000_en", {"loc_talent_damage_aura"}, {"en"}, function(locale, value) return "Bonebreaker's Aura" end),
	create_template("talent_tree_ogr_aura1_000_desc_en", {"loc_talent_damage_aura_improved"}, {"en"}, function(locale, value) return "{damage:%s} Heavy Melee Attack "..COLORS_KWords.Damage_rgb.." for you and Allies in Coherency.\n\nThis is an augmented version of {talent_name:%s}."..TALENTS_Enh_desc2.ED_OGR_Aura_1_rgb end), -- damage: +10%, talent_name: Intimidating Presence -- colors

	--[+ Aura 2 - Stay Close! +]--
		-- create_template("talent_tree_ogr_aura2_000_en", {"loc_talent_ogryn_toughness_regen_aura"}, {"en"}, function(locale, value) return "Stay Close!" end),
	create_template("talent_tree_ogr_aura2_000_desc_en", {"loc_talent_ogryn_toughness_regen_aura_desc"}, {"en"}, function(locale, value) return "{toughness_regen_rate_modifier:%s} "..COLORS_KWords.Toughness_rgb.." Replenishment for you and Allies in Coherency."..TALENTS_Enh_desc2.ED_OGR_Aura_2_rgb end), -- toughness_regen_rate_modifier: +25% -- colors

	--[+ Aura 3 - Coward Culling +]--
		-- create_template("talent_tree_ogr_aura3_000_en", {"loc_talent_ogryn_damage_vs_suppressed"}, {"en"}, function(locale, value) return "Coward Culling" end),
	create_template("talent_tree_ogr_aura3_000_desc_en", {"loc_talent_ogryn_damage_vs_suppressed_desc"}, {"en"}, function(locale, value) return "{damage:%s} "..COLORS_KWords.Damage_rgb.." against Suppressed Enemies for you and Allies in Coherency."..TALENTS_Enh_desc2.ED_OGR_Aura_3_rgb end), -- damage:+20%. -- colors

--[+ +ABILITIES+ +]--
	--[+ Ability 0 - Bull Rush +]--
		-- create_template("talent_tree_ogr_abil0_000_en", {"loc_ability_ogryn_charge"}, {"en"}, function(locale, value) return "Bull Rush" end),
	create_template("talent_tree_ogr_abil0_000_desc_en", {"loc_ability_ogryn_charge_description_new"}, {"en"}, function(locale, value) return "Charge forward with great force, knocking back enemies and "..COLORS_KWords.Staggering_rgb.." them. Gain {attack_speed:%s} Attack Speed and {move_speed:%s} Movement Speed for {duration:%s} seconds. Charge is stopped on collision with Carapace Armoured Enemies, Unyielding Enemies and Monstrosities.\n\nBase Cooldown: {cooldown:%s} seconds."..TALENTS_Enh_desc2.ED_OGR_Ability_0_rgb end), -- attack_speed: +25%, move_speed: +25%, duration: 5, cooldown: 30 -- s->seconds -- colors

	--[+ Ability 1 - Indomitable +]-- 
		-- create_template("talent_tree_ogr_abil1_000_en", {"loc_talent_ogryn_bull_rush_distance"}, {"en"}, function(locale, value) return "Indomitable" end),
	create_template("talent_tree_ogr_abil1_000_desc_en", {"loc_talent_ogryn_bull_rush_distance_desc"}, {"en"}, function(locale, value) return "Charge forward with great force, knocking back Enemies and "..COLORS_KWords.Staggering_rgb.." them. Gain {attack_speed:%s} Attack Speed and {move_speed:%s} Movement Speed for {duration:%s} seconds. Charge is stopped only on collision with Monstrosities.\nBase Cooldown: {cooldown:%s} seconds.\nThis is an augmented version of {talent_name:%s} with an increased charge distance of {distance:%s}."..TALENTS_Enh_desc2.ED_OGR_Ability_1_rgb end), -- attack_speed: +25%, move_speed: +25%, duration: 5, cooldown: 30, talent_name: Bull Rush, distance: 100% -- s->seconds -- colors

	--[+ Ability 1-1 - Stomping Boots +]--
		-- create_template("talent_tree_ogr_abil1_001_en", {"loc_talent_ogryn_toughness_on_bull_rush"}, {"en"}, function(locale, value) return "Stomping Boots" end),
	create_template("talent_tree_ogr_abil1_001_desc_en", {"loc_talent_ogryn_toughness_on_bull_rush_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." replenishes per Enemy Hit with {ability:%s}."..TALENTS_Enh_desc2.ED_OGR_Ability_1_1_rgb end), -- toughness: +10%, ability: Indomitable -- rewrite -- colors

	--[+ Ability 1-2 - Trample +]--
		-- create_template("talent_tree_ogr_abil1_002_en", {"loc_talent_ogryn_ability_charge_trample"}, {"en"}, function(locale, value) return "Trample" end),
	create_template("talent_tree_ogr_abil1_002_desc_en", {"loc_talent_ogryn_ability_charge_trample_desc"}, {"en"}, function(locale, value) return "For each Enemy hit by {talent_name:%s} you gain a Stack of "..COLORS_KWords.Trample_rgb.." which increases Base "..COLORS_KWords.Damage_rgb.." by {damage:%s} for {duration:%s} seconds. Max Stacks {stack:%s}."..TALENTS_Enh_desc2.ED_OGR_Ability_1_2_rgb end), -- talent_name: Bull Rush, damage: +2%, duration: 8, stack: 25 -- rewrite -- s->seconds -- colors

	--[+ Ability 1-3 - Pulverise +]--
		-- create_template("talent_tree_ogr_abil1_003_en", {"loc_talent_ogryn_bleed_on_bull_rush"}, {"en"}, function(locale, value) return "Pulverise" end),
	create_template("talent_tree_ogr_abil1_003_desc_en", {"loc_talent_ogryn_bleed_on_bull_rush_desc"}, {"en"}, function(locale, value) return "{stacks:%s} Stacks of "..COLORS_KWords.Bleed_rgb.." are applied to enemies hit by {ability:%s}."..TALENTS_Enh_desc2.ED_OGR_Ability_1_3_rgb end), -- stacks: 5, ability: Indomitable -- rewrite -- colors

	--[+ Ability 2 - Loyal Protector +]--
		-- create_template("talent_tree_ogr_abil2_000_en", {"loc_ability_ogryn_taunt_shout"}, {"en"}, function(locale, value) return "Loyal Protector" end),
	create_template("talent_tree_ogr_abil2_000_desc_en", {"loc_ability_ogryn_taunt_shout_desc"}, {"en"}, function(locale, value) return "Taunt Enemies within {radius:%s} meters, making them Attack only you for {duration:%s} seconds.\n\nBase Cooldown: {cooldown:%s} seconds."..TALENTS_Enh_desc2.ED_OGR_Ability_2_rgb end), -- radius: 8, duration: 15, cooldown: 45 -- m->meters -- s->seconds

	--[+ Ability 2-1 - Valuable Distraction +]--
		-- create_template("talent_tree_ogr_abil2_001_en", {"loc_talent_ogryn_taunt_damage_taken_increase"}, {"en"}, function(locale, value) return "Valuable Distraction" end),
	create_template("talent_tree_ogr_abil2_001_desc_en", {"loc_talent_ogryn_taunt_damage_taken_increase_description"}, {"en"}, function(locale, value) return "{base_damage:%s} Base "..COLORS_KWords.Damage_rgb.." taken from all sources by enemies affected by {talent_name:%s} for "..COLORS_Numbers.n_15_rgb.." seconds."..TALENTS_Enh_desc2.ED_OGR_Ability_2_1_rgb end), -- talent_name: Loyal Protector, base_damage: +25% -- rewrite -- colors

	--[+ Ability 2-2 - Go Again +]--
		-- create_template("talent_tree_ogr_abil2_002_en", {"loc_talent_ogryn_taunt_stagger_cd"}, {"en"}, function(locale, value) return "Go Again!" end),
	create_template("talent_tree_ogr_abil2_002_desc_en", {"loc_talent_ogryn_taunt_stagger_cd_description"}, {"en"}, function(locale, value) return "{cooldown_reduction:%s} "..COLORS_KWords.Cd_rgb.." of your {talent_name:%s} is replenished per enemy "..COLORS_KWords.Staggered_rgb.."."..TALENTS_Enh_desc2.ED_OGR_Ability_2_2_rgb end), -- cooldown_reduction: 2.5%, talent_name: Loyal Protector -- rewrite -- colors

	--[+ Ability 2-3 - Big Lungs +]--
		-- create_template("talent_tree_ogr_abil2_003_en", {"loc_talent_ogryn_taunt_radius_increase"}, {"en"}, function(locale, value) return "Big Lungs" end),
	create_template("talent_tree_ogr_abil2_003_desc_en", {"loc_talent_ogryn_taunt_radius_increase_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.n_plus_rgb.."{radius:%s} Radius to {talent_name:%s}."..TALENTS_Enh_desc2.ED_OGR_Ability_2_3_rgb end), -- talent_name: Loyal Protector, radius: 50% -- colors

	--[+ Ability 3 - Point-Blank Barrage +]--
		-- create_template("talent_tree_ogr_abil3_000_en", {"loc_talent_ogryn_combat_ability_special_ammo"}, {"en"}, function(locale, value) return "Point-Blank Barrage" end),
	create_template("talent_tree_ogr_abil3_000_desc_en", {"loc_talent_ogryn_combat_ability_special_ammo_new_desc"}, {"en"}, function(locale, value) return "Swaps to and reloads your Ranged Weapon. For the next {duration:%s} seconds you have {ranged_attack_speed:%s} Rate of Fire and {reload_speed:%s} Reload Speed, {reduced_move_penalty:%s} Reduced Braced Movement Speed penalties, and gain {damage:%s} Close Range Damage. Base Cooldown {cooldown:%s} seconds."..TALENTS_Enh_desc2.ED_OGR_Ability_3_rgb end), -- ranged_attack_speed: +25%, reload_speed: +70%, duration: 10, cooldown: 80 -- s->seconds

	--[+ Ability 3-1 - Bullet Bravado +]--
		-- create_template("talent_tree_ogr_abil3_001_en", {"loc_talent_ogryn_special_ammo_toughness"}, {"en"}, function(locale, value) return "Bullet Bravado" end),
	create_template("talent_tree_ogr_abil3_001_desc_en", {"loc_talent_ogryn_special_ammo_toughness_on_shot_and_reload_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." replenishes for every Shot Fired and {toughness_reload:%s} "..COLORS_KWords.Toughness_rgb.." on each Reload while {ability:%s} is active."..TALENTS_Enh_desc2.ED_OGR_Ability_3_1_rgb end), -- ability: Point-Blank Barrage, toughness: +2%, toughness_reload: +10% -- rewrite -- colors

	--[+ Ability 3-2 - Hail of Fire +]--
		-- create_template("talent_tree_ogr_abil3_002_en", {"loc_talent_ogryn_special_ammo_armor_pen"}, {"en"}, function(locale, value) return "Hail of Fire" end),
	create_template("talent_tree_ogr_abil3_002_desc_en", {"loc_talent_ogryn_special_ammo_armor_pen_desc"}, {"en"}, function(locale, value) return "{rending_multiplier:%s} "..COLORS_KWords.Rending_rgb.." to your Ranged Attacks while {ability:%s} is active."..TALENTS_Enh_desc2.ED_OGR_Ability_3_2_rgb end), -- rending_multiplier: +30%, ability: Point-Blank Barrage -- colors

	--[+ Ability 3-3 - Light 'em Up +]--
		-- create_template("talent_tree_ogr_abil3_003_en", {"loc_talent_ogryn_special_ammo_fire_shots"}, {"en"}, function(locale, value) return "Light 'em Up" end),
	create_template("talent_tree_ogr_abil3_003_desc_en", {"loc_talent_ogryn_special_ammo_fire_shots_desc"}, {"en"}, function(locale, value) return "Ranged Attacks apply {stacks:%s} Stacks of "..COLORS_KWords.Burn_rgb.." while {ability:%s} is active."..TALENTS_Enh_desc2.ED_OGR_Ability_3_3_rgb end), -- stacks: 2, ability: Point-Blank Barrage -- colors

--[+ +KEYSTONES+ +]--
	--[+ Keystone 1 - Heavy Hitter +]--
		-- create_template("talent_tree_ogr_keys1_000_en", {"loc_talent_ogryn_passive_heavy_hitter"}, {"en"}, function(locale, value) return "Heavy Hitter" end),
	create_template("talent_tree_ogr_keys1_000_desc_en", {"loc_talent_ogryn_passive_heavy_hitter_desc"}, {"en"}, function(locale, value) return "{damage:%s} "..COLORS_KWords.Damage_rgb.." for {duration:%s} seconds on Heavy Attack Hit. Stacks {stacks:%s} times."..TALENTS_Enh_desc2.ED_OGR_Keystone_1_rgb end), -- damage: +5%, duration: 7.5, stacks: 5 -- s->seconds -- colors

	--[+ Keystone 1-1 - Just Getting Started +]--
		-- create_template("talent_tree_ogr_keys1_001_en", {"loc_talent_ogryn_heavy_hitter_max_stacks_improves_attack_speed"}, {"en"}, function(locale, value) return "Just Getting Started" end),
	create_template("talent_tree_ogr_keys1_001_desc_en", {"loc_talent_ogryn_heavy_hitter_max_stacks_improves_attack_speed_description"}, {"en"}, function(locale, value) return "{attack_speed:%s} Attack Speed while {talent_name:%s} is at {stacks:%s} Stacks."..TALENTS_Enh_desc2.ED_OGR_Keystone_1_1_rgb end), -- talent_name: Heavy Hitter, stacks: 5, attack_speed: +10%

	--[+ Keystone 1-2 - Unstoppable +]--
		-- create_template("talent_tree_ogr_keys1_002_en", {"loc_talent_ogryn_heavy_hitter_max_stacks_improves_toughness"}, {"en"}, function(locale, value) return "Unstoppable" end),
	create_template("talent_tree_ogr_keys1_002_desc_en", {"loc_talent_ogryn_heavy_hitter_max_stacks_improves_toughness_description"}, {"en"}, function(locale, value) return "{toughness_melee_replenish:%s} "..COLORS_KWords.Toughness_rgb.." replenished from Melee Kills while {talent_name:%s} is at {stacks:%s} Stacks."..TALENTS_Enh_desc2.ED_OGR_Keystone_1_2_rgb end), -- talent_name: Heavy Hitter, stacks: 5, toughness_melee_replenish: +100% -- colors

	--[+ Keystone 1-3 - Brutish Momentum +]--
		-- create_template("talent_tree_ogr_keys1_003_en", {"loc_talent_ogryn_heavy_hitter_light_attacks_refresh"}, {"en"}, function(locale, value) return "Brutish Momentum" end),
	create_template("talent_tree_ogr_keys1_003_desc_en", {"loc_talent_ogryn_heavy_hitter_light_attacks_refresh_description"}, {"en"}, function(locale, value) return "{talent_name:%s} Duration is refreshed by Light Attacks."..TALENTS_Enh_desc2.ED_OGR_Keystone_1_3_rgb end), -- talent_name: Heavy Hitter

	--[+ Keystone 2 - Feel No Pain +]--
		-- create_template("talent_tree_ogr_keys2_000_en", {"loc_talent_ogryn_carapace_armor"}, {"en"}, function(locale, value) return "Feel No Pain" end),
	create_template("talent_tree_ogr_keys2_000_desc_en", {"loc_talent_ogryn_carapace_armor_any_damage_desc"}, {"en"}, function(locale, value) return "You are blessed with {stacks:%s} Stacks of "..COLORS_KWords.Feel_no_pain_rgb..". Each Stack grants:\n{toughness_regen:%s} "..COLORS_KWords.Toughness_rgb.." Replenishment and\n{damage_reduction:%s} "..COLORS_KWords.Damage_rgb.." Reduction.\nTaking "..COLORS_KWords.Damage_rgb.." removes one Stack. Stacks are restored every {duration:%s} seconds."..TALENTS_Enh_desc2.ED_OGR_Keystone_2_rgb end), -- stacks: 10, toughness_regen: +2.5%, damage_reduction: +2.5%, duration: 3 -- s->seconds -- colors

	--[+ Keystone 2-1 - Pained Outburst +]--
		-- create_template("talent_tree_ogr_keys2_001_en", {"loc_talent_ogryn_carapace_armor_trigger_on_zero_stacks"}, {"en"}, function(locale, value) return "Pained Outburst" end),
	create_template("talent_tree_ogr_keys2_001_desc_en", {"loc_talent_ogryn_carapace_armor_trigger_on_zero_stacks_desc"}, {"en"}, function(locale, value) return "{toughness_replenish:%s} "..COLORS_KWords.Toughness_rgb.." replenished when {talent_name:%s} reaches "..COLORS_Numbers.n_0_rgb.." Stacks. It also creates an explosion that deals no Damage but "..COLORS_KWords.Staggers_rgb.." surrounding enemies.\n\nThis effect can occur once every {cooldown:%s} seconds."..TALENTS_Enh_desc2.ED_OGR_Keystone_2_1_rgb end), -- talent_name: Feel No Pain, toughness_replenish: +20%, cooldown: 30 -- s->seconds -- colors

	--[+ Keystone 2-2 - Strongest! +]--
		-- create_template("talent_tree_ogr_keys2_002_en", {"loc_talent_ogryn_carapace_armor_add_stack_on_push"}, {"en"}, function(locale, value) return "Strongest!" end),
	create_template("talent_tree_ogr_keys2_002_desc_en", {"loc_talent_ogryn_carapace_armor_add_stack_on_push_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.n_1_rgb.." Stack of {talent_name:%s} is restored by Pushing enemies."..TALENTS_Enh_desc2.ED_OGR_Keystone_2_2_rgb end), -- talent_name: Feel No Pain

	--[+ Keystone 2-3 - Toughest! +]--
		-- create_template("talent_tree_ogr_keys2_003_en", {"loc_talent_ogryn_carapace_armor_more_toughness"}, {"en"}, function(locale, value) return "Toughest!" end),
	create_template("talent_tree_ogr_keys2_003_desc_en", {"loc_talent_ogryn_carapace_armor_more_toughness_desc"}, {"en"}, function(locale, value) return "{toughness_regen:%s} "..COLORS_KWords.Toughness_rgb.." replenishment per stack is granted by {talent_name:%s}."..TALENTS_Enh_desc2.ED_OGR_Keystone_2_3_rgb end), -- talent_name: Feel No Pain, toughness_regen: +2.5% -- colors

	--[+ Keystone 3 - Burst Limiter Override +]--
		-- create_template("talent_tree_ogr_keys3_000_en", {"loc_talent_ogryn_chance_to_not_consume_ammo"}, {"en"}, function(locale, value) return "Burst Limiter Override" end),
	create_template("talent_tree_ogr_keys3_000_desc_en", {"loc_talent_ogryn_chance_to_not_consume_ammo_desc"}, {"en"}, function(locale, value) return "{proc_chance:%s} chance of triggering "..COLORS_KWords.Lucky_bullet_rgb.." and not consuming Ammo when making Ranged Attacks."..TALENTS_Enh_desc2.ED_OGR_Keystone_3_rgb end), -- proc_chance: 8% -- colors

	--[+ Keystone 3-1 - Maximum Firepower +]--
		-- create_template("talent_tree_ogr_keys3_001_en", {"loc_talent_ogryn_leadbelcher_grant_cooldown_reduction"}, {"en"}, function(locale, value) return "Maximum Firepower" end),
	create_template("talent_tree_ogr_keys3_001_desc_en", {"loc_talent_ogryn_leadbelcher_grant_cooldown_reduction_desc"}, {"en"}, function(locale, value) return "{cooldown_reduction:%s} "..COLORS_KWords.Ability_cd_rgb.." Reduction for {duration:%s} seconds when "..COLORS_KWords.Lucky_bullet_rgb.." triggers."..TALENTS_Enh_desc2.ED_OGR_Keystone_3_1_rgb end), -- cooldown_reduction: +200%, duration: 2 -- s->seconds -- colors

	--[+ Keystone 3-2 - Good Shootin' +]--
		-- create_template("talent_tree_ogr_keys3_002_en", {"loc_talent_ogryn_critical_leadbelcher"}, {"en"}, function(locale, value) return "Good Shootin'" end),
	create_template("talent_tree_ogr_keys3_002_desc_en", {"loc_talent_ogryn_critical_leadbelcher_desc"}, {"en"}, function(locale, value) return "The shot that triggers "..COLORS_KWords.Lucky_bullet_rgb.." is a guaranteed "..COLORS_KWords.Crit_rgb.." (if it Hits)."..TALENTS_Enh_desc2.ED_OGR_Keystone_3_2_rgb end), -- colors

	--[+ Keystone 3-3 - More Burst Limiter Overrides! +]--
		-- create_template("talent_tree_ogr_keys3_003_en", {"loc_talent_ogryn_increased_leadbelcher_chance"}, {"en"}, function(locale, value) return "More Burst Limiter Overrides!" end),
	create_template("talent_tree_ogr_keys3_003_desc_en", {"loc_talent_ogryn_increased_leadbelcher_chance_desc"}, {"en"}, function(locale, value) return "Your chance of triggering "..COLORS_KWords.Lucky_bullet_rgb.." is increased to {proc_chance:%s}." end), -- proc_chance: 12% -- rewrite -- colors

--[+ +PASSIVES+ +]--
	--[+ Passive 1 - Furious +]--
		-- create_template("talent_tree_ogr_pas_001_en", {"loc_talent_ogryn_damage_per_enemy_hit_previous"}, {"en"}, function(locale, value) return "Furious" end),
	create_template("talent_tree_ogr_pas_001_desc_en", {"loc_talent_ogryn_damage_per_enemy_hit_previous_desc"}, {"en"}, function(locale, value) return "{damage:%s} "..COLORS_KWords.Damage_rgb.." on your next Melee Attack is gained for each Enemy you hit during the same Heavy Melee Attack."..TALENTS_Enh_desc2.ED_OGR_Passive_1_rgb end), -- damage: +2.5% -- colors

	--[+ Passive 2 - Reloaded and Ready +]--
		-- create_template("talent_tree_ogr_pas_002_en", {"loc_talent_ogryn_ranged_damage_on_reload"}, {"en"}, function(locale, value) return "Reloaded and Ready" end),
	create_template("talent_tree_ogr_pas_002_desc_en", {"loc_talent_ogryn_ranged_damage_on_reload_desc"}, {"en"}, function(locale, value) return "{damage:%s} Ranged "..COLORS_KWords.Damage_rgb.." for {duration:%s} seconds on Reload."..TALENTS_Enh_desc2.ED_OGR_Passive_2_rgb end), -- damage :+15%, duration: 8 -- s->seconds -- colors

	--[+ Passive 3 - The Best Defence +]--
		-- create_template("talent_tree_ogr_pas_003_en", {"loc_talent_ogryn_toughness_on_multiple"}, {"en"}, function(locale, value) return "The Best Defence" end),
	create_template("talent_tree_ogr_pas_003_desc_en", {"loc_talent_ogryn_toughness_on_multiple_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." replenishes after hitting multiple Enemies with a single Heavy Melee Attack."..TALENTS_Enh_desc2.ED_OGR_Passive_3_rgb end), -- toughness: 20% -- colors

	--[+ Passive 4 - Heavyweight +]--
		-- create_template("talent_tree_ogr_pas_004_en", {"loc_talent_ogryn_ogryn_fighter"}, {"en"}, function(locale, value) return "Heavyweight" end),
	create_template("talent_tree_ogr_pas_004_desc_en", {"loc_talent_ogryn_ogryn_fighter_desc"}, {"en"}, function(locale, value) return "{damage:%s} "..COLORS_KWords.Damage_rgb.." against Bulwarks, Crushers, Plague Ogryns and Reapers. Also receive {damage_reduction:%s} "..COLORS_KWords.Damage_rgb.." Reduction against the same."..TALENTS_Enh_desc2.ED_OGR_Passive_4_rgb end), -- damage: +30%, damage_reduction: +30% -- colors

	--[+ Passive 5 - Steady Grip +]--
		-- create_template("talent_tree_ogr_pas_005_en", {"loc_talent_ogryn_toughness_regen_while_bracing"}, {"en"}, function(locale, value) return "Steady Grip" end),
	create_template("talent_tree_ogr_pas_005_desc_en", {"loc_talent_ogryn_toughness_regen_while_bracing_desc"}, {"en"}, function(locale, value) return "{toughness_regen:%s} "..COLORS_KWords.Toughness_rgb.." Regeneration while bracing your Ranged weapon."..TALENTS_Enh_desc2.ED_OGR_Passive_5_rgb end), -- toughness_regen: +3% -- colors

	--[+ Passive 6 - Smash 'Em! +]--
		-- create_template("talent_tree_ogr_pas_006_en", {"loc_talent_ogryn_toughness_on_single_heavy"}, {"en"}, function(locale, value) return "Smash 'Em!" end),
	create_template("talent_tree_ogr_pas_006_desc_en", {"loc_talent_ogryn_toughness_on_single_heavy_desc"}, {"en"}, function(locale, value) return "{toughness:%s} "..COLORS_KWords.Toughness_rgb.." replenishes after hitting a single Enemy with a Heavy Melee Attack."..TALENTS_Enh_desc2.ED_OGR_Passive_6_rgb end), -- toughness: 20% -- colors

	--[+ Passive 7 - Lynchpin +]--
		-- create_template("talent_tree_ogr_pas_007_en", --  {"loc_talent_ogryn_coherency_toughness_increase"}, {"en"}, function(locale, value) return "Lynchpin" end),
	create_template("talent_tree_ogr_pas_007_desc_en", {"loc_talent_ogryn_coherency_toughness_increase_desc"}, {"en"}, function(locale, value) return "{toughness_multiplier:%s} "..COLORS_KWords.Toughness_rgb.." replenish while in Coherency."..TALENTS_Enh_desc2.ED_OGR_Passive_7_rgb end), -- toughness_multiplier: +50% -- colors

	--[+ Passive 8 - Slam +]--
		-- create_template("talent_tree_ogr_pas_008_en", {"loc_talent_ogryn_melee_stagger"}, {"en"}, function(locale, value) return "Slam" end),
	create_template("talent_tree_ogr_pas_008_desc_en", {"loc_talent_ogryn_melee_stagger_desc"}, {"en"}, function(locale, value) return "{stagger:%s} "..COLORS_KWords.Impact_rgb.." bonus on Melee Attacks."..TALENTS_Enh_desc2.ED_OGR_Passive_8_rgb end), -- stagger: +25% -- colors

	--[+ Passive 9 - Soften Them Up +]--
		-- create_template("talent_tree_ogr_pas_009_en", {"loc_talent_ogryn_targets_recieve_damage_increase_debuff"}, {"en"}, function(locale, value) return "Soften Them Up" end),
	create_template("talent_tree_ogr_pas_009_desc_en", {"loc_talent_ogryn_targets_recieve_damage_increase_debuff_desc"}, {"en"}, function(locale, value) return "{damage:%s} "..COLORS_KWords.Damage_rgb.." for {duration:%s} seconds is dealt to enemies you hit."..TALENTS_Enh_desc2.ED_OGR_Passive_9_rgb end), -- damage: +15%, duration: 5 -- colors

	--[+ Passive 10 - Crunch! +]--
		-- create_template("talent_tree_ogr_pas_010_en", --   {"loc_talent_ogryn_fully_charged_attacks_gain_damage_and_stagger"}, {"en"}, function(locale, value) return "Crunch!" end),
	create_template("talent_tree_ogr_pas_010_desc_en", {"loc_talent_ogryn_fully_charged_attacks_gain_damage_and_stagger_desc"}, {"en"}, function(locale, value) return "On fully charged Melee Attack:\n{damage:%s} "..COLORS_KWords.Damage_rgb.." bonus and\n{stagger:%s} "..COLORS_KWords.Impact_rgb.." bonus."..TALENTS_Enh_desc2.ED_OGR_Passive_10_rgb end), -- damage: +40%, stagger: +40% -- &->and -- colors

	--[+ Passive 11 - Batter +]--
		-- create_template("talent_tree_ogr_pas_011_en", {"loc_talent_ogryn_bleed_on_multiple_hit"}, {"en"}, function(locale, value) return "Batter" end),
	create_template("talent_tree_ogr_pas_011_desc_en", {"loc_talent_ogryn_bleed_on_multiple_hit_desc"}, {"en"}, function(locale, value) return "Inflict {stacks:%s} Stacks of "..COLORS_KWords.Bleed_rgb.." on Heavy Melee Hit. Up to "..COLORS_Numbers.n_16_rgb.." Max "..COLORS_KWords.Bleed_rgb.." Stacks on a target."..TALENTS_Enh_desc2.ED_OGR_Passive_11_rgb end), -- stacks: +4 -- colors

	--[+ Passive 12 - Pacemaker +]--
		-- create_template("talent_tree_ogr_pas_012_en", {"loc_talent_ogryn_reload_speed_on_multiple_hits"}, {"en"}, function(locale, value) return "Pacemaker" end),
	create_template("talent_tree_ogr_pas_012_desc_en", {"loc_talent_ogryn_reload_speed_on_multiple_hits_desc"}, {"en"}, function(locale, value) return "{reload_speed:%s} Reload Speed for {duration:%s} seconds when hitting {multi_hit:%s} or more enemies with a single attack."..TALENTS_Enh_desc2.ED_OGR_Passive_12_rgb end), -- multi_hit: 5, reload_speed: +25%, duration: 5 -- s->seconds

	--[+ Passive 13 - Ammo Stash +]--
		-- create_template("talent_tree_ogr_pas_013_en", {"loc_talent_ogryn_increased_ammo"}, {"en"}, function(locale, value) return "Ammo Stash" end),
	create_template("talent_tree_ogr_pas_013_desc_en", {"loc_talent_ogryn_increased_ammo_desc"}, {"en"}, function(locale, value) return "Increase your Maximum Ammo reserve by {max_ammo:%s}, rounds down." end), -- max_ammo: +25% -- rewrite

	--[+ Passive 14 - Hard Knocks +]--
		-- create_template("talent_tree_ogr_pas_014_en", {"loc_talent_ogryn_big_bully_heavy_hits"}, {"en"}, function(locale, value) return "Hard Knocks" end),
	create_template("talent_tree_ogr_pas_014_desc_en", {"loc_talent_ogryn_big_bully_heavy_hits_desc"}, {"en"}, function(locale, value) return "{damage:%s} "..COLORS_KWords.Damage_rgb.." to your next Heavy Melee Attack on Enemy "..COLORS_KWords.Stagger_rgb..". Stacks {stacks:%s} times. Lasts {duration:%s} seconds. The larger the Enemy, the more Stacks are earned."..TALENTS_Enh_desc2.ED_OGR_Passive_14_rgb end), -- damage: +1%, stacks: 25, duration: 10 -- s->seconds -- colors

	--[+ Passive 15 - Too Stubborn to Die +]--
		-- create_template("talent_tree_ogr_pas_015_en", {"loc_talent_ogryn_toughness_gain_increase_on_low_health"}, {"en"}, function(locale, value) return "Too Stubborn to Die" end),
	create_template("talent_tree_ogr_pas_015_desc_en", {"loc_talent_ogryn_toughness_gain_increase_on_low_health_desc"}, {"en"}, function(locale, value) return "{toughness_multiplier:%s} "..COLORS_KWords.Toughness_rgb.." Replenishment while below {health:%s} "..COLORS_KWords.Health_rgb.."."..TALENTS_Enh_desc2.ED_OGR_Passive_15_rgb end), -- toughness_multiplier: +100%, health: 33% -- colors

	--[+ Passive 16 - Delight in Destruction +]--
		-- create_template("talent_tree_ogr_pas_016_en", {"loc_talent_ogryn_damage_reduction_per_bleed"}, {"en"}, function(locale, value) return "Delight in Destruction" end),
	create_template("talent_tree_ogr_pas_016_desc_en", {"loc_talent_ogryn_damage_reduction_per_bleed_desc"}, {"en"}, function(locale, value) return "{damage_reduction:%s} "..COLORS_KWords.Damage_rgb.." Resistance per "..COLORS_KWords.Bleeding_rgb.." Enemy in Melee range. Stacks {max_stacks:%s} times. Up to "..COLORS_Numbers.pc_48_rgb.."."..TALENTS_Enh_desc2.ED_OGR_Passive_16_rgb end), -- damage_reduction: +8%, max_stacks: 6 -- colors

	--[+ Passive 17 - Attention Seeker +]--
		-- create_template("talent_tree_ogr_pas_017_en", {"loc_talent_ranged_enemies_taunt"}, {"en"}, function(locale, value) return "Attention Seeker" end),
	create_template("talent_tree_ogr_pas_017_desc_en", {"loc_talent_ranged_enemies_taunt_description"}, {"en"}, function(locale, value) return "Blocking or Pushing Enemies Taunts them for {duration:%s} seconds."..TALENTS_Enh_desc2.ED_OGR_Passive_17_rgb end), -- duration: 8 -- s->seconds

	--[+ Passive 18 - Get Stuck In +]--
		-- create_template("talent_tree_ogr_pas_018_en", {"loc_talent_ogryn_bull_rush_movement_speed"}, {"en"}, function(locale, value) return "Get Stuck In" end),
	create_template("talent_tree_ogr_pas_018_desc_en", {"loc_talent_ogryn_ability_movement_speed_desc"}, {"en"}, function(locale, value) return "On activating your "..COLORS_KWords.Combat_ability_rgb..", you and Allies in Coherency gain {movement_speed:%s} Movement Speed and are also Immune to "..COLORS_KWords.Stuns_rgb.." and Suppression for {time:%s} seconds."..TALENTS_Enh_desc2.ED_OGR_Passive_18_rgb end), -- movement_speed: +20%, time: 4 -- &->and -- s->seconds -- colors

	--[+ Passive 19 - Towering Presence +]--
		-- create_template("talent_tree_ogr_pas_019_en", {"loc_talent_ogryn_bigger_coherency_radius"}, {"en"}, function(locale, value) return "Towering Presence" end),
	create_template("talent_tree_ogr_pas_019_desc_en", {"loc_talent_ogryn_bigger_coherency_radius_desc"}, {"en"}, function(locale, value) return "{radius:%s} Coherency radius."..TALENTS_Enh_desc2.ED_OGR_Passive_19_rgb end), -- radius: +50%

	--[+ Passive 20 - Unstoppable Momentum +]--
		-- create_template("talent_tree_ogr_pas_020_en", {"loc_talent_ogryn_ranged_kill_grant_movement_speed"}, {"en"}, function(locale, value) return "Unstoppable Momentum" end),
	create_template("talent_tree_ogr_pas_020_desc_en", {"loc_talent_ogryn_ranged_kill_grant_movement_speed_desc"}, {"en"}, function(locale, value) return "{movement_speed:%s} Movement Speed for {duration:%s} seconds on Ranged kill."..TALENTS_Enh_desc2.ED_OGR_Passive_20_rgb end), -- movement_speed: +20%, duration: 2 -- s->seconds

	--[+ Passive 21 - No Stopping Me! +]--
		-- create_template("talent_tree_ogr_pas_021_en", {"loc_talent_ogryn_windup_is_uninterruptible"}, {"en"}, function(locale, value) return "No Stopping Me!" end),
	create_template("talent_tree_ogr_pas_021_desc_en", {"loc_talent_ogryn_windup_is_uninterruptible_desc"}, {"en"}, function(locale, value) return "Become Uninterruptible while charging Heavy Melee Attacks."..TALENTS_Enh_desc2.ED_OGR_Passive_21_rgb end),

	--[+ Passive 22 - Dominate +]--
		-- create_template("talent_tree_ogr_pas_022_en", {"loc_talent_ogryn_rending_on_elite_kills"}, {"en"}, function(locale, value) return "Dominate" end),
	create_template("talent_tree_ogr_pas_022_desc_en", {"loc_talent_ogryn_rending_on_elite_kills_desc"}, {"en"}, function(locale, value) return "{rending_multiplier:%s} "..COLORS_KWords.Rending_rgb.." for {duration:%s} seconds on Elite kill."..TALENTS_Enh_desc2.ED_OGR_Passive_22_rgb end), -- rending_multiplier: +10%, duration: 10 -- s->seconds -- colors

	--[+ Passive 23 - Payback Time +]--
		-- create_template("talent_tree_ogr_pas_023_en", {"loc_talent_ogryn_revenge_damage"}, {"en"}, function(locale, value) return "Payback Time" end),
	create_template("talent_tree_ogr_pas_023_desc_en", {"loc_talent_ogryn_revenge_damage_desc"}, {"en"}, function(locale, value) return "{damage:%s} "..COLORS_KWords.Damage_rgb.." for {duration:%s} seconds after being Hit by a Melee Attack."..TALENTS_Enh_desc2.ED_OGR_Passive_23_rgb end), -- damage: +20%, duration: 5 -- s->seconds -- colors

	--[+ Passive 24 - Bruiser +]--
		-- create_template("talent_tree_ogr_pas_024_en", {"loc_talent_ogryn_cooldown_on_elite_kills"}, {"en"}, function(locale, value) return "Bruiser" end),
	create_template("talent_tree_ogr_pas_024_desc_en", {"loc_talent_ogryn_cooldown_on_elite_kills_desc"}, {"en"}, function(locale, value) return "{cooldown:%s} "..COLORS_KWords.Combat_ability_cd_rgb.." Reduction when you or an Ally in Coherency kill an Elite Enemy."..TALENTS_Enh_desc2.ED_OGR_Passive_24_rgb end), -- cooldown: 4% -- colors

	--[+ Passive 25 - Big Boom +]--
		-- create_template("talent_tree_ogr_pas_025_en", {"loc_talent_ogryn_increase_explosion_radius"}, {"en"}, function(locale, value) return "Big Boom" end),
	create_template("talent_tree_ogr_pas_025_desc_en", {"loc_talent_ogryn_increase_explosion_radius_desc"}, {"en"}, function(locale, value) return "Increase explosion radius by {explosion_radius:%s}."..TALENTS_Enh_desc2.ED_OGR_Passive_25_rgb end), -- explosion_radius: +22.5%

	--[+ Passive 26 - Massacre +]--
		-- create_template("talent_tree_ogr_pas_026_en", {"loc_talent_ogryn_crit_chance_on_kill"}, {"en"}, function(locale, value) return "Massacre" end),
	create_template("talent_tree_ogr_pas_026_desc_en", {"loc_talent_ogryn_crit_chance_on_kill_desc"}, {"en"}, function(locale, value) return "{crit_chance:%s} "..COLORS_KWords.Crit_chance_rgb.." for {duration:%s} seconds is granted by killing an enemy. Stacks {max_stacks:%s} times."..TALENTS_Enh_desc2.ED_OGR_Passive_26_rgb end), -- crit_chance: +1%, duration: 6, max_stacks: 8 -- rewrite -- s->seconds -- colors

	--[+ Passive 27 - Implacable +]--
		-- create_template("talent_tree_ogr_pas_027_en", {"loc_talent_ogryn_windup_reduces_damage_taken"}, {"en"}, function(locale, value) return "Implacable" end),
	create_template("talent_tree_ogr_pas_027_desc_en", {"loc_talent_ogryn_windup_reduces_damage_taken_desc"}, {"en"}, function(locale, value) return "{damage_taken_multiplier:%s} "..COLORS_KWords.Damage_rgb.." Reduction while charging Melee Attacks."..TALENTS_Enh_desc2.ED_OGR_Passive_27_rgb end), -- damage_taken_multiplier: +15% -- colors

	--[+ Passive 28 - No Pushover +]--
		-- create_template("talent_tree_ogr_pas_028_en", {"loc_talent_ogryn_blocking_reduces_push_cost"}, {"en"}, function(locale, value) return "No Pushover" end),
	create_template("talent_tree_ogr_pas_028_desc_en", {"loc_talent_ogryn_empowered_pushes_desc"}, {"en"}, function(locale, value) return "{push_impact_modifier:%s} "..COLORS_KWords.Stagger_rgb.." for your pushes. Can only trigger once every {cooldown:%s} seconds."..TALENTS_Enh_desc2.ED_OGR_Passive_28_rgb end), -- push_impact_modifier: 250%, cooldown: 8 -- s->seconds -- colors

	--[+ Passive 29 - Won't Give In +]--
		-- create_template("talent_tree_ogr_pas_029_en", {"loc_talent_ogryn_tanky_with_downed_allies"}, {"en"}, function(locale, value) return "Won't Give In" end),
	create_template("talent_tree_ogr_pas_029_desc_en", {"loc_talent_ogryn_tanky_with_downed_allies_desc"}, {"en"}, function(locale, value) return "{damage_taken:%s} "..COLORS_KWords.Damage_rgb.." Reduction for each Knocked Down or Incapacitated Ally within {range:%s} meters."..TALENTS_Enh_desc2.ED_OGR_Passive_29_rgb end), -- damage_taken: +20%, range: 20 -- colors

	--[+ Passive 30 - Mobile Emplacement +]--
		-- create_template("talent_tree_ogr_pas_030_en", {"loc_talent_ogryn_bracing_reduces_damage_taken"}, {"en"}, function(locale, value) return "Mobile Emplacement" end),
	create_template("talent_tree_ogr_pas_030_desc_en", {"loc_talent_ogryn_bracing_reduces_damage_taken_desc"}, {"en"}, function(locale, value) return "You take {damage_taken_multiplier:%s} reduced "..COLORS_KWords.Damage_rgb.." while bracing a Ranged Weapon."..TALENTS_Enh_desc2.ED_OGR_Passive_30_rgb end), -- damage_taken_multiplier:-20.00%. -- colors

}

--[+ Reload localization templates when the mod is enabled or disabled +]--
function mod.on_enabled()
	if WTL then
		WTL.reload_templates()
	end
end

function mod.on_disabled()
	if WTL then
		WTL.reload_templates()
	end
end

--[+ Return the localization templates +]--
return localization_templates
