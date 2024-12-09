local mod = get_mod("quick_level_mastery")

local MasterItems = require("scripts/backend/master_items")
local CraftingSettings = require("scripts/settings/item/crafting_settings")
local Mastery = require("scripts/utilities/mastery")
local Promise = require("scripts/foundation/utilities/promise")
local MasteryUtils = require("scripts/utilities/mastery")
local UISoundEvents = require("scripts/settings/ui/ui_sound_events")
local ItemUtils = require("scripts/utilities/items")

local QuickSacrifice = mod:io_dofile("quick_level_mastery/scripts/quick_sacrifice")

local BaseVendorSacrifice = {}

BaseVendorSacrifice.set_hook = function(class, item_id_func, is_view, local_defs)

	BaseVendorSacrifice._get_item_id = function(view)
		return item_id_func(view)
	end

	mod:hook(class, "_update_button_disable_state", function(func, view, ...)
		func(view, ...)
		if not is_view then
			return
		end
		BaseVendorSacrifice:update_sacrifice_disabled_state(view, item_id_func(view))
	end)

	mod:hook(class, "on_exit", function(func, view, ...)
		func(view, ...)
		if not is_view then
			return
		end
		BaseVendorSacrifice.on_exit()
	end)

	mod:hook(class, "_set_preview_widgets_visibility", function(func, view, visible, ...)
		func(view, ...)
		if not is_view then
			return
		end
		view._widgets_by_name.quick_sacrifice_button.visible = visible
	end)

	mod:hook(class, "_preview_element", function(func, view, element, ...)
		func(view, element, ...)
		if not is_view then
			return
		end
		BaseVendorSacrifice:update_sacrifice_disabled_state(view, item_id_func(view))
	end)

	mod:hook(class, "_create_widgets", function(func, view, defs, ...)
		if not is_view then
			func(view, defs, ...)
			return
		end

		BaseVendorSacrifice:fetch_masteries_data()

		local ButtonPassTemplates = require("scripts/ui/pass_templates/button_pass_templates")
		local UIWidget = require("scripts/managers/ui/ui_widget")

		local local_widgets = local_defs.scenegraph_definitions

		defs.widget_definitions.quick_sacrifice_button = local_defs.widget_definitions.quick_sacrifice_button

		local purchase_pos = local_defs.scenegraph_definitions.purchase_button.position
		local purchase_size = local_defs.scenegraph_definitions.purchase_button.size

		view:_set_scenegraph_size("purchase_button", purchase_size[1], purchase_size[2])
		view:_set_scenegraph_position("purchase_button", purchase_pos[1], purchase_pos[2])
		if local_widgets.price_text then
			view:_set_scenegraph_position("price_text", 70, 47)
		end
		if local_widgets.info_box then
			view:_set_scenegraph_size("info_box", 505, 202)
			view:_set_scenegraph_position("info_box", 78, -56)
		end

		func(view, defs, ...)
	end)

	mod:hook(class, "_register_button_callbacks", function(func, view, ...)
		func(view, ...)
		if not is_view then
			return
		end
		local button = view._widgets_by_name.quick_sacrifice_button
		button.content.hotspot.pressed_callback = function()
			local item_id = item_id_func(view)
			BaseVendorSacrifice:_cb_on_sacrifice_button_pressed(view, item_id)
		end
	end)
end

BaseVendorSacrifice.fetch_masteries_data = function(self)
	return Managers.data_service.mastery:get_all_masteries():next(function (masteries_data)
		self._masteries_data = masteries_data
	end)
end

BaseVendorSacrifice.get_item = function(item_id)
	if not item_id then
		return
	end
    local _item = MasterItems.get_item(item_id)
    return _item
end

BaseVendorSacrifice.is_mastery_completed = function(self, item_id)
	if not self._masteries_data then 
		return true
	end
	local item = self.get_item(item_id)
	local pattern = item.parent_pattern
	local mastery_data = self._masteries_data[pattern]
	local mastery_max_level = #mastery_data.milestones
	return mastery_max_level <= mastery_data.mastery_level
end

