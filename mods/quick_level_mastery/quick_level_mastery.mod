return {
	run = function()
		fassert(rawget(_G, "quick_level_mastery"), "`quick_level_mastery` encountered an error loading the Darktide Mod Framework.")

		new_mod("quick_level_mastery", {
			mod_script       = "quick_level_mastery/scripts/quick_level_mastery_main",
			mod_data         = "quick_level_mastery/scripts/quick_level_mastery_data",
			mod_localization = "quick_level_mastery/scripts/quick_level_mastery_localization",
		})
	end,
	packages = {},
}
