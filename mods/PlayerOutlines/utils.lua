return {
	nil_check = function(root, ...)
		local parts = {...}
		local o = root

		for i = 1, #parts do
			if not o[parts[i]] then return nil end
			o = o[parts[i]]
		end

		return o
	end,
	is_in_hub = function()
		return Managers and Managers.state and Managers.state.game_mode and
			Managers.state.game_mode.game_mode_name and
			Managers.state.game_mode:game_mode_name() == "hub"
	end
}
