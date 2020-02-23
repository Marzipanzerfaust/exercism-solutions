export const isValid = (str) => {
    str = str.replace(/-/g, "");

    if (!/^\d{9}[\dX]$/.test(str))
        return false;

    let digits = Array.from(str).reverse();

    let total = digits.reduce((sum, char, i) => {
        if (i === 0 && char === "X")
            return sum + 10;
        else
            return sum + parseInt(char) * (i + 1);
    }, 0);

    return total % 11 === 0;
};
