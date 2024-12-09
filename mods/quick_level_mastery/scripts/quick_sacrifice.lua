local mod = get_mod("quick_level_mastery")

local MasterItems = require("scripts/backend/master_items")
local Mastery = require("scripts/utilities/mastery")
local Promise = require("scripts/foundation/utilities/promise")
local CraftingSettings = require("scripts/settings/item/crafting_settings")
local MasteryUtils = require("scripts/utilities/mastery")

local QuickSacrifice = {}

-----------
-- HOOKS --
-----------

---------------
-- FUNCTIONS --
---------------

QuickSacrifice.p_check_mastery_completion = function(item_pattern)
    return Managers.data_service.mastery:get_mastery_by_pattern(item_pattern):next(function(mastery_data)
        if not table.is_empty(mastery_data) then
			return mastery_data.mastery_level >= #mastery_data.milestones
		end
        return false
	end)
end

-- Add pool of items to be sacrificed.
QuickSacrifice.add_sacrifices = function(self, items)
    log_debug("on_quick_purchase_complete")
    for i, item_data in ipairs(items) do
		local uuid = item_data.uuid
		local item = MasterItems.get_item_instance(item_data, uuid)

		if not item then
            mod:notify("Unable to sacrifice item")
		    return
		end

        if not self._stored_items then
            self._stored_items = {}
        end

        local pattern = item.parent_pattern

        log_debug("Upgrading item:")
        log_debug("item rarity: " .. tostring(item.rarity))
        if item.rarity < 2 then
            self.upgrade_item_promise(item):next(function(result)
                log_debug("Upgraded for sacrifice.")
            end)
        end

        log_debug("not pattern")
        if not self._stored_items[pattern] then
            self._stored_items[pattern] = {} -- Initialize the pattern if it doesn't exist
        end

        log_debug("not pattern items")
        if not self._stored_items[pattern].items then
            self._stored_items[pattern].items = {} -- Initialize items if it doesn't exist
        end

        log_debug("insert test")
        table.insert(self._stored_items[pattern].items, item)
    end

    log_debug("table add success")
    log_debug(self._stored_items)
end

-- Promise for upgrading an item (weapon only)
QuickSacrifice.upgrade_item_promise = function(local_item)
    local valid = CraftingSettings.recipes.upgrade_item.is_valid_item(local_item)
    if not valid then
        log_debug("Item not valid for upgrade. Cancelling crafting")
        return Promise.rejected()
    end
    local costs = CraftingSettings.recipes.upgrade_item.get_costs({item = local_item})
    local gear_id = local_item.gear_id
    return Managers.data_service.crafting:upgrade_weapon_rarity(gear_id, costs)
end

-- Sacrifices all items stored based on pattern (category) of weapon
QuickSacrifice._batch_sacrifice = function(self)
    log_debug("Begin batching")
    if not self._stored_items or not next(self._stored_items) then
        log_debug("No sacrifices batched")
        return
    end

    for pattern, data in pairs(self._stored_items) do
        log_debug("Batch: " .. tostring(pattern))
        self:_sacrifice_items(pattern, data.items):next(function()
            self._stored_items = nil
        end)
    end
end

-- Sacrifices items to specified mastery_id (parent_pattern)
QuickSacrifice._sacrifice_items = function(self, mastery_id, items)
	if not items then
        log_debug("Unable to sacrifice item list")
		return
	end

    local gear_ids = {}

    for i, item in pairs(items) do
		gear_ids[#gear_ids + 1] = item.gear_id
	end

    log_debug("Begin extract")
	return Managers.data_service.crafting:extract_weapon_mastery(mastery_id, gear_ids):next(function (data)
		for i = 1, #data.gear_ids do
			local gear_id = data.gear_ids[i]
		end

        log_debug("Settled gear_ids")

		if data.amount > 0 then

            local track_id = Managers.data_service.mastery:get_track_id(mastery_id)
            local mastery_data = Managers.data_service.mastery:get_mastery(mastery_reward.trackId)

            log_debug("Retrieved mastery_data")

			Managers.data_service.mastery:claim_levels_by_new_exp(mastery_data):next(function (data)
				local new_claim_level = data and data.claimed_level

                log_debug("Retrieved result data from level claim")

				if new_claim_level then
                    mod.notify(new_claim_level)
                    --self._masteries[mastery_id].claimed_level = new_claim_level
				end
			end)
		end
	end)
end

-----------
-- DEBUG --
-----------

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function log_debug(obj)
    if not obj then return end
    if not mod.enable_debug then return end

    local output = tostring(obj)
    mod:echo(output)

    if type(obj) == "table" then
        mod:dump(obj)
    end
end

return QuickSacrifice