module Acronym
  def self.abbreviate(str)
    String.build do |o|
      str.scan(/[[:alpha:]']+/) { o << $0[0].upcase }
    end
  end
end
