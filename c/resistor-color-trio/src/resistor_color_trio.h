#ifndef RESISTOR_COLOR_TRIO_H
#define RESISTOR_COLOR_TRIO_H

#include <stdint.h>

enum color {
    BLACK, BROWN, RED, ORANGE, YELLOW,
    GREEN, BLUE, VIOLET, GREY, WHITE
};

enum ohms_unit { OHMS, KILOOHMS };

typedef enum color resistor_band_t;
typedef enum ohms_unit unit_t;

struct resistor_value_t {
    uint16_t value;
    unit_t unit;
};

typedef struct resistor_value_t resistor_value_t;

resistor_value_t color_code(const resistor_band_t[3]);

#endif
