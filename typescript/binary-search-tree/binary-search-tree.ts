// NOTE: I had to turn off `strictNullChecks` to run the tests

export default class BinarySearchTree {
    left?: BinarySearchTree;
    right?: BinarySearchTree;

    constructor(public data: number) {}

    insert(n: number) {
        if (n <= this.data) {
            if (this.left)
                this.left.insert(n)
            else
                this.left = new BinarySearchTree(n);
        } else {
            if (this.right)
                this.right.insert(n)
            else
                this.right = new BinarySearchTree(n);
        }
    }

    each(func: (n: number) => any) {
        if (this.left)
            this.left.each(x => func(x));

        func(this.data);

        if (this.right)
            this.right.each(x => func(x));
    }
}
