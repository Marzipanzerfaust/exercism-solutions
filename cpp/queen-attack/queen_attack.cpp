#include "queen_attack.h"
#include <stdexcept>
#include <vector>
#include <sstream>

using namespace std;

queen_attack::chess_board::chess_board(const pair<int, int>& white,
                                       const pair<int, int>& black) {
    if (white == black)
        throw domain_error("Queen positions must be distinct");

    m_white = white;
    m_black = black;
}

pair<int, int> queen_attack::chess_board::white() const {
    return m_white;
}

pair<int, int> queen_attack::chess_board::black() const {
    return m_black;
}

// Helper function to join a vector of characters together into a string
// separated by the given delimiter character
static string join(const vector<char>& chars, char delim) {
    stringstream output;

    for (auto it = chars.begin(); it != chars.end() - 1; ++it)
        output << *it << delim;

    output << *chars.rbegin();

    return output.str();
}

queen_attack::chess_board::operator string() const {
    stringstream output;
    vector<char> row;
    pair<int, int> space;

    for (int i = 0; i < 8; ++i) {
        for (int j = 0; j < 8; ++j) {
            space.first = i;
            space.second = j;

            if (space == m_white)
                row.push_back('W');
            else if (space == m_black)
                row.push_back('B');
            else
                row.push_back('_');
        }

        output << join(row, ' ') << '\n';
        row.clear();
    }

    return output.str();
}

bool queen_attack::chess_board::can_attack() const {
    auto same_row = m_white.first == m_black.first;
    auto same_column = m_white.second == m_black.second;

    auto same_pos_diagonal =
        m_white.first - m_black.first ==
        m_white.second - m_black.second;

    auto same_neg_diagonal =
        m_white.first + m_black.first ==
        m_white.second + m_black.second;

    return
        same_row ||
        same_column ||
        same_pos_diagonal ||
        same_neg_diagonal;
}
