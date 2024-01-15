return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`PlayerOutlines` encountered an error loading the Darktide Mod Framework.")

		new_mod("PlayerOutlines", {
			mod_script       = "PlayerOutlines/main",
			mod_data         = "PlayerOutlines/mod_data",
			mod_localization = "PlayerOutlines/loc",
		})
	end,
	packages = {},
}
