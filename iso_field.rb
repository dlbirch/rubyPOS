require 'iso_error'

class IsoField
  attr_accessor(:serial_version_UID, :field_number=-1, :value)

  def initialize(field_number, value)
    @serial_version_UID = -4053616930139887829
    @field_number = field_number
    @value = value
  end

end