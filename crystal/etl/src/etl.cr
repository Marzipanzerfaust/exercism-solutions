module ETL
  def self.transform(input : Hash(String, Array(String))) : Hash(String, Int32)
    out = Hash(String, Int32).new

    input.each do |k, v|
      v.each { |val| out[val.downcase] = k.to_i }
    end

    out
  end
end
