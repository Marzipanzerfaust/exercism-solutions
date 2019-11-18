class Complement
  def self.of_dna(strand)
    array = strand.split('')

    if array.any? { |char| !'GCTA'.include?(char) }
      return ''
    end

    complement = array.map do |char|
      case char
      when 'G'
        'C'
      when 'C'
        'G'
      when 'T'
        'A'
      when 'A'
        'U'
      end
    end

    return complement.join
  end
end
