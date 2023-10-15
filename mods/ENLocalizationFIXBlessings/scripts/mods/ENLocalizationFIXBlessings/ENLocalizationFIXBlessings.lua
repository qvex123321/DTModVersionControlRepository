local mod = get_mod("ENLocalizationFIXBlessings")
local WTL = get_mod("WhatTheLocalization")

mod.localization_templates = {
-- fixed by xsSplater
-- ==================================================PSYKER
-- =================================================="Devil's Claw" Sword
{	id = "trait_bespoke_fix_01", -- Skullcrusher -- hidden "to a maximum of 8 Stacks."
	loc_keys = {"loc_trait_bespoke_staggered_targets_receive_increased_damage_debuff_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Target receives {stacks:%s} Stacks of +{damage:%s} Damage if already Staggered, to a maximum of 8 Stacks. Lasts {time:%s} seconds." end},
{	id = "trait_bespoke_fix_02", -- Thunderstrike -- hidden "to a maximum of 8 Stacks."
	loc_keys = {"loc_trait_bespoke_staggered_targets_receive_increased_stagger_debuff_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Target receives {stacks:%s} Stacks of +{impact:%s} Impact if already Staggered, to a maximum of 8 Stacks. Lasts {time:%s} seconds." end},
{	id = "trait_bespoke_fix_03", -- Wrath -- hidden "for 3.5 seconds"
	loc_keys = {"loc_trait_bespoke_chained_hits_increases_cleave_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{cleave:%s} Cleave on Hit for 3.5 seconds. Stacks {stacks:%s} times." end},
{	id = "trait_bespoke_fix_04", -- Hammerblow -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_stacking_increase_impact_on_hit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{impact:%s} Impact for {time:%s} seconds on Hit. Stacks {stacks:%s} times." end},
{	id = "trait_bespoke_fix_05", -- Shred -- hidden "for 3.5 seconds"
	loc_keys = {"loc_trait_bespoke_chained_hits_increases_crit_chance_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{crit_chance:%s} Bonus Critical Chance on Chained Hit for 3.5 seconds. Stacks {stacks:%s} times." end},
-- ==================================================Blaze Force Sword
{	id = "trait_bespoke_fix_06", -- Riposte -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_dodge_grants_crit_chance_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return " +{crit_chance:%s} Critical Chance for {time:%s} seconds on successful Dodge." end},
{	id = "trait_bespoke_fix_06", -- Precognition -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_dodge_grants_finesse_bonus_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{damage:%s} Finesse Damage for {time:%s} seconds on successful Dodge." end},
{	id = "trait_bespoke_fix_06", -- Uncanny Strike -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_stacking_rending_on_weakspot_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{rending:%s} Rending on Enemy Weak Spot Hit for {time:%s} seconds. Stacks {stacks:%s} times." end},
{	id = "trait_bespoke_fix_07", -- Slaughterer -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_increase_power_on_kill_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{power_level:%s} Power for {time:%s} seconds on Kill. Stacks {stacks:%s} times." end},
{	id = "trait_bespoke_fix_08", -- Blazing Spirit -- "Stack(s)" -> "Stacks"
	loc_keys = {"loc_trait_bespoke_warp_burninating_on_crit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Enemy gains +{stacks:%s} Stacks of Soulblaze on Critical Hit, to a maximum of {max_stacks:%s} Stacks." end},
{	id = "trait_bespoke_fix_09", -- Superiority -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_elite_kills_grants_stackable_power_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{power_level:%s} Power for {time:%s} seconds on Elite Kill. Stacks {stacks:%s} times, deteriorating one at a time." end},
-- ==================================================Assault Chainsword
{	id = "trait_bespoke_fix_10", -- Rev it up -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_movement_speed_on_activation_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{movement_speed:%s} Movement Speed for {time:%s} seconds on Weapon Special Activation." end},
-- ==================================================Tactical Axe
{	id = "trait_bespoke_fix_11", -- Headtaker -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_increase_power_on_hit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{power_level:%s} Power for {time:%s} seconds on Hit. Stacks {stacks:%s} times." end},
-- ==================================================Combat Axe
{	id = "trait_bespoke_fix_12", -- Thunderous -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_targets_receive_rending_debuff_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Target receives {stacks:%s} Stacks of {rending:%s} Brittleness on Hit. Lasts {time:%s} seconds." end},
{	id = "trait_bespoke_fix_13", -- Decapitator -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_stacking_rending_on_one_hit_kills_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{finesse:%s} Finesse for {time:%s} seconds on Enemy One-Shot. Stacks {stacks:%s} times." end},
-- ==================================================Combat Blade
{	id = "trait_bespoke_fix_14", -- Smackdown -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_increased_crit_chance_after_punching_staggered_enemy_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{crit_chance:%s} Critical Chance for {time:%s} seconds on Special Action Hit (Staggered Enemy)." end},
-- ==================================================Force Staff - Surge
{	id = "trait_bespoke_fix_15", -- Terrifying Barrage -- "m" -> "meters" ({range:%s}=5m)
	loc_keys = {"loc_trait_bespoke_suppression_on_close_kill_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Suppress Enemies within {range:%s}eters Radius on Close Range Kill." end},
-- ==================================================Force Staff - Trauma
{	id = "trait_bespoke_fix_16", -- Rending Shockwave -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_rend_armor_on_aoe_charge_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Target receives up to {stacks:%s} Stacks of {rending:%s} Brittleness, scaling with charge time of Secondary Attack. Lasts {time:%s} seconds." end},
-- ==================================================Headhunter Autogun
{	id = "trait_bespoke_fix_16", -- Ghost -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_count_as_dodge_vs_ranged_on_weakspot_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Immune to Ranged Attacks for {time:%s} seconds on Weak Spot Hit." end},
{	id = "trait_bespoke_fix_16", -- Surgical -- "second" -> "seconds"
	loc_keys = {"loc_trait_bespoke_crit_chance_based_on_aim_time_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{crit_chance:%s} Critical Chance for every {time:%s} seconds while aiming. Stacks {stacks:%s} times. Discharges all stacks upon firing." end},
{	id = "trait_bespoke_fix_16", -- Between the Eyes -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_suppression_negation_on_weakspot_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Gain Suppression Immunity for {time:%s} seconds on Weak Spot Hit." end},
-- ==================================================Infantry Autogun
{	id = "trait_bespoke_fix_16", -- Fire Frenzy -- "<unlocalised..." fix and "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_increase_close_damage_on_close_kill_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Gain +{attack_speed:%s} Attack Speed for {time:%s} seconds after Killing an Enemy at close range. Stacks 5 times." end},
{	id = "trait_bespoke_fix_16", -- Deathspitter -- hidden "Stacks 5 times." and "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_increase_power_on_close_kill_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{power_level:%s} Power for {time:%s} seconds on Close Range Kill. Stacks 5 times." end},
{	id = "trait_bespoke_fix_16", -- Hit & Run -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_count_as_dodge_vs_ranged_on_close_kill_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Immune to Ranged Attacks for {time:%s} seconds on Close Range Kill." end},
{	id = "trait_bespoke_fix_16", -- Dumdum -- "Close Range" -> "ALL Range!"
	loc_keys = {"loc_trait_bespoke_consecutive_hits_increases_close_damage_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{damage:%s} damage on Repeated Hit. Stacks {stacks:%s} times." end},
-- ==================================================Infantry Lasgun
{	id = "trait_bespoke_fix_16", -- Efficiency -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_first_shot_ammo_cost_reduction_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{ammo:%s} Reduced Ammo use after not shooting for {time:%s} seconds." end},
{	id = "trait_bespoke_fix_16", -- Infernus -- "Stack(s)" -> "Stacks"
	loc_keys = {"loc_trait_bespoke_burninating_on_crit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{stacks:%s} Burn Stacks on Critical Hit to a maximum of {max_stacks:%s} Stacks." end},

-- ==================================================ZEALOT
-- ==================================================Thunder Hammer
{	id = "trait_bespoke_fix_16", -- Shock & Awe -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_hit_mass_consumption_reduction_on_kill_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "-{hit_mass:%s} Enemy Hit Mass for {time:%s} seconds on Kill." end},
-- ==================================================Combat Shotgun
{	id = "trait_bespoke_fix_16", -- Full Bore -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_power_bonus_on_hitting_single_enemy_with_all_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{power_level:%s} Power for {time:%s} seconds when every bullet in a shot hits the same enemy." end},
-- ==================================================Purgation Flamer
{	id = "trait_bespoke_fix_16", -- Showstopper -- "%%" -> "%"
	loc_keys = {"loc_trait_bespoke_chance_to_explode_elites_on_kill_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{proc_chance:%s} chance Elite and Special enemies Explode on Kill." end},
{	id = "trait_bespoke_fix_16", -- Inspiring Barrage -- "<unlocalised..." fix {ammo:%s}
	loc_keys = {"loc_trait_bespoke_toughness_on_continuous_fire_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{toughness:%s} Toughness for every 10% of magazine spent during continuous fire. Stacks {stacks:%s} times." end},
-- ==================================================Spearhead Boldgun
{	id = "trait_bespoke_fix_16", -- Shattering Impact -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_armor_rend_on_projectile_hit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Target receives {stacks:%s} Stacks of {rending:%s} Brittleness on direct projectile hit. Lasts {time:%s} seconds." end},

-- ==================================================VETERAN
-- ==================================================Plasma Gun
{	id = "trait_bespoke_fix_16", -- Volatile -- "%Charge" -> "% Charge"
	loc_keys = {"loc_trait_bespoke_lower_overheat_gives_faster_charge_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{charge_speed:%s} Charge Speed on low Overheat. Stacks up to {stacks:%s} times." end},

-- ==================================================OGRYN
-- ==================================================Cleaver
{	id = "trait_bespoke_fix_16", -- Bash -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_crit_chance_on_push_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{crit_chance:%s} Critical Chance for {time:%s} seconds on Pushing Enemies." end},
-- ==================================================Twin-Linked Heavy Stubber
{	id = "trait_bespoke_fix_16", -- Overwhelming Fire -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_power_bonus_on_chained_hits_on_single_target_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{power:%s} Power for every {hit:%s} Single Target Hits. Lasts {time:%s} seconds and Stacks {stacks:%s} times." end},
-- ==================================================Ripper Gun
{	id = "trait_bespoke_fix_16", -- Can opener -- "s" -> "seconds"
	loc_keys = {"loc_trait_bespoke_armor_rending_bayonette_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Target receives {stacks:%s} stacks of {rending:%s} Brittleness on weapon special hit. Lasts {time:%s} seconds." end},
-- ==================================================Kickback
{	id = "trait_bespoke_fix_16", -- Expansive -- "+30%Melee Power for  3.5s" -> "+30% Melee Power for 3.5 seconds"
	loc_keys = {"loc_trait_bespoke_weapon_special_power_bonus_after_one_shots_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "+{power_level:%s} Melee Power for {time:%s} seconds on Hitting 3+ Enemies with a Ranged Attack." end},

-- FOR TESTS ONLY!!!
{id = "weap_testum00",
loc_keys = {
"",},
locales = {"en",},
handle_func = function(locale, value)
return string.gsub(value, ":", "!!!")
end,},
}


function mod.on_enabled()
	if WTL then
		WTL.reload_templates()
	end
end
function mod.on_disabled()
	if WTL then
		WTL.reload_templates()
	end
end
