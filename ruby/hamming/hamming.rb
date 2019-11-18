class Hamming
  def self.compute(a, b)
    if a.length != b.length
      raise ArgumentError
    end

    distance = 0
    for i in 0 .. a.length - 1
      if a[i] != b[i]
        distance += 1
      end
    end
    return distance
  end
end

class BookKeeping
  VERSION
end
