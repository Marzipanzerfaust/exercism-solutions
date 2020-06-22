local function is_divisible(x, y)
  return x % y == 0
end

return function(n)
  local output = ""

  if is_divisible(n, 3) then output = output .. "Pling" end
  if is_divisible(n, 5) then output = output .. "Plang" end
  if is_divisible(n, 7) then output = output .. "Plong" end

  if #output == 0 then output = output .. tostring(n) end

  return output
end
