#include "sieve.h"
#include <algorithm>

vector<int> sieve::primes(int n) {
    vector<int> sieve;

    for (auto x = 2; x <= n; ++x) {
        if (none_of(sieve.begin(), sieve.end(),
                    [x](int y) { return x % y == 0; }))
            sieve.push_back(x);
    }

    return sieve;
}
