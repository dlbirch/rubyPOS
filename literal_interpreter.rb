require 'iso_error'

# Implements a Literal Interpreter to convert Strings into byte arrays and vice versa. No conversion is done.
class LiteralInterpreter

  # An instance of this Interpreter. Only one needed for the whole system
  def self.INSTANCE
    LiteralInterpreter.new()
  end

  def initialize()
  end

  # Fills the given byte_array for a given string
  # Current implementation is not idiomatic Ruby (uses a return statement) .. would like to refactor this code
  def interpret(data, offset)
    byte_array = []
    begin
      data.encode(AsciiInterpreter.ENCODING)[offset..(data.size-1)].bytes do |b|
        byte_array << b
      end
      return byte_array
    rescue
      raise(IsoError, IsoError.tag_the_message("Unable to interpret data '#{data.to_s}' as byte array using offset of: '#{offset.to_s}'"))
    end
  end

  # Returns a string for a given byte_array
  def uninterpret(raw_data, offset, length)
    raw_data[offset..(length-1)].pack("C*") #.encode(AsciiInterpreter.ENCODING)
  end

  def get_packed_length(n_data_units)
    return n_data_units
  end

end