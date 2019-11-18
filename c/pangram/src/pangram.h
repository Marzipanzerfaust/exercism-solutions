#ifndef PANGRAM_H
#define PANGRAM_H

#include <stdbool.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

bool is_pangram(const char sentence[]);
int chrcmp(const void*, const void*);

#endif
