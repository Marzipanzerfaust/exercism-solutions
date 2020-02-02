export const primeFactors = (n, factors = []) => {
    let r = range(2, n);

    let i, least_factor;

    while (i = r.next().value) {
        if (n % i == 0) {
            least_factor = i;
            break;
        }
    }

    if (least_factor) {
        factors.push(least_factor);
        return primeFactors(parseInt(n / least_factor), factors);
    } else {
        return factors;
    }
};

function* range(begin, end) {
    let i = begin;

    while (i <= end)
        yield i++;
}
