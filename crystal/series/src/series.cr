module Series
  def self.slices(s : String, n : Int) : Array(String)
    raise ArgumentError.new if n > s.size

    s.chars.each_cons(n).map(&.join).to_a
  end
end
