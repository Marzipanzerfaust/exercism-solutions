local sub = string.sub
local insert = table.insert
local remove = table.remove

local PAIRS = {
  ["("] = ")",
  ["["] = "]",
  ["{"] = "}"
}

return {
  valid = function(s)
    local stack = {}

    for i = 1, #s do
      local char = sub(s, i, i)

      if char == "(" or char == "[" or char == "{" then
        insert(stack, char)
      elseif char == ")" or char == "]" or char == "}" then
        if PAIRS[remove(stack)] ~= char then
          return false
        end
      end
    end

    return #stack == 0
  end
}
