export function encode(ints) {
    return ints.flatMap(encodeInt);
}

function encodeInt(x) {
    let output = [];

    let bits = x.toString(2);
    let reversed = bits.reverse();

    let slices = reversed.eachSlice(7);

    let first = slices.next().value.padEnd(8, '0');

    output.push(parseInt(first.reverse(), 2));

    for (let slice of slices) {
        slice = slice.padEnd(7, '0');
        slice += '1';

        output.push(parseInt(slice.reverse(), 2));
    }

    return output.reverse();
}

export function decode(bytes) {
    let output = [];

    let n = "";

    for (let i = 0; i < bytes.length; ++i) {
        let bits = bytes[i].toString(2).padEnd(7, '0').padStart(8, '0');
        let last = bits[0] === '0';

        n += bits.slice(1);

        if (last) {
            output.push(parseInt(n, 2));
            n = "";
        }
    }

    if (output.length === 0)
        throw "Incomplete sequence";

    return output;
}

String.prototype.eachSlice = function*(n) {
    for (let i = 0; i < this.length; i += n)
        yield this.slice(i, i + n);
}

String.prototype.reverse = function() {
    return Array.from(this).reverse().join("");
}
