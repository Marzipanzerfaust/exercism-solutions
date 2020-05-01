class Crypto
  def initialize(text)
    @text = text
  end

  def ciphertext
    normal = @text.downcase.gsub(/\W/, '')

    return normal if normal.size <= 1

    # Determine the slice size n
    n = 1

    until n * n >= normal.size || n * (n - 1) >= normal.size
      n += 1
    end

    # Divide the normalized string into n-sized slices of characters
    slices = normal.each_char.each_slice(n).to_a

    # Make sure that the last slice is padded with spaces to make it the
    # same length as all the others
    slices.last.fill(" ", slices.last.size...n)

    # Transpose the characters and join them back into a space-separated
    # string
    return slices.transpose.map(&:join).join(" ")
  end
end
