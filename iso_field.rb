require 'iso_error'
require 'iso'
require 'iso_component'

# Implementation of the 'Leaf' piece of the GOF Composite pattern.  The leaf here
# is an IsoField that represents an indivisible building block of a larger message.
class IsoField < IsoComponent
  attr_accessor(:field_number, :value)

  def initialize(field_number: -1, value: '')
    @field_number = field_number
    @value = value
  end

  # Operation not valid for Leaf - always raises IsoError
  def pack
    raise(IsoError, IsoError.tag_the_message("Not available on Leaf."))
  end

  # Operation not valid for Leaf - always raises IsoError
  def unpack(byte_array)
    raise(IsoError, IsoError.tag_the_message("Not available on Leaf."))
  end

  # Return field number
  def get_key()
    @field_number
  end

  # Return byte[] representing this field
  def get_bytes
    unless @value.nil?
      byte_array = []
      begin
        @value.encode(Iso.ENCODING)[0..(@value.size-1)].bytes do |b|
          byte_array << b
        end
        return byte_array
      rescue
        raise(IsoError, IsoError.tag_the_message("Unable to get bytes for value '#{value.to_s}' as ASCII byte array."))
      end
    end
  end



end