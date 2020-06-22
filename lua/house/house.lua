local objects = {
  "house that Jack built",
  "malt",
  "rat",
  "cat",
  "dog",
  "cow with the crumpled horn",
  "maiden all forlorn",
  "man all tattered and torn",
  "priest all shaven and shorn",
  "rooster that crowed in the morn",
  "farmer sowing his corn",
  "horse and the hound and the horn"
}

local actions = {
  "lay in",
  "ate",
  "killed",
  "worried",
  "tossed",
  "milked",
  "kissed",
  "married",
  "woke",
  "kept",
  "belonged to",
}

local house = {}

house.verse = function(which)
  local lines = {"This is the " .. objects[which]}

  for j = which - 1, 1, -1 do
    table.insert(lines, string.format("that %s the %s", actions[j], objects[j]))
  end

  lines[#lines] = lines[#lines] .. "."

  return table.concat(lines, "\n")
end

house.recite = function()
  verses = {}

  for i = 1, #objects do
    table.insert(verses, house.verse(i))
  end

  return table.concat(verses, "\n")
end

return house
