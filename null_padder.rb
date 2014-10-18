require 'iso_error'

class NullPadder

  # The only instance you need
  def self.INSTANCE
    NullPadder.new()
  end

  def pad(data, maxLength)
      return data
  end

  def unpad(paddedData)
      return paddedData
  end

end