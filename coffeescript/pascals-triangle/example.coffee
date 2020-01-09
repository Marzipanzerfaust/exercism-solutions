class Pascal
    constructor: (n) ->
        @array = [[1]]

        for _ in [1...n]
            last = @array[@array.length - 1]
            @array.push((last[j - 1] ? 0) + (last[j] ? 0) for j in [0..last.length])

module.exports = Pascal
