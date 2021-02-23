local ipairs = ipairs
local type = type
local insert = table.insert

local function flatten(input)
  local output = {}

  for _, x in ipairs(input) do
    if type(x) == "table" then
      for _, y in ipairs(flatten(x)) do
        insert(output, y)
      end
    else
      insert(output, x)
    end
  end

  return output
end

return flatten
