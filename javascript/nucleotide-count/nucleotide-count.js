export class NucleotideCounts {
    static parse(strand) {
        let a = 0;
        let c = 0;
        let g = 0;
        let t = 0;

        for (const char of strand) {
            if (char == 'A')
                a += 1;
            else if (char == 'C')
                c += 1;
            else if (char == 'G')
                g += 1;
            else if (char == 'T')
                t += 1;
            else
                throw "Invalid nucleotide in strand";
        }

        return `${a} ${c} ${g} ${t}`;
    }
}
