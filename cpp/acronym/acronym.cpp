#include "acronym.h"
#include <sstream>
#include <regex>
#include <vector>

using namespace std;

string acronym::acronym(const string& input) {
    stringstream output;

    // Remove all non-alpha, non-whitespace characters
    auto normal = regex_replace(input, regex("[^\\s\\w]"), " ");

    // Split into a vector of words
    vector<string> words;
    string word;
    stringstream ss(normal);

    while (ss >> word)
        words.push_back(word);

    // Return the first character of each word, capitalized
    for (auto word : words)
        output << char(toupper(word[0]));

    return output.str();
}
