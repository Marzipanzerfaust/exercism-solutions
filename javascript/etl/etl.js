export const transform = (input) => {
    let output = {};

    for (const score in input)
        for (const letter of input[score])
            output[letter.toLowerCase()] = parseInt(score);

    return output;
};
