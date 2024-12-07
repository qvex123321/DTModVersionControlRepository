---@diagnostic disable: undefined-global

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

	--[+ MELK +]--
		--[+ Contracts +]--
	create_template("contract_melk_task0_ext_en", {"loc_contracts_task_label_kill_bosses"}, {"en",}, function(locale, value) return "Kill "..COLORS_Numbers.countd_var_rgb.." Monstrosities" end),
	create_template("contract_melk_task1_ext_en", {"loc_contracts_task_label_collect_resources"}, {"en",}, function(locale, value) return "Collect "..COLORS_Numbers.counts_var_rgb.." {kind:%s}" end),
	create_template("contract_melk_task2_ext_en", {"loc_contracts_task_label_kill_minions"}, {"en",}, function(locale, value) return "Kill "..COLORS_Numbers.countd_var_rgb.." {enemy_type:%s} with {weapon_type:%s}" end),
	create_template("contract_melk_task3_ext_en", {"loc_contracts_task_label_complete_missions"}, {"en",}, function(locale, value) return "Complete "..COLORS_Numbers.countd_var_rgb.." missions" end),
	create_template("contract_melk_task4_ext_en", {"loc_contracts_task_label_complete_mission_no_death"}, {"en",}, function(locale, value) return "Complete "..COLORS_Numbers.countd_var_rgb.." missions with no player deaths" end),
	create_template("contract_melk_task5_ext_en", {"loc_contracts_task_label_collect_pickups"}, {"en",}, function(locale, value) return "Pick up "..COLORS_Numbers.counts_var_rgb.." {kind:%s}" end),
}

--[+ Return the localization templates +]--
return localization_templates
