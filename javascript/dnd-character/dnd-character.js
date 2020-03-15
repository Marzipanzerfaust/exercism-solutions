export const abilityModifier = (n) => {
    if (n < 3)
        throw "Ability scores must be at least 3";

    if (n > 18)
        throw "Ability scores can be at most 18";

    return Math.floor((n - 10) / 2);
};

export class Character {
    static rollAbility() {
        return getRandomIntInclusive(3, 18);
    }

    constructor() {
        this.strength = Character.rollAbility();
        this.dexterity = Character.rollAbility();
        this.constitution = Character.rollAbility();
        this.intelligence = Character.rollAbility();
        this.wisdom = Character.rollAbility();
        this.charisma = Character.rollAbility();

        this.hitpoints = 10 + abilityModifier(this.constitution);
    }
}

// Source:
// <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random#Getting_a_random_integer_between_two_values_inclusive>
function getRandomIntInclusive(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);

    return Math.floor(Math.random() * (max - min + 1)) + min;
}
