#include "pascals_triangle.h"
#include <iostream>

using namespace std;

vector<vector<int>> pascals_triangle::generate_rows(int n) {
    if (n == 0) return {};
    if (n == 1) return { {1} };

    vector<vector<int>> triangle = { {1} };

    for (int i = 1; i < n; ++i) {
        vector<int> row;
        vector<int>& prev_row = triangle[i-1];

        for (int j = 0; j <= i; ++j) {
            if (j == 0 || j == i)
                row.push_back(1);
            else
                row.push_back(prev_row[j-1] + prev_row[j]);
        }

        triangle.push_back(row);
    }

    return triangle;
}
