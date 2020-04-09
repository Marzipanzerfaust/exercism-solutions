// XXX: The below solution is bad because it uses `malloc` without
// freeing the allocated memory.

#include "armstrong_numbers.h"
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <stdio.h>

bool is_armstrong_number(unsigned n) {
    unsigned len = num_digits(n);

    char* str = malloc(len + 1);
    strcpy(str, itoa(n));

    unsigned sum = 0;

    for (size_t i = 0; i < len; ++i) {
        char d = str[i] - '0';
        sum += pow(d, len);
    }

    return n == sum;
}

char* itoa(unsigned n) {
    char* str = malloc(num_digits(n) + 1);
    sprintf(str, "%d", n);

    return str;
}

unsigned num_digits(unsigned n) {
    unsigned count = 0;

    while (n > 0) {
        n /= 10;
        count += 1;
    }

    return count;
}
