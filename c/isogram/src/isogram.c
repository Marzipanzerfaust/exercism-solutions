#include "isogram.h"
#include <stddef.h>
#include <ctype.h>
#include <stdint.h>

bool is_isogram(const char phrase[]) {
    if (phrase == NULL)
        return false;

    for (size_t i = 0; phrase[i] != 0; ++i) {
        char c = tolower(phrase[i]);

        if (!isalpha(c))
            continue;

        // Walk back to the beginning of the string and see if the
        // character has already occurred
        for (size_t j = i - 1; j != SIZE_MAX; --j) {
            char d = tolower(phrase[j]);

            // ... If it has, this string is not an isogram
            if (d == c)
                return false;
        }
    }

    return true;
}
