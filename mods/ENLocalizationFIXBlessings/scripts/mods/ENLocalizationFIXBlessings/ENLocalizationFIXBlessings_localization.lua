local mod = get_mod("ENLocalizationFIXBlessings")
local InputUtils = require("scripts/managers/input/input_utils")

local localizations = {
	mod_name = {
		en = "Enhanced Descriptions",
	},
	mod_description = {
		en = "Enhanced Descriptions - fixes and additions to game descriptions. A module with descriptions of Weapon Blessings.\nIf you enable this module together with the main ENLocalizationFIX mod, then will work the edits of the mod that is in the list above. {#color(255, 54, 54)}It's better not to do this to avoid glitches and crashes!{#reset()}",
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
	cleave_colour = {
		en = "Cleave",
	},
	crit_colour = {
		en = "Crit",
	},
	damage_colour = {
		en = "Damage",
	},
	finesse_colour = {
		en = "Finesse",
	},
	hit_mass_colour = {
		en = "Hit Mass",
	},
	impact_colour = {
		en = "Impact",
	},
	peril_colour = {
		en = "Peril",
	},
	power_colour = {
		en = "Power",
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
	toughness_colour = {
		en = "Toughness",
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
addLocalisation(localizations, "cleave")
addLocalisation(localizations, "crit")
addLocalisation(localizations, "damage")
addLocalisation(localizations, "finesse")
addLocalisation(localizations, "hit_mass")
addLocalisation(localizations, "impact")
addLocalisation(localizations, "peril")
addLocalisation(localizations, "power")
addLocalisation(localizations, "rending")
addLocalisation(localizations, "soulblaze")
addLocalisation(localizations, "stagger")
addLocalisation(localizations, "stamina")
addLocalisation(localizations, "toughness")
addLocalisation(localizations, "weakspot")
addLocalisation(localizations, "note")

return localizations