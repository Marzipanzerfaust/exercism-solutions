export class Rational {
    constructor(a, b) {
        this.numerator = a;
        this.denominator = b;

        this.reduce();
    }

    add(other) {
        const a = this.numerator * other.denominator + other.numerator * this.denominator;
        const b = this.denominator * other.denominator;

        return new Rational(a, b);
    }

    sub(other) {
        const a = this.numerator * other.denominator - other.numerator * this.denominator;
        const b = this.denominator * other.denominator;

        return new Rational(a, b);
    }

    mul(other) {
        const a = this.numerator * other.numerator;
        const b = this.denominator * other.denominator;

        return new Rational(a, b);
    }

    div(other) {
        const a = this.numerator * other.denominator;
        const b = this.denominator * other.numerator;

        return new Rational(a, b);
    }

    abs() {
        return new Rational(Math.abs(this.numerator), this.denominator);
    }

    exprational(n) {
        return new Rational(this.numerator ** n, this.denominator ** n);
    }

    expreal(n) {
        const result = n ** (this.numerator / this.denominator);

        return result.round(2);
    }

    reduce() {
        const divisor = gcd(this.numerator, this.denominator);

        this.numerator /= divisor;
        this.denominator /= divisor;

        if (this.denominator < 0) {
            this.numerator = -this.numerator;
            this.denominator = -this.denominator;
        }

        return this;
    }
}

function gcd(n, m) {
    if (m === 0)
        return n;
    else
        return gcd(m, n % m);
}

// Source: <https://stackoverflow.com/a/41716722/11588119>
Number.prototype.round = function(n = 0) {
    const scale = 10 ** n;

    return Math.round((this + Number.EPSILON) * scale) / scale;
}
