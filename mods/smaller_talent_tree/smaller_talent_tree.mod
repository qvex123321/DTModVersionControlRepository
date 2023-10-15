return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`smaller_talent_tree` encountered an error loading the Darktide Mod Framework.")

		new_mod("smaller_talent_tree", {
			mod_script       = "smaller_talent_tree/scripts/mods/smaller_talent_tree/smaller_talent_tree",
			mod_data         = "smaller_talent_tree/scripts/mods/smaller_talent_tree/smaller_talent_tree_data",
			mod_localization = "smaller_talent_tree/scripts/mods/smaller_talent_tree/smaller_talent_tree_localization",
		})
	end,
	packages = {},
}
