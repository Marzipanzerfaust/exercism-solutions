export const isValid = (str) => {
    str = str.replace(/-/g, "");

    if (!/^\d{9}[\dX]$/.test(str))
        return false;

    let digits = Array.from(str);

    let total = digits.reduceRight((sum, char, i) => {
        if (i === digits.length - 1 && char === "X")
            return sum + 10;
        else
            return sum + parseInt(char) * (i + 1);
    }, 0);

    return total % 11 === 0;
};
