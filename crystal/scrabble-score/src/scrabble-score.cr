class ScrabbleScore
  def self.score(str : String) : Int32
    str.gsub(/\W/, "").upcase.chars.sum do |letter|
      case letter.to_s
      when /[AEIOULNRST]/ then 1
      when /[DG]/ then 2
      when /[BCMP]/ then 3
      when /[FHVWY]/ then 4
      when /K/ then 5
      when /[JX]/ then 8
      when /[QZ]/ then 10
      else 0
      end
    end
  end
end
