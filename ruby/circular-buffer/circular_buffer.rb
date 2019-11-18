class CircularBuffer
  def initialize(size)
    @size = size
    @buf = []
  end

  def read
    raise BufferEmptyException if @buf.size == 0
    return @buf.shift
  end

  def write(x)
    raise BufferFullException if @buf.size == @size
    @buf << x
  end

  def write!(x)
    read if @buf.size == @size
    write(x)
  end

  def clear
    @buf.clear
  end

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end
