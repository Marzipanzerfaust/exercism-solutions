#include "beer_song.h"

void verse(char* buffer, unsigned int verse_number) {
    switch (verse_number) {
    case 0:
        sprintf(buffer,
               "No more bottles of beer on the wall, no more bottles of beer.\n"
               "Go to the store and buy some more, 99 bottles of beer on the wall.\n");
        break;
    case 1:
        sprintf(buffer,
               "1 bottle of beer on the wall, 1 bottle of beer.\n"
               "Take it down and pass it around, no more bottles of beer on the wall.\n");
        break;
    case 2:
        sprintf(buffer,
               "2 bottles of beer on the wall, 2 bottles of beer.\n"
               "Take one down and pass it around, 1 bottle of beer on the wall.\n");
        break;
    default:
        sprintf(buffer,
                "%d bottles of beer on the wall, %d bottles of beer.\n"
                "Take one down and pass it around, %d bottles of beer on the wall.\n",
                verse_number, verse_number, verse_number - 1);
        break;
    }
}

void sing(char* buffer, unsigned int starting_verse_number, unsigned int ending_verse_number) {
    for (unsigned int i = starting_verse_number; i >= ending_verse_number; --i) {
        verse(buffer, i);

        if (i > ending_verse_number)
            strcat(buffer, "\n");
    }
}
