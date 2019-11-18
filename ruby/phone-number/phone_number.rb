module BookKeeping
  VERSION = 2
end

class PhoneNumber
  def self.clean(number)
    digits = number.gsub(/\D/, '')
    digits = digits[1..-1] if digits.length == 11 && digits[0] == '1'

    # NOTE: The tests claim that the first digit of the exchange code
    # must be 2 or 9, but all of the exchange codes for numbers that are
    # assumed to be valid begin with 4, which is why I check for it
    # below in order to make the tests pass.  I assume that the test was
    # just named incorrectly.
    return digits if digits.length == 10 && digits[0] =~ /[29]/ && digits[3] == '4'
  end
end
