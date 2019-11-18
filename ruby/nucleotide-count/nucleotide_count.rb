class Nucleotide
  class << self
    def from_dna(string)
      new(string)
    end
  end

  def initialize(string)
    raise ArgumentError if string.chars.find { |char| char =~ /[^ACGT]/ }

    @string = string
  end

  def count(nucleotide)
    @string.count(nucleotide)
  end

  def histogram
    counter = {'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0}
    @string.chars.each { |char| counter[char] += 1 }
    return counter
  end
end
