# Please implement your solution to react in this file
module React
  class InputCell
    property value : Int32

    def initialize(@value)
    end
  end

  class ComputeCell
    def initialize(@input : InputCell, &block : Int32 -> Int32)
      @formula = block
    end

    def value
      @formula.call(@input.value)
    end
  end
end
