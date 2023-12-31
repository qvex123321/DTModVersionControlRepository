local dmf = get_mod("DMF")

local _network_debug = false

-- ####################################################################################################################
-- ##### Local functions ##############################################################################################
-- ####################################################################################################################

-- ####################################################################################################################
-- ##### DMFMod #######################################################################################################
-- ####################################################################################################################

-- ####################################################################################################################
-- ##### Hooks ########################################################################################################
-- ####################################################################################################################

-- ####################################################################################################################
-- ##### DMF internal functions and variables #########################################################################
-- ####################################################################################################################

dmf.create_network_dictionary = function()
  -- @TODO: Not implemented
end

dmf.ping_dmf_users = function()
  -- @TODO: Not implemented
end

dmf.load_network_settings = function()
  _network_debug = dmf:get("developer_mode") and dmf:get("show_network_debug_info")
end

-- ####################################################################################################################
-- ##### Script #######################################################################################################
-- ####################################################################################################################

dmf.load_network_settings()
