#include "sum_of_multiples.h"

using namespace std;

int sum_of_multiples::to(const set<int>& xs, int n) {
    set<int> ms;

    for (auto x : xs) {
        for (auto m : multiples(x, n))
            ms.insert(m);
    }

    return accumulate(ms.begin(), ms.end(), 0);
}

vector<int> sum_of_multiples::multiples(int x, int upper) {
    vector<int> out;

    for (auto i = x; i < upper; i += x) {
        out.push_back(i);
    }

    return out;
}
