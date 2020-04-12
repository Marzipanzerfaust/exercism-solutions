#include "meetup.h"

using namespace std;
using namespace boost::gregorian;

meetup::scheduler::scheduler(int month, int year) {
    this->month = month;
    this->year = year;

    last_day = gregorian_calendar::end_of_month_day(year, month);
}

date meetup::scheduler::find(const string& descriptor, int day_of_week) const {
    int start, end;

    if (descriptor == "teenth")
        start = 13, end = 19;
    else if (descriptor == "first")
        start = 1, end = 7;
    else if (descriptor == "second")
        start = 8, end = 14;
    else if (descriptor == "third")
        start = 15, end = 21;
    else if (descriptor == "fourth")
        start = 22, end = 28;
    else if (descriptor == "last")
        start = last_day - 6, end = last_day;

    day_iterator iter = {date(year, month, start)};

    while (iter->day() <= end) {
        if (day_of_week == iter->day_of_week())
            return date(year, month, iter->day());

        ++iter;
    }

    return date(0, 0, 0);
}

date meetup::scheduler::monteenth() const {
    return find("teenth", Monday);
}

date meetup::scheduler::tuesteenth() const {
    return find("teenth", Tuesday);
}

date meetup::scheduler::wednesteenth() const {
    return find("teenth", Wednesday);
}

date meetup::scheduler::thursteenth() const {
    return find("teenth", Thursday);
}

date meetup::scheduler::friteenth() const {
    return find("teenth", Friday);
}

date meetup::scheduler::saturteenth() const {
    return find("teenth", Saturday);
}

date meetup::scheduler::sunteenth() const {
    return find("teenth", Sunday);
}

date meetup::scheduler::first_monday() const {
    return find("first", Monday);
}

date meetup::scheduler::second_monday() const {
    return find("second", Monday);
}

date meetup::scheduler::third_monday() const {
    return find("third", Monday);
}

date meetup::scheduler::fourth_monday() const {
    return find("fourth", Monday);
}

date meetup::scheduler::last_monday() const {
    return find("last", Monday);
}

date meetup::scheduler::first_tuesday() const {
    return find("first", Tuesday);
}

date meetup::scheduler::second_tuesday() const {
    return find("second", Tuesday);
}

date meetup::scheduler::third_tuesday() const {
    return find("third", Tuesday);
}

date meetup::scheduler::fourth_tuesday() const {
    return find("fourth", Tuesday);
}

date meetup::scheduler::last_tuesday() const {
    return find("last", Tuesday);
}

date meetup::scheduler::first_wednesday() const {
    return find("first", Wednesday);
}

date meetup::scheduler::second_wednesday() const {
    return find("second", Wednesday);
}

date meetup::scheduler::third_wednesday() const {
    return find("third", Wednesday);
}

date meetup::scheduler::fourth_wednesday() const {
    return find("fourth", Wednesday);
}

date meetup::scheduler::last_wednesday() const {
    return find("last", Wednesday);
}

date meetup::scheduler::first_thursday() const {
    return find("first", Thursday);
}

date meetup::scheduler::second_thursday() const {
    return find("second", Thursday);
}

date meetup::scheduler::third_thursday() const {
    return find("third", Thursday);
}

date meetup::scheduler::fourth_thursday() const {
    return find("fourth", Thursday);
}

date meetup::scheduler::last_thursday() const {
    return find("last", Thursday);
}

date meetup::scheduler::first_friday() const {
    return find("first", Friday);
}

date meetup::scheduler::second_friday() const {
    return find("second", Friday);
}

date meetup::scheduler::third_friday() const {
    return find("third", Friday);
}

date meetup::scheduler::fourth_friday() const {
    return find("fourth", Friday);
}

date meetup::scheduler::last_friday() const {
    return find("last", Friday);
}

date meetup::scheduler::first_saturday() const {
    return find("first", Saturday);
}

date meetup::scheduler::second_saturday() const {
    return find("second", Saturday);
}

date meetup::scheduler::third_saturday() const {
    return find("third", Saturday);
}

date meetup::scheduler::fourth_saturday() const {
    return find("fourth", Saturday);
}

date meetup::scheduler::last_saturday() const {
    return find("last", Saturday);
}

date meetup::scheduler::first_sunday() const {
    return find("first", Sunday);
}

date meetup::scheduler::second_sunday() const {
    return find("second", Sunday);
}

date meetup::scheduler::third_sunday() const {
    return find("third", Sunday);
}

date meetup::scheduler::fourth_sunday() const {
    return find("fourth", Sunday);
}

date meetup::scheduler::last_sunday() const {
    return find("last", Sunday);
}
