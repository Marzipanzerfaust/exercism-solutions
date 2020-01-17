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
    @roster.keys.sort.map { |k| {grade: k, students: students(k)} }
  end
end
