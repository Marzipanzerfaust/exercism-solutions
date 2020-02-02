export class Triangle {
    constructor(a, b, c) {
        this.sides = [a, b, c];
        this.sides.sort();
    }

    isEquilateral() {
        return this.isValid() && this.uniqueSides() == 1;
    }

    isIsosceles() {
        return this.isValid() && this.uniqueSides() <= 2;
    }

    isScalene() {
        return this.isValid() && this.uniqueSides() == 3;
    }

    isValid() {
        let [a, b, c] = this.sides;

        return this.sides.every(s => s > 0) && a + b > c;
    }

    uniqueSides() {
        return new Set(this.sides).size;
    }
}
