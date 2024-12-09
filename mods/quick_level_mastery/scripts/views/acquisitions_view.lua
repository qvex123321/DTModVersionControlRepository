local mod = get_mod("quick_level_mastery")

local MasterItems = require("scripts/backend/master_items")
local CraftingSettings = require("scripts/settings/item/crafting_settings")
local Mastery = require("scripts/utilities/mastery")
local Promise = require("scripts/foundation/utilities/promise")
local MasteryUtils = require("scripts/utilities/mastery")
local UISoundEvents = require("scripts/settings/ui/ui_sound_events")

local BaseVendorSacrifice = mod:io_dofile("quick_level_mastery/scripts/base_vendor_sacrifice")
local Definitions = mod:io_dofile("quick_level_mastery/scripts/views/defs/base_vendor_definitions")

local AcquisitionsView = {}

local is_view = mod.enable_view_armoury and mod.enable_view_armoury_requisition
local hooked_class = CLASS.MarksVendorView

AcquisitionsView._get_item_id = function(view)
    if view._previewed_offer then
        return view._previewed_offer.description.id
    end
    return nil
end

BaseVendorSacrifice.set_hook(hooked_class, AcquisitionsView._get_item_id, is_view, Definitions)

return AcquisitionsView