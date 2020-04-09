#ifndef RATIONAL_NUMBERS
#define RATIONAL_NUMBERS

typedef struct {
    int numerator, denominator;
} rational_t;

rational_t rational_new(int, int);
rational_t reduce(rational_t);
int greatest_common_factor(int, int);
rational_t absolute(rational_t);
rational_t add(rational_t, rational_t);
rational_t subtract(rational_t, rational_t);
rational_t multiply(rational_t, rational_t);
rational_t divide(rational_t, rational_t);
rational_t exp_rational(rational_t, int);
double exp_real(double, rational_t);
double root(double, unsigned int);

#endif
