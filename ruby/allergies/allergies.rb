class Allergies
  ALLERGENS = {
    "eggs" => 1,
    "peanuts" => 2,
    "shellfish" => 4,
    "strawberries" => 8,
    "tomatoes" => 16,
    "chocolate" => 32,
    "pollen" => 64,
    "cats" => 128
  }

  def initialize(n)
    @score = n
  end

  def allergic_to?(food)
    @score & ALLERGENS[food] != 0
  end

  def list
    ALLERGENS.keys.select { |food| allergic_to?(food) }
  end
end
