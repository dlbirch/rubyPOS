require 'rspec'
require 'iso_msg'
require 'java'
require './lib/jpos.jar'
java_import org.jpos.iso.ISOMsg
java_import org.jpos.iso.ISOField

# Modify the jpos java classes to allow access to instance fields
class ISOMsg
  field_accessor :dirty => :dirty
  field_accessor :maxField => :max_field
  field_accessor :fields => :fields
  field_accessor :maxFieldDirty => :max_field_dirty
end

class Java::OrgJposIso::ISOField
  field_accessor :value => :value
end


describe IsoMsg do

  it 'should create an IsoMsg that matches a jpos ISOMsg' do
    iso_msg = IsoMsg.new()
    jpos_iso_msg = ISOMsg.new()
    expect(iso_msg.direction).to eq(jpos_iso_msg.get_direction())
    expect(iso_msg.max_field).to eq(jpos_iso_msg.max_field)
    expect(iso_msg.field_number).to eq(jpos_iso_msg.field_number)
    expect(iso_msg.dirty).to eq(jpos_iso_msg.dirty)
    expect(iso_msg.max_field_dirty).to eq(jpos_iso_msg.max_field_dirty)
    expect(iso_msg.fields.size).to eq(jpos_iso_msg.fields.size)
  end

  it 'should create a nested ISOMsg' do
    iso_msg = IsoMsg.new()
    jpos_iso_msg = org.jpos.iso.ISOMsg.new()
    jpos_iso_msg2 = org.jpos.iso.ISOMsg.new(2)
    expect(iso_msg.field_number).to eq(jpos_iso_msg.field_number)
    expect(jpos_iso_msg2.field_number).to eq(2)
  end

  it 'should create an ISOMsg with a given mti' do
    iso_msg = IsoMsg.new(mti: "0100")
    jpos_iso_msg = org.jpos.iso.ISOMsg.new("0100")
    temp_value = ''
    jpos_iso_msg.fields.each do |k, v|
      temp_value = v.value
      break
    end
    expect(iso_msg.fields[0].value).to eq(temp_value)
  end


end