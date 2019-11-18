#include "resistor_color_trio.h"

resistor_value_t color_code(const resistor_band_t bands[3]) {
    resistor_value_t out;

    unsigned tmp;  // Necessary to store values potentially too large for uint16_t

    tmp = bands[0] * 10 + bands[1];
    tmp *= pow(10, bands[2]);

    if (tmp < 1000) {
        out.unit = OHMS;
    } else {
        out.unit = KILOOHMS;
        tmp /= 1000;
    }

    out.value = tmp;

    return out;
}
