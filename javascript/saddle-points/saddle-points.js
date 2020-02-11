export const saddlePoints = (rows) => {
  let points = [];

  let columns = rows.transpose();

  rows.forEach(function(row, i) {
    let row_max = Math.max(...row);

    row.forEach(function(elem, j) {
      if (elem == row_max) {
        let col_min = Math.min(...columns[j]);

        if (elem == col_min)
          points.push({row: i + 1, column: j + 1});
        else
          return;
      }
    });
  });

  return points;
};

Array.prototype.transpose = function() {
  let width = this[0].length;

  let output = new Array(width);

  for (let i = 0; i < width; ++i)
    output[i] = this.map(row => row[i]);

  return output;
}
