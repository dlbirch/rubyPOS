require 'iso'
require 'iso_error'
require 'iso_field'

# Implementation of the 'Composite' piece of the GOF Composite pattern.  The composite 'is a' component but
# is also a higher-level object that may be built up from sub-components.
class IsoMsg < IsoComponent
  attr_accessor(:fields, :bitmap, :max_field, :direction, :header, :dirty, :max_field_dirty, :field_number)
  #attr_accessor(:packager, :source_ref)

  def initialize(field_number: -1, mti: nil)
    @fields = []
    @bitmap = []
    @max_field = -1
    @dirty = true
    @max_field_dirty = true
    @header = nil
    @direction = 0
    @field_number = field_number
    unless mti.nil?
      set_mti(mti)
    end
  end

  def set_mti(mti)
    unless is_inner?
      set(iso_component: IsoField.new(field_number: 0, value: mti))
    else
      raise(IsoError, IsoError.tag_the_message("Can't set_mti on an inner message."))
    end
  end

  def is_inner?
      @field_number > -1
  end

  # public void set (ISOComponent c)
  # public void set(int fldno, String value)
  # public void set (String fieldPath, String value)
  # public void set (String fieldPath, ISOComponent c)
  # public void set (String fieldPath, byte[] value)
  # public void set (int fldno, byte[] value)
  def set(iso_component: nil, field_number: -1, string_value: '', field_path: '', byte_array: nil)
    unless iso_component.nil?
      i = iso_component.get_key
      @fields[i] = iso_component
      if i > @max_field
        @max_field = i
        @dirty = true
      end
    end
  end


end