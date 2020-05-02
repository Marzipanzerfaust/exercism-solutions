#include "robot_simulator.h"

using namespace std;

robot_simulator::Robot::Robot(const pair<int, int>& pos, robot_simulator::Bearing b) {
    position = pos;
    bearing = b;

    x = &position.first;
    y = &position.second;
}

pair<int, int> robot_simulator::Robot::get_position() const {
    return position;
}

robot_simulator::Bearing robot_simulator::Robot::get_bearing() const {
    return bearing;
}

void robot_simulator::Robot::turn_right() {
    switch (bearing) {
    case Bearing::NORTH:
        bearing = Bearing::EAST;
        break;
    case Bearing::EAST:
        bearing = Bearing::SOUTH;
        break;
    case Bearing::SOUTH:
        bearing = Bearing::WEST;
        break;
    case Bearing::WEST:
        bearing = Bearing::NORTH;
        break;
    }
}

void robot_simulator::Robot::turn_left() {
    switch (bearing) {
    case Bearing::NORTH:
        bearing = Bearing::WEST;
        break;
    case Bearing::EAST:
        bearing = Bearing::NORTH;
        break;
    case Bearing::SOUTH:
        bearing = Bearing::EAST;
        break;
    case Bearing::WEST:
        bearing = Bearing::SOUTH;
        break;
    }
}

void robot_simulator::Robot::advance() {
    switch (bearing) {
    case Bearing::NORTH: *y += 1; break;
    case Bearing::EAST:  *x += 1; break;
    case Bearing::SOUTH: *y -= 1; break;
    case Bearing::WEST:  *x -= 1; break;
    }
}

void robot_simulator::Robot::execute_sequence(const string& input) {
    for (auto c : input) {
        switch (c) {
        case 'R': turn_right(); break;
        case 'L': turn_left(); break;
        case 'A': advance(); break;
        }
    }
}
