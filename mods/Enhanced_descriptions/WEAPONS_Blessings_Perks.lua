---@diagnostic disable: undefined-global

local mod = get_mod("Enhanced_descriptions")

--[+ Loading colors of Keywords and Numbers +]--
COLORS_Numbers = mod:io_dofile("Enhanced_descriptions/COLORS_Numbers")
-- All Numbers are taken from this file by adding to the value "COLORS_Numbers.".
-- For example, in the game the Damage value is taken from the variable {damage:%s}, which in the file "COLORS_Numbers.lua" is replaced by dmg_var_rgb and to add the highlighted number to the text, we write the damage number to the text as "..COLORS_Numbers.dmg_var_rgb..".

COLORS_KWords = mod:io_dofile("Enhanced_descriptions/Loc_EN/COLORS_KWords")
-- All Keywords are taken from this file by adding to the value "COLORS_KWords.".
-- For example, in the file "COLORS_KWords.lua" the word Damage is replaced by Damage_rgb and to add the highlighted word to the text we write it as "..COLORS_KWords.Damage_rgb.".

	--[+ Translations +]-- Add a line with a file of Keywords translated into your language.
COLORS_KWords_fr = mod:io_dofile("Enhanced_descriptions/Loc_FR/COLORS_KWords_fr") -- French


--[+ Function to create a localization template +]--
local function create_template(id, loc_keys, locales, handle_func)
	return { id = id, loc_keys = loc_keys, locales = locales, handle_func = handle_func }
end

