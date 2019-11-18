#include "nucleotide_count.h"

using namespace std;

nucleotide_count::counter::counter(const string& s) {
    inner_map = { {'A', 0}, {'T', 0}, {'C', 0}, {'G', 0} };

    for (auto c : s) {
        if (c != 'A' && c != 'T' && c != 'C' && c != 'G')
            throw invalid_argument("Input must contain only A, T, C, or G");

        ++inner_map[c];
    }
}

map<char, int> nucleotide_count::counter::nucleotide_counts() const {
    return inner_map;
}

int nucleotide_count::counter::count(char c) const {
    try {
        return inner_map.at(c);
    } catch (const out_of_range& e) {
        throw invalid_argument("Valid input is A, T, C, G");
    }
}
