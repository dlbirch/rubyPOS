require 'iso_error'

class IsoHeader
  attr_accessor(:header, :is_ascii_encoded)

  def initialize(header: [], is_ascii_encoded: false)
    @header = header
    @is_ascii_encoded = is_ascii_encoded
  end

  def pack()
    @header
  end

  def unpack(header)
    @header = header
    @header.size
  end

  def get_length()
    @header.size
  end

end