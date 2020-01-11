class Cipher
  ALPHABET = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

  # Shifts a letter in the alphabet `n` times; negative values of `n`
  # will shift backwards
  def self.shift(char, n)
    ALPHABET[(ALPHABET.index(char) + n) % ALPHABET.size]
  end

  def initialize(key = nil)
    if key
      # The key can only consist of lowercase letters
      raise ArgumentError if key =~ /[^a-z]/

      # The key cannot be empty
      raise ArgumentError if key.empty?

      @key = key
    else
      # Generate a random string of eighteen lowercase letters to use as
      # our key
      @key = 18.times.map { ALPHABET.sample }.join
    end
  end

  attr_accessor :key

  # Shifts each character in `str` `k` times; negative values of k will
  # shift backwards
  def shift(str, k)
    # If the given string is longer than the key, we will need to cycle
    # the key
    @key *= 2

    return str
      .each_char
      .with_index
      .map { |c, i| Cipher.shift(c, k * ALPHABET.index(@key[i])) }
      .join
  end

  def encode(str)
    shift(str, 1)
  end

  def decode(str)
    shift(str, -1)
  end
end
