local mod = get_mod("weapon_customization")

-- ##### ┬─┐┌─┐┌─┐ ┬ ┬┬┬─┐┌─┐ #########################################################################################
-- ##### ├┬┘├┤ │─┼┐│ ││├┬┘├┤  #########################################################################################
-- ##### ┴└─└─┘└─┘└└─┘┴┴└─└─┘ #########################################################################################

local MasterItems = mod:original_require("scripts/backend/master_items")

-- ##### ┌─┐┌─┐┬─┐┌─┐┌─┐┬─┐┌┬┐┌─┐┌┐┌┌─┐┌─┐ ############################################################################
-- ##### ├─┘├┤ ├┬┘├┤ │ │├┬┘│││├─┤││││  ├┤  ############################################################################
-- ##### ┴  └─┘┴└─└  └─┘┴└─┴ ┴┴ ┴┘└┘└─┘└─┘ ############################################################################

--#region Local functions
    local table = table
    local table_contains = table.contains
    local table_clone_instance = table.clone_instance
    local table_clone = table.clone
    local table_size = table.size
    local vector3_box = Vector3Box
    local vector3_unbox = vector3_box.unbox
    local quaternion_matrix4x4 = Quaternion.matrix4x4
    local matrix4x4_transform = Matrix4x4.transform
    local Camera = Camera
    local camera_local_position = Camera.local_position
    local camera_local_rotation = Camera.local_rotation
    local math_random_array_entry = math.random_array_entry
    local Unit = Unit
    local unit_debug_name = Unit.debug_name
    local unit_get_child_units = Unit.get_child_units
    local string = string
    local string_find = string.find
    local string_gsub = string.gsub
	local string_split = string.split
    local math = math
    local math_random = math.random
    local pairs = pairs
    local CLASS = CLASS
    local managers = Managers
    local type = type
    local tostring = tostring
    local script_unit = ScriptUnit
--#endregion

-- ##### ┌┬┐┌─┐┌┬┐┌─┐ #################################################################################################
-- #####  ││├─┤ │ ├─┤ #################################################################################################
-- ##### ─┴┘┴ ┴ ┴ ┴ ┴ #################################################################################################

local REFERENCE = "weapon_customization"

mod.weapon_templates = {}

