return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`LoadoutMonitor` encountered an error loading the Darktide Mod Framework.")

		new_mod("LoadoutMonitor", {
			mod_script       = "LoadoutMonitor/scripts/mods/LoadoutMonitor/LoadoutMonitor",
			mod_data         = "LoadoutMonitor/scripts/mods/LoadoutMonitor/LoadoutMonitor_data",
			mod_localization = "LoadoutMonitor/scripts/mods/LoadoutMonitor/LoadoutMonitor_localization",
		})
	end,
	packages = {},
}
