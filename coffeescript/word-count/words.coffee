class WordCount
    constructor: (@text) ->

    count: ->
        counter = {}

        for word in @text.split(' ')
            word = this.normalize(word)

            if word.length
                if not counter[word]
                    counter[word] = 1
                else
                    counter[word] += 1

        return counter

    normalize: (string) ->
        (char.toLowerCase() for char in string when /[0-9\w]/.test(char)).join('')

module.exports = WordCount
