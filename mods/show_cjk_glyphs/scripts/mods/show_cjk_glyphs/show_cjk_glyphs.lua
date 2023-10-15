local mod = get_mod("show_cjk_glyphs")

local FontDefinitions = require("scripts/managers/ui/ui_fonts_definitions")

local function get_fallback_order()
    local q = {
        mod:get("q_zh_hans"),
        mod:get("q_zh_hant"),
        mod:get("q_ja"),
        mod:get("q_ko"),
    }
    local lang = {
        "sc",
        "tc",
        "jp",
        "kr",
    }
    for i = 1, 3 do
        for j = 1, 4 - i do
            if q[j] < q[j + 1] then
                q[j], q[j + 1] = q[j + 1], q[j]
                lang[j], lang[j + 1] = lang[j + 1], lang[j]
            end
        end
    end
    return lang
end

local FONT_TYPES = table.enum("serif", "sans_serif")

local function build_cjk_combo_font(fallback_order)
    local sans_serif = {}
    local serif = {}

    local current_locale = Managers.localization and Managers.localization:language()
    if current_locale == "ru" then
        serif[#serif+1] = "friz_quadrata"
    end
    local current_locale_font = current_locale and FontDefinitions.locale_specific_fonts[current_locale]
    local machine_medium = current_locale_font and current_locale_font["machine_medium"]

    for _, lang in ipairs(fallback_order) do
        sans_serif[#sans_serif+1] = "noto_sans_" .. lang .. "_bold"
        serif[#serif+1] = "noto_sans_" .. lang .. "_black"
    end

    return {
        machine_medium = machine_medium,
        [FONT_TYPES.sans_serif] = sans_serif,
        [FONT_TYPES.serif] = serif
    }
end

local function update_font()
    local fallback_order = get_fallback_order()
    local font = build_cjk_combo_font(fallback_order)
    Managers.font:_setup_font_definitions(font)
end

local font_packages = {
    "packages/ui/fonts/slug_zh_cn",
    "packages/ui/fonts/slug_zh_tw",
    "packages/ui/fonts/slug_ja",
    "packages/ui/fonts/slug_ko",
}

local function WaitAllCallbacks(n_cb, after_fn)
    local self = {
        n_cb_remaining = n_cb,
        after_fn = after_fn,
    }
    self.update_progress = function()
        self.n_cb_remaining = self.n_cb_remaining - 1
        if self.n_cb_remaining <= 0 then
            self.after_fn()
        end
    end
    return self
end

local function load_font_packages()
    local wait_all = WaitAllCallbacks(#font_packages, update_font)
    local package_manager = Managers.package
    for _, package in ipairs(font_packages) do
        package_manager:load(package, "show_cjk_glyphs", wait_all.update_progress, true)
    end
end

mod.on_all_mods_loaded = function()
    load_font_packages()
end

mod.on_setting_changed = function()
    update_font()
end
