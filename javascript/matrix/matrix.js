export class Matrix {
    constructor(str) {
        this.rows = [];
        this.columns = [];

        // Populate rows
        for (const row of str.split("\n"))
            this.rows.push( row.split(" ").map(n => parseInt(n)) );

        // Transpose rows into columns
        for (let i = 0; i < this.rows[0].length; ++i)
            this.columns.push( this.rows.map(row => row[i]) );
    }
}
