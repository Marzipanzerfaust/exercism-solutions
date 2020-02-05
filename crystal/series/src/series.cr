module Series
  def self.slices(s : String, n : Int) : Array(String)
    raise ArgumentError.new if n > s.size

    s.each_char.cons(n, reuse: true).map(&.join).to_a
  end
end
