module Bob
  def self.hey(str : String)
    sanitized = str.gsub(/[^\w\?]/, nil)

    if sanitized =~ /[A-Z]/ && sanitized !~ /[a-z]/
      "Whoa, chill out!"
    elsif sanitized.empty?
      "Fine. Be that way!"
    elsif sanitized.ends_with?('?')
      "Sure."
    else
      "Whatever."
    end
  end
end
