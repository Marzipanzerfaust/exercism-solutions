# Brute force method with caching

class Prime
    primes = [2]

    @nth: (n) ->
        throw "Prime is not possible" if n <= 0

        return primes[n - 1] if n <= primes.length

        k = primes[primes.length - 1]

        loop
            k += 1

            unless primes.some((x) => k % x == 0)
                primes.push(k)
                break if primes.length == n

        return k

module.exports = Prime
