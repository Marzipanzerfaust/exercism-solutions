class Bob
  def self.hey(statement)
    statement.strip!
    letters = statement.split('').select { |char| char >= 'A' && char <= 'z' }

    if statement.length == 0 || !statement.match(/[\w\?]/)
      'Fine. Be that way!'
    elsif letters.length > 0 && letters.all? { |x| x == x.upcase }
      'Whoa, chill out!'
    elsif statement[-1] == '?'
      'Sure.'
    else
      'Whatever.'
    end
  end
end
