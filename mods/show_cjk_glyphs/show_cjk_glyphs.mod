return {
    run = function()
        fassert(rawget(_G, "new_mod"), "`show_cjk_glyphs` encountered an error loading the Darktide Mod Framework.")

        new_mod("show_cjk_glyphs", {
            mod_script       = "show_cjk_glyphs/scripts/mods/show_cjk_glyphs/show_cjk_glyphs",
            mod_data         = "show_cjk_glyphs/scripts/mods/show_cjk_glyphs/show_cjk_glyphs_data",
            mod_localization = "show_cjk_glyphs/scripts/mods/show_cjk_glyphs/show_cjk_glyphs_localization",
        })
    end,
    packages = {},
}
