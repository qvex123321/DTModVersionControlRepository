---@diagnostic disable: undefined-global, undefined-field
local mod = get_mod("Enhanced_descriptions")
local InputUtils = require("scripts/managers/input/input_utils")

local localizations = {
	mod_name = {
		en = "Enhanced Descriptions",
	},
	mod_description = {
		en = "Enhanced Descriptions — fixes and additions to game descriptions. Merged mod. Included TALENTS, CURIOS, WEAPON PERKS and BLESSINGS.",
	},

	enable_weapons_file = {
		en = "Toggle Weapons module",
	},
	enable_weapons_file_description = {
		en = "This module highlights the words and numbers of Weapon Blessings and Perks. You can disable this module if you don't need it.\n{#color(255, 155, 55)}But you have to Reload mods by pressing CTRL+SHIFT+R!{#reset()}\n{#color(100, 100, 100)}* To enable this feature, you need to go to the Darktide Mod Framework options and enable Developer Mode.{#reset()}",
	},

	enable_curious_file = {
		en = "Toggle Curios module",
	},
	enable_curious_file_description = {
		en = "This module highlights the words and numbers of the Blessings and Perks of the Curios. You can disable this module if you don't need it .\n{#color(255, 155, 55)}But you have to Reload mods by pressing CTRL+SHIFT+R!{#reset()}\n{#color(100, 100, 100)}* To enable this feature, you need to go to the Darktide Mod Framework options and enable Developer Mode.{#reset()}",
	},

	enable_menus_file = {
		en = "Toggle Menus module",
	},
	enable_menus_file_description = {
		en = "This module highlights the numbers of the Melk's Contracts. You can disable this module if you don't need it.\n{#color(255, 155, 55)}But you have to Reload mods by pressing CTRL+SHIFT+R!{#reset()}\n{#color(100, 100, 100)}* To enable this feature, you need to go to the Darktide Mod Framework options and enable Developer Mode.{#reset()}",
	},

	enable_talents_file = {
		en = "Toggle Talents module",
	},
	enable_talents_file_description = {
		en = "This module highlights the words of Talents. You can disable this module if you don't need it but Extended Descriptions will also be disabled.\n{#color(255, 155, 55)}But you have to Reload mods by pressing CTRL+SHIFT+R!{#reset()}\n{#color(100, 100, 100)}* To enable this feature, you need to go to the Darktide Mod Framework options and enable Developer Mode.{#reset()}",
	},
--[+ Enhanced Descriptions - Talents +]--
	enhanced_descriptions_ = {
		en = " Extended escriptions",
	},
	enhanced_descriptions_enabled = {
		en = "Toggle Extended Descriptions - Talents - Psyker+Zealot",
	},
	enhanced_descriptions_enabled_description = {
		en = "If you don't need Extended Descriptions for Talents, you can Disable them.\n{#color(255, 155, 55)}But you have to Reload mods by pressing CTRL+SHIFT+R!{#reset()}\n{#color(100, 100, 100)}* To enable this feature, you need to go to the Darktide Mod Framework options and enable Developer Mode.{#reset()}",
	},
	enhanced_descriptions_enabled2 = {
		en = "Toggle Extended Descriptions - Talents - Veteran+Ogryn",
	},
	enhanced_descriptions_enabled2_description = {
		en = "If you don't need Extended Descriptions for Talents, you can Disable them.\n{#color(255, 155, 55)}But you have to Reload mods by pressing CTRL+SHIFT+R!{#reset()}\n{#color(100, 100, 100)}* To enable this feature, you need to go to the Darktide Mod Framework options and enable Developer Mode.{#reset()}",
	},
--[+ Enhanced Descriptions - Nodes +]--
	enhanced_descriptions_nodes_enabled = {
		en = "Toggle Extended Descriptions - Nodes",
	},
	enhanced_descriptions_nodes_enabled_description = {
		en = "If you don't need Extended Descriptions for small Nodes, you can Disable them.\n{#color(255, 155, 55)}But you have to Reload mods by pressing CTRL+SHIFT+R!{#reset()}\n{#color(100, 100, 100)}* To enable this feature, you need to go to the Darktide Mod Framework options and enable Developer Mode.{#reset()}",
	},
	enhdesc_colour = {
		en = "",
	},

--[+Main+]--
	combat_ability_colour = {
		en = " Combat Ability",
	},
	health_colour = {
		en = " Health / Wound",
	},
	peril_colour = {
		en = " Peril",
	},
	stamina_colour = {
		en = " Stamina",
	},
	toughness_colour = {
		en = " Toughness",
	},

--[+Buffs+]--
	cleave_colour = {
		en = " Cleave",
	},
	crit_colour = {
		en = " Crit",
	},
	damage_colour = {
		en = " Damage", --[+{#color(171,91,81)}
	},
	finesse_colour = {
		en = " Finesse",
	},
	hit_mass_colour = {
		en = " Hit Mass",
	},
	impact_colour = {
		en = " Impact", --[+{#color(95,152,180)}
	},
	power_colour = {
		en = " Power",
	},
	rending_colour = {
		en = " Rending",
	},
	weakspot_colour = {
		en = " Weak Spot",
	},

--[+Debuffs+]--
	bleed_colour = {
		en = " Bleed",
	},
	brittleness_colour = {
		en = " Brittleness",
	},
	burn_colour = {
		en = " Burn",
	},
	corruption_colour = {
		en = "  Corruption",
	},
	electrocuted_colour = {
		en = " Electrocuted",
	},
	soulblaze_colour = {
		en = " Soulblaze",
	},
	stagger_colour = {
		en = " Stagger", --[+{#color(95,152,180)}
	},

--[+Psyker+]--
	precision_colour = {
		en = " Precision",
	},

--[+Ogryn+]--
	fnp_colour = {
		en = " Feel No Pain",
	},
	luckyb_colour = {
		en = " Lucky bullet",
	},
	trample_colour = {
		en = " Trample",
	},

--[+Zealot+]--
	fury_colour = {
		en = " Fury",
	},
	momentum_colour = {
		en = " Momentum",
	},
	stealth_colour = {
		en = " Stealth",
	},

--[+Veteran+]--
	focus_colour = {
		en = " Focus",
	},
	focust_colour = {
		en = " Focus Target",
	},
	meleespec_colour = {
		en = " Melee Specialist",
	},
	rangedspec_colour = {
		en = " Ranged Specialist",
	},

--[+Misc+]--
	note_colour = {
		en = " Note",
	},
	numbers_colour = {
		en = " Numbers",
	},
	variables_colour = {
		en = " Variables",
	},
	warning_colour = {
		en = " Warning",
	},
}

local function addLocalisation(localisations, typeName)
	localisations[typeName .. "_text_colour"] = {
		en = "Color",
	}
end

local function readable(text)
	local readable_string = ""
	local tokens = string.split(text, "_")
		for i, token in ipairs(tokens) do
	local first_letter = string.sub(token, 1, 1)
		token = string.format("%s%s", string.upper(first_letter), string.sub(token, 2))
		readable_string = string.trim(string.format("%s %s", readable_string, token))
end
	return readable_string
end

local color_names = Color.list
for i, color_name in ipairs(color_names) do
	local color_values = Color[color_name](255, true)
	local text = InputUtils.apply_color_to_input_text(readable(color_name), color_values)
		localizations[color_name] = {
			en = text
		}
end

--[+Enhanced Descriptions+]--
addLocalisation(localizations, "enhdesc")

--[+Main+]--
addLocalisation(localizations, "combat_ability")
addLocalisation(localizations, "health")
addLocalisation(localizations, "peril")
addLocalisation(localizations, "stamina")
addLocalisation(localizations, "toughness")

--[+Debuffs+]--
addLocalisation(localizations, "bleed")
addLocalisation(localizations, "brittleness")
addLocalisation(localizations, "burn")
addLocalisation(localizations, "corruption")
addLocalisation(localizations, "electrocuted")
addLocalisation(localizations, "soulblaze")
addLocalisation(localizations, "stagger")

--[+Buffs+]--
addLocalisation(localizations, "cleave")
addLocalisation(localizations, "crit")
addLocalisation(localizations, "damage")
addLocalisation(localizations, "finesse")
addLocalisation(localizations, "hit_mass")
addLocalisation(localizations, "impact")
addLocalisation(localizations, "power")
addLocalisation(localizations, "rending")
addLocalisation(localizations, "weakspot")

--[+Psyker+]--
addLocalisation(localizations, "precision")

--[+Ogryn+]--
addLocalisation(localizations, "fnp")
addLocalisation(localizations, "luckyb")
addLocalisation(localizations, "trample")

--[+Zealot+]--
addLocalisation(localizations, "fury")
addLocalisation(localizations, "momentum")
addLocalisation(localizations, "stealth")

--[+Veteran+]--
addLocalisation(localizations, "focus")
addLocalisation(localizations, "focust")
addLocalisation(localizations, "meleespec")
addLocalisation(localizations, "rangedspec")

--[+Misc+]--
addLocalisation(localizations, "note")
addLocalisation(localizations, "variables")
addLocalisation(localizations, "numbers")
addLocalisation(localizations, "warning")

return localizations
