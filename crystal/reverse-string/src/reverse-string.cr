# NOTE: Forgoing the use of String#reverse

module ReverseString
  def self.reverse(str)
    String.build(str.size) do |o|
      (str.size - 1).downto(0) do |i|
        o << str[i]
      end
    end
  end
end
