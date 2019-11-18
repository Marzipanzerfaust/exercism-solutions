#include "word_count.h"

using namespace std;

map<string, int> word_count::words(const string& s) {
    map<string, int> out;
    regex word_re {"(?:\\w'\\w|\\w)+"};

    for (auto word : tokenize(s, word_re)) {
        out[downcase(word)] += 1;
    }

    return out;
}

vector<string> word_count::tokenize(const string& s, const regex& re) {
    sregex_token_iterator iter {s.begin(), s.end(), re};
    sregex_token_iterator end;

    return vector<string> {iter, end};
}

string word_count::downcase(const string& s) {
    string out;

    for (auto c : s) {
        out += tolower(c);
    }

    return out;
}
