DC.Cache = {}
DC.Cache.__index = DC.Cache
local s = DC.Cache

s.new = function()
	local self = {}
	setmetatable(self, s)
	self.items = {}
	return self
end

s.add = function(self, item)
	self.items[#self.items + 1] = item
end

s.update = function(self)
	for i = 1, #self.items do
		self.items[i]:update()
	end

	-- Used to ensure that several caches don't do refreshes simultaneously.
	if DC.refresh_happened then
		return
	end

	for i = 1, #self.items do
		if self.items[i].needs_refresh then
			if self.items[i]:refresh() then
				break -- One fetch per update at most.
			end
		end
	end
end

s.get = function(self, key)
	for _, v in pairs(self.items) do
		if v.key == key then
			return v
		end
	end

	return nil
end

s.clear = function(self)
	self.items = {}
end

s.has = function(self, key)
	for i = 1, #self.items do
		if self.items[i].key == key then
			return true
		end
	end

	return false
end

s.is_empty = function(self)
	return not self.items or #self.items == 0
end

s.remove = function(self, key)
	for i, v in ipairs(self.items) do
		if v.key == key then
			table.remove(self.items, i)
			return
		end
	end
end

function s:update_enabledness()
	for _, item in pairs(self.items) do
		item:update_enabledness()
	end
end
