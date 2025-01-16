---@diagnostic disable: undefined-global
local mod = get_mod("Enhanced_descriptions")

--[+ Loading colors of Keywords and Numbers +]--
COLORS_Numbers = mod:io_dofile("Enhanced_descriptions/COLORS_Numbers")
-- All numbers are taken from this file by adding to the value "COLORS_Numbers."
-- For example, in the game the Damage value is taken from the variable {damage:%s}, which in the file "COLORS_Numbers.lua" is replaced by dmg_var_rgb and to add the highlighted number to the text, we write the damage number to the text as "..COLORS_Numbers.dmg_var_rgb.."

COLORS_KWords = mod:io_dofile("Enhanced_descriptions/Loc_EN/COLORS_KWords")
-- All Keywords are taken from this file by adding to the value "COLORS_KWords.".
-- For example, in the file "COLORS_KWords.lua" the word Damage is replaced by Damage_rgb and to add the highlighted word to the text we write it as "..COLORS_KWords.Damage_rgb.".

	--[+ Translations +]-- Add a line with a file of Keywords translated into your language.
COLORS_KWords_fr = mod:io_dofile("Enhanced_descriptions/Loc_FR/COLORS_KWords_fr") -- French

--[+ Function to create a localization template +]--
local function create_template(id, loc_keys, locales, handle_func)
	return { id = id, loc_keys = loc_keys, locales = locales, handle_func = handle_func }
end

