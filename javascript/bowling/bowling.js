export class Bowling {
    constructor() {
        this.buffer = [];
    }

    roll(n) {
        if (n < 0)
            throw "Negative roll is invalid";

        if (n > 10)
            throw "Pin count exceeds pins on the lane";

        if (this.buffer.length) {
            let frames = this.frames();
            let last_frame = frames[frames.length - 1];
            let [first, second] = last_frame;

            if (frames.length == 10) {
                // Error-checking for the tenth frame

            } else {
                // Error-checking for all other frames

                if (last_frame.length == 1) {
                    if (first < 10 && first + n > 10)
                        throw "Pin count exceeds pins on the lane";
                }
            }
        }

        this.buffer.push(n);
    }

    score() {
        let frames = this.frames();
        let total = 0;

        for (let i = 0; i < frames.length; ++i) {
            let frame = frames[i];

            // The tenth frame is the final frame and cannot score
            // spares or strikes, so we simply add its sum to the total
            // and stop
            if (i == 9) {
                total += frame.reduce((acc, val) => acc + val);
                return total;
            }

            let [a, b] = frame;

            total += a;

            if (b != undefined) {
                total += b;

                // If this frame is a spare, add the next throw to the
                // total as a bonus
                if (a + b == 10)
                    total += frames[i + 1][0];
            } else {
                // If this frame is a strike, add the next two throws to
                // the total as a bonus
                let [c, d] = frames[i + 1];

                total += c;

                if (d != undefined)
                    total += d;
                else
                    total += frames[i + 2][0];
            }
        }

        return total;
    }

    frames() {
        let out = [];

        let frame = [];
        let count = 0;

        for (let i = 0; i < this.buffer.length; ++i) {
            if (count == 9) {
                out.push(this.buffer.slice(i));
                break;
            }

            let pins = this.buffer[i];

            frame.push(pins);

            if (frame.reduce((sum, val) => sum + val) == 10 ||
                frame.length == 2 ||
                i == this.buffer.length - 1) {
                out.push(frame);

                frame = [];
                count += 1;
            }
        }

        return out;
    }
}
