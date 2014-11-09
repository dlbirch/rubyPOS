require 'iso'
require 'iso_error'
require 'iso_field'
require 'java'

class IsoMsg
  attr_accessor(:fields, :bitmap, :max_field, :direction, :header, :dirty, :max_field_dirty, :field_number)
  #attr_accessor(:packager, :source_ref)

  def initialize(field_number: -1, mti: nil)
    @fields = java.util.TreeMap.new
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
  # public void set (String fpath, String value)
  # public void set (String fpath, ISOComponent c)
  # public void set (String fpath, byte[] value)
  # public void set (int fldno, byte[] value)
  def set(iso_component: nil, field_number: -1, string_value: '', field_path: '', byte_value: nil)
    puts "iso_component: #{iso_component.inspect}, field_number: #{field_number.to_s}, string_value: #{string_value}, field_path: #{field_path}, byte_value: #{byte_value.inspect}"
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