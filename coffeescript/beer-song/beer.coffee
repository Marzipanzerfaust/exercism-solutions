class Beer
    @bottles: (n) ->
        switch n
            when 0 then "No more bottles"
            when 1 then "1 bottle"
            else "#{n} bottles"

    @verse: (n) ->
        switch n
            when 0
                """
                No more bottles of beer on the wall, no more bottles of beer.
                Go to the store and buy some more, 99 bottles of beer on the wall.
                """
            when 1
                """
                1 bottle of beer on the wall, 1 bottle of beer.
                Take it down and pass it around, no more bottles of beer on the wall.
                """
            else
                """
                #{@bottles(n)} of beer on the wall, #{@bottles(n)} of beer.
                Take one down and pass it around, #{@bottles(n - 1)} of beer on the wall.
                """

    @sing: (start, end = 0) ->
        [start..end]
            .reverse()
            .map((n) => @verse(n) + "\n")
            .reverse().join("\n")

module.exports = Beer
