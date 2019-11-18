# Please implement your solution to binary-search-tree in this file
class Node
  getter value, left, right

  # @left : Node | Nil = nil
  # @right : Node | Nil = nil

  def initialize(@value : Int32)
    @left = @right = nil
  end

  def insert(new_val : Int32)
    if new_val < @value
      if @left.is_a?(Node)
        @left.insert(new_val)
      else
        @left = Node.new(new_val)
      end
    end

    if new_val > @value
      if @right.is_a?(Node)
        @right.insert(new_val)
      else
        @right = Node.new(new_val)
      end
    end
  end
end
