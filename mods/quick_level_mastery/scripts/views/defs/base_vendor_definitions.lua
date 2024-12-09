local UIWidget = require("scripts/managers/ui/ui_widget")
local ButtonPassTemplates = require("scripts/ui/pass_templates/button_pass_templates")
local UISoundEvents = require("scripts/settings/ui/ui_sound_events")
local UIFontSettings = require("scripts/managers/ui/ui_font_settings")

local sacrifice_button_style = table.clone(ButtonPassTemplates.default_button)

local widget_definitions = {
    
    quick_sacrifice_button = UIWidget.create_definition(sacrifice_button_style, 
	    "purchase_button", -- parent 
        {
            gamepad_action = "confirm_pressed",
            original_text = "SACRIFICE",
            hotspot = {
                on_pressed_sound = UISoundEvents.default_click,
            },
        }
    ),
}

widget_definitions.quick_sacrifice_button.offset = { 250, 0, 0 }

local scenegraph_definitions = {
    purchase_button = {
        position = { 790, -90, 0 },
        size = { 374/1.5, 76, 0 },
    },
}

return {
    widget_definitions = widget_definitions,
    scenegraph_definitions = scenegraph_definitions,
}