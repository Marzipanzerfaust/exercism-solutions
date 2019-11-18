# Please implement your solution to bob in this file
class Bob
  def self.hey(str : String)
    sanitized = str.gsub(/[^\w\?]/, nil)

    if sanitized == sanitized.upcase && sanitized =~ /[A-Z]/
      "Whoa, chill out!"
    elsif sanitized.empty?
      "Fine. Be that way!"
    elsif sanitized[-1] == '?'
      "Sure."
    else
      "Whatever."
    end
  end
end
