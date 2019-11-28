class Luhn
  def self.valid?(str : String) : Bool
    str = str.gsub(/\s/, "")

    return false if str.size == 1
    return false unless str =~ /\A\d+\z/

    total = str.reverse.each_char.with_index.sum do |c, i|
      int = c.to_i

      int *= 2 if i.odd?
      int -= 9 if int > 9

      int
    end

    return total.divisible_by? 10
  end
end
