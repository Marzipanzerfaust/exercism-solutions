module Bob
  def self.hey(statement)
    is_blank = blank?(statement)
    is_question = question?(statement)
    is_yell = yell?(statement)

    if is_blank
      "Fine. Be that way!"
    elsif is_question && is_yell
      "Calm down, I know what I'm doing!"
    elsif is_question
      "Sure."
    elsif is_yell
      "Whoa, chill out!"
    else
      "Whatever."
    end
  end

  def self.blank?(text)
    text !~ /[[:graph:]]/
  end

  def self.question?(text)
    text.rstrip.end_with?("?")
  end

  def self.yell?(text)
    text =~ /[[:upper:]]/ && text !~ /[[:lower:]]/
  end
end
