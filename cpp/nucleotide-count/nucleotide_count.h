#ifndef NUCLEOTIDE_COUNT_H
#define NUCLEOTIDE_COUNT_H

#include <string>
#include <map>

using namespace std;

namespace nucleotide_count {
    class counter {
    private:
        map<char, int> inner_map;
    public:
        counter(const string&);

        map<char, int> nucleotide_counts() const;
        int count(char) const;
    };
}

#endif
