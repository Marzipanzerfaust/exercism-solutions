export class List {
    constructor(array) {
        this.values = [];

        if (array)
            for (const x of array)
                this.values.push(x);
    }

    append(other) {
        let copy = new List(this.values);

        if (other)
            for (const x of other.values)
                copy.values.push(x);

        return copy;
    }

    concat(lists) {
        let copy = new List(this.values);

        if (lists)
            for (const l of lists.values)
                for (const x of l.values)
                    copy.values.push(x);

        return copy;
    }

    filter(func) {
        let output = new List;

        for (const x of this.values)
            if (func(x))
                output.values.push(x);

        return output;
    }

    map(func) {
        let output = new List;

        for (const x of this.values)
            output.values.push(func(x));

        return output;
    }

    length() {
        let l = 0;

        for (const x of this.values)
            l += 1;

        return l
    }

    foldl(func, initial) {
        let acc = initial;

        for (const x of this.values)
            acc = func(acc, x);

        return acc;
    }

    foldr(func, initial) {
        return this.reverse().foldl(func, initial);
    }

    reverse() {
        let copy = new List;

        for (const x of this.values)
            copy.values.unshift(x);

        return copy;
    }
}
