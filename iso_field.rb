require 'iso_error'
require 'iso'
require 'iso_component'

# Implementation of the 'Leaf' piece of the GOF Composite pattern.  The leaf here
# is an IsoField that represents an indivisible building block of a larger message.
class IsoField < IsoComponent
  attr_accessor(:field_number, :value)

  def initialize(field_number: -1, value: nil)
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
  def get_bytes()
    @value
  end

  def value=(value)
      @value = value
  end

  # TODO Stubbed in ... needs further work
  def to_string
    puts @value.to_s
  end

  # TODO Stubbed in ... needs further work
  def dump(print_stream, indent)
    puts "#{indent.to_s} Field Number: #{field_number.to_s} Value: #{value.to_s}"
  end

  # TODO Stubbed in ... needs further work
  def write_external(out_stream)
    # out.writeShort (fieldNumber);
    # out.writeUTF (value);
    puts value.to_s
  end

  # TODO Stubbed in ... needs further work
  def read_external(in_stream)
    # fieldNumber = in.readShort ();
    # value       = in.readUTF();
  end

end