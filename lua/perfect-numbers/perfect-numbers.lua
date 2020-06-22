local function aliquot_sum(n)
  local sum = 0

  for i = 1, n / 2 do
    if n % i == 0 then
      sum = sum + i
    end
  end

  return sum
end

local function classify(n)
  local sum = aliquot_sum(n)

  if sum < n then
    return "deficient"
  elseif sum > n then
    return "abundant"
  else
    return "perfect"
  end
end

return {
  aliquot_sum = aliquot_sum,
  classify = classify
}
