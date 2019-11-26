#include "rational_numbers.h"

rational_t rational_new(int a, int b) {
    rational_t tmp = { a, b };
    return reduce(tmp);
}

rational_t reduce(rational_t r) {
    int a = abs(r.numerator);
    int b = abs(r.denominator);

    if (a == 0) {
        b = 1;
    } else {
        int gcf = greatest_common_factor(a, b);
        a /= gcf;
        b /= gcf;
    }

    if ((r.numerator < 0) ^ (r.denominator < 0))
        a = -a;

    return (rational_t) { a, b };
}

// Euclid's algorithm
int greatest_common_factor(int a, int b) {
    if (a == 0 || b == 0) return 0;

    while (1) {
        a %= b;
        if (a == 0) return b;
        b %= a;
        if (b == 0) return a;
    }
}

rational_t absolute(rational_t r) {
    return rational_new(abs(r.numerator), abs(r.denominator));
}

rational_t add(rational_t a, rational_t b) {
    return rational_new(
        a.numerator * b.denominator + a.denominator * b.numerator,
        a.denominator * b.denominator
    );
}

rational_t subtract(rational_t a, rational_t b) {
    return rational_new(
        a.numerator * b.denominator - a.denominator * b.numerator,
        a.denominator * b.denominator
    );
}

rational_t multiply(rational_t a, rational_t b) {
    return rational_new(
        a.numerator * b.numerator,
        a.denominator * b.denominator
    );
}

rational_t divide(rational_t a, rational_t b) {
    return rational_new(
        a.numerator * b.denominator,
        a.denominator * b.numerator
    );
}

rational_t exp_rational(rational_t r, int n) {
    int a, b;

    if (n >= 0) {
        a = pow(r.numerator, n);
        b = pow(r.denominator, n);
    } else {
        a = pow(r.denominator, abs(n));
        b = pow(r.numerator, abs(n));
    }

    return rational_new(a, b);
}

double exp_real(double x, rational_t r) {
    return root(pow(x, r.numerator), r.denominator);
}

double root(double x, unsigned int n) {
    return pow(x, 1.0 / n);
}
