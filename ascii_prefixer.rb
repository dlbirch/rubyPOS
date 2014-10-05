class Ascii_Prefixer

  attr_accessor :prefix_nbr_digits
  ASCII_ZERO = 0x30

  def initialize(prefix_nbr_digits)
      @prefix_nbr_digits = prefix_nbr_digits
  end

  def encode_length(prefix_value, prefix_bytes=[])
    length = prefix_value
    # Take the modulus and then divide by 10 - coercing the result to ASCII bytes by adding an ASCII Zero.
    @prefix_nbr_digits.times do |i|
      prefix_bytes[i] = (length % 10) + ASCII_ZERO
      length /= 10
    end
    if length != 0 then
      raise(StandardError)
    end
    prefix_bytes.reverse
  end

  def decode_length(b, offset=0)
    limit = @prefix_nbr_digits - 1
    unless limit == 0
      template_chars = []
      @prefix_nbr_digits.times do
        template_chars << 'C' #Unsigned byte
      end
      b[0..limit].pack(template_chars.join.to_s)
    else
      raise(StandardError)
    end
  end

  def getPackedLength(b)
    return decode_length(b)
  end

end