# NOTE: Forgoing the use of String#reverse

class ReverseString
  def self.reverse(str : String) : String
    String.build(str.size) do |out|
      str.size.times do |i|
        out << str[str.size - 1 - i]
      end
    end
  end
end
