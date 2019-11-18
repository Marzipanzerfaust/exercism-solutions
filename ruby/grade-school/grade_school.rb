module BookKeeping
  VERSION = 3
end

class School
  def initialize
    @roster = Hash.new { |h, k| h[k] = [] }
  end

  def students(grade)
    @roster[grade].sort
  end

  def add(name, grade)
    @roster[grade] << name
  end

  def students_by_grade
    @roster.sort.map { |k, v| {grade: k, students: self.students(k)} }
  end
end
