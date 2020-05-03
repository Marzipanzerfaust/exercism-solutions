#ifndef GRADE_SCHOOL_H
#define GRADE_SCHOOL_H

#include <string>
#include <map>
#include <vector>

namespace grade_school {
    class school {
        std::map<int, std::vector<std::string>> inner_roster;
    public:
        void add(const std::string&, int);

        std::map<int, std::vector<std::string>> roster() const;
        std::vector<std::string> grade(int) const;
    };
}

#endif
