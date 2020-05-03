#ifndef QUEEN_ATTACK_H
#define QUEEN_ATTACK_H

#include <utility>
#include <string>

namespace queen_attack {
    class chess_board {
        std::pair<int, int> m_white;
        std::pair<int, int> m_black;
    public:
        chess_board(const std::pair<int, int>& = {0, 3},
                    const std::pair<int, int>& = {7, 3});
        std::pair<int, int> white() const;
        std::pair<int, int> black() const;
        operator std::string() const;
        bool can_attack() const;
    };
}

#endif
