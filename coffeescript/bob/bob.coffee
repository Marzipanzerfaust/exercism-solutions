class Bob
    hey: (statement) ->
        letters = (char for char in statement when 'A' <= char <= 'z')

        if not statement.length or statement.search(/^\s+$/) >= 0
            'Fine. Be that way!'
        else if letters.length and Array.from(letters).every((x) -> x == x.toUpperCase())
            'Whoa, chill out!'
        else if statement[statement.length-1] == '?'
            'Sure.'
        else
            'Whatever.'

module.exports = Bob
