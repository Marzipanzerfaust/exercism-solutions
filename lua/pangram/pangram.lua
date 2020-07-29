local pairs = pairs

local sub = string.sub
local char = string.char
local lower = string.lower

return function(s)
  local tracker = {}

  for i = 97, 122 do
    tracker[char(i)] = false
  end

  for i = 1, #s do
    local char = lower(sub(s, i, i))
    tracker[char] = true
  end

  for _, v in pairs(tracker) do
    if not v then
      return false
    end
  end

  return true
end
