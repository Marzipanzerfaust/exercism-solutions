class Triangle
    constructor: (x, y, z) ->
        if [x, y, z].some((x) -> x < 0)
            throw 'negative sides are illegal'
        else if (x + y <= z) or (x + z <= y) or (y + z <= x)
            throw 'violation of triangle inequality'
        else
            [@x, @y, @z] = [x, y, z]

    kind: ->
        if @x == @y == @z
            return 'equilateral'
        else if @x == @y or @y == @z or @x == @z
            return 'isosceles'
        else
            return 'scalene'

module.exports = Triangle
