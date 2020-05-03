#ifndef PHONE_NUMBER_H
#define PHONE_NUMBER_H

#include <string>

namespace phone_number {
    class phone_number {
        std::string inner_string, inner_number, inner_area_code;
    public:
        phone_number(const std::string&);

        std::string number() const;
        std::string area_code() const;

        operator std::string() const {
            return inner_string;
        }
    };
}

#endif
