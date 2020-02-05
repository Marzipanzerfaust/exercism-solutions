const PAIRS = {"(": ")", "[": "]", "{": "}"}

export const isPaired = (input) => {
    let stack = [];

    for (const char of input)
        if ("([{".includes(char))
            stack.push(char);
        else if (")]}".includes(char))
            if (char != PAIRS[stack.pop()])
                return false;

    return stack.length == 0;
};
