#include "perfect_numbers.h"

kind classify_number(int n) {
    if (n <= 0)
        return ERROR;

    unsigned int un = n;

    unsigned int aliquot = aliquot_sum(un);

    if (aliquot > un)
        return ABUNDANT_NUMBER;
    else if (aliquot < un)
        return DEFICIENT_NUMBER;
    else
        return PERFECT_NUMBER;
}

unsigned int aliquot_sum(unsigned int n) {
    unsigned int sum = 0;

    for (unsigned int i = 1; i <= n / 2; ++i) {
        if (n % i == 0)
            sum += i;
    }

    return sum;
}
