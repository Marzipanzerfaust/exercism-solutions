# Please implement your solution to atbash-cipher in this file
class Atbash
  ALPHABET = "abcdefghijklmnopqrstuvwxyz"
  REVERSE = ALPHABET.reverse

  def self.encode(str : String)
    str
      .downcase
      .gsub(/\W/, nil)
      .chars
      .map { |char| char.ascii_letter? ? REVERSE[ALPHABET.index(char).as(Int)] : char }
      .each_slice(5)
      .each_with_object([] of String) { |slice, strings| strings << slice.join }
      .join(' ')
  end
end
