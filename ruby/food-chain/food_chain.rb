module FoodChain
  RHYMES = {
    "fly" => "I don't know why she swallowed the fly. Perhaps she'll die.\n",
    "spider" => "It wriggled and jiggled and tickled inside her.\n",
    "bird" => "How absurd to swallow a bird!\n",
    "cat" => "Imagine that, to swallow a cat!\n",
    "dog" => "What a hog, to swallow a dog!\n",
    "goat" => "Just opened her throat and swallowed a goat!\n",
    "cow" => "I don't know how she swallowed a cow!\n",
    "horse" => "She's dead, of course!\n"
  }

  ANIMALS = RHYMES.keys

  def self.song
    (1..8)
      .map { |i| verse(i) }
      .join("\n")
  end

  def self.verse(n = 1)
    animal = ANIMALS[n - 1]

    text = []

    text << "I know an old lady who swallowed a #{animal}.\n"
    text << RHYMES[animal] unless n == 1

    if n.between?(2, 7)
      ANIMALS[...n].each_cons(2).reverse_each do |a, b|
        text << "She swallowed the #{b} to catch the #{a}#{" that wriggled and jiggled and tickled inside her" if a == "spider"}.\n"
      end
    end

    text << RHYMES["fly"] unless n == 8

    return text.join
  end
end
