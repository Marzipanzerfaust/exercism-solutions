#ifndef ROMAN_NUMERALS_H
#define ROMAN_NUMERALS_H

#include <string>

using namespace std;

namespace roman_numerals {
    const string romans[13] = {
        "M", "CM",
        "D", "CD",
        "C", "XC",
        "L", "XL",
        "X", "IX",
        "V", "IV",
        "I"
    };

    const int decimals[13] = {
        1000, 900,
        500, 400,
        100, 90,
        50, 40,
        10, 9,
        5, 4,
        1
    };

    string convert(int);
}

#endif
