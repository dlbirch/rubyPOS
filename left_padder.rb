require 'iso_error'

class LeftPadder

  attr_accessor :pad_char

  def self.ZERO_PADDER
    LeftPadder.new()
  end

  # Creates a LeftPadder with a specific pad character.
  def initialize(pad='0')
    @pad_char = pad
  end

  def pad(data, max_length)
    padded_data = data
    if (data.size < max_length)
      padded_data = data.rjust(max_length, @pad_char)
    elsif (data.size > max_length)
      raise IsoError, IsoError.tag_the_message("Data is too long. Max = " + max_length.to_s)
    end
    return padded_data

  end

  def unpad(padded_data)
    padding_offset = 0
    padded_data.chars do |c|
      if c != @pad_char
        break
      end
      padding_offset += 1
    end
    padded_data[padding_offset..(padded_data.length-1)].to_s
  end

end