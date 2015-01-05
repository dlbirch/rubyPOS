require 'rspec'
require 'iso_binary_field'

describe IsoBinaryField do

  it 'should create an IsoField' do
    ibf = IsoBinaryField.new()
    expect(ibf).to be_truthy
    expect(ibf.field_number).to equal(-1)
    expect(ibf.value).to eq([])
  end

  it 'should create an IsoField with a specified field number and array value' do
    byte_array = [20, 21, 22, 23, 24, 25]
    ibf = IsoBinaryField.new(field_number: 28, value: byte_array)
    expect(ibf).to be_truthy
    expect(ibf.field_number).to equal(28)
    expect(ibf.value).to eq(byte_array)
  end

  it 'should create an IsoField with a specified field number and array value using an offset and field length' do
    byte_array = [20, 21, 22, 23, 24, 25, 26, 27, 28, 29]
    ibf = IsoBinaryField.new(field_number: 28, value: byte_array, starting_offset: 3, field_length: 6)
    expect(ibf).to be_truthy
    expect(ibf.field_number).to equal(28)
    expect(ibf.value).to eq([nil, nil, nil, 20, 21, 22, 23, 24, 25])
  end

  it 'should set value appropriately when given a string - should store as bytes.' do
    byte_array = [20, 21, 22, 23, 24, 25, 26, 27, 28, 29]
    ibf = IsoBinaryField.new(field_number: 28)
    test_string = byte_array.pack("c*")
    ibf.value= test_string
    expect(ibf.value).to eq(byte_array)
  end


end