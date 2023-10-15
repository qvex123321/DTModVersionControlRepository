return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`ScoreboardDamage` encountered an error loading the Darktide Mod Framework.")

		new_mod("ScoreboardDamage", {
			mod_script       = "ScoreboardDamage/scripts/mods/ScoreboardDamage/ScoreboardDamage",
			mod_data         = "ScoreboardDamage/scripts/mods/ScoreboardDamage/ScoreboardDamage_data",
			mod_localization = "ScoreboardDamage/scripts/mods/ScoreboardDamage/ScoreboardDamage_localization",
		})
	end,
	packages = {},
}
