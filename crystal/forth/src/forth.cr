# Please implement your solution to forth in this file
struct Forth
  def self.evaluate(str : String) : Array(Int32)
    stack = ForthStack.new
    stack.eval(str)
    return stack.values
  end
end

class ForthStack
  getter values

  WORD = /[\w\+\-\*\/]+/
  DEFINITION = /: (#{WORD}) ((?:#{WORD}\s?)+) ;/

  def initialize
    @values = [] of Int32
    @operations = {} of String => (-> Nil)

    @operations.merge! Hash{
      "+" => ->{
        x, y = @values.pop(2)
        @values.push(x + y)
        return
      },

      "*" => ->{
        x, y = @values.pop(2)
        @values.push(x * y)
        return
      },

      "-" => ->{
        x, y = @values.pop(2)
        @values.push(x - y)
        return
      },

      "/" => ->{
        x, y = @values.pop(2)
        @values.push(x / y)
        return
      },

      "dup" => ->{
        @values.push(@values.last)
        return
      },

      "drop" => ->{
        @values.pop
        return
      },

      "swap" => ->{
        x, y = @values.pop(2)
        @values.push(y, x)
        return
      },

      "over" => ->{
        @values.push(@values[-2])
        return
      }
    }
  end

  def eval(str : String)
    str.scan(/#{DEFINITION}|\d+|#{WORD}/) do |m|
      case m[0]
      when DEFINITION
        raise "Cannot redefine numbers" if m[1].to_i?
        self.define(m[1], m[2])
      when .to_i?
        self.push(m[0].to_i)
      when WORD
        self.call(m[0])
      end
    end
  end

  def push(n : Int32)
    @values << n
  end

  def call(name : String)
    @operations[name.downcase].call
  end

  def define(name : String, oper : String)
    @operations[name.downcase] = ->{ self.eval(oper) }
  end
end
