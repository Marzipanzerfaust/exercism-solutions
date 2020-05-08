module RotationalCipher
  ALPHABET = ("a".."z").to_a
  ALPHABET_UPPER = ALPHABET.map(&:upcase)

  def self.rotate(str, n)
    str.each_char
      .map { |c| encode(c, n) }
      .join
  end

  def self.encode(char, n)
    case char
    when /[a-z]/
      ALPHABET[
        (ALPHABET.index(char) + n) % ALPHABET.size
      ]
    when /[A-Z]/
      ALPHABET_UPPER[
        (ALPHABET_UPPER.index(char) + n) % ALPHABET.size
      ]
    else
      char
    end
  end
end
