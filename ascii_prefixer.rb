require 'iso_error'
require 'iso'

class AsciiPrefixer

  attr_accessor :prefix_nbr_digits


  def self.L
    AsciiPrefixer.new(1)
  end

  def self.LL
    AsciiPrefixer.new(2)
  end

  def self.LLL
    AsciiPrefixer.new(3)
  end

  def self.LLLL
    AsciiPrefixer.new(4)
  end

  def self.LLLLL
    AsciiPrefixer.new(5)
  end

  def self.LLLLLL
    AsciiPrefixer.new(6)
  end

  def initialize(prefix_nbr_digits=1)
      if (prefix_nbr_digits.to_s =~ /^(0|[1-9][0-9]*)$/) &&  prefix_nbr_digits > 0 &&  prefix_nbr_digits <= 6 # Only non-zero, positive integers
        @prefix_nbr_digits = prefix_nbr_digits
      else
        raise IsoError, IsoError.tag_the_message("prefix_nbr_digits - value must be a positive integer less than 7.")
      end
  end

  def encode_length(prefix_value, prefix_bytes=[])
    length = prefix_value
    # Take the modulus and then divide by 10 - coercing the result to ASCII bytes by adding an ASCII Zero.
    @prefix_nbr_digits.times do |i|
      prefix_bytes[i] = (length % 10) + Iso::ASCII_ZERO
      length /= 10
    end
    if length != 0 then
      raise(IsoError, IsoError.tag_the_message("Bad prefix_value of #{prefix_value.to_s} (contains too many digits). Value must be a positive integer with number of digits <= #{@prefix_nbr_digits.to_s}"))
    else
      prefix_bytes.reverse
    end
  end

  def decode_length(prefix_bytes, offset=0)
    if @prefix_nbr_digits > 0
      template_chars = []
      @prefix_nbr_digits.times do
        template_chars << 'C' # Unsigned byte
      end
      prefix_bytes[0..(@prefix_nbr_digits - 1)].pack(template_chars.join).to_i
    else
      raise(IsoError, IsoError.tag_the_message("Bad prefix_nbr_digits '#{@prefix_nbr_digits.to_s}' - value must be a positive integer less than 7."))
    end
  end

  def get_packed_length()
    return @prefix_nbr_digits
  end

end