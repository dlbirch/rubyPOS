require 'iso_error'

class RightPadder

  attr_accessor :pad_char

  def self.SPACE_PADDER
    RightPadder.new()
  end

	# Creates a RightPadder with a specific pad character.
  def initialize(pad=' ')
    @pad_char = pad
  end

  def pad(data, max_length)

    padded_data = data
    if (data.size < max_length)
      padded_data = data.ljust(max_length, @pad_char)
    elsif (data.size > max_length)
      raise IsoError, IsoError.tag_the_message("Data is too long (size is '#{data.size.to_s}'. Max = " + max_length.to_s)
    end
    return padded_data

  end

  def unpad(padded_data)

    length = padded_data.length()
    string_to_chomp = ''
    i = length
    while i > 0
      if padded_data[i] == @pad_char
        string_to_chomp << padded_data[i]
      end
      i -= 1
    end

    padded_data.chomp(string_to_chomp)
  end

end