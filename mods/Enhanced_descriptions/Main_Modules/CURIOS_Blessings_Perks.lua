---@diagnostic disable: undefined-global
-- Version 4.0

local mod = get_mod("Enhanced_descriptions")

--[+ Loading colors of Keywords and Numbers +]--
local COLORS_Numbers = mod:io_dofile("Enhanced_descriptions/Colors_Keywords_Numbers/COLORS_Numbers")
local COLORS_KWords = mod:io_dofile("Enhanced_descriptions/Colors_Keywords_Numbers/COLORS_KWords")

	--[+ French +]--
local COLORS_KWords_fr = mod:io_dofile("Enhanced_descriptions/Colors_Keywords_Numbers/COLORS_KWords_fr")
	--[+ Russian +]--
local COLORS_KWords_ru = mod:io_dofile("Enhanced_descriptions/Colors_Keywords_Numbers/COLORS_KWords_ru")
	--[+ Traditional Chinese +]--
local COLORS_KWords_tw = mod:io_dofile("Enhanced_descriptions/Colors_Keywords_Numbers/COLORS_KWords_tw")
	--[+ Simplified Chinese +]--
local COLORS_KWords_zh_cn = mod:io_dofile("Enhanced_descriptions/Colors_Keywords_Numbers/COLORS_KWords_zh_cn")

--[+ Function to create a localization template +]--
local function create_template(id, loc_keys, locales, handle_func)
	return { id = id, loc_keys = loc_keys, locales = locales, handle_func = handle_func }
end

--[+ Getting rid of repeating parts: function(locale, value) return ... end +]--
local function loc_text(text)
	return function(locale, value) 
		return text 
	end
end


