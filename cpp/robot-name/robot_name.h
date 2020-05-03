#ifndef ROBOT_NAME_H
#define ROBOT_NAME_H

#include <string>
#include <array>
#include <random>

namespace robot_name {
    // Number of possible names: [A-Z]{2}[0-9]{3}
    constexpr size_t names_n = 26*26*10*10*10;

    class robot {
        static std::array<std::string, robot_name::names_n> names;
        static std::string* next_name_ptr;
        static std::default_random_engine rng;
        static bool initialized;

        static void init_names();
        static void reset_names();

        std::string m_name;
    public:
        robot();

        std::string name() const;
        void reset();
    };
}

#endif
