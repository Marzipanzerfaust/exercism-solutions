require "strscan"

class PigLatin
  def self.translate(str)
    out = str.split.map do |word|
      s = StringScanner.new(word)

      if s.scan(/[aeiou]|xray|y[^aeiou]/)
        "#{word}ay"
      else
        s.scan(/y/)

        if s.scan_until(/q/)
          s.scan(/u/)
        else
          s.scan(/[^aeiouy]+/)
        end

        "#{s.rest}#{word[0...s.pos]}ay"
      end
    end

    return out.join(" ")
  end
end
