export class Series {
    constructor(str) {
        this.digits = str.split("").map(n => parseInt(n));
    }

    slices(n) {
        if (n > this.digits.length)
            throw "Slice size is too big.";

        let output = [];
        let numberOfSlices = this.digits.length - n + 1;

        for (let i = 0; i < numberOfSlices; ++i)
            output.push(this.digits.slice(i, i + n));

        return output;
    }
}
