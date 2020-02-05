export class HighScores {
    constructor(arr) {
        this.scores = arr.slice();
    }

    get latest() {
        return this.scores[this.scores.length - 1];
    }

    get personalBest() {
        return Math.max(...this.scores);
    }

    get personalTopThree() {
        let sorted = this.scores.slice().sort((a, b) => b - a);
        return sorted.slice(0, 3);
    }
}
