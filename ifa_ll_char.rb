class IfaLLChar
  attr_accessor(:interpreter, :padder, :prefixer, :length, :description, :pad)

  def initialize(interpreter=LiteralInterpreter.INSTANCE, padder=NullPadder.INSTANCE, prefixer=NullPrefixer.INSTANCE, length: -1, description: '', pad: false)

    @interpreter = interpreter
    @padder = padder
    @prefixer = prefixer

    @length = length
    @description = description
    @pad = pad

  end

  def create_component(field_number)
    # add code to:
    # return ISOField.new(field_number)

  end

  ## Fix the parms here on the interpreter.getPackedLength call ...
  def get_max_packed_length()
    #(@prefixer.getPackedLength()) + (@interpreter.getPackedLength())
  end

  # Return a byte[] after packing this component
  def pack(iso_component)
    # add code here to return a byte[] after packing this component
  end

  # Update the iso_component value after unpacking the byte array
  def unpack(iso_component, byte_array, offset)
    # add code here to update the iso_component value after unpacking the byte array
  end






end