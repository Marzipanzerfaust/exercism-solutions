export class GradeSchool {
    constructor() {
        this._roster = {};
    }

    roster() {
        let copy = {};

        for (const grade in this._roster)
            copy[grade] = [...this._roster[grade]];

        return copy;
    }

    add(name, grade) {
        if (this._roster[grade]) {
            this._roster[grade].push(name);
            this._roster[grade].sort();
        } else {
            this._roster[grade] = [name];
        }
    }

    grade(n) {
        let copy = this.roster();

        if (copy[n])
            return copy[n];
        else
            return [];
    }
}
