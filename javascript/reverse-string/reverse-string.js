export const reverseString = (input) => {
    let output = [];

    for (let i = 0; i < input.length; ++i)
        output.unshift(input[i]);

    return output.join("");
};
