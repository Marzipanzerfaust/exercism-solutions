# Combinations with replacement. Given an input array and an integer
# `k`, return a new array of each `k`-tuple that represents a possible
# combination in the input array.
#
# No guarantees that this is actually efficient; it's just the simplest
# recursive algorithm I could come up with.
Array::repeatedCombinations = (k) ->
    switch k
        when 0
            []
        when 1
            @map((x) => [x])
        else
            ([x, xs...] for x in this for xs in @repeatedCombinations(k - 1)).flat()


Array::isEqual = (other) ->
    if @length != other.length
        false
    else
        [0...@length].every((i) => this[i] == other[i])


class Palindromes
    @isPalindrome: (n) ->
        chars = Array.from(n.toString())
        reverse = chars.slice().reverse()

        return chars.join("") == reverse.join("")

    constructor: (kwargs) ->
        @minFactor = kwargs?.minFactor ? 1
        @maxFactor = kwargs?.maxFactor ? 9

        # This will be used to map each value to an array containing
        # each possible pair of factors in the range
        # [@minFactor..@maxFactor]
        @valuesToFactors = new Map

    generate: ->
        for [i, j] in [@minFactor..@maxFactor].repeatedCombinations(2)
            value = i * j
            factors = [i, j].sort()

            if Palindromes.isPalindrome(value)
                if @valuesToFactors.has(value)
                    list = @valuesToFactors.get(value)

                    if not list.some((k) => k.isEqual(factors))
                        list.push(factors)
                else
                    @valuesToFactors.set(value, [factors])

    get: (n) ->
        factors = @valuesToFactors.get(n)
        return {value: n, factors}

    getWithFunc: (func) ->
        value = func.call(null, @valuesToFactors.keys()...)
        return @get(value)

    largest: ->
        @getWithFunc(Math.max)

    smallest: ->
        @getWithFunc(Math.min)


module.exports = Palindromes
