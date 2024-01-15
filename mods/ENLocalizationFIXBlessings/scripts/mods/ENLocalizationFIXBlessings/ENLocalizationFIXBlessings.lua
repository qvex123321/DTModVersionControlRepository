local mod = get_mod("ENLocalizationFIXBlessings")
local WTL = get_mod("WhatTheLocalization")
local InputUtils = require("scripts/managers/input/input_utils")

--[[ Thanks to Ovenproof! Moving the Use button.
	--self._widgets_by_name.equip_button.offset[1] = -622 ]]
-- mod:hook_safe(CLASS.InventoryWeaponsView, "on_enter", function (self)
	-- self._widgets_by_name.equip_button.offset = {-622,20,0}
-- end)

--[[ Thanks to Fracticality!
local InputUtils = require("scripts/managers/input/input_utils")
local color_name = mod:get("damage_text_colour")
local color = Color[color_name](255, true)
local damage_text = InputUtils.apply_color_to_input_text("Damage", color) ]]

-- BLEED
local bleed_color = Color[mod:get("bleed_text_colour")](255, true)
local bleed_color_rgb = InputUtils.apply_color_to_input_text("Bleed", bleed_color)

-- BRITTLENESS
local brittleness_color = Color[mod:get("brittleness_text_colour")](255, true)
local brittleness_color_rgb = InputUtils.apply_color_to_input_text("Brittleness", brittleness_color)

-- BURN
local burn_color = Color[mod:get("burn_text_colour")](255, true)
local burn_color_rgb = InputUtils.apply_color_to_input_text("Burning", burn_color)

-- CLEAVE
local cleave_color = Color[mod:get("cleave_text_colour")](255, true)
local cleave_color_rgb = InputUtils.apply_color_to_input_text("Cleave", cleave_color)

-- CRIT CHANCE/HIT/DAMAGE
local crit_color = Color[mod:get("crit_text_colour")](255, true)
local crit_chance_color_rgb = InputUtils.apply_color_to_input_text("Critical Chance", crit_color)
local crit_hit_color_rgb = InputUtils.apply_color_to_input_text("Critical Hit", crit_color)
local crit_hits_color_rgb = InputUtils.apply_color_to_input_text("Critical Hits", crit_color)
local crit_color_rgb = InputUtils.apply_color_to_input_text("Critical", crit_color)

-- DAMAGE
local damage_color = Color[mod:get("damage_text_colour")](255, true)
local damage_color_rgb = InputUtils.apply_color_to_input_text("Damage", damage_color)

-- FINESSE
local finesse_color = Color[mod:get("finesse_text_colour")](255, true)
local finesse_color_rgb = InputUtils.apply_color_to_input_text("Finesse", finesse_color)

-- HIT MASS
local hit_mass_color = Color[mod:get("hit_mass_text_colour")](255, true)
local hit_mass_color_rgb = InputUtils.apply_color_to_input_text("Hit Mass", hit_mass_color)

-- IMPACT
local impact_color = Color[mod:get("impact_text_colour")](255, true)
local impact_color_rgb = InputUtils.apply_color_to_input_text("Impact", impact_color)

-- PERIL
local peril_color = Color[mod:get("peril_text_colour")](255, true)
local peril_color_rgb = InputUtils.apply_color_to_input_text("Peril", peril_color)

-- POWER
local power_color = Color[mod:get("power_text_colour")](255, true)
local power_color_rgb = InputUtils.apply_color_to_input_text("Power", power_color)

-- RENDING
local rending_color = Color[mod:get("rending_text_colour")](255, true)
local rending_color_rgb = InputUtils.apply_color_to_input_text("Rending", rending_color)

-- SOULBLAZE
local soulblaze_color = Color[mod:get("soulblaze_text_colour")](255, true)
local soulblaze_color_rgb = InputUtils.apply_color_to_input_text("Soulblaze", soulblaze_color)

-- STAGGER
local stagger_color = Color[mod:get("stagger_text_colour")](255, true)
local stagger_color_rgb = InputUtils.apply_color_to_input_text("Stagger", stagger_color)
local stagger2_color_rgb = InputUtils.apply_color_to_input_text("Staggered", stagger_color)

-- STAMINA
local stamina_color = Color[mod:get("stamina_text_colour")](255, true)
local stamina_color_rgb = InputUtils.apply_color_to_input_text("Stamina", stamina_color)

-- TOUGHNESS
local toughness_color = Color[mod:get("toughness_text_colour")](255, true)
local toughness_color_rgb = InputUtils.apply_color_to_input_text("Toughness", toughness_color)

-- WEAK SPOT
local weakspot_color = Color[mod:get("weakspot_text_colour")](255, true)
local weakspot_color_rgb = InputUtils.apply_color_to_input_text("Weakspot", weakspot_color)
local weakspot2_color_rgb = InputUtils.apply_color_to_input_text("Weak Spot", weakspot_color)
local weakspot3_color_rgb = InputUtils.apply_color_to_input_text("Weak Spots", weakspot_color)
local weakspot4_color_rgb = InputUtils.apply_color_to_input_text("Weak Spot Damage", weakspot_color)


-- NOTE
local note_color = Color[mod:get("note_text_colour")](255, true)
local trauma_note_color_rgb = InputUtils.apply_color_to_input_text(" Doesn't work for secondary attacks of Trauma Staff.", note_color)
local finesse_note_color_rgb = InputUtils.apply_color_to_input_text(" Finesse increases Damage to Weak Spots and Damage from Critical Hits.", note_color)
local power_note_color_rgb = InputUtils.apply_color_to_input_text(" Power increases Damage, Impact and Cleave.", note_color)
local rending_note_color_rgb = InputUtils.apply_color_to_input_text(" Rending increases weapon Damage.", note_color)
local brittleness_note_color_rgb = InputUtils.apply_color_to_input_text(" Brittleness reduces enemy's Armor.", note_color)


