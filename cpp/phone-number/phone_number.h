#ifndef PHONE_NUMBER_H
#define PHONE_NUMBER_H

#include <string>
#include <regex>

namespace phone_number {
    class phone_number {
    public:
        phone_number(const std::string&);
        std::string number() const;
        std::string area_code() const;

        operator std::string() const {
            return inner_string;
        }
    private:
        std::string inner_string, inner_number, inner_area_code;
    };
}

#endif
