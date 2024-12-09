local mod = get_mod("quick_level_mastery")

local MasterItems = require("scripts/backend/master_items")
local CraftingSettings = require("scripts/settings/item/crafting_settings")
local Mastery = require("scripts/utilities/mastery")
local Promise = require("scripts/foundation/utilities/promise")
local MasteryUtils = require("scripts/utilities/mastery")
local UISoundEvents = require("scripts/settings/ui/ui_sound_events")

local BaseVendorSacrifice = mod:io_dofile("quick_level_mastery/scripts/base_vendor_sacrifice")

local MysteryView = {}

-----------
-- HOOKS --
-----------

mod:hook(CLASS.MarksGoodsVendorView, "_create_widgets", function(func, self, defs, ...)
	if not mod.enable_view_melk or not mod.enable_view_melk_mystery then
		func(self, defs, ...)
		return
	end
	local ButtonPassTemplates = require("scripts/ui/pass_templates/button_pass_templates")
	local UIWidget = require("scripts/managers/ui/ui_widget")

	--self:_set_scenegraph_size("purchase_button", 374/1.5, 76)
	self:_set_scenegraph_position("purchase_button", -374/2 - 5, -120)
	--self:_set_scenegraph_position("price_text", 70, 47)
	--self:_set_scenegraph_size("info_box", 505, 202)
	--self:_set_scenegraph_position("info_box", 78, -56)

	defs.widget_definitions.quick_sacrifice_button = UIWidget.create_definition(table.clone(ButtonPassTemplates.default_button), 
	"purchase_button", {
		gamepad_action = "confirm_pressed",
		original_text = "SACRIFICE",
		hotspot = {
			on_pressed_sound = UISoundEvents.default_click,
		},
	})
	func(self, defs, ...)
end)

mod:hook(CLASS.MarksGoodsVendorView, "_register_button_callbacks", function(func, view, ...)
	func(view, ...)
	if not mod.enable_view_melk or not mod.enable_view_melk_mystery then
		return
	end
	local button = view._widgets_by_name.quick_sacrifice_button
	button.content.hotspot.pressed_callback = function()
		BaseVendorSacrifice:_cb_on_sacrifice_button_pressed(view, nil) -- you can't metagame Melks lol
	end
	button.offset[1] = 374 + 5 -- x position
	button.offset[2] = 0 -- y position
	button.offset[3] = 0 -- z depth position
end)

mod:hook(CLASS.MarksGoodsVendorView, "on_exit", function(func, self, ...)
	func(self, ...)
	if not mod.enable_view_melk or not mod.enable_view_melk_mystery then
		return
	end
	QuickSacrifice:_batch_sacrifice()
end)

mod:hook(CLASS.MarksGoodsVendorView, "_set_preview_widgets_visibility", function(func, view, visible, ...)
	func(view, ...)
	if not mod.enable_view_melk or not mod.enable_view_melk_mystery then
		return
	end
	view._widgets_by_name.quick_sacrifice_button.visible = visible
end)

mod:hook(CLASS.MarksGoodsVendorView, "_preview_element", function(func, view, ...)
	func(view, ...)
	if not mod.enable_view_melk or not mod.enable_view_melk_mystery then
		return
	end
	local item_id = MysteryView._get_item_id(view)
	BaseVendorSacrifice:on_preview_change(view, item_id)
end)

---------------
-- FUNCTIONS --
---------------

MysteryView._get_item_id = function(view)
	mod:dtf(view._previewed_offer, "Melk", 15)
    return view._previewed_offer.description.id
end