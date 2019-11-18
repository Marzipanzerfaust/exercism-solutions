#include <string>
#include <vector>
#include <map>
#include <regex>
#include <cctype>

namespace word_count {
    std::map<std::string, int> words(const std::string&);
    std::vector<std::string> tokenize(const std::string&, const std::regex&);
    std::string downcase(const std::string&);
}
