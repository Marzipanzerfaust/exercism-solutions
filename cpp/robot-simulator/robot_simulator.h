#ifndef ROBOT_SIMULATOR_H
#define ROBOT_SIMULATOR_H

#include <utility>
#include <string>

using namespace std;

namespace robot_simulator {
    enum Bearing { NORTH, EAST, SOUTH, WEST };

    class Robot {
        pair<int, int> position;
        int* x;
        int* y;
        Bearing bearing;
    public:
        Robot(const pair<int, int>& = {0, 0}, Bearing = Bearing::NORTH);
        pair<int, int> get_position() const;
        Bearing get_bearing() const;
        void turn_right();
        void turn_left();
        void advance();
        void execute_sequence(const string&);
    };
}

#endif
