require 'java'
require './lib/jpos.jar'
java_import org.jpos.iso.ISOMsg
java_import org.jpos.iso.ISOField
java_import org.jpos.iso.ISOBinaryField
java_import org.jpos.iso.header.BaseHeader

module JposSpecHelper

  # Modify the jpos java classes to allow access to instance fields
  class Java::OrgJposIso::ISOMsg
    field_accessor :dirty => :dirty
    field_accessor :maxField => :max_field
    field_accessor :fields => :fields
    field_accessor :maxFieldDirty => :max_field_dirty
  end

  class Java::OrgJposIso::ISOField
    field_accessor :fieldNumber => :field_number
    field_accessor :value => :value
  end

  class Java::OrgJposIso::ISOBinaryField
    field_accessor :fieldNumber => :field_number
    field_accessor :value => :value
  end

  class Java::OrgJposIsoHeader::BaseHeader

  end

end