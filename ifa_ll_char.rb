class IfaLLChar
  attr_accessor(:interpreter, :padder, :prefixer, :length, :description, :pad)

  def initialize(interpreter, padder, prefixer, length: -1, description: '', pad: false)

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

  def get_max_packed_length()
    # add code to get the max packed length
  end

  def pack(iso_component)
    # add code here to return a byte[] after packing this component
  end






end