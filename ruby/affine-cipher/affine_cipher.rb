class Affine
  ALPHABET = ("a".."z").to_a

  def initialize(a, b)
    # `a` and `m` (the size of the alphabet) must be coprime
    raise ArgumentError unless Affine.gcd(a, ALPHABET.size) == 1

    @a, @b = a, b
  end

  def encode(text)
    text.downcase
      .gsub(/\W/, "")
      .chars
      .each_slice(5)
      .map { |slice| slice.map { |c| encode_char(c) } }
      .map(&:join)
      .join(" ")
  end

  def decode(text)
    text.downcase
      .gsub(/\W/, "")
      .chars
      .map { |c| decode_char(c) }
      .join
  end

  def encode_char(c)
    idx = ALPHABET.index(c)

    if idx
      ALPHABET[(idx * @a + @b) % ALPHABET.size]
    else
      c
    end
  end

  def decode_char(c)
    idx = ALPHABET.index(c)

    if idx
      ALPHABET[Affine.mmi(@a) * (idx - @b) % ALPHABET.size]
    else
      c
    end
  end

  # Modular Multiplicative Inverse
  def self.mmi(n)
    x, y = extended_gcd(n, ALPHABET.size)
    return x
  end

  # Extended Euclidean Algorithm
  #
  # Returns `x` and `y` such that `nx + my = gcd(n, m)`.
  #
  # Source: <https://brilliant.org/wiki/extended-euclidean-algorithm/>
  def self.extended_gcd(n, m)
    s, old_s = 0, 1
    t, old_t = 1, 0
    r, old_r = m, n

    until r == 0
      quotient = old_r / r

      old_r, r = r, old_r - quotient * r
      old_s, s = s, old_s - quotient * s
      old_t, t = t, old_t - quotient * t
    end

    return old_s, old_t
  end

  # Euclid's Algorithm
  def self.gcd(n, m)
    if m == 0
      n
    else
      gcd(m, n % m)
    end
  end
end
