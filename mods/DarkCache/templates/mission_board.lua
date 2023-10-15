return {
	key = "mission_board",
	setting_id = "cache_item_mission_board",
	refresh_on_expiry = true,
	hooks = {
		{ obj = "MissonBoardService", method = "fetch" }
	},
	cb_fetch = function()
		return Managers.data_service.mission_board:fetch(nil, 1)
	end,
	cb_response = function(self, data)
		if data and data.expiry_game_time then
			self.expires_at_time = Managers.backend:get_server_time(
				data.expiry_game_time)
			return
		end

		self.expires_at_time = math.huge
	end
}
