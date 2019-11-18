class Robot
  attr_reader :name

  @@names = ('AA000'..'ZZ999').to_a.shuffle.to_enum

  def self.forget
    @@names = ('AA000'..'ZZ999').to_a.shuffle.to_enum
  end

  def initialize
    self.reset
  end

  def reset
    @name = @@names.next
  end
end
