local UIWidget = require("scripts/managers/ui/ui_widget")
local ButtonPassTemplates = require("scripts/ui/pass_templates/button_pass_templates")
local UISoundEvents = require("scripts/settings/ui/ui_sound_events")
local UIFontSettings = require("scripts/managers/ui/ui_font_settings")

local sacrifice_button_style = UIWidget.create_definition(
    table.clone(ButtonPassTemplates.terminal_button),
    "purchase_button", -- parent 
    {
        gamepad_action = "confirm_pressed",
        original_text = "SACRIFICE",
        hotspot = {
            on_pressed_sound = UISoundEvents.default_click,
        },
    }
)
sacrifice_button_style.offset = { 155, 0, 0 }

local widget_definitions = {
    quick_sacrifice_button = sacrifice_button_style,
}

local scenegraph_definitions = {
    purchase_button = {
        position = { 900, -143, 0 },
        size = { 155, 46, 0 },
    },
    price_text = {
        position = { 70, 47, 0 },
    },
    info_box = {
        position = { 78, -56, 0 },
    },
}

return {
    widget_definitions = widget_definitions,
    scenegraph_definitions = scenegraph_definitions,
}