#include "allergies.h"
#include <algorithm>

using namespace std;

allergies::allergy_test::allergy_test(int n) {
    m_score = n;
}

bool allergies::allergy_test::is_allergic_to(const string& allergen) const {
    return (m_score & allergens.at(allergen)) != 0;
}

unordered_set<string> allergies::allergy_test::get_allergies() const {
    unordered_set<string> output;

    for (auto p : allergens) {
        auto allergen = p.first;

        if (is_allergic_to(allergen))
            output.insert(allergen);
    }

    return output;
}
