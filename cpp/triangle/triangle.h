#ifndef TRIANGLE_H
#define TRIANGLE_H

namespace triangle {
    enum flavor {equilateral, isosceles, scalene, invalid = -1};

    flavor kind(float, float, float);
}

#endif
