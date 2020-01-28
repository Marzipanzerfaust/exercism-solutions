const triangle = [[1]];

export const rows = (n) => {
    if (n == 0) return [];

    for (let i = triangle.length; i <= n; ++i) {
        let row = [];
        let prev = triangle[i - 1];

        row.push(1);

        for (let j = 0; j < prev.length - 1; ++j) {
            let a = prev[j];
            let b = prev[j + 1];

            row.push(a + b);
        }

        row.push(1);

        triangle.push(row);
    }

    return triangle.slice(0, n);
};
