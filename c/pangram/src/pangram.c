#include "pangram.h"

bool is_pangram(const char sentence[]) {
    if (sentence == NULL) return false;

    // Counter for unique letters encountered in the sentence; if it
    // ends up being 26, the sentence is a pangram
    int letters = 0;

    // Create character array copy of the input string without the null
    // terminator with downcased letters
    size_t len = strlen(sentence);
    char chars[len];

    for (size_t i = 0; sentence[i] != 0; ++i)
        chars[i] = tolower(sentence[i]);

    // Sort it
    qsort(chars, len, 1, chrcmp);

    // Compare each pair of letters in the array
    for (size_t i = 0; i < len; ++i) {
        // Ignore non-alphabetic characters
        if (!isalpha(chars[i])) continue;

        if (i == 0) {
            ++letters;
            continue;
        }

        char curr = chars[i];
        char prev = chars[i-1];

        if (!isalpha(prev)) {
            ++letters;
            continue;
        }

        char diff = curr - prev;

        // If the difference between the current letter and the previous
        // one is 0, then the letters are the same

        // If the difference is 1, then we have encountered the next
        // unique letter in the alphabet

        // If the difference is greater than 1, then we have skipped
        // some letters, so the string is not a pangram

        if (diff == 1)
            ++letters;
        else if (diff > 1)
            return false;
    }

    return letters == 26;
}

int chrcmp(const void* a, const void* b) {
    char arg1 = *(char*)a;
    char arg2 = *(char*)b;

    if (arg1 < arg2) return -1;
    else if (arg1 > arg2) return 1;
    else return 0;
}
