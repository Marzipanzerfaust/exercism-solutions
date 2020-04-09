#include "hamming.h"
#include <stdexcept>

int hamming::compute(const string& a, const string& b) {
    if (a.size() != b.size()) throw domain_error("");

    int distance;

    for (size_t i = 0; i < a.size(); ++i) {
        distance += a[i] != b[i];
    }

    return distance;
}
