export const decodedValue = (colors) => {
  let copy = colors.slice(0, 2);
  copy.reverse();

  return copy.reduce(
    (acc, val, i) => acc + COLORS.indexOf(val) * 10 ** i,
    0
  );
};

const COLORS = [
  "black", "brown", "red", "orange", "yellow",
  "green", "blue", "violet", "grey", "white"
];
