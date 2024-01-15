local PO = PlayerOutlines or {}
local PlayerUnitStatus = require("scripts/utilities/attack/player_unit_status")

-- Remove control of hologram visibility so we can manage it.
PO.dmf_mod:hook_origin("GameModeManager", "disable_hologram", function()
	return false
end)

PO.dmf_mod:hook("PlayerUnitHologramExtension", "update", function(func, self, unit, dt, t)
	if t < self._next_update_t then
		return
	end

	self._next_update_t = t + PO.UPDATE_INTERVAL
	local state_name = self._character_state_component.state_name

	if state_name == "dead" or
			not PO.dmf_mod.settings["show_hologram"] or
			(PO.utils.is_in_hub() and not PO.dmf_mod.settings["show_in_hub"]) then

		if self._hologram_unit then
			PO.despawn_hologram(self._world, self._hologram_unit)
			self._hologram_unit = nil
		end

		return
	else
		if not self._hologram_unit then
			self._hologram_unit = PO.spawn_hologram(self._world,
				self._unit_resources, self._unit, state_name)
			self._hologram_unit = self._hologram_unit
			self._current_spawned_state = state_name
		end

		local health_percent = self._target_health_extension:current_health_percent()
		local is_disabled = PlayerUnitStatus.is_disabled(self._character_state_component)

		if health_percent == self._health and is_disabled == self._was_disabled then
			return
		end

		Unit.set_scalar_for_materials(self._hologram_unit,
			"health_value", is_disabled and 1 or 1 - health_percent, false)

		self._health = health_percent
		self._was_disabled = is_disabled
	end
end)

PO.dmf_mod:hook_require("scripts/ui/hud/elements/world_markers/templates/world_marker_template_player_assistance", function(instance)
	PO.instances.wmt_player_assistance = instance
	PO.dmf_mod.on_setting_changed("assist_marker_max_distance")
end)

PO.dmf_mod:hook_require("scripts/ui/hud/elements/world_markers/templates/world_marker_template_nameplate_combat", function(instance)
	PO.instances.wmt_nameplate_combat = instance
	PO.dmf_mod.on_setting_changed("mission_nameplates_max_distance")
end)

PO.dmf_mod:hook_safe("PlayerUnitOutlineExtension", "extensions_ready", function(self, world, unit)
	if self._is_local_unit then return end
	self._outline_system:add_outline(unit, PO.selected_outline_name())
end)

-- Not exactly ideal, but it works.
PO.dmf_mod:hook_safe("PlayerUnitOutlineExtension", "new", function()
	CLASS.PlayerUnitOutlineExtension.update = function(self, unit, dt, t)
		if t < self._next_update_t then return end
		self._next_update_t = t + PO.UPDATE_INTERVAL

		if PO.utils.is_in_hub() and not PO.dmf_mod.settings["show_in_hub"] then
			PO.clear_outlines(unit)
			return
		end

		PO.update_outline(self, unit)
	end
end)
