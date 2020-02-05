export const largestProduct = (digits, n) => {
    if (n == 0)
        return 1;

    if (n > digits.length)
        throw "Span must be smaller than string length";

    if (n < 0)
        throw "Span must be greater than zero";  // Should be "greater than or equal to zero"

    if (/\D/.test(digits))
        throw "Digits input must only contain digits";

    return [...digits]
        .map(x => parseInt(x))
        .cons(n)
        .map(group => group.reduce((acc, val) => acc * val))
        .max();
};

Array.prototype.eachCons = function*(n) {
    if (n <= 0)
        throw "Invalid size";

    let k = this.length - n + 1;

    for (let i = 0; i < k; ++i)
        yield this.slice(i, i + n);
}

Array.prototype.cons = function(n) {
    return [...this.eachCons(n)];
}

Array.prototype.max = function(n) {
    if (n < 0)
        throw "Invalid size";

    if (n != undefined && n != null)
        return this.slice().sort((a, b) => b - a).slice(0, n);
    else
        return Math.max(...this);
}
