class Clock
    @at: (hours, minutes) ->
        new Clock(hours, minutes)

    constructor: (@hours = 0, @minutes = 0) ->

    toString: ->
        "#{@hours.toString().padStart(2, "0")}:#{@minutes.toString().padStart(2, "0")}"

    plus: (n) ->
        @minutes += n

        @wrap()

        return this

    minus: (n) ->
        @plus(-n)

    wrap: ->
        overflow = @minutes // 60

        @hours += overflow

        @minutes %= 60
        @minutes += 60 if @minutes < 0

        @hours %= 24
        @hours += 24 if @hours < 0

    equals: (other) ->
        @hours == other.hours and @minutes == other.minutes

module.exports = Clock
