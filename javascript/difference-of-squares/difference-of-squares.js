export class Squares {
    constructor(n) {
        this.values = [];

        for (let i = 1; i <= n; ++i)
            this.values.push(i);
    }

    get sumOfSquares() {
        return this.values.reduce((acc, val) => acc + val ** 2);
    }

    get squareOfSum() {
        return this.values.reduce((acc, val) => acc + val) ** 2;
    }

    get difference() {
        return this.squareOfSum - this.sumOfSquares;
    }
}
