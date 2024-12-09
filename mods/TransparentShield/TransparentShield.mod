return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`TransparentShield` encountered an error loading the Darktide Mod Framework.")

		new_mod("TransparentShield", {
			mod_script       = "TransparentShield/scripts/TransparentShield",
			mod_data         = "TransparentShield/scripts/TransparentShield_data",
			mod_localization = "TransparentShield/scripts/TransparentShield_localization",
		})
	end,
	packages = {},
}
