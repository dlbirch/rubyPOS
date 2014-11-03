require 'rspec'
require 'iso_field'
require_relative './jpos_spec_helper'

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
    puts "iso_field.get_bytes is: #{iso_field.get_bytes}"
    jba = []
    jba = jpos_iso_field.get_bytes
    puts "jpos_iso_field.get_bytes is: #{jba.to_s}"
    #expect(iso_field.get_bytes).to eq(jpos_iso_field.get_bytes)
  end

end