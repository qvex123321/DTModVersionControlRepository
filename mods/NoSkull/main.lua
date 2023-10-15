NoSkull = {}
local ns = NoSkull -- Namespace alias
ns.dmf_mod = get_mod("NoSkull")
ns.marker_templates = {}
ns.settings_cache = {}

local setting_names = {
	"show_skull",
	"fade_distance_start",
	"fade_distance_end",
	"fade_vertical_multiplier"
}

local default_unit_threat_max_distance = 200
local distance_fade_start_sq = 10000
local distance_fade_end_sq = 5000
local distance_fade_delta_sq = 5000

ns.update_settings_cache = function(setting_id)
	for i = 1, #setting_names do
		ns.settings_cache[setting_names[i]] = ns.dmf_mod:get(setting_names[i])
	end

	-- Update dependent values.
	distance_fade_start_sq = ns.settings_cache.fade_distance_start *
		ns.settings_cache.fade_distance_start
	distance_fade_end_sq = ns.settings_cache.fade_distance_end *
		ns.settings_cache.fade_distance_end
	distance_fade_delta_sq = distance_fade_start_sq - distance_fade_end_sq

	if ns.settings_cache.show_skull then
		ns.marker_templates.unit_threat.max_distance =
			default_unit_threat_max_distance > 0 and
			default_unit_threat_max_distance or 200
	else
		ns.marker_templates.unit_threat.max_distance = 0
	end
end

ns.dmf_mod.on_setting_changed = ns.update_settings_cache

ns.dmf_mod:hook_require("scripts/ui/hud/elements/world_markers/templates/world_marker_template_unit_threat", function(instance)
	default_unit_threat_max_distance = instance.max_distance
	ns.marker_templates.unit_threat = instance
	ns.update_settings_cache()
end)

ns.dmf_mod:hook("HudElementWorldMarkers", "_draw_markers", function(func, self, ...)
	local markers_by_type = self._markers_by_type

	-- Get position at center of screen.
	local center = Vector2(
		RESOLUTION_LOOKUP.width / 2,
		RESOLUTION_LOOKUP.height / 2
	)

	for _, markers in pairs(markers_by_type) do
		for i = 1, #markers do
			local m = markers[i]

			if m.template and m.template.name == "unit_threat" then
				local dist_sq = Vector3.distance_squared(center, Vector2(
					m.widget.offset[1], m.widget.offset[2]))

				if dist_sq < distance_fade_end_sq then
					m.widget.style.icon.color[1] = 0
					m.widget.style.text.text_color[1] = 0
				elseif dist_sq < distance_fade_start_sq then
					local inner_distance_sq = dist_sq - distance_fade_end_sq
					local alpha = (inner_distance_sq / distance_fade_delta_sq) * 255
					m.widget.style.icon.color[1] = alpha
					m.widget.style.text.text_color[1] = alpha
				else
					m.widget.style.icon.color[1] = 255
					m.widget.style.text.text_color[1] = 255
				end

			end
		end
	end

	return func(self, ...)
end)

ns.dmf_mod.on_all_mods_loaded = function()
	if not ns.dmf_mod:get("first_startup_happened") then
		ns.dmf_mod:echo("Hey there! {#color(255,0,0)}NoSkull{#reset()} mod here with a once-off reminder. Make sure you delete your old {#color(127,127,127)}no_skull{#reset()} directory!")
		ns.dmf_mod:set("first_startup_happened", true)
	end
end
