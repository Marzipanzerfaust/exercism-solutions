module Bob
  def self.hey(str)
    sanitized = str.gsub(/[^\w?]/, nil)

    if sanitized.matches?(/[A-Z]/) && !sanitized.matches?(/[a-z]/)
      if sanitized.ends_with? '?'
        "Calm down, I know what I'm doing!"
      else
        "Whoa, chill out!"
      end
    elsif sanitized.empty?
      "Fine. Be that way!"
    elsif sanitized.ends_with? '?'
      "Sure."
    else
      "Whatever."
    end
  end
end
