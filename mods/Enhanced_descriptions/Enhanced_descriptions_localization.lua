---@diagnostic disable: undefined-global, undefined-field
local mod = get_mod("Enhanced_descriptions")
local InputUtils = require("scripts/managers/input/input_utils")

-- Duplicate the line and translate. For example:
--		en = "Enhanced Descriptions",
--		ru = "Расширенные описания", <- Don't forget the comma at the end!

local localizations = {
	mod_name = {
		en = "Enhanced Descriptions",
		-- fr = "Descriptions avancées",
	},
	mod_description = {
		en = "Enhanced Descriptions — fixes and additions to game descriptions. Merged mod. Included TALENTS, CURIOS, WEAPON PERKS and BLESSINGS.",
		fr = "Descriptions avancées : corrections et ajouts aux descriptions du jeu. Version fusionnée incluant les Talents, Curiosités, Atouts et Bénédictions des armes.",
	},

	enable_weapons_file = {
		en = "Toggle Weapons module",
		fr = "Activer le module des armes",
	},
	enable_weapons_file_description = {
		en = "This module highlights the Words and Numbers of Weapon Blessings and Perks. You can disable this module if you don't need it.\n{#color(255, 155, 55)}But you have to Reload mods by pressing CTRL+SHIFT+R!{#reset()}\n{#color(100, 100, 100)}* To enable this feature, you need to go to the Darktide Mod Framework options and enable Developer Mode.{#reset()}",
		fr = "Ce module met en évidence les mots et les chiffres des bénédictions et avantages des armes. Vous pouvez désactiver ce module si vous n'en avez pas besoin.\n{#color(255, 155, 55)}Mais vous devez recharger les mods en appuyant sur CTRL+SHIFT+R !{#reset()}\n{# color(100, 100, 100)}* Pour activer cette fonctionnalité, vous devez accéder aux options de Darktide Mod Framework et activer le mode développeur.{#reset()}",
	},

	enable_curious_file = {
		en = "Toggle Curios module",
		fr = "Activer le module des curiosités",
	},
	enable_curious_file_description = {
		en = "This module highlights the Words and Numbers of the Blessings and Perks of the Curios. You can disable this module if you don't need it .\n{#color(255, 155, 55)}But you have to Reload mods by pressing CTRL+SHIFT+R!{#reset()}\n{#color(100, 100, 100)}* To enable this feature, you need to go to the Darktide Mod Framework options and enable Developer Mode.{#reset()}",
		fr = "Ce module met en évidence les mots et les chiffres des bénédictions et avantages des curiosités. Vous pouvez désactiver ce module si vous n'en avez pas besoin.\n{#color(255, 155, 55)}Mais vous devez recharger les mods en appuyant sur CTRL+SHIFT+R !{#reset()}\n{# color(100, 100, 100)}* Pour activer cette fonctionnalité, vous devez accéder aux options de Darktide Mod Framework et activer le mode développeur.{#reset()}",
	},

	enable_menus_file = {
		en = "Toggle Menus module",
		fr = "Activer le module des menus",
	},
	enable_menus_file_description = {
		en = "This module highlights the Numbers of the Melk's Contracts. You can disable this module if you don't need it.\n{#color(255, 155, 55)}But you have to Reload mods by pressing CTRL+SHIFT+R!{#reset()}\n{#color(100, 100, 100)}* To enable this feature, you need to go to the Darktide Mod Framework options and enable Developer Mode.{#reset()}",
		fr = "Ce module met en évidence les numéros des contrats de Melk. Vous pouvez désactiver ce module si vous n'en avez pas besoin.\n{#color(255, 155, 55)}Mais vous devez recharger les mods en appuyant sur CTRL+SHIFT+R !{#reset()}\n{# color(100, 100, 100)}* Pour activer cette fonctionnalité, vous devez accéder aux options de Darktide Mod Framework et activer le mode développeur.{#reset()}",
	},

	enable_talents_file = {
		en = "Toggle Talents module",
		fr = "Activer le module des talents",
	},
	enable_talents_file_description = {
		en = "This module highlights Talent words. You can disable this module if you don't need it, but all Extended Descriptions will also be disabled.\n{#color(255, 155, 55)}But you have to Reload mods by pressing CTRL+SHIFT+R!{#reset()}\n{#color(100, 100, 100)}* To enable this feature, you need to go to the Darktide Mod Framework options and enable Developer Mode.{#reset()}",
		fr = "Ce module met en avant les mots clés des Talents. Vous pouvez désactiver ce module si vous n'en avez pas besoin mais les descriptions avancées seront également désactiver.\n{#color(255, 155, 55)}Mais vous devez recharger les mods en appuyant sur CTRL+SHIFT+R !{#reset ()}\n{#color(100, 100, 100)}* Pour activer cette fonctionnalité, vous devez accéder aux options de Darktide Mod Framework et activer le mode développeur.{#reset()}",
	},
--[+ Enhanced Descriptions - Talents +]--
	enhanced_descriptions_ = {
		en = " Extended Descriptions",
		fr = " Descriptions avancées",
	},
	enhanced_descriptions_enabled = {
		en = "Toggle Extended Descriptions - Talents - Psyker+Zealot",
		fr = "Activer descriptions avancées pour Psyker et Fanatique",
	},
	enhanced_descriptions_enabled_description = {
		en = "If you don't need Extended Descriptions for Talents, you can Disable them.\n{#color(255, 155, 55)}But you have to Reload mods by pressing CTRL+SHIFT+R!{#reset()}\n{#color(100, 100, 100)}* To enable this feature, you need to go to the Darktide Mod Framework options and enable Developer Mode.{#reset()}",
		fr = "Si vous n'avez pas besoin des descriptions étendues pour les talents, vous pouvez les désactiver.\n{#color(255, 155, 55)}Mais vous devez recharger les mods en appuyant sur CTRL+SHIFT+R !{#reset ()}\n{#color(100, 100, 100)}* Pour activer cette fonctionnalité, vous devez accéder aux options de Darktide Mod Framework et activer le mode développeur.{#reset()}",
	},
	enhanced_descriptions_enabled2 = {
		en = "Toggle Extended Descriptions - Talents - Veteran+Ogryn",
		fr = "Activer descriptions avancées pour Vétéran et Ogryn",
	},
	enhanced_descriptions_enabled2_description = {
		en = "If you don't need Extended Descriptions for Talents, you can Disable them.\n{#color(255, 155, 55)}But you have to Reload mods by pressing CTRL+SHIFT+R!{#reset()}\n{#color(100, 100, 100)}* To enable this feature, you need to go to the Darktide Mod Framework options and enable Developer Mode.{#reset()}",
		fr = "Si vous n'avez pas besoin des descriptions étendues pour les talents, vous pouvez les désactiver.\n{#color(255, 155, 55)}Mais vous devez recharger les mods en appuyant sur CTRL+SHIFT+R !{#reset ()}\n{#color(100, 100, 100)}* Pour activer cette fonctionnalité, vous devez accéder aux options de Darktide Mod Framework et activer le mode développeur.{#reset()}",
	},
--[+ Enhanced Descriptions - Nodes +]--
	enhanced_descriptions_nodes_enabled = {
		en = "Toggle Extended Descriptions - Nodes",
		fr = "Activer descriptions avancées pour les noeuds des arbres de talents",
	},
	enhanced_descriptions_nodes_enabled_description = {
		en = "If you don't need Extended Descriptions for small Nodes, you can Disable them.\n{#color(255, 155, 55)}But you have to Reload mods by pressing CTRL+SHIFT+R!{#reset()}\n{#color(100, 100, 100)}* To enable this feature, you need to go to the Darktide Mod Framework options and enable Developer Mode.{#reset()}",
		fr = "Si vous n'avez pas besoin des descriptions étendues pour les noeuds, vous pouvez les désactiver.\n{#color(255, 155, 55)}Mais vous devez recharger les mods en appuyant sur CTRL+SHIFT+R !{#reset ()}\n{#color(100, 100, 100)}* Pour activer cette fonctionnalité, vous devez accéder aux options de Darktide Mod Framework et activer le mode développeur.{#reset()}",
	},
	enhdesc_colour = {
		en = "",
		-- fr = "",
	},

--[+Main+]--
	combat_ability_colour = {
		en = " Combat Ability",
		fr = " Capacité de combat",
	},
	health_colour = {
		en = " Health / Wound",
		fr = " Santé / Blessure",
	},
	peril_colour = {
		en = " Peril",
		fr = " Péril",
	},
	stamina_colour = {
		en = " Stamina",
		fr = " Endurance",
	},
	toughness_colour = {
		en = " Toughness",
		fr = " Robustesse",
	},

--[+Buffs+]--
	cleave_colour = {
		en = " Cleave",
		fr = " Transpercement",
	},
	crit_colour = {
		en = " Crit",
		fr = " Critique",
	},
	damage_colour = {
		en = " Damage",
		fr = " Dégât",
	},
	finesse_colour = {
		en = " Finesse",
		fr = " Finesse",
	},
	hit_mass_colour = {
		en = " Hit Mass",
		fr = " Coup en masse",
	},
	impact_colour = {
		en = " Impact",
		fr = " Impact",
	},
	power_colour = {
		en = " Power",
		fr = " Puissance",
	},
	rending_colour = {
		en = " Rending",
		fr = " Déchirure",
	},
	weakspot_colour = {
		en = " Weak Spot",
		fr = " Coup sur point faible",
	},

--[+Debuffs+]--
	bleed_colour = {
		en = " Bleed",
		fr = " Saignement",
	},
	brittleness_colour = {
		en = " Brittleness",
		fr = " Fragilité",
	},
	burn_colour = {
		en = " Burn",
		fr = " Brûlure",
	},
	corruption_colour = {
		en = " Corruption",
		fr = " Corruption",
	},
	electrocuted_colour = {
		en = " Electrocuted",
		fr = " Eclair",
	},
	soulblaze_colour = {
		en = " Soulblaze",
		fr = " Embrasement d'âme",
	},
	stagger_colour = {
		en = " Stagger",
		fr = " Vacillement",
	},

--[+Psyker+]--
	precision_colour = {
		en = " Precision",
		fr = " Precision",
	},

--[+Ogryn+]--
	fnp_colour = {
		en = " Feel No Pain",
		fr = " Adieu la douleur",
	},
	luckyb_colour = {
		en = " Lucky bullet",
		fr = " Balles chanceuses",
	},
	trample_colour = {
		en = " Trample",
		fr = " Piétinement",
	},

--[+Zealot+]--
	fury_colour = {
		en = " Fury",
		fr = " Piété embrasée",
	},
	momentum_colour = {
		en = " Momentum",
		fr = " Jugement inexorable",
	},
	stealth_colour = {
		en = " Stealth",
		fr = " Furtivité",
	},

--[+Veteran+]--
	focus_colour = {
		en = " Focus",
		fr = " Focalisation",
	},
	focust_colour = {
		en = " Focus Target",
		fr = " Ciblage",
	},
	meleespec_colour = {
		en = " Melee Specialist",
		fr = " Spcécialiste en mêlée",
	},
	rangedspec_colour = {
		en = " Ranged Specialist",
		fr = " Spcécialiste à distance",
	},

--[+Misc+]--
	note_colour = {
		en = " Note",
		fr = " Annotation",
	},
	numbers_colour = {
		en = " Numbers",
		fr = " Nombres",
	},
	variables_colour = {
		en = " Variables",
		fr = " Variables",
	},
	warning_colour = {
		en = " Warning",
		fr = " Alerte",
	},
	talents_colour = {
		en = " Talents",
		fr = " Talents",
	},
}

local function addLocalisation(localisations, typeName)
	localisations[typeName .. "_text_colour"] = {
		en = "Color",
		fr = "Couleur",
	}
end

			-- ============ DO NOT DO ANYTHING BELOW! ============ --



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
addLocalisation(localizations, "talents")

return localizations
