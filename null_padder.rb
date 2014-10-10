require 'iso_error'

class NullPadder

  # The only instance you need
  INSTANCE = NullPadder.new()

  def pad(data, maxLength)
      return data
  end

  def unpad(paddedData)
      return paddedData
  end

end