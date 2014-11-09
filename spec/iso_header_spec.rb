require 'rspec'
require 'iso_header'

describe IsoHeader do

  it 'should create an IsoHeader with default values' do
    h = IsoHeader.new()
    expect(h).to be_truthy
    expect(h.header).to eq([])
    expect(h.is_ascii_encoded).to eq(false)
  end

  it 'should create an IsoHeader with specified values' do
    h = IsoHeader.new(header: [50, 51, 52, 53], is_ascii_encoded: true)
    expect(h).to be_truthy
    expect(h.header).to eq([50, 51, 52, 53])
    expect(h.is_ascii_encoded).to eq(true)
  end

  it 'should correctly handle pack, unpack and get_length requests' do
    h = IsoHeader.new(header: [50, 51, 52, 53], is_ascii_encoded: true)
    expect(h.pack).to eq([50, 51, 52, 53])
    expect(h.unpack([49, 50, 51, 52])).to eq(4)
    expect(h.pack).to eq([49, 50, 51, 52])
    expect(h.get_length).to eq(4)
  end


end