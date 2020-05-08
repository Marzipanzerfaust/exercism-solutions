#include "atbash_cipher.h"

#include <algorithm>
#include <regex>
#include <vector>
#include <sstream>

using namespace std;

// Return the letter in the alphabet that is opposite to the given
// letter
static char opposite_alphabet(char x) {
    static string alphabet = "abcdefghijklmnopqrstuvwxyz";
    static string reversed = "zyxwvutsrqponmlkjihgfedcba";

    auto it = find(alphabet.begin(), alphabet.end(), x);

    if (it == alphabet.end())
        return x;

    auto idx = distance(alphabet.begin(), it);

    return reversed[idx];
}

// Join a vector of words into a new string where each word is separated
// by the given delimiter
static string join(const vector<string>& words, const string& delim) {
    stringstream output;

    for (auto it = words.begin(); it != words.end() - 1; ++it)
        output << *it << delim;

    output << *words.rbegin();

    return output.str();
}

string atbash_cipher::encode(const string& input) {
    string output(input);

    // Convert to lowercase
    transform(output.begin(), output.end(), output.begin(), ::tolower);

    // Remove all non-alphanumeric characters
    output = regex_replace(output, regex("\\W"), "");

    // Translate to reverse alphabet
    transform(output.begin(), output.end(), output.begin(), opposite_alphabet);

    // Split the string into a vector of substrings of size 5
    vector<string> subs;

    for (size_t i = 0; i < output.size(); i += 5)
        subs.push_back(output.substr(i, 5));

    // Join them back together, separated by a space
    return join(subs, " ");
}

string atbash_cipher::decode(const string& input) {
    string output(input);

    // Remove whitespace
    output = regex_replace(output, regex("\\s"), "");

    // Translate to reverse alphabet
    transform(output.begin(), output.end(), output.begin(), opposite_alphabet);

    return output;
}
