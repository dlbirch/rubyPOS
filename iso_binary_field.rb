require 'iso_error'
require 'iso'
require 'iso_component'

# Implements 'Leaf' for binary fields
class IsoBinaryField < IsoComponent
  attr_accessor(:field_number, :value)

  def initialize(field_number: -1, value: [], starting_offset: nil, field_length: nil)
    @field_number = field_number

    if starting_offset.nil? || field_length == nil
      @value = value
    else
      byte_array = Array.new(field_length)
      byte_array[starting_offset .. -1] = value[0 .. (field_length -1)]
      @value = byte_array
    end

  end

  def value=(value)
    if value.respond_to?(:to_str)
      byte_array = value.unpack("c*")
      @value = byte_array
    else
      @value = value
    end
  end

  # Operation not valid for Leaf - always raises IsoError
  def pack
    raise(IsoError, IsoError.tag_the_message("Not available on Leaf."))
  end

  # Operation not valid for Leaf - always raises IsoError
  def unpack(byte_array: nil, input_stream: nil)
    raise(IsoError, IsoError.tag_the_message("Not available on Leaf."))
  end

  # Return field number
  def get_key()
    @field_number
  end

  # TODO Stubbed in ... needs further work
  def to_string
    puts @value.pack("c*")
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