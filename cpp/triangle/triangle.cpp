#include "triangle.h"
#include <set>
#include <array>
#include <algorithm>
#include <stdexcept>

using namespace std;

triangle::flavor triangle::kind(float a, float b, float c) {
    array<float, 3> sides = {a, b, c};

    sort(sides.begin(), sides.end());

    if (sides[0] <= 0)
        throw domain_error("Each side must have a positive length");

    if (sides[0] + sides[1] < sides[2])
        throw domain_error("Any two sides of the triangle must be greater than or equal to the remaining side");

    set<float> uniq {sides.begin(), sides.end()};

    switch (uniq.size()) {
    case 1:
        return triangle::flavor::equilateral;
    case 2:
        return triangle::flavor::isosceles;
    case 3:
        return triangle::flavor::scalene;
    default:
        return triangle::flavor::invalid;
    }
}
