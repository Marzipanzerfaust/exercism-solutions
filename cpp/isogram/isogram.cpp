#include "isogram.h"

namespace isogram {
    bool is_isogram(string input) {
        if (input == "") return true;

        // Character counter
        map<char, int> counter;

        // Remove non-alphanumeric characters from input
        regex nonalpha_re("[^[:alnum:]]");
        input = regex_replace(input, nonalpha_re, "");

        // Downcase input
        transform(input.begin(), input.end(), input.begin(), ::tolower);

        // Iterate through input and increment counter for each
        // character
        for (string::size_type i = 0; i < input.size(); i++) {
            if (++counter[input[i]] > 1) return false;
        }

        return true;
    }
}
