--[[
    Author: Igromanru
    Date: 30.11.2024
    Mod Name: Transparent Shield
]]
local mod = get_mod("TransparentShield")

local SettingNames = mod:io_dofile("TransparentShield/scripts/setting_names")

return {
  mod_name =
  {
    en = "Transparent Shield",
  },
  mod_description =
  {
    en = "Makes Ogryn shield transparent",
  },
  [SettingNames.EnableMod] = {
    en = "Enable Transparency"
  },
  [SettingNames.Opacity] = {
    en = "Opacity"
  },
  [SettingNames.BlockOpacity] = {
    en = "Opacity while blocking"
  },
}
