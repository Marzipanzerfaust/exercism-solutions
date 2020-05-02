#include "series.h"
#include <stdexcept>

vector<int> series::digits(const string& input) {
    vector<int> output;

    for (auto c : input)
        output.push_back(c - '0');

    return output;
}

vector<vector<int>> series::slice(const string& input, unsigned n) {
    if (n > input.size())
        throw domain_error("Not enough digits to slice");

    vector<vector<int>> output;
    vector<int> sub;

    for (size_t i = 0; i <= input.size() - n; ++i) {
        for (size_t j = i; j < i + n; ++j)
            sub.push_back(input[j] - '0');

        output.push_back(sub);
        sub.clear();
    }

    return output;
}
