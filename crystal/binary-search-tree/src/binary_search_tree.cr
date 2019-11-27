class Node
  include Enumerable(Int32)
  include Iterable(Int32)

  property value : Int32
  property left : Node?
  property right : Node?
  property parent : Node?

  def initialize(@value)
  end

  def initialize(@value, @parent)
  end

  def insert(n : Int32)
    if n <= @value
      if l = @left
        l.insert(n)
      else
        @left = Node.new(n, self)
      end
    else
      if r = @right
        r.insert(n)
      else
        @right = Node.new(n, self)
      end
    end
  end

  def search(n : Int32) : Node?
    if n == @value
      self
    else
      if n <= @value
        @left.try(&.search(n))
      else
        @right.try(&.search(n))
      end
    end
  end

  def delete(n : Int32)
    node = search(n)

    return unless node

    case node.children.size
    when 0
      node.remove
    when 1
      child = (node.left || node.right).not_nil!
      node.replace(child)
    when 2
      successor = node.right.not_nil!.smallest_child

      node.value = successor.value

      case successor.children.size
      when 0
        successor.remove
      when 1
        successor.replace(successor.right.not_nil!)
      end
    end
  end

  def children : Array(Node)
    [@left, @right].compact
  end

  def remove
    if left_child?
      @parent.not_nil!.left = nil
    elsif right_child?
      @parent.not_nil!.right = nil
    end

    children.each(&.parent = @parent)
  end

  def left_child? : Bool
    @value == @parent.try(&.left.try(&.value))
  end

  def right_child? : Bool
    @value == @parent.try(&.right.try(&.value))
  end

  def replace(other : Node)
    @value = other.value
    @left = other.left
    @right = other.right
    @parent = other.parent

    other.left.try(&.parent = self)
    other.right.try(&.parent = self)

    other.remove
  end

  def smallest_child : Node
    node = self

    while left = node.left
      node = left
    end

    return node
  end

  # Overriding Enumerable#to_a since it depends on #each, which we need
  # this to define
  def to_a(accumulator = [] of Int32) : Array(Int32)
    @left.try(&.to_a(accumulator))
    accumulator << @value
    @right.try(&.to_a(accumulator))
    return accumulator
  end

  def each
    BSTIterator.new(self)
  end

  def each(&block)
    each.each { |value| yield value }
  end

  private class BSTIterator
    include Iterator(Int32)

    @buffer : Array(Int32)

    def initialize(node : Node)
      @buffer = node.to_a
    end

    def next
      if @buffer.empty?
        stop
      else
        @buffer.shift
      end
    end
  end
end
