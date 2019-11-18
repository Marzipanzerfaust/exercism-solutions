#include "robot_name.h"

using namespace std;

robot_name::robot::robot() {
    inner_name = next_name();
}

string robot_name::robot::name() {
    return inner_name;
}

string robot_name::robot::next_name() {
    increment_number();

    if (number > 999) {
        number = 0;
        increment_letters();
    }

    ostringstream oss;
    oss

    return letters +
}
