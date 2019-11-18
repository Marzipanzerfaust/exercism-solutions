#include "space_age.h"

float convert_planet_age(planet_t planet, int64_t input) {
    float output = input / 31557600;  // Earth years

    if (planet == MERCURY)
        output /= 0.2408467;
    else if (planet == VENUS)
        output /= 0.61519726;
    else if (planet == MARS)
        output /= 1.8808158;
    else if (planet == JUPITER)
        output /= 11.862615;
    else if (planet == SATURN)
        output /= 29.447498;
    else if (planet == URANUS)
        output /= 84.016846;
    else if (planet == NEPTUNE)
        output /= 164.791132;

    return output;
}
