module House
  OBJECTS = [
    "house that Jack built",
    "malt",
    "rat",
    "cat",
    "dog",
    "cow with the crumpled horn",
    "maiden all forlorn",
    "man all tattered and torn",
    "priest all shaven and shorn",
    "rooster that crowed in the morn",
    "farmer sowing his corn",
    "horse and the hound and the horn"
  ]

  ACTIONS = [
    "lay in",
    "ate",
    "killed",
    "worried",
    "tossed",
    "milked",
    "kissed",
    "married",
    "woke",
    "kept",
    "belonged to",
    nil
  ]

  def self.recite
    verses = []

    OBJECTS.each_index do |i|
      lines = ["This is the #{OBJECTS[i]}"]

      (i - 1).downto(0) do |j|
        lines << "that #{ACTIONS[j]} the #{OBJECTS[j]}"
      end

      lines[-1] += ".\n"

      verses << lines.join("\n")
    end

    return verses.join("\n")
  end
end
