require 'iso_error'
require 'iso'

# ASCII Interpreter converts strings to and from ASCII bytes.
# This class uses the US-ASCII encoding which all JVMs must support.
class AsciiInterpreter

  def self.INSTANCE
    AsciiInterpreter.new()
  end

  # Returns an ASCII byte_array for a given string
  # Current implementation is not idiomatic Ruby (uses a return statement) .. would like to refactor this code
=begin
  def interpret(data, offset)
    byte_array = []
    begin
      data.encode(Iso.ENCODING)[offset..(data.size-1)].bytes do |b|
        byte_array << b
      end
      return byte_array
    rescue
      raise(IsoError, IsoError.tag_the_message("Unable to interpret data '#{data.to_s}' as ASCII byte array using offset of: '#{offset.to_s}'"))
    end
  end
=end

  # Returns an ASCII byte_array for a given string
  # Current implementation is not idiomatic Ruby (uses a return statement) .. would like to refactor this code
  def translate(data, offset)
    byte_array = []
    begin
      data.encode(Iso.ENCODING)[offset..(data.size-1)].bytes do |b|
        byte_array << b
      end
      return byte_array
    rescue
      raise(IsoError, IsoError.tag_the_message("Unable to interpret data '#{data.to_s}' as ASCII byte array using offset of: '#{offset.to_s}'"))
    end
  end

  # Returns an ASCII string for a given byte_array
  def uninterpret(raw_data, offset, length)
    raw_data[offset..(length-1)].pack("C*") #.encode(AsciiInterpreter.ENCODING)
  end

  def get_packed_length(n_data_units)
    return n_data_units
  end

end