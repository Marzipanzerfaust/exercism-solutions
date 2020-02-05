export class Palindromes {
    static generate(kwargs) {
        return new Palindromes(kwargs);
    }

    static isPalindrome(n) {
        let chars = [...n.toString()];
        let reverse = chars.slice().reverse();

        return chars.join("") == reverse.join("");
    }

    constructor(kwargs) {
        this.valuesToFactors = new Map;

        let minFactor = kwargs.minFactor || 1;
        let maxFactor = kwargs.maxFactor || 9;

        if (minFactor > maxFactor)
            throw "min must be <= max";

        let range = Array.range(minFactor, maxFactor);

        for (const [i, j] of range.eachRepeatedCombination(2)) {
            let value = i * j;

            if (Palindromes.isPalindrome(value)) {
                let factors = [i, j].sort();

                if (this.valuesToFactors.has(value))
                    this.valuesToFactors.get(value).add(factors);
                else
                    this.valuesToFactors.set(value, new Set([factors]));
            }
        }
    }

    get(n) {
        if (this.valuesToFactors.has(n))
            return {
                value: n,
                factors: [...this.valuesToFactors.get(n)]
            };
        else
            return {value: null, factors: []};
    }

    getWithFunc(func) {
        let value = func.call(null, ...this.valuesToFactors.keys());
        return this.get(value);
    }

    get largest() {
        return this.getWithFunc(Math.max);
    }

    get smallest() {
        return this.getWithFunc(Math.min);
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

Array.prototype.eachRepeatedCombination = function*(k) {
    if (k < 0)
        throw "Size must be positive";

    if (k == 0) {
        yield [];
    } else if (k == 1) {
        for (const x of this)
            yield [x];
    } else {
        for (let i = 0; i < this.length; ++i)
            for (const c of this.slice(i).eachRepeatedCombination(k - 1))
                yield [this[i], ...c];
    }
}
