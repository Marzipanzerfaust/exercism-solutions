module ResistorColorDuo
  COLORS = %w(black brown red orange yellow green blue violet grey white)

  def self.value(bands : Array(String)) : Int
    color_value(bands[0]) * 10 + color_value(bands[1])
  end

  private def self.color_value(band : String) : Int
    COLORS.index(band).as(Int)
  end
end
