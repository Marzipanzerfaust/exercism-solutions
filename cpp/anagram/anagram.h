#ifndef ANAGRAM_H
#define ANAGRAM_H

#include <vector>
#include <string>
#include <initializer_list>

namespace anagram {
    class anagram {
        std::string input;
    public:
        anagram(const std::string&);
        std::vector<std::string> matches(const std::initializer_list<std::string>&);
    };
}

#endif
