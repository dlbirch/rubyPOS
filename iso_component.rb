require 'iso'
require 'iso_error'

# Implementation of the 'Component' piece of the GOF Composite pattern.  Here we provide for
# a common interface for all of our iso message content.
class IsoComponent
  attr_accessor(:parent, :field_number)

  def initialize(parent: nil)
    @parent = parent
  end

  # Set a field within this message
  def set(component)
    raise(IsoError, IsoError.tag_the_message("Can't add to Leaf"))
  end

  # Unset a field
  def unset(field_nbr)
    raise(IsoError, IsoError.tag_the_message("Can't remove from Leaf"))
  end

  # Composites and Leafs should be interchangeable.  To do this
  # we use get_composite(). A Composite component returns itself and
  # a Leaf returns nil. The base class ISOComponent provides
  # * Leaf functionality.
  def get_composite()
    return nil
  end

  # Valid on Leafs only.
  # The value returned is used by ISOMsg as a key
  # to this field
  def get_key()
    raise(IsoError, IsoError.tag_the_message("Operation not available in Composite"))
  end

  # Valid on Leafs only.
  def get_value()
    raise(IsoError, IsoError.tag_the_message("Operation not available in Composite"))
  end

  # returns Value as bytes (when possible)
  def get_bytes()
    raise(IsoError, IsoError.tag_the_message("Operation not available in Composite"))
  end

  # a Composite must override this function
  def get_max_field()
    0
  end

  # Dummy behaviour - return 0 elements Hashtable
  def get_children()
    {}
  end

  # Changes this Component field number<br>
  # Use with care, as this method does not change any reference held by a Composite.
  def set_field_number(field_number)
    raise NotImplementedError, "Implement this method in a child class"
  end

  def set_value(value)
    raise NotImplementedError, "Implement this method in a child class"
  end

  def pack(out_stream: nil)
    raise NotImplementedError, "Implement this method in a child class"
  end

  def unpack(byte_array: [], in_stream: nil)
    raise NotImplementedError, "Implement this method in a child class"
  end

  def dump(stream: nil, indent: nil)
    raise NotImplementedError, "Implement this method in a child class"
  end

end