#include "darts.h"
#include <math.h>

uint8_t score(coordinate_t c) {
    double distance = sqrt(pow(c.x, 2) + pow(c.y, 2));

    if (distance > 10)
        return 0;
    else if (distance > 5)
        return 1;
    else if (distance > 1)
        return 5;
    else
        return 10;
}
