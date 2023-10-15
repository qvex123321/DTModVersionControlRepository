local mod = get_mod("ScoreboardDamage")
local scoreboard = get_mod("scoreboard")
local Breed = scoreboard:original_require("scripts/utilities/breed")

mod.melee_lessers = {
	"chaos_newly_infected",
	"chaos_poxwalker",
	"cultist_melee",
	"renegade_melee",
}
mod.ranged_lessers = {
	"cultist_assault",
	"renegade_assault",
	"renegade_rifleman",
}
mod.melee_elites = {
	"cultist_berzerker",
	"renegade_berzerker",
	"renegade_executor",
	"chaos_ogryn_bulwark",
	"chaos_ogryn_executor",
}
mod.ranged_elites = {
	"cultist_gunner",
	"renegade_gunner",
	"cultist_shocktrooper",
	"renegade_shocktrooper",
	"chaos_ogryn_gunner",
}
mod.specials = {
	"chaos_poxwalker_bomber",
	"renegade_grenadier",
	"cultist_grenadier",
	"renegade_sniper",
	"renegade_flamer",
	"cultist_flamer",
}
mod.disablers = {
	"chaos_hound",
	"cultist_mutant",
	"renegade_netgunner",
}

mod.current_health = {}
mod.last_enemy_interaction = {}

