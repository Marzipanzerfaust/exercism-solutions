export const isIsogram = (input) => {
    let chars = [...input.toLowerCase().replace(/\W/g, "")];
    return chars.length == new Set(chars).size;
};
