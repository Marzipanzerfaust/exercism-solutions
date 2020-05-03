#ifndef BEER_SONG_H
#define BEER_SONG_H

#include <string>

namespace beer_song {
    std::string verse(int);
    std::string sing(int start, int end = 0);
}

#endif
