#include "rna_transcription.h"
#include <string.h>
#include <stdlib.h>

char* to_rna(const char* dna) {
    size_t len = strlen(dna);

    char* out = malloc(len + 1);

    for (size_t i = 0; i < len; ++i) {
        char c = dna[i];

        switch (c) {
        case 'G': out[i] = 'C'; break;
        case 'C': out[i] = 'G'; break;
        case 'T': out[i] = 'A'; break;
        case 'A': out[i] = 'U'; break;
        default: return NULL;
        }
    }

    out[len + 1] = 0;

    return out;
}
