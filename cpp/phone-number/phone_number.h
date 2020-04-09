#ifndef PHONE_NUMBER_H
#define PHONE_NUMBER_H

#include <string>

using namespace std;

namespace phone_number {
    class phone_number {
    public:
        phone_number(const string&);

        string number() const;
        string area_code() const;

        operator string() const {
            return inner_string;
        }
    private:
        string inner_string, inner_number, inner_area_code;
    };
}

#endif
