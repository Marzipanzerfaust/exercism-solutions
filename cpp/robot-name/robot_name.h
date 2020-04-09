#ifndef ROBOT_NAME_H
#define ROBOT_NAME_H

#include <string>
#include <array>
#include <random>

using namespace std;

namespace robot_name {
    // Number of possible names: [A-Z]{2}[0-9]{3}
    constexpr size_t names_n = 26*26*10*10*10;

    class robot {
    private:
        static array<string, robot_name::names_n> names;
        static string* next_name_ptr;
        static default_random_engine rng;
        static bool initialized;

        static void init_names();
        static void reset_names();

        string _name;
    public:
        robot();

        string name() const;
        void reset();
    };
}

#endif
