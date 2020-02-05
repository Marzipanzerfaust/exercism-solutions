class Anagram
    constructor: (@string) ->

    match: (array) ->
        (s.toLowerCase() for s in array when s.isAnagramOf(@string))


String::isAnagramOf = (other) ->
    thisLower = this.toLowerCase()
    otherLower = other.toLowerCase()

    if thisLower == otherLower
        false
    else
        [thisLower...].sort().join("") == [otherLower...].sort().join("")


module.exports = Anagram