mod:hook(CLASS.AttackReportManager, "add_attack_result", function(
    	func, self, damage_profile, attacked_unit, attacking_unit, attack_direction, hit_world_position, hit_weakspot,
		damage, attack_result, attack_type, damage_efficiency, ...
	)
	local player = scoreboard:player_from_unit(attacking_unit)
	if player then
		local account_id = player:account_id() or player:name()
		local unit_data_extension = ScriptUnit.has_extension(attacked_unit, "unit_data_system")
		local breed_or_nil = unit_data_extension and unit_data_extension:breed()
		local target_is_minion = breed_or_nil and Breed.is_minion(breed_or_nil)
		local actual_damage = damage
		local overkill_damage = 0

		local player_unit_data_extension = ScriptUnit.has_extension(attacking_unit, "unit_data_system")
		local critical_strike_component = player_unit_data_extension:read_component("critical_strike")
		local is_critical_strike = critical_strike_component.is_active

		if target_is_minion then
			-- Set last interacting player_unit
			mod.last_enemy_interaction[attacked_unit] = attacking_unit

			-- Get health extension
			local current_health = mod.current_health[attacked_unit]
			local unit_health_extension = ScriptUnit.has_extension(attacked_unit, "health_system")
			local new_health = unit_health_extension and unit_health_extension:current_health()

			-- Attack result
			if attack_result == "damaged" then
				-- Current health
				if not current_health then
					current_health = new_health + damage
				end
				-- Actual damage
				actual_damage = math.min(damage, current_health)
				-- Update health
				mod.current_health[attacked_unit] = new_health

			elseif attack_result == "died" then
				-- Current health
				if not current_health then
					current_health = damage
				end
				-- Actual damage
				actual_damage = current_health
				-- Overkill damage
				overkill_damage = damage - actual_damage
				-- Update health
				mod.current_health[attacked_unit] = nil
				-- Update scoreboard
				-- mod:echo(breed_or_nil.name)
				if attack_type == "melee" then
					scoreboard:update_stat("melee_killed", account_id, 1)
				else
					scoreboard:update_stat("ranged_killed", account_id, 1)
				end

				if table.array_contains(mod.melee_lessers, breed_or_nil.name) then
					scoreboard:update_stat("melee_lesser_killed", account_id, 1)
					scoreboard:update_stat("lesser_killed", account_id, 1)
				elseif table.array_contains(mod.ranged_lessers, breed_or_nil.name) then
					scoreboard:update_stat("ranged_lesser_killed", account_id, 1)
					scoreboard:update_stat("lesser_killed", account_id, 1)
				elseif table.array_contains(mod.melee_elites, breed_or_nil.name) then
					scoreboard:update_stat("melee_elite_killed", account_id, 1)
					scoreboard:update_stat("elite_killed", account_id, 1)
				elseif table.array_contains(mod.ranged_elites, breed_or_nil.name) then
					scoreboard:update_stat("ranged_elite_killed", account_id, 1)
					scoreboard:update_stat("elite_killed", account_id, 1)
				elseif table.array_contains(mod.specials, breed_or_nil.name) then
					scoreboard:update_stat("special_killed", account_id, 1)
					scoreboard:update_stat("special_disabler_killed", account_id, actual_damage)
				elseif table.array_contains(mod.disablers, breed_or_nil.name) then
					scoreboard:update_stat("disabler_killed", account_id, 1)
					scoreboard:update_stat("special_disabler_killed", account_id, actual_damage)
				end
			end
			
			if attack_type == "melee" then
				scoreboard:update_stat("melee_hit", account_id, 1)
				scoreboard:update_stat("melee_damaged", account_id, actual_damage)
				if is_critical_strike then
					scoreboard:update_stat("melee_critical_hit", account_id, 1)
				end
				if hit_weakspot then
					scoreboard:update_stat("melee_weakspot_hit", account_id, 1)
				end

				local melee_weakspot_rate = mod:get_value("melee_weakspot_hit", account_id) / mod:get_value("melee_hit", account_id) * 100
				local melee_critical_rate = mod:get_value("melee_critical_hit", account_id) / mod:get_value("melee_hit", account_id) * 100
				scoreboard:update_row_value_force("melee_critical_rate", account_id, melee_critical_rate)
				scoreboard:update_row_value_force("melee_weakspot_rate", account_id, melee_weakspot_rate)
			else
				scoreboard:update_stat("ranged_hit", account_id, 1)
				scoreboard:update_stat("ranged_damaged", account_id, actual_damage)
				if is_critical_strike then
					scoreboard:update_stat("ranged_critical_hit", account_id, 1)
				end
				if hit_weakspot then
					scoreboard:update_stat("ranged_weakspot_hit", account_id, 1)
				end

				local ranged_weakspot_rate = mod:get_value("ranged_weakspot_hit", account_id) / mod:get_value("ranged_hit", account_id) * 100
				local ranged_critical_rate = mod:get_value("ranged_critical_hit", account_id) / mod:get_value("ranged_hit", account_id) * 100
				scoreboard:update_row_value_force("ranged_critical_rate", account_id, ranged_critical_rate)
				scoreboard:update_row_value_force("ranged_weakspot_rate", account_id, ranged_weakspot_rate)
			end

			if table.array_contains(mod.melee_lessers, breed_or_nil.name) then
				scoreboard:update_stat("melee_lesser_damaged", account_id, actual_damage)
				scoreboard:update_stat("lesser_damaged", account_id, actual_damage)
			elseif table.array_contains(mod.ranged_lessers, breed_or_nil.name) then
				scoreboard:update_stat("ranged_lesser_damaged", account_id, actual_damage)
				scoreboard:update_stat("lesser_damaged", account_id, actual_damage)
			elseif table.array_contains(mod.melee_elites, breed_or_nil.name) then
				scoreboard:update_stat("melee_elite_damaged", account_id, actual_damage)
				scoreboard:update_stat("elite_damaged", account_id, actual_damage)
			elseif table.array_contains(mod.ranged_elites, breed_or_nil.name) then
				scoreboard:update_stat("ranged_elite_damaged", account_id, actual_damage)
				scoreboard:update_stat("elite_damaged", account_id, actual_damage)
			elseif table.array_contains(mod.specials, breed_or_nil.name) then
				scoreboard:update_stat("special_damaged", account_id, actual_damage)
				scoreboard:update_stat("special_disabler_damaged", account_id, actual_damage)
			elseif table.array_contains(mod.disablers, breed_or_nil.name) then
				scoreboard:update_stat("disabler_damaged", account_id, actual_damage)
				scoreboard:update_stat("special_disabler_damaged", account_id, actual_damage)
			end
		end
	end
	return func(self, damage_profile, attacked_unit, attacking_unit, attack_direction, hit_world_position, hit_weakspot, damage, attack_result, attack_type, damage_efficiency, ...)
end)

scoreboard.update_row_value_force = function(self, row_name, account_id, value)
	-- Normalize value
	local value = value and math.max(0, value) or 0
	-- Get row
	local row = self:get_scoreboard_row(row_name)
	if row then
		row.data = row.data or {}
		-- Update row
		local validation = row.validation
		row.data[account_id] = {
			value = value,
			score = value,
		}
	end
end

mod.get_value = function(self, row_name, account_id)
	local character_data = scoreboard:get_scoreboard_row(row_name).data[account_id]
	return character_data and character_data.score or 0
end

