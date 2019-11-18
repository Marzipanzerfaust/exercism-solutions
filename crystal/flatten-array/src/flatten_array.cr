class FlattenArray
  def self.flatten(arr : Array)
    arr.each_with_object([] of Int32) do |elem, output|
      if elem.is_a?(Array)
        output.concat(self.flatten(elem))
      elsif elem.nil?
        next
      else
        output << elem
      end
    end
  end
end
