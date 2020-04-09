#ifndef WORD_COUNT_H
#define WORD_COUNT_H

#include <string>
#include <vector>
#include <map>
#include <regex>

using namespace std;

namespace word_count {
    map<string, int> words(const string&);
    vector<string> tokenize(const string&, const regex&);
    string downcase(const string&);
}

#endif
