export class ComplexNumber {
    constructor(a, b) {
        this.real = a;
        this.imag = b;
    }

    add(other) {
        let a = this.real + other.real;
        let b = this.imag + other.imag;
        return new ComplexNumber(a, b);
    }

    sub(other) {
        let a = this.real - other.real;
        let b = this.imag - other.imag;
        return new ComplexNumber(a, b);
    }

    div(other) {
        let a = (this.real * other.real + this.imag * other.imag) /
            (other.real ** 2 + other.imag ** 2);
        let b = (this.imag * other.real - this.real * other.imag) /
            (other.real ** 2 + other.imag ** 2);
        return new ComplexNumber(a, b);
    }

    mul(other) {
        let a = this.real * other.real - this.imag * other.imag;
        let b = this.imag * other.real + this.real * other.imag;
        return new ComplexNumber(a, b);
    }

    get abs() {
        return Math.sqrt(this.real ** 2 + this.imag ** 2);
    }

    get conj() {
        let a = this.real;
        let b;

        if (this.imag == 0)
            b = 0;
        else
            b = -this.imag;

        return new ComplexNumber(a, b);
    }

    get exp() {
        let a = Math.E ** this.real * Math.cos(this.imag);
        let b = Math.E ** this.real * Math.sin(this.imag);

        return new ComplexNumber(a, b);
    }
}
