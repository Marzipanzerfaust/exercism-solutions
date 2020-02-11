export class BinarySearchTree {
    constructor(n) {
        this.data = n;
        this.right = null;
        this.left = null;
    }

    insert(n) {
        if (n <= this.data) {
            if (this.left)
                this.left.insert(n);
            else
                this.left = new BinarySearchTree(n);
        } else {
            if (this.right)
                this.right.insert(n);
            else
                this.right = new BinarySearchTree(n);
        }
    }

    each(func) {
        if (this.left)
            this.left.each(x => func(x));

        func(this.data);

        if (this.right)
            this.right.each(x => func(x));
    }
}
