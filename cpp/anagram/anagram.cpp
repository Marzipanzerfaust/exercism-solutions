#include "anagram.h"

using namespace std;

class anagram::anagram {
public:
    anagram(string s) : s(s) {}

    vector<string> matches(initializer_list<string> tests) {
        vector<string> out;

        for (string x : tests) {
            // If `x` is an anagram of `s`, add it to `out`
            if (set {x})
                out.push_back(x);
        }
        return out;
    }
private:
    string s;
}
