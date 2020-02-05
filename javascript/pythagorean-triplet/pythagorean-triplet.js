export class Triplet {
    constructor(a, b, c) {
        this.a = a;
        this.b = b;
        this.c = c;
    }

    sum() {
        return this.a + this.b + this.c;
    }

    product() {
        return this.a * this.b * this.c;
    }

    isPythagorean() {
        return this.a < this.b &&
            this.b < this.c &&
            this.a ** 2 + this.b ** 2 == this.c ** 2;
    }

    static where(criteria) {
        let minFactor = criteria.minFactor || 1;
        let maxFactor = criteria.maxFactor || 100;
        let sum = criteria.sum;

        let factors = Array.range(minFactor, maxFactor);

        let triplets = factors
            .combinations(3)
            .map(sides => new Triplet(...sides))
            .filter(t => t.isPythagorean());

        if (sum)
            triplets = triplets.filter(t => t.sum() == sum);

        return triplets;
    }
}

// Source:
// <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/from>
Array.range = function(start, stop, step = 1) {
    return Array.from(
        {length: (stop - start) / step + 1},
        (_, i) => start + i * step
    );
}

// Adapted from:
// <https://dev.to/rrampage/algorithms-generating-combinations-100daysofcode-4o0a>
Array.prototype.eachCombination = function*(k) {
    let idxs = new Array(k);

    for (let i = 0; i < k; ++i)
        idxs[i] = i;

    let i = k - 1;

    while (idxs[0] < this.length - k + 1) {
        while (i > 0 && idxs[i] == this.length - k + i)
            i -= 1;

        // The original algorithm would yield k-length subranges of the
        // range (0...this.length); if we treat that range as indices of
        // `this`, we can use them to map combinations of `this`:
        yield idxs.map(i => this[i]);

        idxs[i] += 1;

        while (i < k - 1) {
            idxs[i + 1] = idxs[i] + 1;
            i += 1;
        }
    }
}

Array.prototype.combinations = function(k) {
    return [...this.eachCombination(k)];
}
