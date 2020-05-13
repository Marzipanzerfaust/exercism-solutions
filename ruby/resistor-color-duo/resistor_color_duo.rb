module ResistorColorDuo
  COLORS = %w(black brown red orange yellow green blue violet grey white)

  def self.value(arr)
    arr
      .reverse_each
      .with_index
      .sum { |n, i| COLORS.index(n) * 10 ** i }
  end
end
