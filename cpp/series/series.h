#ifndef SERIES_H
#define SERIES_H

#include <vector>
#include <string>

namespace series {
    std::vector<int> digits(const std::string&);
    std::vector<std::vector<int>> slice(const std::string&, unsigned);
}

#endif
