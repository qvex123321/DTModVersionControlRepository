---@diagnostic disable: undefined-global

-- Thanks to deluxghost, Ovenproof, Fracticality and Wobin!
local mod = get_mod("Enhanced_descriptions")
local WTL = get_mod("WhatTheLocalization")

--[+ Buttons offset +]--
mod:hook_safe(CLASS.InventoryWeaponsView, "on_enter", function (self)
	self._widgets_by_name.equip_button.offset = {-622,20,0} end)
mod:hook_safe(CLASS.MarksVendorView, "on_enter", function (self)
	self._widgets_by_name.purchase_button.offset = {-622,20,0} end)

--[+ Load localization templates from the specified files +]--
local MENUS_File = mod:get("enable_menus_file") and mod:io_dofile("Enhanced_descriptions/MENUS") or {}
local CURIOS_File = mod:get("enable_curious_file") and mod:io_dofile("Enhanced_descriptions/CURIOS_Blessings_Perks") or {}
local WEAPONS_File = mod:get("enable_weapons_file") and mod:io_dofile("Enhanced_descriptions/WEAPONS_Blessings_Perks") or {}
local TALENTS_File = mod:get("enable_talents_file") and mod:io_dofile("Enhanced_descriptions/TALENTS") or {}

--[+ Toggle extended descriptions - Main +]--
local enhanced_descriptions_enabled = mod:get("enhanced_descriptions_enabled")
if enhanced_descriptions_enabled then
	TALENTS_Enh_desc = mod:io_dofile("Enhanced_descriptions/TALENTS_Enh_desc")
else
	TALENTS_Enh_desc = mod:io_dofile("Enhanced_descriptions/NULL/TALENTS_Enh_desc_null")
end
--[+ Toggle extended descriptions - Main 2 +]--
local enhanced_descriptions_enabled2 = mod:get("enhanced_descriptions_enabled2")
if enhanced_descriptions_enabled2 then
	TALENTS_Enh_desc2 = mod:io_dofile("Enhanced_descriptions/TALENTS_Enh_desc2")
else
	TALENTS_Enh_desc2 = mod:io_dofile("Enhanced_descriptions/NULL/TALENTS_Enh_desc2_null")
end
--[+ Toggle extended descriptions - Nodes +]--
local enhanced_descriptions_nodes_enabled = mod:get("enhanced_descriptions_nodes_enabled")
if enhanced_descriptions_nodes_enabled then
	TALENTS_Enh_desc_nodes = mod:io_dofile("Enhanced_descriptions/TALENTS_Enh_desc_nodes")
else
	TALENTS_Enh_desc_nodes = mod:io_dofile("Enhanced_descriptions/NULL/TALENTS_Enh_desc_nodes_null")
end

--[+ Custom unpack function +]--
	local function custom_unpack(...)
		local result = {}
		for _, t in ipairs({...}) do
			for i = 1, #t do
				table.insert(result, t[i])  -- Добавляем каждую запись в общий результат
			end
		end
---@diagnostic disable-next-line: deprecated
		return unpack(result)  -- Возвращаем все записи
	end

-- FOR TESTS ONLY!!!
--[+ Function to create a localization template +]--
local function create_template(id, loc_keys, locales, handle_func) return { id = id, loc_keys = loc_keys, locales = locales, handle_func = handle_func } end

mod.localization_templates = {
    --[+ Add templates loaded from the files: CURIOS_Blessings_Perks.lua, TALENTS.lua, WEAPONS_Blessings_Perks.lua +]--
    custom_unpack(MENUS_File, CURIOS_File, TALENTS_File, WEAPONS_File),

-- FOR TESTS ONLY!!!
-- create_template("weap_testum00", {""}, {"en"}, function(locale, value) return string.gsub(value, "{", "(") end),
}

--[+ Reload localization templates when the mod is enabled or disabled +]--
function mod.on_enabled()
    if WTL then
        WTL.reload_templates()
    end
end

function mod.on_disabled()
    if WTL then
        WTL.reload_templates()
    end
end
