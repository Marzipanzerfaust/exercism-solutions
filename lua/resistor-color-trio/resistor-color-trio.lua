COLORS = {
  black = 0,
  brown = 1,
  red = 2,
  orange = 3,
  yellow = 4,
  green = 5,
  blue = 6,
  violet = 7,
  grey = 8,
  white = 9
}

return {
  decode = function(c1, c2, c3)
    local value = (COLORS[c1] * 10 + COLORS[c2]) * 10 ^ COLORS[c3]

    if value < 1000 then
      unit = "ohms"
    else
      unit = "kiloohms"
      value = value / 1000
    end

    return value, unit
  end
}
