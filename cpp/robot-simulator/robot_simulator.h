#ifndef ROBOT_SIMULATOR_H
#define ROBOT_SIMULATOR_H

#include <utility>
#include <string>

namespace robot_simulator {
    enum Bearing { NORTH, EAST, SOUTH, WEST };

    class Robot {
        std::pair<int, int> position;
        int* x;
        int* y;
        Bearing bearing;
    public:
        Robot(const std::pair<int, int>& = {0, 0}, Bearing = Bearing::NORTH);
        std::pair<int, int> get_position() const;
        Bearing get_bearing() const;
        void turn_right();
        void turn_left();
        void advance();
        void execute_sequence(const std::string&);
    };
}

#endif
