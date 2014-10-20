require 'rspec'
require 'ascii_prefixer'
require 'java'
require './lib/jpos-1.9.9-SNAPSHOT.jar'

describe AsciiPrefixer do

  it 'should decode prefix ascii byte values into the correct integer value' do
    ap = AsciiPrefixer.new(2)
    b = ap.encode_length(99)
    expect(ap.decode_length(b, 0)).to eq(99)
    jpos_prefixer = org.jpos.iso.AsciiPrefixer.new(2)
    expect(ap.decode_length(b, 0)).to eq(jpos_prefixer.decodeLength(b, 0))
  end

  it 'should return number of digits for packed length' do
    ap = AsciiPrefixer.new(2)
    b = ap.encode_length(99)
    jpos_prefixer = org.jpos.iso.AsciiPrefixer.new(2)
    expect(ap.get_packed_length).to eq(jpos_prefixer.getPackedLength())
  end


end