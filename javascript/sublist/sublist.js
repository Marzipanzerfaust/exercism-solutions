export class List {
    constructor(iter) {
        if (iter === undefined || iter === null)
            this.values = [];
        else
            this.values = Array.from(iter);
    }

    compare(other) {
        const a = this.values;
        const b = other.values;

        if (a.length > b.length) {
            for (const con of a.eachConsecutive(b.length))
                if (con.deepEquals(b))
                    return "SUPERLIST";
        } else if (a.length < b.length) {
            for (const con of b.eachConsecutive(a.length))
                if (con.deepEquals(a))
                    return "SUBLIST";
        } else {
            if (a.deepEquals(b))
                return "EQUAL";
        }

        return "UNEQUAL";
    }
}

Array.prototype.eachConsecutive = function*(n) {
    const upper = this.length - n + 1;

    for (let i = 0; i < upper; ++i)
        yield this.slice(i, i + n);
}

Array.prototype.deepEquals = function(other) {
    if (this.length !== other.length) {
        return false;
    }

    for (let i = 0; i < this.length; ++i) {
        let a = this[i];
        let b = other[i];

        if (Array.isArray(a) && Array.isArray(b)) {
            if (!a.deepEquals(b))
                return false;
        } else {
            if (a !== b)
                return false;
        }
    }

    return true;
}
