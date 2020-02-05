Array::eachRepeatedCombination = (k) ->
    throw "Size must be positive" if k < 0

    switch (k)
        when 0
            yield []
        when 1
            yield [x] for x in this
        else
            for i in [0...@length]
                for c from @slice(i).eachRepeatedCombination(k - 1)
                    yield [this[i], c...]


class Palindromes
    @isPalindrome: (n) ->
        chars = [n.toString()...]
        reverse = chars.slice().reverse()

        return chars.join("") == reverse.join("")

    constructor: (kwargs) ->
        @minFactor = kwargs.minFactor ? 1
        @maxFactor = kwargs.maxFactor ? 9

        # This will be used to map each value to an array containing
        # each possible pair of factors in the range
        # [@minFactor..@maxFactor]
        @valuesToFactors = new Map

    generate: ->
        for [i, j] from [@minFactor..@maxFactor].eachRepeatedCombination(2)
            value = i * j

            if Palindromes.isPalindrome(value)
                factors = [i, j].sort()

                if @valuesToFactors.has(value)
                    @valuesToFactors.get(value).add(factors)
                else
                    @valuesToFactors.set(value, new Set([factors]))

    get: (n) ->
        factors = @valuesToFactors.get(n)
        return {value: n, factors: [factors...]}

    getWithFunc: (func) ->
        value = func.call(null, @valuesToFactors.keys()...)
        return @get(value)

    largest: ->
        @getWithFunc(Math.max)

    smallest: ->
        @getWithFunc(Math.min)


module.exports = Palindromes
