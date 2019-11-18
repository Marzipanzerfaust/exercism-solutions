# Please implement your solution to binary in this file
struct Binary
  def self.to_decimal(bin : String)
    bin.reverse.chars.each_with_index.reduce(0) do |sum, (x, i)|
      begin
        int = x.to_i
      rescue ex : ArgumentError
        raise ex
      else
        if int > 1
          raise ArgumentError.new
        else
          sum + x.to_i * 2 ** i
        end
      end
    end
  end
end
