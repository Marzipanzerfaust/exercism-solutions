class ResistorColorTrio
  COLORS = {
    "black" => 0,
    "brown" => 1,
    "red" => 2,
    "orange" => 3,
    "yellow" => 4,
    "green" => 5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white" => 9
  }

  attr_reader :label

  def initialize(bands)
    raise ArgumentError unless bands.all? { |b| COLORS.has_key?(b) }

    values = bands.map { |b| COLORS[b] }

    @value = (values[0] * 10 + values[1]) * 10 ** values[2]

    @label = if @value < 1000
               "Resistor value: #{@value} ohms"
             else
               "Resistor value: #{@value / 1000} kiloohms"
             end
  end
end
