class Bst
    constructor: (@data) ->
        @left = @right = null

    insert: (value) ->
        if value <= @data
            if @left
                @left.insert(value)
            else
                @left = new Bst(value)
        else if value > @data
            if @right
                @right.insert(value)
            else
                @right = new Bst(value)

    each: (func) ->
        @left.each(func) if @left
        func(@data)
        @right.each(func) if @right

module.exports = Bst
