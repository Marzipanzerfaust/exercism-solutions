module RotationalCipher
  def self.rotate(str, n)
    str.each_char
      .map { |c| shift(c, n) }
      .join
  end

  def self.shift(char, n)
    case char
    when /[a-z]/
      ((char.ord % 97 + n) % 26 + 97).chr
    when /[A-Z]/
      ((char.ord % 65 + n) % 26 + 65).chr
    else
      char
    end
  end
end
