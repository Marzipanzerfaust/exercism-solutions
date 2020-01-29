#include "series.h"

series_results_t series(char* input_text, unsigned int substring_length) {
    series_results_t results = {
        .substring_count = strlen(input_text) - substring_length + 1
    };

    /* results.substring_count = strlen(input_text) - substring_length + 1; */

    char** substrings;

    for (size_t i = 0; i < results.substring_count; ++i)
        substrings[i] = &input_text[i];

    results.substring = substrings;

    return results;
}
