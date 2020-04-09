#include "reverse_string.h"
#include <algorithm>

using namespace std;

string reverse_string::reverse_string(const string& input) {
    auto output = string(input);
    reverse(output.begin(), output.end());

    return output;
}
