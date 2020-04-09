#ifndef MEETUP_H
#define MEETUP_H

#include <time.h>
#include <stdbool.h>

int meetup_day_of_month(unsigned int, unsigned int, const char[], const char[]);

typedef struct tm tm_t;

struct tm date_new(unsigned, unsigned, unsigned);
int day_to_i(const char[]);
bool is_teenth(int);
bool is_first(int);
bool is_second(int);
bool is_third(int);
bool is_fourth(int);
bool is_fifth(int);
bool is_last(int, const struct tm*);

#endif
