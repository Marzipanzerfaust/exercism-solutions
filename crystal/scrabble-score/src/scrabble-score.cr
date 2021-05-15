module ScrabbleScore
  def self.score(str)
    str.each_char.sum do |letter|
      case letter.upcase
      when 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'
        1
      when 'D', 'G'
        2
      when 'B', 'C', 'M', 'P'
        3
      when 'F', 'H', 'V', 'W', 'Y'
        4
      when 'K'
        5
      when 'J', 'X'
        8
      when 'Q', 'Z'
        10
      else
        0
      end
    end
  end
end
