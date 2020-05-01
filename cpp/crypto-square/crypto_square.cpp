#include "crypto_square.h"
#include <regex>
#include <algorithm>
#include <sstream>

using namespace std;

crypto_square::cipher::cipher(const string& input) {
    plaintext = input;
}

string crypto_square::cipher::normalize_plain_text() {
    string normalized(plaintext);

    if (plaintext.empty())
        return normalized;

    // Convert to lowercase
    transform(normalized.begin(), normalized.end(), normalized.begin(), ::tolower);

    return regex_replace(normalized, regex("\\W"), "");
}

vector<string> crypto_square::cipher::plain_text_segments() {
    vector<string> output;

    if (plaintext.empty())
        return output;

    auto normalized = normalize_plain_text();

    // Determine the slice size n
    size_t n = 1;

    while (!(n * n >= normalized.size() || n * (n - 1) >= normalized.size()))
        n += 1;

    // Divide the string into n-sized slices
    for (size_t i = 0; i < normalized.size(); i += n)
        output.push_back(normalized.substr(i, n));

    return output;
}

string crypto_square::cipher::cipher_text() {
    stringstream output;

    if (plaintext.empty())
        return output.str();

    auto segments = plain_text_segments();
    auto size = segments[0].size();

    for (size_t i = 0; i < size; ++i) {
        for (auto seg : segments)
            if (i <= seg.size() - 1)
                output << seg[i];
    }

    return output.str();
}

string crypto_square::cipher::normalized_cipher_text() {
    stringstream output;

    if (plaintext.empty())
        return output.str();

    auto segments = plain_text_segments();
    auto size = segments[0].size();

    for (size_t i = 0; i < size; ++i) {
        for (auto seg : segments)
            if (i <= seg.size() - 1)
                output << seg[i];
            else
                output << ' ';

        if (i < size - 1)
            output << ' ';
    }

    return output.str();
}
