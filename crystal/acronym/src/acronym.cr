module Acronym
  def self.abbreviate(str : String) : String
    str.split(/[\s-]/).map { |subs| subs[0].upcase }.join
  end
end
