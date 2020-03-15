const CONSONANT = /^(?:s?qu|[bcdfghjklmnpqrstvwz]+|[xy](?=[aeiou]))/

export class translator {
    static translate(str) {
        if (/\s/.test(str))
            return str.split(" ").map(word => this.translate(word)).join(" ");

        let m = str.match(CONSONANT);

        if (m) {
            let length = m[0].length;

            return str.slice(length) + str.slice(0, length) + "ay";
        } else {
            return str + "ay";
        }
    }
}
