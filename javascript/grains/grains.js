export const square = (n) => {
    if (n < 1 || n > 64)
        throw "square must be between 1 and 64";

    return 2n ** BigInt(n - 1);
};

export const total = () => {
    return 2n ** 64n - 1n;
};
