module PhoneNumber
  def self.clean(digits)
    digits = digits.gsub(/\D/, "")
    return "#$1#$2#$3" if digits.match(/^1?([2-9]\d{2})([2-9]\d{2})(\d{4})$/)
  end
end
