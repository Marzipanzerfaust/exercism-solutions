local sort = table.sort
local unpack = table.unpack
local insert = table.insert
local char = string.char

-- Return a sorted copy of the given string.
function string:sort()
  local bytes = { self:lower():byte(1, -1) }
  sort(bytes)
  return char(unpack(bytes))
end

local Anagram = {}
Anagram.__index = Anagram

function Anagram:new(word)
  local new = { word = word, sorted = word:sort() }
  setmetatable(new, Anagram)
  return new
end

function Anagram:match(words)
  local matched = {}

  for i = 1, #words do
    local word = words[i]

    if word:sort() == self.sorted then
      insert(matched, word)
    end
  end

  return matched
end

return Anagram
