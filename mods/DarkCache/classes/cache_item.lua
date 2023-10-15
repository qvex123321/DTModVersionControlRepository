DC.CacheItem = {}
DC.CacheItem.__index = DC.CacheItem
local s = DC.CacheItem

DC.fetch_enums = {
	results = {
		NONE = "none",
		SUCCESSFUL = "success",
		FAILED = "failed"
	},
	reasons = {
		NONE = "none",
		NO_PROMISE = "no_promise",
		CONNECTION_TIMEOUT = "connection_timeout",
		FAILED_BEFORE_RESPONSE = "failed_before_response"
	}
}

s.expired_at_time = -1
s.expires_at_time = math.huge
s.fetch_params = {}
s.cb_fetch = function(...) end
s.cb_response = function(...) end
s.refresh_on_expiry = false
s.needs_refresh = false
s.enabled = false

s.last_fetch = {
	time = -1,
	result = DC.fetch_enums.results.NONE,
	reason = DC.fetch_enums.reasons.NONE,
}

s.new = function(template)
	if template == nil or template == {} then
		return nil
	end

	local self = {}
	setmetatable(self, s)

	self.template = template
	self.key = template.key
	self.cb_fetch = template.cb_fetch
	self.cb_response = template.cb_response
	self.fetch_params = {}
	self.refresh_on_expiry = template.refresh_on_expiry
	self.needs_refresh = true
	self.setting_id = template.setting_id
	self.enabled = true

	DC.rt:print("New CacheItem: " .. self.key)
	return self
end

function s:try_get_data()
	if not self.enabled then
		return nil
	end

	if self.fetching then
		DC.rt:print("Already fetching: " .. self.key)
		return { status = "already_fetching" }
	end

	-- Since we're trying to *get* the data right now and it's expired, we have
	-- no choice but to immediately fetch.
	if self:is_expired() then
		DC.rt:print("Hit (Expired): " .. self.key)
		self:refresh()
		return self.data
	end

	DC.rt:print("Hit: " .. self.key)
	return self.data
end

function s:is_expired()
	return DC.server_time > self.expires_at_time
end

function s:expire()
	self.expired_at_time = DC.server_time
	self.expires_at_time = -1
	self.needs_refresh = self.refresh_on_expiry
end

function s:fetch()
	DC.rt:print("Fetching: " .. self.key)

	self.last_fetch.time = DC.server_time
	self.last_fetch.result = DC.fetch_enums.results.FAILED
	self.last_fetch.reason = DC.fetch_enums.reasons.FAILED_BEFORE_RESPONSE

	self.fetching = true
	local response = self:cb_fetch()
	self.fetching = false

	if response then
		if response.is_promise then
			self.last_fetch.result = DC.fetch_enums.results.SUCCESSFUL
			self.last_fetch.reason = DC.fetch_enums.reasons.NONE

			return response:next(function(data)
				self:cb_response(data)
				return data
			end)
		end

		self.last_fetch.result = DC.fetch_enums.results.SUCCESSFUL
		self.last_fetch.reason = DC.fetch_enums.reasons.NONE
		return response
	end

	-- Fetch failed for whatever reason. Set as expired but without auto-refresh.
	self:expire()
	self.refresh_on_expiry = false
	return nil
end

function s:refresh()
	if not self.enabled then
		return false
	end

	DC.refresh_happened = true
	self.needs_refresh = false
	self.data = self:fetch()

	if self.expires_at_time == -1 then
		self.expires_at_time = math.huge
	end

	return true
end

function s:update()
	if self.enabled and
			not self.needs_refresh and
			self.refresh_on_expiry and
			self:is_expired() and
			self.last_fetch.result ~= DC.fetch_enums.results.FAILED then
		self.needs_refresh = true
	end
end

function s:update_enabledness()
	local enabled = DC.settings.cache[self.template.setting_id]
	self.enabled = enabled

	for _, hook in pairs(self.template.hooks or {}) do
		(enabled and DC.mod.hook_enable or DC.mod.hook_disable)(DC.mod, hook.obj, hook.method)
	end
end
