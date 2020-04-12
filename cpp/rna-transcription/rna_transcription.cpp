#include "rna_transcription.h"

using namespace std;

char rna_transcription::to_rna(char nucleotide) {
    return dna_to_rna.at(nucleotide);
}

string rna_transcription::to_rna(const string& strand) {
    auto output = string(strand);

    for (size_t i = 0; i < strand.size(); ++i)
        output[i] = to_rna(strand[i]);

    return output;
}