mod.get_item_attachment_slots = function(self, item)
	local item_name = self:item_name_from_content_string(item.name)
	local attachment_slots = {}
    if item_name and self.attachment[item_name] then
        for attachment_slot, _ in pairs(self.attachment[item_name]) do
            attachment_slots[#attachment_slots+1] = attachment_slot
        end
    end
	return attachment_slots
end

mod.random_chance = {
    bayonet = "mod_option_randomization_bayonet",
    flashlight = "mod_option_randomization_flashlight",
}

mod.randomize_weapon = function(self, item)
    local random_attachments = {}
    local possible_attachments = {}
    local no_support_entries = {}
    local trigger_move_entries = {}
    local item_name = self:item_name_from_content_string(item.name)
    local attachment_slots = self:get_item_attachment_slots(item)
    local gear_id = self:get_gear_id(item)
    for _, attachment_slot in pairs(attachment_slots) do
        if self.attachment[item_name][attachment_slot] and not table_contains(self.automatic_slots, attachment_slot) then
            local chance_success = true
            if self.random_chance[attachment_slot] then
                local chance_option = self.random_chance[attachment_slot]
                local chance = self:get(chance_option)
                local already_has_attachment = self:get_actual_default_attachment(item, attachment_slot)
                if already_has_attachment then chance = 100 end
                local random_chance = math_random(100)
                chance_success = random_chance <= chance
            end
            if chance_success then
                for _, data in pairs(self.attachment[item_name][attachment_slot]) do
                    if not string_find(data.id, "default") and not data.no_randomize and self.attachment_models[item_name][data.id] then
                        possible_attachments[attachment_slot] = possible_attachments[attachment_slot] or {}
                        possible_attachments[attachment_slot][#possible_attachments[attachment_slot]+1] = data.id
                    end
                end
                if possible_attachments[attachment_slot] then
                    local random_attachment = math_random_array_entry(possible_attachments[attachment_slot])
                    -- if attachment_slot == "flashlight" then random_attachment = "laser_pointer" end
                    random_attachments[attachment_slot] = random_attachment
                    local attachment_data = self.attachment_models[item_name][random_attachment]
                    local no_support = attachment_data and attachment_data.no_support
                    -- local trigger_move = attachment_data and attachment_data.trigger_move
                    attachment_data = self:_apply_anchor_fixes(item, attachment_slot) or attachment_data
                    no_support = attachment_data.no_support or no_support
                    -- trigger_move = attachment_data.trigger_move or trigger_move
                    -- if trigger_move then
                    --     for _, trigger_move_entry in pairs(trigger_move) do
                    --         if not table_contains(trigger_move_entries, trigger_move_entry) and not possible_attachments[trigger_move_entry] then
                    --             trigger_move_entries[#trigger_move_entries+1] = trigger_move_entry
                    --         end
                    --     end
                    -- end
                    if no_support then
                        for _, no_support_entry in pairs(no_support) do
                            no_support_entries[#no_support_entries+1] = no_support_entry
                        end
                    end
                end
            end
        end
    end
    -- No support
    for _, no_support_entry in pairs(no_support_entries) do
        for attachment_slot, random_attachment in pairs(random_attachments) do
            while random_attachment == no_support_entry do
                random_attachment = math_random_array_entry(possible_attachments[attachment_slot])
                random_attachments[attachment_slot] = random_attachment
            end
            if attachment_slot == no_support_entry then
                random_attachments[no_support_entry] = "default"
            end
        end
    end
    -- Trigger move
    for _, trigger_move_entry in pairs(trigger_move_entries) do
        random_attachments[trigger_move_entry] = self:get_gear_setting(gear_id, trigger_move_entry, item)
    end
    return random_attachments
end

mod.setup_item_definitions = function(self, master_items)
    if self:persistent_table(REFERENCE).item_definitions == nil then
        local master_items = master_items or MasterItems.get_cached()
        if master_items then
            self:persistent_table(REFERENCE).item_definitions = table_clone_instance(master_items)
            -- -- Bulwark shield
            -- local definitions = self:persistent_table(REFERENCE).item_definitions
            -- -- if not definitions[bulwark_shield_string] then
            --     local bulwark_shield_string = "content/items/weapons/player/melee/ogryn_bulwark_shield_01"
            --     local bulwark_shield_unit = "content/weapons/enemy/shields/bulwark_shield_01/bulwark_shield_01"
            --     definitions[bulwark_shield_string] = table_clone(definitions["content/items/weapons/player/melee/ogryn_slabshield_p1_m1"])
            --     local bulwark_shield = definitions[bulwark_shield_string]
            --     bulwark_shield.name = bulwark_shield_string
            --     bulwark_shield.base_unit = bulwark_shield_unit
            --     bulwark_shield.resource_dependencies = {
            --         [bulwark_shield_unit] = true,
            --     }
            -- -- end
        end
    end
    -- local definitions = self:persistent_table(REFERENCE).item_definitions
    -- -- if not definitions["content/items/weapons/player/ranged/sights/scope_01"] then
    --     definitions["content/items/weapons/player/ranged/sights/scope_01"] = table_clone(definitions["content/items/weapons/minions/ranged/renegade_sniper_rifle"])
    --     local scope = definitions["content/items/weapons/player/ranged/sights/scope_01"]
    --     scope.reset_scene_graph_on_unlink = nil
    --     scope.item_list_faction = "Player"
    --     scope.show_in_1p = true
    --     scope.attach_node = "ap_sight_01"
    --     scope.attachments = {
    --         zzz_shared_material_overrides = {
    --           children = {},
    --           item = "",
    --         }
    --     }
    --     scope.name = "content/items/weapons/player/ranged/sights/scope_01"
    --     scope.fx_sources = nil
    --     scope.material_overrides = nil
    --     scope.wielded_attach_node = nil
    --     scope.unwielded_attach_node = nil
    -- -- end
    -- -- if self:persistent_table(REFERENCE).bulwark_item_definitions == nil then
    -- --     local master_items = MasterItems.get_cached()
    -- --     if master_items then
    -- --         self:persistent_table(REFERENCE).bulwark_item_definitions = table_clone_instance(MasterItems.get_cached())
    -- --         self:persistent_table(REFERENCE).bulwark_item_definitions["content/items/weapons/minions/shields/chaos_ogryn_bulwark_shield_01"] = self:persistent_table(REFERENCE).bulwark_item_definitions["content/items/weapons/player/melee/ogryn_slabshield_p1_m1"]
    -- --         self:persistent_table(REFERENCE).bulwark_item_definitions["content/items/weapons/minions/shields/chaos_ogryn_bulwark_shield_01"].base_unit = "content/weapons/enemy/shields/bulwark_shield_01/bulwark_shield_01"
    -- --     end
    -- -- end
end

mod.update_modded_packages = function(self)
    -- Reset used packages
    local new_used_packages = {}
    -- Get modded packages
    local found_packages = self:get_modded_packages()
    for _, package_name in pairs(found_packages) do
        new_used_packages[package_name] = true
    end
    -- Set packages
    self:persistent_table(REFERENCE).used_packages.attachments = new_used_packages
end

mod.get_modded_packages = function(self)
    local found_packages = {}
    -- if table_size(self:persistent_table(REFERENCE).used_packages.attachments) == 0 then
        self:setup_item_definitions()
        -- self:load_needed_packages()
        -- local players = managers.player:players()
        -- if player_or_nil then players = {player_or_nil} end
        -- for _, player in pairs(players) do
        --     local player_unit = player.player_unit
            -- if self.weapon_extension then
            -- local weapon_extension = self.weapon_extension --player_unit and script_unit.extension(player_unit, "weapon_system")
            if self.weapon_extension then
                local weapons = self.weapon_extension._weapons
                for slot_name, weapon in pairs(weapons) do
                    if weapon and weapon.item and weapon.item.attachments then
                        local packages =self:get_modded_item_packages(weapon.item.attachments)
                        local original_packages = {}
                        if weapon.item.original_attachments then
                            original_packages = self:get_modded_item_packages(weapon.item.original_attachments)
                        end
                        for _, package_name in pairs(packages) do
                            -- self:persistent_table(REFERENCE).used_packages.attachments[package] = true
                            found_packages[#found_packages+1] = package_name
                        end
                        for _, package_name in pairs(original_packages) do
                            -- self:persistent_table(REFERENCE).used_packages.attachments[package] = true
                            found_packages[#found_packages+1] = package_name
                        end
                    end
                end
            end
        -- end
    -- end
    return found_packages
end

mod.get_modded_item_packages = function(self, attachments)
    local found_attachments = {}
    local found_packages = {}
    self:_recursive_get_attachments(attachments, found_attachments, true)
    for _, attachment_data in pairs(found_attachments) do
        local item_string = attachment_data.item
        if item_string and item_string ~= "" then
            local item_definition = self:persistent_table(REFERENCE).item_definitions[item_string]
            if item_definition and item_definition.resource_dependencies then
                for package_name, _ in pairs(item_definition.resource_dependencies) do
                    -- self:persistent_table(REFERENCE).used_packages.attachments[package_name] = true
                    found_packages[#found_packages+1] = package_name
                end
            end
        end
    end
    return found_packages
end

-- ##### ┬┌┐┌┬  ┬┌─┐┌┐┌┌┬┐┌─┐┬─┐┬ ┬ ###################################################################################
-- ##### ││││└┐┌┘├┤ │││ │ │ │├┬┘└┬┘ ###################################################################################
-- ##### ┴┘└┘ └┘ └─┘┘└┘ ┴ └─┘┴└─ ┴  ###################################################################################

mod:hook(CLASS.InventoryBackgroundView, "update", function(func, self, dt, t, input_service, ...)
    local pass_input, pass_draw = func(self, dt, t, input_service, ...)
    if mod.weapon_changed then

        self:_spawn_profile(self._presentation_profile)

		managers.ui:item_icon_updated(mod.changed_weapon)
		managers.event:trigger("event_item_icon_updated", mod.changed_weapon)
		managers.event:trigger("event_replace_list_item", mod.changed_weapon)

        mod.weapon_changed = nil
    end
    return pass_input, pass_draw
end)

-- ##### ┬┌┬┐┌─┐┌┬┐  ┌─┐┌─┐┌─┐┬┌─┌─┐┌─┐┌─┐  ┌─┐┌─┐┌┬┐┌─┐┬ ┬ ###########################################################
-- ##### │ │ ├┤ │││  ├─┘├─┤│  ├┴┐├─┤│ ┬├┤   ├─┘├─┤ │ │  ├─┤ ###########################################################
-- ##### ┴ ┴ └─┘┴ ┴  ┴  ┴ ┴└─┘┴ ┴┴ ┴└─┘└─┘  ┴  ┴ ┴ ┴ └─┘┴ ┴ ###########################################################

mod._recursive_find_unit = function(self, weapon_unit, unit_name, output, output2)
    local unit = nil
    local output = output or {}
    -- Get unit children
	local children = unit_get_child_units(weapon_unit)
	if children then
        -- Iterate children
		for _, child in pairs(children) do
            if output2 then
                output2[#output2+1] = unit_debug_name(child)
            end
			if unit_debug_name(child) == unit_name then
                output[#output+1] = child
			else
                self:_recursive_find_unit(child, unit_name, output, output2)
			end
		end
	end
end

mod._recursive_set_attachment = function(self, attachments, attachment_name, attachment_type, model, auto)
    for attachment_slot, attachment_data in pairs(attachments) do
        if attachment_slot == attachment_type then
            attachment_data.item = model
            attachment_data.attachment_type = attachment_type
            attachment_data.attachment_name = attachment_name
        else
            if attachment_data.children then
                self:_recursive_set_attachment(attachment_data.children, attachment_name, attachment_type, model, auto)
            end
        end
    end
end

mod._recursive_remove_attachment = function(self, attachments, attachment_type)
    local val = nil
    if attachments then
        for attachment_name, attachment_data in pairs(attachments) do
            if attachment_name == attachment_type then
                attachments[attachment_name] = nil
                val = true
            else
                if attachment_data.children then
                    val = self:_recursive_remove_attachment(attachment_data.children, attachment_type)
                end
            end
            if val then break end
        end
    end
    return val
end

mod._recursive_find_attachment = function(self, attachments, attachment_type)
    local val = nil
    if attachments then
        for attachment_name, attachment_data in pairs(attachments) do
            if attachment_name == attachment_type then
                val = attachment_data
            else
                if attachment_data.children then
                    val = self:_recursive_find_attachment(attachment_data.children, attachment_type)
                end
            end
            if val then break end
        end
    end
    return val
end

mod._recursive_find_attachment_parent = function(self, attachments, attachment_type)
    local val = nil
    local parent = nil
    if attachments then
        for attachment_name, attachment_data in pairs(attachments) do
            if attachment_name == attachment_type then
                val = true
            else
                if attachment_data.children then
                    val, parent = self:_recursive_find_attachment_parent(attachment_data.children, attachment_type)
                    if val and not parent then parent = attachment_name end
                end
            end
            if val then break end
        end
    end
    return val, parent
end

mod._recursive_get_attachments = function(self, attachments, out_found_attachments, all)
    out_found_attachments = out_found_attachments or {}
    for attachment_slot, attachment_data in pairs(attachments) do
        if type(attachment_data.item) == "string" and (attachment_data.item ~= "" or all) then
            out_found_attachments[#out_found_attachments+1] = {
                slot = attachment_slot,
                item = attachment_data.item,
            }
        end
        if attachment_data.children then
            self:_recursive_get_attachments(attachment_data.children, out_found_attachments)
        end
    end
end

mod._recursive_find_attachment_item_string = function(self, attachments, item_string)
    local val = nil
    if attachments then
        for attachment_name, attachment_data in pairs(attachments) do
            if attachment_data.item == item_string then
                val = attachment_data
            else
                if attachment_data.children then
                    val = self:_recursive_find_attachment_item_string(attachment_data.children, item_string)
                end
            end
            if val then break end
        end
    end
    return val
end

mod._recursive_find_attachment_name = function(self, attachments, attachment_name)
    local val = nil
    if attachments then
        for attachment_slot, attachment_data in pairs(attachments) do
            if attachment_data.attachment_name == attachment_name then
                val = attachment_data
            else
                if attachment_data.children then
                    val = self:_recursive_find_attachment_name(attachment_data.children, attachment_name)
                end
            end
            if val then break end
        end
    end
    return val
end

mod._overwrite_attachments = function(self, item_data, attachments)
    local gear_id = self:get_gear_id(item_data)
    local item_name = self:item_name_from_content_string(item_data.name)
    local automatic_equip_entries = {}
    for _, attachment_slot in pairs(self.attachment_slots) do
        -- Don't handle trinkets
        if self:not_trinket(attachment_slot) and self.attachment_models[item_name] then
            local attachment = self:get_gear_setting(gear_id, attachment_slot)
            
            -- Customize
            if attachment and self.attachment_models[item_name][attachment] then
                -- Get attachment data
                local attachment_data = self.attachment_models[item_name][attachment]
                -- Get attachment type
                local attachment_type = mod.attachment_models[item_name][attachment].type
                -- Set attachment
                self:_recursive_set_attachment(attachments, attachment, attachment_type, attachment_data.model)
                -- Auto equips
                local automatic_equip = attachment_data.automatic_equip
                -- Get fixes
                local fixes = self:_apply_anchor_fixes(item_data, attachment_slot)
                -- Auto equips
                automatic_equip = fixes and fixes.automatic_equip or automatic_equip
                -- Handle automatic equips
                if automatic_equip then
                    for auto_type, auto_attachment_string in pairs(automatic_equip) do
                        automatic_equip_entries[#automatic_equip_entries+1] = {
                            auto_attachment_string = auto_attachment_string,
                            type = auto_type,
                        }
                    end
                end
            else
                -- -- Default overwrite
                -- if self.default_overwrite[item_name] and self.default_overwrite[item_name][attachment_slot] then
                --     self:_recursive_set_attachment(attachments, attachment, attachment_slot, self.default_overwrite[item_name][attachment_slot])
                -- else
                -- Default
                -- Get original master items
                local MasterItemsCached = MasterItems.get_cached()
                -- Get master item
                local master_item = MasterItemsCached[item_data.name]
                -- if not mod.test then
                --     mod:dtf(master_item, "master_item", 5)
                --     mod.test = true
                -- end
                -- Get attachment data
                local attachment_data = self:_recursive_find_attachment(master_item.attachments, attachment_slot)
                -- Get attachment
                local item = item_data.__master_item or item_data
                local attachment = self:get_gear_setting(gear_id, attachment_slot, item_data)
                -- -- Get fixes
                -- attachment_data = self:_apply_anchor_fixes(item_data, attachment_slot) or attachment_data
                -- Set attachment
                if attachment_data then
                    -- mod:echot("set "..tostring(attachment_slot).." to "..tostring(attachment))
                    self:_recursive_set_attachment(attachments, attachment, attachment_slot, attachment_data.item)
                end
                -- end
            end
        else -- Handle trinket
            -- -- Get master item instance
            -- local master_instance = item_data.__gear and item_data.__gear.masterDataInstance
            -- -- Get master attachments
            -- local master_attachments = master_instance and master_instance.overrides and master_instance.overrides.attachments
            -- if master_attachments then
            --     -- Get attachment data
            --     local attachment_data = self:_recursive_find_attachment(master_attachments, attachment_slot)
            --     -- -- Get fixes
            --     -- attachment_data = self:_apply_anchor_fixes(item_data, attachment_slot) or attachment_data
            --     if attachment_data and attachment_data.item then
            --         local trinket_name = nil
            --         -- Trinket string or table
            --         if type(attachment_data.item) == "string" then
            --             trinket_name = self:item_name_from_content_string(attachment_data.item)
            --         else
            --             trinket_name = self:item_name_from_content_string(attachment_data.item.__master_item.name)
            --         end
            --         -- Set attachment
            --         self:_recursive_set_attachment(attachments, trinket_name, attachment_slot, attachment_data.item)
            --     end
            -- end
        end
    end
    
    -- Handle automatic equips
    for _, auto_attachment_entry in pairs(automatic_equip_entries) do
        -- local sets = string_split(auto_attachment_entry.auto_attachment_string, ",")
		-- for _, set in pairs(sets) do
        -- if not string_find(auto_attachment_entry.auto_attachment_string, ",") then
            local parameters = string_split(auto_attachment_entry.auto_attachment_string, "|")
            local auto_attachment = nil
            if #parameters == 2 then
                local negative = string_find(parameters[1], "!")
                parameters[1] = string_gsub(parameters[1], "!", "")
                local attachment_data = self:_recursive_find_attachment(attachments, auto_attachment_entry.type)
                if attachment_data then
                    if negative and attachment_data.attachment_name ~= parameters[1] then
                        auto_attachment = parameters[2]
                    elseif attachment_data.attachment_name == parameters[1] then
                        auto_attachment = parameters[2]
                    end
                end
            else
                auto_attachment = parameters[1]
            end
            if auto_attachment and self.attachment_models[item_name][auto_attachment] then
                -- Get model
                local auto_model = self.attachment_models[item_name][auto_attachment].model
                -- Set attachment
                self:_recursive_set_attachment(attachments, auto_attachment, auto_attachment_entry.type, auto_model, true)
            end
        -- end
    end

end

mod:hook(CLASS.StoreService, "purchase_item", function(func, self, offer, ...)
    mod.purchase_gear_id = offer.description.gear_id
    return func(self, offer, ...)
end)

mod:hook(CLASS.GearService, "on_gear_created", function(func, self, gear_id, gear, ...)
    -- mod:dtf(gear, "purchased_gear", 20)
    local this_gear_id = mod.purchase_gear_id or mod.reward_gear_id
    -- mod:echo("create gear "..tostring(this_gear_id))
    if this_gear_id and mod:persistent_table(REFERENCE).temp_gear_settings[this_gear_id] then
        local attachments = table_clone(mod:persistent_table(REFERENCE).temp_gear_settings[this_gear_id])
        mod:persistent_table(REFERENCE).temp_gear_settings[this_gear_id] = nil
        -- mod:echo("purchased_gear "..tostring(this_gear_id))
        -- mod:echo("set settings for "..tostring(gear_id))
        for attachment_slot, attachment in pairs(attachments) do
            mod:set_gear_setting(gear_id, attachment_slot, attachment)
        end
    end
    mod.purchase_gear_id = nil
    mod.reward_gear_id = nil
    func(self, gear_id, gear, ...)
end)

mod:hook(CLASS.EndPlayerView, "_get_item", function(func, self, card_reward, ...)
    local item, item_group, rarity, item_level = func(self, card_reward, ...)
    if mod:get("mod_option_randomization_store") then
        mod.reward_gear_id = mod:get_gear_id(item) or "reward"
        -- mod:echo("randomize reward "..tostring(mod.reward_gear_id))
        if not mod:persistent_table(REFERENCE).temp_gear_settings[mod.reward_gear_id] then
            local master_item = item.__master_item or item
            local random_attachments = mod:randomize_weapon(master_item)
            mod:persistent_table(REFERENCE).temp_gear_settings[mod.reward_gear_id] = random_attachments
            -- Auto equip
            for attachment_slot, value in pairs(random_attachments) do
                if not mod.add_custom_attachments[attachment_slot] then
                    mod:resolve_auto_equips(item, value)
                end
            end
            for attachment_slot, value in pairs(random_attachments) do
                if mod.add_custom_attachments[attachment_slot] then
                    mod:resolve_auto_equips(item, value)
                end
            end
            -- Special resolve
            for attachment_slot, value in pairs(random_attachments) do
                if mod.add_custom_attachments[attachment_slot] then
                    mod:resolve_special_changes(item, value)
                end
            end
            for attachment_slot, value in pairs(random_attachments) do
                if not mod.add_custom_attachments[attachment_slot] then
                    mod:resolve_special_changes(item, value)
                end
            end
        end
    end
    return item, item_group, rarity, item_level
end)

mod:hook_require("scripts/foundation/managers/package/utilities/item_package", function(instance)

    if not instance.__resolve_item_packages_recursive then instance.__resolve_item_packages_recursive = instance._resolve_item_packages_recursive end
    instance._resolve_item_packages_recursive = function(attachments, items_dictionary, result)
        if instance.processing_item then
            local gear_id = mod:get_gear_id(instance.processing_item)

            local in_possesion_of_player = mod:item_in_possesion_of_player(instance.processing_item)
            local in_possesion_of_other_player = mod:item_in_possesion_of_other_player(instance.processing_item)
            local in_store = mod:item_in_store(instance.processing_item)
            local store = in_store and mod:get("mod_option_randomization_store")
            local player = in_possesion_of_other_player and mod:get("mod_option_randomization_players")
            local randomize = store or player
            if randomize and gear_id then
                if not mod:persistent_table(REFERENCE).temp_gear_settings[gear_id] then
                    local master_item = instance.processing_item.__master_item or instance.processing_item
                    local random_attachments = mod:randomize_weapon(master_item)
                    mod:persistent_table(REFERENCE).temp_gear_settings[gear_id] = random_attachments
                    -- Auto equip
                    for attachment_slot, value in pairs(random_attachments) do
                        if not mod.add_custom_attachments[attachment_slot] then
                            mod:resolve_auto_equips(instance.processing_item, value)
                        end
                    end
                    for attachment_slot, value in pairs(random_attachments) do
                        if mod.add_custom_attachments[attachment_slot] then
                            mod:resolve_auto_equips(instance.processing_item, value)
                        end
                    end
                    -- Special resolve
                    for attachment_slot, value in pairs(random_attachments) do
                        if mod.add_custom_attachments[attachment_slot] then
                            mod:resolve_special_changes(instance.processing_item, value)
                        end
                    end
                    for attachment_slot, value in pairs(random_attachments) do
                        if not mod.add_custom_attachments[attachment_slot] then
                            mod:resolve_special_changes(instance.processing_item, value)
                        end
                    end
                end
            end

            if gear_id then
                mod:setup_item_definitions()

                -- Add flashlight slot
                mod:_add_custom_attachments(instance.processing_item, attachments)
                
                -- Overwrite attachments
                mod:_overwrite_attachments(instance.processing_item, attachments)

                local found_packages = mod:get_modded_item_packages(attachments)
                for _, package_name in pairs(found_packages) do
                    mod:persistent_table(REFERENCE).used_packages.hub[package_name] = true
                end
            end

            instance.processing_item = nil
        end
        instance.__resolve_item_packages_recursive(attachments, items_dictionary, result)
    end

    if not instance._compile_item_instance_dependencies then instance._compile_item_instance_dependencies = instance.compile_item_instance_dependencies end
    instance.compile_item_instance_dependencies = function(item, items_dictionary, out_result, optional_mission_template)
        if item and item.__master_item then
            instance.processing_item = item
        end
        return instance._compile_item_instance_dependencies(item, items_dictionary, out_result, optional_mission_template)
    end

end)

-- ##### ┬┌┬┐┌─┐┌┬┐  ┌─┐┬─┐┌─┐┬  ┬┬┌─┐┬ ┬┌─┐ ##########################################################################
-- ##### │ │ ├┤ │││  ├─┘├┬┘├┤ └┐┌┘│├┤ │││└─┐ ##########################################################################
-- ##### ┴ ┴ └─┘┴ ┴  ┴  ┴└─└─┘ └┘ ┴└─┘└┴┘└─┘ ##########################################################################

local present_hook = function(func, self, item, ...)
    mod.previewed_weapon = {f = mod:has_flashlight(item), l = mod:has_laser_pointer(item)}
	local ret = func(self, item, ...)
    mod.previewed_weapon = nil
    return ret
end

mod:hook(CLASS.ViewElementWeaponStats, "present_item", present_hook) --function(func, self, item, is_equipped, on_present_callback, ...)
--     mod.previewed_weapon = {f = mod:has_flashlight(item), l = mod:has_laser_pointer(item)}
-- 	func(self, item, is_equipped, on_present_callback, ...)
--     mod.previewed_weapon = nil
-- end)

mod:hook(CLASS.ViewElementWeaponActions, "present_item", present_hook) --function(func, self, item, ...)
--     mod.previewed_weapon = {f = mod:has_flashlight(item), l = mod:has_laser_pointer(item)}
-- 	func(self, item, ...)
-- 	mod.previewed_weapon = nil
-- end)

mod:hook(CLASS.ViewElementWeaponInfo, "present_item", present_hook) --function(func, self, item, ...)
--     mod.previewed_weapon = {f = mod:has_flashlight(item), l = mod:has_laser_pointer(item)}
-- 	func(self, item, ...)
-- 	mod.previewed_weapon = nil
-- end)

mod:hook(CLASS.ViewElementWeaponPatterns, "present_item", present_hook) --function(func, self, item, ...)
--     mod.previewed_weapon = {f = mod:has_flashlight(item), l = mod:has_laser_pointer(item)}
-- 	func(self, item, ...)
-- 	mod.previewed_weapon = nil
-- end)

mod:hook(CLASS.ViewElementWeaponActionsExtended, "present_item", present_hook) --function(func, self, item, ...)
--     mod.previewed_weapon = {f = mod:has_flashlight(item), l = mod:has_laser_pointer(item)}
-- 	func(self, item, ...)
-- 	mod.previewed_weapon = nil
-- end)

mod:hook(CLASS.WeaponStats, "get_compairing_stats", function(func, self, ...)
    -- mod.previewed_weapon = {f = mod:has_flashlight(self._item), l = mod:has_laser_pointer(self._item)}
	-- local values = func(self, ...)
	-- mod.previewed_weapon = nil
    -- return values
    return present_hook(func, self, self._item, ...)
end)

-- ##### ┬ ┬┌─┐┌─┐┌─┐┌─┐┌┐┌  ┌┬┐┌─┐┌┬┐┌─┐┬  ┌─┐┌┬┐┌─┐┌─┐ ##############################################################
-- ##### │││├┤ ├─┤├─┘│ ││││   │ ├┤ │││├─┘│  ├─┤ │ ├┤ └─┐ ##############################################################
-- ##### └┴┘└─┘┴ ┴┴  └─┘┘└┘   ┴ └─┘┴ ┴┴  ┴─┘┴ ┴ ┴ └─┘└─┘ ##############################################################

mod.template_add_torch = function(self, orig_weapon_template)
    if self.previewed_weapon and orig_weapon_template then
        local templates = self:persistent_table(REFERENCE).weapon_templates
        if not templates[orig_weapon_template.name] then
            templates[orig_weapon_template.name] = table_clone(orig_weapon_template)
        end
        local weapon_template = templates[orig_weapon_template.name]
            
        if weapon_template.displayed_weapon_stats_table and weapon_template.displayed_weapon_stats_table.damage[3] then
            weapon_template.displayed_weapon_stats_table.damage[3] = nil
        end

        if self.previewed_weapon.l then
            weapon_template.displayed_attacks.special = {
                type = "vent",
                display_name = "loc_weapon_special_laser_pointer",
                desc = "loc_stats_special_action_laser_pointer_desc",
            }
        elseif self.previewed_weapon.f then
            weapon_template.displayed_attacks.special = {
                desc = "loc_stats_special_action_flashlight_desc",
                display_name = "loc_weapon_special_flashlight",
                type = "flashlight",
            }
        end

        return weapon_template
    end
	return orig_weapon_template
end

-- mod.template_set_bolt_pistol = function(self, orig_weapon_template)
--     if orig_weapon_template and orig_weapon_template.anim_state_machine_3p and string_find(orig_weapon_template.anim_state_machine_3p, "bolt_gun") then
--         local templates = self:persistent_table(REFERENCE).weapon_templates
--         if not templates[orig_weapon_template.name] then
--             templates[orig_weapon_template.name] = table_clone(orig_weapon_template)
--         end
--         local weapon_template = templates[orig_weapon_template.name]

--         weapon_template.anim_state_machine_3p = "content/characters/player/human/third_person/animations/lasgun_pistol"
--         weapon_template.anim_state_machine_1p = "content/characters/player/human/first_person/animations/lasgun_pistol"

--         return weapon_template
--     end
--     return orig_weapon_template
-- end

mod:hook_require("scripts/utilities/weapon/weapon_template", function(instance)
	if not instance._weapon_template then instance._weapon_template = instance.weapon_template end
	instance.weapon_template = function(template_name)
		local weapon_template = instance._weapon_template(template_name)
        -- local weapon_template = mod:template_set_bolt_pistol(weapon_template)
		return mod:template_add_torch(weapon_template)
	end
end)

mod:hook_require("scripts/settings/equipment/flashlight_templates", function(instance)
    for name, template in pairs(instance) do
        template.light.first_person.cast_shadows = mod:get("mod_option_flashlight_shadows")
        template.light.third_person.cast_shadows = mod:get("mod_option_flashlight_shadows")
    end
end)

-- ##### ┬┌┐┌┌─┐┬ ┬┌┬┐ ################################################################################################
-- ##### ││││├─┘│ │ │  ################################################################################################
-- ##### ┴┘└┘┴  └─┘ ┴  ################################################################################################

local input_hook = function (func, self, action_name, ...)
    local pressed = func(self, action_name, ...)
    local wielded = mod:execute_extension(mod.player_unit, "flashlight_system", "is_wielded")
    local modded = mod:execute_extension(mod.player_unit, "flashlight_system", "is_modded")
    if mod.initialized and wielded and modded then
        if action_name == "weapon_extra_pressed" and pressed then
            mod:execute_extension(mod.player_unit, "flashlight_system", "on_toggle")
            return self:get_default(action_name)
        end
        if action_name == "weapon_extra_hold" then
            return self:get_default(action_name)
        end
    end
    return pressed
end
  
-- Detach player movement from camera
mod:hook(CLASS.InputService, "_get", input_hook)

-- Detach simulated player movement from camera
mod:hook(CLASS.InputService, "_get_simulate", input_hook)
