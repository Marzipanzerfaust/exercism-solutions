class Grep
  def self.grep(pattern, flags, files)
    linenumbers = flags.include?("-n")
    filenames = flags.include?("-l")
    ignorecase = flags.include?("-i")
    invert = flags.include?("-v")
    matchall = flags.include?("-x")

    multiple_files = files.size > 1

    if matchall
      pattern = "\\A#{pattern}\\z"
    end

    re = Regexp.new(pattern, ignorecase ? Regexp::IGNORECASE : 0)

    lines = []

    files.each do |file|
      if filenames
        if File.read(file).match?(re) ^ invert
          lines << file
        end
      else
        File.readlines(file, chomp: true).each_with_index do |line, i|
          if line.match?(re) ^ invert
            out = []
            out << file if multiple_files
            out << "#{i + 1}" if linenumbers
            out << line

            lines << out.join(":")
          end
        end
      end
    end

    return lines.join("\n")
  end
end
