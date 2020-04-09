#include "robot_name.h"
#include <algorithm>

using namespace std;

array<string, robot_name::names_n> robot_name::robot::names;
string* robot_name::robot::next_name_ptr;
default_random_engine robot_name::robot::rng;
bool robot_name::robot::initialized;

void robot_name::robot::init_names() {
    auto i = 0;
    char chars[5];

    // Populate the names array with every possible name
    for (auto a = 'A'; a <= 'Z'; ++a) {
        chars[0] = a;
        for (auto b = 'A'; b <= 'Z'; ++b) {
            chars[1] = b;
            for (auto c = '0'; c <= '9'; ++c) {
                chars[2] = c;
                for (auto d = '0'; d <= '9'; ++d) {
                    chars[3] = d;
                    for (auto e = '0'; e <= '9'; ++e) {
                        chars[4] = e;
                        names[i++] = chars;
                    }
                }
            }
        }
    }

    // Shuffle them and initialize the next name pointer
    reset_names();

    initialized = true;
}

void robot_name::robot::reset_names() {
    shuffle(names.begin(), names.end(), rng);
    next_name_ptr = &names[0];
}

robot_name::robot::robot() {
    if (!initialized)
        init_names();

    _name = *next_name_ptr++;
}

string robot_name::robot::name() const {
    return _name;
}

void robot_name::robot::reset() {
    _name = *next_name_ptr++;
}
