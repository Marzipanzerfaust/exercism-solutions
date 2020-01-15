module Change
  def self.generate(register, customer)
    raise NegativeTargetError if customer < 0

    return [] if customer == 0

    1.upto(customer) do |i|
      valid_combo = register.repeated_combination(i).find do |combo|
        combo.sum == customer
      end

      return valid_combo if valid_combo
    end

    raise ImpossibleCombinationError
  end

  class ImpossibleCombinationError < StandardError; end
  class NegativeTargetError < StandardError; end
end
