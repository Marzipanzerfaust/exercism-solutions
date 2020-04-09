#ifndef ANAGRAM_HPP
#define ANAGRAM_HPP

using namespace std;

#include <vector>
#include <string>
#include <initializer_list>

namespace anagram {
    class anagram {
    private:
        string input;
    public:
        anagram(const string&);
        vector<string> matches(const initializer_list<string>&);
    };

    string str_tolower(const string&);
    bool is_anagram(const string&, const string&);
}

#endif
