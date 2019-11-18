#include "difference_of_squares.h"

#include <cmath>

using namespace std;

int squares::square_of_sum(int n) {
    int sum = 0;

    for (int i = 1; i <= n; ++i)
        sum += i;

    return pow(sum, 2);
}

int squares::sum_of_squares(int n) {
    int sum = 0;

    for (int i = 1; i <= n; ++i)
        sum += pow(i, 2);

    return sum;
}

int squares::difference(int n) {
    return square_of_sum(n) - sum_of_squares(n);
}
