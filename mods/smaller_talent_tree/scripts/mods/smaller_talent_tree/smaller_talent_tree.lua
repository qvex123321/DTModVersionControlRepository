local mod = get_mod("smaller_talent_tree")

local function scale_tree_centered(instance, width_scale, height_scale)
	if not instance or not instance.nodes then return end

	local nodes = instance.nodes
	local min_x, max_x = math.huge, -math.huge

	for _, node in pairs(nodes) do
		node.orig_x = node.orig_x or node.x
		node.orig_y = node.orig_y or node.y
		min_x = math.min(min_x, node.orig_x)
		max_x = math.max(max_x, node.orig_x)
	end

	local center_x = (min_x + max_x) * 0.5

	for _, node in pairs(nodes) do
		node.x = center_x + (node.orig_x - center_x) * width_scale
		node.y = node.orig_y * height_scale
	end
end

local TREES = {
	veteran = { x = "veteran_tree_factor_x", y = "veteran_tree_factor" },
	zealot = { x = "zealot_tree_factor_x", y = "zealot_tree_factor" },
	ogryn = { x = "ogryn_tree_factor_x", y = "ogryn_tree_factor" },
	psyker = { x = "psyker_tree_factor_x", y = "psyker_tree_factor" },
	adamant = { x = "adamant_tree_factor_x", y = "adamant_tree_factor" },
	broker = { x = "broker_tree_factor_x", y = "broker_tree_factor" },
}

for tree_name, settings in pairs(TREES) do
	mod:hook_require(
		"scripts/ui/views/talent_builder_view/layouts/"..tree_name.."_tree",
		function(instance)
			scale_tree_centered(
				instance,
				mod:get(settings.x),
				mod:get(settings.y)
			)
		end
	)
end