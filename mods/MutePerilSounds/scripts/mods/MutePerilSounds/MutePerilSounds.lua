-- Author: Raulikien

local mod = get_mod("MutePerilSounds")

mod:hook("PlayerUnitMoodExtension", "_add_mood", function(func, self, t, mood_type, reset_time)
    if mod:get("mute_peril_sounds") then
      if mood_type == "warped" or mood_type == "warped_low_to_high" or mood_type == "warped_high_to_critical" or mood_type == "warped_critical" then
        return
      end
    end
    return func(self, t, mood_type, reset_time)
end)
