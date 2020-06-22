return function(numbers)
  local obj = {numbers = numbers}

  function obj.to(n)
    local sum = 0

    for i = 1, n - 1 do
      for j = 1, #numbers do
        if i % numbers[j] == 0 then
          sum = sum + i
          break
        end
      end
    end

    return sum
  end

  return obj
end
