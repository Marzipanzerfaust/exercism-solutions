class Node
  include Enumerable(Int32)

  property :value, :left, :right, :parent_left, :parent_right

  @value : Int32
  @left : Node | Nil
  @right : Node | Nil
  @parent_left : Node | Nil
  @parent_right : Node | Nil

  def initialize(@value)
  end

  def insert(n : Int32)
    if n <= @value
      if @left
        @left.not_nil!.insert(n)
      else
        @left = Node.new(n)
        # @left.parent_right = self
      end
    else
      if @right
        @right.not_nil!.insert(n)
      else
        @right = Node.new(n)
        # @right.parent_left = self
      end
    end
  end

  # def delete(n : Int32)
  #   node = search(n)
  #
  #   if [node.left, node.right].none?
  #     node.remove
  #   elsif [node.left, node.right].all?
  #
  #   elsif node.left
  #     node.replace(node.left)
  #   elsif node.right
  #     node.replace(node.right)
  #   end
  # end
  #
  # private def remove
  #   if @parent_left
  #     @parent_left.right = nil
  #   end
  #
  #   if @parent_right
  #     @parent_right.left = nil
  #   end
  #
  #   @parent_left = @parent_right = nil
  # end

  def search(n : Int32) : Node | Nil
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

  def each(&block : Int32 -> Nil)
    @left.try &.each { |x| block.call(x) }
    yield @value
    @right.try &.each { |x| block.call(x) }
  end
end
