#include "scrabble_score.h"

using namespace std;

int scrabble_score::score(const string& word) {
    int sum = 0;

    for (auto c : word) {
        sum += scrabble_score::letter_values.at(toupper(c));
    }

    return sum;
}
