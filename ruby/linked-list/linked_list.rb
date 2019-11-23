# The Deque class that we are being asked to implement could be done
# very easily using a Ruby array, so we will avoid that if possible

class Deque
  attr_reader :head, :tail

  def initialize
    @head = @tail = nil
  end

  def push(x)
    new_tail = Node.new(x)

    if @tail
      @tail.next = new_tail
      new_tail.prev = @tail
    end

    @tail = new_tail

    @head = @tail unless @head
  end

  def pop
    return unless @tail

    old_tail = @tail
    new_tail = @tail.prev

    if new_tail.nil?
      @head = @tail = nil
    else
      new_tail.next = nil
      @tail = new_tail
    end

    return old_tail.value
  end

  # shift is like pop, but it operates on the head instead of the tail
  def shift
    return unless @head

    old_head = @head
    new_head = @head.next

    if new_head.nil?
      @head = @tail = nil
    else
      new_head.prev = nil
      @head = new_head
    end

    return old_head.value
  end

  # unshift is like push, but it operates on the head instead of the
  # tail
  def unshift(x)
    new_head = Node.new(x)

    if @head
      @head.prev = new_head
      new_head.next = @head
    end

    @head = new_head

    @tail = @head unless @tail
  end
end

class Node
  attr_accessor :value, :next, :prev

  def initialize(value)
    @value = value
    @next = @prev = nil
  end
end
