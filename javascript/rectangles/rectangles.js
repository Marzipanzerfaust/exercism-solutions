export class Rectangles {
    static count(rows) {
        let counter = 0;

        for (let y = 0; y < rows.length; ++y) {
            let row = rows[y];

            for (let x = 0; x < row.length; ++x) {
                let cell = row[x];

                // If this cell is a corner...
                if (cell == '+') {
                    // Find all possible top-right corners
                    let topRightCorners = [];

                    for (let i = x + 1; i < row.length; ++i) {
                        let next = row[i];

                        if (next == '+')
                            topRightCorners.push({x: i, y});
                        else if (next == '-')
                            continue;
                        else
                            break;
                    }

                    // Find all possible bottom-left corners
                    let bottomLeftCorners = [];

                    for (let i = y + 1; i < rows.length; ++i) {
                        let next = rows[i][x];

                        if (next == '+')
                            bottomLeftCorners.push({x, y: i});
                        else if (next == '|')
                            continue;
                        else
                            break;
                    }

                    // Check each possible pair of top-right and
                    // bottom-left corners to see if they have a
                    // corresponding bottom-right corner
                    for (const [tr, bl] of topRightCorners.product(bottomLeftCorners)) {
                        // Theoretical bottom-right corner
                        let br = {x: tr.x, y: bl.y};

                        // Is it a valid corner?
                        if (rows[br.y][br.x] != '+')
                            continue;

                        // Does the top-right corner connect to it?
                        let vCells = rows.slice(y + 1, br.y).map(row => row[br.x]);

                        if (!vCells.every(c => c == '|' || c == '+'))
                            continue;

                        // Does the bottom-left corner connect to it?
                        let hCells = rows[bl.y].slice(x + 1, br.x);

                        if (![...hCells].every(c => c == '-' || c == '+'))
                            continue;

                        // If so, we have a valid rectangle:
                        counter += 1;
                    }
                }
            }
        }

        return counter;
    }
}


Array.prototype.product = function(other) {
    let output = [];

    for (const x of this)
        for (const y of other)
            output.push([x, y]);

    return output;
}
