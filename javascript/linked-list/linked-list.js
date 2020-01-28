class ListNode {
    constructor(n) {
        this.value = n;
        this.next = this.prev = null;
    }

    join(other) {
        this.next = other;
        other.prev = this;
    }
}

export class LinkedList {
    constructor() {
        this.head = this.tail = null;
        this.size = 0;
    }

    push(n) {
        if (this.size) {
            this.tail.join(new ListNode(n));
            this.tail = this.tail.next;
        } else {
            this.head = this.tail = new ListNode(n);
        }

        this.size += 1;
    }

    pop() {
        if (this.size == 0) return;

        let output = this.tail.value;

        this.tail = this.tail.prev;

        if (this.tail)
            this.tail.next = null;

        this.size -= 1;

        return output;
    }

    shift() {
        if (this.size == 0) return;

        let output = this.head.value;

        this.head = this.head.next;

        if (this.head)
            this.head.prev = null;

        this.size -= 1;

        return output;
    }

    unshift(n) {
        if (this.size) {
            new ListNode(n).join(this.head);
            this.head = this.head.prev;
        } else {
            this.head = this.tail = new ListNode(n);
        }

        this.size += 1;
    }

    // Searches for the first node with the given value -- starting from
    // the head -- and returns it
    find(n) {
        let curr = this.head;

        while (curr && curr.value != n)
            curr = curr.next;

        return curr;
    }

    delete(n) {
        if (this.size == 0) return;

        let node = this.find(n);

        if (!node) return;

        if (node.prev)
            node.prev.next = node.next;

        if (node.next)
            node.next.prev = node.prev;

        if (node == this.head)
            this.head = node.next;

        if (node == this.tail)
            this.tail = node.prev;

        this.size -= 1;
    }

    count() {
        return this.size;
    }
}
