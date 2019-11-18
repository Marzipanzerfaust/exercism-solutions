# Please implement your solution to rna-transcription in this file
struct RnaComplement
  def self.of_dna(strand : String)
    strand
      .chars.map { |nucleotide| {'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U'}[nucleotide] }
      .join
  end
end
