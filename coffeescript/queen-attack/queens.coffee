class Queens
    constructor: (kwargs) ->
        @white = kwargs?.white ? [0, 3]
        @black = kwargs?.black ? [7, 3]

        if @white[0] == @black[0] && @white[1] == @black[1]
            throw "Queens cannot share the same space"

    toString: ->
        board = []

        for i in [0..7]
            for j in [0..7]
                char = if j == @white[0] && i == @white[1]
                    "W"
                else if j == @black[0] && i == @black[1]
                    "B"
                else
                    "_"

                board.push([]) if j == 0
                board[i].push(char)

        return board.map((row) => row.join(" ")).join("\n")

    canAttack: ->
        slope = (@white[1] - @black[1]) / (@white[0] - @black[0])
        return Math.abs(slope) in [1, Infinity, 0]

module.exports = Queens
