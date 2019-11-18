#include <string>
#include <vector>
#include <set>

namespace anagram {
    class anagram {
    public:
        anagram(std::string);
        std::vector<std::string> matches(std::initializer_list<std::string>);
    };
}
