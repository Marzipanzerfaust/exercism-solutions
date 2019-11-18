#include "space_age.h"

using namespace std;

long space_age::space_age::seconds() const {
    return inner_seconds;
}

float space_age::space_age::on_earth() const {
    return inner_seconds / earth_seconds;
}

float space_age::space_age::on_mercury() const {
    return inner_seconds / mercury_seconds;
}

float space_age::space_age::on_venus() const {
    return inner_seconds / venus_seconds;
}

float space_age::space_age::on_mars() const {
    return inner_seconds / mars_seconds;
}

float space_age::space_age::on_jupiter() const {
    return inner_seconds / jupiter_seconds;
}

float space_age::space_age::on_saturn() const {
    return inner_seconds / saturn_seconds;
}

float space_age::space_age::on_uranus() const {
    return inner_seconds / uranus_seconds;
}

float space_age::space_age::on_neptune() const {
    return inner_seconds / neptune_seconds;
}
