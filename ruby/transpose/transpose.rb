class Transpose
  def self.transpose(input)
    return "" if input.empty?

    array = input.split("\n")
    largest_size = array.map(&:size).max

    out = []

    largest_size.times do |i|
      out << array.map { |row| row[i] }
    end

    # Remove trailing nils
    out.map! do |row|
      last_idx = row.size.times.select { |i| row[i] }.max
      row[0..last_idx]
    end

    # Replace any intermediate nils with spaces
    out.map! { |row| row.map { |char| char || " " } }

    out.map!(&:join)

    return out.join("\n")
  end
end
