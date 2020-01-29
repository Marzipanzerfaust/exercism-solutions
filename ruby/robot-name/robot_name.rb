class Robot
  attr_reader :name

  @@names = ('AA000'..'ZZ999').to_a
  @@enum = @@names.to_enum

  def self.forget
    @@names.shuffle!
    @@enum.rewind
  end

  def initialize
    self.reset
  end

  def reset
    @name = @@enum.next
  end
end
