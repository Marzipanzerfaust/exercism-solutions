export class ResistorColor {
    static COLORS = [
        "black", "brown", "red", "orange", "yellow",
        "green", "blue", "violet", "grey", "white"
    ];

    private colors: string[];

    constructor(colors: string[]) {
        if (colors.length < 2)
            throw "At least two colors need to be present";

        this.colors = colors;
    }

    value(): number {
        let copy = this.colors.slice(0, 2);
        copy.reverse();

        return copy.reduce(
            (acc, val, i) => acc + ResistorColor.COLORS.indexOf(val) * 10 ** i,
            0
        );
    }
}
