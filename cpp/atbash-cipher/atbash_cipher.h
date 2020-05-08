#ifndef ATBASH_CIPHER_H
#define ATBASH_CIPHER_H

#include <string>

namespace atbash_cipher {
    std::string encode(const std::string&);
    std::string decode(const std::string&);
}

#endif
