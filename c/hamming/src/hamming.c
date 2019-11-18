#include "hamming.h"

int compute(const char* lhs, const char* rhs) {
    if (lhs == NULL || rhs == NULL) return -1;

    int distance = 0;
    size_t i = 0;

    while (lhs[i] != 0) {
        // lhs is longer than rhs
        if (rhs[i] == 0) return -1;

        if (lhs[i] != rhs[i]) ++distance;

        ++i;
    }

    // rhs is longer than lhs
    if (rhs[i] != 0) return -1;

    return distance;
}
