class HighScores
  attr_reader :scores

  def initialize(arr)
    @scores = arr
  end

  def latest
    @scores.last
  end

  def highest
    @scores.max
  end

  def top
    @scores.max(3)
  end

  def report
    str = "Your latest score was #{latest}."

    diff = highest - latest

    if diff.positive?
      str << " That's #{diff} short of your personal best!"
    else
      str << " That's your personal best!"
    end

    return str
  end
end
