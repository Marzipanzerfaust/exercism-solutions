#include "nth_prime.h"

#include <vector>
#include <stdexcept>
#include <algorithm>

using namespace std;

static vector<unsigned> primes = {2, 3};

unsigned nth_prime::nth(unsigned n) {
    if (n == 0)
        throw domain_error("Input must be a positive integer");

    if (n <= primes.size())
        return primes[n - 1];

    auto next_prime = *primes.rbegin() + 2;

    while (true) {
        if (none_of(primes.begin(), primes.end(),
                    [next_prime](int p) { return next_prime % p == 0; })) {
            primes.push_back(next_prime);

            if (primes.size() == n)
                break;
        }

        next_prime += 2;
    }

    return next_prime;
}
