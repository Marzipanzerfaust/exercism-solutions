#include "matching_brackets.h"

#include <unordered_map>
#include <stack>

using namespace std;

bool matching_brackets::check(const string& input) {
    static unordered_map<char, char> pairs = {
        {'(', ')'},
        {'[', ']'},
        {'{', '}'}
    };

    stack<char> s;

    for (auto c : input) {
        if (c == '(' || c == '[' || c == '{') {
            s.push(c);
        } else if (c == ')' || c == ']' || c == '}') {
            if (s.empty())
                return false;

            auto last = s.top();
            s.pop();

            if (pairs[last] != c)
                return false;
        }
    }

    return s.empty();
}
