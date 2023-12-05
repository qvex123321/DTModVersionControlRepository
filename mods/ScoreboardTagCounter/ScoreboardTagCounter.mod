return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`ScoreboardTagCounter` encountered an error loading the Darktide Mod Framework.")

		new_mod("ScoreboardTagCounter", {
			mod_script       = "ScoreboardTagCounter/scripts/mods/ScoreboardTagCounter/ScoreboardTagCounter",
			mod_data         = "ScoreboardTagCounter/scripts/mods/ScoreboardTagCounter/ScoreboardTagCounter_data",
			mod_localization = "ScoreboardTagCounter/scripts/mods/ScoreboardTagCounter/ScoreboardTagCounter_localization",
		})
	end,
	packages = {},
}
