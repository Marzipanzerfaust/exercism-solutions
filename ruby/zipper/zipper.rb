class Node
  attr_reader :value, :left, :right

  def initialize(n, l, r)
    @value = n
    @left = l
    @right = r
  end
end

class Zipper
  def initialize(node)
    @root = @focus = node
  end

  def to_tree
    @root.clone
  end

  def value
    @focus.value
  end

  def left
    @focus = @focus.left
    return @focus ? self : nil
  end

  def right
    @focus = @focus.right
    return @focus ? self : nil
  end

  def self.from_tree(tree)
    new(tree.clone)
  end
end
