local mod = get_mod("SoloPlay")
local SoloPlaySettings = mod:io_dofile("SoloPlay/scripts/mods/SoloPlay/SoloPlaySettings")
local MissionTemplates = require("scripts/settings/mission/mission_templates")
local CircumstanceTemplates = require("scripts/settings/circumstance/circumstance_templates")
local MissionObjectiveTemplates = require("scripts/settings/mission_objective/mission_objective_templates")

local loc = {
	mod_name = {
		en = "Solo Play",
		["zh-cn"] = "单人游戏",
	},
	mod_description = {
		en = "Play offline solo mission with /solo command. You won't get any progression or reward.",
		["zh-cn"] = "输入 /solo 命令玩离线单人任务。不会获得任何进度或奖励。",
	},
	solo_command_desc = {
		en = "Play offline solo mission",
		["zh-cn"] = "玩离线单人任务",
	},
	msg_not_in_hub_or_mission = {
		en = "Error: not in Mourningstar, Psykhanium or Solo Play",
		["zh-cn"] = "错误：不在哀星号上、灵能室内或单人任务中",
	},
	msg_starting_soloplay = {
		en = "Starting solo mission...",
		["zh-cn"] = "正在开始单人任务...",
	},
	group_mission_settings = {
		en = "Mission settings",
		["zh-cn"] = "任务设置",
	},
	choose_mission = {
		en = "Choose mission",
		["zh-cn"] = "选择任务",
	},
	choose_difficulty = {
		en = "Choose difficulty",
		["zh-cn"] = "选择难度",
	},
	choose_side_mission = {
		en = "Choose side mission",
		["zh-cn"] = "选择次要目标",
	},
	choose_circumstance = {
		en = "Choose special condition",
		["zh-cn"] = "选择特殊状况",
	},
	default_text = {
		en = "None",
		["zh-cn"] = "无",
	},
	format_auric = {
		en = Localize("loc_mission_board_type_auric") .. " %s",
		["zh-cn"] = Localize("loc_mission_board_type_auric") .. "%s",
	},
	group_modifiers = {
		en = "Modifiers",
		["zh-cn"] = "修改项",
	},
	friendly_fire_enabled = {
		en = "Friendly fire",
		["zh-cn"] = "友军伤害",
	},
	random_side_mission_seed = {
		en = "Random side mission location",
		["zh-cn"] = "随机次要目标位置",
	},
	random_side_mission_seed_description = {
		en = "Currently, side mission pickup spawn locations are locked and only changed on a weekly cadence.\n" ..
			"This option enables the old random location generator in Solo Play.",
		["zh-cn"] = "目前，次要目标的生成位置是固定的，仅会每周刷新一次。\n" ..
			"此选项会在单人游戏中启用旧版的随机位置生成器。",
	},
	group_global_options = {
		en = "Global options",
		["zh-cn"] = "全局选项",
	},
	inventory_keybind = {
		en = "Inventory keybind",
		["zh-cn"] = "库存快捷键",
	},
}

-- No more translations below

for _, mission in ipairs(SoloPlaySettings.missions) do
	loc[mission.loc_key] = {
		en = mission.loc_value,
	}
end
for _, side_mission in ipairs(SoloPlaySettings.side_missions) do
	loc[side_mission.loc_key] = {
		en = side_mission.loc_value,
	}
end
for _, circumstance in ipairs(SoloPlaySettings.circumstances) do
	if circumstance.format_key then
		for locale, format in pairs(loc[circumstance.format_key]) do
			loc[circumstance.loc_key] = loc[circumstance.loc_key] or {}
			loc[circumstance.loc_key][locale] = string.format(format, circumstance.loc_value)
		end
	else
		loc[circumstance.loc_key] = {
			en = circumstance.loc_value,
		}
	end
end

return loc
