local DC = DarkCache
DC.icon_caching = {}

local hooks = {
	{ obj = "WeaponIconUI", method = "unload_weapon_icon" },
	{ obj = "ItemIconLoaderI", method = "unload_icon" },
	{ obj = "PortraitUI", method = "unload_profile_portrait" },
}

DC.icon_caching.update_hooks = function()
	local toggle_func = DC.settings.cache.icon_caching and
		DC.mod.hook_enable or DC.mod.hook_disable

	for _, v in ipairs(hooks) do
		toggle_func(DC.mod, v.obj, v.method)
	end
end

DC.mod:hook("WeaponIconUI", "unload_weapon_icon", function() end)
DC.mod:hook("ItemIconLoaderUI", "unload_icon", function() end)
DC.mod:hook("PortraitUI", "unload_profile_portrait", function() end)
