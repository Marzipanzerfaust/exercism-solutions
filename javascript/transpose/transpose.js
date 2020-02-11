export const transpose = (input) => {
  if (input == 0)
    return [];

  let max_size = Math.max(...input.map(line => line.length));

  let output = new Array(max_size);

  for (let i = 0; i < max_size; ++i) {
    output[i] = input.map(line => line[i] || " ");
  }

  return output.map(function(x, i) {
    let line = x.join("");

    if (i == max_size - 1)
      return line.trimEnd();
    else
      return line;
  });
};
