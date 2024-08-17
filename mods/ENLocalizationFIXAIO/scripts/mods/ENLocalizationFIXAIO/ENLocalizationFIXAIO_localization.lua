local mod = get_mod("ENLocalizationFIXAIO")
local InputUtils = require("scripts/managers/input/input_utils")

local localizations = {
	mod_name = {
		en = "Enhanced Descriptions - All in one",
	},
	mod_description = {
		en = "Enhanced Descriptions — fixes and additions to game descriptions. Merged mod. Included TALENTS, CURIOS, WEAPON PERKS and BLESSINGS.",
	},

	bleed_colour = {
		en = "Bleed",
	},
	brittleness_colour = {
		en = "Brittleness",
	},
	burn_colour = {
		en = "Burn",
	},
	combat_ability_colour = {
		en = "Combat Ability",
	},
	corruption_colour = {
		en = "Corruption",
	},
	cleave_colour = {
		en = "Cleave",
	},
	crit_colour = {
		en = "Crit",
	},
	damage_colour = {
		en = "Damage",
	},
	electrocuted_colour = {
		en = "Electrocuted",
	},
	fnp_colour = {
		en = "Feel No Pain",
	},
	finesse_colour = {
		en = "Finesse",
	},
	focus_colour = {
		en = "Focus",
	},
	focust_colour = {
		en = "Focus Target",
	},
	fury_colour = {
		en = "Fury",
	},
	health_colour = {
		en = "Health / Wound",
	},
	hit_mass_colour = {
		en = "Hit Mass",
	},
	impact_colour = {
		en = "Impact",
	},
	luckyb_colour = {
		en = "Lucky bullet",
	},
	meleespec_colour = {
		en = "Melee Specialist",
	},
	momentum_colour = {
		en = "Momentum",
	},
	peril_colour = {
		en = "Peril",
	},
	power_colour = {
		en = "Power",
	},
	precision_colour = {
		en = "Precision",
	},
	rangedspec_colour = {
		en = "Ranged Specialist",
	},
	rending_colour = {
		en = "Rending",
	},
	soulblaze_colour = {
		en = "Soulblaze",
	},
	stagger_colour = {
		en = "Stagger",
	},
	stamina_colour = {
		en = "Stamina",
	},
	stealth_colour = {
		en = "Stealth",
	},
	toughness_colour = {
		en = "Toughness",
	},
	trample_colour = {
		en = "Trample",
	},
	variables_colour = {
		en = "Variables",
	},
	warning_colour = {
		en = "Warning",
	},
	weakspot_colour = {
		en = "Weak Spot",
	},
	note_colour = {
		en = "Note",
	},
}

-- Thanks to Wobin!
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

addLocalisation(localizations, "bleed")
addLocalisation(localizations, "brittleness")
addLocalisation(localizations, "burn")
addLocalisation(localizations, "combat_ability")
addLocalisation(localizations, "corruption")
addLocalisation(localizations, "cleave")
addLocalisation(localizations, "crit")
addLocalisation(localizations, "damage")
addLocalisation(localizations, "fnp")
addLocalisation(localizations, "finesse")
addLocalisation(localizations, "focus")
addLocalisation(localizations, "focust")
addLocalisation(localizations, "fury")
addLocalisation(localizations, "health")
addLocalisation(localizations, "hit_mass")
addLocalisation(localizations, "impact")
addLocalisation(localizations, "luckyb")
addLocalisation(localizations, "meleespec")
addLocalisation(localizations, "momentum")
addLocalisation(localizations, "peril")
addLocalisation(localizations, "power")
addLocalisation(localizations, "precision")
addLocalisation(localizations, "rangedspec")
addLocalisation(localizations, "rending")
addLocalisation(localizations, "soulblaze")
addLocalisation(localizations, "stagger")
addLocalisation(localizations, "stamina")
addLocalisation(localizations, "stealth")
addLocalisation(localizations, "toughness")
addLocalisation(localizations, "trample")
addLocalisation(localizations, "variables")
addLocalisation(localizations, "warning")
addLocalisation(localizations, "weakspot")
addLocalisation(localizations, "note")

return localizations
