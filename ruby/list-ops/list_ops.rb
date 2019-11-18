# I'm assuming that we are only allowed to use the following Array
# methods:

# Array.new
# Array#[]
# Array#[]=
# Array#fetch
# Array#<<

class ListOps
  def self.arrays(arr)
    i = 0

    loop do
      begin
        arr.fetch(i)
      rescue IndexError
        break
      end

      i += 1
    end

    return i
  end

  def self.reverser(arr)
    (arrays(arr) - 1).downto(0).each_with_object([]) do |i, out|
      out << arr[i]
    end
  end

  def self.concatter(a, b)
    out = []

    arrays(a).times { |i| out << a[i] }
    arrays(b).times { |i| out << b[i] }

    return out
  end

  def self.mapper(arr)
    arrays(arr).times.each_with_object([]) do |i, out|
      out << yield(arr[i])
    end
  end

  def self.filterer(arr)
    arrays(arr).times.each_with_object([]) do |i, out|
      out << arr[i] if yield(arr[i])
    end
  end

  def self.sum_reducer(arr)
    sum = 0

    arrays(arr).times { |i| sum += arr[i] }

    return sum
  end

  def self.factorial_reducer(arr)
    product = 1

    arrays(arr).times { |i| product *= arr[i] }

    return product
  end
end
