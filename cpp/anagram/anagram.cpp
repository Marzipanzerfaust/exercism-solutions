#include "anagram.h"
#include <algorithm>

using namespace std;

anagram::anagram::anagram(const string& input) {
    this->input = input;
}

vector<string> anagram::anagram::matches(const initializer_list<string>& tests) {
    vector<string> out;

    for (auto i = tests.begin(); i != tests.end(); ++i) {
        if (is_anagram(this->input, *i))
            out.push_back(*i);
    }

    return out;
}

string anagram::str_tolower(const string& s) {
    auto out = string(s);
    auto size = s.size();

    for (size_t i = 0; i < size; ++i)
        out[i] = tolower(s[i]);

    return out;
}

bool anagram::is_anagram(const string& a, const string& b) {
    auto a_lower = str_tolower(a);
    auto b_lower = str_tolower(b);

    if (a_lower.compare(b_lower) == 0)
        return false;

    sort(a_lower.begin(), a_lower.end());
    sort(b_lower.begin(), b_lower.end());

    return a_lower.compare(b_lower) == 0;
}
