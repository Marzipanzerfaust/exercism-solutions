class Proverb
  def initialize(*objects, qualifier: nil)
    @lines = []

    objects.each_cons(2).with_index do |(a, b), i|
      @lines << "For want of a #{a} the #{b} was lost."
    end

    @lines << "And all for the want of a #{qualifier ? "#{qualifier} " : ""}#{objects.first}."
  end

  def to_s
    @lines.join("\n")
  end
end
