#include "acronym.h"

char* abbreviate(const char* phrase) {
    if (phrase == NULL || phrase[0] == 0) return NULL;

    char* out = malloc(0);

    for (size_t i = 0, count = 0; phrase[i] != 0; ++i) {
        if (i == 0 || isspace(phrase[i-1]) || phrase[i-1] == '-') {
            ++count;
            out = realloc(out, count + 1);  // +1 to accomodate the null terminator
            out[count-1] = toupper(phrase[i]);
        }
    }

    return out;
}
