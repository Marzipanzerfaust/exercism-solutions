module SecretHandshake
  def self.commands(n)
    out = [] of String

    out << "wink"            if n & 0b1     != 0
    out << "double blink"    if n & 0b10    != 0
    out << "close your eyes" if n & 0b100   != 0
    out << "jump"            if n & 0b1000  != 0
    out.reverse!             if n & 0b10000 != 0

    out
  end
end