--[+ Define localization templates +]--
local localization_templates = {
-- Duplicate the line and translate. For example:
--		create_template("weap_bb0_ext_en", {"loc_trait_melee_common_wield_increased_armored_damage_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." "..COLORS_KWords.Damage_rgb.." vs Flak Armoured Enemies" end),
--		create_template("weap_bb0_ext_YOURLANGUAGE", {"loc_trait_melee_common_wield_increased_armored_damage_desc"}, {"YOURLANGUAGE"}, function(locale, value) return COLORS_Numbers.p_dmg_var_rgb.." к "..COLORS_KWords.Damage_rgb_YOURLANGUAGE.." против врагов в противоосколочной броне." end), <- Don't forget the comma at the end!

--[+ +CURIOS+ +]--
	--[+ Blessings +]--
		--[+ +Health +]--
	create_template("curio_bless0_ext_en", {"loc_inate_gadget_health_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_maxhlth_rgb.." Maximum "..COLORS_KWords.Health_rgb end),
	create_template("curio_bless0_ext_fr", {"loc_inate_gadget_health_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_maxhlth_rgb.." de "..COLORS_KWords_fr.Health_rgb_fr.." Maximum" end),
		--[+ +Wound +]--
	create_template("curio_bless1_ext_en", {"loc_inate_gadget_health_segment_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_maxwnds_rgb.." "..COLORS_KWords.Wound_rgb end),
	create_template("curio_bless1_ext_fr", {"loc_inate_gadget_health_segment_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_maxwnds_rgb.."  "..COLORS_KWords_fr.Wound_rgb_fr end),
		--[+ +Stamina +]--
	create_template("curio_bless2_ext_en", {"loc_inate_gadget_stamina_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_maxstam_rgb.." Maximum "..COLORS_KWords.Stamina_rgb end),
	create_template("curio_bless2_ext_fr", {"loc_inate_gadget_stamina_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_maxstam_rgb.." d'"..COLORS_KWords_fr.Stamina_rgb_fr.." Maximum" end),
		--[+ +Toughness +]--
	create_template("curio_bless3_ext_en", {"loc_inate_gadget_toughness_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_maxtghns_rgb.." "..COLORS_KWords.Toughness_rgb end),
	create_template("curio_bless3_ext_fr", {"loc_inate_gadget_toughness_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_maxtghns_rgb.." de "..COLORS_KWords_fr.Toughness_rgb_fr end),

	--[+ Traits +]--
		--[+ +Combat Ability Regeneration +]--
	create_template("curio_traits0_ext_en", {"loc_gadget_cooldown_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_abil_cd_rgb.." "..COLORS_KWords.Combat_ability_rgb.." Regeneration" end),
	create_template("curio_traits0_ext_fr", {"loc_gadget_cooldown_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_abil_cd_rgb.." de régénération du "..COLORS_KWords_fr.Combat_ability_cd_rgb_fr end),
		--[+ +Corruption Resistance +]--
	create_template("curio_traits1_ext_en", {"loc_gadget_corruption_resistance_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_corr_rgb.." "..COLORS_KWords.Corruption_rgb.." Resistance" end),
	create_template("curio_traits1_ext_fr", {"loc_gadget_corruption_resistance_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_corr_rgb.." de résistance à la "..COLORS_KWords_fr.Corruption_rgb_fr end),
		--[+ +Corruption Resistance from Grimoires +]--
	create_template("curio_traits2_ext_en", {"loc_gadget_grim_corruption_resistance_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_corrgrm_rgb.." "..COLORS_KWords.Corruption_rgb.." Resistance from Grimoires" end),
	create_template("curio_traits2_ext_fr", {"loc_gadget_grim_corruption_resistance_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_corrgrm_rgb.." de résistance à la "..COLORS_KWords_fr.Corruption_rgb_fr.." (Grimoires)" end),
		--[+ +Health +]--
	create_template("curio_traits3_ext_en", {"loc_trait_gadget_health_increase_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_maxhlth_rgb.." Maximum "..COLORS_KWords.Health_rgb end),
	create_template("curio_traits3_ext_fr", {"loc_trait_gadget_health_increase_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_maxhlth_rgb.." de "..COLORS_KWords_fr.Health_rgb_fr.." maximum" end),
		--[+ +Block Cost Reduction +]--
	create_template("curio_traits4_ext_en", {"loc_gadget_block_cost_reduction_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_blckcst_rgb.." Block Cost Reduction" end),
	create_template("curio_traits4_ext_fr", {"loc_gadget_block_cost_reduction_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_blckcst_rgb.." d'éfficacité de blocage" end),
		--[+ -Stamina Cost for Sprinting +]--
	create_template("curio_traits5_ext_en", {"loc_gadget_sprint_cost_reduction_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.m_bcm_rgb.." "..COLORS_KWords.Stamina_rgb.." Cost for Sprinting" end),
	create_template("curio_traits5_ext_fr", {"loc_gadget_sprint_cost_reduction_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.m_bcm_rgb.." de coût d'"..COLORS_KWords_fr.Stamina_rgb_fr.." de la course" end),
		--[+ +Ally Revive Speed +]--
	create_template("curio_traits6_ext_en", {"loc_gadget_revive_speed_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_revive_rgb.." Ally Revive Speed" end),
	create_template("curio_traits6_ext_fr", {"loc_gadget_revive_speed_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_revive_rgb.." de vitesse de réanimation des alliés" end),
		--[+ +Stamina Regeneration +]--
	create_template("curio_traits7_ext_en", {"loc_gadget_stamina_regeneration_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_stamreg_rgb.." "..COLORS_KWords.Stamina_rgb.." Regeneration" end),
	create_template("curio_traits7_ext_fr", {"loc_gadget_stamina_regeneration_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_stamreg_rgb.." de régénération d'"..COLORS_KWords_fr.Stamina_rgb_fr end),
		--[+ +Toughness +]--
	create_template("curio_traits8_ext_en", {"loc_trait_gadget_toughness_increase_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_maxtghns_rgb.." "..COLORS_KWords.Toughness_rgb end),
	create_template("curio_traits8_ext_fr", {"loc_trait_gadget_toughness_increase_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_maxtghns_rgb.." de "..COLORS_KWords_fr.Toughness_rgb_fr.."" end),
		--[+ +Toughness Regeneration Speed +]--
	create_template("curio_traits9_ext_en", {"loc_gadget_toughness_regen_delay_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_tghn_reg_del_rgb.." "..COLORS_KWords.Toughness_rgb.." Regeneration Speed" end),
	create_template("curio_traits9_ext_fr", {"loc_gadget_toughness_regen_delay_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_tghn_reg_del_rgb.." de vitesse de régénération de "..COLORS_KWords_fr.Toughness_rgb_fr.." de syntonie" end),
		--[+ +Experience +]--
	create_template("curio_traits10_ext_en", {"loc_trait_gadget_mission_xp_increase_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_xp_rgb.." Experience" end),
	create_template("curio_traits10_ext_fr", {"loc_trait_gadget_mission_xp_increase_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_xp_rgb.." d'expérience" end),
		--[+ +Ordo +]--
	create_template("curio_traits11_ext_en", {"loc_trait_gadget_mission_credits_increase_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_credits_rgb.." Ordo Dockets" end),
	create_template("curio_traits11_ext_fr", {"loc_trait_gadget_mission_credits_increase_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_credits_rgb.." bordereaux de l'Ordo (récompenses de mission)" end),
		--[+ +Curio as Mission Reward instead of Weapon +]--
	create_template("curio_traits12_ext_en", {"loc_trait_gadget_mission_reward_gear_instead_of_weapon_increase_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_gears_rgb.." chance of Curio as Mission Reward instead of Weapon" end),
	create_template("curio_traits12_ext_fr", {"loc_trait_gadget_mission_reward_gear_instead_of_weapon_increase_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_gears_rgb.." de chance d'obtenir une curiosité comme récompense à la place d'une arme" end),
		--[+ +Damage Resistance vs Flamers +]--
	create_template("curio_traits13_ext_en", {"loc_trait_gadget_dr_vs_flamer_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Flamers" end),
	create_template("curio_traits13_ext_fr", {"loc_trait_gadget_dr_vs_flamer_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." de resistance aux "..COLORS_KWords_fr.Damage_rgb_fr.." (Incendiaires, Incendiaires toxiques) " end),
		--[+ +Damage Resistance vs Bombers +]--
	create_template("curio_traits14_ext_en", {"loc_trait_gadget_dr_vs_grenadiers_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Bombers" end),
	create_template("curio_traits14_ext_fr", {"loc_trait_gadget_dr_vs_grenadiers_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." de resistance aux "..COLORS_KWords_fr.Damage_rgb_fr.." (Bombardiers)" end),
		--[+ +Damage Resistance vs Gunners +]--
	create_template("curio_traits15_ext_en", {"loc_trait_gadget_dr_vs_gunners_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Gunners" end),
	create_template("curio_traits15_ext_fr", {"loc_trait_gadget_dr_vs_gunners_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." de resistance aux "..COLORS_KWords_fr.Damage_rgb_fr.." (Mitrailleurs)" end),
		--[+ +Damage Resistance vs Pox Hounds +]--
	create_template("curio_traits16_ext_en", {"loc_trait_gadget_dr_vs_hounds_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Pox Hounds" end),
	create_template("curio_traits16_ext_fr", {"loc_trait_gadget_dr_vs_hounds_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." de resistance aux "..COLORS_KWords_fr.Damage_rgb_fr.." (Cerdères vérolés)" end),
		--[+ +Damage Resistance vs Mutants +]--
	create_template("curio_traits17_ext_en", {"loc_trait_gadget_dr_vs_mutants_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Mutants" end),
	create_template("curio_traits17_ext_fr", {"loc_trait_gadget_dr_vs_mutants_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." de resistance aux "..COLORS_KWords_fr.Damage_rgb_fr.." (Mutants)" end),
		--[+ +Damage Resistance vs Snipers +]--
	create_template("curio_traits18_ext_en", {"loc_trait_gadget_dr_vs_snipers_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Snipers" end),
	create_template("curio_traits18_ext_fr", {"loc_trait_gadget_dr_vs_snipers_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." de resistance aux "..COLORS_KWords_fr.Damage_rgb_fr.." (Snipers)" end),
		--[+ +Damage Resistance vs Poxbursters +]--
	create_template("curio_traits19_ext_en", {"loc_trait_gadget_dr_vs_bursters_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Poxbursters" end),
	create_template("curio_traits19_ext_fr", {"loc_trait_gadget_dr_vs_bursters_desc"}, {"fr"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." de resistance aux "..COLORS_KWords_fr.Damage_rgb_fr.." (Poxbursters)" end),
}

			-- ============ DO NOT DO ANYTHING ABOVE! ============ --



--[+ Reload localization templates when the mod is enabled or disabled +]--
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

--[+ Return the localization templates +]--
return localization_templates
