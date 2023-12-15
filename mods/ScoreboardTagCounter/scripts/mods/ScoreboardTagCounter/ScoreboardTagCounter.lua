local mod = get_mod("ScoreboardTagCounter")
local scoreboard = get_mod("scoreboard")
local BreedSettings = require("scripts/settings/breed/breed_settings")

-- mod.on_all_mods_loaded = function()
--     check_dependencies()

--     mod:hook_require("scripts/extension_systems/unit_data/minion_unit_data_extension", function(instance)
--         mod:hook_safe(instance, "init", function(self, extension_init_context, unit, extension_init_data, ...)
--             local breed = extension_init_data.breed
--             if mod.specials[breed.name] and not Audio.is_file_playing(play_file_id) then
--                 -- mod:echo(mod.specials[breed.name].friendly_name .. " spawn detected")
--                 play_file_id = Audio.play_file("SpecialSpawnAnnouncer/audio/" .. mod.specials[breed.name].file,
--                     { audio_type = "sfx", volume = settings_volume, speechnorm = "e=50:r=0.0001:l=1", track_status = true })
--             end
--         end)
--     end)
-- end

local stat_name = "scoreboard_enemies_tagged"

local function player_from_unit(unit)
	if unit then
		for _, player in pairs(Managers.player:players()) do
			if player.player_unit == unit then
				return player
			end
		end
	end
	return nil
end

local tagged_map = {}

local function contains(table, element)
    for _, value in pairs(table) do
      if value == element then
        return true
      end
    end
    return false
end

mod:hook_safe(CLASS.SmartTag, "init", function (self, tag_id, template, tagger, target)
	local unit_data_extension = ScriptUnit.has_extension(target, "unit_data_system")

	if not unit_data_extension then
		return
	end

    local player = player_from_unit(tagger):account_id()
	local breed_type = unit_data_extension:breed().breed_type
	
    if not tagged_map[player] then
        tagged_map[player] = {}
    end
	

    if (breed_type == BreedSettings.types.minion) and not tagged_map[player][target] then
        tagged_map[player][target] = true
        scoreboard:update_stat(stat_name, player, 1)
    end
end)

mod.scoreboard_rows = {
	{
		name = stat_name,
		text = "enemies_tagged",
		validation = "ASC",
		iteration = "ADD",
		group = "team",
		setting = "option_enemies_tagged",
	},
}
