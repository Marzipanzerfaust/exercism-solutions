export const steps = (n) => {
    if (n <= 0)
        throw "Only positive numbers are allowed";

    let s = 0;

    while (n !== 1) {
        if (n % 2 == 0)
            n /= 2;
        else
            n = 3 * n + 1;

        s += 1;
    }

    return s;
};
