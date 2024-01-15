local PO = PlayerOutlines

PO.dmf_mod.on_setting_changed = function(setting_id)
	PO.update_settings_cache()

	-- Update visuals when a setting changes.
	if setting_id == "show_hologram"
			or setting_id == "show_mesh"
			or setting_id == "show_outline"
			or setting_id == "show_in_hub" then
		PlayerOutlines.clear_all_outlines()
	elseif setting_id == "mission_nameplates_max_distance" and
			PlayerOutlines.instances.wmt_nameplate_combat then
		PlayerOutlines.instances.wmt_nameplate_combat.max_distance =
			PO.dmf_mod.settings["mission_nameplates_max_distance"]
	elseif setting_id == "assist_marker_max_distance" and
			PlayerOutlines.instances.wmt_player_assistance then
		PlayerOutlines.instances.wmt_player_assistance.max_distance =
			PO.dmf_mod.settings["assist_marker_max_distance"]
	end
end

PO.dmf_mod.on_unload = PlayerOutlines.clear_all_outlines
