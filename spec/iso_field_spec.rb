require 'rspec'
require 'iso_field'

describe IsoField do

  it 'should create an IsoField' do
    field = IsoField.new()
    expect(field).to be_truthy
    expect(field.field_number).to equal(-1)
    expect(field.value).to eq(nil)
  end

  before(:each) do
    @field = IsoField.new(field_number: 2, value: "4356222244448888")
  end

  it 'should create an IsoField with both field number and value attributes' do
    expect(@field).to be_truthy
    expect(@field.field_number).to equal(2)
    expect(@field.value).to eq("4356222244448888")
  end

  it 'Should prevent the packing of a leaf value' do
    expect{@field.pack()}.to raise_error(IsoError)
  end

  it 'Should prevent the unpacking of a leaf value' do
    expect{@field.unpack([])}.to raise_error(IsoError)
    expect{@field.unpack(byte_array:[], in_stream: nil)}.to raise_error(IsoError)
  end

  it 'Should return the field number on a get_key call' do
    expect(@field.get_key()).to eq(2)
  end

  it 'Should return a byte array for value held' do
    byte_array = @field.get_bytes()
    expect(byte_array.size).to eq(16)
    expect(byte_array).to eq([52, 51, 53, 54, 50, 50, 50, 50, 52, 52, 52, 52, 56, 56, 56, 56])
  end

  it 'Should dump the field number and value of the field' do
    #puts "Dumping an IsoField ..."
    @field.dump(nil, "  ")
  end

end