const COLORS = [
    "black", "brown", "red", "orange", "yellow",
    "green", "blue", "violet", "grey", "white"
];

export class ResistorColorTrio {
    constructor(bands) {
        let values = bands.map(b => {
            let value = COLORS.indexOf(b);

            if (value == -1)
                throw new "invalid color";
            else
                return value;
        });

        let total = (values[0] * 10 + values[1]) * 10 ** values[2];

        if (total % 1000 == 0)
            this.label = `Resistor value: ${total / 1000} kiloohms`;
        else
            this.label = `Resistor value: ${total} ohms`;
    }
}
