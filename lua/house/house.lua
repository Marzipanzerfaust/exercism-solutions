local module = {}

function module.house(n)
  lines = {
    'the house ',
    'the malt that lay in ',
    'the rat that ate ',
    'the cat that killed ',
    'the dog that worried ',
    'the cow with the crumpled horn that tossed ',
    'the maiden all forlorn that milked ',
    'the man all tattered and torn that kissed ',
    'the priest all shaved and shorn that married ',
    'the rooster that crowed in the morn that woke ',
    'the farmer sowing his corn that kept ',
    'the horse and the hound and the horn that belonged to '
  }

  output = 'This is ' .. lines[1]
  for i = 2, n do
    output = output .. "\n" ..lines[i]
  end
  output = ouput .. 'that Jack built.'

  return output
end

return module
