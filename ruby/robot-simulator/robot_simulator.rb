class Robot
  DIRECTIONS = %i[north east south west]

  attr_reader :bearing
  attr_accessor :x, :y

  def orient(direction)
    raise ArgumentError unless DIRECTIONS.include?(direction)

    @bearing = direction
  end

  def turn_right
    idx = (DIRECTIONS.index(@bearing) + 1) % DIRECTIONS.size
    @bearing = DIRECTIONS[idx]
  end

  def turn_left
    idx = DIRECTIONS.index(@bearing) - 1
    @bearing = DIRECTIONS[idx]
  end

  def at(x, y)
    @x, @y = x, y
  end

  def coordinates
    [@x, @y]
  end

  def advance
    case @bearing
    when :north
      @y += 1
    when :east
      @x += 1
    when :south
      @y -= 1
    when :west
      @x -= 1
    end
  end
end

class Simulator
  def instructions(str)
    str.each_char.map do |char|
      case char
      when "A" then :advance
      when "R" then :turn_right
      when "L" then :turn_left
      end
    end
  end

  def place(robot, x: 0, y: 0, direction: :north)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, input)
    instructions(input).each { |comm| robot.send(comm) }
  end
end
