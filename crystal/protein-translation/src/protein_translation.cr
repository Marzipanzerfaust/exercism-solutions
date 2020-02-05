module ProteinTranslation
  DICTIONARY = {
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
    "UGG" => "Tryptophan"
  }

  STOPS = %w(UAA UAG UGA)

  def self.proteins(seq : String) : Array(String)
    output = [] of String

    seq.each_char.slice(3, reuse: true).map(&.join).each do |nuc|
      break if STOPS.includes?(nuc)
      output << DICTIONARY[nuc]
    end

    return output
  end
end
