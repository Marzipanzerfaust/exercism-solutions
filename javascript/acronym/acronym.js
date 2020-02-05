export const parse = (input) => {
    return input
        .replace(/[^\w']|_/g, " ")
        .split(" ")
        .map(word => word[0])
        .join("")
        .toUpperCase();
};
