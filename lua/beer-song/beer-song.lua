local insert = table.insert
local concat = table.concat

local function bottles(n)
  if n == 0 then
    return "No more bottles"
  elseif n == 1 then
    return "1 bottle"
  else
    return n .. " bottles"
  end
end

local function verse(number)
  if number == 0 then
    return "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
  elseif number == 1 then
    return "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
  else
    return bottles(number) .. " of beer on the wall, " .. bottles(number) .. " of beer.\nTake one down and pass it around, " .. bottles(number - 1) .. " of beer on the wall.\n"
  end
end

local function sing(start, finish)
  local lines = {}

  for i = start, (finish or 0), -1 do
    insert(lines, verse(i))
  end

  return concat(lines, "\n")
end

return {
  verse = verse,
  sing = sing
}
