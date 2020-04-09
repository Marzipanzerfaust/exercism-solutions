#include "binary_search.h"

int* binary_search(int value, int* arr, size_t length) {
    if (length == 1) {
        if (arr[0] == value)
            return arr;
        else
            return NULL;
    }

    if (length == 0)
        return NULL;

    size_t middle = length / 2;

    if (arr[middle] < value)
        return binary_search(value, &arr[middle], middle + 1);
    else if (arr[middle] > value)
        return binary_search(value, arr, middle);
    else
        return &arr[middle];
}
