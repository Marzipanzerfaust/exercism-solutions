# NOTE: Many of these operations are provided by Ruby's CMath library

class ComplexNumber
  attr_reader :real, :imaginary

  def initialize(a, b)
    @real = a
    @imaginary = b
  end

  def +(other)
    a = @real + other.real
    b = @imaginary + other.imaginary
    return ComplexNumber.new(a, b)
  end

  def -(other)
    a = @real - other.real
    b = @imaginary - other.imaginary
    return ComplexNumber.new(a, b)
  end

  def *(other)
    a = @real * other.real - @imaginary * other.imaginary
    b = @imaginary * other.real + @real * other.imaginary
    return ComplexNumber.new(a, b)
  end

  def /(other)
    a = (@real * other.real + @imaginary * other.imaginary)
      .fdiv(other.real ** 2 + other.imaginary ** 2)
    b = (@imaginary * other.real - @real * other.imaginary)
      .fdiv(other.real ** 2 + other.imaginary ** 2)
    return ComplexNumber.new(a, b)
  end

  def ==(other)
    @real == other.real && @imaginary == other.imaginary
  end

  def conjugate
    ComplexNumber.new(@real, -@imaginary)
  end

  def abs
    Math.sqrt(@real ** 2 + @imaginary ** 2)
  end

  def exp
    if @imaginary == Math::PI
      a = -(Math::E ** @real).round
      b = 0
    else
      a = Math::E ** @real * Math.cos(@imaginary)
      b = Math::E ** @real * Math.sin(@imaginary)
    end

    return ComplexNumber.new(a, b)
  end
end
