class Stack
  def initialize
    @values = [] of Int32
    @operations = {} of String => (-> Array(Int32))
    @operations.merge! Hash{
      "+" => ->{ @values.push @values.pop(2).sum },
      "dup" => ->{ @values.push(@values.last) }
    }
  end

  def push(n : Int32)
    @values << n
  end

  def call(name : String)
    @operations[name].call
  end

  def define(name : String, callbacks : String)
    @operations[name] = ->{ callbacks.split.each { |c| @operations[c].call } }
  end
end







def __icr_exec__
  stack = Stack.new
  4.times { |i| stack.push(i) }
  stack.call("dup")
  stack = Stack.new
end

puts "|||YIH22hSkVQN|||#{__icr_exec__.inspect}"