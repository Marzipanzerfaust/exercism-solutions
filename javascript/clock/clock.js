export class Clock {
    constructor(hours = 0, minutes = 0) {
        this.hours = hours;
        this.minutes = minutes;

        this.wrap();
    }

    toString() {
        let hh = this.hours.toString().padStart(2, '0');
        let mm = this.minutes.toString().padStart(2, '0');

        return `${hh}:${mm}`;
    }

    plus(n) {
        this.minutes += n;

        this.wrap();

        return this;
    }

    minus(n) {
        return this.plus(-n);
    }

    wrap() {
        let overflow = Math.floor(this.minutes / 60);

        this.hours += overflow;

        this.minutes %= 60;
        if (this.minutes < 0) this.minutes += 60;

        this.hours %= 24;
        if (this.hours < 0) this.hours += 24;
    }

    equals(other) {
        return this.hours == other.hours && this.minutes == other.minutes;
    }
}
