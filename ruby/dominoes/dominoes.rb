class Dominoes
  def self.chain?(dominoes)
    dominoes.permutation.any? do |p|
      p.all? do |a, b|

      end
    end
  end
end
