class Crypto
  def initialize(text)
    @text = text
  end

  def ciphertext
    normal = @text.downcase.gsub(/\W/, '')

    return normal if normal.size <= 1

    for n in 1..Float::INFINITY
      if n * (n-1) >= normal.size
        cols = n
        rows = n - 1
        break
      elsif n * n >= normal.size
        cols = rows = n
        break
      end
    end

    arr = []

    cols.times do |j|
      rows.times { |i| arr << (normal[i*cols+j] || ' ') }
    end

    return arr.each_slice(rows).map(&:join).join(' ')
  end
end
