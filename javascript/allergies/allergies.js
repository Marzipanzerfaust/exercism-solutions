const ALLERGENS = {
    eggs: 1,
    peanuts: 2,
    shellfish: 4,
    strawberries: 8,
    tomatoes: 16,
    chocolate: 32,
    pollen: 64,
    cats: 128
}

export class Allergies {
    constructor(n) {
        this.score = n;
    }

    list() {
        return Object.keys(ALLERGENS).filter(x => this.allergicTo(x));
    }

    allergicTo(allergen) {
        return (this.score & ALLERGENS[allergen]) != 0;
    }
}
