export const convert = (n) => {
    let output = [];

    if (n % 3 == 0)
        output.push("Pling");
    if (n % 5 == 0)
        output.push("Plang");
    if (n % 7 == 0)
        output.push("Plong");
    if (output.length == 0)
        output.push(n);

    return output.join('');
};
