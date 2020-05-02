#ifndef SERIES_H
#define SERIES_H

#include <vector>
#include <string>

using namespace std;

namespace series {
    vector<int> digits(const string&);
    vector<vector<int>> slice(const string&, unsigned);
}

#endif
