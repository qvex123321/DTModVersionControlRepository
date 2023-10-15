local dmf = get_mod("DMF")

-- ####################################################################################################################
-- ##### Locals and Variables #########################################################################################
-- ####################################################################################################################

-- hook_type is an identifier to help distinguish the different api calls.
local HOOK_TYPES = {
    hook        = 1,
    hook_safe   = 2,
    hook_origin = 3,
}

-- Constants to ease on table lookups when not needed
local HOOK_TYPE_NORMAL = 1
local HOOK_TYPE_SAFE   = 2
local HOOK_TYPE_ORIGIN = 3

-- dont need to attach this to registry.
local _delayed_hooks = {}
local _delaying_enabled = true

-- Functions referenced by input:get()
local _input_get_functions = {
    _get          = true,
    _get_simulate = true,
}

-- This metatable will automatically create a table entry if one doesnt exist.
-- This lets us easily do _registry[mod] without having to worry about nil-checking it.
local auto_table_meta = {__index = function(t, k) t[k] = {} return t[k] end }

-- This table will hold all mod-specific data.
local _registry = setmetatable({}, auto_table_meta)
_registry.uids = {}

-- This table will hold all of the hooks, in the format of _hooks[hook_type]
-- Do the same thing with these tables to allow _hooks[hook_type][orig] without a ton of nil-checks.
-- Since there can only be one origin per function, it doesnt need to generate a table.
local _hooks = {
    setmetatable({}, auto_table_meta), -- normal
    setmetatable({}, auto_table_meta), -- safe
    {}, -- origin
}

local _file_hooks_by_file = {}
local _file_hooks_applied_to_file = {}

local _origs = {}

-- ####################################################################################################################
-- ##### Util functions ###############################################################################################
-- ####################################################################################################################

-- This will tell us if we already have the given function in our registry.
local function is_orig_hooked(obj, method)
    if _origs[obj] and _origs[obj][method] then
        return true
    end
    return false
end

-- Since we replace the original function, we need to keep its reference around.
-- This will grab the cached reference if we hooked it before, otherwise return the function.
local function get_orig_function(obj, method)
    if is_orig_hooked(obj, method) then
        return _origs[obj][method]
    else
        return obj[method]
    end
end

-- Return an object from the global table. Second return value is if it was successful.
local function get_object_reference(obj)
    if type(obj) == "table" then
        return obj, true
    elseif type(obj) == "string" then
        local obj_table = rawget(_G, obj)
        if obj_table then
            return obj_table, true
        end
    end
    return obj, false
end

-- We need to get the number of return values for accurate unpacking
-- This is based on Lupo/Propjoe table.pack, but without putting the number inside the table
local function get_return_values(...)
    local num = select('#', ...)
    return num, { ... }
end

local function can_rehook(mod, hook_data, obj, hook_type)
    if mod:get_internal_data("allow_rehooking") and hook_data.obj == obj and hook_data.hook_type == hook_type then
        return true
    end
end

-- Search global table for an object that matches to get a readable string.
local function print_obj(obj)
    for k, v in pairs(_G) do
        if v == obj then
            return k
        end
    end
    return obj
end

-- ####################################################################################################################
-- ##### Hook Creation ################################################################################################
-- ####################################################################################################################

