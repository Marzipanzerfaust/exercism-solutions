#include "raindrops.h"

using namespace std;

string raindrops::convert(int n) {
    string out;

    if (n % 3 == 0)
        out += "Pling";
    if (n % 5 == 0)
        out += "Plang";
    if (n % 7 == 0)
        out += "Plong";

    if (out.empty())
        out += to_string(n);

    return out;
}
