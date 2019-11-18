class Scale
  attr_reader :name, :pitches

  def initialize(key, type)
    @name = "#{key.upcase} #{type}"

    @pitches = [key.upcase, ]
  end
end
