class CircularBuffer
  def initialize(size)
    @buffer = Array.new(size)
    @head = 0
    @tail = 0
  end

  def size
    @tail - @head
  end

  def empty?
    size == 0
  end

  def full?
    size == @buffer.size
  end

  def read
    raise BufferEmptyException if empty?

    val = @buffer[@head % @buffer.size]
    @head += 1

    return val
  end

  def write(x)
    raise BufferFullException if full?

    @buffer[@tail % @buffer.size] = x
    @tail += 1
  end

  def write!(x)
    begin
      write(x)
    rescue BufferFullException
      @buffer[@tail % @buffer.size] = x

      @head += 1
      @tail += 1
    end
  end

  def clear
    @head = @tail = 0
  end

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end
