class FlattenArray
  def self.flatten(arr)
    arr.each_with_object([]) do |item, out|
      next if item.nil?

      if item.is_a?(Array)
        out.concat flatten(item)
      else
        out << item
      end
    end
  end
end
