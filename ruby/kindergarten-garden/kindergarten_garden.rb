class Garden
  PLANTS = {
    "G" => :grass,
    "C" => :clover,
    "R" => :radishes,
    "V" => :violets
  }

  KIDS = %w(Alice Bob Charlie David
            Eve Fred Ginny Harriet
            Ileana Joseph Kincaid Larry)

  def initialize(diagram, students = nil)
    if students
      students.sort!
    else
      students = KIDS
    end

    @dict = Hash.new { |h, k| h[k] = [] }

    diagram.split("\n").each do |row|
      row.chars.each_slice(2).with_index do |s, i|
        s.each { |c| @dict[students[i]] << PLANTS[c] }
      end
    end
  end

  def method_missing(name)
    @dict[name.to_s.capitalize]
  end
end
