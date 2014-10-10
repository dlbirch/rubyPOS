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

  it 'should pad using default space padder' do
    rp = RightPadder.SPACE_PADDER
    data = "PAD_ME!"
    expect(rp.pad(data, 10)).to eq("PAD_ME!   ")
  end

  it 'should unpad correctly using default space padder' do
    rp = RightPadder.SPACE_PADDER
    data = "PAD_ME!"
    padded_data = rp.pad(data, 10)
    expect(rp.unpad(padded_data)).to eq(data)
  end

end