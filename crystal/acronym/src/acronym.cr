# Please implement your solution to acronym in this file
struct Acronym
  def self.abbreviate(str : String)
    str.split(/[\s-]/).map { |subs| subs[0].upcase }.join
  end
end
