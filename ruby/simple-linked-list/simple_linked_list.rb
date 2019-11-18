class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(n)
    @datum = n
  end
end

class SimpleLinkedList
  def initialize(array = [])
    @list = []

    array.each { |i| push(Element.new(i)) }
  end

  def push(elem)
    @list.unshift(elem)
    return self
  end

  def pop
    @list.shift
  end

  def to_a
    @list.map(&:datum)
  end

  def reverse!
    @list.reverse!
    return self
  end
end
