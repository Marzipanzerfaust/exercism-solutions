#include "say.h"
#include <map>
#include <vector>
#include <sstream>
#include <iterator>

using namespace std;

// Join a vector of words into a single string, inserting the given
// delimiter between them.
static string join(const vector<string>& words, const char* delim) {
    ostringstream output;

    copy(words.begin(), words.end() - 1,
         ostream_iterator<string>(output, delim));

    output << *words.rbegin();

    return output.str();
}

static map<int, string> primitives = {
    {0, "zero"},
    {1, "one"},
    {2, "two"},
    {3, "three"},
    {4, "four"},
    {5, "five"},
    {6, "six"},
    {7, "seven"},
    {8, "eight"},
    {9, "nine"},
    {10, "ten"},
    {11, "eleven"},
    {12, "twelve"},
    {13, "thirteen"},
    {14, "fourteen"},
    {15, "fifteen"},
    {16, "sixteen"},
    {17, "seventeen"},
    {18, "eighteen"},
    {19, "nineteen"},
    {20, "twenty"},
    {30, "thirty"},
    {40, "forty"},
    {50, "fifty"},
    {60, "sixty"},
    {70, "seventy"},
    {80, "eighty"},
    {90, "ninety"},
    {100, "hundred"},
    {1e3, "thousand"},
    {1e6, "million"},
    {1e9, "billion"}
};

string say::in_english(unsigned long long n) {
    if (n >= 1e12)
        throw domain_error("Numbers greater than or equal to one trillion are not allowed");

    if (n < 100) {
        if (primitives.find(n) != primitives.end())
            return primitives[n];

        for (auto it = primitives.rbegin(); it != primitives.rend(); ++it) {
            auto unit = it->first;
            auto word = it->second;

            if (unit >= 100)
                continue;

            auto quotient = n / unit;
            n %= unit;

            if (quotient > 0)
                return word + "-" + primitives[n];
        }
    } else if (primitives.find(n) != primitives.end()) {
        return "one " + primitives[n];
    }

    vector<string> terms;

    for (auto it = primitives.rbegin(); it != primitives.rend(); ++it) {
        auto unit = it->first;
        auto word = it->second;

        if (unit == 0)
            break;

        auto quotient = n / unit;
        n %= unit;

        if (quotient > 0) {
            terms.push_back(in_english(quotient));
            terms.push_back(word);
            break;
        }
    }

    terms.push_back(in_english(n));

    return join(terms, " ");
}

// For fun: use espeak to say it out loud
void say::out_loud(unsigned long long n) {
    string comm;
    comm += "espeak \"";
    comm += in_english(n);
    comm += "\"";

    system(comm.data());
}
