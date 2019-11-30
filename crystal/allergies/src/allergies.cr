module Allergies
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

  def self.allergic_to(allergen : String, score : Int) : Bool
    score & ALLERGENS[allergen] != 0
  end

  def self.list(score : Int) ; Array(String)
    ALLERGENS.keys.select { |a| allergic_to(a, score) }
  end
end
