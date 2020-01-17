# XXX

module React
  alias Cell = InputCell | ComputeCell

  class InputCell
    property value : Int32

    def initialize(@value)
    end
  end

  class ComputeCell
    def initialize(@a : Cell, &block)
      @b = nil
      @formula = block
    end

    def initialize(@a : Cell, @b : Cell, &block)
      @formula = block
    end

    def value : Int32
      if @b
        @formula.call(@a.value, @b.not_nil!.value)
      else
        @formula.call(@a.value)
      end
    end
  end
end
