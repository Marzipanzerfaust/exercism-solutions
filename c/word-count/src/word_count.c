#include "word_count.h"
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

int word_count(char input_text[], word_count_word_t words[MAX_WORDS]) {
    // Make sure the word collection is clear to prevent false positives
    memset(words, 0, MAX_WORDS * sizeof(word_count_word_t));

    char* word = malloc(0);

    size_t ccount = 0;
    size_t wcount = 0;

    for ( char* iter = input_text; *iter != 0; ++iter ) {
        char c = tolower(*iter);

        if ( isalnum(c) || is_apostrophe(iter, input_text) ) {
            ccount += 1;
            word = realloc(word, ccount + 1);
            word[ccount-1] = c;

            // End of word
            if (
                iter[1] == 0 ||
                !(isalnum(iter[1]) ||
                  is_apostrophe(&iter[1], input_text))
            ) {
                // Has this word already occurred?
                int found = find(word, words);

                // If so, increment the existing counter; else, add it
                // to the collection with a count of 1
                if ( found > -1 ) {
                    words[found].count += 1;
                } else {
                    word_count_word_t new_word;

                    strcpy(new_word.text, word);
                    new_word.count = 1;

                    words[wcount++] = new_word;
                }

                ccount = 0;
                word = calloc(0, 1);
            }
        }

        if ( ccount > MAX_WORD_LENGTH ) return EXCESSIVE_LENGTH_WORD;
        if ( wcount > MAX_WORDS )       return EXCESSIVE_NUMBER_OF_WORDS;
    }

    return wcount;
}

int find(const char word[], const word_count_word_t words[MAX_WORDS]) {
    for ( size_t i = 0; i < MAX_WORDS; ++i ) {
        if ( strcmp(word, words[i].text) == 0 )
            return i;
    }

    return -1;
}

bool is_apostrophe(const char* c, const char str[]) {
    return
        *c == '\'' &&
        isalnum(*(c-1)) && isalnum(*(c+1)) &&
        c != str && *c != 0;
}
