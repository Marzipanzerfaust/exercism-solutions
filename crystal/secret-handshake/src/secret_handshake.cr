module SecretHandshake
  def self.commands(n : Int) : Array(String)
    out = [] of String

    out << "wink"            if n.bit(0) == 1
    out << "double blink"    if n.bit(1) == 1
    out << "close your eyes" if n.bit(2) == 1
    out << "jump"            if n.bit(3) == 1
    out.reverse!             if n.bit(4) == 1

    out
  end
end
