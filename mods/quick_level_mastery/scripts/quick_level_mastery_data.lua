local mod = get_mod("quick_level_mastery")

return {
    name = mod:localize("mod_name"),
    description = mod:localize("mod_description"),
    is_togglable = true,
    options = {
        widgets = {
            {
                setting_id    = "debug_setting",
                type          = "checkbox",
                default_value = false,
            },
            {
                setting_id  = "group_store_fronts",
                type        = "group",
                sub_widgets = {
                    {
                        setting_id    = "store_armoury",
                        tooltip       = "store_armoury_tip",
                        type          = "checkbox",
                        default_value = true,
                    },
                    {
                        setting_id    = "store_brunts",
                        tooltip       = "store_brunts_tip",
                        type          = "checkbox",
                        default_value = true,
                    },
                    {
                        setting_id    = "store_requisition",
                        tooltip       = "store_requisition_tip",
                        type          = "checkbox",
                        default_value = true,
                    },
                    {
                        setting_id    = "store_hadron_entreat",
                        tooltip       = "store_hadron_tip",
                        type          = "checkbox",
                        default_value = true,
                    },
                    {
                        setting_id    = "store_melk",
                        tooltip       = "store_melk_tip",
                        type          = "checkbox",
                        default_value = true,
                    },
                    --[[
                    {
                        setting_id    = "store_melk_mystery",
                        tooltip       = "store_melk_mystery_tip",
                        type          = "checkbox",
                        default_value = true,
                    },
                    --]]
                    {
                        setting_id    = "store_melk_acquisitions",
                        tooltip       = "store_melk_acquisitions_tip",
                        type          = "checkbox",
                        default_value = true,
                    },
                },
            },
            --[[
            {
                setting_id  = "group_inventory",
                type        = "group",
                sub_widgets = {
                    {
                        setting_id    = "inv_op",
                        tooltip       = "inv_op_tip",
                        type          = "checkbox",
                        default_value = true,
                    },
                    {
                        setting_id    = "inv_masteries",
                        type          = "checkbox",
                        default_value = true,
                    },
                },
            },
            {
                setting_id  = "group_req_scout",
                type        = "group",
                sub_widgets = {
                    {
                        setting_id    = "enable_req_scout",
                        tooltip       = "",
                        type          = "checkbox",
                        default_value = false,
                    },
                },
            },
            ]]--
        },
    },
}