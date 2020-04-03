export const rows = (letter) => {
    const start = 'A'.charCodeAt(0);
    const end = letter.charCodeAt(0);

    const width = (end - start) * 2 + 1;
    const height = end - start + 1

    const triangle = new Array(height);

    for (let i = 0; i < height; ++i) {
        let k = String.fromCharCode(start + i);

        let line;

        if (i == 0)
            line = k.center(width);
        else
            line = `${k}${" ".repeat(2 * i - 1)}${k}`.center(width);

        triangle[i] = line;
    }

    return triangle.concat(triangle.slice(0, -1).reverse());
};

// Similar to Ruby's String#center
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
