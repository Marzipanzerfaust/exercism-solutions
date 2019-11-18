#include "binary.h"

using namespace std;

int binary::convert(const string& bin) {
    int out = 0;

    string reversed = bin;
    reverse(reversed.begin(), reversed.end());

    for (string::size_type i = 0; i < reversed.size(); ++i) {
        char c = reversed[i];

        switch (c) {
        case '0':
            break;
        case '1':
            out += pow(2, i);
            break;
        default:
            return 0;
        }
    }

    return out;
}
