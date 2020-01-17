class Scale
  module Chromatics
    NONE = %w(A B C D E F G)
    SHARPS = %w(A A# B C C# D D# E F F# G G#)
    FLATS = %w(A Bb B C Db D Eb E F Gb G Ab)
  end

  attr_reader :name, :pitches

  def initialize(key, type)
    upper = key.capitalize

    @name = "#{upper} #{type}"

    base = case type
           when :chromatic
             case upper
             when 'F'
               Chromatics::FLATS
             else
               Chromatics::SHARPS
             end
           when :major
             case upper
             when 'C'
               Chromatics::NONE
             when 'G', 'D', 'A', 'E', 'B', 'F#'
               Chromatics::SHARPS
             when 'F', 'Bb', 'Eb', 'Ab', 'Db', 'Gb'
               Chromatics::FLATS
             end
           when :minor
             case upper
             when 'A'
               Chromatics::NONE
             when 'E', 'B', 'F#', 'C#', 'G#', 'D#'
               Chromatics::SHARPS
             when 'D', 'G', 'C', 'F', 'Bb', 'Eb'
               Chromatics::FLATS
             end
           end

    @pitches = base.rotate(base.index(upper))
  end
end
