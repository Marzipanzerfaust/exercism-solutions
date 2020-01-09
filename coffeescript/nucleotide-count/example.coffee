class DNA
    constructor: (string) ->
        @nucleotideCounts = A: 0, C: 0, G: 0, T: 0
        @nucleotideCounts[char] += 1 for char in string

    count: (char) ->
        throw "Invalid Nucleotide" unless char of @nucleotideCounts

        return @nucleotideCounts[char]

module.exports = DNA
