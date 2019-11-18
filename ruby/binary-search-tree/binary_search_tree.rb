class Bst
  attr_reader :data, :left, :right

  def initialize(n)
    @data = n
    @left = nil
    @right = nil
  end

  def insert(n)
    if n <= @data
      if @left
        @left.insert(n)
      else
        @left = Bst.new(n)
      end
    else
      if @right
        @right.insert(n)
      else
        @right = Bst.new(n)
      end
    end
  end

  def each(&block)
    if block_given?
      @left.each(&block) if @left
      yield @data
      @right.each(&block) if @right
    else
      enum_for(:each)
    end
  end
end
