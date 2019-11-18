-- 1/22/2018: Incorporated feedback from ryanplusplus

local module = {}

function module.compute(a, b)
  if #a ~= #b then
    return -1
  end

  local distance = 0

  for i = 1, string.len(a) do
    if a:sub(i, i) ~= b:sub(i, i) then
      distance = distance + 1
    end
  end

  return distance
end

return module
