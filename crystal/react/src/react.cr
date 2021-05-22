module React
  protected class_property id : UInt32 = 0

  alias Cell = InputCell | ComputeCell

  class InputCell
    getter id : UInt32
    getter value : Int32
    getter outputs = [] of ComputeCell

    def initialize(@value)
      @id = React.id
      React.id += 1
    end

    def value=(val : Int32)
      @value = val
      @outputs.each &.refresh self
    end
  end

  class ComputeCell
    getter id : UInt32
    getter value : Int32
    getter outputs = [] of ComputeCell

    @formula : Proc(Int32)
    @sentinel : Cell
    @callbacks = [] of Int32 -> Nil

    def initialize(a : Cell, &block : Int32 -> Int32)
      @id = React.id
      React.id += 1

      @value = block.call(a.value)
      @formula = ->{ block.call(a.value) }
      @sentinel = a

      a.outputs << self
    end

    def initialize(a : Cell, b : Cell, &block : Int32, Int32 -> Int32)
      @id = React.id
      React.id += 1

      @value = block.call(a.value, b.value)
      @formula = ->{ block.call(a.value, b.value) }
      @sentinel = {a, b}.max_by &.id

      a.outputs << self
      b.outputs << self
    end

    def refresh(sender : Cell)
      if sender == @sentinel
        # Only refresh if the sender is the "sentinel", i.e. the final
        # input cell, to avoid refreshing multiple times.

        val = @formula.call

        if val != @value
          # Only refresh if this cell's value has actually changed.

          @value = val
          @callbacks.each &.call @value
          @outputs.each &.refresh self
        end
      end
    end

    def add_callback(&block : Int32 -> Nil) : Int32 -> Nil
      @callbacks << block
      return block
    end

    def remove_callback(callback : Int32 -> Nil)
      @callbacks.delete(callback)
    end
  end
end
