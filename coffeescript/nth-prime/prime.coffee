class Prime
    primes = []

    prime_gen = ->
        i = 2
        loop
            yield i if is_prime(i)
            i += 1

    p = prime_gen()

    is_prime = (n) ->
        divisors(n) == '1' + n

    divisors = (n) ->
        (i for i in [1..n] when n % i == 0).join('')

    @nth: (n) ->
        while n > primes.length
            primes.push(p.next)
            break if n == primes.length

        return primes[n-1]

module.exports = Prime
