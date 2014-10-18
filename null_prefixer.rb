require 'iso_error'

class NullPrefixer

  def self.INSTANCE
    NullPrefixer.new()
  end

  def encode_length(prefix_value, prefix_bytes)
    # No op
  end

  # Returns -1 meaning there is no length field.
  def decode_length(prefix_bytes, offset)
    return -1
  end

  def getPackedLength()
    return 0
  end

end