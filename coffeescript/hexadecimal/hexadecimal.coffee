class Hexadecimal
    constructor: (@string) ->

    toDecimal: ->
        decimal = 0

        for digit, i in Array.from(@string).reverse()
            if /[\da-f]/.test(digit)
                decimal += parseInt(hex2dec(digit)) * 16 ** i
            else
                return 0

        return decimal

hex2dec = (digit) ->
    switch digit
        when 'a' then 10
        when 'b' then 11
        when 'c' then 12
        when 'd' then 13
        when 'e' then 14
        when 'f' then 15
        else digit

module.exports = Hexadecimal
