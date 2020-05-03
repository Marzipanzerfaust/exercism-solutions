#ifndef NUCLEOTIDE_COUNT_H
#define NUCLEOTIDE_COUNT_H

#include <string>
#include <map>

namespace nucleotide_count {
    class counter {
        std::map<char, int> inner_map;
    public:
        counter(const std::string&);

        std::map<char, int> nucleotide_counts() const;
        int count(char) const;
    };
}

#endif
