---@diagnostic disable: undefined-global

local mod = get_mod("Enhanced_descriptions")

--[+ Loading colors of Keywords and Numbers +]--
COLORS_Numbers = mod:io_dofile("Enhanced_descriptions/COLORS_Numbers")
-- All numbers are taken from this file by adding to the value "COLORS_Numbers."
-- For example, in the game the Damage value is taken from the variable {damage:%s}, which in the file "COLORS_Numbers.lua" is replaced by dmg_var_rgb and to add the highlighted number to the text, we write the damage number to the text as "..COLORS_Numbers.dmg_var_rgb.."

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

	--[+ MELK +]--
		--[+ Contracts +]-- Highlighted numbers
			--[+ Kill Х Monstrosities +]--
	create_template("contract_melk_task0_ext_en", {"loc_contracts_task_label_kill_bosses"}, {"en",}, function(locale, value) return "Kill "..COLORS_Numbers.countd_var_rgb.." Monstrosities" end),
			--[+ Collect Х kind +]--
	create_template("contract_melk_task1_ext_en", {"loc_contracts_task_label_collect_resources"}, {"en",}, function(locale, value) return "Collect "..COLORS_Numbers.counts_var_rgb.." {kind:%s}" end),
			--[+ Kill Х enemy_type with weapon_type +]--
	create_template("contract_melk_task2_ext_en", {"loc_contracts_task_label_kill_minions"}, {"en",}, function(locale, value) return "Kill "..COLORS_Numbers.countd_var_rgb.." {enemy_type:%s} with {weapon_type:%s}" end),
			--[+ Complete Х missions +]--
	create_template("contract_melk_task3_ext_en", {"loc_contracts_task_label_complete_missions"}, {"en",}, function(locale, value) return "Complete "..COLORS_Numbers.countd_var_rgb.." missions" end),
			--[+ Complete Х missions with no player deaths +]--
	create_template("contract_melk_task4_ext_en", {"loc_contracts_task_label_complete_mission_no_death"}, {"en",}, function(locale, value) return "Complete "..COLORS_Numbers.countd_var_rgb.." missions with no player deaths" end),
			--[+ Pick up Х kind +]--
	create_template("contract_melk_task5_ext_en", {"loc_contracts_task_label_collect_pickups"}, {"en",}, function(locale, value) return "Pick up "..COLORS_Numbers.counts_var_rgb.." {kind:%s}" end),
}

--[+ Return the localization templates +]--
return localization_templates
