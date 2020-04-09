#include "nucleotide_count.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* count(const char dna_strand[]) {
    char* out;

    if (dna_strand == NULL) {
        out = malloc(0);
        return out;
    }

    unsigned int a = 0, c = 0, g = 0, t = 0;

    for (size_t i = 0; dna_strand[i] != 0; ++i) {
        switch (dna_strand[i]) {
        case 'A': a += 1; break;
        case 'C': c += 1; break;
        case 'G': g += 1; break;
        case 'T': t += 1; break;
        }
    }

    if (a + c + g + t < strlen(dna_strand)) {
        out = malloc(0);
    } else {
        out = malloc(strlen("A:xx C:xx G:xx T:xx") + 1);
        sprintf(out, "A:%d C:%d G:%d T:%d", a, c, g, t);
    }

    return out;
}
