return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`DarkCache` encountered an error loading the Darktide Mod Framework.")

		new_mod("DarkCache", {
			mod_script       = "DarkCache/main",
			mod_data         = "DarkCache/mod_data",
			mod_localization = "DarkCache/localisation",
		})
	end,
	packages = {},
}
