export const countWords = (phrase) => {
    phrase = phrase.toLowerCase();

    phrase = phrase.replace(/[^\w']/g, " ");
    phrase = phrase.replace(/(?: |^)'|'(?: |$)/g, " ");

    let output = {};

    for (const word of phrase.split(/\s+/)) {
        if (word)
            if (output[word])
                output[word] += 1;
            else
                output[word] = 1;
    }

    return output;
};
