class Translation
  CODON_TO_PROTEIN = {
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UGG" => "Tryptophan",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  def self.of_codon(c)
    CODON_TO_PROTEIN[c]
  end

  def self.of_rna(strand)
    polypeptide = []

    strand.chars.each_slice(3).map(&:join).each do |c|
      raise InvalidCodonError if of_codon(c).nil?
      break if of_codon(c) == "STOP"

      polypeptide << of_codon(c)
    end

    return polypeptide
  end
end

class InvalidCodonError < StandardError; end
