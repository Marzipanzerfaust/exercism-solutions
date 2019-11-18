class Binary
    constructor: (@value) ->

    toDecimal: ->
        if isNaN(@value)
            return 0
        else
            iterator = Array.from(@value).reverse().entries()
            decimal = 0

            while (entry = iterator.next().value) and not entry.done
                [i, val] = entry
                if val > 1
                    return 0
                else
                    decimal += val * 2 ** i

            return decimal

module.exports = Binary
