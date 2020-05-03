#ifndef WORD_COUNT_H
#define WORD_COUNT_H

#include <string>
#include <vector>
#include <map>
#include <regex>

namespace word_count {
    std::map<std::string, int> words(const std::string&);
    std::vector<std::string> tokenize(const std::string&, const std::regex&);
    std::string downcase(const std::string&);
}

#endif
