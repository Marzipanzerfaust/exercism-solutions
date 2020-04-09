#ifndef GRADE_SCHOOL_H
#define GRADE_SCHOOL_H

#include <string>
#include <map>
#include <vector>

using namespace std;

namespace grade_school {
    class school {
    private:
        map<int, vector<string>> inner_roster;
    public:
        void add(const string&, int);

        map<int, vector<string>> roster() const;
        vector<string> grade(int) const;
    };
}

#endif
