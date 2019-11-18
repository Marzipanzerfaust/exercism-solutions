#include "grains.h"

using namespace std;

unsigned long long grains::square(int n) {
    return pow(2, n-1);
}

unsigned long long grains::total() {
    return -1;  // wraps to 2 ** 65 - 1
}
