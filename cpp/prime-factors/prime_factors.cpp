#include "prime_factors.h"

using namespace std;

vector<int> prime_factors::of(int n, vector<int> known_factors) {
    auto least_factor = 0;

    for (auto i = 2; i <= n; ++i) {
        if (n % i == 0) {
            least_factor = i;
            break;
        }
    }

    if (least_factor) {
        known_factors.push_back(least_factor);
        return of(n / least_factor, known_factors);
    } else {
        return known_factors;
    }
}
