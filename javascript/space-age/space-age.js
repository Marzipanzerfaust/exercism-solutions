let round = (n, d) => parseFloat(n.toFixed(d));

export const age = (planet, seconds) => {
  let output = seconds / 31557600;  // Earth years

  if (planet == "mercury")
    output /= 0.2408467;
  else if (planet == "venus")
    output /= 0.61519726;
  else if (planet == "mars")
    output /= 1.8808158;
  else if (planet == "jupiter")
    output /= 11.862615;
  else if (planet == "saturn")
    output /= 29.447498;
  else if (planet == "uranus")
    output /= 84.016846;
  else if (planet == "neptune")
    output /= 164.79132;

  return round(output, 2);
};
