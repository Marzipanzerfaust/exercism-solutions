export class List {
    constructor(array) {
        this.length = 0;
        this.head = null;

        if (array)
            array.forEach(x => this.add(new Element(x)));
    }

    add(elem) {
        if (this.head)
            elem.next = this.head;

        this.head = elem;
        this.length += 1;
    }

    forEach(func) {
        let curr = this.head;
        let i = 0;

        do func(curr.value, i++)
        while (curr = curr.next);
    }

    toArray() {
        let output = new Array(this.length);
        this.forEach((x, i) => output[i] = x);

        return output;
    }

    reverse() {
        return new List(this.toArray());
    }
}

export class Element {
    constructor(n) {
        this.value = n;
        this.next = null;
    }
}
