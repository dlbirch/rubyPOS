require 'iso_error'
require 'right_padder'

# Implements methods for padding strings and byte arrays on the Right.
# The difference between this and RightPadder is that this truncates the data
# during padding, instead of throwing an exception.
class RightTPadder

  def self.SPACE_PADDER
    RightTPadder.new()
  end

# Creates a RightTPadder with a specific pad character.
  def initialize(pad=' ')
    @pad_char = pad
    @right_padder = RightPadder.new(pad)
  end

  def pad(data, max_length)

    if data.size > max_length
      @right_padder.pad(data[0..(max_length-1)], max_length);
    else
      @right_padder.pad(data, max_length)
    end

  end

  def unpad(padded_data)
    @right_padder.unpad(padded_data)
  end

end