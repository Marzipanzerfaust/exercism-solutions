#ifndef CRYPTO_SQUARE_H
#define CRYPTO_SQUARE_H

#include <string>
#include <vector>

namespace crypto_square {
    class cipher {
        std::string plaintext;
    public:
        cipher(const std::string&);
        std::string normalize_plain_text();
        std::vector<std::string> plain_text_segments();
        std::string cipher_text();
        std::string normalized_cipher_text();
    };
}

#endif
