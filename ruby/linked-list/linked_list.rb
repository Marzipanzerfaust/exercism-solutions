class Deque
  def initialize
    @head = nil
    @tail = nil

    @size = 0
  end

  def push(x)
    new_tail = Node.new(x)

    if @size.zero?
      @tail = new_tail
      @head = @tail
    else
      old_tail = @tail
      new_tail.prev = old_tail
      @tail = new_tail
    end

    @size += 1
  end

  def pop
    old_tail = @tail
    @tail = @tail.prev
    @tail.next = nil

    @size -= 1

    @head = @tail if @size <= 1

    return old_tail.value
  end

  def unshift(x)
    new_head = Node.new(x)

    if @size.zero?
      @head = new_head
      @tail = head
    else
      old_head = @head
      new_head.next = old_head
      @head = new_head
    end

    @size += 1
  end

  def shift
    old_head = @head
    @head = @head.next
    @head.prev = nil

    @size -= 1

    @tail = @head if @size <= 1

    return old_head.value
  end
end

class Node
  attr_reader :value
  attr_accessor :next, :prev

  def initialize(x = nil)
    @value = x
  end

  def next!

  def link_next(other)
    @next = other
    other.prev = self
  end

  def link_prev(other)
    @prev = other
    other.next = self
  end
end
