local insert = table.insert

return function(s)
  local subs = {}
  local index = 1
  local offset = s:find("\n")

  while offset do
    insert(subs, s:sub(index, offset - 1))
    index = offset + 1
    offset = s:find("\n", index)
  end

  insert(subs, s:sub(index))

  -- Populate rows

  local rows = {}

  for i, sub in ipairs(subs) do
    local row = {}

    for n in sub:gmatch("%d+") do
      insert(row, tonumber(n))
    end

    rows[i] = row
  end

  -- Populate columns

  local columns = {}

  for i = 1, #rows[1] do
    columns[i] = {}
  end

  for i = 1, #rows do
    for j, n in ipairs(rows[i]) do
      columns[j][i] = n
    end
  end

  return {
    row = function(i)
      return rows[i]
    end,

    column = function(i)
      return columns[i]
    end
  }
end
