local gmatch = string.gmatch
local lower = string.lower

local function word_count(s)
  local dict = {}

  for word in gmatch(s, "%w+") do
    word = lower(word)
    dict[word] = (dict[word] or 0) + 1
  end

  return dict
end

return {
  word_count = word_count
}
