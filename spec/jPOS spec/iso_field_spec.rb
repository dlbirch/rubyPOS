require 'rspec'
require 'iso_field'
require 'java'
require './lib/jpos.jar'
java_import org.jpos.iso.ISOMsg
java_import org.jpos.iso.ISOField

# Modify the jpos java classes to allow access to instance fields
class Java::OrgJposIso::ISOField
  field_accessor :fieldNumber => :field_number
  field_accessor :value => :value
end


describe IsoField do

  it 'should create an IsoField with a field number and a value that matches the jPOS version' do
    iso_field = IsoField.new(field_number: 2, value: "43583222233334444")
    jpos_iso_field = org.jpos.iso.ISOField.new(2, "43583222233334444")
    expect(iso_field.field_number).to eq(jpos_iso_field.field_number)
  end

  it "should create an IsoField without spec'ing a field number that matches the jPOS version" do
    iso_field = IsoField.new(value: "43583222233334444")
    jpos_iso_field = org.jpos.iso.ISOField.new(-1, "43583222233334444")
    expect(iso_field.field_number).to eq(jpos_iso_field.field_number)
  end

  it "should create an IsoField without spec'ing a value that matches the jPOS version" do
    iso_field = IsoField.new(field_number: 2)
    jpos_iso_field = org.jpos.iso.ISOField.new(2)
    expect(iso_field.field_number).to eq(jpos_iso_field.field_number)
  end

  it "should get bytes that match the jPOS version" do
    iso_field = IsoField.new(field_number: 2, value: "43583222233334444")
    jpos_iso_field = org.jpos.iso.ISOField.new(2, "43583222233334444")
    expect(iso_field.get_bytes).to eq(jpos_iso_field.get_bytes)
  end

end