--[+ Define localization templates +]--
local localization_templates = {
-- Duplicate the line and translate. For example:
--		create_template("weap_bb0_ext_en", {"loc_trait_melee_common_wield_increased_armored_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." vs Flak Armoured Enemies" end),
--		create_template("weap_bb0_ext_YOURLANGUAGE", {"loc_trait_melee_common_wield_increased_armored_damage_desc"}, {"YOURLANGUAGE"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." к "..COLORS_KWords.Damage_rgb_YOURLANGUAGE.." против врагов в противоосколочной броне." end), <- Don't forget the comma at the end!

--[+ ++WEAPON - PERKS++ +]--
	--[+ Melee +]--
		--[+ +Damage vs Flak +]--
	create_template("weap_bb0_ext_en", {"loc_trait_melee_common_wield_increased_armored_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." vs Flak Armoured Enemies" end),
			--[+ French +]--
	create_template("weap_bb0_ext_fr", {"loc_trait_melee_common_wield_increased_armored_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords_fr.Damage_rgb_fr.." de Mélée vs Ennemies en armure légère" end),

		--[+ +Damage vs Maniacs +]--
	create_template("weap_bb1_ext_en", {"loc_trait_melee_common_wield_increased_berserker_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." vs Maniacs" end),
			--[+ French +]--
	create_template("weap_bb1_ext_fr", {"loc_trait_melee_common_wield_increased_berserker_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords_fr.Damage_rgb_fr.." de Mélée vs Maniaques" end),

		--[+ +Damage vs Infested +]--
	create_template("weap_bb2_ext_en", {"loc_trait_melee_common_wield_increased_disgustingly_resilient_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." vs Infested Enemies" end),
			--[+ French +]--
	create_template("weap_bb2_ext_fr", {"loc_trait_melee_common_wield_increased_disgustingly_resilient_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords_fr.Damage_rgb_fr.." de Mélée vs Ennemies infestés" end),

		--[+ +Damage vs Unyielding +]--
	create_template("weap_bb3_ext_en", {"loc_trait_melee_common_wield_increased_resistant_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." vs Unyielding Enemies" end),
			--[+ French +]--
	create_template("weap_bb3_ext_fr", {"loc_trait_melee_common_wield_increased_resistant_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords_fr.Damage_rgb_fr.." de Mélée vs Ennemies implacables" end),

		--[+ +Damage vs Carapace +]--
	create_template("weap_bb4_ext_en", {"loc_trait_melee_common_wield_increased_super_armor_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." vs Carapace Enemies" end),
			--[+ French +]--
	create_template("weap_bb4_ext_fr", {"loc_trait_melee_common_wield_increased_super_armor_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords_fr.Damage_rgb_fr.." de Mélée vs Ennemies en armure carapace" end),

		--[+ +Damage vs Unarmoured +]--
	create_template("weap_bb5_ext_en", {"loc_trait_melee_common_wield_increased_unarmored_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." vs Unarmoured Enemies" end),
			--[+ French +]--
	create_template("weap_bb5_ext_fr", {"loc_trait_melee_common_wield_increased_unarmored_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords_fr.Damage_rgb_fr.." de Mélée vs Ennemies sans armure" end),

		--[+ +Crit chance +]--
	create_template("weap_bb6_ext_en", {"loc_trait_melee_common_wield_increase_critical_hit_chance_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." Melee "..COLORS_KWords.Crit_chance_rgb end),
			--[+ French +]--
	create_template("weap_bb6_ext_fr", {"loc_trait_melee_common_wield_increase_critical_hit_chance_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords_fr.Crit_chance_rgb_fr.." en Mélée"	end),

		--[+ +Crit damage +]--
	create_template("weap_bb7_ext_en", {"loc_trait_melee_common_wield_wield_increase_critical_strike_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_critdmg_var_rgb.." Melee "..COLORS_KWords.Crit_hit_color_rgb end),
			--[+ French +]--
	create_template("weap_bb7_ext_fr", {"loc_trait_melee_common_wield_wield_increase_critical_strike_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_critdmg_var_rgb.." "..COLORS_KWords_fr.Crit_hit_color_rgb_fr.." de Mélée" end),

		--[+ +Damage vs Groaners and Poxwalkers +]--
	create_template("weap_bb8_ext_en", {"loc_trait_melee_common_wield_increase_horde_enemy_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." Melee "..COLORS_KWords.Damage_rgb.." vs Groaners and Poxwalkers" end),
			--[+ French +]--
	create_template("weap_bb8_ext_fr", {"loc_trait_melee_common_wield_increase_horde_enemy_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords_fr.Damage_rgb_fr.." de Mélée vs Grogneurs et Scrofuleux" end),

		--[+ +Damage vs Elites +]--
	create_template("weap_bb9_ext_en", {"loc_trait_melee_common_wield_increase_elite_enemy_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." Melee "..COLORS_KWords.Damage_rgb.." vs Elites" end),
			--[+ French +]--
	create_template("weap_bb9_ext_fr", {"loc_trait_melee_common_wield_increase_elite_enemy_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords_fr.Damage_rgb_fr.." de Mélée vs Élites" end),

		--[+ +Damage vs Specialists +]--
	create_template("weap_bb10_ext_en", {"loc_trait_melee_common_wield_increase_special_enemy_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." Melee "..COLORS_KWords.Damage_rgb.." vs Specialists" end),
			--[+ French +]--
	create_template("weap_bb10_ext_fr", {"loc_trait_melee_common_wield_increase_special_enemy_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords_fr.Damage_rgb_fr.." de Mélée vs Spécialistes" end),

		--[+ +Stamina +]--
	create_template("weap_bb11_ext_en", {"loc_trait_melee_common_wield_increase_stamina_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_stam_var_rgb.." "..COLORS_KWords.Stamina_rgb end),
			--[+ French +]--
	create_template("weap_bb11_ext_fr", {"loc_trait_melee_common_wield_increase_stamina_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_stam_var_rgb.." "..COLORS_KWords_fr.Stamina_rgb_fr end),

		--[+ +Weakspot damage +]--
	create_template("weap_bb12_ext_en", {"loc_trait_melee_common_wield_increase_weakspot_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_wkspdmg_var_rgb.." Melee "..COLORS_KWords.Weakspot_dmg_rgb end),
			--[+ French +]--
	create_template("weap_bb12_ext_fr", {"loc_trait_melee_common_wield_increase_weakspot_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_wkspdmg_var_rgb.." "..COLORS_KWords_fr.Weakspot_dmg_rgb_fr.." en Mélée" end),

		--[+ +Block Efficiency +]--
	create_template("weap_bb13_ext_en", {"loc_trait_melee_common_wield_reduce_block_cost_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_rbc_rgb.." Block Efficiency" end),
			--[+ French +]--
	create_template("weap_bb13_ext_fr", {"loc_trait_melee_common_wield_reduce_block_cost_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_rbc_rgb.." d'éfficacité de blocage" end),

		--[+ -Cost for Sprinting +]--
	create_template("weap_bb14_ext_en", {"loc_gadget_sprint_cost_reduction_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.m_bcm_rgb.." "..COLORS_KWords.Stamina_rgb.." Cost for Sprinting" end),
			--[+ French +]--
	create_template("weap_bb14_ext_fr", {"loc_gadget_sprint_cost_reduction_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.m_bcm_rgb.." de coût d'"..COLORS_KWords_fr.Stamina_rgb_fr.." de la course" end),


	--[+ Ranged +]--
		--[+ +Damage vs Flak +]--
	create_template("weap_db0_ext_en", {"loc_trait_ranged_common_wield_armored_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." vs Flak Armoured Enemies" end),
			--[+ French +]--
	create_template("weap_db0_ext_fr", {"loc_trait_ranged_common_wield_armored_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords_fr.Damage_rgb_fr.." de Distance vs Ennemies en armure légère" end),

		--[+ +Damage vs Maniacs +]--
	create_template("weap_db1_ext_en", {"loc_trait_ranged_common_wield_berserker_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." vs Maniacs" end),
			--[+ French +]--
	create_template("weap_db1_ext_fr", {"loc_trait_ranged_common_wield_berserker_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords_fr.Damage_rgb_fr.." de Distance vs Maniaques" end),

		--[+ +Damage vs Infested +]--
	create_template("weap_db2_ext_en", {"loc_trait_ranged_common_wield_disgustinglyresilient_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." vs Infested Enemies" end),
			--[+ French +]--
	create_template("weap_db2_ext_fr", {"loc_trait_ranged_common_wield_disgustinglyresilient_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords_fr.Damage_rgb_fr.." de Distance vs Ennemies infestés" end),

		--[+ +Damage vs Unyielding +]--
	create_template("weap_db3_ext_en", {"loc_trait_ranged_common_wield_resistant_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." vs Unyielding Enemies" end),
			--[+ French +]--
	create_template("weap_db3_ext_fr", {"loc_trait_ranged_common_wield_resistant_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords_fr.Damage_rgb_fr.." de Distance vs Ennemies implacables" end),

		--[+ +Damage vs Carapace +]--
	create_template("weap_db4_ext_en", {"loc_trait_ranged_common_wield_superarmor_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." vs Carapace Enemies" end),
			--[+ French +]--
	create_template("weap_db4_ext_fr", {"loc_trait_ranged_common_wield_superarmor_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords_fr.Damage_rgb_fr.." de Distance vs Ennemies en armure carapace" end),

		--[+ +Damage vs Unarmoured +]--
	create_template("weap_db5_ext_en", {"loc_trait_ranged_common_wield_unarmored_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." vs Unarmoured Enemies" end),
			--[+ French +]--
	create_template("weap_db5_ext_fr", {"loc_trait_ranged_common_wield_unarmored_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords_fr.Damage_rgb_fr.." de Distance vs Ennemies sans armure" end),

		--[+ +Crit chance +]--
	create_template("weap_db6_ext_en", {"loc_trait_ranged_common_wield_increase_crit_chance_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." Ranged "..COLORS_KWords.Crit_chance_r_rgb end),
			--[+ French +]--
	create_template("weap_db6_ext_fr", {"loc_trait_ranged_common_wield_increase_crit_chance_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords_fr.Crit_chance_r_rgb_fr.." à Distance" end),

		--[+ +Crit damage +]--
	create_template("weap_db7_ext_en", {"loc_trait_ranged_common_wield_wield_increase_critical_strike_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_critdmg_var_rgb.." Ranged "..COLORS_KWords.Crit_hit_color_rgb end),
			--[+ French +]--
	create_template("weap_db7_ext_fr", {"loc_trait_ranged_common_wield_wield_increase_critical_strike_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_critdmg_var_rgb.." "..COLORS_KWords_fr.Crit_hit_color_rgb_fr.." de Distance" end),

		--[+ +Damage vs Elites +]--
	create_template("weap_db8_ext_en", {"loc_trait_ranged_common_wield_increase_elite_enemy_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." Ranged "..COLORS_KWords.Damage_rgb.." vs Elites" end),
			--[+ French +]--
	create_template("weap_db8_ext_fr", {"loc_trait_ranged_common_wield_increase_elite_enemy_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords_fr.Damage_rgb_fr.." de Distance vs Élites" end),

		--[+ +Damage vs Groaners and Poxwalkers +]--
	create_template("weap_db9_ext_en", {"loc_trait_ranged_common_wield_increase_horde_enemy_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." Ranged "..COLORS_KWords.Damage_rgb.." vs Groaners and Poxwalkers" end),
			--[+ French +]--
	create_template("weap_db9_ext_fr", {"loc_trait_ranged_common_wield_increase_horde_enemy_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords_fr.Damage_rgb_fr.." de Distance vs Grogneurs et Scrofuleux" end),

		--[+ +Damage vs Specialists +]--
	create_template("weap_db10_ext_en", {"loc_trait_ranged_common_wield_increase_special_enemy_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." Ranged "..COLORS_KWords.Damage_rgb.." vs Specialists" end),
			--[+ French +]--
	create_template("weap_db10_ext_fr", {"loc_trait_ranged_common_wield_increase_special_enemy_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords_fr.Damage_rgb_fr.." de Distance vs Spécialistes" end),

		--[+ +Stamina +]--
	create_template("weap_db11_ext_en", {"loc_trait_ranged_common_wield_increase_stamina_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_stam_var_rgb.." "..COLORS_KWords.Stamina_rgb.." when Weapon is Active" end),
			--[+ French +]--
	create_template("weap_db11_ext_fr", {"loc_trait_ranged_common_wield_increase_stamina_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_stam_var_rgb.." "..COLORS_KWords_fr.Stamina_rgb_fr end),

		--[+ +Weakspot damage +]--
	create_template("weap_db12_ext_en", {"loc_trait_ranged_common_wield_increase_weakspot_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_wkspdmg_var_rgb.." Ranged "..COLORS_KWords.Weakspot_dmg_rgb end),
			--[+ French +]--
	create_template("weap_db12_ext_fr", {"loc_trait_ranged_common_wield_increase_weakspot_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_wkspdmg_var_rgb.." "..COLORS_KWords_fr.Weakspot_dmg_rgb_fr.." à Distance" end),

		--[+ +Reload Speed +]--
	create_template("weap_db13_ext_en", {"loc_trait_ranged_common_wield_increase_reload_speed_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_reload_var_rgb.." Reload Speed" end),
			--[+ French +]--
	create_template("weap_db13_ext_fr", {"loc_trait_ranged_common_wield_increase_reload_speed_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_reload_var_rgb.." Vitesse de rechargement de l'arme" end),

--[+ ++WEAPON - BLESSINGS++ +]--
	--[+ Melee +]--
		--[+ Opportunist +]--
			-- Battle Maul and Shield, Chainaxes, Crusher, Eviscerators, Latrine Shovels, Power Maul, Shock Mauls -- 10% | 15% | 20% | 25%
	create_template("trait_bespoke_000_desc_ext_en", {"loc_trait_bespoke_armor_penetration_against_staggered_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_rending_var_rgb.." "..COLORS_KWords.Rending_rgb.." vs "..COLORS_KWords.Staggered_rgb.." Enemies."..COLORS_KWords.Rend_note_rgb end), -- rending: +25% -- colors
			--[+ French +]--
	create_template("trait_bespoke_000_desc_ext_fr", {"loc_trait_bespoke_armor_penetration_against_staggered_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_rending_var_rgb.." "..COLORS_KWords_fr.Rending_rgb_fr.." vs les Enemies qui "..COLORS_KWords_fr.Staggered_rgb_fr.." "..COLORS_KWords_fr.Rend_note_rgb_fr end),

	--[+ Bloodletter +]-- 
			-- Chainaxes -- 10 | 12 | 14 | 16
			-- Chainswords -- 11 | 12 | 13 | 14
			-- Eviscerators -- 3 | 4 | 5 | 6
	create_template("trait_bespoke_001_desc_ext_en", {"loc_trait_bespoke_bleed_on_activated_hit_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_stacks_var_rgb.." "..COLORS_KWords.Bleed_rgb.." Stacks from Special Attacks. Up to "..COLORS_Numbers.n_16_rgb.." Stacks." end), -- stacks: +16 -- +"Up to 16 Stacks." -- colors
			--[+ French +]--
	create_template("trait_bespoke_001_desc_ext_fr", {"loc_trait_bespoke_bleed_on_activated_hit_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_stacks_var_rgb.." Cumuls de "..COLORS_KWords_fr.Bleed_rgb_fr.." lors des attaques spéciales. Jusqu'à "..COLORS_Numbers.n_16_rgb.." Cumuls." end),

		--[+ Bloodthirsty +]--
			-- Chainaxes, Chainswords, Eviscerators, Force Swords -- 40% | 60% | 80% | 100%
	create_template("trait_bespoke_002_desc_ext_en", {"loc_trait_bespoke_guaranteed_melee_crit_on_activated_kill_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords.Crit_chance_rgb.." on your next Melee Attack after Special Attack Kill." end), -- crit_chance: +100% -- colors
			--[+ French +]--
	create_template("trait_bespoke_002_desc_ext_fr", {"loc_trait_bespoke_guaranteed_melee_crit_on_activated_kill_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords_fr.Crit_chance_rgb_fr.." sur votre prochaine attaque de mêlée après une élimination avec une attaque spéciale." end),

		--[+ Headtaker +]--
			-- Chainaxes, Combat Axes, Pickaxes, Tactical Axes, Thunder Hammers -- 3.5% 4% 4.5% 5% (up to +25%)
			-- Heavy Swords -- 6.5% 7% 7.5% 8% (up to +40%)
	create_template("trait_bespoke_003_desc_ext_en", {"loc_trait_bespoke_increase_power_on_hit_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on Hit. Stacks "..COLORS_Numbers.stacks_var_rgb.." times."..COLORS_KWords.Pwr_note_rgb end), -- power_level: +5%, time: 3.5, stacks: 5 -- s->seconds -- colors -- Note
			--[+ French +]--
	create_template("trait_bespoke_003_desc_ext_fr", {"loc_trait_bespoke_increase_power_on_hit_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords_fr.Strength_rgb_fr.." pour "..COLORS_Numbers.time_var_rgb.." secondes lors d'un coup. Se Cumule "..COLORS_Numbers.stacks_var_rgb.." fois."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Shock & Awe / Shock and Awe +]--
			-- Thunder Hammers -- 30% | 40% | 50% | 60%
	create_template("trait_bespoke_74_ext_en", {"loc_trait_bespoke_hit_mass_consumption_reduction_on_kill"}, {"en"}, function(locale, value) return "Shock and Awe" end), -- &->and
	create_template("trait_bespoke_75_desc_ext_en", {"loc_trait_bespoke_hit_mass_consumption_reduction_on_kill_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.m_hitmass_var_rgb.." Enemy "..COLORS_KWords.Hit_mass_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on Kill." end), -- hit_mass: -60%, time: 2 -- s->seconds -- colors
			--[+ French +]--
	create_template("trait_bespoke_75_desc_ext_fr", {"loc_trait_bespoke_hit_mass_consumption_reduction_on_kill_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.m_hitmass_var_rgb.." "..COLORS_KWords_fr.Hit_mass_rgb_fr.." ennemie pour "..COLORS_Numbers.time_var_rgb.." secondes lors d'une élimination." end),

		--[+ Slaughterer +]--
			-- Chainaxes, Cleavers, Crusher, Force Swords, Pickaxes, Power Swords, Thunder Hammers -- 5% | 6% | 7% | 8% (up to +40%)
	create_template("trait_bespoke_004_desc_ext_en", {"loc_trait_bespoke_increase_power_on_kill_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on Kill. Stacks "..COLORS_Numbers.stacks_var_rgb.." times."..COLORS_KWords.Pwr_note_rgb end), -- power_level: +5%, time: 4.5, stacks: 5 -- s->seconds -- colors -- Note
			--[+ French +]--
	create_template("trait_bespoke_004_desc_ext_fr", {"loc_trait_bespoke_increase_power_on_kill_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords_fr.Strength_rgb_fr.." pour "..COLORS_Numbers.time_var_rgb.." secondes lors d'une élimination. Se Cumule "..COLORS_Numbers.stacks_var_rgb.." fois."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Rev it up +]--
			-- Chainaxes, Chainswords, Eviscerators -- 17% | 18% | 19% | 20%
	create_template("trait_bespoke_005_desc_ext_en", {"loc_trait_bespoke_movement_speed_on_activation_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_movspd_var_rgb.." Movement Speed for "..COLORS_Numbers.time_var_rgb.." seconds on Weapon Special Activation." end), -- movement_speed: +20%, time: 2 -- s->seconds -- colors
			--[+ French +]--
	create_template("trait_bespoke_005_desc_ext_fr", {"loc_trait_bespoke_movement_speed_on_activation_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_movspd_var_rgb.." de vitesse déplacement pendant "..COLORS_Numbers.time_var_rgb.." secondes lors de l'activation spéciale d'une arme." end),

		--[+ Thrust +]--
			-- Bully Clubs, Chainaxes, Cleavers, Combat Axes, Crusher, Duelling Swords, Heavy Swords, Latrine Shovels, Pickaxes, Power Swords,Sapper Shovels, Shock Mauls, Thunder Hammers -- 5% | 10% | 15% | 20% (up to +60%)
	create_template("trait_bespoke_006_desc_ext_en", {"loc_trait_bespoke_power_bonus_based_on_charge_time_desc"}, {"en"}, function(locale, value) return "Up to "..COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb.." based on the charge time of your heavy attacks. Stacks "..COLORS_Numbers.stacks_var_rgb.." times."..COLORS_KWords.Pwr_note_rgb end), -- power_level: +5%, stacks: 3 -- colors -- Note
			--[+ French +]--
	create_template("trait_bespoke_006_desc_ext_fr", {"loc_trait_bespoke_power_bonus_based_on_charge_time_desc"}, {"fr"}, function(locale, value) return "Jusqu'à "..COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords_fr.Strength_rgb_fr.." selon le temps de charge de vos attaques puissantes. Se Cumule "..COLORS_Numbers.stacks_var_rgb.." fois."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Thunderous +]--
			-- Bully Clubs, Chainaxes, Combat Axes, Crusher, Latrine Shovels, Pickaxes, Thunder Hammers -- 1 | 2 | 3 | 4
	create_template("trait_bespoke_007_desc_ext_en", {"loc_trait_bespoke_targets_receive_rending_debuff_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.stacks_var_rgb.." Stacks of "..COLORS_Numbers.rending2_var_rgb.." "..COLORS_KWords.Brittleness_rgb.." are applied on hitting an enemy. Lasts for "..COLORS_Numbers.time_var_rgb.." seconds. Max "..COLORS_Numbers.maxstks_var_rgb.." Stacks, up to "..COLORS_Numbers.pc_40_rgb.."."..COLORS_KWords.Brtl_note_rgb end), -- stacks: 4, rending: 2.5%, time: 5, max_stacks: 16 -- rewrite -- +", up to 40%." -- colors -- Note
			--[+ French +]--
	create_template("trait_bespoke_007_desc_ext_fr", {"loc_trait_bespoke_targets_receive_rending_debuff_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.stacks_var_rgb.." Cumuls de "..COLORS_Numbers.rending2_var_rgb.." "..COLORS_KWords_fr.Brittleness_rgb_fr.." sont appliqué lors d'un coup sur un ennemie. Pendant "..COLORS_Numbers.time_var_rgb.." secondes. Jusqu'à "..COLORS_Numbers.maxstks_var_rgb.." cumuls, pour un total de "..COLORS_Numbers.pc_40_rgb.."."..COLORS_KWords_fr.Brtl_note_rgb_fr end),

		--[+ Wrath +]--
			-- Chainswords, Devil's Claw Swords, Eviscerators, Heavy Swords, Pickaxes -- 25% | 30% | 35% | 40% (up to +200%)
			-- Power Swords -- 35% | 40% | 45% | 50% (up to +250%)
	create_template("trait_bespoke_008_desc_ext_en", {"loc_trait_bespoke_chained_hits_increases_cleave_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_clv_var_rgb.." "..COLORS_KWords.Cleave_rgb.." on Hit for "..COLORS_Numbers.n_3_5_rgb.." seconds. Stacks "..COLORS_Numbers.stacks_var_rgb.." times." end), -- cleave: +40%, stacks: 5 -- +"for 3.5 seconds." -- colors
			--[+ French +]--
	create_template("trait_bespoke_008_desc_ext_fr", {"loc_trait_bespoke_chained_hits_increases_cleave_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_clv_var_rgb.." "..COLORS_KWords_fr.Cleave_rgb_fr.." lors d'un coup pendant "..COLORS_Numbers.n_3_5_rgb.." secondes. Se Cumule "..COLORS_Numbers.stacks_var_rgb.." fois." end),

		--[+ Shred +]--
			-- Chainswords, Combat Axes, Devil's Claw Swords, Duelling Swords, Eviscerators, Force Swords, Tactical Axes -- 2.5% | 3% | 3.5% | 4% (up to +20%)
	create_template("trait_bespoke_009_desc_ext_en", {"loc_trait_bespoke_chained_hits_increases_crit_chance_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." Bonus "..COLORS_KWords.Crit_chance_rgb.." on Chained Hit for "..COLORS_Numbers.n_3_5_rgb.." seconds. Stacks "..COLORS_Numbers.stacks_var_rgb.." times." end), -- crit_chance: +4%, stacks: 5 -- +"for 3.5 seconds." -- colors
			--[+ French +]--
	create_template("trait_bespoke_009_desc_ext_fr", {"loc_trait_bespoke_chained_hits_increases_crit_chance_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." de "..COLORS_KWords_fr.Crit_chance_rgb_fr.." lors d'un coup en chaîne pendant "..COLORS_Numbers.n_3_5_rgb.." secondes. Se Cumule "..COLORS_Numbers.stacks_var_rgb.." fois." end),
	
		--[+ Savage Sweep +]--
			-- Chainswords, Cleavers, Devil's Claw Swords, Eviscerators, Heavy Swords -- 140% | 160% | 180% | 200%
	create_template("trait_bespoke_010_desc_ext_en", {"loc_trait_bespoke_increased_attack_cleave_on_multiple_hits_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.n_plus_rgb..COLORS_Numbers.cleave_var_rgb.." "..COLORS_KWords.Cleave_rgb.." for your attacks for "..COLORS_Numbers.time_var_rgb.." seconds when hitting at least "..COLORS_Numbers.mult_hit_var_rgb.." enemies." end), -- multiple_hit: 3, cleave: 200%, time: 2 -- rewrite -- colors
			--[+ French +]--
	create_template("trait_bespoke_010_desc_ext_fr", {"loc_trait_bespoke_increased_attack_cleave_on_multiple_hits_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.n_plus_rgb..COLORS_Numbers.cleave_var_rgb.." de "..COLORS_KWords_fr.Cleave_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes en touchant au moins "..COLORS_Numbers.mult_hit_var_rgb.." ennemies avec une attaque." end),
	
		--[+ Rampage +]--
			-- Chainswords, Devil's Claw Swords, Duelling Swords, Eviscerators, Heavy Swords, Power Swords -- 24% | 28% | 32% | 36%
	create_template("trait_bespoke_011_desc_ext_en", {"loc_trait_bespoke_increased_melee_damage_on_multiple_hits_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.dmg_var_rgb.." increase to your "..COLORS_KWords.Strength_rgb.." of Melee attacks for "..COLORS_Numbers.time_var_rgb.." seconds when hitting at least "..COLORS_Numbers.mult_hit_var_rgb.." enemies."..COLORS_KWords.Pwr_note_rgb end), -- multiple_hit: 3, damage: 36%, time: 3 -- Damage->Strength -- colors -- Note
			--[+ French +]--
	create_template("trait_bespoke_011_desc_ext_fr", {"loc_trait_bespoke_increased_melee_damage_on_multiple_hits_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.dmg_var_rgb.." de bonus à votre "..COLORS_KWords_fr.Strength_rgb_fr.." pour vos attaques de mélées pendant "..COLORS_Numbers.time_var_rgb.." secondes en touchant au moins "..COLORS_Numbers.mult_hit_var_rgb.." ennemies avec une attaque."..COLORS_KWords_fr.Pwr_note_rgb_fr end),
	
		--[+ Devastating Strike +]--
			-- Chainswords, Cleavers, Devil's Claw Swords -- 65% | 70% | 75% | 80%
	create_template("trait_bespoke_012_desc_ext_en", {"loc_trait_bespoke_infinite_melee_cleave_on_crit_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_hitmass_var_rgb.." "..COLORS_KWords.Cleave_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on "..COLORS_KWords.Crit_hit_rgb.."." end), -- hit_mass: +80%, time: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_012_desc_ext_fr", {"loc_trait_bespoke_infinite_melee_cleave_on_crit_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_hitmass_var_rgb.." de "..COLORS_KWords_fr.Cleave_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'un "..COLORS_KWords_fr.Crit_hit_rgb_fr.."." end),
	
		--[+ Decimator +]--
			-- Combat Axes, Sapper Shovels, Tactical Axes -- 2% | 3% | 4% | 5% (up to +50%)
	create_template("trait_bespoke_013_desc_ext_en", {"loc_trait_bespoke_chained_hits_increases_power_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb.." for continuously chaining more than "..COLORS_Numbers.n_2_rgb.." attacks. Stacks "..COLORS_Numbers.stacks_var_rgb.." times."..COLORS_KWords.Pwr_note_rgb end), -- power_level: +5%, stacks: 10 -- colors -- Note
			--[+ French +]--
	create_template("trait_bespoke_013_desc_ext_fr", {"loc_trait_bespoke_chained_hits_increases_power_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." en enchaînant continuellement plus de "..COLORS_Numbers.n_2_rgb.." attaques. Se Cumule "..COLORS_Numbers.stacks_var_rgb.." fois."..COLORS_KWords_fr.Pwr_note_rgb_fr end),
	
		--[+ Brutal Momentum +]--
			-- Battle Maul and Shield, Combat Axes, Heavy Swords, Latrine Shovels, Power Maul, Power Swords, Tactical Axes -- 7.5% | 10% | 12.5% | 15%
	create_template("trait_bespoke_014_desc_ext_en", {"loc_trait_bespoke_infinite_cleave_on_weakspot_kill_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_wkspdmg_var_rgb.." "..COLORS_KWords.Weakspot_dmg_rgb..". "..COLORS_KWords.Weakspot_rgb.." Kills also ignore up to "..COLORS_Numbers.n_3_rgb.." enemies "..COLORS_KWords.Hit_mass_rgb.."." end), -- weakspot_damage: 15% -- +"up to 3" -- colors
			--[+ French +]--
	create_template("trait_bespoke_014_desc_ext_fr", {"loc_trait_bespoke_infinite_cleave_on_weakspot_kill_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_wkspdmg_var_rgb.." "..COLORS_KWords_fr.Weakspot_dmg_rgb_fr..". Les élimination sur "..COLORS_KWords_fr.Weakspot_rgb_fr.." ignore le "..COLORS_KWords_fr.Hit_mass_rgb_fr.." de "..COLORS_Numbers.n_3_rgb.." ennemies." end),
	
		--[+ Limbsplitter +]--
			-- Combat Axes, Pickaxes, Sapper Shovels, Tactical Axes -- 5 | 4.5 | 4 | 3.5
	create_template("trait_bespoke_015_desc_ext_en", {"loc_trait_bespoke_power_bonus_on_first_attack_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb.." on your First Attack every "..COLORS_Numbers.cd_var_rgb.." seconds."..COLORS_KWords.Pwr_note_rgb end), -- power_level: +60%, cooldown: 3.5 -- colors -- Note
			--[+ French +]--
	create_template("trait_bespoke_015_desc_ext_fr", {"loc_trait_bespoke_power_bonus_on_first_attack_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." sur votre première attaque toute les "..COLORS_Numbers.cd_var_rgb.." secondes."..COLORS_KWords_fr.Pwr_note_rgb_fr end),
	
		--[+ All or Nothing +]--
			-- Combat Axes, Pickaxes -- 5% | 6% | 7% | 8% (up to +40%)
			-- Sapper Shovels, Tactical Axes -- General power: 10% | 10% | 10% | 10% (up to +50%) (bugged)
	create_template("trait_bespoke_016_desc_ext_en", {"loc_trait_bespoke_power_bonus_scaled_on_stamina_desc"}, {"en"}, function(locale, value) return "Up to "..COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb..", as "..COLORS_KWords.Stamina_rgb.." depletes. Every "..COLORS_Numbers.pc_20_rgb.." of depleted Max "..COLORS_KWords.Stamina_rgb.." grants "..COLORS_Numbers.n_1_rgb.." Stack. Up to "..COLORS_Numbers.n_5_rgb..". {#color(255, 35, 5)}(bugged: Shovels and Tactical Axes +10% all tiers){#reset()}"..COLORS_KWords.Pwr_note_rgb end), -- power_level: +40% -- rewrite -- colors -- Note
			--[+ French +]--
	create_template("trait_bespoke_016_desc_ext_fr", {"loc_trait_bespoke_power_bonus_scaled_on_stamina_desc"}, {"fr"}, function(locale, value) return "Jusqu'à "..COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr..", en fonction "..COLORS_KWords_fr.Stamina_rgb_fr.." épuisée. Chaque "..COLORS_Numbers.pc_20_rgb.." de la barre d'"..COLORS_KWords_fr.Stamina_rgb_fr.." épuisée donne "..COLORS_Numbers.n_1_rgb.." cumule. Jusqu'à "..COLORS_Numbers.n_5_rgb.." cumuls. {#color(255, 35, 5)}(bug: Les pelles et haches tactiques donnent +10% peu importe le tier de la bénédiction){#reset()}"..COLORS_KWords_fr.Pwr_note_rgb_fr end),
	
		--[+ Decapitator +]--
			-- Combat Axes -- 18% | 20% | 22% | 24% (up to +120%)
	create_template("trait_bespoke_017_desc_ext_en", {"loc_trait_bespoke_stacking_rending_on_one_hit_kills_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_fin_var_rgb.." "..COLORS_KWords.Finesse_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on Enemy One-Shot. Stacks "..COLORS_Numbers.stacks_var_rgb.." times."..COLORS_KWords.Fns_note_rgb end), -- finesse: +24%, time: 5, stacks: 5 -- s->seconds -- colors -- Note
			--[+ French +]--
	create_template("trait_bespoke_017_desc_ext_fr", {"loc_trait_bespoke_stacking_rending_on_one_hit_kills_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_fin_var_rgb.." de "..COLORS_KWords_fr.Finesse_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes lorsque l'ennemie est tué en un coup. Se Cumule "..COLORS_Numbers.stacks_var_rgb.." fois."..COLORS_KWords_fr.Fns_note_rgb_fr end),
	
		--[+ Agile +]--
			-- Duelling Swords, Tactical Axes -- 2.5% | 5% | 7.5% | 10%
	create_template("trait_bespoke_018_desc_ext_en", {"loc_trait_bespoke_dodge_count_reset_on_weakspot_hit_and_weakspot_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_mel_weapsp_dmg_var_rgb.." Melee "..COLORS_KWords.Weakspot_dmg_rgb..". Refreshed Dodge Efficiency on "..COLORS_KWords.Weakspothit_rgb.."." end), -- melee_weakspot_damage: +10% -- rewrite -- colors
			--[+ French +]--
	create_template("trait_bespoke_018_desc_ext_fr", {"loc_trait_bespoke_dodge_count_reset_on_weakspot_hit_and_weakspot_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_mel_weapsp_dmg_var_rgb.." de "..COLORS_KWords_fr.Weakspot_dmg_rgb_fr.." de mélée. Actualise l'efficacité de l'esquive lors d'un "..COLORS_KWords_fr.Weakspothit_rgb_fr.."." end),

		--[+ Slaughter Spree +]--
			-- Tactical Axes -- 40% | 60% | 80% | 100%
	create_template("trait_bespoke_019_desc_ext_en", {"loc_trait_bespoke_guaranteed_melee_crit_after_crit_weakspot_kill_new_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords.Crit_chance_rgb.." to the next Melee attack within "..COLORS_Numbers.n_5_rgb.." seconds on "..COLORS_KWords.Weakspot_rgb.." "..COLORS_KWords.Crit_hit_rgb.." Kill." end), -- crit_chance: +100% -- colors
			--[+ French +]--
	create_template("trait_bespoke_019_desc_ext_fr", {"loc_trait_bespoke_guaranteed_melee_crit_after_crit_weakspot_kill_new_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." de "..COLORS_KWords_fr.Crit_chance_rgb_fr.." pour la prochaine attaque de mélée dans les "..COLORS_Numbers.n_5_rgb.." secondes suivant une élimination sur "..COLORS_KWords_fr.Weakspot_rgb_fr.." et "..COLORS_KWords_fr.Crit_rgb_fr.."." end),

		--[+ Relentless Strikes +]--
			-- Duelling Swords, Tactical Axes -- 4% | 6% | 8% | 10% (up to +50%)
	create_template("trait_bespoke_020_desc_ext_en", {"loc_trait_bespoke_power_bonus_on_same_enemy_attacks_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds when hitting the Same enemy. Stacks "..COLORS_Numbers.stacks_var_rgb.." times."..COLORS_KWords.Pwr_note_rgb end), -- power_level: +10%, time: 2, stacks: 5 -- s->seconds -- colors
			--[+ French +]--
	create_template("trait_bespoke_020_desc_ext_fr", {"loc_trait_bespoke_power_bonus_on_same_enemy_attacks_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes en attaquant le même ennemie. Se Cumule "..COLORS_Numbers.stacks_var_rgb.." fois."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Flesh Tearer +]--
			-- Combat Blades -- 5 | 6 | 7 | 8
	create_template("trait_bespoke_021_desc_ext_en", {"loc_trait_bespoke_bleed_on_crit_melee_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_stacks_var_rgb.." "..COLORS_KWords.Bleed_rgb.." Stacks on "..COLORS_KWords.Crit_hit_rgb..". Up to "..COLORS_Numbers.n_16_rgb.." Stacks." end), -- stacks: +8 -- +"Up to 16 Stacks." -- colors
			--[+ French +]--
	create_template("trait_bespoke_021_desc_ext_fr", {"loc_trait_bespoke_bleed_on_crit_melee_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_stacks_var_rgb.." Cumuls de "..COLORS_KWords_fr.Bleed_rgb_fr.." en cas de "..COLORS_KWords_fr.Crit_hit_rgb_fr..". Jusqu'à "..COLORS_Numbers.n_16_rgb.." Cumuls." end),

		--[+ Lacerate +]--
			-- Combat Blades -- 1 | 2 | 3 | 4
	create_template("trait_bespoke_022_desc_ext_en", {"loc_trait_bespoke_bleed_on_non_weakspot_hit_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_stacks_var_rgb.." "..COLORS_KWords.Bleed_rgb.." Stacks on non-"..COLORS_KWords.Weakspothits_rgb..". Up to "..COLORS_Numbers.n_16_rgb.." Stacks." end), -- stacks: +8 -- +"Up to 16 Stacks." -- colors
			--[+ French +]--
	create_template("trait_bespoke_022_desc_ext_fr", {"loc_trait_bespoke_bleed_on_non_weakspot_hit_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_stacks_var_rgb.." Cumuls de "..COLORS_KWords_fr.Bleed_rgb_fr.." sur les attaque hors "..COLORS_KWords_fr.Weakspothits_rgb_fr..". Jusqu'à "..COLORS_Numbers.n_16_rgb.." Cumuls." end),

		--[+ Executor +]--
			-- Combat Blades, Force Swords -- 5% | 5% | 5% | 5% (up to +25%) (bugged)
	create_template("trait_bespoke_023_desc_ext_en", {"loc_trait_bespoke_chained_weakspot_hits_increases_power_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb.." on Repeated "..COLORS_KWords.Weakspothit_rgb..". Stacks "..COLORS_Numbers.stacks_var_rgb.." times. {#color(255, 35, 5)}(bugged:+5% all tiers){#reset()}"..COLORS_KWords.Pwr_note_rgb end), -- power_level: +6%, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_023_desc_ext_fr", {"loc_trait_bespoke_chained_weakspot_hits_increases_power_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." lors d'un coup sur "..COLORS_KWords_fr.Weakspothit_rgb_fr.." répété. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois. {#color(255, 35, 5)}(bug:+5% sur tout les niveaux de bénédiction){#reset()}"..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Riposte +]--
			-- Combat Blades, Duelling Swords, Force Swords -- 12.5% | 15% | 17.5% | 20%
	create_template("trait_bespoke_024_desc_ext_en", {"loc_trait_bespoke_dodge_grants_crit_chance_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords.Crit_chance_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on successful Dodge." end), -- crit_chance: +20%, time: 6 -- s->seconds -- colors
			--[+ French +]--
	create_template("trait_bespoke_024_desc_ext_fr", {"loc_trait_bespoke_dodge_grants_crit_chance_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." de "..COLORS_KWords_fr.Crit_chance_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'une esquive réussie." end),

		--[+ Precognition +]--
			-- Combat Blades, Duelling Swords, Force Swords -- 45% | 50% | 55% | 60%
	create_template("trait_bespoke_025_desc_ext_en", {"loc_trait_bespoke_dodge_grants_finesse_bonus_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Finesse_rgb.." "..COLORS_KWords.Damage_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on successful Dodge."..COLORS_KWords.Fns_note_rgb end), -- damage: +60%, time: 2 -- s->seconds -- colors -- Note
			--[+ French +]--
	create_template("trait_bespoke_025_desc_ext_fr", {"loc_trait_bespoke_dodge_grants_finesse_bonus_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." de "..COLORS_KWords_fr.Damage_rgb_fr.." de "..COLORS_KWords_fr.Finesse_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'une esquive réussie."..COLORS_KWords_fr.Fns_note_rgb_fr end),

		--[+ Haymaker +]--
			-- Bully Clubs, Combat Blades -- 1% | 2% | 3% | 4% (up to +20%)
	create_template("trait_bespoke_026_desc_ext_en", {"loc_trait_bespoke_heavy_chained_hits_increases_killing_blow_chance_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_procch_var_rgb.." to Instakill human-sized enemies on Chained Heavy Hit. Stacks "..COLORS_Numbers.stacks_var_rgb.." times. Note that other potential triggers will not be activated on instakill." end), -- proc_chance: +4%, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_026_desc_ext_fr", {"loc_trait_bespoke_heavy_chained_hits_increases_killing_blow_chance_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_procch_var_rgb.." de chance de tuer instantanément les ennemies de taille humaines sur les attaques puissantes répétées. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois. A noter que d'autres déclencheurs potentiels ne seront pas activés lors d'une élimination instantanée." end),

		--[+ Smackdown +]--
			-- Bully Clubs, Combat Blades -- 12.5% | 15% | 17.5% | 20%
	create_template("trait_bespoke_027_desc_ext_en", {"loc_trait_bespoke_increased_crit_chance_after_punching_staggered_enemy_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords.Crit_chance_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds when hitting a "..COLORS_KWords.Staggered_rgb.." enemy with a Special action." end), -- crit_chance: +20%, time: 2 -- s->seconds -- rewrite -- colors
			--[+ French +]--
	create_template("trait_bespoke_027_desc_ext_fr", {"loc_trait_bespoke_increased_crit_chance_after_punching_staggered_enemy_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." de "..COLORS_KWords_fr.Crit_chance_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes pendant q'un ennemie "..COLORS_KWords_fr.Staggered_rgb_fr.." grâce à un coup d'action spéciale." end),

		--[+ Mercy Killer +]--
			-- Combat Blades -- 52.5% | 55% | 57.5% | 60%
	create_template("trait_bespoke_028_desc_ext_en", {"loc_trait_bespoke_increased_weakspot_damage_on_bleeding_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Weakspot_dmg_rgb.." to Enemies with "..COLORS_KWords.Bleed_rgb.." Stacks." end), -- damage: +60% -- colors
			--[+ French +]--
	create_template("trait_bespoke_028_desc_ext_fr", {"loc_trait_bespoke_increased_weakspot_damage_on_bleeding_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." de "..COLORS_KWords_fr.Weakspot_dmg_rgb_fr.." au ennemies avec des cumuls de "..COLORS_KWords_fr.Bleed_rgb_fr.."." end),

		--[+ Ruthless Backstab +]--
			-- Combat Blades -- 70% | 80% | 90% | 100% 
	create_template("trait_bespoke_029_desc_ext_en", {"loc_trait_bespoke_rending_on_backstabs_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_rending_var_rgb.." "..COLORS_KWords.Rending_rgb.." on Backstab Hit."..COLORS_KWords.Rend_note_rgb end), -- rending: +100% -- colors
			--[+ French +]--
	create_template("trait_bespoke_029_desc_ext_fr", {"loc_trait_bespoke_rending_on_backstabs_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_rending_var_rgb.." de "..COLORS_KWords_fr.Rending_rgb_fr.." lors d'un coup dans le dos."..COLORS_KWords_fr.Rend_note_rgb_fr end), 

		--[+ Uncanny Strike +]--
			-- Combat Blade, Duelling Swords, Force Swords, Sapper Shovels -- 12% | 16% | 20% | 24% (up to +120%)
	create_template("trait_bespoke_030_desc_ext_en", {"loc_trait_bespoke_stacking_rending_on_weakspot_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_rending_var_rgb.." "..COLORS_KWords.Rending_rgb.." on Enemy "..COLORS_KWords.Weakspothit_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds. Stacks "..COLORS_Numbers.stacks_var_rgb.." times."..COLORS_KWords.Rend_note_rgb end), -- rending: +24%, time: 3.5, stacks: 5 -- s->seconds -- colors
			--[+ French +]--
	create_template("trait_bespoke_030_desc_ext_fr", {"loc_trait_bespoke_stacking_rending_on_weakspot_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_rending_var_rgb.." de "..COLORS_KWords_fr.Rending_rgb_fr.." sur un coup sur "..COLORS_KWords_fr.Weakspothit_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois."..COLORS_KWords_fr.Rend_note_rgb_fr end),

		--[+ Trauma +]--
			-- Crusher, Devil's Claw Swords, Sapper Shovels, Thunder Hammers -- 14% | 16% | 18% | 20% (up to +100%) 
	create_template("trait_bespoke_031_desc_ext_en", {"loc_trait_bespoke_consecutive_hits_increases_stagger_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_imp_var_rgb.." "..COLORS_KWords.Impact_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on Repeated Hit. Stacks "..COLORS_Numbers.stacks_var_rgb.." times." end), -- impact: +20%, time: 2, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_031_desc_ext_fr", {"loc_trait_bespoke_consecutive_hits_increases_stagger_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_imp_var_rgb.." d'"..COLORS_KWords_fr.Impact_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'un coup répété. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois." end),

		--[+ Vicious Slice +]--
			-- Devil's Claw Swords -- 14% | 16% | 18% | 20% (up to +100%)
	create_template("trait_bespoke_032_desc_ext_en", {"loc_trait_bespoke_increase_stagger_per_hit_in_sweep_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_imp_var_rgb.." "..COLORS_KWords.Impact_rgb.." to Target for each Enemy already Hit by the same Attack. Up to "..COLORS_Numbers.n_5_rgb.." Stacks." end), -- impact: +20% -- colors
			--[+ French +]--
	create_template("trait_bespoke_032_desc_ext_fr", {"loc_trait_bespoke_increase_stagger_per_hit_in_sweep_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_imp_var_rgb.." d'"..COLORS_KWords_fr.Impact_rgb_fr.." à la cible pour chaque ennemie déjà touché par la même attaque. Jusqu'à "..COLORS_Numbers.n_5_rgb.." cumuls." end),

		--[+ Hammerblow +]--
			-- Crusher, Devil's Claw Swords, Sapper Shovels, Shock Mauls, Thunder Hammers -- 19% | 21% | 23% | 25% (up to +125%)
	create_template("trait_bespoke_033_desc_ext_en", {"loc_trait_bespoke_stacking_increase_impact_on_hit_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_imp_var_rgb.." "..COLORS_KWords.Impact_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on Hit. Stacks "..COLORS_Numbers.stacks_var_rgb.." times. Up to "..COLORS_Numbers.n_5_rgb.." Stacks per Hit." end), -- impact: +25%, time: 1.5, stacks: 5 -- s->seconds -- colors
			--[+ French +]--
	create_template("trait_bespoke_033_desc_ext_fr", {"loc_trait_bespoke_stacking_increase_impact_on_hit_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_imp_var_rgb.." d'"..COLORS_KWords_fr.Impact_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'un coup. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois. Jusqu'à "..COLORS_Numbers.n_5_rgb.." cumuls par coup." end),

		--[+ Skullcrusher +]--
			-- Battle Maul and Shield, Bully Clubs, Crusher, Devil's Claw Swords, Latrine Shovels, Power Maul, Sapper Shovels, Shock Mauls, Thunder Hammers -- 1 | 2 | 3 | 4
	create_template("trait_bespoke_034_desc_ext_en", {"loc_trait_bespoke_staggered_targets_receive_increased_damage_debuff_desc"}, {"en"}, function(locale, value) return "Target receives "..COLORS_Numbers.stacks_var_rgb.." Stacks of "..COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." if already "..COLORS_KWords.Staggered_rgb..", to a maximum of "..COLORS_Numbers.n_8_rgb.." Stacks. Lasts "..COLORS_Numbers.time_var_rgb.." seconds." end), -- stacks: 4, damage: +10%, time: 5 --  +"to a maximum of 8 Stacks. -- Stack(s)->Stacks -- colors
			--[+ French +]--
	create_template("trait_bespoke_034_desc_ext_fr", {"loc_trait_bespoke_staggered_targets_receive_increased_damage_debuff_desc"}, {"fr"}, function(locale, value) return "La cible subit "..COLORS_Numbers.stacks_var_rgb.." cumuls de "..COLORS_Numbers.p_dmg_var_rgb.." de "..COLORS_KWords_fr.Damage_rgb_fr.." si elle "..COLORS_KWords_fr.Staggered_rgb_fr.." déjà, jusqu'à un maximum de "..COLORS_Numbers.n_8_rgb.." cumuls. Dure "..COLORS_Numbers.time_var_rgb.." secondes." end),

		--[+ Thunderstrike +]--
			-- Battle Maul and Shield, Crusher, Devil's Claw Swords, Power Maul, Sapper Shovels, Thunder Hammers -- 1 | 2 | 3 | 4
	create_template("trait_bespoke_035_desc_ext_en", {"loc_trait_bespoke_staggered_targets_receive_increased_stagger_debuff_desc"}, {"en"}, function(locale, value) return "Target receives "..COLORS_Numbers.stacks_var_rgb.." Stacks of "..COLORS_Numbers.p_imp_var_rgb.." "..COLORS_KWords.Impact_rgb.." if already "..COLORS_KWords.Staggered_rgb..", to a maximum of "..COLORS_Numbers.n_8_rgb.." Stacks. Lasts "..COLORS_Numbers.time_var_rgb.." seconds." end), -- stacks: 4, impact: +10%, time: 5 --  +"to a maximum of 8 Stacks. -- Stack(s)->Stacks -- colors
			--[+ French +]--
	create_template("trait_bespoke_035_desc_ext_fr", {"loc_trait_bespoke_staggered_targets_receive_increased_stagger_debuff_desc"}, {"fr"}, function(locale, value) return "La cible subit "..COLORS_Numbers.stacks_var_rgb.." cumuls de "..COLORS_Numbers.p_imp_var_rgb.." d'"..COLORS_KWords_fr.Impact_rgb_fr.." si elle "..COLORS_KWords_fr.Staggered_rgb_fr.." déjà, jusqu'à un maximum de "..COLORS_Numbers.n_8_rgb.." cumuls. Dure "..COLORS_Numbers.time_var_rgb.." secondes." end),

		--[+ Chained Deathblow +]--
			-- Heavy Swords -- 10% | 10% | 10% | 10% (bugged)
	create_template("trait_bespoke_036_desc_ext_en", {"loc_trait_bespoke_increased_crit_chance_on_weakspot_kill_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords.Crit_chance_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on "..COLORS_KWords.Weakspot_rgb.." kill. {#color(255, 35, 5)}(bugged:+10% all tiers){#reset()}" end), -- crit_chance: 20%, time: 3 -- s->seconds -- colors
			--[+ French +]--
	create_template("trait_bespoke_036_desc_ext_fr", {"loc_trait_bespoke_increased_crit_chance_on_weakspot_kill_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." de "..COLORS_KWords_fr.Crit_chance_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'une élimination sur "..COLORS_KWords_fr.Weakspot_rgb_fr..". {#color(255, 35, 5)}(bug:+10% de taux de coup critique peu importe le niveau de la bénédiction){#reset()}" end),

		--[+ Deathblow +]--
			-- Battle Maul and Shield, Combat Axes, Heavy Swords, Latrine Shovels, Power Maul, Power Swords, Tactical Axes -- 7.5% | 10% | 12.5% | 15%
	create_template("trait_bespoke_037_desc_ext_en", {"loc_trait_bespoke_infinite_melee_cleave_on_weakspot_kill_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_wkspdmg_var_rgb.." "..COLORS_KWords.Weakspot_dmg_rgb..". "..COLORS_KWords.Weakspot_rgb.." Kills also ignore up to "..COLORS_Numbers.n_3_rgb.." enemies "..COLORS_KWords.Hit_mass_rgb.."." end), -- weakspot_damage: +15% -- colors
			--[+ French +]--
	create_template("trait_bespoke_037_desc_ext_fr", {"loc_trait_bespoke_infinite_melee_cleave_on_weakspot_kill_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_wkspdmg_var_rgb.." de "..COLORS_KWords_fr.Weakspot_dmg_rgb_fr..". Les éliminations sur "..COLORS_KWords_fr.Weakspot_rgb_fr.." ignore le "..COLORS_KWords_fr.Hit_mass_rgb_fr.." de "..COLORS_Numbers.n_3_rgb.." ennemis." end),

		--[+ Perfect Strike +]--
			-- Battle Maul and Shield, Bully Clubs, Eviscerators, Heavy Swords, Latrine Shovels, Power Maul -- 2.5% | 5% | 7.5% | 10%
	create_template("trait_bespoke_038_desc_ext_en", {"loc_trait_bespoke_pass_past_armor_on_crit_new_desc"}, {"en"}, function(locale, value) return  COLORS_Numbers.p_critdmg_var_rgb.." Melee "..COLORS_KWords.Crit_hit_rgb.." "..COLORS_KWords.Damage_rgb..". "..COLORS_KWords.Crit_hits_rgb.." ignore "..COLORS_KWords.Hit_mass_rgb.." bonus from Armour." end), -- crit_damage: +10% -- colors
			--[+ French +]--
	create_template("trait_bespoke_038_desc_ext_fr", {"loc_trait_bespoke_pass_past_armor_on_crit_new_desc"}, {"fr"}, function(locale, value) return  COLORS_Numbers.p_critdmg_var_rgb.." de "..COLORS_KWords_fr.Damage_rgb_fr.." de "..COLORS_KWords_fr.Crit_hit_rgb_fr.." en mélée. Les "..COLORS_KWords_fr.Crit_hits_rgb_fr.." ignore le "..COLORS_KWords_fr.Hit_mass_rgb_fr.." de l'armure." end),

		--[+ Bladed Momentum +]--
			-- Heavy Swords -- 4% | 6% | 8% | 10% (up to +50%)
	create_template("trait_bespoke_039_desc_ext_en", {"loc_trait_bespoke_stacking_rending_on_cleave_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_rending_var_rgb.." "..COLORS_KWords.Rending_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds when hitting multiple enemies in one sweep. Stacks "..COLORS_Numbers.stacks_var_rgb.." times."..COLORS_KWords.Rend_note_rgb end), -- rending: 10%, time: 2.5, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_039_desc_ext_fr", {"loc_trait_bespoke_stacking_rending_on_cleave_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_rending_var_rgb.." de "..COLORS_KWords_fr.Rending_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'un coup en mélée multiple . Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois."..COLORS_KWords_fr.Rend_note_rgb_fr end),

		--[+ Deflector +]--
			-- Force Swords -- 22.5% | 25% | 27.5% | 30%
	create_template("trait_bespoke_040_desc_ext_en", {"loc_trait_bespoke_can_block_ranged_desc"}, {"en"}, function(locale, value) return "This weapon Blocks both Melee and Ranged attacks. Additionally, Block Cost is reduced by "..COLORS_Numbers.block_var_rgb.."." end), -- block_cost: 30% -- colors
			--[+ French +]--
	create_template("trait_bespoke_040_desc_ext_fr", {"loc_trait_bespoke_can_block_ranged_desc"}, {"fr"}, function(locale, value) return "Cette arme bloque les attaques à distance et en mélée. De plus, le coût du blocage est réduit de "..COLORS_Numbers.block_var_rgb.."." end),

		--[+ Exorcist +]--
			-- Force Swords -- 2% | 3% | 4% | 5%
	create_template("trait_bespoke_041_desc_ext_en", {"loc_trait_bespoke_chained_weakspot_hits_vents_warpcharge_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.warpchrg_var_rgb.." of "..COLORS_KWords.Peril_rgb.." is quelled on Repeated "..COLORS_KWords.Weakspothit_rgb.."." end), -- warp_charge: 5% -- colors
			--[+ French +]--
	create_template("trait_bespoke_041_desc_ext_fr", {"loc_trait_bespoke_chained_weakspot_hits_vents_warpcharge_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.warpchrg_var_rgb.." du "..COLORS_KWords_fr.Peril_rgb_fr.." est dissipé sur les "..COLORS_KWords_fr.Weakspothit_rgb_fr.." répété." end),

		--[+ Superiority +]--
			-- Force Swords -- 5% | 7.5% | 10% | 12.5% (up to +37.5%)
	create_template("trait_bespoke_042_desc_ext_en", {"loc_trait_bespoke_elite_kills_grants_stackable_power_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on Elite Kill. Stacks "..COLORS_Numbers.stacks_var_rgb.." times, deteriorating one at a time."..COLORS_KWords.Pwr_note_rgb end), -- stacks: 5, power_level: +12.5%, time: 7 -- s->seconds -- colors
			--[+ French +]--
	create_template("trait_bespoke_042_desc_ext_fr", {"loc_trait_bespoke_elite_kills_grants_stackable_power_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'une élimination d'élite. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois. Les cumuls se détériorent un à un."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Blazing Spirit +]--
			-- Force Swords -- 1 (3 max) | 2 (6 max) | 3 (9 max) | 4 (12 max)
	create_template("trait_bespoke_043_desc_ext_en", {"loc_trait_bespoke_warp_burninating_on_crit_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.n_plus_rgb..COLORS_Numbers.stacks_var_rgb.." Stacks of "..COLORS_KWords.Soulblaze_rgb.." are gained by the enemy on "..COLORS_KWords.Crit_hit_rgb..", to a maximum of "..COLORS_Numbers.maxstks_var_rgb.." Stacks." end), -- stacks: +4, max_stacks: 12 -- Stack(s)->Stacks -- colors
			--[+ French +]--
	create_template("trait_bespoke_043_desc_ext_fr", {"loc_trait_bespoke_warp_burninating_on_crit_desc"}, {"fr"}, function(locale, value) return "L'ennemi gagne "..COLORS_Numbers.n_plus_rgb..""..COLORS_Numbers.stacks_var_rgb.." cumuls d'"..COLORS_KWords_fr.Soulblaze_rgb_fr.." lors d'un "..COLORS_KWords_fr.Crit_hit_rgb_fr..", Jusqu'à "..COLORS_Numbers.maxstks_var_rgb.." cumuls." end),

		--[+ Unstable Power +]--
			-- Force Swords -- 3.5% | 4% | 4.5% | 5% (up to +20%)
	create_template("trait_bespoke_044_desc_ext_en", {"loc_trait_bespoke_warp_charge_power_bonus_desc"}, {"en"}, function(locale, value) return "Up to "..COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb..", with increasing "..COLORS_KWords.Peril_rgb.." Level. Stacks "..COLORS_Numbers.n_4_rgb.." times."..COLORS_KWords.Pwr_note_rgb end), -- power_level: +20% -- colors
			--[+ French +]--
	create_template("trait_bespoke_044_desc_ext_fr", {"loc_trait_bespoke_warp_charge_power_bonus_desc"}, {"fr"}, function(locale, value) return "Jusqu'à "..COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords_fr.Strength_rgb_fr..", en fonction du "..COLORS_KWords_fr.Peril_rgb_fr..". Se cumule "..COLORS_Numbers.n_4_rgb.." fois."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Lightning Reflexes +]--
			-- Shock Mauls -- 10% | 15% | 20% | 25%
	create_template("trait_bespoke_045_desc_ext_en", {"loc_trait_bespoke_block_has_chance_to_stun_with_cd_desc"}, {"en"}, function(locale, value) return "Timed Blocks "..COLORS_KWords.Stun_rgb.." the attacker, and grant you "..COLORS_Numbers.p_pwrlvl_var_rgb.." Melee "..COLORS_KWords.Strength_rgb.." for "..COLORS_Numbers.n_3_rgb.." seconds. Cooldown "..COLORS_Numbers.n_3_rgb.." seconds."..COLORS_KWords.Pwr_note_rgb end), -- power_level: 25%, duration: 3ss!!!, cooldown_duration: 3ss!!! -- "..COLORS_Numbers.dur_var_rgb.."&"..COLORS_Numbers.cd_dur_var_rgb.."==3s -- colors
			--[+ French +]--
	create_template("trait_bespoke_045_desc_ext_fr", {"loc_trait_bespoke_block_has_chance_to_stun_with_cd_desc"}, {"fr"}, function(locale, value) return "Les blocages opportuns "..COLORS_KWords_fr.Stun_s_rgb_fr.." l'attaquant et vous octroient "..COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." de mélée pendant "..COLORS_Numbers.n_3_rgb.." secondes. Temps de recharge : "..COLORS_Numbers.n_3_rgb.." secondes."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ High Voltage +]--
			-- Shock Mauls -- 10% | 15% | 20% | 25%
	create_template("trait_bespoke_046_desc_ext_en", {"loc_trait_bespoke_damage_bonus_vs_electrocuded_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." vs "..COLORS_KWords.Electrocuted_rgb.." enemies." end), -- damage: +25% - colors
			--[+ French +]--
	create_template("trait_bespoke_046_desc_ext_fr", {"loc_trait_bespoke_damage_bonus_vs_electrocuded_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." de "..COLORS_KWords_fr.Damage_rgb_fr.." contre les ennemies "..COLORS_KWords_fr.Electrocuted_rgb_fr.." ." end),

		--[+ Falter +]--
			-- Shock Mauls -- 60% | 70% | 80% | 90%
	create_template("trait_bespoke_047_desc_ext_en", {"loc_trait_bespoke_negate_stagger_reduction_on_weakspot_desc"}, {"en"}, function(locale, value) return "Increased "..COLORS_KWords.Stagger_rgb.." on enemies by "..COLORS_Numbers.stgr_var_rgb..", on "..COLORS_KWords.Weakspothit_rgb..". Additionally, increases Ranged "..COLORS_KWords.Stagger_rgb.." strength by "..COLORS_Numbers.stgrrang_var_rgb.."." end), -- stagger: 90%, ranged_stagger: 30% -- colors
			--[+ French +]--
	create_template("trait_bespoke_047_desc_ext_fr", {"loc_trait_bespoke_negate_stagger_reduction_on_weakspot_desc"}, {"fr"}, function(locale, value) return "Le "..COLORS_KWords_fr.Stagger_rgb_fr.." des ennemis augmente de "..COLORS_Numbers.stgr_var_rgb..", lors d'un "..COLORS_KWords_fr.Weakspothit_rgb_fr..". De plus augmente la puissance du "..COLORS_KWords_fr.Stagger_rgb_fr.." à distance de "..COLORS_Numbers.stgrrang_var_rgb.."." end),

		--[+ Overwhelming Force +]--
			-- Shock Mauls -- 5s & 10% | 4.5s & 15% | 4s & 20% | 3.5s & 25%
	create_template("trait_bespoke_048_desc_ext_en", {"loc_trait_bespoke_staggering_hits_has_chance_to_stun_desc"}, {"en"}, function(locale, value) return COLORS_KWords.Staggering_rgb.." an Enemy has a "..COLORS_Numbers.chnc_var_rgb.." Chance to Stun the enemy. Cooldown "..COLORS_Numbers.cd_var_rgb.."econds." end), -- chance: 25%, cooldown: 3.5s!!! -- colors
			--[+ French +]--
	create_template("trait_bespoke_048_desc_ext_fr", {"loc_trait_bespoke_staggering_hits_has_chance_to_stun_desc"}, {"fr"}, function(locale, value) return "Faire "..COLORS_KWords_fr.Staggering_rgb_fr.." un ennemie à "..COLORS_Numbers.chnc_var_rgb.." de chance de l'"..COLORS_KWords_fr.Stun_rgb_fr..". Temps de recharge : "..COLORS_Numbers.cd_var_rgb.."econdes." end),

		--[+ Momentum +]--
			-- Bully Clubs, Cleavers, Eviscerators, Thunder Hammers -- 12% | 13% | 14% | 15%
	create_template("trait_bespoke_049_desc_ext_en", {"loc_trait_bespoke_toughness_recovery_on_multiple_hits_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.tghns_var_rgb.." "..COLORS_KWords.Toughness_rgb.." restores when hitting at least "..COLORS_Numbers.mult_hit_var_rgb.." enemies with an attack." end), -- toughness: 15% -- colors
			--[+ French +]--
	create_template("trait_bespoke_049_desc_ext_fr", {"loc_trait_bespoke_toughness_recovery_on_multiple_hits_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.tghns_var_rgb.." de régénération de "..COLORS_KWords_fr.Toughness_rgb_fr.." en touchant au moins "..COLORS_Numbers.mult_hit_var_rgb.." ennemies avec une attaque." end),

		--[+ Take a Swing +]--
			-- Sapper Shovels -- 45% | 50% | 55% | 60%
	create_template("trait_bespoke_050_desc_ext_en", {"loc_trait_bespoke_weakspot_damage_bonus_on_pushed_enemies_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Weakspot_dmg_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on Pushing Enemies." end), -- toughness: +45%, time: 3 -- colors
			--[+ French +]--
	create_template("trait_bespoke_050_desc_ext_fr", {"loc_trait_bespoke_weakspot_damage_bonus_on_pushed_enemies_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." de "..COLORS_KWords_fr.Weakspot_dmg_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'une poussée d'ennemis." end),

		--[+ Supercharge +]--
			-- Power Maul, Power Swords -- 1 | 2 | 3 | 4
	create_template("trait_bespoke_051_desc_ext_en", {"loc_trait_bespoke_armor_rend_on_activated_attacks_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_rend_var_rgb.." Stacks of "..COLORS_KWords.Brittleness_rgb.." on Energised Hit."..COLORS_KWords.Brtl_note_rgb end), -- rend: +4 -- colors
			--[+ French +]--
	create_template("trait_bespoke_051_desc_ext_fr", {"loc_trait_bespoke_armor_rend_on_activated_attacks_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_rend_var_rgb.." cumuls de "..COLORS_KWords_fr.Brittleness_rgb_fr.." lors d'un coup énergisé."..COLORS_KWords_fr.Brtl_note_rgb_fr end),

		--[+ Power Cycler +]--
			-- Power Swords -- 2.5% & 1 | 5% & 1 | 7.5% & 2 | 10% & 2
	create_template("trait_bespoke_052_desc_ext_en", {"loc_trait_bespoke_extended_activation_duration_and_stagger_on_chained_attacks_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_xtrahits_var_rgb.." Extra Chained Energised Hits and "..COLORS_Numbers.p_stgr_var_rgb.." "..COLORS_KWords.Impact_rgb.." on Energised Hits." end), -- extra_hits: +2, stagger: +10% -- colors
			--[+ French +]--
	create_template("trait_bespoke_052_desc_ext_fr", {"loc_trait_bespoke_extended_activation_duration_and_stagger_on_chained_attacks_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_xtrahits_var_rgb.." Coups d'énergie en chaîne supplémentaires et "..COLORS_Numbers.p_stgr_var_rgb.." "..COLORS_KWords_fr.Impact_rgb_fr.." lors d'un coup énergisé." end),

		--[+ Sunder +]--
			-- Power Swords -- 5% | 10% | 15% | 20%
	create_template("trait_bespoke_053_desc_ext_en", {"loc_trait_bespoke_infinite_armor_cleave_on_activated_attacks_and_heavy_damage_desc"}, {"en"}, function(locale, value) return "Increased "..COLORS_KWords.Cleave_rgb.." and "..COLORS_Numbers.p_dmghvy_var_rgb.." Heavy Melee Attack "..COLORS_KWords.Damage_rgb.." on Energised Attacks." end), -- heavy_damage: +20% -- colors
			--[+ French +]--
	create_template("trait_bespoke_053_desc_ext_fr", {"loc_trait_bespoke_infinite_armor_cleave_on_activated_attacks_and_heavy_damage_desc"}, {"fr"}, function(locale, value) return "Lors d'un coup énergisé, augmente le "..COLORS_KWords_fr.Cleave_rgb_fr.." et les "..COLORS_KWords_fr.Damage_rgb_fr.." des attaques puissantes de mélée de "..COLORS_Numbers.p_dmghvy_var_rgb.."." end),

		--[+ Sucker Punch +]--
			-- Latrine Shovels -- 7.5% | 10% | 12.5% | 15%
	create_template("trait_bespoke_054_desc_ext_en", {"loc_trait_bespoke_increased_crit_chance_after_punch_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords.Crit_chance_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on Special Action Hit." end), -- crit_chance: +15%,  time: 3 -- colors
			--[+ French +]--
	create_template("trait_bespoke_054_desc_ext_fr", {"loc_trait_bespoke_increased_crit_chance_after_punch_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." de "..COLORS_KWords_fr.Crit_chance_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'un coup d'action spéciale." end),

		--[+ Confident Strike +]--
			-- Battle Maul and Shield, Bully Clubs, Cleavers, Latrine Shovels, Pickaxes, Power Maul -- 5% | 6% | 7% | 8%
	create_template("trait_bespoke_055_desc_ext_en", {"loc_trait_bespoke_toughness_recovery_on_chained_attacks_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_tghns_var_rgb.." "..COLORS_KWords.Toughness_rgb.." on Chained Hit." end), -- toughness: +8% -- colors
			--[+ French +]--
	create_template("trait_bespoke_055_desc_ext_fr", {"loc_trait_bespoke_toughness_recovery_on_chained_attacks_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_tghns_var_rgb.." "..COLORS_KWords_fr.Toughness_rgb_fr.." lors d'un coup en chaîne." end),

		--[+ No Guts, No Glory +]--
			-- Bully Clubs -- 2 | 3 | 4 | 5
	create_template("trait_bespoke_056_desc_ext_en", {"loc_trait_bespoke_toughness_regen_on_punching_elites_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_tghns_var_rgb.." "..COLORS_KWords.Toughness_rgb.." Regeneration per second for "..COLORS_Numbers.time_var_rgb.." seconds on Elite Special Action Hit." end), -- toughness: +8%,  time: 5 -- s->seconds -- colors
			--[+ French +]--
	create_template("trait_bespoke_056_desc_ext_fr", {"loc_trait_bespoke_toughness_regen_on_punching_elites_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_tghns_var_rgb.." de régénération de "..COLORS_KWords_fr.Toughness_rgb_fr.." par seconde pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'un coup d'action spéciale sur un élite." end),

		--[+ Bash +]--
			-- Cleavers -- 7.5% | 10% | 12.5% | 15%
	create_template("trait_bespoke_057_desc_ext_en", {"loc_trait_bespoke_crit_chance_on_push_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords.Crit_chance_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on Pushing Enemies." end), -- crit_chance: +15%,  time: 3 -- s->seconds -- colors
			--[+ French +]--
	create_template("trait_bespoke_057_desc_ext_fr", {"loc_trait_bespoke_crit_chance_on_push_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." de "..COLORS_KWords_fr.Crit_chance_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes en poussant les ennemies." end),

		--[+ Tenderiser +]--
			-- Cleavers -- 10% | 15% | 20% | 25%
	create_template("trait_bespoke_058_desc_ext_en", {"loc_trait_bespoke_increased_power_on_weapon_special_follow_up_hits_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwr_var_rgb.." "..COLORS_KWords.Strength_rgb.." for your next "..COLORS_Numbers.n_3_rgb.." Melee attacks after Weapon Special attack Hit."..COLORS_KWords.Pwr_note_rgb end), -- power: +15% -- -() -- colors
			--[+ French +]--
	create_template("trait_bespoke_058_desc_ext_fr", {"loc_trait_bespoke_increased_power_on_weapon_special_follow_up_hits_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwr_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." pour vos "..COLORS_Numbers.n_3_rgb.." prochaines attaques de mélée lors d'une attaque spéciale d'arme réussie."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Unstoppable Force +]--
			-- Cleavers -- 2.5% | 5% | 7.5% | 10%
	create_template("trait_bespoke_059_desc_ext_en", {"loc_trait_bespoke_pass_past_armor_and_damage_on_heavy_attack_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." to Fully Charged Heavy Attacks, they also ignore Enemy "..COLORS_KWords.Hit_mass_rgb.."." end), -- damage: 10% -- colors
			--[+ French +]--
	create_template("trait_bespoke_059_desc_ext_fr", {"loc_trait_bespoke_pass_past_armor_and_damage_on_heavy_attack_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." de "..COLORS_KWords_fr.Damage_rgb_fr.." pour les attaques puissantes pleinement chargées, elles ignorent également le "..COLORS_KWords_fr.Hit_mass_rgb_fr.." des ennemies." end),

		--[+ Torment +]--
			-- Pickaxes -- 12% | 16% | 20% | 24%
	create_template("trait_bespoke_060_desc_ext_en", {"loc_trait_bespoke_increase_power_on_weapon_special_hit_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on Weapon Special Hit."..COLORS_KWords.Pwr_note_rgb end), -- power_level: +24%,  time: 3.5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_060_desc_ext_fr", {"loc_trait_bespoke_increase_power_on_weapon_special_hit_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'une attaque spéciale d'arme réussie."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Slow and Steady +]--
			-- Pickaxes -- 5% | 6% | 7% | 8% (up to 24%)
	create_template("trait_bespoke_061_desc_ext_en", {"loc_trait_bespoke_toughness_on_hit_based_on_charge_time_desc"}, {"en"}, function(locale, value) return "Recover "..COLORS_Numbers.tghns_var_rgb.." "..COLORS_KWords.Toughness_rgb.." when hitting an enemy with a heavy attack, based on charge time." end), -- toughness: 8% -- colors
			--[+ French +]--
	create_template("trait_bespoke_061_desc_ext_fr", {"loc_trait_bespoke_toughness_on_hit_based_on_charge_time_desc"}, {"fr"}, function(locale, value) return "Récupérez "..COLORS_Numbers.tghns_var_rgb.." de "..COLORS_KWords_fr.Toughness_rgb_fr.." lorsque vous touchez un ennemie avec une attaque puissante, dépend du temps de charge." end),

		--[+ Power Surge +]--
			-- Power Maul -- 10% | 15% | 20% | 25%
	create_template("trait_bespoke_062_desc_ext_en", {"loc_trait_bespoke_explosion_on_activated_attacks_on_armor_new_desc"}, {"en"}, function(locale, value) return "Special Attacks have "..COLORS_Numbers.p_explosion_rad_var_rgb.." Explosion Radius. Special Attacks on Armored Enemies cause an additional Shockwave." end), -- explosion_radius: 25% -- colors
			--[+ French +]--
	create_template("trait_bespoke_062_desc_ext_fr", {"loc_trait_bespoke_explosion_on_activated_attacks_on_armor_new_desc"}, {"fr"}, function(locale, value) return "Le rayon d'explosion des attaques spéciales aumgante de "..COLORS_Numbers.p_explosion_rad_var_rgb..". Les attaques spéciales sur des ennemies en armure engendrent une onde de choc supplémentaire." end),

		--[+ Last Guard +]--
			-- Battle Maul and Shield -- 18s & 15% | 15s & 20% | 12s & 25% | 9s & 30%
	create_template("trait_bespoke_063_desc_ext_en", {"loc_trait_block_break_pushes_new_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.n_minus_rgb..COLORS_Numbers.block_var_rgb.." Block Cost. Pushes back enemies within a "..COLORS_Numbers.n_5_rgb.." meter radius when Ogryn's "..COLORS_KWords.Stamina_rgb.." reaches "..COLORS_Numbers.n_0_rgb.." from Blocking an attack. Cooldown: "..COLORS_Numbers.cd_var_rgb.." seconds." end), -- block_cost: -30%, cooldown: 15 -- colors
			--[+ French +]--
	create_template("trait_bespoke_063_desc_ext_fr", {"loc_trait_block_break_pushes_new_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.n_minus_rgb..COLORS_Numbers.block_var_rgb.." de réduction du coût de blocage.Quand l'"..COLORS_KWords_fr.Stamina_rgb_fr.." de l'Ogryn atteint "..COLORS_Numbers.n_0_rgb.." en bloquant des attaques, il repousse les ennemies dans un rayon de "..COLORS_Numbers.n_5_rgb..". Temps de recharge : "..COLORS_Numbers.cd_var_rgb.." secondes." end),

		--[+ Offensive Defence +]--
			-- Battle Maul and Shield -- 4% | 6% | 8% | 10% (up to +50%)
	create_template("trait_bespoke_064_desc_ext_en", {"loc_trait_damage_bonus_on_block_desc"}, {"en"}, function(locale, value) return "Gain a Stack for each "..COLORS_KWords.Stamina_rgb.." spent Blocking. Your next Melee attack gains "..COLORS_Numbers.p_pwr_var_rgb.." "..COLORS_KWords.Strength_rgb.." per Stack and consumes one Stack. Last "..COLORS_Numbers.dur_var_rgb.." seconds. Stacks "..COLORS_Numbers.stacks_var_rgb.." times."..COLORS_KWords.Pwr_note_rgb end), -- power: +10%, duration: 3.5, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_064_desc_ext_fr", {"loc_trait_damage_bonus_on_block_desc"}, {"fr"}, function(locale, value) return "Pour chaque point d'"..COLORS_KWords_fr.Stamina_rgb_fr.." dépensé pour bloquer. Votre prochaine attaque de mélée gagne "..COLORS_Numbers.p_pwr_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." par cumule et consomme un cumule. Dure "..COLORS_Numbers.dur_var_rgb.." secondes. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Murderous Tranquility +]--
			-- Blaze Force Greatsword -- 
	create_template("trait_bespoke_065_desc_ext_en", {"loc_trait_bespoke_vent_warp_charge_on_multiple_hits_desc"}, {"en"}, function(locale, value) return "Hitting at least "..COLORS_Numbers.mult_hit_var_rgb.." enemies with an attack, quells "..COLORS_Numbers.warpchrg_var_rgb.." "..COLORS_KWords.Peril_rgb.."." end), -- multiple_hit: 3, warp_charge: 2% -- colors
			--[+ French +]--
	create_template("trait_bespoke_065_desc_ext_fr", {"loc_trait_bespoke_vent_warp_charge_on_multiple_hits_desc"}, {"fr"}, function(locale, value) return "Toucher au moins "..COLORS_Numbers.mult_hit_var_rgb.." ennemies avec une attaque, réduit de "..COLORS_Numbers.warpchrg_var_rgb.." le "..COLORS_KWords_fr.Peril_rgb_fr.."." end),

		--[+ Warp Slice +]--
			-- Blaze Force Greatsword -- 
	create_template("trait_bespoke_066_desc_ext_en", {"loc_trait_bespoke_wind_slash_crits_desc"}, {"en"}, function(locale, value) return "Guaranteed Activated "..COLORS_KWords.Crit_strike_rgb..". "..COLORS_Numbers.cd_var_rgb.." seconds Cooldown." end), -- cooldown: 50 -- s->seconds -- colors
			--[+ French +]--
	create_template("trait_bespoke_066_desc_ext_fr", {"loc_trait_bespoke_wind_slash_crits_desc"}, {"fr"}, function(locale, value) return COLORS_KWords_fr.Crit_hit_rgb_fr.." garranti activé. Temps de recharge : "..COLORS_Numbers.cd_var_rgb.." secondes." end),

		--[+ Counterattack +]--
			-- Relic Blade -- 4% | 6% | 8% | 10%
	create_template("trait_bespoke_067m_desc_ext_en", {"loc_attack_speed_on_perfect_block_desc"}, {"en"}, function(locale, value) return "Gains "..COLORS_Numbers.attack_spd_var_rgb.." Attack Speed for "..COLORS_Numbers.dur_var_rgb.." seconds on a Perfect Block. Can only occur once every "..COLORS_Numbers.interval_var_rgb.." seconds." end), -- attack_speed: 10%, duration: 3, interval: 8 -- colors
			--[+ French +]--
	create_template("trait_bespoke_067m_desc_ext_fr", {"loc_attack_speed_on_perfect_block_desc"}, {"fr"}, function(locale, value) return "Gagnez "..COLORS_Numbers.attack_spd_var_rgb.." de Vitesse d'attaque pendant "..COLORS_Numbers.dur_var_rgb.." secondes lors d'un blocage parfait. Ne peux se produire que toute les "..COLORS_Numbers.interval_var_rgb.." secondes." end),

		--[+ Cranial Grounding +]--
			-- Relic Blade -- 3% & 1% | 4% & 2% | 5%& 3% | 6% & 4% (up to ~26.6% & +20%)
	create_template("trait_bespoke_068m_desc_ext_en", {"loc_chained_weakspot_hits_increase_finesse_and_reduce_overheat_desc"}, {"en"}, function(locale, value) return "Reduces "..COLORS_KWords.Heat_rgb.." buildup by "..COLORS_Numbers.buildup_var_rgb.." and increases "..COLORS_KWords.Weakspot_dmg_rgb.." by "..COLORS_Numbers.dmg_var_rgb.." for "..COLORS_Numbers.dur_var_rgb.." seconds on chained "..COLORS_KWords.Weakspothits_rgb..". Stacks "..COLORS_Numbers.stacks_var_rgb.." times." end), -- buildup_amount: 6%, damage: 4%, duration: 3 , stacks: 5 -- s->seconds -- colors
			--[+ French +]--
	create_template("trait_bespoke_068m_desc_ext_fr", {"loc_chained_weakspot_hits_increase_finesse_and_reduce_overheat_desc"}, {"fr"}, function(locale, value) return "Réduit la génération de "..COLORS_KWords_fr.Heat_rgb_fr.." de "..COLORS_Numbers.buildup_var_rgb.." et augmente les "..COLORS_KWords_fr.Weakspot_dmg_rgb_fr.." de "..COLORS_Numbers.dmg_var_rgb.." pendant "..COLORS_Numbers.dur_var_rgb.." secondes lors de "..COLORS_KWords_fr.Weakspothit_rgb_fr.." répétés. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois." end),

		--[+ Overload +]--
			-- Relic Blade -- 10% | 15% | 20% | 25%
	create_template("trait_bespoke_069m_desc_ext_en", {"loc_explosion_on_overheat_lockout_desc"}, {"en"}, function(locale, value) return "Upon reaching the Lockout state, you cause an Explosion around you and immediately reduce "..COLORS_KWords.Heat_rgb.." by "..COLORS_Numbers.overheat_red_var_rgb..COLORS_Numbers.pc_rgb.."." end), -- overheat_reduction: 25% -- colors
			--[+ French +]--
	create_template("trait_bespoke_069m_desc_ext_fr", {"loc_explosion_on_overheat_lockout_desc"}, {"fr"}, function(locale, value) return "Lorsque vous entrez en état de Verouillage, vous produisez une Explosion autour de vous et réduisez immédiatement la "..COLORS_KWords_fr.Heat_rgb_fr.." de "..COLORS_Numbers.overheat_red_var_rgb..COLORS_Numbers.pc_rgb.."." end),

		--[+ Energy Leakage +]--
			-- Relic Blade -- 1.5% | 2% | 3% | 4% (up to +20%)
	create_template("trait_bespoke_070m_desc_ext_en", {"loc_power_bonus_scaled_on_heat_desc"}, {"en"}, function(locale, value) return "Increases "..COLORS_KWords.Strength_rgb.." up to "..COLORS_Numbers.amount_var_rgb..", scaled on "..COLORS_KWords.Heat_rgb.."."..COLORS_KWords.Pwr_note_rgb end), -- amount: 4% -- colors
			--[+ French +]--
	create_template("trait_bespoke_070m_desc_ext_fr", {"loc_power_bonus_scaled_on_heat_desc"}, {"fr"}, function(locale, value) return "Augmente la "..COLORS_KWords_fr.Strength_rgb_fr.." jusqu'à "..COLORS_Numbers.amount_var_rgb..", en fonction de la "..COLORS_KWords_fr.Heat_rgb_fr.."."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Heatsink +]--
			-- Relic Blade -- 4% | 6% | 8% | 10%
	create_template("trait_bespoke_071m_desc_ext_en", {"loc_reduce_fixed_overheat_amount_desc"}, {"en"}, function(locale, value) return COLORS_KWords.Weakspot_rgb.." Kills and "..COLORS_KWords.Crit_strike_rgb.." Kills reduces "..COLORS_KWords.Heat_rgb.." by "..COLORS_Numbers.amount_var_rgb.." over "..COLORS_Numbers.time_var_rgb.." seconds." end), -- amount: 10%, time: 3 -- s->seconds -- colors
			--[+ French +]--
	create_template("trait_bespoke_071m_desc_ext_fr", {"loc_reduce_fixed_overheat_amount_desc"}, {"fr"}, function(locale, value) return "Les éliminations sur "..COLORS_KWords_fr.Weakspot_rgb_fr.." et "..COLORS_KWords_fr.Crit_hits_rgb_fr.." réduisent la "..COLORS_KWords_fr.Heat_rgb_fr.." de "..COLORS_Numbers.amount_var_rgb.." sur "..COLORS_Numbers.time_var_rgb.." secondes." end),

		--[+ Syphon +]--
			-- Relic Blade -- 10% | 12% | 14% | 16%
	create_template("trait_bespoke_072m_desc_ext_en", {"loc_trait_bespoke_regain_toughness_on_multiple_hits_by_weapon_special_desc"}, {"en"}, function(locale, value) return "Hitting at least "..COLORS_Numbers.n_3_rgb.." enemies with an attack while weapon Special is active, regains "..COLORS_Numbers.tghns_var_rgb.." "..COLORS_KWords.Toughness_rgb.."." end), -- toughness: 16% -- colors
			--[+ French +]--
	create_template("trait_bespoke_072m_desc_ext_fr", {"loc_trait_bespoke_regain_toughness_on_multiple_hits_by_weapon_special_desc"}, {"fr"}, function(locale, value) return "Toucher au moins "..COLORS_Numbers.n_3_rgb.." ennemis avec une attaque lorsque la forme Spéciale de l'arme est active, restaure "..COLORS_Numbers.tghns_var_rgb.." de "..COLORS_KWords_fr.Toughness_rgb_fr.."." end),

		--[+ Energy Transfer +]--
			-- Relic Blade -- 14% & 2% | 16% & 3% | 18% & 4% | 20% & 5%
	create_template("trait_bespoke_073m_desc_ext_en", {"loc_slower_heat_buildup_on_perfect_block_desc"}, {"en"}, function(locale, value) return "Reduces "..COLORS_KWords.Heat_rgb.." buildup by "..COLORS_Numbers.heat_red_var_rgb.." and increases "..COLORS_KWords.Heat_rgb.." dissipation by "..COLORS_Numbers.heat_diss_var_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on a Perfect Block. Can only occur once every "..COLORS_Numbers.interval_var_rgb.." seconds." end), -- heat_reduction: 20%, heat_dissipation: 5%, time: 5, interval: 8 -- colors
			--[+ French +]--
	create_template("trait_bespoke_073m_desc_ext_fr", {"loc_slower_heat_buildup_on_perfect_block_desc"}, {"fr"}, function(locale, value) return "Réduit la génération de "..COLORS_KWords_fr.Heat_rgb_fr.." de "..COLORS_Numbers.heat_red_var_rgb.." et augmente la dissipation de "..COLORS_KWords_fr.Heat_rgb_fr.." de "..COLORS_Numbers.heat_diss_var_rgb.." pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'un blocage parfait. Ne peux se produire que toute les "..COLORS_Numbers.interval_var_rgb.." secondes." end),


	--[+ Ranged +]--
		--[+ Raking Fire +]--
			-- Autopistol, Infantry Autoguns, Laspistols -- 32.5% | 35% | 37.5% | 40%
	create_template("trait_bespoke_065_desc_ext_en", {"loc_trait_bespoke_allow_flanking_and_increased_damage_when_flanking_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." when shooting Enemies in the back." end), -- damage: +40% -- colors
			--[+ French +]--
	create_template("trait_bespoke_065_desc_ext_fr", {"loc_trait_bespoke_allow_flanking_and_increased_damage_when_flanking_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." de "..COLORS_KWords_fr.Damage_rgb_fr.." lorsque vous tirez dans le dos des ennemies." end),

		--[+ Dumdum +]--
			-- Infantry Autoguns, Laspistols, Recon Lasguns -- 4.5% | 5% | 5.5% | 6% (up to +30%)
	create_template("trait_bespoke_066_desc_ext_en", {"loc_trait_bespoke_consecutive_hits_increases_close_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." Close Range "..COLORS_KWords.Damage_rgb.." on Repeated Hit. Stacks "..COLORS_Numbers.stacks_var_rgb.." times." end), -- damage: +6%, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_066_desc_ext_fr", {"loc_trait_bespoke_consecutive_hits_increases_close_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." de "..COLORS_KWords_fr.Damage_rgb_fr.." rapprochés lors d'un coup répété. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois." end),

		--[+ Hit & Run /  Hit and Run +]--
			-- Braced Autoguns, Combat Shotguns, Double-Barrel Shotgun, Infantry Autoguns, Recon Lasguns -- 0.7 | 0.8 | 0.9 | 1
		create_template("trait_bespoke_067_ext_en", {"loc_trait_bespoke_count_as_dodge_vs_ranged_on_close_kill"}, {"en"}, function(locale, value) return "Hit and Run" end), -- &->and
	create_template("trait_bespoke_067_desc_ext_en", {"loc_trait_bespoke_count_as_dodge_vs_ranged_on_close_kill_desc"}, {"en"}, function(locale, value) return "Immune to Ranged Attacks for "..COLORS_Numbers.time_var_rgb.." second on Kill at a distance of up to "..COLORS_Numbers.n_12_5_rgb.." meters." end), -- time: 1.0 -- s->second -- colors
			--[+ French +]--
	create_template("trait_bespoke_067_desc_ext_fr", {"loc_trait_bespoke_count_as_dodge_vs_ranged_on_close_kill_desc"}, {"fr"}, function(locale, value) return "Immunité contre les attaques à distance pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'une élimination à moins de "..COLORS_Numbers.n_12_5_rgb.." mètres." end),

		--[+ Sustained Fire +]--
			-- Autopistol, Electrokinetic Staff, Helbore Lasguns, Infantry Autoguns, Recon Lasguns, Stub Revolvers, Voidblast Staff, Voidstrike Staff -- 14% | 16% | 18% | 20%
	create_template("trait_bespoke_068_desc_ext_en", {"loc_trait_bespoke_followup_shots_ranged_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." on Second, Third and Fourth shots in a Salvo."..COLORS_KWords.Trauma_note_rgb end), -- damage: +20% -- colors
			--[+ French +]--
	create_template("trait_bespoke_068_desc_ext_fr", {"loc_trait_bespoke_followup_shots_ranged_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." de "..COLORS_KWords_fr.Damage_rgb_fr.." lors des "..COLORS_Numbers.n_2e_rgb..", "..COLORS_Numbers.n_3e_rgb..", "..COLORS_Numbers.n_4e_rgb.." tirs d'une salve." end),

		--[+ Punishing Salvo +]--
			-- Infantry Autoguns, Recon Lasguns -- 35% | 40% | 45% | 50%
	create_template("trait_bespoke_069_desc_ext_en", {"loc_trait_bespoke_followup_shots_ranged_weakspot_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Weakspot_dmg_rgb.." on Second, Third and Fourth shots in a Salvo." end), -- damage: +50% -- colors
			--[+ French +]--
	create_template("trait_bespoke_069_desc_ext_fr", {"loc_trait_bespoke_followup_shots_ranged_weakspot_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." de "..COLORS_KWords_fr.Weakspot_dmg_rgb_fr.." lors des "..COLORS_Numbers.n_2e_rgb..", "..COLORS_Numbers.n_3e_rgb..", "..COLORS_Numbers.n_4e_rgb.." tirs d'une salve." end),

		--[+ Fire Frenzy +]--
			-- Boltgun, Braced Autoguns, Combat Shotguns, Heavy Stubbers, Infantry Autoguns, Ripper Guns -- 7% | 8% | 9% | 10% (up to +50%)
	create_template("trait_bespoke_070_desc_ext_en", {"loc_trait_bespoke_increase_close_damage_on_close_kill_desc"}, {"en"}, function(locale, value) return "You gain "..COLORS_Numbers.p_dmgcls_var_rgb.." Close "..COLORS_KWords.Damage_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds after killing an enemy at a distance of up to "..COLORS_Numbers.n_12_5_rgb.." meters. Stacks "..COLORS_Numbers.stacks_var_rgb.." times." end), -- close_damage: +10%, time: 3.5, stacks: 5 -- rewrite -- colors
			--[+ French +]--
	create_template("trait_bespoke_070_desc_ext_fr", {"loc_trait_bespoke_increase_close_damage_on_close_kill_desc"}, {"fr"}, function(locale, value) return "Gagnez "..COLORS_Numbers.p_dmgcls_var_rgb.." de "..COLORS_KWords_fr.Damage_rgb_fr.." rapprochés pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'une élimination à moins de "..COLORS_Numbers.n_12_5_rgb.." mètres. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois." end),

		--[+ Deathspitter +]--
			-- Braced Autoguns, Combat Shotguns, Heavy Stubbers, Infantry Autoguns, Recon Lasguns -- 5% | 5.5% | 6% | 6.5% (up to +32.5%) | 3.5s
			-- Double-Barrel Shotgun -- 5% | 5.5% | 6% | 6.5% (up to +32.5%) | 5s
	create_template("trait_bespoke_071_desc_ext_en", {"loc_trait_bespoke_increase_power_on_close_kill_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on Kill at a distance of up to "..COLORS_Numbers.n_12_5_rgb.." meters. Up to "..COLORS_Numbers.n_5_rgb.." Stacks."..COLORS_KWords.Pwr_note_rgb end), -- power_level: 6.5%, time: 3.5, stacks: 5 -- rewrite -- colors -- Note
			--[+ French +]--
	create_template("trait_bespoke_071_desc_ext_fr", {"loc_trait_bespoke_increase_power_on_close_kill_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'une élimination à moins de "..COLORS_Numbers.n_12_5_rgb.." mètres. Se cumule jusqu'à "..COLORS_Numbers.n_5_rgb.." fois."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Stripped Down +]--
			-- Braced Autoguns, Infantry Autoguns, Recon Lasguns -- 80% | 70% | 60% | 50%
	create_template("trait_bespoke_072_desc_ext_en", {"loc_trait_bespoke_increased_sprint_speed_desc"}, {"en"}, function(locale, value) return "Gain Ranged Attack Immunity while Sprinting with over "..COLORS_Numbers.stam_var_rgb.." "..COLORS_KWords.Stamina_rgb.."."..COLORS_KWords.Fire_n_trap_note_rgb end), -- stamina: 50% -- colors
			--[+ French +]--
	create_template("trait_bespoke_072_desc_ext_fr", {"loc_trait_bespoke_increased_sprint_speed_desc"}, {"fr"}, function(locale, value) return "Gagnez une immunité contre les attaques à distance lorsque vous courez avec plus de "..COLORS_Numbers.stam_var_rgb.." d'"..COLORS_KWords_fr.Stamina_rgb_fr.."." end),

		--[+ Speedload +]--
			-- Autopistol -- 7% | 8% | 9% | 10% (up to +50%) | 2s
			-- Braced Autoguns, Infantry Autoguns -- 7% | 8% | 9% | 10% (up to +50%) | 2.5s 
			-- Double-Barrel Shotgun, Laspistols, Recon Lasguns -- 7% | 8% | 9% | 10% (up to +50%) | 3s
			-- Stub Revolvers -- 7% | 8% | 9% | 10% (up to +50%) | 4s
		create_template("trait_bespoke_073_desc_ext_en", {"loc_trait_bespoke_reload_speed_on_slide_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_reload_var_rgb.." Reload Speed for "..COLORS_Numbers.time_var_rgb.." seconds after Kill at a distance of up to "..COLORS_Numbers.n_12_5_rgb.." meters. Stacks "..COLORS_Numbers.stacks_var_rgb.." times." end), -- reload_speed: 10%, time: 2.5, stacks: 5 -- rewrite -- colors -- Note
			--[+ French +]--
		create_template("trait_bespoke_073_desc_ext_fr", {"loc_trait_bespoke_reload_speed_on_slide_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_reload_var_rgb.." de vitesse de rechargement pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'une élimination à moins de "..COLORS_Numbers.n_12_5_rgb.." mètres. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois." end),

		--[+ Terrifying Barrage +]--
			-- Autopistol, Boltgun, Braced Autoguns, Combat Shotguns, Double-Barrel Shotgun, Electrokinetic Staff, Heavy Stubbers, Infantry Autoguns, Inferno Staff, Kickback, Ripper Guns, Stub Revolvers, Voidblast Staff, Voidstrike Staff -- 15 | 20 | 25 | 30
	create_template("trait_bespoke_074_desc_ext_en", {"loc_trait_bespoke_suppression_on_close_kill_desc"}, {"en"}, function(locale, value) return "Suppress Enemies on Kill at a distance of up to "..COLORS_Numbers.n_12_5_rgb.." meters." end), -- rewrite -- colors 5m->5meters
			--[+ French +]--
	create_template("trait_bespoke_074_desc_ext_fr", {"loc_trait_bespoke_suppression_on_close_kill_desc"}, {"fr"}, function(locale, value) return "Infligez Suppression aux ennemies lors d'une élimination jusqu'à une distance de "..COLORS_Numbers.n_12_5_rgb.." mètres." end),

		--[+ Roaring Advance +]--
			-- Braced Autoguns -- 10% | 15% | 20% | 25% (up to ~76%)
			-- Heavy Stubbers -- 7% | 8% | 9% | 10% (up to ~41%)
	create_template("trait_bespoke_075_desc_ext_en", {"loc_trait_bespoke_movement_speed_on_continuous_fire_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.m_movspd_var_rgb.." Movement Speed Reduction for every "..COLORS_Numbers.ammo_var_rgb.." of magazine spent during continuous fire. Stacks "..COLORS_Numbers.stacks_var_rgb.." times." end), -- movement_speed: 25%, ammo: 5%, stacks: 5 -- s->seconds -- colors
			--[+ French +]--
	create_template("trait_bespoke_075_desc_ext_fr", {"loc_trait_bespoke_movement_speed_on_continuous_fire_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.m_movspd_var_rgb.." de réduction de vitesse de déplacement pour chaque "..COLORS_Numbers.ammo_var_rgb.." du chargeur utilisé en tir continu. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois." end),

		--[+ Ceaseless Barrage +]--
			-- Braced Autoguns, Heavy Stubbers -- 20% & 6% | 20% & 6% | 20% & 6% | 20% & 6% (up to +100% & +30%)
	create_template("trait_bespoke_076_desc_ext_en", {"loc_trait_bespoke_suppression_on_continuous_fire_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_spprsn_var_rgb.." Suppression and "..COLORS_Numbers.p_dmgvsprsd_var_rgb.." "..COLORS_KWords.Damage_rgb.." against Suppressed Enemies for every "..COLORS_Numbers.ammo_var_rgb.." of magazine spent during continuous fire. Stacks "..COLORS_Numbers.stacks_var_rgb.." times." end), -- suppression: +20%, damage_vs_suppressed: +6%, ammo: 2.5%, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_076_desc_ext_fr", {"loc_trait_bespoke_suppression_on_continuous_fire_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_spprsn_var_rgb.." de suppression et "..COLORS_Numbers.p_dmgvsprsd_var_rgb.." de "..COLORS_KWords_fr.Damage_rgb_fr.." contre les ennemies sous suppression pour chaque "..COLORS_Numbers.ammo_var_rgb.." du chargeur utilisé en tir continu. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois." end),

		--[+ Inspiring Barrage +]--
			-- Autopistol, Boltgun, Braced Autoguns, Flamer, Heavy Stubbers, Ripper Guns -- 1% | 2% | 3% | 4% (up to 20%)
	create_template("trait_bespoke_077_desc_ext_en", {"loc_trait_bespoke_toughness_on_continuous_fire_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_tghns_var_rgb.." "..COLORS_KWords.Toughness_rgb.." for every "..COLORS_Numbers.ammo_var_rgb.." of magazine spent during continuous fire. Stacks "..COLORS_Numbers.stacks_var_rgb.." times." end), -- toughness: +4%, ammo: 10%, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_077_desc_ext_fr", {"loc_trait_bespoke_toughness_on_continuous_fire_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_tghns_var_rgb.." de "..COLORS_KWords_fr.Toughness_rgb_fr.." pour chaque "..COLORS_Numbers.ammo_var_rgb.." du chargeur utilisé en tir continu. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois." end),

		--[+ Ghost +]--
			-- Infantry Lasguns, Laspistols, Vigilant Autoguns -- 0.6 | 0.8 | 1 | 1.2
	create_template("trait_bespoke_078_desc_ext_en", {"loc_trait_bespoke_count_as_dodge_vs_ranged_on_weakspot_desc"}, {"en"}, function(locale, value) return "Immune to Ranged Attacks for "..COLORS_Numbers.time_var_rgb.." seconds on "..COLORS_KWords.Weakspothit_rgb.."." end), -- time: 1.2 -- colors
			--[+ French +]--
	create_template("trait_bespoke_078_desc_ext_fr", {"loc_trait_bespoke_count_as_dodge_vs_ranged_on_weakspot_desc"}, {"fr"}, function(locale, value) return "Immunité contre les attaques à distance pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'un "..COLORS_KWords_fr.Weakspothit_rgb_fr.."." end),

		--[+ Surgical +]--
			-- Boltgun, Kickback, Vigilant Autoguns -- 0.35s | 0.3s | 0.25s | 0.2s
			-- Stub Revolvers, Bolt Pistol, Helbore Lasguns -- 0.45s | 0.4s | 0.35s | 0.3s
	create_template("trait_bespoke_079_desc_ext_en", {"loc_trait_bespoke_crit_chance_based_on_aim_time_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords.Crit_chance_rgb.." for every "..COLORS_Numbers.time_var_rgb.." seconds while aiming. Stacks "..COLORS_Numbers.stacks_var_rgb.." times. Discharges all Stacks upon firing." end), -- crit_chance: +10%, time: 0.2, stacks: 10 -- colors second->seconds
			--[+ French +]--
	create_template("trait_bespoke_079_desc_ext_fr", {"loc_trait_bespoke_crit_chance_based_on_aim_time_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords_fr.Crit_chance_rgb_fr.." chaque fois de vous passez "..COLORS_Numbers.time_var_rgb.." secondes à viser. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois. Tous les cumuls sont déchargés lorsque vous tirez." end),

		--[+ Crucian Roulette +]--
			-- Stub Revolvers -- 4.5% | 5% | 5.5% | 6%
			-- Vigilant Autoguns -- 0.45% | 0.5% | 0.55% | 0.6%
	create_template("trait_bespoke_080_desc_ext_en", {"loc_trait_bespoke_crit_chance_based_on_ammo_left_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords.Crit_chance_rgb.." for each expended round in your weapon. Resets on reload." end), -- crit_chance: +0.6% -- colors
			--[+ French +]--
	create_template("trait_bespoke_080_desc_ext_fr", {"loc_trait_bespoke_crit_chance_based_on_ammo_left_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords_fr.Crit_chance_rgb_fr.." pour chaque munition utilisée dans vontre arme. Se réinitialise lorsque vous rechargez." end),

		--[+ Deadly Accurate +]--
			-- Bolt Pistol, Infantry Lasguns, Vigilant Autoguns -- 70% | 80% | 90% | 100%
	create_template("trait_bespoke_081_desc_ext_en", {"loc_trait_bespoke_crit_weakspot_finesse_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_critwkspdmg_var_rgb.." "..COLORS_KWords.Crit_rgb.." "..COLORS_KWords.Weakspot_dmg_rgb.."." end), -- crit_weakspot_damage: +100% -- colors
			--[+ French +]--
	create_template("trait_bespoke_081_desc_ext_fr", {"loc_trait_bespoke_crit_weakspot_finesse_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_critwkspdmg_var_rgb.." de "..COLORS_KWords_fr.Crit_dmg_r_rgb_fr.." sur un "..COLORS_KWords_fr.Weakspothit_rgb_fr.."." end),

		--[+ No Respite +]--
			-- Combat Shotguns, Helbore Lasguns, Infantry Lasguns, Vigilant Autoguns -- 14% | 16% | 18% | 20% (up to +140%)
	create_template("trait_bespoke_082_desc_ext_en", {"loc_trait_bespoke_stagger_count_bonus_damage_desc"}, {"en"}, function(locale, value) return "Up to "..COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." on Hit to "..COLORS_KWords.Staggered_rgb.." Enemy. The more powerful the effect on the enemy, the more "..COLORS_KWords.Damage_rgb.." they receive." end), -- damage: +20% -- rewrite -- colors
			--[+ French +]--
	create_template("trait_bespoke_082_desc_ext_fr", {"loc_trait_bespoke_stagger_count_bonus_damage_desc"}, {"fr"}, function(locale, value) return "Jusqu'à "..COLORS_Numbers.p_dmg_var_rgb.." de "..COLORS_KWords_fr.Damage_rgb_fr.." lors d'un coup sur un ennemi qui "..COLORS_KWords_fr.Staggered_rgb_fr..". Le plus l'ennemie "..COLORS_KWords_fr.Staggered_rgb_fr.." le plus il reçoit de "..COLORS_KWords_fr.Damage_rgb_fr.."." end),

		--[+ Opening Salvo +]--
			-- Infantry Lasguns, Vigilant Autoguns -- 14% | 16% | 18% | 20%
	create_template("trait_bespoke_083_desc_ext_en", {"loc_trait_bespoke_power_bonus_on_first_shot_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb.." on Salvo's First shot."..COLORS_KWords.Pwr_note_rgb end), -- power_level: +20% -- colors
			--[+ French +]--
	create_template("trait_bespoke_083_desc_ext_fr", {"loc_trait_bespoke_power_bonus_on_first_shot_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." lors du premier tir d'une salve."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Headhunter +]--
			-- Infantry Lasguns, Vigilant Autoguns -- 14% | 16% | 18% | 20% (up to +100%)
			-- Recon Lasguns -- 3.5% | 4% | 4.5% | 5% (up to +20%)
	create_template("trait_bespoke_084_desc_ext_en", {"loc_trait_bespoke_weakspot_stacking_crit_chance_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords.Crit_chance_rgb.." on "..COLORS_KWords.Weakspothit_rgb.." until your next "..COLORS_KWords.Crit_hit_rgb..". Stacks "..COLORS_Numbers.stacks_var_rgb.." times." end), -- crit_chance: +20%, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_084_desc_ext_fr", {"loc_trait_bespoke_weakspot_stacking_crit_chance_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords_fr.Crit_chance_rgb_fr.." sur un "..COLORS_KWords_fr.Weakspothit_rgb_fr.." jusqu'à votre prochain "..COLORS_KWords_fr.Crit_hit_rgb_fr..". Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois." end),

		--[+ Between the Eyes +]--
			-- Infantry Lasguns, Laspistols, Vigilant Autoguns -- 2.4 | 2.8 | 3.2 | 3.6
	create_template("trait_bespoke_085_desc_ext_en", {"loc_trait_bespoke_suppression_negation_on_weakspot_desc"}, {"en"}, function(locale, value) return "Gain Suppression Immunity for "..COLORS_Numbers.time_var_rgb.." seconds on "..COLORS_KWords.Weakspothit_rgb.."." end), -- time: 3.6 -- s->seconds -- colors
			--[+ French +]--
	create_template("trait_bespoke_085_desc_ext_fr", {"loc_trait_bespoke_suppression_negation_on_weakspot_desc"}, {"fr"}, function(locale, value) return "Gagnez une immunité à la suppression pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'un "..COLORS_KWords_fr.Weakspothit_rgb_fr.."." end),

		--[+ Blaze Away +]--
			-- Autopistol, Flamer, Heavy Stubbers, Ripper Guns, Grenadier Gauntlet, Inferno Staff, Kickback, Plasma Gun, Rumbler -- 5% | 6% | 7% | 8% (up to +40%)
	create_template("trait_bespoke_086_desc_ext_en", {"loc_trait_bespoke_power_bonus_on_continuous_fire_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb.." for every "..COLORS_Numbers.ammo_var_rgb.." of magazine spent during continuous fire. Stacks "..COLORS_Numbers.stacks_var_rgb.." times."..COLORS_KWords.Pwr_note_rgb end), -- power_level: +8%, ammo: 10%, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_086_desc_ext_fr", {"loc_trait_bespoke_power_bonus_on_continuous_fire_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." pour chaque "..COLORS_Numbers.ammo_var_rgb.."  du chargeur utilisé en tir continu. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Powderburn +]--
			-- Autopistol -- 14% & 28% & -28% | 16% & 32% & -32% | 18% & 36% & -36% | 20% & 40% & -40%
	create_template("trait_bespoke_087_desc_ext_en", {"loc_trait_bespoke_recoil_reduction_and_suppression_increase_on_close_kills_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." against Suppressed Enemies, "..COLORS_Numbers.p_spprsn_var_rgb.." Suppression and "..COLORS_Numbers.m_recoil_red_var_rgb.." Recoil on at a distance of up to "..COLORS_Numbers.n_12_5_rgb.." meters." end), -- damage: +20%, suppression: +40%, recoil_reduction: -40% -- colors
			--[+ French +]--
	create_template("trait_bespoke_087_desc_ext_fr", {"loc_trait_bespoke_recoil_reduction_and_suppression_increase_on_close_kills_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." de "..COLORS_KWords_fr.Damage_rgb_fr.." contre les ennemies subissant Suppression, "..COLORS_Numbers.p_spprsn_var_rgb.." de suppression et "..COLORS_Numbers.m_recoil_red_var_rgb.." de recul jusqu'à une distance de "..COLORS_Numbers.n_12_5_rgb.." mètres." end),

		--[+ Cavalcade +]--
			-- Autopistol, Boltgun, Ripper Guns -- 3.5% | 4% | 4.5% | 5% (up to +25%)
	create_template("trait_bespoke_088_desc_ext_en", {"loc_trait_bespoke_stacking_crit_bonus_on_continuous_fire_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords.Crit_chance_rgb.." for every "..COLORS_Numbers.ammo_var_rgb.." of magazine spent during continuous fire. Stacks "..COLORS_Numbers.stacks_var_rgb.." times." end), -- crit_chance: +20%, ammo: 10%, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_088_desc_ext_fr", {"loc_trait_bespoke_stacking_crit_bonus_on_continuous_fire_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." de "..COLORS_KWords_fr.Crit_chance_rgb_fr.." pour chaque "..COLORS_Numbers.ammo_var_rgb.."  du chargeur utilisé en tir continu. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois." end),

		--[+ Pinning Fire +]--
			-- Autopistol, Boltgun -- 4.25% | 4.5% | 4.75% | 5% (up to +25%)
	create_template("trait_bespoke_089_desc_ext_en", {"loc_trait_bespoke_stacking_power_bonus_on_staggering_enemies_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb.." for every Enemy you "..COLORS_KWords.Stagger_rgb..". Stacks "..COLORS_Numbers.stacks_var_rgb.." times."..COLORS_KWords.Pwr_note_rgb end), -- power_level: +8%, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_089_desc_ext_fr", {"loc_trait_bespoke_stacking_power_bonus_on_staggering_enemies_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." pour chaque ennemie que vous faites "..COLORS_KWords_fr.Staggering_rgb_fr..". Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Run 'n' Gun (Run and Gun ) +]--
			-- Bolt Pistol, Electrokinetic Staff, Inferno Staff, Kickback, Stub Revolvers, Voidblast Staff, Voidstrike Staff -- 6% | 9% | 12% | 15% | -30%
			-- Double-Barrel Shotgun -- 6% | 9% | 12% | 15% | -10%
	create_template("trait_bespoke_090_desc_ext_en", {"loc_trait_bespoke_allow_hipfire_while_sprinting_and_bonus_stats_desc"}, {"en"}, function(locale, value) return "You can Hipfire with this weapon while Sprinting. "..COLORS_Numbers.p_dmgnr_var_rgb.." Close "..COLORS_KWords.Damage_rgb.." while Sprinting. Also reduces weapon Spread at all times by "..COLORS_Numbers.weapsprd_var_rgb.."." end), -- damage_near: +15%, weapon_spread: 30% -- colors
			--[+ French +]--
	create_template("trait_bespoke_090_desc_ext_fr", {"loc_trait_bespoke_allow_hipfire_while_sprinting_and_bonus_stats_desc"}, {"fr"}, function(locale, value) return "Vous pouvez tirer à l'aveugle avec cette arme en courant. "..COLORS_Numbers.p_dmgnr_var_rgb.." de "..COLORS_KWords_fr.Damage_rgb_fr.." rapprochés en courant. Réduit également l'angle de tir des armes de "..COLORS_Numbers.weapsprd_var_rgb.." en toute circonstance." end),

		--[+ Puncture +]--
			-- Boltgun, Bolt Pistol -- 1 | 2 | 3 | 4
	create_template("trait_bespoke_091_desc_ext_en", {"loc_trait_bespoke_bleed_on_ranged_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.stacks_var_rgb.." Stacks of "..COLORS_KWords.Bleed_rgb.." to enemies on Ranged hits." end), -- stacks: 4 -- colors
			--[+ French +]--
	create_template("trait_bespoke_091_desc_ext_fr", {"loc_trait_bespoke_bleed_on_ranged_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.stacks_var_rgb.." Cumuls de "..COLORS_KWords_fr.Bleed_rgb_fr.." aux ennemis sur les coups à distance." end),

		--[+ Lethal Proximity +]--
			-- Bolt Pistol -- 10% | 15% | 20% | 25%
	create_template("trait_bespoke_092_desc_ext_en", {"loc_trait_bespoke_close_explosion_desc"}, {"en"}, function(locale, value) return "Point blank shots cause an Explosion. Explosion Radius increases by "..COLORS_Numbers.p_radius_var_rgb.."." end), -- radius: +25% -- colors
			--[+ French +]--
	create_template("trait_bespoke_092_desc_ext_fr", {"loc_trait_bespoke_close_explosion_desc"}, {"fr"}, function(locale, value) return "Les tirs à bout portant provoquent une explosion. Le rayon d'explosion augmente de "..COLORS_Numbers.p_radius_var_rgb.."." end),

		--[+ Point Blank +]--
			-- Bolt Pistol -- 14% | 16% | 18% | 20% | 3.5s
			-- Stub Revolvers -- 14% | 16% | 18% | 20% | 2.5s
	create_template("trait_bespoke_093_desc_ext_en", {"loc_trait_bespoke_crit_chance_bonus_on_melee_kills_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." Ranged "..COLORS_KWords.Crit_chance_rgb.." after Melee Kill for "..COLORS_Numbers.time_var_rgb.." seconds." end), -- crit_chance: +20%, time: 3.5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_093_desc_ext_fr", {"loc_trait_bespoke_crit_chance_bonus_on_melee_kills_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." de "..COLORS_KWords_fr.Crit_chance_rgb_fr.." à distance après une élimination avec une arme de mélée pendant "..COLORS_Numbers.time_var_rgb.." secondes." end),

		--[+ Execution +]--
			-- Bolt Pistol -- 5% |10% | 15% | 20%
	create_template("trait_bespoke_094_desc_ext_en", {"loc_trait_bespoke_damage_vs_stagger_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmgvsstgr_var_rgb.." "..COLORS_KWords.Damage_rgb.." Bonus vs "..COLORS_KWords.Staggered_rgb.." enemies." end), -- vs_stagger: 20% -- colors
			--[+ French +]--
	create_template("trait_bespoke_094_desc_ext_fr", {"loc_trait_bespoke_damage_vs_stagger_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmgvsstgr_var_rgb.." de "..COLORS_KWords_fr.Damage_rgb_fr.." Bonus contre les ennemis qui "..COLORS_KWords_fr.Staggered_rgb_fr.."." end),

		--[+ Gloryhunter +]--
			-- Boltgun -- 10% | 12% | 14% | 16%
			-- Plasma Gun -- 17.5% | 20% | 22.5% | 25%
			-- Bolt Pistol, Stub Revolvers -- 18% | 22% | 26% | 30%
			-- Grenadier Gauntlet -- 20% | 25% | 30% | 35%
	create_template("trait_bespoke_095_desc_ext_en", {"loc_trait_bespoke_toughness_on_elite_kills_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_tghns_var_rgb.." "..COLORS_KWords.Toughness_rgb.." on Elite Kill." end), -- toughness: +30% -- colors
			--[+ French +]--
	create_template("trait_bespoke_095_desc_ext_fr", {"loc_trait_bespoke_toughness_on_elite_kills_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_tghns_var_rgb.." de "..COLORS_KWords_fr.Toughness_rgb_fr.." lors d'une élimination d'élite." end),

		--[+ Surge +]--
			-- Electrokinetic Staff, Voidblast Staff, Voidstrike Staff -- 2% | 3% | 4% | 5%
	create_template("trait_bespoke_096_desc_ext_en", {"loc_trait_bespoke_double_shot_on_primary_crit_and_crit_chance_desc","loc_trait_bespoke_double_shot_on_crit_and_crit_chance_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." Ranged "..COLORS_KWords.Crit_chance_rgb..".\n"..COLORS_Numbers.value_var_rgb.." Shots on Primary "..COLORS_KWords.Crit_hit_rgb.."." end), -- crit_chance: +5%, value: 2 -- rewrite -- colors
			--[+ French +]--
	create_template("trait_bespoke_096_desc_ext_fr", {"loc_trait_bespoke_double_shot_on_primary_crit_and_crit_chance_desc","loc_trait_bespoke_double_shot_on_crit_and_crit_chance_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." de "..COLORS_KWords_fr.Crit_chance_rgb_fr.." à distance.\n"..COLORS_Numbers.value_var_rgb.." tirs lors d'un "..COLORS_KWords_fr.Crit_hit_rgb_fr.." de l'attaque principale (fonctionne sur l'attaque secondaire du Bâton de force \"Assaut du vide\")." end),

		--[+ Warp Flurry +]-- 
			-- Electrokinetic Staff, Inferno Staff, Voidblast Staff, Voidstrike Staff -- 5.5% | 6.5% | 7.5% | 8.5% (up to 25.5%)
	create_template("trait_bespoke_097_desc_ext_en", {"loc_trait_bespoke_faster_charge_on_chained_secondary_attacks_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.chrgtime_var_rgb.." Charge Time on Chained Secondary Attack. Stacks "..COLORS_Numbers.stacks_var_rgb.." times." end), -- charge_time: -8.5%, stacks: 3 -- colors
			--[+ French +]--
	create_template("trait_bespoke_097_desc_ext_fr", {"loc_trait_bespoke_faster_charge_on_chained_secondary_attacks_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.chrgtime_var_rgb.." de temps de charge lors d'une attaque secondaire. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois." end), 

		--[+ Warp Nexus +]--
			-- Electrokinetic Staff, Inferno Staff, Voidblast Staff, Voidstrike Staff -- 3.5% | 4% | 4.5% | 5% (up to +20%)
	create_template("trait_bespoke_098_desc_ext_en", {"loc_trait_bespoke_increased_crit_chance_scaled_on_peril_desc"}, {"en"}, function(locale, value) return "Gain between "..COLORS_Numbers.crit_var_rgb.." and "..COLORS_Numbers.critchmax_var_rgb.." "..COLORS_KWords.Crit_chance_rgb.." based on current level of "..COLORS_KWords.Peril_rgb.."." end), -- crit_chance: 5%, crit_chance_max: 20% -- colors
			--[+ French +]--
	create_template("trait_bespoke_098_desc_ext_fr", {"loc_trait_bespoke_increased_crit_chance_scaled_on_peril_desc"}, {"fr"}, function(locale, value) return "Obtenez entre "..COLORS_Numbers.crit_var_rgb.." et "..COLORS_Numbers.critchmax_var_rgb.." de "..COLORS_KWords_fr.Crit_chance_rgb_fr.." en fonction de votre niveau de "..COLORS_KWords_fr.Peril_rgb_fr.." actuel." end),

		--[+ Transfer Peril +]--
			-- Electrokinetic Staff, Voidblast Staff -- 7% | 8% | 9% | 10%
			-- Voidstrike Staff -- 6.5% | 7% | 7.5% | 8%
	create_template("trait_bespoke_099_desc_ext_en", {"loc_trait_bespoke_peril_vent_on_weakspot_hit_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.warpchrg_var_rgb.." of your "..COLORS_KWords.Peril_rgb.." is quelled on "..COLORS_KWords.Weakspothit_rgb.."."..COLORS_KWords.Trauma_note_rgb end), -- warp_charge: 10% -- colors
			--[+ French +]--
	create_template("trait_bespoke_099_desc_ext_fr", {"loc_trait_bespoke_peril_vent_on_weakspot_hit_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.warpchrg_var_rgb.." de votre "..COLORS_KWords_fr.Peril_rgb_fr.." est dissipé lors d'un "..COLORS_KWords_fr.Weakspothit_rgb_fr.."."..COLORS_KWords.Trauma_note_rgb end),

		--[+ Rending Shockwave +]--
			-- Voidblast Staff -- 2 | 4 | 6 | 8
	create_template("trait_bespoke_100_desc_ext_en", {"loc_trait_bespoke_rend_armor_on_aoe_charge_desc"}, {"en"}, function(locale, value) return "Target receives up to "..COLORS_Numbers.stacks_var_rgb.." Stacks of "..COLORS_Numbers.rending2_var_rgb.." "..COLORS_KWords.Brittleness_rgb..", scaling with charge time of Secondary Attack. Lasts "..COLORS_Numbers.time_var_rgb.." seconds. Max "..COLORS_Numbers.maxstks_var_rgb.." Stacks, up to "..COLORS_Numbers.pc_40_rgb.."."..COLORS_KWords.Brtl_note_rgb end), -- stacks: 8, rending: 2.5%, time: 5, max_stacks: 16 -- rewrite -- s->seconds -- colors -- Note
			--[+ French +]--
	create_template("trait_bespoke_100_desc_ext_fr", {"loc_trait_bespoke_rend_armor_on_aoe_charge_desc"}, {"fr"}, function(locale, value) return "La cible subit jusqu'à "..COLORS_Numbers.stacks_var_rgb.." cumuls de "..COLORS_Numbers.rending2_var_rgb.." "..COLORS_KWords_fr.Brittleness_rgb_fr..", en fonction du temps de charge de l'attaque secondaire. Dure "..COLORS_Numbers.time_var_rgb.." secondes. "..COLORS_Numbers.maxstks_var_rgb.." cumuls maximum, pour un total de "..COLORS_Numbers.pc_40_rgb.."."..COLORS_KWords_fr.Brtl_note_rgb_fr end),

		--[+ Focused Channelling +]--
			-- Electrokinetic Staff, Inferno Staff, Voidblast Staff, Voidstrike Staff -- 20% | 30% | 40% | 50%
	create_template("trait_bespoke_101_desc_ext_en", {"loc_trait_bespoke_uninterruptable_while_charging_and_movement_desc"}, {"en"}, function(locale, value) return "Your Secondary Attack cannot be interrupted and loses "..COLORS_Numbers.red_var_rgb.." of Secondary Attack Movement Speed penalties." end), -- reduction: 50% -- colors
			--[+ French +]--
	create_template("trait_bespoke_101_desc_ext_fr", {"loc_trait_bespoke_uninterruptable_while_charging_and_movement_desc"}, {"fr"}, function(locale, value) return "Votre attaque secondaire ne peut pas être interrompue et les pénalités de vitesse de déplacement de l'attaque secondaire sont réduite de "..COLORS_Numbers.red_var_rgb.."." end),

		--[+ Blazing Spirit +]--
			-- Voidblast Staff, Voidstrike Staff -- 1 | 2 | 3 | 4
	create_template("trait_bespoke_102_desc_ext_en", {"loc_trait_bespoke_warpfire_burn_on_crit_desc"}, {"en"}, function(locale, value) return "Enemy gains "..COLORS_Numbers.n_plus_rgb..COLORS_Numbers.stacks_var_rgb.." Stacks of "..COLORS_KWords.Soulblaze_rgb.." on "..COLORS_KWords.Crit_hit_rgb..". Up to "..COLORS_Numbers.n_6_rgb.." Stacks." end), -- stacks: 4 -- colors
			--[+ French +]--
	create_template("trait_bespoke_102_desc_ext_fr", {"loc_trait_bespoke_warpfire_burn_on_crit_desc"}, {"fr"}, function(locale, value) return "L'ennemie gagne "..COLORS_Numbers.n_plus_rgb..COLORS_Numbers.stacks_var_rgb.." cumuls de "..COLORS_KWords_fr.Soulblaze_rgb_fr.." lors d'un "..COLORS_KWords_fr.Crit_hit_rgb_fr..". Jusqu'à "..COLORS_Numbers.n_6_rgb.." cumuls." end),

		--[+ Penetrating Flame +]--
			-- Flamer, Inferno Staff -- 1 | 2 | 3 | 4
	create_template("trait_bespoke_103_desc_ext_en", {"loc_trait_bespoke_armor_rending_from_dot_burning_desc"}, {"en"}, function(locale, value) return "Direct hits apply "..COLORS_Numbers.stacks_num_var_rgb.." Stacks of "..COLORS_Numbers.rending_pc_var_rgb.." "..COLORS_KWords.Brittleness_rgb.." for "..COLORS_Numbers.dur_var_rgb.." seconds. Stacks "..COLORS_Numbers.maxstks_var_rgb.." times."..COLORS_KWords.Brtl_note_rgb end), -- num_stacks: 4, rending_percentage: 1, duration: 5, max_stacks: 20 -- stacks: 4 -- %%->% -- colors
			--[+ French +]--
	create_template("trait_bespoke_103_desc_ext_fr", {"loc_trait_bespoke_armor_rending_from_dot_burning_desc"}, {"fr"}, function(locale, value) return "Les coups directs appliquent "..COLORS_Numbers.stacks_num_var_rgb.." cumuls de "..COLORS_Numbers.rending_pc_var_rgb.." "..COLORS_KWords_fr.Brittleness_rgb_fr.." pendant "..COLORS_Numbers.dur_var_rgb.." secondes. Se cumule "..COLORS_Numbers.maxstks_var_rgb.." fois."..COLORS_KWords_fr.Brtl_note_rgb_fr end),

		--[+ Showstopper +]--
			-- Flamer, Inferno Staff -- 10% | 15% | 20% | 25
	create_template("trait_bespoke_104_desc_ext_en", {"loc_trait_bespoke_chance_to_explode_elites_on_kill_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.procch_var_rgb.." chance Elite and Special enemies Explode on kill." end), -- proc_chance: -- %%->% -- colors
			--[+ French +]--
	create_template("trait_bespoke_104_desc_ext_fr", {"loc_trait_bespoke_chance_to_explode_elites_on_kill_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.procch_var_rgb.." de chance que les Élite et les spécialistes explosent lors d'une élimination." end),

		--[+ Infernus +]--
			-- Helbore Lasguns, Infantry Lasguns, Laspistols, Recon Lasguns -- 1 (3 max) | 2 (6 max) | 3 (9 max) | 4 (12 max)
	create_template("trait_bespoke_105_desc_ext_en", {"loc_trait_bespoke_burninating_on_crit_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_stacks_var_rgb.." "..COLORS_KWords.Burn_rgb.." Stacks on "..COLORS_KWords.Crit_hit_rgb.." to a maximum of "..COLORS_Numbers.maxstks_var_rgb.." Stacks." end), -- stacks: +4, max_stacks: 12 -- Stack(s)->Stacks -- colors
			--[+ French +]--
	create_template("trait_bespoke_105_desc_ext_fr", {"loc_trait_bespoke_burninating_on_crit_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_stacks_var_rgb.." cumuls de "..COLORS_KWords_fr.Burn_rgb_fr.." lors d'un "..COLORS_KWords_fr.Crit_hit_rgb_fr.." jusqu'à un maximum de "..COLORS_Numbers.maxstks_var_rgb.." cumuls." end),

		--[+ Efficiency +]--
			-- Infantry Lasguns -- 5.5 | 5 | 4.5 | 4
	create_template("trait_bespoke_106_desc_ext_en", {"loc_trait_bespoke_first_shot_ammo_cost_reduction_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.ammo_var_rgb.." Reduced Ammo use per shot every "..COLORS_Numbers.time_var_rgb.." seconds." end), -- ammo: 33%, time: 4 -- rewrite -- return "+{ammo:%s} Reduced Ammo use after not shooting for {time:%s} seconds." -- s->seconds -- colors
			--[+ French +]--
	create_template("trait_bespoke_106_desc_ext_fr", {"loc_trait_bespoke_first_shot_ammo_cost_reduction_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.ammo_var_rgb.." de réduction des munitions dépensées lorsque vous ne tirez pas pendant "..COLORS_Numbers.time_var_rgb.." secondes." end),

		--[+ Concentrated Fire +]--
			-- Laspistols -- 2% | 3% | 4% | 5% (up to +25%)
	create_template("trait_bespoke_107_desc_ext_en", {"loc_trait_bespoke_crit_chance_on_chained_weakspot_hits_desc"}, {"en"}, function(locale, value) return "Up to "..COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords.Crit_chance_rgb.." on Chained Ranged "..COLORS_KWords.Weakspothit_rgb.." to Any Target. Up to "..COLORS_Numbers.n_5_rgb.." Stacks." end), -- crit_chance: +5% -- colors
			--[+ French +]--
	create_template("trait_bespoke_107_desc_ext_fr", {"loc_trait_bespoke_crit_chance_on_chained_weakspot_hits_desc"}, {"fr"}, function(locale, value) return "Jusqu'à "..COLORS_Numbers.p_crit_var_rgb.." de "..COLORS_KWords_fr.Crit_chance_rgb_fr.." lors d'un "..COLORS_KWords_fr.Weakspothit_rgb_fr.." répété à distance (toute cible). Jusqu'à "..COLORS_Numbers.n_5_rgb.." cumuls." end),

		--[+ Desperado +]--
			-- Laspistols -- 12.5% | 15% | 17.5% | 20%
	create_template("trait_bespoke_108_desc_ext_en", {"loc_trait_bespoke_crit_chance_on_successful_dodge_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords.Crit_chance_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on successful Dodge." end), -- crit_chance: +12.5%, time: 2 -- colors
			--[+ French +]--
	create_template("trait_bespoke_108_desc_ext_fr", {"loc_trait_bespoke_crit_chance_on_successful_dodge_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." de "..COLORS_KWords_fr.Crit_chance_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'une esquive réussie." end),

		--[+ Reassuringly Accurate +]--
			-- Grenadier Gauntlet -- 24% | 28% | 32% | 36%
			-- Laspistols -- 10% | 12% | 14% | 16%
	create_template("trait_bespoke_109_desc_ext_en", {"loc_trait_bespoke_toughness_on_crit_kills_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_tghns_var_rgb.." "..COLORS_KWords.Toughness_rgb.." on "..COLORS_KWords.Crit_hit_rgb.." Kill." end), -- toughness: 16% -- colors
			--[+ French +]--
	create_template("trait_bespoke_109_desc_ext_fr", {"loc_trait_bespoke_toughness_on_crit_kills_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_tghns_var_rgb.." de "..COLORS_KWords_fr.Toughness_rgb_fr.." lors d'une élimination par "..COLORS_KWords_fr.Crit_hit_rgb_fr.."." end),

		--[+ Flechette +]--
			-- Combat Shotguns, Double-Barrel Shotgun, Ripper Guns -- 3 | 4 | 5 | 6
	create_template("trait_bespoke_110_desc_ext_en", {"loc_trait_bespoke_bleed_on_crit_ranged_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_stacks_var_rgb.." "..COLORS_KWords.Bleed_rgb.." Stacks on "..COLORS_KWords.Crit_hit_rgb..". Up to "..COLORS_Numbers.n_16_rgb.." Stacks." end), -- stacks: 6 -- colors
			--[+ French +]--
	create_template("trait_bespoke_110_desc_ext_fr", {"loc_trait_bespoke_bleed_on_crit_ranged_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_stacks_var_rgb.." cumuls de "..COLORS_KWords_fr.Bleed_rgb_fr.." lors d'un "..COLORS_KWords_fr.Crit_hit_rgb_fr..". Jusqu'à "..COLORS_Numbers.n_16_rgb.." cumuls." end),

		--[+ Man-Stopper +]--
			-- Combat Shotguns, Double-Barrel Shotgun -- 10% | 15% | 20% | 25%
	create_template("trait_bespoke_111_desc_ext_en", {"loc_trait_bespoke_cleave_on_crit_and_stagger_desc"}, {"en"}, function(locale, value) return "Increased "..COLORS_KWords.Cleave_rgb.." on "..COLORS_KWords.Crit_hit_rgb.." and gain "..COLORS_Numbers.p_stgr_var_rgb.." Ranged Attack "..COLORS_KWords.Stagger_rgb.."." end), -- stagger: +25% -- colors
			--[+ French +]--
	create_template("trait_bespoke_111_desc_ext_fr", {"loc_trait_bespoke_cleave_on_crit_and_stagger_desc"}, {"fr"}, function(locale, value) return "Augmente le "..COLORS_KWords_fr.Cleave_rgb_fr.." lors d'un "..COLORS_KWords_fr.Crit_hit_rgb_fr.." augmente également de "..COLORS_Numbers.p_stgr_var_rgb.." le "..COLORS_KWords_fr.Stagger_rgb_fr.."." end),

		--[+ Scattershot +]--
			-- Combat Shotguns, Double-Barrel Shotgun -- 6% | 8% | 10% | 12% (up to +60%)
	create_template("trait_bespoke_112_desc_ext_en", {"loc_trait_bespoke_crit_chance_on_hitting_multiple_with_one_shot_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords.Crit_chance_rgb.." for each Enemy Hit by your previous attack. Stacks "..COLORS_Numbers.stacks_var_rgb.." times." end), -- crit_chance: +12%, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_112_desc_ext_fr", {"loc_trait_bespoke_crit_chance_on_hitting_multiple_with_one_shot_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." de "..COLORS_KWords_fr.Crit_chance_rgb_fr.." pour chaque ennemie touché par votre attaque précédente . Se cumuls "..COLORS_Numbers.stacks_var_rgb.." fois." end),

		--[+ Full Bore +]--
			-- Combat Shotguns, Double-Barrel Shotgun -- 14% | 16% | 18% | 20%
			-- Kickback -- 18% | 22% | 26% | 30%
	create_template("trait_bespoke_113_desc_ext_en", {"loc_trait_bespoke_power_bonus_on_hitting_single_enemy_with_all_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds when every pellet in a shot hits the same enemy."..COLORS_KWords.Pwr_note_rgb end), -- power_level: +20%, time: 5 -- s->seconds -- colors
			--[+ French +]--
	create_template("trait_bespoke_113_desc_ext_fr", {"loc_trait_bespoke_power_bonus_on_hitting_single_enemy_with_all_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes lorsque chaque plomb d'un tir touche le même ennemie."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Both Barrels +]--
			-- Double-Barrel Shotgun -- 40% | 50% | 60% | 70%
	create_template("trait_bespoke_114_desc_ext_en", {"loc_trait_bespoke_reload_speed_on_ranged_weapon_special_kill_desc"}, {"en"}, function(locale, value) return "Killing an enemy by firing both barrels makes your next Reload "..COLORS_Numbers.reload_var_rgb.." faster." end), -- reload_speed: 70% -- colors
			--[+ French +]--
	create_template("trait_bespoke_114_desc_ext_fr", {"loc_trait_bespoke_reload_speed_on_ranged_weapon_special_kill_desc"}, {"fr"}, function(locale, value) return "Si vous tuez un ennemie en tirant les deux canons, votre prochain rechargement sera "..COLORS_Numbers.reload_var_rgb.." plus rapide." end),

		--[+ Trickshooter +]--
			-- Stub Revolvers -- 4.5% | 5% | 5.5% | 6% (up to +30%)
	create_template("trait_bespoke_115_desc_ext_en", {"loc_trait_bespoke_power_bonus_on_chained_weakspot_hits_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb.." on Chained "..COLORS_KWords.Weakspothit_rgb.." to Any Target. Stacks "..COLORS_Numbers.stacks_var_rgb.." times."..COLORS_KWords.Pwr_note_rgb end), -- power_level: +6%, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_115_desc_ext_fr", {"loc_trait_bespoke_power_bonus_on_chained_weakspot_hits_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." lors d'un "..COLORS_KWords_fr.Weakspothit_rgb_fr.." en chaîne (toute cible). Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Hand-Cannon +]--
			-- Stub Revolvers -- 30% | 40% | 50% | 60%
	create_template("trait_bespoke_116_desc_ext_en", {"loc_trait_bespoke_rending_on_crit_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_rend_var_rgb.." "..COLORS_KWords.Rending_rgb.." on "..COLORS_KWords.Crit_hit_rgb.."."..COLORS_KWords.Rend_note_rgb end), -- rend: +60% -- colors
			--[+ French +]--
	create_template("trait_bespoke_116_desc_ext_fr", {"loc_trait_bespoke_rending_on_crit_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_rend_var_rgb.." de "..COLORS_KWords_fr.Rending_rgb_fr.." lors d'un "..COLORS_KWords_fr.Crit_hit_rgb_fr.."."..COLORS_KWords_fr.Rend_note_rgb_fr end),

		--[+ Shattering Impact +]--
			-- Boltgun, Grenadier Gauntlet, Plasma Gun, Rumbler -- 1 | 2 | 3| 4
	create_template("trait_bespoke_117_desc_ext_en", {"loc_trait_bespoke_armor_rend_on_projectile_hit_desc"}, {"en"}, function(locale, value) return "Target receives "..COLORS_Numbers.stacks_var_rgb.." Stacks of "..COLORS_Numbers.rending2_var_rgb.." "..COLORS_KWords.Brittleness_rgb.." on direct projectile hit. Lasts "..COLORS_Numbers.time_var_rgb.." seconds. Max "..COLORS_Numbers.maxstks_var_rgb.." Stacks, up to "..COLORS_Numbers.pc_40_rgb.."."..COLORS_KWords.Brtl_note_rgb end), -- stacks: 4, rending: 2.5%, time: 5, max_stacks: 16 -- rewrite -- s->seconds -- colors
			--[+ French +]--
	create_template("trait_bespoke_117_desc_ext_fr", {"loc_trait_bespoke_armor_rend_on_projectile_hit_desc"}, {"fr"}, function(locale, value) return "La cible reçoit "..COLORS_Numbers.stacks_var_rgb.." cumuls de "..COLORS_Numbers.rending2_var_rgb.." de "..COLORS_KWords_fr.Brittleness_rgb_fr.." si elle est touchée directement par un projectile. Dure "..COLORS_Numbers.time_var_rgb.." secondes."..COLORS_Numbers.maxstks_var_rgb.." cumuls maximum, Jusqu'à "..COLORS_Numbers.pc_40_rgb.."."..COLORS_KWords_fr.Brtl_note_rgb_fr end),

		--[+ Everlasting Flame +]--
			-- Flamer -- 2 | 3 | 4 | 5
	create_template("trait_bespoke_118_desc_ext_en", {"loc_trait_bespoke_ammo_spent_from_reserve_on_crit_desc"}, {"en"}, function(locale, value) return COLORS_KWords.Crit_hits_rgb.." spend Ammo from your Reserve instead of you current fuel tank." end), -- colors
			--[+ French +]--
	create_template("trait_bespoke_118_desc_ext_fr", {"loc_trait_bespoke_ammo_spent_from_reserve_on_crit_desc"}, {"fr"}, function(locale, value) return "Les "..COLORS_KWords_fr.Crit_hits_rgb_fr.." dépensent des munitions de votre réserve à la place de votre réservoir de carburant actuel." end),

		--[+ Quickflame +]--
			-- Flamer -- 24% | 28% | 32% | 36%
	create_template("trait_bespoke_119_desc_ext_en", {"loc_trait_bespoke_faster_reload_on_empty_clip_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_reload_var_rgb.." Reload Speed if empty." end), -- reload_speed: +36% -- colors
			--[+ French +]--
	create_template("trait_bespoke_119_desc_ext_fr", {"loc_trait_bespoke_faster_reload_on_empty_clip_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_reload_var_rgb.." de vitesse de rechargement si vide." end),

		--[+ Fan the Flames +]--
			-- Flamer -- 40% & 30% | 50% & 35% | 60% & 40% | 70% & 45%
	create_template("trait_bespoke_120_desc_ext_en", {"loc_trait_bespoke_ignore_stagger_reduction_with_primary_on_burning_desc"}, {"en"}, function(locale, value) return "Primary Attack ignores "..COLORS_Numbers.stgrrdct_var_rgb.." "..COLORS_KWords.Stagger_rgb.." Resistance on "..COLORS_KWords.Burning_rgb.." Enemies, as well as dealing "..COLORS_Numbers.p_impmod_var_rgb.." "..COLORS_KWords.Impact_rgb.."." end), -- stagger_reduction: 60%, impact_modifier: +45% -- colors
			--[+ French +]--
	create_template("trait_bespoke_120_desc_ext_fr", {"loc_trait_bespoke_ignore_stagger_reduction_with_primary_on_burning_desc"}, {"fr"}, function(locale, value) return "Votre attaque principale ignore "..COLORS_Numbers.stgrrdct_var_rgb.." de le résistance "..COLORS_KWords_fr.Stagger_rgb_fr.." des ennemis qui "..COLORS_KWords_fr.Burning_rgb_fr..", et inflige "..COLORS_Numbers.p_impmod_var_rgb.." d'"..COLORS_KWords_fr.Impact_rgb_fr.."." end),

		--[+ Overpressure +]--
			-- Flamer -- 2% | 3% | 4% | 5% (up to +25%)
	create_template("trait_bespoke_121_desc_ext_en", {"loc_trait_bespoke_power_scales_with_clip_percentage_desc"}, {"en"}, function(locale, value) return "Up to "..COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb..", scaling with remaining Ammunition. Stacks "..COLORS_Numbers.stacks_var_rgb.." times."..COLORS_KWords.Pwr_note_rgb end), -- power_level: +5%, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_121_desc_ext_fr", {"loc_trait_bespoke_power_scales_with_clip_percentage_desc"}, {"fr"}, function(locale, value) return "Jusqu'à "..COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr..", en fonction des munitions restantes. Se cumules "..COLORS_Numbers.stacks_var_rgb.." fois."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Hot-Shot +]--
			-- Helbore Lasguns -- 80% | 70% | 60% | 50% (bugged)???
	create_template("trait_bespoke_122_desc_ext_en", {"loc_trait_bespoke_cleave_on_weakspot_hits_desc"}, {"en"}, function(locale, value) return COLORS_KWords.Weakspothits_rgb.." gain "..COLORS_Numbers.hit_mass_red_var_rgb..COLORS_Numbers.pc_rgb.." "..COLORS_KWords.Cleave_rgb.."." end), -- hit_mass_reduction: 50 -- colors
			--[+ French +]--
	create_template("trait_bespoke_122_desc_ext_fr", {"loc_trait_bespoke_cleave_on_weakspot_hits_desc"}, {"fr"}, function(locale, value) return "Les "..COLORS_KWords_fr.Weakspothits_rgb_fr.." gagnent "..COLORS_Numbers.hit_mass_red_var_rgb..COLORS_Numbers.pc_rgb.." de "..COLORS_KWords_fr.Cleave_rgb_fr.."." end),

		--[+ Weight of Fire +]--
			-- Helbore Lasguns -- 6% | 8% | 10% | 12% (up to 60%)
	create_template("trait_bespoke_123_desc_ext_en", {"loc_trait_bespoke_faster_charge_on_chained_attacks_desc"}, {"en"}, function(locale, value) return "Chaining Charged Attacks reduces their Charge Time by "..COLORS_Numbers.chrgtime_var_rgb..". Stacks "..COLORS_Numbers.stacks_var_rgb.." times." end), -- charge_time: -12%, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_123_desc_ext_fr", {"loc_trait_bespoke_faster_charge_on_chained_attacks_desc"}, {"fr"}, function(locale, value) return "Enchaîner les attaques chargées réduit leurs temps de chargement de "..COLORS_Numbers.chrgtime_var_rgb.." par cumule. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois." end),

		--[+ Armourbane +]--
			-- Helbore Lasguns -- 2 to 6 | 4 to 8 | 6 to 10 | 8 to 12
	create_template("trait_bespoke_124_desc_ext_en", {"loc_trait_bespoke_rend_armor_on_charged_shots_desc"}, {"en"}, function(locale, value) return "Adds "..COLORS_Numbers.min_stk_cnt_var_rgb.."-"..COLORS_Numbers.max_stk_cnt_var_rgb.." Stacks of "..COLORS_Numbers.pc_2_5_rgb.." "..COLORS_KWords.Brittleness_rgb.." to hit enemies, based on charge level."..COLORS_KWords.Brtl_note_rgb end), -- min_stack_count: 8, max_stack_count: 12 -- colors
			--[+ French +]--
	create_template("trait_bespoke_124_desc_ext_fr", {"loc_trait_bespoke_rend_armor_on_charged_shots_desc"}, {"fr"}, function(locale, value) return "Inflige de "..COLORS_Numbers.min_stk_cnt_var_rgb.." à "..COLORS_Numbers.max_stk_cnt_var_rgb.." cumuls de "..COLORS_Numbers.pc_2_5_rgb.." de "..COLORS_KWords_fr.Brittleness_rgb_fr.." aux ennemis touchés, en fonction du niveau de charge."..COLORS_KWords_fr.Brtl_note_rgb_fr end),

		--[+ Power Blast +]--
			-- Plasma Gun -- 2% | 3% | 4% | 5% (up to +25%)
	create_template("trait_bespoke_125_desc_ext_en", {"loc_trait_bespoke_increased_crit_chance_bonus_based_on_charge_time_desc"}, {"en"}, function(locale, value) return "Gain between "..COLORS_Numbers.critchmin_var_rgb.." and "..COLORS_Numbers.critchmax_var_rgb.." "..COLORS_KWords.Crt_chance_rgb.." based on charge level when firing." end), -- crit_chance_min: 5%, crit_chance_max: 25% -- colors
			--[+ French +]--
	create_template("trait_bespoke_125_desc_ext_fr", {"loc_trait_bespoke_increased_crit_chance_bonus_based_on_charge_time_desc"}, {"fr"}, function(locale, value) return "Gagnez entre "..COLORS_Numbers.critchmin_var_rgb.." et "..COLORS_Numbers.critchmax_var_rgb.." de "..COLORS_KWords_fr.Crt_chance_rgb_fr.." en fonction du niveau de charge lorsque vous tirez." end),

		--[+ Gets Hot! +]--
			-- Plasma Gun -- 5.5% & 4% | 7% & 6% | 8.5 & 8% | 10% & 10% (up to +50% & +50%)
	create_template("trait_bespoke_126_desc_ext_en", {"loc_trait_bespoke_crit_chance_scaled_on_heat_desc"}, {"en"}, function(locale, value) return COLORS_KWords.Crit_hit_chance_rgb.." scales by your current "..COLORS_KWords.Heat_rgb.." level up to "..COLORS_Numbers.crit_var_rgb..". Also increases "..COLORS_KWords.Crit_rgb.." Ranged attacks damage by "..COLORS_Numbers.rangcrtdmg_var_rgb.."." end), -- crit_chance: 50%, ranged_crit_damage: 10% -- colors
			--[+ French +]--
	create_template("trait_bespoke_126_desc_ext_fr", {"loc_trait_bespoke_crit_chance_scaled_on_heat_desc"}, {"fr"}, function(locale, value) return "Le "..COLORS_KWords_fr.Crit_hit_chance_rgb_fr.." augmente proportionnellement à votre niveau de "..COLORS_KWords_fr.Heat_rgb_fr.." actuel jusqu'à "..COLORS_Numbers.crit_var_rgb..". Augmente également les "..COLORS_KWords_fr.Crit_hit_color_rgb_fr.." à distance de "..COLORS_Numbers.rangcrtdmg_var_rgb.."." end),

		--[+ Volatile +]--
			-- Plasma Gun -- 2.5% | 3% | 3.5% | 4% (up to 20%)
	create_template("trait_bespoke_127_desc_ext_en", {"loc_trait_bespoke_lower_overheat_gives_faster_charge_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_chrgspd_var_rgb.." Charge Speed on low Overheat. Stacks up to "..COLORS_Numbers.stacks_var_rgb.." times." end), -- charge_speed: +4%, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_127_desc_ext_fr", {"loc_trait_bespoke_lower_overheat_gives_faster_charge_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_chrgspd_var_rgb.." de vitesse de charge lorsque votre surcharge est basse. Se cumule jusqu'à "..COLORS_Numbers.stacks_var_rgb.." fois." end),

		--[+ Blaze Away +]-- ALT
			-- Autopistol, Flamer, Heavy Stubbers, Ripper Guns, Grenadier Gauntlet, Inferno Staff, Plasma Gun -- 5% | 6% | 7% | 8% (up to +40%)
			-- Kickback, Rumbler -- 6% | 7% | 8% | 9% (up to +45%)
	create_template("trait_bespoke_128_desc_ext_en", {"loc_trait_bespoke_power_bonus_on_continuous_fire_alternative_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb.." for every shot fired during continuous fire. Stacks "..COLORS_Numbers.stacks_var_rgb.." times."..COLORS_KWords.Pwr_note_rgb end), -- power_level: +8%, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_128_desc_ext_fr", {"loc_trait_bespoke_power_bonus_on_continuous_fire_alternative_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." pour chaque tir effectué en tir continu. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Rising Heat +]--
			-- Plasma Gun -- 1.5% | 2% | 3% | 4% (up to +20%)
	create_template("trait_bespoke_129_desc_ext_en", {"loc_trait_bespoke_power_bonus_scaled_on_heat_desc"}, {"en"}, function(locale, value) return "Up to "..COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Strength_rgb.." scaling with "..COLORS_KWords.Heat_rgb.." Level."..COLORS_KWords.Pwr_note_rgb end), -- power_level: +8%, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_129_desc_ext_fr", {"loc_trait_bespoke_power_bonus_scaled_on_heat_desc"}, {"fr"}, function(locale, value) return "Jusqu'à "..COLORS_Numbers.p_dmg_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." en fonction du niveau de "..COLORS_KWords_fr.Heat_rgb_fr.."."..COLORS_KWords.Pwr_note_rgb end),

		--[+ Optimised Cooling +]--
			-- Plasma Gun -- 4% | 6% | 8% | 10% (up to ~41%)
	create_template("trait_bespoke_130_desc_ext_en", {"loc_trait_bespoke_reduced_heat_on_continuous_desc"}, {"en"}, function(locale, value) return "Increased Charge Speed scaling inversely with "..COLORS_KWords.Heat_rgb.." Level." end), -- colors
			--[+ French +]--
	create_template("trait_bespoke_130_desc_ext_fr", {"loc_trait_bespoke_reduced_heat_on_continuous_desc"}, {"fr"}, function(locale, value) return "Vitesse de chargement augmentée inversement proportionnelle au niveau de "..COLORS_KWords_fr.Heat_rgb_fr.."." end),

		--[+ Focused Cooling +]--
			-- Plasma Gun -- 30% | 40% | 50% | 60%
	create_template("trait_bespoke_131_desc_ext_en", {"loc_trait_bespoke_reduced_overheat_on_crits_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.m_heat_pc_var_rgb.." "..COLORS_KWords.Heat_rgb.." generation on "..COLORS_KWords.Crit_hit_rgb.."." end), -- colors
			--[+ French +]--
	create_template("trait_bespoke_131_desc_ext_fr", {"loc_trait_bespoke_reduced_overheat_on_crits_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.m_heat_pc_var_rgb.." de génération de "..COLORS_KWords_fr.Heat_rgb_fr.." lors d'un "..COLORS_KWords_fr.Crit_hit_rgb_fr.."." end),

		--[+ Gauntlet Momentum +]--
			-- Grenadier Gauntlet -- 5% | 5% | 5% | 5% (up to +50%) (bugged)
	create_template("trait_bespoke_132_desc_ext_en", {"loc_trait_bespoke_power_bonus_on_chained_melee_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.n_plus_rgb..COLORS_Numbers.n_1_rgb.." Stack of "..COLORS_Numbers.pwr_var_rgb.." Melee "..COLORS_KWords.Strength_rgb.." is added for each chained Melee hit with the Gauntlet. Stacks "..COLORS_Numbers.stacks_var_rgb.." times. Stack lasts for "..COLORS_Numbers.time_var_rgb.." seconds. {#color(255, 35, 5)}(bugged:5% all tiers){#reset()}"..COLORS_KWords.Pwr_note_rgb end), -- power: 5%, stacks: 10, time: 1.5 -- rewrite -- colors
			--[+ French +]--
	create_template("trait_bespoke_132_desc_ext_fr", {"loc_trait_bespoke_power_bonus_on_chained_melee_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.n_plus_rgb..COLORS_Numbers.n_1_rgb.." cumul de "..COLORS_Numbers.pwr_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." de mélée, est ajouté pour chaque attaque de mélée avec le Gantelet. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois. Les cumuls dure "..COLORS_Numbers.time_var_rgb.." secondes. {#color(255, 35, 5)}(bug:5% tout les niveaux de la bénédiction){#reset()}"..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Pulverise +]--
			-- Grenadier Gauntlet -- 10% | 15% | 20% | 25%
	create_template("trait_bespoke_133_desc_ext_en", {"loc_trait_bespoke_crit_chance_on_melee_kill_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." "..COLORS_KWords.Crit_chance_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on Melee Kill." end), -- crit_chance: +25%, time: 3 -- colors
			--[+ French +]--
	create_template("trait_bespoke_133_desc_ext_fr", {"loc_trait_bespoke_crit_chance_on_melee_kill_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_crit_var_rgb.." de "..COLORS_KWords_fr.Crit_chance_rgb_fr.." pendant "..COLORS_Numbers.time_var_rgb.." secondes lors d'un élimination en mélée." end),

		--[+ Disruptive +]--
			-- Grenadier Gauntlet -- 15% | 20% | 25% | 30%
	create_template("trait_bespoke_134_desc_ext_en", {"loc_trait_bespoke_melee_power_bonus_after_explosion_desc"}, {"en"}, function(locale, value) return "Hitting at least "..COLORS_Numbers.n_3_rgb.." enemies with your secondary attack grants "..COLORS_Numbers.pwrlvl_var_rgb.." bonus to "..COLORS_KWords.Strength_rgb.." on Melee attacks for "..COLORS_Numbers.time_var_rgb.." seconds."..COLORS_KWords.Pwr_note_rgb end), -- power_level: 30%, time: 3.5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_134_desc_ext_fr", {"loc_trait_bespoke_melee_power_bonus_after_explosion_desc"}, {"fr"}, function(locale, value) return "Toucher au moins "..COLORS_Numbers.n_3_rgb.." ennemies avec votre attaque secondaire vous octroie "..COLORS_Numbers.pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." pour vos attaque de mélée pendant "..COLORS_Numbers.time_var_rgb.." secondes."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Explosive Offensive +]--
			-- Grenadier Gauntlet -- 6% | 9% | 12% | 15%
	create_template("trait_bespoke_135_desc_ext_en", {"loc_trait_bespoke_power_bonus_after_weapon_special_multiple_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb.." bonus for "..COLORS_Numbers.time_var_rgb.." seconds after hitting multiple enemies with your weapon special explosion."..COLORS_KWords.Pwr_note_rgb end), -- power_level: 15%, time: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_135_desc_ext_fr", {"loc_trait_bespoke_power_bonus_after_weapon_special_multiple_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." bonus pendant "..COLORS_Numbers.time_var_rgb.." secondes après avoir touché plusieurs ennemies avec l'explosion spéciale de votre arme."..COLORS_KWords.Pwr_note_rgb end),

		--[+ Pinpointing target +]--
			-- Grenadier Gauntlet -- 5% | 6% | 7% | 8% (up to +40%)
	create_template("trait_bespoke_136_desc_ext_en", {"loc_trait_bespoke_power_bonus_based_on_charge_time_ranged_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb.." every "..COLORS_Numbers.time_var_rgb.." seconds while aiming. Stacks "..COLORS_Numbers.stacks_var_rgb.." times. Discharges All Stacks upon firing."..COLORS_KWords.Pwr_note_rgb end), -- power_level: 15%, time: 5, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_136_desc_ext_fr", {"loc_trait_bespoke_power_bonus_based_on_charge_time_ranged_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." toutes les "..COLORS_Numbers.time_var_rgb.." secondes pendant la visée. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois. Tous les cumuls sont déchargés lorsque vous tirez."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Charmed Reload +]--
			-- Heavy Stubbers -- 2 | 3 | 4 | 5
	create_template("trait_bespoke_137_desc_ext_en", {"loc_trait_bespoke_ammo_refill_from_reserve_on_crit_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.n_plus_rgb..COLORS_Numbers.blltam_var_rgb.." bullets loaded from Reserve on "..COLORS_KWords.Crit_hit_rgb.."." end), -- bullet_amount: +5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_137_desc_ext_fr", {"loc_trait_bespoke_ammo_refill_from_reserve_on_crit_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.n_plus_rgb..COLORS_Numbers.blltam_var_rgb.." Munitions chargées depuis la réserve lors d'un "..COLORS_KWords_fr.Crit_hit_rgb_fr.."." end),

		--[+ Overwhelming Fire +]--
			-- Heavy Stubbers -- 7% | 8% | 9% | 10% (up to +50%)
	create_template("trait_bespoke_138_desc_ext_en", {"loc_trait_bespoke_power_bonus_on_chained_hits_on_single_target_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwr_var_rgb.." "..COLORS_KWords.Strength_rgb.." for every "..COLORS_Numbers.hit_var_rgb.." Single Target Hits. Lasts "..COLORS_Numbers.time_var_rgb.." seconds and Stacks "..COLORS_Numbers.stacks_var_rgb.." times."..COLORS_KWords.Pwr_note_rgb end), -- power: +10%, hit: 4, time: 2, stacks: 5 -- s->seconds -- colors
			--[+ French +]--
	create_template("trait_bespoke_138_desc_ext_fr", {"loc_trait_bespoke_power_bonus_on_chained_hits_on_single_target_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwr_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." pour toutes les "..COLORS_Numbers.hit_var_rgb.." attaques sur une cible unique. Dure "..COLORS_Numbers.time_var_rgb.." secondes et se cumule "..COLORS_Numbers.stacks_var_rgb.." fois."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Can opener +]--
			-- Ripper Guns -- 10 | 12 | 14 | 16
	create_template("trait_bespoke_139_desc_ext_en", {"loc_trait_bespoke_armor_rending_bayonette_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.rending2_var_rgb.." "..COLORS_KWords.Brittleness_rgb.." is applied to the enemy on weapon Special Hit, giving them "..COLORS_Numbers.stacks_var_rgb.." Stacks. Lasts "..COLORS_Numbers.time_var_rgb.." seconds. Max "..COLORS_Numbers.maxstks_var_rgb.." Stacks, up to "..COLORS_Numbers.pc_40_rgb.."."..COLORS_KWords.Brtl_note_rgb end), -- rending: 2.5%, stacks: 16, time: 5, max_stacks: 16 -- s->seconds -- rewrite -- colors
			--[+ French +]--
	create_template("trait_bespoke_139_desc_ext_fr", {"loc_trait_bespoke_armor_rending_bayonette_desc"}, {"fr"}, function(locale, value) return "Toucher un ennemi avec l'attaque spéciale lui octroie"..COLORS_Numbers.stacks_var_rgb.." cumuls de "..COLORS_Numbers.rending2_var_rgb.." de "..COLORS_KWords_fr.Brittleness_rgb_fr..". Dure "..COLORS_Numbers.time_var_rgb.." secondes. Pour un maximum de "..COLORS_Numbers.maxstks_var_rgb.." cumuls, Pour un total de "..COLORS_Numbers.pc_40_rgb.."."..COLORS_KWords_fr.Brtl_note_rgb_fr end),

		--[+ Born in blood +]--
			-- Ripper Guns -- 4.5% | 5% | 5.5% | 6%
	create_template("trait_bespoke_140_desc_ext_en", {"loc_trait_bespoke_toughness_on_close_range_kills_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_tghns_var_rgb.." "..COLORS_KWords.Toughness_rgb.." on Kill at a distance of up to "..COLORS_Numbers.n_12_5_rgb.." meters." end), -- toughness: +6% -- colors
			--[+ French +]--
	create_template("trait_bespoke_140_desc_ext_fr", {"loc_trait_bespoke_toughness_on_close_range_kills_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_tghns_var_rgb.." de "..COLORS_KWords_fr.Toughness_rgb_fr.." lors d'une élimination à moins de "..COLORS_Numbers.n_12_5_rgb.." mètres." end),

		--[+ Pierce +]--
			-- Kickback, Rumbler -- 10% | 15% | 20% | 25%
	create_template("trait_bespoke_141_desc_ext_en", {"loc_trait_bespoke_pass_trough_armor_on_weapon_special_and_stagger_desc"}, {"en"}, function(locale, value) return "Special Attacks gain "..COLORS_Numbers.p_stgr_var_rgb.." "..COLORS_KWords.Stagger_rgb.." and ignore "..COLORS_KWords.Hit_mass_rgb.." Bonus from Armour." end), -- stagger: +25% -- colors
			--[+ French +]--
	create_template("trait_bespoke_141_desc_ext_fr", {"loc_trait_bespoke_pass_trough_armor_on_weapon_special_and_stagger_desc"}, {"fr"}, function(locale, value) return "L'attaque spéciale gagne "..COLORS_Numbers.p_stgr_var_rgb.." de "..COLORS_KWords_fr.Stagger_rgb_fr.." et ignore le "..COLORS_KWords_fr.Hit_mass_rgb_fr.." de l'armure." end),

		--[+ Punishing Fire +]--
			-- Kickback -- 6% | 9% | 12% | 15%
	create_template("trait_bespoke_142_desc_ext_en", {"loc_trait_bespoke_shot_power_bonus_after_weapon_special_cleave_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." "..COLORS_KWords.Strength_rgb.." Bonus on your Ranged attack for "..COLORS_Numbers.time_var_rgb.." seconds after "..COLORS_KWords.Cleaving_rgb.." through several enemies with your weapon's Special attack."..COLORS_KWords.Pwr_note_rgb end), -- power_level: +15%, time: 3 -- colors
			--[+ French +]--
	create_template("trait_bespoke_142_desc_ext_fr", {"loc_trait_bespoke_shot_power_bonus_after_weapon_special_cleave_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." sur vos attaques à distance pendant "..COLORS_Numbers.time_var_rgb.." secondes après avoir "..COLORS_KWords_fr.Cleaving_rgb_fr.." plusieurs ennemies avec l'attaque spéciale de votre arme."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Inspiring Barrage +]-- ALT
			-- Kickback -- 1% | 2% | 3% | 4% (up to 20%)
	create_template("trait_bespoke_143_desc_ext_en", {"loc_trait_bespoke_toughness_on_continuous_fire_alternative_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_tghns_var_rgb.." "..COLORS_KWords.Toughness_rgb.." for every shot fired during continuous fire. Stacks "..COLORS_Numbers.stacks_var_rgb.." times." end), -- toughness: +4%, ammo: 10%, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_143_desc_ext_fr", {"loc_trait_bespoke_toughness_on_continuous_fire_alternative_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_tghns_var_rgb.." de "..COLORS_KWords_fr.Toughness_rgb_fr.." pour chaque tir lors d'un tir continu. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois." end),

		--[+ Expansive +]--
			-- Kickback -- 30% | 34% | 38% | 42%
	create_template("trait_bespoke_144_desc_ext_en", {"loc_trait_bespoke_weapon_special_power_bonus_after_one_shots_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." Melee "..COLORS_KWords.Strength_rgb.." for "..COLORS_Numbers.time_var_rgb.." seconds on Hitting "..COLORS_Numbers.n_3_rgb..COLORS_Numbers.n_plus_rgb.." Enemies with a Ranged Attack."..COLORS_KWords.Pwr_note_rgb end), -- power_level: +42%, time: 3.5 -- s->seconds -- "+30%Melee Power for  3.5s"->"+30% Melee Power for 3.5 seconds" -- colors
			--[+ French +]--
	create_template("trait_bespoke_144_desc_ext_fr", {"loc_trait_bespoke_weapon_special_power_bonus_after_one_shots_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_pwrlvl_var_rgb.." de "..COLORS_KWords_fr.Strength_rgb_fr.." de mélée pendant "..COLORS_Numbers.time_var_rgb.." secondes en touchant au moins "..COLORS_Numbers.n_3_rgb.." ennemies avec une attaque à distance."..COLORS_KWords_fr.Pwr_note_rgb_fr end),

		--[+ Shrapnel +]--
			-- Rumbler -- 1 | 2 | 3 | 4
	create_template("trait_bespoke_145_desc_ext_en", {"loc_trait_bespoke_close_explosion_applies_bleed_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_stacks_var_rgb.." "..COLORS_KWords.Bleed_rgb.." Stacks from Close Range explosions." end), -- stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_145_desc_ext_fr", {"loc_trait_bespoke_close_explosion_applies_bleed_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_stacks_var_rgb.." cumuls de "..COLORS_KWords_fr.Bleed_rgb_fr.." avec les explosions rapprochées." end),

		--[+ Blast Zone +]--
			-- Rumbler -- 3% | 4% | 5% | 6% (up to +30%)
	create_template("trait_bespoke_146_desc_ext_en", {"loc_trait_bespoke_explosion_radius_bonus_on_continuous_fire_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_radius_var_rgb.." Explosion Radius for every shot fired during continuous fire. Stacks "..COLORS_Numbers.stacks_var_rgb.." times." end), -- radius: +6%, stacks: 5 -- colors
			--[+ French +]--
	create_template("trait_bespoke_146_desc_ext_fr", {"loc_trait_bespoke_explosion_radius_bonus_on_continuous_fire_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_radius_var_rgb.." de rayon d'explosion pour chaque tir d'un tir continue. Se cumule "..COLORS_Numbers.stacks_var_rgb.." fois." end),

		--[+ Adhesive Charge +]--
			-- Rumbler -- 6% | 9% | 12% | 15%
	create_template("trait_bespoke_147_desc_ext_en", {"loc_trait_bespoke_grenades_stick_to_monsters_and_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmgvogrmon_var_rgb.." "..COLORS_KWords.Damage_rgb.." vs Ogryns and Monstrosities. Your Grenades Stick to Ogryns and Monstrosities." end), -- dmg_vs_ogryn_monster: +15% -- colors
			--[+ French +]--
	create_template("trait_bespoke_147_desc_ext_fr", {"loc_trait_bespoke_grenades_stick_to_monsters_and_damage_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmgvogrmon_var_rgb.." de "..COLORS_KWords_fr.Damage_rgb_fr.." contre les Ogryns et les Monstruosités. Vos grenades s'accrochent aux Ogryns et Monstrosities." end), 

		--[+ Marksman's Reflex +]--
			-- Rumbler -- 15% | 20% | 25% | 30%
	create_template("trait_bespoke_148_desc_ext_en", {"loc_trait_bespoke_weakspot_projectile_hit_increases_reload_speed_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_reload_var_rgb.." Reload Speed for "..COLORS_Numbers.dur_var_rgb.." seconds on Projectile "..COLORS_KWords.Weakspothit_rgb.."." end), -- reload_speed: +30%, duration: 3 -- colors
			--[+ French +]--
	create_template("trait_bespoke_148_desc_ext_fr", {"loc_trait_bespoke_weakspot_projectile_hit_increases_reload_speed_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_reload_var_rgb.." de vitesse de rechargement pendant "..COLORS_Numbers.dur_var_rgb.." secondes lors d'un "..COLORS_KWords_fr.Weakspothit_rgb_fr.."." end),
}



		-- ============ DO NOT DO ANYTHING BELOW! ============ --

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
