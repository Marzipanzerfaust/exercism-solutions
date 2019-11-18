class ResistorColorTrio
  COLORS = %w[black brown red orange yellow green blue violet grey white]

  attr_reader :label

  def initialize(bands)
    raise ArgumentError unless bands.all? { |b| COLORS.index(b) }

    bands.map! { |b| COLORS.index(b) }

    @value = (bands[0] * 10 + bands[1]) * 10 ** bands[2]

    @label = if @value % 1000 == 0
               "Resistor value: #{@value / 1000} kiloohms"
             else
               "Resistor value: #{@value} ohms"
             end
  end
end
