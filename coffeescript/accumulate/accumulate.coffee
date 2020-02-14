Array.prototype.accumulate = (accumulator) ->
    (accumulator(item) for item in this)


module.exports = Array
