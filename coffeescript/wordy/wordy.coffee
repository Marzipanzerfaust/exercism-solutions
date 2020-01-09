# A barebones string scanner implementation; heavily inspired by
# Crystal's (https://crystal-lang.org/api/0.31.1/StringScanner.html)
class StringScanner
    constructor: (@string) ->
        @offset = 0
        @matches = []

    check: (pattern) ->
        tmp = @string.slice(@offset)

        return null unless tmp.search(pattern) == 0

        @matches = tmp.match(pattern)

        return @matches[0]

    scan: (pattern) ->
        tmp = @check(pattern)

        @offset += tmp.length if tmp

        return tmp

    peek: (len) ->
        @string.slice(@offset, @offset + len)


class WordProblem
    constructor: (@string) ->
        @ERROR = tooComplicated: new Error

    answer: ->
        s = new StringScanner(@string)

        s.scan(/What is (-?\d+)/)

        lhs = Number(s.matches[1])

        throw @ERROR.tooComplicated if not lhs?

        until s.peek(1) == "?"
            s.offset += 1  # Skip space

            s.scan(/(\D+) (-?\d+)/)
            op = s.matches[1]
            rhs = Number(s.matches[2])

            switch op
                when "plus"
                    lhs += rhs
                when "minus"
                    lhs -= rhs
                when "multiplied by"
                    lhs *= rhs
                when "divided by"
                    lhs /= rhs
                else
                    throw @ERROR.tooComplicated

        return lhs


module.exports = WordProblem
