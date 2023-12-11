local mod = get_mod("InspectFromSocial")

return {
    name = mod:localize("mod_name"),
    description = mod:localize("mod_description"),
    is_togglable = true,
    options = {
        widgets = {
            {
                setting_id = "enable_self_inspect",
                type = "checkbox",
                default_value = false,
            }
        }
    }
}
