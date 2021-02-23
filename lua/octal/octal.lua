return function(s)
  return {
    to_decimal = function()
      local sum = 0
      local reversed = s:reverse()

      for i = 1, #s do
        local digit = tonumber(reversed:sub(i, i))

        if not digit or digit > 7 then
          return 0
        end

        sum = sum + digit * 8 ^ (i - 1)
      end

      return sum
    end
  }
end
