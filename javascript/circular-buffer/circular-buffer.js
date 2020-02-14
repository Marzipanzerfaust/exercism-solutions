class CircularBuffer {
    constructor(size) {
        this.buffer = new Array(size);
        this.head = 0;
        this.tail = 0;
    }

    get size() {
        return this.tail - this.head;
    }

    read() {
        if (this.size == 0)
            throw new BufferEmptyError;

        return this.buffer[this.head++ % this.buffer.length];
    }

    write(x) {
        if (this.size == this.buffer.length)
            throw new BufferFullError;

        if (x) {
            this.buffer[this.tail % this.buffer.length] = x;
            this.tail += 1;
        }
    }

    forceWrite(x) {
        try {
            this.write(x);
        } catch(err) {
            if (err instanceof BufferFullError) {
                this.buffer[this.tail % this.buffer.length] = x;

                this.head += 1;
                this.tail += 1;
            } else {
                throw err;
            }
        }
    }

    clear() {
        this.head = this.tail = 0;
    }
}

export default CircularBuffer;

export class BufferFullError extends Error {}

export class BufferEmptyError extends Error {}
