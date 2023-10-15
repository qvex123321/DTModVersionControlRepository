local mod = get_mod("smaller_talent_tree")


mod:hook_require("scripts/ui/views/talent_builder_view/layouts/veteran_tree", function(instance)
	if instance then
		for k,node in pairs(instance.nodes) do
			if not node.orig_y then
				node.orig_y = node.y
			end

			node.y = node.orig_y * mod:get("veteran_tree_factor")
		end
	end
end)
mod:hook_require("scripts/ui/views/talent_builder_view/layouts/zealot_tree", function(instance)
	if instance then
		for k,node in pairs(instance.nodes) do
			if not node.orig_y then
				node.orig_y = node.y
			end

			node.y = node.orig_y * mod:get("zealot_tree_factor")
		end
	end
end)
mod:hook_require("scripts/ui/views/talent_builder_view/layouts/ogryn_tree", function(instance)
	if instance then
		for k,node in pairs(instance.nodes) do
			if not node.orig_y then
				node.orig_y = node.y
			end

			node.y = node.orig_y * mod:get("ogryn_tree_factor")
		end
	end
end)
mod:hook_require("scripts/ui/views/talent_builder_view/layouts/psyker_tree", function(instance)
	if instance then
		for k,node in pairs(instance.nodes) do
			if not node.orig_y then
				node.orig_y = node.y
			end

			node.y = node.orig_y * mod:get("psyker_tree_factor")
		end
	end
end)