BaseVendorSacrifice.append_sacrifice_purchase = function(self, items)
	if not self._masteries_data then 
		return 
	end

	for i, item_data in ipairs(items) do
		local uuid = item_data.uuid
		local item = MasterItems.get_item_instance(item_data, uuid)

		if not item then
            mod:notify(mod:localize("loc_unable_to_sacrifice_because_no_item"))
		    return
		end

		local pattern = item.parent_pattern
		local mastery_data = self._masteries_data[pattern]
		local mastery_max_level = #mastery_data.milestones
		local is_max_level = mastery_max_level <= mastery_data.mastery_level
		local sacrifice_operation_costs = Managers.data_service.crafting:get_sacrifice_mastery_costs()
		local sacrifice_muiltiplier = sacrifice_operation_costs.sacrifice_muiltiplier or 6
		local min_expertise_level = sacrifice_operation_costs.minimumExpertiseLevel or 0
		local base_mastery_award = sacrifice_operation_costs.baseReward or 25
		local xp_per_expertise_level = sacrifice_operation_costs.masteryXpPerExpertiseLevel or 30

		local text_expertise_level = ItemUtils.expertise_level(item, true)
		local expertise_level = tonumber(text_expertise_level)

		local item_xp = base_mastery_award + ((expertise_level - min_expertise_level) / ItemUtils.get_expertise_multiplier() + 1) * xp_per_expertise_level

		item_xp = item_xp * sacrifice_muiltiplier
		
		mastery_data.current_xp = mastery_data.current_xp + item_xp
		local next_level = Mastery.get_level_by_xp(mastery_data, mastery_data.current_xp)
		if mastery_data.mastery_level < next_level then
			mod:notify(mod:localize("loc_mastery_level_to") .. tostring(next_level))
		end
		mastery_data.mastery_level = next_level
	end
end

BaseVendorSacrifice.update_sacrifice_disabled_state = function(self, view, item_id)
	
	local button = view._widgets_by_name.quick_sacrifice_button

	if not view._previewed_offer then
		button.content.hotspot.disabled = true
		return
	end
	
	local is_gadget = view._previewed_offer.description.type == "gadget"

	if is_gadget then
		button.content.hotspot.disabled = true
		return
	end

	local buy_button_disabled = view._widgets_by_name.purchase_button.content.hotspot.disabled
	button.content.hotspot.disabled = true

	local item_mastered = self:is_mastery_completed(item_id)
	
	if item_mastered then
		button.content.hotspot.disabled = true
	else
		button.content.hotspot.disabled = buy_button_disabled
	end
end

BaseVendorSacrifice._cb_on_sacrifice_button_pressed = function(self, view, item_id)
	if not item_id then
		log_debug("Purchasing without pre-validating mastery")
		self:_on_sacrifice_button_confirm(view)
		return
	end

	local item_mastered = self:is_mastery_completed(item_id)

	if not item_mastered then
		self:_on_sacrifice_button_confirm(view)
	else
		mod:notify("Sacrifice cancelled. Item Mastery is already at the maximum level.")
	end
end

BaseVendorSacrifice._on_sacrifice_button_confirm = function(self, view)
    log_debug("on_quick_purchase")
    local offer = view._previewed_offer

	if not offer then
		return
	end

	local price_data = offer.price.amount
	local price = price_data.discounted_price or price_data.amount
	local can_afford = view:can_afford(price, price_data.type)

	if can_afford then
		local is_active = offer.state == "active"

		if is_active then
			self:_purchase_item(view, offer)
		end
    else
        mod:notify("Sacrifice cancelled. You do not have enough materials to purchase and craft this item.")
	end
end

-- Convert purchase offer into items
BaseVendorSacrifice._purchase_item = function(self, view, offer)
    log_debug("quick_purchase_item")

    local store_service = Managers.data_service.store
	local promise = store_service:purchase_item(offer)

	promise:next(function (result)

		log_debug("Cleaning up owned items.")
		offer.state = result.offer.state

		QuickSacrifice:add_sacrifices(result.items)
		self:append_sacrifice_purchase(result.items)
		self:update_sacrifice_disabled_state(view, self._get_item_id(view))
		view.super._on_purchase_complete(view, result.items)
		view:_update_bundle_offers_owned_skus()
		view._purchase_promise = nil
	end):catch(function (error)
        mod:notify("Unexpected error when trying to purchase Sacrifice item.")
        mod:info(error)
		view._purchase_promise = nil
	end)

	view._purchase_promise = promise
end

BaseVendorSacrifice.on_exit = function()
	QuickSacrifice:_batch_sacrifice()
end

return BaseVendorSacrifice