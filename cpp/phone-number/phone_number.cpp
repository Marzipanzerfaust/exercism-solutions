#include "phone_number.h"

using namespace std;

phone_number::phone_number::phone_number(const string& s) {
    regex re {R"(^\D*(?:\+?1)?\D*([2-9]\d{2})\D*([2-9]\d{2})\D*(\d{4})\D*$)"};
    smatch sm;

    if (regex_match(s, sm, re)) {
        inner_number = sm[1].str() + sm[2].str() + sm[3].str();
        inner_area_code = sm[1].str();
        inner_string = "(" + sm[1].str() + ") " + sm[2].str() + "-" + sm[3].str();
    } else {
        throw domain_error("regex didn't match");
    }
}

string phone_number::phone_number::number() const {
    return inner_number;
}

string phone_number::phone_number::area_code() const {
    return inner_area_code;
}
