String.prototype.isBlank = function() {
    return !/\S/.test(this);
}

String.prototype.isQuestion = function() {
    return /\?\s*$/.test(this);
}

String.prototype.isYell = function() {
    return /[A-Z]/.test(this) && !/[a-z]/.test(this);
}

export const hey = (message) => {
    if (message.isBlank())
        return "Fine. Be that way!";
    else if (message.isQuestion() && message.isYell())
        return "Calm down, I know what I'm doing!"
    else if (message.isQuestion())
        return "Sure."
    else if (message.isYell())
        return "Whoa, chill out!"
    else
        return "Whatever."
};
