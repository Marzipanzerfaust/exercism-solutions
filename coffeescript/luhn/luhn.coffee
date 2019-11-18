class Luhn
    constructor: (value) ->
        string = String(value)

        @checkDigit = Number(string[string.length-1])

        @addends = []
        for digit, i in Array.from(string).reverse()
            if not Boolean(i % 2)
                @addends.unshift(Number(digit))
            else
                double = digit * 2

                if double > 9
                    @addends.unshift(double - 9)
                else
                    @addends.unshift(double)

        @checksum = @addends.reduce((a, b) -> a + b)

        @valid = not Boolean(@checksum % 10)

    @create: (value) ->
        curr_luhn = new Luhn(value)
        if curr_luhn.valid
            return value
        else
            string = String(value)
            sum = 0
            for digit, i in Array.from(string).reverse()
                if not Boolean(i % 2)
                    double = digit * 2
                    if double > 9
                        sum += double - 9
                    else
                        sum += double
                else
                    sum += Number(digit)

            return Number(String(value) + String(if sum != 10 then (10 - sum % 10) else 0))

module.exports = Luhn
