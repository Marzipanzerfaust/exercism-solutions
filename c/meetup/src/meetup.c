#include "meetup.h"
#include <string.h>

#define STR_EQUAL(a, b) (strcmp(a, b) == 0)

int meetup_day_of_month(unsigned int year, unsigned int month,
                        const char week[], const char day_of_week[]) {
    tm_t last_day = date_new(month + 1, 0, year);

    int day_n = day_to_i(day_of_week);

    tm_t date = date_new(month, 1, year);

    while (date.tm_mday <= last_day.tm_mday) {
        if (date.tm_wday == day_n)
            if ( (STR_EQUAL(week, "teenth") && is_teenth(date.tm_mday)) ||
                 (STR_EQUAL(week, "first")  && is_first(date.tm_mday))  ||
                 (STR_EQUAL(week, "second") && is_second(date.tm_mday)) ||
                 (STR_EQUAL(week, "third")  && is_third(date.tm_mday))  ||
                 (STR_EQUAL(week, "fourth") && is_fourth(date.tm_mday)) ||
                 (STR_EQUAL(week, "fifth")  && is_fifth(date.tm_mday))  ||
                 (STR_EQUAL(week, "last")   && is_last(date.tm_mday, &last_day)) )
                return date.tm_mday;

        date.tm_mday += 1;
        mktime(&date);
    }

    return 0;
}

tm_t date_new(unsigned month, unsigned day, unsigned year) {
    tm_t out = {.tm_mon = month - 1, .tm_mday = day, .tm_year = year - 1900};
    mktime(&out);

    return out;
}

int day_to_i(const char day[]) {
    if (STR_EQUAL(day, "Sunday"))
        return 0;
    else if (STR_EQUAL(day, "Monday"))
        return 1;
    else if (STR_EQUAL(day, "Tuesday"))
        return 2;
    else if (STR_EQUAL(day, "Wednesday"))
        return 3;
    else if (STR_EQUAL(day, "Thursday"))
        return 4;
    else if (STR_EQUAL(day, "Friday"))
        return 5;
    else if (STR_EQUAL(day, "Saturday"))
        return 6;
    else
        return -1;
}

bool is_teenth(int n) {
    return n >= 13 && n <= 19;
}

bool is_first(int n) {
    return n >= 1 && n <= 7;
}

bool is_second(int n) {
    return n >= 8 && n <= 14;
}

bool is_third(int n) {
    return n >= 15 && n <= 21;
}

bool is_fourth(int n) {
    return n >= 22 && n <= 28;
}

bool is_fifth(int n) {
    return n >= 29;
}

bool is_last(int n, const tm_t* end_date) {
    return n >= end_date->tm_mday - 6 && n <= end_date->tm_mday;
}
