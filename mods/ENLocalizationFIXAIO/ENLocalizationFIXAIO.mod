return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`ENLocalizationFIXAIO` encountered an error loading the Darktide Mod Framework.")

		new_mod("ENLocalizationFIXAIO", {
			mod_script       = "ENLocalizationFIXAIO/scripts/mods/ENLocalizationFIXAIO/ENLocalizationFIXAIO",
			mod_data         = "ENLocalizationFIXAIO/scripts/mods/ENLocalizationFIXAIO/ENLocalizationFIXAIO_data",
			mod_localization = "ENLocalizationFIXAIO/scripts/mods/ENLocalizationFIXAIO/ENLocalizationFIXAIO_localization",
		})
	end,
	packages = {},
}
