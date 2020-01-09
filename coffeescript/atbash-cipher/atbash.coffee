# Yields each consecutive `n`-length slice in the string
String::eachSlice = (n) ->
    count = Math.ceil(@length / n)

    for i in [0...count]
        yield @slice(i * n, (i + 1) * n)


class Atbash
    ALPHABET = "abcdefghijklmnopqrstuvwxyz"
    REVERSE = Array.from(ALPHABET).reverse().join("")

    @encodeChar: (char) ->
        REVERSE[ALPHABET.indexOf(char)] ? char

    @encode: (str) ->
        str = str.toLowerCase().replace(/\W/g, "")

        slices = []

        for s from str.eachSlice(5)
            translated = Array.from(s).map(@encodeChar).join("")
            slices.push(translated)

        return slices.join(" ")


module.exports = Atbash
