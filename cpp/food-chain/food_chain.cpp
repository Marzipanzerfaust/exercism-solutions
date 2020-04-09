#include "food_chain.h"
#include <vector>
#include <map>
#include <sstream>

using namespace std;

static vector<string> animals = {"fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"};

static map<string, string> rhymes = {
    {"fly", "I don't know why she swallowed the fly. Perhaps she'll die.\n"},
    {"spider", "It wriggled and jiggled and tickled inside her.\n"},
    {"bird", "How absurd to swallow a bird!\n"},
    {"cat", "Imagine that, to swallow a cat!\n"},
    {"dog", "What a hog, to swallow a dog!\n"},
    {"goat", "Just opened her throat and swallowed a goat!\n"},
    {"cow", "I don't know how she swallowed a cow!\n"},
    {"horse", "She's dead, of course!\n"}
};

string food_chain::verse(int n) {
    stringstream text;

    auto animal = animals[n - 1];

    text << "I know an old lady who swallowed a " << animal << ".\n";

    if (n != 1)
        text << rhymes[animal];

    if (n > 1 && n < 8) {
        for (auto i = n - 1; i > 0; --i) {
            auto a = animals[i];
            auto b = animals[i - 1];

            text << "She swallowed the " << a << " to catch the " << b;

            if (b.compare("spider") == 0)
                text << " that wriggled and jiggled and tickled inside her";

            text << ".\n";
        }
    }

    if (n != 8)
        text << rhymes["fly"];

    return text.str();
}

string food_chain::verses(int start, int end) {
    stringstream text;

    text << verse(start);

    for (auto i = start + 1; i <= end; ++i)
        text << "\n" << verse(i);

    text << "\n";

    return text.str();
}

string food_chain::sing() {
    return verses(1, 8);
}
