class ResistorColorDuo
  COLORS = %w(black brown red orange yellow green blue violet grey white)

  def self.value(arr)
    arr
      .reverse
      .each_with_index
      .reduce(0) { |sum, (n, i)| sum + COLORS.index(n) * 10 ** i }
  end
end
