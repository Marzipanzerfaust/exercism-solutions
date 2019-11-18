#ifndef ARMSTRONG_NUMBERS
#define ARMSTRONG_NUMBERS

#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <stdio.h>

bool is_armstrong_number(unsigned);

// Returns a string of the decimal representation of a given number
char* itoa(unsigned);
// Calculates the number of digits in the decimal representation of a
// given number
unsigned num_digits(unsigned);

#endif
