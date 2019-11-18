# Please implement your solution to pangram in this file
struct Pangram
  def self.pangram?(str : String) : Bool
    str
      .downcase
      .gsub(/[^a-z]/, nil)
      .chars
      .sort
      .to_set
      .join
      .==("abcdefghijklmnopqrstuvwxyz")
  end
end
