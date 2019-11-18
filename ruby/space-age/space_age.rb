class SpaceAge
  attr_reader :on_earth, :on_mercury, :on_venus, :on_mars, :on_jupiter, :on_saturn, :on_uranus, :on_neptune

  def initialize(seconds)
    @on_earth = seconds.fdiv 31557600

    @on_mercury = @on_earth.fdiv 0.2408467
    @on_venus = @on_earth.fdiv 0.61519726
    @on_mars = @on_earth.fdiv 1.8808158
    @on_jupiter = @on_earth.fdiv 11.862615
    @on_saturn = @on_earth.fdiv 29.447498
    @on_uranus = @on_earth.fdiv 84.016846
    @on_neptune = @on_earth.fdiv 164.79132
  end
end
