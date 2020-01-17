module Bob
  def self.hey(statement)
    if nothing?(statement)
      "Fine. Be that way!"
    elsif question?(statement) && yell?(statement)
      "Calm down, I know what I'm doing!"
    elsif question?(statement)
      "Sure."
    elsif yell?(statement)
      "Whoa, chill out!"
    else
      "Whatever."
    end
  end

  def self.nothing?(text)
    text !~ /[[:graph:]]/
  end

  def self.question?(text)
    text.rstrip.end_with?("?")
  end

  def self.yell?(text)
    text =~ /[A-Z]/ && text !~ /[a-z]/
  end
end
