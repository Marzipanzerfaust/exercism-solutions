export const valid = (str) => {
    str = str.replace(/\s/g, "");

    if (/\D/.test(str))
        return false;

    if (str.length < 2)
        return false;

    let digits = Array.from(str).map(x => parseInt(x)).reverse();

    let sum = digits.reduce(function(acc, val, idx) {
        if (idx % 2 == 0) {
            return acc + val;
        } else {
            val *= 2;

            if (val > 9)
                return acc + val - 9;
            else
                return acc + val;
        }
    });

    return sum % 10 == 0;
};
