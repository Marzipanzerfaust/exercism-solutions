class Nucleotide
  def self.from_dna(string)
    new(string)
  end

  def initialize(string)
    raise ArgumentError if string.chars.any? { |char| char =~ /[^ACGT]/ }

    @string = string
  end

  def count(nucleotide)
    @string.count(nucleotide)
  end

  def histogram
    counter = {'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0}
    @string.each_char { |char| counter[char] += 1 }

    return counter
  end
end
