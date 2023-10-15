return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`NoSkull` encountered an error loading the Darktide Mod Framework.")

		new_mod("NoSkull", {
			mod_script       = "NoSkull/main",
			mod_data         = "NoSkull/mod_data",
			mod_localization = "NoSkull/localisation",
		})
	end,
	packages = {},
}
