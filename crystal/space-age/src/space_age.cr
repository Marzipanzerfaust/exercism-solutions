module Space
  struct Age
    getter age_on_earth : Float64
    getter age_on_mercury : Float64
    getter age_on_venus : Float64
    getter age_on_mars : Float64
    getter age_on_jupiter : Float64
    getter age_on_saturn : Float64
    getter age_on_uranus : Float64
    getter age_on_neptune : Float64

    def initialize(years : Float64)
      @age_on_earth = years
      @age_on_mercury = years / 0.2408467
      @age_on_venus = years / 0.61519726
      @age_on_mars = years / 1.8808158
      @age_on_jupiter = years / 11.862615
      @age_on_saturn = years / 29.447498
      @age_on_uranus = years / 84.016846
      @age_on_neptune = years / 164.79132
    end

    def self.from_seconds(n : Int) : Age
      new(n / (60 * 60 * 24 * 365.25))
    end
  end
end
