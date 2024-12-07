---@diagnostic disable: undefined-global
local mod = get_mod("Enhanced_descriptions")

--[+ Loading colors of Keywords and Numbers +]--
COLORS_KWords = mod:io_dofile("Enhanced_descriptions/COLORS_KWords")
COLORS_Numbers = mod:io_dofile("Enhanced_descriptions/COLORS_Numbers")

--[+ Function to create a localization template +]--
local function create_template(id, loc_keys, locales, handle_func)
    return { id = id, loc_keys = loc_keys, locales = locales, handle_func = handle_func }
end

--[+ Define localization templates +]--
local localization_templates = {
    --[+ Fixes and overhauls by xsSplater +]--
    -- create_template("your_edit_id ", {"loc_TALENT_CODE"}, {"localization en|ru|zh-cn|ja|..."}, function(locale, value) return "NAME OR DESCRIPTION HERE" end),

--[+ +CURIOS+ +]--
    --[+ Blessings +]--
	create_template("curio_bless0_ext_en", {"loc_inate_gadget_health_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_maxhlth_rgb.." Maximum "..COLORS_KWords.Health_rgb end),
	create_template("curio_bless1_ext_en", {"loc_inate_gadget_health_segment_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_maxwnds_rgb.." "..COLORS_KWords.Wound_rgb end),
	create_template("curio_bless2_ext_en", {"loc_inate_gadget_stamina_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_maxstam_rgb.." Maximum "..COLORS_KWords.Stamina_rgb end),
	create_template("curio_bless3_ext_en", {"loc_inate_gadget_toughness_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_maxtghns_rgb.." "..COLORS_KWords.Toughness_rgb end),

    --[+ Traits +]--
	create_template("curio_traits0_ext_en", {"loc_gadget_cooldown_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_abil_cd_rgb.." "..COLORS_KWords.Combat_ability_rgb.." Regeneration" end),
	create_template("curio_traits1_ext_en", {"loc_gadget_corruption_resistance_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_corr_rgb.." "..COLORS_KWords.Corruption_rgb.." Resistance" end),
	create_template("curio_traits2_ext_en", {"loc_gadget_grim_corruption_resistance_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_corrgrm_rgb.." "..COLORS_KWords.Corruption_rgb.." Resistance from Grimoires" end),
	create_template("curio_traits3_ext_en", {"loc_trait_gadget_health_increase_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_maxhlth_rgb.." Maximum "..COLORS_KWords.Health_rgb end),
	create_template("curio_traits4_ext_en", {"loc_gadget_block_cost_reduction_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_blckcst_rgb.." Block Cost Reduction" end),
	create_template("curio_traits5_ext_en", {"loc_gadget_sprint_cost_reduction_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.m_bcm_rgb.." "..COLORS_KWords.Stamina_rgb.." Cost for Sprinting" end),
	create_template("curio_traits6_ext_en", {"loc_gadget_revive_speed_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_revive_rgb.." Ally Revive Speed" end),
	create_template("curio_traits7_ext_en", {"loc_gadget_stamina_regeneration_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_stamreg_rgb.." "..COLORS_KWords.Stamina_rgb.." Regeneration" end),
	create_template("curio_traits8_ext_en", {"loc_trait_gadget_toughness_increase_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_maxtghns_rgb.." "..COLORS_KWords.Toughness_rgb end),
	create_template("curio_traits9_ext_en", {"loc_gadget_toughness_regen_delay_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_tghn_reg_del_rgb.." "..COLORS_KWords.Toughness_rgb.." Regeneration Speed" end),
	create_template("curio_traits10_ext_en", {"loc_trait_gadget_mission_xp_increase_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_xp_rgb.." Experience" end),
	create_template("curio_traits11_ext_en", {"loc_trait_gadget_mission_credits_increase_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_credits_rgb.." Ordo Dockets" end),
	create_template("curio_traits12_ext_en", {"loc_trait_gadget_mission_reward_gear_instead_of_weapon_increase_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_gears_rgb.." chance of Curio as Mission Reward instead of Weapon" end),
	create_template("curio_traits13_ext_en", {"loc_trait_gadget_dr_vs_flamer_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Flamers" end),
	create_template("curio_traits14_ext_en", {"loc_trait_gadget_dr_vs_grenadiers_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Bombers" end),
	create_template("curio_traits15_ext_en", {"loc_trait_gadget_dr_vs_gunners_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Gunners" end),
	create_template("curio_traits16_ext_en", {"loc_trait_gadget_dr_vs_hounds_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Pox Hounds" end),
	create_template("curio_traits17_ext_en", {"loc_trait_gadget_dr_vs_mutants_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Mutants" end),
	create_template("curio_traits18_ext_en", {"loc_trait_gadget_dr_vs_snipers_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Snipers" end),
	create_template("curio_traits19_ext_en", {"loc_trait_gadget_dr_vs_bursters_desc"}, {"en"}, function(locale, value) return COLORS_Numbers.p_dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Poxbursters" end),
}

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
