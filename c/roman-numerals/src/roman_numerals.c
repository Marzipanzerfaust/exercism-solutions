#include "roman_numerals.h"

char* to_roman_numeral(unsigned int n) {
    static unsigned int decimals[13] = {
        1000, 900, 500, 400,
        100, 90, 50, 40,
        10, 9, 5, 4,
        1
    };

    static char* romans[13] = {
        "M", "CM", "D", "CD",
        "C", "XC", "L", "XL",
        "X", "IX", "V", "IV",
        "I"
    };

    char* out = malloc(1);
    size_t size = 1;

    for (size_t i = 0; i < 13; ++i) {
        unsigned int d = decimals[i];
        char* r = romans[i];

        while (n >= d) {
            n -= d;
            size += strlen(r);
            out = realloc(out, size);
            strcat(out, r);
        }
    }

    return out;
}
