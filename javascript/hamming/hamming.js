export const compute = (a, b) => {
    if (a.length != b.length) {
        if (!a.length)
            throw "left strand must not be empty";
        else if (!b.length)
            throw "right strand must not be empty";
        else
            throw "left and right strands must be of equal length";
    }

    let distance = 0;

    for (let i = 0; i < a.length; ++i)
        if (a[i] != b[i])
            distance += 1;

    return distance;
};
