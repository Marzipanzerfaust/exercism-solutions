module React

  abstract class Cell

    @value : Int32 = 0
    @subscribers = [] of ComputeCell

    protected def subscribe(subscriber : ComputeCell) : Nil
      @subscribers << subscriber
    end

    protected def notify_value_change() : Nil
      @subscribers.each(&.notify_value_change)
    end

    protected def notify_execute_callbacks() : Nil
      @subscribers.each(&.notify_execute_callbacks)
    end

    getter :value

  end

  class InputCell < Cell

    def initialize(@value : Int32)
    end

    def value=(value : Int32)
      if value != @value
        @value = value
        notify_value_change
	      notify_execute_callbacks
      end
    end
  end

  class ComputeCell < Cell

    @callback = [] of Proc(Int32, Nil)
    @pre_callbacks_value : Int32

    def initialize(ref1 : Cell, &block : Int32 -> Int32)
      initialize( ->{ block.call(ref1.value)}, ref1)
    end

    def initialize(ref1 : Cell, ref2 : Cell, &block : (Int32, Int32) -> Int32)
      initialize( ->{ block.call(ref1.value, ref2.value) }, ref1, ref2)
    end

    private def initialize(@block : -> Int32, *refs : Cell)
      @value = @block.call
      @pre_callbacks_value = @value
      refs.each { |ref| ref.subscribe(self) }
    end

    def add_callback(&block : Int32 -> Nil): Proc(Int32, Nil)
      @callback << block
      block
    end

    def remove_callback(callback : Proc(Int32, Nil)) : Nil
      @callback.delete(callback)
    end

    protected def notify_value_change() : Nil
      new_value = @block.call
      if new_value != @value
        @value = new_value
        super()
      end
    end

    protected def notify_execute_callbacks() : Nil
      if @value != @pre_callbacks_value
        @pre_callbacks_value = @value
        @callback.each do |callback|
          callback.call(@value)
        end
        super()
      end
    end

  end
end
