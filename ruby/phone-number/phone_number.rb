module PhoneNumber
  VALID_NANP = /^1?([2-9]\d{2})([2-9]\d{2})(\d{4})$/

  def self.clean(digits)
    digits = digits.gsub(/\D/, "")
    return "#$1#$2#$3" if digits.match(VALID_NANP)
  end
end
