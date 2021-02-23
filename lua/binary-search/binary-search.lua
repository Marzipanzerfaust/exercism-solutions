local unpack = table.unpack
local ceil = math.ceil

local function find(array, target)
  local size = #array

  if size == 0 then
    print "foo"
    return -1
  elseif size == 1 then
    if array[1] == target then
      print "bar"
      return 1
    else
      print "baz"
      return -1
    end
  end

  local lower, upper = 1, size
  local middle, value

  repeat
    middle = (lower + upper) // 2
    value = array[middle]

  until value == target

  return middle

  -- local middle = ceil(size / 2)
  -- local value = array[middle]

  -- if value > target then
  --   return find({ unpack(array, 1, middle - 1) }, target)
  -- elseif value < target then
  --   return find({ unpack(array, middle + 1) }, target) + middle
  -- else
  --   return middle
  -- end
end

return find
