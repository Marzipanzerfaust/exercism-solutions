#include "pangram.h"

#include <unordered_set>
#include <algorithm>

using namespace std;

bool pangram::is_pangram(const string& text) {
    static string alphabet = "abcdefghijklmnopqrstuvxwyz";

    unordered_set<char> letters_left(alphabet.begin(), alphabet.end());

    string downcase(text);
    transform(downcase.begin(), downcase.end(), downcase.begin(), ::tolower);

    for (auto c : downcase)
        letters_left.erase(c);

    return letters_left.empty();
}
