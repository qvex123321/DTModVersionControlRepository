local mod = get_mod("LoadoutMonitor")
local locr = {	
	mod_name = {
		en = "Loadout Monitor",
		["zh-cn"] = "配置监控器",
	},
	lobby_exhibition = {
		en = "In lobby",
		["zh-cn"] = "在准备大厅中",
	},
	lobby_exhibition_weapons = {
		en = "Display weapons",
		["zh-cn"] = "显示武器",
	},
	lobby_exhibition_Keystone = {
		en = "Display Keystone",
		["zh-cn"] = "显示基石",
	},
	lobby_exhibition_feats = {
		en = "Display feats",
		["zh-cn"] = "显示天赋",
	},
	lobby_weapon_font_size = {
		en = "Font size",
		["zh-cn"] = "字体大小",
	},
	lobby_weapon_offset = {
		en = "Offset Y",
		["zh-cn"] = "Y轴",
	},
	lobby_weapon_gap = {
		en = "Line space",
		["zh-cn"] = "间距",
	},
	setting_player_name_group = {
		en = "Player Name",
		["zh-cn"] = "玩家名",
	},
	display_player_name = {
		en = "Player Name",
		["zh-cn"] = "玩家名",
	},
	display_companion_name = {
		en = "Dog Name",
		["zh-cn"] = "伙伴名",
	},
	setting_offset_x = {
		en = "Offset X",
		["zh-cn"] = "X轴",
	},
	setting_offset_y = {
		en = "Offset Y",
		["zh-cn"] = "Y轴",
	},
	setting_player_feats_group = {
		en = "Feats",
		["zh-cn"] = "天赋",
	},
	setting_player_notable_talents = {
		en = "Notable talents",
		["zh-cn"] = "特别天赋",
	},
	display_notable_talents = {
		en = "Display notable talents",
		["zh-cn"] = "特别天赋",
	},
	notable_talents_intensity = {
		en = "Intensity",
		["zh-cn"] = "亮度",
	},
	setting_player_class_group = {
		en = "Class",
		["zh-cn"] = "职业",
	},
	display_main_class = {
		en = "Display main class",
		["zh-cn"] = "主职业显示",
	},
	by_name = {
		en = "By class name",
		["zh-cn"] = "以职业名",
	},
	by_symbol = {
		en = "By class symbol",
		["zh-cn"] = "以职业符号",
	},
	by_both = {
		en = "Both",
		["zh-cn"] = "全部",
	},
	setting_hide = {
		en = "Hide",
		["zh-cn"] = "隐藏",
	},
	setting_display = {
		en = "Display",
		["zh-cn"] = "显示",
	},
	display_sub_class = {
		en = "Display sub class",
		["zh-cn"] = "显示子职业",
	},
	user_weapon_name_size = {
		en = "Font size",
		["zh-cn"] = "字体大小",
	},
	setting_font_size = {
		en = "Font size",
		["zh-cn"] = "字体大小",
	},
	setting_icon_size = {
		en = "Icon size",
		["zh-cn"] = "图标大小",
	},
	setting_separation = {
		en = "Separation",
		["zh-cn"] = "间距",
	},
	user_bless_offset = {
		en = "Blessing offset adjust",
		["zh-cn"] = "祝福位置偏移",
	},
	user_perk_offset = {
		en = "Perk offset adjust",
		["zh-cn"] = "专长位置偏移",
	},
	setting_weapon_name_group = {
		en = "Weapons",
		["zh-cn"] = "武器",
	},
	user_weapon_name_lenghth = {
		en = "Name lenghth thresh",
		["zh-cn"] = "武器名称长度限制",
	},
	user_weapon_name_lenghth_tip = {
		en = "Decrese font size when weapon name is too long",
		["zh-cn"] = "武器名称过长时缩小字体大小",
	},
	user_weapon_name_multiplier = {
		en = "Over-lenghth name size multiplier(%%)",
		["zh-cn"] = "过长名称缩放（%%）",
	},
	setting_perk_blessing_group = {
		en = "Perk & Blessing",
		["zh-cn"] = "专长与祝福",
	},
	blessing_level_rule = {
		en = "Display blessing level by",
		["zh-cn"] = "祝福等级显示方式",
	},
	perk_level_rule = {
		en = "Display perk level by",
		["zh-cn"] = "专长等级显示方式",
	},
	by_number = {
		en = "Number",
		["zh-cn"] = "数字",
	 },
	by_color = {
		en = "Color",
		["zh-cn"] = "颜色",
	},
	by_character = {
		en = "Character",
		["zh-cn"] = "字符",
	},
	setting_other_group = {
		en = "Other",
		["zh-cn"] = "其它",
	},
	left_panel_lift = {
		en = "Tactical overlay lifting",
		["zh-cn"] = "战术面板抬升",
	},
	left_panel_lift_tip = {
		en = "Lift mission name & danger level panel to work better with mods such as contracts overlay",
		["zh-cn"] = "抬升任务名&危险等级区域，以适配如Contracts Overlay一类的MOD",
	},
	echo_team_loadout_brief = {
		en = "Give a brief about equipped weapons",
		["zh-cn"] = "提供全队武器简报",
	},
	-- Perks or blessings
	-- Some of them may not available in game yet
	trait_weapon_trait_increase_power = {
		en = "PWR ", -- Power
		["zh-cn"] = "能量", -- 伤害与踉跄效果
	},
	trait_gadget_damage_reduction_vs_flamers = {
		en = "FLAM", -- Damage Resistance (Tox Flamers)
		["zh-cn"] = "火兵", -- 伤害抗性（剧毒火焰兵）
	},
	trait_gadget_damage_reduction_vs_mutants = {
		en = "MUTN", -- Damage Resistance (Mutants)
		["zh-cn"] = "变种", -- 伤害抗性（变种人）
	},
	trait_gadget_damage_reduction_vs_gunners = {
		en = "GUNR", -- Damage Resistance (Gunners)
		["zh-cn"] = "炮手", -- 伤害抗性（炮手）
	},
	trait_gadget_damage_reduction_vs_snipers = {
		en = "SNPR", -- Damage Resistance (Snipers)
		["zh-cn"] = "狙击", -- 伤害抗性（狙击手）
	},
	trait_gadget_damage_reduction_vs_bombers = {
		en = "BRST", -- Damage Resistance (Poxbursters).
		["zh-cn"] = "自爆", -- 伤害抗性（瘟疫爆者）。
	},
	trait_gadget_damage_reduction_vs_hounds = {
		en = "HOND", -- Damage Resistance (Pox Hounds)
		["zh-cn"] = "猎犬", -- 伤害抗性（瘟疫猎犬）
	},
	trait_gadget_damage_reduction_vs_grenadiers = {
		en = "BMBR", -- Damage Resistance (Bombers)
		["zh-cn"] = "雷兵", -- 伤害抗性（轰炸者）
	},
	trait_weapon_trait_melee_common_wield_increased_resistant_damage = {
		en = "UYLD", -- Damage (Unyielding Enemies)
		["zh-cn"] = "不屈", -- 伤害（不屈敌人）
	},
	trait_weapon_trait_melee_common_wield_increased_disgustingly_resilient_damage = {
		en = "IFST", -- Damage (Infested Enemies)
		["zh-cn"] = "感染", -- 伤害（感染敌人）
	},
	trait_weapon_trait_melee_common_wield_increased_unarmored_damage = {
		en = "UAMR", -- Damage (Unarmoured Enemies)
		["zh-cn"] = "无甲", -- 伤害（无甲敌人）
	},
	trait_weapon_trait_melee_common_wield_increased_berserker_damage = {
		en = "MNAC", -- Damage (Maniacs)
		["zh-cn"] = "狂人", -- 伤害（狂人）
	},
	trait_weapon_trait_melee_common_wield_increased_super_armor_damage = {
		en = "CRPC", -- Damage (Carapace Armoured Enemies)
		["zh-cn"] = "硬壳", -- 伤害（硬壳装甲敌人）
	},
	trait_weapon_trait_melee_common_wield_increased_armored_damage = {
		en = "FLAK", -- Damage (Flak Armoured Enemies)
		["zh-cn"] = "防弹", -- 伤害（防弹装甲敌人）
	},
	trait_weapon_trait_ranged_common_wield_increased_resistant_damage = {
		en = "UYLD", -- Damage (Unyielding Enemies)
		["zh-cn"] = "不屈", -- 伤害（不屈敌人）
	},
	trait_weapon_trait_ranged_common_wield_increased_disgustingly_resilient_damage = {
		en = "IFST", -- Damage (Infested Enemies)
		["zh-cn"] = "感染", -- 伤害（感染敌人）
	},
	trait_weapon_trait_ranged_common_wield_increased_unarmored_damage = {
		en = "UAMR", -- Damage (Unarmoured Enemies)
		["zh-cn"] = "无甲", -- 伤害（无甲敌人）
	},
	trait_weapon_trait_ranged_common_wield_increased_berserker_damage = {
		en = "MNAC", -- Damage (Maniacs)
		["zh-cn"] = "狂人", -- 伤害（狂人）
	},
	trait_weapon_trait_ranged_common_wield_increased_super_armor_damage = {
		en = "CRPC", -- Damage (Carapace Armoured Enemies)
		["zh-cn"] = "硬壳", -- 伤害（硬壳装甲敌人）
	},
	trait_weapon_trait_ranged_common_wield_increased_armored_damage = {
		en = "FLAK", -- Damage (Flak Armoured Enemies)
		["zh-cn"] = "防弹", -- 伤害（防弹装甲敌人）
	},
	trait_weapon_trait_increase_stamina = {
		en = "STAM", -- Stamina
		["zh-cn"] = "体力", -- 体力
	},
	trait_gadget_stamina_regeneration = {
		en = "STRG", -- Stamina Regeneration
		["zh-cn"] = "体回", -- 体力恢复
	},
	trait_gadget_cooldown_reduction = {
		en = "ABRG", -- Combat Ability Regeneration
		["zh-cn"] = "技回", -- 作战技能恢复
	},
	trait_weapon_trait_increase_impact = {
		en = "IMPC", -- Impact (Melee)
		["zh-cn"] = "冲击", -- 冲击（近战）
	},
	trait_gadget_revive_speed_increase = {
		en = "RVIV", -- Revive Speed (Ally)
		["zh-cn"] = "友活", -- 复活速度（盟友）
	},
	trait_gadget_mission_credits_increase = {
		en = "ODKT", -- Ordo Dockets (Mission Rewards)
		["zh-cn"] = "金币", -- 审判庭双子币（任务奖励）
	},
	trait_gadget_mission_reward_gear_instead_of_weapon_increase = {
		en = "CURO", -- Chance of Curio as Mission Reward (instead of Weapon)
		["zh-cn"] = "珍品", -- 以珍品作为任务奖励（而非武器）的几率
	},
	trait_gadget_stamina_increase = {
		en = "STAM", -- Max Stamina
		["zh-cn"] = "体力", -- 最大体力
		ja = "活力", -- 最大スタミナ
		ru = "ВНСЛ", -- Выносливость
	},
	trait_gadget_inate_health_increase = {
		en = "HP", -- Max Health
		["zh-cn"] = "生命", -- 最大生命值
		ja = "体力", -- 最大ヘルス
		ru = "ЗДОР", -- Здоровье
	},
	trait_gadget_health_increase = {
		en = "HP", -- Max Health
		["zh-cn"] = "生命", -- 最大生命值
	},
	trait_gadget_block_cost_reduction = {
		en = "BLK ", -- Block Efficiency
		["zh-cn"] = "格挡", -- 格挡效益
	},
	trait_weapon_trait_reduced_block_cost = {
		en = "BLK ", -- Block Efficiency
		["zh-cn"] = "格挡", -- 格挡效益
	},
	trait_weapon_trait_increase_finesse = {
		en = "FNS ", -- Finesse
		["zh-cn"] = "娴熟", -- 武器娴熟
	},
	trait_gadget_inate_max_wounds_increase = {
		en = "WND ", -- Wound(s)
		["zh-cn"] = "伤口", -- 生命格
		ja = "傷口", -- 傷口
		ru = "РАНЫ", -- Дополнительные раны
	},
	trait_weapon_trait_reduce_sprint_cost = {
		en = "SPRT", -- Sprint Efficiency
		["zh-cn"] = "疾跑", -- 疾跑效益
	},
	trait_gadget_sprint_cost_reduction = {
		en = "SPRT", -- Sprint Efficiency
		["zh-cn"] = "疾跑", -- 疾跑效益
	},
	trait_gadget_mission_xp_increase = {
		en = "EXP ", -- Experience
		["zh-cn"] = "经验", -- 经验
	},
	trait_gadget_corruption_resistance = {
		en = "CRPT", -- Corruption Resistance
		["zh-cn"] = "腐抗", -- 腐化抗性
	},
	trait_gadget_permanent_damage_resistance = {
		en = "GRIM", -- Corruption Resistance (Grimoires)
		["zh-cn"] = "书抗", -- 腐化抗性（魔法书）
	},
	trait_weapon_trait_ranged_increased_reload_speed = {
		en = "RLD ", -- Reload Speed
		["zh-cn"] = "装弹", -- 装弹速度
	},
	trait_weapon_trait_increase_damage = {
		en = "DMG ", -- Melee Damage
		["zh-cn"] = "伤害", -- 近战伤害
	},
	trait_weapon_trait_increase_damage_specials = {
		en = "SPEC", -- Increased Melee Damage (Specialists)
		["zh-cn"] = "专家", -- 近战伤害加成（专家）
	},
	trait_weapon_trait_increase_damage_hordes = {
		en = "HORD", -- Melee Damage (Groaners, Poxwalkers)
		["zh-cn"] = "群怪", -- 近战伤害（呻吟者、瘟疫行者）
	},
	trait_weapon_trait_increase_damage_elites = {
		en = "ELTE", -- Melee Damage (Elites)
		["zh-cn"] = "精英", -- 近战伤害（精英）
	},
	trait_weapon_trait_increase_weakspot_damage = {
		en = "WEAK", -- Melee Weak Spot Damage
		["zh-cn"] = "弱点", -- 近战弱点伤害
	},
	trait_weapon_trait_increase_attack_speed = {
		en = "ATSP", -- Melee Attack Speed
		["zh-cn"] = "攻速", -- 近战攻击速度
	},
	trait_weapon_trait_increase_crit_damage = {
		en = "CRDM", -- Melee Critical Hit Damage
		["zh-cn"] = "暴伤", -- 近战暴击伤害
	},
	trait_weapon_trait_increase_crit_chance = {
		en = "CRCH", -- Melee Critical Hit Chance
		["zh-cn"] = "暴率", -- 近战暴击几率
	},
	trait_weapon_trait_ranged_increase_damage = {
		en = "DMG ", -- Ranged Damage
		["zh-cn"] = "伤害", -- 远程伤害
	},
	trait_weapon_trait_ranged_increase_damage_specials = {
		en = "SPEC", -- Ranged Damage (Specialists)
		["zh-cn"] = "专家", -- 远程伤害（专家）
	},
	trait_weapon_trait_ranged_increase_damage_hordes = {
		en = "HORD", -- Ranged Damage (Groaners, Poxwalkers)
		["zh-cn"] = "群怪", -- 远程伤害（呻吟者、瘟疫行者）
	},
	trait_weapon_trait_ranged_increase_damage_elites = {
		en = "ELTE", -- Ranged Damage (Elites)
		["zh-cn"] = "精英", -- 远程伤害（精英）
	},
	trait_weapon_trait_ranged_increase_weakspot_damage = {
		en = "WEAK", -- Ranged Weak Spot Damage
		["zh-cn"] = "弱点", -- 远程弱点伤害
	},
	trait_weapon_trait_ranged_increase_crit_damage = {
		en = "CRDM", -- Ranged Critical Hit Damage
		["zh-cn"] = "暴伤", -- 远程暴击伤害
	},
	trait_weapon_trait_ranged_increase_crit_chance = {
		en = "CRCH", -- Increase Ranged Critical Strike Chance
		["zh-cn"] = "暴率", -- 远程暴击几率增加
	},
	trait_gadget_inate_toughness_increase = {
		en = "TN", -- Toughness
		["zh-cn"] = "韧性", -- 韧性
		ja = "靭性", -- 最大タフネス
		ru = "СТЙК", -- Стойкость
	},
	trait_gadget_toughness_increase = {
		en = "TN", -- Toughness
		["zh-cn"] = "韧性", -- 韧性
	},
	trait_gadget_toughness_regen_delay = {
		en = "TNRG", -- Toughness Regeneration Speed
		["zh-cn"] = "韧回", -- 韧性回复速度
	},
	trait_weapon_trait_ranged_increase_stamina = {
		en = "STAM", -- Stamina (Weapon is Active)
		["zh-cn"] = "体力", -- （使用武器时）体力
	},
	
	endview_scoreboard_weapons = {
		en = "Scoreboard: weapons",
		["zh-cn"] = "计分板：武器",
	},
	endview_scoreboard_weapons_perk = {
		en = "Scoreboard: weapon perks",
		["zh-cn"] = "计分板：武器专长",
	},
	endview_scoreboard_weapons_blessing = {
		en = "Scoreboard: weapon blessings",
		["zh-cn"] = "计分板：武器祝福",
	},
	endview_scoreboard_feat = {
		en = "Scoreboard: feats",
		["zh-cn"] = "计分板：天赋",
	},
	endview_scoreboard_blank = {
		en = "Scoreboard: blank",
		["zh-cn"] = "计分板：空行",
	},
	endview_scoreboard = {
		en = "At the end of missions",
		["zh-cn"] = "在任务结算时显示",
	},
	row_scoreboard_weapon_melee = {
		en = "Melee weapon",
		["zh-cn"] = "近战武器",
	},
	row_scoreboard_weapon_range = {
		en = "Range weapon",
		["zh-cn"] = "远程武器",
	},
	row_scoreboard_player_feat = {
		en = "Feats",
		["zh-cn"] = "天赋",
	},
	row_scoreboard_blank = {
		en = " ",
		["zh-cn"] = " ",
	},
	row_scoreboard_perk = {
		en = "Perks",
		["zh-cn"] = "专长",
	},
	row_scoreboard_blessing = {
		en = "Blessings",
		["zh-cn"] = "祝福",
	},
	endview_scoreboard_length = {
		en = "Scoreboard: Row length",
		["zh-cn"] = "计分板：单行长度",
	},
	player_Feats_symbol_Ability = {
		en = "A",
		["zh-cn"] = "技",
	},
	player_Feats_symbol_Blitz = {
		en = "B",
		["zh-cn"] = "闪",
	},
	player_Feats_symbol_Aura = {
		en = "Ar",
		["zh-cn"] = "环",
	},
	player_Feats_symbol_Keystone = {
		en = "K",
		["zh-cn"] = "基",
	},
	setting_Feats_order_Ability = {
		en = "Ability",
		["zh-cn"] = "技能",
	},
	setting_Feats_order_Blitz = {
		en = "Blitz",
		["zh-cn"] = "闪击",
	},
	setting_Feats_order_Aura = {
		en = "Aura",
		["zh-cn"] = "光环",
	},
	setting_Feats_order_Keystone = {
		en = "Keystone",
		["zh-cn"] = "基石",
	},
	player_feats_display_type = {
		en = "Display type",
		["zh-cn"] = "显示方式",
	},
	
	def_veteran_combat_ability_elite_and_special_outlines = {
		en = "ES",		["zh-cn"] = "刽",	},
	def_veteran_combat_ability_stagger_nearby_enemies = {
		en = "VoC",		["zh-cn"] = "令",	},
	def_veteran_invisibility_on_combat_ability = {
		en = "Inf",		["zh-cn"] = "渗",	},
	
	def_veteran_grenade_apply_bleed = {
		en = "F",		["zh-cn"] = "碎",	},
	def_veteran_krak_grenade = {
		en = "K",		["zh-cn"] = "穿",	},
	def_veteran_smoke_grenade = {
		en = "S",		["zh-cn"] = "烟",	},
	
	def_veteran_aura_gain_ammo_on_elite_kill_improved = {
		en = "Amo",		["zh-cn"] = "回",	},
	def_veteran_increased_damage_coherency = {
		en = "Dmg",		["zh-cn"] = "伤",	},
	def_veteran_movement_speed_coherency = {
		en = "Spe",		["zh-cn"] = "速",	},
	
	def_veteran_snipers_focus = {
		en = "MF",		["zh-cn"] = "专",	},
	def_veteran_improved_tag = {
		en = "FT",		["zh-cn"] = "聚",	},
	def_veteran_weapon_switch_passive = {
		en = "WS",		["zh-cn"] = "武",	},
	
	def_zealot_attack_speed_post_ability = {
		en = "FF",		["zh-cn"] = "冲",	},
	def_zealot_bolstering_prayer = {
		en = "CSF",		["zh-cn"] = "祷",	},
	def_zealot_stealth = {
		en = "Sf",		["zh-cn"] = "隐",	},
	
	def_zealot_improved_stun_grenade = {
		en = "S",		["zh-cn"] = "晕",	},
	def_zealot_flame_grenade = {
		en = "I",		["zh-cn"] = "燃",	},
	def_zealot_throwing_knives = {
		en = "B",		["zh-cn"] = "刃",	},
	
	def_zealot_toughness_damage_reduction_coherency_improved = {
		en = "Bene",		["zh-cn"] = "赐",	},
	def_zealot_corruption_healing_coherency_improved = {
		en = "BoP",		["zh-cn"] = "纯",	},
	def_zealot_always_in_coherency = {
		en = "Z",		["zh-cn"] = "孤",	},
	def_zealot_stamina_cost_multiplier_aura = {
		en = "L",		["zh-cn"] = "狂",	},
	
	def_zealot_fanatic_rage = {
		en = "BP",		["zh-cn"] = "炽",	},
	def_zealot_martyrdom = {
		en = "M",		["zh-cn"] = "殉",	},
	def_zealot_quickness_passive = {
		en = "IJ",		["zh-cn"] = "审",	},
	
	def_psyker_shout_vent_warp_charge = {
		en = "VS",		["zh-cn"] = "啸",	},
	def_psyker_combat_ability_force_field = {
		en = "TS",		["zh-cn"] = "盾",	},
	def_psyker_combat_ability_stance = {
		en = "SG",		["zh-cn"] = "凝",	},
	
	def_psyker_brain_burst_improved = {
		en = "B",		["zh-cn"] = "脑",	},
	def_psyker_grenade_chain_lightning = {
		en = "S",		["zh-cn"] = "电",	},
	def_psyker_grenade_throwing_knives = {
		en = "A",		["zh-cn"] = "袭",	},
	
	def_psyker_aura_damage_vs_elites = {
		en = "KP",		["zh-cn"] = "伤",	},
	def_psyker_cooldown_aura_improved = {
		en = "SP",		["zh-cn"] = "回",	},
	def_psyker_aura_crit_chance_aura = {
		en = "Pr",		["zh-cn"] = "暴",	},
	
	def_psyker_passive_souls_from_elite_kills = {
		en = "WP",		["zh-cn"] = "虹",	},
	def_psyker_empowered_ability = {
		en = "EP",		["zh-cn"] = "强",	},
	def_psyker_new_mark_passive = {
		en = "DD",		["zh-cn"] = "命",	},
	
	def_ogryn_longer_charge = {
		en = "I",		["zh-cn"] = "冲",	},
	def_ogryn_taunt_shout = {
		en = "L",		["zh-cn"] = "护",	},
	def_ogryn_special_ammo = {
		en = "P",		["zh-cn"] = "弹",	},
	
	def_ogryn_grenade_friend_rock = {
		en = "BR",		["zh-cn"] = "石",	},
	def_ogryn_grenade_frag = {
		en = "FG",		["zh-cn"] = "雷",	},
	def_ogryn_box_explodes = {
		en = "BA",
		["zh-cn"] = "盒",
	},
	
	def_ogryn_melee_damage_coherency_improved = {
		en = "B",		["zh-cn"] = "伤",	},
	def_ogryn_toughness_regen_aura = {
		en = "S",		["zh-cn"] = "韧",	},
	def_ogryn_damage_vs_suppressed_coherency = {
		en = "C",		["zh-cn"] = "压",	},
	
	def_ogryn_passive_heavy_hitter = {
		en = "HH",		["zh-cn"] = "重",	},
	def_ogryn_carapace_armor = {
		en = "FNP",		["zh-cn"] = "痛",	},
	def_ogryn_leadbelcher_no_ammo_chance = {
		en = "BLO",		["zh-cn"] = "覆",	},
	def_adamant_stance = {
		en = "CS",		["zh-cn"] = "惩",	},
	def_adamant_area_buff_drone_improved = {
		en = "NA",		["zh-cn"] = "谕",	},
	def_adamant_charge = {
		en = "BL",		["zh-cn"] = "突",	},
	def_adamant_whistle = {
		en = "RD",		["zh-cn"] = "引",	},
	def_adamant_shock_mine = {
		en = "SM",		["zh-cn"] = "电",	},
	def_adamant_grenade_improved = {
		en = "AG",		["zh-cn"] = "雷",	},
	def_adamant_companion_coherency = {
		en = "PoS",		["zh-cn"] = "协",	},
	def_adamant_reload_speed_aura = {
		en = "RE",		["zh-cn"] = "效",	},
	def_adamant_damage_vs_staggered_aura = {
		en = "BD",		["zh-cn"] = "压",	},
	def_adamant_execution_order = {
		en = "EO",		["zh-cn"] = "处",	},
	def_adamant_terminus_warrant = {
		en = "TW",		["zh-cn"] = "终",	},
	def_adamant_forceful = {
		en = "F",		["zh-cn"] = "力",	},
	def_adamant_companion_focus_elite = {
		en = "UB",		["zh-cn"] = "野",	},
	def_adamant_disable_companion = {
		en = "LW",		["zh-cn"] = "独",	},
	def_adamant_companion_focus_ranged = {
		en = "GGM",
		["zh-cn"] = "追",
	},
	
	def_broker_ability_focus_improved = {
		en = "Desp",		["zh-cn"] = "亡",	},
	def_broker_ability_punk_rage = {
		en = "Ram",		["zh-cn"] = "怒",	},
	def_broker_ability_stimm_field = {
		en = "Sup",		["zh-cn"] = "箱",	},
	
	def_broker_blitz_flash_grenade_improved = {
		en = "BO",		["zh-cn"] = "震",	},
	def_broker_blitz_missile_launcher = {
		en = "RPG",		["zh-cn"] = "爆",	},
	def_broker_blitz_tox_grenade = {
		en = "CG",		["zh-cn"] = "化",	},
		
	def_broker_aura_gunslinger_improved = {
		en = "Gun",		["zh-cn"] = "枪",	},
	def_broker_coherency_melee_damage = {
		en = "Ruf",		["zh-cn"] = "硬",	},
	def_broker_coherency_anarchist = {
		en = "Anar",		["zh-cn"] = "叛",	},
	
	def_broker_keystone_vultures_mark_on_kill = {
		en = "VM",		["zh-cn"] = "掠",	},
	def_broker_keystone_adrenaline_junkie = {
		en = "AF",		["zh-cn"] = "肾",	},
	def_broker_keystone_chemical_dependency = {
		en = "CD",		["zh-cn"] = "化",	},
	
	user_custom_feats_abbreviation_description = {
		en = "1:Ability   2:Blitz   3:Aura   4:Keystone",
		["zh-cn"] = "1：技能   2：闪击   3：光环   4：基石",		
	},
}
for i = 1,4 do
	locr[string.format("player_Feats_order_%s",i)] = {
		en = "Slot: "..tostring(i),
		["zh-cn"] = "槽位："..tostring(i),
	}
end
return locr


--[[
 = {
	en = "",
	["zh-cn"] = "",
},
--]]