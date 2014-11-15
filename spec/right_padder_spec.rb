require 'rspec'
require 'right_padder'

describe RightPadder do

  it 'should return an instance' do
    rp = RightPadder.new()
    expect(rp).to be_truthy
  end

  it 'should pad with non-space characters' do
    rp = RightPadder.new("*")
    data = "PAD_ME!"
    expect(rp.pad(data, 10)).to eq("PAD_ME!***")
  end

  before(:each) do
    @rp = RightPadder.SPACE_PADDER
  end

  it 'should pad using default space padder' do
    data = "PAD_ME!"
    expect(@rp.pad(data, 10)).to eq("PAD_ME!   ")
  end

  it 'should unpad correctly using default space padder' do
    data = "PAD_ME!"
    padded_data = @rp.pad(data, 10)
    expect(@rp.unpad(padded_data)).to eq(data)
  end

  it 'should reject attempts to pad strings greater in length than max length' do
    data = "12345678901234567890"
    expect {@rp.pad(data, 10)}.to raise_error(IsoError)
  end

  it 'should handle cases where no padding is necessary' do
    expect(@rp.pad("1234567890", 10)).to eq("1234567890")
  end

  it 'should handle cases where no unpadding is necessary' do
    padded_data = "1234567890"
    expect(@rp.unpad(padded_data)).to eq(padded_data)
  end

end