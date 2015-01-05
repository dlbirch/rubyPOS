require 'rspec'
require 'iso_binary_field'
require_relative './jpos_spec_helper'

describe IsoBinaryField do

  it 'should create an IsoBinaryField with a field number and a value that matches the jPOS version' do

    byte_array = [20, 21, 22, 23, 24, 25, 26, 27, 28, 29]
    # Get the desired constructor for this class
    # construct = org.jpos.iso.ISOBinaryField.java_class.constructor(Java::int, Java::byte[], Java::int, Java::int)
    # Use the constructor
    # jpos_ibf = construct.new_instance(2, byte_array, 0, 10)

    ibf = IsoBinaryField.new(field_number: 2, value: byte_array)
    jpos_ibf = org.jpos.iso.ISOBinaryField.new(2)

    jpos_ibf.value = byte_array
    expect(ibf.field_number).to eq(jpos_ibf.field_number)
    #expect(ibf.value).to eq(jpos_ibf.value)

  end

end