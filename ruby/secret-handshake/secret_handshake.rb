class SecretHandshake
  attr_reader :commands

  def initialize(n)
    @commands = []

    begin
      @commands << 'wink' if n & 0b1 > 0
      @commands << 'double blink' if n & 0b10 > 0
      @commands << 'close your eyes' if n & 0b100 > 0
      @commands << 'jump' if n & 0b1000 > 0
      @commands.reverse! if n & 0b10000 > 0
    rescue NoMethodError
    end
  end
end
