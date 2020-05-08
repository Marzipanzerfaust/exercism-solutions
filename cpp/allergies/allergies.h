#ifndef ALLERGIES_H
#define ALLERGIES_H

#include <unordered_map>
#include <string>
#include <unordered_set>

namespace allergies {
    const std::unordered_map<std::string, int> allergens = {
        {"eggs", 1},
        {"peanuts", 2},
        {"shellfish", 4},
        {"strawberries", 8},
        {"tomatoes", 16},
        {"chocolate", 32},
        {"pollen", 64},
        {"cats", 128}
    };

    class allergy_test {
        int m_score;
    public:
        allergy_test(int);
        bool is_allergic_to(const std::string&) const;
        std::unordered_set<std::string> get_allergies() const;
    };
}

#endif
