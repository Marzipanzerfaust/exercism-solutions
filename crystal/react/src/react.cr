# Please implement your solution to react in this file
module React
  class InputCell
    property value : Int32

    def initialize(@value)
    end
  end

  class ComputeCell
    # def initialize(cell : InputCell, &block : Tuple(Int32) -> Int32)
    #   @input = {cell}
    #   @formula = block
    # end

    def initialize(cell1 : InputCell, cell2 : InputCell, &block : Tuple(Int32, Int32) -> Int32)
      @input = {cell1, cell2}
      @formula = block
    end

    def value
      @formula.call(@input.map(&.value))
    end
  end
end
