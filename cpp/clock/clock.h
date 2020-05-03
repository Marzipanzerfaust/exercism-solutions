#ifndef CLOCK_H
#define CLOCK_H

#include <string>

namespace date_independent {
    class clock {
        int hour;
        int minute;
        clock(int, int);
    public:
        static clock at(int, int);
        operator std::string() const;
        clock plus(int);
        bool operator==(const clock&) const;
        bool operator!=(const clock&) const;
        int get_hours() const;
        int get_minutes() const;
    };
}

#endif
