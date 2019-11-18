class Anagram
    constructor: (string) ->
        @string = string.toLowerCase()

    match: (array) ->
        (string for string in (str.toLowerCase() for str in array) when this.isAnagram(string))

    isAnagram: (string) ->
        Array.from(string).sort().join('') == Array.from(@string).sort().join('') unless string == @string

module.exports = Anagram
