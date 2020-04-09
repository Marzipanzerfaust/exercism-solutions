#include "sum_of_multiples.h"

unsigned int sum_of_multiples(const unsigned int *multiples,
                              const size_t number_of_multiples,
                              const unsigned int up_to) {
    if (multiples == NULL)
        return 0;

    unsigned int sum = 0;

    for (unsigned int n = 1; n < up_to; ++n) {
        for (size_t i = 0; i < number_of_multiples; ++i) {
            unsigned int multiple = multiples[i];

            if (multiple == 0)
                continue;

            if (n % multiple == 0) {
                sum += n;
                break;
            }
        }
    }

    return sum;
}
