#include "resistor_color.h"

resistor_band_t color_code(resistor_band_t band) {
    return band;
}

resistor_band_t* colors(void) {
    static resistor_band_t _colors[] = {
        BLACK, BROWN, RED, ORANGE, YELLOW,
        GREEN, BLUE, VIOLET, GREY, WHITE
    };

    return _colors;
}
