class Raindrops
  def self.convert(x)
    raindrop = ''

    if is_divisible(x, 3)
      raindrop += 'Pling'
    end
    if is_divisible(x, 5)
      raindrop += 'Plang'
    end
    if is_divisible(x, 7)
      raindrop += 'Plong'
    end

    if raindrop == ''
      raindrop = x.to_s
    end

    return raindrop
  end

  private

  def self.is_divisible(a, b)
    return a % b == 0
  end
end
