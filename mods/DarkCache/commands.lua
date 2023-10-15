DC.mod:command("dc_servertime", "Prints the server time.", function()
	DC.rt:print("Server time: " .. DC.server_time)
end)

DC.mod:command("dc_gametime", "Prints the game time.", function()
	DC.rt:print("Game time: " .. DC.main_time)
end)

DC.mod:command("dc_delete_caches", "Deletes all caches.", function()
	DC.agnostic_cache = nil
	DC.char_caches = {}
	DC.rt:print("Caches deleted.")
end)

DC.mod:command("dc_char_id", "Prints current char id.", function()
	DC.rt:print(DC.get_current_char_id())
end)

DC.mod:command("dc_init", "Initialises caches as though doing startup. You need to run this after reloading mods or there are no caches.", function()
	if not DC.rt.utils.player_in_hub() then
		return DC.rt:print("Only run this in the hub!")
	end

	DC.init_general(true)
end)

DC.mod:command("dc_preload", "Runs the Mourningstar preload.", function()
	DC.preload_hub()
end)

DC.mod:command("dc_set_preload_version", "Sets the 'last_load_game_version' field for purposes of testing hub preloading game version changes.", function(str)
	DC.mod:set("last_load_game_version", str)
end)
