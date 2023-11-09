return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`more_characters_and_loadouts` encountered an error loading the Darktide Mod Framework.")

		new_mod("more_characters_and_loadouts", {
			mod_script       = "more_characters_and_loadouts/scripts/mods/more_characters_and_loadouts/more_characters_and_loadouts",
			mod_data         = "more_characters_and_loadouts/scripts/mods/more_characters_and_loadouts/more_characters_and_loadouts_data",
			mod_localization = "more_characters_and_loadouts/scripts/mods/more_characters_and_loadouts/more_characters_and_loadouts_localization",
		})
	end,
	packages = {},
}
