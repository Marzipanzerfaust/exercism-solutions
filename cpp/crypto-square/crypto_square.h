#ifndef CRYPTO_SQUARE_H
#define CRYPTO_SQUARE_H

#include <string>
#include <vector>

using namespace std;

namespace crypto_square {
    class cipher {
        string plaintext;
    public:
        cipher(const string&);
        string normalize_plain_text();
        vector<string> plain_text_segments();
        string cipher_text();
        string normalized_cipher_text();
    };
}

#endif
