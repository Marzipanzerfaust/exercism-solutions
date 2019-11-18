#include "etl.h"

using namespace std;

map<char, int> etl::transform(const map<int, vector<char>>& old) {
    map<char, int> out;

    for (const auto& p : old) {
        int val = p.first;
        vector<char> vec = p.second;

        for (const auto& c : vec) {
            out[tolower(c)] = val;
        }
    }

    return out;
}
