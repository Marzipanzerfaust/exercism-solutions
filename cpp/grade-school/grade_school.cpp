#include "grade_school.h"
#include <algorithm>

using namespace std;

void grade_school::school::add(const string& name, int grade) {
    auto& grade_roster = inner_roster[grade];

    grade_roster.push_back(name);
    sort(grade_roster.begin(), grade_roster.end());
}

map<int, vector<string>> grade_school::school::roster() const {
    return inner_roster;
}

vector<string> grade_school::school::grade(int n) const {
    vector<string> out;

    try {
        out = inner_roster.at(n);
    } catch (out_of_range& e) {
        out = {};
    }

    return out;
}
