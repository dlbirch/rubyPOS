require 'rspec'
require 'left_padder'

describe LeftPadder do

  it 'should return an instance' do
    lp = LeftPadder.new()
    expect(lp).to be_truthy
  end

  it 'should pad with non-zero characters' do
    lp = LeftPadder.new("*")
    data = "999"
    expect(lp.pad(data, 10)).to eq("*******999")
  end

  it 'should pad with Zero as char' do
    lp = LeftPadder.new()
    data = "999"
    expect(lp.pad(data, 10)).to eq("0000000999")
  end

  it 'should pad using default Zero padder' do
    lp = LeftPadder.ZERO_PADDER
    data = "999"
    expect(lp.pad(data, 10)).to eq("0000000999")
  end

  it 'should reject attempts to pad strings greater in length than max length' do
    lp = LeftPadder.ZERO_PADDER
    data = "12345678901234567890"
    expect {lp.pad(data, 10)}.to raise_error(IsoError)
  end

  it 'should unpad correctly using default ZERO padder' do
    lp = LeftPadder.ZERO_PADDER
    data = "99999"
    padded_data = lp.pad(data, 20)
    expect(lp.unpad(padded_data)).to eq(data)
  end

  it 'should handle cases where no padding is necessary' do
    lp = LeftPadder.ZERO_PADDER
    expect(lp.pad("1234567890", 10)).to eq("1234567890")
  end

  it 'should handle cases where no unpadding is necessary' do
    lp = LeftPadder.ZERO_PADDER
    not_padded = "1234567890"
    expect(lp.unpad(not_padded)).to eq(not_padded)
  end

end