#include "roman_numerals.h"
#include <sstream>

using namespace std;

string roman_numerals::convert(int n) {
    stringstream output;

    for (auto i = 0; i < 13; ++i) {
        auto roman = romans[i];
        auto decimal = decimals[i];

        int quotient = n / decimal;

        n %= decimal;

        for (auto j = 0; j < quotient; ++j)
            output << roman;
    }

    return output.str();
}
