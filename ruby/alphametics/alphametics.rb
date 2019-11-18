class Alphametics
  # Brute force
  def self.solve(puzzle)
    letters = puzzle.scan(/[A-Z]/).uniq
    *operands, sum = puzzle.scan(/[A-Z]+/)

    # We need to build a hash that maps each letter to an array of
    # possible values

    key = letters.each_with_object({}) do |i, hash|
      digits = []

      # Add 0 to the list of allowed digits if this letter does not
      # represent the first digit of any term
      digits << 0 if terms.none? { |term| term.first == i }
    end

    # (0..9).to_a.combination(letters.size).each do |combo|
    #   combo.permutation.each do |perm|
    #     solution = letters.zip(perm).to_h

    #     begin
    #       return solution if eval(puzzle.gsub(/[A-Z]/, solution))
    #     rescue SyntaxError
    #       next
    #     end
    #   end
    # end

    return {}
  end
end