local curios_localizations = {
-- TEMPLATE
	-- ["loc_code"] = {
		-- en = "",
		-- ru = "",
		-- fr = "",
		-- ["zh-tw"] = "",
		-- ["zh-cn"] = "",
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	-- },

--[+ ++CURIOS - РЕЛИКВИИ - 珍品++ +]--
--[+ +BLESSINGS - БЛАГОСЛОВЕНИЯ - 祝福+ +]--
	--[+ Health +]--
	["loc_inate_gadget_health_desc"] = { 
		en = COLORS_Numbers.maxhlth_rgb.." Maximum "..COLORS_KWords.Health_rgb,
		ru = COLORS_Numbers.maxhlth_rgb.." к максимальному "..COLORS_KWords_ru.Health_rgb_ru, -- Здоровье
		fr = COLORS_Numbers.maxhlth_rgb.." de "..COLORS_KWords_fr.Health_rgb_fr.." Maximum",
		["zh-tw"] = COLORS_Numbers.maxhlth_rgb.." "..COLORS_KWords_tw.Health_m_rgb_tw, -- 生命
		["zh-cn"] = COLORS_Numbers.maxhlth_rgb.." 最大"..COLORS_KWords_zh_cn.Health_rgb_zh_cn,
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Wound +]--
	["loc_inate_gadget_health_segment_desc"] = { 
		en = COLORS_Numbers.maxwnds_rgb.." "..COLORS_KWords.Wound_rgb,
		ru = COLORS_Numbers.maxwnds_rgb.." сегмент полоски "..COLORS_KWords_ru.Wound_rgb_ru, -- Рана -- Сегмент здоровья
		fr = COLORS_Numbers.maxwnds_rgb.."  "..COLORS_KWords_fr.Wound_rgb_fr,
		["zh-tw"] = COLORS_Numbers.maxwnds_rgb.." "..COLORS_KWords_tw.Wound_rgb_tw, -- 傷口
		["zh-cn"] = COLORS_Numbers.maxwnds_rgb.." "..COLORS_KWords_zh_cn.Wound_rgb_zh_cn,
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Stamina +]--
	["loc_inate_gadget_stamina_desc"] = { 
		en = COLORS_Numbers.maxstam_rgb.." Maximum "..COLORS_KWords.Stamina_rgb,
		ru = COLORS_Numbers.maxstam_rgb.." к максимальной "..COLORS_KWords_ru.Stamina_rgb_ru, -- Выносливость
		fr = COLORS_Numbers.maxstam_rgb.." d'"..COLORS_KWords_fr.Stamina_rgb_fr.." Maximum",
		["zh-tw"] = COLORS_Numbers.maxstam_rgb.." "..COLORS_KWords_tw.Stamina_m_rgb_tw, -- 耐力
		["zh-cn"] = COLORS_Numbers.maxstam_rgb.." 最大"..COLORS_KWords_zh_cn.Stamina_rgb_zh_cn,
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Toughness +]--
	["loc_inate_gadget_toughness_desc"] = { 
		en = COLORS_Numbers.maxtghns_rgb.." "..COLORS_KWords.Toughness_rgb,
		ru = COLORS_Numbers.maxtghns_rgb.." к максимальной "..COLORS_KWords_ru.Toughness_rgb_ru, -- Стойкость
		fr = COLORS_Numbers.maxtghns_rgb.." de "..COLORS_KWords_fr.Toughness_rgb_fr,
		["zh-tw"] = COLORS_Numbers.maxtghns_rgb.." "..COLORS_KWords_tw.Toughness_m_rgb_tw, -- 韌性
		["zh-cn"] = COLORS_Numbers.maxtghns_rgb.." 最大"..COLORS_KWords_zh_cn.Toughness_rgb_zh_cn,
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},

--[+ TRAITS - ХАРАКТЕРИСТИКИ +]--
	--[+ Combat Ability Regeneration +]--
	["loc_gadget_cooldown_desc"] = { 
		en = COLORS_Numbers.abil_cd_rgb.." "..COLORS_KWords.Combat_ability_rgb.." Regeneration",
		ru = COLORS_Numbers.abil_cd_rgb.." к восстановлению "..COLORS_KWords_ru.Combat_ability_rgb_ru, -- Восстановление боевой способности
		fr = COLORS_Numbers.abil_cd_rgb.." de régénération du "..COLORS_KWords_fr.Combat_ability_cd_rgb_fr,
		["zh-tw"] = COLORS_Numbers.abil_cd_rgb.." "..COLORS_KWords_tw.Combat_ability_cd_rgb_tw, -- 戰鬥技能冷卻
		["zh-cn"] = COLORS_Numbers.abil_cd_rgb.." "..COLORS_KWords_zh_cn.Combat_ability_rgb_zh_cn.."回复",
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Corruption Resistance +]--
	["loc_gadget_corruption_resistance_desc"] = { 
		en = COLORS_Numbers.corr_rgb.." "..COLORS_KWords.Corruption_rgb.." Resistance",
		ru = COLORS_Numbers.corr_rgb.." к сопротивлению "..COLORS_KWords_ru.Corruption_rgb_ru, -- Сопротивление порче
		fr = COLORS_Numbers.corr_rgb.." de résistance à la "..COLORS_KWords_fr.Corruption_rgb_fr,
		["zh-tw"] = COLORS_Numbers.corr_rgb.." "..COLORS_KWords_tw.Corruption_rgb_tw.." 抗性", -- 腐敗抗性
		["zh-cn"] = COLORS_Numbers.corr_rgb.." "..COLORS_KWords_zh_cn.Corruption_rgb_zh_cn.."抗性",
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Corruption Resistance from Grimoires +]--
	["loc_gadget_grim_corruption_resistance_desc"] = { 
		en = COLORS_Numbers.corrgrm_rgb.." "..COLORS_KWords.Corruption_rgb.." Resistance from Grimoires",
		ru = COLORS_Numbers.corrgrm_rgb.." к сопротивлению "..COLORS_KWords_ru.Corruption_rgb_ru.." от гримуаров", -- Сопротивление порче от гримуаров
		fr = COLORS_Numbers.corrgrm_rgb.." de résistance à la "..COLORS_KWords_fr.Corruption_rgb_fr.." (Grimoires)",
		["zh-tw"] = COLORS_Numbers.corrgrm_rgb.." "..COLORS_KWords_tw.Corruption_rgb_tw.." 抗性(法術書)", -- 腐敗抗性(法術書)
		["zh-cn"] = COLORS_Numbers.corrgrm_rgb.." "..COLORS_KWords_zh_cn.Corruption_rgb_zh_cn.."抗性 (魔法书)",
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Health +]--
	["loc_trait_gadget_health_increase_desc"] = { 
		en = COLORS_Numbers.maxhlth_rgb.." Maximum "..COLORS_KWords.Health_rgb,
		ru = COLORS_Numbers.maxhlth_rgb.." к максимальному "..COLORS_KWords_ru.Health_rgb_ru, -- Здоровье
		fr = COLORS_Numbers.maxhlth_rgb.." de "..COLORS_KWords_fr.Health_rgb_fr.." maximum",
		["zh-tw"] = COLORS_Numbers.maxhlth_rgb.." "..COLORS_KWords_tw.Health_m_rgb_tw, -- 生命
		["zh-cn"] = COLORS_Numbers.maxhlth_rgb.." 最大"..COLORS_KWords_zh_cn.Health_rgb_zh_cn,
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Block Cost Reduction +]--
	["loc_gadget_block_cost_reduction_desc"] = { 
		en = COLORS_Numbers.blckcst_rgb.." Block Cost Reduction",
		ru = COLORS_Numbers.blckcst_rgb.." к снижение стоимости блока", -- Снижение стоимости блока
		fr = COLORS_Numbers.blckcst_rgb.." d'éfficacité de blocage",
		["zh-tw"] = COLORS_Numbers.blckcst_rgb.." 格擋消耗", -- 格擋消耗
		["zh-cn"] = COLORS_Numbers.blckcst_rgb.." 格挡效益",
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Ally Revive Speed +]--
	["loc_gadget_revive_speed_desc"] = { 
		en = COLORS_Numbers.revive_rgb.." Ally Revive Speed",
		ru = COLORS_Numbers.revive_rgb.." к скорости возрождения союзников", -- Скорость возрождения союзников
		fr = COLORS_Numbers.revive_rgb.." de vitesse de réanimation des alliés",
		["zh-tw"] = COLORS_Numbers.revive_rgb.." 復活速度 (盟友)", -- 復活速度
		["zh-cn"] = COLORS_Numbers.revive_rgb.." 复活速度 (盟友)",
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Stamina Regeneration +]--
	["loc_gadget_stamina_regeneration_desc"] = { 
		en = COLORS_Numbers.stamreg_rgb.." "..COLORS_KWords.Stamina_rgb.." Regeneration",
		ru = COLORS_Numbers.stamreg_rgb.." к восстановлению "..COLORS_KWords_ru.Stamina_rgb_ru, -- Восстановление выносливости
		fr = COLORS_Numbers.stamreg_rgb.." de régénération d'"..COLORS_KWords_fr.Stamina_rgb_fr,
		["zh-tw"] = COLORS_Numbers.stamreg_rgb.." "..COLORS_KWords_tw.Stamina_rgb_tw.." 恢復", -- 精力回復
		["zh-cn"] = COLORS_Numbers.stamreg_rgb.." "..COLORS_KWords_zh_cn.Stamina_rgb_zh_cn.."回复",
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Toughness +]--
	["loc_trait_gadget_toughness_increase_desc"] = { 
		en = COLORS_Numbers.maxtghns_rgb.." "..COLORS_KWords.Toughness_rgb,
		ru = COLORS_Numbers.maxtghns_rgb.." "..COLORS_KWords_ru.Toughness_rgb_ru, -- Стойкость
		fr = COLORS_Numbers.maxtghns_rgb.." de "..COLORS_KWords_fr.Toughness_rgb_fr,
		["zh-tw"] = COLORS_Numbers.maxtghns_rgb.." "..COLORS_KWords_tw.Toughness_m_rgb_tw, -- 韌性
		["zh-cn"] = COLORS_Numbers.maxtghns_rgb.." 最大"..COLORS_KWords_zh_cn.Toughness_rgb_zh_cn,
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Toughness Regeneration Speed +]--
	["loc_gadget_toughness_regen_delay_desc"] = { 
		en = COLORS_Numbers.tghn_reg_del_rgb.." "..COLORS_KWords.Toughness_rgb.." Regeneration Speed",
		ru = COLORS_Numbers.tghn_reg_del_rgb.." к скорости восстановления "..COLORS_KWords_ru.Toughness_rgb_ru, -- Скорость восстановления стойкости
		fr = COLORS_Numbers.tghn_reg_del_rgb.." de vitesse de régénération de "..COLORS_KWords_fr.Toughness_rgb_fr.." de syntonie",
		["zh-tw"] = COLORS_Numbers.tghn_reg_del_rgb.." "..COLORS_KWords_tw.Toughness_rs_rgb_tw, -- 韌性恢復
		["zh-cn"] = COLORS_Numbers.tghn_reg_del_rgb.." "..COLORS_KWords_zh_cn.Toughness_rgb_zh_cn.."回复速度",
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Experience +]--
	["loc_trait_gadget_mission_xp_increase_desc"] = { 
		en = COLORS_Numbers.xp_rgb.." Experience",
		ru = COLORS_Numbers.xp_rgb.." к опыту", -- Опыт
		fr = COLORS_Numbers.xp_rgb.." d'expérience",
		["zh-tw"] = COLORS_Numbers.xp_rgb.." 經驗", -- 經驗
		["zh-cn"] = COLORS_Numbers.xp_rgb.." 经验",
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Ordo +]--
	["loc_trait_gadget_mission_credits_increase_desc"] = { 
		en = COLORS_Numbers.credits_rgb.." Ordo Dockets",
		ru = COLORS_Numbers.credits_rgb.." купонов ордо", -- Монеты
		fr = COLORS_Numbers.credits_rgb.." bordereaux de l'Ordo (récompenses de mission)",
		["zh-tw"] = COLORS_Numbers.credits_rgb.." 教團標籤 (任務獎勵)", -- 教團標籤
		["zh-cn"] = COLORS_Numbers.credits_rgb.." 审判庭双子币 （任务奖励）",
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Curio as Mission Reward instead of Weapon +]--
	["loc_trait_gadget_mission_reward_gear_instead_of_weapon_increase_desc"] = { 
		en = COLORS_Numbers.gears_rgb.." chance of Curio as Mission Reward instead of Weapon",
		ru = COLORS_Numbers.gears_rgb.." шанс получить редкость вместо оружия в награду", -- Редкость в награду
		fr = COLORS_Numbers.gears_rgb.." de chance d'obtenir une curiosité comme récompense à la place d'une arme",
		["zh-tw"] = COLORS_Numbers.gears_rgb.." 機率獲得珍品作為任務獎勵(非武器)", -- 獎勵中獲得珍品
		["zh-cn"] = COLORS_Numbers.gears_rgb.." 以珍品作为任务奖励 （而非武器） 的几率",
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Damage Resistance vs Flamers +]--
	["loc_trait_gadget_dr_vs_flamer_desc"] = { 
		en = COLORS_Numbers.dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Flamers",
		ru = COLORS_Numbers.dmg_red_rgb.." сопротивления "..COLORS_KWords_ru.Damage_rgb_ru.." от Огнемётчиков", -- Сопротивление урону от огнемётчиков
		fr = COLORS_Numbers.dmg_red_rgb.." de resistance aux "..COLORS_KWords_fr.Damage_rgb_fr.." (Incendiaires, Incendiaires toxiques) ",
		["zh-tw"] = COLORS_Numbers.dmg_red_rgb.." "..COLORS_KWords_tw.Damage_res_rgb_tw.." (毒焰噴射者)", -- 傷害抗性(火焰噴射者)
		["zh-cn"] = COLORS_Numbers.dmg_red_rgb.." "..COLORS_KWords_zh_cn.Damage_rgb_zh_cn.."抗性（火焰兵）",
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Damage Resistance vs Bombers +]--
	["loc_trait_gadget_dr_vs_grenadiers_desc"] = { 
		en = COLORS_Numbers.dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Bombers",
		ru = COLORS_Numbers.dmg_red_rgb.." сопротивления "..COLORS_KWords_ru.Damage_rgb_ru.." от Гренадёров", -- Сопротивление урону от взрывников
		fr = COLORS_Numbers.dmg_red_rgb.." de resistance aux "..COLORS_KWords_fr.Damage_rgb_fr.." (Bombardiers)",
		["zh-tw"] = COLORS_Numbers.dmg_red_rgb.." "..COLORS_KWords_tw.Damage_res_rgb_tw.." (轟炸者)", -- 傷害抗性(轟炸者)
		["zh-cn"] = COLORS_Numbers.dmg_red_rgb.." "..COLORS_KWords_zh_cn.Damage_rgb_zh_cn.."抗性（轰炸者）",
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Damage Resistance vs Gunners +]--
	["loc_trait_gadget_dr_vs_gunners_desc"] = { 
		en = COLORS_Numbers.dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Gunners",
		ru = COLORS_Numbers.dmg_red_rgb.." сопротивления "..COLORS_KWords_ru.Damage_rgb_ru.." от Пулемётчиков", -- Сопротивление урону от пулемётчиков
		fr = COLORS_Numbers.dmg_red_rgb.." de resistance aux "..COLORS_KWords_fr.Damage_rgb_fr.." (Mitrailleurs)",
		["zh-tw"] = COLORS_Numbers.dmg_red_rgb.." "..COLORS_KWords_tw.Damage_res_rgb_tw.." (砲手)", -- 傷害抗性(砲手)
		["zh-cn"] = COLORS_Numbers.dmg_red_rgb.." "..COLORS_KWords_zh_cn.Damage_rgb_zh_cn.."抗性（炮手）",
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Damage Resistance vs Pox Hounds +]--
	["loc_trait_gadget_dr_vs_hounds_desc"] = { 
		en = COLORS_Numbers.dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Pox Hounds",
		ru = COLORS_Numbers.dmg_red_rgb.." сопротивления "..COLORS_KWords_ru.Damage_rgb_ru.." от Чумных гончих", -- Сопротивление урону от чумных гончих
		fr = COLORS_Numbers.dmg_red_rgb.." de resistance aux "..COLORS_KWords_fr.Damage_rgb_fr.." (Cerdères vérolés)",
		["zh-tw"] = COLORS_Numbers.dmg_red_rgb.." "..COLORS_KWords_tw.Damage_res_rgb_tw.." (瘟疫獵犬)", -- 傷害抗性(瘟疫獵犬)
		["zh-cn"] = COLORS_Numbers.dmg_red_rgb.." "..COLORS_KWords_zh_cn.Damage_rgb_zh_cn.."抗性（瘟疫猎犬）",
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Damage Resistance vs Mutants +]--
	["loc_trait_gadget_dr_vs_mutants_desc"] = { 
		en = COLORS_Numbers.dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Mutants",
		ru = COLORS_Numbers.dmg_red_rgb.." сопротивления "..COLORS_KWords_ru.Damage_rgb_ru.." от Мутантов", -- Сопротивление урону от мутантов
		fr = COLORS_Numbers.dmg_red_rgb.." de resistance aux "..COLORS_KWords_fr.Damage_rgb_fr.." (Mutants)",
		["zh-tw"] = COLORS_Numbers.dmg_red_rgb.." "..COLORS_KWords_tw.Damage_res_rgb_tw.." (變種人)", -- 傷害抗性(變種人)
		["zh-cn"] = COLORS_Numbers.dmg_red_rgb.." "..COLORS_KWords_zh_cn.Damage_rgb_zh_cn.."抗性（变种人）", -- 伤害抗性（变种人）
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},
	--[+ Damage Resistance vs Snipers +]--
	["loc_trait_gadget_dr_vs_snipers_desc"] = { 
		en = COLORS_Numbers.dmg_red_rgb.." "..COLORS_KWords.Damage_rgb.." Resistance vs Snipers",
		ru = COLORS_Numbers.dmg_red_rgb.." сопротивления "..COLORS_KWords_ru.Damage_rgb_ru.." от Снайперов", -- Сопротивление урону от снайперов
		fr = COLORS_Numbers.dmg_red_rgb.." de resistance aux "..COLORS_KWords_fr.Damage_rgb_fr.." (Snipers)",
		["zh-tw"] = COLORS_Numbers.dmg_red_rgb.." "..COLORS_KWords_tw.Damage_res_rgb_tw.." (狙擊手)", -- 傷害抗性(狙擊手)
		["zh-cn"] = COLORS_Numbers.dmg_red_rgb.." "..COLORS_KWords_zh_cn.Damage_rgb_zh_cn.."抗性（狙击手）", -- 伤害抗性（狙击手）
		-- de = "",
		-- it = "",
		-- ja = "",
		-- ko = "",
		-- pl = "",
		-- ["pt-br"] = "",
		-- es = "",
	},

-- DUPLICATE!!! THERE IS THE SAME IN WEAPONS_Blessings_Perks.lua
	--[+ Stamina Cost for Sprinting +]--
	-- ["loc_gadget_sprint_cost_reduction_desc"] = { 
		-- en = COLORS_Numbers.bcm_rgb.." "..COLORS_KWords.Stamina_rgb.." Cost for Sprinting",
		-- ru = COLORS_Numbers.bcm_rgb.." к затратам "..COLORS_KWords_ru.Stamina_rgb_ru.." на бег", -- Затраты выносливости на бег
		-- fr = COLORS_Numbers.bcm_rgb.." de coût d'"..COLORS_KWords_fr.Stamina_rgb_fr.." de la course",
	-- },
}

--[+ Automatically create templates from the new structure +]--
local localization_templates = {}
for loc_key, locales in pairs(curios_localizations) do
	for locale, text in pairs(locales) do
		table.insert(localization_templates, {
			loc_keys = {loc_key},
			locales = {locale},
			handle_func = loc_text(text)
		})
	end
end

mod:info("CURIOS_Blessings_Perks.lua loaded successfully")

return localization_templates
