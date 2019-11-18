class Trinary
    constructor: (@string) ->

    toDecimal: ->
        if isNaN(@string)
            return 0
        else
            iterator = Array.from(@string).reverse().entries()
            decimal = 0

            while (entry = iterator.next().value) and not entry.done
                [i, val] = entry
                if val > 2
                    return 0
                else
                    decimal += val * 3 ** i

            return decimal

module.exports = Trinary
