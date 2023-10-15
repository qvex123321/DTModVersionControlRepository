local mod = get_mod("show_cjk_glyphs")

return {
    name = mod:localize("mod_name"),
    description = mod:localize("mod_description"),
    is_togglable = true,
    options = {
        widgets = {
            {
                setting_id = "lang_priority",
                type = "group",
                sub_widgets = {
                    {
                        setting_id = "q_zh_hans",
                        type = "numeric",
                        default_value = 1.0,
                        range = { 0, 1 },
                        decimals_number = 1
                    },
                    {
                        setting_id = "q_zh_hant",
                        type = "numeric",
                        default_value = 0.7,
                        range = { 0, 1 },
                        decimals_number = 1
                    },
                    {
                        setting_id = "q_ja",
                        type = "numeric",
                        default_value = 0.6,
                        range = { 0, 1 },
                        decimals_number = 1
                    },
                    {
                        setting_id = "q_ko",
                        type = "numeric",
                        default_value = 0.5,
                        range = { 0, 1 },
                        decimals_number = 1
                    },
                }
            },
        }
    }
}
