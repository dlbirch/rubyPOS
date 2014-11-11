require 'iso'
require 'iso_error'

# Implementation of the 'component' piece of the GOF Composite pattern.  Here we provide for
# a common interface for all of our iso message content.
class IsoComponent
  attr_accessor(:parent)

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


end