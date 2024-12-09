local mod = get_mod("quick_level_mastery")

local MasterItems = require("scripts/backend/master_items")
local CraftingSettings = require("scripts/settings/item/crafting_settings")
local Mastery = require("scripts/utilities/mastery")
local Promise = require("scripts/foundation/utilities/promise")
local MasteryUtils = require("scripts/utilities/mastery")
local UISoundEvents = require("scripts/settings/ui/ui_sound_events")

local QuickSacrifice = mod:io_dofile("quick_level_mastery/scripts/quick_sacrifice")

local DiscardView = {}

-----------
-- HOOKS --
-----------

mod:hook(CLASS.DiscardItemsView, "_create_widgets", function(func, self, defs, ...)
	if not mod.enable_view_armoury or not mod.enable_view_armoury_requisition then
		func(self, defs, ...)
		return
	end
	local ButtonPassTemplates = require("scripts/ui/pass_templates/button_pass_templates")
	local UIWidget = require("scripts/managers/ui/ui_widget")

	self:_set_scenegraph_size("purchase_button", 374/1.5, 76)
	self:_set_scenegraph_position("purchase_button", 790, -90)
	--self:_set_scenegraph_position("price_text", 70, 47)
	--self:_set_scenegraph_size("info_box", 505, 202)
	--self:_set_scenegraph_position("info_box", 78, -56)

	defs.widget_definitions.quick_sacrifice_button = UIWidget.create_definition(table.clone(ButtonPassTemplates.terminal_button_hold_small), 
	"purchase_button", {
		gamepad_action = "confirm_pressed",
		original_text = "SACRIFICE",
		hotspot = {
			on_pressed_sound = UISoundEvents.default_click,
		},
	})
	func(self, defs, ...)
end)

mod:hook(CLASS.DiscardItemsView, "_setup_buttons_interactions", function(func, view, ...)
	func(view, ...)
	if not mod.enable_view_armoury or not mod.enable_view_armoury_requisition then
		return
	end
	local button = view._widgets_by_name.quick_sacrifice_button
	button.content.hotspot.pressed_callback = function()
		DiscardView._check_mastery_completion(view):next(function(item_mastered)
		if not item_mastered then
			DiscardView:_cb_on_sacrifice_button_pressed(view)
		else
			mod:notify("Sacrifice cancelled. Item Mastery is already at the maximum level.")
		end
	end)
	end
	button.offset[1] = 0 -- x position
	button.offset[2] = 0 -- y position
	button.offset[3] = 0 -- z depth position
end)

mod:hook(CLASS.CreditsVendorView, "on_exit", function(func, self, ...)
	func(self, ...)
	if not mod.enable_view_armoury or not mod.enable_view_armoury_requisition then
		return
	end
	QuickSacrifice:_batch_sacrifice()
end)

mod:hook(CLASS.CreditsVendorView, "_update_button_disable_state", function(func, view, ...)
	func(view, ...)
	if not mod.enable_view_armoury or not mod.enable_view_armoury_requisition then
		return
	end
	local widgets = view._item_grid and view._item_grid:widgets()
	local selected_grid_index = view._item_grid and view._item_grid:selected_grid_index()

	if widgets and selected_grid_index then
		local widget = widgets[selected_grid_index]
		local button_widget = view._widgets_by_name.quick_sacrifice_button

		if button_widget.content.visible then
			button_widget.content.visible = false
		end
	end
end)

---------------
-- FUNCTIONS --
---------------

DiscardView._check_mastery_completion = function(view)
    local item_id = view._previewed_offer.description.id
    local _item = MasterItems.get_item(item_id)
    local item_pattern = _item.parent_pattern

	local ingredient = {item = _item}

	local valid = CraftingSettings.recipes.upgrade_item.is_valid_item(ingredient)
	local cost = CraftingSettings.recipes.upgrade_item.get_costs(ingredient)

    return QuickSacrifice.check_mastery_completion_promise(item_pattern)
end

-- Callback for SACRIFICE button
DiscardView._cb_on_sacrifice_button_pressed = function(self, view)
	QuickSacrifice:_batch_sacrifice()
end