mod.scoreboard_rows = {
	{
		name = "melee_data",
		text = "row_melee_data",
		validation = "ASC",
		iteration = "ADD",
		summary = {
			"melee_killed",
			"melee_damaged",
		},
		group = "offense",
		setting = "plugin_melee_data",
	},
	{
		name = "melee_killed",
		text = "row_melee_killed",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "melee_data",
		setting = "plugin_melee_data",
	},
	{
		name = "melee_damaged",
		text = "row_melee_damaged",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "melee_data",
		setting = "plugin_melee_data",
	},
	{
		name = "ranged_data",
		text = "row_ranged_data",
		validation = "ASC",
		iteration = "ADD",
		summary = {
			"ranged_killed",
			"ranged_damaged",
		},
		group = "offense",
		setting = "plugin_ranged_data",
	},
	{
		name = "ranged_killed",
		text = "row_ranged_killed",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "ranged_data",
		setting = "plugin_ranged_data",
	},
	{
		name = "ranged_damaged",
		text = "row_ranged_damaged",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "ranged_data",
		setting = "plugin_ranged_data",
	},
	{
		name = "melee_data_special",
		text = "row_melee_data_special",
		validation = "ASC",
		iteration = "ADD",
		summary = {
			"melee_weakspot_rate",
			"melee_critical_rate",
		},
		group = "offense",
		setting = "plugin_melee_data_special",
	},
	{
		name = "melee_weakspot_rate",
		text = "row_melee_weakspot_rate",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "melee_data_special",
		setting = "plugin_melee_data_special",
	},
	{
		name = "melee_critical_rate",
		text = "row_melee_critical_rate",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "melee_data_special",
		setting = "plugin_melee_data_special",
	},
	{
		name = "melee_hit",
		text = "row_melee_hit",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		visible = false,
		setting = "plugin_melee_data_special",
	},
	{
		name = "melee_weakspot_hit",
		text = "row_melee_weakspot_hit",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		visible = false,
		setting = "plugin_melee_data_special",
	},
	{
		name = "melee_critical_hit",
		text = "row_melee_critical_hit",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		visible = false,
		setting = "plugin_melee_data_special",
	},
	{
		name = "ranged_data_special",
		text = "row_ranged_data_special",
		validation = "ASC",
		iteration = "ADD",
		summary = {
			"ranged_weakspot_rate",
			"ranged_critical_rate",
		},
		group = "offense",
		setting = "plugin_ranged_data_special",
	},
	{
		name = "ranged_weakspot_rate",
		text = "row_ranged_weakspot_rate",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "ranged_data_special",
		setting = "plugin_ranged_data_special",
	},
	{
		name = "ranged_critical_rate",
		text = "row_ranged_critical_rate",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "ranged_data_special",
		setting = "plugin_ranged_data_special",
	},
	{
		name = "ranged_hit",
		text = "row_ranged_hit",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		visible = false,
		setting = "plugin_ranged_data_special",
	},
	{
		name = "ranged_weakspot_hit",
		text = "row_ranged_weakspot_hit",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		visible = false,
		setting = "plugin_ranged_data_special",
	},
	{
		name = "ranged_critical_hit",
		text = "row_ranged_critical_hit",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		visible = false,
		setting = "plugin_ranged_data_special",
	},
	{
		name = "lesser_data",
		text = "row_lesser_data",
		validation = "ASC",
		iteration = "ADD",
		summary = {
			"lesser_killed",
			"lesser_damaged",
		},
		group = "offense",
		setting = "plugin_enemy_data = 2",
	},
	{
		name = "lesser_killed",
		text = "row_lesser_killed",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "lesser_data",
		setting = "plugin_enemy_data = 2",
	},
	{
		name = "lesser_damaged",
		text = "row_lesser_damaged",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "lesser_data",
		setting = "plugin_enemy_data = 2",
	},
	{
		name = "elite_data",
		text = "row_elite_data",
		validation = "ASC",
		iteration = "ADD",
		summary = {
			"elite_killed",
			"elite_damaged",
		},
		group = "offense",
		setting = "plugin_enemy_data = 2",
	},
	{
		name = "elite_killed",
		text = "row_elite_killed",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "elite_data",
		setting = "plugin_enemy_data = 2",
	},
	{
		name = "elite_damaged",
		text = "row_elite_damaged",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "elite_data",
		setting = "plugin_enemy_data = 2",
	},
	{
		name = "special_disabler_data",
		text = "row_special_disabler_data",
		validation = "ASC",
		iteration = "ADD",
		summary = {
			"special_disabler_killed",
			"special_disabler_damaged",
		},
		group = "offense",
		setting = "plugin_enemy_data = 2",
	},
	{
		name = "special_disabler_killed",
		text = "row_special_disabler_killed",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "special_disabler_data",
		setting = "plugin_enemy_data = 2",
	},
	{
		name = "special_disabler_damaged",
		text = "row_special_disabler_damaged",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "special_disabler_data",
		setting = "plugin_enemy_data = 2",
	},
	{
		name = "melee_lesser_data",
		text = "row_melee_lesser_data",
		validation = "ASC",
		iteration = "ADD",
		summary = {
			"melee_lesser_killed",
			"melee_lesser_damaged",
		},
		group = "offense",
		setting = "plugin_enemy_data = 1",
	},
	{
		name = "melee_lesser_killed",
		text = "row_melee_lesser_killed",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "melee_lesser_data",
		setting = "plugin_enemy_data = 1",
	},
	{
		name = "melee_lesser_damaged",
		text = "row_melee_lesser_damaged",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "melee_lesser_data",
		setting = "plugin_enemy_data = 1",
	},
	{
		name = "ranged_lesser_data",
		text = "row_ranged_lesser_data",
		validation = "ASC",
		iteration = "ADD",
		summary = {
			"ranged_lesser_killed",
			"ranged_lesser_damaged",
		},
		group = "offense",
		setting = "plugin_enemy_data = 1",
	},
	{
		name = "ranged_lesser_killed",
		text = "row_ranged_lesser_killed",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "ranged_lesser_data",
		setting = "plugin_enemy_data = 1",
	},
	{
		name = "ranged_lesser_damaged",
		text = "row_ranged_lesser_damaged",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "ranged_lesser_data",
		setting = "plugin_enemy_data = 1",
	},
	{
		name = "melee_elite_data",
		text = "row_melee_elite_data",
		validation = "ASC",
		iteration = "ADD",
		summary = {
			"melee_elite_killed",
			"melee_elite_damaged",
		},
		group = "offense",
		setting = "plugin_enemy_data = 1",
	},
	{
		name = "melee_elite_killed",
		text = "row_melee_elite_killed",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "melee_elite_data",
		setting = "plugin_enemy_data = 1",
	},
	{
		name = "melee_elite_damaged",
		text = "row_melee_elite_damaged",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "melee_elite_data",
		setting = "plugin_enemy_data = 1",
	},
	{
		name = "ranged_elite_data",
		text = "row_ranged_elite_data",
		validation = "ASC",
		iteration = "ADD",
		summary = {
			"ranged_elite_killed",
			"ranged_elite_damaged",
		},
		group = "offense",
		setting = "plugin_enemy_data = 1",
	},
	{
		name = "ranged_elite_killed",
		text = "row_ranged_elite_killed",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "ranged_elite_data",
		setting = "plugin_enemy_data = 1",
	},
	{
		name = "ranged_elite_damaged",
		text = "row_ranged_elite_damaged",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "ranged_elite_data",
		setting = "plugin_enemy_data = 1",
	},
	{
		name = "special_data",
		text = "row_special_data",
		validation = "ASC",
		iteration = "ADD",
		summary = {
			"special_killed",
			"special_damaged",
		},
		group = "offense",
		setting = "plugin_enemy_data = 1",
	},
	{
		name = "special_killed",
		text = "row_special_killed",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "special_data",
		setting = "plugin_enemy_data = 1",
	},
	{
		name = "special_damaged",
		text = "row_special_damaged",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "special_data",
		setting = "plugin_enemy_data = 1",
	},
	{
		name = "disabler_data",
		text = "row_disabler_data",
		validation = "ASC",
		iteration = "ADD",
		summary = {
			"disabler_killed",
			"disabler_damaged",
		},
		group = "offense",
		setting = "plugin_enemy_data = 1",
	},
	{
		name = "disabler_killed",
		text = "row_disabler_killed",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "disabler_data",
		setting = "plugin_enemy_data = 1",
	},
	{
		name = "disabler_damaged",
		text = "row_disabler_damaged",
		validation = "ASC",
		iteration = "ADD",
		group = "offense",
		parent = "disabler_data",
		setting = "plugin_enemy_data = 1",
	},
}
