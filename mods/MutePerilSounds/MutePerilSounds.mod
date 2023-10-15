return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`MutePerilSounds` encountered an error loading the Darktide Mod Framework.")

		new_mod("MutePerilSounds", {
			mod_script       = "MutePerilSounds/scripts/mods/MutePerilSounds/MutePerilSounds",
			mod_data         = "MutePerilSounds/scripts/mods/MutePerilSounds/MutePerilSounds_data",
			mod_localization = "MutePerilSounds/scripts/mods/MutePerilSounds/MutePerilSounds_localization",
		})
	end,
	packages = {},
}
