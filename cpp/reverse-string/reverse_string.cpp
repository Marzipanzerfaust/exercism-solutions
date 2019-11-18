#include "reverse_string.h"

std::string reverse_string::reverse_string(std::string input) {
    std::string output;

    std::reverse(std::begin(input), std::end(input));
    for (char c: input) output += c;

    return output;
}
