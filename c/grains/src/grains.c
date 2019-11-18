#include "grains.h"

uint64_t square(uint8_t index) {
    return pow(2, index - 1);
}

uint64_t total(void) {
    // The total is 2^64 - 1.
    // Since 2^64 - 1 is the highest value that uint64_t can hold, the
    // answer can be represented with UINT64_MAX or -1.
    return UINT64_MAX;
}
