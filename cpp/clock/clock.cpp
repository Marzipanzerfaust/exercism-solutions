#include "clock.h"

using namespace std;

date_independent::clock::clock(int h, int m) {
    hour = h;
    minute = m;

    while (minute >= 60) {
        minute -= 60;
        hour += 1;
    }

    while (minute < 0) {
        minute += 60;
        hour -= 1;
    }

    if (hour >= 24)
        hour %= 24;

    while (hour < 0)
        hour += 24;
}

date_independent::clock date_independent::clock::at(int h, int m) {
    return clock(h, m);
}

date_independent::clock::operator string() const {
    auto hh = to_string(hour);
    auto mm = to_string(minute);

    if (hour < 10)
        hh.insert(hh.begin(), 1, '0');

    if (minute < 10)
        mm.insert(mm.begin(), 1, '0');

    return hh + ":" + mm;
}

date_independent::clock date_independent::clock::plus(int n) {
    return clock(hour, minute + n);
}

bool date_independent::clock::operator==(const date_independent::clock& other) const {
    return hour == other.get_hours() && minute == other.get_minutes();
}

bool date_independent::clock::operator!=(const date_independent::clock& other) const {
    return !(*this == other);
}

int date_independent::clock::get_hours() const {
    return hour;
}

int date_independent::clock::get_minutes() const {
    return minute;
}
