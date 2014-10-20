require 'rspec'
require 'ascii_prefixer'
require 'java'
require '/Users/dbirch/Documents/jPOS-master/jpos/build/libs/jpos-1.9.9-SNAPSHOT.jar'

describe AsciiPrefixer do

  it 'should return a new instance even when number of digits is not specified' do
    ap = AsciiPrefixer.new()
    expect(ap).to be_truthy
    expect(ap.prefix_nbr_digits).to equal(1)
  end

  it 'should call into jpos jar' do
    jpos_prefixer = org.jpos.iso.AsciiPrefixer.new(2)
  end

  it 'should reject attempts to initialize with a negative number' do
    expect {ap = AsciiPrefixer.new(-1)}.to raise_error(IsoError)
  end

  it 'should reject attempts to initialize with zero' do
    expect {ap = AsciiPrefixer.new(0)}.to raise_error(IsoError)
  end

  it 'should reject attempts to initialize with non-numeric' do
    expect {ap = AsciiPrefixer.new('a')}.to raise_error(IsoError)
  end

  it 'should reject attempts to initialize using an integer greater than 6' do
    expect {ap = AsciiPrefixer.new(7)}.to raise_error(IsoError)
  end

  it 'should initialize using 6 as the number of digits' do
    ap = AsciiPrefixer.new(6)
    expect(ap).to be_truthy
    expect(ap.prefix_nbr_digits).to equal(6)
  end

  it 'should encode a length value with expected number of digits' do
    ap = AsciiPrefixer.new(2)
    b = ap.encode_length(99)
    expected_value = [57, 57 ]
    expect(b).to eq(expected_value)
    expect(b.size).to equal(2)
  end

  it 'should encode a zero padded length value with less than the number of digits' do
    ap = AsciiPrefixer.new(3)
    b = ap.encode_length(99)
    expected_value = [48, 57, 57 ]
    expect(b).to eq(expected_value)
    expect(b.size).to equal(3)
  end

  it 'should reject a length value that exceeds number of digits' do
    expect {ap = AsciiPrefixer.new(2); b = ap.encode_length(999)}.to raise_error(IsoError)
  end

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