class Prime
    primes = []

    nth: (n) ->
        throw "Prime is not possible" if n <= 0

        return primes[n - 1] if n <= primes.size



module.exports = Prime
