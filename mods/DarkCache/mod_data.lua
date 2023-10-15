DarkCache = DarkCache or {}
DarkCache.mod = get_mod("DarkCache")

DarkCache.mod.data = {
	name = DarkCache.mod:localize("mod_name"),
	description = DarkCache.mod:localize("mod_description"),
	is_togglable = true,
	options = {
		widgets = {
			{
				setting_id = "cache_group_credits_store",
				type = "group",
				sub_widgets = {
					{
						setting_id = "cache_item_credits_store",
						type = "checkbox",
						default_value = true
					}, {
						setting_id = "cache_item_credits_goods_store",
						type = "checkbox",
						default_value = true
					}
				}
			}, {
				setting_id = "cache_group_marks_store",
				type = "group",
				sub_widgets = {
					{
						setting_id = "cache_item_contracts_list",
						type = "checkbox",
						default_value = true
					}, {
						setting_id = "cache_item_marks_store_temporary",
						type = "checkbox",
						default_value = true
					}, {
						setting_id = "cache_item_marks_store",
						type = "checkbox",
						default_value = true
					}
				}
			}, {
				setting_id = "cache_group_credits_cosmetics_store",
				type = "group",
				sub_widgets = {
					{
						setting_id = "cache_item_credits_cosmetics_store",
						type = "checkbox",
						default_value = true,
					}, {
						setting_id = "cache_item_credits_weapon_cosmetics_store",
						type = "checkbox",
						default_value = true
					}
				}
			}, {
				setting_id = "cache_group_others",
				type = "group",
				sub_widgets = {
					{
						setting_id = "hub_caching",
						type = "checkbox",
						default_value = false,
						sub_widgets = {
							{
								setting_id = "hub_preloading",
								type = "checkbox",
								default_value = false
							}
						}
					}, {
						setting_id = "cache_item_mission_board",
						type = "checkbox",
						default_value = false
					}, {
						setting_id = "cache_item_premium_store",
						type = "checkbox",
						default_value = true
					}, {
						setting_id = "icon_caching",
						type = "checkbox",
						default_value = false
					}
				}
			}, {
				setting_id = "group_general_settings",
				type = "group",
				sub_widgets = {
					{
						setting_id = "suppress_cache_regen_notification",
						type = "checkbox",
						default_value = false
					}, {
						setting_id = "dev_mode",
						type = "checkbox",
						default_value = false
					}
				}
			}
		}
	}
}

return DarkCache.mod.data