mod.localization_templates = {
-- Fixes and overhauls by xsSplater
-- {	id = "some_id_here",
	-- loc_keys = {"loc_code_of_element",}, -- Enable Debug mode in WhatTheLocalization mod settings
	-- locales = {"en",}, -- de|en|es|fr|it|pl|ru|...
	-- handle_func = function(locale, value)
	-- return "Your variant of game String." end},

-- ==============================================================BLESSINGS OF WEAPONS

-- ==================================================PSYKER

-- ____________________________________________________Melee

-- ____________________________________________________"Devil's Claw" Sword
-- {	id = "trait_bespoke_0_ext_en", -- Trauma
	-- loc_keys = {"loc_trait_bespoke_consecutive_hits_increases_stagger",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Trauma" end},
{	id = "trait_bespoke_0_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_consecutive_hits_increases_stagger_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{impact:%s}{#reset()} " .. impact_color_rgb .. " for {#color(255, 255, 140)}{time:%s}{#reset()} seconds on Repeated Hit. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." end}, -- colors
-- {	id = "trait_bespoke_1_ext_en", -- Savage Sweep
	-- loc_keys = {"loc_trait_bespoke_increased_attack_cleave_on_multiple_hits",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Savage Sweep" end},
{	id = "trait_bespoke_1_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_increased_attack_cleave_on_multiple_hits_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Hitting at least {#color(255, 255, 140)}{multiple_hit:%s}{#reset()} enemies with an attack, increases your " .. cleave_color_rgb .. " by {#color(255, 255, 140)}{cleave:%s}{#reset()} for {#color(255, 255, 140)}{time:%s}{#reset()} seconds." end}, -- colors
-- {	id = "trait_bespoke_2_ext_en", -- Skullcrusher
	-- loc_keys = {"loc_trait_bespoke_staggered_targets_receive_increased_damage_debuff",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Skullcrusher" end},
	{	id = "trait_bespoke_2_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_staggered_targets_receive_increased_damage_debuff_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Target receives {#color(255, 255, 140)}{stacks:%s}{#reset()} Stacks of {#color(255, 255, 140)}+{damage:%s}{#reset()} " .. damage_color_rgb .. " if already " .. stagger2_color_rgb .. ", to a maximum of {#color(255, 155, 55)}8{#reset()} Stacks. Lasts {#color(255, 255, 140)}{time:%s}{#reset()} seconds." end}, -- colors Note! -- hidden "to a maximum of 8 Stacks." -- colors
-- {	id = "trait_bespoke_3_ext_en", -- Thunderstrike
	-- loc_keys = {"loc_trait_bespoke_staggered_targets_receive_increased_stagger_debuff",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Thunderstrike" end},
{	id = "trait_bespoke_3_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_staggered_targets_receive_increased_stagger_debuff_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Target receives {#color(255, 255, 140)}{stacks:%s}{#reset()} Stacks of {#color(255, 255, 140)}+{impact:%s}{#reset()} " .. impact_color_rgb .. " if already " .. stagger2_color_rgb .. ", to a maximum of {#color(255, 155, 55)}8{#reset()} Stacks. Lasts {#color(255, 255, 140)}{time:%s}{#reset()} seconds." end}, -- colors Note! -- hidden "to a maximum of 8 Stacks."
-- {	id = "trait_bespoke_4_ext_en", -- Rampage
	-- loc_keys = {"loc_trait_bespoke_staggered_targets_receive_increased_stagger_debuff",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Rampage" end},
{	id = "trait_bespoke_4_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_increased_melee_damage_on_multiple_hits_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Hitting at least {#color(255, 255, 140)}{multiple_hit:%s}{#reset()} enemies with an attack, increases your " .. power_color_rgb .. " by {#color(255, 255, 140)}{damage:%s}{#reset()} for {#color(255, 255, 140)}{time:%s}{#reset()} seconds." .. power_note_color_rgb end}, -- colors -- DAMAGE -> POWER!!!
-- {	id = "trait_bespoke_5_ext_en", -- Wrath
	-- loc_keys = {"loc_trait_bespoke_chained_hits_increases_cleave",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Wrath" end},
{	id = "trait_bespoke_5_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_chained_hits_increases_cleave_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{cleave:%s}{#reset()} " .. cleave_color_rgb .. " on Hit for {#color(255, 155, 55)}3.5{#reset()} seconds. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." end}, -- colors Note! -- hidden "for 3.5 seconds"
-- {	id = "trait_bespoke_6_ext_en", -- Hammerblow
	-- loc_keys = {"loc_trait_bespoke_stacking_increase_impact_on_hit",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Hammerblow" end},
{	id = "trait_bespoke_6_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_stacking_increase_impact_on_hit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{impact:%s}{#reset()} " .. impact_color_rgb .. " for  {#color(255, 155, 55)}3.5{#reset()} seconds on Hit. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." end}, -- colors s->seconds -- {time:%s}=1.5
-- {	id = "trait_bespoke_7_ext_en", -- Devastating Strike
	-- loc_keys = {"loc_trait_bespoke_infinite_melee_cleave_on_crit",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Devastating Strike" end},
{	id = "trait_bespoke_7_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_infinite_melee_cleave_on_crit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{hit_mass:%s}{#reset()} " .. cleave_color_rgb .. " for {#color(255, 255, 140)}{time:%s}{#reset()} seconds on " .. crit_hit_color_rgb .. "." end}, -- colors
-- {	id = "trait_bespoke_8_ext_en", -- Shred
	-- loc_keys = {"loc_trait_bespoke_chained_hits_increases_crit_chance",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Shred" end},
{	id = "trait_bespoke_8_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_chained_hits_increases_crit_chance_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{crit_chance:%s}{#reset()} Bonus " .. crit_chance_color_rgb .. " on Chained Hit for {#color(255, 155, 55)}3.5{#reset()} seconds. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." end}, -- colors Note! -- hidden "for 3.5 seconds"
-- {	id = "trait_bespoke_9_ext_en", -- Vicious Slice
	-- loc_keys = {"loc_trait_bespoke_increase_stagger_per_hit_in_sweep",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Vicious Slice" end},
{	id = "trait_bespoke_9_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_increase_stagger_per_hit_in_sweep_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Each target in a sweep receives {#color(255, 255, 140)}{impact:%s}{#reset()} more " .. impact_color_rgb .. ", times the number of previous hits in the sweep." end}, -- colors

-- ____________________________________________________Blaze Force Sword
-- {	id = "trait_bespoke_10_ext_en", -- Exorcist
	-- loc_keys = {"loc_trait_bespoke_chained_weakspot_hits_vents_warpcharge",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Exorcist" end},
{	id = "trait_bespoke_10_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_chained_weakspot_hits_vents_warpcharge_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Quell {#color(255, 255, 140)}{warp_charge:%s}{#reset()} of " .. peril_color_rgb .. " on Repeated " .. weakspot2_color_rgb .. " Hit." end}, -- colors
-- {	id = "trait_bespoke_11_ext_en", -- Riposte
	-- loc_keys = {"loc_trait_bespoke_dodge_grants_crit_chance",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Riposte" end},
{	id = "trait_bespoke_11_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_dodge_grants_crit_chance_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{crit_chance:%s}{#reset()} " .. crit_chance_color_rgb .. " for {#color(255, 255, 140)}{time:%s}{#reset()} seconds on successful Dodge." end}, -- colors s->seconds
-- {	id = "trait_bespoke_12_ext_en", -- Precognition
	-- loc_keys = {"loc_trait_bespoke_dodge_grants_finesse_bonus",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Precognition" end},
{	id = "trait_bespoke_12_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_dodge_grants_finesse_bonus_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{damage:%s}{#reset()} " .. finesse_color_rgb .. " " .. damage_color_rgb .. " for {#color(255, 255, 140)}{time:%s}{#reset()} seconds on successful Dodge." .. finesse_note_color_rgb end}, -- colors s->seconds Note!
-- {	id = "trait_bespoke_13_ext_en", -- Deflector
	-- loc_keys = {"loc_trait_bespoke_can_block_ranged",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Deflector" end},
{	id = "trait_bespoke_13_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_can_block_ranged_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "This weapon Blocks both Melee and Ranged attacks. Additionally, Block Cost is reduced by {#color(255, 255, 140)}{block_cost:%s}{#reset()}." end}, -- colors
-- {	id = "trait_bespoke_14_ext_en", -- Uncanny Strike
	-- loc_keys = {"loc_trait_bespoke_stacking_rending_on_weakspot",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Uncanny Strike" end},
{	id = "trait_bespoke_14_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_stacking_rending_on_weakspot_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{rending:%s}{#reset()} " .. rending_color_rgb .. " on Enemy " .. weakspot2_color_rgb .. " Hit for {#color(255, 255, 140)}{time:%s}{#reset()} seconds. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." .. rending_note_color_rgb end}, -- colors s->seconds
-- {	id = "trait_bespoke_15_ext_en", -- Executor
	-- loc_keys = {"loc_trait_bespoke_chained_weakspot_hits_increases_power",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Executor" end},
{	id = "trait_bespoke_15_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_chained_weakspot_hits_increases_power_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{power_level:%s}{#reset()} " .. power_color_rgb .. " Level on Repeated " .. weakspot2_color_rgb .. " Hit. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." .. power_note_color_rgb end}, -- colors
-- {	id = "trait_bespoke_16_ext_en", -- Slaughterer
	-- loc_keys = {"loc_trait_bespoke_increase_power_on_kill",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Slaughterer" end},
{	id = "trait_bespoke_16_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_increase_power_on_kill_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{power_level:%s}{#reset()} " .. power_color_rgb .. " for {#color(255, 255, 140)}{time:%s}{#reset()} seconds on Kill. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." .. power_note_color_rgb end}, -- colors s->seconds
-- {	id = "trait_bespoke_17__ext_en", -- Unstable Power
	-- loc_keys = {"loc_trait_bespoke_warp_charge_power_bonus",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Unstable Power" end},
{	id = "trait_bespoke_17_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_warp_charge_power_bonus_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Up to {#color(255, 255, 140)}+{power_level:%s}{#reset()} " .. power_color_rgb .. ", with increasing " .. peril_color_rgb .. " Level. Stacks {#color(255, 155, 55)}4{#reset()} times." end}, -- colors Note!
-- {	id = "trait_bespoke_18_ext_en", -- Blazing Spirit
	-- loc_keys = {"loc_trait_bespoke_warp_burninating_on_crit",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Blazing Spirit" end},
{	id = "trait_bespoke_18_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_warp_burninating_on_crit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Enemy gains {#color(255, 255, 140)}{stacks:%s}{#reset()} Stacks of " .. soulblaze_color_rgb .. " on " .. crit_hit_color_rgb .. ", to a maximum of {#color(255, 255, 140)}{max_stacks:%s}{#reset()} Stacks." end}, -- colors ()
-- {	id = "trait_bespoke_19_ext_en", -- Superiority
	-- loc_keys = {"loc_trait_bespoke_elite_kills_grants_stackable_power",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Superiority" end},
{	id = "trait_bespoke_19_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_elite_kills_grants_stackable_power_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Up to {#color(255, 255, 140)}{stacks:%s}{#reset()} stacks of {#color(255, 255, 140)}+{power_level:%s}{#reset()} " .. power_color_rgb .. " for {#color(255, 255, 140)}{time:%s}{#reset()} seconds on Elite Kill. Stacks deteriorating one at a time." .. power_note_color_rgb end}, -- colors s->seconds
-- {	id = "trait_bespoke_20_ext_en", -- Bloodthirsty
	-- loc_keys = {"loc_trait_bespoke_guaranteed_melee_crit_on_activated_kill",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Bloodthirsty" end},
{	id = "trait_bespoke_20_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_guaranteed_melee_crit_on_activated_kill_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{crit_chance:%s}{#reset()} " .. crit_chance_color_rgb .. " on your next Melee Attack after Special Attack Kill." end}, -- colors

-- ____________________________________________________Assault Chainsword
-- {	id = "trait_bespoke_21_ext_en", -- Bloodletter
	-- loc_keys = {"loc_trait_bespoke_bleed_on_activated_hit",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Bloodletter" end},
{	id = "trait_bespoke_21_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_bleed_on_activated_hit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{stacks:%s}{#reset()} " .. bleed_color_rgb .. " Stacks from Special Attacks. Up to {#color(255, 155, 55)}16{#reset()} Stacks." end}, -- colors
-- {	id = "trait_bespoke_22_ext_en", -- Rev it up
	-- loc_keys = {"loc_trait_bespoke_movement_speed_on_activation",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Rev it up" end},
{	id = "trait_bespoke_22_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_movement_speed_on_activation_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{movement_speed:%s}{#reset()} Movement Speed for {#color(255, 255, 140)}{time:%s}{#reset()} seconds on Weapon Special Activation." end}, -- colors s->seconds

-- ____________________________________________________Tactical Axe
-- {	id = "trait_bespoke_23_ext_en", -- Brutal Momentum
	-- loc_keys = {"loc_trait_bespoke_infinite_cleave_on_weakspot_kill",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Brutal Momentum" end},
{	id = "trait_bespoke_23_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_infinite_cleave_on_weakspot_kill_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{weakspot_damage:%s}{#reset()} " .. weakspot4_color_rgb .. ". " .. weakspot_color_rgb .. " Kills also ignore Enemy " .. hit_mass_color_rgb .. " and thereby receives infinite " .. cleave_color_rgb .. "." end}, -- colors
-- {	id = "trait_bespoke_24__ext_en", -- Limbsplitter
	-- loc_keys = {"loc_trait_bespoke_power_bonus_on_first_attack",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Limbsplitter" end},
{	id = "trait_bespoke_24_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_power_bonus_on_first_attack_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{power_level:%s}{#reset()} " .. power_color_rgb .. " on your First Attack every {#color(255, 255, 140)}{cooldown:%s}{#reset()} seconds." .. power_note_color_rgb end}, -- colors
-- {	id = "trait_bespoke_25_ext_en", -- All or Nothing
	-- loc_keys = {"loc_trait_bespoke_power_bonus_scaled_on_stamina",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "All or Nothing" end},
{	id = "trait_bespoke_25_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_power_bonus_scaled_on_stamina_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "When your " .. stamina_color_rgb .. " is reduced by {#color(255, 155, 55)}20%{#reset()}, you gain a Stack of " .. power_color_rgb .. ", up to {#color(255, 155, 55)}5{#reset()} Stacks, which add up to {#color(255, 255, 140)}+{power_level:%s}{#reset()} " .. power_color_rgb .. "." .. power_note_color_rgb end}, -- colors Note!
-- {	id = "trait_bespoke_26_ext_en", -- Headtaker
	-- loc_keys = {"loc_trait_bespoke_increase_power_on_hit",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Headtaker" end},
{	id = "trait_bespoke_26_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_increase_power_on_hit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{power_level:%s}{#reset()} " .. power_color_rgb .. " for {#color(255, 255, 140)}{time:%s}{#reset()} seconds on Hit. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." .. power_note_color_rgb end}, -- colors
-- {	id = "trait_bespoke_27_ext_en", -- Decimator
	-- loc_keys = {"loc_trait_bespoke_chained_hits_increases_power",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Decimator" end},
{	id = "trait_bespoke_27_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_chained_hits_increases_power_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Continuously chaining more than {#color(255, 255, 140)}2{#reset()} attacks gives {#color(255, 255, 140)}+{power_level:%s}{#reset()} " .. power_color_rgb .. ". Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." .. power_note_color_rgb end}, -- colors

-- ____________________________________________________Combat Axe
-- {	id = "trait_bespoke_28_ext_en", -- Thrust
	-- loc_keys = {"loc_trait_bespoke_power_bonus_based_on_charge_time",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Thrust" end},
{	id = "trait_bespoke_28_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_power_bonus_based_on_charge_time_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Up to {#color(255, 255, 140)}+{power_level:%s}{#reset()} " .. power_color_rgb .. " based on the charge time of your heavy attacks. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." .. power_note_color_rgb end}, -- colors
-- {	id = "trait_bespoke_29_ext_en", -- Thunderous
	-- loc_keys = {"loc_trait_bespoke_targets_receive_rending_debuff",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Thunderous" end},
{	id = "trait_bespoke_29_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_targets_receive_rending_debuff_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Target receives {#color(255, 255, 140)}{stacks:%s}{#reset()} Stacks of {#color(255, 255, 140)}2.{rending:%s}{#reset()} " .. brittleness_color_rgb .. " on Hit. Lasts {#color(255, 255, 140)}{time:%s}{#reset()} seconds. Up to {#color(255, 155, 55)}40%{#reset()}." .. brittleness_note_color_rgb end}, -- colors s->seconds
-- {	id = "trait_bespoke_30_ext_en", -- Decapitator
	-- loc_keys = {"loc_trait_bespoke_stacking_rending_on_one_hit_kills",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Decapitator" end},
{	id = "trait_bespoke_30_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_stacking_rending_on_one_hit_kills_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{finesse:%s}{#reset()} " .. finesse_color_rgb .. " for {#color(255, 255, 140)}{time:%s}{#reset()} seconds on Enemy One-Shot. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." .. finesse_note_color_rgb end}, -- colors s->seconds Note!

-- ____________________________________________________Combat Blade
-- {	id = "trait_bespoke_31_ext_en", -- Smackdown
	-- loc_keys = {"loc_trait_bespoke_increased_crit_chance_after_punching_staggered_enemy",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Smackdown" end},
{	id = "trait_bespoke_31_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_increased_crit_chance_after_punching_staggered_enemy_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{crit_chance:%s}{#reset()} " .. crit_chance_color_rgb .. " for {#color(255, 255, 140)}{time:%s}{#reset()} seconds on Special Action Hit to " .. stagger2_color_rgb .. " Enemy." end}, -- colors s->seconds ()->for
-- {	id = "trait_bespoke_32_ext_en", -- Flesh Tearer
	-- loc_keys = {"loc_trait_bespoke_bleed_on_crit_melee",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Flesh Tearer" end},
{	id = "trait_bespoke_32_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_bleed_on_crit_melee_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{stacks:%s}{#reset()} " .. bleed_color_rgb .. " Stacks on " .. crit_hit_color_rgb .. ". Up to  {#color(255, 155, 55)}16{#reset()} Stacks." end}, -- colors
-- {	id = "trait_bespoke_33_ext_en", -- Lacerate
	-- loc_keys = {"loc_trait_bespoke_bleed_on_non_weakspot_hit",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Lacerate" end},
{	id = "trait_bespoke_33_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_bleed_on_non_weakspot_hit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{stacks:%s}{#reset()} " .. bleed_color_rgb .. " Stacks on non-" .. weakspot2_color_rgb .. " Hits. Up to {#color(255, 155, 55)}16{#reset()} Stacks." end}, -- colors
-- {	id = "trait_bespoke_34_ext_en", -- Ruthless Backstab
	-- loc_keys = {"loc_trait_bespoke_rending_on_backstabs",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Ruthless Backstab" end},
{	id = "trait_bespoke_34_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_rending_on_backstabs_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{rending:%s}{#reset()} " .. rending_color_rgb .. " on Backstab Hit." .. rending_note_color_rgb end}, -- colors
-- {	id = "trait_bespoke_35_ext_en", -- Mercy Killer
	-- loc_keys = {"loc_trait_bespoke_increased_weakspot_damage_on_bleeding",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Mercy Killer" end},
{	id = "trait_bespoke_35_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_increased_weakspot_damage_on_bleeding_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{damage:%s}{#reset()} " .. weakspot4_color_rgb .. " to Enemies with " .. bleed_color_rgb .. " Stacks." end}, -- colors
-- {	id = "trait_bespoke_36_ext_en", -- Haymaker
	-- loc_keys = {"loc_trait_bespoke_heavy_chained_hits_increases_killing_blow_chance",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Haymaker" end},
{	id = "trait_bespoke_36_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_heavy_chained_hits_increases_killing_blow_chance_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{proc_chance:%s}{#reset()} to Instakill human-sized enemies on Chained Heavy Hit. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." end}, -- colors

-- ____________________________________________________Ranged

-- ____________________________________________________Force Staff - Surge
-- {	id = "trait_bespoke_37_ext_en", -- Warp Flurry
	-- loc_keys = {"loc_trait_bespoke_faster_charge_on_chained_secondary_attack",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Warp Flurry" end},
{	id = "trait_bespoke_37_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_faster_charge_on_chained_secondary_attacks_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}{charge_time:%s}{#reset()} Charge Time on Chained Secondary Attack. Stack {#color(255, 255, 140)}{stacks:%s}{#reset()} times." end}, -- colors
-- {	id = "trait_bespoke_38_ext_en", -- Terrifying Barrage
	-- loc_keys = {"loc_trait_bespoke_suppression_on_close_kill",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Terrifying Barrage" end},
{	id = "trait_bespoke_38_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_suppression_on_close_kill_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Suppress Enemies within {#color(255, 255, 140)}{range:%s}eters{#reset()} Radius on Close Range Kill." end}, -- colors 5m->5meters
-- {	id = "trait_bespoke_39_ext_en", -- Warp Nexus
	-- loc_keys = {"loc_trait_bespoke_increased_crit_chance_scaled_on_peril",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Warp Nexus" end},
{	id = "trait_bespoke_39_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_increased_crit_chance_scaled_on_peril_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Gain between {#color(255, 255, 140)}{crit_chance:%s}{#reset()} and {#color(255, 255, 140)}{crit_chance_max:%s}{#reset()} " .. crit_chance_color_rgb .. " based on current " .. peril_color_rgb .. " Level." end}, -- colors
-- {	id = "trait_bespoke_40_ext_en", -- Focused Channelling
	-- loc_keys = {"loc_trait_bespoke_uninterruptable_while_charging",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Focused Channelling" end},
-- {	id = "trait_bespoke_40_desc_ext_en",
	-- loc_keys = {"loc_trait_bespoke_uninterruptable_while_charging_desc",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Your Secondary Attack cannot be interrupted." end},
-- {	id = "trait_bespoke_41_ext_en", -- Run 'n' Gun
	-- loc_keys = {"loc_trait_bespoke_allow_hipfire_while_sprinting",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Run 'n' Gun" end},
-- {	id = "trait_bespoke_41_desc_ext_en",
	-- loc_keys = {"loc_trait_bespoke_allow_hipfire_while_sprinting_desc",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "You can Hipfire with this weapon while Sprinting." end},

-- ____________________________________________________Force Staff - Trauma
-- {	id = "trait_bespoke_42_ext_en", -- Rending Shockwave
	-- loc_keys = {"loc_trait_bespoke_rend_armor_on_aoe_charge",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Rending Shockwave" end},
{	id = "trait_bespoke_42_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_rend_armor_on_aoe_charge_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Target receives for {#color(255, 155, 55)}5{#reset()} seconds up to {#color(255, 255, 140)}{stacks:%s}{#reset()} Stacks {#color(255, 255, 140)}2.{rending:%s}{#reset()} " .. brittleness_color_rgb .. ", scaling with charge time of Secondary Attack. Up to {#color(255, 155, 55)}40%{#reset()}." .. brittleness_note_color_rgb end}, -- rewrite colors s->seconds Note!
-- {	id = "trait_bespoke_43_ext_en", -- Sustained Fire
	-- loc_keys = {"loc_trait_bespoke_followup_shots_ranged_damage",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Sustained Fire" end},
{	id = "trait_bespoke_43_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_followup_shots_ranged_damage_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{damage:%s}{#reset()} " .. damage_color_rgb .. " on Second, Third and Fourth shots in a Salvo." .. trauma_note_color_rgb end}, -- colors -- "on Third and Fourth shots" -> "on Second, Third and Fourth"
-- {	id = "trait_bespoke_44_ext_en", -- Transfer Peril
	-- loc_keys = {"loc_trait_bespoke_peril_vent_on_weak_spot_hit",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Transfer Peril" end},
{	id = "trait_bespoke_44_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_peril_vent_on_weakspot_hit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Quell {#color(255, 255, 140)}{warp_charge:%s}{#reset()} of your " .. peril_color_rgb .. " on " .. weakspot2_color_rgb .. " Hit." .. trauma_note_color_rgb end}, -- colors
-- {	id = "trait_bespoke_45_ext_en", -- Blazing Spirit
	-- loc_keys = {"loc_trait_bespoke_warpfire_burn_on_crit",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Blazing Spirit" end},
{	id = "trait_bespoke_45_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_warpfire_burn_on_crit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Enemy gains {#color(255, 255, 140)}{stacks:%s}{#reset()} Stacks of " .. soulblaze_color_rgb .. " on " .. crit_hit_color_rgb .. ". Up to {#color(255, 155, 55)}6{#reset()} Stacks." end}, -- colors Note!
-- {	id = "trait_bespoke_46_ext_en", -- Surge
	-- loc_keys = {"loc_trait_bespoke_double_shot_on_crit",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Surge" end},
{	id = "trait_bespoke_46_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_double_shot_on_crit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}{value:%s}{#reset()} Shots on " .. crit_hit_color_rgb .. "." .. trauma_note_color_rgb end}, -- colors Note!

-- ____________________________________________________Shredder Autopistol
-- {	id = "trait_bespoke_47_ext_en", -- Raking Fire
	-- loc_keys = {"loc_trait_bespoke_allow_flanking_and_increased_damage_when_flanking",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Raking Fire" end},
{	id = "trait_bespoke_47_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_allow_flanking_and_increased_damage_when_flanking_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{damage:%s}{#reset()} " .. damage_color_rgb .. " when shooting Enemies in the back." end}, -- colors
-- {	id = "trait_bespoke_48_ext_en", -- Powderburn
	-- loc_keys = {"loc_trait_bespoke_recoil_reduction_and_suppression_increase_on_close_kills",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Powderburn" end},
{	id = "trait_bespoke_48_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_recoil_reduction_and_suppression_increase_on_close_kills_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{damage:%s}{#reset()} " .. damage_color_rgb .. " against Suppressed Enemies, {#color(255, 255, 140)}+{suppression:%s}{#reset()} Suppression and {#color(255, 255, 140)}-{recoil_reduction:%s}{#reset()} Recoil on Close Range Kill." end}, -- colors
-- {	id = "trait_bespoke_49_ext_en", -- Cavalcade
	-- loc_keys = {"loc_trait_bespoke_stacking_crit_bonus_on_continuous_fire",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Cavalcade" end},
{	id = "trait_bespoke_49_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_stacking_crit_bonus_on_continuous_fire_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{crit_chance:%s}{#reset()} " .. crit_chance_color_rgb .. " for every {#color(255, 255, 140)}{ammo:%s}{#reset()} of magazine spent during continuos fire. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." end}, -- colors
-- {	id = "trait_bespoke_50_ext_en", -- Speedload
	-- loc_keys = {"loc_trait_bespoke_reload_speed_on_slide",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Speedload" end},
	{	id = "trait_bespoke_50_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_reload_speed_on_slide_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{reload_speed:%s}{#reset()} Reload Speed for {#color(255, 255, 140)}{time:%s}{#reset()} seconds after Kill at a distance of up to {#color(255, 155, 55)}8{#reset()} meters. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." end}, -- rewrite colors Note!
-- {	id = "trait_bespoke_51_ext_en", -- Pinning Fire
	-- loc_keys = {"loc_trait_bespoke_stacking_power_bonus_on_staggering_enemies",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Pinning Fire" end},
{	id = "trait_bespoke_51_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_stacking_power_bonus_on_staggering_enemies_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{power_level:%s}{#reset()} " .. power_color_rgb .. " for every Enemy you " .. stagger_color_rgb .. ". Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." .. power_note_color_rgb end},
-- {	id = "trait_bespoke_52_ext_en", -- Blaze Away
	-- loc_keys = {"loc_trait_bespoke_power_bonus_on_continuous_fire",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Blaze Away" end},
	{	id = "trait_bespoke_52_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_power_bonus_on_continuous_fire_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{power_level:%s}{#reset()} " .. power_color_rgb .. " for every {#color(255, 255, 140)}{ammo:%s}{#reset()} of magazine spent during continuous fire. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." .. power_note_color_rgb end}, -- colors
-- {	id = "trait_bespoke_53_ext_en", -- Inspiring Barrage
	-- loc_keys = {"loc_trait_bespoke_toughness_on_continuous_fire",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Inspiring Barrage" end},
{	id = "trait_bespoke_53_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_toughness_on_continuous_fire_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{toughness:%s}{#reset()} " .. toughness_color_rgb .. " for every {#color(255, 255, 140)}{ammo:%s}{#reset()} of magazine spent during continuous fire. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." end}, -- colors
-- ____________________________________________________Headhunter Autogun
-- {	id = "trait_bespoke_54_ext_en", -- Opening Salvo
	-- loc_keys = {"loc_trait_bespoke_power_bonus_on_first_shot",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Opening Salvo" end},
{	id = "trait_bespoke_54_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_power_bonus_on_first_shot_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{power_level:%s}{#reset()} " .. power_color_rgb .. " on Salvo's First shot." .. power_note_color_rgb end}, -- colors
-- {	id = "trait_bespoke_55_ext_en", -- Ghost
	-- loc_keys = {"loc_trait_bespoke_count_as_dodge_vs_ranged_on_weakspot",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Ghost" end},
{	id = "trait_bespoke_55_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_count_as_dodge_vs_ranged_on_weakspot_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Immune to Ranged Attacks for {#color(255, 255, 140)}{time:%s}{#reset()} seconds on " .. weakspot2_color_rgb .. " Hit." end}, -- colors
-- {	id = "trait_bespoke_56_ext_en", -- Falter
	-- loc_keys = {"loc_trait_bespoke_negate_stagger_reduction_on_weakspot",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Falter" end},
{	id = "trait_bespoke_56_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_negate_stagger_reduction_on_weakspot_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{stagger:%s}{#reset()} Target {#color(155, 155, 55)}Stagger{#reset()} on " .. weakspot2_color_rgb .. " Hit." end}, -- colors
-- {	id = "trait_bespoke_57_ext_en", -- Surgical
	-- loc_keys = {"loc_trait_bespoke_crit_chance_based_on_aim_time",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Surgical" end},
{	id = "trait_bespoke_57_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_crit_chance_based_on_aim_time_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Up to {#color(255, 255, 140)}{stacks:%s}{#reset()} Stacks of {#color(255, 255, 140)}+{crit_chance:%s}{#reset()} " .. crit_chance_color_rgb .. " for every {#color(255, 255, 140)}{time:%s}{#reset()} seconds while aiming. Discharges all Stacks upon firing." end}, -- colors second->seconds
-- {	id = "trait_bespoke_58_ext_en", -- No Respite
	-- loc_keys = {"loc_trait_bespoke_stagger_count_bonus_damage",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "No Respite" end},
{	id = "trait_bespoke_58_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_stagger_count_bonus_damage_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Up to {#color(255, 255, 140)}+{damage:%s}{#reset()} " .. damage_color_rgb .. " on Hit to " .. stagger2_color_rgb .. " Enemy. {#color(255, 155, 55)}The more powerful the effect on the enemy, the more Damage they receive.{#reset()}" end}, -- colors
-- {	id = "trait_bespoke_59_ext_en", -- Between the Eyes
	-- loc_keys = {"loc_trait_bespoke_suppression_negation_on_weakspot",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Between the Eyes" end},
{	id = "trait_bespoke_59_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_suppression_negation_on_weakspot_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Gain Suppression Immunity for {#color(255, 255, 140)}{time:%s}{#reset()} seconds on " .. weakspot2_color_rgb .. " Hit." end}, -- colors s->seconds
-- {	id = "trait_bespoke_60_ext_en", -- Deadly Accurate
	-- loc_keys = {"loc_trait_bespoke_crit_weakspot_finesse",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Deadly Accurate" end},
{	id = "trait_bespoke_60_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_crit_weakspot_finesse_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{crit_weakspot_damage:%s}{#reset()} " .. crit_color_rgb .. " " .. weakspot4_color_rgb .. "." end}, -- colors
-- {	id = "trait_bespoke_61_ext_en", -- Headhunter
	-- loc_keys = {"loc_trait_bespoke_weakspot_stañking_crit_chance",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Headhunter" end},
{	id = "trait_bespoke_61_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_weakspot_stacking_crit_chance_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{crit_chance:%s}{#reset()} " .. crit_chance_color_rgb .. " on " .. weakspot2_color_rgb .. " Hit until your next " .. crit_hit_color_rgb .. ". Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." end}, -- colors
-- {	id = "trait_bespoke_61_ext_en", -- Crucian Roulette
	-- loc_keys = {"loc_trait_bespoke_crit_chance_based_on_ammo_left",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Crucian Roulette" end},
{	id = "trait_bespoke_62_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_crit_chance_based_on_ammo_left_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{crit_chance:%s}{#reset()} " .. crit_chance_color_rgb .. " for each expended round in your weapon. Resets on reload." end}, -- colors

-- ____________________________________________________Infantry Autogun
-- {	id = "trait_bespoke_63_ext_en", -- Punishing Salvo
	-- loc_keys = {"loc_trait_bespoke_followup_shots_ranged_weakspot_damage",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Punishing Salvo" end},
{	id = "trait_bespoke_63_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_followup_shots_ranged_weakspot_damage_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{damage:%s}{#reset()} " .. weakspot4_color_rgb .. " on Second, Third and Fourth shots in a Salvo. {#color(255, 155, 55)}Damage is 2.5 times higher.{#reset()}" end}, -- colors -- "on Third and Fourth shots" to "on Second, Third and Fourth"
-- {	id = "trait_bespoke_64_ext_en", -- Fire Frenzy
	-- loc_keys = {"loc_trait_bespoke_increase_close_damage_on_close_kill",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Fire Frenzy" end},
{	id = "trait_bespoke_64_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_increase_close_damage_on_close_kill_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "You gain {#color(255, 255, 140)}+{close_damage:%s}{#reset()} " .. damage_color_rgb .. " for {#color(255, 255, 140)}{time:%s}{#reset()} seconds after killing an enemy at a distance of up to {#color(255, 155, 55)}8{#reset()} meters. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." end}, -- colors Note!
-- {	id = "trait_bespoke_65_ext_en", -- Deathspitter
	-- loc_keys = {"loc_trait_bespoke_increase_power_on_close_kill",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Deathspitter" end},
{	id = "trait_bespoke_65_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_increase_power_on_close_kill_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{power_level:%s}{#reset()} " .. power_color_rgb .. " at a distance of up to {#color(255, 155, 55)}8{#reset()} meters for {#color(255, 255, 140)}{time:%s}{#reset()} seconds. Stacks {#color(255, 155, 55)}5{#reset()} times." .. power_note_color_rgb end}, -- colors Note!
{	id = "trait_bespoke_66_ext_en", -- Hit & Run
	loc_keys = {"loc_trait_bespoke_count_as_dodge_vs_ranged_on_close_kill",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Hit and Run" end}, -- &->and
{	id = "trait_bespoke_66_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_count_as_dodge_vs_ranged_on_close_kill_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Immune to Ranged Attacks for {#color(255, 255, 140)}{time:%s}{#reset()} seconds on Kill at a distance of up to {#color(255, 155, 55)}8{#reset()} meters." end}, -- colors s->second
-- {	id = "trait_bespoke_67_ext_en", -- Dumdum
	-- loc_keys = {"loc_trait_bespoke_consecutive_hits_increases_close_damage",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Dumdum" end},
{	id = "trait_bespoke_67_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_consecutive_hits_increases_close_damage_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{damage:%s}{#reset()} " .. damage_color_rgb .. " on Repeated Hit. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times. {#color(255, 155, 55)}The Damage gradually decreases with increasing distance from the enemy.{#reset()}" end}, -- colors -- "Close Range"->"ALL Range!"
-- {	id = "trait_bespoke_68_ext_en", -- Stripped Down
	-- loc_keys = {"loc_trait_bespoke_increased_sprint_speed",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Stripped Down" end},
{	id = "trait_bespoke_68_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_increased_sprint_speed_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Gain Ranged Attack Immunity while sprinting with over {#color(255, 255, 140)}{stamina:%s}{#reset()} " .. stamina_color_rgb .. ". {#color(255, 155, 55)}Doesn't save you from Flamers and Trappers.{#reset()}" end}, -- colors

-- ____________________________________________________Infantry Lasgun
-- {	id = "trait_bespoke_69_ext_en", -- Efficiency
	-- loc_keys = {"loc_trait_bespoke_first_shot_ammo_cost_reduction",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Efficiency" end},
{	id = "trait_bespoke_69_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_first_shot_ammo_cost_reduction_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "You only use {#color(255, 255, 140)}{ammo:%s}{#reset()} of your Ammo per shot every {#color(255, 255, 140)}{time:%s}{#reset()} seconds." end}, -- rewrite colors s->seconds -- +{ammo:%s} Reduced Ammo use after not shooting for {time:%s} seconds.
-- {	id = "trait_bespoke_70_ext_en", -- Infernus
	-- loc_keys = {"loc_trait_bespoke_burninating_on_crit",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Infernus" end},
{	id = "trait_bespoke_70_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_burninating_on_crit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{stacks:%s}{#reset()} " .. burn_color_rgb .. " Stacks on " .. crit_hit_color_rgb .. " to a maximum of {#color(255, 255, 140)}{max_stacks:%s}{#reset()} Stacks." end}, -- colors ()

-- ____________________________________________________Quickdraw Stub Revolver
-- {	id = "trait_bespoke_71_ext_en", -- Point Blank
	-- loc_keys = {"loc_trait_bespoke_crit_chance_bonus_on_melee_kills",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Point Blank" end},
{	id = "trait_bespoke_71_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_crit_chance_bonus_on_melee_kills_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{crit_chance:%s}{#reset()} Ranged " .. crit_chance_color_rgb .. " after Melee Kill for {#color(255, 255, 140)}{time:%s}{#reset()} seconds." end}, -- colors
-- {	id = "trait_bespoke_72_ext_en", -- Hand-Cannon
	-- loc_keys = {"loc_trait_bespoke_rending_on_crit",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Hand-Cannon" end},
{	id = "trait_bespoke_72_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_rending_on_crit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{rend:%s}{#reset()} " .. rending_color_rgb .. " on " .. crit_hit_color_rgb .. "." .. rending_note_color_rgb end}, -- colors
-- {	id = "trait_bespoke_73_ext_en", -- Trickshooter
	-- loc_keys = {"loc_trait_bespoke_power_bonus_on_chained_weakspot_hits",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Trickshooter" end},
{	id = "trait_bespoke_73_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_power_bonus_on_chained_weakspot_hits_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{power_level:%s}{#reset()} " .. power_color_rgb .. " on Chained " .. weakspot2_color_rgb .. " Hit to Any Target. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." .. power_note_color_rgb end}, -- colors
-- {	id = "trait_bespoke_74_ext_en", -- Gloryhunter
	-- loc_keys = {"loc_trait_bespoke_toughness_on_elite_kills",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Gloryhunter" end},
{	id = "trait_bespoke_74_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_toughness_on_elite_kills_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{toughness:%s}{#reset()} " .. toughness_color_rgb .. " on Elite Kill." end}, -- colors


-- ==================================================ZEALOT

-- ____________________________________________________Thunder Hammer
{	id = "trait_bespoke_74_ext_en", -- Shock & Awe
	loc_keys = {"loc_trait_bespoke_hit_mass_consumption_reduction_on_kill",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Shock and Awe" end}, -- &->and
{	id = "trait_bespoke_75_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_hit_mass_consumption_reduction_on_kill_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}-{hit_mass:%s}{#reset()} Enemy " .. hit_mass_color_rgb .. " for {#color(255, 255, 140)}{time:%s}{#reset()} seconds on Kill." end}, -- colors s->seconds
-- {	id = "trait_bespoke_76_ext_en", -- Momentum
	-- loc_keys = {"loc_trait_bespoke_toughness_recovery_on_multiple_hits",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Momentum" end},
{	id = "trait_bespoke_76_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_toughness_recovery_on_multiple_hits_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Hitting at least {#color(255, 255, 140)}{multiple_hit:%s}{#reset()} enemies with an attack, restores {#color(255, 255, 140)}{toughness:%s}{#reset()} " .. toughness_color_rgb .. "." end}, -- colors

-- ____________________________________________________Turtolsky Heavy Sword
-- {	id = "trait_bespoke_77_ext_en", -- Perfect Strike
	-- loc_keys = {"loc_trait_bespoke_pass_past_armor_on_crit",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Perfect Strike" end},
{	id = "trait_bespoke_77_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_pass_past_armor_on_crit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return crit_hits_color_rgb .. " ignore " .. hit_mass_color_rgb .. " Bonus from Armour." end}, -- colors
-- {	id = "trait_bespoke_78_ext_en", -- Deathblow
	-- loc_keys = {"loc_trait_bespoke_infinite_melee_cleave_on_weakspot_kill",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Deathblow" end},
{	id = "trait_bespoke_78_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_infinite_melee_cleave_on_weakspot_kill_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{weakspot_damage:%s}{#reset()} " .. weakspot4_color_rgb .. ". " .. weakspot_color_rgb .. " Kills also ignore Enemy " .. hit_mass_color_rgb .. "." end}, -- colors

-- ____________________________________________________Lawbringer Combat Shotgun
-- {	id = "trait_bespoke_79_ext_en", -- Flechette
	-- loc_keys = {"loc_trait_bespoke_bleed_on_crit_ranged",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Flechette" end},
{	id = "trait_bespoke_79_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_bleed_on_crit_ranged_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{stacks:%s}{#reset()} " .. bleed_color_rgb .. " Stacks on " .. crit_hit_color_rgb .. ". Up to {#color(255, 155, 55)}16{#reset()} Stacks." end}, -- colors
-- {	id = "trait_bespoke_80_ext_en", -- Scattershot
	-- loc_keys = {"loc_trait_bespoke_crit_chance_on_hitting_multiple_with_one_shot",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Scattershot" end},
{	id = "trait_bespoke_80_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_crit_chance_on_hitting_multiple_with_one_shot_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{crit_chance:%s}{#reset()} " .. crit_chance_color_rgb .. " for each Enemy Hit by your previous attack. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." end}, -- colors
-- {	id = "trait_bespoke_81_ext_en", -- Man-Stopper
	-- loc_keys = {"loc_trait_bespoke_cleave_on_crit",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Man-Stopper" end},
{	id = "trait_bespoke_81_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_cleave_on_crit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Increased " .. cleave_color_rgb .. " on " .. crit_hit_color_rgb .. "." end}, -- colors
-- {	id = "trait_bespoke_82_ext_en", -- Full Bore
	-- loc_keys = {"loc_trait_bespoke_power_bonus_on_hitting_single_enemy_with_all",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Full Bore" end},
{	id = "trait_bespoke_82_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_power_bonus_on_hitting_single_enemy_with_all_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{power_level:%s}{#reset()} " .. power_color_rgb .. " for {#color(255, 255, 140)}{time:%s}{#reset()} seconds when every bullet in a shot hits the same enemy." .. power_note_color_rgb end}, -- colors s->seconds

-- ____________________________________________________Purgation Flamer
-- {	id = "trait_bespoke_83_ext_en", -- Fan the Flames
	-- loc_keys = {"loc_trait_bespoke_ignore_stagger_reduction_with_primary_on_burning",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Fan the Flames" end},
{	id = "trait_bespoke_83_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_ignore_stagger_reduction_with_primary_on_burning_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Primary Attacks ignores {#color(255, 255, 140)}{stagger_reduction:%s}{#reset()} " .. stagger_color_rgb .. " Resistance on " .. burn_color_rgb .. " Enemies, as well as dealing {#color(255, 255, 140)}+{impact_modifier:%s}{#reset()} " .. impact_color_rgb .. "." end}, -- colors
-- {	id = "trait_bespoke_84_ext_en", -- Showstopper
	-- loc_keys = {"loc_trait_bespoke_chance_to_explode_elites_on_kill",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Showstopper" end},
{	id = "trait_bespoke_84_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_chance_to_explode_elites_on_kill_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}{proc_chance:%s}{#reset()} chance Elite and Special enemies Explode on Kill." end}, -- colors %%->%
-- {	id = "trait_bespoke_85_ext_en", -- Quickflame
	-- loc_keys = {"loc_trait_bespoke_faster_reload_on_empty_clip",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Quickflame" end},
{	id = "trait_bespoke_85_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_faster_reload_on_empty_clip_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{reload_speed:%s}{#reset()} Reload Speed if empty." end}, -- colors
-- {	id = "trait_bespoke_86_ext_en", -- Overpressure
	-- loc_keys = {"loc_trait_bespoke_power_scales_with_clip_percentage",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Overpressure" end},
{	id = "trait_bespoke_86_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_power_scales_with_clip_percentage_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Up to {#color(255, 255, 140)}+{power_level:%s}{#reset()} " .. power_color_rgb .. ", scaling with remaining Ammunition. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." .. power_note_color_rgb end}, -- colors

-- ____________________________________________________Spearhead Boldgun
-- {	id = "trait_bespoke_87_ext_en", -- Shattering Impact
	-- loc_keys = {"loc_trait_bespoke_armor_rend_on_projectile_hit",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Shattering Impact" end},
{	id = "trait_bespoke_87_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_armor_rend_on_projectile_hit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Target receives {#color(255, 255, 140)}{stacks:%s}{#reset()} Stacks of {#color(255, 255, 140)}{rending:%s}{#reset()} " .. brittleness_color_rgb .. " on direct projectile hit. Lasts {#color(255, 255, 140)}{time:%s}{#reset()} seconds." .. brittleness_note_color_rgb end}, -- colors s->seconds


-- ==================================================VETERAN

-- ____________________________________________________Melee

-- ____________________________________________________Power Sword
-- {	id = "trait_bespoke_88_ext_en", -- Supercharge
	-- loc_keys = {"loc_trait_bespoke_armor_rend_on_activated_attacks",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Supercharge" end},
{	id = "trait_bespoke_88_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_armor_rend_on_activated_attacks_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{rend:%s}{#reset()} stacks of " .. brittleness_color_rgb .. " on Energised Hit." .. brittleness_note_color_rgb end}, -- colors
-- {	id = "trait_bespoke_89_ext_en", -- Power Cycler
	-- loc_keys = {"loc_trait_bespoke_extended_activation_duration_on_chained_attacks",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Power Cycler" end},
{	id = "trait_bespoke_89_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_extended_activation_duration_on_chained_attacks_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{extra_hits:%s}{#reset()} Extra Chained Energised Hits." end}, -- colors
-- {	id = "trait_bespoke_90_ext_en", -- Sunder
	-- loc_keys = {"loc_trait_bespoke_infinite_armor_cleave_on_activated_attacks",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Sunder" end},
{	id = "trait_bespoke_90_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_infinite_armor_cleave_on_activated_attacks_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Your Energised Attacks have increased " .. cleave_color_rgb .. "." end}, -- colors

-- ____________________________________________________Ranged

-- ____________________________________________________Plasma Gun
-- {	id = "trait_bespoke_91_ext_en", -- Volatile
	-- loc_keys = {"loc_trait_bespoke_lower_overheat_gives_faster_charge",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Volatile" end},
{	id = "trait_bespoke_91_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_lower_overheat_gives_faster_charge_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{charge_speed:%s}{#reset()} Charge Speed on low Overheat. Stacks up to {#color(255, 255, 140)}{stacks:%s}{#reset()} times." end}, -- colors -- "%Charge" -> "% Charge"
-- {	id = "trait_bespoke_88_ext_en", -- Gets Hot!
	-- loc_keys = {"loc_trait_bespoke_crit_chance_scaled_on_heat",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Gets Hot!" end},
{	id = "trait_bespoke_92_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_crit_chance_scaled_on_heat_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Up to {#color(255, 255, 140)}+{crit_chance:%s}{#reset()} " .. crit_chance_color_rgb .. ". Scales with increasing Heat level." end}, -- colors -- "(scales on Heat Level)" -> "Scales with increasing Heat level."

-- ____________________________________________________Helbore Lasgun
-- {	id = "trait_bespoke_93_ext_en", -- Onslaught
	-- loc_keys = {"loc_trait_bespoke_faster_charge_on_chained_attacks",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Onslaught" end},
{	id = "trait_bespoke_93_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_faster_charge_on_chained_attacks_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}{charge_time:%s}{#reset()} Charge Time when aiming. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." end}, -- colors -- Chaining Charged Attacks reduces their Charge Time by {#color(255, 255, 140)}{charge_time:%s}{#reset()}. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times.


-- ==================================================OGRYN

-- ____________________________________________________Melee

-- ____________________________________________________Slab Shield
-- {	id = "trait_bespoke_94_ext_en", -- Confident Strike
	-- loc_keys = {"loc_trait_bespoke_toughness_recovery_on_chained_attacks",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Confident Strike" end},
{	id = "trait_bespoke_94_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_toughness_recovery_on_chained_attacks_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{toughness:%s}{#reset()} " .. toughness_color_rgb .. " on Chained Hit, starting from the second Hit." end}, -- colors

-- ____________________________________________________Cleaver
-- {	id = "trait_bespoke_94_ext_en", -- Bash
	-- loc_keys = {"loc_trait_bespoke_crit_chance_on_push",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Bash" end},
{	id = "trait_bespoke_95_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_crit_chance_on_push_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{crit_chance:%s}{#reset()} " .. crit_chance_color_rgb .. " for {#color(255, 255, 140)}{time:%s}{#reset()} seconds on Pushing Enemies." end}, -- colors s->seconds
-- {	id = "trait_bespoke_96_ext_en", -- Tenderiser
	-- loc_keys = {"loc_trait_bespoke_increased_power_on_weapon_special_follow_up_hits",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Tenderiser" end},
{	id = "trait_bespoke_96_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_increased_power_on_weapon_special_follow_up_hits_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{power:%s}{#reset()} " .. power_color_rgb .. " for your next {#color(255, 255, 140)}3{#reset()} Melee attacks after Weapon Special attack Hit." .. power_note_color_rgb end}, -- colors ()
-- {	id = "trait_bespoke_97_ext_en", -- Unstoppable Force
	-- loc_keys = {"loc_trait_bespoke_pass_past_armor_on_heavy_attack",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Unstoppable Force" end},
{	id = "trait_bespoke_97_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_pass_past_armor_on_heavy_attack_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Fully Charged Heavy Attacks ignore Enemy " .. hit_mass_color_rgb .. "." end}, -- colors

-- ____________________________________________________Ranged

-- ____________________________________________________Twin-Linked Heavy Stubber
-- {	id = "trait_bespoke_98_ext_en", -- Charmed Reload
	-- loc_keys = {"loc_trait_bespoke_ammo_refill_from_reserve_on_crit",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Charmed Reload" end},
{	id = "trait_bespoke_98_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_ammo_refill_from_reserve_on_crit_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{bullet_amount:%s}{#reset()} bullets loaded from Reserve on " .. crit_hit_color_rgb .. ". {#color(255, 35, 5)}Gives only half the ammo!{#reset()}" end}, -- colors
-- {	id = "trait_bespoke_99_ext_en", -- Roaring Advance
	-- loc_keys = {"loc_trait_bespoke_movement_speed_on_continuous_fire",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Roaring Advance" end},
{	id = "trait_bespoke_99_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_movement_speed_on_continuous_fire_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}-{movement_speed:%s}{#reset()} Movement Speed Reduction for every {#color(255, 255, 140)}{ammo:%s}{#reset()} of magazine spent during continuous fire. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." end}, -- colors s->seconds
-- {	id = "trait_bespoke_100_ext_en", -- Overwhelming Fire
	-- loc_keys = {"loc_trait_bespoke_power_bonus_on_chained_hits_on_single_target",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Overwhelming Fire" end},
{	id = "trait_bespoke_100_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_power_bonus_on_chained_hits_on_single_target_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{power:%s}{#reset()} " .. power_color_rgb .. " for every {#color(255, 255, 140)}{hit:%s}{#reset()} Single Target Hits. Lasts {#color(255, 255, 140)}{time:%s}{#reset()} seconds and Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." .. power_note_color_rgb end}, -- colors s->seconds
-- {	id = "trait_bespoke_101_ext_en", -- Ceaseless Barrage
	-- loc_keys = {"loc_trait_bespoke_suppression_on_continuous_fire",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Ceaseless Barrage" end},
{	id = "trait_bespoke_101_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_suppression_on_continuous_fire_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{suppression:%s}{#reset()} Suppression for every {#color(255, 255, 140)}{ammo:%s}{#reset()} of magazine spent during continuous fire. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." end}, -- colors

-- ____________________________________________________Ripper Gun
-- {	id = "trait_bespoke_102_ext_en", -- Can opener
	-- loc_keys = {"loc_trait_bespoke_armor_rending_bayonette",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Can opener" end},
{	id = "trait_bespoke_102_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_armor_rending_bayonette_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Target receives {#color(255, 255, 140)}{stacks:%s}{#reset()} stacks of {#color(255, 255, 140)}+2.{rending:%s}{#reset()} " .. brittleness_color_rgb .. " on weapon Special Hit. Lasts {#color(255, 255, 140)}{time:%s}{#reset()} seconds. " .. brittleness_note_color_rgb end}, -- colors s->seconds
-- {	id = "trait_bespoke_103_ext_en", -- Born in blood
	-- loc_keys = {"loc_trait_bespoke_toughness_on_close_range_kills",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Born in blood" end},
{	id = "trait_bespoke_103_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_toughness_on_close_range_kills_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{toughness:%s}{#reset()} " .. toughness_color_rgb .. " on Kill at a distance of up to {#color(255, 155, 55)}8{#reset()} meters." end}, -- colors

--____________________________________________________Rumbler
-- {	id = "trait_bespoke_104_ext_en", -- Pierce
	-- loc_keys = {"loc_trait_bespoke_pass_trough_armor_on_weapon_special",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Pierce" end},
{	id = "trait_bespoke_104_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_pass_trough_armor_on_weapon_special_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "Special Attacks ignore " .. hit_mass_color_rgb .. " Bonus from Armour." end}, -- colors
-- {	id = "trait_bespoke_105_ext_en", -- Adhesive Charge
	-- loc_keys = {"loc_trait_bespoke_grenades_stick_to_monsters",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Adhesive Charge" end},
-- {	id = "trait_bespoke_105_desc_ext_en",
	-- loc_keys = {"loc_trait_bespoke_grenades_stick_to_monsters_desc",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Your Grenades stick to Ogryns and Monstrosities." end},

-- ____________________________________________________Kickback
-- {	id = "trait_bespoke_106_ext_en", -- Expansive
	-- loc_keys = {"loc_trait_bespoke_weapon_special_power_bonus_after_one_shots",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Expansive" end},
{	id = "trait_bespoke_106_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_weapon_special_power_bonus_after_one_shots_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{power_level:%s}{#reset()} Melee " .. power_color_rgb .. " for {#color(255, 255, 140)}{time:%s}{#reset()} seconds on Hitting {#color(255, 255, 140)}3+{#reset()} Enemies with a Ranged Attack." .. power_note_color_rgb end}, -- colors s->seconds -- "+30%Melee Power for  3.5s"->"+30% Melee Power for 3.5 seconds"
-- {	id = "trait_bespoke_107_ext_en", -- Punishing Fire
	-- loc_keys = {"loc_trait_bespoke_shot_power_bonus_after_weapon_special_cleave",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Punishing Fire" end},
{	id = "trait_bespoke_107_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_shot_power_bonus_after_weapon_special_cleave_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{power_level:%s}{#reset()} " .. power_color_rgb .. " Bonus on your ranged attack for {#color(255, 255, 140)}{time:%s}{#reset()} seconds after Cleaving through several enemies with your weapon's Special attack." .. power_note_color_rgb end}, -- colors

--____________________________________________________Grenadier Gauntlet
-- {	id = "trait_bespoke_108_ext_en", -- Reassuringly Accurate
	-- loc_keys = {"loc_trait_bespoke_toughness_on_crit_kills",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Reassuringly Accurate" end},
{	id = "trait_bespoke_108_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_toughness_on_crit_kills_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{toughness:%s}{#reset()} " .. toughness_color_rgb .. " on " .. crit_hit_color_rgb .. " Kill." end},
-- {	id = "trait_bespoke_109_ext_en", -- Pinpointing target
	-- loc_keys = {"loc_trait_bespoke_power_bonus_based_on_charge_time_ranged",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Pinpointing target" end},
{	id = "trait_bespoke_109_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_power_bonus_based_on_charge_time_ranged_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{power_level:%s}{#reset()} " .. power_color_rgb .. " every {#color(255, 255, 140)}{time:%s}{#reset()} seconds while aiming, stacking {#color(255, 255, 140)}{stacks:%s}{#reset()} times. Discharges all stacks upon firing." .. power_note_color_rgb end},
-- {	id = "trait_bespoke_110_ext_en", -- Blaze Away alt
	-- loc_keys = {"loc_trait_bespoke_power_bonus_on_continuous_fire_alternative",},
	-- locales = {"en",},
	-- handle_func = function(locale, value)
	-- return "Blaze Away" end},
	{	id = "trait_bespoke_110_desc_ext_en",
	loc_keys = {"loc_trait_bespoke_power_bonus_on_continuous_fire_alternative_desc",},
	locales = {"en",},
	handle_func = function(locale, value)
	return "{#color(255, 255, 140)}+{power_level:%s}{#reset()} " .. power_color_rgb .. " for every shot fired during continuos fire. Stacks {#color(255, 255, 140)}{stacks:%s}{#reset()} times." .. power_note_color_rgb end},

-- FOR TESTS ONLY!!!
-- {id = "weap_testum00",
-- loc_keys = {
-- "",},
-- locales = {"en",},
-- handle_func = function(locale, value)
-- return string.gsub(value, "{", "(")
-- end,},
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
