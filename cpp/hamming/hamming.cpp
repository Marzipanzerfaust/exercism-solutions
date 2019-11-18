#include "hamming.h"

int hamming::compute(string a, string b) {
    if (a.size() != b.size()) throw domain_error("");

    int distance;

    for (size_t i = 0; i < a.size(); i++) {
        distance += a[i] != b[i];
    }

    return distance;
}
