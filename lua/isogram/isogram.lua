return function(s)
  local chars = {}

  for i = 1, #s do
    local char = s:sub(i, i):lower()

    if char:find("%l") then
      if chars[char] then
        return false
      else
        chars[char] = true
      end
    end
  end

  return true
end
