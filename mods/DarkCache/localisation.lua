local gold = { 255, 186, 9 }

return {
	mod_name = {
		en = "DarkCache",
		["zh-cn"] = "暗潮缓存",
	},
	mod_description = {
		en = "Prefetches and caches most menus accessible in the Mourningstar, eliminating any delay when the menu is opened. Caching and preloading of the Mourningstar itself is also supported and can dramatically reduce load times for the Mourningstar and Psykhanium but also dramatically increase memory usage.",
	},
	cache_group_credits_store = {
		en = "Armoury Caching",
		["zh-cn"] = "武器商店缓存",
	},
	cache_item_credits_store = {
		en = "Requisition Weapons & Curios"
	},
	cache_item_credits_store_description = {
		en = "Toggles caching of the Armoury's Requisition store."
	},
	cache_item_credits_goods_store = {
		en = "Brunt's Armoury"
	},
	cache_item_credits_goods_store_description = {
		en = "Toggles caching of Brunt's Armoury."
	},
	cache_group_marks_store = {
		en = "Sire Melk's Requisitorium"
	},
	cache_item_contracts_list = {
		en = "Contracts"
	},
	cache_item_contracts_list_description = {
		en = "Toggles whether the contracts list should be prefetched and cached. The contracts list will be prefetched when entering the Mourningstar, and expire when you enter a mission.",
		["zh-cn"] = "开关是否应该预读取和缓存每周协议列表。协议列表会在进入哀星号时预读取，并在进入任务时过期。",
	},
	cache_item_marks_store_temporary = {
		en = "Limited Time Acquisitions"
	},
	cache_item_marks_store_temporary_description = {
		en = "Toggles caching of Melk's Limited Aquisitions store."
	},
	cache_item_marks_store = {
		en = "Mystery Acquisitions"
	},
	cache_item_marks_store_description = {
		en = "Toggles caching of Melk's Mystery Acquisitions store."
	},
	cache_group_credits_cosmetics_store = {
		en = "Commissary"
	},
	cache_item_credits_cosmetics_store = {
		en = "Operative Cosmetics"
	},
	cache_item_credits_cosmetics_store_description = {
		en = "Toggles caching of the Commissary's Operative Cosmetics store."
	},
	cache_item_credits_weapon_cosmetics_store = {
		en = "Weapon Cosmetics"
	},
	cache_item_credits_weapon_cosmetics_store_description = {
		en = "Toggles caching of the Commissary's Weapon Cosmetics store."
	},
	cache_group_others = {
		en = "Other Caching"
	},
	cache_item_mission_board = {
		en = "Mission Board",
		["zh-cn"] = "任务面板缓存",
	},
	cache_item_mission_board_description = {
		en = "Toggles whether the mission board should prefetch and cache mission information. This cache expires whenever a mission expires so it probably prefetches too often if anything.",
		["zh-cn"] = "开关是否应该预读取和缓存任务信息。缓存会在任一任务过期时过期，所以此预读取过程可能会频繁进行。",
	},
	cache_item_premium_store = {
		en = "Premium Store",
		["zh-cn"] = "高级饰品商店缓存",
	},
	cache_item_premium_store_description = {
		en = "Toggles whether the premium store should be prefetched and cached.",
	},
	hub_caching = {
		en = "Mourningstar Caching",
		["zh-cn"] = "哀星号缓存",
	},
	hub_caching_description = {
		en = "Causes the game to not release the resources loaded when first loading the Mourningstar. This greatly reduces the time that subsequent loads take, but increases memory usage.",
		["zh-cn"] = "使游戏在首次进入哀星号后不释放已加载的资源。这会大幅度减少后续加载的时间，但会增加内存占用。",
	},
	hub_preloading = {
		en = "Mourningstar Preloading",
	},
	hub_preloading_description = {
		en = "Causes loading of the Mourningstar as soon as Darktide starts. For this to work, some data must be generated during loading, so preloading will not occur the first time you start Darktide, but will on subsequent starts. This setting has no effect if Mourningstar Caching is disabled."
	},
	dev_mode = {
		en = "Developer Mode",
		["zh-cn"] = "开发者模式",
	},
	dev_mode_description = {
		en = "Enables commands and output for dev and debugging purposes.",
		["zh-cn"] = "启用开发者调试用的命令和输出。",
	},
	enabled = {
		en = "enabled",
		["zh-cn"] = "启用",
	},
	disabled = {
		en = "disabled",
		["zh-cn"] = "禁用",
	},
	hub_caching_enabled = {
		en = "{#color(255,0,0)}WARNING{#reset()}: Mourningstar caching will dramatically increase your memory usage and could cause stuttering or crashing on some systems.",
		["zh-cn"] = "这会显著增加内存占用，在某些系统上可能造成卡顿或崩溃。",
	},
	icon_caching = {
		en = "Icon Caching"
	},
	icon_caching_description = {
		en = "Causes weapon, item, and portrait icons to not be unloaded once generated, giving the impression that they've been cached."
	},
	preload_generate_data_explanation = {
		en = "Mourningstar preloading data must be generated. Preloading will not occur this time."
	},
	suppress_cache_regen_notification = {
		en = "Suppress Cache Regen Popup"
	},
	suppress_cache_regen_notification_description = {
		en = "Prevents the notification informing you that the preloading cache must be generated from appearing."
	},
	group_general_settings = {
		en = "General Settings"
	}
}
