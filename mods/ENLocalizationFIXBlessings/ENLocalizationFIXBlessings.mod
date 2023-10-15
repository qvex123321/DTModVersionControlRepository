return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`ENLocalizationFIXBlessings` encountered an error loading the Darktide Mod Framework.")

		new_mod("ENLocalizationFIXBlessings", {
			mod_script       = "ENLocalizationFIXBlessings/scripts/mods/ENLocalizationFIXBlessings/ENLocalizationFIXBlessings",
			mod_data         = "ENLocalizationFIXBlessings/scripts/mods/ENLocalizationFIXBlessings/ENLocalizationFIXBlessings_data",
			mod_localization = "ENLocalizationFIXBlessings/scripts/mods/ENLocalizationFIXBlessings/ENLocalizationFIXBlessings_localization",
		})
	end,
	packages = {},
}
