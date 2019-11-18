class Cipher
  attr_reader :key

  def initialize(key: "a")
    raise ArgumentError unless key =~ /\A[a-z]+\z/

    @key = key

    @hash =
  end

  def encode(str)

  end

end
