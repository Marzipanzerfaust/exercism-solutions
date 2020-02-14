export class CustomSet {
    constructor(array) {
        if (array)
            this.buffer = [...array];
        else
            this.buffer = [];
    }

    get size() {
        return this.buffer.length;
    }

    empty() {
        return this.size == 0;
    }

    contains(n) {
        return this.buffer.includes(n);
    }

    add(n) {
        if (!this.contains(n))
            this.buffer.push(n);

        return this;
    }

    subset(other) {
        return this.buffer.every(x => other.contains(x));
    }

    disjoint(other) {
        return this.buffer.every(x => !other.contains(x));
    }

    eql(other) {
        return this.subset(other) && this.size == other.size;
    }

    union(other) {
        let output = new CustomSet(this.buffer);

        other.buffer.forEach(y => output.add(y));

        return output;
    }

    intersection(other) {
        let output = new CustomSet;

        for (const x of this.buffer)
            if (other.contains(x))
                output.add(x);

        return output;
    }

    difference(other) {
        let output = new CustomSet;

        for (const x of this.buffer)
            if (!other.contains(x))
                output.add(x);

        return output;
    }
}
