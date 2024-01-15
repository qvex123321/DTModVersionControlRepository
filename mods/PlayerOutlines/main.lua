PlayerOutlines = {}
local PO = PlayerOutlines
PO.dmf_mod = get_mod("PlayerOutlines")

local PlayerUnitStatus = require("scripts/utilities/attack/player_unit_status")

PO.UPDATE_INTERVAL = 0.5
PO.dmf_mod.settings = {}
PO.instances = {}
PO.utils = Mods.file.dofile("PlayerOutlines/utils")

PO.get_outline_system = function()
	local ext = PO.utils.nil_check(Managers, "state", "extension")
	if not ext then return end
	return ext:system("outline_system")
end

PO.spawn_hologram = function(world, resources, parent_unit, state_name)
	if not world then return end

	local resource = state_name == "consumed" and resources[state_name] or
		resources.default
	local hologram_unit = World.spawn_unit_ex(world, resource)

	World.link_unit(world, hologram_unit, 1, parent_unit, 1, true)
	Unit.set_unit_culling(hologram_unit, false, true)

	local player_visibility_system = ScriptUnit.has_extension(parent_unit,
		"player_visibility_system")

	if player_visibility_system and not player_visibility_system:visible() then
		Unit.set_unit_visibility(hologram_unit, false, true)
	end

	return hologram_unit
end

PO.despawn_hologram = function(world, hologram_unit)
	if not world or not hologram_unit then return end
	World.unlink_unit(world, hologram_unit, true)
	World.destroy_unit(world, hologram_unit)
end

PO.selected_outline_name = function()
	local show_outline = PO.dmf_mod.settings["show_outline"]
	local show_mesh = PO.dmf_mod.settings["show_mesh"]

	if show_outline then
		if show_mesh then return "default_both_always" end
		return "default_outlines_always"
	end

	return show_mesh and "default_mesh_always" or nil
end

PO.clear_outlines = function(unit)
	PO.get_outline_system():remove_all_outlines(unit)
end

PO.update_outline = function(ext, unit)
	local added_outline = ext._added_disabled_outline
	local is_disabled = PlayerUnitStatus.is_disabled(
		ext._character_state_component)

	if is_disabled and not added_outline then
		ext._outline_system:add_outline(unit, "knocked_down")
		ext._added_disabled_outline = true
	elseif added_outline and not is_disabled then
		ext._outline_system:remove_outline(unit, "knocked_down")
		ext._added_disabled_outline = false
	end

	if not ext._is_local_human then
		local outline_name = PO.selected_outline_name()

		if outline_name then
			ext._outline_system:add_outline(unit, outline_name)
		end
	end
end

PO.clear_all_outlines = function()
	if not Managers.player then return end

	for _, player in pairs(Managers.player:players()) do
		PO.clear_outlines(player.player_unit)
	end
end

PO.update_settings_cache = function()
	PO.dmf_mod.settings["assist_marker_max_distance"] = PO.dmf_mod:get("assist_marker_max_distance")
	PO.dmf_mod.settings["mission_nameplates_max_distance"] = PO.dmf_mod:get("mission_nameplates_max_distance")
	PO.dmf_mod.settings["show_hologram"] = PO.dmf_mod:get("show_hologram")
	PO.dmf_mod.settings["show_in_hub"] = PO.dmf_mod:get("show_in_hub")
	PO.dmf_mod.settings["show_mesh"] = PO.dmf_mod:get("show_mesh")
	PO.dmf_mod.settings["show_outline"] = PO.dmf_mod:get("show_outline")
end

PO.update_settings_cache()

Mods.file.dofile("PlayerOutlines/mod_events")
Mods.file.dofile("PlayerOutlines/hooks")
