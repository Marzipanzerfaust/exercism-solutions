#include "trinary.h"
#include <algorithm>
#include <cmath>

using namespace std;

int trinary::to_decimal(const string& input) {
    int decimal;

    auto reversed = string(input);
    reverse(reversed.begin(), reversed.end());

    for (size_t i = 0; i < input.size(); ++i) {
        auto digit = reversed.substr(i, 1);

        if (digit != "0" && digit != "1" && digit != "2")
            return 0;

        decimal += stoi(digit) * pow(3, i);
    }

    return decimal;
}
