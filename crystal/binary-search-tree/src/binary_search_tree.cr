class Node
  include Enumerable(Int32)
  include Iterable(Int32)

  getter value : Int32
  getter left : Node?
  getter right : Node?
  getter parent : Node?

  protected setter value
  protected setter left
  protected setter right
  protected setter parent

  def initialize(@value, @parent = nil)
  end

  def insert(n)
    if n <= @value
      if @left
        @left.not_nil!.insert(n)
      else
        @left = Node.new(n, parent: self)
      end
    else
      if @right
        @right.not_nil!.insert(n)
      else
        @right = Node.new(n, parent: self)
      end
    end
  end

  def search(n)
    case @value <=> n
    when 0
      self
    when +1
      @left.try &.search(n)
    when -1
      @right.try &.search(n)
    end
  end

  def each(&block : Int32 -> Nil)
    @left.try &.each(&block)
    yield @value
    @right.try &.each(&block)
  end

  def each
    ValueIterator.new(self)
  end

  def map(&block : Int32 -> T) forall T
    xs = [] of T
    each { |x| xs << block.call(x) }
    return xs
  end

  def delete(n)
    target = search(n)

    return if target.nil?

    if target.left && target.right
      target.replace_with!(target.successor)
    elsif target.left
      target.replace_with!(target.left)
    elsif target.right
      target.replace_with!(target.right)
    else
      target.replace_with!(nil)
    end
  end

  def least_child
    curr = self.as(Node)

    while curr.left
      curr = curr.left.as(Node)
    end

    return curr
  end

  def greatest_child
    curr = self.as(Node)

    while curr.right
      curr = curr.right.as(Node)
    end

    return curr
  end

  def successor
    if @right
      @right.not_nil!.least_child
    else
      # If this node has no right child, we need to walk up the tree
      # until we find a node whose value is greater than or equal to
      # this one's
      return unless @parent

      curr = @parent.as(Node)

      until curr.value >= @value
        return unless curr.parent
        curr = curr.parent.as(Node)
      end

      return curr
    end
  end

  def predecessor
    if @left
      @left.not_nil!.greatest_child
    else
      # If this node has no left child, we need to walk up the tree
      # until we find a node whose value is less than this one's
      return unless @parent

      curr = @parent.as(Node)

      until curr.value < @value
        return unless curr.parent
        curr = curr.parent.as(Node)
      end

      return curr
    end
  end

  protected def replace_with!(other)
    if other
      # If `other` is a node...

      # Copy its value
      @value = other.value

      # Make its children point to its parent
      other.left.try &.parent = other.parent
      other.right.try &.parent = other.parent

      other.replace_with!(other.left)

      # Now the other node should effectively be orphaned from the tree
    else
      # If `other` is nil, we simply remove the parent's reference to
      # this node
      @parent.try do |p|
        p.left = nil if p.left == self
        p.right = nil if p.right == self
      end
    end
  end

  private class ValueIterator
    include Iterator(Int32)

    @current : Node?

    def initialize(root)
      @current = root.least_child
    end

    def next
      stop if @current.nil?

      value = @current.not_nil!.value
      @current = @current.not_nil!.successor
      return value
    end
  end
end