-- For any given original function, return the newest entry of the hook_chain.
-- Since all hooks of the chain contain the call to the previous one, we don't need to do any manual loops.
-- This continues until the end of the chain, where the original function is called.
local function get_hook_chain(orig, unique_id)
    local hook_registry = _hooks
    local hooks = hook_registry[HOOK_TYPE_NORMAL][unique_id]
    if hooks and #hooks > 0 then
        return hooks[#hooks]
    end
    -- We can't simply return orig here, or it would cause origins to depend on load order.
    return function(...)
        if hook_registry[HOOK_TYPE_ORIGIN][unique_id] then
            return hook_registry[HOOK_TYPE_ORIGIN][unique_id](...)
        else
            return orig(...)
        end
    end
end

-- Returns a table containing hook data inside of it.
local function create_hook_data(mod, obj, orig, handler, hook_type)
    return {
        active = mod:is_enabled(),
        hook_type = hook_type,
        handler = handler,
        orig = orig,
        obj = obj,
    }
end

-- Returns a function closure with all the information needed for a given hook to be handled correctly.
-- Note: If a previous hook is removed from the table, these functions wouldn't be updated
--       This would break the chain, solution is to not remove the hooks, simply make them inactive
--       Make sure inactive hooks that rely on the chain still call the next function seamlessly.
local function create_specialized_hook(mod, unique_id, hook_type)
    local func
    local hook_data = _registry[mod][unique_id]
    local orig = hook_data.orig

    -- Determine the previous function in the hook stack
    local previous_hook = get_hook_chain(orig, unique_id)

    if hook_type == HOOK_TYPE_NORMAL then
        func = function(...)
            if hook_data.active then
                return hook_data.handler(previous_hook, ...)
            else
                return previous_hook(...)
            end
        end
    -- Make sure hook_origin directly calls the original function if inactive.
    elseif hook_type == HOOK_TYPE_ORIGIN then
        func = function(...)
            if hook_data.active then
                return hook_data.handler(...)
            else
                return orig(...)
            end
        end
    elseif hook_type == HOOK_TYPE_SAFE then
        func = function(...)
            if hook_data.active then
                dmf.safe_call_nr(mod, "(safe_hook)", hook_data.handler, ...)
            end
        end
    end
    return func
end

-- The hook system makes internal functions that replace the original function and handles all the hooks.
-- Once all hooks that are part of the chain have been executed, we can go over the safe hooks.
-- Note: We need to keep the return values in mind in case another function depends on them.
-- We then use this internal hook as a unique identifier for the registry.
local function create_internal_hook(orig, obj, method)
    local fn -- Needs to be over two line to be usable within the closure.
    fn = function(...)
        local hook_chain = get_hook_chain(orig, fn)
        local num_values, values = get_return_values( hook_chain(...) )

        local safe_hooks = _hooks[HOOK_TYPE_SAFE][fn]
        if safe_hooks and #safe_hooks > 0 then
            for i = 1, #safe_hooks do safe_hooks[i](...) end
        end
        return unpack(values, 1, num_values)
    end

    if not _origs[obj] then _origs[obj] = {} end
    _origs[obj][method] = orig
    obj[method] = fn
    return fn
end

-- This function handles the handling the hook data and adding them to the registry.
-- Origin Hooks have to be unique by nature so we have to make sure we don't allow multiple mods to do it.
local function create_hook(mod, orig, obj, method, handler, func_name, hook_type)
    local unique_id

    if not is_orig_hooked(obj, method) then
        unique_id = create_internal_hook(orig, obj, method)
        _registry.uids[unique_id] = orig
    else
        unique_id = obj[method]
    end
    mod:info("(%s): Hooking '%s' from [%s] (Origin: %s)", func_name, method, print_obj(obj), orig)

    -- Check to make sure this mod hasn't hooked it before
    local hook_data = _registry[mod][unique_id]
    if not hook_data then
        _registry[mod][unique_id] = create_hook_data(mod, obj, orig, handler, hook_type)

        local hook_registry = _hooks[hook_type]
        if hook_type == HOOK_TYPE_ORIGIN then
            if hook_registry[unique_id] then
                mod:error("(%s): Attempting to hook origin of already hooked function %s", func_name, method)
            else
                hook_registry[unique_id] = create_specialized_hook(mod, unique_id, hook_type)
            end
        else
            table.insert(hook_registry[unique_id], create_specialized_hook(mod, unique_id, hook_type) )
        end
    else
        -- If hook_data already exists and it's the same hook_type, we can safely change the hook handler.
        -- This should (in practice) only be used for debugging by modders who uses DoFile.
        -- Revisit purpose when lua files are in plain text.
        if can_rehook(mod, hook_data, obj, hook_type) then
            hook_data.handler = handler
        elseif mod:get_internal_data("allow_rehooking") then
            -- If we can't rehook but rehooking is enabled, send a warning that something went wrong
            mod:warning("(%s): Attempting to rehook active hook [%s] with different obj or hook_type.",
                                                                                        func_name, method)
        else
            mod:warning("(%s): Attempting to rehook active hook [%s].", func_name, method)
        end
    end

    if _input_get_functions[method] then
        dmf._input_services_hooked = false
    end
end

-- Applies delayed hooks set for the given object name.
local function apply_delayed_hooks_by_obj_name(obj_name)
    if _delayed_hooks[obj_name] and #_delayed_hooks[obj_name] > 0 then

        -- Check for the object before attempting hooks
        local obj, success = get_object_reference(obj_name) --luacheck: ignore
        if obj and success then
            dmf:info("Attempting to hook %s delayed hooks for object %s", #_delayed_hooks[obj_name], obj_name)

            -- Go through the table in reverse so we don't get any issues removing entries inside the loop
            for i = #_delayed_hooks[obj_name], 1, -1 do
                _delayed_hooks[obj_name][i]()
                table.remove(_delayed_hooks[obj_name], i)
            end

            -- Remove the table if empty
            if #_delayed_hooks[obj_name] == 0 then
                _delayed_hooks[obj_name] = nil
            end
        end
    end
end

-- ####################################################################################################################
-- ##### GENERIC API ##################################################################################################
-- ####################################################################################################################
-- Singular functions that works on a generic basis so the DMFMod API can be tailored for user simplicity.
-- These functions are mostly used for type-checking before sending the data to the appropriate internal functions.

-- Valid styles:

-- Giving a string pointing to a global object table and method string and hook function
--     mod, string (obj), string (method), function (handler), string (func_name)
-- Giving an object table and a method string and hook function
--     mod, table (obj), string (method), function (handler), string (func_name)
-- Giving a method string and a hook function (hooking global functions)
--     mod, string (method), function (handler), nil, string (func_name)

local function generic_hook(mod, obj, method, handler, func_name)
    if dmf.check_wrong_argument_type(mod, func_name, "obj", obj, "string", "table") or
       dmf.check_wrong_argument_type(mod, func_name, "method", method, "string", "function") or
       dmf.check_wrong_argument_type(mod, func_name, "handler", handler, "function", "nil")
    then
        return
    end

    -- Shift the arguments if no obj is provided. obj becomes the global table.
    if not handler then
        obj, method, handler = _G, obj, method
        if not method then
            mod:error("(%s): trying to create hook without giving a method name.", func_name)
            return
        end
    end

    -- Get hook_type based on name
    local hook_type = HOOK_TYPES[func_name]

    -- Grab the object's reference, if this fails, obj will remain a string and the hook will be delayed.
    local obj, success = get_object_reference(obj) --luacheck: ignore
    if obj and not success then
        if _delaying_enabled and type(obj) == "string" then
            -- Call this func at a later time, using upvalues.
            mod:info("(%s): [%s.%s] needs to be delayed.", func_name, obj, method)

            -- Sort hooks by obj string
            _delayed_hooks[obj] = _delayed_hooks[obj] or {}
            _delayed_hooks[obj][#_delayed_hooks[obj] + 1] = function()
                generic_hook(mod, obj, method, handler, func_name)
            end
            return
        else
            mod:error("(%s): trying to hook object that doesn't exist: %s", func_name, obj)
            return
        end
    end
    -- obj should always be a table reference at this point --

    -- Quick check to make sure the target exists
    if not obj[method] then
        mod:error("(%s): trying to hook function or method that doesn't exist: [%s.%s]",
                                                            func_name, print_obj(obj), method)
        return
    end

    local orig = get_orig_function(obj, method)
    if type(orig) ~= "function" then
        mod:error("(%s): trying to hook %s (a %s), not a function.", func_name, method, type(orig))
        return
    end

    -- Edge Case: If someone hooks a copy of a function after its been hooked, point it back in the right direction
    if _registry.uids[orig] then
        orig = _registry.uids[orig]
    end

    return create_hook(mod, orig, obj, method, handler, func_name, hook_type)
end

local function generic_hook_toggle(mod, obj, method, enabled_state)
    local func_name = (enabled_state and "hook_enable") or "hook_disable"

    if dmf.check_wrong_argument_type(mod, func_name, "obj", obj, "string", "table") or
    dmf.check_wrong_argument_type(mod, func_name, "method", method, "string", "nil") then
        return
    end

    -- Shift the arguments if needed
    if not method then
        obj, method = _G, obj
        if not method then
            mod:error("(%s): trying to toggle hook without giving a method name.", func_name)
            return
        end
    end

    local obj, success = get_object_reference(obj) --luacheck: ignore
    if obj and not success then
        if _delaying_enabled and type(obj) == "string" then
            -- Call this func at a later time, using upvalues.
            mod:info("(%s): [%s.%s] needs to be delayed.", func_name, obj, method)

            -- Sort hooks by obj string
            _delayed_hooks[obj] = _delayed_hooks[obj] or {}
            _delayed_hooks[obj][#_delayed_hooks[obj] + 1] = function()
                generic_hook_toggle(mod, obj, method, enabled_state)
            end
            return
        else
            mod:error("(%s): trying to toggle hook on object that doesn't exist: %s", func_name, obj)
            return
        end
    end

    if _registry[mod][obj[method]] then
        _registry[mod][obj[method]].active = enabled_state

        if _input_get_functions[method] and enabled_state then
            dmf._input_services_hooked = false
        end
    else
        -- This has the potential for mod-breaking behavior, but not guaranteed
        mod:warning("(%s): trying to toggle hook that doesn't exist: %s", func_name, method)
    end
end

local function toggle_all_hooks_for_mod(mod, enabled_state)
    local toggle_status = (enabled_state and "Enabling") or "Disabling"
    if next(_registry[mod]) then
        mod:info("(hooks): %s all hooks for mod: %s", toggle_status, mod:get_name())
    end
    for _, hook_data in pairs(_registry[mod]) do
        hook_data.active = enabled_state
    end
    if enabled_state then
        dmf._input_services_hooked = false
    end
end

-- ####################################################################################################################
-- ##### DMFMod #######################################################################################################
-- ####################################################################################################################

-- :hook_safe() provides callback after a function is called. You have no control over the execution of the
--          original function, nor can you change its return values, making it much safer to use.
-- The handler is never given the a "func" parameter.
-- These will always be executed the original function and the hook chain.
function DMFMod:hook_safe(obj, method, handler)
    return generic_hook(self, obj, method, handler, "hook_safe")
end

-- :hook() will allow you to hook a function, allowing your handler to replace the function in the stack,
--         and control its execution. All hooks on the same function will be part of a chain, with the
--         original function at the end. Your handler has to call the next function in the chain manually.
-- The chain of event is determined by mod load order.
function DMFMod:hook(obj, method, handler)
    return generic_hook(self, obj, method, handler, "hook")
end

-- :hook_origin() allows you to directly hook a function, replacing it. The original function will bever be called.
--            This hook will not be part of the hook chain proper, instead taking the place of the original function.
-- This is similar to :back functionality that was sparsely used in old V1 mods.
-- The handler is never given the a "func" parameter.
-- This there is a limit of a single origin hook for any given function.
-- This should only be used as a last resort due to its limitation and its potential to break the game if not careful.
function DMFMod:hook_origin(obj, method, handler)
    return generic_hook(self, obj, method, handler, "hook_origin")
end

-- :hook_require() allows you to hook every past and future version of a game file,
--         executing a callback function on every instance.
-- The chain of event is determined by mod load order.
function DMFMod:hook_require(obj_str, callback_func)

    -- Set up the tables for the file
    local mod_name = self:get_name()
    _file_hooks_by_file[obj_str]                   = _file_hooks_by_file[obj_str] or {}
    _file_hooks_applied_to_file[obj_str]           = _file_hooks_applied_to_file[obj_str] or {}
    _file_hooks_applied_to_file[obj_str][mod_name] = _file_hooks_applied_to_file[obj_str][mod_name] or {}

    -- Store file hooks by mod name to prevent duplicates per mod
    _file_hooks_by_file[obj_str][mod_name] = callback_func

    -- Run the hook's callback on every instance of the file
    local all_file_instances = self:get_require_store(obj_str)
    if all_file_instances then
        for i, instance in ipairs(all_file_instances) do
            if instance and not _file_hooks_applied_to_file[obj_str][mod_name][i] then
                callback_func(instance)
                _file_hooks_applied_to_file[obj_str][mod_name][i] = true
            end
        end
    end
end

-- Enable/disable functions for all hook types:
function DMFMod:hook_enable(obj, method)
    generic_hook_toggle(self, obj, method, true)
end

function DMFMod:hook_disable(obj, method)
    generic_hook_toggle(self, obj, method, false)
end

function DMFMod:enable_all_hooks()
    toggle_all_hooks_for_mod(self, true)
end

function DMFMod:disable_all_hooks()
    toggle_all_hooks_for_mod(self, false)
end

-- ####################################################################################################################
-- ##### DMF internal functions and variables #########################################################################
-- ####################################################################################################################

-- Remove all hooks when DMF is about to be reloaded
dmf.hooks_unload = function()
    for key, value in pairs(_origs) do
        -- origs[method] = orig
        if type(value) == "function" then
            _G[key] = value
        -- origs[obj][method] = orig
        elseif type(value) == "table" then
            for method, orig in pairs(value) do
                key[method] = orig
            end
        end
    end
end

-- Apply all previously-delayed hooks
dmf.apply_delayed_hooks = function()
    local num_delayed = 0

    for obj_name, hooks in pairs(_delayed_hooks) do
        num_delayed = num_delayed + #hooks
        apply_delayed_hooks_by_obj_name(obj_name)
    end

    if num_delayed > 0 then
        dmf:info("Attempted to hook " .. tostring(num_delayed) .. " delayed function" ..
            (num_delayed == 1 and "" or "s"))
    end
end

-- Apply all associated file hooks to the given file
dmf.apply_hooks_to_file = function(require_store, filepath, store_index)

    -- If the file has hooks and the instance exists
    if _file_hooks_by_file[filepath] and require_store and require_store[store_index] then

        -- Apply every hook for the file to the instance
        for mod_name, callback_func in pairs(_file_hooks_by_file[filepath]) do
            if not _file_hooks_applied_to_file[filepath][mod_name][store_index] then
                callback_func(require_store[store_index])
            end
        end
    end
end

-- ####################################################################################################################
-- ##### Hooks ########################################################################################################
-- ####################################################################################################################

-- If class() is called on an object we've delayed for, re-run delayed hooks
dmf:hook(_G, "class", function(func, class_name, ...)
    local class_object = func(class_name, ...)
    if _delayed_hooks[class_name] then
        dmf:info("%s is now available for previously-delayed hooks.", class_name)

        -- Methods aren't defined yet, so we need to wait for the instance creation to apply delayed hooks
        dmf:hook(class_object, "new", function (class_func, ...)
            apply_delayed_hooks_by_obj_name(class_name)
            dmf:hook_disable(class_object, "new")
            return class_func(...)
        end)
    end
    return class_object
end)

-- Track simulated action start
dmf:hook_safe(CLASS.InputService, "start_simulate_action", function (self)
    self._is_simulating = true
end)

-- Track simulated action stop
dmf:hook_safe(CLASS.InputService, "stop_simulate_action", function (self)
    self._is_simulating = not table.is_empty(self._simulated_actions)
end)

-- Refresh input:get() hooks
dmf:hook_safe(CLASS.InputManager, "update", function (self)
    if not dmf._input_services_hooked then
        for _, service in pairs(self._input_services) do
            service.get = service._is_simulating and service._get_simulate or service._get
        end

        dmf._input_services_hooked = true
    end
end)