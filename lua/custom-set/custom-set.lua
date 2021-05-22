local Set = { }
Set.__index = Set

function Set:new(...)
  local list = { ... }
  local table = {}

  for i = 1, #list do
    table[list[i]] = true
  end

  local new = { items = table, size = #list }
  return setmetatable(new, self)
end

function Set:is_empty()
  return self.size == 0
end

function Set:contains(x)
  return self.items[x] or false
end

function Set:is_subset(other)
  for item in pairs(self.items) do
    if not other:contains(item) then
      return false
    end
  end

  return true
end

function Set:is_disjoint(other)
  if self:is_empty() or other:is_empty() then
    return true
  end

  for item in pairs(self.items) do
    if other:contains(item) then
      return false
    end
  end

  return true
end

function Set:equals(other)
  if self.size == other.size then
    return self:is_subset(other)
  else
    return false
  end
end

function Set:add(x)
  if not self:contains(x) then
    self.items[x] = true
    self.size = self.size + 1
  end
end

function Set:intersection(other)
  local new = Set:new()

  for item in pairs(self.items) do
    if other:contains(item) then
      new:add(item)
    end
  end

  return new
end

function Set:difference(other)
  local new = Set:new()

  for item in pairs(self.items) do
    if not other:contains(item) then
      new:add(item)
    end
  end

  return new
end

function Set:union(other)
  local new = Set:new()

  for item in pairs(self.items) do
    new:add(item)
  end

  for item in pairs(other.items) do
    if not new:contains(item) then
      new:add(item)
    end
  end

  return new
end

return function(...)
  return Set:new(...)
end
