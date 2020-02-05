export const clean = (input) => {
    if (/[a-zA-Z]/.test(input))
        throw "Letters not permitted";

    if (/[@:!]/.test(input))
        throw "Punctuations not permitted"

    let digits = input.replace(/\D/g, "");

    if (digits.length < 10)
        throw "Incorrect number of digits";

    if (digits.length == 11) {
        if (digits[0] != 1)
            throw "11 digits must start with 1";
        else
            digits = digits.slice(1);
    }

    if (digits.length > 11)
        throw "More than 11 digits";

    if (digits[0] == 0)
        throw "Area code cannot start with zero";

    if (digits[0] == 1)
        throw "Area code cannot start with one";

    if (digits[3] == 0)
        throw "Exchange code cannot start with zero";

    if (digits[3] == 1)
        throw "Exchange code cannot start with one";

    return digits;
};
