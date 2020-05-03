#include "beer_song.h"
#include <sstream>
#include <vector>
#include <iterator>

using namespace std;

static string bottles(int n) {
    if (n == 0)
        return "No more bottles";
    else if (n == 1)
        return "1 bottle";
    else
        return to_string(n) + " bottles";
}

static string join(const vector<string>& words, const char* delim) {
    ostringstream output;

    copy(words.begin(), words.end() - 1,
         ostream_iterator<string>(output, delim));

    output << *words.rbegin();

    return output.str();
}

string beer_song::verse(int n) {
    if (n == 0)
        return
            "No more bottles of beer on the wall, no more bottles of beer.\n"
            "Go to the store and buy some more, 99 bottles of beer on the wall.\n";
    else if (n == 1)
        return
            "1 bottle of beer on the wall, 1 bottle of beer.\n"
            "Take it down and pass it around, no more bottles of beer on the wall.\n";
    else
        return
            bottles(n) + " of beer on the wall, " + bottles(n) + " of beer.\n"
            "Take one down and pass it around, " + bottles(n - 1) + " of beer on the wall.\n";
}

string beer_song::sing(int start, int end) {
    vector<string> verses;

    for (int i = start; i >= end; --i)
        verses.push_back(verse(i));

    return join(verses, "\n");
}
