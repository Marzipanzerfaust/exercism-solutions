export const rows = (letter) => {
    const start = 'A'.charCodeAt(0);
    const end = letter.charCodeAt(0);

    const width = (end - start) * 2 + 1;

    const lines = [];

    for (let i = 0; i < width; ++i) {
        let k =
        if (i === 0)

    }
};

String.prototype.center = function(width, padstr = " ") {
    if (width <= this.length)
        return this;

    const diff = width - this.length;

    const padHead = new Array(Math.floor(diff / 2));
    const padTail = new Array(Math.ceil(diff / 2));

    for (let i = 0; i < padHead.length; ++i)
        padHead[i] = padstr[i % padstr.length];

    for (let i = 0; i < padTail.length; ++i)
        padTail[i] = padstr[i % padstr.length];

    return padHead.join("") + this + padTail.join("");
}
