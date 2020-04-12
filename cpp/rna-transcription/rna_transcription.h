#ifndef RNA_TRANSCRIPTION_H
#define RNA_TRANSCRIPTION_H

#include <string>
#include <unordered_map>

using namespace std;

namespace rna_transcription {
    const unordered_map<char, char> dna_to_rna = {
        {'G', 'C'},
        {'C', 'G'},
        {'T', 'A'},
        {'A', 'U'}
    };

    char to_rna(char);
    string to_rna(const string&);
}

#endif

// vim:ft=cpp
