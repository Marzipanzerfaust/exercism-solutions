#include "square_root.h"

// Binary search algorithm
//
// Source:
// <https://www.techiedelight.com/find-square-root-using-binary-search-algorithm>
int squareRoot(int n) {
    if (n < 2)
        return 1;

    int result;

    int start = 1;
    int end = n / 2;

    while (start <= end) {
        int mid = (start + end) / 2;
        long square = mid * mid;

        if (square == n) {
            return mid;
        } else if (square < n) {
            start = mid + 1;
            result = mid;
        } else {
            end = mid - 1;
        }
    }

    return result;
}
